AutoCategorySavedVars =
{
    ["Default"] = 
    {
        ["@Motiv_Impact"] = 
        {
            ["8796093067191337"] = 
            {
                ["$LastCharacterName"] = "scthree",
                ["NA Megaserver"] = 
                {
                    ["collapses"] = 
                    {
                        [1] = 
                        {
                        },
                        [2] = 
                        {
                        },
                        [3] = 
                        {
                        },
                        [4] = 
                        {
                        },
                        [5] = 
                        {
                        },
                        [6] = 
                        {
                        },
                    },
                    ["version"] = 1.1000000000,
                    ["rules"] = 
                    {
                        [1] = 
                        {
                            ["rule"] = "type(\"armor\") and not equiptype(\"neck\",\"ring\")",
                            ["name"] = "Armor",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [2] = 
                        {
                            ["rule"] = "boundtype(\"on_equip\") and not isbound() and not keepresearch()",
                            ["name"] = "BoE",
                            ["description"] = "BoE gears for selling",
                            ["tag"] = "Gears",
                        },
                        [3] = 
                        {
                            ["rule"] = "isboptradeable()",
                            ["name"] = "BoP Tradeable",
                            ["description"] = "Gears are tradeable within a limited time",
                            ["tag"] = "Gears",
                        },
                        [4] = 
                        {
                            ["rule"] = "traitstring(\"intricate\")",
                            ["name"] = "Deconstruct",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [5] = 
                        {
                            ["rule"] = "isequipping()",
                            ["name"] = "Equipping",
                            ["description"] = "Currently equipping gears (Gamepad Only)",
                            ["tag"] = "Gears",
                        },
                        [6] = 
                        {
                            ["rule"] = "level() > 1 and cp() < 160 and type(\"armor\", \"weapon\")",
                            ["name"] = "Low Level",
                            ["description"] = "Gears below cp 160",
                            ["tag"] = "Gears",
                        },
                        [7] = 
                        {
                            ["rule"] = "equiptype(\"neck\")",
                            ["name"] = "Necklace",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [8] = 
                        {
                            ["rule"] = "keepresearch()",
                            ["name"] = "Researchable",
                            ["description"] = "Gears that keep for research purpose, only keep the low quality, low level one.",
                            ["tag"] = "Gears",
                        },
                        [9] = 
                        {
                            ["rule"] = "equiptype(\"ring\")",
                            ["name"] = "Ring",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [10] = 
                        {
                            ["rule"] = "autoset()",
                            ["name"] = "Set",
                            ["description"] = "Auto categorize set gears",
                            ["tag"] = "Gears",
                        },
                        [11] = 
                        {
                            ["rule"] = "type(\"weapon\")",
                            ["name"] = "Weapon",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [12] = 
                        {
                            ["rule"] = "type(\"food\", \"drink\", \"potion\")",
                            ["name"] = "Consumables",
                            ["description"] = "Food, Drink, Potion",
                            ["tag"] = "General Items",
                        },
                        [13] = 
                        {
                            ["rule"] = "type(\"container\")",
                            ["name"] = "Container",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [14] = 
                        {
                            ["rule"] = "filtertype(\"furnishing\")",
                            ["name"] = "Furnishing",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [15] = 
                        {
                            ["rule"] = "type(\"soul_gem\", \"glyph_armor\", \"glyph_jewelry\", \"glyph_weapon\")",
                            ["name"] = "Glyphs & Gems",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [16] = 
                        {
                            ["rule"] = "isnew()",
                            ["name"] = "New",
                            ["description"] = "Items that are received recently",
                            ["tag"] = "General Items",
                        },
                        [17] = 
                        {
                            ["rule"] = "type(\"poison\")",
                            ["name"] = "Poison",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [18] = 
                        {
                            ["rule"] = "isinquickslot()",
                            ["name"] = "Quickslots",
                            ["description"] = "Equipped in quickslots",
                            ["tag"] = "General Items",
                        },
                        [19] = 
                        {
                            ["rule"] = "type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\")",
                            ["name"] = "Recipes & Motifs",
                            ["description"] = "All recipes, motifs and recipe fragments.",
                            ["tag"] = "General Items",
                        },
                        [20] = 
                        {
                            ["rule"] = "traitstring(\"ornate\") or sptype(\"collectible_monster_trophy\") or type(\"trash\")",
                            ["name"] = "Selling",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [21] = 
                        {
                            ["rule"] = "isstolen()",
                            ["name"] = "Stolen",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [22] = 
                        {
                            ["rule"] = "sptype(\"trophy_survey_report\", \"trophy_treasure_map\")",
                            ["name"] = "Maps & Surveys",
                            ["description"] = "Treasure maps and survey reports",
                            ["tag"] = "General Items",
                        },
                        [23] = 
                        {
                            ["rule"] = "filtertype(\"alchemy\")",
                            ["name"] = "Alchemy",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [24] = 
                        {
                            ["rule"] = "filtertype(\"blacksmithing\")",
                            ["name"] = "Blacksmithing",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [25] = 
                        {
                            ["rule"] = "filtertype(\"clothing\")",
                            ["name"] = "Clothing",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [26] = 
                        {
                            ["rule"] = "filtertype(\"enchanting\")",
                            ["name"] = "Enchanting",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [27] = 
                        {
                            ["rule"] = "filtertype(\"jewelrycrafting\")",
                            ["name"] = "Jewelry Crafting",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [28] = 
                        {
                            ["rule"] = "filtertype(\"provisioning\")",
                            ["name"] = "Provisioning",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [29] = 
                        {
                            ["rule"] = "filtertype(\"trait_items\", \"style_materials\")",
                            ["name"] = "Trait/Style Gems",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [30] = 
                        {
                            ["rule"] = "filtertype(\"woodworking\")",
                            ["name"] = "Woodworking",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                    },
                    ["accountWide"] = true,
                    ["general"] = 
                    {
                        ["SHOW_CATEGORY_ITEM_COUNT"] = true,
                        ["SHOW_CATEGORY_COLLAPSE_ICON"] = true,
                        ["SAVE_CATEGORY_COLLAPSE_STATUS"] = false,
                        ["SHOW_MESSAGE_WHEN_TOGGLE"] = false,
                        ["SHOW_CATEGORY_SET_TITLE"] = true,
                    },
                    ["appearance"] = 
                    {
                        ["CATEGORY_OTHER_TEXT"] = "Others",
                        ["CATEGORY_FONT_SIZE"] = 18,
                        ["CATEGORY_FONT_STYLE"] = "soft-shadow-thin",
                        ["CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 1,
                            [2] = 1,
                            [3] = 1,
                        },
                        ["CATEGORY_FONT_NAME"] = "Univers 67",
                        ["CATEGORY_HEADER_HEIGHT"] = 52,
                        ["CATEGORY_FONT_ALIGNMENT"] = 1,
                    },
                    ["bags"] = 
                    {
                        [1] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [2] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [3] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [4] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [2] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [3] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                                [4] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [5] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [6] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [7] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                            },
                        },
                        [5] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [6] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                    },
                },
            },
            ["8796093067214547"] = 
            {
                ["$LastCharacterName"] = "scelara",
                ["NA Megaserver"] = 
                {
                    ["collapses"] = 
                    {
                        [1] = 
                        {
                        },
                        [2] = 
                        {
                        },
                        [3] = 
                        {
                        },
                        [4] = 
                        {
                        },
                        [5] = 
                        {
                        },
                        [6] = 
                        {
                        },
                    },
                    ["version"] = 1.1000000000,
                    ["rules"] = 
                    {
                        [1] = 
                        {
                            ["rule"] = "type(\"armor\") and not equiptype(\"neck\",\"ring\")",
                            ["name"] = "Armor",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [2] = 
                        {
                            ["rule"] = "boundtype(\"on_equip\") and not isbound() and not keepresearch()",
                            ["name"] = "BoE",
                            ["description"] = "BoE gears for selling",
                            ["tag"] = "Gears",
                        },
                        [3] = 
                        {
                            ["rule"] = "isboptradeable()",
                            ["name"] = "BoP Tradeable",
                            ["description"] = "Gears are tradeable within a limited time",
                            ["tag"] = "Gears",
                        },
                        [4] = 
                        {
                            ["rule"] = "traitstring(\"intricate\")",
                            ["name"] = "Deconstruct",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [5] = 
                        {
                            ["rule"] = "isequipping()",
                            ["name"] = "Equipping",
                            ["description"] = "Currently equipping gears (Gamepad Only)",
                            ["tag"] = "Gears",
                        },
                        [6] = 
                        {
                            ["rule"] = "level() > 1 and cp() < 160 and type(\"armor\", \"weapon\")",
                            ["name"] = "Low Level",
                            ["description"] = "Gears below cp 160",
                            ["tag"] = "Gears",
                        },
                        [7] = 
                        {
                            ["rule"] = "equiptype(\"neck\")",
                            ["name"] = "Necklace",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [8] = 
                        {
                            ["rule"] = "keepresearch()",
                            ["name"] = "Researchable",
                            ["description"] = "Gears that keep for research purpose, only keep the low quality, low level one.",
                            ["tag"] = "Gears",
                        },
                        [9] = 
                        {
                            ["rule"] = "equiptype(\"ring\")",
                            ["name"] = "Ring",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [10] = 
                        {
                            ["rule"] = "autoset()",
                            ["name"] = "Set",
                            ["description"] = "Auto categorize set gears",
                            ["tag"] = "Gears",
                        },
                        [11] = 
                        {
                            ["rule"] = "type(\"weapon\")",
                            ["name"] = "Weapon",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [12] = 
                        {
                            ["rule"] = "type(\"food\", \"drink\", \"potion\")",
                            ["name"] = "Consumables",
                            ["description"] = "Food, Drink, Potion",
                            ["tag"] = "General Items",
                        },
                        [13] = 
                        {
                            ["rule"] = "type(\"container\")",
                            ["name"] = "Container",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [14] = 
                        {
                            ["rule"] = "filtertype(\"furnishing\")",
                            ["name"] = "Furnishing",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [15] = 
                        {
                            ["rule"] = "type(\"soul_gem\", \"glyph_armor\", \"glyph_jewelry\", \"glyph_weapon\")",
                            ["name"] = "Glyphs & Gems",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [16] = 
                        {
                            ["rule"] = "isnew()",
                            ["name"] = "New",
                            ["description"] = "Items that are received recently",
                            ["tag"] = "General Items",
                        },
                        [17] = 
                        {
                            ["rule"] = "type(\"poison\")",
                            ["name"] = "Poison",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [18] = 
                        {
                            ["rule"] = "isinquickslot()",
                            ["name"] = "Quickslots",
                            ["description"] = "Equipped in quickslots",
                            ["tag"] = "General Items",
                        },
                        [19] = 
                        {
                            ["rule"] = "type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\")",
                            ["name"] = "Recipes & Motifs",
                            ["description"] = "All recipes, motifs and recipe fragments.",
                            ["tag"] = "General Items",
                        },
                        [20] = 
                        {
                            ["rule"] = "traitstring(\"ornate\") or sptype(\"collectible_monster_trophy\") or type(\"trash\")",
                            ["name"] = "Selling",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [21] = 
                        {
                            ["rule"] = "isstolen()",
                            ["name"] = "Stolen",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [22] = 
                        {
                            ["rule"] = "sptype(\"trophy_survey_report\", \"trophy_treasure_map\")",
                            ["name"] = "Maps & Surveys",
                            ["description"] = "Treasure maps and survey reports",
                            ["tag"] = "General Items",
                        },
                        [23] = 
                        {
                            ["rule"] = "filtertype(\"alchemy\")",
                            ["name"] = "Alchemy",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [24] = 
                        {
                            ["rule"] = "filtertype(\"blacksmithing\")",
                            ["name"] = "Blacksmithing",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [25] = 
                        {
                            ["rule"] = "filtertype(\"clothing\")",
                            ["name"] = "Clothing",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [26] = 
                        {
                            ["rule"] = "filtertype(\"enchanting\")",
                            ["name"] = "Enchanting",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [27] = 
                        {
                            ["rule"] = "filtertype(\"jewelrycrafting\")",
                            ["name"] = "Jewelry Crafting",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [28] = 
                        {
                            ["rule"] = "filtertype(\"provisioning\")",
                            ["name"] = "Provisioning",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [29] = 
                        {
                            ["rule"] = "filtertype(\"trait_items\", \"style_materials\")",
                            ["name"] = "Trait/Style Gems",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [30] = 
                        {
                            ["rule"] = "filtertype(\"woodworking\")",
                            ["name"] = "Woodworking",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                    },
                    ["accountWide"] = true,
                    ["general"] = 
                    {
                        ["SHOW_CATEGORY_ITEM_COUNT"] = true,
                        ["SHOW_CATEGORY_COLLAPSE_ICON"] = true,
                        ["SAVE_CATEGORY_COLLAPSE_STATUS"] = false,
                        ["SHOW_MESSAGE_WHEN_TOGGLE"] = false,
                        ["SHOW_CATEGORY_SET_TITLE"] = true,
                    },
                    ["appearance"] = 
                    {
                        ["CATEGORY_OTHER_TEXT"] = "Others",
                        ["CATEGORY_FONT_SIZE"] = 18,
                        ["CATEGORY_FONT_STYLE"] = "soft-shadow-thin",
                        ["CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 1,
                            [2] = 1,
                            [3] = 1,
                        },
                        ["CATEGORY_FONT_NAME"] = "Univers 67",
                        ["CATEGORY_HEADER_HEIGHT"] = 52,
                        ["CATEGORY_FONT_ALIGNMENT"] = 1,
                    },
                    ["bags"] = 
                    {
                        [1] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [2] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [3] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [4] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [2] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [3] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                                [4] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [5] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [6] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [7] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                            },
                        },
                        [5] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [6] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                    },
                },
            },
            ["$AccountWide"] = 
            {
                ["NA Megaserver"] = 
                {
                    ["collapses"] = 
                    {
                        [1] = 
                        {
                            ["Set (Armor of the Trainee)"] = false,
                            ["Set (Spelunker)"] = false,
                            ["Set (Eternal Vigor)"] = false,
                            ["Set (Knightmare)"] = false,
                            ["Clothing"] = false,
                            ["Set (Shroud of the Lich)"] = false,
                            ["Set (Soulshine)"] = false,
                            ["Set (Agility)"] = false,
                            ["Quickslots"] = true,
                            ["Set (Combat Physician)"] = false,
                            ["Set (Sergeant's Mail)"] = false,
                            ["Gear (Blue)"] = false,
                            ["Set (Prayer Shawl)"] = false,
                            ["Set (Spinner's Garments)"] = true,
                            ["Set (Tormentor)"] = true,
                            ["Set (Twin Sisters)"] = false,
                            ["Set (Senche's Bite)"] = false,
                            ["Set (Ebon Armory)"] = true,
                            ["Set (Duneripper's Scales)"] = false,
                            ["Deconstruct"] = false,
                            ["Set (Armor of the Veiled Heritance)"] = false,
                            ["Set (Treasure Hunter)"] = false,
                            ["Maps & Surveys"] = true,
                            ["Set (Crusader)"] = false,
                            ["Set (Netch's Touch)"] = false,
                            ["Set (Jailbreaker)"] = true,
                            ["Set (Overwhelming Surge)"] = false,
                            ["Alchemy"] = false,
                            ["Set (Venomous Smite)"] = false,
                            ["Set (Plague Doctor)"] = false,
                            ["Weapons/Armor"] = false,
                            ["Set (Queen's Elegance)"] = false,
                            ["Weapon"] = true,
                            ["Set (Broken Soul)"] = false,
                            ["Poison"] = true,
                            ["Trait/Style Gems"] = true,
                            ["Set (Endurance)"] = false,
                            ["Set (Sanctuary)"] = false,
                            ["Weapon/Armor (blue)"] = false,
                            ["Ring"] = false,
                            ["Glyphs & Gems"] = true,
                            ["Necklace"] = false,
                            ["Researchable"] = true,
                            ["Set (Dreamer's Mantle)"] = false,
                            ["Set (Salvation)"] = true,
                            ["Provisioning"] = false,
                            ["Set (Skooma Smuggler)"] = false,
                            ["Set (Thunderbug's Carapace)"] = false,
                            ["Set (Leviathan)"] = false,
                            ["Set (Nikulas' Heavy Armor)"] = false,
                            ["Set (Barkskin)"] = false,
                            ["Set (Shadowrend)"] = true,
                            ["Weapon/Armor"] = false,
                            ["Armor"] = true,
                            ["Woodworking"] = true,
                        },
                        [2] = 
                        {
                            ["Trait/Style Gems"] = true,
                            ["Provisioning"] = true,
                        },
                        [3] = 
                        {
                            ["Container"] = false,
                            ["Others"] = false,
                            ["Clothing"] = false,
                            ["Enchanting"] = false,
                            ["Glyphs & Gems"] = false,
                            ["Quickslots"] = false,
                            ["Decon/Research"] = false,
                            ["Weapons/Armor (Green)"] = false,
                            ["Low Level"] = false,
                            ["Provisioning"] = false,
                            ["Trait/Style Gems"] = false,
                            ["Consumables"] = false,
                            ["Blacksmithing"] = false,
                            ["Woodworking"] = false,
                            ["Alchemy"] = false,
                            ["BoE"] = false,
                            ["Selling"] = false,
                            ["Armor"] = false,
                            ["Furnishing"] = false,
                        },
                        [4] = 
                        {
                        },
                        [5] = 
                        {
                            ["Set (Prayer Shawl)"] = false,
                            ["Set (Spelunker)"] = false,
                            ["Set (Knightmare)"] = false,
                            ["Set (Shroud of the Lich)"] = false,
                            ["Set (Agility)"] = false,
                            ["Set (Durok's Bane)"] = false,
                            ["Set (Sergeant's Mail)"] = false,
                            ["Set (Jolting Arms)"] = false,
                            ["Set (Tormentor)"] = true,
                            ["Set (Twin Sisters)"] = false,
                            ["Set (Senche's Bite)"] = false,
                            ["Set (Swarm Mother)"] = true,
                            ["Set (Duneripper's Scales)"] = false,
                            ["Set (Armor of the Veiled Heritance)"] = false,
                            ["Set (Treasure Hunter)"] = false,
                            ["Set (Jailbreaker)"] = false,
                            ["Set (Netch's Touch)"] = false,
                            ["Set (Overwhelming Surge)"] = false,
                            ["Set (Venomous Smite)"] = false,
                            ["Set (Plague Doctor)"] = false,
                            ["Set (Endurance)"] = false,
                            ["Set (Sanctuary)"] = false,
                            ["Set (Mad Tinkerer)"] = false,
                            ["Set (Ebon Armory)"] = false,
                            ["Set (Defiler)"] = false,
                            ["Set (Skooma Smuggler)"] = false,
                            ["Set (Maw of the Infernal)"] = false,
                            ["Set (Spider Cultist Cowl)"] = false,
                            ["Set (Orgnum's Scales)"] = false,
                            ["Set (Thunderbug's Carapace)"] = false,
                            ["Set (Leviathan)"] = false,
                            ["Weapon/Armor"] = false,
                            ["Set (Barkskin)"] = false,
                            ["Set (Shadowrend)"] = false,
                            ["Set (Armor of the Trainee)"] = false,
                            ["Set (Combat Physician)"] = false,
                            ["Set (Soulshine)"] = false,
                        },
                        [6] = 
                        {
                            ["Set (Armor of the Trainee)"] = false,
                            ["Set (Overwhelming Surge)"] = false,
                            ["Set (Undaunted Bastion)"] = false,
                            ["Set (Venomous Smite)"] = false,
                            ["Set (Plague Doctor)"] = false,
                            ["Blacksmithing"] = false,
                            ["Set (Agility)"] = false,
                            ["Trait/Style Gems"] = false,
                            ["Set (Endurance)"] = false,
                            ["Set (Jolting Arms)"] = false,
                            ["Low Level"] = false,
                            ["Set (Twin Sisters)"] = false,
                            ["Set (Thunderbug's Carapace)"] = false,
                            ["Set (Hatchling's Shell)"] = false,
                            ["Set (Fiord's Legacy)"] = false,
                            ["Set (Coward's Gear)"] = false,
                            ["Set (Mother's Sorrow)"] = false,
                            ["Set (Willpower)"] = false,
                        },
                    },
                    ["rules"] = 
                    {
                        [1] = 
                        {
                            ["name"] = "Alchemy",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"alchemy\")",
                            ["tag"] = "Materials",
                        },
                        [2] = 
                        {
                            ["name"] = "Armor",
                            ["description"] = "",
                            ["rule"] = "type(\"armor\") and not equiptype(\"neck\",\"ring\")",
                            ["tag"] = "Gears",
                        },
                        [3] = 
                        {
                            ["name"] = "Blacksmithing",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"blacksmithing\")",
                            ["tag"] = "Materials",
                        },
                        [4] = 
                        {
                            ["name"] = "BoE",
                            ["description"] = "BoE gears for selling",
                            ["rule"] = "boundtype(\"on_equip\") and not isbound() and not keepresearch()",
                            ["tag"] = "Gears",
                        },
                        [5] = 
                        {
                            ["name"] = "BoP Tradeable",
                            ["description"] = "Gears are tradeable within a limited time",
                            ["rule"] = "isboptradeable() and not islocked()",
                            ["tag"] = "Gears",
                        },
                        [6] = 
                        {
                            ["name"] = "Clothing",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"clothing\")",
                            ["tag"] = "Materials",
                        },
                        [7] = 
                        {
                            ["name"] = "Consumables",
                            ["description"] = "Food, Drink, Potion",
                            ["rule"] = "type(\"food\", \"drink\", \"potion\") or type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\", \"trophy_survey_report\", \"trophy_treasure_map\") and not isinquickslot() and not type(\"container\")",
                            ["tag"] = "General Items",
                        },
                        [8] = 
                        {
                            ["name"] = "Container",
                            ["description"] = "",
                            ["rule"] = "type(\"container\")",
                            ["tag"] = "General Items",
                        },
                        [9] = 
                        {
                            ["name"] = "Crafting",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"alchemy\", \"blacksmithing\", \"clothing\", \"enchanting\", \"jewelrycrafting\", \"provisioning\", \"woodworking\", \"trait_items\", \"style_materials\")",
                            ["tag"] = "Materials",
                        },
                        [10] = 
                        {
                            ["name"] = "Decon/Research",
                            ["description"] = "",
                            ["rule"] = "traitstring(\"intricate\") or keepresearch() and not islocked()",
                            ["tag"] = "Gears",
                        },
                        [11] = 
                        {
                            ["name"] = "Enchanting",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"enchanting\")",
                            ["tag"] = "Materials",
                        },
                        [12] = 
                        {
                            ["name"] = "Equipping",
                            ["description"] = "Currently equipping gears (Gamepad Only)",
                            ["rule"] = "isequipping()",
                            ["tag"] = "Gears",
                        },
                        [13] = 
                        {
                            ["name"] = "Furnishing",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"furnishing\")",
                            ["tag"] = "General Items",
                        },
                        [14] = 
                        {
                            ["name"] = "Glyphs",
                            ["description"] = "",
                            ["rule"] = "type(\"glyph_armor\", \"glyph_weapon\", \"glyph_jewelry\")",
                            ["tag"] = "Gears",
                        },
                        [15] = 
                        {
                            ["name"] = "Glyphs & Gems",
                            ["description"] = "",
                            ["rule"] = "type(\"soul_gem\", \"glyph_armor\", \"glyph_jewelry\", \"glyph_weapon\")",
                            ["tag"] = "General Items",
                        },
                        [16] = 
                        {
                            ["name"] = "Jewelry",
                            ["description"] = "",
                            ["rule"] = "equiptype(\"neck\", \"ring\") and not autoset()",
                            ["tag"] = "Gears",
                        },
                        [17] = 
                        {
                            ["name"] = "Jewelry Crafting",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"jewelrycrafting\")",
                            ["tag"] = "Materials",
                        },
                        [18] = 
                        {
                            ["name"] = "Low Level",
                            ["description"] = "Gears below cp 160",
                            ["rule"] = "level() > 1 and cp() < 160 and type(\"armor\", \"weapon\")",
                            ["tag"] = "Gears",
                        },
                        [19] = 
                        {
                            ["name"] = "Maps & Surveys",
                            ["description"] = "Treasure maps and survey reports",
                            ["rule"] = "sptype(\"trophy_survey_report\", \"trophy_treasure_map\")",
                            ["tag"] = "General Items",
                        },
                        [20] = 
                        {
                            ["name"] = "New",
                            ["description"] = "Items that are received recently",
                            ["rule"] = "isnew()",
                            ["tag"] = "General Items",
                        },
                        [21] = 
                        {
                            ["name"] = "Not Collected",
                            ["description"] = "",
                            ["rule"] = "not isbound() and not iscollected() and isset()",
                            ["tag"] = "Gears",
                        },
                        [22] = 
                        {
                            ["name"] = "Poison",
                            ["description"] = "",
                            ["rule"] = "type(\"poison\")",
                            ["tag"] = "General Items",
                        },
                        [23] = 
                        {
                            ["name"] = "Provisioning",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"provisioning\")",
                            ["tag"] = "Materials",
                        },
                        [24] = 
                        {
                            ["name"] = "Quickslots",
                            ["description"] = "Equipped in quickslots",
                            ["rule"] = "isinquickslot()",
                            ["tag"] = "General Items",
                        },
                        [25] = 
                        {
                            ["name"] = "Recipes & Motifs",
                            ["description"] = "All recipes, motifs and recipe fragments.",
                            ["rule"] = "type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\")",
                            ["tag"] = "General Items",
                        },
                        [26] = 
                        {
                            ["name"] = "Ring",
                            ["description"] = "",
                            ["rule"] = "equiptype(\"ring\")",
                            ["tag"] = "Gears",
                        },
                        [27] = 
                        {
                            ["name"] = "Selling",
                            ["description"] = "",
                            ["rule"] = "traitstring(\"ornate\") or sptype(\"collectible_monster_trophy\") or type(\"trash\") or type(\"poison\", \"soul_gem\") or isstolen()",
                            ["tag"] = "General Items",
                        },
                        [28] = 
                        {
                            ["name"] = "Set",
                            ["description"] = "Auto categorize set gears",
                            ["rule"] = "autoset()",
                            ["tag"] = "Gears",
                        },
                        [29] = 
                        {
                            ["name"] = "Stolen",
                            ["description"] = "",
                            ["rule"] = "isstolen()",
                            ["tag"] = "General Items",
                        },
                        [30] = 
                        {
                            ["name"] = "Trait/Style Gems",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"trait_items\", \"style_materials\")",
                            ["tag"] = "Materials",
                        },
                        [31] = 
                        {
                            ["name"] = "Weapons/Armor",
                            ["description"] = "",
                            ["rule"] = "type(\"weapon\", \"armor\") and not autoset()",
                            ["tag"] = "Gears",
                        },
                        [32] = 
                        {
                            ["name"] = "Weapons/Armor (Blue)",
                            ["description"] = "",
                            ["rule"] = "type(\"weapon\", \"armor\") and not autoset() and quality(\"blue\")",
                            ["tag"] = "Gears",
                        },
                        [33] = 
                        {
                            ["name"] = "Weapons/Armor (Gold)",
                            ["description"] = "",
                            ["rule"] = "type(\"weapon\", \"armor\") and not autoset() and quality(\"gold\")",
                            ["tag"] = "Gears",
                        },
                        [34] = 
                        {
                            ["name"] = "Weapons/Armor (Green)",
                            ["description"] = "",
                            ["rule"] = "type(\"weapon\", \"armor\") and not autoset() and quality(\"green\")",
                            ["tag"] = "Gears",
                        },
                        [35] = 
                        {
                            ["name"] = "Weapons/Armor (Purple)",
                            ["description"] = "",
                            ["rule"] = "type(\"weapon\", \"armor\") and not autoset() and quality(\"purple\")",
                            ["tag"] = "Gears",
                        },
                        [36] = 
                        {
                            ["name"] = "Weapons/Armor (White)",
                            ["description"] = "",
                            ["rule"] = "type(\"weapon\", \"armor\") and not autoset() and quality(\"normal\")",
                            ["tag"] = "Gears",
                        },
                        [37] = 
                        {
                            ["name"] = "Woodworking",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"woodworking\")",
                            ["tag"] = "Materials",
                        },
                    },
                    ["version"] = 1.1000000000,
                    ["general"] = 
                    {
                        ["SHOW_CATEGORY_ITEM_COUNT"] = true,
                        ["SHOW_CATEGORY_COLLAPSE_ICON"] = true,
                        ["SAVE_CATEGORY_COLLAPSE_STATUS"] = true,
                        ["SHOW_MESSAGE_WHEN_TOGGLE"] = false,
                        ["SHOW_CATEGORY_SET_TITLE"] = true,
                    },
                    ["appearance"] = 
                    {
                        ["HIDDEN_CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 125,
                            [2] = 125,
                            [3] = 125,
                        },
                        ["CATEGORY_OTHER_TEXT"] = "Others",
                        ["CATEGORY_FONT_SIZE"] = 15,
                        ["CATEGORY_FONT_STYLE"] = "soft-shadow-thin",
                        ["CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 1,
                            [2] = 1,
                            [3] = 1,
                        },
                        ["CATEGORY_FONT_NAME"] = "Univers 67",
                        ["CATEGORY_HEADER_HEIGHT"] = 20,
                        ["CATEGORY_FONT_ALIGNMENT"] = 0,
                    },
                    ["bags"] = 
                    {
                        [1] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "New",
                                },
                                [2] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Not Collected",
                                },
                                [3] = 
                                {
                                    ["priority"] = 99,
                                    ["name"] = "BoP Tradeable",
                                },
                                [4] = 
                                {
                                    ["priority"] = 95,
                                    ["name"] = "Container",
                                },
                                [5] = 
                                {
                                    ["priority"] = 90,
                                    ["name"] = "BoE",
                                },
                                [6] = 
                                {
                                    ["priority"] = 85,
                                    ["name"] = "Selling",
                                },
                                [7] = 
                                {
                                    ["priority"] = 84,
                                    ["name"] = "Decon/Research",
                                },
                                [8] = 
                                {
                                    ["priority"] = 80,
                                    ["name"] = "Glyphs",
                                },
                                [9] = 
                                {
                                    ["priority"] = 79,
                                    ["name"] = "Weapons/Armor (Gold)",
                                },
                                [10] = 
                                {
                                    ["priority"] = 78,
                                    ["name"] = "Weapons/Armor (Purple)",
                                },
                                [11] = 
                                {
                                    ["priority"] = 77,
                                    ["name"] = "Weapons/Armor (Blue)",
                                },
                                [12] = 
                                {
                                    ["priority"] = 76,
                                    ["name"] = "Weapons/Armor (Green)",
                                },
                                [13] = 
                                {
                                    ["priority"] = 75,
                                    ["name"] = "Weapons/Armor (White)",
                                },
                                [14] = 
                                {
                                    ["priority"] = 70,
                                    ["name"] = "Jewelry",
                                },
                                [15] = 
                                {
                                    ["priority"] = 60,
                                    ["name"] = "Furnishing",
                                },
                                [16] = 
                                {
                                    ["priority"] = 40,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 35,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 30,
                                    ["name"] = "Crafting",
                                },
                                [19] = 
                                {
                                    ["priority"] = 5,
                                    ["name"] = "Set",
                                },
                            },
                        },
                        [2] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 95,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 90,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 85,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 80,
                                    ["name"] = "Decon/Research",
                                },
                                [7] = 
                                {
                                    ["priority"] = 70,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 60,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 50,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 49,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 48,
                                    ["name"] = "Weapons/Armor (Green)",
                                },
                                [12] = 
                                {
                                    ["priority"] = 47,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 46,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 45,
                                    ["name"] = "Jewelry",
                                },
                                [15] = 
                                {
                                    ["priority"] = 45,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 40,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 35,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 35,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 35,
                                    ["name"] = "Maps & Surveys",
                                },
                                [20] = 
                                {
                                    ["priority"] = 35,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [21] = 
                                {
                                    ["priority"] = 30,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 20,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [3] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 95,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 90,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 85,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 80,
                                    ["name"] = "Decon/Research",
                                },
                                [7] = 
                                {
                                    ["priority"] = 70,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 60,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 50,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 49,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 48,
                                    ["name"] = "Weapons/Armor (Green)",
                                },
                                [12] = 
                                {
                                    ["priority"] = 47,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 46,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 45,
                                    ["name"] = "Jewelry",
                                },
                                [15] = 
                                {
                                    ["priority"] = 45,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 40,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 35,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 35,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 35,
                                    ["name"] = "Maps & Surveys",
                                },
                                [20] = 
                                {
                                    ["priority"] = 35,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [21] = 
                                {
                                    ["priority"] = 30,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 20,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [4] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Alchemy",
                                },
                                [2] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Blacksmithing",
                                },
                                [3] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Clothing",
                                },
                                [4] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Enchanting",
                                },
                                [5] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Provisioning",
                                },
                                [6] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [7] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [5] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 95,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 90,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 85,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 80,
                                    ["name"] = "Decon/Research",
                                },
                                [7] = 
                                {
                                    ["priority"] = 70,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 60,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 50,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 49,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 48,
                                    ["name"] = "Weapons/Armor (Green)",
                                },
                                [12] = 
                                {
                                    ["priority"] = 47,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 46,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 45,
                                    ["name"] = "Jewelry",
                                },
                                [15] = 
                                {
                                    ["priority"] = 45,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 40,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 35,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 35,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 35,
                                    ["name"] = "Maps & Surveys",
                                },
                                [20] = 
                                {
                                    ["priority"] = 35,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [21] = 
                                {
                                    ["priority"] = 30,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 20,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [6] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "New",
                                },
                                [2] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Not Collected",
                                },
                                [3] = 
                                {
                                    ["priority"] = 99,
                                    ["name"] = "BoP Tradeable",
                                },
                                [4] = 
                                {
                                    ["priority"] = 90,
                                    ["name"] = "BoE",
                                },
                                [5] = 
                                {
                                    ["priority"] = 90,
                                    ["name"] = "Set",
                                },
                                [6] = 
                                {
                                    ["priority"] = 85,
                                    ["name"] = "Selling",
                                },
                                [7] = 
                                {
                                    ["priority"] = 79,
                                    ["name"] = "Weapons/Armor (Gold)",
                                },
                                [8] = 
                                {
                                    ["priority"] = 78,
                                    ["name"] = "Weapons/Armor (Purple)",
                                },
                                [9] = 
                                {
                                    ["priority"] = 77,
                                    ["name"] = "Weapons/Armor (Blue)",
                                },
                                [10] = 
                                {
                                    ["priority"] = 76,
                                    ["name"] = "Weapons/Armor (Green)",
                                },
                                [11] = 
                                {
                                    ["priority"] = 75,
                                    ["name"] = "Weapons/Armor (White)",
                                },
                                [12] = 
                                {
                                    ["priority"] = 70,
                                    ["name"] = "Jewelry",
                                },
                                [13] = 
                                {
                                    ["priority"] = 60,
                                    ["name"] = "Furnishing",
                                },
                                [14] = 
                                {
                                    ["priority"] = 40,
                                    ["name"] = "Quickslots",
                                },
                                [15] = 
                                {
                                    ["priority"] = 35,
                                    ["name"] = "Consumables",
                                },
                                [16] = 
                                {
                                    ["priority"] = 30,
                                    ["name"] = "Crafting",
                                },
                                [17] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Container",
                                },
                                [18] = 
                                {
                                    ["priority"] = 10,
                                    ["name"] = "Decon/Research",
                                },
                            },
                        },
                    },
                },
            },
            ["8796093067238331"] = 
            {
                ["$LastCharacterName"] = "morregann",
                ["NA Megaserver"] = 
                {
                    ["collapses"] = 
                    {
                        [1] = 
                        {
                        },
                        [2] = 
                        {
                        },
                        [3] = 
                        {
                        },
                        [4] = 
                        {
                        },
                        [5] = 
                        {
                        },
                        [6] = 
                        {
                        },
                    },
                    ["version"] = 1.1000000000,
                    ["rules"] = 
                    {
                        [1] = 
                        {
                            ["rule"] = "type(\"armor\") and not equiptype(\"neck\",\"ring\")",
                            ["name"] = "Armor",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [2] = 
                        {
                            ["rule"] = "boundtype(\"on_equip\") and not isbound() and not keepresearch()",
                            ["name"] = "BoE",
                            ["description"] = "BoE gears for selling",
                            ["tag"] = "Gears",
                        },
                        [3] = 
                        {
                            ["rule"] = "isboptradeable()",
                            ["name"] = "BoP Tradeable",
                            ["description"] = "Gears are tradeable within a limited time",
                            ["tag"] = "Gears",
                        },
                        [4] = 
                        {
                            ["rule"] = "traitstring(\"intricate\")",
                            ["name"] = "Deconstruct",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [5] = 
                        {
                            ["rule"] = "isequipping()",
                            ["name"] = "Equipping",
                            ["description"] = "Currently equipping gears (Gamepad Only)",
                            ["tag"] = "Gears",
                        },
                        [6] = 
                        {
                            ["rule"] = "level() > 1 and cp() < 160 and type(\"armor\", \"weapon\")",
                            ["name"] = "Low Level",
                            ["description"] = "Gears below cp 160",
                            ["tag"] = "Gears",
                        },
                        [7] = 
                        {
                            ["rule"] = "equiptype(\"neck\")",
                            ["name"] = "Necklace",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [8] = 
                        {
                            ["rule"] = "keepresearch()",
                            ["name"] = "Researchable",
                            ["description"] = "Gears that keep for research purpose, only keep the low quality, low level one.",
                            ["tag"] = "Gears",
                        },
                        [9] = 
                        {
                            ["rule"] = "equiptype(\"ring\")",
                            ["name"] = "Ring",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [10] = 
                        {
                            ["rule"] = "autoset()",
                            ["name"] = "Set",
                            ["description"] = "Auto categorize set gears",
                            ["tag"] = "Gears",
                        },
                        [11] = 
                        {
                            ["rule"] = "type(\"weapon\")",
                            ["name"] = "Weapon",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [12] = 
                        {
                            ["rule"] = "type(\"food\", \"drink\", \"potion\")",
                            ["name"] = "Consumables",
                            ["description"] = "Food, Drink, Potion",
                            ["tag"] = "General Items",
                        },
                        [13] = 
                        {
                            ["rule"] = "type(\"container\")",
                            ["name"] = "Container",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [14] = 
                        {
                            ["rule"] = "filtertype(\"furnishing\")",
                            ["name"] = "Furnishing",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [15] = 
                        {
                            ["rule"] = "type(\"soul_gem\", \"glyph_armor\", \"glyph_jewelry\", \"glyph_weapon\")",
                            ["name"] = "Glyphs & Gems",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [16] = 
                        {
                            ["rule"] = "isnew()",
                            ["name"] = "New",
                            ["description"] = "Items that are received recently",
                            ["tag"] = "General Items",
                        },
                        [17] = 
                        {
                            ["rule"] = "type(\"poison\")",
                            ["name"] = "Poison",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [18] = 
                        {
                            ["rule"] = "isinquickslot()",
                            ["name"] = "Quickslots",
                            ["description"] = "Equipped in quickslots",
                            ["tag"] = "General Items",
                        },
                        [19] = 
                        {
                            ["rule"] = "type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\")",
                            ["name"] = "Recipes & Motifs",
                            ["description"] = "All recipes, motifs and recipe fragments.",
                            ["tag"] = "General Items",
                        },
                        [20] = 
                        {
                            ["rule"] = "traitstring(\"ornate\") or sptype(\"collectible_monster_trophy\") or type(\"trash\")",
                            ["name"] = "Selling",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [21] = 
                        {
                            ["rule"] = "isstolen()",
                            ["name"] = "Stolen",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [22] = 
                        {
                            ["rule"] = "sptype(\"trophy_survey_report\", \"trophy_treasure_map\")",
                            ["name"] = "Maps & Surveys",
                            ["description"] = "Treasure maps and survey reports",
                            ["tag"] = "General Items",
                        },
                        [23] = 
                        {
                            ["rule"] = "filtertype(\"alchemy\")",
                            ["name"] = "Alchemy",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [24] = 
                        {
                            ["rule"] = "filtertype(\"blacksmithing\")",
                            ["name"] = "Blacksmithing",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [25] = 
                        {
                            ["rule"] = "filtertype(\"clothing\")",
                            ["name"] = "Clothing",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [26] = 
                        {
                            ["rule"] = "filtertype(\"enchanting\")",
                            ["name"] = "Enchanting",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [27] = 
                        {
                            ["rule"] = "filtertype(\"jewelrycrafting\")",
                            ["name"] = "Jewelry Crafting",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [28] = 
                        {
                            ["rule"] = "filtertype(\"provisioning\")",
                            ["name"] = "Provisioning",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [29] = 
                        {
                            ["rule"] = "filtertype(\"trait_items\", \"style_materials\")",
                            ["name"] = "Trait/Style Gems",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [30] = 
                        {
                            ["rule"] = "filtertype(\"woodworking\")",
                            ["name"] = "Woodworking",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                    },
                    ["accountWide"] = true,
                    ["general"] = 
                    {
                        ["SHOW_CATEGORY_ITEM_COUNT"] = true,
                        ["SHOW_CATEGORY_COLLAPSE_ICON"] = true,
                        ["SAVE_CATEGORY_COLLAPSE_STATUS"] = false,
                        ["SHOW_MESSAGE_WHEN_TOGGLE"] = false,
                        ["SHOW_CATEGORY_SET_TITLE"] = true,
                    },
                    ["appearance"] = 
                    {
                        ["CATEGORY_OTHER_TEXT"] = "Others",
                        ["CATEGORY_FONT_SIZE"] = 18,
                        ["CATEGORY_FONT_STYLE"] = "soft-shadow-thin",
                        ["CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 1,
                            [2] = 1,
                            [3] = 1,
                        },
                        ["CATEGORY_FONT_NAME"] = "Univers 67",
                        ["CATEGORY_HEADER_HEIGHT"] = 52,
                        ["CATEGORY_FONT_ALIGNMENT"] = 1,
                    },
                    ["bags"] = 
                    {
                        [1] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [2] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [3] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [4] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [2] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [3] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                                [4] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [5] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [6] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [7] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                            },
                        },
                        [5] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [6] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                    },
                },
            },
            ["8796093067978059"] = 
            {
                ["$LastCharacterName"] = "katarrnn",
                ["NA Megaserver"] = 
                {
                    ["collapses"] = 
                    {
                        [1] = 
                        {
                        },
                        [2] = 
                        {
                        },
                        [3] = 
                        {
                        },
                        [4] = 
                        {
                        },
                        [5] = 
                        {
                        },
                        [6] = 
                        {
                        },
                    },
                    ["version"] = 1.1000000000,
                    ["rules"] = 
                    {
                        [1] = 
                        {
                            ["rule"] = "type(\"armor\") and not equiptype(\"neck\",\"ring\")",
                            ["name"] = "Armor",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [2] = 
                        {
                            ["rule"] = "boundtype(\"on_equip\") and not isbound() and not keepresearch()",
                            ["name"] = "BoE",
                            ["description"] = "BoE gears for selling",
                            ["tag"] = "Gears",
                        },
                        [3] = 
                        {
                            ["rule"] = "isboptradeable()",
                            ["name"] = "BoP Tradeable",
                            ["description"] = "Gears are tradeable within a limited time",
                            ["tag"] = "Gears",
                        },
                        [4] = 
                        {
                            ["rule"] = "traitstring(\"intricate\")",
                            ["name"] = "Deconstruct",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [5] = 
                        {
                            ["rule"] = "isequipping()",
                            ["name"] = "Equipping",
                            ["description"] = "Currently equipping gears (Gamepad Only)",
                            ["tag"] = "Gears",
                        },
                        [6] = 
                        {
                            ["rule"] = "level() > 1 and cp() < 160 and type(\"armor\", \"weapon\")",
                            ["name"] = "Low Level",
                            ["description"] = "Gears below cp 160",
                            ["tag"] = "Gears",
                        },
                        [7] = 
                        {
                            ["rule"] = "equiptype(\"neck\")",
                            ["name"] = "Necklace",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [8] = 
                        {
                            ["rule"] = "keepresearch()",
                            ["name"] = "Researchable",
                            ["description"] = "Gears that keep for research purpose, only keep the low quality, low level one.",
                            ["tag"] = "Gears",
                        },
                        [9] = 
                        {
                            ["rule"] = "equiptype(\"ring\")",
                            ["name"] = "Ring",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [10] = 
                        {
                            ["rule"] = "autoset()",
                            ["name"] = "Set",
                            ["description"] = "Auto categorize set gears",
                            ["tag"] = "Gears",
                        },
                        [11] = 
                        {
                            ["rule"] = "type(\"weapon\")",
                            ["name"] = "Weapon",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [12] = 
                        {
                            ["rule"] = "type(\"food\", \"drink\", \"potion\")",
                            ["name"] = "Consumables",
                            ["description"] = "Food, Drink, Potion",
                            ["tag"] = "General Items",
                        },
                        [13] = 
                        {
                            ["rule"] = "type(\"container\")",
                            ["name"] = "Container",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [14] = 
                        {
                            ["rule"] = "filtertype(\"furnishing\")",
                            ["name"] = "Furnishing",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [15] = 
                        {
                            ["rule"] = "type(\"soul_gem\", \"glyph_armor\", \"glyph_jewelry\", \"glyph_weapon\")",
                            ["name"] = "Glyphs & Gems",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [16] = 
                        {
                            ["rule"] = "isnew()",
                            ["name"] = "New",
                            ["description"] = "Items that are received recently",
                            ["tag"] = "General Items",
                        },
                        [17] = 
                        {
                            ["rule"] = "type(\"poison\")",
                            ["name"] = "Poison",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [18] = 
                        {
                            ["rule"] = "isinquickslot()",
                            ["name"] = "Quickslots",
                            ["description"] = "Equipped in quickslots",
                            ["tag"] = "General Items",
                        },
                        [19] = 
                        {
                            ["rule"] = "type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\")",
                            ["name"] = "Recipes & Motifs",
                            ["description"] = "All recipes, motifs and recipe fragments.",
                            ["tag"] = "General Items",
                        },
                        [20] = 
                        {
                            ["rule"] = "traitstring(\"ornate\") or sptype(\"collectible_monster_trophy\") or type(\"trash\")",
                            ["name"] = "Selling",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [21] = 
                        {
                            ["rule"] = "isstolen()",
                            ["name"] = "Stolen",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [22] = 
                        {
                            ["rule"] = "sptype(\"trophy_survey_report\", \"trophy_treasure_map\")",
                            ["name"] = "Maps & Surveys",
                            ["description"] = "Treasure maps and survey reports",
                            ["tag"] = "General Items",
                        },
                        [23] = 
                        {
                            ["rule"] = "filtertype(\"alchemy\")",
                            ["name"] = "Alchemy",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [24] = 
                        {
                            ["rule"] = "filtertype(\"blacksmithing\")",
                            ["name"] = "Blacksmithing",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [25] = 
                        {
                            ["rule"] = "filtertype(\"clothing\")",
                            ["name"] = "Clothing",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [26] = 
                        {
                            ["rule"] = "filtertype(\"enchanting\")",
                            ["name"] = "Enchanting",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [27] = 
                        {
                            ["rule"] = "filtertype(\"jewelrycrafting\")",
                            ["name"] = "Jewelry Crafting",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [28] = 
                        {
                            ["rule"] = "filtertype(\"provisioning\")",
                            ["name"] = "Provisioning",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [29] = 
                        {
                            ["rule"] = "filtertype(\"trait_items\", \"style_materials\")",
                            ["name"] = "Trait/Style Gems",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [30] = 
                        {
                            ["rule"] = "filtertype(\"woodworking\")",
                            ["name"] = "Woodworking",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                    },
                    ["accountWide"] = true,
                    ["general"] = 
                    {
                        ["SHOW_CATEGORY_ITEM_COUNT"] = true,
                        ["SHOW_CATEGORY_COLLAPSE_ICON"] = true,
                        ["SAVE_CATEGORY_COLLAPSE_STATUS"] = false,
                        ["SHOW_MESSAGE_WHEN_TOGGLE"] = false,
                        ["SHOW_CATEGORY_SET_TITLE"] = true,
                    },
                    ["appearance"] = 
                    {
                        ["CATEGORY_OTHER_TEXT"] = "Others",
                        ["CATEGORY_FONT_SIZE"] = 18,
                        ["CATEGORY_FONT_STYLE"] = "soft-shadow-thin",
                        ["CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 1,
                            [2] = 1,
                            [3] = 1,
                        },
                        ["CATEGORY_FONT_NAME"] = "Univers 67",
                        ["CATEGORY_HEADER_HEIGHT"] = 52,
                        ["CATEGORY_FONT_ALIGNMENT"] = 1,
                    },
                    ["bags"] = 
                    {
                        [1] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [2] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [3] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [4] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [2] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [3] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                                [4] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [5] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [6] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [7] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                            },
                        },
                        [5] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [6] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                    },
                },
            },
            ["8796093067238283"] = 
            {
                ["$LastCharacterName"] = "rock-in-bush",
                ["NA Megaserver"] = 
                {
                    ["collapses"] = 
                    {
                        [1] = 
                        {
                        },
                        [2] = 
                        {
                        },
                        [3] = 
                        {
                        },
                        [4] = 
                        {
                        },
                        [5] = 
                        {
                        },
                        [6] = 
                        {
                        },
                    },
                    ["version"] = 1.1000000000,
                    ["rules"] = 
                    {
                        [1] = 
                        {
                            ["rule"] = "type(\"armor\") and not equiptype(\"neck\",\"ring\")",
                            ["name"] = "Armor",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [2] = 
                        {
                            ["rule"] = "boundtype(\"on_equip\") and not isbound() and not keepresearch()",
                            ["name"] = "BoE",
                            ["description"] = "BoE gears for selling",
                            ["tag"] = "Gears",
                        },
                        [3] = 
                        {
                            ["rule"] = "isboptradeable()",
                            ["name"] = "BoP Tradeable",
                            ["description"] = "Gears are tradeable within a limited time",
                            ["tag"] = "Gears",
                        },
                        [4] = 
                        {
                            ["rule"] = "traitstring(\"intricate\")",
                            ["name"] = "Deconstruct",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [5] = 
                        {
                            ["rule"] = "isequipping()",
                            ["name"] = "Equipping",
                            ["description"] = "Currently equipping gears (Gamepad Only)",
                            ["tag"] = "Gears",
                        },
                        [6] = 
                        {
                            ["rule"] = "level() > 1 and cp() < 160 and type(\"armor\", \"weapon\")",
                            ["name"] = "Low Level",
                            ["description"] = "Gears below cp 160",
                            ["tag"] = "Gears",
                        },
                        [7] = 
                        {
                            ["rule"] = "equiptype(\"neck\")",
                            ["name"] = "Necklace",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [8] = 
                        {
                            ["rule"] = "keepresearch()",
                            ["name"] = "Researchable",
                            ["description"] = "Gears that keep for research purpose, only keep the low quality, low level one.",
                            ["tag"] = "Gears",
                        },
                        [9] = 
                        {
                            ["rule"] = "equiptype(\"ring\")",
                            ["name"] = "Ring",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [10] = 
                        {
                            ["rule"] = "autoset()",
                            ["name"] = "Set",
                            ["description"] = "Auto categorize set gears",
                            ["tag"] = "Gears",
                        },
                        [11] = 
                        {
                            ["rule"] = "type(\"weapon\")",
                            ["name"] = "Weapon",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [12] = 
                        {
                            ["rule"] = "type(\"food\", \"drink\", \"potion\")",
                            ["name"] = "Consumables",
                            ["description"] = "Food, Drink, Potion",
                            ["tag"] = "General Items",
                        },
                        [13] = 
                        {
                            ["rule"] = "type(\"container\")",
                            ["name"] = "Container",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [14] = 
                        {
                            ["rule"] = "filtertype(\"furnishing\")",
                            ["name"] = "Furnishing",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [15] = 
                        {
                            ["rule"] = "type(\"soul_gem\", \"glyph_armor\", \"glyph_jewelry\", \"glyph_weapon\")",
                            ["name"] = "Glyphs & Gems",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [16] = 
                        {
                            ["rule"] = "isnew()",
                            ["name"] = "New",
                            ["description"] = "Items that are received recently",
                            ["tag"] = "General Items",
                        },
                        [17] = 
                        {
                            ["rule"] = "type(\"poison\")",
                            ["name"] = "Poison",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [18] = 
                        {
                            ["rule"] = "isinquickslot()",
                            ["name"] = "Quickslots",
                            ["description"] = "Equipped in quickslots",
                            ["tag"] = "General Items",
                        },
                        [19] = 
                        {
                            ["rule"] = "type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\")",
                            ["name"] = "Recipes & Motifs",
                            ["description"] = "All recipes, motifs and recipe fragments.",
                            ["tag"] = "General Items",
                        },
                        [20] = 
                        {
                            ["rule"] = "traitstring(\"ornate\") or sptype(\"collectible_monster_trophy\") or type(\"trash\")",
                            ["name"] = "Selling",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [21] = 
                        {
                            ["rule"] = "isstolen()",
                            ["name"] = "Stolen",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [22] = 
                        {
                            ["rule"] = "sptype(\"trophy_survey_report\", \"trophy_treasure_map\")",
                            ["name"] = "Maps & Surveys",
                            ["description"] = "Treasure maps and survey reports",
                            ["tag"] = "General Items",
                        },
                        [23] = 
                        {
                            ["rule"] = "filtertype(\"alchemy\")",
                            ["name"] = "Alchemy",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [24] = 
                        {
                            ["rule"] = "filtertype(\"blacksmithing\")",
                            ["name"] = "Blacksmithing",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [25] = 
                        {
                            ["rule"] = "filtertype(\"clothing\")",
                            ["name"] = "Clothing",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [26] = 
                        {
                            ["rule"] = "filtertype(\"enchanting\")",
                            ["name"] = "Enchanting",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [27] = 
                        {
                            ["rule"] = "filtertype(\"jewelrycrafting\")",
                            ["name"] = "Jewelry Crafting",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [28] = 
                        {
                            ["rule"] = "filtertype(\"provisioning\")",
                            ["name"] = "Provisioning",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [29] = 
                        {
                            ["rule"] = "filtertype(\"trait_items\", \"style_materials\")",
                            ["name"] = "Trait/Style Gems",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [30] = 
                        {
                            ["rule"] = "filtertype(\"woodworking\")",
                            ["name"] = "Woodworking",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                    },
                    ["accountWide"] = true,
                    ["general"] = 
                    {
                        ["SHOW_CATEGORY_ITEM_COUNT"] = true,
                        ["SHOW_CATEGORY_COLLAPSE_ICON"] = true,
                        ["SAVE_CATEGORY_COLLAPSE_STATUS"] = false,
                        ["SHOW_MESSAGE_WHEN_TOGGLE"] = false,
                        ["SHOW_CATEGORY_SET_TITLE"] = true,
                    },
                    ["appearance"] = 
                    {
                        ["CATEGORY_OTHER_TEXT"] = "Others",
                        ["CATEGORY_FONT_SIZE"] = 18,
                        ["CATEGORY_FONT_STYLE"] = "soft-shadow-thin",
                        ["CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 1,
                            [2] = 1,
                            [3] = 1,
                        },
                        ["CATEGORY_FONT_NAME"] = "Univers 67",
                        ["CATEGORY_HEADER_HEIGHT"] = 52,
                        ["CATEGORY_FONT_ALIGNMENT"] = 1,
                    },
                    ["bags"] = 
                    {
                        [1] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [2] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [3] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [4] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [2] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [3] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                                [4] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [5] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [6] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [7] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                            },
                        },
                        [5] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [6] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                    },
                },
            },
            ["8796093041658833"] = 
            {
                ["$LastCharacterName"] = "Durro'tan",
                ["NA Megaserver"] = 
                {
                    ["collapses"] = 
                    {
                        [1] = 
                        {
                        },
                        [2] = 
                        {
                        },
                        [3] = 
                        {
                        },
                        [4] = 
                        {
                        },
                        [5] = 
                        {
                        },
                        [6] = 
                        {
                        },
                    },
                    ["version"] = 1.1000000000,
                    ["rules"] = 
                    {
                        [1] = 
                        {
                            ["rule"] = "type(\"armor\") and not equiptype(\"neck\",\"ring\")",
                            ["name"] = "Armor",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [2] = 
                        {
                            ["rule"] = "boundtype(\"on_equip\") and not isbound() and not keepresearch()",
                            ["name"] = "BoE",
                            ["description"] = "BoE gears for selling",
                            ["tag"] = "Gears",
                        },
                        [3] = 
                        {
                            ["rule"] = "isboptradeable()",
                            ["name"] = "BoP Tradeable",
                            ["description"] = "Gears are tradeable within a limited time",
                            ["tag"] = "Gears",
                        },
                        [4] = 
                        {
                            ["rule"] = "traitstring(\"intricate\")",
                            ["name"] = "Deconstruct",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [5] = 
                        {
                            ["rule"] = "isequipping()",
                            ["name"] = "Equipping",
                            ["description"] = "Currently equipping gears (Gamepad Only)",
                            ["tag"] = "Gears",
                        },
                        [6] = 
                        {
                            ["rule"] = "level() > 1 and cp() < 160 and type(\"armor\", \"weapon\")",
                            ["name"] = "Low Level",
                            ["description"] = "Gears below cp 160",
                            ["tag"] = "Gears",
                        },
                        [7] = 
                        {
                            ["rule"] = "equiptype(\"neck\")",
                            ["name"] = "Necklace",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [8] = 
                        {
                            ["rule"] = "keepresearch()",
                            ["name"] = "Researchable",
                            ["description"] = "Gears that keep for research purpose, only keep the low quality, low level one.",
                            ["tag"] = "Gears",
                        },
                        [9] = 
                        {
                            ["rule"] = "equiptype(\"ring\")",
                            ["name"] = "Ring",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [10] = 
                        {
                            ["rule"] = "autoset()",
                            ["name"] = "Set",
                            ["description"] = "Auto categorize set gears",
                            ["tag"] = "Gears",
                        },
                        [11] = 
                        {
                            ["rule"] = "type(\"weapon\")",
                            ["name"] = "Weapon",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [12] = 
                        {
                            ["rule"] = "type(\"food\", \"drink\", \"potion\")",
                            ["name"] = "Consumables",
                            ["description"] = "Food, Drink, Potion",
                            ["tag"] = "General Items",
                        },
                        [13] = 
                        {
                            ["rule"] = "type(\"container\")",
                            ["name"] = "Container",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [14] = 
                        {
                            ["rule"] = "filtertype(\"furnishing\")",
                            ["name"] = "Furnishing",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [15] = 
                        {
                            ["rule"] = "type(\"soul_gem\", \"glyph_armor\", \"glyph_jewelry\", \"glyph_weapon\")",
                            ["name"] = "Glyphs & Gems",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [16] = 
                        {
                            ["rule"] = "isnew()",
                            ["name"] = "New",
                            ["description"] = "Items that are received recently",
                            ["tag"] = "General Items",
                        },
                        [17] = 
                        {
                            ["rule"] = "type(\"poison\")",
                            ["name"] = "Poison",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [18] = 
                        {
                            ["rule"] = "isinquickslot()",
                            ["name"] = "Quickslots",
                            ["description"] = "Equipped in quickslots",
                            ["tag"] = "General Items",
                        },
                        [19] = 
                        {
                            ["rule"] = "type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\")",
                            ["name"] = "Recipes & Motifs",
                            ["description"] = "All recipes, motifs and recipe fragments.",
                            ["tag"] = "General Items",
                        },
                        [20] = 
                        {
                            ["rule"] = "traitstring(\"ornate\") or sptype(\"collectible_monster_trophy\") or type(\"trash\")",
                            ["name"] = "Selling",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [21] = 
                        {
                            ["rule"] = "isstolen()",
                            ["name"] = "Stolen",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [22] = 
                        {
                            ["rule"] = "sptype(\"trophy_survey_report\", \"trophy_treasure_map\")",
                            ["name"] = "Maps & Surveys",
                            ["description"] = "Treasure maps and survey reports",
                            ["tag"] = "General Items",
                        },
                        [23] = 
                        {
                            ["rule"] = "filtertype(\"alchemy\")",
                            ["name"] = "Alchemy",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [24] = 
                        {
                            ["rule"] = "filtertype(\"blacksmithing\")",
                            ["name"] = "Blacksmithing",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [25] = 
                        {
                            ["rule"] = "filtertype(\"clothing\")",
                            ["name"] = "Clothing",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [26] = 
                        {
                            ["rule"] = "filtertype(\"enchanting\")",
                            ["name"] = "Enchanting",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [27] = 
                        {
                            ["rule"] = "filtertype(\"jewelrycrafting\")",
                            ["name"] = "Jewelry Crafting",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [28] = 
                        {
                            ["rule"] = "filtertype(\"provisioning\")",
                            ["name"] = "Provisioning",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [29] = 
                        {
                            ["rule"] = "filtertype(\"trait_items\", \"style_materials\")",
                            ["name"] = "Trait/Style Gems",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [30] = 
                        {
                            ["rule"] = "filtertype(\"woodworking\")",
                            ["name"] = "Woodworking",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                    },
                    ["accountWide"] = true,
                    ["general"] = 
                    {
                        ["SHOW_CATEGORY_ITEM_COUNT"] = true,
                        ["SHOW_CATEGORY_COLLAPSE_ICON"] = true,
                        ["SAVE_CATEGORY_COLLAPSE_STATUS"] = false,
                        ["SHOW_MESSAGE_WHEN_TOGGLE"] = false,
                        ["SHOW_CATEGORY_SET_TITLE"] = true,
                    },
                    ["appearance"] = 
                    {
                        ["CATEGORY_OTHER_TEXT"] = "Others",
                        ["CATEGORY_FONT_SIZE"] = 18,
                        ["CATEGORY_FONT_STYLE"] = "soft-shadow-thin",
                        ["CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 1,
                            [2] = 1,
                            [3] = 1,
                        },
                        ["CATEGORY_FONT_NAME"] = "Univers 67",
                        ["CATEGORY_HEADER_HEIGHT"] = 52,
                        ["CATEGORY_FONT_ALIGNMENT"] = 1,
                    },
                    ["bags"] = 
                    {
                        [1] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [2] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [3] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [4] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [2] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [3] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                                [4] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [5] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [6] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [7] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                            },
                        },
                        [5] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [6] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                    },
                },
            },
            ["8796093041540553"] = 
            {
                ["$LastCharacterName"] = "Lliliara",
                ["NA Megaserver"] = 
                {
                    ["collapses"] = 
                    {
                        [1] = 
                        {
                        },
                        [2] = 
                        {
                        },
                        [3] = 
                        {
                        },
                        [4] = 
                        {
                        },
                        [5] = 
                        {
                        },
                        [6] = 
                        {
                        },
                    },
                    ["version"] = 1.1000000000,
                    ["rules"] = 
                    {
                        [1] = 
                        {
                            ["rule"] = "type(\"armor\") and not equiptype(\"neck\",\"ring\")",
                            ["name"] = "Armor",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [2] = 
                        {
                            ["rule"] = "boundtype(\"on_equip\") and not isbound() and not keepresearch()",
                            ["name"] = "BoE",
                            ["description"] = "BoE gears for selling",
                            ["tag"] = "Gears",
                        },
                        [3] = 
                        {
                            ["rule"] = "isboptradeable()",
                            ["name"] = "BoP Tradeable",
                            ["description"] = "Gears are tradeable within a limited time",
                            ["tag"] = "Gears",
                        },
                        [4] = 
                        {
                            ["rule"] = "traitstring(\"intricate\")",
                            ["name"] = "Deconstruct",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [5] = 
                        {
                            ["rule"] = "isequipping()",
                            ["name"] = "Equipping",
                            ["description"] = "Currently equipping gears (Gamepad Only)",
                            ["tag"] = "Gears",
                        },
                        [6] = 
                        {
                            ["rule"] = "level() > 1 and cp() < 160 and type(\"armor\", \"weapon\")",
                            ["name"] = "Low Level",
                            ["description"] = "Gears below cp 160",
                            ["tag"] = "Gears",
                        },
                        [7] = 
                        {
                            ["rule"] = "equiptype(\"neck\")",
                            ["name"] = "Necklace",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [8] = 
                        {
                            ["rule"] = "keepresearch()",
                            ["name"] = "Researchable",
                            ["description"] = "Gears that keep for research purpose, only keep the low quality, low level one.",
                            ["tag"] = "Gears",
                        },
                        [9] = 
                        {
                            ["rule"] = "equiptype(\"ring\")",
                            ["name"] = "Ring",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [10] = 
                        {
                            ["rule"] = "autoset()",
                            ["name"] = "Set",
                            ["description"] = "Auto categorize set gears",
                            ["tag"] = "Gears",
                        },
                        [11] = 
                        {
                            ["rule"] = "type(\"weapon\")",
                            ["name"] = "Weapon",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [12] = 
                        {
                            ["rule"] = "type(\"food\", \"drink\", \"potion\")",
                            ["name"] = "Consumables",
                            ["description"] = "Food, Drink, Potion",
                            ["tag"] = "General Items",
                        },
                        [13] = 
                        {
                            ["rule"] = "type(\"container\")",
                            ["name"] = "Container",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [14] = 
                        {
                            ["rule"] = "filtertype(\"furnishing\")",
                            ["name"] = "Furnishing",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [15] = 
                        {
                            ["rule"] = "type(\"soul_gem\", \"glyph_armor\", \"glyph_jewelry\", \"glyph_weapon\")",
                            ["name"] = "Glyphs & Gems",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [16] = 
                        {
                            ["rule"] = "isnew()",
                            ["name"] = "New",
                            ["description"] = "Items that are received recently",
                            ["tag"] = "General Items",
                        },
                        [17] = 
                        {
                            ["rule"] = "type(\"poison\")",
                            ["name"] = "Poison",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [18] = 
                        {
                            ["rule"] = "isinquickslot()",
                            ["name"] = "Quickslots",
                            ["description"] = "Equipped in quickslots",
                            ["tag"] = "General Items",
                        },
                        [19] = 
                        {
                            ["rule"] = "type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\")",
                            ["name"] = "Recipes & Motifs",
                            ["description"] = "All recipes, motifs and recipe fragments.",
                            ["tag"] = "General Items",
                        },
                        [20] = 
                        {
                            ["rule"] = "traitstring(\"ornate\") or sptype(\"collectible_monster_trophy\") or type(\"trash\")",
                            ["name"] = "Selling",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [21] = 
                        {
                            ["rule"] = "isstolen()",
                            ["name"] = "Stolen",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [22] = 
                        {
                            ["rule"] = "sptype(\"trophy_survey_report\", \"trophy_treasure_map\")",
                            ["name"] = "Maps & Surveys",
                            ["description"] = "Treasure maps and survey reports",
                            ["tag"] = "General Items",
                        },
                        [23] = 
                        {
                            ["rule"] = "filtertype(\"alchemy\")",
                            ["name"] = "Alchemy",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [24] = 
                        {
                            ["rule"] = "filtertype(\"blacksmithing\")",
                            ["name"] = "Blacksmithing",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [25] = 
                        {
                            ["rule"] = "filtertype(\"clothing\")",
                            ["name"] = "Clothing",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [26] = 
                        {
                            ["rule"] = "filtertype(\"enchanting\")",
                            ["name"] = "Enchanting",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [27] = 
                        {
                            ["rule"] = "filtertype(\"jewelrycrafting\")",
                            ["name"] = "Jewelry Crafting",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [28] = 
                        {
                            ["rule"] = "filtertype(\"provisioning\")",
                            ["name"] = "Provisioning",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [29] = 
                        {
                            ["rule"] = "filtertype(\"trait_items\", \"style_materials\")",
                            ["name"] = "Trait/Style Gems",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [30] = 
                        {
                            ["rule"] = "filtertype(\"woodworking\")",
                            ["name"] = "Woodworking",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                    },
                    ["accountWide"] = true,
                    ["general"] = 
                    {
                        ["SHOW_CATEGORY_ITEM_COUNT"] = true,
                        ["SHOW_CATEGORY_COLLAPSE_ICON"] = true,
                        ["SAVE_CATEGORY_COLLAPSE_STATUS"] = false,
                        ["SHOW_MESSAGE_WHEN_TOGGLE"] = false,
                        ["SHOW_CATEGORY_SET_TITLE"] = true,
                    },
                    ["appearance"] = 
                    {
                        ["CATEGORY_OTHER_TEXT"] = "Others",
                        ["CATEGORY_FONT_SIZE"] = 18,
                        ["CATEGORY_FONT_STYLE"] = "soft-shadow-thin",
                        ["CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 1,
                            [2] = 1,
                            [3] = 1,
                        },
                        ["CATEGORY_FONT_NAME"] = "Univers 67",
                        ["CATEGORY_HEADER_HEIGHT"] = 52,
                        ["CATEGORY_FONT_ALIGNMENT"] = 1,
                    },
                    ["bags"] = 
                    {
                        [1] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [2] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [3] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [4] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [2] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [3] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                                [4] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [5] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [6] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [7] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                            },
                        },
                        [5] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [6] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                    },
                },
            },
            ["8796093067284513"] = 
            {
                ["$LastCharacterName"] = "rieyya",
                ["NA Megaserver"] = 
                {
                    ["collapses"] = 
                    {
                        [1] = 
                        {
                        },
                        [2] = 
                        {
                        },
                        [3] = 
                        {
                        },
                        [4] = 
                        {
                        },
                        [5] = 
                        {
                        },
                        [6] = 
                        {
                        },
                    },
                    ["version"] = 1.1000000000,
                    ["rules"] = 
                    {
                        [1] = 
                        {
                            ["rule"] = "type(\"armor\") and not equiptype(\"neck\",\"ring\")",
                            ["name"] = "Armor",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [2] = 
                        {
                            ["rule"] = "boundtype(\"on_equip\") and not isbound() and not keepresearch()",
                            ["name"] = "BoE",
                            ["description"] = "BoE gears for selling",
                            ["tag"] = "Gears",
                        },
                        [3] = 
                        {
                            ["rule"] = "isboptradeable()",
                            ["name"] = "BoP Tradeable",
                            ["description"] = "Gears are tradeable within a limited time",
                            ["tag"] = "Gears",
                        },
                        [4] = 
                        {
                            ["rule"] = "traitstring(\"intricate\")",
                            ["name"] = "Deconstruct",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [5] = 
                        {
                            ["rule"] = "isequipping()",
                            ["name"] = "Equipping",
                            ["description"] = "Currently equipping gears (Gamepad Only)",
                            ["tag"] = "Gears",
                        },
                        [6] = 
                        {
                            ["rule"] = "level() > 1 and cp() < 160 and type(\"armor\", \"weapon\")",
                            ["name"] = "Low Level",
                            ["description"] = "Gears below cp 160",
                            ["tag"] = "Gears",
                        },
                        [7] = 
                        {
                            ["rule"] = "equiptype(\"neck\")",
                            ["name"] = "Necklace",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [8] = 
                        {
                            ["rule"] = "keepresearch()",
                            ["name"] = "Researchable",
                            ["description"] = "Gears that keep for research purpose, only keep the low quality, low level one.",
                            ["tag"] = "Gears",
                        },
                        [9] = 
                        {
                            ["rule"] = "equiptype(\"ring\")",
                            ["name"] = "Ring",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [10] = 
                        {
                            ["rule"] = "autoset()",
                            ["name"] = "Set",
                            ["description"] = "Auto categorize set gears",
                            ["tag"] = "Gears",
                        },
                        [11] = 
                        {
                            ["rule"] = "type(\"weapon\")",
                            ["name"] = "Weapon",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [12] = 
                        {
                            ["rule"] = "type(\"food\", \"drink\", \"potion\")",
                            ["name"] = "Consumables",
                            ["description"] = "Food, Drink, Potion",
                            ["tag"] = "General Items",
                        },
                        [13] = 
                        {
                            ["rule"] = "type(\"container\")",
                            ["name"] = "Container",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [14] = 
                        {
                            ["rule"] = "filtertype(\"furnishing\")",
                            ["name"] = "Furnishing",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [15] = 
                        {
                            ["rule"] = "type(\"soul_gem\", \"glyph_armor\", \"glyph_jewelry\", \"glyph_weapon\")",
                            ["name"] = "Glyphs & Gems",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [16] = 
                        {
                            ["rule"] = "isnew()",
                            ["name"] = "New",
                            ["description"] = "Items that are received recently",
                            ["tag"] = "General Items",
                        },
                        [17] = 
                        {
                            ["rule"] = "type(\"poison\")",
                            ["name"] = "Poison",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [18] = 
                        {
                            ["rule"] = "isinquickslot()",
                            ["name"] = "Quickslots",
                            ["description"] = "Equipped in quickslots",
                            ["tag"] = "General Items",
                        },
                        [19] = 
                        {
                            ["rule"] = "type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\")",
                            ["name"] = "Recipes & Motifs",
                            ["description"] = "All recipes, motifs and recipe fragments.",
                            ["tag"] = "General Items",
                        },
                        [20] = 
                        {
                            ["rule"] = "traitstring(\"ornate\") or sptype(\"collectible_monster_trophy\") or type(\"trash\")",
                            ["name"] = "Selling",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [21] = 
                        {
                            ["rule"] = "isstolen()",
                            ["name"] = "Stolen",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [22] = 
                        {
                            ["rule"] = "sptype(\"trophy_survey_report\", \"trophy_treasure_map\")",
                            ["name"] = "Maps & Surveys",
                            ["description"] = "Treasure maps and survey reports",
                            ["tag"] = "General Items",
                        },
                        [23] = 
                        {
                            ["rule"] = "filtertype(\"alchemy\")",
                            ["name"] = "Alchemy",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [24] = 
                        {
                            ["rule"] = "filtertype(\"blacksmithing\")",
                            ["name"] = "Blacksmithing",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [25] = 
                        {
                            ["rule"] = "filtertype(\"clothing\")",
                            ["name"] = "Clothing",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [26] = 
                        {
                            ["rule"] = "filtertype(\"enchanting\")",
                            ["name"] = "Enchanting",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [27] = 
                        {
                            ["rule"] = "filtertype(\"jewelrycrafting\")",
                            ["name"] = "Jewelry Crafting",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [28] = 
                        {
                            ["rule"] = "filtertype(\"provisioning\")",
                            ["name"] = "Provisioning",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [29] = 
                        {
                            ["rule"] = "filtertype(\"trait_items\", \"style_materials\")",
                            ["name"] = "Trait/Style Gems",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [30] = 
                        {
                            ["rule"] = "filtertype(\"woodworking\")",
                            ["name"] = "Woodworking",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                    },
                    ["accountWide"] = true,
                    ["general"] = 
                    {
                        ["SHOW_CATEGORY_ITEM_COUNT"] = true,
                        ["SHOW_CATEGORY_COLLAPSE_ICON"] = true,
                        ["SAVE_CATEGORY_COLLAPSE_STATUS"] = false,
                        ["SHOW_MESSAGE_WHEN_TOGGLE"] = false,
                        ["SHOW_CATEGORY_SET_TITLE"] = true,
                    },
                    ["appearance"] = 
                    {
                        ["CATEGORY_OTHER_TEXT"] = "Others",
                        ["CATEGORY_FONT_SIZE"] = 18,
                        ["CATEGORY_FONT_STYLE"] = "soft-shadow-thin",
                        ["CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 1,
                            [2] = 1,
                            [3] = 1,
                        },
                        ["CATEGORY_FONT_NAME"] = "Univers 67",
                        ["CATEGORY_HEADER_HEIGHT"] = 52,
                        ["CATEGORY_FONT_ALIGNMENT"] = 1,
                    },
                    ["bags"] = 
                    {
                        [1] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [2] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [3] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [4] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [2] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [3] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                                [4] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [5] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [6] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [7] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                            },
                        },
                        [5] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [6] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                    },
                },
            },
            ["8796093067238241"] = 
            {
                ["$LastCharacterName"] = "evil janet",
                ["NA Megaserver"] = 
                {
                    ["collapses"] = 
                    {
                        [1] = 
                        {
                        },
                        [2] = 
                        {
                        },
                        [3] = 
                        {
                        },
                        [4] = 
                        {
                        },
                        [5] = 
                        {
                        },
                        [6] = 
                        {
                        },
                    },
                    ["version"] = 1.1000000000,
                    ["rules"] = 
                    {
                        [1] = 
                        {
                            ["rule"] = "type(\"armor\") and not equiptype(\"neck\",\"ring\")",
                            ["name"] = "Armor",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [2] = 
                        {
                            ["rule"] = "boundtype(\"on_equip\") and not isbound() and not keepresearch()",
                            ["name"] = "BoE",
                            ["description"] = "BoE gears for selling",
                            ["tag"] = "Gears",
                        },
                        [3] = 
                        {
                            ["rule"] = "isboptradeable()",
                            ["name"] = "BoP Tradeable",
                            ["description"] = "Gears are tradeable within a limited time",
                            ["tag"] = "Gears",
                        },
                        [4] = 
                        {
                            ["rule"] = "traitstring(\"intricate\")",
                            ["name"] = "Deconstruct",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [5] = 
                        {
                            ["rule"] = "isequipping()",
                            ["name"] = "Equipping",
                            ["description"] = "Currently equipping gears (Gamepad Only)",
                            ["tag"] = "Gears",
                        },
                        [6] = 
                        {
                            ["rule"] = "level() > 1 and cp() < 160 and type(\"armor\", \"weapon\")",
                            ["name"] = "Low Level",
                            ["description"] = "Gears below cp 160",
                            ["tag"] = "Gears",
                        },
                        [7] = 
                        {
                            ["rule"] = "equiptype(\"neck\")",
                            ["name"] = "Necklace",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [8] = 
                        {
                            ["rule"] = "keepresearch()",
                            ["name"] = "Researchable",
                            ["description"] = "Gears that keep for research purpose, only keep the low quality, low level one.",
                            ["tag"] = "Gears",
                        },
                        [9] = 
                        {
                            ["rule"] = "equiptype(\"ring\")",
                            ["name"] = "Ring",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [10] = 
                        {
                            ["rule"] = "autoset()",
                            ["name"] = "Set",
                            ["description"] = "Auto categorize set gears",
                            ["tag"] = "Gears",
                        },
                        [11] = 
                        {
                            ["rule"] = "type(\"weapon\")",
                            ["name"] = "Weapon",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [12] = 
                        {
                            ["rule"] = "type(\"food\", \"drink\", \"potion\")",
                            ["name"] = "Consumables",
                            ["description"] = "Food, Drink, Potion",
                            ["tag"] = "General Items",
                        },
                        [13] = 
                        {
                            ["rule"] = "type(\"container\")",
                            ["name"] = "Container",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [14] = 
                        {
                            ["rule"] = "filtertype(\"furnishing\")",
                            ["name"] = "Furnishing",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [15] = 
                        {
                            ["rule"] = "type(\"soul_gem\", \"glyph_armor\", \"glyph_jewelry\", \"glyph_weapon\")",
                            ["name"] = "Glyphs & Gems",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [16] = 
                        {
                            ["rule"] = "isnew()",
                            ["name"] = "New",
                            ["description"] = "Items that are received recently",
                            ["tag"] = "General Items",
                        },
                        [17] = 
                        {
                            ["rule"] = "type(\"poison\")",
                            ["name"] = "Poison",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [18] = 
                        {
                            ["rule"] = "isinquickslot()",
                            ["name"] = "Quickslots",
                            ["description"] = "Equipped in quickslots",
                            ["tag"] = "General Items",
                        },
                        [19] = 
                        {
                            ["rule"] = "type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\")",
                            ["name"] = "Recipes & Motifs",
                            ["description"] = "All recipes, motifs and recipe fragments.",
                            ["tag"] = "General Items",
                        },
                        [20] = 
                        {
                            ["rule"] = "traitstring(\"ornate\") or sptype(\"collectible_monster_trophy\") or type(\"trash\")",
                            ["name"] = "Selling",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [21] = 
                        {
                            ["rule"] = "isstolen()",
                            ["name"] = "Stolen",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [22] = 
                        {
                            ["rule"] = "sptype(\"trophy_survey_report\", \"trophy_treasure_map\")",
                            ["name"] = "Maps & Surveys",
                            ["description"] = "Treasure maps and survey reports",
                            ["tag"] = "General Items",
                        },
                        [23] = 
                        {
                            ["rule"] = "filtertype(\"alchemy\")",
                            ["name"] = "Alchemy",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [24] = 
                        {
                            ["rule"] = "filtertype(\"blacksmithing\")",
                            ["name"] = "Blacksmithing",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [25] = 
                        {
                            ["rule"] = "filtertype(\"clothing\")",
                            ["name"] = "Clothing",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [26] = 
                        {
                            ["rule"] = "filtertype(\"enchanting\")",
                            ["name"] = "Enchanting",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [27] = 
                        {
                            ["rule"] = "filtertype(\"jewelrycrafting\")",
                            ["name"] = "Jewelry Crafting",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [28] = 
                        {
                            ["rule"] = "filtertype(\"provisioning\")",
                            ["name"] = "Provisioning",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [29] = 
                        {
                            ["rule"] = "filtertype(\"trait_items\", \"style_materials\")",
                            ["name"] = "Trait/Style Gems",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [30] = 
                        {
                            ["rule"] = "filtertype(\"woodworking\")",
                            ["name"] = "Woodworking",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                    },
                    ["accountWide"] = true,
                    ["general"] = 
                    {
                        ["SHOW_CATEGORY_ITEM_COUNT"] = true,
                        ["SHOW_CATEGORY_COLLAPSE_ICON"] = true,
                        ["SAVE_CATEGORY_COLLAPSE_STATUS"] = false,
                        ["SHOW_MESSAGE_WHEN_TOGGLE"] = false,
                        ["SHOW_CATEGORY_SET_TITLE"] = true,
                    },
                    ["appearance"] = 
                    {
                        ["CATEGORY_OTHER_TEXT"] = "Others",
                        ["CATEGORY_FONT_SIZE"] = 18,
                        ["CATEGORY_FONT_STYLE"] = "soft-shadow-thin",
                        ["CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 1,
                            [2] = 1,
                            [3] = 1,
                        },
                        ["CATEGORY_FONT_NAME"] = "Univers 67",
                        ["CATEGORY_HEADER_HEIGHT"] = 52,
                        ["CATEGORY_FONT_ALIGNMENT"] = 1,
                    },
                    ["bags"] = 
                    {
                        [1] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [2] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [3] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [4] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [2] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [3] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                                [4] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [5] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [6] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [7] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                            },
                        },
                        [5] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                        [6] = 
                        {
                            ["rules"] = 
                            {
                                [1] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "BoP Tradeable",
                                },
                                [2] = 
                                {
                                    ["priority"] = 1000,
                                    ["name"] = "New",
                                },
                                [3] = 
                                {
                                    ["priority"] = 950,
                                    ["name"] = "Container",
                                },
                                [4] = 
                                {
                                    ["priority"] = 900,
                                    ["name"] = "Selling",
                                },
                                [5] = 
                                {
                                    ["priority"] = 850,
                                    ["name"] = "Low Level",
                                },
                                [6] = 
                                {
                                    ["priority"] = 800,
                                    ["name"] = "Deconstruct",
                                },
                                [7] = 
                                {
                                    ["priority"] = 700,
                                    ["name"] = "BoE",
                                },
                                [8] = 
                                {
                                    ["priority"] = 600,
                                    ["name"] = "Researchable",
                                },
                                [9] = 
                                {
                                    ["priority"] = 500,
                                    ["name"] = "Equipping",
                                },
                                [10] = 
                                {
                                    ["priority"] = 490,
                                    ["name"] = "Set",
                                },
                                [11] = 
                                {
                                    ["priority"] = 480,
                                    ["name"] = "Weapon",
                                },
                                [12] = 
                                {
                                    ["priority"] = 470,
                                    ["name"] = "Poison",
                                },
                                [13] = 
                                {
                                    ["priority"] = 460,
                                    ["name"] = "Armor",
                                },
                                [14] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Necklace",
                                },
                                [15] = 
                                {
                                    ["priority"] = 450,
                                    ["name"] = "Ring",
                                },
                                [16] = 
                                {
                                    ["priority"] = 400,
                                    ["name"] = "Quickslots",
                                },
                                [17] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Consumables",
                                },
                                [18] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Glyphs & Gems",
                                },
                                [19] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Recipes & Motifs",
                                },
                                [20] = 
                                {
                                    ["priority"] = 350,
                                    ["name"] = "Maps & Surveys",
                                },
                                [21] = 
                                {
                                    ["priority"] = 300,
                                    ["name"] = "Furnishing",
                                },
                                [22] = 
                                {
                                    ["priority"] = 200,
                                    ["name"] = "Stolen",
                                },
                                [23] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Alchemy",
                                },
                                [24] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Blacksmithing",
                                },
                                [25] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Clothing",
                                },
                                [26] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Enchanting",
                                },
                                [27] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Provisioning",
                                },
                                [28] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Trait/Style Gems",
                                },
                                [29] = 
                                {
                                    ["priority"] = 100,
                                    ["name"] = "Woodworking",
                                },
                            },
                        },
                    },
                },
            },
        },
    },
}
