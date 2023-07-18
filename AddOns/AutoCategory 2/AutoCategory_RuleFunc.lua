local specializedItemTypeMap = {
	["additive"] = SPECIALIZED_ITEMTYPE_ADDITIVE,
	["armor"] = SPECIALIZED_ITEMTYPE_ARMOR,
	["armor_booster"] = SPECIALIZED_ITEMTYPE_ARMOR_BOOSTER,
	["armor_trait"] = SPECIALIZED_ITEMTYPE_ARMOR_TRAIT,
	["ava_repair"] = SPECIALIZED_ITEMTYPE_AVA_REPAIR,
	["blacksmithing_booster"] = SPECIALIZED_ITEMTYPE_BLACKSMITHING_BOOSTER,
	["blacksmithing_material"] = SPECIALIZED_ITEMTYPE_BLACKSMITHING_MATERIAL,
	["blacksmithing_raw_material"] = SPECIALIZED_ITEMTYPE_BLACKSMITHING_RAW_MATERIAL,
	["clothier_booster"] = SPECIALIZED_ITEMTYPE_CLOTHIER_BOOSTER,
	["clothier_material"] = SPECIALIZED_ITEMTYPE_CLOTHIER_MATERIAL,
	["clothier_raw_material"] = SPECIALIZED_ITEMTYPE_CLOTHIER_RAW_MATERIAL,
	["collectible_monster_trophy"] = SPECIALIZED_ITEMTYPE_COLLECTIBLE_MONSTER_TROPHY,
	["collectible_rare_fish"] = SPECIALIZED_ITEMTYPE_COLLECTIBLE_RARE_FISH,
	["collectible_style_page"] = SPECIALIZED_ITEMTYPE_COLLECTIBLE_STYLE_PAGE,
	["container"] = SPECIALIZED_ITEMTYPE_CONTAINER,
	["container_currency"] = SPECIALIZED_ITEMTYPE_CONTAINER_CURRENCY,
	["container_event"] = SPECIALIZED_ITEMTYPE_CONTAINER_EVENT,
	["container_style_page"] = SPECIALIZED_ITEMTYPE_CONTAINER_STYLE_PAGE,
	["costume"] = SPECIALIZED_ITEMTYPE_COSTUME,
	["crown_item"] = SPECIALIZED_ITEMTYPE_CROWN_ITEM,
	["crown_repair"] = SPECIALIZED_ITEMTYPE_CROWN_REPAIR,
	["disguise"] = SPECIALIZED_ITEMTYPE_DISGUISE,
	["drink_alcoholic"] = SPECIALIZED_ITEMTYPE_DRINK_ALCOHOLIC,
	["drink_cordial_tea"] = SPECIALIZED_ITEMTYPE_DRINK_CORDIAL_TEA,
	["drink_distillate"] = SPECIALIZED_ITEMTYPE_DRINK_DISTILLATE,
	["drink_liqueur"] = SPECIALIZED_ITEMTYPE_DRINK_LIQUEUR,
	["drink_tea"] = SPECIALIZED_ITEMTYPE_DRINK_TEA,
	["drink_tincture"] = SPECIALIZED_ITEMTYPE_DRINK_TINCTURE,
	["drink_tonic"] = SPECIALIZED_ITEMTYPE_DRINK_TONIC,
	["drink_unique"] = SPECIALIZED_ITEMTYPE_DRINK_UNIQUE,
	["dye_stamp"] = SPECIALIZED_ITEMTYPE_DYE_STAMP,
	["enchanting_rune_aspect"] = SPECIALIZED_ITEMTYPE_ENCHANTING_RUNE_ASPECT,
	["enchanting_rune_essence"] = SPECIALIZED_ITEMTYPE_ENCHANTING_RUNE_ESSENCE,
	["enchanting_rune_potency"] = SPECIALIZED_ITEMTYPE_ENCHANTING_RUNE_POTENCY,
	["enchantment_booster"] = SPECIALIZED_ITEMTYPE_ENCHANTMENT_BOOSTER,
	["fish"] = SPECIALIZED_ITEMTYPE_FISH,
	["flavoring"] = SPECIALIZED_ITEMTYPE_FLAVORING,
	["food_entremet"] = SPECIALIZED_ITEMTYPE_FOOD_ENTREMET,
	["food_fruit"] = SPECIALIZED_ITEMTYPE_FOOD_FRUIT,
	["food_gourmet"] = SPECIALIZED_ITEMTYPE_FOOD_GOURMET,
	["food_meat"] = SPECIALIZED_ITEMTYPE_FOOD_MEAT,
	["food_ragout"] = SPECIALIZED_ITEMTYPE_FOOD_RAGOUT,
	["food_savoury"] = SPECIALIZED_ITEMTYPE_FOOD_SAVOURY,
	["food_unique"] = SPECIALIZED_ITEMTYPE_FOOD_UNIQUE,
	["food_vegetable"] = SPECIALIZED_ITEMTYPE_FOOD_VEGETABLE,
    ["furnishing_attunable_crafting_station"] = SPECIALIZED_ITEMTYPE_FURNISHING_ATTUNABLE_CRAFTING_STATION,
	["furnishing_crafting_station"] = SPECIALIZED_ITEMTYPE_FURNISHING_CRAFTING_STATION,
	["furnishing_light"] = SPECIALIZED_ITEMTYPE_FURNISHING_LIGHT,
	["furnishing_material_alchemy"] = SPECIALIZED_ITEMTYPE_FURNISHING_MATERIAL_ALCHEMY,
	["furnishing_material_blacksmithing"] = SPECIALIZED_ITEMTYPE_FURNISHING_MATERIAL_BLACKSMITHING,
	["furnishing_material_clothier"] = SPECIALIZED_ITEMTYPE_FURNISHING_MATERIAL_CLOTHIER,
	["furnishing_material_enchanting"] = SPECIALIZED_ITEMTYPE_FURNISHING_MATERIAL_ENCHANTING,
	["furnishing_material_jewelry"] = SPECIALIZED_ITEMTYPE_FURNISHING_MATERIAL_JEWELRYCRAFTING,
	["furnishing_material_provisioning"] = SPECIALIZED_ITEMTYPE_FURNISHING_MATERIAL_PROVISIONING,
	["furnishing_material_woodworking"] = SPECIALIZED_ITEMTYPE_FURNISHING_MATERIAL_WOODWORKING,
	["furnishing_ornamental"] = SPECIALIZED_ITEMTYPE_FURNISHING_ORNAMENTAL,
	["furnishing_seating"] = SPECIALIZED_ITEMTYPE_FURNISHING_SEATING,
	["furnishing_target_dummy"] = SPECIALIZED_ITEMTYPE_FURNISHING_TARGET_DUMMY,
	["glyph_armor"] = SPECIALIZED_ITEMTYPE_GLYPH_ARMOR,
	["glyph_jewelry"] = SPECIALIZED_ITEMTYPE_GLYPH_JEWELRY,
	["glyph_weapon"] = SPECIALIZED_ITEMTYPE_GLYPH_WEAPON,
    ["holiday_writ"] = SPECIALIZED_ITEMTYPE_HOLIDAY_WRIT,
	["ingredient_alcohol"] = SPECIALIZED_ITEMTYPE_INGREDIENT_ALCOHOL,
	["ingredient_drink_additive"] = SPECIALIZED_ITEMTYPE_INGREDIENT_DRINK_ADDITIVE,
	["ingredient_food_additive"] = SPECIALIZED_ITEMTYPE_INGREDIENT_FOOD_ADDITIVE,
	["ingredient_fruit"] = SPECIALIZED_ITEMTYPE_INGREDIENT_FRUIT,
	["ingredient_meat"] = SPECIALIZED_ITEMTYPE_INGREDIENT_MEAT,
	["ingredient_rare"] = SPECIALIZED_ITEMTYPE_INGREDIENT_RARE,
	["ingredient_tea"] = SPECIALIZED_ITEMTYPE_INGREDIENT_TEA,
	["ingredient_tonic"] = SPECIALIZED_ITEMTYPE_INGREDIENT_TONIC,
	["ingredient_vegetable"] = SPECIALIZED_ITEMTYPE_INGREDIENT_VEGETABLE,
    ["jewelry_booster"] = SPECIALIZED_ITEMTYPE_JEWELRYCRAFTING_BOOSTER,
    ["jewelry_material"] = SPECIALIZED_ITEMTYPE_JEWELRYCRAFTING_MATERIAL,
    ["jewelry_raw_booster"] = SPECIALIZED_ITEMTYPE_JEWELRYCRAFTING_RAW_BOOSTER,
    ["jewelry_raw_material"] = SPECIALIZED_ITEMTYPE_JEWELRYCRAFTING_RAW_MATERIAL,
    ["jewelry_raw_trait"] = SPECIALIZED_ITEMTYPE_JEWELRY_RAW_TRAIT,
    ["jewelry_trait"] = SPECIALIZED_ITEMTYPE_JEWELRY_TRAIT,
	["lockpick"] = SPECIALIZED_ITEMTYPE_LOCKPICK,
	["lure"] = SPECIALIZED_ITEMTYPE_LURE,
	["master_writ"] = SPECIALIZED_ITEMTYPE_MASTER_WRIT,
	["mount"] = SPECIALIZED_ITEMTYPE_MOUNT,
	["none"] = SPECIALIZED_ITEMTYPE_NONE,
	["plug"] = SPECIALIZED_ITEMTYPE_PLUG,
	["poison"] = SPECIALIZED_ITEMTYPE_POISON,
	["poison_base"] = SPECIALIZED_ITEMTYPE_POISON_BASE,
	["potion"] = SPECIALIZED_ITEMTYPE_POTION,
	["potion_base"] = SPECIALIZED_ITEMTYPE_POTION_BASE,
	["racial_style_motif_book"] = SPECIALIZED_ITEMTYPE_RACIAL_STYLE_MOTIF_BOOK,
	["racial_style_motif_chapter"] = SPECIALIZED_ITEMTYPE_RACIAL_STYLE_MOTIF_CHAPTER,
	["raw_material"] = SPECIALIZED_ITEMTYPE_RAW_MATERIAL,
	["reagent_animal_part"] = SPECIALIZED_ITEMTYPE_REAGENT_ANIMAL_PART,
	["reagent_fungus"] = SPECIALIZED_ITEMTYPE_REAGENT_FUNGUS,
	["reagent_herb"] = SPECIALIZED_ITEMTYPE_REAGENT_HERB,
	["recall_stone_keep"] = SPECIALIZED_ITEMTYPE_RECALL_STONE_KEEP,
	["recipe_alchemy_formula_furnishing"] = SPECIALIZED_ITEMTYPE_RECIPE_ALCHEMY_FORMULA_FURNISHING,
	["recipe_blacksmithing_diagram_furnishing"] = SPECIALIZED_ITEMTYPE_RECIPE_BLACKSMITHING_DIAGRAM_FURNISHING,
	["recipe_clothier_pattern_furnishing"] = SPECIALIZED_ITEMTYPE_RECIPE_CLOTHIER_PATTERN_FURNISHING,
	["recipe_enchanting_schematic_furnishing"] = SPECIALIZED_ITEMTYPE_RECIPE_ENCHANTING_SCHEMATIC_FURNISHING,
	["recipe_jewelry_sketch_furnishing"] = SPECIALIZED_ITEMTYPE_RECIPE_JEWELRYCRAFTING_SKETCH_FURNISHING,
	["recipe_provisioning_design_furnishing"] = SPECIALIZED_ITEMTYPE_RECIPE_PROVISIONING_DESIGN_FURNISHING,
	["recipe_provisioning_standard_drink"] = SPECIALIZED_ITEMTYPE_RECIPE_PROVISIONING_STANDARD_DRINK,
	["recipe_provisioning_standard_food"] = SPECIALIZED_ITEMTYPE_RECIPE_PROVISIONING_STANDARD_FOOD,
	["recipe_woodworking_blueprint_furnishing"] = SPECIALIZED_ITEMTYPE_RECIPE_WOODWORKING_BLUEPRINT_FURNISHING,
	["siege_ballista"] = SPECIALIZED_ITEMTYPE_SIEGE_BALLISTA,
	["siege_battle_standard"] = SPECIALIZED_ITEMTYPE_SIEGE_BATTLE_STANDARD,
	["siege_catapult"] = SPECIALIZED_ITEMTYPE_SIEGE_CATAPULT,
	["siege_graveyard"] = SPECIALIZED_ITEMTYPE_SIEGE_GRAVEYARD,
	["siege_lancer"] = SPECIALIZED_ITEMTYPE_SIEGE_LANCER,
	["siege_monster"] = SPECIALIZED_ITEMTYPE_SIEGE_MONSTER,
	["siege_oil"] = SPECIALIZED_ITEMTYPE_SIEGE_OIL,
	["siege_ram"] = SPECIALIZED_ITEMTYPE_SIEGE_RAM,
	["siege_trebuchet"] = SPECIALIZED_ITEMTYPE_SIEGE_TREBUCHET,
	["siege_universal"] = SPECIALIZED_ITEMTYPE_SIEGE_UNIVERSAL,
	["soul_gem"] = SPECIALIZED_ITEMTYPE_SOUL_GEM,
	["spellcrafting_tablet"] = SPECIALIZED_ITEMTYPE_SPELLCRAFTING_TABLET,
	["spice"] = SPECIALIZED_ITEMTYPE_SPICE,
	["style_material"] = SPECIALIZED_ITEMTYPE_STYLE_MATERIAL,
	["tabard"] = SPECIALIZED_ITEMTYPE_TABARD,
	["tool"] = SPECIALIZED_ITEMTYPE_TOOL,
	["trash"] = SPECIALIZED_ITEMTYPE_TRASH,
	["treasure"] = SPECIALIZED_ITEMTYPE_TREASURE,
	["trophy_collectible_fragment"] = SPECIALIZED_ITEMTYPE_TROPHY_COLLECTIBLE_FRAGMENT,
	["trophy_dungeon_buff_ingredient"] = SPECIALIZED_ITEMTYPE_TROPHY_DUNGEON_BUFF_INGREDIENT,
	["trophy_key"] = SPECIALIZED_ITEMTYPE_TROPHY_KEY,
	["trophy_key_fragment"] = SPECIALIZED_ITEMTYPE_TROPHY_KEY_FRAGMENT,
	["trophy_material_upgrader"] = SPECIALIZED_ITEMTYPE_TROPHY_MATERIAL_UPGRADER,
	["trophy_museum_piece"] = SPECIALIZED_ITEMTYPE_TROPHY_MUSEUM_PIECE,
	["trophy_recipe_fragment"] = SPECIALIZED_ITEMTYPE_TROPHY_RECIPE_FRAGMENT,
	["trophy_runebox_fragment"] = SPECIALIZED_ITEMTYPE_TROPHY_RUNEBOX_FRAGMENT,
	["trophy_scroll"] = SPECIALIZED_ITEMTYPE_TROPHY_SCROLL,
	["trophy_survey_report"] = SPECIALIZED_ITEMTYPE_TROPHY_SURVEY_REPORT,
	["trophy_toy"] = SPECIALIZED_ITEMTYPE_TROPHY_TOY,
	["trophy_treasure_map"] = SPECIALIZED_ITEMTYPE_TROPHY_TREASURE_MAP,
    ["trophy_upgrade_fragment"] = SPECIALIZED_ITEMTYPE_TROPHY_UPGRADE_FRAGMENT,	
    ["weapon"] = SPECIALIZED_ITEMTYPE_WEAPON,
	["weapon_booster"] = SPECIALIZED_ITEMTYPE_WEAPON_BOOSTER,
	["weapon_trait"] = SPECIALIZED_ITEMTYPE_WEAPON_TRAIT,
	["woodworking_booster"] = SPECIALIZED_ITEMTYPE_WOODWORKING_BOOSTER,
	["woodworking_material"] = SPECIALIZED_ITEMTYPE_WOODWORKING_MATERIAL,
	["woodworking_raw_material"] = SPECIALIZED_ITEMTYPE_WOODWORKING_RAW_MATERIAL,
}
-- add in convenience specialized combos
specializedItemTypeMap.glyph = { 
    [SPECIALIZED_ITEMTYPE_GLYPH_ARMOR] = true, 
    [SPECIALIZED_ITEMTYPE_GLYPH_JEWELRY] = true, 
    [SPECIALIZED_ITEMTYPE_GLYPH_WEAPON] = true, 
}

