--[[
    LuiExtended
    License: The MIT License (MIT)
--]]

-- Quests namespace
LUIE.Data.PetNames = {}
local PetNames = LUIE.Data.PetNames

-- Pet Names (Sorcerer)
PetNames.Sorcerer = {
    [GetString(SI_LUIE_PET_NAME_UNSTABLE_FAMILIAR)] = true,
    [GetString(SI_LUIE_PET_NAME_CLANNFEAR)] = true,
    [GetString(SI_LUIE_PET_NAME_VOLATILE_FAMILIAR)] = true,
    [GetString(SI_LUIE_PET_NAME_WINGED_TWILIGHT)] = true,
    [GetString(SI_LUIE_PET_NAME_TWILIGHT_TORMENTOR)] = true,
    [GetString(SI_LUIE_PET_NAME_TWILIGT_MATRIARCH)] = true,
    [GetString(SI_LUIE_PET_NAME_SUMMON_STORM_ATRONACH)] = true,
    [GetString(SI_LUIE_PET_NAME_GREATER_STORM_ATRONACH)] = true,
    [GetString(SI_LUIE_PET_NAME_CHARGED_ATRONACH)] = true,
}

-- Pet Names (Warden)
PetNames.Warden = {
    [GetString(SI_LUIE_PET_NAME_FERAL_GUARDIAN)] = true,
    [GetString(SI_LUIE_PET_NAME_ETERNAL_GUARDIAN )] = true,
    [GetString(SI_LUIE_PET_NAME_WILD_GUARDIAN)] = true,
}

-- Pet Names (Necromancer)
PetNames.Necromancer = {
    [GetString(SI_LUIE_PET_NAME_SKELETAL_MAGE)] = true,
    [GetString(SI_LUIE_PET_NAME_SKELETAL_ARCHER)] = true,
    [GetString(SI_LUIE_PET_NAME_SKELETAL_ARCANIST)] = true,
    [GetString(SI_LUIE_PET_NAME_SPIRIT_MENDER)] = true,
    [GetString(SI_LUIE_PET_NAME_SPIRIT_GUARDIAN)] = true,
    [GetString(SI_LUIE_PET_NAME_INTENSIVE)] = true,
}

-- Pet Names (Sets)
PetNames.Sets = {
    [GetString(SI_LUIE_PET_NAME_ENGINE_GUARDIAN)] = true,
    [GetString(SI_LUIE_PET_NAME_MAW_OF_THE_INFERNAL)] = true,
    [GetString(SI_LUIE_PET_NAME_SHADOWREND)] = true,
    [GetString(SI_LUIE_PET_NAME_SENTINEL_OF_RKUGAMZ)] = true,
    [GetString(SI_LUIE_PET_NAME_MORKULDIN_SWORD)] = true,
}

-- Pet Names (Assistants)
PetNames.Assistants = {
    [GetString(SI_LUIE_PET_NAME_ASSISTANT_EZABI)] = true,
    [GetString(SI_LUIE_PET_NAME_ASSISTANT_FEZEZ)] = true,
    [GetString(SI_LUIE_PET_NAME_ASSISTANT_PIRHARRI)] = true,
    [GetString(SI_LUIE_PET_NAME_ASSISTANT_NUZHIMEH)] = true,
    [GetString(SI_LUIE_PET_NAME_ASSISTANT_TYTHIS)] = true,
}
