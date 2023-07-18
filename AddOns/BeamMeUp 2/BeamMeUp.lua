local SI = Teleporter.SI
local teleporterVars = Teleporter.var
local appName = teleporterVars.appName

--Old code from TeleUnicorn -> Moved directly to Teleporter to strip the library
Teleporter.throttled = {}
local current_ms, last_render_ms
function Teleporter.throttle(key, frequency)
	current_ms = GetFrameTimeMilliseconds() / 1000.0
	last_render_ms = Teleporter.throttled[key] or 0

	if current_ms > (last_render_ms + frequency) then
		Teleporter.throttled[key] = current_ms
		return false
	end

	return true
end

local function alertTeleporterLoaded()
	teleporterVars.playerName = GetUnitName("player")
    EVENT_MANAGER:UnregisterForEvent(appName, EVENT_PLAYER_ACTIVATED)
end


local function PlayerInitAndReady()
    zo_callLater(function() alertTeleporterLoaded() end, 1500)
end


----------------------------------- KeyBinds
function Teleporter.PortalHandlerKeyPress(index, favorite)
	-- Port to Group Leader
	if index == 12 then
		Teleporter.portToGroupLeader()
		return
	end
	
	-- Port to current zone
	if index == 17 then
		Teleporter.portToCurrentZone()
		return
	end
	
	-- Port to currently tracked/focused quest
	if index == 19 then
		Teleporter.portToTrackedQuestZone()
		return
	end
	
	-- Port into own Primary Residence
	if index == 13 then
		Teleporter.portToOwnHouse(true, nil, false, nil)
		return
	end
	
	-- Port outside own Primary Residence
	if index == 18 then
		Teleporter.portToOwnHouse(true, nil, true, nil)
		return
	end
	
	-- Port to BMU guild house
	if index == 14 then
		Teleporter.portToBMUGuildHouse()
		return
	end
	
	-- Unlock Wayshrines
	if index == 10 then
		Teleporter.dialogAutoUnlock()
		return
	end
	
	-- Zone Favorites
	if index == 15 then
		local fZoneId = Teleporter.savedVarsServ.favoriteListZones[favorite]
			if fZoneId == nil then
				d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_FAVORITE_UNSET))
				return
			end
		local result = Teleporter.createTable({index=6, fZoneId=fZoneId, dontDisplay=true})
		local firstRecord = result[1]
		if firstRecord.displayName ~= "" then
			Teleporter.PortalToPlayer(firstRecord.displayName, firstRecord.sourceIndexLeading, firstRecord.zoneName, firstRecord.zoneId, firstRecord.category, true, true, true)
		elseif firstRecord.isOwnHouse then
			Teleporter.portToOwnHouse(false, firstRecord.houseId, true, firstRecord.parentZoneName)
		else
			d("[" .. Teleporter.var.appNameAbbr .. "]: " .. Teleporter.formatName(GetZoneNameById(fZoneId), Teleporter.savedVarsAcc.formatZoneName) .. " - " .. SI.get(SI.TELE_CHAT_FAVORITE_ZONE_NO_FAST_TRAVEL))
		end
		return
	end
	
	-- Player Favorites
	if index == 16 then
		local displayName = Teleporter.savedVarsServ.favoriteListPlayers[favorite]
			if displayName == nil then
				d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_FAVORITE_UNSET))
				return
			end
		local result = Teleporter.createTable({index=2, inputString=displayName, dontDisplay=true})
		local firstRecord = result[1]
		if firstRecord.displayName == "" then
			d("[" .. Teleporter.var.appNameAbbr .. "]: " .. displayName .. " - " .. SI.get(SI.TELE_CHAT_FAVORITE_PLAYER_NO_FAST_TRAVEL))
		else
			Teleporter.PortalToPlayer(firstRecord.displayName, firstRecord.sourceIndexLeading, firstRecord.zoneName, firstRecord.zoneId, firstRecord.category, true, false, true)
		end
		return
	end
	
    -- Show/Hide UI with specific Tab
	if Teleporter.win.Main_Control:IsHidden() then
		-- window is hidden
		if index == 11 then
			-- do nothing if window is hidden and user refresh manually
			return
		end
		
		-- open specific tab
		SetGameCameraUIMode(true)
		Teleporter.OpenTeleporter(false)
		if index == 6 then
			-- dungeon finder
			Teleporter.createTableDungeons()
		else
			Teleporter.createTable({index=index})
		end
	else
		-- window is shown
		if index == 11 then -- Refresh list
			Teleporter.refreshListAuto()
		else
			if index ~= Teleporter.state then
				-- index is different -> switch tab
				Teleporter.createTable({index=index})
			else
				-- same index -> hide UI
				Teleporter.HideTeleporter()
				SetGameCameraUIMode(false)
			end
		end
    end