local itemTypeMap = {
	["additive"] = ITEMTYPE_ADDITIVE,
	["armor"] = ITEMTYPE_ARMOR,
	["armor_booster"] = ITEMTYPE_ARMOR_BOOSTER,
	["armor_trait"] = ITEMTYPE_ARMOR_TRAIT,
	["ava_repair"] = ITEMTYPE_AVA_REPAIR,
	["blacksmithing_booster"] = ITEMTYPE_BLACKSMITHING_BOOSTER,
	["blacksmithing_material"] = ITEMTYPE_BLACKSMITHING_MATERIAL,
	["blacksmithing_raw_material"] = ITEMTYPE_BLACKSMITHING_RAW_MATERIAL,
	["clothier_booster"] = ITEMTYPE_CLOTHIER_BOOSTER,
	["clothier_material"] = ITEMTYPE_CLOTHIER_MATERIAL,
	["clothier_raw_material"] = ITEMTYPE_CLOTHIER_RAW_MATERIAL,
	["collectible"] = ITEMTYPE_COLLECTIBLE,
	["container"] = ITEMTYPE_CONTAINER,
	["container_currency"] = ITEMTYPE_CONTAINER_CURRENCY,
	["costume"] = ITEMTYPE_COSTUME,
	["crown_item"] = ITEMTYPE_CROWN_ITEM,
	["crown_repair"] = ITEMTYPE_CROWN_REPAIR,
	["deprecated"] = ITEMTYPE_DEPRECATED,
	["disguise"] = ITEMTYPE_DISGUISE,
	["drink"] = ITEMTYPE_DRINK,
	["dye_stamp"] = ITEMTYPE_DYE_STAMP,
	["enchanting_rune_aspect"] = ITEMTYPE_ENCHANTING_RUNE_ASPECT,
	["enchanting_rune_essence"] = ITEMTYPE_ENCHANTING_RUNE_ESSENCE,
	["enchanting_rune_potency"] = ITEMTYPE_ENCHANTING_RUNE_POTENCY,
	["enchantment_booster"] = ITEMTYPE_ENCHANTMENT_BOOSTER,
	["fish"] = ITEMTYPE_FISH,
	["flavoring"] = ITEMTYPE_FLAVORING,
	["food"] = ITEMTYPE_FOOD,
	["furnishing"] = ITEMTYPE_FURNISHING,
	["furnishing_material"] = ITEMTYPE_FURNISHING_MATERIAL,
	["glyph_armor"] = ITEMTYPE_GLYPH_ARMOR,
	["glyph_jewelry"] = ITEMTYPE_GLYPH_JEWELRY,
	["glyph_weapon"] = ITEMTYPE_GLYPH_WEAPON,
	["group_repair"] = ITEMTYPE_GROUP_REPAIR,
	["ingredient"] = ITEMTYPE_INGREDIENT,
    ["jewelry_booster"] = ITEMTYPE_JEWELRYCRAFTING_BOOSTER,
    ["jewelry_material"] = ITEMTYPE_JEWELRYCRAFTING_MATERIAL,
    ["jewelry_raw_booster"] = ITEMTYPE_JEWELRYCRAFTING_RAW_BOOSTER,
    ["jewelry_raw_material"] = ITEMTYPE_JEWELRYCRAFTING_RAW_MATERIAL,
    ["jewelry_raw_trait"] = ITEMTYPE_JEWELRY_RAW_TRAIT,
    ["jewelry_trait"] = ITEMTYPE_JEWELRY_TRAIT,
	["lockpick"] = ITEMTYPE_LOCKPICK,
	["lure"] = ITEMTYPE_LURE,
	["master_writ"] = ITEMTYPE_MASTER_WRIT,
	["mount"] = ITEMTYPE_MOUNT,
	["none"] = ITEMTYPE_NONE,
	["plug"] = ITEMTYPE_PLUG,
	["poison"] = ITEMTYPE_POISON,
	["poison_base"] = ITEMTYPE_POISON_BASE,
	["potion"] = ITEMTYPE_POTION,
	["potion_base"] = ITEMTYPE_POTION_BASE,
	["racial_style_motif"] = ITEMTYPE_RACIAL_STYLE_MOTIF,
	["raw_material"] = ITEMTYPE_RAW_MATERIAL,
	["reagent"] = ITEMTYPE_REAGENT,
	["recall_stone"] = ITEMTYPE_RECALL_STONE,
	["recipe"] = ITEMTYPE_RECIPE,
	["siege"] = ITEMTYPE_SIEGE,
	["soul_gem"] = ITEMTYPE_SOUL_GEM,
	["spellcrafting_tablet"] = ITEMTYPE_SPELLCRAFTING_TABLET,
	["spice"] = ITEMTYPE_SPICE,
	["style_material"] = ITEMTYPE_STYLE_MATERIAL,
	["tabard"] = ITEMTYPE_TABARD,
	["tool"] = ITEMTYPE_TOOL,
	["trash"] = ITEMTYPE_TRASH,
	["treasure"] = ITEMTYPE_TREASURE,
	["trophy"] = ITEMTYPE_TROPHY,
	["weapon"] = ITEMTYPE_WEAPON,
	["weapon_booster"] = ITEMTYPE_WEAPON_BOOSTER,
	["weapon_trait"] = ITEMTYPE_WEAPON_TRAIT,
	["woodworking_booster"] = ITEMTYPE_WOODWORKING_BOOSTER,
	["woodworking_material"] = ITEMTYPE_WOODWORKING_MATERIAL,
	["woodworking_raw_material"] = ITEMTYPE_WOODWORKING_RAW_MATERIAL,
}
itemTypeMap.enchanting_rune = {
    ITEMTYPE_ENCHANTING_RUNE_ASPECT,
    ITEMTYPE_ENCHANTING_RUNE_ESSENCE,
    ITEMTYPE_ENCHANTING_RUNE_POTENCY,
}
itemTypeMap.glyph = { 
    [ITEMTYPE_GLYPH_ARMOR] = true, 
    [ITEMTYPE_GLYPH_JEWELRY] = true, 
    [ITEMTYPE_GLYPH_WEAPON] = true, 
}

