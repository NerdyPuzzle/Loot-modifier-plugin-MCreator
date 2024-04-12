package ${package}.init;

import com.google.common.base.Suppliers;

@Mod.EventBusSubscriber(modid = ${JavaModName}.MODID, bus = Mod.EventBusSubscriber.Bus.MOD)
public class ${JavaModName}LootModifier {

    public static class ${JavaModName}LootTableModifier extends LootModifier {

        public static final Supplier<Codec<${JavaModName}LootTableModifier>> CODEC = Suppliers.memoize(
                () -> RecordCodecBuilder.create(instance -> codecStart(instance)
                        .and(ResourceLocation.CODEC.fieldOf("lootTable").forGetter(m -> m.lootTable))
                        .apply(instance, ${JavaModName}LootTableModifier::new)
                )
        );

        private final ResourceLocation lootTable;

        public ${JavaModName}LootTableModifier(LootItemCondition[] conditions, ResourceLocation lootTable) {
            super(conditions);
            this.lootTable = lootTable;
        }

        @Override
        protected ObjectArrayList<ItemStack> doApply(ObjectArrayList<ItemStack> generatedLoot, LootContext context) {
            context.getResolver().getLootTable(lootTable).getRandomItemsRaw(context, generatedLoot::add);
            return generatedLoot;
        }

        @Override
        public Codec<? extends IGlobalLootModifier> codec() {
            return CODEC.get();
        }
    }

    public static final DeferredRegister<Codec<? extends IGlobalLootModifier>> LOOT_MODIFIER = DeferredRegister.create(NeoForgeRegistries.Keys.GLOBAL_LOOT_MODIFIER_SERIALIZERS, "${modid}");

	@SubscribeEvent
	public static void register(FMLConstructModEvent event) {
		IEventBus bus = FMLJavaModLoadingContext.get().getModEventBus();
		event.enqueueWork(() -> {
		    LOOT_MODIFIER.register("${modid}_loot_modifier", ${JavaModName}LootTableModifier.CODEC);
			LOOT_MODIFIER.register(bus);
		});
	}

}