end
-----------------------------------


function Teleporter.onMapShow()
	-- no support for gamepad mode + stay hidden when using the "HarvestFarmTour Editor"
	if Teleporter.win.Main_Control:IsHidden() and not IsInGamepadPreferredMode() and not SCENE_MANAGER:IsShowing("HarvestFarmScene") then
		if Teleporter.savedVarsAcc.ShowOnMapOpen then
			-- just open Teleporter
			Teleporter.OpenTeleporter(true)
		else
			-- display button to open Teleporter
			if Teleporter.win.MapOpen then
				Teleporter.win.MapOpen:SetHidden(false)
			end
		end
	else
		-- BMU is open -> update position
		Teleporter.updatePosition()
	end
end


function Teleporter.onMapHide()
	-- hide button
	if Teleporter.win.MapOpen then
		Teleporter.win.MapOpen:SetHidden(true)
	end
	
	-- decide if it stays
	if Teleporter.savedVarsAcc.HideOnMapClose then
		Teleporter.HideTeleporter()
	else
		Teleporter.updatePosition()
	end
	
	-- hide ZoneGuide (just to be on the safe side)
	Teleporter.toggleZoneGuide(false)
end


-- solves incompatibility issue to Votan's Minimap
function Teleporter.WorldMapStateChanged(oldState, newState)
    if (newState == SCENE_SHOWING) then
        Teleporter.onMapShow()
    elseif (newState == SCENE_HIDING) then
        Teleporter.onMapHide()
    end
end


function Teleporter.PortalHandlerLayerPushed(eventCode, layerIndex, activeLayerIndex)
	if layerIndex ~= 7 then -- 7 -> Mouse Camera Mode changed, dont know, why this event triggers Layer-Pushed event
		if not SCENE_MANAGER:IsShowing("worldMap") then
		
			-- user opens menu like inventory etc.
			if Teleporter.savedVarsAcc.windowStay and not Teleporter.win.Main_Control:IsHidden() then
				Teleporter.displayComeback = true
			end
			
			Teleporter.HideTeleporter()			
		end
	end
end


function Teleporter.PortalHandlerLayerPopped()
	if Teleporter.displayComeback == true then
		Teleporter.OpenTeleporter(true)
		Teleporter.displayComeback = false
	end
end



function Teleporter.OpenTeleporter(refresh)
	-- show notification (in case)
	Teleporter.showNotification()
	
	if not ZO_WorldMapZoneStoryTopLevel_Keyboard:IsHidden() then
		--hide ZoneGuide
		Teleporter.toggleZoneGuide(false)
		-- show swap button
		Teleporter.closeBtnSwitchTexture(true)
	else
		--show normal close button
		Teleporter.closeBtnSwitchTexture(false)
	end
	
	-- positioning window
	Teleporter.updatePosition()

	if Teleporter.win.MapOpen then
		 -- hide open button
		Teleporter.win.MapOpen:SetHidden(true)
	end
    Teleporter.win.Main_Control:SetHidden(false) -- show main window
	Teleporter.initializeBlacklist()
	if Teleporter.savedVarsAcc.autoRefresh and refresh then
		Teleporter.clearInputFields()
		Teleporter.createTable({index=0})
	end
	
	-- start auto refresh
	if Teleporter.savedVarsAcc.autoRefreshFreq ~= 0 then
		zo_callLater(function() Teleporter.startCountdownAutoRefresh() end, Teleporter.savedVarsAcc.autoRefreshFreq*1000)
	end
	
	-- focus search box if enabled
	if Teleporter.savedVarsAcc.focusZoneSearchOnOpening then
		Teleporter.win.Searcher_Zone:TakeFocus()
	end
