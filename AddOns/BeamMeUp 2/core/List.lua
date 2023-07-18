local wm = WINDOW_MANAGER

local LINES_OFFSET = 45
local SLIDER_WIDTH = 25
local SI = Teleporter.SI
-- Make self available to everything in this file
local self = {}
local mColor = {}
local controlWidth = 0
local totalPortals = 0

local mutexCounter = 0

local knownWayshrinesBefore = 0
local knownWayshrinesAfter = 0
local totalWayshrines = 0

-- Utility / local functions

local function clamp(val, min_, max_)
    val = math.max(val, min_)
    return math.min(val, max_)
end

local function normalTextureForAuto()
    Teleporter.win.Main_Control.portalToAllTexture:SetTexture(Teleporter.textures.wayshrineBtn2)
end

local function activeTextureForAuto()
	Teleporter.win.Main_Control.portalToAllTexture:SetTexture(Teleporter.textures.wayshrineBtnOver2)
end

------------------------------------------------------------

-- shows confirmation dialog and starts AutoUnlock
function Teleporter.dialogAutoUnlock()
	if Teleporter.autoUnlockStarted then
		-- AutoUnlock already started -> do nothing
		-- TODO: cancelation of running process
		return
	end
	
	-- first check if the addon "GuildShrines" is active and if the incompatible option is set ("show unknown wayshrines" is enabled)
	if GuildShrines_dat then
		local sv = ZO_SavedVars:NewAccountWide("GuildShrines_dat", 1, nil, nil, nil)
		if sv and sv.showUnknown and sv.showWayshrines then
			-- show incompatibility dialog
			Teleporter.showDialog("IncompatibilityGS", "Incompatibility with addon \"GuildShrines\"", "We have detected that you are using the addon \"GuildShrines\" with incompatible settings.\n\n" .. Teleporter.var.color.colRed .. "Please change the option \"Unknown Wayshrines\" to \"OFF\" in the settings of \"GuildShrines\"!|r\n\nOtherwise BeamMeUp cannot unlock unknown wayshrines.", nil, nil)
			return
		end
	end
	
	if not Teleporter.isCurrentMapOverlandZone() then
		-- current zone is no OverlandZone -> show dialog, that unlocking is not possible
		Teleporter.showDialog("RefuseAutoUnlock2", SI.get(SI.TELE_DIALOG_REFUSE_AUTO_UNLOCK_TITLE2), SI.get(SI.TELE_DIALOG_REFUSE_AUTO_UNLOCK_BODY2), nil, nil)
		return
	end
	
	local knownWayshrines, totalWayshrines, discoveredWayshrines, linkTableKnownWayshrines, linkTableUnknownWayshrines = Teleporter.getCompletionWayshrinesInCurrentMap()
	
	if knownWayshrines >= totalWayshrines and totalWayshrines == discoveredWayshrines then
		-- show dialog, that unlocking is not longer possible
		Teleporter.showDialog("RefuseAutoUnlock", SI.get(SI.TELE_DIALOG_REFUSE_AUTO_UNLOCK_TITLE), SI.get(SI.TELE_DIALOG_REFUSE_AUTO_UNLOCK_BODY) .. Teleporter.var.color.colGreen .. " (" .. discoveredWayshrines .. "/" .. totalWayshrines .. ")", nil, nil)
		return
	elseif knownWayshrines >= totalWayshrines and totalWayshrines > discoveredWayshrines then
		-- show info that all wayshrines are known but there are still wayshrines that need to be physically visited
		d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_UNLOCK_WS_ALL_KNOWN))
		if not Teleporter.savedVarsAcc.unlockingLessChatOutput then
			Teleporter.printUndiscoveredWayshrinesInfoToChat(linkTableKnownWayshrines)
		end
		return
	end
	
	-- start process
	-- clear global counter
	Teleporter.unlockedWayshrinesCounter = 0
	Teleporter.unlockedWayshrinesNodeIndicies = {}
	
	if not Teleporter.savedVarsAcc.disableDialog then
		-- show dialog
		Teleporter.showDialog("ConfirmationAutoUnlock", SI.get(SI.TELE_DIALOG_AUTO_UNLOCK_TITLE), SI.get(SI.TELE_DIALOG_AUTO_UNLOCK_BODY), function() Teleporter.startAutoUnlock(knownWayshrines, totalWayshrines, discoveredWayshrines, linkTableKnownWayshrines, linkTableUnknownWayshrines) end, nil)
	else
		-- dont show any confirmation dialog, just start
		Teleporter.startAutoUnlock(knownWayshrines, totalWayshrines, discoveredWayshrines, linkTableKnownWayshrines, linkTableUnknownWayshrines)
	end
end


function Teleporter.startAutoUnlock(knownWayshrinesBefore, totalWayshrines, discoveredWayshrines, linkTableKnownWayshrines, linkTableUnknownWayshrines)
	local list = Teleporter.createTable({index=8, fZoneId=GetZoneId(GetUnitZoneIndex("player")), dontDisplay=true})
	-- check if list is empty
	local firstRecord = list[1]
	if #list == 0 or firstRecord.displayName == "" then
		d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_UNLOCK_WS_NO_PLAYERS))
		if not Teleporter.savedVarsAcc.unlockingLessChatOutput then
			Teleporter.printUndiscoveredWayshrinesInfoToChat(linkTableKnownWayshrines)
		end
		return
	end

	-- start porting
	Teleporter.autoUnlockStarted = true
	d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_UNLOCK_START_INFO))
	-- change texture of the button
	activeTextureForAuto()
	zo_callLater(function()
		Teleporter.loopAutoUnlock(list, 1, #list, knownWayshrinesBefore, totalWayshrines, discoveredWayshrines, linkTableKnownWayshrines, linkTableUnknownWayshrines)
	end, 500)
end


-- port to each player in the list (recursive)
function Teleporter.loopAutoUnlock(list, pos, size, knownWayshrinesBefore, totalWayshrines, discoveredWayshrines, linkTableKnownWayshrines, linkTableUnknownWayshrines)
	-- anchor
	if pos > size or (knownWayshrinesBefore + Teleporter.unlockedWayshrinesCounter) == totalWayshrines then
		-- finish and calculate unlockCounter
		Teleporter.autoUnlockFinished(size, knownWayshrinesBefore, totalWayshrines, discoveredWayshrines, linkTableKnownWayshrines, linkTableUnknownWayshrines)
		return
	end
	
	-- port to current player
	zo_callLater(function()
		local record = list[pos]
		-- start port process
		Teleporter.PortalToPlayer(record.displayName, record.sourceIndexLeading, record.zoneName, record.zoneId, record.category, false, false, false)
		-- cancel port process
		zo_callLater(function()
			CancelCast()
		end, 25)
		-- recursion
		Teleporter.loopAutoUnlock(list, pos+1, size, knownWayshrinesBefore, totalWayshrines, discoveredWayshrines, linkTableKnownWayshrines, linkTableUnknownWayshrines)
	end, Teleporter.savedVarsAcc.AutoPortFreq)
end


-- cancel port process and calculate unlock counter
function Teleporter.autoUnlockFinished(numberPlayers, knownWayshrinesBefore, totalWayshrines, discoveredWayshrines, linkTableKnownWayshrines, linkTableUnknownWayshrines)
	d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_UNLOCK_WS_SUCCESS))
	--d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_UNLOCK_WS_COUNT_CALC))
	
	-- cancel port process
	zo_callLater(function()
		CancelCast()
	end, 2000)
	
	-- cancel port process
	zo_callLater(function()
		CancelCast()
	end, 4000)
			
	zo_callLater(function()
		if Teleporter.unlockedWayshrinesCounter == 1 or (Teleporter.unlockedWayshrinesCounter == 0 and Teleporter.lang == "fr") then
			d("[" .. Teleporter.var.appNameAbbr .. "]: " .. Teleporter.unlockedWayshrinesCounter .. " " .. SI.get(SI.TELE_CHAT_UNLOCK_WS_COUNT_SING))
		else
			d("[" .. Teleporter.var.appNameAbbr .. "]: " .. Teleporter.unlockedWayshrinesCounter .. " " .. SI.get(SI.TELE_CHAT_UNLOCK_WS_COUNT_PLU))
		end
		d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_UNLOCK_WS_DISCOVERED_TOTAL) .. " " .. tostring(knownWayshrinesBefore + Teleporter.unlockedWayshrinesCounter) .. "/" .. totalWayshrines)
		
		-- show info which wayhsrines are still to be discovered / visited physically
		if not Teleporter.savedVarsAcc.unlockingLessChatOutput then
			-- add links of newly unlocked wayshrines to the list
			for _, nodeIndex in pairs(Teleporter.unlockedWayshrinesNodeIndicies) do
				table.insert(linkTableKnownWayshrines, linkTableUnknownWayshrines[nodeIndex])
			end
			Teleporter.printUndiscoveredWayshrinesInfoToChat(linkTableKnownWayshrines)
		end
		
		-- cancel port process
		CancelCast()
		
		-- change texture of the button
		normalTextureForAuto()
		Teleporter.autoUnlockStarted = false
	end, 3000)
	
	-- cancel port process again (to be on the save site for huge numbers of ports)
	if numberPlayers > 20 then
		zo_callLater(function()
			CancelCast()
		end, 7000)
	end
end


function Teleporter.newWayshrineUnlocked(eventCode, nodeIndex)
	Teleporter.unlockedWayshrinesCounter = Teleporter.unlockedWayshrinesCounter + 1
	table.insert(Teleporter.unlockedWayshrinesNodeIndicies, nodeIndex)
end


-- returns:
-- 1. number of known wayshrines in current map (where the player actually is)
-- 2. total number of wayshrines in current map
-- 3. number of wayhsrines that are known but undiscovered (still to be visited physically)
-- 4. table of clickable custom chat links of known-undiscovered wayshrines
-- for calculation the map must be set!
function Teleporter.getCompletionWayshrinesInCurrentMap()
	-- set map to players location (map)
	local zoneIndex = GetUnitZoneIndex("player")
	local zoneId = GetZoneId(zoneIndex)
	local mapIndex = Teleporter.getMapIndex(zoneId)
	
	if mapIndex ~= nil then
		-- switch to Tamriel and back to players map in order to reset any subzone or zoom
		ZO_WorldMap_SetMapByIndex(1)
		ZO_WorldMap_SetMapByIndex(mapIndex)
	end
	
	local countKnown = 0
	local linkTableKnown = {}
	local linkTableUnknown = {}
	local namesTable = {}
	
	-- handling of special cases/zones
	-- check if the zone is a subzone that belongs to a main zone which holds the completion info only
	local mainZoneId = Teleporter.getMainZoneId(zoneId)
	if mainZoneId then
		zoneId = mainZoneId
	end
	
	-- get total number of wayshrines from this function, also used for ZoneGuide (is more accurate and ignores "Zuflucht" correctly)
	local countTotal = GetNumZoneActivitiesForZoneCompletionType(zoneId, ZONE_COMPLETION_TYPE_WAYSHRINES)
	-- get number of wayshrines that are known AND already physically visited (correctly discovered and registered in ZoneGuide)
	local countDiscovered = GetNumCompletedZoneActivitiesForZoneCompletionType(zoneId, ZONE_COMPLETION_TYPE_WAYSHRINES)
	local countTotal2 = 0 -- for manually counting / special cases like Blackreach
	local countDiscovered2 = 0 -- for manually counting / special cases like Blackreach
	
	-- fill table with all names and completion status from ZoneGuide
	for i = 1, countTotal do
		local entry = {}
		entry.name = GetZoneStoryActivityNameByActivityIndex(zoneId, ZONE_COMPLETION_TYPE_WAYSHRINES, i)
		entry.complete = IsZoneStoryActivityComplete(zoneId, ZONE_COMPLETION_TYPE_WAYSHRINES, i)
		table.insert(namesTable, entry)
	end
	
	-- go over all fast travel nodes and identify those who are on the current map
	for i = 1, GetNumFastTravelNodes() do
		local e = {}
		e.known, e.name, e.normalizedX, e.normalizedY, e.icon, e.glowIcon, e.poiType, e.isShownInCurrentMap, e.linkedCollectibleIsLocked = GetFastTravelNodeInfo(i)
		-- check if Pin is visible in current map + is a wayshrine + is not one of the harborages ("The Harborage" (prophet's refuge) is also a wayshrine according to the API)
		if e.isShownInCurrentMap and e.poiType == POI_TYPE_WAYSHRINE and (i ~= 210 and i ~= 211 and i ~= 212) then
			countTotal2 = countTotal2 + 1
			-- check if known (visible & usable)
			if e.known then
				countKnown = countKnown + 1
				-- check if also discovered
				if Teleporter.getCompletionWayshrinesInCurrentMap_2(namesTable, e.name) then
					countDiscovered2 = countDiscovered2 + 1
				-- if mapIndex == nil -> error while creating the link
				elseif mapIndex ~= nil then
					-- create and insert link to linkTableKnown
					local linkType = "BMU"
					local data1 = "BMU_P" -- signature
					local data2 = mapIndex -- mapIndex
					local data3 = e.normalizedX -- coorX
					local data4 = e.normalizedY -- coorY
					local text = "Click here: " .. zo_strformat("<<C:1>>", e.name)
					local link = "|H1:" .. linkType .. ":" .. data1 .. ":" .. data2 .. ":" .. data3 .. ":" .. data4 .. "|h[" .. text .. "]|h"
					table.insert(linkTableKnown, link)
				end
			else
				-- insert link of unknown wayshrines to linkTableUnknown at index of its nodeIndex (to identify them later easily)
				linkTableUnknown[i] = link
			end
		end
	end
	
	-- if special case -> use manually counting
	if mainZoneId then
		countTotal = countTotal2
		countDiscovered = countDiscovered2
	end
	
	return countKnown, countTotal, countDiscovered, linkTableKnown, linkTableUnknown
end


function Teleporter.printUndiscoveredWayshrinesInfoToChat(linkTable)
	-- show info which wayhsrines are still to be discovered / visited physically
	if #linkTable > 0 then
		d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_UNLOCK_WS_NEED_DISCOVERED))
		for _, link in ipairs(linkTable) do
			d("[" .. Teleporter.var.appNameAbbr .. "]: " .. link)
		end
	end