local filterTypeMap = {
	["alchemy"] = ITEMFILTERTYPE_ALCHEMY,
	["all"] = ITEMFILTERTYPE_ALL,
	["armor"] = ITEMFILTERTYPE_ARMOR,
	["blacksmithing"] = ITEMFILTERTYPE_BLACKSMITHING,
	["buyback"] = ITEMFILTERTYPE_BUYBACK,
	["clothing"] = ITEMFILTERTYPE_CLOTHING,
	["collectible"] = ITEMFILTERTYPE_COLLECTIBLE,
	["companion"] = ITEMFILTERTYPE_COMPANION,
	["consumable"] = ITEMFILTERTYPE_CONSUMABLE,
	["crafting"] = ITEMFILTERTYPE_CRAFTING,
	["damaged"] = ITEMFILTERTYPE_DAMAGED,
	["enchanting"] = ITEMFILTERTYPE_ENCHANTING,
	["furnishing"] = ITEMFILTERTYPE_FURNISHING,
	["house_with_template"] = ITEMFILTERTYPE_HOUSE_WITH_TEMPLATE,
	["jewelry"] = ITEMFILTERTYPE_JEWELRY,
	["jewelrycrafting"] = ITEMFILTERTYPE_JEWELRYCRAFTING,
	["junk"] = ITEMFILTERTYPE_JUNK,
	["miscellaneous"] = ITEMFILTERTYPE_MISCELLANEOUS,
	["provisioning"] = ITEMFILTERTYPE_PROVISIONING,
	["quest"] = ITEMFILTERTYPE_QUEST,
	["quickslot"] = ITEMFILTERTYPE_QUICKSLOT,
	--["reuse"] = ITEMFILTERTYPE_REUSE,
	["style_materials"] = ITEMFILTERTYPE_STYLE_MATERIALS,
	["trait_items"] = ITEMFILTERTYPE_TRAIT_ITEMS,
	["weapons"] = ITEMFILTERTYPE_WEAPONS,
	["woodworking"] = ITEMFILTERTYPE_WOODWORKING,
}

