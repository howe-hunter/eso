--[[
    LuiExtended
    License: The MIT License (MIT)
--]]

-- Unit Frames namespace
LUIE.UnitFrames = {}
local UnitFrames = LUIE.UnitFrames

local UI = LUIE.UI

local AbbreviateNumber = LUIE.AbbreviateNumber
local printToChat = LUIE.PrintToChat

local zo_strformat = zo_strformat

local eventManager = EVENT_MANAGER
local sceneManager = SCENE_MANAGER

local moduleName = LUIE.name .. "UnitFrames"

local classIcons = {
    [0] = "/esoui/art/contacts/social_status_offline.dds",
    [1] = "/esoui/art/icons/class/class_dragonknight.dds",
    [2] = "/esoui/art/icons/class/class_sorcerer.dds",
    [3] = "/esoui/art/icons/class/class_nightblade.dds",
    [4] = "/esoui/art/icons/class/class_warden.dds",
    [5] = "/esoui/art/icons/class/class_necromancer.dds",
    [6] = "/esoui/art/icons/class/class_templar.dds",
}

local roleIcons = {
    [0] = "LuiExtended/media/unitframes/unitframes_class_none.dds",
    [1] = "esoui/art/lfg/lfg_icon_dps.dds",
    [4] = "esoui/art/lfg/lfg_icon_healer.dds",
    [2] = "esoui/art/lfg/lfg_icon_tank.dds",
}

local leaderIcons = {
    [0] = "LuiExtended/media/unitframes/unitframes_class_none.dds",
    [1] = "/esoui/art/icons/guildranks/guild_rankicon_misc01.dds",
}

UnitFrames.Enabled = false
UnitFrames.Defaults = {
    ShortenNumbers                   = false,
    RepositionFrames                 = true,
    DefaultOocTransparency           = 85,
    DefaultIncTransparency           = 85,
    DefaultFramesNewPlayer           = 1,
    DefaultFramesNewTarget           = 1,
    DefaultFramesNewGroup            = 1,
    DefaultFramesNewBoss             = 2,
    Format                           = "Current + Shield (Percentage%)",
    DefaultFontFace                  = "Univers 67",
    DefaultFontStyle                 = "soft-shadow-thick",
    DefaultFontSize                  = 16,
    DefaultTextColour                = { 1, 1, 1 },
    TargetShowClass                  = true,
    TargetShowFriend                 = true,
    TargetColourByReaction           = false,
    CustomFormatOnePT                = "Current + Shield / Max", -- TODO: localization
    CustomFormatOneGroup             = "Current + Shield / Max", -- TODO: localization
    CustomFormatTwoPT                = "Percentage%",
    CustomFormatTwoGroup             = "Percentage%",
    CustomFormatRaid                 = "Current (Percentage%)", -- TODO: localization
    CustomFormatBoss                 = "Percentage%",
    CustomFontFace                   = "Univers 67",
    CustomFontStyle                  = "soft-shadow-thin",
    CustomFontBars                   = 16,
    CustomFontOther                  = 20,
    CustomTexture                    = "Minimalistic",
    HideBuffsPlayerOoc               = false,
    HideBuffsTargetOoc               = false,
    PlayerOocAlpha                   = 85,
    PlayerIncAlpha                   = 85,
    TargetOocAlpha                   = 85,
    TargetIncAlpha                   = 85,
    GroupAlpha                       = 85,
    BossOocAlpha                     = 85,
    BossIncAlpha                     = 85,
    CustomOocAlphaPower              = true,
    CustomColourHealth               = { 202/255,  20/255, 0       },
    CustomColourShield               = { 1      , 192/255, 0       }, -- .a=0.5 for overlay and .a = 1 for separate
    CustomColourMagicka              = { 0      ,  83/255, 209/255 },
    CustomColourStamina              = {  28/255, 177/255, 0       },
    CustomColourDPS                  = { 130/255,  99/255, 65/255  },
    CustomColourHealer               = { 117/255, 077/255, 135/255 },
    CustomColourTank                 = { 133/255, 018/255, 013/255 },
    CustomColourDragonknight         = { 255/255, 125/255, 35/255  },
    CustomColourNightblade           = { 255/255, 51/255,  49/255  },
    CustomColourSorcerer             = { 75/255,  83/255,  247/255 },
    CustomColourTemplar              = { 255/255, 240/255, 95/255  },
    CustomColourWarden               = { 136/255, 245/255, 125/255 },
    CustomColourNecromancer          = { 97/255, 37/255, 201/255 },
    CustomShieldBarSeparate          = false,
    CustomShieldBarHeight            = 10,
    CustomShieldBarFull              = false,
    CustomSmoothBar                  = true,
    CustomFramesPlayer               = true,
    CustomFramesTarget               = true,
    PlayerBarWidth                   = 300,
    TargetBarWidth                   = 300,
    PlayerBarHeightHealth            = 30,
    PlayerBarHeightMagicka           = 28,
    PlayerBarHeightStamina           = 28,
    BossBarWidth                     = 300,
    BossBarHeight                    = 36,
    HideBarMagicka                   = false,
    HideLabelMagicka                 = false,
    HideBarStamina                   = false,
    HideLabelStamina                 = false,
    HideLabelHealth                  = false,
    HideBarHealth                    = false,
    PlayerBarSpacing                 = 0,
    TargetBarHeight                  = 36,
    PlayerEnableYourname             = true,
    PlayerEnableAltbarMSW            = true,
    PlayerEnableAltbarXP             = true,
    PlayerChampionColour             = true,
    PlayerEnableArmor                = true,
    PlayerEnablePower                = true,
    PlayerEnableRegen                = true,
    GroupEnableArmor                 = false,
    GroupEnablePower                 = false,
    GroupEnableRegen                 = true,
    RaidEnableArmor                  = false,
    RaidEnablePower                  = false,
    RaidEnableRegen                  = false,
    BossEnableArmor                  = false,
    BossEnablePower                  = false,
    BossEnableRegen                  = false,
    TargetEnableClass                = false,
    TargetEnableRank                 = true,
    TargetEnableRankIcon             = true,
    TargetTitlePriority              = "Title",
    TargetEnableTitle                = true,
    TargetEnableSkull                = true,
    CustomFramesGroup                = true,
    GroupExcludePlayer               = false,
    GroupBarWidth                    = 260,
    GroupBarHeight                   = 36,
    GroupBarSpacing                  = 40,
    CustomFramesRaid                 = true,
    RaidNameClip                     = 94,
    RaidBarWidth                     = 220,
    RaidBarHeight                    = 30,
    RaidLayout                       = "2 x 12",
    RoleIconSmallGroup               = true,
    ColorRoleGroup                   = true,
    ColorRoleRaid                    = true,
    ColorClassGroup                  = false,
    ColorClassRaid                   = false,
    RaidSpacers                      = false,
    CustomFramesBosses               = true,
    AvaCustFramesTarget              = false,
    AvaTargetBarWidth                = 450,
    AvaTargetBarHeight               = 36,
    Target_FontColour                = { 1, 1, 1 },
    Target_FontColour_FriendlyNPC    = { 0, 1, 0 },
    Target_FontColour_FriendlyPlayer = { 0.7, 0.7, 1 },
    Target_FontColour_Hostile        = { 1, 0, 0 },
    Target_FontColour_Neutral        = { 1, 1, 0 },
    Target_Neutral_UseDefaultColour  = true,
    ReticleColour_Interact           = { 1, 1, 0 },
    ReticleColourByReaction          = false,
    DisplayOptionsPlayer             = 2,
    DisplayOptionsTarget             = 2,
    DisplayOptionsGroupRaid          = 2,
    ExecutePercentage                = 20,
    RaidIconOptions                  = 2,
    RepositionFramesAdjust           = 0,
    PlayerFrameOptions               = 1,
    AdjustStaminaHPos                = 200,
    AdjustStaminaVPos                = 0,
    AdjustMagickaHPos                = 200,
    AdjustMagickaVPos                = 0,
    FrameColorReaction               = false,
    FrameColorClass                  = false,
    CustomColourPlayer               = { 178/255, 178/255, 1 },
    CustomColourFriendly             = { 0, 1, 0 },
    CustomColourHostile              = { 1, 0, 0 },
    CustomColourNeutral              = { 150/255, 150/255, 150/255 },
    CustomColourGuard                = { 95/255, 65/255, 54/255 },
    CustomColourCompanionFrame       = { 0, 1, 0 },
    LowResourceHealth                = 25,
    LowResourceStamina               = 25,
    LowResourceMagicka               = 25,
    ShieldAlpha                      = 50,
    ResolutionOptions                = 1,
    ReverseResourceBars              = false,
    CustomFramesPet                  = true,
    CustomFormatPet                  = "Current (Percentage%)",
    CustomColourPet                  = { 202/255,  20/255, 0 },
    PetHeight                        = 30,
    PetWidth                         = 220,
    PetUseClassColor                 = false,
    PetIncAlpha                      = 85,
    PetOocAlpha                      = 85,
    whitelist                        = {}, -- whitelist for pet names
    PetNameClip                      = 88,
    CustomFramesCompanion            = true,
    CustomFormatCompanion            = "Current (Percentage%)",
    CustomColourCompanion            = { 202/255,  20/255, 0 },
    CompanionHeight                  = 30,
    CompanionWidth                   = 220,
    CompanionUseClassColor           = false,
    CompanionIncAlpha                = 85,
    CompanionOocAlpha                = 85,
    CompanionNameClip                = 88,
    BarAlignPlayerHealth             = 1,
    BarAlignPlayerMagicka            = 1,
    BarAlignPlayerStamina            = 1,
    BarAlignTarget                   = 1,
    BarAlignCenterLabelPlayer        = false,
    BarAlignCenterLabelTarget        = false,
    CustomFormatCenterLabel          = "Current + Shield / Max (Percentage%)", -- TODO: localization

}
UnitFrames.SV = nil

UnitFrames.CustomFrames             = {}
UnitFrames.CustomFramesMovingState  = false

local g_AvaCustFrames       = {} -- Another set of custom frames. Currently designed only to provide AvA Player Target reticleover frame
local g_DefaultFrames       = {} -- Default Unit Frames are not referenced by external modules
local g_MaxChampionPoint    = 3600 -- Keep this value in local constant
local g_defaultTargetNameLabel   -- Reference to default UI target name label
local g_defaultThreshold    = 25
local g_isRaid              = false -- Used by resurrection tracking function to determine if we should use abbreviated or unabbreviated text for resurrection.
local g_powerError          = {}
local g_savedHealth         = {}
local g_statFull            = {}
local g_targetThreshold
local g_healthThreshold
local g_magickaThreshold
local g_staminaThreshold
local g_targetUnitFrame          -- Reference to default UI target unit frame
local playerDisplayName = GetUnitDisplayName("player")

local CP_BAR_COLOURS = ZO_CP_BAR_GRADIENT_COLORS

local g_PendingUpdate = {
    Group       = { flag = false, delay = 200 , name = moduleName .. "PendingGroupUpdate" },
    VeteranXP   = { flag = false, delay = 5000, name = moduleName .. "PendingVeteranXP" },
}

-- Font to be used on default UI overlay labels
local defaultLabelFont = "/LuiExtended/media/fonts/Fontin/fontin_sans_sc.otf|15|outline"

-- Labels for Offline/Dead/Resurrection Status
local strDead           = GetString(SI_UNIT_FRAME_STATUS_DEAD)
local strOffline        = GetString(SI_UNIT_FRAME_STATUS_OFFLINE)
local strResCast        = GetString(SI_PLAYER_TO_PLAYER_RESURRECT_BEING_RESURRECTED)
local strResSelf        = GetString(SI_LUIE_UF_DEAD_STATUS_REVIVING)
local strResPending     = GetString(SI_PLAYER_TO_PLAYER_RESURRECT_HAS_RESURRECT_PENDING)
local strResCastRaid    = GetString(SI_LUIE_UF_DEAD_STATUS_RES_SHORTHAND)
local strResPendingRaid = GetString(SI_LUIE_UF_DEAD_STATUS_RES_PENDING_SHORTHAND)

-- Following settings will be used in options menu to define DefaultFrames behaviour
-- TODO: localization
local g_DefaultFramesOptions = {
    [1] = "Disable",                                -- false
    [2] = "Do nothing (keep default)",              -- nil
    [3] = "Use Extender (display text overlay)",    -- true
}

-- Default Regen/degen animation used on default group frames and custom frames
local function CreateRegenAnimation(parent, anchors, dims, alpha, number)
    if #dims ~= 2 then
        dims = { parent:GetDimensions() }
    end

    local updateDims = { dims[2] * 1.9, dims[2] * .85 }

    -- Create regen control
    local control
    local offsetX
    local distance
    if number == "degen1" then
        control = UI.Texture(parent, anchors, updateDims, "/LuiExtended/media/unitframes/regenleft.dds", 2, true)
        distance = -dims[1] * .35
        offsetX = dims[1] * .425
    elseif number == "degen2" then
        control = UI.Texture(parent, anchors, updateDims, "/LuiExtended/media/unitframes/regenright.dds", 2, true)
        distance = dims[1] * .35
        offsetX = -dims[1] * .425
    elseif number == "regen1" then
        control = UI.Texture(parent, anchors, updateDims, "/LuiExtended/media/unitframes/regenright.dds", 2, true)
        distance = dims[1] * .35
        offsetX = dims[1] * .075
    elseif number == "regen2" then
        control = UI.Texture(parent, anchors, updateDims, "/LuiExtended/media/unitframes/regenleft.dds", 2, true)
        distance = -dims[1] * .35
        offsetX = -dims[1] * .075
    end

    control:SetHidden(true)
    control:SetAlpha(0)
    control:SetDrawLayer(1)

    local isValidAnchor, point, relativeTo, relativePoint, _, offsetY = control:GetAnchor()

    -- Create an horizontal sliding animation
    local animation, timeline = CreateSimpleAnimation(ANIMATION_TRANSLATE,control,0)
    animation:SetTranslateOffsets(offsetX, offsetY, offsetX + distance, offsetY )
    animation:SetDuration(1000)

    -- Fade alpha coming in
    local fadeIn = timeline:InsertAnimation(ANIMATION_ALPHA,control,0)
    fadeIn:SetAlphaValues(0,.75)
    fadeIn:SetDuration(250)
    fadeIn:SetEasingFunction(ZO_EaseOutQuadratic)

    -- Fade alpha going out
    local fadeOut = timeline:InsertAnimation(ANIMATION_ALPHA,control,750)
    fadeOut:SetAlphaValues(.75,0)
    fadeOut:SetDuration(250)
    fadeIn:SetEasingFunction(ZO_EaseOutQuadratic)

    timeline:SetPlaybackType(ANIMATION_PLAYBACK_LOOP, LOOP_INDEFINITELY)
    control.animation = animation
    control.timeline = timeline

    return control
end

-- Decreased armour overlay visuals
local function CreateDecreasedArmorOverlay( parent, small )
    local control = UI.Control( parent, {CENTER,CENTER}, {512,32}, false )
    control.smallTex = UI.Texture(control, {CENTER,CENTER}, {512,32}, "/EsoUI/Art/UnitAttributeVisualizer/attributeBar_dynamic_decreasedArmor_small.dds", 2, false)
    control.smallTex:SetDrawTier(HIGH)
    --control.smallTexGlow = UI.Texture(control, {CENTER,CENTER}, {512,32}, "/EsoUI/Art/UnitAttributeVisualizer/attributeBar_dynamic_decreasedArmor_small_glow.dds", 2, false)
    --control.smallTexGlow:SetDrawTier(HIGH)
    if not small then
        control.normalTex = UI.Texture(control, {CENTER,CENTER}, {512,32}, "/EsoUI/Art/UnitAttributeVisualizer/attributeBar_dynamic_decreasedArmor_standard.dds", 2, false)
        control.normalTex:SetDrawTier(HIGH)
        --control.normalTexGlow = UI.Texture(control, {CENTER,CENTER}, {512,32}, "/EsoUI/Art/UnitAttributeVisualizer/attributeBar_dynamic_decreasedArmor_standard_glow.dds", 2, false)
        --control.normalTexGlow:SetDrawTier(HIGH)
    end

    return control
end

function UnitFrames.AddCurrentPetsToCustomList(list)
    for i = 1, 7 do
        local unitTag = "playerpet" .. i
        if DoesUnitExist(unitTag) then
            local unitName = GetUnitName(unitTag)
            if unitName ~= "" and unitName ~= nil then
                UnitFrames.AddToCustomList(list, unitName)
            end
        end
    end
end


-- Bulk list add from menu buttons
function UnitFrames.AddBulkToCustomList(list, table)
    if table ~= nil then
        for k, v in pairs(table) do
            UnitFrames.AddToCustomList(list, k)
        end
    end
end

function UnitFrames.ClearCustomList(list)
    local listRef = list == UnitFrames.SV.whitelist and GetString(SI_LUIE_CUSTOM_LIST_UF_WHITELIST) or ""
    for k, v in pairs(list) do
        list[k] = nil
    end
    CHAT_SYSTEM:Maximize() CHAT_SYSTEM.primaryContainer:FadeIn()
    printToChat(zo_strformat(GetString(SI_LUIE_CUSTOM_LIST_CLEARED), listRef), true)
end

-- List Handling (Add) Pet Whitelist
function UnitFrames.AddToCustomList(list, input)
    local listRef = list == UnitFrames.SV.whitelist and GetString(SI_LUIE_CUSTOM_LIST_UF_WHITELIST) or ""
    if input ~= "" then
        list[input] = true
        CHAT_SYSTEM:Maximize() CHAT_SYSTEM.primaryContainer:FadeIn()
        printToChat(zo_strformat(GetString(SI_LUIE_CUSTOM_LIST_ADDED_NAME), input, listRef), true)
    end
end

-- List Handling (Remove) Pet Whitelist
function UnitFrames.RemoveFromCustomList(list, input)
    local listRef = list == UnitFrames.SV.whitelist and GetString(SI_LUIE_CUSTOM_LIST_UF_WHITELIST) or ""
    if input ~= "" then
        list[input] = nil
        CHAT_SYSTEM:Maximize() CHAT_SYSTEM.primaryContainer:FadeIn()
        printToChat(zo_strformat(GetString(SI_LUIE_CUSTOM_LIST_REMOVED_NAME), input, listRef), true)
    end
end

function UnitFrames.GetDefaultFramesOptions(frame)
    local retval = {}
    for k,v in pairs(g_DefaultFramesOptions) do
        if not (frame == "Boss" and k == 3) then
            table.insert( retval, v )
        end
    end
    return retval
end

function UnitFrames.SetDefaultFramesSetting(frame, value)
    local key = "DefaultFramesNew" .. tostring(frame)
    if value == g_DefaultFramesOptions[3] then
        SetSetting(SETTING_TYPE_UI, UI_SETTING_RESOURCE_NUMBERS, 0)
        UnitFrames.SV[key] = 3
    elseif value == g_DefaultFramesOptions[2] then
        UnitFrames.SV[key] = 2
    else
        UnitFrames.SV[key] = 1
    end
end

function UnitFrames.GetDefaultFramesSetting(frame, default)
    local key = "DefaultFramesNew" .. tostring(frame)
    local from = default and UnitFrames.Defaults or UnitFrames.SV
    local value = from[key]
    return g_DefaultFramesOptions[value]
end

-- Right Click function for group frames - basically just a copy of the ZOS group frame menu options
function UnitFrames.GroupFrames_OnMouseUp(self, button, upInside)
    local unitTag = self.defaultUnitTag
    if(button == MOUSE_BUTTON_INDEX_RIGHT and upInside) then
        ClearMenu()
        local isPlayer = AreUnitsEqual(unitTag, "player") -- Flag Player
        local isLFG = DoesGroupModificationRequireVote() -- Flag if we're in an LFG Group
        local accountName = zo_strformat("<<C:1>>", GetUnitDisplayName(unitTag))
        local isOnline = IsUnitOnline(unitTag)

        if isPlayer then
            AddMenuItem(GetString(SI_GROUP_LIST_MENU_LEAVE_GROUP), function() ZO_Dialogs_ShowDialog("GROUP_LEAVE_DIALOG") end)
        elseif isOnline then
            if IsChatSystemAvailableForCurrentPlatform() then
                AddMenuItem(GetString(SI_SOCIAL_LIST_PANEL_WHISPER), function() StartChatInput("", CHAT_CHANNEL_WHISPER, accountName) end)
            end
            AddMenuItem(GetString(SI_SOCIAL_MENU_VISIT_HOUSE), function() JumpToHouse(accountName) end)
            AddMenuItem(GetString(SI_SOCIAL_MENU_JUMP_TO_PLAYER), function() JumpToGroupMember(accountName) end)
        end

        if not isPlayer and not IsFriend(accountName) and not IsIgnored(accountName) then
            AddMenuItem(GetString(SI_SOCIAL_MENU_ADD_FRIEND), function() ZO_Dialogs_ShowDialog("REQUEST_FRIEND", { name = accountName }) end)
        end

        if IsGroupModificationAvailable() then
            if IsUnitGroupLeader("player") then
                if isPlayer then
                    if not isLFG then
                        AddMenuItem(GetString(SI_GROUP_LIST_MENU_DISBAND_GROUP), function() ZO_Dialogs_ShowDialog("GROUP_DISBAND_DIALOG") end)
                    end
                else
                    if not isLFG then
                        AddMenuItem(GetString(SI_GROUP_LIST_MENU_KICK_FROM_GROUP), function() GroupKick(unitTag) end)
                    end
                end
            end

            --Cannot vote for yourself
            if isLFG and not isPlayer then
                AddMenuItem(GetString(SI_GROUP_LIST_MENU_VOTE_KICK_FROM_GROUP), function() BeginGroupElection(GROUP_ELECTION_TYPE_KICK_MEMBER, ZO_GROUP_ELECTION_DESCRIPTORS.NONE, unitTag) end)
            end
        end

        --Per design, promoting doesn't expressly fall under the mantle of "group modification"
        if IsUnitGroupLeader("player") and not isPlayer and isOnline then
            AddMenuItem(GetString(SI_GROUP_LIST_MENU_PROMOTE_TO_LEADER), function() GroupPromote(unitTag) end)
        end

        ShowMenu(self)
    end
end

function UnitFrames.AltBar_OnMouseEnterXP(control)
    local isChampion = IsUnitChampion("player")
    local level
    local current
    local levelSize
    local label
    local isMax = false -- If player reaches Champion Point cap
    if isChampion then
        level = GetPlayerChampionPointsEarned()
        current = GetPlayerChampionXP()
        levelSize = GetNumChampionXPInChampionPoint(level)
        if levelSize == nil then
            levelSize = current
            isMax = true
        end
        label = GetString(SI_EXPERIENCE_CHAMPION_LABEL)
    else
        level = GetUnitLevel("player")
        current = GetUnitXP("player")
        levelSize = GetUnitXPMax("player")
        label = GetString(SI_EXPERIENCE_LEVEL_LABEL)
    end
    local percentageXP = zo_floor(current / levelSize * 100)
    local enlightenedPool = GetEnlightenedPool()
    local enlightenedValue = enlightenedPool > 0 and ZO_CommaDelimitNumber(4 * enlightenedPool)

    InitializeTooltip(InformationTooltip, control, BOTTOM, 0, -10)

    SetTooltipText(InformationTooltip, zo_strformat(SI_LEVEL_DISPLAY, label, level))
    if isMax then
        InformationTooltip:AddLine(GetString(SI_EXPERIENCE_LIMIT_REACHED))
    else
        InformationTooltip:AddLine(zo_strformat(SI_EXPERIENCE_CURRENT_MAX_PERCENT, ZO_CommaDelimitNumber(current), ZO_CommaDelimitNumber(levelSize), percentageXP))
        if enlightenedPool > 0 then
            InformationTooltip:AddLine(zo_strformat(SI_EXPERIENCE_CHAMPION_ENLIGHTENED_TOOLTIP, enlightenedValue), nil, ZO_SUCCEEDED_TEXT:UnpackRGB())
        end
    end
end

function UnitFrames.AltBar_OnMouseEnterWerewolf(control)
    local function UpdateWerewolfPower()
        local currentPower, maxPower = GetUnitPower("player", POWERTYPE_WEREWOLF)
        local percentagePower = zo_floor(currentPower / maxPower * 100)

        InitializeTooltip(InformationTooltip, control, BOTTOM, 0, -10)
        SetTooltipText(InformationTooltip, zo_strformat(SI_MONSTERSOCIALCLASS45))
        InformationTooltip:AddLine(zo_strformat(SI_LUIE_UF_WEREWOLF_POWER, currentPower, maxPower, percentagePower))
    end
    UpdateWerewolfPower()

    -- Register Tooltip Update while active
    eventManager:RegisterForEvent(moduleName .. "TooltipPower", EVENT_POWER_UPDATE, UpdateWerewolfPower)
    eventManager:AddFilterForEvent(moduleName .. "TooltipPower", EVENT_POWER_UPDATE, REGISTER_FILTER_POWER_TYPE, POWERTYPE_WEREWOLF, REGISTER_FILTER_UNIT_TAG, "player")
end

function UnitFrames.AltBar_OnMouseEnterMounted(control)
    local function UpdateMountPower()
        local currentPower, maxPower = GetUnitPower("player", POWERTYPE_MOUNT_STAMINA)
        local percentagePower = zo_floor(currentPower / maxPower * 100)
        InitializeTooltip(InformationTooltip, control, BOTTOM, 0, -10)

        SetTooltipText(InformationTooltip, zo_strformat(SI_LUIE_SKILL_MOUNTED))
        InformationTooltip:AddLine(zo_strformat(SI_LUIE_UF_MOUNT_POWER, currentPower, maxPower, percentagePower))
    end
    UpdateMountPower()

    -- Register Tooltip Update while active
    eventManager:RegisterForEvent(moduleName .. "TooltipPower", EVENT_POWER_UPDATE, UpdateMountPower)
    eventManager:AddFilterForEvent(moduleName .. "TooltipPower", EVENT_POWER_UPDATE, REGISTER_FILTER_POWER_TYPE, POWERTYPE_MOUNT_STAMINA, REGISTER_FILTER_UNIT_TAG, "player")
end

function UnitFrames.AltBar_OnMouseEnterSiege(control)
    local function UpdateSiegePower()
        local currentPower, maxPower = GetUnitPower("controlledsiege", POWERTYPE_HEALTH)
        local percentagePower = zo_floor(currentPower / maxPower * 100)
        local siegeName = GetUnitName("controlledsiege")
        InitializeTooltip(InformationTooltip, control, BOTTOM, 0, -10)

        SetTooltipText(InformationTooltip, zo_strformat("<<C:1>>", siegeName))
        InformationTooltip:AddLine(zo_strformat(SI_LUIE_UF_SIEGE_POWER, ZO_CommaDelimitNumber(currentPower), ZO_CommaDelimitNumber(maxPower), percentagePower))
    end
    UpdateSiegePower()

    -- Register Tooltip Update while active
    eventManager:RegisterForEvent(moduleName .. "TooltipPower", EVENT_POWER_UPDATE, UpdateSiegePower)
    eventManager:AddFilterForEvent(moduleName .. "TooltipPower", EVENT_POWER_UPDATE, REGISTER_FILTER_POWER_TYPE, POWERTYPE_HEALTH, REGISTER_FILTER_UNIT_TAG, "controlledsiege")
end

function UnitFrames.AltBar_OnMouseExit(control)
    ClearTooltip(InformationTooltip)
    eventManager:UnregisterForEvent(moduleName .. "TooltipPower", EVENT_POWER_UPDATE)
end

-- Used to create default frames extender controls for player and target.
-- Called from UnitFrames.Initialize
local function CreateDefaultFrames()
    -- Create text overlay for default unit frames for player and reticleover.
    local default_controls = {}

    if UnitFrames.SV.DefaultFramesNewPlayer == 3 then
        default_controls.player = {
            [POWERTYPE_HEALTH]  = ZO_PlayerAttributeHealth,
            [POWERTYPE_MAGICKA] = ZO_PlayerAttributeMagicka,
            [POWERTYPE_STAMINA] = ZO_PlayerAttributeStamina,
        }
    end
    if UnitFrames.SV.DefaultFramesNewTarget == 3 then
        default_controls.reticleover = { [POWERTYPE_HEALTH]  = ZO_TargetUnitFramereticleover, }
        -- g_DefaultFrames.reticleover should be always present to hold target classIcon and friendIcon
    else
        g_DefaultFrames.reticleover = { ["unitTag"] = "reticleover" }
    end
    -- Now loop through `default_controls` table and create actual labels (if any)
    for unitTag,fields in pairs(default_controls) do
        g_DefaultFrames[unitTag] = { ["unitTag"] = unitTag }
        for powerType,parent in pairs(fields) do
            g_DefaultFrames[unitTag][powerType] = { ["label"] = UI.Label( parent, {CENTER,CENTER}, nil, nil, nil, nil, false ), ["colour"] = UnitFrames.SV.DefaultTextColour }
        end
    end

    -- Reference to target unit frame. this is not an UI control! Used to add custom controls to existing fade-out components table
    g_targetUnitFrame = ZO_UnitFrames_GetUnitFrame("reticleover")

    -- When default Target frame is enabled set the threshold value to change colour of label and add label to default fade list
    if g_DefaultFrames.reticleover[POWERTYPE_HEALTH] then
        g_DefaultFrames.reticleover[POWERTYPE_HEALTH].threshold = g_targetThreshold
        table.insert( g_targetUnitFrame.fadeComponents, g_DefaultFrames.reticleover[POWERTYPE_HEALTH].label )
    end

    -- Create classIcon and friendIcon: they should work even when default unit frames extender is disabled
    g_DefaultFrames.reticleover.classIcon = UI.Texture(g_targetUnitFrame.frame, nil, {32,32}, nil, nil, true)
    g_DefaultFrames.reticleover.friendIcon = UI.Texture(g_targetUnitFrame.frame, nil, {32,32}, nil, nil, true)
    g_DefaultFrames.reticleover.friendIcon:SetAnchor(TOPLEFT, ZO_TargetUnitFramereticleoverTextArea, TOPRIGHT, 30, -4)
    -- add those 2 icons to automatic fade list, so fading will be done automatically by game
    table.insert( g_targetUnitFrame.fadeComponents, g_DefaultFrames.reticleover.classIcon )
    table.insert( g_targetUnitFrame.fadeComponents, g_DefaultFrames.reticleover.friendIcon )

    -- When default Group frame in use, then create dummy boolean field, so this setting remain constant between /reloadui calls
    if UnitFrames.SV.DefaultFramesNewGroup == 3 then
        g_DefaultFrames.SmallGroup = true
    end

    -- Apply fonts
    UnitFrames.DefaultFramesApplyFont()

    -- Instead of using Default Unit Frames Extender, the player could wish simply to disable and hide default UI frames
    if UnitFrames.SV.DefaultFramesNewPlayer == 1 then
        local frames = { "Health" , "Stamina" , "Magicka" , "MountStamina" , "Werewolf", "SiegeHealth" }
        for i = 1 , #frames do
            local frame = _G["ZO_PlayerAttribute"..frames[i]]
            frame:UnregisterForEvent(EVENT_POWER_UPDATE)
            frame:UnregisterForEvent(EVENT_INTERFACE_SETTING_CHANGED)
            frame:UnregisterForEvent(EVENT_PLAYER_ACTIVATED)
            eventManager:UnregisterForUpdate("ZO_PlayerAttribute"..frames[i].."FadeUpdate")
            frame:SetHidden(true)
        end
    end
end