end


function Teleporter.getCompletionWayshrinesInCurrentMap_2(namesTable, name)
	-- check if name is in table and return completion state
	for _, entry in ipairs(namesTable) do
		if entry.name == name then
			return entry.complete
		end
	end
	return true -- return also true when no match found, because we are only interested in valid undiscovered wayshrines
end

-- return true if the player is in a Overland zone / region
function Teleporter.isCurrentMapOverlandZone()
	-- get zone of player (where the player actually is)
	local zoneIndex = GetUnitZoneIndex("player")
	local zoneId = GetZoneId(zoneIndex)
	if Teleporter.categorizeZone(zoneId) == 9 then
		return true
	else
		return false
	end
end


----------------------------------------------------
--- Function to Port to Players
-----------------------------------------------------
function Teleporter.PortalToPlayer(displayName, sourceIndex, zoneName, zoneId, zoneCategory, updateSavedGold, tryAgainOnError, printToChat)
	
	-- cut the numbers coming from "item related zones"
	local position = string.find(zoneName, "%(")
	if position ~= nil then
		zoneName = string.sub(zoneName, 1, position-2)
	end
	
	-- reset error flag
	Teleporter.flagSocialErrorWhilePorting = 0
	
	-- check if porting is possible
	if CanLeaveCurrentLocationViaTeleport() and not IsUnitDead("player") then
		
		-- ESO Bug: If mounted, the player unmounts and nothing happens -> Workaround: start teleport to force unmount and start again automatically after delay
		-- check if mounted
		if IsMounted() then
			-- dont try again, it could interfere with the new delayed try
			tryAgainOnError = false
			zo_callLater(function() Teleporter.PortalToPlayer(displayName, sourceIndex, zoneName, zoneId, zoneCategory, false, true, false) end, 1500)
		end
	
		-- prophylactic cancel cast
		CancelCast()
		-- start porting
		if printToChat then
			d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_TO_PLAYER) .. " " .. displayName .. " - " .. zoneName)
		end
		if sourceIndex == TELEPORTER_SOURCE_INDEX_GROUP then
			if displayName == GetUnitDisplayName(GetGroupLeaderUnitTag()) then
				JumpToGroupLeader()
			else
				JumpToGroupMember(displayName)
			end
		elseif sourceIndex == TELEPORTER_SOURCE_INDEX_FRIEND then
			JumpToFriend(displayName)
		else
			-- sourceIndex > 3  -> guild 1-5
			JumpToGuildMember(displayName)
		end
		
		-- check if an error occurred while porting
		zo_callLater(function()
			if Teleporter.flagSocialErrorWhilePorting ~= 0 then
				-- error occurred
				if printToChat then
					d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_ERROR_WHILE_PORTING))
				end
				if tryAgainOnError then
					Teleporter.decideTryAgainPorting(Teleporter.flagSocialErrorWhilePorting, zoneId, displayName, sourceIndex, updateSavedGold)
				end
			else
				-- update saved gold
				if updateSavedGold then
					Teleporter.updateStatistic(zoneCategory, zoneId)
				end
			end
		end, 1800)
		-- if necessary show center screen message that the player is still offline
		Teleporter.showOfflineNote()
	else
		if printToChat then
			-- display message, that porting is not possible at the moment
			d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_PORTING_NOT_POSSIBLE))
		end
	end
end


-- if necessary show center screen message that the player is still offline
function Teleporter.showOfflineNote(_, messageType)
	-- option is enabled + player does not set to offline since last reload + a blank call or it is outgoing whisper message + player is set to offline + last message was 24 hours ago
	if Teleporter.savedVarsAcc.showOfflineReminder and not Teleporter.playerStatusChangedToOffline and (not messageType or messageType == CHAT_CHANNEL_WHISPER_SENT) and GetPlayerStatus() == PLAYER_STATUS_OFFLINE and (GetTimeStamp() - Teleporter.savedVarsServ.lastofflineReminder > 86400) then
		CENTER_SCREEN_ANNOUNCE:AddMessage(0, CSA_CATEGORY_LARGE_TEXT, "Justice_NowKOS", SI.get(SI.TELE_CENTERSCREEN_OFFLINE_NOTE_HEAD), SI.get(SI.TELE_CENTERSCREEN_OFFLINE_NOTE_BODY), nil, nil, nil, nil, 10000, nil)
		Teleporter.savedVarsServ.lastofflineReminder = GetTimeStamp()
	end
end


