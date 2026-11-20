package com.jjka.bedrock;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Bedrock's expression language. Expressions are compiled once (cached by their text) and evaluated against a Scope that
 * answers queries and holds variables. Values are doubles; strings are kept as a separate value kind so comparisons like
 * query.get_name == 'Lapse' work. Statements (a = b; c = d; return e) and loop/for_each are supported.
 */
public final class Molang {
	private Molang() {}

	/** What an expression can see */
	public interface Scope {
		/** query.x(args) - return null if unknown (it evaluates to 0) */
		Object query(String name, Object[] args);

		/** variable.x / temp.x / context.x */
		Map<String, Object> vars(char kind);

		/** anything else with a dot (geometry.x, texture.x, material.x, array.x) */
		default Object other(String name) { return null; }
	}

	/** A Scope with nothing but its own variables */
	public static class Simple implements Scope {
		public final Map<String, Object> variables = new HashMap<>(), temps = new HashMap<>(), context = new HashMap<>();
		@Override public Object query(String name, Object[] args) { return null; }
		@Override public Map<String, Object> vars(char kind) { return kind == 'v' ? variables : kind == 't' ? temps : context; }
	}

	public static final Scope EMPTY = new Simple();

	// ------------------------------------------------------------------ values
	public static double num(Object o) {
		if (o instanceof Double d) return d;
		if (o instanceof Number n) return n.doubleValue();
		if (o instanceof Boolean b) return b ? 1 : 0;
		return 0;
	}

	public static boolean truth(Object o) { return o instanceof String s ? !s.isEmpty() : num(o) != 0; }

	private static boolean same(Object a, Object b) {
		if (a instanceof String || b instanceof String) return String.valueOf(a).equalsIgnoreCase(String.valueOf(b));
		return num(a) == num(b);
	}

	// ------------------------------------------------------------------ compiled form
	public interface Expr { Object eval(Scope s); }

	private static final Map<String, Expr> CACHE = new ConcurrentHashMap<>();
	private static final Expr ZERO = s -> 0.0;

	public static Expr compile(String src) {
		if (src == null) return ZERO;
		Expr e = CACHE.get(src);
		if (e != null) return e;
		try {
			e = new Parser(src).program();
		} catch (RuntimeException ex) {
			Bedrock.warnOnce("molang", "Couldn't read Molang '" + src + "': " + ex.getMessage());
			e = ZERO;
		}
		CACHE.put(src, e);
		return e;
	}

	/** A JSON value that may be a number, a bool or an expression string */
	public static Expr of(com.google.gson.JsonElement j) {
		if (j == null || j.isJsonNull()) return ZERO;
		if (j.isJsonPrimitive()) {
			var p = j.getAsJsonPrimitive();
			if (p.isNumber()) { double v = p.getAsDouble(); return s -> v; }
			if (p.isBoolean()) { double v = p.getAsBoolean() ? 1 : 0; return s -> v; }
			return compile(p.getAsString());
		}
		return ZERO;
	}

	public static double eval(String src, Scope s) { return num(compile(src).eval(s)); }

	public static double eval(com.google.gson.JsonElement j, Scope s) { return num(of(j).eval(s)); }

	// ------------------------------------------------------------------ parser
	private static final Object BREAK = new Object(), CONTINUE = new Object();

	private static final class Return extends RuntimeException {
		final Object value;
		Return(Object value) { super(null, null, false, false); this.value = value; }
	}

	private static final class Flow extends RuntimeException {
		final Object kind;
		Flow(Object kind) { super(null, null, false, false); this.kind = kind; }
	}

	private static final class Parser {
		final String src;
		int i;

		Parser(String src) { this.src = src; }

		void ws() { while (i < src.length() && Character.isWhitespace(src.charAt(i))) i++; }

		boolean eat(String tok) {
			ws();
			if (src.startsWith(tok, i)) {
				// don't split "==" into "=" etc.
				if (tok.equals("=") && src.startsWith("==", i)) return false;
				if (tok.equals("!") && src.startsWith("!=", i)) return false;
				if (tok.equals("<") && src.startsWith("<=", i)) return false;
				if (tok.equals(">") && src.startsWith(">=", i)) return false;
				if (tok.equals("?") && src.startsWith("??", i)) return false;
				if (tok.equals("-") && src.startsWith("->", i)) return false;
				i += tok.length();
				return true;
			}
			return false;
		}

		boolean done() { ws(); return i >= src.length(); }

