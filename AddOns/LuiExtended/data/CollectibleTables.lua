--[[
    LuiExtended
    License: The MIT License (MIT)
--]]

-- CollectibleTables namespace
LUIE.Data.CollectibleTables = {}

local CollectibleTables =
{
    -- Banker
    Banker = {
        [267] = "Tythis",
        [6376] = "Ezabi",
        [8994] = "Crow",
        [9743] = "Factotum",
        [11097] = "Pyroclast",
    },

    -- Merchants
    Merchants = {
        [301] = "Nuzimeh",
        [6378] = "Fezez",
        [8995] = "Crow",
        [9744] = "Factotum",
        [11059] = "Hoarfrost",
    },

    -- Armory Assistants
    Armory = {
        [9745] = "Ghrasharog",
        [10618] = "Zhuqoth",
    },

    -- Deconstruction
    Decon = {
        [10184] = "Giladil",
        [10617] = "Aderene",
    },

    -- Fence
    Fence = {
        [300] = "Pirharri",
    },

    -- Companions
    -- LUI will generate SlashCommands from the lowercase names e.g. Bastian becomes /bastian.
    Companions = {
        [9245] = "Bastian",
        [9353] = "Mirri",
        [9911] = "Ember",
        [9912] = "Isobel",
        [11113] = "Sharp",
        [11114] = "Azandar",
    },
}

CollectibleTables.All = {}

for name, table in pairs(CollectibleTables) do
    if type(table) == "table" and tostring(name) ~= "All" then
        for k, v in pairs(table) do
            CollectibleTables.All[k] = v
        end
    end
end

LUIE.Data.CollectibleTables = CollectibleTables