end


function Teleporter.HideTeleporter()
    Teleporter.win.Main_Control:SetHidden(true) -- hide main window
	ClearMenu() -- close all submenus
	
	if SCENE_MANAGER:IsShowing("worldMap") then
		-- show button only when main window is hidden and world map is open
		if Teleporter.win.MapOpen then
			Teleporter.win.MapOpen:SetHidden(false)
		end
		
		-- show ZoneGuide
		Teleporter.toggleZoneGuide(true)
	end
end



function Teleporter.cameraModeChanged()
	if not Teleporter.savedVarsAcc.windowStay then
		-- hide window, when player moved or camera mode changed
		if not IsGameCameraUIModeActive() then
			Teleporter.HideTeleporter()
		end
	end
end



-- triggered when ZoneGuide will be displayed (e.g. when worldMap is open and zone changed)
function Teleporter.onZoneGuideShow()
	--check if Teleporter is displayed
	if not Teleporter.win.Main_Control:IsHidden() then
		-- Teleporter is displayed -> hide ZoneGuide
		Teleporter.toggleZoneGuide(false)
	end
end


-- show/hide ZoneGuide window
function Teleporter.toggleZoneGuide(show)
	if show then
		-- show ZoneGuide
		--ZO_WorldMapZoneStoryTopLevel_Keyboard:SetHidden(false)
		--ZO_SharedMediumLeftPanelBackground:SetHidden(false)
		WORLD_MAP_SCENE:AddFragment(WORLD_MAP_ZONE_STORY_KEYBOARD_FRAGMENT)
	else
		-- hide ZoneGuide
		--ZO_WorldMapZoneStoryTopLevel_Keyboard:SetHidden(true)
		--ZO_SharedMediumLeftPanelBackground:SetHidden(true)
		WORLD_MAP_SCENE:RemoveFragment(WORLD_MAP_ZONE_STORY_KEYBOARD_FRAGMENT)
	end
end


----------------------------
function Teleporter.initializeBlacklist()
	-- check which blacklists are activated and merge them together to one HashMap
	Teleporter.blacklist = {}
	
	-- hide Others (inaccessible zones)
	if Teleporter.savedVarsAcc.hideOthers then
		Teleporter.joinBlacklist(Teleporter.blacklistOthers)
		Teleporter.joinBlacklist(Teleporter.blacklistRefuges)
		Teleporter.joinBlacklist(Teleporter.blacklistSoloArenas)
	end
	
	-- hide PVP zones
	if Teleporter.savedVarsAcc.hidePVP then
		Teleporter.joinBlacklist(Teleporter.blacklistCyro)
		Teleporter.joinBlacklist(Teleporter.blacklistImpCity)
		Teleporter.joinBlacklist(Teleporter.blacklistBattlegrounds)
	end

	-- hide 4 men Dungeons, 12 men Raids, Group Zones
	if Teleporter.savedVarsAcc.hideClosedDungeons then
		Teleporter.joinBlacklist(Teleporter.blacklistGroupDungeons)
		Teleporter.joinBlacklist(Teleporter.blacklistRaids)
		Teleporter.joinBlacklist(Teleporter.blacklistGroupZones)
		Teleporter.joinBlacklist(Teleporter.blacklistGroupArenas)
	end
	
	-- hide Houses
	if Teleporter.savedVarsAcc.hideHouses then
		Teleporter.joinBlacklist(Teleporter.blacklistHouses)
	end
	
	-- hide Delves
	if Teleporter.savedVarsAcc.hideDelves then
		Teleporter.joinBlacklist(Teleporter.getAllDelves())
	end
	
	-- hide Public Dungeons
	if Teleporter.savedVarsAcc.hidePublicDungeons then
		Teleporter.joinBlacklist(Teleporter.getAllPublicDungeons())
	end
