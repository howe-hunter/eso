AutoCategorySavedVars =
{
    ["Default"] = 
    {
        ["@Motiv_Impact"] = 
        {
            ["8796093067238283"] = 
            {
                ["NA Megaserver"] = 
                {
                    ["appearance"] = 
                    {
                        ["CATEGORY_FONT_STYLE"] = "soft-shadow-thin",
                        ["CATEGORY_FONT_SIZE"] = 18,
                        ["CATEGORY_HEADER_HEIGHT"] = 52,
                        ["CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 1,
                            [2] = 1,
                            [3] = 1,
                        },
                        ["CATEGORY_FONT_ALIGNMENT"] = 1,
                        ["CATEGORY_OTHER_TEXT"] = "Others",
                        ["CATEGORY_FONT_NAME"] = "Univers 67",
                    },
                    ["rules"] = 
                    {
                        [1] = 
                        {
                            ["name"] = "Armor",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "type(\"armor\") and not equiptype(\"neck\",\"ring\")",
                        },
                        [2] = 
                        {
                            ["name"] = "BoE",
                            ["tag"] = "Gears",
                            ["description"] = "BoE gears for selling",
                            ["rule"] = "boundtype(\"on_equip\") and not isbound() and not keepresearch()",
                        },
                        [3] = 
                        {
                            ["name"] = "BoP Tradeable",
                            ["tag"] = "Gears",
                            ["description"] = "Gears are tradeable within a limited time",
                            ["rule"] = "isboptradeable()",
                        },
                        [4] = 
                        {
                            ["name"] = "Deconstruct",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "traitstring(\"intricate\")",
                        },
                        [5] = 
                        {
                            ["name"] = "Equipping",
                            ["tag"] = "Gears",
                            ["description"] = "Currently equipping gears (Gamepad Only)",
                            ["rule"] = "isequipping()",
                        },
                        [6] = 
                        {
                            ["name"] = "Low Level",
                            ["tag"] = "Gears",
                            ["description"] = "Gears below cp 160",
                            ["rule"] = "level() > 1 and cp() < 160 and type(\"armor\", \"weapon\")",
                        },
                        [7] = 
                        {
                            ["name"] = "Necklace",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "equiptype(\"neck\")",
                        },
                        [8] = 
                        {
                            ["name"] = "Researchable",
                            ["tag"] = "Gears",
                            ["description"] = "Gears that keep for research purpose, only keep the low quality, low level one.",
                            ["rule"] = "keepresearch()",
                        },
                        [9] = 
                        {
                            ["name"] = "Ring",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "equiptype(\"ring\")",
                        },
                        [10] = 
                        {
                            ["name"] = "Set",
                            ["tag"] = "Gears",
                            ["description"] = "Auto categorize set gears",
                            ["rule"] = "autoset()",
                        },
                        [11] = 
                        {
                            ["name"] = "Weapon",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "type(\"weapon\")",
                        },
                        [12] = 
                        {
                            ["name"] = "Consumables",
                            ["tag"] = "General Items",
                            ["description"] = "Food, Drink, Potion",
                            ["rule"] = "type(\"food\", \"drink\", \"potion\")",
                        },
                        [13] = 
                        {
                            ["name"] = "Container",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"container\")",
                        },
                        [14] = 
                        {
                            ["name"] = "Furnishing",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"furnishing\")",
                        },
                        [15] = 
                        {
                            ["name"] = "Glyphs & Gems",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"soul_gem\", \"glyph_armor\", \"glyph_jewelry\", \"glyph_weapon\")",
                        },
                        [16] = 
                        {
                            ["name"] = "New",
                            ["tag"] = "General Items",
                            ["description"] = "Items that are received recently",
                            ["rule"] = "isnew()",
                        },
                        [17] = 
                        {
                            ["name"] = "Poison",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"poison\")",
                        },
                        [18] = 
                        {
                            ["name"] = "Quickslots",
                            ["tag"] = "General Items",
                            ["description"] = "Equipped in quickslots",
                            ["rule"] = "isinquickslot()",
                        },
                        [19] = 
                        {
                            ["name"] = "Recipes & Motifs",
                            ["tag"] = "General Items",
                            ["description"] = "All recipes, motifs and recipe fragments.",
                            ["rule"] = "type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\")",
                        },
                        [20] = 
                        {
                            ["name"] = "Selling",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "traitstring(\"ornate\") or sptype(\"collectible_monster_trophy\") or type(\"trash\")",
                        },
                        [21] = 
                        {
                            ["name"] = "Stolen",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "isstolen()",
                        },
                        [22] = 
                        {
                            ["name"] = "Maps & Surveys",
                            ["tag"] = "General Items",
                            ["description"] = "Treasure maps and survey reports",
                            ["rule"] = "sptype(\"trophy_survey_report\", \"trophy_treasure_map\")",
                        },
                        [23] = 
                        {
                            ["name"] = "Alchemy",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"alchemy\")",
                        },
                        [24] = 
                        {
                            ["name"] = "Blacksmithing",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"blacksmithing\")",
                        },
                        [25] = 
                        {
                            ["name"] = "Clothing",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"clothing\")",
                        },
                        [26] = 
                        {
                            ["name"] = "Enchanting",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"enchanting\")",
                        },
                        [27] = 
                        {
                            ["name"] = "Jewelry Crafting",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"jewelrycrafting\")",
                        },
                        [28] = 
                        {
                            ["name"] = "Provisioning",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"provisioning\")",
                        },
                        [29] = 
                        {
                            ["name"] = "Trait/Style Gems",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"trait_items\", \"style_materials\")",
                        },
                        [30] = 
                        {
                            ["name"] = "Woodworking",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"woodworking\")",
                        },
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
                    ["version"] = 1.1000000000,
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
                    ["general"] = 
                    {
                        ["SAVE_CATEGORY_COLLAPSE_STATUS"] = false,
                        ["SHOW_CATEGORY_COLLAPSE_ICON"] = true,
                        ["SHOW_CATEGORY_ITEM_COUNT"] = true,
                        ["SHOW_MESSAGE_WHEN_TOGGLE"] = false,
                        ["SHOW_CATEGORY_SET_TITLE"] = true,
                    },
                    ["accountWide"] = true,
                },
                ["$LastCharacterName"] = "rock-in-bush",
            },
            ["8796093067284513"] = 
            {
                ["NA Megaserver"] = 
                {
                    ["appearance"] = 
                    {
                        ["CATEGORY_FONT_STYLE"] = "soft-shadow-thin",
                        ["CATEGORY_FONT_SIZE"] = 18,
                        ["CATEGORY_HEADER_HEIGHT"] = 52,
                        ["CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 1,
                            [2] = 1,
                            [3] = 1,
                        },
                        ["CATEGORY_FONT_ALIGNMENT"] = 1,
                        ["CATEGORY_OTHER_TEXT"] = "Others",
                        ["CATEGORY_FONT_NAME"] = "Univers 67",
                    },
                    ["rules"] = 
                    {
                        [1] = 
                        {
                            ["name"] = "Armor",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "type(\"armor\") and not equiptype(\"neck\",\"ring\")",
                        },
                        [2] = 
                        {
                            ["name"] = "BoE",
                            ["tag"] = "Gears",
                            ["description"] = "BoE gears for selling",
                            ["rule"] = "boundtype(\"on_equip\") and not isbound() and not keepresearch()",
                        },
                        [3] = 
                        {
                            ["name"] = "BoP Tradeable",
                            ["tag"] = "Gears",
                            ["description"] = "Gears are tradeable within a limited time",
                            ["rule"] = "isboptradeable()",
                        },
                        [4] = 
                        {
                            ["name"] = "Deconstruct",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "traitstring(\"intricate\")",
                        },
                        [5] = 
                        {
                            ["name"] = "Equipping",
                            ["tag"] = "Gears",
                            ["description"] = "Currently equipping gears (Gamepad Only)",
                            ["rule"] = "isequipping()",
                        },
                        [6] = 
                        {
                            ["name"] = "Low Level",
                            ["tag"] = "Gears",
                            ["description"] = "Gears below cp 160",
                            ["rule"] = "level() > 1 and cp() < 160 and type(\"armor\", \"weapon\")",
                        },
                        [7] = 
                        {
                            ["name"] = "Necklace",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "equiptype(\"neck\")",
                        },
                        [8] = 
                        {
                            ["name"] = "Researchable",
                            ["tag"] = "Gears",
                            ["description"] = "Gears that keep for research purpose, only keep the low quality, low level one.",
                            ["rule"] = "keepresearch()",
                        },
                        [9] = 
                        {
                            ["name"] = "Ring",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "equiptype(\"ring\")",
                        },
                        [10] = 
                        {
                            ["name"] = "Set",
                            ["tag"] = "Gears",
                            ["description"] = "Auto categorize set gears",
                            ["rule"] = "autoset()",
                        },
                        [11] = 
                        {
                            ["name"] = "Weapon",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "type(\"weapon\")",
                        },
                        [12] = 
                        {
                            ["name"] = "Consumables",
                            ["tag"] = "General Items",
                            ["description"] = "Food, Drink, Potion",
                            ["rule"] = "type(\"food\", \"drink\", \"potion\")",
                        },
                        [13] = 
                        {
                            ["name"] = "Container",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"container\")",
                        },
                        [14] = 
                        {
                            ["name"] = "Furnishing",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"furnishing\")",
                        },
                        [15] = 
                        {
                            ["name"] = "Glyphs & Gems",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"soul_gem\", \"glyph_armor\", \"glyph_jewelry\", \"glyph_weapon\")",
                        },
                        [16] = 
                        {
                            ["name"] = "New",
                            ["tag"] = "General Items",
                            ["description"] = "Items that are received recently",
                            ["rule"] = "isnew()",
                        },
                        [17] = 
                        {
                            ["name"] = "Poison",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"poison\")",
                        },
                        [18] = 
                        {
                            ["name"] = "Quickslots",
                            ["tag"] = "General Items",
                            ["description"] = "Equipped in quickslots",
                            ["rule"] = "isinquickslot()",
                        },
                        [19] = 
                        {
                            ["name"] = "Recipes & Motifs",
                            ["tag"] = "General Items",
                            ["description"] = "All recipes, motifs and recipe fragments.",
                            ["rule"] = "type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\")",
                        },
                        [20] = 
                        {
                            ["name"] = "Selling",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "traitstring(\"ornate\") or sptype(\"collectible_monster_trophy\") or type(\"trash\")",
                        },
                        [21] = 
                        {
                            ["name"] = "Stolen",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "isstolen()",
                        },
                        [22] = 
                        {
                            ["name"] = "Maps & Surveys",
                            ["tag"] = "General Items",
                            ["description"] = "Treasure maps and survey reports",
                            ["rule"] = "sptype(\"trophy_survey_report\", \"trophy_treasure_map\")",
                        },
                        [23] = 
                        {
                            ["name"] = "Alchemy",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"alchemy\")",
                        },
                        [24] = 
                        {
                            ["name"] = "Blacksmithing",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"blacksmithing\")",
                        },
                        [25] = 
                        {
                            ["name"] = "Clothing",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"clothing\")",
                        },
                        [26] = 
                        {
                            ["name"] = "Enchanting",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"enchanting\")",
                        },
                        [27] = 
                        {
                            ["name"] = "Jewelry Crafting",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"jewelrycrafting\")",
                        },
                        [28] = 
                        {
                            ["name"] = "Provisioning",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"provisioning\")",
                        },
                        [29] = 
                        {
                            ["name"] = "Trait/Style Gems",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"trait_items\", \"style_materials\")",
                        },
                        [30] = 
                        {
                            ["name"] = "Woodworking",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"woodworking\")",
                        },
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
                    ["version"] = 1.1000000000,
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
                    ["general"] = 
                    {
                        ["SAVE_CATEGORY_COLLAPSE_STATUS"] = false,
                        ["SHOW_CATEGORY_COLLAPSE_ICON"] = true,
                        ["SHOW_CATEGORY_ITEM_COUNT"] = true,
                        ["SHOW_MESSAGE_WHEN_TOGGLE"] = false,
                        ["SHOW_CATEGORY_SET_TITLE"] = true,
                    },
                    ["accountWide"] = true,
                },
                ["$LastCharacterName"] = "rieyya",
            },
            ["8796093067978059"] = 
            {
                ["NA Megaserver"] = 
                {
                    ["appearance"] = 
                    {
                        ["CATEGORY_FONT_STYLE"] = "soft-shadow-thin",
                        ["CATEGORY_FONT_SIZE"] = 18,
                        ["CATEGORY_HEADER_HEIGHT"] = 52,
                        ["CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 1,
                            [2] = 1,
                            [3] = 1,
                        },
                        ["CATEGORY_FONT_ALIGNMENT"] = 1,
                        ["CATEGORY_OTHER_TEXT"] = "Others",
                        ["CATEGORY_FONT_NAME"] = "Univers 67",
                    },
                    ["rules"] = 
                    {
                        [1] = 
                        {
                            ["name"] = "Armor",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "type(\"armor\") and not equiptype(\"neck\",\"ring\")",
                        },
                        [2] = 
                        {
                            ["name"] = "BoE",
                            ["tag"] = "Gears",
                            ["description"] = "BoE gears for selling",
                            ["rule"] = "boundtype(\"on_equip\") and not isbound() and not keepresearch()",
                        },
                        [3] = 
                        {
                            ["name"] = "BoP Tradeable",
                            ["tag"] = "Gears",
                            ["description"] = "Gears are tradeable within a limited time",
                            ["rule"] = "isboptradeable()",
                        },
                        [4] = 
                        {
                            ["name"] = "Deconstruct",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "traitstring(\"intricate\")",
                        },
                        [5] = 
                        {
                            ["name"] = "Equipping",
                            ["tag"] = "Gears",
                            ["description"] = "Currently equipping gears (Gamepad Only)",
                            ["rule"] = "isequipping()",
                        },
                        [6] = 
                        {
                            ["name"] = "Low Level",
                            ["tag"] = "Gears",
                            ["description"] = "Gears below cp 160",
                            ["rule"] = "level() > 1 and cp() < 160 and type(\"armor\", \"weapon\")",
                        },
                        [7] = 
                        {
                            ["name"] = "Necklace",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "equiptype(\"neck\")",
                        },
                        [8] = 
                        {
                            ["name"] = "Researchable",
                            ["tag"] = "Gears",
                            ["description"] = "Gears that keep for research purpose, only keep the low quality, low level one.",
                            ["rule"] = "keepresearch()",
                        },
                        [9] = 
                        {
                            ["name"] = "Ring",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "equiptype(\"ring\")",
                        },
                        [10] = 
                        {
                            ["name"] = "Set",
                            ["tag"] = "Gears",
                            ["description"] = "Auto categorize set gears",
                            ["rule"] = "autoset()",
                        },
                        [11] = 
                        {
                            ["name"] = "Weapon",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "type(\"weapon\")",
                        },
                        [12] = 
                        {
                            ["name"] = "Consumables",
                            ["tag"] = "General Items",
                            ["description"] = "Food, Drink, Potion",
                            ["rule"] = "type(\"food\", \"drink\", \"potion\")",
                        },
                        [13] = 
                        {
                            ["name"] = "Container",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"container\")",
                        },
                        [14] = 
                        {
                            ["name"] = "Furnishing",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"furnishing\")",
                        },
                        [15] = 
                        {
                            ["name"] = "Glyphs & Gems",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"soul_gem\", \"glyph_armor\", \"glyph_jewelry\", \"glyph_weapon\")",
                        },
                        [16] = 
                        {
                            ["name"] = "New",
                            ["tag"] = "General Items",
                            ["description"] = "Items that are received recently",
                            ["rule"] = "isnew()",
                        },
                        [17] = 
                        {
                            ["name"] = "Poison",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"poison\")",
                        },
                        [18] = 
                        {
                            ["name"] = "Quickslots",
                            ["tag"] = "General Items",
                            ["description"] = "Equipped in quickslots",
                            ["rule"] = "isinquickslot()",
                        },
                        [19] = 
                        {
                            ["name"] = "Recipes & Motifs",
                            ["tag"] = "General Items",
                            ["description"] = "All recipes, motifs and recipe fragments.",
                            ["rule"] = "type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\")",
                        },
                        [20] = 
                        {
                            ["name"] = "Selling",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "traitstring(\"ornate\") or sptype(\"collectible_monster_trophy\") or type(\"trash\")",
                        },
                        [21] = 
                        {
                            ["name"] = "Stolen",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "isstolen()",
                        },
                        [22] = 
                        {
                            ["name"] = "Maps & Surveys",
                            ["tag"] = "General Items",
                            ["description"] = "Treasure maps and survey reports",
                            ["rule"] = "sptype(\"trophy_survey_report\", \"trophy_treasure_map\")",
                        },
                        [23] = 
                        {
                            ["name"] = "Alchemy",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"alchemy\")",
                        },
                        [24] = 
                        {
                            ["name"] = "Blacksmithing",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"blacksmithing\")",
                        },
                        [25] = 
                        {
                            ["name"] = "Clothing",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"clothing\")",
                        },
                        [26] = 
                        {
                            ["name"] = "Enchanting",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"enchanting\")",
                        },
                        [27] = 
                        {
                            ["name"] = "Jewelry Crafting",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"jewelrycrafting\")",
                        },
                        [28] = 
                        {
                            ["name"] = "Provisioning",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"provisioning\")",
                        },
                        [29] = 
                        {
                            ["name"] = "Trait/Style Gems",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"trait_items\", \"style_materials\")",
                        },
                        [30] = 
                        {
                            ["name"] = "Woodworking",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"woodworking\")",
                        },
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
                    ["version"] = 1.1000000000,
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
                    ["general"] = 
                    {
                        ["SAVE_CATEGORY_COLLAPSE_STATUS"] = false,
                        ["SHOW_CATEGORY_COLLAPSE_ICON"] = true,
                        ["SHOW_CATEGORY_ITEM_COUNT"] = true,
                        ["SHOW_MESSAGE_WHEN_TOGGLE"] = false,
                        ["SHOW_CATEGORY_SET_TITLE"] = true,
                    },
                    ["accountWide"] = true,
                },
                ["$LastCharacterName"] = "katarrnn",
            },
            ["$AccountWide"] = 
            {
                ["NA Megaserver"] = 
                {
                    ["appearance"] = 
                    {
                        ["CATEGORY_FONT_STYLE"] = "soft-shadow-thin",
                        ["CATEGORY_FONT_SIZE"] = 15,
                        ["CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 1,
                            [2] = 1,
                            [3] = 1,
                        },
                        ["CATEGORY_HEADER_HEIGHT"] = 20,
                        ["HIDDEN_CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 125,
                            [2] = 125,
                            [3] = 125,
                        },
                        ["CATEGORY_FONT_ALIGNMENT"] = 0,
                        ["CATEGORY_OTHER_TEXT"] = "Others",
                        ["CATEGORY_FONT_NAME"] = "Univers 67",
                    },
                    ["rules"] = 
                    {
                        [1] = 
                        {
                            ["rule"] = "filtertype(\"alchemy\")",
                            ["name"] = "Alchemy",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [2] = 
                        {
                            ["rule"] = "type(\"armor\") and not equiptype(\"neck\",\"ring\")",
                            ["name"] = "Armor",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [3] = 
                        {
                            ["rule"] = "filtertype(\"blacksmithing\")",
                            ["name"] = "Blacksmithing",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [4] = 
                        {
                            ["rule"] = "boundtype(\"on_equip\") and not isbound() and not keepresearch()",
                            ["name"] = "BoE",
                            ["description"] = "BoE gears for selling",
                            ["tag"] = "Gears",
                        },
                        [5] = 
                        {
                            ["rule"] = "isboptradeable() and not islocked()",
                            ["name"] = "BoP Tradeable",
                            ["description"] = "Gears are tradeable within a limited time",
                            ["tag"] = "Gears",
                        },
                        [6] = 
                        {
                            ["rule"] = "filtertype(\"clothing\")",
                            ["name"] = "Clothing",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [7] = 
                        {
                            ["rule"] = "type(\"food\", \"drink\", \"potion\") or type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\", \"trophy_survey_report\", \"trophy_treasure_map\") and not isinquickslot() and not type(\"container\")",
                            ["name"] = "Consumables",
                            ["description"] = "Food, Drink, Potion",
                            ["tag"] = "General Items",
                        },
                        [8] = 
                        {
                            ["rule"] = "type(\"container\")",
                            ["name"] = "Container",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [9] = 
                        {
                            ["rule"] = "filtertype(\"alchemy\", \"blacksmithing\", \"clothing\", \"enchanting\", \"jewelrycrafting\", \"provisioning\", \"woodworking\", \"trait_items\", \"style_materials\")",
                            ["name"] = "Crafting",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [10] = 
                        {
                            ["rule"] = "traitstring(\"intricate\") or keepresearch() and not islocked()",
                            ["name"] = "Decon/Research",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [11] = 
                        {
                            ["rule"] = "filtertype(\"enchanting\")",
                            ["name"] = "Enchanting",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [12] = 
                        {
                            ["rule"] = "isequipping()",
                            ["name"] = "Equipping",
                            ["description"] = "Currently equipping gears (Gamepad Only)",
                            ["tag"] = "Gears",
                        },
                        [13] = 
                        {
                            ["rule"] = "filtertype(\"furnishing\")",
                            ["name"] = "Furnishing",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [14] = 
                        {
                            ["rule"] = "type(\"glyph_armor\", \"glyph_weapon\", \"glyph_jewelry\")",
                            ["name"] = "Glyphs",
                            ["description"] = "",
                            ["tag"] = "Gears",
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
                            ["rule"] = "equiptype(\"neck\", \"ring\") and not autoset()",
                            ["name"] = "Jewelry",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [17] = 
                        {
                            ["rule"] = "filtertype(\"jewelrycrafting\")",
                            ["name"] = "Jewelry Crafting",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [18] = 
                        {
                            ["rule"] = "level() > 1 and cp() < 160 and type(\"armor\", \"weapon\")",
                            ["name"] = "Low Level",
                            ["description"] = "Gears below cp 160",
                            ["tag"] = "Gears",
                        },
                        [19] = 
                        {
                            ["rule"] = "sptype(\"trophy_survey_report\", \"trophy_treasure_map\")",
                            ["name"] = "Maps & Surveys",
                            ["description"] = "Treasure maps and survey reports",
                            ["tag"] = "General Items",
                        },
                        [20] = 
                        {
                            ["rule"] = "isnew()",
                            ["name"] = "New",
                            ["description"] = "Items that are received recently",
                            ["tag"] = "General Items",
                        },
                        [21] = 
                        {
                            ["rule"] = "not isbound() and not iscollected() and isset()",
                            ["name"] = "Not Collected",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [22] = 
                        {
                            ["rule"] = "type(\"poison\")",
                            ["name"] = "Poison",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [23] = 
                        {
                            ["rule"] = "filtertype(\"provisioning\")",
                            ["name"] = "Provisioning",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [24] = 
                        {
                            ["rule"] = "isinquickslot()",
                            ["name"] = "Quickslots",
                            ["description"] = "Equipped in quickslots",
                            ["tag"] = "General Items",
                        },
                        [25] = 
                        {
                            ["rule"] = "type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\")",
                            ["name"] = "Recipes & Motifs",
                            ["description"] = "All recipes, motifs and recipe fragments.",
                            ["tag"] = "General Items",
                        },
                        [26] = 
                        {
                            ["rule"] = "equiptype(\"ring\")",
                            ["name"] = "Ring",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [27] = 
                        {
                            ["rule"] = "traitstring(\"ornate\") or sptype(\"collectible_monster_trophy\") or type(\"trash\") or type(\"poison\", \"soul_gem\") or isstolen()",
                            ["name"] = "Selling",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [28] = 
                        {
                            ["rule"] = "autoset()",
                            ["name"] = "Set",
                            ["description"] = "Auto categorize set gears",
                            ["tag"] = "Gears",
                        },
                        [29] = 
                        {
                            ["rule"] = "isstolen()",
                            ["name"] = "Stolen",
                            ["description"] = "",
                            ["tag"] = "General Items",
                        },
                        [30] = 
                        {
                            ["rule"] = "filtertype(\"trait_items\", \"style_materials\")",
                            ["name"] = "Trait/Style Gems",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
                        [31] = 
                        {
                            ["rule"] = "type(\"weapon\", \"armor\") and not autoset()",
                            ["name"] = "Weapons/Armor",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [32] = 
                        {
                            ["rule"] = "type(\"weapon\", \"armor\") and not autoset() and quality(\"blue\")",
                            ["name"] = "Weapons/Armor (Blue)",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [33] = 
                        {
                            ["rule"] = "type(\"weapon\", \"armor\") and not autoset() and quality(\"gold\")",
                            ["name"] = "Weapons/Armor (Gold)",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [34] = 
                        {
                            ["rule"] = "type(\"weapon\", \"armor\") and not autoset() and quality(\"green\")",
                            ["name"] = "Weapons/Armor (Green)",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [35] = 
                        {
                            ["rule"] = "type(\"weapon\", \"armor\") and not autoset() and quality(\"purple\")",
                            ["name"] = "Weapons/Armor (Purple)",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [36] = 
                        {
                            ["rule"] = "type(\"weapon\", \"armor\") and not autoset() and quality(\"normal\")",
                            ["name"] = "Weapons/Armor (White)",
                            ["description"] = "",
                            ["tag"] = "Gears",
                        },
                        [37] = 
                        {
                            ["rule"] = "filtertype(\"woodworking\")",
                            ["name"] = "Woodworking",
                            ["description"] = "",
                            ["tag"] = "Materials",
                        },
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
                    ["version"] = 1.1000000000,
                    ["general"] = 
                    {
                        ["SAVE_CATEGORY_COLLAPSE_STATUS"] = true,
                        ["SHOW_CATEGORY_COLLAPSE_ICON"] = true,
                        ["SHOW_CATEGORY_ITEM_COUNT"] = true,
                        ["SHOW_MESSAGE_WHEN_TOGGLE"] = false,
                        ["SHOW_CATEGORY_SET_TITLE"] = true,
                    },
                    ["collapses"] = 
                    {
                        [1] = 
                        {
                            ["Set (Skooma Smuggler)"] = false,
                            ["Set (Broken Soul)"] = false,
                            ["Set (Sanctuary)"] = false,
                            ["Set (Netch's Touch)"] = false,
                            ["Provisioning"] = false,
                            ["Set (Prayer Shawl)"] = false,
                            ["Set (Queen's Elegance)"] = false,
                            ["Set (Treasure Hunter)"] = false,
                            ["Set (Barkskin)"] = false,
                            ["Set (Venomous Smite)"] = false,
                            ["Weapons/Armor"] = false,
                            ["Deconstruct"] = false,
                            ["Ring"] = false,
                            ["Weapon/Armor (blue)"] = false,
                            ["Set (Ebon Armory)"] = true,
                            ["Set (Leviathan)"] = false,
                            ["Set (Spinner's Garments)"] = true,
                            ["Poison"] = true,
                            ["Glyphs & Gems"] = true,
                            ["Clothing"] = false,
                            ["Set (Dreamer's Mantle)"] = false,
                            ["Weapon/Armor"] = false,
                            ["Alchemy"] = false,
                            ["Set (Twin Sisters)"] = false,
                            ["Set (Armor of the Trainee)"] = false,
                            ["Set (Crusader)"] = false,
                            ["Set (Tormentor)"] = true,
                            ["Gear (Blue)"] = false,
                            ["Set (Agility)"] = false,
                            ["Set (Shadowrend)"] = true,
                            ["Set (Salvation)"] = true,
                            ["Set (Overwhelming Surge)"] = false,
                            ["Set (Nikulas' Heavy Armor)"] = false,
                            ["Trait/Style Gems"] = true,
                            ["Set (Senche's Bite)"] = false,
                            ["Set (Sergeant's Mail)"] = false,
                            ["Woodworking"] = true,
                            ["Set (Knightmare)"] = false,
                            ["Set (Thunderbug's Carapace)"] = false,
                            ["Necklace"] = false,
                            ["Set (Jailbreaker)"] = true,
                            ["Set (Endurance)"] = false,
                            ["Armor"] = true,
                            ["Set (Combat Physician)"] = false,
                            ["Set (Shroud of the Lich)"] = false,
                            ["Set (Armor of the Veiled Heritance)"] = false,
                            ["Researchable"] = true,
                            ["Weapon"] = true,
                            ["Set (Eternal Vigor)"] = false,
                            ["Set (Plague Doctor)"] = false,
                            ["Set (Duneripper's Scales)"] = false,
                            ["Set (Spelunker)"] = false,
                            ["Set (Soulshine)"] = false,
                            ["Quickslots"] = true,
                            ["Maps & Surveys"] = true,
                        },
                        [2] = 
                        {
                            ["Provisioning"] = true,
                            ["Trait/Style Gems"] = true,
                        },
                        [3] = 
                        {
                            ["Low Level"] = false,
                            ["Blacksmithing"] = false,
                            ["Others"] = false,
                            ["Provisioning"] = false,
                            ["Trait/Style Gems"] = false,
                            ["Woodworking"] = false,
                            ["Selling"] = false,
                            ["Decon/Research"] = false,
                            ["BoE"] = false,
                            ["Furnishing"] = false,
                            ["Armor"] = false,
                            ["Glyphs & Gems"] = false,
                            ["Enchanting"] = false,
                            ["Consumables"] = false,
                            ["Clothing"] = false,
                            ["Weapons/Armor (Green)"] = false,
                            ["Quickslots"] = false,
                            ["Alchemy"] = false,
                            ["Container"] = false,
                        },
                        [4] = 
                        {
                        },
                        [5] = 
                        {
                            ["Set (Skooma Smuggler)"] = false,
                            ["Set (Durok's Bane)"] = false,
                            ["Set (Sanctuary)"] = false,
                            ["Set (Netch's Touch)"] = false,
                            ["Set (Prayer Shawl)"] = false,
                            ["Set (Treasure Hunter)"] = false,
                            ["Set (Barkskin)"] = false,
                            ["Set (Venomous Smite)"] = false,
                            ["Set (Tormentor)"] = true,
                            ["Set (Agility)"] = false,
                            ["Weapon/Armor"] = false,
                            ["Set (Orgnum's Scales)"] = false,
                            ["Set (Spider Cultist Cowl)"] = false,
                            ["Set (Shadowrend)"] = false,
                            ["Set (Overwhelming Surge)"] = false,
                            ["Set (Jailbreaker)"] = false,
                            ["Set (Defiler)"] = false,
                            ["Set (Ebon Armory)"] = false,
                            ["Set (Twin Sisters)"] = false,
                            ["Set (Thunderbug's Carapace)"] = false,
                            ["Set (Maw of the Infernal)"] = false,
                            ["Set (Armor of the Trainee)"] = false,
                            ["Set (Endurance)"] = false,
                            ["Set (Soulshine)"] = false,
                            ["Set (Combat Physician)"] = false,
                            ["Set (Sergeant's Mail)"] = false,
                            ["Set (Armor of the Veiled Heritance)"] = false,
                            ["Set (Mad Tinkerer)"] = false,
                            ["Set (Shroud of the Lich)"] = false,
                            ["Set (Knightmare)"] = false,
                            ["Set (Spelunker)"] = false,
                            ["Set (Duneripper's Scales)"] = false,
                            ["Set (Plague Doctor)"] = false,
                            ["Set (Swarm Mother)"] = true,
                            ["Set (Jolting Arms)"] = false,
                            ["Set (Leviathan)"] = false,
                            ["Set (Senche's Bite)"] = false,
                        },
                        [6] = 
                        {
                            ["Set (Hatchling's Shell)"] = false,
                            ["Low Level"] = false,
                            ["Set (Undaunted Bastion)"] = false,
                            ["Blacksmithing"] = false,
                            ["Set (Willpower)"] = false,
                            ["Set (Armor of the Trainee)"] = false,
                            ["Set (Overwhelming Surge)"] = false,
                            ["Trait/Style Gems"] = false,
                            ["Set (Thunderbug's Carapace)"] = false,
                            ["Set (Jolting Arms)"] = false,
                            ["Set (Venomous Smite)"] = false,
                            ["Set (Endurance)"] = false,
                            ["Set (Coward's Gear)"] = false,
                            ["Set (Mother's Sorrow)"] = false,
                            ["Set (Agility)"] = false,
                            ["Set (Twin Sisters)"] = false,
                            ["Set (Plague Doctor)"] = false,
                        },
                    },
                },
            },
            ["8796093067238241"] = 
            {
                ["NA Megaserver"] = 
                {
                    ["appearance"] = 
                    {
                        ["CATEGORY_FONT_STYLE"] = "soft-shadow-thin",
                        ["CATEGORY_FONT_SIZE"] = 18,
                        ["CATEGORY_HEADER_HEIGHT"] = 52,
                        ["CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 1,
                            [2] = 1,
                            [3] = 1,
                        },
                        ["CATEGORY_FONT_ALIGNMENT"] = 1,
                        ["CATEGORY_OTHER_TEXT"] = "Others",
                        ["CATEGORY_FONT_NAME"] = "Univers 67",
                    },
                    ["rules"] = 
                    {
                        [1] = 
                        {
                            ["name"] = "Armor",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "type(\"armor\") and not equiptype(\"neck\",\"ring\")",
                        },
                        [2] = 
                        {
                            ["name"] = "BoE",
                            ["tag"] = "Gears",
                            ["description"] = "BoE gears for selling",
                            ["rule"] = "boundtype(\"on_equip\") and not isbound() and not keepresearch()",
                        },
                        [3] = 
                        {
                            ["name"] = "BoP Tradeable",
                            ["tag"] = "Gears",
                            ["description"] = "Gears are tradeable within a limited time",
                            ["rule"] = "isboptradeable()",
                        },
                        [4] = 
                        {
                            ["name"] = "Deconstruct",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "traitstring(\"intricate\")",
                        },
                        [5] = 
                        {
                            ["name"] = "Equipping",
                            ["tag"] = "Gears",
                            ["description"] = "Currently equipping gears (Gamepad Only)",
                            ["rule"] = "isequipping()",
                        },
                        [6] = 
                        {
                            ["name"] = "Low Level",
                            ["tag"] = "Gears",
                            ["description"] = "Gears below cp 160",
                            ["rule"] = "level() > 1 and cp() < 160 and type(\"armor\", \"weapon\")",
                        },
                        [7] = 
                        {
                            ["name"] = "Necklace",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "equiptype(\"neck\")",
                        },
                        [8] = 
                        {
                            ["name"] = "Researchable",
                            ["tag"] = "Gears",
                            ["description"] = "Gears that keep for research purpose, only keep the low quality, low level one.",
                            ["rule"] = "keepresearch()",
                        },
                        [9] = 
                        {
                            ["name"] = "Ring",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "equiptype(\"ring\")",
                        },
                        [10] = 
                        {
                            ["name"] = "Set",
                            ["tag"] = "Gears",
                            ["description"] = "Auto categorize set gears",
                            ["rule"] = "autoset()",
                        },
                        [11] = 
                        {
                            ["name"] = "Weapon",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "type(\"weapon\")",
                        },
                        [12] = 
                        {
                            ["name"] = "Consumables",
                            ["tag"] = "General Items",
                            ["description"] = "Food, Drink, Potion",
                            ["rule"] = "type(\"food\", \"drink\", \"potion\")",
                        },
                        [13] = 
                        {
                            ["name"] = "Container",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"container\")",
                        },
                        [14] = 
                        {
                            ["name"] = "Furnishing",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"furnishing\")",
                        },
                        [15] = 
                        {
                            ["name"] = "Glyphs & Gems",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"soul_gem\", \"glyph_armor\", \"glyph_jewelry\", \"glyph_weapon\")",
                        },
                        [16] = 
                        {
                            ["name"] = "New",
                            ["tag"] = "General Items",
                            ["description"] = "Items that are received recently",
                            ["rule"] = "isnew()",
                        },
                        [17] = 
                        {
                            ["name"] = "Poison",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"poison\")",
                        },
                        [18] = 
                        {
                            ["name"] = "Quickslots",
                            ["tag"] = "General Items",
                            ["description"] = "Equipped in quickslots",
                            ["rule"] = "isinquickslot()",
                        },
                        [19] = 
                        {
                            ["name"] = "Recipes & Motifs",
                            ["tag"] = "General Items",
                            ["description"] = "All recipes, motifs and recipe fragments.",
                            ["rule"] = "type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\")",
                        },
                        [20] = 
                        {
                            ["name"] = "Selling",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "traitstring(\"ornate\") or sptype(\"collectible_monster_trophy\") or type(\"trash\")",
                        },
                        [21] = 
                        {
                            ["name"] = "Stolen",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "isstolen()",
                        },
                        [22] = 
                        {
                            ["name"] = "Maps & Surveys",
                            ["tag"] = "General Items",
                            ["description"] = "Treasure maps and survey reports",
                            ["rule"] = "sptype(\"trophy_survey_report\", \"trophy_treasure_map\")",
                        },
                        [23] = 
                        {
                            ["name"] = "Alchemy",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"alchemy\")",
                        },
                        [24] = 
                        {
                            ["name"] = "Blacksmithing",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"blacksmithing\")",
                        },
                        [25] = 
                        {
                            ["name"] = "Clothing",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"clothing\")",
                        },
                        [26] = 
                        {
                            ["name"] = "Enchanting",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"enchanting\")",
                        },
                        [27] = 
                        {
                            ["name"] = "Jewelry Crafting",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"jewelrycrafting\")",
                        },
                        [28] = 
                        {
                            ["name"] = "Provisioning",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"provisioning\")",
                        },
                        [29] = 
                        {
                            ["name"] = "Trait/Style Gems",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"trait_items\", \"style_materials\")",
                        },
                        [30] = 
                        {
                            ["name"] = "Woodworking",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"woodworking\")",
                        },
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
                    ["version"] = 1.1000000000,
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
                    ["general"] = 
                    {
                        ["SAVE_CATEGORY_COLLAPSE_STATUS"] = false,
                        ["SHOW_CATEGORY_COLLAPSE_ICON"] = true,
                        ["SHOW_CATEGORY_ITEM_COUNT"] = true,
                        ["SHOW_MESSAGE_WHEN_TOGGLE"] = false,
                        ["SHOW_CATEGORY_SET_TITLE"] = true,
                    },
                    ["accountWide"] = true,
                },
                ["$LastCharacterName"] = "evil janet",
            },
            ["8796093041658833"] = 
            {
                ["NA Megaserver"] = 
                {
                    ["appearance"] = 
                    {
                        ["CATEGORY_FONT_STYLE"] = "soft-shadow-thin",
                        ["CATEGORY_FONT_SIZE"] = 18,
                        ["CATEGORY_HEADER_HEIGHT"] = 52,
                        ["CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 1,
                            [2] = 1,
                            [3] = 1,
                        },
                        ["CATEGORY_FONT_ALIGNMENT"] = 1,
                        ["CATEGORY_OTHER_TEXT"] = "Others",
                        ["CATEGORY_FONT_NAME"] = "Univers 67",
                    },
                    ["rules"] = 
                    {
                        [1] = 
                        {
                            ["name"] = "Armor",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "type(\"armor\") and not equiptype(\"neck\",\"ring\")",
                        },
                        [2] = 
                        {
                            ["name"] = "BoE",
                            ["tag"] = "Gears",
                            ["description"] = "BoE gears for selling",
                            ["rule"] = "boundtype(\"on_equip\") and not isbound() and not keepresearch()",
                        },
                        [3] = 
                        {
                            ["name"] = "BoP Tradeable",
                            ["tag"] = "Gears",
                            ["description"] = "Gears are tradeable within a limited time",
                            ["rule"] = "isboptradeable()",
                        },
                        [4] = 
                        {
                            ["name"] = "Deconstruct",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "traitstring(\"intricate\")",
                        },
                        [5] = 
                        {
                            ["name"] = "Equipping",
                            ["tag"] = "Gears",
                            ["description"] = "Currently equipping gears (Gamepad Only)",
                            ["rule"] = "isequipping()",
                        },
                        [6] = 
                        {
                            ["name"] = "Low Level",
                            ["tag"] = "Gears",
                            ["description"] = "Gears below cp 160",
                            ["rule"] = "level() > 1 and cp() < 160 and type(\"armor\", \"weapon\")",
                        },
                        [7] = 
                        {
                            ["name"] = "Necklace",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "equiptype(\"neck\")",
                        },
                        [8] = 
                        {
                            ["name"] = "Researchable",
                            ["tag"] = "Gears",
                            ["description"] = "Gears that keep for research purpose, only keep the low quality, low level one.",
                            ["rule"] = "keepresearch()",
                        },
                        [9] = 
                        {
                            ["name"] = "Ring",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "equiptype(\"ring\")",
                        },
                        [10] = 
                        {
                            ["name"] = "Set",
                            ["tag"] = "Gears",
                            ["description"] = "Auto categorize set gears",
                            ["rule"] = "autoset()",
                        },
                        [11] = 
                        {
                            ["name"] = "Weapon",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "type(\"weapon\")",
                        },
                        [12] = 
                        {
                            ["name"] = "Consumables",
                            ["tag"] = "General Items",
                            ["description"] = "Food, Drink, Potion",
                            ["rule"] = "type(\"food\", \"drink\", \"potion\")",
                        },
                        [13] = 
                        {
                            ["name"] = "Container",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"container\")",
                        },
                        [14] = 
                        {
                            ["name"] = "Furnishing",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"furnishing\")",
                        },
                        [15] = 
                        {
                            ["name"] = "Glyphs & Gems",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"soul_gem\", \"glyph_armor\", \"glyph_jewelry\", \"glyph_weapon\")",
                        },
                        [16] = 
                        {
                            ["name"] = "New",
                            ["tag"] = "General Items",
                            ["description"] = "Items that are received recently",
                            ["rule"] = "isnew()",
                        },
                        [17] = 
                        {
                            ["name"] = "Poison",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"poison\")",
                        },
                        [18] = 
                        {
                            ["name"] = "Quickslots",
                            ["tag"] = "General Items",
                            ["description"] = "Equipped in quickslots",
                            ["rule"] = "isinquickslot()",
                        },
                        [19] = 
                        {
                            ["name"] = "Recipes & Motifs",
                            ["tag"] = "General Items",
                            ["description"] = "All recipes, motifs and recipe fragments.",
                            ["rule"] = "type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\")",
                        },
                        [20] = 
                        {
                            ["name"] = "Selling",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "traitstring(\"ornate\") or sptype(\"collectible_monster_trophy\") or type(\"trash\")",
                        },
                        [21] = 
                        {
                            ["name"] = "Stolen",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "isstolen()",
                        },
                        [22] = 
                        {
                            ["name"] = "Maps & Surveys",
                            ["tag"] = "General Items",
                            ["description"] = "Treasure maps and survey reports",
                            ["rule"] = "sptype(\"trophy_survey_report\", \"trophy_treasure_map\")",
                        },
                        [23] = 
                        {
                            ["name"] = "Alchemy",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"alchemy\")",
                        },
                        [24] = 
                        {
                            ["name"] = "Blacksmithing",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"blacksmithing\")",
                        },
                        [25] = 
                        {
                            ["name"] = "Clothing",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"clothing\")",
                        },
                        [26] = 
                        {
                            ["name"] = "Enchanting",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"enchanting\")",
                        },
                        [27] = 
                        {
                            ["name"] = "Jewelry Crafting",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"jewelrycrafting\")",
                        },
                        [28] = 
                        {
                            ["name"] = "Provisioning",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"provisioning\")",
                        },
                        [29] = 
                        {
                            ["name"] = "Trait/Style Gems",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"trait_items\", \"style_materials\")",
                        },
                        [30] = 
                        {
                            ["name"] = "Woodworking",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"woodworking\")",
                        },
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
                    ["version"] = 1.1000000000,
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
                    ["general"] = 
                    {
                        ["SAVE_CATEGORY_COLLAPSE_STATUS"] = false,
                        ["SHOW_CATEGORY_COLLAPSE_ICON"] = true,
                        ["SHOW_CATEGORY_ITEM_COUNT"] = true,
                        ["SHOW_MESSAGE_WHEN_TOGGLE"] = false,
                        ["SHOW_CATEGORY_SET_TITLE"] = true,
                    },
                    ["accountWide"] = true,
                },
                ["$LastCharacterName"] = "Durro'tan",
            },
            ["8796093067191337"] = 
            {
                ["NA Megaserver"] = 
                {
                    ["appearance"] = 
                    {
                        ["CATEGORY_FONT_STYLE"] = "soft-shadow-thin",
                        ["CATEGORY_FONT_SIZE"] = 18,
                        ["CATEGORY_HEADER_HEIGHT"] = 52,
                        ["CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 1,
                            [2] = 1,
                            [3] = 1,
                        },
                        ["CATEGORY_FONT_ALIGNMENT"] = 1,
                        ["CATEGORY_OTHER_TEXT"] = "Others",
                        ["CATEGORY_FONT_NAME"] = "Univers 67",
                    },
                    ["rules"] = 
                    {
                        [1] = 
                        {
                            ["name"] = "Armor",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "type(\"armor\") and not equiptype(\"neck\",\"ring\")",
                        },
                        [2] = 
                        {
                            ["name"] = "BoE",
                            ["tag"] = "Gears",
                            ["description"] = "BoE gears for selling",
                            ["rule"] = "boundtype(\"on_equip\") and not isbound() and not keepresearch()",
                        },
                        [3] = 
                        {
                            ["name"] = "BoP Tradeable",
                            ["tag"] = "Gears",
                            ["description"] = "Gears are tradeable within a limited time",
                            ["rule"] = "isboptradeable()",
                        },
                        [4] = 
                        {
                            ["name"] = "Deconstruct",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "traitstring(\"intricate\")",
                        },
                        [5] = 
                        {
                            ["name"] = "Equipping",
                            ["tag"] = "Gears",
                            ["description"] = "Currently equipping gears (Gamepad Only)",
                            ["rule"] = "isequipping()",
                        },
                        [6] = 
                        {
                            ["name"] = "Low Level",
                            ["tag"] = "Gears",
                            ["description"] = "Gears below cp 160",
                            ["rule"] = "level() > 1 and cp() < 160 and type(\"armor\", \"weapon\")",
                        },
                        [7] = 
                        {
                            ["name"] = "Necklace",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "equiptype(\"neck\")",
                        },
                        [8] = 
                        {
                            ["name"] = "Researchable",
                            ["tag"] = "Gears",
                            ["description"] = "Gears that keep for research purpose, only keep the low quality, low level one.",
                            ["rule"] = "keepresearch()",
                        },
                        [9] = 
                        {
                            ["name"] = "Ring",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "equiptype(\"ring\")",
                        },
                        [10] = 
                        {
                            ["name"] = "Set",
                            ["tag"] = "Gears",
                            ["description"] = "Auto categorize set gears",
                            ["rule"] = "autoset()",
                        },
                        [11] = 
                        {
                            ["name"] = "Weapon",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "type(\"weapon\")",
                        },
                        [12] = 
                        {
                            ["name"] = "Consumables",
                            ["tag"] = "General Items",
                            ["description"] = "Food, Drink, Potion",
                            ["rule"] = "type(\"food\", \"drink\", \"potion\")",
                        },
                        [13] = 
                        {
                            ["name"] = "Container",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"container\")",
                        },
                        [14] = 
                        {
                            ["name"] = "Furnishing",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"furnishing\")",
                        },
                        [15] = 
                        {
                            ["name"] = "Glyphs & Gems",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"soul_gem\", \"glyph_armor\", \"glyph_jewelry\", \"glyph_weapon\")",
                        },
                        [16] = 
                        {
                            ["name"] = "New",
                            ["tag"] = "General Items",
                            ["description"] = "Items that are received recently",
                            ["rule"] = "isnew()",
                        },
                        [17] = 
                        {
                            ["name"] = "Poison",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"poison\")",
                        },
                        [18] = 
                        {
                            ["name"] = "Quickslots",
                            ["tag"] = "General Items",
                            ["description"] = "Equipped in quickslots",
                            ["rule"] = "isinquickslot()",
                        },
                        [19] = 
                        {
                            ["name"] = "Recipes & Motifs",
                            ["tag"] = "General Items",
                            ["description"] = "All recipes, motifs and recipe fragments.",
                            ["rule"] = "type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\")",
                        },
                        [20] = 
                        {
                            ["name"] = "Selling",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "traitstring(\"ornate\") or sptype(\"collectible_monster_trophy\") or type(\"trash\")",
                        },
                        [21] = 
                        {
                            ["name"] = "Stolen",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "isstolen()",
                        },
                        [22] = 
                        {
                            ["name"] = "Maps & Surveys",
                            ["tag"] = "General Items",
                            ["description"] = "Treasure maps and survey reports",
                            ["rule"] = "sptype(\"trophy_survey_report\", \"trophy_treasure_map\")",
                        },
                        [23] = 
                        {
                            ["name"] = "Alchemy",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"alchemy\")",
                        },
                        [24] = 
                        {
                            ["name"] = "Blacksmithing",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"blacksmithing\")",
                        },
                        [25] = 
                        {
                            ["name"] = "Clothing",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"clothing\")",
                        },
                        [26] = 
                        {
                            ["name"] = "Enchanting",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"enchanting\")",
                        },
                        [27] = 
                        {
                            ["name"] = "Jewelry Crafting",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"jewelrycrafting\")",
                        },
                        [28] = 
                        {
                            ["name"] = "Provisioning",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"provisioning\")",
                        },
                        [29] = 
                        {
                            ["name"] = "Trait/Style Gems",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"trait_items\", \"style_materials\")",
                        },
                        [30] = 
                        {
                            ["name"] = "Woodworking",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"woodworking\")",
                        },
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
                    ["version"] = 1.1000000000,
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
                    ["general"] = 
                    {
                        ["SAVE_CATEGORY_COLLAPSE_STATUS"] = false,
                        ["SHOW_CATEGORY_COLLAPSE_ICON"] = true,
                        ["SHOW_CATEGORY_ITEM_COUNT"] = true,
                        ["SHOW_MESSAGE_WHEN_TOGGLE"] = false,
                        ["SHOW_CATEGORY_SET_TITLE"] = true,
                    },
                    ["accountWide"] = true,
                },
                ["$LastCharacterName"] = "scthree",
            },
            ["8796093067238331"] = 
            {
                ["NA Megaserver"] = 
                {
                    ["appearance"] = 
                    {
                        ["CATEGORY_FONT_STYLE"] = "soft-shadow-thin",
                        ["CATEGORY_FONT_SIZE"] = 18,
                        ["CATEGORY_HEADER_HEIGHT"] = 52,
                        ["CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 1,
                            [2] = 1,
                            [3] = 1,
                        },
                        ["CATEGORY_FONT_ALIGNMENT"] = 1,
                        ["CATEGORY_OTHER_TEXT"] = "Others",
                        ["CATEGORY_FONT_NAME"] = "Univers 67",
                    },
                    ["rules"] = 
                    {
                        [1] = 
                        {
                            ["name"] = "Armor",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "type(\"armor\") and not equiptype(\"neck\",\"ring\")",
                        },
                        [2] = 
                        {
                            ["name"] = "BoE",
                            ["tag"] = "Gears",
                            ["description"] = "BoE gears for selling",
                            ["rule"] = "boundtype(\"on_equip\") and not isbound() and not keepresearch()",
                        },
                        [3] = 
                        {
                            ["name"] = "BoP Tradeable",
                            ["tag"] = "Gears",
                            ["description"] = "Gears are tradeable within a limited time",
                            ["rule"] = "isboptradeable()",
                        },
                        [4] = 
                        {
                            ["name"] = "Deconstruct",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "traitstring(\"intricate\")",
                        },
                        [5] = 
                        {
                            ["name"] = "Equipping",
                            ["tag"] = "Gears",
                            ["description"] = "Currently equipping gears (Gamepad Only)",
                            ["rule"] = "isequipping()",
                        },
                        [6] = 
                        {
                            ["name"] = "Low Level",
                            ["tag"] = "Gears",
                            ["description"] = "Gears below cp 160",
                            ["rule"] = "level() > 1 and cp() < 160 and type(\"armor\", \"weapon\")",
                        },
                        [7] = 
                        {
                            ["name"] = "Necklace",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "equiptype(\"neck\")",
                        },
                        [8] = 
                        {
                            ["name"] = "Researchable",
                            ["tag"] = "Gears",
                            ["description"] = "Gears that keep for research purpose, only keep the low quality, low level one.",
                            ["rule"] = "keepresearch()",
                        },
                        [9] = 
                        {
                            ["name"] = "Ring",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "equiptype(\"ring\")",
                        },
                        [10] = 
                        {
                            ["name"] = "Set",
                            ["tag"] = "Gears",
                            ["description"] = "Auto categorize set gears",
                            ["rule"] = "autoset()",
                        },
                        [11] = 
                        {
                            ["name"] = "Weapon",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "type(\"weapon\")",
                        },
                        [12] = 
                        {
                            ["name"] = "Consumables",
                            ["tag"] = "General Items",
                            ["description"] = "Food, Drink, Potion",
                            ["rule"] = "type(\"food\", \"drink\", \"potion\")",
                        },
                        [13] = 
                        {
                            ["name"] = "Container",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"container\")",
                        },
                        [14] = 
                        {
                            ["name"] = "Furnishing",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"furnishing\")",
                        },
                        [15] = 
                        {
                            ["name"] = "Glyphs & Gems",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"soul_gem\", \"glyph_armor\", \"glyph_jewelry\", \"glyph_weapon\")",
                        },
                        [16] = 
                        {
                            ["name"] = "New",
                            ["tag"] = "General Items",
                            ["description"] = "Items that are received recently",
                            ["rule"] = "isnew()",
                        },
                        [17] = 
                        {
                            ["name"] = "Poison",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"poison\")",
                        },
                        [18] = 
                        {
                            ["name"] = "Quickslots",
                            ["tag"] = "General Items",
                            ["description"] = "Equipped in quickslots",
                            ["rule"] = "isinquickslot()",
                        },
                        [19] = 
                        {
                            ["name"] = "Recipes & Motifs",
                            ["tag"] = "General Items",
                            ["description"] = "All recipes, motifs and recipe fragments.",
                            ["rule"] = "type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\")",
                        },
                        [20] = 
                        {
                            ["name"] = "Selling",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "traitstring(\"ornate\") or sptype(\"collectible_monster_trophy\") or type(\"trash\")",
                        },
                        [21] = 
                        {
                            ["name"] = "Stolen",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "isstolen()",
                        },
                        [22] = 
                        {
                            ["name"] = "Maps & Surveys",
                            ["tag"] = "General Items",
                            ["description"] = "Treasure maps and survey reports",
                            ["rule"] = "sptype(\"trophy_survey_report\", \"trophy_treasure_map\")",
                        },
                        [23] = 
                        {
                            ["name"] = "Alchemy",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"alchemy\")",
                        },
                        [24] = 
                        {
                            ["name"] = "Blacksmithing",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"blacksmithing\")",
                        },
                        [25] = 
                        {
                            ["name"] = "Clothing",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"clothing\")",
                        },
                        [26] = 
                        {
                            ["name"] = "Enchanting",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"enchanting\")",
                        },
                        [27] = 
                        {
                            ["name"] = "Jewelry Crafting",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"jewelrycrafting\")",
                        },
                        [28] = 
                        {
                            ["name"] = "Provisioning",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"provisioning\")",
                        },
                        [29] = 
                        {
                            ["name"] = "Trait/Style Gems",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"trait_items\", \"style_materials\")",
                        },
                        [30] = 
                        {
                            ["name"] = "Woodworking",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"woodworking\")",
                        },
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
                    ["version"] = 1.1000000000,
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
                    ["general"] = 
                    {
                        ["SAVE_CATEGORY_COLLAPSE_STATUS"] = false,
                        ["SHOW_CATEGORY_COLLAPSE_ICON"] = true,
                        ["SHOW_CATEGORY_ITEM_COUNT"] = true,
                        ["SHOW_MESSAGE_WHEN_TOGGLE"] = false,
                        ["SHOW_CATEGORY_SET_TITLE"] = true,
                    },
                    ["accountWide"] = true,
                },
                ["$LastCharacterName"] = "morregann",
            },
            ["8796093074778299"] = 
            {
                ["NA Megaserver"] = 
                {
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
                    ["accountWide"] = true,
                    ["version"] = 1.1000000000,
                },
                ["$LastCharacterName"] = "Mynrog",
            },
            ["8796093041540553"] = 
            {
                ["NA Megaserver"] = 
                {
                    ["appearance"] = 
                    {
                        ["CATEGORY_FONT_STYLE"] = "soft-shadow-thin",
                        ["CATEGORY_FONT_SIZE"] = 18,
                        ["CATEGORY_HEADER_HEIGHT"] = 52,
                        ["CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 1,
                            [2] = 1,
                            [3] = 1,
                        },
                        ["CATEGORY_FONT_ALIGNMENT"] = 1,
                        ["CATEGORY_OTHER_TEXT"] = "Others",
                        ["CATEGORY_FONT_NAME"] = "Univers 67",
                    },
                    ["rules"] = 
                    {
                        [1] = 
                        {
                            ["name"] = "Armor",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "type(\"armor\") and not equiptype(\"neck\",\"ring\")",
                        },
                        [2] = 
                        {
                            ["name"] = "BoE",
                            ["tag"] = "Gears",
                            ["description"] = "BoE gears for selling",
                            ["rule"] = "boundtype(\"on_equip\") and not isbound() and not keepresearch()",
                        },
                        [3] = 
                        {
                            ["name"] = "BoP Tradeable",
                            ["tag"] = "Gears",
                            ["description"] = "Gears are tradeable within a limited time",
                            ["rule"] = "isboptradeable()",
                        },
                        [4] = 
                        {
                            ["name"] = "Deconstruct",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "traitstring(\"intricate\")",
                        },
                        [5] = 
                        {
                            ["name"] = "Equipping",
                            ["tag"] = "Gears",
                            ["description"] = "Currently equipping gears (Gamepad Only)",
                            ["rule"] = "isequipping()",
                        },
                        [6] = 
                        {
                            ["name"] = "Low Level",
                            ["tag"] = "Gears",
                            ["description"] = "Gears below cp 160",
                            ["rule"] = "level() > 1 and cp() < 160 and type(\"armor\", \"weapon\")",
                        },
                        [7] = 
                        {
                            ["name"] = "Necklace",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "equiptype(\"neck\")",
                        },
                        [8] = 
                        {
                            ["name"] = "Researchable",
                            ["tag"] = "Gears",
                            ["description"] = "Gears that keep for research purpose, only keep the low quality, low level one.",
                            ["rule"] = "keepresearch()",
                        },
                        [9] = 
                        {
                            ["name"] = "Ring",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "equiptype(\"ring\")",
                        },
                        [10] = 
                        {
                            ["name"] = "Set",
                            ["tag"] = "Gears",
                            ["description"] = "Auto categorize set gears",
                            ["rule"] = "autoset()",
                        },
                        [11] = 
                        {
                            ["name"] = "Weapon",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "type(\"weapon\")",
                        },
                        [12] = 
                        {
                            ["name"] = "Consumables",
                            ["tag"] = "General Items",
                            ["description"] = "Food, Drink, Potion",
                            ["rule"] = "type(\"food\", \"drink\", \"potion\")",
                        },
                        [13] = 
                        {
                            ["name"] = "Container",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"container\")",
                        },
                        [14] = 
                        {
                            ["name"] = "Furnishing",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"furnishing\")",
                        },
                        [15] = 
                        {
                            ["name"] = "Glyphs & Gems",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"soul_gem\", \"glyph_armor\", \"glyph_jewelry\", \"glyph_weapon\")",
                        },
                        [16] = 
                        {
                            ["name"] = "New",
                            ["tag"] = "General Items",
                            ["description"] = "Items that are received recently",
                            ["rule"] = "isnew()",
                        },
                        [17] = 
                        {
                            ["name"] = "Poison",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"poison\")",
                        },
                        [18] = 
                        {
                            ["name"] = "Quickslots",
                            ["tag"] = "General Items",
                            ["description"] = "Equipped in quickslots",
                            ["rule"] = "isinquickslot()",
                        },
                        [19] = 
                        {
                            ["name"] = "Recipes & Motifs",
                            ["tag"] = "General Items",
                            ["description"] = "All recipes, motifs and recipe fragments.",
                            ["rule"] = "type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\")",
                        },
                        [20] = 
                        {
                            ["name"] = "Selling",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "traitstring(\"ornate\") or sptype(\"collectible_monster_trophy\") or type(\"trash\")",
                        },
                        [21] = 
                        {
                            ["name"] = "Stolen",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "isstolen()",
                        },
                        [22] = 
                        {
                            ["name"] = "Maps & Surveys",
                            ["tag"] = "General Items",
                            ["description"] = "Treasure maps and survey reports",
                            ["rule"] = "sptype(\"trophy_survey_report\", \"trophy_treasure_map\")",
                        },
                        [23] = 
                        {
                            ["name"] = "Alchemy",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"alchemy\")",
                        },
                        [24] = 
                        {
                            ["name"] = "Blacksmithing",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"blacksmithing\")",
                        },
                        [25] = 
                        {
                            ["name"] = "Clothing",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"clothing\")",
                        },
                        [26] = 
                        {
                            ["name"] = "Enchanting",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"enchanting\")",
                        },
                        [27] = 
                        {
                            ["name"] = "Jewelry Crafting",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"jewelrycrafting\")",
                        },
                        [28] = 
                        {
                            ["name"] = "Provisioning",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"provisioning\")",
                        },
                        [29] = 
                        {
                            ["name"] = "Trait/Style Gems",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"trait_items\", \"style_materials\")",
                        },
                        [30] = 
                        {
                            ["name"] = "Woodworking",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"woodworking\")",
                        },
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
                    ["version"] = 1.1000000000,
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
                    ["general"] = 
                    {
                        ["SAVE_CATEGORY_COLLAPSE_STATUS"] = false,
                        ["SHOW_CATEGORY_COLLAPSE_ICON"] = true,
                        ["SHOW_CATEGORY_ITEM_COUNT"] = true,
                        ["SHOW_MESSAGE_WHEN_TOGGLE"] = false,
                        ["SHOW_CATEGORY_SET_TITLE"] = true,
                    },
                    ["accountWide"] = true,
                },
                ["$LastCharacterName"] = "Lliliara",
            },
            ["8796093067214547"] = 
            {
                ["NA Megaserver"] = 
                {
                    ["appearance"] = 
                    {
                        ["CATEGORY_FONT_STYLE"] = "soft-shadow-thin",
                        ["CATEGORY_FONT_SIZE"] = 18,
                        ["CATEGORY_HEADER_HEIGHT"] = 52,
                        ["CATEGORY_FONT_COLOR"] = 
                        {
                            [4] = 1,
                            [1] = 1,
                            [2] = 1,
                            [3] = 1,
                        },
                        ["CATEGORY_FONT_ALIGNMENT"] = 1,
                        ["CATEGORY_OTHER_TEXT"] = "Others",
                        ["CATEGORY_FONT_NAME"] = "Univers 67",
                    },
                    ["rules"] = 
                    {
                        [1] = 
                        {
                            ["name"] = "Armor",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "type(\"armor\") and not equiptype(\"neck\",\"ring\")",
                        },
                        [2] = 
                        {
                            ["name"] = "BoE",
                            ["tag"] = "Gears",
                            ["description"] = "BoE gears for selling",
                            ["rule"] = "boundtype(\"on_equip\") and not isbound() and not keepresearch()",
                        },
                        [3] = 
                        {
                            ["name"] = "BoP Tradeable",
                            ["tag"] = "Gears",
                            ["description"] = "Gears are tradeable within a limited time",
                            ["rule"] = "isboptradeable()",
                        },
                        [4] = 
                        {
                            ["name"] = "Deconstruct",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "traitstring(\"intricate\")",
                        },
                        [5] = 
                        {
                            ["name"] = "Equipping",
                            ["tag"] = "Gears",
                            ["description"] = "Currently equipping gears (Gamepad Only)",
                            ["rule"] = "isequipping()",
                        },
                        [6] = 
                        {
                            ["name"] = "Low Level",
                            ["tag"] = "Gears",
                            ["description"] = "Gears below cp 160",
                            ["rule"] = "level() > 1 and cp() < 160 and type(\"armor\", \"weapon\")",
                        },
                        [7] = 
                        {
                            ["name"] = "Necklace",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "equiptype(\"neck\")",
                        },
                        [8] = 
                        {
                            ["name"] = "Researchable",
                            ["tag"] = "Gears",
                            ["description"] = "Gears that keep for research purpose, only keep the low quality, low level one.",
                            ["rule"] = "keepresearch()",
                        },
                        [9] = 
                        {
                            ["name"] = "Ring",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "equiptype(\"ring\")",
                        },
                        [10] = 
                        {
                            ["name"] = "Set",
                            ["tag"] = "Gears",
                            ["description"] = "Auto categorize set gears",
                            ["rule"] = "autoset()",
                        },
                        [11] = 
                        {
                            ["name"] = "Weapon",
                            ["tag"] = "Gears",
                            ["description"] = "",
                            ["rule"] = "type(\"weapon\")",
                        },
                        [12] = 
                        {
                            ["name"] = "Consumables",
                            ["tag"] = "General Items",
                            ["description"] = "Food, Drink, Potion",
                            ["rule"] = "type(\"food\", \"drink\", \"potion\")",
                        },
                        [13] = 
                        {
                            ["name"] = "Container",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"container\")",
                        },
                        [14] = 
                        {
                            ["name"] = "Furnishing",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"furnishing\")",
                        },
                        [15] = 
                        {
                            ["name"] = "Glyphs & Gems",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"soul_gem\", \"glyph_armor\", \"glyph_jewelry\", \"glyph_weapon\")",
                        },
                        [16] = 
                        {
                            ["name"] = "New",
                            ["tag"] = "General Items",
                            ["description"] = "Items that are received recently",
                            ["rule"] = "isnew()",
                        },
                        [17] = 
                        {
                            ["name"] = "Poison",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "type(\"poison\")",
                        },
                        [18] = 
                        {
                            ["name"] = "Quickslots",
                            ["tag"] = "General Items",
                            ["description"] = "Equipped in quickslots",
                            ["rule"] = "isinquickslot()",
                        },
                        [19] = 
                        {
                            ["name"] = "Recipes & Motifs",
                            ["tag"] = "General Items",
                            ["description"] = "All recipes, motifs and recipe fragments.",
                            ["rule"] = "type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\")",
                        },
                        [20] = 
                        {
                            ["name"] = "Selling",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "traitstring(\"ornate\") or sptype(\"collectible_monster_trophy\") or type(\"trash\")",
                        },
                        [21] = 
                        {
                            ["name"] = "Stolen",
                            ["tag"] = "General Items",
                            ["description"] = "",
                            ["rule"] = "isstolen()",
                        },
                        [22] = 
                        {
                            ["name"] = "Maps & Surveys",
                            ["tag"] = "General Items",
                            ["description"] = "Treasure maps and survey reports",
                            ["rule"] = "sptype(\"trophy_survey_report\", \"trophy_treasure_map\")",
                        },
                        [23] = 
                        {
                            ["name"] = "Alchemy",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"alchemy\")",
                        },
                        [24] = 
                        {
                            ["name"] = "Blacksmithing",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"blacksmithing\")",
                        },
                        [25] = 
                        {
                            ["name"] = "Clothing",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"clothing\")",
                        },
                        [26] = 
                        {
                            ["name"] = "Enchanting",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"enchanting\")",
                        },
                        [27] = 
                        {
                            ["name"] = "Jewelry Crafting",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"jewelrycrafting\")",
                        },
                        [28] = 
                        {
                            ["name"] = "Provisioning",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"provisioning\")",
                        },
                        [29] = 
                        {
                            ["name"] = "Trait/Style Gems",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"trait_items\", \"style_materials\")",
                        },
                        [30] = 
                        {
                            ["name"] = "Woodworking",
                            ["tag"] = "Materials",
                            ["description"] = "",
                            ["rule"] = "filtertype(\"woodworking\")",
                        },
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
                    ["version"] = 1.1000000000,
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
                    ["general"] = 
                    {
                        ["SAVE_CATEGORY_COLLAPSE_STATUS"] = false,
                        ["SHOW_CATEGORY_COLLAPSE_ICON"] = true,
                        ["SHOW_CATEGORY_ITEM_COUNT"] = true,
                        ["SHOW_MESSAGE_WHEN_TOGGLE"] = false,
                        ["SHOW_CATEGORY_SET_TITLE"] = true,
                    },
                    ["accountWide"] = true,
                },
                ["$LastCharacterName"] = "scelara",
            },
        },
    },
}