-- Private API
local function _set_line_counts(self)
    --self.num_visible_lines = math.floor((self.control:GetHeight() - LINES_OFFSET*Teleporter.savedVarsAcc.Scale) / self.line_height)
    --self.num_visible_lines = math.min(self.num_visible_lines, #self.lines)
	self.num_visible_lines = math.min(Teleporter.savedVarsAcc.numberLines, #self.lines)

    self.num_hidden_lines = math.max(0, #self.lines - self.num_visible_lines)
    if self.num_hidden_lines == 0 then
        self.offset = 0
    end
end


local function _create_listview_row(self, i)
    local control = self.control
    local name = control:GetName() .. "_list" .. i
	
	-- get zone id of current zone (zoneIndex changes at each API update, zoneId is more robust)
	local currentZoneId = GetZoneId(GetCurrentMapZoneIndex())


    local list = wm:CreateControl(name, control, CT_CONTROL)
    list:SetHeight(self.line_height)

    local message = self.lines[i]

    if message ~= nil then
	        list.ColumnNumberPlayers = wm:CreateControl(name .. "_NumberPlayers", list, CT_LABEL)
            list.ColumnNumberPlayers:SetDimensions(35*Teleporter.savedVarsAcc.Scale, 20*Teleporter.savedVarsAcc.Scale)
            list.ColumnNumberPlayers:SetFont(Teleporter.font1)
			list.ColumnNumberPlayers:SetHorizontalAlignment(TEXT_ALIGN_CENTER)
            list.ColumnNumberPlayers:SetAnchor(0, list, 0, LEFT -40*Teleporter.savedVarsAcc.Scale, 50*Teleporter.savedVarsAcc.Scale)
			
			--Create another control (Button)
			list.ColumnNumberPlayersBtn = wm:CreateControl(name .. "_NumberPlayersButton", list.ColumnNumberPlayers, CT_BUTTON)
			--list.ColumnNumberPlayersBtn:SetAnchorFill(list.ColumnNumberPlayers)
			list.ColumnNumberPlayersBtn:SetDimensions(35*Teleporter.savedVarsAcc.Scale, 35*Teleporter.savedVarsAcc.Scale)
			list.ColumnNumberPlayersBtn:SetAnchor(CENTER, ColumnNumberPlayers, CENTER, 0, 2*Teleporter.savedVarsAcc.Scale)
						
			--Create another control (Texture) for MouseOver
			list.ColumnNumberPlayersTex = WINDOW_MANAGER:CreateControl(name .. "_NumberPlayersOver", list.ColumnNumberPlayers, CT_TEXTURE)
			list.ColumnNumberPlayersTex:SetAnchorFill(list.ColumnNumberPlayersBtn)
			list.ColumnNumberPlayersTex:SetTexture(Teleporter.textures.numberPlayersBtnOver)
			list.ColumnNumberPlayersTex:SetAlpha(0)
	
	--    table.sort(message, function(a, b) return a.zoneName < b.zoneName end)
        --if message.displayName ~= nil then
            list.ColumnPlayerName = wm:CreateControl(name .. "_Player", list, CT_LABEL)
            list.ColumnPlayerName:SetDimensions(150*Teleporter.savedVarsAcc.Scale, 20*Teleporter.savedVarsAcc.Scale)
            list.ColumnPlayerName:SetFont(Teleporter.font1)
            list.ColumnPlayerName:SetAnchor(0, list, 0, LEFT, 50*Teleporter.savedVarsAcc.Scale) -- ... 20

			--Create another control (Button) just for tooltip
			list.ColumnPlayerNameTooltip = wm:CreateControl(name .. "_PlayerLevelTooltip", list.ColumnPlayerName, CT_BUTTON)
			list.ColumnPlayerNameTooltip:SetAnchorFill(list.ColumnPlayerName)
			list.ColumnPlayerNameTooltip:SetFont(Teleporter.font1)
        --end

        controlWidth = control:GetWidth()


        list.frame = wm:CreateControl(nil, list, CT_TEXTURE)
        list.frame:SetDimensions(controlWidth + 30*Teleporter.savedVarsAcc.Scale, 3*Teleporter.savedVarsAcc.Scale)
        list.frame:SetAnchor(0, list, 0, LEFT - 40*Teleporter.savedVarsAcc.Scale, 42*Teleporter.savedVarsAcc.Scale)

        list.frame:SetTexture("/esoui/art/guild/sectiondivider_left.dds")
        list.frame:SetTextureCoords(0, 1, 0, 1)
        list.frame:SetAlpha(0.7)


        --if message.zoneName ~= nil then
            list.ColumnZoneName = wm:CreateControl(name .. "_Zone", list, CT_LABEL)
			-- /Backup/
            --list.ColumnZoneName:SetDimensions(200, 20)
			-- /New/
			list.ColumnZoneName:SetDimensions(240*Teleporter.savedVarsAcc.Scale, 20*Teleporter.savedVarsAcc.Scale)
            list.ColumnZoneName:SetFont(Teleporter.font1)			
            list.ColumnZoneName:SetAnchor(0, list, 0, LEFT + 165*Teleporter.savedVarsAcc.Scale, 50*Teleporter.savedVarsAcc.Scale)
			
			--Create another control (Button) for opening in map
			list.ColumnZoneNameBtn = wm:CreateControl(name .. "_ZoneButton", list.ColumnZoneName, CT_BUTTON)
			--list.ColumnZoneNameBtn:SetAnchorFill(list.ColumnZoneName)
			list.ColumnZoneNameBtn:SetDimensions(240*Teleporter.savedVarsAcc.Scale, 35*Teleporter.savedVarsAcc.Scale)
			list.ColumnZoneNameBtn:SetAnchor(0, list, 0, LEFT + 165*Teleporter.savedVarsAcc.Scale, 45*Teleporter.savedVarsAcc.Scale)
						
			--Create another control (Texture) for MouseOver for ZoneName
			list.ColumnZoneNameTex = WINDOW_MANAGER:CreateControl(name .. "_ZoneOver", list.ColumnZoneName, CT_TEXTURE)
			list.ColumnZoneNameTex:SetAnchorFill(list.ColumnZoneNameBtn)
			list.ColumnZoneNameTex:SetTexture(Teleporter.textures.zoneNameBtnOver)
			list.ColumnZoneNameTex:SetAlpha(0)
			
			--Create another control (Button) just for tooltip
			list.ColumnZoneNameTooltip = wm:CreateControl(name .. "_ZoneTooltip", list.ColumnZoneName, CT_BUTTON)
			list.ColumnZoneNameTooltip:SetAnchorFill(list.ColumnZoneNameBtn)
			list.ColumnZoneNameTooltip:SetFont(Teleporter.font1)
			list.ColumnZoneNameTooltip:SetAlpha(0.5)
		
        --end

        --if message.zoneName ~= nil then
            list.portalToPlayerTex = WINDOW_MANAGER:CreateControl(nil, list, CT_TEXTURE)
            list.portalToPlayerTex:SetDimensions(45*Teleporter.savedVarsAcc.Scale, 45*Teleporter.savedVarsAcc.Scale)
			-- /Backup/
            --list.portalToPlayerTex:SetAnchor(0, list, 0, LEFT + 420, 15)
			-- /New/
			list.portalToPlayerTex:SetAnchor(0, list, 0, LEFT + 400*Teleporter.savedVarsAcc.Scale, 41*Teleporter.savedVarsAcc.Scale) --490 ... 15
            -- lthline.frame:SetAnchor(0, lthline, 0, LEFT, 20)

            list.portalToPlayerTex:SetTextureCoords(0, 1, 0, 1)
            list.portalToPlayerTex:SetAlpha(1)


            list.portalToPlayer = wm:CreateControl(name .. "Portal", list.portalToPlayerTex, CT_BUTTON)
            list.portalToPlayer:SetFont(Teleporter.font1)

            list.portalToPlayer:SetAnchorFill(list.portalToPlayerTex)
			
			--if message.displayName ~= "" then
			--[[
				list.portalToPlayer:SetHandler("OnClicked", function()
					Teleporter.PortalToPlayer(message.displayName, message.sourceIndexLeading, message.zoneName, message.zoneId, message.category, true, true, true)
					if Teleporter.savedVarsAcc.closeOnPorting then
						-- hide world map if open
						SCENE_MANAGER:Hide("worldMap")
						-- hide UI if open
						Teleporter.HideTeleporter()
					end
				end)
				--]]
				list.portalToPlayer:SetHandler("OnMouseEnter", function(self) list.portalToPlayerTex:SetTexture(Teleporter.textures.wayshrineBtnOver) end)
				list.portalToPlayer:SetHandler("OnMouseExit", function(self)
					list.portalToPlayerTex:SetTexture(Teleporter.textures.wayshrineBtn) end)
			--end
        --end
		
        return list
    end
end


local function _create_listview_lines_if_needed(self)
    local control = self.control

    -- Makes sure that the main control is filled up with line controls at all times.
    for i = 1, self.num_visible_lines do
        if control.lines[i] == nil then
            local line = _create_listview_row(self, i)
            control.lines[i] = line
			if i == 1 then
				line:SetAnchor(TOPLEFT, control, TOPLEFT, 0, LINES_OFFSET*Teleporter.savedVarsAcc.Scale)
			else
				line:SetAnchor(TOPLEFT, control.lines[i - 1], BOTTOMLEFT, 0, 0)
			end
        end
    end
end


local function _on_resize(self)
    Teleporter.control_global_2 = self.control

    -- Need to calculate num_visible_lines etc. for the rest of this function.
    _set_line_counts(self)

    _create_listview_lines_if_needed(self)

    -- Represent how many lines are visible atm.
	-- on initialization #self.lines can be 0 -> prevent division with 0
	local viewable_lines_pct = 1
	if #self.lines > 0 then
		viewable_lines_pct = Teleporter.round(self.num_visible_lines / #self.lines, 1) or 1
	end
	
    -- Can we see all the lines?
    if viewable_lines_pct >= 1.0 then
        Teleporter.control_global_2.slider:SetHidden(true)
    else
        -- If not, make sure the slider is showing.
        Teleporter.control_global_2.slider:SetHidden(false)
        self.control.slider:SetMinMax(0, self.num_hidden_lines)
		
		local totalListHeight = Teleporter.calculateListHeight()
		-- slider height = totalListHeight  *  percentage of visible lines
		local sliderHeight = totalListHeight*viewable_lines_pct
		-- while the list control is heigher than the visible space (because of the leaking backgroundin the bottom), we just cut a percentage
		local listHeightForSlider = (0.82*totalListHeight) -- no need of scaling because totalListHeight is already scaled
		
		Teleporter.control_global_2.slider:SetHeight(listHeightForSlider)
        -- The more lines we can see, the bigger the slider should be.
        local tex = self.slider_texture
        Teleporter.control_global_2.slider:SetThumbTexture(tex, tex, tex, SLIDER_WIDTH*Teleporter.savedVarsAcc.Scale, sliderHeight, 0, 0, 1, 1)
	end

    -- Update line widths in case we just resized self.control.
    local line_width = Teleporter.control_global_2:GetWidth()
    if not Teleporter.control_global_2.slider:IsControlHidden() then

        line_width = line_width - Teleporter.control_global_2.slider:GetWidth()
    end

    for _, line in pairs(Teleporter.control_global_2.lines) do
        line:SetWidth(line_width)
    end
end


local function _initialize_listview(self_listview, width, height, left, top)
	Teleporter.control_global = self_listview.control
    --local control = self_listview.control
    local name = Teleporter.control_global:GetName()

    -- main control
    Teleporter.control_global:SetDimensions(width, height)
    Teleporter.control_global:SetHidden(true)
    Teleporter.control_global:SetMouseEnabled(true)
    Teleporter.control_global:SetClampedToScreen(true)
	--Teleporter.control_global:SetResizeHandleSize(MOUSE_CURSOR_RESIZE_NS)
	
	
	-- create Backdrop / BackGround
	Teleporter.control_global.bd = WINDOW_MANAGER:CreateControl(nil, Teleporter.control_global, CT_TEXTURE)
	Teleporter.control_global.bd:SetMouseEnabled(true)
	
	-- Users with Full-HD resolution run into problems because of the space!!
	--Teleporter.control_global.bd:SetClampedToScreen(true)
	
	-- set position
	Teleporter.control_global.bd:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, LEFT + Teleporter.savedVarsAcc.pos_x, Teleporter.savedVarsAcc.pos_y)
	-- set dimensions
	Teleporter.control_global.bd:SetDimensions(Teleporter.control_global:GetWidth() + 110*Teleporter.savedVarsAcc.Scale, Teleporter.control_global:GetHeight() + 300*Teleporter.savedVarsAcc.Scale)
	-- set texture
	Teleporter.control_global.bd:SetTexture("/esoui/art/miscellaneous/centerscreen_left.dds")
	
	-- !! anchor & place main control on backdrop !!
	Teleporter.control_global:SetAnchor(CENTER, Teleporter.control_global.bd, nil, 15*Teleporter.savedVarsAcc.Scale)
	-- set moveable
	Teleporter.control_global.bd:SetMovable(not Teleporter.savedVarsAcc.fixedWindow)
	-- bring BMU window from draw layer 1 (default) to draw layer 2, to make sure that other addons and map scene are not in front of BMU window
	Teleporter.control_global:SetDrawLayer(2)

	
	------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------
	-- Total & Statistics
	
	Teleporter.control_global.statisticGold = wm:CreateControl(name .. "_StatisticGold", Teleporter.control_global, CT_LABEL)
	Teleporter.control_global.statisticGold:SetFont(Teleporter.font2)
    Teleporter.control_global.statisticGold:SetAnchor(TOPLEFT, Teleporter.control_global, TOPLEFT, TOPLEFT-35*Teleporter.savedVarsAcc.Scale, 25*Teleporter.savedVarsAcc.Scale)
	Teleporter.control_global.statisticGold:SetText(SI.get(SI.TELE_UI_GOLD) .. " " .. Teleporter.formatGold(Teleporter.savedVarsAcc.savedGold))
	
	Teleporter.control_global.statisticTotal = wm:CreateControl(name .. "_StatisticTotal", Teleporter.control_global, CT_LABEL)
	Teleporter.control_global.statisticTotal:SetFont(Teleporter.font2)
    Teleporter.control_global.statisticTotal:SetAnchor(TOPLEFT, Teleporter.control_global, TOPLEFT, TOPLEFT-35*Teleporter.savedVarsAcc.Scale, 45*Teleporter.savedVarsAcc.Scale)
	Teleporter.control_global.statisticTotal:SetText(SI.get(SI.TELE_UI_TOTAL_PORTS) .. " " .. Teleporter.formatGold(Teleporter.savedVarsAcc.totalPortCounter))
		
	Teleporter.control_global.total = wm:CreateControl(name .. "_Total", Teleporter.control_global, CT_LABEL)
    Teleporter.control_global.total:SetFont(Teleporter.font2)
    Teleporter.control_global.total:SetAnchor(TOPLEFT, Teleporter.control_global, TOPLEFT, TOPLEFT-35*Teleporter.savedVarsAcc.Scale, 65*Teleporter.savedVarsAcc.Scale)

    -- slider
    local tex = self_listview.slider_texture
    Teleporter.control_global.slider = wm:CreateControl(name .. "_Slider", Teleporter.control_global, CT_SLIDER)
    Teleporter.control_global.slider:SetWidth(SLIDER_WIDTH*Teleporter.savedVarsAcc.Scale)
    Teleporter.control_global.slider:SetMouseEnabled(true)
    Teleporter.control_global.slider:SetValue(0)
    Teleporter.control_global.slider:SetValueStep(1)
    Teleporter.control_global.slider:SetAnchor(TOPRIGHT, Teleporter.control_global, TOPRIGHT, 25*Teleporter.savedVarsAcc.Scale, 90*Teleporter.savedVarsAcc.Scale)

    -- lines
    Teleporter.control_global.lines = {}
    _on_resize(self_listview) -- sets important datastructures
    _create_listview_lines_if_needed(self_listview)

    -- event: mwheel / scrolling
    Teleporter.control_global:SetHandler("OnMouseWheel", function(self, delta)
        local new_value = clamp(self_listview.offset - delta, 0, self_listview.num_hidden_lines)
		self.slider:SetValue(new_value)
		
		-- if the mouse hovers over the list, we need to update the current tooltip
		-- because the control under the mouse changed by scrolling
		-- clear tooltip
		InformationTooltip:ClearLines()
        InformationTooltip:SetHidden(true)
		-- get control where the mouse is currently over
		local control = moc()
		-- show new tooltip
		if control.tooltipText then
			Teleporter:tooltipTextEnter(control, control.tooltipText)
		end
    end)
	
    -- event: slider
    Teleporter.control_global.slider:SetHandler("OnValueChanged", function(self, value, eventReason)
        -- update offset
		self_listview.offset = value
		-- update the list view accoring to slider offset (slider's new position)
        self_listview:update()
    end)

    -- just for preventing multiple reszisings at the samt ime
    Teleporter.control_global:SetHandler("OnResizeStart", function(self)
        self_listview.currently_resizing = true
    end)

    Teleporter.control_global:SetHandler("OnResizeStop", function(self)
        self_listview.currently_resizing = false
        _on_resize(self_listview)
        self_listview:update()
    end)

    -- event: control update
    Teleporter.control_global:SetHandler("OnUpdate", function(self, elapsed)
        self_listview:update()
    end)

    -- event: backdrop control update position
    Teleporter.control_global.bd:SetHandler("OnMouseUp", function(self)
		if SCENE_MANAGER:IsShowing("worldMap") then
			if not Teleporter.savedVarsAcc.anchorOnMap then
				Teleporter.savedVarsAcc.pos_MapScene_x = math.floor(Teleporter.control_global.bd:GetLeft())
				Teleporter.savedVarsAcc.pos_MapScene_y = math.floor(Teleporter.control_global.bd:GetTop())
			end
		else
			Teleporter.savedVarsAcc.pos_x = math.floor(Teleporter.control_global.bd:GetLeft())
			Teleporter.savedVarsAcc.pos_y = math.floor(Teleporter.control_global.bd:GetTop())
		end
    end)
end


-- ListView
local ListView = {}

function ListView.new(control, name, settings)
    settings = settings or {}

    self = {
        line_height = 40*Teleporter.savedVarsAcc.Scale,
        slider_texture = settings.slider_texture or "/esoui/art/miscellaneous/scrollbox_elevator.dds",
        title = settings.title, -- can be nil

        control = control,
        name = control:GetName(),
        offset = 0,
        lines = {},
        currently_resizing = false,
    }
	
	local height = Teleporter.calculateListHeight()
	local width = 450*Teleporter.savedVarsAcc.Scale
    local left = 30*Teleporter.savedVarsAcc.Scale
    local top = 150*Teleporter.savedVarsAcc.Scale

    -- TODO: Translate self:SetHidden() etc. to self.control:SetHidden()
    setmetatable(self, { __index = ListView })
    _initialize_listview(self, width, height, left, top)
    return self
end


-- update the ListView
-- Goes through each line control and either shows a message or hides it
function ListView:update()
    local throttle_time = self.currently_resizing and 0.02 or 0.1
    if Teleporter.throttle(self, 0.05) then
        return
    end

    if self.currently_resizing then
        _on_resize(self)
    end
	
    -- Clean the list !!!
	for i, list in pairs(self.control.lines) do
		list:SetHidden(true)
	end
	
	-- show total entries
	local firstRecord = self.lines[1]
	if firstRecord.displayName == "" and firstRecord.zoneNameClickable ~= true then
		-- no entries, only no matches info
		self.control.total:SetText(SI.get(SI.TELE_UI_TOTAL) .. " " .. "0")
	elseif self.lines[totalPortals-1].displayName == "" and self.lines[totalPortals-1].zoneNameClickable ~= true then
		-- last entry is "maps in other zones"
		self.control.total:SetText(SI.get(SI.TELE_UI_TOTAL) .. " " .. totalPortals - 2)
	else
		-- normal
		self.control.total:SetText(SI.get(SI.TELE_UI_TOTAL) .. " " .. totalPortals - 1)
	end
	
	
    for i, list in pairs(self.control.lines) do
        local message = self.lines[i + self.offset] -- self.offset = how much we've scrolled down
		local tooltipTextPlayer = {}
		local tooltipTextZone = {}
		local tooltipTextLevel = ""
		
        -- Only show messages that will be displayed within the control
        if message ~= nil and i <= self.num_visible_lines then
            if i >= self.num_visible_lines + 1 then return end;
            if message == nil then return end;

			if message.zoneName == nil then return end;
			
			--------- player tooltip ---------
			if message.displayName ~= "" and message.championRank then
				list.ColumnPlayerNameTooltip:SetHidden(false)
				-- set level text for player tooltip
				if message.championRank >= 1 then
					tooltipTextLevel = "CP " .. message.championRank
				else
					tooltipTextLevel = message.level
				end
				
				
				tooltipTextPlayer = {message.characterName, tooltipTextLevel, message.allianceName}
				-- add source text
				-- add separator
				table.insert(tooltipTextPlayer, Teleporter.textures.tooltipSeperator)
				for _, sourceText in pairs(message.sourcesText) do
					table.insert(tooltipTextPlayer, sourceText)
				end
				
			
				if 	#tooltipTextPlayer > 0 then
					-- show tooltip handler
					list.ColumnPlayerNameTooltip:SetHandler("OnMouseEnter", function(self) list.ColumnPlayerNameTooltip:SetAlpha(0.5) Teleporter:tooltipTextEnter(list.ColumnPlayerNameTooltip, tooltipTextPlayer) end)
					-- hide tooltip handler
					list.ColumnPlayerNameTooltip:SetHandler("OnMouseExit", function(self) list.ColumnPlayerNameTooltip:SetAlpha(1) Teleporter:tooltipTextEnter(list.ColumnPlayerNameTooltip) end)
					-- link tooltip text to control (for update on scroll / mouse wheel)
					list.ColumnPlayerNameTooltip.tooltipText = tooltipTextPlayer
				end
				
				-- set handler for making favorite
				list.ColumnPlayerNameTooltip:SetHandler("OnMouseUp", function(self, button) Teleporter.clickOnPlayerName(button, message) end)
			else
				-- make tooltip invisible (no DisplayName of Player -> no Tooltip)
				list.ColumnPlayerNameTooltip:SetHidden(true)
			end
			------------------


			--------- zone tooltip (and zone name)  and handler for map opening ---------
			-- if search for related items and info not already added
			if message.relatedItems ~= nil and #message.relatedItems > 0 then
				if string.sub(message.zoneName, -1) ~= ")" then
					-- add info about total number of related items
					local totalItemsCountInv = 0
					local totalItemsCountBank = 0
					for index, item in pairs(message.relatedItems) do
						if item.isInInventory then
							totalItemsCountInv = totalItemsCountInv + item.itemCount
						else
							totalItemsCountBank = totalItemsCountBank + item.itemCount
						end
					end
					if totalItemsCountInv > 0 then
						message.zoneName = message.zoneName .. " (" .. totalItemsCountInv .. ")"
					end
					if totalItemsCountBank > 0 then
						message.zoneName = message.zoneName .. Teleporter.var.color.colTrash .. " (" .. totalItemsCountBank .. ")"
					end
				end
				
				-- copy item names to tooltipTextZone
				for index, item in ipairs(message.relatedItems) do
					table.insert(tooltipTextZone, item.itemTooltip)
				end
				
				
			-- if search for related quests
			elseif message.relatedQuests ~= nil and #message.relatedQuests > 0 then
				if string.sub(message.zoneName, -1) ~= ")" then
					-- add info about number of related quests
					message.zoneName = message.zoneName .. " (" .. message.countRelatedQuests .. ")"
				end
				-- copy "message.relatedQuests" to "tooltipTextZone" (Attention: "=" will set pointer!)
				ZO_DeepTableCopy(message.relatedQuests, tooltipTextZone)
			end
			
			
			-- wayhsrine and skyshard discovery info
			if message.zoneNameClickable == true and (message.zoneWayhsrineDiscoveryInfo ~= nil or message.zoneSkyshardDiscoveryInfo ~= nil) then
				if #tooltipTextZone > 0 then
					-- add separator
					table.insert(tooltipTextZone, 1, Teleporter.textures.tooltipSeperator)
				end
				-- add discovery info
				if message.zoneSkyshardDiscoveryInfo ~= nil then
					table.insert(tooltipTextZone, 1, message.zoneSkyshardDiscoveryInfo)
				end
				if message.zoneWayhsrineDiscoveryInfo ~= nil then
					table.insert(tooltipTextZone, 1, message.zoneWayhsrineDiscoveryInfo)
				end
			end
			------------------
			

			-- Second language for zone names
			-- if second language is selected & entry is a real zone & zoneNameSecondLanguage exists
			if Teleporter.savedVarsAcc.secondLanguage ~= 1 and message.zoneNameClickable == true and message.zoneNameSecondLanguage ~= nil then
				if #tooltipTextZone > 0 then
					-- add separator
					table.insert(tooltipTextZone, 1, Teleporter.textures.tooltipSeperator)
				end
				-- add zone name
				table.insert(tooltipTextZone, 1, message.zoneNameSecondLanguage)
			end
			------------------

			
			-- Info if player is in same instance
			if message.groupMemberSameInstance ~= nil then
				if #tooltipTextZone > 0 then
					-- add separator
					table.insert(tooltipTextZone, Teleporter.textures.tooltipSeperator)
				end
				-- add instance info
				if message.groupMemberSameInstance == true then
					table.insert(tooltipTextZone, Teleporter.var.color.colGreen .. SI.get(SI.TELE_UI_SAME_INSTANCE))
				else
					table.insert(tooltipTextZone, Teleporter.var.color.colRed .. SI.get(SI.TELE_UI_DIFFERENT_INSTANCE))
				end
			end
			------------------
			
			
			-- house tooltip
			if message.houseTooltip then
				if #tooltipTextZone > 0 then
					-- add separator
					table.insert(tooltipTextZone, Teleporter.textures.tooltipSeperator)
				end
				-- add house infos
				--ZO_DeepTableCopy(message.houseTooltip, tooltipTextZone)
				for _, v in pairs(message.houseTooltip) do
					table.insert(tooltipTextZone, v)
				end
			end
			
			-- guild tooltip
			if message.guildTooltip then
				ZO_DeepTableCopy(message.guildTooltip, tooltipTextZone)
			end

			-- Tooltip & Button Controls
		
				if #tooltipTextZone > 0 then
				-- related items or related quests
					-- hide Button
					list.ColumnZoneNameBtn:SetHidden(true)
					-- show tooltip
					list.ColumnZoneNameTooltip:SetHidden(false)
					
					if message.zoneNameClickable then
					-- entries with clickable zones
						-- set handler for map opening
						list.ColumnZoneNameTooltip:SetHandler("OnMouseUp", function(self, button) Teleporter.clickOnZoneName(button, message) end)
					else
					-- entries with no zones -> show Tamriel on click
						list.ColumnZoneNameTooltip:SetHandler("OnMouseUp", nil)
					end
					-- show tooltip + MouseOver handler
					list.ColumnZoneNameTooltip:SetHandler("OnMouseEnter", function(self) Teleporter:tooltipTextEnter(list.ColumnZoneNameTooltip, tooltipTextZone) list.ColumnZoneNameTex:SetAlpha(0.8) end)
					-- hide tooltip + MouseOver handler
					list.ColumnZoneNameTooltip:SetHandler("OnMouseExit", function(self) Teleporter:tooltipTextEnter(list.ColumnZoneNameTooltip) list.ColumnZoneNameTex:SetAlpha(0) end)
					-- link tooltip text to control (for update on scroll / mouse wheel)
					list.ColumnZoneNameTooltip.tooltipText = tooltipTextZone
					
				else
					-- hide tooltip
					list.ColumnZoneNameTooltip:SetHidden(true)
					-- show Button
					list.ColumnZoneNameBtn:SetHidden(false)
					
					--if message.displayName ~= "" then
					if message.zoneNameClickable then
					-- valid entries
						-- show MouseOver handler
						list.ColumnZoneNameBtn:SetHandler("OnMouseEnter", function(self) list.ColumnZoneNameTex:SetAlpha(0.8) end)
						-- hide MouseOver handler
						list.ColumnZoneNameBtn:SetHandler("OnMouseExit", function(self) list.ColumnZoneNameTex:SetAlpha(0) end)
						-- set handler for map opening
						list.ColumnZoneNameBtn:SetHandler("OnMouseUp", function(self, button) Teleporter.clickOnZoneName(button, message) end)
					else
						-- entry: no results
						list.ColumnZoneNameBtn:SetHidden(true)
					end
				end
			------------------
			
			-- set text and color
			list.ColumnPlayerName:SetText(message.textColorDisplayName .. message.displayName)
			list.ColumnZoneName:SetText(message.textColorZoneName .. message.zoneName)
			
			-- number of players
			if message.numberPlayers ~= nil then
				-- show
				list.ColumnNumberPlayersBtn:SetHidden(false)
				-- set text
				list.ColumnNumberPlayers:SetText(message.numberPlayers)
				-- show MouseOver handler
				list.ColumnNumberPlayersBtn:SetHandler("OnMouseEnter", function(self) list.ColumnNumberPlayersTex:SetAlpha(0.8) end)
				-- hide MouseOver handler
				list.ColumnNumberPlayersBtn:SetHandler("OnMouseExit", function(self) list.ColumnNumberPlayersTex:SetAlpha(0) end)
				-- set handler for opening
				list.ColumnNumberPlayersBtn:SetHandler("OnMouseUp", function(self, button) Teleporter.createTable({index=8, fZoneId=message.zoneId}) end)
			else
				list.ColumnNumberPlayers:SetText("")
				-- hide
				list.ColumnNumberPlayersBtn:SetHidden(true)
			end
			
						
			-- set wayshrine icon
			local texture_normal = Teleporter.textures.wayshrineBtn
			local texture_over = Teleporter.textures.wayshrineBtnOver
			-- overland zones have category == 9
			
			if message.category ~= nil and message.category ~= 0 then
				-- set category texture
				if message.category == 1 then
					-- set Delve texture
					texture_normal = Teleporter.textures.delvesBtn
					texture_over = Teleporter.textures.delvesBtnOver
				elseif message.category == 2 then
					-- set Public Dungeon texture
					texture_normal = Teleporter.textures.publicDungeonBtn
					texture_over = Teleporter.textures.publicDungeonBtnOver
				elseif message.category == 3 then
					-- set House texture
					texture_normal = Teleporter.textures.houseBtn
					texture_over = Teleporter.textures.houseBtnOver
				elseif message.category == 4 then
					-- 4 men Group Dungeons
					texture_normal = Teleporter.textures.groupDungeonBtn
					texture_over = Teleporter.textures.groupDungeonBtnOver
				elseif message.category == 5 then
					-- 12 men Group Dungeons
					texture_normal = Teleporter.textures.raidDungeonBtn
					texture_over = Teleporter.textures.raidDungeonBtnOver
				elseif message.category == 6 then
					-- Other Group Zones (Dungeons in Craglorn)
					texture_normal = Teleporter.textures.groupZonesBtn
					texture_over = Teleporter.textures.groupZonesBtnOver
				elseif message.category == 7 then
					-- Group Arenas
					texture_normal = Teleporter.textures.groupDungeonBtn
					texture_over = Teleporter.textures.groupDungeonBtnOver
				elseif message.category == 8 then
					-- Solo Arenas
					texture_normal = Teleporter.textures.soloArenaBtn
					texture_over = Teleporter.textures.soloArenaBtnOver
				end
			end
			
			-- check for Group Leader
			if message.sourceIndexLeading == TELEPORTER_SOURCE_INDEX_GROUP and message.isLeader then
				-- set Group Leader texture
				texture_normal = Teleporter.textures.groupLeaderBtn
				texture_over = Teleporter.textures.groupLeaderBtnOver
			end
			
			if message.isOwnHouse then
				-- own house
				list.portalToPlayerTex:SetHidden(false)
				list.portalToPlayerTex:SetTexture(Teleporter.textures.houseBtn)
				list.portalToPlayer:SetHandler("OnMouseEnter", function(self) list.portalToPlayerTex:SetTexture(Teleporter.textures.houseBtnOver) end)
				list.portalToPlayer:SetHandler("OnMouseExit", function(self) list.portalToPlayerTex:SetTexture(Teleporter.textures.houseBtn) end)
				list.portalToPlayer:SetHandler("OnMouseUp", function(self, button) Teleporter.clickOnTeleportToOwnHouseButton(list.portalToPlayerTex, button, message) end)
				
			elseif message.isPTFHouse then
				-- "Port to Freind's House" integration
				list.portalToPlayerTex:SetHidden(false)
				list.portalToPlayerTex:SetTexture(Teleporter.textures.ptfHouseBtn)
				list.portalToPlayer:SetHandler("OnMouseEnter", function(self) list.portalToPlayerTex:SetTexture(Teleporter.textures.ptfHouseBtnOver) end)
				list.portalToPlayer:SetHandler("OnMouseExit", function(self) list.portalToPlayerTex:SetTexture(Teleporter.textures.ptfHouseBtn) end)
				list.portalToPlayer:SetHandler("OnMouseUp", function(self, button) Teleporter.clickOnTeleportToPTFHouseButton(list.portalToPlayerTex, button, message) end)

			elseif message.isGuild then
				-- Own and partner guilds
				if not message.hideButton then
					list.portalToPlayerTex:SetHidden(false)
					list.portalToPlayerTex:SetTexture(Teleporter.textures.guildBtn)
					list.portalToPlayer:SetHandler("OnMouseEnter", function(self) list.portalToPlayerTex:SetTexture(Teleporter.textures.guildBtnOver) end)
					list.portalToPlayer:SetHandler("OnMouseExit", function(self) list.portalToPlayerTex:SetTexture(Teleporter.textures.guildBtn) end)
					list.portalToPlayer:SetHandler("OnMouseUp", function(self, button) Teleporter.clickOnOpenGuild(list.portalToPlayerTex, button, message) end)
				else
					list.portalToPlayerTex:SetHidden(true)
				end
				
			elseif message.isDungeon then
				-- Dungeon Finder -> use nodeIndecies instead of travel to zoneId
				list.portalToPlayerTex:SetHidden(false)
				list.portalToPlayerTex:SetTexture(texture_normal)
				list.portalToPlayer:SetHandler("OnMouseEnter", function(self) list.portalToPlayerTex:SetTexture(texture_over) Teleporter:tooltipTextEnter(list.portalToPlayerTex, message.difficultyText) end)
				list.portalToPlayer:SetHandler("OnMouseExit", function(self) list.portalToPlayerTex:SetTexture(texture_normal) Teleporter:tooltipTextEnter(list.portalToPlayerTex) end)
				list.portalToPlayer:SetHandler("OnMouseUp", function(self, button) Teleporter.clickOnTeleportToDungeonButton(list.portalToPlayerTex, button, message) end)
				
			elseif message.displayName ~= "" then
				-- player
				list.portalToPlayerTex:SetHidden(false)
				list.portalToPlayerTex:SetTexture(texture_normal)
				list.portalToPlayer:SetHandler("OnMouseEnter", function(self) list.portalToPlayerTex:SetTexture(texture_over) end)
				list.portalToPlayer:SetHandler("OnMouseExit", function(self) list.portalToPlayerTex:SetTexture(texture_normal) end)
				list.portalToPlayer:SetHandler("OnMouseUp", function(self, button) Teleporter.clickOnTeleportToPlayerButton(list.portalToPlayerTex, button, message) end)
			
			else
				-- no DisplayName -> no teleport possibility
				list.portalToPlayerTex:SetHidden(true)
			end
			
            list:SetHidden(false)
        else
            list:SetHidden(true)
		end
    end
end


function Teleporter.clickOnTeleportToPlayerButton(textureControl, button, message)
	-- click effect
	textureControl:SetAlpha(0.65)
	zo_callLater(function() textureControl:SetAlpha(1) end, 200)	

	if button == MOUSE_BUTTON_INDEX_RIGHT and IsPlayerInGroup(GetDisplayName()) then
		-- create and share link to the group channel
		local linkType = "book"
		local data1 = 190 -- bookId
		local data2 = "BMU_S_P" -- signature
		local data3 = GetDisplayName() -- playerFrom
		local data4 = message.displayName -- playerTo
		local text = "Follow me!" -- currently not working because linkType "book" does not allow custom text
		
		local link = "|H1:" .. linkType .. ":" .. data1 .. ":" .. data2 .. ":" .. data3 .. ":" .. data4 .. "|h[" .. text .. "]|h"
		
		local preText = "Click to follow me to " .. message.zoneName .. ": "

		-- print link into group channel - player has to press Enter manually!
		StartChatInput(preText .. link, CHAT_CHANNEL_PARTY)
	end
	
	-- port to player anyway
	Teleporter.PortalToPlayer(message.displayName, message.sourceIndexLeading, message.zoneName, message.zoneId, message.category, true, true, true)
	if Teleporter.savedVarsAcc.closeOnPorting then
		-- hide world map if open
		SCENE_MANAGER:Hide("worldMap")
		-- hide UI if open
		Teleporter.HideTeleporter()
	end
end


function Teleporter.clickOnTeleportToOwnHouseButton(textureControl, button, message)
	-- click effect
	textureControl:SetAlpha(0.65)
	zo_callLater(function() textureControl:SetAlpha(1) end, 200)
	
	if message.forceOutside then
		Teleporter.clickOnTeleportToOwnHouseButton_2(button, message, true)
	else
		-- show submenu
		ClearMenu()
		AddCustomMenuItem(SI.get(SI.TELE_UI_JUMP_IN_HOUSE), function() Teleporter.clickOnTeleportToOwnHouseButton_2(button, message, false) end)
		AddCustomMenuItem(SI.get(SI.TELE_UI_JUMP_IN_FRONT_HOUSE), function() Teleporter.clickOnTeleportToOwnHouseButton_2(button, message, true) end)
		ShowMenu()
	end
end


function Teleporter.clickOnTeleportToOwnHouseButton_2(button, message, jumpOutside)
	if button == MOUSE_BUTTON_INDEX_RIGHT and IsPlayerInGroup(GetDisplayName()) then
		-- create and share link to the group channel
		local linkType = "book"
		local data1 = 190 -- bookId
		local data2 = "BMU_S_H" -- signature
		local data3 = GetDisplayName() -- player
		local data4 = message.houseId -- houseId
		local text = "Follow me!" -- currently not working because linkType "book" does not allow custom text
		
		local link = "|H1:" .. linkType .. ":" .. data1 .. ":" .. data2 .. ":" .. data3 .. ":" .. data4 .. "|h[" .. text .. "]|h"
		local preText = "Click to follow me to " .. Teleporter.formatName(GetZoneNameById(message.zoneId), false) .. ": "

		-- print link into group channel - player has to press Enter manually!
		StartChatInput(preText .. link, CHAT_CHANNEL_PARTY)
	end
	
	-- port to own house anyway
	Teleporter.portToOwnHouse(false, message.houseId, jumpOutside, message.parentZoneName)
end



function Teleporter.clickOnTeleportToPTFHouseButton(textureControl, button, message)
	-- click effect
	textureControl:SetAlpha(0.65)
	zo_callLater(function() textureControl:SetAlpha(1) end, 200)

	if message.displayName ~= nil and message.displayName ~= "" and message.houseId ~= nil and message.houseId > 0 then
		-- cut PTF favorite number which is maybe before displayName
		local position, _ = string.find(message.displayName, "@")
		if position ~= nil then
			message.displayName = string.sub(message.displayName, position)
		end
		
		if button == MOUSE_BUTTON_INDEX_RIGHT and IsPlayerInGroup(GetDisplayName()) then
			-- create and share link to the group channel
			local linkType = "book"
			local data1 = 190 -- bookId
			local data2 = "BMU_S_H" -- signature
			local data3 = message.displayName -- player
			local data4 = message.houseId -- houseId
			local text = "Follow me!" -- currently not working because linkType "book" does not allow custom text
			
			local link = "|H1:" .. linkType .. ":" .. data1 .. ":" .. data2 .. ":" .. data3 .. ":" .. data4 .. "|h[" .. text .. "]|h"
			local preText = "Click to follow me to " .. data3 .. " - ".. Teleporter.formatName(GetZoneNameById(message.zoneId), false) .. ": "

			-- print link into group channel - player has to press Enter manually!
			StartChatInput(preText .. link, CHAT_CHANNEL_PARTY)
		end
	
		-- port to house anyway
		if message.displayName == GetDisplayName() or message.displayName == nil or zo_strtrim(message.displayName) == "" then
			-- own house
			d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_PORT_TO_OWN_HOUSE) .. " " .. Teleporter.formatName(GetZoneNameById(message.zoneId), false))
			RequestJumpToHouse(message.houseId)
		else
			d("[" .. Teleporter.var.appNameAbbr .. "]: " .. "Port to PTF House:" .. " " .. message.displayName .. " - " .. Teleporter.formatName(GetZoneNameById(message.zoneId), false))
			JumpToSpecificHouse(message.displayName, message.houseId)
		end
	
		if Teleporter.savedVarsAcc.closeOnPorting then
			-- hide world map if open
			SCENE_MANAGER:Hide("worldMap")
			-- hide UI if open
			Teleporter.HideTeleporter()
		end
	end
end



function Teleporter.clickOnOpenGuild(textureControl, button, message)
	-- click effect
	textureControl:SetAlpha(0.65)
	zo_callLater(function() textureControl:SetAlpha(1) end, 200)

	ZO_LinkHandler_OnLinkClicked("|H1:guild:" .. message.guildId .. "|hGuild|h", 1, nil)
end



function Teleporter.clickOnTeleportToDungeonButton(textureControl, button, message)
	-- click effect
	textureControl:SetAlpha(0.65)
	zo_callLater(function() textureControl:SetAlpha(1) end, 200)
	
	if button == MOUSE_BUTTON_INDEX_RIGHT and CanPlayerChangeGroupDifficulty() then
		-- show context menu
		ClearMenu()
		AddCustomMenuItem(Teleporter.textures.dungeonDifficultyNormal .. GetString(SI_DUNGEONDIFFICULTY1), function() Teleporter.setDungeonDifficulty(false) zo_callLater(function() Teleporter.clickOnTeleportToDungeonButton_2(message) end, 200) end)
		AddCustomMenuItem(Teleporter.textures.dungeonDifficultyVeteran .. GetString(SI_DUNGEONDIFFICULTY2), function() Teleporter.setDungeonDifficulty(true) zo_callLater(function() Teleporter.clickOnTeleportToDungeonButton_2(message) end, 200) end)
		ShowMenu()		
	else
		-- just start teleport
		Teleporter.clickOnTeleportToDungeonButton_2(message)
	end
end



function Teleporter.clickOnTeleportToDungeonButton_2(message)
	-- port to nodeIndex
	d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_TO_DUNGEON) .. " " .. message.zoneName)
	FastTravelToNode(message.nodeIndex)
	if Teleporter.savedVarsAcc.closeOnPorting then
		-- hide world map if open
		SCENE_MANAGER:Hide("worldMap")
		-- hide UI if open
		Teleporter.HideTeleporter()
	end