-- Used to create custom frames extender controls for player and target.
-- Called from UnitFrames.Initialize
local function CreateCustomFrames()
    -- Create Custom unit frames
    if UnitFrames.SV.CustomFramesPlayer then
        -- Player Frame
        local playerTlw = UI.TopLevel( nil, nil )
        playerTlw:SetDrawLayer(DL_BACKDROP)
        playerTlw:SetDrawTier(DT_LOW)
        playerTlw:SetDrawLevel(1)
        playerTlw.customPositionAttr = "CustomFramesPlayerFramePos"
        playerTlw.preview = UI.Backdrop( playerTlw, "fill", nil, nil, nil, true )
        local player = UI.Control( playerTlw, {TOPLEFT,TOPLEFT}, nil, false )
        local topInfo = UI.Control( player, {BOTTOM,TOP,0,-3}, nil, false )
        local botInfo = UI.Control( player, {TOP,BOTTOM,0,2}, nil, false )
        local buffAnchor = UI.Control( player, {TOP,BOTTOM,0,2}, nil, false )
        local phb = UI.Backdrop( player, {TOP,TOP,0,0}, nil, nil, nil, false )
        phb:SetDrawLayer(DL_BACKDROP)
        phb:SetDrawLevel(1)
        local pmb = UI.Backdrop( player, nil, nil, nil, nil, false )
        pmb:SetDrawLayer(DL_BACKDROP)
        pmb:SetDrawLevel(1)
        local psb = UI.Backdrop( player, nil, nil, nil, nil, false )
        psb:SetDrawLayer(DL_BACKDROP)
        psb:SetDrawLevel(1)
        local alt = UI.Backdrop( botInfo, {RIGHT,RIGHT}, nil, nil , {0,0,0,1}, false )
        local pli = UI.Texture( topInfo, nil, {20,20}, nil, nil, false )

        local fragment = ZO_HUDFadeSceneFragment:New(playerTlw, 0, 0)

        sceneManager:GetScene("hud"):AddFragment( fragment )
        sceneManager:GetScene("hudui"):AddFragment( fragment )
        sceneManager:GetScene("siegeBar"):AddFragment( fragment )
        sceneManager:GetScene("siegeBarUI"):AddFragment( fragment )

        -- Collect all together
        UnitFrames.CustomFrames.player = {
            ["unitTag"]     = "player",
            ["tlw"]         = playerTlw,
            ["control"]     = player,
            [POWERTYPE_HEALTH] = {
                ["backdrop"]= phb,
                ["labelOne"]= UI.Label( phb, {LEFT,LEFT,5,0}, nil, {0,1}, nil, "xx / yy", false ),
                ["labelTwo"]= UI.Label( phb, {RIGHT,RIGHT,-5,0}, nil, {2,1}, nil, "zz%", false ),
                ["bar"]     = UI.StatusBar( phb, nil, nil, nil, false ),
                ["shield"]  = UI.StatusBar( phb, nil, nil, nil, true ),
                ["threshold"] = g_healthThreshold
            },
            [POWERTYPE_MAGICKA] = {
                ["backdrop"]= pmb,
                ["labelOne"]= UI.Label( pmb, {LEFT,LEFT,5,0}, nil, {0,1}, nil, "xx / yy", false ),
                ["labelTwo"]= UI.Label( pmb, {RIGHT,RIGHT,-5,0}, nil, {2,1}, nil, "zz%", false ),
                ["bar"]     = UI.StatusBar( pmb, nil, nil, nil, false ),
                ["threshold"] = g_magickaThreshold
            },
            [POWERTYPE_STAMINA] = {
                ["backdrop"]= psb,
                ["labelOne"]= UI.Label( psb, {LEFT,LEFT,5,0}, nil, {0,1}, nil, "xx / yy", false ),
                ["labelTwo"]= UI.Label( psb, {RIGHT,RIGHT,-5,0}, nil, {2,1}, nil, "zz%", false ),
                ["bar"]     = UI.StatusBar( psb, nil, nil, nil, false ),
                ["threshold"] = g_staminaThreshold
            },
            ["alternative"] = {
                ["backdrop"]= alt,
                ["enlightenment"] = UI.StatusBar( alt, nil, nil, nil, false ),
                ["bar"]     = UI.StatusBar( alt, nil, nil, nil, false ),
                ["icon"]    = UI.Texture( alt, {RIGHT,LEFT,-2,0}, {20,20}, nil, nil, false ),
            },
            ["topInfo"]     = topInfo,
            ["name"]        = UI.Label( topInfo, {BOTTOMLEFT,BOTTOMLEFT}, nil, {0,4}, nil, "Player Name", false ),
            ["levelIcon"]   = pli,
            ["level"]       = UI.Label( topInfo, {LEFT,RIGHT,1,0,pli}, nil, {0,1}, nil, "level", false ),
            ["classIcon"]   = UI.Texture( topInfo, {RIGHT,RIGHT,-1,0}, {22,22}, nil, nil, false ),
            ["botInfo"]     = botInfo,
            ["buffAnchor"]  = buffAnchor,
            ["buffs"]       = UI.Control( playerTlw, nil, nil, false ),
            ["debuffs"]     = UI.Control( playerTlw, {BOTTOM,TOP,0,-2,topInfo}, nil, false ),
        }

        UnitFrames.CustomFrames.player.name:SetWrapMode(TEXT_WRAP_MODE_TRUNCATE)

        -- If Health Label is hidden in menu optins, hide the health bar labels
        if UnitFrames.SV.HideLabelHealth then
            UnitFrames.CustomFrames.player[POWERTYPE_HEALTH].labelOne:SetHidden(true)
            UnitFrames.CustomFrames.player[POWERTYPE_HEALTH].labelTwo:SetHidden(true)
        end

        -- If Stamina Label is hidden in menu options, hide the stamina bar labels
        if UnitFrames.SV.HideLabelStamina then
            UnitFrames.CustomFrames.player[POWERTYPE_STAMINA].labelOne:SetHidden(true)
            UnitFrames.CustomFrames.player[POWERTYPE_STAMINA].labelTwo:SetHidden(true)
        end

        -- If Magicka Label is hidden in menu options, hide the magicka bar labels
        if UnitFrames.SV.HideLabelMagicka then
            UnitFrames.CustomFrames.player[POWERTYPE_MAGICKA].labelOne:SetHidden(true)
            UnitFrames.CustomFrames.player[POWERTYPE_MAGICKA].labelTwo:SetHidden(true)
        end

        UnitFrames.CustomFrames.controlledsiege = { -- placeholder for alternative bar when using siege weapon
            ["unitTag"]     = "controlledsiege",
        }
    end

    if UnitFrames.SV.CustomFramesTarget then
        -- Target Frame
        local targetTlw = UI.TopLevel( nil, nil )
        targetTlw:SetDrawLayer(DL_BACKDROP)
        targetTlw:SetDrawTier(DT_LOW)
        targetTlw:SetDrawLevel(1)
        targetTlw.customPositionAttr = "CustomFramesTargetFramePos"
        targetTlw.preview = UI.Backdrop( targetTlw, "fill", nil, nil, nil, true )
        targetTlw.previewLabel = UI.Label( targetTlw.preview, {CENTER,CENTER}, nil, nil, "ZoFontGameMedium", "Target Frame", false )
        local target = UI.Control( targetTlw, {TOPLEFT,TOPLEFT}, nil, false )
        local topInfo = UI.Control( target, {BOTTOM,TOP,0,-3}, nil, false )
        local botInfo = UI.Control( target, {TOP,BOTTOM,0,2}, nil, false )
        local buffAnchor = UI.Control( target, {TOP,BOTTOM,0,2}, nil, false )
        local thb = UI.Backdrop(target, {TOP,TOP,0,0}, nil, nil, nil, false )
        thb:SetDrawLayer(DL_BACKDROP)
        thb:SetDrawLevel(1)
        local tli = UI.Texture( topInfo, nil, {20,20}, nil, nil, false )
        local ari = UI.Texture( botInfo, {RIGHT,RIGHT,-1,0}, {20,20}, nil, nil, false )
        local buffs
        local debuffs
        if UnitFrames.SV.PlayerFrameOptions == 1 then
            buffs = UI.Control( targetTlw, {TOP,BOTTOM,0,2,buffAnchor}, nil, false )
            debuffs = UI.Control( targetTlw, {BOTTOM,TOP,0,-2,topInfo}, nil, false )
        else
            buffs = UI.Control( targetTlw, {BOTTOM,TOP,0,-2,topInfo}, nil, false )
            debuffs = UI.Control( targetTlw, {TOP,BOTTOM,0,2,buffAnchor}, nil, false )
        end

        local fragment = ZO_HUDFadeSceneFragment:New(targetTlw, 0, 0)

        sceneManager:GetScene("hud"):AddFragment( fragment )
        sceneManager:GetScene("hudui"):AddFragment( fragment )
        sceneManager:GetScene("siegeBar"):AddFragment( fragment )
        sceneManager:GetScene("siegeBarUI"):AddFragment( fragment )

        -- Collect all together
        UnitFrames.CustomFrames.reticleover = {
            ["unitTag"]     = "reticleover",
            ["tlw"]         = targetTlw,
            ["control"]     = target,
            ["canHide"]     = true,
            [POWERTYPE_HEALTH] = {
                ["backdrop"]= thb,
                ["labelOne"]= UI.Label( thb, {LEFT,LEFT,5,0}, nil, {0,1}, nil, "xx / yy", false ),
                ["labelTwo"]= UI.Label( thb, {RIGHT,RIGHT,-5,0}, nil, {2,1}, nil, "zz%", false ),
                ["bar"]     = UI.StatusBar( thb, nil, nil, nil, false ),
                ["shield"]  = UI.StatusBar( thb, nil, nil, nil, true ),
                ["threshold"] = g_targetThreshold,
            },
            ["topInfo"]     = topInfo,
            ["name"]        = UI.Label( topInfo, {BOTTOMLEFT,BOTTOMLEFT}, nil, {0,4}, nil, "Target Name", false ),
            ["levelIcon"]   = tli,
            ["level"]       = UI.Label( topInfo, {LEFT,RIGHT,1,0,tli}, nil, {0,1}, nil, "level", false ),
            ["classIcon"]   = UI.Texture( topInfo, {RIGHT,RIGHT,-1,0}, {22,22}, nil, nil, false ),
            ["className"]   = UI.Label( topInfo, {BOTTOMRIGHT,TOPRIGHT,-1,-1}, nil, {2,4}, nil, "Class", false ),
            ["friendIcon"]  = UI.Texture( topInfo, {RIGHT,RIGHT,-20,0}, {22,22}, nil, nil, false ),
            ["star1"]       = UI.Texture( topInfo, {RIGHT,RIGHT,-28,-1}, {16,16}, "esoui/art/ava/ava_bgwindow_capturepointicon.dds", nil, true ),
            ["star2"]       = UI.Texture( topInfo, {RIGHT,RIGHT,-45,-1}, {16,16}, "esoui/art/ava/ava_bgwindow_capturepointicon.dds", nil, true ),
            ["star3"]       = UI.Texture( topInfo, {RIGHT,RIGHT,-62,-1}, {16,16}, "esoui/art/ava/ava_bgwindow_capturepointicon.dds", nil, true ),
            ["botInfo"]     = botInfo,
            ["buffAnchor"]  = buffAnchor,
            ["title"]       = UI.Label( botInfo, {TOPLEFT,TOPLEFT}, nil, {0,3}, nil, "<Title>", false ),
            ["avaRankIcon"] = ari,
            ["avaRank"]     = UI.Label( botInfo, {RIGHT,LEFT,-1,0,ari}, nil, {2,3}, nil, "ava", false ),
            ["dead"]        = UI.Label( thb, {LEFT,LEFT,5,0}, nil, {0,1}, nil, "Status", true ),
            ["skull"]       = UI.Texture( target, {RIGHT,LEFT,-8,0}, nil, "LuiExtended/media/unitframes/unitframes_execute.dds", nil, true ),
            ["buffs"]       = buffs,
            ["debuffs"]     = debuffs,
        }
        UnitFrames.CustomFrames.reticleover.name:SetWrapMode(TEXT_WRAP_MODE_TRUNCATE)
        UnitFrames.CustomFrames.reticleover.className:SetDrawLayer( DL_BACKGROUND )
    end

    if UnitFrames.SV.AvaCustFramesTarget then
        -- Target Frame
        local targetTlw = UI.TopLevel( nil, nil )
        targetTlw:SetDrawLayer(DL_BACKDROP)
        targetTlw:SetDrawTier(DT_LOW)
        targetTlw:SetDrawLevel(1)
        targetTlw.customPositionAttr = "AvaCustFramesTargetFramePos"
        targetTlw.preview = UI.Backdrop( targetTlw, "fill", nil, nil, nil, true )
        targetTlw.previewLabel = UI.Label( targetTlw.preview, {CENTER,CENTER}, nil, nil, "ZoFontGameMedium", "PvP Player Target Frame", false )
        local target = UI.Control( targetTlw, {TOPLEFT,TOPLEFT}, nil, false )
        local topInfo = UI.Control( target, {BOTTOM,TOP,0,-3}, nil, false )
        local botInfo = UI.Control( target, {TOP,BOTTOM,0,2}, nil, false )
        local buffAnchor = UI.Control( target, {TOP,BOTTOM,0,2}, nil, false )
        local thb = UI.Backdrop(target, {TOP,TOP,0,0}, nil, nil, nil, false )
        thb:SetDrawLayer(DL_BACKDROP)
        thb:SetDrawLevel(1)
        local cn = UI.Label( botInfo, {TOP,TOP}, nil, {1,3}, nil, "Class", false )

        local fragment = ZO_HUDFadeSceneFragment:New(targetTlw, 0, 0)

        sceneManager:GetScene("hud"):AddFragment( fragment )
        sceneManager:GetScene("hudui"):AddFragment( fragment )
        sceneManager:GetScene("siegeBar"):AddFragment( fragment )
        sceneManager:GetScene("siegeBarUI"):AddFragment( fragment )

        -- Collect all together
        -- Notice, that we put this table into same UnitFrames.CustomFrames table.
        -- This is done to apply formating more easier
        -- Later this table will be referenced from g_AvaCustFrames
        UnitFrames.CustomFrames.AvaPlayerTarget = {
            ["unitTag"]     = "reticleover",
            ["tlw"]         = targetTlw,
            ["control"]     = target,
            ["canHide"]     = true,
            [POWERTYPE_HEALTH] = {
                ["backdrop"]= thb,
                ["label"]   = UI.Label( thb, {CENTER,CENTER}, nil, {1,1}, nil, "zz%", false ),
                ["labelOne"]= UI.Label( thb, {LEFT,LEFT,5,0}, nil, {0,1}, nil, "xx + ss", false ),
                ["labelTwo"]= UI.Label( thb, {RIGHT,RIGHT,-5,0}, nil, {2,1}, nil, "yy", false ),
                ["bar"]     = UI.StatusBar( thb, nil, nil, nil, false ),
                ["shield"]  = UI.StatusBar( thb, nil, nil, nil, true ),
                ["threshold"] = g_targetThreshold,
            },
            ["topInfo"]     = topInfo,
            ["name"]        = UI.Label( topInfo, {BOTTOM,BOTTOM}, nil, {1,4}, nil, "Target Name", false ),
            ["classIcon"]   = UI.Texture( topInfo, {LEFT,LEFT}, {20,20}, nil, nil, false ),
            ["avaRankIcon"] = UI.Texture( topInfo, {RIGHT,RIGHT}, {20,20}, nil, nil, false ),
            ["botInfo"]     = botInfo,
            ["buffAnchor"]  = buffAnchor,
            ["className"]   = cn,
            ["title"]       = UI.Label( botInfo, {TOP,BOTTOM,0,0,cn}, nil, {1,3}, nil, "<Title>", false ),
            ["avaRank"]     = UI.Label( botInfo, {TOPRIGHT,TOPRIGHT}, nil, {2,3}, nil, "ava", false ),
            ["dead"]        = UI.Label( thb, {LEFT,LEFT,5,0}, nil, {0,1}, nil, "Status", true ),
        }

        UnitFrames.CustomFrames.AvaPlayerTarget.name:SetWrapMode(TEXT_WRAP_MODE_TRUNCATE)
        UnitFrames.CustomFrames.AvaPlayerTarget[POWERTYPE_HEALTH].label.fmt = "Percentage%"
        UnitFrames.CustomFrames.AvaPlayerTarget[POWERTYPE_HEALTH].labelOne.fmt = "Current + Shield"
        UnitFrames.CustomFrames.AvaPlayerTarget[POWERTYPE_HEALTH].labelTwo.fmt = "Max"

        -- Put in into table with secondary frames so it can be accessed by other functions in this module
        g_AvaCustFrames.reticleover = UnitFrames.CustomFrames.AvaPlayerTarget
    end

    -- Loop through Small Group members
    if UnitFrames.SV.CustomFramesGroup then
        -- Group Frame
        local group = UI.TopLevel( nil, nil )
        group:SetDrawLayer(DL_BACKDROP)
        group:SetDrawTier(DT_LOW)
        group:SetDrawLevel(1)
        group.customPositionAttr = "CustomFramesGroupFramePos"
        group.preview = UI.Backdrop( group, "fill", nil, nil, nil, true )
        group.previewLabel = UI.Label( group.preview, {BOTTOM,TOP,0,-1,group}, nil, nil, "ZoFontGameMedium", "Small Group", false )

        local fragment = ZO_HUDFadeSceneFragment:New(group, 0, 0)

        sceneManager:GetScene("hud"):AddFragment( fragment )
        sceneManager:GetScene("hudui"):AddFragment( fragment )
        sceneManager:GetScene("siegeBar"):AddFragment( fragment )
        sceneManager:GetScene("siegeBarUI"):AddFragment( fragment )
        sceneManager:GetScene("loot"):AddFragment( fragment )

        for i = 1, 4 do
            local unitTag = "SmallGroup" .. i
            local control = UI.Control( group, nil, nil, false )
            local topInfo = UI.Control( control, {BOTTOMRIGHT,TOPRIGHT,0,-3}, nil, false )
            local ghb = UI.Backdrop( control, {TOPLEFT,TOPLEFT}, nil, nil, nil, false )
            ghb:SetDrawLayer(DL_BACKDROP)
            ghb:SetDrawLevel(1)
            local gli = UI.Texture( topInfo, nil, {20,20}, nil, nil, false )

            UnitFrames.CustomFrames[unitTag] = {
                ["tlw"]         = group,
                ["control"]     = control,
                [POWERTYPE_HEALTH] = {
                    ["backdrop"]= ghb,
                    ["labelOne"]= UI.Label( ghb, {LEFT,LEFT,5,0}, nil, {0,1}, nil, "xx / yy", false ),
                    ["labelTwo"]= UI.Label( ghb, {RIGHT,RIGHT,-5,0}, nil, {2,1}, nil, "zz%", false ),
                    ["bar"]     = UI.StatusBar( ghb, nil, nil, nil, false ),
                    ["shield"]  = UI.StatusBar( ghb, nil, nil, nil, true ),
                },
                ["topInfo"]     = topInfo,
                ["name"]        = UI.Label( topInfo, {BOTTOMLEFT,BOTTOMLEFT}, nil, {0,4}, nil, unitTag, false ),
                ["levelIcon"]   = gli,
                ["level"]       = UI.Label( topInfo, {LEFT,RIGHT,1,0,gli}, nil, {0,1}, nil, "level", false ),
                ["classIcon"]   = UI.Texture( topInfo, {RIGHT,RIGHT,-1,0}, {22,22}, nil, nil, false ),
                ["friendIcon"]  = UI.Texture( topInfo, {RIGHT,RIGHT,-20,0}, {22,22}, nil, nil, false ),
                ["roleIcon"]    = UI.Texture( ghb, {LEFT,LEFT, 5,0}, {18,18}, nil, 2, false ),
                ["dead"]        = UI.Label( ghb, {LEFT,LEFT,5,0}, nil, {0,1}, nil, "Status", false ),
                ["leader"]      = UI.Texture( topInfo, {LEFT,LEFT, -7,0}, {32,32}, nil, 2, false ),
            }

            UnitFrames.CustomFrames[unitTag].name:SetWrapMode(TEXT_WRAP_MODE_TRUNCATE)
            control.defaultUnitTag = GetGroupUnitTagByIndex(i)
            control:SetMouseEnabled(true)
            control:SetHandler("OnMouseUp", UnitFrames.GroupFrames_OnMouseUp)
            topInfo.defaultUnitTag = GetGroupUnitTagByIndex(i)
            topInfo:SetMouseEnabled(true)
            topInfo:SetHandler("OnMouseUp", UnitFrames.GroupFrames_OnMouseUp)
        end
    end

    -- Loop through Raid Group members
    if UnitFrames.SV.CustomFramesRaid then
        -- Raid Frame
        local raid = UI.TopLevel( nil, nil )
        raid:SetDrawLayer(DL_BACKDROP)
        raid:SetDrawTier(DT_LOW)
        raid:SetDrawLevel(1)
        raid.customPositionAttr = "CustomFramesRaidFramePos"
        raid.preview = UI.Backdrop( raid, {TOPLEFT,TOPLEFT}, nil, nil, nil, true )
        raid.preview2 = UI.Backdrop( raid.preview, nil, nil, nil, nil, false )
        raid.previewLabel = UI.Label( raid.preview, {BOTTOM,TOP,0,-1,raid}, nil, nil, "ZoFontGameMedium", "Raid Group", false )

        local fragment = ZO_HUDFadeSceneFragment:New(raid, 0, 0)

        sceneManager:GetScene("hud"):AddFragment( fragment )
        sceneManager:GetScene("hudui"):AddFragment( fragment )
        sceneManager:GetScene("siegeBar"):AddFragment( fragment )
        sceneManager:GetScene("siegeBarUI"):AddFragment( fragment )
        sceneManager:GetScene("loot"):AddFragment( fragment )

        for i = 1, 24 do
            local unitTag = "RaidGroup" .. i
            local control = UI.Control( raid, nil, nil, false )
            local rhb = UI.Backdrop( control, "fill", nil, nil, nil, false )
            rhb:SetDrawLayer(DL_BACKDROP)
            rhb:SetDrawLevel(1)

            UnitFrames.CustomFrames[unitTag] = {
                ["tlw"]         = raid,
                ["control"]     = control,
                [POWERTYPE_HEALTH] = {
                    ["backdrop"]= rhb,
                    ["label"]   = UI.Label( rhb, {RIGHT,RIGHT,-5,0}, nil, {2,1}, nil, "zz%", false ),
                    ["bar"]     = UI.StatusBar( rhb, nil, nil, nil, false ),
                    ["shield"]  = UI.StatusBar( rhb, nil, nil, nil, true ),
                },
                ["name"]        = UI.Label( rhb, {LEFT,LEFT,5,0}, nil, {0,1}, nil, unitTag, false ),
                ["roleIcon"]    = UI.Texture( rhb, {LEFT,LEFT, 4,0}, {16,16}, nil, 2, false ),
                ["classIcon"]    = UI.Texture( rhb, {LEFT,LEFT, 1,0}, {20,20}, nil, 2, false ),
                ["dead"]        = UI.Label( rhb, {RIGHT,RIGHT,-5,0}, nil, {2,1}, nil, "Status", false ),
                ["leader"]      = UI.Texture( rhb, {LEFT,LEFT, -2,0}, {28,28}, nil, 2, false ),

            }
            UnitFrames.CustomFrames[unitTag].name:SetWrapMode(TEXT_WRAP_MODE_TRUNCATE)

            control.defaultUnitTag = GetGroupUnitTagByIndex(i)
            control:SetMouseEnabled(true)
            control:SetHandler("OnMouseUp", UnitFrames.GroupFrames_OnMouseUp)

            UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].label.fmt = "Current (Percentage%)"
        end
    end

    if UnitFrames.SV.CustomFramesPet then
        -- Pet Frame
        local pet = UI.TopLevel( nil, nil )
        pet:SetDrawLayer(DL_BACKDROP)
        pet:SetDrawTier(DT_LOW)
        pet:SetDrawLevel(1)
        pet.customPositionAttr = "CustomFramesPetFramePos"
        pet.preview = UI.Backdrop( pet, "fill", nil, nil, nil, true )
        pet.previewLabel = UI.Label( pet.preview, {BOTTOM,TOP,0,-1,group}, nil, nil, "ZoFontGameMedium", "Player Pets", false )

        local fragment = ZO_HUDFadeSceneFragment:New(pet, 0, 0)

        sceneManager:GetScene("hud"):AddFragment( fragment )
        sceneManager:GetScene("hudui"):AddFragment( fragment )
        sceneManager:GetScene("siegeBar"):AddFragment( fragment )
        sceneManager:GetScene("siegeBarUI"):AddFragment( fragment )
        sceneManager:GetScene("loot"):AddFragment( fragment )

        for i = 1, 7 do
            local unitTag = "PetGroup" .. i
            local control = UI.Control( pet, nil, nil, false )
            local shb = UI.Backdrop( control, "fill", nil, nil, nil, false )

            shb:SetDrawLayer(DL_BACKDROP)
            shb:SetDrawLevel(1)

            UnitFrames.CustomFrames[unitTag] = {
                ["tlw"]         = pet,
                ["control"]     = control,
                [POWERTYPE_HEALTH] = {
                    ["backdrop"]= shb,
                    ["label"]   = UI.Label( shb, {RIGHT,RIGHT,-5,0}, nil, {2,1}, nil, "zz%", false ),
                    ["bar"]     = UI.StatusBar( shb, nil, nil, nil, false ),
                    ["shield"]  = UI.StatusBar( shb, nil, nil, nil, true ),
                },
                ["dead"]        = UI.Label( shb, {RIGHT,RIGHT,-5,0}, nil, {2,1}, nil, "Status", true ),
                ["name"]        = UI.Label( shb, {LEFT,LEFT,5,0}, nil, {0,1}, nil, unitTag, false ),

            }
            UnitFrames.CustomFrames[unitTag].name:SetWrapMode(TEXT_WRAP_MODE_TRUNCATE)
            UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].label.fmt = "Current (Percentage%)"
        end
    end

    if UnitFrames.SV.CustomFramesCompanion then
        -- Companion Frame
        local companionTlw = UI.TopLevel( nil, nil )
        companionTlw:SetDrawLayer(DL_BACKDROP)
        companionTlw:SetDrawTier(DT_LOW)
        companionTlw:SetDrawLevel(1)
        companionTlw.customPositionAttr = "CustomFramesCompanionFramePos"
        companionTlw.preview = UI.Backdrop( companionTlw, "fill", nil, nil, nil, true )
        companionTlw.previewLabel = UI.Label( companionTlw.preview, {BOTTOM,TOP,0,-1,group}, nil, nil, "ZoFontGameMedium", "Player Companion", false )

        local fragment = ZO_HUDFadeSceneFragment:New(companionTlw, 0, 0)

        sceneManager:GetScene("hud"):AddFragment( fragment )
        sceneManager:GetScene("hudui"):AddFragment( fragment )
        sceneManager:GetScene("siegeBar"):AddFragment( fragment )
        sceneManager:GetScene("siegeBarUI"):AddFragment( fragment )
        sceneManager:GetScene("loot"):AddFragment( fragment )

        local companion = UI.Control( companionTlw, nil, nil, false )
        local shb = UI.Backdrop( companion, "fill", nil, nil, nil, false )
        shb:SetDrawLayer(DL_BACKDROP)
        shb:SetDrawLevel(1)

        UnitFrames.CustomFrames.companion = {
            ["unitTag"]     = "companion",
            ["tlw"]         = companionTlw,
            ["control"]     = companion,
            [POWERTYPE_HEALTH] = {
                ["backdrop"]= shb,
                ["label"]   = UI.Label( shb, {RIGHT,RIGHT,-5,0}, nil, {2,1}, nil, "zz%", false ),
                ["bar"]     = UI.StatusBar( shb, nil, nil, nil, false ),
                ["shield"]  = UI.StatusBar( shb, nil, nil, nil, true ),
            },
            ["dead"]        = UI.Label( shb, {RIGHT,RIGHT,-5,0}, nil, {2,1}, nil, "Status", true ),
            ["name"]        = UI.Label( shb, {LEFT,LEFT,5,0}, nil, {0,1}, nil, unitTag, false ),

        }
        UnitFrames.CustomFrames.companion.name:SetWrapMode(TEXT_WRAP_MODE_TRUNCATE)
        UnitFrames.CustomFrames.companion[POWERTYPE_HEALTH].label.fmt = "Current (Percentage%)"
    end

    -- Loop through Bosses
    if UnitFrames.SV.CustomFramesBosses then
        -- Bosses Frame
        local bosses = UI.TopLevel( nil, nil )
        bosses:SetDrawLayer(DL_BACKDROP)
        bosses:SetDrawTier(DT_LOW)
        bosses:SetDrawLevel(1)
        bosses.customPositionAttr = "CustomFramesBossesFramePos"
        bosses.preview = UI.Backdrop( bosses, "fill", nil, nil, nil, true )
        bosses.previewLabel = UI.Label( bosses.preview, {BOTTOM,TOP,0,-1,bosses}, nil, nil, "ZoFontGameMedium", "Bosses Group", false )

        local fragment = ZO_HUDFadeSceneFragment:New(bosses, 0, 0)

        sceneManager:GetScene("hud"):AddFragment( fragment )
        sceneManager:GetScene("hudui"):AddFragment( fragment )
        sceneManager:GetScene("siegeBar"):AddFragment( fragment )
        sceneManager:GetScene("siegeBarUI"):AddFragment( fragment )
        sceneManager:GetScene("loot"):AddFragment( fragment )

        for i = 1, 6 do
            local unitTag = "boss" .. i
            local control = UI.Control( bosses, nil, nil, false )
            local bhb = UI.Backdrop( control, "fill", nil, nil, nil, false )
            bhb:SetDrawLayer(DL_BACKDROP)
            bhb:SetDrawLevel(1)

            UnitFrames.CustomFrames[unitTag] = {
                ["unitTag"]     = unitTag,
                ["tlw"]         = bosses,
                ["control"]     = control,
                [POWERTYPE_HEALTH] = {
                    ["backdrop"]= bhb,
                    ["label"]   = UI.Label( bhb, {RIGHT,RIGHT,-5,0}, nil, {2,1}, nil, "zz%", false ),
                    ["bar"]     = UI.StatusBar( bhb, nil, nil, nil, false ),
                    ["shield"]  = UI.StatusBar( bhb, nil, nil, nil, true ),
                    ["threshold"] = g_targetThreshold,
                },
                ["dead"]        = UI.Label( bhb, {RIGHT,RIGHT,-5,0}, nil, {2,1}, nil, "Status", true ),
                ["name"]        = UI.Label( bhb, {LEFT,LEFT,5,0}, nil, {0,1}, nil, unitTag, false ),
            }
            UnitFrames.CustomFrames[unitTag].name:SetWrapMode(TEXT_WRAP_MODE_TRUNCATE)
            UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].label.fmt = "Percentage%"
        end
    end

    -- Callback used to hide anchor coords preview label on movement start
    local tlwOnMoveStart = function(self)
        eventManager:RegisterForUpdate(moduleName .. "PreviewMove", 200, function()
            self.preview.anchorLabel:SetText(zo_strformat("<<1>>, <<2>>", self:GetLeft(), self:GetTop()))
        end)
    end
    -- Callback used to save new position of frames
    local tlwOnMoveStop = function(self)
        eventManager:UnregisterForUpdate(moduleName .. "PreviewMove")
        UnitFrames.SV[self.customPositionAttr] = { self:GetLeft(), self:GetTop() }
    end

    -- Common actions for all created frames:
    for _, baseName in pairs( { "player", "reticleover", "companion", "SmallGroup", "RaidGroup", "boss", "AvaPlayerTarget", "PetGroup" } ) do
        -- set mouse handlers for all created tlws and create anchor coords preview labels
        local unitFrame = UnitFrames.CustomFrames[baseName] or UnitFrames.CustomFrames[baseName .. "1"] or nil
        if unitFrame ~= nil then
            -- Movement handlers
            unitFrame.tlw:SetHandler("OnMoveStart", tlwOnMoveStart)
            unitFrame.tlw:SetHandler("OnMoveStop", tlwOnMoveStop)

            -- Create Texture and a label for Anchor Preview
            unitFrame.tlw.preview.anchorTexture = UI.Texture( unitFrame.tlw.preview, {TOPLEFT,TOPLEFT}, {16,16}, "/esoui/art/reticle/border_topleft.dds", DL_OVERLAY, false )
            unitFrame.tlw.preview.anchorTexture:SetColor(1, 1, 0, 0.9)

            unitFrame.tlw.preview.anchorLabel = UI.Label( unitFrame.tlw.preview, {BOTTOMLEFT,TOPLEFT,0,-1}, nil, {0,2}, "ZoFontGameSmall", "xxx, yyy", false )
            unitFrame.tlw.preview.anchorLabel:SetColor(1, 1, 0 , 1)
            unitFrame.tlw.preview.anchorLabel:SetDrawLayer(DL_OVERLAY)
            unitFrame.tlw.preview.anchorLabel:SetDrawTier(1)
            unitFrame.tlw.preview.anchorLabelBg = UI.Backdrop( unitFrame.tlw.preview.anchorLabel, "fill", nil, {0,0,0,1}, {0,0,0,1}, false )
            unitFrame.tlw.preview.anchorLabelBg:SetDrawLayer(DL_OVERLAY)
            unitFrame.tlw.preview.anchorLabelBg:SetDrawTier(0)
        end

        -- Now we have to anchor all bars to their backdrops
        local shieldOverlay = ( baseName == "RaidGroup" or baseName == "boss" ) or not UnitFrames.SV.CustomShieldBarSeparate
        local shieldFull = ( baseName == "RaidGroup" or baseName == "boss" ) or UnitFrames.SV.CustomShieldBarFull
        for i = 0, 24 do
            local unitTag = (i==0) and baseName or ( baseName .. i )
            if UnitFrames.CustomFrames[unitTag] then
                for _, powerType in pairs( {POWERTYPE_HEALTH, POWERTYPE_MAGICKA, POWERTYPE_STAMINA, "alternative"} ) do
                    local powerBar = UnitFrames.CustomFrames[unitTag][powerType]
                    if powerBar then
                        powerBar.bar:SetAnchor( TOPLEFT, powerBar.backdrop, TOPLEFT, 1, 1 )
                        powerBar.bar:SetAnchor( BOTTOMRIGHT, powerBar.backdrop, BOTTOMRIGHT, -1, -1 )

                        -- Also set anchors for enlightenment bar
                        if powerBar.enlightenment then
                            powerBar.enlightenment:SetAnchor( TOPLEFT, powerBar.backdrop, TOPLEFT, 1, 1 )
                            powerBar.enlightenment:SetAnchor( BOTTOMRIGHT, powerBar.backdrop, BOTTOMRIGHT, -1, -1 )
                        end

                        if powerBar.shield then
                            if shieldOverlay then
                                powerBar.shield:SetAnchor( TOPLEFT, powerBar.backdrop, shieldFull and TOPLEFT or LEFT, 1, 1 )
                                powerBar.shield:SetAnchor( BOTTOMRIGHT, powerBar.backdrop, BOTTOMRIGHT, -1, -1 )
                            else
                                -- In non-overlay mode we need to create separate backdrop for shield
                                powerBar.shieldbackdrop = UI.Backdrop( UnitFrames.CustomFrames[unitTag].control, nil, nil, nil, nil, true )
                                powerBar.shield:SetAnchor( TOPLEFT, powerBar.shieldbackdrop, TOPLEFT, 1, 1 )
                                powerBar.shield:SetAnchor( BOTTOMRIGHT, powerBar.shieldbackdrop, BOTTOMRIGHT, -1, -1 )
                            end
                        end
                    end
                end
            end
        end
    end

    -- Create DOT / HOT animations for all attributes bars
    -- We will use this ugly loop over too-many controls, but it will keep things clean and uni-style
    if UnitFrames.SV.PlayerEnableRegen then
        for _, baseName in pairs( { 'player', 'reticleover', 'AvaPlayerTarget' } ) do
            local unitTag = baseName
            if UnitFrames.CustomFrames[unitTag] then
                for _, powerType in pairs( {POWERTYPE_HEALTH} ) do
                    if UnitFrames.CustomFrames[unitTag][powerType] then
                        local backdrop = UnitFrames.CustomFrames[unitTag][powerType].backdrop
                        local size1
                        local size2
                        if baseName == "player" then
                            size1 = UnitFrames.SV.PlayerBarWidth
                            size2 = UnitFrames.SV.PlayerBarHeightHealth
                        elseif baseName == "reticleover" then
                            size1 = UnitFrames.SV.TargetBarWidth
                            size2 = UnitFrames.SV.TargetBarHeight
                        elseif baseName == "AvaPlayerTarget" then
                            size1 = UnitFrames.SV.AvaTargetBarWidth
                            size2 = UnitFrames.SV.AvaTargetBarHeight
                        end
                        if size1 ~= nil and size2 ~= nil then
                            UnitFrames.CustomFrames[unitTag][powerType].regen1 = CreateRegenAnimation( backdrop, {CENTER,CENTER,0,0}, { size1 - 4, size2 -(size2 * .3) }, 0.55, "regen1" )
                            UnitFrames.CustomFrames[unitTag][powerType].regen2 = CreateRegenAnimation( backdrop, {CENTER,CENTER,0,0}, { size1 - 4, size2 -(size2 * .3) }, 0.55, "regen2" )
                            UnitFrames.CustomFrames[unitTag][powerType].degen1 = CreateRegenAnimation( backdrop, {CENTER,CENTER,0,0}, { size1 - 4, size2 -(size2 * .3) }, 0.55, "degen1" )
                            UnitFrames.CustomFrames[unitTag][powerType].degen2 = CreateRegenAnimation( backdrop, {CENTER,CENTER,0,0}, { size1 - 4, size2 -(size2 * .3) }, 0.55, "degen2" )
                        end
                    end
                end
            end
        end
    end

    if UnitFrames.SV.GroupEnableRegen then
        for i = 1, 4 do
            local unitTag = 'SmallGroup' .. i
            if UnitFrames.CustomFrames[unitTag] then
                for _, powerType in pairs( {POWERTYPE_HEALTH, POWERTYPE_MAGICKA, POWERTYPE_STAMINA} ) do
                    if UnitFrames.CustomFrames[unitTag][powerType] then
                        local backdrop = UnitFrames.CustomFrames[unitTag][powerType].backdrop
                        local size1 = UnitFrames.SV.GroupBarWidth
                        local size2 = UnitFrames.SV.GroupBarHeight
                        if size1 ~= nil and size2 ~= nil then
                            UnitFrames.CustomFrames[unitTag][powerType].regen1 = CreateRegenAnimation( backdrop, {CENTER,CENTER,0,0}, { size1 - 4, size2 -(size2 * .4) }, 0.55, "regen1" )
                            UnitFrames.CustomFrames[unitTag][powerType].regen2 = CreateRegenAnimation( backdrop, {CENTER,CENTER,0,0}, { size1 - 4, size2 -(size2 * .4) }, 0.55, "regen2" )
                            UnitFrames.CustomFrames[unitTag][powerType].degen1 = CreateRegenAnimation( backdrop, {CENTER,CENTER,0,0}, { size1 - 4, size2 -(size2 * .4) }, 0.55, "degen1" )
                            UnitFrames.CustomFrames[unitTag][powerType].degen2 = CreateRegenAnimation( backdrop, {CENTER,CENTER,0,0}, { size1 - 4, size2 -(size2 * .4) }, 0.55, "degen2" )
                        end
                    end
                end
            end
        end
    end

    if UnitFrames.SV.RaidEnableRegen then
        for i = 1, 24 do
            local unitTag = 'RaidGroup' .. i
            if UnitFrames.CustomFrames[unitTag] then
                for _, powerType in pairs( {POWERTYPE_HEALTH, POWERTYPE_MAGICKA, POWERTYPE_STAMINA} ) do
                    if UnitFrames.CustomFrames[unitTag][powerType] then
                        local backdrop = UnitFrames.CustomFrames[unitTag][powerType].backdrop
                        local size1 = UnitFrames.SV.RaidBarWidth
                        local size2 = UnitFrames.SV.RaidBarHeight
                        if size1 ~= nil and size2 ~= nil then
                            UnitFrames.CustomFrames[unitTag][powerType].regen1 = CreateRegenAnimation( backdrop, {CENTER,CENTER,0,0}, { size1 - 4, size2 -(size2 * .3) }, 0.55, "regen1" )
                            UnitFrames.CustomFrames[unitTag][powerType].regen2 = CreateRegenAnimation( backdrop, {CENTER,CENTER,0,0}, { size1 - 4, size2 -(size2 * .3) }, 0.55, "regen2" )
                            UnitFrames.CustomFrames[unitTag][powerType].degen1 = CreateRegenAnimation( backdrop, {CENTER,CENTER,0,0}, { size1 - 4, size2 -(size2 * .3) }, 0.55, "degen1" )
                            UnitFrames.CustomFrames[unitTag][powerType].degen2 = CreateRegenAnimation( backdrop, {CENTER,CENTER,0,0}, { size1 - 4, size2 -(size2 * .3) }, 0.55, "degen2" )
                        end
                    end
                end
            end
        end
    end

    if UnitFrames.SV.BossEnableRegen then
        for i = 0, 6 do
            local unitTag = 'boss' .. i
            if UnitFrames.CustomFrames[unitTag] then
                for _, powerType in pairs( {POWERTYPE_HEALTH, POWERTYPE_MAGICKA, POWERTYPE_STAMINA} ) do
                    if UnitFrames.CustomFrames[unitTag][powerType] then
                        local backdrop = UnitFrames.CustomFrames[unitTag][powerType].backdrop
                        local size1 = UnitFrames.SV.BossBarWidth
                        local size2 = UnitFrames.SV.BossBarHeight
                        if size1 ~= nil and size2 ~= nil then
                            UnitFrames.CustomFrames[unitTag][powerType].regen1 = CreateRegenAnimation( backdrop, {CENTER,CENTER,0,0}, { size1 - 4, size2 -(size2 * .3) }, 0.55, "regen1" )
                            UnitFrames.CustomFrames[unitTag][powerType].regen2 = CreateRegenAnimation( backdrop, {CENTER,CENTER,0,0}, { size1 - 4, size2 -(size2 * .3) }, 0.55, "regen2" )
                            UnitFrames.CustomFrames[unitTag][powerType].degen1 = CreateRegenAnimation( backdrop, {CENTER,CENTER,0,0}, { size1 - 4, size2 -(size2 * .3) }, 0.55, "degen1" )
                            UnitFrames.CustomFrames[unitTag][powerType].degen2 = CreateRegenAnimation( backdrop, {CENTER,CENTER,0,0}, { size1 - 4, size2 -(size2 * .3) }, 0.55, "degen2" )
                        end
                    end
                end
            end
        end
    end

    -- Create armor stat change UI for player and target
    if UnitFrames.SV.PlayerEnableArmor then
        for _, baseName in pairs( { 'player', 'reticleover', 'AvaPlayerTarget' } ) do
            local unitTag = baseName
            if UnitFrames.CustomFrames[unitTag] then
                -- Assume that unitTag DO have [POWERTYPE_HEALTH] field
                if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat == nil then
                    UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat = {}
                end
                local backdrop = UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].backdrop
                UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat[STAT_ARMOR_RATING] = {
                    ["dec"] = CreateDecreasedArmorOverlay( backdrop, false ),
                    ["inc"] = UI.Texture( backdrop, {CENTER,CENTER,13,0}, {24,24}, "/esoui/art/icons/alchemy/crafting_alchemy_trait_increasearmor.dds", 2, true ),
                }
            end
        end
    end

    if UnitFrames.SV.GroupEnableArmor then
        for i = 1, 4 do
            local unitTag = 'SmallGroup' .. i
            if UnitFrames.CustomFrames[unitTag] then
                -- Assume that unitTag DO have [POWERTYPE_HEALTH] field
                if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat == nil then
                    UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat = {}
                end
                local backdrop = UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].backdrop
                UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat[STAT_ARMOR_RATING] = {
                    ["dec"] = CreateDecreasedArmorOverlay( backdrop, false ),
                    ["inc"] = UI.Texture( backdrop, {CENTER,CENTER,13,0}, {24,24}, "/esoui/art/icons/alchemy/crafting_alchemy_trait_increasearmor.dds", 2, true ),
                }
            end
        end
    end

    if UnitFrames.SV.RaidEnableArmor then
        for i = 1, 24 do
            local unitTag = 'RaidGroup' .. i
            if UnitFrames.CustomFrames[unitTag] then
                -- Assume that unitTag DO have [POWERTYPE_HEALTH] field
                if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat == nil then
                    UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat = {}
                end
                local backdrop = UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].backdrop
                UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat[STAT_ARMOR_RATING] = {
                    ["dec"] = CreateDecreasedArmorOverlay( backdrop, false ),
                    ["inc"] = UI.Texture( backdrop, {CENTER,CENTER,13,0}, {24,24}, "/esoui/art/icons/alchemy/crafting_alchemy_trait_increasearmor.dds", 2, true ),
                }
            end
        end
    end

    if UnitFrames.SV.BossEnableArmor then
        for i = 0, 6 do
            local unitTag = 'boss' .. i
            if UnitFrames.CustomFrames[unitTag] then
                -- Assume that unitTag DO have [POWERTYPE_HEALTH] field
                if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat == nil then
                    UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat = {}
                end
                local backdrop = UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].backdrop
                UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat[STAT_ARMOR_RATING] = {
                    ["dec"] = CreateDecreasedArmorOverlay( backdrop, false ),
                    ["inc"] = UI.Texture( backdrop, {CENTER,CENTER,13,0}, {24,24}, "/esoui/art/icons/alchemy/crafting_alchemy_trait_increasearmor.dds", 2, true ),
                }
            end
        end
    end

    -- Create power stat change UI for player and target
    if UnitFrames.SV.PlayerEnablePower then
        for _, baseName in pairs( { 'player', 'reticleover', 'AvaPlayerTarget' } ) do
            local unitTag = baseName
            if UnitFrames.CustomFrames[unitTag] then
                if baseName == "player" then
                    size1 = UnitFrames.SV.PlayerBarWidth
                    size2 = UnitFrames.SV.PlayerBarHeightHealth
                elseif baseName == "reticleover" then
                    size1 = UnitFrames.SV.TargetBarWidth
                    size2 = UnitFrames.SV.TargetBarHeight
                elseif baseName == "AvaPlayerTarget" then
                    size1 = UnitFrames.SV.AvaTargetBarWidth
                    size2 = UnitFrames.SV.AvaTargetBarHeight
                end
                if size1 ~= nil and size2 ~= nil then
                    if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat == nil then UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat = {} end
                    local backdrop = UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].backdrop
                    UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat[STAT_POWER] = {
                        ["inc"] = UI.Texture( backdrop, {CENTER,CENTER,4,0}, {size1 * 1.8, size2 * 4.0}, "/esoui/art/unitattributevisualizer/increasedpower_animatedhalo_32fr.dds", 0, true ),
                        ["dec"] = UI.Texture( backdrop, {CENTER,CENTER,0,0}, {size1 * 2.2, size2 * 3}, "/esoui/art/unitattributevisualizer/attributebar_dynamic_decreasedpower_halo.dds", 0, true ),
                    }
                end
            end
        end
    end

    if UnitFrames.SV.GroupEnablePower then
        for i = 1, 4 do
            local unitTag = 'SmallGroup' .. i
            if UnitFrames.CustomFrames[unitTag] then
                -- assume that unitTag DO have [POWERTYPE_HEALTH] field
                local size1 = UnitFrames.SV.GroupBarWidth
                local size2 = UnitFrames.SV.GroupBarHeight
                --elseif baseName == "RaidGroup" then
                --    size1 = UnitFrames.SV.RaidBarWidth
                --    size2 = UnitFrames.SV.RaidBarHeight
                if size1 ~= nil and size2 ~= nil then
                    if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat == nil then UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat = {} end
                    local backdrop = UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].backdrop
                    UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat[STAT_POWER] = {
                        ["inc"] = UI.Texture( backdrop, {CENTER,CENTER,4,0}, {size1 * 1.8, size2 * 4.0}, "/esoui/art/unitattributevisualizer/increasedpower_animatedhalo_32fr.dds", 0, true ),
                        ["dec"] = UI.Texture( backdrop, {CENTER,CENTER,0,0}, {size1 * 2.2, size2 * 3}, "/esoui/art/unitattributevisualizer/attributebar_dynamic_decreasedpower_halo.dds", 0, true ),
                    }
                end
            end
        end
    end

    if UnitFrames.SV.RaidEnablePower then
        for i = 1, 24 do
            local unitTag = 'RaidGroup' .. i
            if UnitFrames.CustomFrames[unitTag] then
                -- assume that unitTag DO have [POWERTYPE_HEALTH] field
                local size1 = UnitFrames.SV.RaidBarWidth
                local size2 = UnitFrames.SV.RaidBarHeight
                if size1 ~= nil and size2 ~= nil then
                    if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat == nil then UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat = {} end
                    local backdrop = UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].backdrop
                    UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat[STAT_POWER] = {
                        ["inc"] = UI.Texture( backdrop, {CENTER,CENTER,4,0}, {size1 * 1.8, size2 * 4.0}, "/esoui/art/unitattributevisualizer/increasedpower_animatedhalo_32fr.dds", 0, true ),
                        ["dec"] = UI.Texture( backdrop, {CENTER,CENTER,0,0}, {size1 * 2.2, size2 * 3}, "/esoui/art/unitattributevisualizer/attributebar_dynamic_decreasedpower_halo.dds", 0, true ),
                    }
                end
            end
        end
    end

    if UnitFrames.SV.BossEnablePower then
        for i = 1, 6 do
            local unitTag = 'boss' .. i
            if UnitFrames.CustomFrames[unitTag] then
                -- assume that unitTag DO have [POWERTYPE_HEALTH] field
                local size1 = UnitFrames.SV.BossBarWidth
                local size2 = UnitFrames.SV.BossBarHeight
                if size1 ~= nil and size2 ~= nil then
                    if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat == nil then UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat = {} end
                    local backdrop = UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].backdrop
                    UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat[STAT_POWER] = {
                        ["inc"] = UI.Texture( backdrop, {CENTER,CENTER,4,0}, {size1 * 1.8, size2 * 4.0}, "/esoui/art/unitattributevisualizer/increasedpower_animatedhalo_32fr.dds", 0, true ),
                        ["dec"] = UI.Texture( backdrop, {CENTER,CENTER,0,0}, {size1 * 2.2, size2 * 3}, "/esoui/art/unitattributevisualizer/attributebar_dynamic_decreasedpower_halo.dds", 0, true ),
                    }
                end
            end
        end
    end

    -- Animate Power Glow for all frames that have it displayed
    for _, baseName in pairs( { 'player', 'reticleover', 'AvaPlayerTarget', 'boss', 'SmallGroup', 'RaidGroup' } ) do
        for i = 0, 24 do
            local unitTag = (i==0) and baseName or ( baseName .. i )
            if UnitFrames.CustomFrames[unitTag] then
                if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH] then
                    if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat then
                        if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat[STAT_POWER] then
                            if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat[STAT_POWER].inc then
                                -- Create glow animation
                                local control = UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].stat[STAT_POWER].inc
                                local animation, timeline = CreateSimpleAnimation(ANIMATION_TEXTURE, control)
                                animation:SetImageData(4, 8)
                                animation:SetFramerate(32)
                                animation:SetDuration(1000)
                                timeline:SetPlaybackType(ANIMATION_PLAYBACK_LOOP, LOOP_INDEFINITELY)

                                control.animation = animation
                                control.timeline = timeline

                                control.timeline:PlayFromStart()
                            end
                        end
                    end
                end
            end
        end
    end

    -- Set proper anchors according to user preferences
    UnitFrames.CustomFramesApplyLayoutPlayer(true)
    UnitFrames.CustomFramesApplyLayoutGroup(true)
    UnitFrames.CustomFramesApplyLayoutRaid(true)
    UnitFrames.CustomFramesApplyLayoutPet(true)
    UnitFrames.CustomFramesApplyLayoutCompanion(true)
    UnitFrames.CustomPetUpdate()
    UnitFrames.CompanionUpdate()
    UnitFrames.CustomFramesApplyLayoutBosses()
    -- Set positions of tlws using saved values or default ones
    UnitFrames.CustomFramesSetPositions()
    -- Apply formatting for labels
    UnitFrames.CustomFramesFormatLabels()
    -- Apply bar textures
    UnitFrames.CustomFramesApplyTexture()
    -- Apply fonts
    UnitFrames.CustomFramesApplyFont()
    UnitFrames.CustomFramesApplyBarAlignment()

        -- Add this top level window to global controls list, so it can be hidden
    for _, unitTag in pairs( { 'player', 'reticleover', 'companion', 'SmallGroup1', 'RaidGroup1', 'boss1', 'AvaPlayerTarget', "PetGroup1" } ) do
        if UnitFrames.CustomFrames[unitTag] then
            LUIE.Components[moduleName .. '_CustomFrame_' .. unitTag] = UnitFrames.CustomFrames[unitTag].tlw
        end
    end