end


function Teleporter.initializeCategoryMap()
	Teleporter.CategoryMap = {}
	-- go over each category list and add to hash map
	-- 1 = Delves, 2 = Public Dungeons, 3 = Houses, 4 = 4 men Group Dungeons, 5 = 12 men Raids (Trails), 6 = Group Zones (Dragonstar, Group Dungeons in Craglorn)
	
	-- Delves
	for index, value in pairs(Teleporter.getAllDelves()) do
		Teleporter.CategoryMap[value] = 1
	end
	
	-- Public Dungeons
	for index, value in pairs(Teleporter.getAllPublicDungeons()) do
		Teleporter.CategoryMap[value] = 2
	end

	-- Houses
	for index, value in pairs(Teleporter.blacklistHouses) do
		Teleporter.CategoryMap[value] = 3
	end
	
	-- 4 men Group Dungeons
	for index, value in pairs(Teleporter.blacklistGroupDungeons) do
		Teleporter.CategoryMap[value] = 4
	end
	
	-- 12 men Raids (Trials)
	for index, value in pairs(Teleporter.blacklistRaids) do
		Teleporter.CategoryMap[value] = 5
	end
	
	-- Group Zones
	for index, value in pairs(Teleporter.blacklistGroupZones) do
		Teleporter.CategoryMap[value] = 6
	end
	
	-- Group Arenas
	for index, value in pairs(Teleporter.blacklistGroupArenas) do
		Teleporter.CategoryMap[value] = 7
	end
	
	-- Solo Arenas
	for index, value in pairs(Teleporter.blacklistSoloArenas) do
		Teleporter.CategoryMap[value] = 8
	end
	
	-- Overland Zones
	for parentZoneId, tableObject in pairs(Teleporter.overlandDelvesPublicDungeons) do
		Teleporter.CategoryMap[parentZoneId] = 9
	end
end

function Teleporter.initializeParentMap()
	Teleporter.ParentMap = {}
	-- go over global list and add every zone with its parent [Delve/PD zoneId] -> [Parent map zoneId]
	for parentZoneId, tableObject in pairs(Teleporter.overlandDelvesPublicDungeons) do
		for index, zoneId in ipairs(tableObject.delves) do
			Teleporter.ParentMap[zoneId] = parentZoneId
		end
		for index, zoneId in ipairs(tableObject.publicDungeons) do
			Teleporter.ParentMap[zoneId] = parentZoneId
		end
	end
end
----------------------------

-- call function after countdown and repeat
function Teleporter.startCountdownAutoRefresh()
	if not Teleporter.win.Main_Control:IsHidden() and not Teleporter.blockCountdown then
		Teleporter.blockCountdown = true
		Teleporter.refreshListAuto()
		zo_callLater(function()
			Teleporter.blockCountdown = false
			Teleporter.startCountdownAutoRefresh()
		end, Teleporter.savedVarsAcc.autoRefreshFreq*1000)
	end
end