local equipTypeMap = {
	["chest"] = EQUIP_TYPE_CHEST,
	["costume"] = EQUIP_TYPE_COSTUME,
	["feet"] = EQUIP_TYPE_FEET,
	["hand"] = EQUIP_TYPE_HAND,
	["head"] = EQUIP_TYPE_HEAD,
	["invalid"] = EQUIP_TYPE_INVALID,
	["legs"] = EQUIP_TYPE_LEGS,
	["main_hand"] = EQUIP_TYPE_MAIN_HAND,
	["neck"] = EQUIP_TYPE_NECK,
	["off_hand"] = EQUIP_TYPE_OFF_HAND,
	["one_hand"] = EQUIP_TYPE_ONE_HAND,
	["poison"] = EQUIP_TYPE_POISON,
	["ring"] = EQUIP_TYPE_RING,
	["shoulders"] = EQUIP_TYPE_SHOULDERS,
	["two_hand"] = EQUIP_TYPE_TWO_HAND,
	["waist"] = EQUIP_TYPE_WAIST,
}

local qualityMap = {
	["arcane"] = ITEM_DISPLAY_QUALITY_ARCANE,
	["artifact"] = ITEM_DISPLAY_QUALITY_ARTIFACT,
	["legendary"] = ITEM_DISPLAY_QUALITY_LEGENDARY,
	["mythic"] = ITEM_DISPLAY_QUALITY_MYTHIC_OVERRIDE,
	["magic"] = ITEM_DISPLAY_QUALITY_MAGIC,
	["normal"] = ITEM_DISPLAY_QUALITY_NORMAL,
	["trash"] = ITEM_DISPLAY_QUALITY_TRASH,
					
	["blue"] = ITEM_DISPLAY_QUALITY_ARCANE,
	["purple"] = ITEM_DISPLAY_QUALITY_ARTIFACT,
	["gold"] = ITEM_DISPLAY_QUALITY_LEGENDARY,
	["orange"] = ITEM_DISPLAY_QUALITY_MYTHIC_OVERRIDE,
	["green"] = ITEM_DISPLAY_QUALITY_MAGIC,
	["white"] = ITEM_DISPLAY_QUALITY_NORMAL,
	["grey"] = ITEM_DISPLAY_QUALITY_TRASH,
}

local boundTypeMap = {
	["none"] = BIND_TYPE_NONE,
	["on_equip"] = BIND_TYPE_ON_EQUIP,
	["on_pickup"] = BIND_TYPE_ON_PICKUP,
	["on_pickup_backpack"] = BIND_TYPE_ON_PICKUP_BACKPACK,
	["unset"] = BIND_TYPE_UNSET,
}

local traitMap = {
	["armor_aggressive"] = ITEM_TRAIT_TYPE_ARMOR_AGGRESSIVE,
	["armor_augmented"] = ITEM_TRAIT_TYPE_ARMOR_AUGMENTED,
	["armor_bolstered"] = ITEM_TRAIT_TYPE_ARMOR_BOLSTERED,
	["armor_divines"] = ITEM_TRAIT_TYPE_ARMOR_DIVINES,
	["armor_focused"] = ITEM_TRAIT_TYPE_ARMOR_FOCUSED,
	["armor_impenetrable"] = ITEM_TRAIT_TYPE_ARMOR_IMPENETRABLE,
	["armor_infused"] = ITEM_TRAIT_TYPE_ARMOR_INFUSED,
	["armor_intricate"] = ITEM_TRAIT_TYPE_ARMOR_INTRICATE,
	["armor_nirnhoned"] = ITEM_TRAIT_TYPE_ARMOR_NIRNHONED,
	["armor_ornate"] = ITEM_TRAIT_TYPE_ARMOR_ORNATE,
	["armor_prolific"] = ITEM_TRAIT_TYPE_ARMOR_PROLIFIC,
	["armor_prosperous"] = ITEM_TRAIT_TYPE_ARMOR_PROSPEROUS,
	["armor_invigorating"] = ITEM_TRAIT_TYPE_ARMOR_PROSPEROUS,
	["armor_quickened"] = ITEM_TRAIT_TYPE_ARMOR_QUICKENED,
	["armor_reinforced"] = ITEM_TRAIT_TYPE_ARMOR_REINFORCED,
	["armor_shattering"] = ITEM_TRAIT_TYPE_ARMOR_SHATTERING,
	["armor_soothing"] = ITEM_TRAIT_TYPE_ARMOR_SOOTHING,
	["armor_sturdy"] = ITEM_TRAIT_TYPE_ARMOR_STURDY,
	["armor_training"] = ITEM_TRAIT_TYPE_ARMOR_TRAINING,
	["armor_vigorous"] = ITEM_TRAIT_TYPE_ARMOR_VIGOROUS,
	["armor_well_fitted"] = ITEM_TRAIT_TYPE_ARMOR_WELL_FITTED,
	["deprecated"] = ITEM_TRAIT_TYPE_DEPRECATED,
	["jewelry_aggressive"] = ITEM_TRAIT_TYPE_JEWELRY_AGGRESSIVE,
	["jewelry_arcane"] = ITEM_TRAIT_TYPE_JEWELRY_ARCANE,
	["jewelry_augmented"] = ITEM_TRAIT_TYPE_JEWELRY_AUGMENTED,
   	["jewelry_bloodthirsty"] = ITEM_TRAIT_TYPE_JEWELRY_BLOODTHIRSTY,
   	["jewelry_bolstered"] = ITEM_TRAIT_TYPE_JEWELRY_BOLSTERED,
   	["jewelry_harmony"] = ITEM_TRAIT_TYPE_JEWELRY_HARMONY,
	["jewelry_healthy"] = ITEM_TRAIT_TYPE_JEWELRY_HEALTHY,
    ["jewelry_infused"] = ITEM_TRAIT_TYPE_JEWELRY_INFUSED,
    ["jewelry_intricate"] = ITEM_TRAIT_TYPE_JEWELRY_INTRICATE,
	["jewelry_ornate"] = ITEM_TRAIT_TYPE_JEWELRY_ORNATE,
	["jewelry_prolific"] = ITEM_TRAIT_TYPE_JEWELRY_PROLIFIC,
	["jewelry_protective"] = ITEM_TRAIT_TYPE_JEWELRY_PROTECTIVE,
	["jewelry_robust"] = ITEM_TRAIT_TYPE_JEWELRY_ROBUST,
	["jewelry_shattering"] = ITEM_TRAIT_TYPE_JEWELRY_SHATTERING,
	["jewelry_soothing"] = ITEM_TRAIT_TYPE_JEWELRY_SOOTHING,
	["jewelry_swift"] = ITEM_TRAIT_TYPE_JEWELRY_SWIFT,
	["jewelry_triune"] = ITEM_TRAIT_TYPE_JEWELRY_TRIUNE,
	["jewelry_vigorous"] = ITEM_TRAIT_TYPE_JEWELRY_VIGOROUS,
	["none"] = ITEM_TRAIT_TYPE_NONE,
	["weapon_aggressive"] = ITEM_TRAIT_TYPE_WEAPON_AGGRESSIVE,
	["weapon_augmented"] = ITEM_TRAIT_TYPE_WEAPON_AUGMENTED,
	["weapon_bolstered"] = ITEM_TRAIT_TYPE_WEAPON_BOLSTERED,
	["weapon_charged"] = ITEM_TRAIT_TYPE_WEAPON_CHARGED,
	["weapon_decisive"] = ITEM_TRAIT_TYPE_WEAPON_DECISIVE,
	["weapon_defending"] = ITEM_TRAIT_TYPE_WEAPON_DEFENDING,
	["weapon_focused"] = ITEM_TRAIT_TYPE_WEAPON_FOCUSED,
	["weapon_infused"] = ITEM_TRAIT_TYPE_WEAPON_INFUSED,
	["weapon_intricate"] = ITEM_TRAIT_TYPE_WEAPON_INTRICATE,
	["weapon_nirnhoned"] = ITEM_TRAIT_TYPE_WEAPON_NIRNHONED,
	["weapon_ornate"] = ITEM_TRAIT_TYPE_WEAPON_ORNATE,
	["weapon_powered"] = ITEM_TRAIT_TYPE_WEAPON_POWERED,
	["weapon_precise"] = ITEM_TRAIT_TYPE_WEAPON_PRECISE,
	["weapon_prolific"] = ITEM_TRAIT_TYPE_WEAPON_PROLIFIC,
	["weapon_quickened"] = ITEM_TRAIT_TYPE_WEAPON_QUICKENED,
	["weapon_sharpened"] = ITEM_TRAIT_TYPE_WEAPON_SHARPENED,
	["weapon_shattering"] = ITEM_TRAIT_TYPE_WEAPON_SHATTERING,
	["weapon_soothing"] = ITEM_TRAIT_TYPE_WEAPON_SOOTHING,
	["weapon_training"] = ITEM_TRAIT_TYPE_WEAPON_TRAINING,
	["weapon_vigorous"] = ITEM_TRAIT_TYPE_WEAPON_VIGOROUS,
}