end

local defaultPos = { }

function UnitFrames.CustomFramesApplyBarAlignment()
    if UnitFrames.CustomFrames["player"] then
        local hpBar = UnitFrames.CustomFrames["player"][POWERTYPE_HEALTH]
        if hpBar then
            hpBar.bar:SetBarAlignment(UnitFrames.SV.BarAlignPlayerHealth- 1 )
        end
        local magBar = UnitFrames.CustomFrames["player"][POWERTYPE_MAGICKA]
        if magBar then
            magBar.bar:SetBarAlignment(UnitFrames.SV.BarAlignPlayerMagicka - 1 )
        end
        local stamBar = UnitFrames.CustomFrames["player"][POWERTYPE_STAMINA]
        if stamBar then
            stamBar.bar:SetBarAlignment(UnitFrames.SV.BarAlignPlayerStamina - 1 )
        end
    end
    if UnitFrames.CustomFrames["reticleover"] then
        local hpBar = UnitFrames.CustomFrames["reticleover"][POWERTYPE_HEALTH]
        if hpBar then
            hpBar.bar:SetBarAlignment(UnitFrames.SV.BarAlignTarget - 1 )
        end
    end
end

-- Save default frame positions
function UnitFrames.SaveDefaultFramePositions()
    -- Get Default Positions
    local isValidAnchor, point, relativeTo, relativePoint, offsetX, offsetY = ZO_PlayerAttributeHealth:GetAnchor()
    defaultPos.health = { point, relativeTo, relativePoint, offsetX, offsetY }
    local isValidAnchor, point, relativeTo, relativePoint, offsetX, offsetY = ZO_PlayerAttributeMagicka:GetAnchor()
    defaultPos.magicka = { point, relativeTo, relativePoint, offsetX, offsetY }
    local isValidAnchor, point, relativeTo, relativePoint, offsetX, offsetY = ZO_PlayerAttributeStamina:GetAnchor()
    defaultPos.stamina = { point, relativeTo, relativePoint, offsetX, offsetY }
    local isValidAnchor, point, relativeTo, relativePoint, offsetX, offsetY = ZO_PlayerAttributeSiegeHealth:GetAnchor()
    defaultPos.siege = { point, relativeTo, relativePoint, offsetX, offsetY }
    local isValidAnchor, point, relativeTo, relativePoint, offsetX, offsetY = ZO_RAM.control:GetAnchor()
    defaultPos.ram = { point, relativeTo, relativePoint, offsetX, offsetY }
    local isValidAnchor, point, relativeTo, relativePoint, offsetX, offsetY = ZO_SmallGroupAnchorFrame:GetAnchor()
    defaultPos.smallGroup = { point, relativeTo, relativePoint, offsetX, offsetY }
end

-- Adjust default frame position.
function UnitFrames.RepositionDefaultFrames()

    if not UnitFrames.SV.RepositionFrames then
        if defaultPos.health then
            ZO_PlayerAttributeHealth:ClearAnchors()
            ZO_PlayerAttributeHealth:SetAnchor( defaultPos.health[1], defaultPos.health[2], defaultPos.health[3], defaultPos.health[4], defaultPos.health[5] - UnitFrames.SV.RepositionFramesAdjust )
            ZO_PlayerAttributeMagicka:ClearAnchors()
            ZO_PlayerAttributeMagicka:SetAnchor( defaultPos.magicka[1], defaultPos.magicka[2], defaultPos.magicka[3], defaultPos.magicka[4], defaultPos.magicka[5] - UnitFrames.SV.RepositionFramesAdjust )
            ZO_PlayerAttributeStamina:ClearAnchors()
            ZO_PlayerAttributeStamina:SetAnchor( defaultPos.stamina[1], defaultPos.stamina[2], defaultPos.stamina[3], defaultPos.stamina[4], defaultPos.stamina[5] - UnitFrames.SV.RepositionFramesAdjust )
            ZO_PlayerAttributeSiegeHealth:ClearAnchors()
            ZO_PlayerAttributeSiegeHealth:SetAnchor( defaultPos.siege[1], defaultPos.siege[2], defaultPos.siege[3], defaultPos.siege[4], defaultPos.siege[5] - UnitFrames.SV.RepositionFramesAdjust )
            ZO_RAM.control:ClearAnchors()
            ZO_RAM.control:SetAnchor( defaultPos.ram[1], defaultPos.ram[2], defaultPos.ram[3], defaultPos.ram[4], defaultPos.ram[5] - UnitFrames.SV.RepositionFramesAdjust )
            ZO_SmallGroupAnchorFrame:ClearAnchors()
            ZO_SmallGroupAnchorFrame:SetAnchor( defaultPos.smallGroup[1], defaultPos.smallGroup[2], defaultPos.smallGroup[3], defaultPos.smallGroup[4], defaultPos.smallGroup[5] - UnitFrames.SV.RepositionFramesAdjust )
        end
    end

    -- Reposition frames
    if UnitFrames.SV.RepositionFrames then
        -- Shift to center magicka and stamina bars
        ZO_PlayerAttributeHealth:ClearAnchors()
        ZO_PlayerAttributeHealth:SetAnchor( BOTTOM, ActionButton5, TOP, 0, -47 - UnitFrames.SV.RepositionFramesAdjust )
        ZO_PlayerAttributeMagicka:ClearAnchors()
        ZO_PlayerAttributeMagicka:SetAnchor( TOPRIGHT, ZO_PlayerAttributeHealth, BOTTOM, -1, 2 )
        ZO_PlayerAttributeStamina:ClearAnchors()
        ZO_PlayerAttributeStamina:SetAnchor( TOPLEFT, ZO_PlayerAttributeHealth, BOTTOM, 1, 2 )
        -- Shift to the right siege weapon health and ram control
        ZO_PlayerAttributeSiegeHealth:ClearAnchors()
        ZO_PlayerAttributeSiegeHealth:SetAnchor( CENTER, ZO_PlayerAttributeHealth, CENTER, 300, 0 )
        ZO_RAM.control:ClearAnchors()
        ZO_RAM.control:SetAnchor( BOTTOM, ZO_PlayerAttributeHealth, TOP, 300, 0 )
        -- Shift a little upwards small group unit frames
        ZO_SmallGroupAnchorFrame:ClearAnchors()
        ZO_SmallGroupAnchorFrame:SetAnchor( TOPLEFT, GuiRoot, TOPLEFT, 20, 80 ) -- default is 28,100
    end

end

-- Main entry point to this module
function UnitFrames.Initialize(enabled)
    -- Load settings
    local isCharacterSpecific = LUIESV.Default[GetDisplayName()]['$AccountWide'].CharacterSpecificSV
    if isCharacterSpecific then
        UnitFrames.SV = ZO_SavedVars:New(LUIE.SVName, LUIE.SVVer, "UnitFrames", UnitFrames.Defaults)
    else
        UnitFrames.SV = ZO_SavedVars:NewAccountWide(LUIE.SVName, LUIE.SVVer, "UnitFrames", UnitFrames.Defaults)
    end

    if UnitFrames.SV.DefaultOocTransparency < 0 or UnitFrames.SV.DefaultOocTransparency > 100 then
        UnitFrames.SV.DefaultOocTransparency = UnitFrames.Defaults.DefaultOocTransparency
    end
    if UnitFrames.SV.DefaultIncTransparency < 0 or UnitFrames.SV.DefaultIncTransparency > 100 then
        UnitFrames.SV.DefaultIncTransparency = UnitFrames.Defaults.DefaultIncTransparency
    end

    -- Disable module if setting not toggled on
    if not enabled then
        return
    end
    UnitFrames.Enabled = true

    -- Even if used do not want to use neither DefaultFrames nor CustomFrames, let us still create tables to hold health and shield values
    -- { powerValue, powerMax, powerEffectiveMax, shield }
    g_savedHealth.player          = {1,1,1,0}
    g_savedHealth.controlledsiege = {1,1,1,0}
    g_savedHealth.reticleover     = {1,1,1,0}
    g_savedHealth.companion       = {1,1,1,0}
    for i = 1, 24 do
        g_savedHealth["group" .. i] = {1,1,1,0}
    end
    for i = 1, 6 do
        g_savedHealth["boss" .. i] = {1,1,1,0}
    end
    for i = 1, 6 do
        g_savedHealth["playerpet" .. i] = {1,1,1,0}
    end

    -- Get execute threshold percentage
    g_targetThreshold = UnitFrames.SV.ExecutePercentage

    -- Get low health threshold percentage
    g_healthThreshold = UnitFrames.SV.LowResourceHealth
    g_magickaThreshold = UnitFrames.SV.LowResourceMagicka
    g_staminaThreshold = UnitFrames.SV.LowResourceStamina

    -- Variable adjustment if needed
    if not LUIESV.Default[GetDisplayName()]['$AccountWide'].AdjustVarsUF then
        LUIESV.Default[GetDisplayName()]['$AccountWide'].AdjustVarsUF = 0
    end
    if (LUIESV.Default[GetDisplayName()]['$AccountWide'].AdjustVarsUF < 2) then
        UnitFrames.SV["CustomFramesPetFramePos"] = nil
    end
    -- Increment so this doesn't occur again.
    LUIESV.Default[GetDisplayName()]['$AccountWide'].AdjustVarsUF = 2

    CreateDefaultFrames()
    CreateCustomFrames()

    BOSS_BAR.RefreshBossHealthBar = function(self, smoothAnimate)
        local totalHealth = 0
        local totalMaxHealth = 0

        for unitTag, bossEntry in pairs(self.bossHealthValues) do
            totalHealth = totalHealth + bossEntry.health
            totalMaxHealth = totalMaxHealth + bossEntry.maxHealth
        end

        local halfHealth = zo_floor(totalHealth / 2)
        local halfMax = zo_floor(totalMaxHealth / 2)
        for i = 1, #self.bars do
            ZO_StatusBar_SmoothTransition(self.bars[i], halfHealth, halfMax, not smoothAnimate)
        end
        self.healthText:SetText(ZO_FormatResourceBarCurrentAndMax(totalHealth, totalMaxHealth))

        if UnitFrames.SV.DefaultFramesNewBoss == 2 then
            COMPASS_FRAME:SetBossBarActive(totalHealth > 0)
        end
    end

    UnitFrames.SaveDefaultFramePositions()
    UnitFrames.RepositionDefaultFrames()
    UnitFrames.SetDefaultFramesTransparency()

    -- Set event handlers
    eventManager:RegisterForEvent(moduleName, EVENT_PLAYER_ACTIVATED, UnitFrames.OnPlayerActivated )
    eventManager:RegisterForEvent(moduleName, EVENT_POWER_UPDATE,     UnitFrames.OnPowerUpdate )
    eventManager:RegisterForEvent(moduleName, EVENT_UNIT_ATTRIBUTE_VISUAL_ADDED,   UnitFrames.OnVisualizationAdded )
    eventManager:RegisterForEvent(moduleName, EVENT_UNIT_ATTRIBUTE_VISUAL_REMOVED, UnitFrames.OnVisualizationRemoved )
    eventManager:RegisterForEvent(moduleName, EVENT_UNIT_ATTRIBUTE_VISUAL_UPDATED, UnitFrames.OnVisualizationUpdated )
    eventManager:RegisterForEvent(moduleName, EVENT_TARGET_CHANGE, UnitFrames.OnTargetChange )
    eventManager:RegisterForEvent(moduleName, EVENT_RETICLE_TARGET_CHANGED, UnitFrames.OnReticleTargetChanged )
    eventManager:RegisterForEvent(moduleName, EVENT_DISPOSITION_UPDATE, UnitFrames.OnDispositionUpdate )
    eventManager:RegisterForEvent(moduleName, EVENT_UNIT_CREATED, UnitFrames.OnUnitCreated )
    eventManager:RegisterForEvent(moduleName, EVENT_LEVEL_UPDATE,        UnitFrames.OnLevelUpdate )
    eventManager:RegisterForEvent(moduleName, EVENT_CHAMPION_POINT_UPDATE, UnitFrames.OnLevelUpdate )
    eventManager:RegisterForEvent(moduleName, EVENT_TITLE_UPDATE,  UnitFrames.TitleUpdate )
    eventManager:RegisterForEvent(moduleName, EVENT_RANK_POINT_UPDATE,  UnitFrames.TitleUpdate )

    -- Next events make sense only for CustomFrames
    if UnitFrames.CustomFrames.player or UnitFrames.CustomFrames.reticleover or UnitFrames.CustomFrames.companion or UnitFrames.CustomFrames.SmallGroup1 or UnitFrames.CustomFrames.RaidGroup1 or UnitFrames.CustomFrames.boss1 or UnitFrames.PetGroup1 then
        eventManager:RegisterForEvent(moduleName, EVENT_COMBAT_EVENT,          UnitFrames.OnCombatEvent )
        eventManager:AddFilterForEvent(moduleName, EVENT_COMBAT_EVENT, REGISTER_FILTER_IS_ERROR, true )

        eventManager:RegisterForEvent(moduleName, EVENT_UNIT_DESTROYED,        UnitFrames.OnUnitDestroyed )
        eventManager:RegisterForEvent(moduleName, EVENT_ACTIVE_COMPANION_STATE_CHANGED, UnitFrames.ActiveCompanionStateChanged )
        eventManager:RegisterForEvent(moduleName, EVENT_FRIEND_ADDED,          UnitFrames.SocialUpdateFrames)
        eventManager:RegisterForEvent(moduleName, EVENT_FRIEND_REMOVED,        UnitFrames.SocialUpdateFrames)
        eventManager:RegisterForEvent(moduleName, EVENT_IGNORE_ADDED,          UnitFrames.SocialUpdateFrames)
        eventManager:RegisterForEvent(moduleName, EVENT_IGNORE_REMOVED,        UnitFrames.SocialUpdateFrames)
        eventManager:RegisterForEvent(moduleName, EVENT_PLAYER_COMBAT_STATE,    UnitFrames.OnPlayerCombatState )
        eventManager:RegisterForEvent(moduleName, EVENT_WEREWOLF_STATE_CHANGED, UnitFrames.OnWerewolf )
        eventManager:RegisterForEvent(moduleName, EVENT_BEGIN_SIEGE_CONTROL,       UnitFrames.OnSiege )
        eventManager:RegisterForEvent(moduleName, EVENT_END_SIEGE_CONTROL,         UnitFrames.OnSiege )
        eventManager:RegisterForEvent(moduleName, EVENT_LEAVE_RAM_ESCORT,          UnitFrames.OnSiege )
        eventManager:RegisterForEvent(moduleName, EVENT_MOUNTED_STATE_CHANGED,     UnitFrames.OnMount )
        eventManager:RegisterForEvent(moduleName, EVENT_EXPERIENCE_UPDATE,         UnitFrames.OnXPUpdate )
        eventManager:RegisterForEvent(moduleName, EVENT_CHAMPION_POINT_GAINED,     UnitFrames.OnChampionPointGained )
        eventManager:RegisterForEvent(moduleName, EVENT_GROUP_SUPPORT_RANGE_UPDATE,    UnitFrames.OnGroupSupportRangeUpdate )
        eventManager:RegisterForEvent(moduleName, EVENT_GROUP_MEMBER_CONNECTED_STATUS, UnitFrames.OnGroupMemberConnectedStatus )
        eventManager:RegisterForEvent(moduleName, EVENT_GROUP_MEMBER_ROLE_CHANGED, UnitFrames.OnGroupMemberRoleChange )
        eventManager:RegisterForEvent(moduleName, EVENT_GROUP_UPDATE, UnitFrames.OnGroupMemberChange )
        eventManager:RegisterForEvent(moduleName, EVENT_GROUP_MEMBER_JOINED, UnitFrames.OnGroupMemberChange )
        eventManager:RegisterForEvent(moduleName, EVENT_GROUP_MEMBER_LEFT, UnitFrames.OnGroupMemberChange )
        eventManager:RegisterForEvent(moduleName, EVENT_UNIT_DEATH_STATE_CHANGED,  UnitFrames.OnDeath )
        eventManager:RegisterForEvent(moduleName, EVENT_LEADER_UPDATE,         UnitFrames.OnLeaderUpdate )
        eventManager:RegisterForEvent(moduleName, EVENT_BOSSES_CHANGED,    UnitFrames.OnBossesChanged )

        eventManager:RegisterForEvent(moduleName, EVENT_GUILD_SELF_LEFT_GUILD,     UnitFrames.SocialUpdateFrames)
        eventManager:RegisterForEvent(moduleName, EVENT_GUILD_SELF_JOINED_GUILD,   UnitFrames.SocialUpdateFrames)
        eventManager:RegisterForEvent(moduleName, EVENT_GUILD_MEMBER_ADDED,        UnitFrames.SocialUpdateFrames)
        eventManager:RegisterForEvent(moduleName, EVENT_GUILD_MEMBER_REMOVED,      UnitFrames.SocialUpdateFrames)
    end

    -- New AvA frames
    if false then
        eventManager:RegisterForEvent(moduleName, EVENT_CURRENT_CAMPAIGN_CHANGED, UnitFrames.OnCurrentCampaignChanged) -- (integer eventCode, integer newCurrentCampaignId)
        eventManager:RegisterForEvent(moduleName, EVENT_CAMPAIGN_EMPEROR_CHANGED, UnitFrames.OnCampaignEmperorChanged) -- (integer eventCode, integer campaignId)
    end

    g_defaultTargetNameLabel = ZO_TargetUnitFramereticleoverName

    -- Initialize colouring. This is actually needed when user does NOT want those features
    UnitFrames.TargetColourByReaction()
    UnitFrames.ReticleColourByReaction()

end

-- Sets out-of-combat transparency values for default user-frames
function UnitFrames.SetDefaultFramesTransparency(min_pct_value, max_pct_value)
    if min_pct_value ~= nil then
        UnitFrames.SV.DefaultOocTransparency = min_pct_value
    end

    if max_pct_value ~= nil then
        UnitFrames.SV.DefaultIncTransparency = max_pct_value
    end

    local min_value = UnitFrames.SV.DefaultOocTransparency / 100
    local max_value = UnitFrames.SV.DefaultIncTransparency / 100

    ZO_PlayerAttributeHealth.playerAttributeBarObject.timeline:GetAnimation():SetAlphaValues(min_value, max_value)
    ZO_PlayerAttributeMagicka.playerAttributeBarObject.timeline:GetAnimation():SetAlphaValues(min_value, max_value)
    ZO_PlayerAttributeStamina.playerAttributeBarObject.timeline:GetAnimation():SetAlphaValues(min_value, max_value)

    local inCombat = IsUnitInCombat("player")
    ZO_PlayerAttributeHealth:SetAlpha(inCombat and max_value or min_value)
    ZO_PlayerAttributeStamina:SetAlpha(inCombat and max_value or min_value)
    ZO_PlayerAttributeMagicka:SetAlpha(inCombat and max_value or min_value)
end

-- Update selection for target name colouring
function UnitFrames.TargetColourByReaction(value)
    -- If we have a parameter, save it
    if value ~= nil then
        UnitFrames.SV.TargetColourByReaction = value
    end
    -- If this Target name colouring is not required, revert it back to white
    if not value then
        g_defaultTargetNameLabel:SetColor(1,1,1,1)
    end
end

-- Update selection for target name colouring
function UnitFrames.ReticleColourByReaction(value)
    if value ~= nil then
        UnitFrames.SV.ReticleColourByReaction = value
    end
    -- If this Reticle colouring is not required, revert it back to white
    if not value then
        ZO_ReticleContainerReticle:SetColor(1, 1, 1)
    end
end

-- Update format for labels on CustomFrames
function UnitFrames.CustomFramesFormatLabels(menu)
    -- Search CustomFrames for attribute bars with correct labels

    -- Format Player Labels
    if UnitFrames.CustomFrames["player"] then
        for _, powerType in pairs( {POWERTYPE_HEALTH, POWERTYPE_MAGICKA, POWERTYPE_STAMINA} ) do
            if UnitFrames.CustomFrames["player"][powerType] then
                if UnitFrames.CustomFrames["player"][powerType].labelOne then
                    if UnitFrames.SV.BarAlignCenterLabelPlayer then
                        UnitFrames.CustomFrames["player"][powerType].labelOne.fmt = UnitFrames.SV.CustomFormatCenterLabel
                        UnitFrames.CustomFrames["player"][powerType].labelOne:ClearAnchors()
                        UnitFrames.CustomFrames["player"][powerType].labelOne:SetHorizontalAlignment(TEXT_ALIGN_CENTER)
                        UnitFrames.CustomFrames["player"][powerType].labelOne:SetAnchor ( CENTER, UnitFrames.CustomFrames["player"][powerType].backdrop, CENTER, 0, 0 )
                    else
                        UnitFrames.CustomFrames["player"][powerType].labelOne.fmt = UnitFrames.SV.CustomFormatOnePT
                        UnitFrames.CustomFrames["player"][powerType].labelOne:ClearAnchors()
                        UnitFrames.CustomFrames["player"][powerType].labelOne:SetHorizontalAlignment(TEXT_ALIGN_LEFT)
                        UnitFrames.CustomFrames["player"][powerType].labelOne:SetAnchor ( LEFT, UnitFrames.CustomFrames["player"][powerType].backdrop, LEFT, 5, 0 )
                    end
                end
                if UnitFrames.CustomFrames["player"][powerType].labelTwo then
                    if UnitFrames.SV.BarAlignCenterLabelPlayer then
                        UnitFrames.CustomFrames["player"][powerType].labelTwo.fmt = "Nothing"
                    else
                        UnitFrames.CustomFrames["player"][powerType].labelTwo.fmt = UnitFrames.SV.CustomFormatTwoPT
                    end
                end
            end
        end
    end
    if menu and DoesUnitExist("player") then
        UnitFrames.ReloadValues("player")
    end

    -- Format Target Labels
    if UnitFrames.CustomFrames["reticleover"] then
        if UnitFrames.CustomFrames["reticleover"][POWERTYPE_HEALTH] then
            if UnitFrames.CustomFrames["reticleover"][POWERTYPE_HEALTH].labelOne then
                if UnitFrames.SV.BarAlignCenterLabelTarget then
                    UnitFrames.CustomFrames["reticleover"][POWERTYPE_HEALTH].labelOne.fmt = UnitFrames.SV.CustomFormatCenterLabel
                    UnitFrames.CustomFrames["reticleover"][POWERTYPE_HEALTH].labelOne:ClearAnchors()
                    UnitFrames.CustomFrames["reticleover"][POWERTYPE_HEALTH].labelOne:SetHorizontalAlignment(TEXT_ALIGN_CENTER)
                    UnitFrames.CustomFrames["reticleover"][POWERTYPE_HEALTH].labelOne:SetAnchor ( CENTER, UnitFrames.CustomFrames["reticleover"][POWERTYPE_HEALTH].backdrop, CENTER, 0, 0 )
                else
                    UnitFrames.CustomFrames["reticleover"][POWERTYPE_HEALTH].labelOne.fmt = UnitFrames.SV.CustomFormatOnePT
                    UnitFrames.CustomFrames["reticleover"][POWERTYPE_HEALTH].labelOne:ClearAnchors()
                    UnitFrames.CustomFrames["reticleover"][POWERTYPE_HEALTH].labelOne:SetHorizontalAlignment(TEXT_ALIGN_LEFT)
                    UnitFrames.CustomFrames["reticleover"][POWERTYPE_HEALTH].labelOne:SetAnchor ( LEFT, UnitFrames.CustomFrames["reticleover"][POWERTYPE_HEALTH].backdrop, LEFT, 5, 0 )
                end
            end
            if UnitFrames.CustomFrames["reticleover"][POWERTYPE_HEALTH].labelTwo then
                if UnitFrames.SV.BarAlignCenterLabelTarget then
                    UnitFrames.CustomFrames["reticleover"][POWERTYPE_HEALTH].labelTwo.fmt = "Nothing"
                else
                    UnitFrames.CustomFrames["reticleover"][POWERTYPE_HEALTH].labelTwo.fmt = UnitFrames.SV.CustomFormatTwoPT
                end
            end
        end
    end
    if menu and DoesUnitExist("reticleover") then
        UnitFrames.ReloadValues("reticleover")
    end

    -- Format Companion Labels
    if UnitFrames.CustomFrames["companion"] then
        if UnitFrames.CustomFrames["companion"][POWERTYPE_HEALTH] then
            if UnitFrames.CustomFrames["companion"][POWERTYPE_HEALTH].label then
                UnitFrames.CustomFrames["companion"][POWERTYPE_HEALTH].label.fmt = UnitFrames.SV.CustomFormatCompanion
            end
        end
    end
    if menu and DoesUnitExist("companion") then
        UnitFrames.ReloadValues("companion")
    end

    -- Format Small Group Labels
    for i = 1, 4 do
        local unitTag = "SmallGroup" .. i
        if UnitFrames.CustomFrames[unitTag] then
            if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH] then
                if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].labelOne then
                    UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].labelOne.fmt = UnitFrames.SV.CustomFormatOneGroup
                end
                if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].labelTwo then
                    UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].labelTwo.fmt = UnitFrames.SV.CustomFormatTwoGroup
                end
            end
        end
        if menu and DoesUnitExist(unitTag) then
            UnitFrames.ReloadValues(unitTag)
        end
    end

    -- Format Raid Labels
    for i = 1, 24 do
        local unitTag = "RaidGroup" .. i
        if UnitFrames.CustomFrames[unitTag] then
            if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH] then
                if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].label then
                    UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].label.fmt = UnitFrames.SV.CustomFormatRaid
                end
            end
        end
        local baseTag = GetGroupUnitTagByIndex(i)
        if menu and DoesUnitExist(baseTag) then
            UnitFrames.ReloadValues(baseTag)
        end
    end

    -- Format Boss Labels
    for i = 1, 6 do
        local unitTag = "boss" .. i
        if UnitFrames.CustomFrames[unitTag] then
            if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH] then
                if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].label then
                    UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].label.fmt = UnitFrames.SV.CustomFormatBoss
                end
            end
        end
        if menu and DoesUnitExist(unitTag) then
            UnitFrames.ReloadValues(unitTag)
        end
    end

    for i = 1, 7 do
        local unitTag = "PetGroup" .. i
        if UnitFrames.CustomFrames[unitTag] then
            if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH] then
                if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].label then
                    UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].label.fmt = UnitFrames.SV.CustomFormatPet
                end
            end
        end
        local baseTag = "playerpet" .. i
        if menu and DoesUnitExist(baseTag) then
            UnitFrames.ReloadValues(baseTag)
        end
    end

end

-- Runs on the EVENT_PLAYER_ACTIVATED listener.
-- This handler fires every time the player is loaded. Used to set initial values.
function UnitFrames.OnPlayerActivated(eventCode)
    -- Reload values for player frames
    UnitFrames.ReloadValues("player")
    UnitFrames.UpdateRegen( "player", STAT_MAGICKA_REGEN_COMBAT, ATTRIBUTE_MAGICKA, POWERTYPE_MAGICKA )
    UnitFrames.UpdateRegen( "player", STAT_STAMINA_REGEN_COMBAT, ATTRIBUTE_STAMINA, POWERTYPE_STAMINA )

    -- Create UI elements for default group members frames
    if g_DefaultFrames.SmallGroup then
        for i = 1, 24 do
            local unitTag = "group" .. i
            if DoesUnitExist(unitTag) then
                UnitFrames.DefaultFramesCreateUnitGroupControls(unitTag)
            end
        end
    end

    -- If CustomFrames are used then values will be reloaded in following function
    if UnitFrames.CustomFrames.SmallGroup1 ~= nil or UnitFrames.CustomFrames.RaidGroup1 ~= nil then
        UnitFrames.CustomFramesGroupUpdate()

    -- Else we need to manually scan and update DefaultFrames
    elseif g_DefaultFrames.SmallGroup then
        for i = 1, 24 do
            local unitTag = "group" .. i
            if DoesUnitExist(unitTag) then
                UnitFrames.ReloadValues(unitTag)
            end
        end
    end

    UnitFrames.OnReticleTargetChanged(nil)
    UnitFrames.OnBossesChanged()
    UnitFrames.OnPlayerCombatState(EVENT_PLAYER_COMBAT_STATE, IsUnitInCombat("player") )
    UnitFrames.CustomFramesGroupAlpha()
    UnitFrames.CustomFramesSetupAlternative()

    -- Apply bar colors here, has to be after player init to get group roles
    UnitFrames.CustomFramesApplyColours(false)
end