end



-- refresh in depending of current state
function Teleporter.refreshListAuto()
	local inputString = ""
	
	if Teleporter.state == 2 then
		-- catch input string (player)
		inputString = Teleporter.win.Searcher_Player:GetText()
	elseif Teleporter.state == 3 then
		-- catch input string (zone)
		inputString = Teleporter.win.Searcher_Zone:GetText()
	end
	
	if Teleporter.state == 11 or Teleporter.state == 12 or Teleporter.state == 13 or Teleporter.state == 14 then
		-- if list of own houses (11) or PTF houses (12) or guilds (13) or Dungeon Finder (14) dont auto refresh
		return
	else
		Teleporter.createTable({index=Teleporter.state, inputString=inputString, fZoneId=Teleporter.stateZoneId, filterSourceIndex=Teleporter.stateSourceIndex, dontResetSlider=true})
	end
end


function ListView:add_messages(message, dontResetSlider)
	self.lines = {}
        for k, v in pairs(message) do self.lines[k] = v
          table.insert(self.lines, message)
         end
    totalPortals = #self.lines
    ListView = {}
    _on_resize(self) -- adjusts slider size according to number of lines
	if (not dontResetSlider) and Teleporter.control_global.slider:GetValue() ~= 0 then -- OnValueChanged Handler will not be triggered if value stays the same
		-- reset slider position
		-- OnValueChanged Handler will also do the self:update
		Teleporter.control_global.slider:SetValue(0)
	else
		self:update() -- adjusts list view according to slider offset
	end
