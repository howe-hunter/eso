BUI_VARS =
{
    ["Default"] = 
    {
        ["@Motiv_Impact"] = 
        {
            ["$AccountWide"] = 
            {
                ["PassiveProgress"] = false,
                ["FrameShowMax"] = false,
                ["ContainerHandler"] = false,
                ["Widgets"] = 
                {
                    [61919] = true,
                    ["Immovable"] = true,
                    ["Major Brutality"] = true,
                    [110067] = true,
                    ["Major Resolve"] = true,
                    [107141] = true,
                    [110118] = true,
                    [61927] = true,
                    [46327] = true,
                    ["Major Courage"] = true,
                    [104538] = true,
                    ["Major Sorcery"] = true,
                    [109084] = true,
                    [126941] = true,
                    [110142] = true,
                    [110143] = true,
                },
                ["BUI_OnScreenS"] = 
                {
                    [4] = -210,
                    [1] = 128,
                    [2] = 128,
                    [3] = 360,
                },
                ["BUI_BuffsP"] = 
                {
                    [4] = 345,
                    [1] = 128,
                    [2] = 128,
                    [3] = 0,
                },
                ["AdvancedThemeColor"] = 
                {
                    [4] = 0.9000000000,
                    [1] = 0.5000000000,
                    [2] = 0.6000000000,
                    [3] = 1,
                },
                ["CurvedFrame"] = 0,
                ["RaidSort"] = 1,
                ["FrameTankColor"] = 
                {
                    [1] = 0.8588235294,
                    [2] = 0.5607843137,
                    [3] = 1,
                },
                ["ExecuteSound"] = false,
                ["ZoomCyrodiil"] = 45,
                ["NotificationFood"] = true,
                ["MarkerLeader"] = false,
                ["ProcSound"] = "Ability_Ultimate_Ready_Sound",
                ["FrameStaminaColor1"] = 
                {
                    [4] = 1,
                    [1] = 0,
                    [2] = 0.8235294118,
                    [3] = 0.0784313725,
                },
                ["StatsSplitElements"] = false,
                ["AttackersWidth"] = 280,
                ["GroupElection"] = true,
                ["TargetBuffsAlign"] = 128,
                ["PlayerBuffsAlign"] = 128,
                ["StatsBuffs"] = false,
                ["Markers_Trials"] = false,
                ["WidgetSound1"] = "CrownCrates_Manifest_Chosen",
                ["FrameTraumaColor1"] = 
                {
                    [4] = 1,
                    [1] = 0.2941176471,
                    [2] = 0,
                    [3] = 0.5882352941,
                },
                ["PinScale"] = 75,
                ["FramesTexture"] = "rounded",
                ["FrameMagickaColor"] = 
                {
                    [4] = 1,
                    [1] = 0,
                    [2] = 0.1176470588,
                    [3] = 0.8627450980,
                },
                ["AttackersHeight"] = 28,
                ["CurvedHeight"] = 360,
                ["BuiltInGlobalCooldown"] = false,
                ["BuffsOtherHide"] = true,
                ["FastTravel"] = true,
                ["CustomBuffsDirection"] = "vertical",
                ["PlayerFrame"] = false,
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
                            ["icon"] = "/esoui/art/mounts/ridingskill_ready.dds",
                            ["enable"] = true,
                            ["command"] = "/reloadui",
                        },
                        [2] = 
                        {
                            ["icon"] = "/esoui/art/icons/ability_warrior_010.dds",
                            ["enable"] = false,
                            ["command"] = "/script StartChatInput('/z Guild [name] recruits new members!')",
                        },
                        [3] = 
                        {
                            ["icon"] = "/esoui/art/icons/ability_mage_066.dds",
                            ["enable"] = false,
                            ["command"] = "/dancedunmer",
                        },
                        [4] = 
                        {
                            ["icon"] = "/esoui/art/icons/ability_rogue_062.dds",
                            ["enable"] = true,
                            ["command"] = "/script ZO_CompassFrame:SetHidden(not ZO_CompassFrame:IsHidden())",
                        },
                        [5] = 
                        {
                            ["icon"] = "/esoui/art/icons/emote_mimewall.dds",
                            ["enable"] = false,
                            ["command"] = "/mimewall",
                        },
                        [6] = 
                        {
                            ["icon"] = "/esoui/art/icons/quest_gemstone_tear_0002.dds",
                            ["enable"] = true,
                            ["command"] = "/script UseCollectible(336)",
                        },
                        [7] = 
                        {
                            ["icon"] = "/esoui/art/tutorial/gamepad/gp_playermenu_icon_store.dds",
                            ["enable"] = false,
                            ["command"] = "/jumptoleader",
                        },
                        [8] = 
                        {
                            ["icon"] = "esoui/art/tutorial/chat-notifications_up.dds",
                            ["enable"] = false,
                            ["command"] = "/script zo_callLater(function() local name=GetUnitDisplayName('reticleover') if name then StartChatInput('/w '..name..' ') else a('No target') end end,100)",
                        },
                        [9] = 
                        {
                            ["icon"] = "/esoui/art/inventory/gamepad/gp_inventory_icon_stolenitem.dds",
                            ["enable"] = false,
                            ["command"] = "/script d(AreAnyItemsStolen(BAG_BACKPACK) and 'Have stolen items' or 'Have no stolen items')",
                        },
                        [10] = 
                        {
                            ["icon"] = "/esoui/art/icons/ability_ava_005_a.dds",
                            ["enable"] = false,
                            ["command"] = "/script local _,i=GetAbilityProgressionXPInfoFromAbilityId(40232) local _,m,r=GetAbilityProgressionInfo(i) local _,_,index=GetAbilityProgressionAbilityInfo(i,m,r) CallSecureProtected('SelectSlotAbility', index, 3)",
                        },
                        [11] = 
                        {
                            ["icon"] = "/esoui/art/progression/morph_up.dds",
                            ["enable"] = false,
                            ["command"] = "/script BUI.Vars.EnableWidgets=not BUI.Vars.EnableWidgets BUI.Frames.Widgets_Init() d('Widgets are now '..(BUI.Vars.EnableWidgets and '|c33EE33enabled|r' or '|EE3333disabled|r'))",
                        },
                        [12] = 
                        {
                            ["icon"] = "Text",
                            ["enable"] = false,
                            ["command"] = "/script local text='Another sample'd(text) a(text)",
                        },
                    },
                },
                ["RaidLevels"] = true,
                ["PassivePWidth"] = 100,
                ["NotificationSound_1"] = "Champion_PointsCommitted",
                ["CastBar"] = 3,
                ["RaidSplit"] = 0,
                ["TargetFrameTextAlign"] = "default",
                ["ActionsPrecise"] = false,
                ["BUI_GroupDPS"] = 
                {
                    [4] = 120,
                    [1] = 3,
                    [2] = 1,
                    [3] = -400,
                },
                ["ZoomImperialsewer"] = 60,
                ["FrameShieldColor"] = 
                {
                    [4] = 1,
                    [1] = 0.9803921569,
                    [2] = 0.3921568627,
                    [3] = 0.0784313725,
                },
                ["ZoomGlobal"] = 3,
                ["CurvedStatValues"] = true,
                ["PassiveBuffSize"] = 36,
                ["CustomBuffsProgress"] = true,
                ["Markers_Dungeons"] = false,
                ["TargetHeight"] = 22,
                ["EnableSynergyCd"] = false,
                ["MarkerSize"] = 40,
                ["DeveloperMode"] = false,
                ["Glyphs"] = true,
                ["ProcAnimation"] = true,
                ["BlockAnnouncement"] = false,
                ["BUI_HPlayerFrame"] = 
                {
                    [4] = 410,
                    [1] = 128,
                    [2] = 128,
                    [3] = 0,
                },
                ["MiniMapTitle"] = false,
                ["Reports"] = 
                {
                },
                ["EnableWidgets"] = false,
                ["CastbyPlayer"] = true,
                ["BUI_OnScreen"] = 
                {
                    [4] = -110,
                    [1] = 128,
                    [2] = 128,
                    [3] = 0,
                },
                ["EnableStats"] = true,
                ["ColorRoles"] = true,
                ["DecimalValues"] = true,
                ["StatsShareDPS"] = true,
                ["PlayerToPlayer"] = false,
                ["ZoomDungeon"] = 60,
                ["CustomBuffs"] = 
                {
                },
                ["BossFrame"] = true,
                ["SynergyCdDirection"] = "vertical",
                ["BuffsPassives"] = "On additional panel",
                ["AdvancedSynergy"] = false,
                ["StatsTransparent"] = true,
                ["GroupLeave"] = true,
                ["Markers_IconDuration"] = 20,
                ["ReticleInvul"] = true,
                ["SynergyCdPSide"] = "right",
                ["ZoomMountRatio"] = 70,
                ["FrameFont2"] = "esobold",
                ["FoodBuff"] = true,
                ["ConfirmLocked"] = true,
                ["MiniMap"] = false,
                ["MiniMapDimensions"] = 250,
                ["BuffsBlackList"] = 
                {
                    [63601] = true,
                    [14890] = true,
                    [76667] = true,
                },
                ["version"] = 3,
                ["BossWidth"] = 280,
                ["FrameHealthColor1"] = 
                {
                    [4] = 1,
                    [1] = 1,
                    [2] = 0.1568627451,
                    [3] = 0.2745098039,
                },
                ["ActionsFontSize"] = 16,
                ["FriendStatus"] = true,
                ["ExpiresAnimation"] = true,
                ["StatusIcons"] = true,
                ["InCombatReticle"] = true,
                ["RaidFrames"] = false,
                ["CurvedDepth"] = 0.8000000000,
                ["StatsMiniSpeed"] = false,
                ["JumpToLeader"] = true,
                ["TargetBuffs"] = false,
                ["BUI_MiniMeter"] = 
                {
                    [4] = 0,
                    [1] = 9,
                    [2] = 1,
                    [3] = -400,
                },
                ["NotificationsWorld"] = true,
                ["MinimumDuration"] = 3,
                ["DodgeFatigue"] = false,
                ["RepositionFrames"] = true,
                ["ReticleDpS"] = false,
                ["GroupBuffs"] = false,
                ["ReticleResist"] = 3,
                ["RaidHeight"] = 32,
                ["StatShare"] = true,
                ["GroupSynergy"] = 3,
                ["FrameFontSize"] = 15,
                ["EnableCustomBuffs"] = false,
                ["WidgetPotion"] = true,
                ["SynergyCdProgress"] = true,
                ["BUI_BuffsC"] = 
                {
                    [4] = 300,
                    [1] = 128,
                    [2] = 128,
                    [3] = 0,
                },
                ["Theme"] = 2,
                ["Log"] = false,
                ["CollapseNormalDungeon"] = false,
                ["PassivePSide"] = "left",
                ["LargeGroupInvite"] = true,
                ["CurvedHitAnimation"] = true,
                ["BUI_Minimap"] = 
                {
                    [4] = 0,
                    [1] = 9,
                    [2] = 9,
                    [3] = 0,
                },
                ["WidgetSound2"] = "CrownCrates_Manifest_Selected",
                ["EnableNameplate"] = true,
                ["ZoomSubZone"] = 30,
                ["FrameHorisontal"] = true,
                ["BUI_BuffsS"] = 
                {
                    [4] = 200,
                    [1] = 128,
                    [2] = 128,
                    [3] = -300,
                },
                ["Books"] = false,
                ["DefaultTargetFrame"] = true,
                ["QuickSlotsShow"] = 4,
                ["GroupAnimation"] = true,
                ["OnScreenPriorDeath"] = true,
                ["TargetWidth"] = 320,
                ["SmallGroupScale"] = 120,
                ["AutoDismissPet"] = true,
                ["FrameNameFormat"] = 2,
                ["PassiveOakFilter"] = true,
                ["EffectVisualisation"] = true,
                ["FrameShieldColor1"] = 
                {
                    [4] = 1,
                    [1] = 0.9019607843,
                    [2] = 0.3921568627,
                    [3] = 0.0784313725,
                },
                ["PreferredTarget"] = true,
                ["BUI_PlayerFrame"] = 
                {
                    [4] = 200,
                    [1] = 9,
                    [2] = 128,
                    [3] = -250,
                },
                ["StatShareUlt"] = 3,
                ["SynergyCdSize"] = 44,
                ["SynergyCdPWidth"] = 120,
                ["FramesFade"] = false,
                ["BUI_TargetFrame"] = 
                {
                    [4] = 200,
                    [1] = 3,
                    [2] = 128,
                    [3] = 250,
                },
                ["NotificationsTrial"] = true,
                ["RaidWidth"] = 220,
                ["NotificationSound_2"] = "No_Sound",
                ["TargetFrame"] = false,
                ["Markers_Message"] = true,
                ["FrameDamageColor"] = 
                {
                    [1] = 0.8784313725,
                    [2] = 0.1098039216,
                    [3] = 0.1098039216,
                },
                ["BossHeight"] = 28,
                ["StatsMiniMeter"] = false,
                ["RaidColumnSize"] = 6,
                ["WidgetsSize"] = 44,
                ["StatsFontSize"] = 18,
                ["LeaderArrow"] = true,
                ["FrameOpacityIn"] = 90,
                ["DarkBrotherhoodSpree"] = false,
                ["Markers_Icon"] = true,
                ["StatsUpdateDPS"] = false,
                ["AutoQueue"] = false,
                ["SelfColor"] = true,
                ["UndauntedPledges"] = true,
                ["EnableBlackList"] = true,
                ["QuickSlots"] = true,
                ["EnableXPBar"] = true,
                ["ReticleMode"] = 3,
                ["FrameMagickaColor1"] = 
                {
                    [4] = 1,
                    [1] = 0,
                    [2] = 0.4784313725,
                    [3] = 1,
                },
                ["NotificationsSize"] = 32,
                ["FrameOpacityOut"] = 80,
                ["RepeatableQuests"] = true,
                ["DeleteMail"] = false,
                ["ZoomZone"] = 60,
                ["FrameHeight"] = 22,
                ["GroupDeathSound"] = "Lockpicking_unlocked",
                ["NotificationsGroup"] = true,
                ["CustomBuffsPWidth"] = 120,
                ["LastVersion"] = 4.4010000000,
                ["FramesBorder"] = 1,
                ["FrameFont1"] = "esobold",
                ["QuickSlotsInventory"] = true,
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
                ["StatsGroupDPSframe"] = false,
                ["CustomEdgeColor"] = 
                {
                    [4] = 1,
                    [1] = 0,
                    [2] = 0.0700000000,
                    [3] = 0.0700000000,
                },
                ["HousePins"] = 4,
                ["InitialDialog"] = true,
                ["FrameTraumaColor"] = 
                {
                    [4] = 1,
                    [1] = 0.5882352941,
                    [2] = 0.1960784314,
                    [3] = 1,
                },
                ["CustomBuffSize"] = 44,
                ["WidgetsPWidth"] = 120,
                ["StatTriggerHeals"] = false,
                ["FrameWidth"] = 280,
                ["PlayerBuffs"] = false,
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
                ["CurvedOffset"] = -100,
                ["FrameStaminaColor"] = 
                {
                    [4] = 1,
                    [1] = 0,
                    [2] = 0.5490196078,
                    [3] = 0.1176470588,
                },
                ["StatsMiniGroupDps"] = true,
                ["Actions"] = false,
                ["BuffsImportant"] = true,
                ["DefaultTargetFrameText"] = true,
                ["SidePanel"] = 
                {
                    ["GearManager"] = true,
                    ["LFG_Role"] = true,
                    ["Widgets"] = true,
                    ["Statistics"] = true,
                    ["Teleporter"] = true,
                    ["WPamA"] = true,
                    ["Settings"] = true,
                    ["Minimap"] = true,
                    ["Trader"] = true,
                    ["Share"] = true,
                    ["Enable"] = false,
                    ["LeaderArrow"] = true,
                    ["Compass"] = true,
                    ["Ragpicker"] = true,
                    ["Assistans"] = true,
                    ["VeteranDifficulty"] = true,
                    ["Banker"] = true,
                    ["Armorer"] = true,
                    ["AllowOther"] = true,
                    ["Smuggler"] = true,
                    ["DismissPets"] = true,
                    ["SubSampling"] = false,
                    ["HealerHelper"] = true,
                },
                ["StatsMiniHealing"] = false,
                ["CurvedDistance"] = 220,
                ["DefaultPlayerFrames"] = false,
                ["HideSwapPanel"] = true,
                ["BUI_BuffsT"] = 
                {
                    [4] = -350,
                    [1] = 128,
                    [2] = 128,
                    [3] = 0,
                },
                ["StealthWield"] = true,
                ["PvPmode"] = true,
                ["ZoomImperialCity"] = 80,
                ["Markers_HeavySack"] = true,
                ["StatsGroupDPS"] = false,
                ["UseSwapPanel"] = true,
                ["CustomBuffsPSide"] = "right",
                ["LargeRaidScale"] = 80,
                ["GroupSynergyCount"] = 2,
                ["BUI_BuffsPas"] = 
                {
                    [4] = 0,
                    [1] = 12,
                    [2] = 12,
                    [3] = 0,
                },
                ["ImpactAnimation"] = true,
                ["MiniMeterAplha"] = 0.8000000000,
                ["NotificationsTimer"] = 3000,
                ["RaidFontSize"] = 17,
                ["FrameHealthColor"] = 
                {
                    [4] = 1,
                    [1] = 0.5882352941,
                    [2] = 0.1176470588,
                    [3] = 0.2352941176,
                },
                ["TargetBuffSize"] = 44,
                ["UltimateOrder"] = 2,
                ["TauntTimer"] = 1,
                ["BUI_RaidFrame"] = 
                {
                    [4] = 160,
                    [1] = 3,
                    [2] = 3,
                    [3] = 50,
                },
                ["ReportScale"] = 1,
                ["ExecuteThreshold"] = 25,
                ["PlayerBuffSize"] = 44,
                ["FrameHealerColor"] = 
                {
                    [1] = 1,
                    [2] = 0.7568627451,
                    [3] = 0.4980392157,
                },
                ["LargeGroupAnnoucement"] = true,
                ["FramePercents"] = false,
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
                ["version"] = 1,
                ["data"] = 
                {
                },
            },
        },
    },
}
