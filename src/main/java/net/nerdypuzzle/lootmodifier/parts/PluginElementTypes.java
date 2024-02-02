package net.nerdypuzzle.lootmodifier.parts;

import net.mcreator.element.ModElementType;
import net.nerdypuzzle.lootmodifier.elements.LootModifier;
import net.nerdypuzzle.lootmodifier.elements.LootModifierGUI;

import static net.mcreator.element.ModElementTypeLoader.register;

public class PluginElementTypes {
    public static ModElementType<?> LOOTMODIFIER;

    public static void load() {

        LOOTMODIFIER = register(
                new ModElementType<>("lootmodifier", (Character) 'L', LootModifierGUI::new, LootModifier.class)
        );

    }

}
