--[[
    LuiExtended
    License: The MIT License (MIT)
--]]

LUIE.CampaignNames = { }

local SlashCommands = LUIE.SlashCommands

local printToChat = LUIE.PrintToChat
local zo_strformat = zo_strformat

-- Slash Command to port to primary home
function SlashCommands.SlashHome(option)

    -- Check option is valid if it exists
    -- Return an error message if no input is entered.
    if option and option ~= "" then
        if option ~= "inside" and option ~= "outside" then
            printToChat(GetString(SI_LUIE_SLASHCMDS_HOME_TRAVEL_FAILED_OPTION), true)
            if LUIE.SV.TempAlertHome then
                ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, (GetString(SI_LUIE_SLASHCMDS_HOME_TRAVEL_FAILED_OPTION)))
            end
            PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
            return
        end
    end

    local primaryHouse = GetHousingPrimaryHouse()
    -- Check if we are in combat
    if IsUnitInCombat("player") then
        printToChat(GetString(SI_LUIE_SLASHCMDS_HOME_TRAVEL_FAILED_IN_COMBAT), true)
        if LUIE.SV.TempAlertHome then
            ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, (GetString(SI_LUIE_SLASHCMDS_HOME_TRAVEL_FAILED_IN_COMBAT)))
        end
        PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
        return
    end
    -- Check to make sure we're not in Imperial City
    if IsInImperialCity() then
        printToChat(GetString(SI_LUIE_SLASHCMDS_HOME_TRAVEL_FAILED_IC), true)
        if LUIE.SV.TempAlertHome then
            ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, (GetString(SI_LUIE_SLASHCMDS_HOME_TRAVEL_FAILED_IC)))
        end
        PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
        return
    end
    -- Check to make sure we're not in Cyrodiil
    if IsPlayerInAvAWorld() then
        printToChat(GetString(SI_LUIE_SLASHCMDS_HOME_TRAVEL_FAILED_AVA), true)
        if LUIE.SV.TempAlertHome then
            ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, (GetString(SI_LUIE_SLASHCMDS_HOME_TRAVEL_FAILED_AVA)))
        end
        PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
        return
    end
    -- Check to make sure we're not in a battleground
    if IsActiveWorldBattleground() then
        printToChat(GetString(SI_LUIE_SLASHCMDS_HOME_TRAVEL_FAILED_BG), true)
        if LUIE.SV.TempAlertHome then
            ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, (GetString(SI_LUIE_SLASHCMDS_HOME_TRAVEL_FAILED_BG)))
        end
        PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
        return
    end

    -- Check if user set a primary home
    if primaryHouse == 0 then
        printToChat(GetString(SI_LUIE_SLASHCMDS_HOME_TRAVEL_FAILED_NOHOME), true)
        if LUIE.SV.TempAlertHome then
            ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, (GetString(SI_LUIE_SLASHCMDS_HOME_TRAVEL_FAILED_NOHOME)))
        end
        PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
    else
        -- Check whether we should be porting inside or outside
        local outside
        if option and (option == "inside" or option == "outside") then
            if option == "inside" then
                outside = false
            elseif option == "outside" then
                outside = true
            end
        else
            outside = SlashCommands.SV.SlashHomeChoice == 2 and true or false
        end
        RequestJumpToHouse(primaryHouse, outside)
        local string = outside and GetString(SI_LUIE_SLASHCMDS_HOME_TRAVEL_SUCCESS_MSG_OUT) or GetString(SI_LUIE_SLASHCMDS_HOME_TRAVEL_SUCCESS_MSG_IN)
        printToChat(string, true)
        if LUIE.SV.TempAlertHome then
            ZO_Alert(UI_ALERT_CATEGORY_ALERT, nil, (string))
        end
    end
end

function SlashCommands.SlashSetPrimaryHome()
    local currentHouse = GetCurrentZoneHouseId()
    if currentHouse ~= nil and currentHouse > 0 then
        local houseName = GetPlayerActiveZoneName()
        if IsOwnerOfCurrentHouse() then
            if IsPrimaryHouse(currentHouse) then
                printToChat(zo_strformat(GetString(SI_LUIE_SLASHCMDS_SET_HOME_FAILED_ALREADY), houseName), true)
                if LUIE.SV.TempAlertHome then
                    ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, (zo_strformat(GetString(SI_LUIE_SLASHCMDS_SET_HOME_FAILED_ALREADY), houseName)))
                end
                PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
                return
            else
                SetHousingPrimaryHouse(currentHouse)
                printToChat(zo_strformat(GetString(SI_LUIE_SLASHCMDS_SET_HOME_SUCCESS_MSG), houseName), true)
                if LUIE.SV.TempAlertHome then
                    ZO_Alert(UI_ALERT_CATEGORY_ALERT, nil, (zo_strformat(GetString(SI_LUIE_SLASHCMDS_SET_HOME_SUCCESS_MSG), houseName)))
                end
            end
        else
            printToChat(GetString(SI_LUIE_SLASHCMDS_SET_HOME_FAILED_NOT_OWNER), true)
            if LUIE.SV.TempAlertHome then
                ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, (GetString(SI_LUIE_SLASHCMDS_SET_HOME_FAILED_NOT_OWNER)))
            end
            PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
            return
        end
    else
        printToChat(GetString(SI_LUIE_SLASHCMDS_SET_HOME_FAILED_NOHOME), true)
        if LUIE.SV.TempAlertHome then
            ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, (GetString(SI_LUIE_SLASHCMDS_SET_HOME_FAILED_NOHOME)))
        end
        PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
        return
    end