end


-- working alternative to unsupported frontier pattern mathing with string.find
-- gets an input string (word) and checks if the input string is "as whole" in myString (no alphanumeric symbols directly before or after word)
-- Example: isWholeWordInString("Nchuleft", "Nchuleftingth") -> FALSE
--			isWholeWordInString("Mahlstrom", "The Mahlstrom (Veteran)") -> TRUE
function Teleporter.isWholeWordInString(myString, word)
	return select(2,myString:gsub('^' .. word .. '%W+','')) +
		select(2,myString:gsub('%W+' .. word .. '$','')) +
		select(2,myString:gsub('^' .. word .. '$','')) +
		select(2,myString:gsub('%W+' .. word .. '%W+','')) > 0
end


function Teleporter.clickOnZoneName(button, record)
	if button == MOUSE_BUTTON_INDEX_LEFT then
		-- PTF house tab
		if record.PTFHouseOpen then
			-- hide world map if open
			SCENE_MANAGER:Hide("worldMap")
			-- hide UI if open
			Teleporter.HideTeleporter()
			zo_callLater(function() PortToFriend.OpenWindow(function() zo_callLater(function() SetGameCameraUIMode(true) Teleporter.OpenTeleporter(false) Teleporter.createTablePTF() end, 150) end) end, 150)
			--SetGameCameraUIMode(true)
			return
		end
		
		-- display on map
		if record.mapIndex ~= nil then
			SCENE_MANAGER:Show("worldMap")
			-- switch to Tamriel and back to players map in order to reset any subzone or zoom
			ZO_WorldMap_SetMapByIndex(1)
			ZO_WorldMap_SetMapByIndex(record.mapIndex)
		end
	
		if record.parentZoneId ~= nil and (record.category ~= 9 or record.forceOutside) then
			local toSearch = record.zoneNameUnformatted
			if record.forceOutside then
				toSearch = record.houseNameUnformatted
			end
		
			-- find out coordinates in order to Ping on Map (e.g. Delves, Public Dungeons)
			local coordinate_x = 0
			local coordinate_z = 0
			local zoneIndex = GetZoneIndex(record.parentZoneId)
			
			for i = 0, GetNumPOIs(zoneIndex) do
				local e = {}
				e.normalizedX, e.normalizedZ, e.poiPinType, e.icon, e.isShownInCurrentMap, e.linkedCollectibleIsLocked = GetPOIMapInfo(zoneIndex, i)
				e.objectiveName, e.objectiveLevel, e.startDescription, e.finishedDescription = GetPOIInfo(zoneIndex, i)
		
				-- because of inconsistency with zone names coming from API and coming from map (POI), we have to test all 4 cases / combinations
				local objectiveNameWithArticle = string.lower(Teleporter.formatName(e.objectiveName, false))
				local zoneNameWithArticle = string.lower(Teleporter.formatName(toSearch, false))
				local objectiveNameWithoutArticle = string.lower(Teleporter.formatName(e.objectiveName, true))
				local zoneNameWithoutArcticle = string.lower(Teleporter.formatName(toSearch, true))
				
				-- solve bug with "-"
				if zoneNameWithArticle ~= nil then
					zoneNameWithArticle = string.gsub(zoneNameWithArticle, "-", "--")
				end
				
				--if (string.match(string.lower(objectiveNameWithArticle), string.lower(zoneNameWithArticle)) or string.match(string.lower(objectiveNameWithArticle), string.lower(zoneNameWithoutArcticle))) and not string.match(string.lower(e.icon), string.lower("poi_wayshrine")) then
				--if (string.find(objectiveNameWithArticle, zoneNameWithArticle) or string.find(objectiveNameWithArticle, zoneNameWithoutArcticle)) and not string.match(string.lower(e.icon), "poi_wayshrine") then
				--if (string.find(objectiveNameWithArticle, "%f[%a]" .. zoneNameWithArticle .. "%f[%A]") or string.find(objectiveNameWithArticle, "%f[%a]" .. zoneNameWithoutArcticle .. "%f[%A]")) and not string.match(string.lower(e.icon), "poi_wayshrine") then
				
				-- check (if zoneNameWithArticle is found in objectiveNameWithArticle) or if (zoneNameWithoutArcticle is found in objectiveNameWithArticle) AND objective has no wayshrine or portal icon (to prevent matches with wayshrines and dolmen)
				if (Teleporter.isWholeWordInString(objectiveNameWithArticle, zoneNameWithArticle) or Teleporter.isWholeWordInString(objectiveNameWithArticle, zoneNameWithoutArcticle)) and not string.match(string.lower(e.icon), "wayshrine") and not string.match(string.lower(e.icon), "portal") then
					-- Map Ping
					PingMap(MAP_PIN_TYPE_RALLY_POINT, MAP_TYPE_LOCATION_CENTERED, e.normalizedX, e.normalizedZ)
					--zo_callLater(function() RemoveRallyPoint() end, 6000)
				end
			end
		end
	else -- button == MOUSE_BUTTON_INDEX_RIGHT
		if record.isDungeon then
			-- no context menu for dungeon entries so far
			return
		end
		
		ClearMenu()
		
		-- house tab only
		if record.isOwnHouse and not record.forceOutside then
			-- rename house
			AddCustomMenuItem(SI.get(SI.TELE_UI_RENAME_HOUSE_NICKNAME), function() ZO_CollectionsBook.ShowRenameDialog(record.collectibleId) end)
			-- make primary residence
			if record.prio ~= 1 then
				-- prio = 1 -> is primary house
				-- make primary and refresh with delay
				AddCustomMenuItem(SI.get(SI.TELE_UI_SET_PRIMARY_HOUSE), function()
					SetHousingPrimaryHouse(record.houseId)
					zo_callLater(function()
						Teleporter.createTableHouses()
					end, 500)
				 end)
			end
			
			-- toggle between nicknames and standard names
			local menuIndex = AddCustomMenuItem(SI.get(SI.TELE_UI_TOGGLE_HOUSE_NICKNAME), function() Teleporter.savedVarsAcc.houseNickNames = not Teleporter.savedVarsAcc.houseNickNames Teleporter.createTableHouses() end, MENU_ADD_OPTION_CHECKBOX)
			if Teleporter.savedVarsAcc.houseNickNames then
				ZO_CheckButton_SetChecked(ZO_Menu.items[menuIndex].checkbox)
			end
		
		-- relatedQuests only
		elseif #record.relatedQuests > 0 then
			for k, v in pairs(record.relatedQuests) do
				-- Show quest marker on map if record contains quest
				AddCustomMenuItem(SI.get(SI.TELE_UI_SHOW_QUEST_MARKER_ON_MAP) .. ": \"" .. record.relatedQuests[k] .. "\"", function() ZO_WorldMap_ShowQuestOnMap(record.relatedQuestsSlotIndex[k]) end)
			end
		
		-- relatedItems tab only
		elseif #record.relatedItems > 0 then
			-- create entry for each item in inventory: UseItem(number Bag bagId, number slotIndex)
			for index, item in pairs(record.relatedItems) do
				if item.bagId == BAG_BACKPACK then -- item is in inventory and can be used
					-- use item
					AddCustomMenuItem(SI.get(SI.TELE_UI_VIEW_MAP_ITEM) .. ": \"" .. item.itemName .. "\"", function()
						if IsProtectedFunction("UseItem") then
							CallSecureProtected("UseItem", BAG_BACKPACK, item.slotIndex)
						else
							d("[" .. Teleporter.var.appNameAbbr .. " - ERROR] failed to use item (" .. item.itemName .. ")")
						end
					end)
				elseif item.antiquityId then -- lead -> show lead in codex
					AddCustomMenuItem(SI.get(SI.TELE_UI_VIEW_ANTIQUITY) .. ": \"" .. item.itemName .. "\"", function()
						ANTIQUITY_LORE_KEYBOARD:ShowAntiquity(item.antiquityId)
					end)
				end
				
			end
			
		-- Favorites
		else
			if Teleporter.isFavoriteZone(record.zoneId) then
				AddCustomMenuItem(SI.get(SI.TELE_UI_REMOVE_FAVORITE_ZONE), function() Teleporter.removeFavoriteZone(record.zoneId) end)
			else
				local fav1 = ""
				local fav2 = ""
				local fav3 = ""
				local fav4 = ""
				local fav5 = ""
							
				if Teleporter.savedVarsServ.favoriteListZones[1] ~= nil then fav1 = Teleporter.formatName(GetZoneNameById(Teleporter.savedVarsServ.favoriteListZones[1]), Teleporter.savedVarsAcc.formatZoneName) end
				if Teleporter.savedVarsServ.favoriteListZones[2] ~= nil then fav2 = Teleporter.formatName(GetZoneNameById(Teleporter.savedVarsServ.favoriteListZones[2]), Teleporter.savedVarsAcc.formatZoneName) end
				if Teleporter.savedVarsServ.favoriteListZones[3] ~= nil then fav3 = Teleporter.formatName(GetZoneNameById(Teleporter.savedVarsServ.favoriteListZones[3]), Teleporter.savedVarsAcc.formatZoneName) end
				if Teleporter.savedVarsServ.favoriteListZones[4] ~= nil then fav4 = Teleporter.formatName(GetZoneNameById(Teleporter.savedVarsServ.favoriteListZones[4]), Teleporter.savedVarsAcc.formatZoneName) end
				if Teleporter.savedVarsServ.favoriteListZones[5] ~= nil then fav5 = Teleporter.formatName(GetZoneNameById(Teleporter.savedVarsServ.favoriteListZones[5]), Teleporter.savedVarsAcc.formatZoneName) end

				
				AddCustomMenuItem(SI.get(SI.TELE_UI_FAVORITE_ZONE) .. " 1: " .. fav1, function() Teleporter.addFavoriteZone(1, record.zoneId, record.zoneName) end)
				AddCustomMenuItem(SI.get(SI.TELE_UI_FAVORITE_ZONE) .. " 2: " .. fav2, function() Teleporter.addFavoriteZone(2, record.zoneId, record.zoneName) end)
				AddCustomMenuItem(SI.get(SI.TELE_UI_FAVORITE_ZONE) .. " 3: " .. fav3, function() Teleporter.addFavoriteZone(3, record.zoneId, record.zoneName) end)
				AddCustomMenuItem(SI.get(SI.TELE_UI_FAVORITE_ZONE) .. " 4: " .. fav4, function() Teleporter.addFavoriteZone(4, record.zoneId, record.zoneName) end)
				AddCustomMenuItem(SI.get(SI.TELE_UI_FAVORITE_ZONE) .. " 5: " .. fav5, function() Teleporter.addFavoriteZone(5, record.zoneId, record.zoneName) end)
			end
		end
		
		-- reset port counter
		if Teleporter.savedVarsChar.sorting == 3 or Teleporter.savedVarsChar.sorting == 4 then
			AddCustomMenuItem(SI.get(SI.TELE_UI_RESET_COUNTER_ZONE), function() Teleporter.savedVarsAcc.portCounterPerZone[record.zoneId] = nil Teleporter.refreshListAuto() end)
		end
		
		ShowMenu()
	end