		Expr program() {
			List<Expr> stmts = new ArrayList<>();
			boolean complex = false;
			while (!done()) {
				if (peek('}')) break;
				stmts.add(statement());
				if (eat(";")) complex = true;
				else break;
			}
			// (Bedrock ignores junk after a complete expression, and the pack has a few typos like that)
			if (stmts.isEmpty()) return ZERO;
			if (!complex && stmts.size() == 1) return stmts.get(0);
			Expr[] arr = stmts.toArray(new Expr[0]);
			return s -> {
				try {
					for (Expr e : arr) e.eval(s);
				} catch (Return r) { return r.value; }
				return 0.0;
			};
		}

		boolean peek(char c) { ws(); return i < src.length() && src.charAt(i) == c; }

		Expr block() {
			if (!eat("{")) return expr();
			List<Expr> stmts = new ArrayList<>();
			while (!eat("}")) {
				stmts.add(statement());
				eat(";");
				if (i >= src.length()) break;
			}
			Expr[] arr = stmts.toArray(new Expr[0]);
			return s -> { for (Expr e : arr) e.eval(s); return 0.0; };
		}

		Expr statement() {
			ws();
			int save = i;
			String word = ident();
			if (word != null) {
				String w = word.toLowerCase(Locale.ROOT);
				if (w.equals("return")) {
					Expr e = expr();
					return s -> { throw new Return(e.eval(s)); };
				}
				if (w.equals("break")) return s -> { throw new Flow(BREAK); };
				if (w.equals("continue")) return s -> { throw new Flow(CONTINUE); };
				if (w.equals("loop") && eat("(")) {
					Expr n = expr();
					eat(",");
					Expr body = block();
					eat(")");
					return s -> {
						int count = (int) Math.min(1024, num(n.eval(s)));
						for (int k = 0; k < count; k++) {
							try { body.eval(s); } catch (Flow f) { if (f.kind == BREAK) break; }
						}
						return 0.0;
					};
				}
				if (w.equals("for_each") && eat("(")) {
					String var = ident();
					eat(",");
					Expr coll = expr();
					eat(",");
					Expr body = block();
					eat(")");
					return s -> {
						Object c = coll.eval(s);
						if (c instanceof List<?> list) for (Object o : list) {
							assign(s, var, o);
							try { body.eval(s); } catch (Flow f) { if (f.kind == BREAK) break; }
						}
						return 0.0;
					};
				}
				ws();
				if (i < src.length() && src.charAt(i) == '=' && !src.startsWith("==", i)) {
					i++;
					Expr v = expr();
					String target = word;
					return s -> { Object o = v.eval(s); assign(s, target, o); return o; };
				}
			}
			i = save;
			return expr();
		}

		String ident() {
			ws();
			int start = i;
			while (i < src.length()) {
				char c = src.charAt(i);
				if (Character.isLetterOrDigit(c) || c == '_' || c == '.' && i > start) i++;
				else break;
			}
			if (i == start || Character.isDigit(src.charAt(start))) { i = start; return null; }
			return src.substring(start, i);
		}

		Expr expr() { return ternary(); }

		Expr ternary() {
			Expr c = coalesce();
			if (eat("?")) {
				Expr a = ternary();
				if (eat(":")) {
					Expr b = ternary();
					return s -> truth(c.eval(s)) ? a.eval(s) : b.eval(s);
				}
				return s -> truth(c.eval(s)) ? a.eval(s) : 0.0;
			}
			return c;
		}

		Expr coalesce() {
			Expr a = or();
			while (eat("??")) {
				Expr l = a, r = or();
				a = s -> { Object v = l.eval(s); return v == null ? r.eval(s) : v; };
			}
			return a;
		}

		Expr or() {
			Expr a = and();
			while (eat("||")) { Expr l = a, r = and(); a = s -> truth(l.eval(s)) || truth(r.eval(s)) ? 1.0 : 0.0; }
			return a;
		}

		Expr and() {
			Expr a = equality();
			while (eat("&&")) { Expr l = a, r = equality(); a = s -> truth(l.eval(s)) && truth(r.eval(s)) ? 1.0 : 0.0; }
			return a;
		}

		Expr equality() {
			Expr a = compare();
			while (true) {
				Expr l = a;
				if (eat("==")) { Expr r = compare(); a = s -> same(l.eval(s), r.eval(s)) ? 1.0 : 0.0; }
				else if (eat("!=")) { Expr r = compare(); a = s -> same(l.eval(s), r.eval(s)) ? 0.0 : 1.0; }
				else return a;
			}
		}