-- Runs on the EVENT_POWER_UPDATE listener.
-- This handler fires every time unit attribute changes.
function UnitFrames.OnPowerUpdate(eventCode, unitTag, powerIndex, powerType, powerValue, powerMax, powerEffectiveMax)
    -- Save Health value for future reference -- do it only for tracked unitTags that were defined on initialization
    if powerType == POWERTYPE_HEALTH and g_savedHealth[unitTag] then
        g_savedHealth[unitTag] = { powerValue, powerMax, powerEffectiveMax, g_savedHealth[unitTag][4] or 0 }
    end

    --[[ DEBUG code. Normally should be commented out because it is redundant
    if g_DefaultFrames[unitTag] and g_DefaultFrames[unitTag].unitTag ~= unitTag then
        d("LUIE_DBG DF: " .. tostring(g_DefaultFrames[unitTag].unitTag) .. " ~= " .. tostring(unitTag) )
    end
    if UnitFrames.CustomFrames[unitTag] and UnitFrames.CustomFrames[unitTag].unitTag ~= unitTag then
        d("LUIE_DBG CF: " .. tostring(UnitFrames.CustomFrames[unitTag].unitTag) .. " ~= " .. tostring(unitTag) )
    end
    if g_AvaCustFrames[unitTag] and g_AvaCustFrames[unitTag].unitTag ~= unitTag then
        d("LUIE_DBG AF: " .. tostring(g_AvaCustFrames[unitTag].unitTag) .. " ~= " .. tostring(unitTag) )
    end --]]

    -- Update frames ( if we manually not forbade it )
    if g_DefaultFrames[unitTag] then
        UnitFrames.UpdateAttribute( g_DefaultFrames[unitTag][powerType], powerValue, powerEffectiveMax, (powerType == POWERTYPE_HEALTH) and g_savedHealth[unitTag][4] or nil, eventCode == nil )
    end
    if UnitFrames.CustomFrames[unitTag] then
        if unitTag == "reticleover" and powerType == POWERTYPE_HEALTH then
            local isCritter = ( g_savedHealth.reticleover[3] <= 9 )
            local isGuard = IsUnitInvulnerableGuard("reticleover")
            if (isCritter or isGuard) and powerValue >= 1 then
                return
            else
                UnitFrames.UpdateAttribute( UnitFrames.CustomFrames[unitTag][powerType], powerValue, powerEffectiveMax, (powerType == POWERTYPE_HEALTH) and g_savedHealth[unitTag][4] or nil, eventCode == nil )
            end
        else
            UnitFrames.UpdateAttribute( UnitFrames.CustomFrames[unitTag][powerType], powerValue, powerEffectiveMax, (powerType == POWERTYPE_HEALTH) and g_savedHealth[unitTag][4] or nil, eventCode == nil )
        end
    end
    if g_AvaCustFrames[unitTag] then
        UnitFrames.UpdateAttribute( g_AvaCustFrames[unitTag][powerType], powerValue, powerEffectiveMax, (powerType == POWERTYPE_HEALTH) and g_savedHealth[unitTag][4] or nil, eventCode == nil )
    end

    -- Record state of power loss to change transparency of player frame
    if unitTag == "player" and ( powerType == POWERTYPE_HEALTH or powerType == POWERTYPE_MAGICKA or powerType == POWERTYPE_STAMINA or powerType == POWERTYPE_MOUNT_STAMINA ) then
        g_statFull[powerType] = ( powerValue == powerEffectiveMax )
        UnitFrames.CustomFramesApplyInCombat()
    end

    -- If players powerValue is zero, issue new blinking event on Custom Frames
    if unitTag == "player" and powerValue == 0 and powerType ~= POWERTYPE_WEREWOLF then
        UnitFrames.OnCombatEvent( eventCode, nil, true, nil, nil, nil, nil, COMBAT_UNIT_TYPE_PLAYER, nil, COMBAT_UNIT_TYPE_PLAYER, 0, powerType, nil, false )
    end

    -- Display skull icon for alive execute-level targets
    if unitTag == "reticleover" and
        powerType == POWERTYPE_HEALTH and
        UnitFrames.CustomFrames.reticleover and
        UnitFrames.CustomFrames.reticleover.hostile then

        -- Hide skull when target dies
        if powerValue == 0 then
            UnitFrames.CustomFrames.reticleover.skull:SetHidden( true )
        -- But show for _below_threshold_ level targets
        elseif 100*powerValue/powerEffectiveMax < UnitFrames.CustomFrames.reticleover[POWERTYPE_HEALTH].threshold then
            UnitFrames.CustomFrames.reticleover.skull:SetHidden( false )
        end
    end
end

function UnitFrames.CustomFramesUnreferencePetControl(first)
    local last = 7
    for i = first, last do
        local unitTag =  "PetGroup" .. i
        UnitFrames.CustomFrames[unitTag].unitTag = nil
        UnitFrames.CustomFrames[unitTag].control:SetHidden( true )
    end
end

function UnitFrames.CompanionUpdate()
    if UnitFrames.CustomFrames.companion == nil then
        return
    end
    local unitTag = "companion"
    if DoesUnitExist(unitTag) then
        if UnitFrames.CustomFrames[unitTag] then
            UnitFrames.CustomFrames[unitTag].control:SetHidden ( false )
            UnitFrames.ReloadValues(unitTag)
        end
    else
        UnitFrames.CustomFrames[unitTag].control:SetHidden ( true )
    end
end

function UnitFrames.CustomPetUpdate()
    if UnitFrames.CustomFrames.PetGroup1 == nil then
        return
    end

    local petList = {}

    -- First we query all pet unitTag for existence and save them to local list
    local n = 1 -- counter used to reference custom frames. it always continuous while games unitTag could have gaps
    for i = 1, 7 do
        local unitTag = "playerpet" .. i
        if DoesUnitExist(unitTag) then
            -- Compare whitelist entries and only add this pet to the list if it is whitelisted.
            local unitName = GetUnitName(unitTag)
            local compareWhitelist = string.lower(unitName)
            local addPet
            for k, _ in pairs(UnitFrames.SV.whitelist) do
                k = string.lower(k)
                if compareWhitelist == k then
                    addPet = true
                end
            end
            if addPet then
                table.insert(petList, { ["unitTag"] = unitTag, ["unitName"] = unitName } )
                -- CustomFrames
                n = n + 1
            end
        else
            -- For non-existing unitTags we will remove reference from CustomFrames table
            UnitFrames.CustomFrames[unitTag] = nil
        end
    end

    UnitFrames.CustomFramesUnreferencePetControl(n)

    table.sort ( petList, function(x,y) return x.unitName < y.unitName end )

    local n = 0
    for _, v in ipairs(petList) do
        n = n + 1
        UnitFrames.CustomFrames[v.unitTag] = UnitFrames.CustomFrames["PetGroup" .. n]
        if UnitFrames.CustomFrames[v.unitTag] then
            UnitFrames.CustomFrames[v.unitTag].control:SetHidden ( false )
            UnitFrames.CustomFrames[v.unitTag].unitTag = v.unitTag
            UnitFrames.ReloadValues(v.unitTag)
        end
    end
end


-- Runs on the EVENT_ACTIVE_COMPANION_STATE_CHANGED listener.
function UnitFrames.ActiveCompanionStateChanged(eventCode, newState, oldState)

    if UnitFrames.CustomFrames.companion == nil then
        return
    end

    local unitTag = "companion"
    UnitFrames.CustomFrames[unitTag].control:SetHidden ( true )
    if DoesUnitExist(unitTag) then
        if UnitFrames.CustomFrames[unitTag] then
            UnitFrames.CompanionUpdate()
        end
    end
end

-- Runs on the EVENT_UNIT_CREATED listener.
-- Used to create DefaultFrames UI controls and request delayed CustomFrames group frame update
function UnitFrames.OnUnitCreated(eventCode, unitTag)
    --d( string.format("[%s] OnUnitCreated: %s (%s)", GetTimeString(), unitTag, GetUnitName(unitTag)) )
    -- Create on-fly UI controls for default UI group member and reread his values
    if g_DefaultFrames.SmallGroup then
        UnitFrames.DefaultFramesCreateUnitGroupControls(unitTag)
    end
    -- If CustomFrames are used then values for unitTag will be reloaded in delayed full group update
    if UnitFrames.CustomFrames.SmallGroup1 ~= nil or UnitFrames.CustomFrames.RaidGroup1 ~= nil then
        -- Make sure we do not try to update bars on this unitTag before full group update is complete
        if "group" == string.sub(unitTag, 0, 5) then
            UnitFrames.CustomFrames[unitTag] = nil
        end
        -- We should avoid calling full update on CustomFrames too often
        if not g_PendingUpdate.Group.flag then
            g_PendingUpdate.Group.flag = true
            eventManager:RegisterForUpdate(g_PendingUpdate.Group.name, g_PendingUpdate.Group.delay, UnitFrames.CustomFramesGroupUpdate )
        end
    -- Else we need to manually update this unitTag in g_DefaultFrames
    elseif g_DefaultFrames.SmallGroup then
        UnitFrames.ReloadValues(unitTag)
    end

    if UnitFrames.CustomFrames.PetGroup1 ~= nil then
        if "playerpet" == string.sub(unitTag, 0, 9) then
            UnitFrames.CustomFrames[unitTag] = nil
        end
        UnitFrames.CustomPetUpdate()
    end
end

-- Runs on the EVENT_UNIT_DESTROYED listener.
-- Used to request delayed CustomFrames group frame update
function UnitFrames.OnUnitDestroyed(eventCode, unitTag)
    --d( string.format("[%s] OnUnitDestroyed: %s (%s)", GetTimeString(), unitTag, GetUnitName(unitTag)) )
    -- Make sure we do not try to update bars on this unitTag before full group update is complete
    if "group" == string.sub(unitTag, 0, 5) then
        UnitFrames.CustomFrames[unitTag] = nil
    end
    -- We should avoid calling full update on CustomFrames too often
    if not g_PendingUpdate.Group.flag then
        g_PendingUpdate.Group.flag = true
        eventManager:RegisterForUpdate(g_PendingUpdate.Group.name, g_PendingUpdate.Group.delay, UnitFrames.CustomFramesGroupUpdate )
    end

    if "playerpet" == string.sub(unitTag, 0, 9) then
        UnitFrames.CustomFrames[unitTag] = nil
    end

    if UnitFrames.CustomFrames.PetGroup1 ~= nil then
        UnitFrames.CustomPetUpdate()
    end
end

-- Creates default group unit UI controls on-fly
function UnitFrames.DefaultFramesCreateUnitGroupControls(unitTag)
    -- First make preparation for "groupN" unitTag labels
    if g_DefaultFrames[unitTag] == nil then -- If unitTag is already in our list, then skip this
        if "group" == string.sub(unitTag, 0, 5) then -- If it is really a group member unitTag
            local i = string.sub(unitTag, 6)
            if _G["ZO_GroupUnitFramegroup" .. i] then
                local parentBar     = _G["ZO_GroupUnitFramegroup" .. i .. "Hp"]
                local parentName    = _G["ZO_GroupUnitFramegroup" .. i .. "Name"]
                -- Prepare dimension of regen bar
                local width, height = parentBar:GetDimensions()
                -- Populate UI elements
                g_DefaultFrames[unitTag] = {
                    ["unitTag"] = unitTag,
                    [POWERTYPE_HEALTH] = {
                        label = UI.Label( parentBar, {TOP,BOTTOM}, nil, nil, nil, nil, false ),
                        colour = UnitFrames.SV.DefaultTextColour,
                        shield = UI.StatusBar( parentBar, {BOTTOM,BOTTOM,0,0}, {width-height,height}, {1,0.75,0,0.5}, true ),
                    },
                    ["classIcon"]   = UI.Texture( parentName, {RIGHT,LEFT,-4,2},  {24,24}, nil, nil, true ),
                    ["friendIcon"]  = UI.Texture( parentName, {RIGHT,LEFT,-4,24}, {24,24}, nil, nil, true ),
                }
                -- Apply selected font
                UnitFrames.DefaultFramesApplyFont(unitTag)
            end
        end
    end
end

-- Runs on the EVENT_UNIT_ATTRIBUTE_VISUAL_ADDED listener.
function UnitFrames.OnVisualizationAdded(eventCode, unitTag, unitAttributeVisual, statType, attributeType, powerType, value, maxValue)
    if unitAttributeVisual == ATTRIBUTE_VISUAL_POWER_SHIELDING then
        UnitFrames.UpdateShield(unitTag, value, maxValue)
    elseif unitAttributeVisual == ATTRIBUTE_VISUAL_INCREASED_REGEN_POWER or unitAttributeVisual == ATTRIBUTE_VISUAL_DECREASED_REGEN_POWER then
        UnitFrames.UpdateRegen(unitTag, statType, attributeType, powerType )
    elseif unitAttributeVisual == ATTRIBUTE_VISUAL_INCREASED_STAT or unitAttributeVisual == ATTRIBUTE_VISUAL_DECREASED_STAT then
        UnitFrames.UpdateStat(unitTag, statType, attributeType, powerType )
    end
end

-- Runs on the EVENT_UNIT_ATTRIBUTE_VISUAL_REMOVED listener.
function UnitFrames.OnVisualizationRemoved(eventCode, unitTag, unitAttributeVisual, statType, attributeType, powerType, value, maxValue)
    if unitAttributeVisual == ATTRIBUTE_VISUAL_POWER_SHIELDING then
        UnitFrames.UpdateShield(unitTag, 0, maxValue)
    elseif unitAttributeVisual == ATTRIBUTE_VISUAL_INCREASED_REGEN_POWER or unitAttributeVisual == ATTRIBUTE_VISUAL_DECREASED_REGEN_POWER then
        UnitFrames.UpdateRegen(unitTag, statType, attributeType, powerType )
    elseif unitAttributeVisual == ATTRIBUTE_VISUAL_INCREASED_STAT or unitAttributeVisual == ATTRIBUTE_VISUAL_DECREASED_STAT then
        UnitFrames.UpdateStat(unitTag, statType, attributeType, powerType )
    end
end

-- Runs on the EVENT_UNIT_ATTRIBUTE_VISUAL_UPDATED listener.
function UnitFrames.OnVisualizationUpdated(eventCode, unitTag, unitAttributeVisual, statType, attributeType, powerType, oldValue, newValue, oldMaxValue, newMaxValue)
    if unitAttributeVisual == ATTRIBUTE_VISUAL_POWER_SHIELDING then
        UnitFrames.UpdateShield(unitTag, newValue, newMaxValue)
    elseif unitAttributeVisual == ATTRIBUTE_VISUAL_INCREASED_REGEN_POWER or unitAttributeVisual == ATTRIBUTE_VISUAL_DECREASED_REGEN_POWER then
        UnitFrames.UpdateRegen(unitTag, statType, attributeType, powerType )
    elseif unitAttributeVisual == ATTRIBUTE_VISUAL_INCREASED_STAT or unitAttributeVisual == ATTRIBUTE_VISUAL_DECREASED_STAT then
        UnitFrames.UpdateStat(unitTag, statType, attributeType, powerType )
    end
end

-- Runs on the EVENT_TARGET_CHANGE listener.
-- This handler fires every time the someone target changes.
-- This function is needed in case the player teleports via Way Shrine
function UnitFrames.OnTargetChange(eventCode, unitTag)
    if unitTag ~= "player" then
        return
    end
    UnitFrames.OnReticleTargetChanged(eventCode)
end

function UnitFrames.UpdateDefaultLevelTarget()
    local targetLevel = ZO_TargetUnitFramereticleoverLevel
    local targetChamp = ZO_TargetUnitFramereticleoverChampionIcon
    local targetName = ZO_TargetUnitFramereticleoverName
    local unitLevel
    local isChampion = IsUnitChampion("reticleover")
    if isChampion then
        unitLevel = GetUnitChampionPoints("reticleover")
    else
        unitLevel = GetUnitLevel("reticleover")
    end

    if unitLevel > 0 then
        targetLevel:SetHidden(false)
        targetLevel:SetText(tostring(unitLevel))
        targetName:SetAnchor(TOPLEFT, targetLevel, TOPRIGHT, 10, 0)
    else
        targetLevel:SetHidden(true)
        targetName:SetAnchor(TOPLEFT)
    end

    if isChampion then
        targetChamp:SetHidden(false)
    else
        targetChamp:SetHidden(true)
    end
end

-- Runs on the EVENT_RETICLE_TARGET_CHANGED listener.
-- This handler fires every time the player's reticle target changes.
-- Used to read initial values of target's health and shield.
function UnitFrames.OnReticleTargetChanged(eventCode)
    if DoesUnitExist("reticleover") then
        UnitFrames.ReloadValues( "reticleover" )

        local isWithinRange = IsUnitInGroupSupportRange("reticleover")

        -- Now select appropriate custom colour to target name and (possibly) reticle
        local colour, reticle_colour
        local interactableCheck = false
        local reactionType = GetUnitReaction("reticleover")
        local attackable = IsUnitAttackable("reticleover")
        -- Select colour accordingly to reactionType, attackable and interactable
        if reactionType == UNIT_REACTION_HOSTILE then
            colour = UnitFrames.SV.Target_FontColour_Hostile
            reticle_colour = attackable and UnitFrames.SV.Target_FontColour_Hostile or UnitFrames.SV.Target_FontColour
            interactableCheck = true
        elseif reactionType == UNIT_REACTION_PLAYER_ALLY then
            colour          = UnitFrames.SV.Target_FontColour_FriendlyPlayer
            reticle_colour  = UnitFrames.SV.Target_FontColour_FriendlyPlayer
        elseif attackable and reactionType ~= UNIT_REACTION_HOSTILE then -- those are neutral targets that can become hostile on attack
            colour          = UnitFrames.SV.Target_FontColour
            reticle_colour  = colour
        else
            -- Rest cases are ally/friendly/npc, and with possibly interactable
            colour = ( reactionType == UNIT_REACTION_FRIENDLY or reactionType == UNIT_REACTION_NPC_ALLY ) and UnitFrames.SV.Target_FontColour_FriendlyNPC or UnitFrames.SV.Target_FontColour
            reticle_colour = colour
            interactableCheck = true
        end

        -- Here we need to check if interaction is possible, and then rewrite reticle_colour variable
        if interactableCheck then
            local interactableAction = GetGameCameraInteractableActionInfo()
            -- Action, interactableName, interactionBlocked, isOwned, additionalInfo, context
            if interactableAction ~= nil then
                reticle_colour = UnitFrames.SV.ReticleColour_Interact
            end
        end

        -- Is current target Critter? In Update 6 they all have 9 health
        local isCritter = ( g_savedHealth.reticleover[3] <= 9 )
        local isGuard = IsUnitInvulnerableGuard("reticleover")

        -- Hide custom label on Default Frames for critters.
        if g_DefaultFrames.reticleover[POWERTYPE_HEALTH] then
            g_DefaultFrames.reticleover[POWERTYPE_HEALTH].label:SetHidden( isCritter )
            g_DefaultFrames.reticleover[POWERTYPE_HEALTH].label:SetHidden( isGuard )
        end

        -- Update level display based off our setting for Champion Points
        if g_DefaultFrames.reticleover.isPlayer then
            UnitFrames.UpdateDefaultLevelTarget()
        end

        -- Update colour of default target if requested
        if UnitFrames.SV.TargetColourByReaction then
            g_defaultTargetNameLabel:SetColor( colour[1], colour[2], colour[3], isWithinRange and 1 or 0.5 )
        end
        if UnitFrames.SV.ReticleColourByReaction then
            ZO_ReticleContainerReticle:SetColor(reticle_colour[1], reticle_colour[2], reticle_colour[3] )
        end

        -- And colour of custom target name always. Also change 'labelOne' for critters
        if UnitFrames.CustomFrames.reticleover then
            UnitFrames.CustomFrames.reticleover.hostile = ( reactionType == UNIT_REACTION_HOSTILE ) and UnitFrames.SV.TargetEnableSkull
            UnitFrames.CustomFrames.reticleover.skull:SetHidden( not UnitFrames.CustomFrames.reticleover.hostile or ( g_savedHealth.reticleover[1] == 0 ) or ( 100*g_savedHealth.reticleover[1]/g_savedHealth.reticleover[3] > UnitFrames.CustomFrames.reticleover[POWERTYPE_HEALTH].threshold ) )
            UnitFrames.CustomFrames.reticleover.name:SetColor( colour[1], colour[2], colour[3] )
            UnitFrames.CustomFrames.reticleover.className:SetColor( colour[1], colour[2], colour[3] )
            if isCritter then
                UnitFrames.CustomFrames.reticleover[POWERTYPE_HEALTH].labelOne:SetText( " - Critter - " )
            end
            if isGuard then
                UnitFrames.CustomFrames.reticleover[POWERTYPE_HEALTH].labelOne:SetText( " - Invulnerable - " )
            end
            UnitFrames.CustomFrames.reticleover[POWERTYPE_HEALTH].labelTwo:SetHidden( isCritter or isGuard or not UnitFrames.CustomFrames.reticleover.dead:IsHidden() )

            if IsUnitReincarnating("reticleover") then
                UnitFrames.CustomFramesSetDeadLabel( UnitFrames.CustomFrames["reticleover"], strResSelf )
                eventManager:RegisterForUpdate(moduleName .. "Res" .. "reticleover", 100, function() UnitFrames.ResurrectionMonitor("reticleover") end)
            end

            -- Finally show custom target frame
            UnitFrames.CustomFrames.reticleover.control:SetHidden( false )
        end

        -- Unhide second target frame only for player enemies
        if UnitFrames.CustomFrames.AvaPlayerTarget then
            UnitFrames.CustomFrames.AvaPlayerTarget.control:SetHidden( not ( UnitFrames.CustomFrames.AvaPlayerTarget.isPlayer and (reactionType == UNIT_REACTION_HOSTILE) and not IsUnitDead("reticleover") ) )
        end

        -- Update position of default target class icon
        if UnitFrames.SV.TargetShowClass and g_DefaultFrames.reticleover.isPlayer then
            g_DefaultFrames.reticleover.classIcon:ClearAnchors()
            g_DefaultFrames.reticleover.classIcon:SetAnchor(TOPRIGHT, ZO_TargetUnitFramereticleoverTextArea, TOPLEFT, g_DefaultFrames.reticleover.isChampion and (-32) or (-2), -4)
        else
            g_DefaultFrames.reticleover.classIcon:SetHidden(true)
        end
        -- Instead just make sure it is hidden
        if not UnitFrames.SV.TargetShowFriend or not g_DefaultFrames.reticleover.isPlayer then
            g_DefaultFrames.reticleover.friendIcon:SetHidden(true)
        end

        UnitFrames.CustomFramesApplyReactionColor(g_DefaultFrames.reticleover.isPlayer)

    -- Target is invalid: reset stored values to defaults
    else
        g_savedHealth.reticleover = {1,1,1,0}

        --[[ Removed due to causing custom UI elements to abruptly fade out. Left here in case there is any reason to re-enable.
        if g_DefaultFrames.reticleover[POWERTYPE_HEALTH] then
            g_DefaultFrames.reticleover[POWERTYPE_HEALTH].label:SetHidden(true)
        end
        g_DefaultFrames.reticleover.classIcon:SetHidden(true)
        g_DefaultFrames.reticleover.friendIcon:SetHidden(true)
        ]]--

        -- Hide target frame bars control, LTE will clear buffs and remove then itself, SpellCastBuffs should continue to display ground buffs
        if UnitFrames.CustomFrames.reticleover then
            UnitFrames.CustomFrames.reticleover.hostile = false
            UnitFrames.CustomFrames.reticleover.skull:SetHidden( true )
            UnitFrames.CustomFrames.reticleover.control:SetHidden( true ) --UnitFrames.CustomFrames.reticleover.canHide )
        end
        -- Hide second target frame
        if UnitFrames.CustomFrames.AvaPlayerTarget then
            UnitFrames.CustomFrames.AvaPlayerTarget.control:SetHidden( true ) --UnitFrames.CustomFrames.AvaPlayerTarget.canHide )
        end

        -- Revert back the colour of reticle to white
        if UnitFrames.SV.ReticleColourByReaction then
            ZO_ReticleContainerReticle:SetColor(1, 1, 1)
        end
    end

    -- Finally if user does not want to have default target frame we have to hide it here all the time
    if not g_DefaultFrames.reticleover[POWERTYPE_HEALTH] and UnitFrames.SV.DefaultFramesNewTarget == 1 then
        ZO_TargetUnitFramereticleover:SetHidden( true )
    end
end

-- Runs on the EVENT_DISPOSITION_UPDATE listener.
-- Used to reread parameters of the target
function UnitFrames.OnDispositionUpdate(eventCode, unitTag)
    if unitTag == "reticleover" then
        UnitFrames.OnReticleTargetChanged(eventCode)
    end
end

-- Used to query initial values and display them in corresponding control
function UnitFrames.ReloadValues( unitTag )
    -- Build list of powerTypes this unitTag has in both DefaultFrames and CustomFrames
    local powerTypes = {}
    if g_DefaultFrames[unitTag] then
        for powerType,_ in pairs( g_DefaultFrames[unitTag] ) do
            if type(powerType) == "number" then
                powerTypes[powerType] = true
            end
        end
    end
    if UnitFrames.CustomFrames[unitTag] then
        for powerType,_ in pairs( UnitFrames.CustomFrames[unitTag] ) do
            if type(powerType) == "number" then
                powerTypes[powerType] = true
            end
        end
    end
    if g_AvaCustFrames[unitTag] then
        for powerType,_ in pairs( g_AvaCustFrames[unitTag] ) do
            if type(powerType) == "number" then
                powerTypes[powerType] = true
            end
        end
    end

    -- For all attributes query its value and force updating
    for powerType,_ in pairs(powerTypes) do
        UnitFrames.OnPowerUpdate(nil, unitTag, nil, powerType, GetUnitPower(unitTag, powerType))
    end

    -- Update shield value on controls; this will also update health attribute value, again.
    local shield, _ = GetUnitAttributeVisualizerEffectInfo(unitTag, ATTRIBUTE_VISUAL_POWER_SHIELDING, STAT_MITIGATION, ATTRIBUTE_HEALTH, POWERTYPE_HEALTH)
    UnitFrames.UpdateShield( unitTag, shield or 0, nil )

    -- Now we need to update Name labels, classIcon
    UnitFrames.UpdateStaticControls( g_DefaultFrames[unitTag] )
    UnitFrames.UpdateStaticControls( UnitFrames.CustomFrames[unitTag] )
    UnitFrames.UpdateStaticControls( g_AvaCustFrames[unitTag] )

    -- Get regen/degen values
    UnitFrames.UpdateRegen(unitTag, STAT_HEALTH_REGEN_COMBAT, ATTRIBUTE_HEALTH, POWERTYPE_HEALTH)

    -- Get initial stats
    UnitFrames.UpdateStat(unitTag, STAT_ARMOR_RATING, ATTRIBUTE_HEALTH, POWERTYPE_HEALTH)
    UnitFrames.UpdateStat(unitTag, STAT_POWER, ATTRIBUTE_HEALTH, POWERTYPE_HEALTH)

    if unitTag == "player" then
        g_statFull[POWERTYPE_HEALTH] = ( g_savedHealth.player[1] == g_savedHealth.player[3] )
        UnitFrames.CustomFramesApplyInCombat()
    end
end

-- Helper tables for next function
-- I believe this is mostly deprecated, as we no longer want to show the level of anything but a player target
local HIDE_LEVEL_REACTIONS = {
    [UNIT_REACTION_FRIENDLY] = true,
    [UNIT_REACTION_NPC_ALLY] = true,
}
-- I believe this is mostly deprecated, as we no longer want to show the level of anything but a player target
local HIDE_LEVEL_TYPES = {
    [UNIT_TYPE_SIEGEWEAPON] = true,
    [UNIT_TYPE_INTERACTFIXTURE] = true,
    [UNIT_TYPE_INTERACTOBJ] = true,
    [UNIT_TYPE_SIMPLEINTERACTFIXTURE] = true,
    [UNIT_TYPE_SIMPLEINTERACTOBJ] = true,
}

local function IsGuildMate(unitTag)
    local displayName = GetUnitDisplayName(unitTag)
    if displayName == playerDisplayName then
        return
    end
    for i = 1, GetNumGuilds() do
        local guildId = GetGuildId(i)
        if GetGuildMemberIndexFromDisplayName(guildId, displayName) ~= nil then
            return true
        end
    end
    return false
end

-- Updates text labels, classIcon, etc
function UnitFrames.UpdateStaticControls( unitFrame )
    if unitFrame == nil then
        return
    end

    -- Get the unitTag to determine the method of name display
    local DisplayOption
    if unitFrame.unitTag == "player" then
        DisplayOption = UnitFrames.SV.DisplayOptionsPlayer
    elseif unitFrame.unitTag == "reticleover" then
        DisplayOption = UnitFrames.SV.DisplayOptionsTarget
    else
        DisplayOption = UnitFrames.SV.DisplayOptionsGroupRaid
    end

    unitFrame.isPlayer  = IsUnitPlayer( unitFrame.unitTag )
    unitFrame.isChampion = IsUnitChampion( unitFrame.unitTag )
    unitFrame.isLevelCap = ( GetUnitChampionPoints( unitFrame.unitTag ) == g_MaxChampionPoint  )
    unitFrame.avaRankValue = GetUnitAvARank( unitFrame.unitTag )

    -- First update roleIcon, classIcon and friendIcon, so then we can set maximal length of name label
    if unitFrame.roleIcon ~= nil then
        local role = GetGroupMemberSelectedRole(unitFrame.unitTag)
       -- d (unitFrame.unitTag.." - "..role)
        local unitRole = roleIcons[role]
        unitFrame.roleIcon:SetTexture(unitRole)
    end
    -- If unitFrame has difficulty stars
    if unitFrame.star1 ~= nil and unitFrame.star2 ~= nil and unitFrame.star3 ~= nil then
        local unitDifficulty = GetUnitDifficulty( unitFrame.unitTag )
        unitFrame.star1:SetHidden( unitDifficulty < 2 )
        unitFrame.star2:SetHidden( unitDifficulty < 3 )
        unitFrame.star3:SetHidden( unitDifficulty < 4 )
    end
    -- If unitFrame has unit classIcon control
    if unitFrame.classIcon ~= nil then
        local unitDifficulty = GetUnitDifficulty( unitFrame.unitTag )
        local classIcon = classIcons[GetUnitClassId(unitFrame.unitTag)]
        local showClass = ( unitFrame.isPlayer and classIcon ~= nil ) or ( unitDifficulty > 1 )
        if unitFrame.isPlayer then
            unitFrame.classIcon:SetTexture(classIcon)
        elseif unitDifficulty == 2 then
            unitFrame.classIcon:SetTexture("LuiExtended/media/unitframes/unitframes_level_elite.dds")
        elseif unitDifficulty >= 3 then
            unitFrame.classIcon:SetTexture("LuiExtended/media/unitframes/unitframes_level_elite.dds")
        end
        if unitFrame.unitTag == "player" then
            unitFrame.classIcon:SetHidden( not UnitFrames.SV.PlayerEnableYourname )
        else
            unitFrame.classIcon:SetHidden( not showClass )
        end
    end
    -- unitFrame frame also have a text label for class name: right now only target
    if unitFrame.className then
        local className = GetUnitClass( unitFrame.unitTag )
        local showClass = unitFrame.isPlayer and className ~= nil and UnitFrames.SV.TargetEnableClass
        if showClass then
            unitFrame.className:SetText( className:gsub("%^%a+","") )
        end
        -- this condition is somehow extra, but let keep it to be in consistency with all others
        if unitFrame.unitTag == "player" then
            unitFrame.className:SetHidden( not UnitFrames.SV.PlayerEnableYourname )
        else
            unitFrame.className:SetHidden( not showClass )
        end
    end
    -- If unitFrame has unit classIcon control
    if unitFrame.friendIcon ~= nil then
        local isIgnored = unitFrame.isPlayer and IsUnitIgnored( unitFrame.unitTag )
        local isFriend = unitFrame.isPlayer and IsUnitFriend( unitFrame.unitTag )
        local isGuild = unitFrame.isPlayer and (not isFriend) and (not isIgnored) and IsGuildMate( unitFrame.unitTag )
        if isIgnored or isFriend or isGuild then
            unitFrame.friendIcon:SetTexture( isIgnored and "LuiExtended/media/unitframes/unitframes_social_ignore.dds" or isFriend and "/esoui/art/campaign/campaignbrowser_friends.dds" or "/esoui/art/campaign/campaignbrowser_guild.dds" )
            unitFrame.friendIcon:SetHidden(false)
        else
            unitFrame.friendIcon:SetHidden(true)
        end
    end
    -- If unitFrame has unit name label control
    if unitFrame.name ~= nil then
        -- Update max width of label
        local playerName = LUIE.PlayerNameFormatted
        -- Only apply this formatting to non-group frames
        if unitFrame.name:GetParent() == unitFrame.topInfo and unitFrame.unitTag == "reticleover" then
            local width = unitFrame.topInfo:GetWidth()
            if unitFrame.classIcon then
                width = width - unitFrame.classIcon:GetWidth()
            end
        if unitFrame.isPlayer then
            if unitFrame.friendIcon then
                width = width - unitFrame.friendIcon:GetWidth()
            end
            if unitFrame.level then
                width = width - 2.3 * unitFrame.levelIcon:GetWidth()
            end
        end
            unitFrame.name:SetWidth(width)
        end
        if unitFrame.isPlayer and DisplayOption == 3 then
            unitFrame.name:SetText( GetUnitName( unitFrame.unitTag ) .." ".. GetUnitDisplayName (unitFrame.unitTag) )
        elseif unitFrame.isPlayer and DisplayOption == 1 then
            unitFrame.name:SetText( GetUnitDisplayName (unitFrame.unitTag) )
        else
            unitFrame.name:SetText( GetUnitName( unitFrame.unitTag ) )
        end
    end
    -- If unitFrame has level label control
    if unitFrame.level ~= nil then
        -- Show level for players and non-friendly NPCs
        local showLevel = unitFrame.isPlayer -- or not ( IsUnitInvulnerableGuard( unitFrame.unitTag ) or HIDE_LEVEL_TYPES[GetUnitType( unitFrame.unitTag )] or HIDE_LEVEL_REACTIONS[GetUnitReaction( unitFrame.unitTag )] ) -- No longer need to display level for anything but players
        if showLevel then
            if unitFrame.unitTag == "player" or unitFrame.unitTag == "reticleover" then
                unitFrame.levelIcon:ClearAnchors()
                unitFrame.levelIcon:SetAnchor( LEFT, unitFrame.topInfo, LEFT, unitFrame.name:GetTextWidth()+1, 0 )
            end
            unitFrame.levelIcon:SetTexture( unitFrame.isChampion and "LuiExtended/media/unitframes/unitframes_level_champion.dds" or "LuiExtended/media/unitframes/unitframes_level_normal.dds" )
            -- Level label should be already anchored
            unitFrame.level:SetText( tostring( unitFrame.isChampion and GetUnitChampionPoints( unitFrame.unitTag ) or GetUnitLevel( unitFrame.unitTag ) ) )
        end
        if unitFrame.unitTag == "player" then
            unitFrame.levelIcon:SetHidden( not UnitFrames.SV.PlayerEnableYourname )
            unitFrame.level:SetHidden( not UnitFrames.SV.PlayerEnableYourname )
        else
            unitFrame.levelIcon:SetHidden( not showLevel )
            unitFrame.level:SetHidden( not showLevel )
        end
    end
    local savedTitle
    -- If unitFrame has unit title label control
    if unitFrame.title ~= nil then
        local title = GetUnitCaption(unitFrame.unitTag)
        local option
        local ava
        if unitFrame.isPlayer then
            title = GetUnitTitle(unitFrame.unitTag)
            ava = GetAvARankName( GetUnitGender(unitFrame.unitTag) , unitFrame.avaRankValue )
            if UnitFrames.SV.TargetEnableRank and not UnitFrames.SV.TargetEnableTitle then
                title = (ava ~= "") and ava
            elseif UnitFrames.SV.TargetEnableTitle and not UnitFrames.SV.TargetEnableRank then
                title = (title ~= "") and title
            elseif UnitFrames.SV.TargetEnableTitle and UnitFrames.SV.TargetEnableRank then
                if UnitFrames.SV.TargetTitlePriority == "Title" then
                    title = (title ~= "") and title or (ava ~= "") and ava
                else
                    title = (ava ~= "") and ava or (title ~= "") and title
                end
            end
        end
        title = title or ""
        unitFrame.title:SetText( title:gsub("%^%a+","") )
        if unitFrame.unitTag == "reticleover" then
            unitFrame.title:SetHidden ( not UnitFrames.SV.TargetEnableRank and not UnitFrames.SV.TargetEnableTitle )
        end

        if title == "" then savedTitle = "" end
    end
    -- If unitFrame has unit AVA rank control
    if unitFrame.avaRank ~= nil then
        if unitFrame.isPlayer then
            unitFrame.avaRankIcon:SetTexture( GetAvARankIcon( unitFrame.avaRankValue ) )
            local alliance = GetUnitAlliance( unitFrame.unitTag )
            local colour = GetAllianceColor( alliance )
            unitFrame.avaRankIcon:SetColor( colour.r, colour.g, colour.b )

            if unitFrame.unitTag == "reticleover" and UnitFrames.SV.TargetEnableRankIcon then
                unitFrame.avaRank:SetText( tostring( unitFrame.avaRankValue ) )
                if unitFrame.avaRankValue > 0 then
                    unitFrame.avaRank:SetHidden(false)
                else
                    unitFrame.avaRank:SetHidden(true)
                end
                unitFrame.avaRankIcon:SetHidden(false)
            else
                unitFrame.avaRank:SetHidden(true)
                unitFrame.avaRankIcon:SetHidden(true)
            end
        else
            unitFrame.avaRank:SetHidden(true)
            unitFrame.avaRankIcon:SetHidden(true)
        end
    end
    -- Reanchor buffs if title changes
    if unitFrame.buffs and unitFrame.unitTag == "reticleover" then
        if UnitFrames.SV.PlayerFrameOptions ~= 1 then
            if (not UnitFrames.SV.TargetEnableRank and not UnitFrames.SV.TargetEnableTitle and not UnitFrames.SV.TargetEnableRankIcon) or (savedTitle == "" and not UnitFrames.SV.TargetEnableRankIcon and unitFrame.isPlayer) or (savedTitle == "" and not unitFrame.isPlayer) then
                unitFrame.debuffs:ClearAnchors()
                unitFrame.debuffs:SetAnchor( TOP, unitFrame.control, BOTTOM, 0, 5 )
            else
                unitFrame.debuffs:ClearAnchors()
                unitFrame.debuffs:SetAnchor( TOP, unitFrame.buffAnchor, BOTTOM, 0, 5 )
            end
        else
            if (not UnitFrames.SV.TargetEnableRank and not UnitFrames.SV.TargetEnableTitle and not UnitFrames.SV.TargetEnableRankIcon) or (savedTitle == "" and not UnitFrames.SV.TargetEnableRankIcon and unitFrame.isPlayer) or (savedTitle == "" and not unitFrame.isPlayer) then
                unitFrame.buffs:ClearAnchors()
                unitFrame.buffs:SetAnchor( TOP, unitFrame.control, BOTTOM, 0, 5 )
            else
                unitFrame.buffs:ClearAnchors()
                unitFrame.buffs:SetAnchor( TOP, unitFrame.buffAnchor, BOTTOM, 0, 5 )
            end
        end
    end
    -- If unitFrame has dead/offline indicator, then query its state and act accordingly
    if unitFrame.dead ~= nil then
        if not IsUnitOnline( unitFrame.unitTag ) then
            UnitFrames.OnGroupMemberConnectedStatus( nil, unitFrame.unitTag, false )
        elseif IsUnitDead( unitFrame.unitTag ) then
            UnitFrames.OnDeath( nil, unitFrame.unitTag, true )
        else
            UnitFrames.CustomFramesSetDeadLabel( unitFrame, nil )
        end

    end
    -- Finally set transparency for group frames that has .control field
    if unitFrame.unitTag and "group" == string.sub(unitFrame.unitTag, 0, 5) and unitFrame.control then
        unitFrame.control:SetAlpha( IsUnitInGroupSupportRange(unitFrame.unitTag) and ( UnitFrames.SV.GroupAlpha * 0.01) or ( UnitFrames.SV.GroupAlpha * 0.01) / 2 )
    end