end

-- Slash Command to initiate a trade dialogue
function SlashCommands.SlashTrade(option)
    if option == "" or option == nil then
        printToChat(GetString(SI_LUIE_SLASHCMDS_TRADE_FAILED_NONAME), true)
        if LUIE.ChatAnnouncements.SV.Notify.NotificationTradeAlert then
            ZO_Alert(UI_ALERT_CATEGORY_ERROR, SOUNDS.GENERAL_ALERT_ERROR, (GetString(SI_LUIE_SLASHCMDS_TRADE_FAILED_NONAME)))
        end
        PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
        return
    end
    TradeInviteByName(option)
end

local firstRun = true -- Changed by SlashCommands.SlashCampaignQ() when called, used to index available campaigns.

-- Slash Command to queue for a campaign
function SlashCommands.SlashCampaignQ(option)
    -- Return an error message if no input is entered.
    if option == "" or option == nil then
        printToChat(GetString(SI_LUIE_SLASHCMDS_CAMPAIGN_FAILED_NONAME), true)
        if LUIE.SV.TempAlertCampaign then
            ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, GetString(SI_LUIE_SLASHCMDS_CAMPAIGN_FAILED_NONAME))
        end
        PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
        return
    end

    -- Return an error message if the player is in a battleground (can't queue for campaigns in a battleground).
    if IsActiveWorldBattleground() then
        printToChat(GetString(SI_LUIE_SLASHCMDS_CAMPAIGN_FAILED_BG), true)
        if LUIE.SV.TempAlertCampaign then
            ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, GetString(SI_LUIE_SLASHCMDS_CAMPAIGN_FAILED_BG))
        end
        PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
        return
    end

    -- The first time we call this function and it passes a check to make sure input is valid, fill a table with campaign names and their corresponding id.
    if firstRun then
        firstRun = false
        for i = 1, 200 do -- TODO: Find a way to determine # of campaigns dynamically instead of iterating.
            local campaignName = string.lower(GetCampaignName(i))
            if campaignName ~= "" and campaignName ~= nil then
                LUIE.CampaignNames[campaignName] = i
            end
        end
    end

    -- If input is valid and the name is in the campaign table, try to queue for the campaign.
    local option = string.lower(option)
    if LUIE.CampaignNames[option] then
        local campaignId = LUIE.CampaignNames[option]
        local campaignName = GetCampaignName(campaignId)

        if GetAssignedCampaignId() == campaignId or GetGuestCampaignId() == campaignId then
            QueueForCampaign(campaignId)
            printToChat(zo_strformat(GetString(SI_LUIE_SLASHCMDS_CAMPAIGN_QUEUE), campaignName), true)
            if LUIE.SV.TempAlertCampaign then
                ZO_Alert(UI_ALERT_CATEGORY_ALERT, nil, zo_strformat(GetString(SI_LUIE_SLASHCMDS_CAMPAIGN_QUEUE), campaignName))
            end
            return
        else
            printToChat(GetString(SI_LUIE_SLASHCMDS_CAMPAIGN_FAILED_NOT_ENTERED), true)
            if LUIE.SV.TempAlertCampaign then
                ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, GetString(SI_LUIE_SLASHCMDS_CAMPAIGN_FAILED_NOT_ENTERED))
            end
            PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
            return
        end
    end

    -- Otherwise, return an error message that the campaign doesn't exist.
    printToChat(GetString(SI_LUIE_SLASHCMDS_CAMPAIGN_FAILED_WRONGCAMPAIGN), true)
    if LUIE.SV.TempAlertCampaign then
        ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, GetString(SI_LUIE_SLASHCMDS_CAMPAIGN_FAILED_WRONGCAMPAIGN))
    end
    PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
end