end

function Teleporter.clickOnPlayerName(button, record)
	-- Actions for "Invite to Guild" ??
		-- GetNumGuilds()
		-- GetGuildId(number index) Returns: number guildId
		-- GetGuildName(number guildId) Returns: string name
		-- GetGuildMemberIndexFromDisplayName(number guildId, string displayName) Returns: number:nilable memberIndex
		-- GetGuildMemberInfo(number guildId, number memberIndex) Returns: string name, string note, number rankIndex, number PlayerStatus playerStatus, number secsSinceLogoff
		-- DoesGuildRankHavePermission(number guildId, number rankIndex, number GuildPermission permission) Returns: boolean hasPermission
		-- GuildInvite(number guildId, string displayName)
	
	if button == 2 then -- Right Mouse Click
		ClearMenu()
		
		local unitTag = nil
		local entries_group = {}
		local entries_misc = {}
		local pos = 1
		
		-- get unitTag
		if IsPlayerInGroup(GetDisplayName()) then
			local groupUnitTag = ""
			for j = 1, GetGroupSize() do
				groupUnitTag = GetGroupUnitTagByIndex(j)
				if record.displayName == GetUnitDisplayName(groupUnitTag) then
				unitTag = groupUnitTag
				end
			end
		end
		
	
		-- generate submenu entries for group
		if not IsPlayerInGroup(record.displayName) and IsUnitSoloOrGroupLeader("player") then
			entries_group[pos] = {
				label = SI.get(SI.TELE_UI_ADD_TO_GROUP),
				callback = function(state) GroupInviteByName(record.displayName) end,
			}
			pos = pos + 1
		end
		
		if IsPlayerInGroup(record.displayName) and IsUnitGroupLeader("player") then
			entries_group[pos] = {
				label = SI.get(SI.TELE_UI_PROMOTE_TO_LEADER),
				callback = function(state) GroupPromote(unitTag) end,
			}
			pos = pos + 1
			
			entries_group[pos] = {
				label = SI.get(SI.TELE_UI_KICK_FROM_GROUP),
				callback = function(state) GroupKick(unitTag) end,
			}
			pos = pos + 1
		end
		
		if IsUnitGrouped("player") and not IsUnitGroupLeader("player") and IsPlayerInGroup(record.displayName) and not IsUnitGroupLeader(unitTag) then
			entries_group[pos] = {
				label = SI.get(SI.TELE_UI_VOTE_TO_LEADER),
				callback = function(state) BeginGroupElection(GROUP_ELECTION_TYPE_NEW_LEADER, ZO_GROUP_ELECTION_DESCRIPTORS.NONE, unitTag) end,
			}
			pos = pos + 1
		end
		
		if IsUnitGrouped("player") then
			entries_group[pos] = {
				label = SI.get(SI.TELE_UI_LEAVE_GROUP),
				callback = function(state) GroupLeave() end,
			}
			pos = pos + 1
			
			if DoesGroupModificationRequireVote() then
				entries_group[pos] = {
					label = SI.get(SI.TELE_UI_VOTE_KICK_FROM_GROUP),
					callback = function(state) BeginGroupElection(GROUP_ELECTION_TYPE_KICK_MEMBER, ZO_GROUP_ELECTION_DESCRIPTORS.NONE, unitTag) end,
				}
				pos = pos + 1
			end
		end
		
		
		-- generate submenu entries for misc
		pos = 1
		
		-- whisper
		entries_misc[pos] = {
			label = SI.get(SI.TELE_UI_WHISPER_PLAYER),
			callback = function(state) StartChatInput("", CHAT_CHANNEL_WHISPER, record.displayName) end,
--			tooltip = "Tooltip Test: Whisper",
		}
		pos = pos + 1
		
		-- Jump to House
		entries_misc[pos] = {
			label = SI.get(SI.TELE_UI_JUMP_TO_HOUSE),
			callback = function(state) JumpToHouse(record.displayName) end,
		}
		pos = pos + 1
		
		-- Send Mail
		entries_misc[pos] = {
			label = SI.get(SI.TELE_UI_SEND_MAIL),
			callback = function(state) Teleporter.createMail(record.displayName, "", "") end,
		}
		pos = pos + 1	

		-- Add / Remove Friend
		if IsFriend(record.displayName) then
			entries_misc[pos] = {
				label = SI.get(SI.TELE_UI_REMOVE_FRIEND),
				callback = function(state) RemoveFriend(record.displayName) end,
			}
			pos = pos + 1
		else
			entries_misc[pos] = {
				label = SI.get(SI.TELE_UI_ADD_FRIEND),
				callback = function(state) RequestFriend(record.displayName, "") end,
			}
			pos = pos + 1
		end
		
		-- Invite to primary BeamMeUp guild
		if Teleporter.var.BMUGuilds[GetWorldName()] ~= nil then
			local primaryBMUGuild = Teleporter.var.BMUGuilds[GetWorldName()][1]
			if IsPlayerInGuild(primaryBMUGuild) and not GetGuildMemberIndexFromDisplayName(primaryBMUGuild, record.displayName) then
				entries_misc[pos] = {
					label = SI.get(SI.TELE_UI_INVITE_BMU_GUILD) .. ": BeamMeUp",
					callback = function(state) GuildInvite(primaryBMUGuild, record.displayName) end,
				}
				pos = pos + 1
			end
		
			-- Invite to secondary BeamMeUp guild
			local secondaryBMUGuild = Teleporter.var.BMUGuilds[GetWorldName()][2]
			if IsPlayerInGuild(secondaryBMUGuild) and not GetGuildMemberIndexFromDisplayName(secondaryBMUGuild, record.displayName) then
				entries_misc[pos] = {
					label = SI.get(SI.TELE_UI_INVITE_BMU_GUILD) .. ": BeamMeUp-Two",
					callback = function(state) GuildInvite(secondaryBMUGuild, record.displayName) end,
				}
				pos = pos + 1
			end

			-- Invite to tertiary BeamMeUp guild
			local tertiaryBMUGuild = Teleporter.var.BMUGuilds[GetWorldName()][3]
			if IsPlayerInGuild(tertiaryBMUGuild) and not GetGuildMemberIndexFromDisplayName(tertiaryBMUGuild, record.displayName) then
				entries_misc[pos] = {
					label = SI.get(SI.TELE_UI_INVITE_BMU_GUILD) .. ": BeamMeUp-Three",
					callback = function(state) GuildInvite(tertiaryBMUGuild, record.displayName) end,
				}
				pos = pos + 1
			end
			
			-- Invite to quaternary BeamMeUp guild
			local quaternaryBMUGuild = Teleporter.var.BMUGuilds[GetWorldName()][4]
			if IsPlayerInGuild(quaternaryBMUGuild) and not GetGuildMemberIndexFromDisplayName(quaternaryBMUGuild, record.displayName) then
				entries_misc[pos] = {
					label = SI.get(SI.TELE_UI_INVITE_BMU_GUILD) .. ": BeamMeUp-Four",
					callback = function(state) GuildInvite(quaternaryBMUGuild, record.displayName) end,
				}
				pos = pos + 1
			end
		end
		
		
		-- generate menu entries favorites
		if Teleporter.isFavoritePlayer(record.displayName) then
			AddCustomMenuItem(SI.get(SI.TELE_UI_REMOVE_FAVORITE_PLAYER), function() Teleporter.removeFavoritePlayer(record.displayName) end)
		else
			local fav1 = ""
			local fav2 = ""
			local fav3 = ""
			local fav4 = ""
			local fav5 = ""
			
			if Teleporter.savedVarsServ.favoriteListPlayers[1] ~= nil then fav1 = Teleporter.savedVarsServ.favoriteListPlayers[1] end
			if Teleporter.savedVarsServ.favoriteListPlayers[2] ~= nil then fav2 = Teleporter.savedVarsServ.favoriteListPlayers[2] end
			if Teleporter.savedVarsServ.favoriteListPlayers[3] ~= nil then fav3 = Teleporter.savedVarsServ.favoriteListPlayers[3] end
			if Teleporter.savedVarsServ.favoriteListPlayers[4] ~= nil then fav4 = Teleporter.savedVarsServ.favoriteListPlayers[4] end
			if Teleporter.savedVarsServ.favoriteListPlayers[5] ~= nil then fav5 = Teleporter.savedVarsServ.favoriteListPlayers[5] end
			
			local entries_favorites = {
				{
					label = SI.get(SI.TELE_UI_FAVORITE_PLAYER) .. " 1: " .. fav1,
					callback = function(state) Teleporter.addFavoritePlayer(1, record.displayName) end,
				},
				{
					label = SI.get(SI.TELE_UI_FAVORITE_PLAYER) .. " 2: " .. fav2,
					callback = function(state) Teleporter.addFavoritePlayer(2, record.displayName) end,
				},
				{
					label = SI.get(SI.TELE_UI_FAVORITE_PLAYER) .. " 3: " .. fav3,
					callback = function(state) Teleporter.addFavoritePlayer(3, record.displayName) end,
				},
				{
					label = SI.get(SI.TELE_UI_FAVORITE_PLAYER) .. " 4: " .. fav4,
					callback = function(state) Teleporter.addFavoritePlayer(4, record.displayName) end,
				},
				{
					label = SI.get(SI.TELE_UI_FAVORITE_PLAYER) .. " 5: " .. fav5,
					callback = function(state) Teleporter.addFavoritePlayer(5, record.displayName) end,
				},
			}
			
			AddCustomSubMenuItem(SI.get(SI.TELE_UI_SUBMENU_FAVORITES), entries_favorites)
			
		end
		
		-- add submenu group
		if #entries_group > 0 then
			AddCustomSubMenuItem(SI.get(SI.TELE_UI_SUBMENU_GROUP), entries_group)
		end
		
		-- add submenu misc
	    AddCustomSubMenuItem(SI.get(SI.TELE_UI_SUBMENU_MISC), entries_misc)
		
		-- add submenu filter
		local entries_filter = {
				{
					label = Teleporter.var.color.colOrange .. SI.get(SI.TELE_UI_FILTER_GROUP),
					callback = function(state) Teleporter.createTable({index=7, filterSourceIndex=TELEPORTER_SOURCE_INDEX_GROUP}) end,
				},
				{
					label = Teleporter.var.color.colGreen .. SI.get(SI.TELE_UI_FILTER_FRIENDS),
					callback = function(state) Teleporter.createTable({index=7, filterSourceIndex=TELEPORTER_SOURCE_INDEX_FRIEND}) end,
				},
			}
			
		-- add all guilds
		for guildIndex = 1, GetNumGuilds() do
			local guildId = GetGuildId(guildIndex)
			local entry = {
					label = Teleporter.var.color.colWhite .. GetGuildName(guildId),
					callback = function() Teleporter.createTable({index=7, filterSourceIndex=2+guildIndex}) end,
				}
				table.insert(entries_filter, entry)
		end		
		
		AddCustomSubMenuItem(SI.get(SI.TELE_UI_SUBMENU_FILTER), entries_filter)
		
		ShowMenu()
	end