end

function UnitFrames.MenuUpdatePlayerFrameOptions(option)
    if UnitFrames.CustomFrames.reticleover then
        local reticleover = UnitFrames.CustomFrames.reticleover
        if option == 1 then
            reticleover.buffs:ClearAnchors()
            reticleover.debuffs:ClearAnchors()
            reticleover.buffs:SetAnchor(TOP, reticleover.buffAnchor, BOTTOM, 0, 2)
            reticleover.debuffs:SetAnchor(BOTTOM, reticleover.topInfo, TOP, 0, -2)
        else
            reticleover.buffs:ClearAnchors()
            reticleover.debuffs:ClearAnchors()
            reticleover.buffs:SetAnchor(BOTTOM, reticleover.topInfo, TOP, 0, -2)
            reticleover.debuffs:SetAnchor(TOP, reticleover.buffAnchor, BOTTOM, 0, 2)
        end
    end
    UnitFrames.CustomFramesResetPosition(true)
    UnitFrames.CustomFramesSetupAlternative()
    UnitFrames.CustomFramesApplyLayoutPlayer()
end

-- Updates single attribute.
-- Usually called from OnPowerUpdate handler.
function UnitFrames.UpdateAttribute( attributeFrame, powerValue, powerEffectiveMax, shield, forceInit )
    if attributeFrame == nil then
        return
    end

    local pct = math.floor(100*powerValue/powerEffectiveMax)

    -- Update text values for this attribute. can be on up to 3 different labels
    local shield = ( shield and shield > 0 ) and shield or nil

    if (UnitFrames.CustomFrames and UnitFrames.CustomFrames["reticleover"] and attributeFrame == UnitFrames.CustomFrames["reticleover"][POWERTYPE_HEALTH] and IsUnitInvulnerableGuard("reticleover") ) then
        for _, label in pairs( { "label", "labelOne", "labelTwo" } ) do
            if attributeFrame[label] ~= nil then
                attributeFrame[label]:SetColor( unpack( attributeFrame.colour or {1,1,1} ) )
            end
        end
        if attributeFrame.bar ~= nil then
            if UnitFrames.SV.CustomSmoothBar then
                -- Make it twice faster then default UI ones: last argument .085
                ZO_StatusBar_SmoothTransition(attributeFrame.bar, powerValue, powerEffectiveMax, forceInit, nil, 250)
            else
                attributeFrame.bar:SetMinMax(0, powerEffectiveMax)
                attributeFrame.bar:SetValue( powerValue )
            end
        end
    else
        for _, label in pairs( { "label", "labelOne", "labelTwo" } ) do
            if attributeFrame[label] ~= nil then
                -- Format specific to selected label
                local fmt = tostring( attributeFrame[label].fmt or UnitFrames.SV.Format )
                local str = fmt:gsub("Percentage", tostring(pct) )
                    :gsub("Max", AbbreviateNumber(powerEffectiveMax, UnitFrames.SV.ShortenNumbers, true))
                    :gsub("Current", AbbreviateNumber(powerValue, UnitFrames.SV.ShortenNumbers, true))
                    :gsub( "+ Shield", shield and ("+ "..AbbreviateNumber(shield, UnitFrames.SV.ShortenNumbers, true)) or "" )
                    :gsub("Nothing", "")
                -- Change text
                attributeFrame[label]:SetText( str )
                -- Don't update if dead
                if (label == "labelOne" or label == "labelTwo") and UnitFrames.CustomFrames and UnitFrames.CustomFrames["reticleover"] and attributeFrame == UnitFrames.CustomFrames["reticleover"][POWERTYPE_HEALTH] and powerValue == 0 then
                    attributeFrame[label]:SetHidden(true)
                end
                -- And colour it RED if attribute value is lower then threshold
                attributeFrame[label]:SetColor( unpack( ( pct < ( attributeFrame.threshold or g_defaultThreshold ) ) and {1,0.25,0.38} or attributeFrame.colour or {1,1,1} ) )
            end
        end

        -- If attribute has also custom statusBar, update its value
        if attributeFrame.bar ~= nil then
            if UnitFrames.SV.CustomSmoothBar then
                -- Make it twice faster then default UI ones: last argument .085
                ZO_StatusBar_SmoothTransition(attributeFrame.bar, powerValue, powerEffectiveMax, forceInit, nil, 250)
            else
                attributeFrame.bar:SetMinMax(0, powerEffectiveMax)
                attributeFrame.bar:SetValue( powerValue )
            end
        end
    end
end

-- Updates title for unit if changed, and also re-anchors buffs or toggles display on/off if the unitTag had no title selected previously
-- Called from EVENT_TITLE_UPDATE & EVENT_RANK_POINT_UPDATE
function UnitFrames.TitleUpdate( eventCode, unitTag )
    -- No need to update title for anything but reticleover target
    if unitTag ~= "reticleover" then return end
    UnitFrames.UpdateStaticControls( g_DefaultFrames[unitTag] )
    UnitFrames.UpdateStaticControls( UnitFrames.CustomFrames[unitTag] )
    UnitFrames.UpdateStaticControls( g_AvaCustFrames[unitTag] )
end

-- Updates shield value for given unit.
-- Called from EVENT_UNIT_ATTRIBUTE_VISUAL_* listeners.
function UnitFrames.UpdateShield( unitTag, value, maxValue )
    if g_savedHealth[unitTag] == nil then
        --d( "LUIE DEBUG: Stored health is nil: ", unitTag )
        return
    end

    g_savedHealth[unitTag][4] = value

    local healthValue, _ , healthEffectiveMax, _ = unpack(g_savedHealth[unitTag])
    -- Update frames
    if g_DefaultFrames[unitTag] then
        UnitFrames.UpdateAttribute( g_DefaultFrames[unitTag][POWERTYPE_HEALTH], healthValue, healthEffectiveMax, value, false )
        UnitFrames.UpdateShieldBar( g_DefaultFrames[unitTag][POWERTYPE_HEALTH], value, healthEffectiveMax )
    end
    if UnitFrames.CustomFrames[unitTag] then
        UnitFrames.UpdateAttribute( UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH], healthValue, healthEffectiveMax, value, false )
        UnitFrames.UpdateShieldBar( UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH], value, healthEffectiveMax )
    end
    if g_AvaCustFrames[unitTag] then
        UnitFrames.UpdateAttribute( g_AvaCustFrames[unitTag][POWERTYPE_HEALTH], healthValue, healthEffectiveMax, value, false )
        UnitFrames.UpdateShieldBar( g_AvaCustFrames[unitTag][POWERTYPE_HEALTH], value, healthEffectiveMax )
    end
end

-- Here actual update of shield bar on attribute is done
function UnitFrames.UpdateShieldBar( attributeFrame, shieldValue, healthEffectiveMax)
    if attributeFrame == nil or attributeFrame.shield == nil then
        return
    end

    local hideShield = not (shieldValue > 0)

    if hideShield then
        attributeFrame.shield:SetValue(0)
    else
        if UnitFrames.SV.CustomSmoothBar then
            -- Make it twice faster then default UI ones: last argument .085
            ZO_StatusBar_SmoothTransition(attributeFrame.shield, shieldValue, healthEffectiveMax, false, nil, 250)
        else
            attributeFrame.shield:SetMinMax(0, healthEffectiveMax)
            attributeFrame.shield:SetValue( shieldValue )
        end
    end

    attributeFrame.shield:SetHidden(hideShield)
    if attributeFrame.shieldbackdrop then
        attributeFrame.shieldbackdrop:SetHidden(hideShield)
    end
end

-- Reroutes call for regen/degen animation for given unit.
-- Called from EVENT_UNIT_ATTRIBUTE_VISUAL_* listeners.
function UnitFrames.UpdateRegen(unitTag, statType, attributeType, powerType )
    if powerType ~= POWERTYPE_HEALTH then return end

    -- Calculate actual value, and fallback to 0 if we call this function with nil parameters
    local value1 = (GetUnitAttributeVisualizerEffectInfo(unitTag, ATTRIBUTE_VISUAL_INCREASED_REGEN_POWER, statType, attributeType, powerType) or 0)
    local value2 = (GetUnitAttributeVisualizerEffectInfo(unitTag, ATTRIBUTE_VISUAL_DECREASED_REGEN_POWER, statType, attributeType, powerType) or 0)
    if value1 < 0 then value1 = 1 end
    if value2 > 0 then value2 = -1 end
    local value = value1 + value2

    -- Here we assume, that every unitTag entry in tables has POWERTYPE_HEALTH key
    if g_DefaultFrames[unitTag] and g_DefaultFrames[unitTag][POWERTYPE_HEALTH] then
        UnitFrames.DisplayRegen( g_DefaultFrames[unitTag][POWERTYPE_HEALTH].regen1, value > 0 )
        UnitFrames.DisplayRegen( g_DefaultFrames[unitTag][POWERTYPE_HEALTH].regen2, value > 0 )
        UnitFrames.DisplayRegen( g_DefaultFrames[unitTag][POWERTYPE_HEALTH].degen1, value < 0 )
        UnitFrames.DisplayRegen( g_DefaultFrames[unitTag][POWERTYPE_HEALTH].degen2, value < 0 )
    end
    if UnitFrames.CustomFrames[unitTag] and UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH] then
        UnitFrames.DisplayRegen( UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].regen1, value > 0 )
        UnitFrames.DisplayRegen( UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].regen2, value > 0 )
        UnitFrames.DisplayRegen( UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].degen1, value < 0 )
        UnitFrames.DisplayRegen( UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].degen2, value < 0 )
    end
    if g_AvaCustFrames[unitTag] and g_AvaCustFrames[unitTag][POWERTYPE_HEALTH] then
        UnitFrames.DisplayRegen( g_AvaCustFrames[unitTag][POWERTYPE_HEALTH].regen1, value > 0 )
        UnitFrames.DisplayRegen( g_AvaCustFrames[unitTag][POWERTYPE_HEALTH].regen2, value > 0 )
        UnitFrames.DisplayRegen( g_AvaCustFrames[unitTag][POWERTYPE_HEALTH].degen1, value < 0 )
        UnitFrames.DisplayRegen( g_AvaCustFrames[unitTag][POWERTYPE_HEALTH].degen2, value < 0 )
    end
end

-- Performs actual display of animation control if any
function UnitFrames.DisplayRegen( control, isShown )
    if control == nil then
        return
    end

    control:SetHidden( not isShown )
    if isShown then
        -- We restart the animation here only if its not already playing (prevents sharp fades mid-animation)
        if control.animation:IsPlaying() then
            return
        end
        control.timeline:SetPlaybackType(ANIMATION_PLAYBACK_LOOP, LOOP_INDEFINITELY)
        control.timeline:PlayFromStart()
    else
        control.timeline:SetPlaybackLoopsRemaining(0)
    end
end

-- Updates decreasedArmor texture for given unit.
-- While this applicable only to custom frames, we do not need to split this function into 2 different ones
-- Called from EVENT_UNIT_ATTRIBUTE_VISUAL_* listeners.
function UnitFrames.UpdateStat(unitTag, statType, attributeType, powerType )
    -- Build a list of UI controls to hold this statType on different UnitFrames lists
    local statControls = {}

    if ( UnitFrames.CustomFrames[unitTag] and UnitFrames.CustomFrames[unitTag][powerType] and UnitFrames.CustomFrames[unitTag][powerType].stat and UnitFrames.CustomFrames[unitTag][powerType].stat[statType] ) then
        table.insert(statControls, UnitFrames.CustomFrames[unitTag][powerType].stat[statType])
    end
    if ( g_AvaCustFrames[unitTag] and g_AvaCustFrames[unitTag][powerType] and g_AvaCustFrames[unitTag][powerType].stat and g_AvaCustFrames[unitTag][powerType].stat[statType] ) then
        table.insert(statControls, g_AvaCustFrames[unitTag][powerType].stat[statType])
    end

    -- If we have a control, proceed next
    if #statControls > 0 then
        -- Calculate actual value, and fallback to 0 if we call this function with nil parameters
        local value = (GetUnitAttributeVisualizerEffectInfo(unitTag, ATTRIBUTE_VISUAL_INCREASED_STAT, statType, attributeType, powerType) or 0)
                    + (GetUnitAttributeVisualizerEffectInfo(unitTag, ATTRIBUTE_VISUAL_DECREASED_STAT, statType, attributeType, powerType) or 0)

        for _, control in pairs(statControls) do
            -- Hide proper controls if they exist
            if control.dec then
                control.dec:SetHidden( value >= 0 )
            end
            if control.inc then
                control.inc:SetHidden( value <= 0 )
            end
        end
    end
end

-- Forces to reload static information on unit frames.
-- Called from EVENT_LEVEL_UPDATE and EVENT_VETERAN_RANK_UPDATE listeners.
function UnitFrames.OnLevelUpdate(eventCode, unitTag, level)
    UnitFrames.UpdateStaticControls( g_DefaultFrames[unitTag] )
    UnitFrames.UpdateStaticControls( UnitFrames.CustomFrames[unitTag] )
    UnitFrames.UpdateStaticControls( g_AvaCustFrames[unitTag] )

    -- For Custom Player Frame we have to setup experience bar
    if unitTag == "player" and UnitFrames.CustomFrames.player and UnitFrames.CustomFrames.player.Experience then
        UnitFrames.CustomFramesSetupAlternative()
    end
end

-- Runs on the EVENT_PLAYER_COMBAT_STATE listener.
-- This handler fires every time player enters or leaves combat
function UnitFrames.OnPlayerCombatState(eventCode, inCombat)
    g_statFull.combat = not inCombat
    UnitFrames.CustomFramesApplyInCombat()
end

-- Runs on the EVENT_WEREWOLF_STATE_CHANGED listener.
function UnitFrames.OnWerewolf(eventCode, werewolf)
    UnitFrames.CustomFramesSetupAlternative( werewolf, false, false )
end

-- Runs on the EVENT_BEGIN_SIEGE_CONTROL, EVENT_END_SIEGE_CONTROL, EVENT_LEAVE_RAM_ESCORT listeners.
function UnitFrames.OnSiege(eventCode)
    UnitFrames.CustomFramesSetupAlternative( false, nil, false )
end

-- Runs on the EVENT_MOUNTED_STATE_CHANGED listener.
function UnitFrames.OnMount(eventCode, mounted)
    UnitFrames.CustomFramesSetupAlternative( IsWerewolf(), false, mounted )
end

-- Runs on the EVENT_EXPERIENCE_UPDATE listener.
function UnitFrames.OnXPUpdate( eventCode, unitTag, currentExp, maxExp, reason )
    if unitTag ~= "player" or not UnitFrames.CustomFrames.player then
        return
    end
    if UnitFrames.CustomFrames.player.isChampion then
        -- Query for Veteran and Champion XP not more then once every 5 seconds
        if not g_PendingUpdate.VeteranXP.flag then
            g_PendingUpdate.VeteranXP.flag = true
            eventManager:RegisterForUpdate( g_PendingUpdate.VeteranXP.name, g_PendingUpdate.VeteranXP.delay, UnitFrames.UpdateVeteranXP )
        end
    elseif UnitFrames.CustomFrames.player.Experience then
        UnitFrames.CustomFrames.player.Experience.bar:SetValue( currentExp )
    end
end

-- Helper function that updates Champion XP bar. Called from event listener with 5 sec delay
function UnitFrames.UpdateVeteranXP()
    -- Unregister update function
    eventManager:UnregisterForUpdate( g_PendingUpdate.VeteranXP.name )

    if UnitFrames.CustomFrames.player then
        if UnitFrames.CustomFrames.player.Experience then
            UnitFrames.CustomFrames.player.Experience.bar:SetValue( GetUnitChampionPoints("player") )
        elseif UnitFrames.CustomFrames.player.ChampionXP then
            local enlightenedPool = 4 * GetEnlightenedPool()
            local xp = GetPlayerChampionXP()
            local maxBar = GetNumChampionXPInChampionPoint(GetPlayerChampionPointsEarned())
            -- If Champion Points are maxed out then fill the bar all the way up.
            if maxBar == nil then
                maxBar = xp
            end
            local enlightenedBar = enlightenedPool + xp
            if enlightenedBar > maxBar then enlightenedBar = maxBar end -- If the enlightenment pool extends past the current level then cap it at the maximum bar value.

            UnitFrames.CustomFrames.player.ChampionXP.bar:SetValue( xp )
            UnitFrames.CustomFrames.player.ChampionXP.enlightenment:SetValue( enlightenedBar )
        end
    end
    -- Clear local flag
    g_PendingUpdate.VeteranXP.flag = false
end

-- Runs on the EVENT_GROUP_SUPPORT_RANGE_UPDATE listener.
function UnitFrames.OnGroupSupportRangeUpdate(eventCode, unitTag, status)
    if UnitFrames.CustomFrames[unitTag] and UnitFrames.CustomFrames[unitTag].control then
        UnitFrames.CustomFrames[unitTag].control:SetAlpha( status and ( UnitFrames.SV.GroupAlpha * 0.01) or ( UnitFrames.SV.GroupAlpha * 0.01) / 2 )
    end
end

-- Runs on the EVENT_GROUP_MEMBER_CONNECTED_STATUS listener.
function UnitFrames.OnGroupMemberConnectedStatus(eventCode, unitTag, isOnline)
    --d( string.format("DC: %s - %s", unitTag, isOnline and "Online" or "Offline" ) )
    if UnitFrames.CustomFrames[unitTag] and UnitFrames.CustomFrames[unitTag].dead then
        UnitFrames.CustomFramesSetDeadLabel( UnitFrames.CustomFrames[unitTag], isOnline and nil or strOffline )
    end
    if isOnline and (UnitFrames.SV.ColorRoleGroup or UnitFrames.SV.ColorRoleRaid) then
        UnitFrames.CustomFramesApplyColours(false)
    end
end

function UnitFrames.OnGroupMemberRoleChange(eventCode, unitTag, dps, healer, tank)
    if UnitFrames.CustomFrames[unitTag] then
        if (UnitFrames.SV.ColorRoleGroup or UnitFrames.SV.ColorRoleRaid) then
            UnitFrames.CustomFramesApplyColoursSingle(unitTag)
        end
        UnitFrames.ReloadValues(unitTag)
        UnitFrames.CustomFramesApplyLayoutGroup(false)
        UnitFrames.CustomFramesApplyLayoutRaid(false)
    end
end

function UnitFrames.OnGroupMemberChange(eventCode, memberName)
    zo_callLater(function() UnitFrames.CustomFramesApplyColours(false) end, 200)
end

-- Runs on the EVENT_UNIT_DEATH_STATE_CHANGED listener.
-- This handler fires every time a valid unitTag dies or is resurrected
function UnitFrames.OnDeath(eventCode, unitTag, isDead)
    --d( string.format("%s - %s", unitTag, isDead and "Dead" or "Alive" ) )
    if UnitFrames.CustomFrames[unitTag] and UnitFrames.CustomFrames[unitTag].dead then
        UnitFrames.ResurrectionMonitor(unitTag)
    end

    -- Manually hide regen/degen animation as well as stat-changing icons, because game does not always issue corresponding event before unit is dead
    if isDead and UnitFrames.CustomFrames[unitTag] and UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH] then
        local thb = UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH] -- not a backdrop
        -- 1. Regen/degen
        UnitFrames.DisplayRegen( thb.regen1, false )
        UnitFrames.DisplayRegen( thb.regen2, false )
        UnitFrames.DisplayRegen( thb.degen1, false )
        UnitFrames.DisplayRegen( thb.degen2, false )
        -- 2. Stats
        if thb.stat then
            for _, statControls in pairs( thb.stat ) do
                if statControls.dec then
                    statControls.dec:SetHidden( true )
                end
                if statControls.inc then
                    statControls.inc:SetHidden( true )
                end
            end
        end
    end
end

function UnitFrames.ResurrectionMonitor(unitTag)
    eventManager:UnregisterForUpdate(moduleName .. "Res" .. unitTag)

    -- Check to make sure this unit exists & the custom frame exists
    if not DoesUnitExist(unitTag) then return end
    --if not ZO_Group_IsGroupUnitTag(unitTag) then return end
    if not UnitFrames.CustomFrames[unitTag] then return end

    if IsUnitDead(unitTag) then
        if IsUnitBeingResurrected(unitTag) then
            UnitFrames.CustomFramesSetDeadLabel( UnitFrames.CustomFrames[unitTag], g_isRaid and strResCastRaid or strResCast )
        elseif DoesUnitHaveResurrectPending(unitTag) then
            UnitFrames.CustomFramesSetDeadLabel( UnitFrames.CustomFrames[unitTag], g_isRaid and strResPendingRaid or strResPending )
        else
            UnitFrames.CustomFramesSetDeadLabel( UnitFrames.CustomFrames[unitTag], strDead )
        end
        eventManager:RegisterForUpdate(moduleName .. "Res" .. unitTag, 100, function() UnitFrames.ResurrectionMonitor(unitTag) end)
    elseif IsUnitReincarnating(unitTag) then
        UnitFrames.CustomFramesSetDeadLabel( UnitFrames.CustomFrames[unitTag], strResSelf )
        eventManager:RegisterForUpdate(moduleName .. "Res" .. unitTag, 100, function() UnitFrames.ResurrectionMonitor(unitTag) end)
    else
        UnitFrames.CustomFramesSetDeadLabel( UnitFrames.CustomFrames[unitTag], nil )
    end

end

-- Runs on the EVENT_LEADER_UPDATE listener.
function UnitFrames.OnLeaderUpdate(eventCode, leaderTag)
    UnitFrames.CustomFramesApplyLayoutGroup(false)
    UnitFrames.CustomFramesApplyLayoutRaid(false)
end

-- This function is used to setup alternative bar for player
-- Priority order: Werewolf -> Siege -> Mount -> ChampionXP / Experience
local XP_BAR_COLOURS = ZO_XP_BAR_GRADIENT_COLORS[2]
function UnitFrames.CustomFramesSetupAlternative( isWerewolf, isSiege, isMounted )
    if not UnitFrames.CustomFrames.player then
        return
    end
    -- If any of input parameters are nil, we need to query them
    if isWerewolf == nil then
        isWerewolf = IsWerewolf()
    end
    if isSiege == nil then
        isSiege = ( IsPlayerControllingSiegeWeapon() or IsPlayerEscortingRam() )
    end
    if isMounted == nil then
        isMounted = IsMounted()
    end

    local center, colour, icon
    local hidden = false
    local right = false
    local left = false
    local recenter = false

    local phb = UnitFrames.CustomFrames.player[POWERTYPE_HEALTH] -- Not a backdrop
    local pmb = UnitFrames.CustomFrames.player[POWERTYPE_MAGICKA] -- Not a backdrop
    local psb = UnitFrames.CustomFrames.player[POWERTYPE_STAMINA] -- Not a backdrop
    local alt = UnitFrames.CustomFrames.player.alternative

    if UnitFrames.SV.PlayerEnableAltbarMSW and isWerewolf then
        icon    = "LuiExtended/media/unitframes/unitframes_bar_werewolf.dds"
        center  = { 0.05, 0, 0, 0.9 }
        colour  = { 0.8,  0, 0, 0.9 }

        UnitFrames.CustomFrames.player[POWERTYPE_WEREWOLF] = UnitFrames.CustomFrames.player.alternative
        UnitFrames.CustomFrames.controlledsiege[POWERTYPE_HEALTH] = nil
        UnitFrames.CustomFrames.player[POWERTYPE_MOUNT_STAMINA] = nil
        UnitFrames.CustomFrames.player.ChampionXP = nil
        UnitFrames.CustomFrames.player.Experience = nil

        UnitFrames.OnPowerUpdate(nil, "player", nil, POWERTYPE_WEREWOLF, GetUnitPower("player", POWERTYPE_WEREWOLF))

        if UnitFrames.SV.PlayerFrameOptions ~= 1 then
            if UnitFrames.SV.ReverseResourceBars then
                right = true
            else
                left = true
            end
        else
            recenter = true
        end

        UnitFrames.CustomFrames.player.alternative.bar:SetMouseEnabled( true )
        UnitFrames.CustomFrames.player.alternative.bar:SetHandler("OnMouseEnter", UnitFrames.AltBar_OnMouseEnterWerewolf)
        UnitFrames.CustomFrames.player.alternative.bar:SetHandler("OnMouseExit",  UnitFrames.AltBar_OnMouseExit)
        UnitFrames.CustomFrames.player.alternative.enlightenment:SetHidden( true )
    elseif UnitFrames.SV.PlayerEnableAltbarMSW and isSiege then
        icon    = "LuiExtended/media/unitframes/unitframes_bar_siege.dds"
        center  = { 0.05, 0, 0, 0.9 }
        colour  = { 0.8,  0, 0, 0.9 }

        UnitFrames.CustomFrames.player[POWERTYPE_WEREWOLF] = nil
        UnitFrames.CustomFrames.controlledsiege[POWERTYPE_HEALTH] = UnitFrames.CustomFrames.player.alternative
        UnitFrames.CustomFrames.player[POWERTYPE_MOUNT_STAMINA] = nil
        UnitFrames.CustomFrames.player.ChampionXP = nil
        UnitFrames.CustomFrames.player.Experience = nil

        UnitFrames.OnPowerUpdate(nil, "controlledsiege", nil, POWERTYPE_HEALTH, GetUnitPower("controlledsiege", POWERTYPE_HEALTH))

        recenter = true

        UnitFrames.CustomFrames.player.alternative.bar:SetMouseEnabled( true )
        UnitFrames.CustomFrames.player.alternative.bar:SetHandler("OnMouseEnter", UnitFrames.AltBar_OnMouseEnterSiege)
        UnitFrames.CustomFrames.player.alternative.bar:SetHandler("OnMouseExit",  UnitFrames.AltBar_OnMouseExit)
        UnitFrames.CustomFrames.player.alternative.enlightenment:SetHidden( true )
    elseif UnitFrames.SV.PlayerEnableAltbarMSW and isMounted then
        icon    = "LuiExtended/media/unitframes/unitframes_bar_mount.dds"
        center  = { 0.1*UnitFrames.SV.CustomColourStamina[1], 0.1*UnitFrames.SV.CustomColourStamina[2], 0.1*UnitFrames.SV.CustomColourStamina[3], 0.9 }
        colour  = { UnitFrames.SV.CustomColourStamina[1], UnitFrames.SV.CustomColourStamina[2], UnitFrames.SV.CustomColourStamina[3], 0.9 }

        UnitFrames.CustomFrames.player[POWERTYPE_WEREWOLF] = nil
        UnitFrames.CustomFrames.controlledsiege[POWERTYPE_HEALTH] = nil
        UnitFrames.CustomFrames.player[POWERTYPE_MOUNT_STAMINA] = UnitFrames.CustomFrames.player.alternative
        UnitFrames.CustomFrames.player.ChampionXP = nil
        UnitFrames.CustomFrames.player.Experience = nil

        UnitFrames.OnPowerUpdate(nil, "player", nil, POWERTYPE_MOUNT_STAMINA, GetUnitPower("player", POWERTYPE_MOUNT_STAMINA))

        if UnitFrames.SV.PlayerFrameOptions ~= 1 then
            if UnitFrames.SV.ReverseResourceBars then
                left = true
            else
                right = true
            end
        else
            recenter = true
        end

        UnitFrames.CustomFrames.player.alternative.bar:SetMouseEnabled( true )
        UnitFrames.CustomFrames.player.alternative.bar:SetHandler("OnMouseEnter", UnitFrames.AltBar_OnMouseEnterMounted)
        UnitFrames.CustomFrames.player.alternative.bar:SetHandler("OnMouseExit",  UnitFrames.AltBar_OnMouseExit)
        UnitFrames.CustomFrames.player.alternative.enlightenment:SetHidden( true )
    elseif UnitFrames.SV.PlayerEnableAltbarXP and ( UnitFrames.CustomFrames.player.isLevelCap or ( UnitFrames.CustomFrames.player.isChampion )) then
        UnitFrames.CustomFrames.player[POWERTYPE_WEREWOLF] = nil
        UnitFrames.CustomFrames.controlledsiege[POWERTYPE_HEALTH] = nil
        UnitFrames.CustomFrames.player[POWERTYPE_MOUNT_STAMINA] = nil
        UnitFrames.CustomFrames.player.ChampionXP = UnitFrames.CustomFrames.player.alternative
        UnitFrames.CustomFrames.player.Experience = nil

        UnitFrames.OnChampionPointGained() -- Setup bar colour and proper icon

        local enlightenedPool = 4 * GetEnlightenedPool()
        local xp = GetPlayerChampionXP()
        local maxBar = GetNumChampionXPInChampionPoint(GetPlayerChampionPointsEarned())
        -- If Champion Points are maxed out then fill the bar all the way up.
        if maxBar == nil then
            maxBar = xp
        end
        local enlightenedBar = enlightenedPool + xp
        if enlightenedBar > maxBar then enlightenedBar = maxBar end -- If the enlightenment pool extends past the current level then cap it at the maximum bar value.

        UnitFrames.CustomFrames.player.ChampionXP.enlightenment:SetMinMax( 0 , maxBar)
        UnitFrames.CustomFrames.player.ChampionXP.enlightenment:SetValue( enlightenedBar )

        UnitFrames.CustomFrames.player.ChampionXP.bar:SetMinMax( 0 , maxBar)
        UnitFrames.CustomFrames.player.ChampionXP.bar:SetValue( xp )

        recenter = true

        UnitFrames.CustomFrames.player.alternative.bar:SetMouseEnabled( true )
        UnitFrames.CustomFrames.player.alternative.bar:SetHandler("OnMouseEnter", UnitFrames.AltBar_OnMouseEnterXP)
        UnitFrames.CustomFrames.player.alternative.bar:SetHandler("OnMouseExit",  UnitFrames.AltBar_OnMouseExit)
        UnitFrames.CustomFrames.player.alternative.enlightenment:SetHidden( false )
    elseif UnitFrames.SV.PlayerEnableAltbarXP then
        icon    = "LuiExtended/media/unitframes/unitframes_level_normal.dds"
        center  = { 0, 0.1, 0.1, 0.9 }
        colour  = { XP_BAR_COLOURS.r, XP_BAR_COLOURS.g, XP_BAR_COLOURS.b, 0.9 } -- { 0, 0.9, 0.9, 0.9 }

        UnitFrames.CustomFrames.player[POWERTYPE_WEREWOLF] = nil
        UnitFrames.CustomFrames.controlledsiege[POWERTYPE_HEALTH] = nil
        UnitFrames.CustomFrames.player[POWERTYPE_MOUNT_STAMINA] = nil
        UnitFrames.CustomFrames.player.ChampionXP = nil
        UnitFrames.CustomFrames.player.Experience = UnitFrames.CustomFrames.player.alternative

        local championXP = GetNumChampionXPInChampionPoint(GetPlayerChampionPointsEarned())
        if championXP == nil then
            championXP = GetPlayerChampionXP()
        end
        UnitFrames.CustomFrames.player.Experience.bar:SetMinMax( 0 , UnitFrames.CustomFrames.player.isChampion and championXP or GetUnitXPMax("player") )
        UnitFrames.CustomFrames.player.Experience.bar:SetValue( UnitFrames.CustomFrames.player.isChampion and GetPlayerChampionXP() or GetUnitXP("player") )

        recenter = true
    -- Otherwise bar should be hidden and no tracking be done

        UnitFrames.CustomFrames.player.alternative.bar:SetMouseEnabled( true )
        UnitFrames.CustomFrames.player.alternative.bar:SetHandler("OnMouseEnter", UnitFrames.AltBar_OnMouseEnterXP)
        UnitFrames.CustomFrames.player.alternative.bar:SetHandler("OnMouseExit",  UnitFrames.AltBar_OnMouseExit)
        UnitFrames.CustomFrames.player.alternative.enlightenment:SetHidden( true )
    else
        UnitFrames.CustomFrames.player[POWERTYPE_WEREWOLF] = nil
        UnitFrames.CustomFrames.controlledsiege[POWERTYPE_HEALTH] = nil
        UnitFrames.CustomFrames.player[POWERTYPE_MOUNT_STAMINA] = nil
        UnitFrames.CustomFrames.player.ChampionXP = nil
        UnitFrames.CustomFrames.player.Experience = nil

        hidden = true
        UnitFrames.CustomFrames.player.alternative.bar:SetMouseEnabled( false )
        UnitFrames.CustomFrames.player.alternative.enlightenment:SetHidden( true )
    end

    -- Setup of bar colours and icon
    if center then
        UnitFrames.CustomFrames.player.alternative.backdrop:SetCenterColor( unpack(center) )
    end
    if colour then
        UnitFrames.CustomFrames.player.alternative.bar:SetColor( unpack(colour) )
    end
    if icon then
        UnitFrames.CustomFrames.player.alternative.icon:SetTexture( icon )
    end

    local altW = math.ceil(UnitFrames.SV.PlayerBarWidth * 2/3)
    local padding = alt.icon:GetWidth()
    -- Hide bar and reanchor buffs
    UnitFrames.CustomFrames.player.botInfo:SetHidden( hidden )
    UnitFrames.CustomFrames.player.buffAnchor:SetHidden( hidden )
    UnitFrames.CustomFrames.player.buffs:ClearAnchors()
    if UnitFrames.SV.PlayerFrameOptions == 3 then
        if UnitFrames.SV.HideBarMagicka and UnitFrames.SV.HideBarStamina then
            UnitFrames.CustomFrames.player.buffs:SetAnchor( TOP, hidden and UnitFrames.CustomFrames.player.control or UnitFrames.CustomFrames.player.buffAnchor, BOTTOM, 0, 5 )
        else
            UnitFrames.CustomFrames.player.buffs:SetAnchor( TOP, hidden and UnitFrames.CustomFrames.player.control or UnitFrames.CustomFrames.player.buffAnchor, BOTTOM, 0, 5 + UnitFrames.SV.PlayerBarHeightStamina + UnitFrames.SV.PlayerBarSpacing )
        end
    else
        UnitFrames.CustomFrames.player.buffs:SetAnchor( TOP, hidden and UnitFrames.CustomFrames.player.control or UnitFrames.CustomFrames.player.buffAnchor, BOTTOM, 0, 5 )
    end
    if right then
        if UnitFrames.SV.HideBarStamina or UnitFrames.SV.HideBarMagicka then
            UnitFrames.CustomFrames.player.botInfo:SetAnchor(TOP, phb.backdrop, BOTTOM, 0, 2 )
            alt.backdrop:ClearAnchors()
            alt.backdrop:SetAnchor( CENTER, UnitFrames.CustomFrames.player.botInfo, CENTER, padding * .5 +1, 0)
            alt.backdrop:SetWidth(altW)
            alt.icon:ClearAnchors()
            alt.icon:SetAnchor (RIGHT, alt.backdrop, LEFT,-2,0)
        else
            if UnitFrames.SV.ReverseResourceBars then
                UnitFrames.CustomFrames.player.botInfo:SetAnchor(TOP, pmb.backdrop, BOTTOM, 0, 2 )
            else
                UnitFrames.CustomFrames.player.botInfo:SetAnchor(TOP, psb.backdrop, BOTTOM, 0, 2 )
            end
            alt.backdrop:ClearAnchors()
            alt.backdrop:SetAnchor( LEFT, UnitFrames.CustomFrames.player.botInfo, LEFT, padding + 5, 0)
            alt.backdrop:SetWidth(altW)
            alt.icon:ClearAnchors()
            alt.icon:SetAnchor (RIGHT, alt.backdrop, LEFT,-2,0)
        end
    elseif left then
        if UnitFrames.SV.HideBarStamina or UnitFrames.SV.HideBarMagicka then
            UnitFrames.CustomFrames.player.botInfo:SetAnchor(TOP, phb.backdrop, BOTTOM, 0, 2 )
            alt.backdrop:ClearAnchors()
            alt.backdrop:SetAnchor( CENTER, UnitFrames.CustomFrames.player.botInfo, CENTER, padding * .5 +1, 0)
            alt.backdrop:SetWidth(altW)
            alt.icon:ClearAnchors()
            alt.icon:SetAnchor (RIGHT, alt.backdrop, LEFT,-2,0)
        else
            if UnitFrames.SV.ReverseResourceBars then
                UnitFrames.CustomFrames.player.botInfo:SetAnchor(TOP, psb.backdrop, BOTTOM, 0, 2 )
            else
                UnitFrames.CustomFrames.player.botInfo:SetAnchor(TOP, pmb.backdrop, BOTTOM, 0, 2 )
            end
            alt.backdrop:ClearAnchors()
            alt.backdrop:SetAnchor( RIGHT, UnitFrames.CustomFrames.player.botInfo, RIGHT, -padding - 5, 0)
            alt.backdrop:SetWidth(altW)
            alt.icon:ClearAnchors()
            alt.icon:SetAnchor (LEFT, alt.backdrop, RIGHT,2,0)
        end
        --alt.icon:ClearAnchors()
    elseif recenter then
        if UnitFrames.SV.PlayerFrameOptions == 1 then
            UnitFrames.CustomFrames.player.botInfo:SetAnchor(TOP, playerTlw, BOTTOM, 0, 2 )
            alt.backdrop:ClearAnchors()
            alt.backdrop:SetAnchor( CENTER, UnitFrames.CustomFrames.player.botInfo, CENTER, padding * .5 +1, 0)
            alt.backdrop:SetWidth(altW)
            alt.icon:ClearAnchors()
            alt.icon:SetAnchor (RIGHT, alt.backdrop, LEFT,-2,0)
        elseif UnitFrames.SV.PlayerFrameOptions == 2 then
            UnitFrames.CustomFrames.player.botInfo:SetAnchor(TOP, playerTlw, BOTTOM, 0, 2 )
            alt.backdrop:ClearAnchors()
            alt.backdrop:SetAnchor( CENTER, UnitFrames.CustomFrames.player.botInfo, CENTER, padding * .5 +1, 0)
            alt.backdrop:SetWidth(altW)
            alt.icon:ClearAnchors()
            alt.icon:SetAnchor (RIGHT, alt.backdrop, LEFT,-2,0)
        elseif UnitFrames.SV.PlayerFrameOptions == 3 then
            if UnitFrames.SV.HideBarStamina and UnitFrames.SV.HideBarMagicka then
                UnitFrames.CustomFrames.player.botInfo:SetAnchor(TOP, playerTlw, BOTTOM, 0, 2 )
            elseif UnitFrames.SV.HideBarStamina and not UnitFrames.SV.HideBarMagicka then
                if UnitFrames.SV.ReverseResourceBars then
                    UnitFrames.CustomFrames.player.botInfo:SetAnchor(TOP, pmb.backdrop, BOTTOMLEFT, 0, 2 )
                else
                    UnitFrames.CustomFrames.player.botInfo:SetAnchor(TOP, pmb.backdrop, BOTTOMRIGHT, 0, 2 )
                end
            else
                if UnitFrames.SV.ReverseResourceBars then
                    UnitFrames.CustomFrames.player.botInfo:SetAnchor(TOP, psb.backdrop, BOTTOMRIGHT, 0, 2 )
                else
                    UnitFrames.CustomFrames.player.botInfo:SetAnchor(TOP, psb.backdrop, BOTTOMLEFT, 0, 2 )
                end
            end
            alt.backdrop:ClearAnchors()
            alt.backdrop:SetAnchor( CENTER, UnitFrames.CustomFrames.player.botInfo, CENTER, padding * .5 +1, 0)
            alt.backdrop:SetWidth(altW)
            alt.icon:ClearAnchors()
            alt.icon:SetAnchor (RIGHT, alt.backdrop, LEFT,-2,0)
        else
            UnitFrames.CustomFrames.player.botInfo:SetAnchor(TOP, playerTlw, BOTTOM, 0, 2)
        end
    end
