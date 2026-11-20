#!/usr/bin/env python3
"""Copies the Jujutsu Awakening behaviour + resource packs into the mod's resources.

  python3 tools/import_bedrock.py <BP folder> <RP folder>

- The behaviour pack and the resource pack's JSON go in as they are, under bedrock/bp and bedrock/rp (read by the runtime).
- Textures and sounds go under assets/jjka with "safe" names (Java resource names can only be lowercase a-z 0-9 _ . - /);
  the runtime makes the same safe name from a Bedrock path with Bedrock.safe().
- assets/jjka/sounds.json is built from the RP's sound_definitions.json. Sounds that point at vanilla Bedrock files the pack
  doesn't include are pointed at Java's own copy of the same file.
"""
import json, os, re, shutil, sys

def safe(p):
    p = p.replace('\\', '/').lower()
    return re.sub(r'[^a-z0-9/._-]', '_', p)

def strip_comments(text):
    out, i, n, s = [], 0, len(text), None
    while i < n:
        c = text[i]
        if s:
            out.append(c)
            if c == '\\': out.append(text[i + 1]); i += 2; continue
            if c == s: s = None
        elif c == '"': s = c; out.append(c)
        elif text.startswith('//', i):
            while i < n and text[i] != '\n': i += 1
            continue
        elif text.startswith('/*', i):
            j = text.find('*/', i + 2); i = n if j < 0 else j + 2; continue
        else: out.append(c)
        i += 1
    return ''.join(out)

def load(path):
    with open(path, encoding='utf-8-sig') as f: return json.loads(strip_comments(f.read()))

GLYPH_MAX = 1024

def glyphs(src, out):
    """font/glyph_XX.png is a 16x16 sheet of characters U+XX00..U+XXFF that titles use to draw pictures (impact frames,
    overlays). Each non-empty cell becomes its own texture, textures/glyph/xxyy.png, at most GLYPH_MAX across."""
    from PIL import Image
    Image.MAX_IMAGE_PIXELS = None
    m = re.match(r'glyph_([0-9A-Fa-f]{2})\.png$', os.path.basename(src))
    if not m: return
    page = m.group(1).lower()
    im = Image.open(src).convert('RGBA')
    cell = im.width / 16.0
    os.makedirs(out, exist_ok=True)
    for row in range(16):
        for col in range(16):
            box = (round(col * cell), round(row * cell), round((col + 1) * cell), round((row + 1) * cell))
            g = im.crop(box)
            if g.getbbox() is None: continue
            if g.width > GLYPH_MAX: g = g.resize((GLYPH_MAX, GLYPH_MAX), Image.LANCZOS)
            g.save(os.path.join(out, '%s%02x.png' % (page, row * 16 + col)), optimize=True)

def main(bp, rp, out='src/main/resources'):
    res_bp, res_rp = os.path.join(out, 'bedrock/bp'), os.path.join(out, 'bedrock/rp')
    assets = os.path.join(out, 'assets/jjka')
    for d in (res_bp, res_rp, os.path.join(assets, 'textures'), os.path.join(assets, 'sounds')):
        shutil.rmtree(d, ignore_errors=True)
    files = []
    for root, _, names in os.walk(bp):
        for n in names:
            src = os.path.join(root, n); rel = os.path.relpath(src, bp)
            if n.lower() == 'pack_icon.png': continue
            dst = os.path.join(res_bp, rel); os.makedirs(os.path.dirname(dst), exist_ok=True); shutil.copy2(src, dst)
            files.append('bp/' + rel.replace('\\', '/'))
    seen = {}
    for root, _, names in os.walk(rp):
        for n in names:
            src = os.path.join(root, n); rel = os.path.relpath(src, rp).replace('\\', '/')
            low = rel.lower()
            if low.endswith('.mp3') or low.endswith('.fsb') or low == 'pack_icon.png': continue
            if low.startswith('font/'):
                glyphs(src, os.path.join(assets, 'textures/glyph')); continue
            if low.startswith('textures/') or low.startswith('sounds/') and not low.endswith('.json'):
                if low.endswith('.fsb') or low.endswith('.mp3'): continue  # (Java can't play these)
                key = safe(rel)
                if key in seen and seen[key] != rel: print('name clash:', rel, seen[key])
                seen[key] = rel
                dst = os.path.join(assets, key)
            else:
                dst = os.path.join(res_rp, rel)
                files.append('rp/' + rel)
            os.makedirs(os.path.dirname(dst), exist_ok=True); shutil.copy2(src, dst)
    # an index of every BP/RP file, so the runtime can list folders inside the jar
    with open(os.path.join(out, 'bedrock/index.txt'), 'w') as f: f.write('\n'.join(sorted(files)) + '\n')

    # sounds.json
    defs = load(os.path.join(rp, 'sounds/sound_definitions.json'))['sound_definitions']
    have = {os.path.splitext(k)[0] for k in seen if k.startswith('sounds/')}
    java = {}
    for name, d in defs.items():
        entries = []
        for s in d.get('sounds', []):
            if isinstance(s, str): s = {'name': s}
            p = s['name'].replace('\\', '/')
            key = safe(p)
            e = {}
            if key in have: e['name'] = 'jjka:' + key[len('sounds/'):]
            else: e['name'] = 'minecraft:' + p.lower()[len('sounds/'):] if p.lower().startswith('sounds/') else 'minecraft:' + p.lower()
            if 'volume' in s: e['volume'] = s['volume']
            if 'pitch' in s: e['pitch'] = s['pitch']
            if 'weight' in s: e['weight'] = s['weight']
            if s.get('stream'): e['stream'] = True
            if 'min_distance' in s and s['min_distance'] >= 64: e['attenuation_distance'] = int(min(s['min_distance'], 512))
            entries.append(e)
        if entries: java[safe(name)] = {'sounds': entries}
    with open(os.path.join(assets, 'sounds.json'), 'w') as f: json.dump(java, f, indent=1)
    print(len(files), 'pack files,', len(seen), 'textures/sounds,', len(java), 'sound events')

if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2])