-- displays notifications
-- itemTabClicked = true -> Tab for treasure and survey maps was clicked
function Teleporter.showNotification(itemTabClicked)
	-- only if treasure and survey map tab was clicked
	if itemTabClicked then
		-- new feature: Survey Maps Notification
		--[[ TEMPORARILY DEACTIVATED UNTIL FEATURE IS WORKING PROPERLY (notification comes also when moving maps to bank or chest)
		if not Teleporter.savedVarsAcc.infoSurveyMapsNotification and not Teleporter.savedVarsAcc.surveyMapsNotification then
			Teleporter.showDialog("NotificationBMUNewFeatureSMN", "NEW FEATURE", SI.get(SI.TELE_DIALOG_INFO_NEW_FEATURE_SURVEY_MAP_NOTIFICATION),
				function()
					-- enable feature
					Teleporter.savedVarsAcc.surveyMapsNotification = true
					SHARED_INVENTORY:RegisterCallback("SingleSlotInventoryUpdate", Teleporter.surveyMapUsed, self)
					Teleporter.savedVarsAcc.infoSurveyMapsNotification = true
				end,
				function()
					-- leave feature on default (disabled)
					Teleporter.savedVarsAcc.infoSurveyMapsNotification = true
				end)
		end
		--]]
	
	else	-- normal case - when BMU window is opened

		-- new feature: Notification Player Favorite Online
		if not Teleporter.savedVarsAcc.infoFavoritePlayerStatusNotification and not Teleporter.savedVarsAcc.FavoritePlayerStatusNotification then
			Teleporter.showDialog("NotificationBMUNewFeatureFPSN", "BeamMeUp: Feature", SI.get(SI.TELE_DIALOG_INFO_NEW_FEATURE_FAVORITE_PLAYER_NOTIFICATION),
				function()
					-- enable feature
					Teleporter.savedVarsAcc.FavoritePlayerStatusNotification = true
					EVENT_MANAGER:RegisterForEvent(appName, EVENT_GUILD_MEMBER_PLAYER_STATUS_CHANGED, Teleporter.FavoritePlayerStatusNotification)
					EVENT_MANAGER:RegisterForEvent(appName, EVENT_FRIEND_PLAYER_STATUS_CHANGED, Teleporter.FavoritePlayerStatusNotification)
					Teleporter.savedVarsAcc.infoFavoritePlayerStatusNotification = true
				end,
				function()
					-- leave feature on default (disabled)
					Teleporter.savedVarsAcc.infoFavoritePlayerStatusNotification = true
				end)
		end
		
		-- BeamMeUp guild notification
		if not Teleporter.savedVarsAcc.infoBMUGuild and not Teleporter.isPlayerInBMUGuild() and Teleporter.var.BMUGuilds[GetWorldName()] ~= nil then
			Teleporter.showDialog("NotificationBMUGuild", "BeamMeUp: Guilds", SI.get(SI.TELE_DIALOG_INFO_BMU_GUILD_BODY),
				function()
					Teleporter.requestGuildData()
					Teleporter.clearInputFields()
					zo_callLater(function() Teleporter.createTableGuilds() end, 300)
					Teleporter.savedVarsAcc.infoBMUGuild = true
				end,
				function()
					Teleporter.savedVarsAcc.infoBMUGuild = true
				end)
		end
	end
end


function Teleporter.isPlayerInBMUGuild()
	if Teleporter.var.BMUGuilds[GetWorldName()] ~= nil then
		for _, guildId in pairs(Teleporter.var.BMUGuilds[GetWorldName()]) do
			if IsPlayerInGuild(guildId) then
				return true
			end
		end
	end
	return false
end