end

-- Runs on EVENT_CHAMPION_POINT_GAINED event listener
-- Used to change icon on alternative bar for next champion point type
function UnitFrames.OnChampionPointGained(eventCode)
    if UnitFrames.CustomFrames.player and UnitFrames.CustomFrames.player.ChampionXP then
        local championPoints = GetPlayerChampionPointsEarned()
        local attribute
        if championPoints == 3600 then
            attribute = GetChampionPointPoolForRank(championPoints)
        else
            attribute = GetChampionPointPoolForRank(championPoints+1)
        end
        local colour = ( UnitFrames.SV.PlayerChampionColour and CP_BAR_COLOURS[attribute] ) and CP_BAR_COLOURS[attribute][2] or XP_BAR_COLOURS
        local colour2 = ( UnitFrames.SV.PlayerChampionColour and CP_BAR_COLOURS[attribute] ) and CP_BAR_COLOURS[attribute][1] or XP_BAR_COLOURS
        UnitFrames.CustomFrames.player.ChampionXP.backdrop:SetCenterColor( 0.1*colour.r, 0.1*colour.g, 0.1*colour.b, 0.9 )
        UnitFrames.CustomFrames.player.ChampionXP.enlightenment:SetColor( colour2.r, colour2.g, colour2.b, .40 )
        UnitFrames.CustomFrames.player.ChampionXP.bar:SetColor( colour.r, colour.g, colour.b, 0.9 )
        local disciplineData = CHAMPION_DATA_MANAGER:FindChampionDisciplineDataByType(attribute)
        UnitFrames.CustomFrames.player.ChampionXP.icon:SetTexture( disciplineData:GetHUDIcon() )
    end
end

-- Runs on the EVENT_COMBAT_EVENT listener.
function UnitFrames.OnCombatEvent( eventCode, result, isError, abilityName, abilityGraphic, abilityActionSlotType, sourceName, sourceType, targetName, targetType, hitValue, powerType, damageType, log )
    if isError
        and sourceType == COMBAT_UNIT_TYPE_PLAYER
        and targetType == COMBAT_UNIT_TYPE_PLAYER
        and UnitFrames.CustomFrames.player ~= nil
        and UnitFrames.CustomFrames.player[powerType] ~= nil
        and UnitFrames.CustomFrames.player[powerType].backdrop ~= nil
        and ( powerType == POWERTYPE_HEALTH or powerType == POWERTYPE_STAMINA or powerType == POWERTYPE_MAGICKA) then

        if g_powerError[powerType] or IsUnitDead("player") then
            return
        end

        g_powerError[powerType] = true
        -- Save original center colour and colour to red
        local backdrop = UnitFrames.CustomFrames.player[powerType].backdrop
        local r,g,b = backdrop:GetCenterColor()
        if powerType == POWERTYPE_STAMINA then
            backdrop:SetCenterColor( 0, 0.2, 0, 0.9 )
        elseif powerType == POWERTYPE_MAGICKA then
            backdrop:SetCenterColor( 0, 0.05, 0.35, 0.9 )
        else
            backdrop:SetCenterColor( 0.4, 0, 0, 0.9 )
        end

        -- Make a delayed call to return original colour
        local uniqueId = moduleName .. "PowerError" .. powerType
        local firstRun = true

        eventManager:RegisterForUpdate(uniqueId, 300, function()
            if firstRun then
                backdrop:SetCenterColor( r, g, b, 0.9 )
                firstRun = false
            else
                eventManager:UnregisterForUpdate(uniqueId)
                g_powerError[powerType] = false
            end
        end)
    end
end

-- Helper function to update visibility of 'death/offline' label and hide bars and bar labels
function UnitFrames.CustomFramesSetDeadLabel( unitFrame, newValue )
    unitFrame.dead:SetHidden( newValue == nil )
    if newValue ~= nil then
        unitFrame.dead:SetText( newValue )
    end
    if newValue == "Offline" then
        classIcon = classIcons[0]
        if unitFrame.level ~= nil then
            unitFrame.level:SetHidden( newValue ~= "Dead" or newValue ~= nil )
        end
        if unitFrame.levelIcon ~= nil then
            unitFrame.levelIcon:SetHidden( newValue ~= "Dead" or newValue ~= nil )
        end
        if unitFrame.friendIcon ~= nil then
            unitFrame.friendIcon:SetHidden( newValue ~= "Dead" or newValue ~= nil )
        end
        if unitFrame.classIcon ~= nil then
            unitFrame.classIcon:SetTexture(classIcon)
        end
    end
    if unitFrame[POWERTYPE_HEALTH] then
        if unitFrame[POWERTYPE_HEALTH].bar ~= nil then
            unitFrame[POWERTYPE_HEALTH].bar:SetHidden( newValue ~= nil )
        end
        if unitFrame[POWERTYPE_HEALTH].label ~= nil then
            unitFrame[POWERTYPE_HEALTH].label:SetHidden( newValue ~= nil )
        end
        if unitFrame[POWERTYPE_HEALTH].labelOne ~= nil then
            unitFrame[POWERTYPE_HEALTH].labelOne:SetHidden( newValue ~= nil )
        end
        if unitFrame[POWERTYPE_HEALTH].labelTwo ~= nil then
            unitFrame[POWERTYPE_HEALTH].labelTwo:SetHidden( newValue ~= nil )
        end
        if unitFrame[POWERTYPE_HEALTH].name ~= nil then
            unitFrame[POWERTYPE_HEALTH].name:SetHidden ( newValue ~= nil )
        end
    end
end

-- Repopulate group members, but try to update only those, that require it
function UnitFrames.CustomFramesGroupUpdate()
    --d( string.format("[%s] GroupUpdate", GetTimeString()) )
    -- Unregister update function and clear local flag
    eventManager:UnregisterForUpdate( g_PendingUpdate.Group.name )
    g_PendingUpdate.Group.flag = false

    if ( UnitFrames.CustomFrames.SmallGroup1 == nil and UnitFrames.CustomFrames.RaidGroup1 == nil ) then
        return
    end

    if UnitFrames.SV.CustomFramesGroup then
        if GetGroupSize() <= 4 then
            ZO_UnitFramesGroups:SetHidden ( true )
        end
    end
    if UnitFrames.SV.CustomFramesRaid then
        if (GetGroupSize() > 4 or (not UnitFrames.CustomFrames.SmallGroup1 and UnitFrames.CustomFrames.RaidGroup1)) then
            ZO_UnitFramesGroups:SetHidden ( true )
        end
    end

    -- This requires some tricks if we want to keep list alphabetically sorted
    local groupList = {}

    -- First we query all group unitTag for existence and save them to local list
    -- At the same time we will calculate how many group members we have and then will hide rest of custom control elements
    local n = 0 -- counter used to reference custom frames. it always continuous while games unitTag could have gaps
    for i = 1, 24 do
        local unitTag = "group" .. i
        if DoesUnitExist(unitTag) then
            -- Save this member for later sorting
            table.insert(groupList, { ["unitTag"] = unitTag, ["unitName"] = GetUnitName(unitTag) } )
            -- CustomFrames
            n = n + 1
        else
            -- For non-existing unitTags we will remove reference from CustomFrames table
            UnitFrames.CustomFrames[unitTag] = nil
        end
    end

    -- Chose which of custom group frames we are going to use now
    local raid = nil

    -- Now we have to hide all excessive custom group controls
    if n > 4 then
        if UnitFrames.CustomFrames.SmallGroup1 then -- Custom group frames cannot be used for large groups
            UnitFrames.CustomFramesUnreferenceGroupControl("SmallGroup", 1)
        end
        if UnitFrames.CustomFrames.RaidGroup1 then -- Real group is large and custom raid frames are enabled
            UnitFrames.CustomFramesUnreferenceGroupControl("RaidGroup", n+1)
            raid = true
        end
    else
        if UnitFrames.CustomFrames.SmallGroup1 then -- Custom group frames are enabled and used for small group
            UnitFrames.CustomFramesUnreferenceGroupControl("SmallGroup", n+1)
            raid = false
            if UnitFrames.CustomFrames.RaidGroup1 then -- In this case just hide all raid frames if they are enabled
                UnitFrames.CustomFramesUnreferenceGroupControl("RaidGroup", 1)
            end
        elseif UnitFrames.CustomFrames.RaidGroup1 then -- Use raid frames if Custom Frames are not set to show but Raid frames are
            UnitFrames.CustomFramesUnreferenceGroupControl("RaidGroup", n+1)
            raid = true
        end
    end

    -- Set raid variable for resurrection monitor.
    if raid ~= nil then
        g_isRaid = raid
    end

    -- Here we can check unlikely situation when neither custom frames were selected
    if raid == nil then
        return
    end

    -- Now for small group we can exclude player from the list
    if raid == false and UnitFrames.SV.GroupExcludePlayer then
        for i = 1, #groupList do
            if AreUnitsEqual( "player", groupList[i].unitTag ) then
                -- Dereference game unitTag from CustomFrames table
                UnitFrames.CustomFrames[groupList[i].unitTag] = nil
                -- Remove element from saved table
                table.remove(groupList, i)
                -- Also remove last used (not removed on previous step) SmallGroup unitTag
                -- Variable 'n' is still holding total number of group members
                -- Thus we need to remove n-th one
                local unitTag = "SmallGroup" .. n
                UnitFrames.CustomFrames[unitTag].unitTag = nil
                UnitFrames.CustomFrames[unitTag].control:SetHidden( true )
                break
            end
        end
    end

    -- Now we have local list with valid units and we are ready to sort it
    -- FIXME: Sorting is again hardcoded to be done always
    --if not raid or UnitFrames.SV.RaidSort then
        table.sort( groupList, function(x,y) return x.unitName < y.unitName end )
    --end

    -- Loop through sorted list and put unitTag references into CustomFrames table
    local n = 0
    for _, v in ipairs(groupList) do
        -- Increase local counter
        n = n + 1
        UnitFrames.CustomFrames[v.unitTag] = UnitFrames.CustomFrames[(raid and "RaidGroup" or "SmallGroup" ) .. n]
        if UnitFrames.CustomFrames[v.unitTag] then
            UnitFrames.CustomFrames[v.unitTag].control:SetHidden( false )

            -- For SmallGroup reset topInfo width
            if not raid then
                UnitFrames.CustomFrames[v.unitTag].topInfo:SetWidth( UnitFrames.SV.GroupBarWidth-5 )
            end

            UnitFrames.CustomFrames[v.unitTag].unitTag = v.unitTag
            UnitFrames.ReloadValues(v.unitTag)
        end
    end

    UnitFrames.OnLeaderUpdate( nil, nil )
end

-- Helper function to hide and remove unitTag reference from unused group controls
function UnitFrames.CustomFramesUnreferenceGroupControl( groupType, first )
    local last
    if groupType == "SmallGroup" then
        last = 4
    elseif groupType == "RaidGroup" then
        last = 24
    else return end

    for i = first, last do
        local unitTag =  groupType .. i
        UnitFrames.CustomFrames[unitTag].unitTag = nil
        UnitFrames.CustomFrames[unitTag].control:SetHidden( true )
    end
end

-- Runs EVENT_BOSSES_CHANGED listener
function UnitFrames.OnBossesChanged( eventCode )
    if not UnitFrames.CustomFrames.boss1 then
        return
    end

    for i = 1, 6 do
        local unitTag = "boss" .. i
        if DoesUnitExist(unitTag) then
            UnitFrames.CustomFrames[unitTag].control:SetHidden(false)
            UnitFrames.ReloadValues(unitTag)
        else
            UnitFrames.CustomFrames[unitTag].control:SetHidden(true)
        end
    end
end

function UnitFrames.ResetCompassBarMenu()
    if UnitFrames.SV.DefaultFramesNewBoss == 2 then
        for i = 1, 6 do
            local unitTag = "boss" .. i
            if DoesUnitExist(unitTag) then
                COMPASS_FRAME:SetBossBarActive(true)
            end
        end
    else
        COMPASS_FRAME:SetBossBarActive(false)
    end
end

-- Set anchors for all top level windows of CustomFrames
function UnitFrames.CustomFramesSetPositions()
    local default_anchors = { }

    local player
    local playerCenter
    local reticleover
    local reticleoverCenter
    local companion
    local SmallGroup1
    local RaidGroup1
    local PetGroup1
    local boss1
    local AvaPlayerTarget
    -- 1 = 1080, 2 = 1440, 3 = 4k
    if UnitFrames.SV.ResolutionOptions == 1 then -- 1080p Resolution
        player = { -492, 205 }
        playerCenter = { 0, 334 }
        reticleover = { 192, 205 }
        reticleoverCenter = { 0, -334 }
        companion = { -954, 180 }
        SmallGroup1 = { -954, -332 }
        PetGroup1 = { -954, 250 }
        RaidGroup1 = { -954, -210 }
        boss1 = { 306, -312 }
        AvaPlayerTarget = { 0, -200 }
    elseif UnitFrames.SV.ResolutionOptions == 2 then -- 1440p Resolution
        player = { -570, 272 }
        playerCenter = { 0, 445 }
        reticleover = { 270, 272 }
        reticleoverCenter = { 0, -445 }
        companion = { -1271, 280 }
        SmallGroup1 = { -1271, -385 }
        PetGroup1 = { -1271, 350 }
        RaidGroup1 = { -1271, -243 }
        boss1 = { 354, -365 }
        AvaPlayerTarget = { 0, -266 }
    else -- 4k Resolution
        player = { -738, 410 }
        playerCenter = { 0, 668 }
        reticleover = { 438, 410 }
        reticleoverCenter = { 0, -668 }
        companion = { -2036, 380 }
        SmallGroup1 = { -2036, -498 }
        PetGroup1 = { -2036, 450 }
        RaidGroup1 = { -2036, -315 }
        boss1 = { 459, -478 }
        AvaPlayerTarget = { 0, -400 }
    end

    if UnitFrames.SV.PlayerFrameOptions == 1 then
        default_anchors["player"]      = {TOPLEFT,CENTER,player[1],player[2]}
        default_anchors["reticleover"] = {TOPLEFT,CENTER,reticleover[1],reticleover[2]}
    else
        default_anchors["player"]      = {CENTER,CENTER,playerCenter[1],playerCenter[2]}
        default_anchors["reticleover"] = {CENTER,CENTER,reticleoverCenter[1],reticleoverCenter[2]}
    end
    default_anchors["companion"] = {TOPLEFT,CENTER,companion[1],companion[2]}
    default_anchors["SmallGroup1"] = {TOPLEFT,CENTER,SmallGroup1[1],SmallGroup1[2]}
    default_anchors["RaidGroup1"]  = {TOPLEFT,CENTER,RaidGroup1[1],RaidGroup1[2]}
    default_anchors["PetGroup1"]   = {TOPLEFT,CENTER,PetGroup1[1],PetGroup1[2]}
    default_anchors["boss1"]       = {TOPLEFT,CENTER,boss1[1],boss1[2]}
    default_anchors["AvaPlayerTarget"] = {CENTER,CENTER,AvaPlayerTarget[1],AvaPlayerTarget[2]}

    for _, unitTag in pairs( { "player", "reticleover", "companion", "SmallGroup1", "RaidGroup1", "boss1", "AvaPlayerTarget", "PetGroup1" } ) do
        if UnitFrames.CustomFrames[unitTag] then
            local savedPos = UnitFrames.SV[UnitFrames.CustomFrames[unitTag].tlw.customPositionAttr]
            local anchors = ( savedPos ~= nil and #savedPos == 2 ) and { TOPLEFT, TOPLEFT, savedPos[1], savedPos[2] } or default_anchors[unitTag]
            UnitFrames.CustomFrames[unitTag].tlw:ClearAnchors()
            UnitFrames.CustomFrames[unitTag].tlw:SetAnchor( anchors[1], GuiRoot, anchors[2], anchors[3], anchors[4] )
            UnitFrames.CustomFrames[unitTag].tlw.preview.anchorLabel:SetText( ( savedPos ~= nil and #savedPos == 2 ) and zo_strformat("<<1>>, <<2>>", savedPos[1], savedPos[2]) or "default" )
        end
    end
end

-- Reset anchors for all top level windows of CustomFrames
function UnitFrames.CustomFramesResetPosition(playerOnly)
    for _, unitTag in pairs( { "player", "reticleover" } ) do
        if UnitFrames.CustomFrames[unitTag] then
            UnitFrames.SV[UnitFrames.CustomFrames[unitTag].tlw.customPositionAttr] = nil
        end
    end
    if playerOnly == false then
        for _, unitTag in pairs( { "companion", "SmallGroup1", "RaidGroup1", "boss1", "AvaPlayerTarget", "PetGroup1" } ) do
            if UnitFrames.CustomFrames[unitTag] then
                UnitFrames.SV[UnitFrames.CustomFrames[unitTag].tlw.customPositionAttr] = nil
            end
        end
    end
    UnitFrames.CustomFramesSetPositions()
end

-- Unlock CustomFrames for moving. Called from Settings Menu.
function UnitFrames.CustomFramesSetMovingState( state )
    UnitFrames.CustomFramesMovingState = state

    -- Unlock individual frames
    for _, unitTag in pairs( { "player", "reticleover", "companion", "SmallGroup1", "RaidGroup1", "boss1", "AvaPlayerTarget", "PetGroup1" } ) do
        if UnitFrames.CustomFrames[unitTag] then
            local tlw = UnitFrames.CustomFrames[unitTag].tlw
            if tlw.preview then
                tlw.preview:SetHidden( not state ) -- player frame does not have 'preview' control
            end
            tlw:SetMouseEnabled( state )
            tlw:SetMovable( state )
            tlw:SetHidden( false )
        end
    end

    -- Unlock buffs for Player (preview control is created in SpellCastBuffs module)
    if UnitFrames.CustomFrames.player then
        if UnitFrames.CustomFrames.player.buffs.preview then
            UnitFrames.CustomFrames.player.buffs.preview:SetHidden( not state )
        end
        if UnitFrames.CustomFrames.player.debuffs.preview then
            UnitFrames.CustomFrames.player.debuffs.preview:SetHidden( not state )
        end
    end

    -- Unlock buffs and debuffs for Target (preview controls are created in LTE and SpellCastBuffs modules)
    if UnitFrames.CustomFrames.reticleover then
        if UnitFrames.CustomFrames.reticleover.buffs.preview then
            UnitFrames.CustomFrames.reticleover.buffs.preview:SetHidden( not state )
        end
        if UnitFrames.CustomFrames.reticleover.debuffs.preview then
            UnitFrames.CustomFrames.reticleover.debuffs.preview:SetHidden( not state )
        end
        -- Make this hack so target window is not going to be hidden:
        -- Target Frame will now always display old information
        UnitFrames.CustomFrames.reticleover.canHide = not state
    end
end

-- Apply selected colours for all known bars on custom unit frames
function UnitFrames.CustomFramesApplyColours(isMenu)
    local health    = { UnitFrames.SV.CustomColourHealth[1],  UnitFrames.SV.CustomColourHealth[2],  UnitFrames.SV.CustomColourHealth[3], 0.9 }
    local shield    = { UnitFrames.SV.CustomColourShield[1],  UnitFrames.SV.CustomColourShield[2],  UnitFrames.SV.CustomColourShield[3], 0 } -- .a value will be fixed in the loop
    local magicka   = { UnitFrames.SV.CustomColourMagicka[1], UnitFrames.SV.CustomColourMagicka[2], UnitFrames.SV.CustomColourMagicka[3], 0.9 }
    local stamina   = { UnitFrames.SV.CustomColourStamina[1], UnitFrames.SV.CustomColourStamina[2], UnitFrames.SV.CustomColourStamina[3], 0.9 }

    local dps       =  { UnitFrames.SV.CustomColourDPS[1],    UnitFrames.SV.CustomColourDPS[2],     UnitFrames.SV.CustomColourDPS[3], 0.9 }
    local healer    =  { UnitFrames.SV.CustomColourHealer[1], UnitFrames.SV.CustomColourHealer[2],  UnitFrames.SV.CustomColourHealer[3], 0.9 }
    local tank      =  { UnitFrames.SV.CustomColourTank[1],   UnitFrames.SV.CustomColourTank[2],    UnitFrames.SV.CustomColourTank[3], 0.9 }

    local class1  = { UnitFrames.SV.CustomColourDragonknight[1], UnitFrames.SV.CustomColourDragonknight[2], UnitFrames.SV.CustomColourDragonknight[3], 0.9} -- Dragonkight
    local class2  = { UnitFrames.SV.CustomColourSorcerer[1], UnitFrames.SV.CustomColourSorcerer[2], UnitFrames.SV.CustomColourSorcerer[3], 0.9} -- Sorcerer
    local class3  = { UnitFrames.SV.CustomColourNightblade[1], UnitFrames.SV.CustomColourNightblade[2], UnitFrames.SV.CustomColourNightblade[3], 0.9} -- Nightblade
    local class4  = { UnitFrames.SV.CustomColourWarden[1], UnitFrames.SV.CustomColourWarden[2], UnitFrames.SV.CustomColourWarden[3], 0.9} -- Warden
    local class5  = { UnitFrames.SV.CustomColourNecromancer[1], UnitFrames.SV.CustomColourNecromancer[2], UnitFrames.SV.CustomColourNecromancer[3], 0.9} -- Necromancer
    local class6  = { UnitFrames.SV.CustomColourTemplar[1], UnitFrames.SV.CustomColourTemplar[2], UnitFrames.SV.CustomColourTemplar[3], 0.9} -- Templar

    local petcolor = { UnitFrames.SV.CustomColourPet[1], UnitFrames.SV.CustomColourPet[2], UnitFrames.SV.CustomColourPet[3], 0.9} -- Player Pet
    local companioncolor = { UnitFrames.SV.CustomColourCompanionFrame[1], UnitFrames.SV.CustomColourCompanionFrame[2], UnitFrames.SV.CustomColourCompanionFrame[3], 0.9} -- Companion

    local health_bg  = { 0.1*UnitFrames.SV.CustomColourHealth[1],  0.1*UnitFrames.SV.CustomColourHealth[2],  0.1*UnitFrames.SV.CustomColourHealth[3], 0.9 }
    local shield_bg  = { 0.1*UnitFrames.SV.CustomColourShield[1],  0.1*UnitFrames.SV.CustomColourShield[2],  0.1*UnitFrames.SV.CustomColourShield[3], 0.9 }
    local magicka_bg = { 0.1*UnitFrames.SV.CustomColourMagicka[1], 0.1*UnitFrames.SV.CustomColourMagicka[2], 0.1*UnitFrames.SV.CustomColourMagicka[3], 0.9 }
    local stamina_bg = { 0.1*UnitFrames.SV.CustomColourStamina[1], 0.1*UnitFrames.SV.CustomColourStamina[2], 0.1*UnitFrames.SV.CustomColourStamina[3], 0.9 }

    local dps_bg    = { 0.1*UnitFrames.SV.CustomColourDPS[1],    0.1*UnitFrames.SV.CustomColourDPS[2],    0.1*UnitFrames.SV.CustomColourDPS[3], 0.9 }
    local healer_bg = { 0.1*UnitFrames.SV.CustomColourHealer[1], 0.1*UnitFrames.SV.CustomColourHealer[2], 0.1*UnitFrames.SV.CustomColourHealer[3], 0.9 }
    local tank_bg   = { 0.1*UnitFrames.SV.CustomColourTank[1],   0.1*UnitFrames.SV.CustomColourTank[2],   0.1*UnitFrames.SV.CustomColourTank[3], 0.9 }

    local class1_bg  = { 0.1*UnitFrames.SV.CustomColourDragonknight[1], 0.1*UnitFrames.SV.CustomColourDragonknight[2], 0.1*UnitFrames.SV.CustomColourDragonknight[3], 0.9} -- Dragonkight
    local class2_bg  = { 0.1*UnitFrames.SV.CustomColourSorcerer[1], 0.1*UnitFrames.SV.CustomColourSorcerer[2], 0.1*UnitFrames.SV.CustomColourSorcerer[3], 0.9} -- Sorcerer
    local class3_bg  = { 0.1*UnitFrames.SV.CustomColourNightblade[1], 0.1*UnitFrames.SV.CustomColourNightblade[2], 0.1*UnitFrames.SV.CustomColourNightblade[3], 0.9} -- Nightblade
    local class4_bg  = { 0.1*UnitFrames.SV.CustomColourWarden[1], 0.1*UnitFrames.SV.CustomColourWarden[2], 0.1*UnitFrames.SV.CustomColourWarden[3], 0.9} -- Warden
    local class5_bg  = { 0.1*UnitFrames.SV.CustomColourNecromancer[1], 0.1*UnitFrames.SV.CustomColourNecromancer[2], 0.1*UnitFrames.SV.CustomColourNecromancer[3], 0.9} -- Necromancer
    local class6_bg  = { 0.1*UnitFrames.SV.CustomColourTemplar[1], 0.1*UnitFrames.SV.CustomColourTemplar[2], 0.1*UnitFrames.SV.CustomColourTemplar[3], 0.9} -- Templar

    local petcolor_bg = { 0.1*UnitFrames.SV.CustomColourPet[1], 0.1*UnitFrames.SV.CustomColourPet[2], 0.1*UnitFrames.SV.CustomColourPet[3], 0.9} -- Player Pet
    local companioncolor_bg = { 0.1*UnitFrames.SV.CustomColourCompanionFrame[1], 0.1*UnitFrames.SV.CustomColourCompanionFrame[2], 0.1*UnitFrames.SV.CustomColourCompanionFrame[3], 0.9} -- Companion

    -- After colour is applied unhide frames, so player can see changes even from menu
    for _, baseName in pairs( { "player", "reticleover", "boss", "AvaPlayerTarget" } ) do
        shield[4] = ( UnitFrames.SV.CustomShieldBarSeparate and not (baseName == "boss") ) and 0.9 or ( UnitFrames.SV.ShieldAlpha / 100 )
        for i = 0, 6 do
            local unitTag = (i==0) and baseName or ( baseName .. i )
            if UnitFrames.CustomFrames[unitTag] then
                local unitFrame = UnitFrames.CustomFrames[unitTag]
                local thb = unitFrame[POWERTYPE_HEALTH] -- not a backdrop
                thb.bar:SetColor( unpack(health) )
                thb.backdrop:SetCenterColor( unpack(health_bg) )
                thb.shield:SetColor( unpack(shield) )
                if thb.shieldbackdrop then
                    thb.shieldbackdrop:SetCenterColor( unpack(shield_bg) )
                end
                if isMenu then
                    unitFrame.tlw:SetHidden( false )
                end
            end
        end
    end

    local petClass = GetUnitClassId("player")

    -- Player Companion Frame Color
    if UnitFrames.CustomFrames["companion"] then
        local unitFrame = UnitFrames.CustomFrames["companion"]
        local shb = unitFrame[POWERTYPE_HEALTH] -- not a backdrop
        if UnitFrames.SV.CompanionUseClassColor then
            local class_color
            local class_bg
            if petClass == 1 then
                class_color = class1
                class_bg = class1_bg
            elseif petClass == 2 then
                class_color = class2
                class_bg = class2_bg
            elseif petClass == 3 then
                class_color = class3
                class_bg = class3_bg
            elseif petClass == 4 then
                class_color = class4
                class_bg = class4_bg
            elseif petClass == 5 then
                class_color = class5
                class_bg = class5_bg
            elseif petClass == 6 then
                class_color = class6
                class_bg = class6_bg
            else -- Fallback option just in case
                class_color = petcolor
                class_bg = petcolor_bg
            end
            shb.bar:SetColor( unpack(class_color) )
            shb.backdrop:SetCenterColor( unpack(class_bg) )
        else
            shb.bar:SetColor( unpack(petcolor) )
            shb.backdrop:SetCenterColor( unpack(petcolor_bg) )
        end
        shb.shield:SetColor( unpack(shield) )
        if shb.shieldbackdrop then
            shb.shieldbackdrop:SetCenterColor( unpack(shield_bg) )
        end
        if isMenu then
            unitFrame.tlw:SetHidden ( false )
        end
    end

    -- Player Pet Frame Color
    for i = 1, 7 do
        local unitTag = "PetGroup" .. i
        if UnitFrames.CustomFrames[unitTag] then
            local unitFrame = UnitFrames.CustomFrames[unitTag]
            local shb = unitFrame[POWERTYPE_HEALTH] -- not a backdrop
            if UnitFrames.SV.PetUseClassColor then
                local class_color
                local class_bg
                if petClass == 1 then
                    class_color = class1
                    class_bg = class1_bg
                elseif petClass == 2 then
                    class_color = class2
                    class_bg = class2_bg
                elseif petClass == 3 then
                    class_color = class3
                    class_bg = class3_bg
                elseif petClass == 4 then
                    class_color = class4
                    class_bg = class4_bg
                elseif petClass == 5 then
                    class_color = class5
                    class_bg = class5_bg
                elseif petClass == 6 then
                    class_color = class6
                    class_bg = class6_bg
                else -- Fallback option just in case
                    class_color = petcolor
                    class_bg = petcolor_bg
                end
                shb.bar:SetColor( unpack(class_color) )
                shb.backdrop:SetCenterColor( unpack(class_bg) )
            else
                shb.bar:SetColor( unpack(companioncolor) )
                shb.backdrop:SetCenterColor( unpack(companioncolor_bg) )
            end
            shb.shield:SetColor( unpack(shield) )
            if shb.shieldbackdrop then
                shb.shieldbackdrop:SetCenterColor( unpack(shield_bg) )
            end
            if isMenu then
                unitFrame.tlw:SetHidden ( false )
            end
        end
    end

    local groupSize = GetGroupSize()

    -- Variables to adjust frame when player frame is hidden in group
    local increment = false -- Once we reach a value set by Increment Marker (group tag of the player), we need to increment all further tags by +1 in order to get the correct color for them.
    local incrementMarker = 0 -- Marker -- Once we reach this value in iteration, we have to add +1 to default unitTag index for all other units.
    for _, baseName in pairs( { "SmallGroup", "RaidGroup" } ) do
        shield[4] = ( UnitFrames.SV.CustomShieldBarSeparate and not (baseName == "RaidGroup") ) and 0.9 or ( UnitFrames.SV.ShieldAlpha / 100 )

        -- Extra loop if player is excluded in Small Group Frames
        if UnitFrames.SV.GroupExcludePlayer and not (baseName == "RaidGroup") then
            -- Force increment groupTag by +1 for determining class/role if player frame is removed from display
            for i = 1, groupSize do
                if i > 4 then break end
                    local defaultUnitTag = GetGroupUnitTagByIndex(i)
                    if AreUnitsEqual(defaultUnitTag, "player") then
                    incrementMarker = i
                end
            end
        end


        for i = 1, groupSize do
            local unitTag = baseName .. i
            if UnitFrames.CustomFrames[unitTag] then

                if i == incrementMarker then increment = true end
                local defaultUnitTag
                -- Set default frame reference to +1 if Player Frame is hidden and we reach that index, otherwise, proceed as normal
                if increment then
                    defaultUnitTag = GetGroupUnitTagByIndex(i + 1)
                    if i +1 > 4 and baseName == "SmallGroup" then break end -- Bail out if we're at the end of the small group list
                else
                    defaultUnitTag = GetGroupUnitTagByIndex(i)
                end

                -- Also update control for Right Click Menu
                UnitFrames.CustomFrames[unitTag].control.defaultUnitTag = defaultUnitTag
                if UnitFrames.CustomFrames[unitTag].topInfo then UnitFrames.CustomFrames[unitTag].topInfo.defaultUnitTag = defaultUnitTag end

                local role = GetGroupMemberSelectedRole(defaultUnitTag)
                local class = GetUnitClassId(defaultUnitTag)

                local unitFrame = UnitFrames.CustomFrames[unitTag]
                local thb = unitFrame[POWERTYPE_HEALTH] -- not a backdrop

                local group = groupSize <= 4
                local raid = groupSize > 4
                if not UnitFrames.SV.CustomFramesGroup then
                    raid = true
                    group = false
                end

                if (group and UnitFrames.SV.ColorRoleGroup) or (raid and UnitFrames.SV.ColorRoleRaid) then
                    if role == 1 then
                        thb.bar:SetColor( unpack(dps) )
                        thb.backdrop:SetCenterColor( unpack(dps_bg) )
                    elseif role == 4 then
                        thb.bar:SetColor( unpack(healer) )
                        thb.backdrop:SetCenterColor( unpack(healer_bg) )
                    elseif role == 2 then
                        thb.bar:SetColor( unpack(tank) )
                        thb.backdrop:SetCenterColor( unpack(tank_bg) )
                    else
                        thb.bar:SetColor( unpack(health) )
                        thb.backdrop:SetCenterColor( unpack(health_bg) )
                    end
                elseif (group and UnitFrames.SV.ColorClassGroup) or (raid and UnitFrames.SV.ColorClassRaid) and class ~= 0 then
                    local class_color
                    local class_bg
                    if class == 1 then
                        class_color = class1
                        class_bg = class1_bg
                    elseif class == 2 then
                        class_color = class2
                        class_bg = class2_bg
                    elseif class == 3 then
                        class_color = class3
                        class_bg = class3_bg
                    elseif class == 4 then
                        class_color = class4
                        class_bg = class4_bg
                    elseif class == 5 then
                        class_color = class5
                        class_bg = class5_bg
                    elseif class == 6 then
                        class_color = class6
                        class_bg = class6_bg
                    else -- Fallback option just in case
                        class_color = health
                        class_bg = health_bg
                    end
                    thb.bar:SetColor( unpack(class_color) )
                    thb.backdrop:SetCenterColor( unpack(class_bg) )
                else
                    thb.bar:SetColor( unpack(health) )
                    thb.backdrop:SetCenterColor( unpack(health_bg) )
                end
                thb.shield:SetColor( unpack(shield) )
                if thb.shieldbackdrop then
                    thb.shieldbackdrop:SetCenterColor( unpack(shield_bg) )
                end
                if isMenu then
                    unitFrame.tlw:SetHidden( false )
                end
            end
        end
    end

    -- Player frame also requires setting of magicka and stamina bars
    if UnitFrames.CustomFrames.player then
        UnitFrames.CustomFrames.player[POWERTYPE_MAGICKA].bar:SetColor( unpack(magicka) )
        UnitFrames.CustomFrames.player[POWERTYPE_MAGICKA].backdrop:SetCenterColor( unpack(magicka_bg) )
        UnitFrames.CustomFrames.player[POWERTYPE_STAMINA].bar:SetColor( unpack(stamina) )
        UnitFrames.CustomFrames.player[POWERTYPE_STAMINA].backdrop:SetCenterColor( unpack(stamina_bg) )
    end
end

function UnitFrames.CustomFramesApplyColoursSingle(unitTag)
    local health    = { UnitFrames.SV.CustomColourHealth[1],  UnitFrames.SV.CustomColourHealth[2],  UnitFrames.SV.CustomColourHealth[3], 0.9 }
    local shield    = { UnitFrames.SV.CustomColourShield[1],  UnitFrames.SV.CustomColourShield[2],  UnitFrames.SV.CustomColourShield[3], 0 } -- .a value will be fixed in the loop
    local magicka   = { UnitFrames.SV.CustomColourMagicka[1], UnitFrames.SV.CustomColourMagicka[2], UnitFrames.SV.CustomColourMagicka[3], 0.9 }
    local stamina   = { UnitFrames.SV.CustomColourStamina[1], UnitFrames.SV.CustomColourStamina[2], UnitFrames.SV.CustomColourStamina[3], 0.9 }

    local dps       =  { UnitFrames.SV.CustomColourDPS[1],    UnitFrames.SV.CustomColourDPS[2],     UnitFrames.SV.CustomColourDPS[3], 0.9 }
    local healer    =  { UnitFrames.SV.CustomColourHealer[1], UnitFrames.SV.CustomColourHealer[2],  UnitFrames.SV.CustomColourHealer[3], 0.9 }
    local tank      =  { UnitFrames.SV.CustomColourTank[1],   UnitFrames.SV.CustomColourTank[2],    UnitFrames.SV.CustomColourTank[3], 0.9 }

    local health_bg  = { 0.1*UnitFrames.SV.CustomColourHealth[1],  0.1*UnitFrames.SV.CustomColourHealth[2],  0.1*UnitFrames.SV.CustomColourHealth[3], 0.9 }
    local shield_bg  = { 0.1*UnitFrames.SV.CustomColourShield[1],  0.1*UnitFrames.SV.CustomColourShield[2],  0.1*UnitFrames.SV.CustomColourShield[3], 0.9 }
    local magicka_bg = { 0.1*UnitFrames.SV.CustomColourMagicka[1], 0.1*UnitFrames.SV.CustomColourMagicka[2], 0.1*UnitFrames.SV.CustomColourMagicka[3], 0.9 }
    local stamina_bg = { 0.1*UnitFrames.SV.CustomColourStamina[1], 0.1*UnitFrames.SV.CustomColourStamina[2], 0.1*UnitFrames.SV.CustomColourStamina[3], 0.9 }

    local dps_bg    = { 0.1*UnitFrames.SV.CustomColourDPS[1],    0.1*UnitFrames.SV.CustomColourDPS[2],    0.1*UnitFrames.SV.CustomColourDPS[3], 0.9 }
    local healer_bg = { 0.1*UnitFrames.SV.CustomColourHealer[1], 0.1*UnitFrames.SV.CustomColourHealer[2], 0.1*UnitFrames.SV.CustomColourHealer[3], 0.9 }
    local tank_bg   = { 0.1*UnitFrames.SV.CustomColourTank[1],   0.1*UnitFrames.SV.CustomColourTank[2],   0.1*UnitFrames.SV.CustomColourTank[3], 0.9 }

    local groupSize = GetGroupSize()
    local group = groupSize <= 4
    local raid = groupSize > 4
    if not UnitFrames.SV.CustomFramesGroup then
        raid = true
        group = false
    end

    if (group and UnitFrames.SV.ColorRoleGroup) or (raid and UnitFrames.SV.ColorRoleRaid) then
        if UnitFrames.CustomFrames[unitTag] then
            local role = GetGroupMemberSelectedRole(unitTag)
            local unitFrame = UnitFrames.CustomFrames[unitTag]
            local thb = unitFrame[POWERTYPE_HEALTH] -- not a backdrop
            if role == 1 then
                thb.bar:SetColor( unpack(dps) )
                thb.backdrop:SetCenterColor( unpack(dps_bg) )
            elseif role == 4 then
                thb.bar:SetColor( unpack(healer) )
                thb.backdrop:SetCenterColor( unpack(healer_bg) )
            elseif role == 2 then
                thb.bar:SetColor( unpack(tank) )
                thb.backdrop:SetCenterColor( unpack(tank_bg) )
            else
                thb.bar:SetColor( unpack(health) )
                thb.backdrop:SetCenterColor( unpack(health_bg) )
            end
        end
    end
end

function UnitFrames.CustomFramesApplyReactionColor(isPlayer)
    if isPlayer and UnitFrames.SV.FrameColorClass then
        local classColor = {
            [1]  = { UnitFrames.SV.CustomColourDragonknight[1], UnitFrames.SV.CustomColourDragonknight[2], UnitFrames.SV.CustomColourDragonknight[3], 0.9}, -- Dragonkight
            [2]  = { UnitFrames.SV.CustomColourSorcerer[1], UnitFrames.SV.CustomColourSorcerer[2], UnitFrames.SV.CustomColourSorcerer[3], 0.9}, -- Sorcerer
            [3]  = { UnitFrames.SV.CustomColourNightblade[1], UnitFrames.SV.CustomColourNightblade[2], UnitFrames.SV.CustomColourNightblade[3], 0.9}, -- Nightblade
            [4]  = { UnitFrames.SV.CustomColourWarden[1], UnitFrames.SV.CustomColourWarden[2], UnitFrames.SV.CustomColourWarden[3], 0.9}, -- Warden
            [5]  = { UnitFrames.SV.CustomColourNecromancer[1], UnitFrames.SV.CustomColourNecromancer[2], UnitFrames.SV.CustomColourNecromancer[3], 0.9}, -- Necromancer
            [6]  = { UnitFrames.SV.CustomColourTemplar[1], UnitFrames.SV.CustomColourTemplar[2], UnitFrames.SV.CustomColourTemplar[3], 0.9}, -- Templar
        }

        local classBackground = {
            [1]  = { 0.1*UnitFrames.SV.CustomColourDragonknight[1], 0.1*UnitFrames.SV.CustomColourDragonknight[2], 0.1*UnitFrames.SV.CustomColourDragonknight[3], 0.9}, -- Dragonkight
            [2]  = { 0.1*UnitFrames.SV.CustomColourSorcerer[1], 0.1*UnitFrames.SV.CustomColourSorcerer[2], 0.1*UnitFrames.SV.CustomColourSorcerer[3], 0.9}, -- Sorcerer
            [3]  = { 0.1*UnitFrames.SV.CustomColourNightblade[1], 0.1*UnitFrames.SV.CustomColourNightblade[2], 0.1*UnitFrames.SV.CustomColourNightblade[3], 0.9}, -- Nightblade
            [4]  = { 0.1*UnitFrames.SV.CustomColourWarden[1], 0.1*UnitFrames.SV.CustomColourWarden[2], 0.1*UnitFrames.SV.CustomColourWarden[3], 0.9}, -- Warden
            [5]  = { 0.1*UnitFrames.SV.CustomColourNecromancer[1], 0.1*UnitFrames.SV.CustomColourNecromancer[2], 0.1*UnitFrames.SV.CustomColourNecromancer[3], 0.9}, -- Necromancer
            [6]  = { 0.1*UnitFrames.SV.CustomColourTemplar[1], 0.1*UnitFrames.SV.CustomColourTemplar[2], 0.1*UnitFrames.SV.CustomColourTemplar[3], 0.9}, -- Templar
        }

        if UnitFrames.CustomFrames["reticleover"] then
            local unitFrame = UnitFrames.CustomFrames["reticleover"]
            local thb = unitFrame[POWERTYPE_HEALTH] -- not a backdrop
            local classcolor = classColor[GetUnitClassId("reticleover")]
            local classcolor_bg = classBackground[GetUnitClassId("reticleover")]
            thb.bar:SetColor( unpack(classcolor) )
            thb.backdrop:SetCenterColor( unpack(classcolor_bg) )
            return -- If we apply Class color then end the function here
        end
    end

    if UnitFrames.SV.FrameColorReaction then
        local reactionColor = {
            [UNIT_REACTION_PLAYER_ALLY] = { UnitFrames.SV.CustomColourPlayer[1], UnitFrames.SV.CustomColourPlayer[2], UnitFrames.SV.CustomColourPlayer[3], 0.9 },
            [UNIT_REACTION_DEFAULT]     = { UnitFrames.SV.CustomColourFriendly[1], UnitFrames.SV.CustomColourFriendly[2], UnitFrames.SV.CustomColourFriendly[3], 0.9 },
            [UNIT_REACTION_FRIENDLY]        = { UnitFrames.SV.CustomColourFriendly[1], UnitFrames.SV.CustomColourFriendly[2], UnitFrames.SV.CustomColourFriendly[3], 0.9 },
            [UNIT_REACTION_NPC_ALLY]        = { UnitFrames.SV.CustomColourFriendly[1], UnitFrames.SV.CustomColourFriendly[2], UnitFrames.SV.CustomColourFriendly[3], 0.9 },
            [UNIT_REACTION_HOSTILE]     = { UnitFrames.SV.CustomColourHostile[1], UnitFrames.SV.CustomColourHostile[2], UnitFrames.SV.CustomColourHostile[3], 0.9 },
            [UNIT_REACTION_NEUTRAL]     = { UnitFrames.SV.CustomColourNeutral[1], UnitFrames.SV.CustomColourNeutral[2], UnitFrames.SV.CustomColourNeutral[3], 0.9 },
            [UNIT_REACTION_COMPANION]   = { UnitFrames.SV.CustomColourCompanion[1], UnitFrames.SV.CustomColourCompanion[2], UnitFrames.SV.CustomColourCompanion[3], 0.9 },
        }

        local reactionBackground = {
            [UNIT_REACTION_PLAYER_ALLY] = { 0.1*UnitFrames.SV.CustomColourPlayer[1],   0.1*UnitFrames.SV.CustomColourPlayer[2],   0.1*UnitFrames.SV.CustomColourPlayer[3], 0.9 },
            [UNIT_REACTION_DEFAULT]     = { 0.1*UnitFrames.SV.CustomColourFriendly[1],   0.1*UnitFrames.SV.CustomColourFriendly[2],   0.1*UnitFrames.SV.CustomColourFriendly[3], 0.9 },
            [UNIT_REACTION_FRIENDLY]        = { 0.1*UnitFrames.SV.CustomColourFriendly[1],   0.1*UnitFrames.SV.CustomColourFriendly[2],   0.1*UnitFrames.SV.CustomColourFriendly[3], 0.9 },
            [UNIT_REACTION_NPC_ALLY]        = { 0.1*UnitFrames.SV.CustomColourFriendly[1],   0.1*UnitFrames.SV.CustomColourFriendly[2],   0.1*UnitFrames.SV.CustomColourFriendly[3], 0.9 },
            [UNIT_REACTION_HOSTILE]     = { 0.1*UnitFrames.SV.CustomColourHostile[1],   0.1*UnitFrames.SV.CustomColourHostile[2],   0.1*UnitFrames.SV.CustomColourHostile[3], 0.9 },
            [UNIT_REACTION_NEUTRAL]     = { 0.1*UnitFrames.SV.CustomColourNeutral[1],   0.1*UnitFrames.SV.CustomColourNeutral[2],   0.1*UnitFrames.SV.CustomColourNeutral[3], 0.9 },
            [UNIT_REACTION_COMPANION]   = { 0.1*UnitFrames.SV.CustomColourCompanion[1],   0.1*UnitFrames.SV.CustomColourCompanion[2],   0.1*UnitFrames.SV.CustomColourCompanion[3], 0.9 },
        }

        if UnitFrames.CustomFrames["reticleover"] then
            local unitFrame = UnitFrames.CustomFrames["reticleover"]
            local thb = unitFrame[POWERTYPE_HEALTH] -- not a backdrop

            local reactioncolor
            local reactioncolor_bg
            if IsUnitInvulnerableGuard("reticleover") then
                reactioncolor = { UnitFrames.SV.CustomColourGuard[1], UnitFrames.SV.CustomColourGuard[2], UnitFrames.SV.CustomColourGuard[3], 0.9 }
                reactioncolor_bg = { 0.1*UnitFrames.SV.CustomColourGuard[1],   0.1*UnitFrames.SV.CustomColourGuard[2],   0.1*UnitFrames.SV.CustomColourGuard[3], 0.9 }
            else
                reactioncolor = reactionColor[GetUnitReaction("reticleover")]
                reactioncolor_bg = reactionBackground[GetUnitReaction("reticleover")]
            end

            thb.bar:SetColor( unpack(reactioncolor) )
            thb.backdrop:SetCenterColor( unpack(reactioncolor_bg) )
        end
    else
        local health    = { UnitFrames.SV.CustomColourHealth[1],  UnitFrames.SV.CustomColourHealth[2],  UnitFrames.SV.CustomColourHealth[3], 0.9 }
        local health_bg  = { 0.1*UnitFrames.SV.CustomColourHealth[1],  0.1*UnitFrames.SV.CustomColourHealth[2],  0.1*UnitFrames.SV.CustomColourHealth[3], 0.9 }

        if UnitFrames.CustomFrames["reticleover"] then
            local unitFrame = UnitFrames.CustomFrames["reticleover"]
            local thb = unitFrame[POWERTYPE_HEALTH] -- not a backdrop
            thb.bar:SetColor( unpack(health) )
            thb.backdrop:SetCenterColor( unpack(health_bg) )
        end
    end
end


-- Apply selected texture for all known bars on custom unit frames
function UnitFrames.CustomFramesApplyTexture()
    local texture = LUIE.StatusbarTextures[UnitFrames.SV.CustomTexture]

    -- After texture is applied unhide frames, so player can see changes even from menu
    if UnitFrames.CustomFrames.player then
        UnitFrames.CustomFrames.player[POWERTYPE_HEALTH].backdrop:SetCenterTexture(texture)
        UnitFrames.CustomFrames.player[POWERTYPE_HEALTH].bar:SetTexture(texture)
        if UnitFrames.CustomFrames.player[POWERTYPE_HEALTH].shieldbackdrop then
            UnitFrames.CustomFrames.player[POWERTYPE_HEALTH].shieldbackdrop:SetCenterTexture(texture)
        end
        UnitFrames.CustomFrames.player[POWERTYPE_HEALTH].shield:SetTexture(texture)
        UnitFrames.CustomFrames.player[POWERTYPE_MAGICKA].backdrop:SetCenterTexture(texture)
        UnitFrames.CustomFrames.player[POWERTYPE_MAGICKA].bar:SetTexture(texture)
        UnitFrames.CustomFrames.player[POWERTYPE_STAMINA].backdrop:SetCenterTexture(texture)
        UnitFrames.CustomFrames.player[POWERTYPE_STAMINA].bar:SetTexture(texture)
        UnitFrames.CustomFrames.player.alternative.backdrop:SetCenterTexture(texture)
        UnitFrames.CustomFrames.player.alternative.bar:SetTexture(texture)
        UnitFrames.CustomFrames.player.alternative.enlightenment:SetTexture(texture)
        UnitFrames.CustomFrames.player.tlw:SetHidden( false )
    end
    if UnitFrames.CustomFrames.reticleover then
        UnitFrames.CustomFrames.reticleover[POWERTYPE_HEALTH].backdrop:SetCenterTexture(texture)
        UnitFrames.CustomFrames.reticleover[POWERTYPE_HEALTH].bar:SetTexture(texture)
        if UnitFrames.CustomFrames.reticleover[POWERTYPE_HEALTH].shieldbackdrop then
            UnitFrames.CustomFrames.reticleover[POWERTYPE_HEALTH].shieldbackdrop:SetCenterTexture(texture)
        end
        UnitFrames.CustomFrames.reticleover[POWERTYPE_HEALTH].shield:SetTexture(texture)
        UnitFrames.CustomFrames.reticleover.tlw:SetHidden( false )
    end
    if UnitFrames.CustomFrames.AvaPlayerTarget then
        UnitFrames.CustomFrames.AvaPlayerTarget[POWERTYPE_HEALTH].backdrop:SetCenterTexture(texture)
        UnitFrames.CustomFrames.AvaPlayerTarget[POWERTYPE_HEALTH].bar:SetTexture(texture)
        if UnitFrames.CustomFrames.AvaPlayerTarget[POWERTYPE_HEALTH].shieldbackdrop then
            UnitFrames.CustomFrames.AvaPlayerTarget[POWERTYPE_HEALTH].shieldbackdrop:SetCenterTexture(texture)
        end
        UnitFrames.CustomFrames.AvaPlayerTarget[POWERTYPE_HEALTH].shield:SetTexture(texture)
        UnitFrames.CustomFrames.AvaPlayerTarget.tlw:SetHidden( false )
    end
    if UnitFrames.CustomFrames.companion then
        UnitFrames.CustomFrames.companion[POWERTYPE_HEALTH].backdrop:SetCenterTexture(texture)
        UnitFrames.CustomFrames.companion[POWERTYPE_HEALTH].bar:SetTexture(texture)
        UnitFrames.CustomFrames.companion[POWERTYPE_HEALTH].shield:SetTexture(texture)
        UnitFrames.CustomFrames.companion.tlw:SetHidden( false )
    end
    if UnitFrames.CustomFrames.SmallGroup1 then
        for i = 1, 4 do
            local unitTag = "SmallGroup" .. i
            UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].backdrop:SetCenterTexture(texture)
            UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].bar:SetTexture(texture)
            if UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].shieldbackdrop then
                UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].shieldbackdrop:SetCenterTexture(texture)
            end
            UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].shield:SetTexture(texture)
        end
        UnitFrames.CustomFrames.SmallGroup1.tlw:SetHidden( false )
    end
    if UnitFrames.CustomFrames.RaidGroup1 then
        for i = 1, 24 do
            local unitTag = "RaidGroup" .. i
            UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].backdrop:SetCenterTexture(texture)
            UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].bar:SetTexture(texture)
            UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].shield:SetTexture(texture)
        end
        UnitFrames.CustomFrames.RaidGroup1.tlw:SetHidden( false )
    end
    if UnitFrames.CustomFrames.PetGroup1 then
        for i = 1, 7 do
            local unitTag = "PetGroup" .. i
            UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].backdrop:SetCenterTexture(texture)
            UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].bar:SetTexture(texture)
            UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].shield:SetTexture(texture)
        end
        UnitFrames.CustomFrames.PetGroup1.tlw:SetHidden ( false)
    end
    if UnitFrames.CustomFrames.boss1 then
        for i = 1, 6 do
            local unitTag = "boss" .. i
            UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].backdrop:SetCenterTexture(texture)
            UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].bar:SetTexture(texture)
            UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].shield:SetTexture(texture)
        end
        UnitFrames.CustomFrames.boss1.tlw:SetHidden( false )
    end