		Expr compare() {
			Expr a = additive();
			while (true) {
				Expr l = a;
				if (eat("<=")) { Expr r = additive(); a = s -> num(l.eval(s)) <= num(r.eval(s)) ? 1.0 : 0.0; }
				else if (eat(">=")) { Expr r = additive(); a = s -> num(l.eval(s)) >= num(r.eval(s)) ? 1.0 : 0.0; }
				else if (eat("<")) { Expr r = additive(); a = s -> num(l.eval(s)) < num(r.eval(s)) ? 1.0 : 0.0; }
				else if (eat(">")) { Expr r = additive(); a = s -> num(l.eval(s)) > num(r.eval(s)) ? 1.0 : 0.0; }
				else return a;
			}
		}

		Expr additive() {
			Expr a = term();
			while (true) {
				Expr l = a;
				if (eat("+")) { Expr r = term(); a = s -> num(l.eval(s)) + num(r.eval(s)); }
				else if (eat("-")) { Expr r = term(); a = s -> num(l.eval(s)) - num(r.eval(s)); }
				else return a;
			}
		}

		Expr term() {
			Expr a = unary();
			while (true) {
				Expr l = a;
				if (eat("*")) { Expr r = unary(); a = s -> num(l.eval(s)) * num(r.eval(s)); }
				else if (eat("/")) { Expr r = unary(); a = s -> { double d = num(r.eval(s)); return d == 0 ? 0.0 : num(l.eval(s)) / d; }; }
				else if (eat("%")) { Expr r = unary(); a = s -> { double d = num(r.eval(s)); return d == 0 ? 0.0 : num(l.eval(s)) % d; }; }
				else return a;
			}
		}

		Expr unary() {
			if (eat("-")) { Expr e = unary(); return s -> -num(e.eval(s)); }
			if (eat("+")) return unary();
			if (eat("!")) { Expr e = unary(); return s -> truth(e.eval(s)) ? 0.0 : 1.0; }
			return postfix(primary());
		}

		Expr postfix(Expr e) {
			while (eat("[")) {
				Expr idx = expr();
				eat("]");
				Expr base = e;
				e = s -> {
					Object o = base.eval(s);
					if (o instanceof List<?> l && !l.isEmpty()) {
						int k = (int) num(idx.eval(s));
						return l.get(Math.max(0, Math.min(l.size() - 1, k)));
					}
					return o;
				};
			}
			if (eat("->")) {
				// arrow access: v.target->q.health; evaluated in the other entity's scope
				Expr base = e;
				Expr rhs = primary();
				e = s -> {
					Object o = base.eval(s);
					return o instanceof Scope other ? rhs.eval(other) : 0.0;
				};
			}
			return e;
		}

		Expr primary() {
			ws();
			if (i >= src.length()) return ZERO;
			char c = src.charAt(i);
			if (c == '(') {
				i++;
				Expr e = expr();
				eat(")");
				return e;
			}
			if (c == '{') return block();
			if (c == '\'' ) {
				int end = src.indexOf('\'', i + 1);
				if (end < 0) end = src.length();
				String str = src.substring(i + 1, end);
				i = Math.min(src.length(), end + 1);
				return s -> str;
			}
			if (Character.isDigit(c) || c == '.') {
				int start = i;
				while (i < src.length() && (Character.isDigit(src.charAt(i)) || src.charAt(i) == '.')) i++;
				if (i < src.length() && (src.charAt(i) == 'f' || src.charAt(i) == 'F')) i++;
				double v = Double.parseDouble(src.substring(start, i).replace("f", "").replace("F", ""));
				return s -> v;
			}
			String name = ident();
			if (name == null) throw new IllegalStateException("unexpected '" + c + "'");
			String low = name.toLowerCase(Locale.ROOT);
			if (low.equals("true")) return s -> 1.0;
			if (low.equals("false")) return s -> 0.0;
			if (low.equals("this")) return s -> 0.0;
			List<Expr> args = new ArrayList<>();
			if (eat("(")) {
				if (!eat(")")) {
					do args.add(expr()); while (eat(","));
					eat(")");
				}
			}
			return access(low, args.toArray(new Expr[0]));
		}

		Expr access(String name, Expr[] args) {
			int dot = name.indexOf('.');
			String ns = dot < 0 ? "" : name.substring(0, dot), rest = dot < 0 ? name : name.substring(dot + 1);
			switch (ns) {
				case "q", "query" -> {
					return s -> {
						Object[] a = new Object[args.length];
						for (int k = 0; k < a.length; k++) a[k] = args[k].eval(s);
						Object r = s.query(rest, a);
						return r == null ? 0.0 : r instanceof Boolean b ? (b ? 1.0 : 0.0) : r;
					};
				}
				case "v", "variable", "t", "temp", "c", "context" -> {
					char kind = ns.charAt(0);
					return s -> {
						Object o = s.vars(kind).get(rest);
						return o == null ? 0.0 : o;
					};
				}
				case "math" -> { return math(rest, args); }
				default -> {
					return s -> {
						Object o = s.other(name);
						return o == null ? 0.0 : o;
					};
				}
			}
		}
	}

