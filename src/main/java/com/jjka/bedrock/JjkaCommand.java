package com.jjka.bedrock;

import com.mojang.brigadier.CommandDispatcher;
import com.mojang.brigadier.arguments.IntegerArgumentType;
import com.mojang.brigadier.arguments.StringArgumentType;

import net.minecraft.ChatFormatting;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.network.chat.ClickEvent;
import net.minecraft.network.chat.Component;
import net.minecraft.network.chat.MutableComponent;
import net.minecraft.network.chat.Style;
import net.minecraft.server.level.ServerPlayer;
import net.minecraftforge.event.RegisterCommandsEvent;
import net.minecraftforge.eventbus.api.SubscribeEvent;

/**
 * /jjka: run a Bedrock command or function as yourself (for testing), and the add-on's settings menu (the ds:settings
 * item's form on Bedrock, here a clickable list in chat).
 */
public final class JjkaCommand {
	private JjkaCommand() {}

	static final String[][] SETTINGS = {
		{ "Impact frames (Fixes Crashes)", "setting_impactframes" },
		{ "Block Destruction/Griefing", "setting_griefing" },
		{ "Toggle Custom Mob Event Spawning", "setting_mobevents" },
		{ "Toggle Cooldowns", "setting_nocds" },
		{ "Toggle Menu Screen", "setting_menu" },
		{ "Toggle Mission Cooldowns", "setting_nomissioncds" },
		{ "Only allow one Sukuna Vessel", "setting_only_one_sukuna" },
	};

	@SubscribeEvent
	public static void register(RegisterCommandsEvent e) {
		CommandDispatcher<CommandSourceStack> d = e.getDispatcher();
		d.register(net.minecraft.commands.Commands.literal("jjka")
				.then(net.minecraft.commands.Commands.literal("run").requires(s -> s.hasPermission(2))
						.then(net.minecraft.commands.Commands.argument("command", StringArgumentType.greedyString()).executes(c -> {
							ServerPlayer p = c.getSource().getPlayerOrException();
							Scores.get(p.getServer());
							int n = Commands.runAs(p, StringArgumentType.getString(c, "command"));
							c.getSource().sendSuccess(() -> Component.literal("Ran (" + n + ")"), false);
							return 1;
						})))
				.then(net.minecraft.commands.Commands.literal("function").requires(s -> s.hasPermission(2))
						.then(net.minecraft.commands.Commands.argument("name", StringArgumentType.greedyString()).executes(c -> {
							ServerPlayer p = c.getSource().getPlayerOrException();
							Scores.get(p.getServer());
							Functions.run(StringArgumentType.getString(c, "name"), Commands.Ctx.of(p));
							return 1;
						})))
				.then(net.minecraft.commands.Commands.literal("settings").executes(c -> { menu(c.getSource().getPlayerOrException()); return 1; }))
				.then(net.minecraft.commands.Commands.literal("setting")
						.then(net.minecraft.commands.Commands.argument("n", IntegerArgumentType.integer(0, SETTINGS.length - 1)).executes(c -> {
							ServerPlayer p = c.getSource().getPlayerOrException();
							Scores.get(p.getServer());
							Functions.run(SETTINGS[IntegerArgumentType.getInteger(c, "n")][1], Commands.Ctx.of(p));
							return 1;
						}))));
	}

	public static void menu(ServerPlayer p) {
		p.sendSystemMessage(Component.literal("Settings").withStyle(ChatFormatting.GOLD, ChatFormatting.BOLD));
		for (int i = 0; i < SETTINGS.length; i++) {
			MutableComponent b = Component.literal(" [" + SETTINGS[i][0] + "]").setStyle(Style.EMPTY.withColor(ChatFormatting.AQUA)
					.withClickEvent(new ClickEvent(ClickEvent.Action.RUN_COMMAND, "/jjka setting " + i)));
			p.sendSystemMessage(b);
		}
	}
}