end

-- Apply selected font for all known label on default unit frames
function UnitFrames.DefaultFramesApplyFont(unitTag)
    -- First try selecting font face
    local fontName = LUIE.Fonts[UnitFrames.SV.DefaultFontFace]
    if not fontName or fontName == "" then
        printToChat(GetString(SI_LUIE_ERROR_FONT), true)
        fontName = "$(BOLD_FONT)"
    end

    local fontStyle = ( UnitFrames.SV.DefaultFontStyle and UnitFrames.SV.DefaultFontStyle ~= "" ) and UnitFrames.SV.DefaultFontStyle or "soft-shadow-thick"
    local fontSize = ( UnitFrames.SV.DefaultFontSize and UnitFrames.SV.DefaultFontSize > 0 ) and UnitFrames.SV.DefaultFontSize or 16

    local __applyFont = function(unitTag)
        if g_DefaultFrames[unitTag] then
            local unitFrame = g_DefaultFrames[unitTag]
            for _, powerType in pairs( {POWERTYPE_HEALTH, POWERTYPE_MAGICKA, POWERTYPE_STAMINA} ) do
                if unitFrame[powerType] then
                    unitFrame[powerType].label:SetFont( zo_strformat( "<<1>>|<<2>>|<<3>>", fontName, fontSize, fontStyle ) )
                end
            end
        end
    end

    -- Apply setting only for one requested unitTag
    if unitTag then
        __applyFont(unitTag)

    -- Otherwise do it for all possible unitTags
    else
        __applyFont("player")
        __applyFont("reticleover")
        for i = 0, 24 do
            __applyFont("group" .. i)
        end
    end
end

-- Reapplies colour for default unit frames extender module labels
function UnitFrames.DefaultFramesApplyColour()
    -- Helper function
    local __applyColour = function(unitTag)
        if g_DefaultFrames[unitTag] then
            local unitFrame = g_DefaultFrames[unitTag]
            for _, powerType in pairs( {POWERTYPE_HEALTH, POWERTYPE_MAGICKA, POWERTYPE_STAMINA} ) do
                if unitFrame[powerType] then
                    unitFrame[powerType].colour = UnitFrames.SV.DefaultTextColour
                    unitFrame[powerType].label:SetColor( UnitFrames.SV.DefaultTextColour[1], UnitFrames.SV.DefaultTextColour[2], UnitFrames.SV.DefaultTextColour[3] )
                end
            end
        end
    end

    -- Apply setting for all possible unitTags
    __applyColour("player")
    __applyColour("reticleover")
    for i = 0, 24 do
        __applyColour("group" .. i)
    end
end

-- Apply selected font for all known label on custom unit frames
function UnitFrames.CustomFramesApplyFont()
    -- First try selecting font face
    local fontName = LUIE.Fonts[UnitFrames.SV.CustomFontFace]
    if not fontName or fontName == "" then
        printToChat(GetString(SI_LUIE_ERROR_FONT), true)
        fontName = "$(MEDIUM_FONT)"
    end

    local fontStyle = ( UnitFrames.SV.CustomFontStyle and UnitFrames.SV.CustomFontStyle ~= "" ) and UnitFrames.SV.CustomFontStyle or "soft-shadow-thin"
    local sizeCaption = ( UnitFrames.SV.CustomFontOther and UnitFrames.SV.CustomFontOther > 0 ) and UnitFrames.SV.CustomFontOther or 16
    local sizeBars = ( UnitFrames.SV.CustomFontBars and UnitFrames.SV.CustomFontBars > 0 ) and UnitFrames.SV.CustomFontBars or 14

    local __mkFont = function(size) return zo_strformat( "<<1>>|<<2>>|<<3>>", fontName, size, fontStyle ) end

    -- After fonts is applied unhide frames, so player can see changes even from menu
    for _, baseName in pairs( { "player", "reticleover", "companion", "SmallGroup", "RaidGroup", "boss", "AvaPlayerTarget", "PetGroup" } ) do
        for i = 0, 24 do
            local unitTag = (i==0) and baseName or ( baseName .. i )
            if UnitFrames.CustomFrames[unitTag] then
                local unitFrame = UnitFrames.CustomFrames[unitTag]
                if unitFrame.name then
                    unitFrame.name:SetFont( __mkFont( (unitFrame.name:GetParent() == unitFrame.topInfo) and sizeCaption or sizeBars ) )
                end
                if unitFrame.level then
                    unitFrame.level:SetFont( __mkFont(sizeCaption) )
                end
                if unitFrame.className then
                    unitFrame.className:SetFont( __mkFont(sizeCaption) )
                end
                if unitFrame.title then
                    unitFrame.title:SetFont( __mkFont(sizeCaption) )
                end
                if unitFrame.avaRank then
                    unitFrame.avaRank:SetFont( __mkFont(sizeCaption) )
                end
                if unitFrame.dead then
                    unitFrame.dead:SetFont( __mkFont(sizeBars) )
                end
                for _, powerType in pairs( {POWERTYPE_HEALTH, POWERTYPE_MAGICKA, POWERTYPE_STAMINA} ) do
                    if unitFrame[powerType] then
                        if unitFrame[powerType].label    then
                            unitFrame[powerType].label:SetFont( __mkFont(sizeBars) )
                        end
                        if unitFrame[powerType].labelOne then
                            unitFrame[powerType].labelOne:SetFont( __mkFont(sizeBars) )
                        end
                        if unitFrame[powerType].labelTwo then
                            unitFrame[powerType].labelTwo:SetFont( __mkFont(sizeBars) )
                        end
                    end
                end
                if i == 0 or i == 1 then
                    unitFrame.tlw:SetHidden( false )
                end
            end
        end
    end

    -- Adjust height of Name and Title labels on Player, Target and SmallGroup frames
    for _, baseName in pairs( { "player", "reticleover", "SmallGroup", "AvaPlayerTarget" } ) do
        for i = 0, 4 do
            local unitTag = (i==0) and baseName or ( baseName .. i )
            if UnitFrames.CustomFrames[unitTag] then
                local unitFrame = UnitFrames.CustomFrames[unitTag]
                -- Name should always be present
                unitFrame.name:SetHeight( 2 * sizeCaption )
                local nameHeight = unitFrame.name:GetTextHeight()
                -- Update height of name container (topInfo)
                unitFrame.topInfo:SetHeight( nameHeight )
                -- LevelIcon also should exit
                if unitFrame.levelIcon then
                    unitFrame.levelIcon:SetDimensions( nameHeight, nameHeight )
                    unitFrame.levelIcon:ClearAnchors()
                    unitFrame.levelIcon:SetAnchor( LEFT, unitFrame.topInfo, LEFT, unitFrame.name:GetTextWidth()+1, 0 )
                end
                -- ClassIcon too - it looks better if a little bigger
                unitFrame.classIcon:SetDimensions( nameHeight+2, nameHeight+2 )
                -- FriendIcon if exist - same idea
                if unitFrame.friendIcon then
                    unitFrame.friendIcon:SetDimensions( nameHeight+2, nameHeight+2 )
                    unitFrame.friendIcon:ClearAnchors()
                    unitFrame.friendIcon:SetAnchor( RIGHT, unitFrame.classIcon, LEFT, nameHeight/6, 0)
                end
                -- botInfo contain alt bar or title/ava
                if unitFrame.botInfo then
                    unitFrame.botInfo:SetHeight( nameHeight )
                    -- Alternative bar present on Player
                    if unitFrame.alternative then
                        unitFrame.alternative.backdrop:SetHeight( math.ceil( nameHeight / 3 )+2 )
                        unitFrame.alternative.icon:SetDimensions( nameHeight, nameHeight )
                    end
                    -- Title present only on Target
                    if unitFrame.title then
                        unitFrame.title:SetHeight( 2 * sizeCaption )
                    end
                end
                if unitFrame.buffAnchor then
                    unitFrame.buffAnchor:SetHeight( nameHeight )
                end
            end
        end
    end
end

-- Set dimensions of custom group frame and anchors or raid group members
function UnitFrames.CustomFramesApplyLayoutPlayer(unhide)
    -- Player frame
    if UnitFrames.CustomFrames.player then
        local player = UnitFrames.CustomFrames.player

        local phb = player[POWERTYPE_HEALTH]  -- Not a backdrop
        local pmb = player[POWERTYPE_MAGICKA] -- Not a backdrop
        local psb = player[POWERTYPE_STAMINA] -- Not a backdrop
        local alt = player.alternative        -- Not a backdrop

        if UnitFrames.SV.PlayerFrameOptions == 1 then
            if not UnitFrames.SV.HideBarMagicka and not UnitFrames.SV.HideBarStamina then
                player.tlw:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightHealth + UnitFrames.SV.PlayerBarHeightMagicka + UnitFrames.SV.PlayerBarHeightStamina + 2*UnitFrames.SV.PlayerBarSpacing + (phb.shieldbackdrop and UnitFrames.SV.CustomShieldBarHeight or 0) )
                player.control:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightHealth + UnitFrames.SV.PlayerBarHeightMagicka + UnitFrames.SV.PlayerBarHeightStamina + 2*UnitFrames.SV.PlayerBarSpacing + (phb.shieldbackdrop and UnitFrames.SV.CustomShieldBarHeight or 0) )
            elseif UnitFrames.SV.HideBarMagicka and not UnitFrames.SV.HideBarStamina then
                player.tlw:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightHealth + UnitFrames.SV.PlayerBarHeightStamina + UnitFrames.SV.PlayerBarSpacing + (phb.shieldbackdrop and UnitFrames.SV.CustomShieldBarHeight or 0) )
                player.control:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightHealth + UnitFrames.SV.PlayerBarHeightStamina + UnitFrames.SV.PlayerBarSpacing + (phb.shieldbackdrop and UnitFrames.SV.CustomShieldBarHeight or 0) )
            elseif UnitFrames.SV.HideBarStamina and not UnitFrames.SV.HideBarMagicka then
                player.tlw:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightHealth + UnitFrames.SV.PlayerBarHeightMagicka + UnitFrames.SV.PlayerBarSpacing + (phb.shieldbackdrop and UnitFrames.SV.CustomShieldBarHeight or 0) )
                player.control:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightHealth + UnitFrames.SV.PlayerBarHeightMagicka + UnitFrames.SV.PlayerBarSpacing + (phb.shieldbackdrop and UnitFrames.SV.CustomShieldBarHeight or 0) )
            else
                player.tlw:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightHealth + (phb.shieldbackdrop and UnitFrames.SV.CustomShieldBarHeight or 0) )
                player.control:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightHealth + (phb.shieldbackdrop and UnitFrames.SV.CustomShieldBarHeight or 0) )
            end

            player.topInfo:SetWidth( UnitFrames.SV.PlayerBarWidth )
            player.botInfo:SetWidth( UnitFrames.SV.PlayerBarWidth )
            player.buffAnchor:SetWidth( UnitFrames.SV.PlayerBarWidth )

            player.name:SetWidth( UnitFrames.SV.PlayerBarWidth-90 )
            player.buffs:SetWidth( UnitFrames.SV.PlayerBarWidth )
            player.debuffs:SetWidth( UnitFrames.SV.PlayerBarWidth )

            player.levelIcon:ClearAnchors()
            player.levelIcon:SetAnchor( LEFT, player.topInfo, LEFT, player.name:GetTextWidth()+1, 0 )

            player.name:SetHidden( not UnitFrames.SV.PlayerEnableYourname )
            player.level:SetHidden( not UnitFrames.SV.PlayerEnableYourname )
            player.levelIcon:SetHidden( not UnitFrames.SV.PlayerEnableYourname )
            player.classIcon:SetHidden( not UnitFrames.SV.PlayerEnableYourname )

            local altW = math.ceil(UnitFrames.SV.PlayerBarWidth * 2/3)

            if not UnitFrames.SV.HideBarHealth then
                phb.backdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightHealth )
            end
            phb.backdrop:SetHidden(UnitFrames.SV.HideBarHealth)

            if not UnitFrames.SV.ReverseResourceBars then
                pmb.backdrop:ClearAnchors()
                if not UnitFrames.SV.HideBarMagicka then
                    if phb.shieldbackdrop then
                        phb.shieldbackdrop:ClearAnchors()
                        phb.shieldbackdrop:SetAnchor( TOP, phb.backdrop, BOTTOM, 0, 0 )
                        phb.shieldbackdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.CustomShieldBarHeight )
                        pmb.backdrop:SetAnchor( TOP, phb.shieldbackdrop, BOTTOM, 0, UnitFrames.SV.PlayerBarSpacing )
                    else
                        pmb.backdrop:SetAnchor( TOP, phb.backdrop, BOTTOM, 0, UnitFrames.SV.PlayerBarSpacing )
                    end
                    pmb.backdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightMagicka )
                else
                    if phb.shieldbackdrop then
                        phb.shieldbackdrop:ClearAnchors()
                        phb.shieldbackdrop:SetAnchor( TOP, phb.backdrop, BOTTOM, 0, 0 )
                        phb.shieldbackdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.CustomShieldBarHeight )
                    end
                end

                psb.backdrop:ClearAnchors()
                if not UnitFrames.SV.HideBarStamina then
                    if not UnitFrames.SV.HideBarMagicka then
                        psb.backdrop:SetAnchor( TOP, pmb.backdrop, BOTTOM, 0, UnitFrames.SV.PlayerBarSpacing )
                    else
                        if phb.shieldbackdrop then
                            psb.backdrop:SetAnchor( TOP, phb.shieldbackdrop, BOTTOM, 0, UnitFrames.SV.PlayerBarSpacing )
                        else
                            psb.backdrop:SetAnchor( TOP, phb.backdrop, BOTTOM, 0, UnitFrames.SV.PlayerBarSpacing )
                       end
                    end
                    psb.backdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightStamina )
                end
            else
                psb.backdrop:ClearAnchors()
                if not UnitFrames.SV.HideBarStamina then
                    if phb.shieldbackdrop then
                        phb.shieldbackdrop:ClearAnchors()
                        phb.shieldbackdrop:SetAnchor( TOP, phb.backdrop, BOTTOM, 0, 0 )
                        phb.shieldbackdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.CustomShieldBarHeight )
                        psb.backdrop:SetAnchor( TOP, phb.shieldbackdrop, BOTTOM, 0, UnitFrames.SV.PlayerBarSpacing )
                    else
                        psb.backdrop:SetAnchor( TOP, phb.backdrop, BOTTOM, 0, UnitFrames.SV.PlayerBarSpacing )
                    end
                    psb.backdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightStamina )
                else
                    if phb.shieldbackdrop then
                        phb.shieldbackdrop:ClearAnchors()
                        phb.shieldbackdrop:SetAnchor( TOP, phb.backdrop, BOTTOM, 0, 0 )
                        phb.shieldbackdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.CustomShieldBarHeight )
                    end
                end

                pmb.backdrop:ClearAnchors()
                if not UnitFrames.SV.HideBarMagicka then
                    if not UnitFrames.SV.HideBarStamina then
                        pmb.backdrop:SetAnchor( TOP, psb.backdrop, BOTTOM, 0, UnitFrames.SV.PlayerBarSpacing )
                    else
                        if phb.shieldbackdrop then
                            pmb.backdrop:SetAnchor( TOP, phb.shieldbackdrop, BOTTOM, 0, UnitFrames.SV.PlayerBarSpacing )
                        else
                            pmb.backdrop:SetAnchor( TOP, phb.backdrop, BOTTOM, 0, UnitFrames.SV.PlayerBarSpacing )
                       end
                    end
                    pmb.backdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightMagicka )
                end
            end
            alt.backdrop:SetWidth( altW )
            if not UnitFrames.SV.HideLabelHealth then
                phb.labelOne:SetDimensions( UnitFrames.SV.PlayerBarWidth-50, UnitFrames.SV.PlayerBarHeightHealth-2 )
                phb.labelTwo:SetDimensions( UnitFrames.SV.PlayerBarWidth-50, UnitFrames.SV.PlayerBarHeightHealth-2 )
            end
            if not UnitFrames.SV.HideLabelMagicka then
                pmb.labelOne:SetDimensions( UnitFrames.SV.PlayerBarWidth-50, UnitFrames.SV.PlayerBarHeightMagicka-2 )
                pmb.labelTwo:SetDimensions( UnitFrames.SV.PlayerBarWidth-50, UnitFrames.SV.PlayerBarHeightMagicka-2 )
            end
            if not UnitFrames.SV.HideLabelStamina then
                psb.labelOne:SetDimensions( UnitFrames.SV.PlayerBarWidth-50, UnitFrames.SV.PlayerBarHeightStamina-2 )
                psb.labelTwo:SetDimensions( UnitFrames.SV.PlayerBarWidth-50, UnitFrames.SV.PlayerBarHeightStamina-2 )
            end
        elseif UnitFrames.SV.PlayerFrameOptions == 2 then
            player.tlw:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightHealth + (phb.shieldbackdrop and UnitFrames.SV.CustomShieldBarHeight or 0) )
            player.control:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightHealth + (phb.shieldbackdrop and UnitFrames.SV.CustomShieldBarHeight or 0) )

            player.topInfo:SetWidth( UnitFrames.SV.PlayerBarWidth )
            player.botInfo:SetWidth( UnitFrames.SV.PlayerBarWidth )
            player.buffAnchor:SetWidth( UnitFrames.SV.PlayerBarWidth )

            player.name:SetWidth( UnitFrames.SV.PlayerBarWidth-90 )
            player.buffs:SetWidth( 1000 )
            player.debuffs:SetWidth( 1000 )

            player.levelIcon:ClearAnchors()
            player.levelIcon:SetAnchor( LEFT, player.topInfo, LEFT, player.name:GetTextWidth()+1, 0 )

            player.name:SetHidden( not UnitFrames.SV.PlayerEnableYourname )
            player.level:SetHidden( not UnitFrames.SV.PlayerEnableYourname )
            player.levelIcon:SetHidden( not UnitFrames.SV.PlayerEnableYourname )
            player.classIcon:SetHidden( not UnitFrames.SV.PlayerEnableYourname )

            local altW = math.ceil(UnitFrames.SV.PlayerBarWidth * 2/3)

            phb.backdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightHealth )
            phb.backdrop:SetHidden(UnitFrames.SV.HideBarHealth)

            if phb.shieldbackdrop then
                phb.shieldbackdrop:ClearAnchors()
                phb.shieldbackdrop:SetAnchor( TOP, phb.backdrop, BOTTOM, 0, 0 )
                phb.shieldbackdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.CustomShieldBarHeight )
            end

            if not UnitFrames.SV.ReverseResourceBars then
                pmb.backdrop:ClearAnchors()
                if not UnitFrames.SV.HideBarMagicka then
                    pmb.backdrop:SetAnchor( RIGHT, phb.backdrop, LEFT, -UnitFrames.SV.AdjustMagickaHPos,  UnitFrames.SV.AdjustMagickaVPos )
                    pmb.backdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightMagicka )
                end

                psb.backdrop:ClearAnchors()
                if not UnitFrames.SV.HideBarStamina then
                    psb.backdrop:SetAnchor( LEFT, phb.backdrop, RIGHT, UnitFrames.SV.AdjustStaminaHPos,  UnitFrames.SV.AdjustStaminaVPos )
                    psb.backdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightStamina )
                end
            else
                psb.backdrop:ClearAnchors()
                if not UnitFrames.SV.HideBarStamina then
                    psb.backdrop:SetAnchor( RIGHT, phb.backdrop, LEFT, -UnitFrames.SV.AdjustStaminaHPos,  UnitFrames.SV.AdjustStaminaVPos )
                    psb.backdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightStamina )
                end

                pmb.backdrop:ClearAnchors()
                if not UnitFrames.SV.HideBarMagicka then
                    pmb.backdrop:SetAnchor( LEFT, phb.backdrop, RIGHT, UnitFrames.SV.AdjustMagickaHPos,  UnitFrames.SV.AdjustMagickaVPos )
                    pmb.backdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightMagicka )
                end
            end
            alt.backdrop:SetWidth( altW )

            if not UnitFrames.SV.HideLabelHealth then
                phb.labelOne:SetDimensions( UnitFrames.SV.PlayerBarWidth-50, UnitFrames.SV.PlayerBarHeightHealth-2 )
                phb.labelTwo:SetDimensions( UnitFrames.SV.PlayerBarWidth-50, UnitFrames.SV.PlayerBarHeightHealth-2 )
            end
            if not UnitFrames.SV.HideLabelMagicka then
                pmb.labelOne:SetDimensions( UnitFrames.SV.PlayerBarWidth-50, UnitFrames.SV.PlayerBarHeightMagicka-2 )
                pmb.labelTwo:SetDimensions( UnitFrames.SV.PlayerBarWidth-50, UnitFrames.SV.PlayerBarHeightMagicka-2 )
            end
            if not UnitFrames.SV.HideLabelStamina then
                psb.labelOne:SetDimensions( UnitFrames.SV.PlayerBarWidth-50, UnitFrames.SV.PlayerBarHeightStamina-2 )
                psb.labelTwo:SetDimensions( UnitFrames.SV.PlayerBarWidth-50, UnitFrames.SV.PlayerBarHeightStamina-2 )
            end
        else
            player.tlw:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightHealth + (phb.shieldbackdrop and UnitFrames.SV.CustomShieldBarHeight or 0) )
            player.control:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightHealth + (phb.shieldbackdrop and UnitFrames.SV.CustomShieldBarHeight or 0) )

            player.topInfo:SetWidth( UnitFrames.SV.PlayerBarWidth )
            player.botInfo:SetWidth( UnitFrames.SV.PlayerBarWidth )
            player.buffAnchor:SetWidth( UnitFrames.SV.PlayerBarWidth )

            player.name:SetWidth( UnitFrames.SV.PlayerBarWidth-90 )
            player.buffs:SetWidth( 1000 )
            player.debuffs:SetWidth( 1000 )

            player.levelIcon:ClearAnchors()
            player.levelIcon:SetAnchor( LEFT, player.topInfo, LEFT, player.name:GetTextWidth()+1, 0 )

            player.name:SetHidden( not UnitFrames.SV.PlayerEnableYourname )
            player.level:SetHidden( not UnitFrames.SV.PlayerEnableYourname )
            player.levelIcon:SetHidden( not UnitFrames.SV.PlayerEnableYourname )
            player.classIcon:SetHidden( not UnitFrames.SV.PlayerEnableYourname )

            local altW = math.ceil(UnitFrames.SV.PlayerBarWidth * 2/3)

            phb.backdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightHealth )
            phb.backdrop:SetHidden(UnitFrames.SV.HideBarHealth)

            if not UnitFrames.SV.ReverseResourceBars then
                pmb.backdrop:ClearAnchors()
                if not UnitFrames.SV.HideBarMagicka then
                    if phb.shieldbackdrop then
                        phb.shieldbackdrop:ClearAnchors()
                        phb.shieldbackdrop:SetAnchor( TOP, phb.backdrop, BOTTOM, 0, 0 )
                        phb.shieldbackdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.CustomShieldBarHeight )
                        pmb.backdrop:SetAnchor( TOP, phb.shieldbackdrop, BOTTOMLEFT, 0, UnitFrames.SV.PlayerBarSpacing )
                    else
                        pmb.backdrop:SetAnchor( TOP, phb.backdrop, BOTTOMLEFT, 0, UnitFrames.SV.PlayerBarSpacing )
                    end
                    pmb.backdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightMagicka )
                else
                    if phb.shieldbackdrop then
                        phb.shieldbackdrop:ClearAnchors()
                        phb.shieldbackdrop:SetAnchor( TOP, phb.backdrop, BOTTOM, 0, 0 )
                        phb.shieldbackdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.CustomShieldBarHeight )
                    end
                end

                psb.backdrop:ClearAnchors()
                if not UnitFrames.SV.HideBarStamina then
                    if phb.shieldbackdrop then
                        psb.backdrop:SetAnchor( TOP, phb.shieldbackdrop, BOTTOMRIGHT, 0, UnitFrames.SV.PlayerBarSpacing )
                    else
                        psb.backdrop:SetAnchor( TOP, phb.backdrop, BOTTOMRIGHT, 0, UnitFrames.SV.PlayerBarSpacing )
                    end
                    psb.backdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightStamina )
                end
            else
                psb.backdrop:ClearAnchors()
                if not UnitFrames.SV.HideBarStamina then
                    if phb.shieldbackdrop then
                        phb.shieldbackdrop:ClearAnchors()
                        phb.shieldbackdrop:SetAnchor( TOP, phb.backdrop, BOTTOM, 0, 0 )
                        phb.shieldbackdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.CustomShieldBarHeight )
                        psb.backdrop:SetAnchor( TOP, phb.shieldbackdrop, BOTTOMLEFT, 0, UnitFrames.SV.PlayerBarSpacing )
                    else
                        psb.backdrop:SetAnchor( TOP, phb.backdrop, BOTTOMLEFT, 0, UnitFrames.SV.PlayerBarSpacing )
                    end
                    psb.backdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightStamina )
                else
                    if phb.shieldbackdrop then
                        phb.shieldbackdrop:ClearAnchors()
                        phb.shieldbackdrop:SetAnchor( TOP, phb.backdrop, BOTTOM, 0, 0 )
                        phb.shieldbackdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.CustomShieldBarHeight )
                    end
                end

                pmb.backdrop:ClearAnchors()
                if not UnitFrames.SV.HideBarMagicka then
                    if phb.shieldbackdrop then
                        pmb.backdrop:SetAnchor( TOP, phb.shieldbackdrop, BOTTOMRIGHT, 0, UnitFrames.SV.PlayerBarSpacing )
                    else
                        pmb.backdrop:SetAnchor( TOP, phb.backdrop, BOTTOMRIGHT, 0, UnitFrames.SV.PlayerBarSpacing )
                    end
                    pmb.backdrop:SetDimensions( UnitFrames.SV.PlayerBarWidth, UnitFrames.SV.PlayerBarHeightMagicka )
                end
            end

            player.botInfo:SetWidth( UnitFrames.SV.PlayerBarWidth )
            player.buffAnchor:SetWidth( UnitFrames.SV.PlayerBarWidth )
            alt.backdrop:SetWidth( altW )

            if not UnitFrames.SV.HideLabelHealth then
                phb.labelOne:SetDimensions( UnitFrames.SV.PlayerBarWidth-50, UnitFrames.SV.PlayerBarHeightHealth-2 )
                phb.labelTwo:SetDimensions( UnitFrames.SV.PlayerBarWidth-50, UnitFrames.SV.PlayerBarHeightHealth-2 )
            end
            if not UnitFrames.SV.HideLabelMagicka then
                pmb.labelOne:SetDimensions( UnitFrames.SV.PlayerBarWidth-50, UnitFrames.SV.PlayerBarHeightMagicka-2 )
                pmb.labelTwo:SetDimensions( UnitFrames.SV.PlayerBarWidth-50, UnitFrames.SV.PlayerBarHeightMagicka-2 )
            end
            if not UnitFrames.SV.HideLabelStamina then
                psb.labelOne:SetDimensions( UnitFrames.SV.PlayerBarWidth-50, UnitFrames.SV.PlayerBarHeightStamina-2 )
                psb.labelTwo:SetDimensions( UnitFrames.SV.PlayerBarWidth-50, UnitFrames.SV.PlayerBarHeightStamina-2 )
            end
        end
        if unhide then
            player.tlw:SetHidden( false )
        end
    end

    -- Target frame
    if UnitFrames.CustomFrames.reticleover then
        local target = UnitFrames.CustomFrames.reticleover

        local thb = target[POWERTYPE_HEALTH] -- Not a backdrop

        target.tlw:SetDimensions( UnitFrames.SV.TargetBarWidth, UnitFrames.SV.TargetBarHeight + (thb.shieldbackdrop and UnitFrames.SV.CustomShieldBarHeight or 0) )
        target.control:SetDimensions( UnitFrames.SV.TargetBarWidth, UnitFrames.SV.TargetBarHeight + (thb.shieldbackdrop and UnitFrames.SV.CustomShieldBarHeight or 0) )
        target.topInfo:SetWidth( UnitFrames.SV.TargetBarWidth )
        target.botInfo:SetWidth( UnitFrames.SV.TargetBarWidth )
        target.buffAnchor:SetWidth( UnitFrames.SV.TargetBarWidth )

        target.name:SetWidth( UnitFrames.SV.TargetBarWidth-50 )
        target.title:SetWidth( UnitFrames.SV.TargetBarWidth-50 )

        if UnitFrames.SV.PlayerFrameOptions == 1 then
            target.buffs:SetWidth( UnitFrames.SV.TargetBarWidth )
            target.debuffs:SetWidth( UnitFrames.SV.TargetBarWidth )
        else
            target.buffs:SetWidth( 1000 )
            target.debuffs:SetWidth( 1000 )
        end

        if not UnitFrames.SV.TargetEnableTitle and not UnitFrames.SV.TargetEnableRank then
            target.title:SetHidden(true)
        else
            target.title:SetHidden(false)
        end
        target.avaRank:SetHidden( not UnitFrames.SV.TargetEnableRankIcon )
        target.avaRankIcon:SetHidden( not UnitFrames.SV.TargetEnableRankIcon )

        local enable
        if (not UnitFrames.SV.TargetEnableTitle and not UnitFrames.SV.TargetEnableRank and not UnitFrames.SV.TargetEnableRankIcon) then
            enable = false
        else
            enable = true
        end

        if UnitFrames.SV.PlayerFrameOptions == 1 then
            target.buffs:ClearAnchors()
            target.buffs:SetAnchor( TOP, not enable and target.control or target.buffAnchor, BOTTOM, 0, 5 )
        else
            target.debuffs:ClearAnchors()
            target.debuffs:SetAnchor( TOP, not enable and target.control or target.buffAnchor, BOTTOM, 0, 5 )
        end

        target.levelIcon:ClearAnchors()
        target.levelIcon:SetAnchor( LEFT, target.topInfo, LEFT, target.name:GetTextWidth()+1, 0 )

        target.skull:SetDimensions( 2*UnitFrames.SV.TargetBarHeight, 2*UnitFrames.SV.TargetBarHeight )

        thb.backdrop:SetDimensions( UnitFrames.SV.TargetBarWidth, UnitFrames.SV.TargetBarHeight )
        if thb.shieldbackdrop then
            thb.shieldbackdrop:ClearAnchors()
            thb.shieldbackdrop:SetAnchor( TOP, thb.backdrop, BOTTOM, 0, 0 )
            thb.shieldbackdrop:SetDimensions( UnitFrames.SV.TargetBarWidth, UnitFrames.SV.CustomShieldBarHeight )
        end

        thb.labelOne:SetDimensions( UnitFrames.SV.TargetBarWidth-50, UnitFrames.SV.TargetBarHeight-2 )
        thb.labelTwo:SetDimensions( UnitFrames.SV.TargetBarWidth-50, UnitFrames.SV.TargetBarHeight-2 )

        if unhide then
            target.tlw:SetHidden(false)
            target.control:SetHidden(false)
        end
    end

    -- Another Target frame (for PvP)
    if UnitFrames.CustomFrames.AvaPlayerTarget then
        local target = UnitFrames.CustomFrames.AvaPlayerTarget

        local thb = target[POWERTYPE_HEALTH] -- Not a backdrop

        target.tlw:SetDimensions( UnitFrames.SV.AvaTargetBarWidth, UnitFrames.SV.AvaTargetBarHeight + (thb.shieldbackdrop and UnitFrames.SV.CustomShieldBarHeight or 0) )
        target.control:SetDimensions( UnitFrames.SV.AvaTargetBarWidth, UnitFrames.SV.AvaTargetBarHeight + (thb.shieldbackdrop and UnitFrames.SV.CustomShieldBarHeight or 0) )
        target.topInfo:SetWidth( UnitFrames.SV.AvaTargetBarWidth )
        target.botInfo:SetWidth( UnitFrames.SV.AvaTargetBarWidth )
        target.buffAnchor:SetWidth( UnitFrames.SV.AvaTargetBarWidth )

        target.name:SetWidth( UnitFrames.SV.AvaTargetBarWidth-50 )

        thb.backdrop:SetDimensions( UnitFrames.SV.AvaTargetBarWidth, UnitFrames.SV.AvaTargetBarHeight )
        if thb.shieldbackdrop then
            thb.shieldbackdrop:ClearAnchors()
            thb.shieldbackdrop:SetAnchor( TOP, thb.backdrop, BOTTOM, 0, 0 )
            thb.shieldbackdrop:SetDimensions( UnitFrames.SV.AvaTargetBarWidth, UnitFrames.SV.CustomShieldBarHeight )
        end

        thb.label:SetHeight( UnitFrames.SV.AvaTargetBarHeight-2 )
        thb.labelOne:SetHeight( UnitFrames.SV.AvaTargetBarHeight-2 )
        thb.labelTwo:SetHeight( UnitFrames.SV.AvaTargetBarHeight-2 )

        if unhide then
            target.tlw:SetHidden(false)
            target.control:SetHidden(false)
        end
    end
