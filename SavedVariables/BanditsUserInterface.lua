BUI_VARS =
{
    ["Default"] = 
    {
        ["@Motiv_Impact"] = 
        {
            ["$AccountWide"] = 
            {
                ["CustomBuffsPSide"] = "right",
                ["MarkerLeader"] = false,
                ["SynergyCdPSide"] = "right",
                ["ConfirmLocked"] = true,
                ["RaidColumnSize"] = 6,
                ["BUI_MiniMeter"] = 
                {
                    [4] = 0,
                    [1] = 9,
                    [2] = 1,
                    [3] = -400,
                },
                ["ColorRoles"] = true,
                ["EnableStats"] = true,
                ["TargetFrameTextAlign"] = "default",
                ["ActionsFontSize"] = 16,
                ["EnableNameplate"] = true,
                ["FrameMagickaColor1"] = 
                {
                    [4] = 1,
                    [1] = 0,
                    [2] = 0.4784313725,
                    [3] = 1,
                },
                ["CustomBar"] = 
                {
                    ["Enable"] = false,
                    ["Leader"] = 
                    {
                        [1] = false,
                        [2] = false,
                        [3] = false,
                        [4] = false,
                        [5] = false,
                        [6] = false,
                    },
                    ["Slash"] = 
                    {
                        [1] = 
                        {
                            ["enable"] = true,
                            ["icon"] = "/esoui/art/mounts/ridingskill_ready.dds",
                            ["command"] = "/reloadui",
                        },
                        [2] = 
                        {
                            ["enable"] = false,
                            ["icon"] = "/esoui/art/icons/ability_warrior_010.dds",
                            ["command"] = "/script StartChatInput('/z Guild [name] recruits new members!')",
                        },
                        [3] = 
                        {
                            ["enable"] = false,
                            ["icon"] = "/esoui/art/icons/ability_mage_066.dds",
                            ["command"] = "/dancedunmer",
                        },
                        [4] = 
                        {
                            ["enable"] = true,
                            ["icon"] = "/esoui/art/icons/ability_rogue_062.dds",
                            ["command"] = "/script ZO_CompassFrame:SetHidden(not ZO_CompassFrame:IsHidden())",
                        },
                        [5] = 
                        {
                            ["enable"] = false,
                            ["icon"] = "/esoui/art/icons/emote_mimewall.dds",
                            ["command"] = "/mimewall",
                        },
                        [6] = 
                        {
                            ["enable"] = true,
                            ["icon"] = "/esoui/art/icons/quest_gemstone_tear_0002.dds",
                            ["command"] = "/script UseCollectible(336)",
                        },
                        [7] = 
                        {
                            ["enable"] = false,
                            ["icon"] = "/esoui/art/tutorial/gamepad/gp_playermenu_icon_store.dds",
                            ["command"] = "/jumptoleader",
                        },
                        [8] = 
                        {
                            ["enable"] = false,
                            ["icon"] = "esoui/art/tutorial/chat-notifications_up.dds",
                            ["command"] = "/script zo_callLater(function() local name=GetUnitDisplayName('reticleover') if name then StartChatInput('/w '..name..' ') else a('No target') end end,100)",
                        },
                        [9] = 
                        {
                            ["enable"] = false,
                            ["icon"] = "/esoui/art/inventory/gamepad/gp_inventory_icon_stolenitem.dds",
                            ["command"] = "/script d(AreAnyItemsStolen(BAG_BACKPACK) and 'Have stolen items' or 'Have no stolen items')",
                        },
                        [10] = 
                        {
                            ["enable"] = false,
                            ["icon"] = "/esoui/art/icons/ability_ava_005_a.dds",
                            ["command"] = "/script local _,i=GetAbilityProgressionXPInfoFromAbilityId(40232) local _,m,r=GetAbilityProgressionInfo(i) local _,_,index=GetAbilityProgressionAbilityInfo(i,m,r) CallSecureProtected('SelectSlotAbility', index, 3)",
                        },
                        [11] = 
                        {
                            ["enable"] = false,
                            ["icon"] = "/esoui/art/progression/morph_up.dds",
                            ["command"] = "/script BUI.Vars.EnableWidgets=not BUI.Vars.EnableWidgets BUI.Frames.Widgets_Init() d('Widgets are now '..(BUI.Vars.EnableWidgets and '|c33EE33enabled|r' or '|EE3333disabled|r'))",
                        },
                        [12] = 
                        {
                            ["enable"] = false,
                            ["icon"] = "Text",
                            ["command"] = "/script local text='Another sample'd(text) a(text)",
                        },
                    },
                },
                ["GroupBuffs"] = false,
                ["BUI_OnScreen"] = 
                {
                    [4] = -110,
                    [1] = 128,
                    [2] = 128,
                    [3] = 0,
                },
                ["TargetBuffSize"] = 44,
                ["NotificationSound_1"] = "Champion_PointsCommitted",
                ["StatTriggerHeals"] = false,
                ["RepositionFrames"] = true,
                ["MiniMap"] = false,
                ["BUI_BuffsPas"] = 
                {
                    [4] = 0,
                    [1] = 12,
                    [2] = 12,
                    [3] = 0,
                },
                ["StatsUpdateDPS"] = false,
                ["EnableCustomBuffs"] = false,
                ["Glyphs"] = true,
                ["PlayerFrame"] = false,
                ["StatsShareDPS"] = true,
                ["FrameShowMax"] = false,
                ["AutoQueue"] = false,
                ["CustomBuffsPWidth"] = 120,
                ["JumpToLeader"] = true,
                ["CurvedOffset"] = -100,
                ["GroupDeathSound"] = "Lockpicking_unlocked",
                ["Markers_Icon"] = true,
                ["FrameHeight"] = 22,
                ["InitialDialog"] = true,
                ["StatShareUlt"] = 3,
                ["ZoomCyrodiil"] = 45,
                ["OnScreenPriorDeath"] = true,
                ["ExpiresAnimation"] = true,
                ["WidgetPotion"] = true,
                ["GroupSynergyCount"] = 2,
                ["BossFrame"] = true,
                ["NotificationsGroup"] = true,
                ["BossWidth"] = 280,
                ["LargeRaidScale"] = 80,
                ["WidgetsSize"] = 44,
                ["PvPmode"] = true,
                ["DeveloperMode"] = false,
                ["ExecuteThreshold"] = 25,
                ["CastBar"] = 3,
                ["AttackersHeight"] = 28,
                ["RaidWidth"] = 220,
                ["ReportScale"] = 1,
                ["EnableBlackList"] = true,
                ["BUI_OnScreenS"] = 
                {
                    [4] = -210,
                    [1] = 128,
                    [2] = 128,
                    [3] = 360,
                },
                ["GroupAnimation"] = true,
                ["CollapseNormalDungeon"] = false,
                ["FrameShieldColor"] = 
                {
                    [4] = 1,
                    [1] = 0.9803921569,
                    [2] = 0.3921568627,
                    [3] = 0.0784313725,
                },
                ["FrameTankColor"] = 
                {
                    [1] = 0.8588235294,
                    [2] = 0.5607843137,
                    [3] = 1,
                },
                ["SynergyCdSize"] = 44,
                ["RaidLevels"] = true,
                ["ZoomSubZone"] = 30,
                ["WidgetSound2"] = "CrownCrates_Manifest_Selected",
                ["LargeGroupAnnoucement"] = true,
                ["StatusIcons"] = true,
                ["PinScale"] = 75,
                ["ZoomGlobal"] = 3,
                ["MinimumDuration"] = 3,
                ["GroupSynergy"] = 3,
                ["Reports"] = 
                {
                },
                ["AdvancedThemeColor"] = 
                {
                    [4] = 0.9000000000,
                    [1] = 0.5000000000,
                    [2] = 0.6000000000,
                    [3] = 1,
                },
                ["PlayerToPlayer"] = false,
                ["CustomBuffsProgress"] = true,
                ["FrameFont1"] = "esobold",
                ["CurvedHitAnimation"] = true,
                ["CurvedStatValues"] = true,
                ["StatsMiniHealing"] = false,
                ["BuffsBlackList"] = 
                {
                    [63601] = true,
                    [14890] = true,
                    [76667] = true,
                },
                ["ZoomDungeon"] = 60,
                ["SynergyCdDirection"] = "vertical",
                ["FrameFontSize"] = 15,
                ["BUI_GroupDPS"] = 
                {
                    [4] = 120,
                    [1] = 3,
                    [2] = 1,
                    [3] = -400,
                },
                ["MiniMapTitle"] = false,
                ["GroupLeave"] = true,
                ["TargetBuffs"] = false,
                ["StatsGroupDPSframe"] = false,
                ["ActionsPrecise"] = false,
                ["BlockAnnouncement"] = false,
                ["PlayerBuffSize"] = 44,
                ["InCombatReticle"] = true,
                ["FramesTexture"] = "rounded",
                ["Widgets"] = 
                {
                    [110143] = true,
                    [110142] = true,
                    ["Major Brutality"] = true,
                    [110067] = true,
                    [126941] = true,
                    ["Major Resolve"] = true,
                    [110118] = true,
                    [61927] = true,
                    [107141] = true,
                    ["Immovable"] = true,
                    [104538] = true,
                    [46327] = true,
                    [109084] = true,
                    ["Major Courage"] = true,
                    ["Major Sorcery"] = true,
                    [61919] = true,
                },
                ["RaidHeight"] = 32,
                ["PassiveOakFilter"] = true,
                ["CustomBuffs"] = 
                {
                },
                ["PassiveBuffSize"] = 36,
                ["Log"] = false,
                ["BUI_BuffsS"] = 
                {
                    [4] = 200,
                    [1] = 128,
                    [2] = 128,
                    [3] = -300,
                },
                ["CurvedDistance"] = 220,
                ["NotificationsSize"] = 32,
                ["FrameStaminaColor1"] = 
                {
                    [4] = 1,
                    [1] = 0,
                    [2] = 0.8235294118,
                    [3] = 0.0784313725,
                },
                ["Markers_IconDuration"] = 20,
                ["StatsSplitElements"] = false,
                ["ReticleMode"] = 3,
                ["DarkBrotherhoodSpree"] = false,
                ["SidePanel"] = 
                {
                    ["Settings"] = true,
                    ["Ragpicker"] = true,
                    ["Enable"] = false,
                    ["Statistics"] = true,
                    ["DismissPets"] = true,
                    ["VeteranDifficulty"] = true,
                    ["SubSampling"] = false,
                    ["Banker"] = true,
                    ["Compass"] = true,
                    ["Teleporter"] = true,
                    ["AllowOther"] = true,
                    ["Armorer"] = true,
                    ["GearManager"] = true,
                    ["Widgets"] = true,
                    ["LFG_Role"] = true,
                    ["Trader"] = true,
                    ["Smuggler"] = true,
                    ["LeaderArrow"] = true,
                    ["HealerHelper"] = true,
                    ["Minimap"] = true,
                    ["WPamA"] = true,
                    ["Assistans"] = true,
                    ["Share"] = true,
                },
                ["StatsTransparent"] = true,
                ["QuickSlotsInventory"] = true,
                ["ExecuteSound"] = false,
                ["BuffsImportant"] = true,
                ["PlayerBuffs"] = false,
                ["StatsMiniGroupDps"] = true,
                ["BUI_BuffsP"] = 
                {
                    [4] = 345,
                    [1] = 128,
                    [2] = 128,
                    [3] = 0,
                },
                ["LargeGroupInvite"] = true,
                ["UseSwapPanel"] = true,
                ["UndauntedPledges"] = true,
                ["PassivePSide"] = "left",
                ["FrameHealthColor"] = 
                {
                    [4] = 1,
                    [1] = 0.5882352941,
                    [2] = 0.1176470588,
                    [3] = 0.2352941176,
                },
                ["TargetHeight"] = 22,
                ["RepeatableQuests"] = true,
                ["NotificationsTrial"] = true,
                ["LastVersion"] = 4.3400000000,
                ["NotificationSound_2"] = "No_Sound",
                ["WidgetSound1"] = "CrownCrates_Manifest_Chosen",
                ["RaidSort"] = 1,
                ["PreferredTarget"] = true,
                ["Markers_Trials"] = false,
                ["FoodBuff"] = true,
                ["ReticleDpS"] = false,
                ["StatShare"] = true,
                ["FrameWidth"] = 280,
                ["ZoomImperialCity"] = 80,
                ["SelfColor"] = true,
                ["DefaultPlayerFrames"] = false,
                ["RaidFrames"] = false,
                ["AttackersWidth"] = 280,
                ["Markers_Message"] = true,
                ["AdvancedSynergy"] = false,
                ["CastbyPlayer"] = true,
                ["ReticleResist"] = 3,
                ["BuffsPassives"] = "On additional panel",
                ["DecimalValues"] = true,
                ["ProcSound"] = "Ability_Ultimate_Ready_Sound",
                ["MarkerSize"] = 40,
                ["CurvedDepth"] = 0.8000000000,
                ["GroupElection"] = true,
                ["LeaderArrow"] = true,
                ["TargetFrame"] = false,
                ["ZoomMountRatio"] = 70,
                ["BuiltInGlobalCooldown"] = false,
                ["TauntTimer"] = 1,
                ["FastTravel"] = true,
                ["FrameShieldColor1"] = 
                {
                    [4] = 1,
                    [1] = 0.9019607843,
                    [2] = 0.3921568627,
                    [3] = 0.0784313725,
                },
                ["BUI_Minimap"] = 
                {
                    [4] = 0,
                    [1] = 9,
                    [2] = 9,
                    [3] = 0,
                },
                ["Theme"] = 2,
                ["FrameStaminaColor"] = 
                {
                    [4] = 1,
                    [1] = 0,
                    [2] = 0.5490196078,
                    [3] = 0.1176470588,
                },
                ["QuickSlotsShow"] = 4,
                ["UltimateOrder"] = 2,
                ["NotificationsTimer"] = 3000,
                ["RaidFontSize"] = 17,
                ["ContainerHandler"] = false,
                ["SynergyCdProgress"] = true,
                ["DefaultTargetFrameText"] = true,
                ["TargetBuffsAlign"] = 128,
                ["StatsMiniMeter"] = false,
                ["BUI_BuffsT"] = 
                {
                    [4] = -350,
                    [1] = 128,
                    [2] = 128,
                    [3] = 0,
                },
                ["StatsBuffs"] = false,
                ["StealthWield"] = true,
                ["PlayerBuffsAlign"] = 128,
                ["BuffsOtherHide"] = true,
                ["StatsFontSize"] = 18,
                ["CustomBuffsDirection"] = "vertical",
                ["FrameOpacityIn"] = 90,
                ["BUI_TargetFrame"] = 
                {
                    [4] = 200,
                    [1] = 3,
                    [2] = 128,
                    [3] = 250,
                },
                ["QuickSlots"] = true,
                ["NotificationFood"] = true,
                ["FrameHealerColor"] = 
                {
                    [1] = 1,
                    [2] = 0.7568627451,
                    [3] = 0.4980392157,
                },
                ["ImpactAnimation"] = true,
                ["FrameDamageColor"] = 
                {
                    [1] = 0.8784313725,
                    [2] = 0.1098039216,
                    [3] = 0.1098039216,
                },
                ["HousePins"] = 4,
                ["SynergyCdPWidth"] = 120,
                ["FrameNameFormat"] = 2,
                ["FrameHealthColor1"] = 
                {
                    [4] = 1,
                    [1] = 1,
                    [2] = 0.1568627451,
                    [3] = 0.2745098039,
                },
                ["FrameMagickaColor"] = 
                {
                    [4] = 1,
                    [1] = 0,
                    [2] = 0.1176470588,
                    [3] = 0.8627450980,
                },
                ["ZoomImperialsewer"] = 60,
                ["CustomEdgeColor"] = 
                {
                    [4] = 1,
                    [1] = 0,
                    [2] = 0.0700000000,
                    [3] = 0.0700000000,
                },
                ["FrameHorisontal"] = true,
                ["StatsMiniSpeed"] = false,
                ["MiniMapDimensions"] = 250,
                ["ProcAnimation"] = true,
                ["BossHeight"] = 28,
                ["Actions"] = false,
                ["DodgeFatigue"] = false,
                ["FramePercents"] = false,
                ["PassivePWidth"] = 100,
                ["EffectVisualisation"] = true,
                ["EnableWidgets"] = false,
                ["FrameFont2"] = "esobold",
                ["FrameOpacityOut"] = 80,
                ["HideSwapPanel"] = true,
                ["Champion"] = 
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
                },
                ["BUI_RaidFrame"] = 
                {
                    [4] = 160,
                    [1] = 3,
                    [2] = 3,
                    [3] = 50,
                },
                ["BUI_PlayerFrame"] = 
                {
                    [4] = 200,
                    [1] = 9,
                    [2] = 128,
                    [3] = -250,
                },
                ["SmallGroupScale"] = 120,
                ["version"] = 3,
                ["CurvedHeight"] = 360,
                ["CurvedFrame"] = 0,
                ["FramesBorder"] = 1,
                ["EnableXPBar"] = true,
                ["PassiveProgress"] = false,
                ["MiniMeterAplha"] = 0.8000000000,
                ["DefaultTargetFrame"] = true,
                ["PinColor"] = 
                {
                    [40] = 
                    {
                        [4] = 1,
                        [1] = 1,
                        [2] = 1,
                        [3] = 1,
                    },
                    [1] = 
                    {
                        [4] = 1,
                        [1] = 1,
                        [2] = 1,
                        [3] = 1,
                    },
                    [2] = 
                    {
                        [4] = 1,
                        [1] = 1,
                        [2] = 1,
                        [3] = 0,
                    },
                    [204] = 
                    {
                        [4] = 1,
                        [1] = 1,
                        [2] = 1,
                        [3] = 1,
                    },
                    [12] = 
                    {
                        [4] = 1,
                        [1] = 1,
                        [2] = 1,
                        [3] = 1,
                    },
                },
                ["BUI_HPlayerFrame"] = 
                {
                    [4] = 410,
                    [1] = 128,
                    [2] = 128,
                    [3] = 0,
                },
                ["NotificationsWorld"] = true,
                ["TargetWidth"] = 320,
                ["FramesFade"] = false,
                ["Markers_Dungeons"] = false,
                ["WidgetsPWidth"] = 120,
                ["StatsGroupDPS"] = false,
                ["CustomBuffSize"] = 44,
                ["DeleteMail"] = false,
                ["ZoomZone"] = 60,
                ["RaidSplit"] = 0,
                ["Books"] = false,
                ["EnableSynergyCd"] = false,
                ["ReticleInvul"] = true,
                ["BUI_BuffsC"] = 
                {
                    [4] = 300,
                    [1] = 128,
                    [2] = 128,
                    [3] = 0,
                },
                ["FriendStatus"] = true,
            },
        },
    },
}
BUI_REPORTS =
{
    ["Default"] = 
    {
        ["@Motiv_Impact"] = 
        {
            ["$AccountWide"] = 
            {
                ["data"] = 
                {
                },
                ["version"] = 1,
            },
        },
    },
}