-- Slash Command to use collectibles based on their collectible id
function SlashCommands.SlashCollectible(id)

    -- Determine ID
    if id == "banker" then
        if SlashCommands.SV.SlashBankerChoice == 1 then
            id = 267 -- Tythis
        else
            id = 6376 -- Ezabi
        end
    elseif id == "merchant" then
        if SlashCommands.SV.SlashMerchantChoice == 1 then
            id = 301 -- Nuzhimeh
        else
            id = 6378 -- Ferez
        end
    end

    -- Check to make sure we're not in Imperial City
    if IsInImperialCity() then
        printToChat(zo_strformat(GetString(SI_LUIE_SLASHCMDS_COLLECTIBLE_FAILED_IC), GetCollectibleName(id)), true)
        if LUIE.SV.TempAlertHome then
            ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, zo_strformat(GetString(SI_LUIE_SLASHCMDS_COLLECTIBLE_FAILED_IC), GetCollectibleName(id)))
        end
        PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
        return
    end
    -- Check to make sure we're not in Cyrodiil
    if IsPlayerInAvAWorld() then
        printToChat(zo_strformat(GetString(SI_LUIE_SLASHCMDS_COLLECTIBLE_FAILED_AVA), GetCollectibleName(id)), true)
        if LUIE.SV.TempAlertHome then
            ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, zo_strformat(GetString(SI_LUIE_SLASHCMDS_COLLECTIBLE_FAILED_AVA), GetCollectibleName(id)))
        end
        PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
        return
    end
    -- Check to make sure we're not in a battleground
    if IsActiveWorldBattleground() then
        printToChat(zo_strformat(GetString(SI_LUIE_SLASHCMDS_COLLECTIBLE_FAILED_BG), GetCollectibleName(id)), true)
        if LUIE.SV.TempAlertHome then
            ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, zo_strformat(GetString(SI_LUIE_SLASHCMDS_COLLECTIBLE_FAILED_BG), GetCollectibleName(id)))
        end
        PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
        return
    end

    -- If this is a Banker/Merchant/Fence/Companion and we are in a player home then display a message that the collectible can't be used here.
    if id == 300 or id == 267 or id == 6376 or id == 301 or id == 6378 or id == 8006 or id == 9245 or id == 9353 then
        local currentHouse = GetCurrentZoneHouseId()
        if currentHouse ~= nil and currentHouse > 0 then
            printToChat(zo_strformat(GetString(SI_LUIE_SLASHCMDS_COLLECTIBLE_FAILED_HOME), GetCollectibleName(id)), true)
            if LUIE.SV.TempAlertHome then
                ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, zo_strformat(GetString(SI_LUIE_SLASHCMDS_COLLECTIBLE_FAILED_HOME), GetCollectibleName(id)))
            end
            PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
            return
        end
    end

    if IsCollectibleUnlocked(id) then
        UseCollectible(id)
        LUIE.SlashCollectibleOverride = true
        if id ~= 300 and id ~= 267 and id ~= 6376 and id ~= 301 and id ~= 6378 and id ~= 8006 and id ~= 9245 and id ~= 9353 then
            LUIE.LastMementoUsed = id
        end
    else
        printToChat(zo_strformat(GetString(SI_LUIE_SLASHCMDS_COLLECTIBLE_FAILED_NOTUNLOCKED), GetCollectibleName(id)), true)
        if LUIE.SV.TempAlertHome then
            ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, zo_strformat(GetString(SI_LUIE_SLASHCMDS_COLLECTIBLE_FAILED_NOTUNLOCKED), GetCollectibleName(id)))
        end
        PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
        return
    end

end

function SlashCommands.SlashCompanion(option)

    -- Return an error if input is not blank and is not valid
    if option and (option ~= "" and option ~= "bastian" and option ~= "mirri") then
        printToChat(GetString(SI_LUIE_SLASHCMDS_COMPANION_FAILED_OPTION), true)
        if LUIE.SV.TempAlertHome then
            ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, zo_strformat(GetString(SI_LUIE_SLASHCMDS_COLLECTIBLE_FAILED_IC), GetCollectibleName(id)))
        end
        PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
        return
    end

    -- If we have valid input then summon the relevant companion
    if option == "bastian" then
        SlashCommands.SlashCollectible(9245)
    elseif option == "mirri" then
        SlashCommands.SlashCollectible(9353)
    end

    -- If we have no additional input that use dropdown option
    if option == nil or option == "" then
        -- Determine ID
        if SlashCommands.SV.SlashCompanionChoice == 1 then
            SlashCommands.SlashCollectible(9245)
        else
            SlashCommands.SlashCollectible(9353)
        end
    end

end