end

-- Set dimensions of custom group frame and anchors or raid group members
function UnitFrames.CustomFramesApplyLayoutGroup(unhide)
    if not UnitFrames.CustomFrames.SmallGroup1 then
        return
    end

    local groupBarHeight = UnitFrames.SV.GroupBarHeight
    if UnitFrames.SV.CustomShieldBarSeparate then
        groupBarHeight = groupBarHeight + UnitFrames.SV.CustomShieldBarHeight
    end

    local group = UnitFrames.CustomFrames.SmallGroup1.tlw
    group:SetDimensions( UnitFrames.SV.GroupBarWidth, groupBarHeight*4 + UnitFrames.SV.GroupBarSpacing*3.5 )

    for i = 1, 4 do
        local unitFrame = UnitFrames.CustomFrames["SmallGroup" .. i]
        local unitTag = GetGroupUnitTagByIndex(i)

        local ghb = unitFrame[POWERTYPE_HEALTH] -- Not a backdrop

        unitFrame.control:ClearAnchors()
        unitFrame.control:SetAnchor( TOPLEFT, group, TOPLEFT, 0, 0.5*UnitFrames.SV.GroupBarSpacing + (groupBarHeight + UnitFrames.SV.GroupBarSpacing)*(i-1) )
        unitFrame.control:SetDimensions(UnitFrames.SV.GroupBarWidth, groupBarHeight)
        unitFrame.topInfo:SetWidth( UnitFrames.SV.GroupBarWidth-5 )

        unitFrame.levelIcon:ClearAnchors()

        if IsUnitGroupLeader(unitTag) then
            unitFrame.name:SetWidth(UnitFrames.SV.GroupBarWidth - 137)
            unitFrame.name:ClearAnchors()
            unitFrame.name:SetAnchor ( LEFT, unitFrame.topInfo, LEFT, 22, -8)
            unitFrame.levelIcon:SetAnchor( LEFT, unitFrame.topInfo, LEFT, unitFrame.name:GetTextWidth()+23, 0 )
            unitFrame.leader:SetTexture(leaderIcons[1])
        else
            unitFrame.name:SetWidth(UnitFrames.SV.GroupBarWidth - 115)
            unitFrame.name:ClearAnchors()
            unitFrame.name:SetAnchor ( LEFT, unitFrame.topInfo, LEFT, 0, -8)
            unitFrame.levelIcon:SetAnchor( LEFT, unitFrame.topInfo, LEFT, unitFrame.name:GetTextWidth()+1, 0 )
            unitFrame.leader:SetTexture(leaderIcons[0])
        end

        ghb.backdrop:SetDimensions(UnitFrames.SV.GroupBarWidth, UnitFrames.SV.GroupBarHeight)
        if ghb.shieldbackdrop then
            ghb.shieldbackdrop:ClearAnchors()
            ghb.shieldbackdrop:SetAnchor( TOP, ghb.backdrop, BOTTOM, 0, 0 )
            ghb.shieldbackdrop:SetDimensions( UnitFrames.SV.GroupBarWidth, UnitFrames.SV.CustomShieldBarHeight )
        end

        local role = GetGroupMemberSelectedRole(unitTag)

        -- First HP Label
        if UnitFrames.SV.RoleIconSmallGroup and role then
            ghb.labelOne:SetDimensions(UnitFrames.SV.GroupBarWidth-52, UnitFrames.SV.GroupBarHeight-2)
            ghb.labelOne:SetAnchor ( LEFT, phb, LEFT, 25, 0 )
            unitFrame.dead:ClearAnchors()
            unitFrame.dead:SetAnchor ( LEFT, phb, LEFT, 25, 0 )
        else
            ghb.labelOne:SetDimensions(UnitFrames.SV.GroupBarWidth-72, UnitFrames.SV.GroupBarHeight-2)
            ghb.labelOne:SetAnchor ( LEFT, phb, LEFT, 5, 0 )
            unitFrame.dead:ClearAnchors()
            unitFrame.dead:SetAnchor ( LEFT, phb, LEFT, 5, 0 )
        end
        unitFrame.roleIcon:SetHidden (not UnitFrames.SV.RoleIconSmallGroup)

        -- Second HP Label
        ghb.labelTwo:SetDimensions(UnitFrames.SV.GroupBarWidth-50, UnitFrames.SV.GroupBarHeight-2)
    end

    if unhide then
        group:SetHidden( false )
    end
end

-- Set dimensions of custom raid frame and anchors or raid group members
function UnitFrames.CustomFramesApplyLayoutRaid(unhide)
    if not UnitFrames.CustomFrames.RaidGroup1 then
        return
    end

    local itemsPerColumn =
        ( UnitFrames.SV.RaidLayout == "6 x 4" ) and 4 or
        ( UnitFrames.SV.RaidLayout == "4 x 6" ) and 6 or
        ( UnitFrames.SV.RaidLayout == "3 x 8" ) and 8 or
        ( UnitFrames.SV.RaidLayout == "2 x 12" ) and 12 or
        24

    local spacerHeight = 3
    local spacersPerColumn = { [4] = 1, [6] = 1.5, [8] = 2, [12] = 3, [24] = 6 }

    local raid = UnitFrames.CustomFrames.RaidGroup1.tlw

    raid:SetDimensions( UnitFrames.SV.RaidBarWidth * (24/itemsPerColumn) + (UnitFrames.SV.RaidSpacers and spacerHeight*(itemsPerColumn/4) or 0), UnitFrames.SV.RaidBarHeight * itemsPerColumn )

    -- For preview let us consider that large raid consists of 2 groups of 12 players, and display 2 independent preview backdrops
    -- They do not overlap, except for the case of '3 x 8' layout
    local groupWidth = UnitFrames.SV.RaidBarWidth * ( itemsPerColumn == 24 and 1 or math.floor(0.5 + 12/itemsPerColumn) )
    local groupHeight = UnitFrames.SV.RaidBarHeight * math.min(12,itemsPerColumn)

    raid.preview:SetDimensions( groupWidth, groupHeight )
    raid.preview2:SetDimensions( groupWidth, groupHeight )
    -- raid.preview is already anchored to TOPLEFT,TOPLEFT,0,0
    raid.preview2:ClearAnchors()
    raid.preview2:SetAnchor(TOPLEFT, raid, TOPLEFT, UnitFrames.SV.RaidBarWidth*math.floor(12/itemsPerColumn), UnitFrames.SV.RaidBarHeight*( itemsPerColumn == 24 and 12 or 0 ) )

    local column = 0    -- 0,1,2,3,4,5
    local row = 0       -- 1,2,3,...,24
    for i = 1, 24 do
        if row == itemsPerColumn then
            column = column + 1
            row = 1
        else
            row = row + 1
        end

        local unitFrame = UnitFrames.CustomFrames["RaidGroup" .. i]
        local unitTag = GetGroupUnitTagByIndex(i)

        unitFrame.control:ClearAnchors()
        unitFrame.control:SetAnchor( TOPLEFT, raid, TOPLEFT, UnitFrames.SV.RaidBarWidth*column, UnitFrames.SV.RaidBarHeight*(row-1) + (UnitFrames.SV.RaidSpacers and spacerHeight*(math.floor((i-1)/4)-math.floor(column*itemsPerColumn/4)) or 0) )
        unitFrame.control:SetDimensions( UnitFrames.SV.RaidBarWidth, UnitFrames.SV.RaidBarHeight )

        local role = GetGroupMemberSelectedRole(unitTag)

        -- If we have icons set to display
        if UnitFrames.SV.RaidIconOptions > 1 then
            if UnitFrames.SV.RaidIconOptions == 2 then -- Class Icon Only
                unitFrame.name:SetDimensions( UnitFrames.SV.RaidBarWidth-UnitFrames.SV.RaidNameClip-27, UnitFrames.SV.RaidBarHeight-2 )
                unitFrame.name:SetAnchor ( LEFT, rhb, LEFT, 22, 0 )
                unitFrame.roleIcon:SetHidden (true)
                unitFrame.classIcon:SetHidden (false)
            end
            if UnitFrames.SV.RaidIconOptions == 3 then -- Role Icon Only
                if role then
                    unitFrame.name:SetDimensions( UnitFrames.SV.RaidBarWidth-UnitFrames.SV.RaidNameClip-27, UnitFrames.SV.RaidBarHeight-2 )
                    unitFrame.name:SetAnchor ( LEFT, rhb, LEFT, 22, 0 )
                    unitFrame.roleIcon:SetHidden (false)
                    unitFrame.classIcon:SetHidden (true)
                end
            end
            if UnitFrames.SV.RaidIconOptions == 4 then -- Class PVP, Role PVE
                if LUIE.ResolvePVPZone() then
                    unitFrame.name:SetDimensions( UnitFrames.SV.RaidBarWidth-UnitFrames.SV.RaidNameClip-27, UnitFrames.SV.RaidBarHeight-2 )
                    unitFrame.name:SetAnchor ( LEFT, rhb, LEFT, 22, 0 )
                    unitFrame.roleIcon:SetHidden (true)
                    unitFrame.classIcon:SetHidden (false)
                elseif not LUIE.ResolvePVPZone() and role then
                    unitFrame.name:SetDimensions( UnitFrames.SV.RaidBarWidth-UnitFrames.SV.RaidNameClip-27, UnitFrames.SV.RaidBarHeight-2 )
                    unitFrame.name:SetAnchor ( LEFT, rhb, LEFT, 22, 0 )
                    unitFrame.roleIcon:SetHidden (false)
                    unitFrame.classIcon:SetHidden (true)
                else
                    -- Fallback if neither condition is true then we clear the frame
                    unitFrame.name:SetDimensions( UnitFrames.SV.RaidBarWidth-UnitFrames.SV.RaidNameClip-10, UnitFrames.SV.RaidBarHeight-2 )
                    unitFrame.name:SetAnchor ( LEFT, rhb, LEFT, 5, 0 )
                    unitFrame.roleIcon:SetHidden (true)
                    unitFrame.classIcon:SetHidden (true)
                end
            end
            if UnitFrames.SV.RaidIconOptions == 5 then -- Class PVE, Role PVP
                if LUIE.ResolvePVPZone() and role then
                    unitFrame.name:SetDimensions( UnitFrames.SV.RaidBarWidth-UnitFrames.SV.RaidNameClip-27, UnitFrames.SV.RaidBarHeight-2 )
                    unitFrame.name:SetAnchor ( LEFT, rhb, LEFT, 22, 0 )
                    unitFrame.roleIcon:SetHidden (false)
                    unitFrame.classIcon:SetHidden (true)
                elseif not LUIE.ResolvePVPZone() then
                    unitFrame.name:SetDimensions( UnitFrames.SV.RaidBarWidth-UnitFrames.SV.RaidNameClip-27, UnitFrames.SV.RaidBarHeight-2 )
                    unitFrame.name:SetAnchor ( LEFT, rhb, LEFT, 22, 0 )
                    unitFrame.roleIcon:SetHidden (true)
                    unitFrame.classIcon:SetHidden (false)
                else
                    -- Fallback if neither condition is true then we clear the frame
                    unitFrame.name:SetDimensions( UnitFrames.SV.RaidBarWidth-UnitFrames.SV.RaidNameClip-10, UnitFrames.SV.RaidBarHeight-2 )
                    unitFrame.name:SetAnchor ( LEFT, rhb, LEFT, 5, 0 )
                    unitFrame.roleIcon:SetHidden (true)
                    unitFrame.classIcon:SetHidden (true)
                end
            end
        else
            unitFrame.name:SetDimensions( UnitFrames.SV.RaidBarWidth-UnitFrames.SV.RaidNameClip-10, UnitFrames.SV.RaidBarHeight-2 )
            unitFrame.name:SetAnchor ( LEFT, rhb, LEFT, 5, 0 )
            unitFrame.roleIcon:SetHidden (true)
            unitFrame.classIcon:SetHidden (true)
        end

        if IsUnitGroupLeader(unitTag) then
            unitFrame.name:SetDimensions( UnitFrames.SV.RaidBarWidth-UnitFrames.SV.RaidNameClip-27, UnitFrames.SV.RaidBarHeight-2 )
            unitFrame.name:SetAnchor ( LEFT, rhb, LEFT, 22, 0 )
            unitFrame.roleIcon:SetHidden (true)
            unitFrame.classIcon:SetHidden (true)
            unitFrame.leader:SetTexture(leaderIcons[1])
        else
            unitFrame.leader:SetTexture(leaderIcons[0])
        end

        unitFrame.dead:SetDimensions(UnitFrames.SV.RaidBarWidth-50, UnitFrames.SV.RaidBarHeight-2)
        unitFrame[POWERTYPE_HEALTH].label:SetDimensions(UnitFrames.SV.RaidBarWidth-50, UnitFrames.SV.RaidBarHeight-2)

        if not IsUnitOnline(unitTag) then
            unitFrame.name:SetDimensions( UnitFrames.SV.RaidBarWidth-UnitFrames.SV.RaidNameClip, UnitFrames.SV.RaidBarHeight-2 )
            unitFrame.name:SetAnchor ( LEFT, rhb, LEFT, 5, 0 )
            unitFrame.classIcon:SetHidden (true)
        end
    end
    if unhide then
        raid:SetHidden( false )
    end
end

-- Set dimensions of custom companion frame and anchors
function UnitFrames.CustomFramesApplyLayoutCompanion(unhide)
    if not UnitFrames.CustomFrames.companion then
        return
    end

    local companion = UnitFrames.CustomFrames.companion.tlw
    companion:SetDimensions ( UnitFrames.SV.CompanionWidth, UnitFrames.SV.CompanionHeight )

    local unitFrame = UnitFrames.CustomFrames.companion
    unitFrame.control:ClearAnchors()
    unitFrame.control:SetAnchorFill()
    unitFrame.control:SetDimensions(UnitFrames.SV.CompanionWidth, UnitFrames.SV.CompanionHeight )
    unitFrame.name:SetDimensions( UnitFrames.SV.CompanionWidth - UnitFrames.SV.CompanionNameClip - 10, UnitFrames.SV.CompanionHeight-2 )
    unitFrame.name:SetAnchor(LEFT, shb, LEFT, 5, 0 )
    unitFrame[POWERTYPE_HEALTH].label:SetDimensions(UnitFrames.SV.CompanionWidth-50, UnitFrames.SV.CompanionHeight - 2)

    if unhide then
        companion:SetHidden (false )
    end

end

-- Set dimensions of custom pet frame and anchors
function UnitFrames.CustomFramesApplyLayoutPet(unhide)
    if not UnitFrames.CustomFrames.PetGroup1 then
        return
    end

    local petBarHeight = UnitFrames.SV.PetHeight

    local pet = UnitFrames.CustomFrames.PetGroup1.tlw
    pet:SetDimensions ( UnitFrames.SV.PetWidth, petBarHeight*7 + 21 )

    for i = 1, 7 do
        local unitFrame = UnitFrames.CustomFrames["PetGroup" .. i]

        unitFrame.control:ClearAnchors()
        unitFrame.control:SetAnchor( TOPLEFT, pet, TOPLEFT, 0, (petBarHeight + 3)*(i-1) )
        unitFrame.control:SetDimensions(UnitFrames.SV.PetWidth, petBarHeight)

        unitFrame.name:SetDimensions( UnitFrames.SV.PetWidth - UnitFrames.SV.PetNameClip - 10, UnitFrames.SV.PetHeight-2 )
        unitFrame.name:SetAnchor(LEFT, shb, LEFT, 5, 0 )

        unitFrame[POWERTYPE_HEALTH].label:SetDimensions(UnitFrames.SV.PetWidth-50, UnitFrames.SV.PetHeight - 2)
    end
    if unhide then
        pet:SetHidden (false )
    end

end

-- Set dimensions of custom raid frame and anchors or raid group members
function UnitFrames.CustomFramesApplyLayoutBosses()
    if not UnitFrames.CustomFrames.boss1 then
        return
    end

    local bosses = UnitFrames.CustomFrames.boss1.tlw

    bosses:SetDimensions( UnitFrames.SV.BossBarWidth, UnitFrames.SV.BossBarHeight * 6 + 2 * 5)

    for i = 1, 6 do
        local unitFrame = UnitFrames.CustomFrames["boss" .. i]

        unitFrame.control:ClearAnchors()
        unitFrame.control:SetAnchor( TOPLEFT, bosses, TOPLEFT, 0, (UnitFrames.SV.BossBarHeight+2)*(i-1) )
        unitFrame.control:SetDimensions( UnitFrames.SV.BossBarWidth, UnitFrames.SV.BossBarHeight )

        unitFrame.name:SetDimensions( UnitFrames.SV.BossBarWidth-50, UnitFrames.SV.BossBarHeight-2 )

        unitFrame[POWERTYPE_HEALTH].label:SetDimensions( UnitFrames.SV.BossBarWidth-50, UnitFrames.SV.BossBarHeight-2 )
    end

    bosses:SetHidden( false )
end

-- This function reduces opacity of custom frames when player is out of combat and has full attributes
function UnitFrames.CustomFramesApplyInCombat()
    local idle = true
    if UnitFrames.SV.CustomOocAlphaPower then
        for _, value in pairs(g_statFull) do
            idle = idle and value
        end
    else
        idle = g_statFull.combat
    end

    local oocAlphaPlayer = 0.01 * UnitFrames.SV.PlayerOocAlpha
    local incAlphaPlayer = 0.01 * UnitFrames.SV.PlayerIncAlpha

    local oocAlphaTarget = 0.01 * UnitFrames.SV.TargetOocAlpha
    local incAlphaTarget = 0.01 * UnitFrames.SV.TargetIncAlpha

    local oocAlphaBoss = 0.01 * UnitFrames.SV.BossOocAlpha
    local incAlphaBoss = 0.01 * UnitFrames.SV.BossIncAlpha

    local oocAlphaPet = 0.01 * UnitFrames.SV.PetOocAlpha
    local incAlphaPet = 0.01 * UnitFrames.SV.PetIncAlpha

    local oocAlphaCompanion = 0.01 * UnitFrames.SV.CompanionOocAlpha
    local incAlphaCompanion = 0.01 * UnitFrames.SV.CompanionIncAlpha

    -- Apply to all frames
    if UnitFrames.CustomFrames.player then
        UnitFrames.CustomFrames.player.control:SetAlpha( idle and oocAlphaPlayer or incAlphaPlayer )
        if UnitFrames.SV.HideBuffsPlayerOoc then
            UnitFrames.CustomFrames.player.buffs:SetHidden ( idle and true or false )
            UnitFrames.CustomFrames.player.debuffs:SetHidden ( idle and true or false )
        else
            UnitFrames.CustomFrames.player.buffs:SetHidden ( false )
            UnitFrames.CustomFrames.player.debuffs:SetHidden ( false )
        end
    end
    if UnitFrames.CustomFrames.AvaPlayerTarget then
        UnitFrames.CustomFrames.AvaPlayerTarget.control:SetAlpha( idle and oocAlphaTarget or incAlphaTarget )
    end
    if UnitFrames.CustomFrames.reticleover then
        UnitFrames.CustomFrames.reticleover.control:SetAlpha( idle and oocAlphaTarget or incAlphaTarget )
        if UnitFrames.SV.HideBuffsTargetOoc then
            UnitFrames.CustomFrames.reticleover.buffs:SetHidden ( idle and true or false )
            UnitFrames.CustomFrames.reticleover.debuffs:SetHidden ( idle and true or false )
        else
            UnitFrames.CustomFrames.reticleover.buffs:SetHidden ( false )
            UnitFrames.CustomFrames.reticleover.debuffs:SetHidden ( false )
        end
    end

    -- Set companion transparency
    if UnitFrames.CustomFrames.companion then
        UnitFrames.CustomFrames.companion.control:SetAlpha ( idle and oocAlphaCompanion or incAlphaCompanion)
    end

    -- Set boss transparency
    for i = 1, 6 do
        local unitTag = "boss" .. i
        if UnitFrames.CustomFrames[unitTag] then
            UnitFrames.CustomFrames[unitTag].control:SetAlpha ( idle and oocAlphaBoss or incAlphaBoss )
        end
    end

    -- Set pet transparency
    for i = 1, 7 do
        local unitTag = "PetGroup" .. i
        if UnitFrames.CustomFrames[unitTag] then
            UnitFrames.CustomFrames[unitTag].control:SetAlpha ( idle and oocAlphaPet or incAlphaPet)
        end
    end

end

function UnitFrames.CustomFramesGroupAlpha()
    local alphaGroup = 0.01 * UnitFrames.SV.GroupAlpha

    for i = 1, 4 do
        local unitTag = "SmallGroup" .. i
        if UnitFrames.CustomFrames[unitTag] then
           UnitFrames.CustomFrames[unitTag].control:SetAlpha( IsUnitInGroupSupportRange(UnitFrames.CustomFrames[unitTag].unitTag) and alphaGroup or ( alphaGroup / 2 ) )
        end
    end

    for i = 1, 24 do
        local unitTag = "RaidGroup" .. i
        if UnitFrames.CustomFrames[unitTag] then
            UnitFrames.CustomFrames[unitTag].control:SetAlpha( IsUnitInGroupSupportRange(UnitFrames.CustomFrames[unitTag].unitTag) and alphaGroup or ( alphaGroup / 2 ) )
        end
    end
end

-- Reload Names from Menu function call
function UnitFrames.CustomFramesReloadControlsMenu(player, group, raid)
    UnitFrames.UpdateStaticControls( g_DefaultFrames["player"] )
    UnitFrames.UpdateStaticControls( UnitFrames.CustomFrames["player"] )
    UnitFrames.UpdateStaticControls( g_AvaCustFrames["player"] )

    UnitFrames.UpdateStaticControls( g_DefaultFrames["reticleover"] )
    UnitFrames.UpdateStaticControls( UnitFrames.CustomFrames["reticleover"] )
    UnitFrames.UpdateStaticControls( g_AvaCustFrames["reticleover"] )

    for i = 1, 24 do
        local unitTag = "group" .. i
        UnitFrames.UpdateStaticControls( g_DefaultFrames[unitTag] )
        UnitFrames.UpdateStaticControls( UnitFrames.CustomFrames[unitTag] )
        UnitFrames.UpdateStaticControls( g_AvaCustFrames[unitTag] )
    end

    UnitFrames.CustomFramesApplyLayoutPlayer(player)
    UnitFrames.CustomFramesApplyLayoutGroup(group)
    UnitFrames.CustomFramesApplyLayoutRaid(raid)
end

function UnitFrames.CustomFramesReloadExecuteMenu()
    g_targetThreshold = UnitFrames.SV.ExecutePercentage

    if g_DefaultFrames.reticleover[POWERTYPE_HEALTH] then
        g_DefaultFrames.reticleover[POWERTYPE_HEALTH].threshold = g_targetThreshold
    end
    if UnitFrames.CustomFrames["reticleover"] and UnitFrames.CustomFrames["reticleover"][POWERTYPE_HEALTH] then
        UnitFrames.CustomFrames["reticleover"][POWERTYPE_HEALTH].threshold = g_targetThreshold
    end
    if g_AvaCustFrames["reticleover"] and g_AvaCustFrames["reticleover"][POWERTYPE_HEALTH] then
        g_AvaCustFrames["reticleover"][POWERTYPE_HEALTH].threshold = g_targetThreshold
    end

    for i = 1, 6 do
        local unitTag = "boss" .. i
        if UnitFrames.CustomFrames[unitTag] and UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH] then
            UnitFrames.CustomFrames[unitTag][POWERTYPE_HEALTH].threshold = g_targetThreshold
        end
    end
end

function UnitFrames.CustomFramesReloadLowResourceThreshold()
    g_healthThreshold = UnitFrames.SV.LowResourceHealth
    g_magickaThreshold = UnitFrames.SV.LowResourceMagicka
    g_staminaThreshold = UnitFrames.SV.LowResourceStamina

    if UnitFrames.CustomFrames["player"] and UnitFrames.CustomFrames["player"][POWERTYPE_HEALTH] then
        UnitFrames.CustomFrames["player"][POWERTYPE_HEALTH].threshold = g_healthThreshold
    end
    if UnitFrames.CustomFrames["player"] and UnitFrames.CustomFrames["player"][POWERTYPE_MAGICKA] then
        UnitFrames.CustomFrames["player"][POWERTYPE_MAGICKA].threshold = g_magickaThreshold
    end
    if UnitFrames.CustomFrames["player"] and UnitFrames.CustomFrames["player"][POWERTYPE_STAMINA] then
        UnitFrames.CustomFrames["player"][POWERTYPE_STAMINA].threshold = g_staminaThreshold
    end
end

--[[----------------------------------------------------------
 * DEBUG FUNCTIONS
--]]----------------------------------------------------------

function UnitFrames.CustomFramesDebugGroup()
    for i = 1, 4 do
        local unitTag = "SmallGroup" .. i
        UnitFrames.CustomFrames[unitTag].unitTag = "player"
        UnitFrames.CustomFrames[unitTag].control:SetHidden(false)
        UnitFrames.UpdateStaticControls( UnitFrames.CustomFrames[unitTag] )
    end
    UnitFrames.CustomFrames.SmallGroup1.friendIcon:SetHidden(false)
    UnitFrames.CustomFrames.SmallGroup1.friendIcon:SetTexture("/esoui/art/campaign/campaignbrowser_friends.dds")
    UnitFrames.OnLeaderUpdate( nil, "SmallGroup1" )
end

function UnitFrames.CustomFramesDebugRaid()
    for i = 1, 24 do
        local unitTag = "RaidGroup" .. i
        UnitFrames.CustomFrames[unitTag].unitTag = "player"
        UnitFrames.CustomFrames[unitTag].control:SetHidden(false)
        UnitFrames.UpdateStaticControls( UnitFrames.CustomFrames[unitTag] )
    end
    UnitFrames.OnLeaderUpdate( nil, "RaidGroup1" )
end

-- Updates group frames when a relevant social change event happens
function UnitFrames.SocialUpdateFrames()
    for i = 1, 24 do
        local unitTag = "group" .. i
        if DoesUnitExist(unitTag) then
            UnitFrames.ReloadValues(unitTag)
        end
    end
    UnitFrames.ReloadValues("reticleover")
end