end


-- save the new favorite zone
function Teleporter.addFavoriteZone(position, zoneId, zoneName)
		Teleporter.savedVarsServ.favoriteListZones[position] = zoneId
		d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_UI_FAVORITE_ZONE) .. " " .. position .. ": " .. zoneName)
		Teleporter.refreshListAuto()
end

-- save the new favorite player
function Teleporter.addFavoritePlayer(position, displayName)
		Teleporter.savedVarsServ.favoriteListPlayers[position] = displayName
		d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_UI_FAVORITE_PLAYER) .. " " .. position .. ": " .. displayName)
		Teleporter.refreshListAuto()
end

-- remove favorite zone
function Teleporter.removeFavoriteZone(zoneId)
	-- go over favorite list and remove
	for index, value in pairs(Teleporter.savedVarsServ.favoriteListZones) do
        if value == zoneId then
			Teleporter.savedVarsServ.favoriteListZones[index] = nil
        end
    end
	Teleporter.refreshListAuto()
end

-- remove favorite player
function Teleporter.removeFavoritePlayer(displayName)
	-- go over favorite list and remove
	for index, value in pairs(Teleporter.savedVarsServ.favoriteListPlayers) do
        if value == displayName then
			Teleporter.savedVarsServ.favoriteListPlayers[index] = nil
        end
    end
	Teleporter.refreshListAuto()