	static void assign(Scope s, String target, Object value) {
		String low = target.toLowerCase(Locale.ROOT);
		int dot = low.indexOf('.');
		if (dot < 0) return;
		String ns = low.substring(0, dot), rest = low.substring(dot + 1);
		char kind = switch (ns) { case "v", "variable" -> 'v'; case "t", "temp" -> 't'; case "c", "context" -> 'c'; default -> 0; };
		if (kind != 0) s.vars(kind).put(rest, value instanceof Boolean b ? (b ? 1.0 : 0.0) : value);
	}

	private static final java.util.Random RNG = new java.util.Random();

	private static Expr math(String fn, Expr[] a) {
		java.util.function.Function<Scope, double[]> args = s -> {
			double[] v = new double[a.length];
			for (int k = 0; k < v.length; k++) v[k] = num(a[k].eval(s));
			return v;
		};
		return switch (fn) {
			case "pi" -> s -> Math.PI;
			case "abs" -> s -> Math.abs(args.apply(s)[0]);
			case "sin" -> s -> Math.sin(Math.toRadians(args.apply(s)[0]));
			case "cos" -> s -> Math.cos(Math.toRadians(args.apply(s)[0]));
			case "asin" -> s -> Math.toDegrees(Math.asin(args.apply(s)[0]));
			case "acos" -> s -> Math.toDegrees(Math.acos(args.apply(s)[0]));
			case "atan" -> s -> Math.toDegrees(Math.atan(args.apply(s)[0]));
			case "atan2" -> s -> { double[] v = args.apply(s); return Math.toDegrees(Math.atan2(v[0], v[1])); };
			case "sqrt" -> s -> Math.sqrt(Math.max(0, args.apply(s)[0]));
			case "exp" -> s -> Math.exp(args.apply(s)[0]);
			case "ln" -> s -> Math.log(args.apply(s)[0]);
			case "pow" -> s -> { double[] v = args.apply(s); return Math.pow(v[0], v[1]); };
			case "floor" -> s -> Math.floor(args.apply(s)[0]);
			case "ceil" -> s -> Math.ceil(args.apply(s)[0]);
			case "round" -> s -> (double) Math.round(args.apply(s)[0]);
			case "trunc" -> s -> { double v = args.apply(s)[0]; return v < 0 ? Math.ceil(v) : Math.floor(v); };
			case "mod" -> s -> { double[] v = args.apply(s); return v[1] == 0 ? 0 : v[0] % v[1]; };
			case "min" -> s -> { double[] v = args.apply(s); return Math.min(v[0], v[1]); };
			case "max" -> s -> { double[] v = args.apply(s); return Math.max(v[0], v[1]); };
			case "clamp" -> s -> { double[] v = args.apply(s); return Math.max(v[1], Math.min(v[2], v[0])); };
			case "lerp" -> s -> { double[] v = args.apply(s); return v[0] + (v[1] - v[0]) * v[2]; };
			case "lerprotate" -> s -> {
				double[] v = args.apply(s);
				double d = ((v[1] - v[0]) % 360 + 540) % 360 - 180;
				return v[0] + d * v[2];
			};
			case "hermite_blend" -> s -> { double t = args.apply(s)[0]; return 3 * t * t - 2 * t * t * t; };
			case "random" -> s -> { double[] v = args.apply(s); return v[0] + RNG.nextDouble() * (v[1] - v[0]); };
			case "random_integer" -> s -> { double[] v = args.apply(s); return (double) ((long) v[0] + RNG.nextInt((int) Math.max(1, v[1] - v[0] + 1))); };
			case "die_roll" -> s -> {
				double[] v = args.apply(s);
				double t = 0;
				for (int k = 0; k < (int) v[0]; k++) t += v[1] + RNG.nextDouble() * (v[2] - v[1]);
				return t;
			};
			case "die_roll_integer" -> s -> {
				double[] v = args.apply(s);
				double t = 0;
				for (int k = 0; k < (int) v[0]; k++) t += (long) v[1] + RNG.nextInt((int) Math.max(1, v[2] - v[1] + 1));
				return t;
			};
			case "min_angle" -> s -> { double v = args.apply(s)[0]; v = ((v % 360) + 540) % 360 - 180; return v; };
			case "sign" -> s -> Math.signum(args.apply(s)[0]);
			case "copy_sign" -> s -> { double[] v = args.apply(s); return Math.copySign(v[0], v[1]); };
			default -> s -> 0.0;
		};
	}
}