traitMap.intricate = { 
    [ITEM_TRAIT_TYPE_ARMOR_INTRICATE] = true, 
    [ITEM_TRAIT_TYPE_JEWELRY_INTRICATE] = true, 
    [ITEM_TRAIT_TYPE_WEAPON_INTRICATE] = true, 
}
traitMap.divines = ITEM_TRAIT_TYPE_ARMOR_DIVINES
traitMap.infused =  { 
    [ITEM_TRAIT_TYPE_ARMOR_INFUSED] = true, 
    [ITEM_TRAIT_TYPE_JEWELRY_INFUSED] = true, 
    [ITEM_TRAIT_TYPE_WEAPON_INFUSED] = true, 
}
traitMap.ornate =  { 
    [ITEM_TRAIT_TYPE_ARMOR_ORNATE] = true, 
    [ITEM_TRAIT_TYPE_JEWELRY_ORNATE] = true, 
    [ITEM_TRAIT_TYPE_WEAPON_ORNATE] = true, 
}
traitMap.nirhoned =  { 
    [ITEM_TRAIT_TYPE_ARMOR_NIRNHONED] = true, 
    [ITEM_TRAIT_TYPE_WEAPON_NIRNHONED] = true, 
}


local weaponTypeMap = { 
	["axe"] = WEAPONTYPE_AXE,
	["bow"] = WEAPONTYPE_BOW,
	["dagger"] = WEAPONTYPE_DAGGER,
	["fire_staff"] = WEAPONTYPE_FIRE_STAFF,
	["frost_staff"] = WEAPONTYPE_FROST_STAFF,
	["hammer"] = WEAPONTYPE_HAMMER,
	["healing_staff"] = WEAPONTYPE_HEALING_STAFF,
	["lightning_staff"] = WEAPONTYPE_LIGHTNING_STAFF,
	["none"] = WEAPONTYPE_NONE,
	["rune"] = WEAPONTYPE_RUNE,
	["shield"] = WEAPONTYPE_SHIELD,
	["sword"] = WEAPONTYPE_SWORD,
	["two_handed_axe"] = WEAPONTYPE_TWO_HANDED_AXE,
	["two_handed_hammer"] = WEAPONTYPE_TWO_HANDED_HAMMER,
	["two_handed_sword"] = WEAPONTYPE_TWO_HANDED_SWORD,
}

local armorTypeMap = {
	["heavy"] = ARMORTYPE_HEAVY,
	["light"] = ARMORTYPE_LIGHT,
	["medium"] = ARMORTYPE_MEDIUM,
	["none"] = ARMORTYPE_NONE,
}

AutoCategory.dictionary = {
    { 
        ["or"] = true,
        ["and"] = true,
        ["not"] = true,
    },
    specializedItemTypeMap,
    itemTypeMap,
    filterTypeMap,
    equipTypeMap,
    qualityMap,
    boundTypeMap,
    traitMap,
    weaponTypeMap,
    armorTypeMap,
    AutoCategory.Environment,
}

function AutoCategory.getItemStyles()
	local is = {}
	local style
	for k = 1,200,1 do
		style = GetItemStyleName(k)
		if style and style ~= "" and style ~= "use me" and style ~= "witches festival 2019" then
			style = zo_strlower(style)
			table.insert(is,style)
		end
	end
	--d(is)
	table.insert(AutoCategory.dictionary, is)
end

AutoCategory.getItemStyles()

--============Rule Function==============--
-- compare arg to key, looking up the arg in a map
-- if necessary (and provided)
-- return true if equal/found
local function isKnown(arg, typekey, fn, map)
    if type( arg ) == "number" then
        if arg == typekey then
            return true
        end
        
    elseif map and type( arg ) == "string" then
        local val = map[string.lower( arg )]
        if type ( val ) == "table" then
            if val[typekey] then
                return true
            end
        else
            if val and val == typekey then
                return true
            end
        end
    else
        error( string.format("error: %s(): argument is error." , fn ) )
    end
    
    -- no match
    return false
end
 
local L = GetString
function AutoCategory.RuleFunc.CurrentZone()
	local fn = "zone"
    return ZO_CachedStrFormat("<<C:1>>", GetZoneNameByIndex(GetCurrentMapZoneIndex()))
end

function AutoCategory.RuleFunc.SpecializedItemType( ... )
	local fn = "type"
	local ac = select( '#', ... )
	if ac == 0 then
		error( string.format("error: %s(): require arguments." , fn))
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format("error: %s():  argument is nil." , fn))
		end
		
		local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
		local _, sptype = GetItemLinkItemType(itemLink)
        local rslt = isKnown(arg, sptype, fn, specializedItemTypeMap)
        if rslt then return rslt end
		
	end
	
	return false
	
end

-- name of item matches one of the specified names
-- returns true/false
function AutoCategory.RuleFunc.IsInCurrentZone( ... )
	local fn = "isinzone"
	
	local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	--local hasSet, setName = GetItemLinkSetInfo(itemLink)
	local itemName = string.lower(GetItemLinkName(itemLink))
	
	local logger = LibDebugLogger("AutoCategory")
	--logger:SetEnabled(true)
	local zoneName = string.lower(ZO_CachedStrFormat("<<C:1>>", GetZoneNameByIndex(GetCurrentMapZoneIndex())))
	--logger:Error("AC itemName="..itemName.."   zoneName="..zoneName)
	if( string.find(zoneName,"alik'r") ~= nil ) then
		-- because maps never say "Alik'r Desert"
		zoneName = "alik'r"	
	    --logger:Error("AC 2 itemName="..itemName.."   zoneName="..zoneName)
	end
	
	if string.find(itemName,zoneName) ~= nil then
		--logger:Error("AC itemName="..itemName.."   found in zoneName="..zoneName)
		--logger:SetEnabled(false)
	    return true
	end
	--logger:SetEnabled(false)
	return false
end


function AutoCategory.RuleFunc.ItemType( ... )
	local fn = "type"
	local ac = select( '#', ... )
	if ac == 0 then
		error( string.format("error: %s(): require arguments." , fn))
	end
	
    local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
    local itemType = GetItemLinkItemType(itemLink)
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format("error: %s():  argument is nil." , fn))
		end
		local rslt = isKnown(arg, itemType, fn, itemTypeMap)
        if rslt then return rslt end
		
	end
	
	return false
	
end

function AutoCategory.RuleFunc.EquipType( ... )
	local fn = "equiptype"
	local ac = select( '#', ... )
	if ac == 0 then
		error( string.format("error: %s(): require arguments." , fn))
	end
	
  local _, _, _, _, _, equipType = GetItemInfo(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)

	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format("error: %s():  argument is nil." , fn))
		end
		local rslt = isKnown(arg, equipType, fn, equipTypeMap)
        if rslt then return rslt end
		
	end
	
	return false
	
end

function AutoCategory.RuleFunc.ItemStyle( ... )
	local fn = "itemstyle"
	local ac = select( '#', ... )
	if ac == 0 then
		error( string.format("error: %s(): require arguments." , fn))
	end
	
  local _, _, _, _, _, _, itemstyle = GetItemInfo(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)

	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format("error: %s():  argument is nil." , fn))
		end
		if zo_strlower(GetItemStyleName(itemstyle)) == zo_strlower(arg) then
			return true
		end
		
	end
	
	return false
	
end