end


function Teleporter.updateStatistic(category, zoneId)
	-- check for block flag and add manual port cost to statisticGold and also increase total counter
	if not Teleporter.blockGold then
		-- regard only Overland zones for gold statistics
		if category == 9 then
			Teleporter.savedVarsAcc.savedGold = Teleporter.savedVarsAcc.savedGold + GetRecallCost()
			self.control.statisticGold:SetText(SI.get(SI.TELE_UI_GOLD) .. " " .. Teleporter.formatGold(Teleporter.savedVarsAcc.savedGold))
		end
		-- increase total port counter
		Teleporter.savedVarsAcc.totalPortCounter = Teleporter.savedVarsAcc.totalPortCounter + 1
		self.control.statisticTotal:SetText(SI.get(SI.TELE_UI_TOTAL_PORTS) .. " " .. Teleporter.formatGold(Teleporter.savedVarsAcc.totalPortCounter))
		-- update port counter per zone statistic
		if Teleporter.savedVarsAcc.portCounterPerZone[zoneId] == nil then
			Teleporter.savedVarsAcc.portCounterPerZone[zoneId] = 1
		else
			Teleporter.savedVarsAcc.portCounterPerZone[zoneId] = Teleporter.savedVarsAcc.portCounterPerZone[zoneId] + 1
		end
		-- update last used zones list
		table.insert(Teleporter.savedVarsAcc.lastPortedZones, 1, zoneId)
		if #Teleporter.savedVarsAcc.lastPortedZones > 20 then
			-- drop oldest element
			table.remove(Teleporter.savedVarsAcc.lastPortedZones)
		end
	end
	
	-- start cooldown
	Teleporter.coolDownGold()
end

-- after click on teleport evrytime a cooldown of 7 seconds starts
-- unlocking after last cooldown finished
function Teleporter.coolDownGold()
	Teleporter.blockGold = true
	mutexCounter = mutexCounter + 1
	
	zo_callLater(function()
		mutexCounter = mutexCounter - 1
		if mutexCounter == 0 then
			Teleporter.blockGold = false
		end
	end, 7200)
end


function Teleporter.formatGold(number)
	if number >= 1000000 then
		return Teleporter.round((number/1000000), 3) .. " " .. SI.get(SI.TELE_UI_GOLD_ABBR2)
	elseif number >= 1000 then
		return Teleporter.round((number/1000), 1) .. " " .. SI.get(SI.TELE_UI_GOLD_ABBR)
	else
		return number
	end
end


function Teleporter.round(num, numDecimalPlaces)
  return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end


-- calculate the height of the main control depending on the number of lines
function Teleporter.calculateListHeight()
	-- 300 => 6 lines, add 46 for each additional line (line_height is only 40)
	return (300 + ((Teleporter.savedVarsAcc.numberLines - 6) * 46))*Teleporter.savedVarsAcc.Scale
end


function Teleporter.createMail(to, subject, body)
	SCENE_MANAGER:Show('mailSend')
	zo_callLater(function()
		ZO_MailSendToField:SetText(to)
		ZO_MailSendSubjectField:SetText(subject)
		ZO_MailSendBodyField:SetText(body)
		--QueueMoneyAttachment(amount)
		ZO_MailSendBodyField:TakeFocus()		
	end, 200)
end


-- sets the dungeon difficulty and updates the button in the group menu (P)
function Teleporter.setDungeonDifficulty(vet)
	SetVeteranDifficulty(vet)
	local control = ZO_GroupListVeteranDifficultySettings
	if control then
		control.veteranModeButton:SetState(vet and BSTATE_PRESSED or BSTATE_NORMAL)
		control.normalModeButton:SetState(vet and BSTATE_NORMAL or BSTATE_PRESSED)
	end
end


-- port to group leader OR to the other group member when group contains only 2 player
function Teleporter.portToGroupLeader()
	local unitTag
	local leaderUnitTag = GetGroupLeaderUnitTag()
	
	if leaderUnitTag == nil or leaderUnitTag == "" then
		-- no group
		d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_NOT_IN_GROUP))
		return
	elseif GetGroupSize() == 2 then
		-- group of two -> port to the other player
		 if GetGroupIndexByUnitTag("player") == 1 then
			unitTag = GetGroupUnitTagByIndex(2)
		else
			unitTag = GetGroupUnitTagByIndex(1)
		end
	elseif IsUnitGroupLeader("player") then
		-- group of more than 2 and the current player is the leader himself
		d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_GROUP_LEADER_YOURSELF))
		return
	else
		-- group of more than 2 -> port to group leader
		unitTag = leaderUnitTag
	end
	
	local displayName = GetUnitDisplayName(unitTag)
	local zoneName = GetUnitZone(unitTag)
	Teleporter.PortalToPlayer(displayName, 1, Teleporter.formatName(zoneName, false), 0, 0, false, false, true)
end


function Teleporter.portToOwnHouse(primary, houseId, jumpOutside, parentZoneName)
	-- houseId is nil when primary == true
	local zoneId = GetHouseZoneId(houseId)
	
	if primary then
		-- port to primary residence
		houseId = GetHousingPrimaryHouse()
		zoneId = GetHouseZoneId(houseId)
		if zoneId == nil or zoneId == 0 then
			d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_PORT_TO_OWN_PRIMARY_HOUSE_FAILED))
			return
		end
		-- get parentZoneName
		if jumpOutside then
			parentZoneName = Teleporter.formatName(GetZoneNameById(Teleporter.getParentZoneId(zoneId)), false)
		end
	end
	
	-- print info to chat
	if jumpOutside then
		d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_PORT_TO_OWN_HOUSE) .. " " .. parentZoneName .. " (" .. Teleporter.formatName(GetZoneNameById(zoneId), false) .. ")")
	else
		d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_PORT_TO_OWN_HOUSE) .. " " .. Teleporter.formatName(GetZoneNameById(zoneId), false))
	end
	
	-- start port process
	RequestJumpToHouse(houseId, jumpOutside)
	
	-- close UI if enabled
	if Teleporter.savedVarsAcc.closeOnPorting then
		-- hide world map if open
		SCENE_MANAGER:Hide("worldMap")
		-- hide UI if open
		Teleporter.HideTeleporter()
	end
end


function Teleporter.portToBMUGuildHouse()
	if Teleporter.var.guildHouse[GetWorldName()] == nil then
		d("[" .. Teleporter.var.appNameAbbr .. "]: There is no BMU guild house on this server.")
		return
	else
		local displayName = Teleporter.var.guildHouse[GetWorldName()][1]
		local houseId = Teleporter.var.guildHouse[GetWorldName()][2]
		JumpToSpecificHouse(displayName, houseId)
		d("[" .. Teleporter.var.appNameAbbr .. "]: Porting to BMU guild house (" .. displayName .. ")")
	end
end


function Teleporter.portToCurrentZone()
	local playersZoneId = GetZoneId(GetUnitZoneIndex("player"))
	Teleporter.sc_porting(playersZoneId)
end


-- identifies the currently tracked/focused quest and start the port
function Teleporter.portToTrackedQuestZone()
	for slotIndex = 1, GetNumJournalQuests() do
		local questName, _, _, _, _, _, tracked = GetJournalQuestInfo(slotIndex)
		if tracked then
			local _, _, questZoneIndex = GetJournalQuestLocationInfo(slotIndex)
			local questZoneId = GetZoneId(questZoneIndex)
			if questZoneId ~= 0 then
				-- get exact quest location
				questZoneId = Teleporter.findExactQuestLocation(slotIndex)
			end
			d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_TO_TRACKED_QUEST) .. " " .. questName)
			Teleporter.sc_porting(questZoneId)
			return
		end
	end
end


-- set flag when an error occurred while starting port process
function Teleporter.socialErrorWhilePorting(eventCode, errorCode)
	if errorCode == nil then errorCode = 0 end
	Teleporter.flagSocialErrorWhilePorting = errorCode
end


-- makes intelligent decision whether to try to port to another player or not
function Teleporter.decideTryAgainPorting(errorCode, zoneId, displayName, sourceIndex, updateSavedGold)
	-- don't try to port again when: other errors (e.g. solo zone); player is group member; player is favorite; search by player name
	if (errorCode ~= SOCIAL_RESULT_NO_LOCATION and errorCode ~= SOCIAL_RESULT_CHARACTER_NOT_FOUND) or sourceIndex == TELEPORTER_SOURCE_INDEX_GROUP or Teleporter.isFavoritePlayer(displayName) or Teleporter.state == 2 then
		return -- do nothing
	else
		-- try to find another player in the zone
		local result = Teleporter.createTable({index=6, fZoneId=zoneId, dontDisplay=true})
		for index, record in pairs(result) do
			if record ~= nil then
				if record.displayName ~= "" and record.displayName ~= displayName then -- player name must be different
					Teleporter.PortalToPlayer(record.displayName, record.sourceIndexLeading, record.zoneName, record.zoneId, record.zoneCategory, updateSavedGold, false, true)
					return
				elseif record.isOwnHouse then
					-- if there is no other player in this zone -> port to own house
					Teleporter.portToOwnHouse(false, record.houseId, true, record.parentZoneName)
					return
				end
			end
		end
	end
end


-- TOOLTIP (show and hide)
function Teleporter:tooltipTextEnter(control, text)
    if text then
        InitializeTooltip(InformationTooltip, control, LEFT, 0, 0, 0)
        InformationTooltip:SetHidden(false)
		-- if text is table of strings -> add for each a separate line
		if type(text) == "table" then
			for i, line in ipairs(text) do
				InformationTooltip:AddLine(line)
			end
		else
			InformationTooltip:AddLine(text)
		end
    else -- hide tooltip
        InformationTooltip:ClearLines()
        InformationTooltip:SetHidden(true)
    end
end


Teleporter.ListView = ListView
