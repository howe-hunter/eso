BUI_VARS =
{
    ["Default"] = 
    {
        ["@Motiv_Impact"] = 
        {
            ["$AccountWide"] = 
            {
                ["DeveloperMode"] = false,
                ["BossHeight"] = 28,
                ["TargetBuffsAlign"] = 128,
                ["UltimateOrder"] = 2,
                ["BUI_OnScreen"] = 
                {
                    [4] = -110,
                    [1] = 128,
                    [2] = 128,
                    [3] = 0,
                },
                ["CurvedDepth"] = 0.8000000000,
                ["PlayerBuffsAlign"] = 128,
                ["ProcSound"] = "Ability_Ultimate_Ready_Sound",
                ["SynergyCdSize"] = 44,
                ["ZoomImperialsewer"] = 60,
                ["Books"] = false,
                ["FrameHeight"] = 22,
                ["NotificationsTrial"] = true,
                ["BUI_TargetFrame"] = 
                {
                    [4] = 200,
                    [1] = 3,
                    [2] = 128,
                    [3] = 250,
                },
                ["InCombatReticle"] = true,
                ["CollapseNormalDungeon"] = false,
                ["GroupDeathSound"] = "Lockpicking_unlocked",
                ["LargeGroupInvite"] = true,
                ["LargeRaidScale"] = 80,
                ["LeaderArrow"] = true,
                ["RaidColumnSize"] = 6,
                ["FrameHorisontal"] = true,
                ["PreferredTarget"] = true,
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
                ["SelfColor"] = true,
                ["StatsBuffs"] = false,
                ["FrameShieldColor"] = 
                {
                    [4] = 1,
                    [1] = 0.9803921569,
                    [2] = 0.3921568627,
                    [3] = 0.0784313725,
                },
                ["Markers_HeavySack"] = true,
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
                ["MiniMap"] = false,
                ["BUI_PlayerFrame"] = 
                {
                    [4] = 200,
                    [1] = 9,
                    [2] = 128,
                    [3] = -250,
                },
                ["PassiveProgress"] = false,
                ["CustomBuffsDirection"] = "vertical",
                ["BUI_BuffsS"] = 
                {
                    [4] = 200,
                    [1] = 128,
                    [2] = 128,
                    [3] = -300,
                },
                ["CurvedHeight"] = 360,
                ["NotificationSound_2"] = "No_Sound",
                ["FrameMagickaColor"] = 
                {
                    [4] = 1,
                    [1] = 0,
                    [2] = 0.1176470588,
                    [3] = 0.8627450980,
                },
                ["PinScale"] = 75,
                ["CastbyPlayer"] = true,
                ["NotificationsGroup"] = true,
                ["FrameFont1"] = "esobold",
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
                            ["command"] = "/reloadui",
                            ["icon"] = "/esoui/art/mounts/ridingskill_ready.dds",
                            ["enable"] = true,
                        },
                        [2] = 
                        {
                            ["command"] = "/script StartChatInput('/z Guild [name] recruits new members!')",
                            ["icon"] = "/esoui/art/icons/ability_warrior_010.dds",
                            ["enable"] = false,
                        },
                        [3] = 
                        {
                            ["command"] = "/dancedunmer",
                            ["icon"] = "/esoui/art/icons/ability_mage_066.dds",
                            ["enable"] = false,
                        },
                        [4] = 
                        {
                            ["command"] = "/script ZO_CompassFrame:SetHidden(not ZO_CompassFrame:IsHidden())",
                            ["icon"] = "/esoui/art/icons/ability_rogue_062.dds",
                            ["enable"] = true,
                        },
                        [5] = 
                        {
                            ["command"] = "/mimewall",
                            ["icon"] = "/esoui/art/icons/emote_mimewall.dds",
                            ["enable"] = false,
                        },
                        [6] = 
                        {
                            ["command"] = "/script UseCollectible(336)",
                            ["icon"] = "/esoui/art/icons/quest_gemstone_tear_0002.dds",
                            ["enable"] = true,
                        },
                        [7] = 
                        {
                            ["command"] = "/jumptoleader",
                            ["icon"] = "/esoui/art/tutorial/gamepad/gp_playermenu_icon_store.dds",
                            ["enable"] = false,
                        },
                        [8] = 
                        {
                            ["command"] = "/script zo_callLater(function() local name=GetUnitDisplayName('reticleover') if name then StartChatInput('/w '..name..' ') else a('No target') end end,100)",
                            ["icon"] = "esoui/art/tutorial/chat-notifications_up.dds",
                            ["enable"] = false,
                        },
                        [9] = 
                        {
                            ["command"] = "/script d(AreAnyItemsStolen(BAG_BACKPACK) and 'Have stolen items' or 'Have no stolen items')",
                            ["icon"] = "/esoui/art/inventory/gamepad/gp_inventory_icon_stolenitem.dds",
                            ["enable"] = false,
                        },
                        [10] = 
                        {
                            ["command"] = "/script local _,i=GetAbilityProgressionXPInfoFromAbilityId(40232) local _,m,r=GetAbilityProgressionInfo(i) local _,_,index=GetAbilityProgressionAbilityInfo(i,m,r) CallSecureProtected('SelectSlotAbility', index, 3)",
                            ["icon"] = "/esoui/art/icons/ability_ava_005_a.dds",
                            ["enable"] = false,
                        },
                        [11] = 
                        {
                            ["command"] = "/script BUI.Vars.EnableWidgets=not BUI.Vars.EnableWidgets BUI.Frames.Widgets_Init() d('Widgets are now '..(BUI.Vars.EnableWidgets and '|c33EE33enabled|r' or '|EE3333disabled|r'))",
                            ["icon"] = "/esoui/art/progression/morph_up.dds",
                            ["enable"] = false,
                        },
                        [12] = 
                        {
                            ["command"] = "/script local text='Another sample'd(text) a(text)",
                            ["icon"] = "Text",
                            ["enable"] = false,
                        },
                    },
                },
                ["FrameStaminaColor1"] = 
                {
                    [4] = 1,
                    [1] = 0,
                    [2] = 0.8235294118,
                    [3] = 0.0784313725,
                },
                ["TauntTimer"] = 1,
                ["TargetWidth"] = 320,
                ["BUI_BuffsC"] = 
                {
                    [4] = 300,
                    [1] = 128,
                    [2] = 128,
                    [3] = 0,
                },
                ["FrameFont2"] = "esobold",
                ["ZoomCyrodiil"] = 45,
                ["RepositionFrames"] = true,
                ["ExecuteThreshold"] = 25,
                ["AdvancedThemeColor"] = 
                {
                    [4] = 0.9000000000,
                    [1] = 0.5000000000,
                    [2] = 0.6000000000,
                    [3] = 1,
                },
                ["StealthWield"] = true,
                ["StatsShareDPS"] = true,
                ["FriendStatus"] = true,
                ["RaidSplit"] = 0,
                ["PlayerToPlayer"] = false,
                ["EnableStats"] = true,
                ["ZoomDungeon"] = 60,
                ["BUI_Minimap"] = 
                {
                    [4] = 0,
                    [1] = 9,
                    [2] = 9,
                    [3] = 0,
                },
                ["Log"] = false,
                ["FrameOpacityIn"] = 90,
                ["AdvancedSynergy"] = false,
                ["CustomBuffsProgress"] = true,
                ["PassiveBuffSize"] = 36,
                ["DefaultTargetFrameText"] = true,
                ["SynergyCdDirection"] = "vertical",
                ["ActionsPrecise"] = false,
                ["StatsGroupDPSframe"] = false,
                ["CurvedStatValues"] = true,
                ["GroupLeave"] = true,
                ["FoodBuff"] = true,
                ["FrameDamageColor"] = 
                {
                    [1] = 0.8784313725,
                    [2] = 0.1098039216,
                    [3] = 0.1098039216,
                },
                ["PlayerBuffSize"] = 44,
                ["AttackersWidth"] = 280,
                ["ConfirmLocked"] = true,
                ["TargetBuffs"] = false,
                ["StatsMiniMeter"] = false,
                ["DarkBrotherhoodSpree"] = false,
                ["version"] = 3,
                ["DefaultPlayerFrames"] = false,
                ["PassivePSide"] = "left",
                ["UseSwapPanel"] = true,
                ["TargetFrame"] = false,
                ["OnScreenPriorDeath"] = true,
                ["EnableWidgets"] = false,
                ["ActionsFontSize"] = 16,
                ["DodgeFatigue"] = false,
                ["MiniMapTitle"] = false,
                ["UndauntedPledges"] = true,
                ["NotificationsSize"] = 32,
                ["SidePanel"] = 
                {
                    ["Enable"] = false,
                    ["LeaderArrow"] = true,
                    ["DismissPets"] = true,
                    ["Ragpicker"] = true,
                    ["HealerHelper"] = true,
                    ["VeteranDifficulty"] = true,
                    ["LFG_Role"] = true,
                    ["Trader"] = true,
                    ["Smuggler"] = true,
                    ["Compass"] = true,
                    ["Share"] = true,
                    ["Teleporter"] = true,
                    ["Statistics"] = true,
                    ["GearManager"] = true,
                    ["Assistans"] = true,
                    ["Banker"] = true,
                    ["WPamA"] = true,
                    ["Minimap"] = true,
                    ["Widgets"] = true,
                    ["Armorer"] = true,
                    ["AllowOther"] = true,
                    ["SubSampling"] = false,
                    ["Settings"] = true,
                },
                ["StatsMiniHealing"] = false,
                ["SynergyCdProgress"] = true,
                ["GroupBuffs"] = false,
                ["GroupSynergyCount"] = 2,
                ["CustomBuffs"] = 
                {
                },
                ["RaidFontSize"] = 17,
                ["Markers_Trials"] = false,
                ["ExecuteSound"] = false,
                ["ProcAnimation"] = true,
                ["Markers_Dungeons"] = false,
                ["ReticleResist"] = 3,
                ["FrameStaminaColor"] = 
                {
                    [4] = 1,
                    [1] = 0,
                    [2] = 0.5490196078,
                    [3] = 0.1176470588,
                },
                ["ContainerHandler"] = false,
                ["FramesBorder"] = 1,
                ["PassiveOakFilter"] = true,
                ["FrameShieldColor1"] = 
                {
                    [4] = 1,
                    [1] = 0.9019607843,
                    [2] = 0.3921568627,
                    [3] = 0.0784313725,
                },
                ["RaidLevels"] = true,
                ["BUI_GroupDPS"] = 
                {
                    [4] = 120,
                    [1] = 3,
                    [2] = 1,
                    [3] = -400,
                },
                ["CastBar"] = 3,
                ["WidgetSound2"] = "CrownCrates_Manifest_Selected",
                ["WidgetsSize"] = 44,
                ["EnableNameplate"] = true,
                ["FrameHealerColor"] = 
                {
                    [1] = 1,
                    [2] = 0.7568627451,
                    [3] = 0.4980392157,
                },
                ["RaidWidth"] = 220,
                ["StatsGroupDPS"] = false,
                ["FrameWidth"] = 280,
                ["FramesFade"] = false,
                ["StatsSplitElements"] = false,
                ["ZoomMountRatio"] = 70,
                ["ReticleMode"] = 3,
                ["BUI_MiniMeter"] = 
                {
                    [4] = 0,
                    [1] = 9,
                    [2] = 1,
                    [3] = -400,
                },
                ["FrameNameFormat"] = 2,
                ["MarkerSize"] = 40,
                ["EnableCustomBuffs"] = false,
                ["ReticleDpS"] = false,
                ["TargetHeight"] = 22,
                ["PlayerFrame"] = false,
                ["AttackersHeight"] = 28,
                ["ZoomImperialCity"] = 80,
                ["StatsTransparent"] = true,
                ["WidgetSound1"] = "CrownCrates_Manifest_Chosen",
                ["BUI_BuffsT"] = 
                {
                    [4] = -350,
                    [1] = 128,
                    [2] = 128,
                    [3] = 0,
                },
                ["Markers_Message"] = true,
                ["CurvedDistance"] = 220,
                ["Theme"] = 2,
                ["WidgetPotion"] = true,
                ["HousePins"] = 4,
                ["ZoomSubZone"] = 30,
                ["NotificationSound_1"] = "Champion_PointsCommitted",
                ["MinimumDuration"] = 3,
                ["TargetFrameTextAlign"] = "default",
                ["CurvedHitAnimation"] = true,
                ["Actions"] = false,
                ["EffectVisualisation"] = true,
                ["JumpToLeader"] = true,
                ["EnableBlackList"] = true,
                ["BUI_BuffsP"] = 
                {
                    [4] = 345,
                    [1] = 128,
                    [2] = 128,
                    [3] = 0,
                },
                ["CustomBuffsPWidth"] = 120,
                ["SynergyCdPWidth"] = 120,
                ["FramesTexture"] = "rounded",
                ["FrameHealthColor1"] = 
                {
                    [4] = 1,
                    [1] = 1,
                    [2] = 0.1568627451,
                    [3] = 0.2745098039,
                },
                ["BossFrame"] = true,
                ["Markers_Icon"] = true,
                ["GroupElection"] = true,
                ["AutoDismissPet"] = true,
                ["MarkerLeader"] = false,
                ["StatsMiniSpeed"] = false,
                ["EnableSynergyCd"] = false,
                ["StatsUpdateDPS"] = false,
                ["CustomEdgeColor"] = 
                {
                    [4] = 1,
                    [1] = 0,
                    [2] = 0.0700000000,
                    [3] = 0.0700000000,
                },
                ["DeleteMail"] = false,
                ["AutoQueue"] = false,
                ["RaidSort"] = 1,
                ["StatTriggerHeals"] = false,
                ["BUI_RaidFrame"] = 
                {
                    [4] = 160,
                    [1] = 3,
                    [2] = 3,
                    [3] = 50,
                },
                ["QuickSlotsInventory"] = true,
                ["FrameMagickaColor1"] = 
                {
                    [4] = 1,
                    [1] = 0,
                    [2] = 0.4784313725,
                    [3] = 1,
                },
                ["ZoomGlobal"] = 3,
                ["RepeatableQuests"] = true,
                ["Widgets"] = 
                {
                    [61919] = true,
                    [46327] = true,
                    ["Major Resolve"] = true,
                    [110067] = true,
                    ["Major Sorcery"] = true,
                    [107141] = true,
                    [110118] = true,
                    [61927] = true,
                    [126941] = true,
                    [104538] = true,
                    ["Major Brutality"] = true,
                    ["Immovable"] = true,
                    [109084] = true,
                    ["Major Courage"] = true,
                    [110142] = true,
                    [110143] = true,
                },
                ["ZoomZone"] = 60,
                ["BuffsBlackList"] = 
                {
                    [63601] = true,
                    [14890] = true,
                    [76667] = true,
                },
                ["FrameTraumaColor"] = 
                {
                    [4] = 1,
                    [1] = 0.5882352941,
                    [2] = 0.1960784314,
                    [3] = 1,
                },
                ["RaidFrames"] = false,
                ["FrameTankColor"] = 
                {
                    [1] = 0.8588235294,
                    [2] = 0.5607843137,
                    [3] = 1,
                },
                ["StatusIcons"] = true,
                ["QuickSlots"] = true,
                ["HideSwapPanel"] = true,
                ["EnableXPBar"] = true,
                ["MiniMapDimensions"] = 250,
                ["FramePercents"] = false,
                ["ExpiresAnimation"] = true,
                ["InitialDialog"] = true,
                ["GroupSynergy"] = 3,
                ["BuffsImportant"] = true,
                ["BUI_OnScreenS"] = 
                {
                    [4] = -210,
                    [1] = 128,
                    [2] = 128,
                    [3] = 360,
                },
                ["LastVersion"] = 4.4010000000,
                ["BuffsOtherHide"] = true,
                ["WidgetsPWidth"] = 120,
                ["NotificationsTimer"] = 3000,
                ["ReticleInvul"] = true,
                ["StatsMiniGroupDps"] = true,
                ["FrameHealthColor"] = 
                {
                    [4] = 1,
                    [1] = 0.5882352941,
                    [2] = 0.1176470588,
                    [3] = 0.2352941176,
                },
                ["StatShareUlt"] = 3,
                ["BlockAnnouncement"] = false,
                ["RaidHeight"] = 32,
                ["BossWidth"] = 280,
                ["DecimalValues"] = true,
                ["FrameShowMax"] = false,
                ["SynergyCdPSide"] = "right",
                ["CustomBuffSize"] = 44,
                ["BUI_BuffsPas"] = 
                {
                    [4] = 0,
                    [1] = 12,
                    [2] = 12,
                    [3] = 0,
                },
                ["Reports"] = 
                {
                },
                ["PassivePWidth"] = 100,
                ["FrameOpacityOut"] = 80,
                ["PvPmode"] = true,
                ["Markers_IconDuration"] = 20,
                ["FrameFontSize"] = 15,
                ["StatShare"] = true,
                ["ReportScale"] = 1,
                ["BUI_HPlayerFrame"] = 
                {
                    [4] = 410,
                    [1] = 128,
                    [2] = 128,
                    [3] = 0,
                },
                ["ColorRoles"] = true,
                ["PlayerBuffs"] = false,
                ["StatsFontSize"] = 18,
                ["CurvedOffset"] = -100,
                ["CurvedFrame"] = 0,
                ["FastTravel"] = true,
                ["Glyphs"] = true,
                ["BuiltInGlobalCooldown"] = false,
                ["MiniMeterAplha"] = 0.8000000000,
                ["GroupAnimation"] = true,
                ["FrameTraumaColor1"] = 
                {
                    [4] = 1,
                    [1] = 0.2941176471,
                    [2] = 0,
                    [3] = 0.5882352941,
                },
                ["DefaultTargetFrame"] = true,
                ["NotificationsWorld"] = true,
                ["TargetBuffSize"] = 44,
                ["CustomBuffsPSide"] = "right",
                ["BuffsPassives"] = "On additional panel",
                ["SmallGroupScale"] = 120,
                ["ImpactAnimation"] = true,
                ["LargeGroupAnnoucement"] = true,
                ["NotificationFood"] = true,
                ["QuickSlotsShow"] = 4,
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