local function OnAddOnLoaded(eventCode, addOnName)
    if (appName ~= addOnName) then return end

	--Read the addon version from the addon's txt manifest file tag ##AddOnVersion
	local function GetAddonVersionFromManifest()
		local addOn_Name
		local ADDON_MANAGER = GetAddOnManager()
		for i = 1, ADDON_MANAGER:GetNumAddOns() do
			addOn_Name = ADDON_MANAGER:GetAddOnInfo(i)
			if addOn_Name == appName then
				return ADDON_MANAGER:GetAddOnVersion(i)
			end
		end
		return -1
		-- Fallback: return the -1 version if AddOnManager was not read properly
	end
	--Set the version dynamically
	teleporterVars.version = tostring(GetAddonVersionFromManifest())

    teleporterVars.isAddonLoaded = true

    Teleporter.DefaultsAccount = {
		["pos_MapScene_x"] = -15,
		["pos_MapScene_y"] = 63,
		["pos_x"] = -15,
		["pos_y"] = 63,
		["anchorMapOffset_x"] = 0,
		["anchorMapOffset_y"] = 0,
		["anchorOnMap"] = true,
        ["ShowOnMapOpen"] = true,
		["HideOnMapClose"] = true,
        ["AutoPortFreq"]  = 300,
		["zoneOnceOnly"] = true,
		["autoRefresh"] = true,
		["hideOthers"] = true,
		["hidePVP"] = true,
		["hideClosedDungeons"] = true,
		["hideHouses"] = false,
		["hideDelves"] = false,
		["hidePublicDungeons"] = false,
		["disableDialog"] = false,
		["savedGold"] = 0,
		["windowStay"] = false,
		["onlyMaps"] = false,
		["autoRefreshFreq"] = 5,
		["focusZoneSearchOnOpening"] = false,
		["formatZoneName"] = false,
		["numberLines"] = 10,
		["fixedWindow"] = false,
		["secondLanguage"] = 1,  -- 1 = disabled, 2 = English, 3 = German, 4 = French, 5 = Russian, 6 = Japanese
		["closeOnPorting"] = true,
		["showNumberPlayers"] = true,
		["totalPortCounter"] = 0,
		["chatButtonHorizontalOffset"] = 0,
		["portCounterPerZone"] = {},
		["searchCharacterNames"] = false,
		["HintOfflineWhisper"] = true,
		["FavoritePlayerStatusNotification"] = false,
		["Scale"] = 1,
		["infoBMUGuild"] = false, -- false = not yet read
		["houseNickNames"] = false,
		["surveyMapsNotification"] = false,
		["infoFavoritePlayerStatusNotification"] = false, -- false = not yet read
		["infoSurveyMapsNotification"] = false, -- false = not yet read
		["unlockingLessChatOutput"] = false,
		["showOpenButtonOnMap"] = true,
		["surveyMapsNotificationSound"] = true,
		["wayshrineTravelAutoConfirm"] = false,
		["currentZoneAlwaysTop"] = false,
		["hideOwnHouses"] = false,
		["showOfflineReminder"] = true,
		["lastPortedZones"] = {},
		["initialTimeStamp"] = GetTimeStamp(),
    }
    
	Teleporter.DefaultsServer = {
		["prioritizationSource"] = {TELEPORTER_SOURCE_INDEX_FRIEND, TELEPORTER_SOURCE_INDEX_GUILD1, TELEPORTER_SOURCE_INDEX_GUILD2, TELEPORTER_SOURCE_INDEX_GUILD3, TELEPORTER_SOURCE_INDEX_GUILD4, TELEPORTER_SOURCE_INDEX_GUILD5}, -- default: friends - guild1 - guild2 - guild3 - guild4 - guild5
		["favoriteListZones"] = {},
		["favoriteListPlayers"] = {},
		["lastofflineReminder"] = 1632859025, -- just a timestamp (2021/09/28)
	}
	
	Teleporter.DefaultsCharacter = {
		["sorting"] = 2,
		["scanBankForMaps"] = true,
		["displayLeads"] = true,
		["displaySurveyMaps"] = true,
		["displayTreasureMaps"] = true,
		["showAllDelves"] = false,
		["df_showArenas"] = true,
		["df_showGroupArenas"] = true,
		["df_showDungeons"] = true,
		["df_showTrials"] = true,
		["df_sortByAcronym"] = false,
		["df_showDLCNames"] = false,
	}

	--Add the LibZone datatable to Teleporter -> See event_add_on_loaded as LibZone will be definitely loaded then
	--due to the ##DependsOn: LibZone entry in this addon's manifest file BeamMeUp.txt
	Teleporter.LibZoneGivenZoneData = {}
	local libZone = Teleporter.LibZone
	if libZone then
		-- LibZone >= v6
		if libZone.GetAllZoneData then
			Teleporter.LibZoneGivenZoneData = libZone:GetAllZoneData()
		-- LibZone <= v5 (backup)
		elseif libZone.givenZoneData then
			Teleporter.LibZoneGivenZoneData = libZone.givenZoneData
		else
			d("[" .. appName .. " - ERROR] LibZone zone data is missing!")
		end
	else
		d("[" .. appName .. " - ERROR] Error when accessing LibZone library!")
	end

	--Teleporter.savedVarsAcc = ZO_SavedVars:NewAccountWide("BeamMeUp_SV", 2, nil, Teleporter.DefaultsAccount, nil)
	--Teleporter.savedVarsChar = ZO_SavedVars:NewCharacterIdSettings("BeamMeUp_SV", 2, nil, Teleporter.DefaultsCharacter, nil)
	    
	-- February 2022
	-- Switch from global variables only to global, server dependent and character dependet variables
	local exSavedVarsAcc = ZO_SavedVars:NewAccountWide("BeamMeUp_SV", 2, nil, nil, nil)
	local exSavedVarsServ = ZO_SavedVars:NewAccountWide("BeamMeUp_SV", 3, nil, nil, GetWorldName())
	
	-- if the key "favoriteListZones" exists - implies old savedVars exist + not transformed already
	-- ->this is enough to determine the one-time transformation correctly
	if exSavedVarsAcc.favoriteListZones then
		-- old global vars exist AND new server dependent vars does not		
		Teleporter.savedVarsServ = ZO_SavedVars:NewAccountWide("BeamMeUp_SV", 3, nil, Teleporter.DefaultsServer, GetWorldName())
		Teleporter.savedVarsAcc = ZO_SavedVars:NewAccountWide("BeamMeUp_SV", 2, nil, Teleporter.DefaultsAccount, nil)
		-- copy from global variables
		Teleporter.savedVarsServ.favoriteListZones = Teleporter.savedVarsAcc.favoriteListZones
		Teleporter.savedVarsServ.favoriteListPlayers = Teleporter.savedVarsAcc.favoriteListPlayers
		-- delete from global variables
		Teleporter.savedVarsAcc.favoriteListZones = nil
		Teleporter.savedVarsAcc.favoriteListPlayers = nil
		-- also delete sorting (moved to character dependent)
		Teleporter.savedVarsAcc.sorting = nil
		-- also delete last offline reminder timestamp (moved to server dependent)
		Teleporter.savedVarsAcc.lastofflineReminder = nil
	else
		-- server dependent variables exist already OR addon was loaded first time
		Teleporter.savedVarsServ = ZO_SavedVars:NewAccountWide("BeamMeUp_SV", 3, nil, Teleporter.DefaultsServer, GetWorldName())
		Teleporter.savedVarsAcc = ZO_SavedVars:NewAccountWide("BeamMeUp_SV", 2, nil, Teleporter.DefaultsAccount, nil)
	end
	-- just use new version (2->3) of the character dependent variables, this will erase the old data
	Teleporter.savedVarsChar = ZO_SavedVars:NewCharacterIdSettings("BeamMeUp_SV", 3, nil, Teleporter.DefaultsCharacter, nil)
	
	
	Teleporter.TeleporterSetupUI(addOnName)
	
    EVENT_MANAGER:RegisterForEvent(appName, EVENT_PLAYER_ACTIVATED, PlayerInitAndReady)
	
	EVENT_MANAGER:RegisterForEvent(appName, EVENT_ACTION_LAYER_PUSHED, Teleporter.PortalHandlerLayerPushed)
    EVENT_MANAGER:RegisterForEvent(appName, EVENT_ACTION_LAYER_POPPED, Teleporter.PortalHandlerLayerPopped)
	
	WORLD_MAP_SCENE:RegisterCallback("StateChange", Teleporter.WorldMapStateChanged)
    GAMEPAD_WORLD_MAP_SCENE:RegisterCallback("StateChange", Teleporter.WorldMapStateChanged)
	
	ZO_PreHookHandler(ZO_WorldMapZoneStoryTopLevel_Keyboard, "OnShow", Teleporter.onZoneGuideShow)
		
	EVENT_MANAGER:RegisterForEvent(appName, EVENT_GAME_CAMERA_UI_MODE_CHANGED, Teleporter.cameraModeChanged)
	
	EVENT_MANAGER:RegisterForEvent(appName, EVENT_SOCIAL_ERROR, Teleporter.socialErrorWhilePorting)

	--- initialize slash commands
	Teleporter.activateSlashCommands()

	-- initialize category map
	Teleporter.initializeCategoryMap()
	
	-- initialize parent map
	Teleporter.initializeParentMap()
	
	-- counting of newly unlocked wayshrines (for unlocking process)
	EVENT_MANAGER:RegisterForEvent(appName, EVENT_FAST_TRAVEL_NETWORK_UPDATED, Teleporter.newWayshrineUnlocked)
	
	-- refresh quest location data cache
	EVENT_MANAGER:RegisterForEvent(appName, EVENT_QUEST_ADDED, Teleporter.journalUpdated)
	EVENT_MANAGER:RegisterForEvent(appName, EVENT_QUEST_REMOVED, Teleporter.journalUpdated)
	EVENT_MANAGER:RegisterForEvent(appName, EVENT_QUEST_CONDITION_COUNTER_CHANGED, Teleporter.journalUpdated)
	
	-- if necessary show center screen message that the player is still offline -> cannot receive any whisper messages
	if Teleporter.savedVarsAcc.showOfflineReminder then
		EVENT_MANAGER:RegisterForEvent(appName, EVENT_PLAYER_STATUS_CHANGED, function(_, _, newStatus) if (newStatus == 4) then Teleporter.playerStatusChangedToOffline = true end end)
		EVENT_MANAGER:RegisterForEvent(appName, EVENT_CHAT_MESSAGE_CHANNEL, Teleporter.showOfflineNote)
	end

	-- Show Note, when a favorite player goes online
	if Teleporter.savedVarsAcc.FavoritePlayerStatusNotification then
		EVENT_MANAGER:RegisterForEvent(appName, EVENT_GUILD_MEMBER_PLAYER_STATUS_CHANGED, Teleporter.FavoritePlayerStatusNotification)
		EVENT_MANAGER:RegisterForEvent(appName, EVENT_FRIEND_PLAYER_STATUS_CHANGED, Teleporter.FavoritePlayerStatusNotification)
	end
	
	-- Show Note, when survey map is mined and there are still some identical maps left
	if Teleporter.savedVarsAcc.surveyMapsNotification then
		SHARED_INVENTORY:RegisterCallback("SingleSlotInventoryUpdate", Teleporter.surveyMapUsed, self)
	end
	
	-- Auto confirm dailog when using wayshrines
	if Teleporter.savedVarsAcc.wayshrineTravelAutoConfirm then
		Teleporter.activateWayshrineTravelAutoConfirm()
	end
	
	-- activate Link Handler for handling clicks on chat links
	LINK_HANDLER:RegisterCallback(LINK_HANDLER.LINK_MOUSE_UP_EVENT, Teleporter.handleChatLinkClick)
	
	--Request BMU guilds and partner guilds information
	--zo_callLater(function() Teleporter.requestGuildData() end, 5000)

	-- activate guild admin tools
	local displayName = GetDisplayName()
	if displayName == "@DeadSoon" or displayName == "@Gamer1986PAN" or displayName == "@Pandora959" or displayName == "@Sokarx" or displayName == "@Knifekill1984" then
		-- add context menu in guild roster and application roster
		zo_callLater(function()
			Teleporter.AdminAddContextMenuToGuildRoster()
			Teleporter.AdminAddContextMenuToGuildApplicationRoster()
			Teleporter.AdminAddTooltipInfoToGuildApplicationRoster()
			Teleporter.AdminAddAutoFillToDeclineApplicationDialog()
		end, 5000)
		-- write welcome message to chat when you accept application (automatically welcome)
		EVENT_MANAGER:RegisterForEvent(appName, EVENT_GUILD_FINDER_PROCESS_APPLICATION_RESPONSE, Teleporter.AdminAutoWelcome)
	end
end


----> START HERE

EVENT_MANAGER:RegisterForEvent(appName, EVENT_ADD_ON_LOADED, OnAddOnLoaded)



----