-- Slash Command to equip a chosen outfit by number
function SlashCommands.SlashOutfit(option)
    if option == "" or option == nil then
        printToChat(GetString(SI_LUIE_SLASHCMDS_OUTFIT_NOT_VALID))
        if LUIE.SV.TempAlertOutfit then
            ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, GetString(SI_LUIE_SLASHCMDS_OUTFIT_NOT_VALID))
        end
        PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
        return
    end

    local valid = tonumber(option)
    if not valid or valid > 10 then
        printToChat(GetString(SI_LUIE_SLASHCMDS_OUTFIT_NOT_VALID))
        if LUIE.SV.TempAlertOutfit then
            ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, GetString(SI_LUIE_SLASHCMDS_OUTFIT_NOT_VALID))
        end
        PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
        return
    end

    local numOutfits = GetNumUnlockedOutfits(GAMEPLAY_ACTOR_CATEGORY_PLAYER)

    if valid > numOutfits then
        printToChat(zo_strformat(GetString(SI_LUIE_SLASHCMDS_OUTFIT_NOT_UNLOCKED), valid))
        if LUIE.SV.TempAlertOutfit then
            ZO_Alert(UI_ALERT_CATEGORY_ERROR, nil, zo_strformat(GetString(SI_LUIE_SLASHCMDS_OUTFIT_NOT_UNLOCKED), valid))
        end
        PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
        return
    end

    EquipOutfit(GAMEPLAY_ACTOR_CATEGORY_PLAYER, valid)
    -- Display a confirmation message.
    local name = GetOutfitName(GAMEPLAY_ACTOR_CATEGORY_PLAYER, valid)
    if name == "" then
        name = zo_strformat("<<1>> <<2>>", GetString(SI_CROWN_STORE_SEARCH_ADDITIONAL_OUTFITS), valid)
    end
    printToChat(zo_strformat(GetString(SI_LUIE_SLASHCMDS_OUTFIT_CONFIRMATION), name))
    if LUIE.SV.TempAlertOutfit then
        ZO_Alert(UI_ALERT_CATEGORY_ALERT, nil, zo_strformat(GetString(SI_LUIE_SLASHCMDS_OUTFIT_CONFIRMATION), name))
    end
end

-- Slash Command to report a player by given name and attach useful information
function SlashCommands.SlashReport(player)
    local location = GetPlayerLocationName()
    local currenttime = GetTimeString()
    local currentdate = GetDateStringFromTimestamp(GetTimeStamp())
    local server = GetWorldName()
    local text = "I've encounterd a suspicious player.\n\nName: <<1>>\nLocation: <<2>>\nDate & Time: <<3>> <<4>>\nServer: <<5>>"

    -- Set the category to report a player
    HELP_CUSTOMER_SERVICE_ASK_FOR_HELP_KEYBOARD:SelectCategory(2)
    -- Set the subcategory (default: Other)
    HELP_CUSTOMER_SERVICE_ASK_FOR_HELP_KEYBOARD:SelectSubcategory(4)

    -- Populate the reporting window name and description
    ZO_Help_Ask_For_Help_Keyboard_ControlDetailsTextLineField:SetText(player)
	ZO_Help_Ask_For_Help_Keyboard_ControlDescriptionBodyField:SetText(zo_strformat(text, player, location, currentdate, currenttime, server))

    -- Open the reporting window
    HELP_CUSTOMER_SUPPORT_KEYBOARD:OpenScreen(HELP_CUSTOMER_SERVICE_ASK_FOR_HELP_KEYBOARD_FRAGMENT)
end

local petIds = {
    [23304] = "[Familiar]", -- Summon Unstable Familiar (Sorcerer)
    [23319] = "[Clannfear]", -- Summon Unstable Clannfear (Sorcerer)
    [23316] = "[Volatile Familiar]", -- Summon Volatile Familiar (Sorcerer)
    [24613] = "[Winged Twilight]", -- Summon Winged Twilight (Sorcerer)
    [24636] = "[Twilight Tormentor]", -- Summon Twilight Tormentor (Sorcerer)
    [24639] = "[Twilight Matriarch]", -- Summon Twilight Matriarch (Sorcerer)
    [85982] = "[Feral Guardian]", -- Feral Guardian (Warden)
    [85986] = "[Eternal Guardian]", -- Eternal Guardian (Warden)
    [85990] = "[Wild Guardian]", -- Wild Guardian (Warden)
}

-- Slash Command to dismiss pets and optionally non-combat pets
function SlashCommands.SlashPet()
    for i = 1, GetNumBuffs("player") do
        local _, _, _, buffSlot, _, _, _, _, _, _, abilityId = GetUnitBuffInfo("player", i)
        if petIds[abilityId] then
            CancelBuff(buffSlot)
            if SlashCommands.SV.SlashPetMessage then
                local petName = petIds[abilityId]
                local message = zo_strformat(GetString(SI_LUIE_DISMISS_PET), petName)
                printToChat(message)
            end
        end
    end
end