function AutoCategory.RuleFunc.IsLocked( ... )
	local fn = "islocked"
	
	local isLocked = IsItemPlayerLocked(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	return isLocked
end

function AutoCategory.RuleFunc.IsBound( ... )
	local fn = "isbound"
	
	local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	local isBound = IsItemLinkBound(itemLink)
	return isBound
end

function AutoCategory.RuleFunc.IsUnbound( ... )
	local fn = "isunbound"
	
	local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	local isBound = IsItemLinkBound(itemLink)
	return not isBound
end

function AutoCategory.RuleFunc.IsCharBound( ... )
	local fn = "ischarbound"
    
	local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
    local bindType = GetItemLinkBindType(itemLink)
    local isBound = IsItemLinkBound(itemLink)
    if isBound and bindType == BIND_TYPE_ON_PICKUP_BACKPACK then
        return true
    end
    return false
end

function AutoCategory.RuleFunc.IsUnknownCollectible( ... )
	local fn = "isunknowncollectible"

	local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	local collectibleId = GetItemLinkContainerCollectibleId(itemLink)
	if collectibleId == 0 then return false end
	return not IsCollectibleUnlocked(collectibleId)
end

function AutoCategory.RuleFunc.IsCollected( ... )
	local fn = "iscollected"
	
	local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	local itemId = GetItemLinkItemId(itemLink)
	local hasSet, setName = GetItemLinkSetInfo(itemLink)
	if hasSet == false then return false end
	local isCollected = IsItemSetCollectionPieceUnlocked(itemId)
	return isCollected
end

function AutoCategory.RuleFunc.IsNotCollected( ... )
	local fn = "iscollected"
	
	local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	local itemId = GetItemLinkItemId(itemLink)
	local hasSet, setName = GetItemLinkSetInfo(itemLink)
	if hasSet == false then return false end
    local itemType = GetItemLinkItemType(itemLink)
	if IsItemLinkCrafted(itemLink) == true then return false end
	local isCollected = IsItemSetCollectionPieceUnlocked(itemId)
	if isCollected == false then return true end
	return false
end

function AutoCategory.RuleFunc.IsStolen( ... )
	local fn = "isstolen"
	
	return IsItemStolen(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
end

function AutoCategory.RuleFunc.IsLockpick( ... )
	local fn = "islockpick"
	
	local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
    local itemType = GetItemLinkItemType(itemLink)
    if itemType == ITEMTYPE_LOCKPICK or itemType == ITEMTYPE_TOOL then
        local _, _, _, _, _, _, _, quality = GetItemInfo(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
        if quality > 1 then return false end
        return true
    end
    return false
end

function AutoCategory.RuleFunc.IsBoPTradeable( ... )
	local fn = "isboptradeable"
	local result = IsItemBoPAndTradeable(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	return result
end

function AutoCategory.RuleFunc.IsCompanionOnly( ... )
	local fn = "iscompaniononly"

	local itemFilterType = { GetItemFilterTypeInfo(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex) }
		
	local testFilterType = ITEMFILTERTYPE_COMPANION
	for i = 1, #itemFilterType do
		if itemFilterType[i] == testFilterType then
			return true
		end
	end
	
	return false
end

function AutoCategory.RuleFunc.IsCrafted( ... )
	local fn = "iscrafted"
	local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
    local itemType = GetItemLinkItemType(itemLink)
    if (itemType == ITEMTYPE_POTION or itemType == ITEMTYPE_POISON) then
        return select(24, ZO_LinkHandler_ParseLink(itemLink)) ~= "0"
    end
	local result = IsItemLinkCrafted(itemLink)
	return result
end

function AutoCategory.RuleFunc.IsLearnable( ... )
	local fn = "islearnable"
	local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	
  local itemType = GetItemLinkItemType(itemLink) --GetItemType(bagId, slotIndex) 
  if itemType == ITEMTYPE_RECIPE then
      return not IsItemLinkRecipeKnown(itemLink)
  elseif IsItemLinkBook(itemLink) then
      return not IsItemLinkBookKnown(itemLink)
  end
	return false
end

function AutoCategory.RuleFunc.Quality( ... )
	local fn = "quality"  
	local ac = select( '#', ... )
	if ac == 0 then
		error( string.format("error: %s(): require arguments." , fn))
	end
	
	local _, _, _, _, _, _, _, quality = GetItemInfo(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	local displayquality = GetItemLinkDisplayQuality(itemLink)
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format("error: %s():  argument is nil." , fn))
		end
		 
		if type( arg ) == "number" then
			if arg == quality then
				return true
			end
		elseif type( arg ) == "string" then

			local v = qualityMap[string.lower( arg )]
			if v and v == displayquality then
				return true
			end
		else
			error( string.format("error: %s(): argument is error." , fn ) )
		end
		
	end
	
	return false
end

function AutoCategory.RuleFunc.GetQuality()
	local fn = "getquality"
	
	local _, _, _, _, _, _, _, quality = GetItemInfo(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	return quality
end

function AutoCategory.RuleFunc.IsNew( ... )
	local fn = "isnew"
	if not AutoCategory.checkingItemBagId then
		return false
	end
	return SHARED_INVENTORY:IsItemNew(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
end

function AutoCategory.RuleFunc.BoundType( ... )
	local fn = "boundtype"
	local ac = select( '#', ... )
	if ac == 0 then
		error( string.format("error: %s(): require arguments." , fn))
	end
	
  local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
  local boundType = GetItemLinkBindType(itemLink)
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format("error: %s():  argument is nil." , fn))
		end
		
		if type( arg ) == "number" then
			if arg == boundType then
				return true
			end
		elseif type( arg ) == "string" then
			local v = boundTypeMap[string.lower( arg )]
			if v and v == boundType then
				return true
			end
		else
			error( string.format("error: %s(): argument is error." , fn ) )
		end
		
	end
	
	return false
	
end


function AutoCategory.RuleFunc.FilterType( ... )
	local fn = "filtertype"
	local ac = select( '#', ... )
	if ac == 0 then
		error( string.format("error: %s(): require arguments." , fn))
	end

  local itemFilterType = { GetItemFilterTypeInfo(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex) }
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format("error: %s():  argument is nil." , fn))
		end
		
		local testFilterType

		if type( arg ) == "number" then
			testFilterType = arg
		elseif type( arg ) == "string" then  
			testFilterType = filterTypeMap[string.lower( arg )]
			if testFilterType == nil then
				error( string.format("error: %s(): argument '%s' is not recognized.", fn, string.lower(arg)))
			end			
		else
			error( string.format("error: %s(): argument is error." , fn ) )
		end
		for i = 1, #itemFilterType do
			if itemFilterType[i] == testFilterType then
				return true
			end
		end
	end
	
	return false
	
end

function AutoCategory.RuleFunc.Level( ... )
	local fn = "level"
	local level = GetItemRequiredLevel(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	return level
end

function AutoCategory.RuleFunc.CPLevel( ... )
	local fn = "cp"
	local level = GetItemRequiredChampionPoints(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	return level
end

function AutoCategory.RuleFunc.CharLevel( ... )
	local fn = "charlevel"
	local level = GetUnitLevel("player")
	return level
end

function AutoCategory.RuleFunc.CharCP( ... )
	local fn = "charcp"
	local cp = GetUnitChampionPoints("player")
	return cp
end


function AutoCategory.RuleFunc.SellPrice( ... )
	local fn = "sellprice"
	local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
		
	local _, sellPrice = GetItemLinkInfo(itemLink)
	return sellPrice
end

function AutoCategory.RuleFunc.StackSize( ... )
	local fn = "stacksize"
	local stackSize = GetSlotStackSize(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	  
	return stackSize
end

function AutoCategory.RuleFunc.KeepForResearch( ... )
	local traitInformation = GetItemTraitInformation(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	return traitInformation == ITEM_TRAIT_INFORMATION_CAN_BE_RESEARCHED
end

function AutoCategory.RuleFunc.isReconstructed( ... )
	local traitInformation = GetItemTraitInformation(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	return traitInformation == ITEM_TRAIT_INFORMATION_RECONSTRUCTED
end

function AutoCategory.RuleFunc.isTransmuted( ... )
	local traitInformation = GetItemTraitInformation(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	return traitInformation == ITEM_TRAIT_INFORMATION_RETRAITED
end

-- item is part of one of the specified sets (by set name)
-- returns true/false
function AutoCategory.RuleFunc.SetName( ... )
	local fn = "set"
	local ac = select( '#', ... )
	if ac == 0 then
		error( string.format("error: %s(): require arguments." , fn))
	end
	
  local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
  local hasSet, setName = GetItemLinkSetInfo(itemLink)
  if not hasSet then
    return false
  end
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format("error: %s():  argument is nil." , fn))
		end
		
		local findString
		if type( arg ) == "number" then
			findString = tostring(arg)
		elseif type( arg ) == "string" then
			findString = arg
		else
			error( string.format("error: %s(): argument is error." , fn ) )
		end
		--fix german language issue
		setName = string.gsub( setName , "%^.*", "")
		if string.find(setName, findString, 1 ,true) then
			return true
		end
	end
	
	return false
end


function AutoCategory.RuleFunc.AutoSetName( ... )
	local fn = "autoset"

	local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	local hasSet, setName = GetItemLinkSetInfo(itemLink)
	if not hasSet then
		-- item is not part of a set
		return false
	end
	--fix german language issue
	setName = string.gsub( setName , "%^.*", "")
	
	-- add in the category (set name) if necessary and assign item to it
	AutoCategory.AdditionCategoryName = setName
	return true
end

function AutoCategory.RuleFunc.IsSet( ... )
	local fn = "isset"
	local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	local hasSet, setName = GetItemLinkSetInfo(itemLink)
	return hasSet
end
 
function AutoCategory.RuleFunc.IsMonsterSet( ... )
	local fn = "ismonsterset"
	local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	local hasSet, setName, numBonuses, numEquipped, maxEquipped = GetItemLinkSetInfo(itemLink)
	if not hasSet then
		return false
	end
	if maxEquipped == 2 then
		return true
	end
	return false
end

-- item has one of the traits specified (divines, ornate, etc.)
-- returns true/false
function AutoCategory.RuleFunc.TraitType( ... )
	local fn = "traittype"
	local ac = select( '#', ... )
	if ac == 0 then
		error( string.format("error: %s(): require arguments." , fn))
	end
	
  local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
  local traitType, _ = GetItemLinkTraitInfo(itemLink)
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format("error: %s():  argument is nil." , fn))
		end
		
		if type( arg ) == "number" then
			if arg == traitType then
				return true
			end
		elseif type( arg ) == "string" then
			local v = traitMap[string.lower( arg )]
			if type(v) == "table" then
				if v[traitType] then
					return true
				end
			else
				if v and v == traitType then
					return true
				end
			end
		else
			error( string.format("error: %s(): argument is error." , fn ) )
		end
	end
	
	return false
end

-- armor belongs to one of the armor classes specified (heavy, medium, etc.)
-- returns true/false
function AutoCategory.RuleFunc.ArmorType( ... )
	local fn = "armortype"
	local ac = select( '#', ... )
	if ac == 0 then
		error( string.format("error: %s(): require arguments." , fn))
	end
	
  local armorType = GetItemArmorType(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format("error: %s():  argument is nil." , fn))
		end
		
		if type( arg ) == "number" then
			if arg == armorType then
				return true
			end
		elseif type( arg ) == "string" then 

			local v = armorTypeMap[string.lower( arg )]
			if v and v == armorType then
				return true
			end
		else
			error( string.format("error: %s(): argument is error." , fn ) )
		end
	end
	
	return false
end

-- weapon belongs to one of the weapon classes specified (one-hand, two-hand, etc.)
-- returns true/false
function AutoCategory.RuleFunc.WeaponType( ... )
	local fn = "weapontype"
	local ac = select( '#', ... )
	if ac == 0 then
		error( string.format("error: %s(): require arguments." , fn))
	end
	
  local weaponType = GetItemWeaponType(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format("error: %s():  argument is nil." , fn))
		end
		
		if type( arg ) == "number" then
			if arg == weaponType then
				return true
			end
		elseif type( arg ) == "string" then
			local v = weaponTypeMap[string.lower( arg )]
			if v and v == weaponType then
				return true
			end
		else
			error( string.format("error: %s(): argument is error." , fn ) )
		end
	end
	
	return false
end

-- see if item trait matches one of the specified traits
-- return true/false
function AutoCategory.RuleFunc.TraitString( ... )
	local fn = "traitstring"
	local ac = select( '#', ... )
	if ac == 0 then
		error( string.format("error: %s(): require arguments." , fn))
	end
	
	local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	local traitType, _ = GetItemLinkTraitInfo(itemLink)
	local traitText = string.lower(GetString("SI_ITEMTRAITTYPE", traitType))
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format("error: %s():  argument is nil." , fn))
		end
		
		local findString;
		if type( arg ) == "number" then
			findString = tostring(arg)
		elseif type( arg ) == "string" then
			findString = arg
		else
			error( string.format("error: %s(): argument is error." , fn ) )
		end
		findString = string.lower(findString)
		if string.find(traitText, findString, 1, true) then
			return true
		end 
	end
	
	return false
	
end

-- name of item matches one of the specified names
-- returns true/false
function AutoCategory.RuleFunc.ItemName( ... )
	local fn = "itemname"
	local ac = select( '#', ... )
	if ac == 0 then
		error( string.format("error: %s(): require arguments." , fn))
	end
	
	local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	--local hasSet, setName = GetItemLinkSetInfo(itemLink)
	local itemName = string.lower(GetItemLinkName(itemLink))
   
	--if not hasSet then
	--	return false
	--end
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format("error: %s():  argument is nil." , fn))
		end
		
		local findString
		if type( arg ) == "number" then
			findString = tostring(arg)
		elseif type( arg ) == "string" then
			findString = arg
		else
			error( string.format("error: %s(): argument is error." , fn ) )
		end
		--fix german language issue
		findString = string.gsub(findString , "%^.*", "")
		findString = string.lower(findString)
		if string.find(itemName, findString, 1 ,true) then
			return true
		end
	end
	
	return false
end

-- returns true/false
function AutoCategory.RuleFunc.IsTreasure( ... )
	local fn = "istreasure"
	
	local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	
	-- declared as item type = treasure
    local itemType = GetItemLinkItemType(itemLink)
	if itemType == ITEMTYPE_TREASURE then return true end
	
	-- declared as specialized item type = treasure
	local _, sptype = GetItemLinkItemType(itemLink)
	if sptype == SPECIALIZED_ITEMTYPE_TREASURE then return true end
	
	-- declared as description = treasure
	local description, itemTag = GetItemLinkItemTagInfo(itemLink, index)
	local itemName = string.lower(GetItemLinkName(itemLink))
	if itemTag == TAG_CATEGORY_TREASURE_TYPE then
		local ldesc = string.lower(description)
		if string.find(ldesc, "treasure", 1 ,true) then
			return true
		end
	end
	
	return false
end

-- Addon Integration - AlphaGear
-- returns true/false
function AutoCategory.RuleFunc.AlphaGear( ... ) 
	if not AG then
		return false
	end
	local fn = "alphagear"
	local ac = select( '#', ... )
	if ac == 0 then
		error( string.format("error: %s(): require arguments." , fn))
	end
	
	local uid = Id64ToString(GetItemUniqueId(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex))
	if not uid then return false end

	for ax = 1, ac do 
		local arg = select( ax, ... )
		local comIndex = -1
		if not arg then
			error( string.format("error: %s():  argument is nil." , fn))
		end
		if type( arg ) == "number" then
			comIndex = arg
		elseif type( arg ) == "string" then
			comIndex = tonumber(arg)
		else
			error( string.format("error: %s(): argument is error." , fn ) )
		end
		
		local nr = comIndex
		if AG.setdata[nr].Set.gear > 0 then
			for slot = 1,14 do
				if AG.setdata[AG.setdata[nr].Set.gear].Gear[slot].id == uid then
					local setName = AG.setdata[nr].Set.text[1]
					AutoCategory.AdditionCategoryName = setName	
					return true
				end
			end
		end 
	end
	
	return false 
end


-- returns true/false
function AutoCategory.RuleFunc.IsEquipping( ... )
	local fn = "isequipping"
	return AutoCategory.checkingItemBagId == BAG_WORN
end

-- returns true/false
function AutoCategory.RuleFunc.IsInBank( ... )
	return AutoCategory.checkingItemBagId == BAG_BANK or AutoCategory.checkingItemBagId == BAG_SUBSCRIBER_BANK
end

-- returns true/false
function AutoCategory.RuleFunc.IsInBackpack( ... )
	return AutoCategory.checkingItemBagId == BAG_BACKPACK or AutoCategory.checkingItemBagId == BAG_WORN
end

-- returns true/false
function AutoCategory.RuleFunc.IsInQuickslot( ... )
	local fn = "isinquickslot"
	local slotIndex = FindActionSlotMatchingItem(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
	return slotIndex ~= nil
end

-- Addon Integration - TamrielTradeCentre
-- returns number (price)
function AutoCategory.RuleFunc.GetPriceTTC( ... )
	local fn = "getpricettc"
	if TamrielTradeCentre then
		local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
		local priceInfo = TamrielTradeCentrePrice:GetPriceInfo(itemLink)
		if priceInfo then 
			local ac = select( '#', ... ) 
			if ac == 0 then
				--get suggested price
				if priceInfo.SuggestedPrice then
					return priceInfo.SuggestedPrice
				end
			else
				local arg = select( 1, ... )
				if type( arg ) == "string" then
					if arg == "average" then
						if priceInfo.Avg then
							return priceInfo.Avg
						end
					elseif arg == "suggested" then
						if priceInfo.SuggestedPrice then
							return priceInfo.SuggestedPrice
						end
					elseif arg == "both" then
						if priceInfo.SuggestedPrice then
							return priceInfo.SuggestedPrice
						elseif priceInfo.Avg then
							return priceInfo.Avg
						end
					end
				end
			end 
		end
	end
	return 0 
end

-- Addon Integration - MasterMerchant
-- returns number (price)
function AutoCategory.RuleFunc.GetPriceMM( ... )
	local fn = "getpricemm"
	if MasterMerchant then
		local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
		local mmData = MasterMerchant:itemStats(itemLink, false)
        if (mmData.avgPrice ~= nil) then
            return mmData.avgPrice
        end
	end
	return 0 
end

-- Addon Integration - SetTracker
-- returns true/false
function AutoCategory.RuleFunc.IsTracked( ... )
  local fn = "istracked"
  if SetTrack == nil then
    return false
  end
  local ac = select( '#', ... ) 
  local checkSets = {}
  for ax = 1, ac do
    
    local arg = select( ax, ... )
    if not arg then
      error( string.format("error: %s():  argument is nil." , fn))
    end
    checkSets[arg]=true
  end
  
  local iTrackIndex, sTrackName, sTrackColour, sTrackNotes = SetTrack.GetTrackingInfo(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
  if iTrackIndex >= 0 then
    if ac > 0 then
      if checkSets[sTrackName] ~= nil then
        -- true only if a specified set name is tracked on this item
        return true
      end
      -- item was tracked but not one of the specified sets, so return false
      return false
    else
      -- specific set names weren't given so true if tracked at all
      return true
    end
  end
  -- not a set tracked by SetTrack
  return false  
end

-- code donated by Tonyleila
-- returns true/false
local function IsCraftedPotion(itemLink)
    local itemType = GetItemLinkItemType(itemLink)
    return ((itemType == ITEMTYPE_POTION or itemType == ITEMTYPE_POISON) 
				and (select(24, ZO_LinkHandler_ParseLink(itemLink)) ~= "0"))
end
 
-- code donated by Tonyleila
-- returns ITEM_DISPLAY_QUALITY_*
function AutoCategory.RuleFunc.GetMaxTraits( ... )
    local fn = "getmaxtraits"
    local itemLink = GetItemLink(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
    if IsCraftedPotion(itemLink) then
        local quality = ITEM_DISPLAY_QUALITY_NORMAL
        for i = 1, GetMaxTraits() do
            local hasTraitAbility = GetItemLinkTraitOnUseAbilityInfo(itemLink, i)
 
            if hasTraitAbility then
                quality = quality + 1
            end
        end
        return quality - 1
    else
        local _, _, _, _, _, _, _, quality = GetItemInfo(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
        return quality
    end
end

-- see if any of the listed character names matches your character name
-- returns true/false
function AutoCategory.RuleFunc.CharName(...)
    local fn = "charname" 
    -- zo_strformat(SI_UNIT_NAME, GetUnitName("player")) 
    --   gives you charname@player
    -- GetUnitName("player"))
    --   gives you charname
    local pn = string.lower(GetUnitName("player"))
    local ac = select( '#', ... )
	if ac == 0 then
		error( string.format("error: %s(): require arguments." , fn))
	end
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format("error: %s():  argument is nil." , fn))
		end
		
		local findString
		if type( arg ) == "number" then
			findString = tostring(arg)
		elseif type( arg ) == "string" then
			findString = arg
		else
			error( string.format("error: %s(): argument is error." , fn ) )
		end
		--fix german language issue
		findString = string.gsub(findString , "%^.*", "")
		findString = string.lower(findString)
		if string.find(pn, findString, 1 ,true) then
			return true
		end
	end
	
	return false
end

function AutoCategory.AddRuleFunc(name, func)
    AutoCategory.Environment[name] = func
end

AutoCategory.Environment = {
	-- rule functions
	zone       = AutoCategory.RuleFunc.CurrentZone,
	
	-- -------------------------------------------
	-- types of items	
	type       = AutoCategory.RuleFunc.ItemType,
	sptype     = AutoCategory.RuleFunc.SpecializedItemType,
	equiptype  = AutoCategory.RuleFunc.EquipType,
	filtertype = AutoCategory.RuleFunc.FilterType,
	itemstyle  = AutoCategory.RuleFunc.ItemStyle,
	traittype  = AutoCategory.RuleFunc.TraitType,
	armortype  = AutoCategory.RuleFunc.ArmorType,
	weapontype = AutoCategory.RuleFunc.WeaponType,
	boundtype  = AutoCategory.RuleFunc.BoundType,
	islockpick = AutoCategory.RuleFunc.IsLockpick,
	
	-- -------------------------------------------
	-- properties of items
	
	iscompaniononly = AutoCategory.RuleFunc.IsCompanionOnly,

	isnew          = AutoCategory.RuleFunc.IsNew,
	islocked       = AutoCategory.RuleFunc.IsLocked,
	isbound        = AutoCategory.RuleFunc.IsBound,
    ischarbound    = AutoCategory.RuleFunc.IsCharBound,
	isunbound        = AutoCategory.RuleFunc.IsUnbound,
	isboptradeable = AutoCategory.RuleFunc.IsBoPTradeable,
	
	isunknowncollectible = AutoCategory.RuleFunc.IsUnknownCollectible,
	iscollected    = AutoCategory.RuleFunc.IsCollected,
	isnotcollected = AutoCategory.RuleFunc.IsNotCollected, 
	
	isstolen       = AutoCategory.RuleFunc.IsStolen,	
	iscrafted      = AutoCategory.RuleFunc.IsCrafted,
	islearnable    = AutoCategory.RuleFunc.IsLearnable,
	
	isset          = AutoCategory.RuleFunc.IsSet,
	ismonsterset   = AutoCategory.RuleFunc.IsMonsterSet,
	set            = AutoCategory.RuleFunc.SetName,
		
	traitstring    = AutoCategory.RuleFunc.TraitString,

	isequipping    = AutoCategory.RuleFunc.IsEquipping,
	
	isinbank       = AutoCategory.RuleFunc.IsInBank,
	isinbackpack   = AutoCategory.RuleFunc.IsInBackpack,

	isinquickslot  = AutoCategory.RuleFunc.IsInQuickslot,
	 
	keepresearch   = AutoCategory.RuleFunc.KeepForResearch,
	isreconstructed = AutoCategory.RuleFunc.isReconstructed,
	istransmuted   = AutoCategory.RuleFunc.isTransmuted,
	
	istreasure     = AutoCategory.RuleFunc.IsTreasure,
	isinzone       = AutoCategory.RuleFunc.IsInCurrentZone,

	-- -------------------------------------------
	-- values of items (returns values rather than true/false)
	quality      = AutoCategory.RuleFunc.Quality,
	getquality   = AutoCategory.RuleFunc.GetQuality,
	
	level        = AutoCategory.RuleFunc.Level,
	cp           = AutoCategory.RuleFunc.CPLevel,
	charlevel    = AutoCategory.RuleFunc.CharLevel,
	charcp       = AutoCategory.RuleFunc.CharCP,
    charname     = AutoCategory.RuleFunc.CharName,

	sellprice    = AutoCategory.RuleFunc.SellPrice,
	stacksize    = AutoCategory.RuleFunc.StackSize,

	itemname     = AutoCategory.RuleFunc.ItemName,

    -- Potion/Poison Traits
    getmaxtraits = AutoCategory.RuleFunc.GetMaxTraits,

	-- -------------------------------------------
	-- special sort gear into sets functionality
	autoset      = AutoCategory.RuleFunc.AutoSetName,	
    
	-- -------------------------------------------
	-- Addon Integrations (old)
	-- Alpha Gear
	alphagear    = AutoCategory.RuleFunc.AlphaGear,
	
	-- Tamriel Trade Centre
	getpricettc  = AutoCategory.RuleFunc.GetPriceTTC,
	
	-- Master Merchant
	getpricemm   = AutoCategory.RuleFunc.GetPriceMM,
	
	-- Set Tracker
	istracked    = AutoCategory.RuleFunc.IsTracked,

}
