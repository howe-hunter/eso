local SI = Teleporter.SI
local portalPlayers = {}
local TeleportAllPlayersTable = {}
local allZoneIds = {} -- stores the number of hits of a zoneId at index (allzoneIds[zoneId] = 1) | to know which zoneId is already added | to count the number of port options/alternatives

-- removes all duplicates (displayName) and return cleared table
local function removeDuplicates(tbl)
    local playername = {}
    local newTable = {}
    for index, record in ipairs(tbl) do
        if playername[record.displayName] == nil then
            playername[record.displayName] = 1
            table.insert(newTable, record)
        end
    end
    return newTable
end


-- format zone name and removes articles (if enabled)
function Teleporter.formatName(unformatted, flag)

	local formatted = ""

	if unformatted == nil or unformatted == "" then
		return formatted
	end
	
	if not flag then
		-- normal format
		formatted = zo_strformat("<<C:1>>", unformatted)
	else
		-- remove all articles
		
		if Teleporter.lang == "en" then
			if "The " == string.sub(unformatted, 1, 4) then
				-- remove "The " in the beginning
				formatted = string.sub(unformatted, 5)
			else
				-- no "The " to remove
				formatted = unformatted
			end
			
		elseif Teleporter.lang == "de" or Teleporter.lang == "fr" then
			if string.match(unformatted, ".*^") ~= nil then
				-- remove German and French articles
				formatted = string.match(unformatted, ".*^")
				-- and cut last character
				if formatted ~= nil then
					formatted = string.sub(formatted, 1, -2)
				else
					formatted = ""
				end
			else
				-- nothing to format (DE, FR)
				formatted = unformatted
			end
		
		else
			-- unsupported language -> use game format
			--formatted = zo_strformat("<<C:1>>", unformatted)
			formatted = unformatted
		end
	end
	
	return zo_strformat("<<C:1>>", formatted)
end

-- index: choose scenario
--		1: only current zone
--		2: filter by player name
--		3: filter by zone name
--		4: related items
--		5: delves and public dungeons
--		6: Favorite Search | Looking for specific zoneId (without state change)
--		7: filter by sourceIndex
--		8: Looking for specific zoneId (with state change)
--		9: related quests
--		else (0): everything

-- inputString: search string
-- fZoneId: specific zoneId (favorite)
-- dontDisplay: flag if the result should be displayed in table (nil or false) or just return the result (true)
-- filterSourceIndex: specific sourceIndex
-- dontResetSlider: flag if the slider/scroll bar should not be reset (reset to top of the list)
function Teleporter.createTable(args)
	local index = args.index or 0
	local inputString = args.inputString or ""
	local fZoneId = args.fZoneId
	local dontDisplay = args.dontDisplay or false
	local filterSourceIndex = args.filterSourceIndex
	local dontResetSlider = args.dontResetSlider or false
	
	-- simple checks
	if type(index) ~= 'number' or (index == 7 and type(filterSourceIndex) ~= 'number') or (index == 8 and type(fZoneId) ~= 'number') then
		return
	end
	
	local startTime = GetGameTimeMilliseconds() -- get start time
	
	-- clear input fields
	if index ~= 2 and index ~= 3 then
		Teleporter.clearInputFields()
	end

	-- if filtering by name (2 or 3) and inputString is empty -> same as everything (0)
	if (index == 2 or index == 3) and inputString == "" then
		index = 0
	end

	if Teleporter.debugMode == 1 then
		-- debug mode
		-- print status
		d("[" .. Teleporter.var.appNameAbbr .. "]: " .. "Refreshed - state: " .. tostring(index) .. " - String: " .. tostring(inputString))
	end
	
	-- change state for correct persistent MouseOver and for auto refresh
	if not dontDisplay then -- dont change when result should not be displayed in list
		Teleporter.changeState(index)
	end
	
	-- save SourceIndex in global variable
	if index == 7 then
		Teleporter.stateSourceIndex = filterSourceIndex
	end
	
	-- save ZoneId in global variable
	if index == 8 then
		Teleporter.stateZoneId = fZoneId
	end
	
	local currentZoneId = 0
	local zoneIndex = 0
	
	-- zone where the player actual is
	local playersZoneIndex = GetUnitZoneIndex("player")
	local playersZoneId = GetZoneId(playersZoneIndex)
	
	if SCENE_MANAGER:IsShowing("worldMap") then
		if DoesCurrentMapMatchMapForPlayerLocation() then
			-- if shown map is the map/zone of the player, take playersZoneId because it is more reliable (especially in delves, the parent zone is often returned as currentZoneId)
			currentZoneId = playersZoneId
		else
			currentZoneId = GetZoneId(GetCurrentMapZoneIndex()) -- get zone id of current / displayed zone
		end
	else
		-- if world map is not showing, take zone where the player is actual in (background: when you change the zone in the world map and you close, then this zone is still the last showing map)
		currentZoneId = playersZoneId
	end

	local TeleTotalFriends = GetNumFriends() -- number of friends
    local TeleTotalGuilds = GetNumGuilds() -- number of Guilds
    TeleportAllPlayersTable = {} -- clear result table
	--local currentZoneId = GetZoneId(GetCurrentMapZoneIndex()) -- get zone id of current zone
	allZoneIds = {} -- clear zoneId list (see Teleporter.checkOnceOnly)
	local consideredPlayers = {} -- contains at index displayName to track which player was already considered
	
	-- 1. go over all group members
	if IsPlayerInGroup(GetDisplayName()) then
		local groupUnitTag = ""
		for j = 1, GetGroupSize() do
			groupUnitTag = GetGroupUnitTagByIndex(j)
			local e = {}
			-- gathering information (and prefiltering of offline players and other invalid entries)
			if groupUnitTag ~= nil and GetUnitZoneIndex(groupUnitTag) ~= nil then
				e.displayName = GetUnitDisplayName(groupUnitTag)
				e.characterName = GetUnitName(groupUnitTag)
				e.online = IsUnitOnline(groupUnitTag)
				e.zoneName = GetUnitZone(groupUnitTag)
				e.zoneId = GetZoneId(GetUnitZoneIndex(groupUnitTag))
				e.level = GetUnitLevel(groupUnitTag)
				e.championRank = GetUnitChampionPoints(groupUnitTag)
				e.alliance = GetUnitAlliance(groupUnitTag)
				e.isLeader = IsUnitGroupLeader(groupUnitTag)
				e.groupMemberSameInstance = not IsGroupMemberInRemoteRegion(groupUnitTag)	-- IsGroupMemberInSameInstanceAsPlayer(groupUnitTag)
			end
			
			-- first big layer of filtering, second layer is placed in seperate function (mainly offline players)
			-- consider only: other players ; online users ; valid zone names ; valid player names
			if e.displayName ~= GetDisplayName() and e.online and e.zoneName ~= nil and e.zoneName ~= "" and e.zoneId ~= nil and e.zoneId ~= 0 and e.displayName ~= "" then
			
				-- save displayName
				consideredPlayers[e.displayName] = true
				-- add bunch of information to the record
				e = Teleporter.addInfo_1(e, currentZoneId, playersZoneId, TELEPORTER_SOURCE_INDEX_GROUP)
				
				-- second big filter level
				if Teleporter.filterAndDecide(index, e, inputString, currentZoneId, fZoneId, filterSourceIndex) then
					-- add bunch of information to the record
					e = Teleporter.addInfo_2(e)
					-- insert into table
					table.insert(TeleportAllPlayersTable, e)
				end
			end
		end
	end
	
		
	-- 2. go over all friends
    for j = 1, TeleTotalFriends do
		-- gathering information
        local e = {}
        e.displayName, e.Note, e.status, e.secsSinceLogoff = GetFriendInfo(j)
        e.hasCharacter, e.characterName, e.zoneName, e.classType, e.alliance, e.level, e.championRank, e.zoneId = GetFriendCharacterInfo(j)
			
		-- first big layer of filtering, second layer is placed in seperate function
        -- consider only: other players ; online users (state 1,2,3) ; valid zone names ; valid player names
		if e.displayName ~= GetDisplayName() and e.status ~= 4 and e.zoneName ~= nil and e.zoneName ~= "" and e.zoneId ~= nil and e.zoneId ~= 0 and e.displayName ~= "" and not consideredPlayers[e.displayName] then
			
			-- save displayName
			consideredPlayers[e.displayName] = true
			-- do some formating stuff
			e = Teleporter.addInfo_1(e, currentZoneId, playersZoneId, TELEPORTER_SOURCE_INDEX_FRIEND)		
			
			-- second big filter level
			if Teleporter.filterAndDecide(index, e, inputString, currentZoneId, fZoneId, filterSourceIndex) then
				-- add bunch of information to the record
				e = Teleporter.addInfo_2(e)			
				-- insert into table
				table.insert(TeleportAllPlayersTable, e)
			end
		end		
	end
	

	-- 3. go over all Guild members
    for i = 1, TeleTotalGuilds do
        local totalGuildMembers = GetNumGuildMembers(GetGuildId(i))

        for j = 1, totalGuildMembers do
			-- gathering information
            local e = {}
            e.displayName, e.Note, e.GuildMemberRankIndex, e.status, e.secsSinceLogoff = GetGuildMemberInfo(GetGuildId(i), j)
            e.hasCharacter, e.characterName, e.zoneName, e.classType, e.alliance, e.level, e.championRank, e.zoneId = GetGuildMemberCharacterInfo(GetGuildId(i), j)
			e.guildIndex = i

			-- first big layer of filtering, second layer is placed in seperate function
            -- consider only: other players ; online users (state 1,2,3) ; valid zone names ; valid player names
			if e.displayName ~= GetDisplayName() and e.status ~= 4 and e.zoneName ~= nil and e.zoneName ~= "" and e.zoneId ~= nil and e.zoneId ~= 0 and e.displayName ~= "" and not consideredPlayers[e.displayName] then
				-- save displayName
				consideredPlayers[e.displayName] = true
				-- do some formating stuff
				e = Teleporter.addInfo_1(e, currentZoneId, playersZoneId, _G["TELEPORTER_SOURCE_INDEX_GUILD" .. tostring(i)])
				
				-- second big filter level
				if Teleporter.filterAndDecide(index, e, inputString, currentZoneId, fZoneId, filterSourceIndex) then
					-- add bunch of information to the record
					e = Teleporter.addInfo_2(e)
					-- insert into table
					table.insert(TeleportAllPlayersTable, e)	
				end
			end	
		end
	end
	
	if not Teleporter.savedVarsAcc.hideOwnHouses then
		-- 4. go over own houses
		-- player can port outside own houses -> check own houses and add parent zone entries if not already in list
		WORLD_MAP_HOUSES_DATA:RefreshHouseList()
		local houses = WORLD_MAP_HOUSES_DATA:GetHouseList()
		for i = 1, #houses do
			local house = houses[i]
			-- check if owned
			if house.unlocked then
				local houseZoneId = GetHouseZoneId(house.houseId)
				local mapIndex = Teleporter.getMapIndex(houseZoneId)
				local parentZoneId = Teleporter.getParentZoneId(houseZoneId)
				-- check if parent zone not already in result list
				---if not allZoneIds[parentZoneId] then
					local e = {}
					-- add infos
					e.parentZoneId = parentZoneId
					e.parentZoneName = Teleporter.formatName(GetZoneNameById(e.parentZoneId))
					e.zoneId = e.parentZoneId
					e.displayName = ""
					e.houseId = house.houseId
					e.isOwnHouse = true
					-- add flag to port outside the house
					e.forceOutside = true
					e.zoneName = GetZoneNameById(e.zoneId)
					e.houseNameUnformatted = GetZoneNameById(houseZoneId)
					e.houseNameFormatted = Teleporter.formatName(e.houseNameUnformatted)
					e.collectibleId = GetCollectibleIdForHouse(e.houseId)
					e.nickName = Teleporter.formatName(GetCollectibleNickname(e.collectibleId))
					e.houseTooltip = {e.houseNameFormatted, "\"" .. e.nickName .. "\""}
					
					e = Teleporter.addInfo_1(e, currentZoneId, playersZoneId, "")
					if Teleporter.filterAndDecide(index, e, inputString, currentZoneId, fZoneId, filterSourceIndex) then
						e = Teleporter.addInfo_2(e)
						-- overwrite
						e.mapIndex = Teleporter.getMapIndex(houseZoneId)
						e.parentZoneId = Teleporter.getParentZoneId(houseZoneId)
						-- add manually
						--allZoneIds[e.zoneId] = allZoneIds[e.zoneId] + 1
						table.insert(TeleportAllPlayersTable, e)
					end
				---end
			end
		end
	end
	
	portalPlayers = TeleportAllPlayersTable
	
	-- display number of hits (port alternatives)
	if Teleporter.savedVarsAcc.showNumberPlayers then
		portalPlayers = Teleporter.addNumberPlayers(portalPlayers)
	end
	
	if index == 4 then
		-- related items
		portalPlayers = Teleporter.syncWithItems(portalPlayers) -- returns already sorted list
	elseif index == 9 then
		-- related quests
		portalPlayers = Teleporter.syncWithQuests(portalPlayers) -- returns already sorted list
	elseif index == 2 then
		-- search by player name
		-- sort by string match position (displayName and characterName)
		portalPlayers = Teleporter.sortByStringFindPosition(portalPlayers, inputString, "displayName", "characterName")
	elseif index == 3 then
		-- search by zone name
		-- add all matching overland zones even without players
		portalPlayers = Teleporter.addOverlandZoneMatches(portalPlayers, inputString, currentZoneId)
		-- sort by string match position (zoneName, zoneNameSecondLanguage)
		portalPlayers = Teleporter.sortByStringFindPosition(portalPlayers, inputString, "zoneName", "zoneNameSecondLanguage")
	else
		-- SORTING
		if Teleporter.savedVarsChar.sorting == 2 then
			-- sort by prio, category, zoneName, prio by source
			table.sort(portalPlayers, function(a, b)
				-- prio
				if a.prio ~= b.prio then
					return a.prio < b.prio
				end
				-- category
				if Teleporter.sortingByCategory[a.category] ~= Teleporter.sortingByCategory[b.category] then
					return Teleporter.sortingByCategory[a.category] < Teleporter.sortingByCategory[b.category]
				end
				-- zoneName
				if a.zoneName ~= b.zoneName then
					return a.zoneName < b.zoneName
				end
				-- prio by source
				return Teleporter.decidePrioDisplay(a, b)
			end)
			
		elseif Teleporter.savedVarsChar.sorting == 3 then
			-- sort by prio, most used, zoneName, prio by source
			table.sort(portalPlayers, function(a, b)
				-- prio
				if a.prio ~= b.prio then
					return a.prio < b.prio
				end
				-- most used
				local num1 = Teleporter.savedVarsAcc.portCounterPerZone[a.zoneId] or 0
				local num2 = Teleporter.savedVarsAcc.portCounterPerZone[b.zoneId] or 0
				if num1 ~= num2 then
					return num1 > num2
				end
				-- zoneName
				if a.zoneName ~= b.zoneName then
					return a.zoneName < b.zoneName
				end
				-- prio by source
				return Teleporter.decidePrioDisplay(a, b)
			end)
			
		elseif Teleporter.savedVarsChar.sorting == 4 then
			-- sort by prio, most used, category, zoneName, prio by source
			table.sort(portalPlayers, function(a, b)
				-- prio
				if a.prio ~= b.prio then
					return a.prio < b.prio
				end
				-- most used
				local num1 = Teleporter.savedVarsAcc.portCounterPerZone[a.zoneId] or 0
				local num2 = Teleporter.savedVarsAcc.portCounterPerZone[b.zoneId] or 0
				if num1 ~= num2 then
					return num1 > num2
				end
				-- category
				if Teleporter.sortingByCategory[a.category] ~= Teleporter.sortingByCategory[b.category] then
					return Teleporter.sortingByCategory[a.category] < Teleporter.sortingByCategory[b.category]
				end
				-- zoneName
				if a.zoneName ~= b.zoneName then
					return a.zoneName < b.zoneName
				end
				-- prio by source
				return Teleporter.decidePrioDisplay(a, b)
			end)
		
		elseif Teleporter.savedVarsChar.sorting == 5 then
			-- sort by prio, number players, zoneName, prio by source
			table.sort(portalPlayers, function(a, b)
				-- prio
				if a.prio ~= b.prio then
					return a.prio < b.prio
				end
				-- number players
				if a.numberPlayers ~= b.numberPlayers then
					return a.numberPlayers > b.numberPlayers
				end
				-- zoneName
				if a.zoneName ~= b.zoneName then
					return a.zoneName < b.zoneName
				end
				-- prio by source
				return Teleporter.decidePrioDisplay(a, b)
			end)
			
		elseif Teleporter.savedVarsChar.sorting == 6 then
			-- sort by prio, number of undiscovered wayshrines, zone category, zoneName, prio by source
			table.sort(portalPlayers, function(a, b)
				-- prio
				if a.prio ~= b.prio then
					return a.prio < b.prio
				end
				-- number of undiscovered wayshrines
				if not (a.zoneWayshrineTotal == nil and b.zoneWayshrineTotal == nil) then
					if a.zoneWayshrineTotal ~= nil and b.zoneWayshrineTotal == nil then
						return true
					elseif a.zoneWayshrineTotal == nil and b.zoneWayshrineTotal ~= nil then
						return false
					elseif (a.zoneWayshrineTotal - a.zoneWayshrineDiscovered) ~= (b.zoneWayshrineTotal - b.zoneWayshrineDiscovered) then
						return (a.zoneWayshrineTotal - a.zoneWayshrineDiscovered) > (b.zoneWayshrineTotal - b.zoneWayshrineDiscovered)
					end
				end
				-- category
				if Teleporter.sortingByCategory[a.category] ~= Teleporter.sortingByCategory[b.category] then
					return Teleporter.sortingByCategory[a.category] < Teleporter.sortingByCategory[b.category]
				end
				-- zoneName
				if a.zoneName ~= b.zoneName then
					return a.zoneName < b.zoneName
				end
				-- prio by source
				return Teleporter.decidePrioDisplay(a, b)
			end)
		
		elseif Teleporter.savedVarsChar.sorting == 7 then
			-- sort by prio, number of undiscovered skyshards, zone category, zoneName, prio by source
			table.sort(portalPlayers, function(a, b)
				-- prio
				if a.prio ~= b.prio then
					return a.prio < b.prio
				end
				-- number of undiscovered skyshards
				if not (a.zoneSkyshardTotal == nil and b.zoneSkyshardTotal == nil) then
					if a.zoneSkyshardTotal ~= nil and b.zoneSkyshardTotal == nil then
						return true
					elseif a.zoneSkyshardTotal == nil and b.zoneSkyshardTotal ~= nil then
						return false
					elseif (a.zoneSkyshardTotal - a.zoneSkyshardDiscovered) ~= (b.zoneSkyshardTotal - b.zoneSkyshardDiscovered) then
						return (a.zoneSkyshardTotal - a.zoneSkyshardDiscovered) > (b.zoneSkyshardTotal - b.zoneSkyshardDiscovered)
					end
					-- category
					if Teleporter.sortingByCategory[a.category] ~= Teleporter.sortingByCategory[b.category] then
						return Teleporter.sortingByCategory[a.category] < Teleporter.sortingByCategory[b.category]
					end
				end
				-- zoneName
				if a.zoneName ~= b.zoneName then
					return a.zoneName < b.zoneName
				end
				-- prio by source
				return Teleporter.decidePrioDisplay(a, b)
			end)
			
		elseif Teleporter.savedVarsChar.sorting == 8 then
			-- sort by prio, last used, zoneName, prio by source
			table.sort(portalPlayers, function(a, b)
				-- prio
				if a.prio ~= b.prio then
					return a.prio < b.prio
				end
				-- last used
				local pos1 = Teleporter.has_value(Teleporter.savedVarsAcc.lastPortedZones, a.zoneId) or 99
				local pos2 = Teleporter.has_value(Teleporter.savedVarsAcc.lastPortedZones, b.zoneId) or 99
				if pos1 ~= pos2 then
					return pos1 < pos2
				end
				-- zoneName
				if a.zoneName ~= b.zoneName then
					return a.zoneName < b.zoneName
				end
				-- prio by source
				return Teleporter.decidePrioDisplay(a, b)
			end)
			
		elseif Teleporter.savedVarsChar.sorting == 9 then
			-- sort by prio, last used, category, zoneName, prio by source
			table.sort(portalPlayers, function(a, b)
				-- prio
				if a.prio ~= b.prio then
					return a.prio < b.prio
				end
				-- last used
				local pos1 = Teleporter.has_value(Teleporter.savedVarsAcc.lastPortedZones, a.zoneId) or 99
				local pos2 = Teleporter.has_value(Teleporter.savedVarsAcc.lastPortedZones, b.zoneId) or 99
				if pos1 ~= pos2 then
					return pos1 < pos2
				end
				-- category
				if Teleporter.sortingByCategory[a.category] ~= Teleporter.sortingByCategory[b.category] then
					return Teleporter.sortingByCategory[a.category] < Teleporter.sortingByCategory[b.category]
				end
				-- zoneName
				if a.zoneName ~= b.zoneName then
					return a.zoneName < b.zoneName
				end
				-- prio by source
				return Teleporter.decidePrioDisplay(a, b)
			end)
			
		else -- Teleporter.savedVarsChar.sorting == 1
			-- sort by prio, zoneName, prio by source
			table.sort(portalPlayers, function(a, b)
				-- prio
				if a.prio ~= b.prio then
					return a.prio < b.prio
				end
				-- zoneName
				if a.zoneName ~= b.zoneName then
					return a.zoneName < b.zoneName
				end
				-- prio by source
				return Teleporter.decidePrioDisplay(a, b)
			end)
		end
	end
	
	-- in case of no results, add message with information
	if #portalPlayers == 0 then
		table.insert(portalPlayers, Teleporter.createNoResultsInfo())
	end
	
	if Teleporter.debugMode == 1 then
		-- get end time and print runtime in milliseconds
		d("[" .. Teleporter.var.appNameAbbr .. "]: " .. "RunTime: " .. (GetGameTimeMilliseconds() - startTime) .. " ms")
	end
	
	-- display or return result
	if dontDisplay == true then
		return portalPlayers
	else
		TeleporterList:add_messages(portalPlayers, dontResetSlider)
	end
end


function Teleporter.getIndexFromValue(myTable, v)
	for index, value in ipairs(myTable) do
		--d("V: " .. value .. " ** v: " .. v)
		if value == v then
			return index
		end
	end
	return 99 -- special case, just return high value (low priority for houses), SORRY
end


-- adds first bunch of information which are necessary for filterAndDecide
function Teleporter.addInfo_1(e, currentZoneId, playersZoneId, sourceIndexLeading)
	e.zoneNameUnformatted = e.zoneName
	-- format zone name
	e.zoneName = Teleporter.formatName(e.zoneName, Teleporter.savedVarsAcc.formatZoneName)
	
	-- check if zone == current displayed zone
	if currentZoneId == e.zoneId then
		e.currentZone = true
	else
		e.currentZone = false
	end
	
	-- exepction handling for combined Overview-Map (Fargrave + The Shambles)
	-- both zones are current zone
	if GetCurrentMapZoneIndex() == 854 then
		local _, subzone = select(3,(GetMapTileTexture()):lower():find("maps/([%w%-]+)/([%w%-]+_[%w%-]+)"))
		if subzone == "u32_fargravezone" and (e.zoneId == 1282 or e.zoneId == 1283) then
			e.currentZone = true
		end
	end
	
	-- check if zone == players zone
	if playersZoneId == e.zoneId then
		e.playersZone = true
	else
		e.playersZone = false
	end
	
	-- add second zone name
	e.zoneNameSecondLanguage = Teleporter.getZoneNameSecondLanguage(e.zoneId)
	
	if e.displayName ~= "" and e.displayName ~= nil then
		-- format character name
		e.characterName = e.characterName:gsub("%^.*x$", "")
		
		-- gather sources, sourcesText and set sourceIndexLeading (see globals Teleporter.SOURCE_INDEX)
		e.sourcesText = {} -- contains strings ("Guild", "Friend", ...)
		e.sources = {} -- contains all source indicies while sourceIndexLeading is the leading (first one)
		e.sourceIndexLeading = sourceIndexLeading -- first source where the player was found
		
		-- is in Group?
		if sourceIndexLeading == TELEPORTER_SOURCE_INDEX_GROUP then
			table.insert(e.sources, TELEPORTER_SOURCE_INDEX_GROUP)
			table.insert(e.sourcesText, Teleporter.var.color.colOrange .. SI.get(SI.TELE_UI_SOURCE_GROUP))
		end
		
		-- is Friend?
		if sourceIndexLeading == TELEPORTER_SOURCE_INDEX_FRIEND or IsFriend(e.displayName) then
			table.insert(e.sources, TELEPORTER_SOURCE_INDEX_FRIEND)
			table.insert(e.sourcesText, Teleporter.var.color.colGreen .. SI.get(SI.TELE_UI_SOURCE_FRIEND))
		end
		
		-- is in Guild?
		local numGuilds = GetNumGuilds()
		for i = 1, numGuilds do
			local guildId = GetGuildId(i)
			if GetGuildMemberIndexFromDisplayName(guildId, e.displayName) ~= nil then
				table.insert(e.sources, _G["TELEPORTER_SOURCE_INDEX_GUILD" .. tostring(i)])
				table.insert(e.sourcesText, Teleporter.var.color.colWhite .. GetGuildName(guildId))
			end
		end
	end
	
	return e
end


-- adds second bunch of information after filterAndDecide
function Teleporter.addInfo_2(e)
	-- inititialize more values
	e.relatedItems = {}
	e.relatedQuests = {}
	e.countRelatedItems = 0
	e.relatedQuestsSlotIndex = {}
	e.countRelatedQuests = 0
	
	-- valid entry / show zone on click
	e.zoneNameClickable = true
	
	-- format alliance name
	if e.alliance ~= nil then
		e.allianceName = Teleporter.formatName(GetAllianceName(e.alliance), false)
	end
	
	-- add wayshrine discovery info (for zone tooltip)
	e.zoneWayhsrineDiscoveryInfo, e.zoneWayshrineDiscovered, e.zoneWayshrineTotal = Teleporter.getZoneGuideDiscoveryInfo(e.zoneId, ZONE_COMPLETION_TYPE_WAYSHRINES)
	-- add skyshard discovery info (for zone tooltip)
	e.zoneSkyshardDiscoveryInfo, e.zoneSkyshardDiscovered, e.zoneSkyshardTotal = Teleporter.getZoneGuideDiscoveryInfo(e.zoneId, ZONE_COMPLETION_TYPE_SKYSHARDS)
	
	-- categorize zone
	e.category = Teleporter.categorizeZone(e.zoneId)
	-- get parent map index and zoneId (for map opening)
	e.mapIndex = Teleporter.getMapIndex(e.zoneId)
	e.parentZoneId = Teleporter.getParentZoneId(e.zoneId)
	
	-- set colors
	if e.sourceIndexLeading == TELEPORTER_SOURCE_INDEX_GROUP then
		e.textColorDisplayName = Teleporter.var.color.colOrange
		e.textColorZoneName = Teleporter.var.color.colOrange
	elseif e.playersZone then
		e.textColorDisplayName = Teleporter.var.color.colArcane
		e.textColorZoneName = Teleporter.var.color.colArcane
	elseif e.sourceIndexLeading == TELEPORTER_SOURCE_INDEX_FRIEND then
		e.textColorDisplayName = Teleporter.var.color.colGreen
		e.textColorZoneName = Teleporter.var.color.colGreen
	else
		e.textColorDisplayName = Teleporter.var.color.colWhite
		e.textColorZoneName = Teleporter.var.color.colWhite
	end	
		
	--set prio
	if Teleporter.savedVarsAcc.currentZoneAlwaysTop and e.playersZone then
		e.prio = 0
	elseif e.sourceIndexLeading == TELEPORTER_SOURCE_INDEX_GROUP and e.isLeader then
		e.prio = 1
	elseif e.sourceIndexLeading == TELEPORTER_SOURCE_INDEX_GROUP and (e.category == 4 or e.category == 5 or e.category == 6) then -- group member is in 4 men Group Dungeons | 12 men Raids (Trials) | Group Zones
		e.prio = 2
	elseif Teleporter.isFavoritePlayer(e.displayName) and Teleporter.isFavoriteZone(e.zoneId) then
		e.prio = 3
		e.textColorDisplayName = Teleporter.var.color.colLegendary
		e.textColorZoneName = Teleporter.var.color.colLegendary
	elseif Teleporter.isFavoritePlayer(e.displayName) then
		e.prio = 4
		e.textColorDisplayName = Teleporter.var.color.colLegendary
	elseif Teleporter.isFavoriteZone(e.zoneId) then
		e.prio = 5
		e.textColorZoneName = Teleporter.var.color.colLegendary
	else
		e.prio = 6
	end
	
	return e
end


-- add alternative zone name (second language) if feature active (see translation array)
function Teleporter.getZoneNameSecondLanguage(zoneId)
	-- check if enabled
	if Teleporter.savedVarsAcc.secondLanguage ~= 1 then
		local language = Teleporter.dropdownSecLangChoices[Teleporter.savedVarsAcc.secondLanguage]
		local localizedZoneIdData = Teleporter.LibZoneGivenZoneData[language]
		if localizedZoneIdData == nil then return nil end
		local localizedZoneName = localizedZoneIdData[zoneId]
		if localizedZoneName == nil or type(localizedZoneName) ~= "string" then return nil end
	
		return localizedZoneName
	else
		return nil
	end
end


-- try to find map index by game or by own exceptions
function Teleporter.getMapIndex(zoneId)
	-- get map index by API (overland zones which are listed in the map list)
	local mapIndex = GetMapIndexByZoneId(zoneId)
	-- catch "The Brass Fortress" exception
	if zoneId == 981 then
		-- take mapIndex of "The Clockwork City"
		mapIndex = GetMapIndexByZoneId(980)
	-- catch "Faregrave (City)" exception
	elseif zoneId == 1282 then
		-- take mapIndex of "The Shambles"
		mapIndex = GetMapIndexByZoneId(1283)
	end
	
	-- if zone is not a overland zone
	if mapIndex == nil then
		mapIndex = GetMapIndexByZoneId(Teleporter.getParentZoneId(zoneId))
	end
	
	return mapIndex -- mapIndex can be nil
end


function Teleporter.filterAndDecide(index, e, inputString, currentZoneId, fZoneId, filterSourceIndex)
	-- do filtering and decide
	
	-- try to fix "-" issue
	if inputString ~= nil then
		inputString = string.gsub(inputString, "-", "--")
	end
	
	-- index == 1 -> only own zone
	if index == 1 then
		-- only add users in the current (displayed) zone
		-- OR if displayed zone is not overland and zone is parent of current zone
		if e.currentZone or (Teleporter.categorizeZone(currentZoneId) ~= 9 and e.zoneId == Teleporter.getParentZoneId(currentZoneId) and Teleporter.checkOnceOnly(true, e)) then
			return true
		end
		
	-- index == 2 -> filter by player name
	elseif index == 2 then
		if (string.match(string.lower(e.displayName), string.lower(inputString)) or (Teleporter.savedVarsAcc.searchCharacterNames and string.match(string.lower(e.characterName), string.lower(inputString)))) then -- and not Teleporter.isBlacklisted(e.zoneId, e.sourceIndexLeading, Teleporter.savedVarsAcc.onlyMaps) and Teleporter.checkOnceOnly(Teleporter.savedVarsAcc.zoneOnceOnly, e)
			return true
		end
		
	-- index == 3 -> filter by zone name
	elseif index == 3 then
		if (string.match(string.lower(e.zoneName), string.lower(inputString)) or (Teleporter.savedVarsAcc.secondLanguage ~= 1 and string.match(string.lower(e.zoneNameSecondLanguage), string.lower(inputString)))) and not Teleporter.isBlacklisted(e.zoneId, e.sourceIndexLeading, Teleporter.savedVarsAcc.onlyMaps) and Teleporter.checkOnceOnly(Teleporter.savedVarsAcc.zoneOnceOnly, e) then
			return true
		end
		
	-- index == 4 -> search for related items
	elseif index == 4 then
		if not Teleporter.isBlacklisted(e.zoneId, e.sourceIndexLeading, Teleporter.savedVarsAcc.onlyMaps) and Teleporter.checkOnceOnly(true, e) then
			return true
		end
		
	-- index == 5 -> only Delves and open Dungeons (in your own Zone or globally)
	elseif index == 5 then
		if Teleporter.savedVarsChar.showAllDelves then
			-- add all delves and public dungeons
			-- zone is delve or public dungeon + not blacklisted + add only once to list
			local zoneCategory = Teleporter.categorizeZone(e.zoneId)
			if (zoneCategory == 1 or zoneCategory == 2) and not Teleporter.isBlacklisted(e.zoneId, e.sourceIndexLeading, false) and Teleporter.checkOnceOnly(Teleporter.savedVarsAcc.zoneOnceOnly, e) then
				return true
			end
		else
			-- add delves and public dungeons only from current zone
			-- always use parent zone which is the same, when player is in e.g. overland zone
			-- check if parent zone has delves or public dungeons + zone is in the delves list of the parent zone OR zone is in the public dungeon list of the parent zone + not blacklisted + add only once to list
			if Teleporter.overlandDelvesPublicDungeons[Teleporter.getParentZoneId(currentZoneId)] and (Teleporter.isWhitelisted(Teleporter.overlandDelvesPublicDungeons[Teleporter.getParentZoneId(currentZoneId)].delves, e.zoneId, false) or Teleporter.isWhitelisted(Teleporter.overlandDelvesPublicDungeons[Teleporter.getParentZoneId(currentZoneId)].publicDungeons, e.zoneId, false)) and not Teleporter.isBlacklisted(e.zoneId, e.sourceIndexLeading, false) and Teleporter.checkOnceOnly(Teleporter.savedVarsAcc.zoneOnceOnly, e) then
				return true
			end
		end
		
	-- index == 6 -> looking for specific zone id (favorites, no state change)
	-- index == 8 -> looking for specific zone id (displaying, state change)
	elseif index == 6 or index == 8 then
		-- only one entry is needed for favorite search, but this function is also used to get ALL players for a specific zone
		if e.zoneId == fZoneId then -- and Teleporter.checkOnceOnly(true, e)
			return true
		end
	
	-- index == 7 -> looking for specific sourceIndex
	elseif index == 7 then
		-- add only player with given sourceIndex
		if Teleporter.has_value(e.sources, filterSourceIndex) then
			return true
		end
		
	-- add all / no filters (index == 0)
	else
		if (not Teleporter.isBlacklisted(e.zoneId, e.sourceIndexLeading, Teleporter.savedVarsAcc.onlyMaps) or Teleporter.isFavoritePlayer(e.displayName)) and Teleporter.checkOnceOnly(Teleporter.savedVarsAcc.zoneOnceOnly, e) then
			return true
		end
	end
	
	return false
end


-- check against blacklist
function Teleporter.isBlacklisted(zoneId, sourceIndex, onlyMaps)

	-- use hard filter (like whitelist) if active
	if onlyMaps then
		-- only check the indecies!
		if Teleporter.isWhitelisted(Teleporter.overlandDelvesPublicDungeons, zoneId, true) then
			return false
		else
			-- seperate filtering, if group member (whitelisting)
			if sourceIndex == TELEPORTER_SOURCE_INDEX_GROUP then
				--return true
				return not Teleporter.isWhitelisted(Teleporter.whitelistGroupMembers, zoneId, false)
			end
			return true
		end
	end


	-- use filtering by game if filter is active (in addition)
	if Teleporter.savedVarsAcc.hideOthers then
		if not CanJumpToPlayerInZone(zoneId) then
			return true
		end
	end

	if Teleporter.blacklist[zoneId] then
		-- separate filtering, if group member (whitelisting)
		if sourceIndex == TELEPORTER_SOURCE_INDEX_GROUP then
			--return true
			return not Teleporter.isWhitelisted(Teleporter.whitelistGroupMembers, zoneId, false)
		end
		return true
	else
		return false
	end
	
end


-- check against whitelist
function Teleporter.isWhitelisted(whitelist, zoneId, flag)
	if whitelist == nil then
		-- no whitelist for this zone
		return false
	end
	
	if not flag then
		-- normal search in a list (search for value)
		if Teleporter.has_value(whitelist, zoneId) then
			return true
		else
			return false
		end
	else
		-- special search (search for index)
		if Teleporter.has_value_special(whitelist, zoneId) then
			return true
		else
			return false
		end
	end
end


-- search for a value
function Teleporter.has_value(tab, val)
	if type(tab) == "table" then
		for index, value in pairs(tab) do
			if value == val then
				return index
			end
		end
	end
    return false
end


-- search for a index
function Teleporter.has_value_special(tab, val)
	if type(tab) == "table" then
		for index, value in pairs(tab) do
			if index == val then
				return true
			end
		end
	end
    return false
end


-- check if once only is activated and decide
function Teleporter.checkOnceOnly(activ, record)
	if activ then
		if not allZoneIds[record.zoneId] then
			-- zone is not added yet
			-- initialize counter
			allZoneIds[record.zoneId] = 1
			return true
		elseif Teleporter.isFavoritePlayer(record.displayName) then
			-- zone already added, but player is favorite
			-- clean existing entry (when existing one is not favorite and not group member)
			Teleporter.removeExistingEntry(record.zoneId)
			-- increment counter
			allZoneIds[record.zoneId] = allZoneIds[record.zoneId] + 1
			return true
		elseif Teleporter.decidePrioDisplay(record, Teleporter.getExistingEntry(record.zoneId)) then -- returns true, if first record is preferred
			-- zone already added, but prio is higher
			-- clean existing entry (when existing one is not favorite and not group member)
			Teleporter.removeExistingEntry(record.zoneId)
			-- increment counter
			allZoneIds[record.zoneId] = allZoneIds[record.zoneId] + 1
			return true
		else
			-- zone already added
			-- increment counter
			allZoneIds[record.zoneId] = allZoneIds[record.zoneId] + 1
			return false
		end
	else
		return true
	end
end


-- categorize zone and set category index
function Teleporter.categorizeZone(zoneId)
	-- just check against hashmap category list
	local value = Teleporter.CategoryMap[zoneId]
	
	if value ~= nil then
		return value		-- category index
	else
		return 0			-- category index (no category)
	end
end


-- connect survey and treasure maps from bags to port options and zones
function Teleporter.syncWithItems(portalPlayers)
	local newTable ={}
	local unrelatedItemsRecords = {}
	local zonelessRecord = nil
	
	local bags = {BAG_BACKPACK}
	if Teleporter.savedVarsChar.scanBankForMaps then
		table.insert(bags, BAG_BANK)
		table.insert(bags, BAG_SUBSCRIBER_BANK)
	end
	
	
	-- go over all bags
	for index, bagId in ipairs(bags) do
		
		--local bagCache = SHARED_INVENTORY:GetOrCreateBagCache(bagId)
		--local bagCache = SHARED_INVENTORY:GenerateFullSlotData(nil, bagId)
		
		local lastSlot = GetBagSize(bagId)
		-- go over all items
		--for slotIndex, data in ipairs(bagCache) do
		for slotIndex = 0, lastSlot, 1 do
			local itemName = GetItemName(bagId, slotIndex)
			local itemType, specializedItemType = GetItemType(bagId, slotIndex)
			local itemId = GetItemId(bagId, slotIndex)

			-- check if item relevant (any survey or treasure map)
			--if specializedItemType == SPECIALIZED_ITEMTYPE_TROPHY_TREASURE_MAP or specializedItemType == SPECIALIZED_ITEMTYPE_TROPHY_SURVEY_REPORT or string.match(string.lower(itemName), string.lower(SI.get(SI.CONSTANT_TREASURE_MAP))) or string.match(string.lower(itemName), string.lower(SI.get(SI.CONSTANT_SURVEY_MAP))) then -- 100 => Treasure Maps, 101 = Survey Report & additional looking for names as backup
			if (Teleporter.savedVarsChar.displaySurveyMaps and (specializedItemType == SPECIALIZED_ITEMTYPE_TROPHY_SURVEY_REPORT or string.match(string.lower(itemName), string.lower(SI.get(SI.CONSTANT_SURVEY_MAP))))) or (Teleporter.savedVarsChar.displayTreasureMaps and (specializedItemType == SPECIALIZED_ITEMTYPE_TROPHY_TREASURE_MAP or string.match(string.lower(itemName), string.lower(SI.get(SI.CONSTANT_TREASURE_MAP))))) then
			-- create item data
				-- check if item is related to an entry in portalPlayers table (player can port to this location) and get updated record in portalPlayers table
				local isRelated, updatedRecord, recordIndex = Teleporter.itemIsRelated(portalPlayers, bagId, slotIndex)
				if isRelated then
					-- item is related and connected to an entry in portalPlayers table
					-- update record in portalPlayers
					portalPlayers[recordIndex] = updatedRecord
				else
				-- item cannot be assigned to an entry in portalPlayers table
					--local zoneId = Teleporter.findCorrespondingOverlandZone(Teleporter.formatName(GetItemName(bagId, slotIndex), false), Teleporter.lang)
					local zoneId = Teleporter.findCorrespondingOverlandZone(itemId, Teleporter.lang)
					if zoneId then
						-- item could be matched with a zone
						-- check if a record for the zone already exists
						local record = unrelatedItemsRecords[zoneId]
						if not record then
							-- create new record
							record = Teleporter.createClickableZoneRecord(zoneId)
						end
						-- add item to the record
						record = Teleporter.addItemInformation(record, bagId, slotIndex)
						-- save record
						unrelatedItemsRecords[zoneId] = record
					else
						-- item could not be matched to any zone
						-- check if zoneless info record already exists
						if not zonelessRecord then
							-- create new zoneless info record
							zonelessRecord = Teleporter.createZoneLessItemsInfo()
						end
							-- add item data to record
							zonelessRecord = Teleporter.addItemInformation(zonelessRecord, bagId, slotIndex)
					end
				end
			end
		end
	end
	
	if Teleporter.savedVarsChar.displayLeads then
		-- seperately: go over all leads and add them to "portalPlayers" and "unrelatedItemsRecords"
		local antiquityId = GetNextAntiquityId()
		while antiquityId do
			if DoesAntiquityHaveLead(antiquityId) then
				-- check if lead can be matched to an entry in portalPlayers table
				local isRelated, updatedRecord, recordIndex = Teleporter.leadIsRelated(portalPlayers, antiquityId)
				if isRelated then
					-- lead is related and connected to an entry in portalPlayers table
					-- update record in portalPlayers
					portalPlayers[recordIndex] = updatedRecord
				else
					local zoneId = GetAntiquityZoneId(antiquityId)
					-- lead cannot be assigned to an entry in portalPlayers table
					-- check if a record for the zone already exists
					local record = unrelatedItemsRecords[zoneId]
					if not record then
						-- create new record
						record = Teleporter.createClickableZoneRecord(zoneId)
					end
					-- add lead to the record
					record = Teleporter.addLeadInformation(record, antiquityId)
					-- save record
					unrelatedItemsRecords[zoneId] = record
				end
			end
			antiquityId = GetNextAntiquityId(antiquityId)
		end
	end
	
	
	-- clean portalPlayers table from entries without assigned items
	newTable = Teleporter.cleanUnrelatedRecords(portalPlayers)
	
	-- sort table by number of items and by name
	table.sort(newTable, function(a, b)
			if a.countRelatedItems ~= b.countRelatedItems then
				return a.countRelatedItems > b.countRelatedItems
			end
			return a.zoneName < b.zoneName
		end)
	
	-- sort records with unrelated items (maps without port possibility)
	table.sort(unrelatedItemsRecords, function(a, b)
			if a.countRelatedItems ~= b.countRelatedItems then
				return a.countRelatedItems > b.countRelatedItems
			end
			return a.zoneName < b.zoneName
		end)
		
	-- add them to the final table
	for zoneId, record in pairs(unrelatedItemsRecords) do
		table.insert(newTable, record)
	end
	
	-- add info with zoneless items
	if zonelessRecord then
		table.insert(newTable, zonelessRecord)
	end
	
	return newTable
end


-- check if a item is related to a zone in given table
function Teleporter.itemIsRelated(portalPlayers, bagId, slotIndex)
	local itemName = GetItemName(bagId, slotIndex)
	local itemId = GetItemId(bagId, slotIndex)

	-- go over all records in portalPlayers
	for index, record in ipairs(portalPlayers) do
		-- only check overland maps & Cyrodiil
		if record.category == 9 or record.zoneId == 181 then
			-- try to match with zone
			--if Teleporter.tryMatchZoneToMatchStr(itemName, record.zoneId) then
			if Teleporter.tryMatchZoneWithItem(record.zoneId, itemId) then
				return true, Teleporter.addItemInformation(record, bagId, slotIndex), index
			end
		end
	end
	
	return false, nil, nil
end


-- check if a lead is related to a zone in given table
function Teleporter.leadIsRelated(portalPlayers, antiquityId)
	-- go over all records in portalPlayers
	for index, record in ipairs(portalPlayers) do
		-- only check overland maps
		if record.category == 9 then
			-- try to match lead with zone
			if GetAntiquityZoneId(antiquityId) == record.zoneId then
				return true, Teleporter.addLeadInformation(record, antiquityId), index
			end
		end
	end
	
	return false, nil, nil
end


-- add item information to an existing record
function Teleporter.addItemInformation(record, bagId, slotIndex)
	--local itemCount = GetItemTotalCount(bagId, slotIndex)
	local icon, itemCount, sellPrice, meetsUsageRequirement, locked, equipType, itemStyle, quality = GetItemInfo(bagId, slotIndex)
	local isInInventory = true
	local color = GetItemQualityColor(quality)
	local itemName = color:Colorize(Teleporter.formatName(GetItemName(bagId, slotIndex), false))
	local itemTooltip = itemName
	
	if itemCount > 1 then
		-- change item name (add itemCount of this item)
		itemTooltip = itemTooltip .. Teleporter.var.color.colWhite .. " (" .. itemCount .. ")"
	end
	
	if bagId ~= BAG_BACKPACK then
		-- coloring if item is not in inventory
		itemTooltip = Teleporter.var.color.colTrash .. SI.get(SI.TELE_UI_BANK) .. " " .. itemTooltip
		isInInventory = false
		if #record.relatedItems == 0 then
			record.textColorZoneName = Teleporter.var.color.colTrash
		end
	end
	
	--create and add new item to record
	local itemData = {}
	itemData.itemName = itemName
	itemData.itemTooltip = itemTooltip -- just to have the possibility of showing something different in the tooltip
	itemData.itemCount = itemCount
	itemData.bagId = bagId
	itemData.slotIndex = slotIndex
	itemData.isInInventory = isInInventory
	
	table.insert(record.relatedItems, itemData)
	
	record.countRelatedItems = record.countRelatedItems + itemCount
	
	return record
end


-- add lead information to an existing record
function Teleporter.addLeadInformation(record, antiquityId)
	local quality = GetAntiquityQuality(antiquityId)
	local color = GetAntiquityQualityColor(quality)
	
	local leadtimeleft = GetAntiquityLeadTimeRemainingSeconds(antiquityId)
	if leadtimeleft == 0 then
		-- some timers go back to 0 -> just display ususal timer 33 days
		leadtimeleft = 2851200
	end
	
	local numEntries = GetNumAntiquityLoreEntries(antiquityId)
	local numEntriesAcquired = GetNumAntiquityLoreEntriesAcquired(antiquityId)
	
	local aName = color:Colorize(ZO_CachedStrFormat("<<C:1>>",GetAntiquityName(antiquityId)))
	local aTooltip = color:Colorize(ZO_CachedStrFormat("<<C:1>>",GetAntiquityName(antiquityId))) .. "\n" ..
					Teleporter.var.color.colTrash .. string.format(SI.get(SI.TELE_UI_DAYS_LEFT), math.floor(leadtimeleft/86400)) .. "\n" ..
					zo_strformat(SI_ANTIQUITY_CODEX_ENTRIES_FOUND, numEntriesAcquired, numEntries)
	
	--create and add new item to record
	local leadData = {}
	leadData.itemName = aName
	leadData.itemTooltip = aTooltip
	leadData.itemCount = 1
	leadData.bagId = -1
	leadData.slotIndex = 0
	leadData.isInInventory = true
	leadData.antiquityId = antiquityId
	leadData.numEntries = numEntries
	leadData.numEntriesAcquired = numEntriesAcquired
	
	table.insert(record.relatedItems, leadData)
	record.countRelatedItems = record.countRelatedItems + 1
	return record
end


-- remove all records which have no related items
function Teleporter.cleanUnrelatedRecords(portalPlayers)
	local newTable = {}
	
	-- go over all records in portalPlayers
	for index, record in ipairs(portalPlayers) do
		if #record.relatedItems > 0 then
			table.insert(newTable, record)
		end
	end
	
	return newTable
end


-- create record for a concret (clickable) zone
-- e.g. for items which are connected to a zone but without port possibilities
-- e.g. overland zones that matches to a search string but without port possibilities
function Teleporter.createClickableZoneRecord(zoneId)
	-- create a new record
	local record = Teleporter.createBlankRecord()
	record.zoneId = zoneId
	record.zoneName = Teleporter.formatName(GetZoneNameById(zoneId), Teleporter.savedVarsAcc.formatZoneName)
	record.mapIndex = Teleporter.getMapIndex(zoneId)
	record.textColorDisplayName = Teleporter.var.color.colDarkRed
	record.textColorZoneName = Teleporter.var.color.colDarkRed
	record.zoneNameClickable = true -- show zone on click
	record.zoneNameSecondLanguage = Teleporter.getZoneNameSecondLanguage(zoneId) -- add second zone language
	-- add discovery info (for zone tooltip)
 	record.zoneWayhsrineDiscoveryInfo, record.zoneWayshrineDiscovered, record.zoneWayshrineTotal = Teleporter.getZoneGuideDiscoveryInfo(zoneId, ZONE_COMPLETION_TYPE_WAYSHRINES)
	record.zoneSkyshardDiscoveryInfo, record.zoneSkyshardDiscovered, record.zoneSkyshardTotal = Teleporter.getZoneGuideDiscoveryInfo(zoneId, ZONE_COMPLETION_TYPE_SKYSHARDS)
	
	return record
end


-- create record for items which could not be assigned to any zone
function Teleporter.createZoneLessItemsInfo()
	local info = Teleporter.createBlankRecord()
	info.zoneName = SI.get(SI.TELE_UI_UNRELATED_ITEMS)
	info.textColorDisplayName = Teleporter.var.color.colTrash
	info.textColorZoneName = Teleporter.var.color.colTrash
	info.zoneNameClickable = false -- show Tamriel on click
	
	return info
end


-- try to match zone to matchStr
-- return true if match with zone else return false
function Teleporter.tryMatchZoneToMatchStr(matchStr, zoneId)
	if matchStr == nil or matchStr == "" or zoneId == nil or zoneId == "" then
		return false
	end
	
	-- get zone name by game without articles !
	local zoneName = Teleporter.formatName(GetZoneNameById(zoneId), true)
	
	if zoneName == nil or zoneName == "" then
		return false
	end
	
	-- "-" issue:
	zoneName = string.gsub(zoneName, "-", "--")

	-- try to match
		-- handle "Alik'r desert" exception
	if (string.match(string.lower(matchStr), string.lower("Alik'r")) and string.match(string.lower(zoneName), string.lower("Alik'r")))
		-- handle "Morneroc" expception (FR)
		or (string.match(string.lower(matchStr), string.lower("Morneroc")) and string.match(string.lower(zoneName), string.lower("Morneroc")))
		-- hanlde "Bleakrock" expception (EN)
		or (string.match(string.lower(matchStr), string.lower("Bleakrock")) and string.match(string.lower(zoneName), string.lower("Bleakrock")))
		-- handle "Wrothgar - Orsinium" exception (EN, FR, DE)
		or (string.match(string.lower(matchStr), string.lower("Orsinium")) and string.match(string.lower(zoneName), string.lower("Wrothgar")))
		-- handle "Greymoor Kaverns" exception (DE)
		or (string.match(string.lower(matchStr), string.lower("Graumoorkaverne")) and string.match(string.lower(zoneName), string.lower("Graumoorkaverne")))
		-- handle "Greymoor Kaverns" exception (FR)
		or (string.match(string.lower(matchStr), string.lower("Griselande")) and string.match(string.lower(zoneName), string.lower("Griselande")))
		-- normal match
		or (string.match(string.lower(matchStr), string.lower(zoneName))) then
			return true
	else
			return false
	end
end


-- return true if itemId is related to the zone
function Teleporter.tryMatchZoneWithItem(zoneId, itemId)
	if Teleporter.tresureAndSurveyMaps[zoneId] ~= nil then
		-- check if it contains itemId
		if Teleporter.has_value(Teleporter.tresureAndSurveyMaps[zoneId], itemId) then
			return true
		end
	end
	
	return false
end


-- connect quests with found zones
function Teleporter.syncWithQuests(portalPlayers)
-- go over all active quests
-- for each quest go over all portalPlayers entries and find the zone
	-- if found add the information and break/go to next quest
	-- else add the quest to unrelated quest table
	local newTable ={}
	local unRelatedQuests = {}
	
	-- go over all quest slotIndices
	for slotIndex = 1, GetNumJournalQuests() do
		local isRelated, updatedRecord, recordIndex = Teleporter.questIsRelated(portalPlayers, slotIndex) -- check if quest is related to entry in portalPlayers table and return new record and its index
		if isRelated then
			-- quest is related and connected to an entry in portalPlayers table
			-- update record in result table
			portalPlayers[recordIndex] = updatedRecord
		else
			-- quest is not related to an entry -> save slotIndex for UnRelatedQuestInfo
			table.insert(unRelatedQuests, slotIndex)
		end
	end
	
	-- clean result table from zones without related quests
	newTable = Teleporter.cleanUnrelatedRecords2(portalPlayers)
	
	-- create table of records of unrelated quests with their zones (maybe empty) & returns list of zoneless quests
	local unrelatedQuestsRecords, zoneLessQuests = Teleporter.createUnrelatedQuestsRecords(unRelatedQuests)
	if next(unrelatedQuestsRecords) ~= nil then
		for _, record in pairs(unrelatedQuestsRecords) do
			table.insert(newTable, record)
		end
	end
	
	-- are there any zoneless quests?
	if next(zoneLessQuests) ~= nil then
		-- create entry for zoneless quests (maybe empty)
		local zoneLessQuestsRecord = Teleporter.createZoneLessQuestsInfo(zoneLessQuests)
		if next(zoneLessQuestsRecord) ~= nil then
			table.insert(newTable, zoneLessQuestsRecord)
		end
	end
	
	-- sort table
	table.sort(newTable, function(a, b)
		-- prio (1: tracked quest, 2: related quests (with players), 3: unrelated quests (without players), 4: zoneless quests)
		if a.prio ~= b.prio then
			return a.prio < b.prio
		else
		-- zoneName
			return a.zoneName < b.zoneName
		end
	end)
	
	-- set flag, that quest location data cache was updated
	Teleporter.questDataChanged = false
	
	return newTable
end


-- remove all records which have no related quests
function Teleporter.cleanUnrelatedRecords2(portalPlayers)
	local newTable = {}
	
	-- go over all records in portalPlayers
	for index, record in ipairs(portalPlayers) do
		if record.countRelatedQuests > 0 then
			table.insert(newTable, record)
		end
	end
	
	return newTable
end


-- creates table of records with quests and their zones (zone without players)
function Teleporter.createUnrelatedQuestsRecords(unRelatedQuests)
	local unrelatedQuestsRecords = {}
	local zoneLessQuests = {}
	
	for _, slotIndex in ipairs(unRelatedQuests) do
		--local questName = GetJournalQuestName(slotIndex)
		local questName, _, _, _, _, _, tracked = GetJournalQuestInfo(slotIndex)
		local questZoneName, objectiveName, questZoneIndex, poiIndex = GetJournalQuestLocationInfo(slotIndex)
		local questZoneId = GetZoneId(questZoneIndex)
		if questZoneId ~= 0 then
			-- get exact quest location
			questZoneId = Teleporter.findExactQuestLocation(slotIndex)
			questZoneName =  Teleporter.formatName(GetZoneNameById(questZoneId), Teleporter.savedVarsAcc.formatZoneName)
		end
		local questRepeatType = GetJournalQuestRepeatType(slotIndex)
		
		if tracked then
			questName =  Teleporter.var.color.colLegendary .. questName
		elseif questRepeatType == 1 or questRepeatType == 2 then
		-- color repeatable quests (1,2: repeatable quest | 0: not repeatable)
			questName =  Teleporter.var.color.colBlue .. questName
		end
	
		if questZoneId == 0 then
			-- zoneless quest
			table.insert(zoneLessQuests, slotIndex)
		else
			if unrelatedQuestsRecords[questZoneId] == nil then
				-- create a new record
				local record = Teleporter.createBlankRecord()
				record.zoneId = questZoneId
				record.zoneName = Teleporter.formatName(questZoneName, Teleporter.savedVarsAcc.formatZoneName)
				record.mapIndex = Teleporter.getMapIndex(questZoneId)
				record.parentZoneId = Teleporter.getParentZoneId(questZoneId)
				record.category = Teleporter.categorizeZone(questZoneId)
				record.zoneNameUnformatted = questZoneName
				-- set color and prio
				if tracked then
					record.prio = 1
					record.textColorZoneName = Teleporter.var.color.colLegendary
				else
					record.prio = 3
					record.textColorZoneName = Teleporter.var.color.colDarkRed
				end
				record.countRelatedQuests = 1
				-- add quest name
				table.insert(record.relatedQuests, questName)
				-- add questIndex for quest map ping
				table.insert(record.relatedQuestsSlotIndex, slotIndex)
				record.zoneNameClickable = true -- show zone on click
				record.zoneNameSecondLanguage = Teleporter.getZoneNameSecondLanguage(record.zoneId) -- add second zone language
				-- add discovery info (for zone tooltip)
				record.zoneWayhsrineDiscoveryInfo, record.zoneWayshrineDiscovered, record.zoneWayshrineTotal = Teleporter.getZoneGuideDiscoveryInfo(record.zoneId, ZONE_COMPLETION_TYPE_WAYSHRINES)
				record.zoneSkyshardDiscoveryInfo, record.zoneSkyshardDiscovered, record.zoneSkyshardTotal = Teleporter.getZoneGuideDiscoveryInfo(record.zoneId, ZONE_COMPLETION_TYPE_SKYSHARDS)
				--table.insert(unrelatedQuestsRecords, record)
				unrelatedQuestsRecords[questZoneId] = record
			else
				-- add quest to already existing record
				local record = unrelatedQuestsRecords[questZoneId]
				-- increment counter
				record.countRelatedQuests = record.countRelatedQuests + 1
				-- add quest name to relatedList
				table.insert(record.relatedQuests, questName)
				-- add questIndex for quest map ping
				table.insert(record.relatedQuestsSlotIndex, slotIndex)
				-- set color and prio
				if tracked then
					record.prio = 1
					record.textColorZoneName = Teleporter.var.color.colLegendary
				end
				-- update record
				unrelatedQuestsRecords[questZoneId] = record
			end
		end
	end
	return unrelatedQuestsRecords, zoneLessQuests
end


-- create message with all zoneless quests
function Teleporter.createZoneLessQuestsInfo(zoneLessQuests)
	local info = Teleporter.createBlankRecord()
	info.zoneName = SI.get(SI.TELE_UI_UNRELATED_QUESTS)
	--info.textColorDisplayName = Teleporter.var.color.colTrash
	info.textColorZoneName = Teleporter.var.color.colTrash
	info.prio = 4
	info.zoneNameClickable = false

	-- go over all zoneless quests
	for _, slotIndex in ipairs(zoneLessQuests) do
		--local questName = GetJournalQuestName(slotIndex)
		local questName, _, _, _, _, _, tracked = GetJournalQuestInfo(slotIndex)
		local questRepeatType = GetJournalQuestRepeatType(slotIndex)
		if tracked then
			questName =  Teleporter.var.color.colLegendary .. questName
		elseif questRepeatType == 1 or questRepeatType == 2 then
		-- color repeatable quests (1,2: repeatable quest | 0: not repeatable)
			questName =  Teleporter.var.color.colBlue .. questName
		end
		-- increment counter
		info.countRelatedQuests = info.countRelatedQuests + 1
		-- add quest name to relatedList
		table.insert(info.relatedQuests, questName)
		-- add questIndex for quest map ping
		table.insert(info.relatedQuestsSlotIndex, slotIndex)
		-- change color of record if contains tracked quest
		if tracked then
			info.textColorZoneName = Teleporter.var.color.colLegendary
		end
	end

	return info
end


-- check if a quest is related to an entry of the portalPlayers table and return the new record
function Teleporter.questIsRelated(portalPlayers, slotIndex)
	--local questName = GetJournalQuestName(slotIndex)
	local questName, _, _, _, _, _, tracked = GetJournalQuestInfo(slotIndex)
	local zoneName, objectiveName, questZoneIndex, poiIndex = GetJournalQuestLocationInfo(slotIndex)
	local questZoneId = GetZoneId(questZoneIndex)
	if questZoneId ~= 0 then
		-- get exact quest location
		questZoneId = Teleporter.findExactQuestLocation(slotIndex)
		questZoneName =  Teleporter.formatName(GetZoneNameById(questZoneId), Teleporter.savedVarsAcc.formatZoneName)
	end
	local questRepeatType = GetJournalQuestRepeatType(slotIndex)
	
	if tracked then
		questName =  Teleporter.var.color.colLegendary .. questName
	elseif questRepeatType == 1 or questRepeatType == 2 then
	-- color repeatable quests (1,2: repeatable quest | 0: not repeatable)
		questName =  Teleporter.var.color.colBlue .. questName
	end
	
	-- go over all records in portalPlayers
	for index, record in ipairs(portalPlayers) do
		if record.zoneId == questZoneId then
			-- add quest name to record
			table.insert(record.relatedQuests, questName)
			-- add questIndex for quest map ping
			table.insert(record.relatedQuestsSlotIndex, slotIndex)
			-- increment quest counter
			record.countRelatedQuests = record.countRelatedQuests + 1
			-- set color and prio
			if tracked then
				record.prio = 1
				record.textColorZoneName = Teleporter.var.color.colLegendary
			elseif record.countRelatedQuests == 1 then
			-- set prio and color only for "new" records to not override the tracked marker
				record.prio = 2
				record.textColorZoneName = Teleporter.var.color.colWhite
			end
			return true, record, index
		end
	end
	
	return false, nil, nil
end


function Teleporter.createNoResultsInfo()
	local info = Teleporter.createBlankRecord()
	info.zoneName = SI.get(SI.TELE_UI_NO_MATCHES)
	info.textColorDisplayName = Teleporter.var.color.colTrash
	info.textColorZoneName = Teleporter.var.color.colTrash
	info.zoneNameClickable = false -- show Tamriel on click
	return info
end


-- checks if specific zone is a favorite
function Teleporter.isFavoriteZone(zoneId)
	return Teleporter.has_value(Teleporter.savedVarsServ.favoriteListZones, zoneId)
end


-- checks if specific player is a favorite
function Teleporter.isFavoritePlayer(displayName)
	return Teleporter.has_value(Teleporter.savedVarsServ.favoriteListPlayers, displayName)
end


-- removes an existing entry (already added zoneId) from table (TeleportAllPlayersTable) if it is not a player favorite or group member
function Teleporter.removeExistingEntry(zoneId)
	for index, record in pairs(TeleportAllPlayersTable) do
		if record.zoneId == zoneId and not Teleporter.isFavoritePlayer(record.displayName) and record.sourceIndexLeading ~= TELEPORTER_SOURCE_INDEX_GROUP then
			table.remove(TeleportAllPlayersTable, index)
		end
	end
end


-- returns the record from table (TeleportAllPlayersTable) located at given zoneId
function Teleporter.getExistingEntry(zoneId)
	for index, record in pairs(TeleportAllPlayersTable) do
		if record.zoneId == zoneId then
			return record
		end
	end
	d("NOT FOUND: " .. zoneId)
end


-- returns true if the first record is preferred
-- return false if the second record is preferred
function Teleporter.decidePrioDisplay(record1, record2)
	if record1.isLeader and not record2.isLeader then
		return true
	elseif record2.isLeader and not record1.isLeader then
		return false
	elseif record1.sourceIndexLeading == TELEPORTER_SOURCE_INDEX_GROUP and record2.sourceIndexLeading ~= TELEPORTER_SOURCE_INDEX_GROUP then
		-- group is always comes first
		return true
	elseif record1.sourceIndexLeading ~= TELEPORTER_SOURCE_INDEX_GROUP and record2.sourceIndexLeading == TELEPORTER_SOURCE_INDEX_GROUP then
		-- group is always comes first
		return false
	elseif Teleporter.getIndexFromValue(Teleporter.savedVarsServ.prioritizationSource, record1.sourceIndexLeading) < Teleporter.getIndexFromValue(Teleporter.savedVarsServ.prioritizationSource, record2.sourceIndexLeading) then
		-- source of record1 has lower index in prioritization table (higher priority)
		return true
	else
		return false
	end
end


function Teleporter.addNumberPlayers(oldTable)
	local newTable = {}
	
	-- go over table
	for index, record in pairs(oldTable) do
		if allZoneIds[record.zoneId] then
			-- add number of players per map
			record.numberPlayers = "(" .. allZoneIds[record.zoneId] .. ")"
		end
		-- copy records to the new table
		table.insert(newTable, record)
	end
	
	return newTable
end


function Teleporter.findCorrespondingOverlandZone(itemId, language)
    local localizedSearchZoneData = Teleporter.LibZoneGivenZoneData[language]
    if localizedSearchZoneData == nil then return nil end
	
	-- go over all overland zones
	for zoneId, _ in pairs(Teleporter.tresureAndSurveyMaps) do
		if Teleporter.tryMatchZoneWithItem(zoneId, itemId) then
			return zoneId
		end
	end
	
	return nil
end


-- return parent zone id (if parent zone id can not be found -> parentZoneId = zoneId)
function Teleporter.getParentZoneId(zoneId)
	-- exception for "Traitor's Vault" (return Arteum)
	if zoneId == 1016 then return 1027 end
	-- exception for "Snow Globe Home" (return Eastmarch)
	if zoneId == 1109 then return 101 end
	
	-- 1. try to find parent zone by own data set (mostly obsolete)
	local parentZoneId = Teleporter.ParentMap[zoneId]
	-- 2. try to get parent zone by API (esp. Dungeons, Houses, ...)
	if parentZoneId == nil then
		parentZoneId = GetParentZoneId(zoneId)
	end
	
	-- return zoneId if the parentZoneId can not be found
	if parentZoneId == nil or parentZoneId == 0 then
		return zoneId
	end
	
	return parentZoneId
end


function Teleporter.createTableHouses()
	-- change global state to 11, to have the correct tab active
	Teleporter.changeState(11)
	local resultList = {}
	
	-- add owned houses
	WORLD_MAP_HOUSES_DATA:RefreshHouseList()
    local houses = WORLD_MAP_HOUSES_DATA:GetHouseList()
    for i = 1, #houses do
        local house = houses[i]
		
		if house.unlocked then
			local entry = Teleporter.createBlankRecord()
			entry.houseId = house.houseId
			if IsPrimaryHouse(house.houseId) then
				entry.prio = 1
				entry.textColorZoneName = Teleporter.var.color.colLegendary
			else
				entry.prio = 2
				entry.textColorZoneName = Teleporter.var.color.colWhite
			end
			entry.isOwnHouse = true
			entry.zoneId = GetHouseZoneId(house.houseId)
			entry.zoneNameUnformatted = GetZoneNameById(entry.zoneId)
			entry.textColorDisplayName = Teleporter.var.color.colTrash
			entry.zoneNameClickable = true
			entry.mapIndex = Teleporter.getMapIndex(entry.zoneId)
			entry.parentZoneId = Teleporter.getParentZoneId(entry.zoneId)
			entry.parentZoneName = Teleporter.formatName(GetZoneNameById(entry.parentZoneId))
			entry.category = Teleporter.categorizeZone(entry.zoneId)
			entry.collectibleId = GetCollectibleIdForHouse(entry.houseId)
			entry.houseCategoryType = GetString("SI_HOUSECATEGORYTYPE", GetHouseCategoryType(entry.houseId))
			entry.nickName = Teleporter.formatName(GetCollectibleNickname(entry.collectibleId))
			entry.zoneName = Teleporter.formatName(entry.zoneNameUnformatted, Teleporter.savedVarsAcc.formatZoneName)
			
			_, _, entry.houseIcon = GetCollectibleInfo(entry.collectibleId)
			entry.houseBackgroundImage = GetHousePreviewBackgroundImage(entry.houseId)
			entry.houseTooltip = {entry.zoneName, "\"" .. entry.nickName .. "\"", entry.parentZoneName, "", "", "|t75:75:" .. entry.houseIcon .. "|t", "", "", entry.houseCategoryType}
		
			if Teleporter.savedVarsAcc.houseNickNames then
				-- show nick name instead of real house name
				entry.zoneName = entry.nickName
			end
			
			table.insert(resultList, entry)
		end
	end
	
	-- sort
	table.sort(resultList, function(a, b)
		-- prio
		if a.prio ~= b.prio then
			return a.prio < b.prio
		end
		-- name
		return a.zoneName < b.zoneName
	end)
	
	-- in case of no results, add message with information
	if #resultList == 0 then
		table.insert(resultList, Teleporter.createNoResultsInfo())
		-- check if the addon "No Thank You" is active and if the incompatible option is set ("Owned houses" is set to "Hide")
		if NO_THANK_YOU_VARS then
			local sv = ZO_SavedVars:NewAccountWide("NO_THANK_YOU_VARS", 1, nil, nil, nil)
			if sv and sv.ownedHouses and sv.ownedHouses == 2 then
				-- show dialog and lock it for a specific time (so that the user is not spammed with dialogs)
				if not Teleporter.blockDialogNTY then
					-- lock flag
					Teleporter.blockDialogNTY = true
					-- timer
					zo_callLater(function() Teleporter.blockDialogNTY = false end, 60000)
					-- show dialog
					Teleporter.showDialog("IncompatibilityNTY", "Incompatibility with addon \"No, thank you!\"", "We have detected that you are using the addon \"No, thank you!\" with incompatible settings.\n\n" .. Teleporter.var.color.colRed .. "Please change the option \"Owned Houses\" to \"Show\" in the settings of \"No, thank you!\" in the section \"Map\"!|r\n\nOtherwise BeamMeUp will not be able to display your houses.", nil, nil)
				end
			end
		end
	end
	
	TeleporterList:add_messages(resultList)
end


function Teleporter.createTablePTF()
	if not PortToFriend or not PortToFriend.GetFavorites then
		return
	end
	-- change global state to 12, to have the correct tab active
	Teleporter.changeState(12)
	local resultList = {}
	
	-- add PTF entries
	local favorites = PortToFriend.GetFavorites()
	if favorites and #favorites > 0 then
		for i = 1, #favorites do
			local favorite = favorites[i]
			
			local entry = Teleporter.createBlankRecord()
			entry.houseId = favorite.houseId
			local IdAsText = ""
			if favorite.id then
				entry.prio = 1
				entry.order = favorite.id
				IdAsText = favorite.id .. " - "
			else
				entry.prio = 2
			end
			entry.isPTFHouse = true
			entry.displayName = IdAsText .. favorite.name
			entry.houseId = favorite.houseId
			entry.zoneId = GetHouseZoneId(favorite.houseId)
			entry.zoneNameUnformatted = GetZoneNameById(entry.zoneId)
			entry.zoneNameClickable = true
			entry.mapIndex = Teleporter.getMapIndex(entry.zoneId)
			entry.parentZoneId = Teleporter.getParentZoneId(entry.zoneId)
			entry.parentZoneName = Teleporter.formatName(GetZoneNameById(entry.parentZoneId))
			entry.category = Teleporter.categorizeZone(entry.zoneId)
			entry.collectibleId = GetCollectibleIdForHouse(entry.houseId)
			entry.houseCategoryType = GetString("SI_HOUSECATEGORYTYPE", GetHouseCategoryType(entry.houseId))
			entry.zoneName = Teleporter.formatName(entry.zoneNameUnformatted)
			
			_, _, entry.houseIcon = GetCollectibleInfo(entry.collectibleId)
			entry.houseBackgroundImage = GetHousePreviewBackgroundImage(entry.houseId)
			entry.houseTooltip = {entry.zoneName, entry.parentZoneName, "", "", "|t75:75:" .. entry.houseIcon .. "|t", "", "", entry.houseCategoryType}
			
			entry.textColorDisplayName = Teleporter.var.color.colWhite
			entry.textColorZoneName = Teleporter.var.color.colWhite
			
			table.insert(resultList, entry)
		end
		
		-- sort
		table.sort(resultList, function(a, b)
			-- prio
			if a.prio ~= b.prio then
				return a.prio < b.prio
			end
			if a.order and a.order ~= b.order then
				return a.order < b.order
			end
			-- name
			return a.zoneName < b.zoneName
		end)
	end
		
	-- creat record as button for addon opening
	local openPTF = Teleporter.createBlankRecord()
	openPTF.zoneName = "Open \"Port to Friend's House\""
	openPTF.textColorDisplayName = Teleporter.var.color.colLegendary
	openPTF.textColorZoneName = Teleporter.var.color.colLegendary
	openPTF.zoneNameClickable = true
	openPTF.PTFHouseOpen = true
	
	table.insert(resultList, openPTF)
	
	TeleporterList:add_messages(resultList)
end


-- adds matching overland zones to the result list
-- return sorted result list ready for display
function Teleporter.addOverlandZoneMatches(portalPlayers, inputString, currentZoneId)
	-- go over complete overland list
	for overlandZoneId, _ in pairs(Teleporter.overlandDelvesPublicDungeons) do
		local entry = Teleporter.createClickableZoneRecord(overlandZoneId)
		-- add only if zone not already in result list + search string match
		if not allZoneIds[overlandZoneId] and (string.match(string.lower(entry.zoneName), string.lower(inputString)) or (Teleporter.savedVarsAcc.secondLanguage ~= 1 and string.match(string.lower(entry.zoneNameSecondLanguage), string.lower(inputString)))) then
			-- change text color if zone is displayed zone
			if entry.zoneId == currentZoneId then
				entry.textColorZoneName = Teleporter.var.color.colBlue
			end
			table.insert(portalPlayers, entry)
		end
	end

	return portalPlayers
end


-- sorting for search by displayName or zoneName
-- sorts the entries according to the position of the string match
-- keys are the used key field (e.g. "displayName" or "zoneName")
function Teleporter.sortByStringFindPosition(portalPlayers, inputString, key1, key2)
	table.sort(portalPlayers, function(a, b)
		--[[
		-- first, real port options (where players or own houses are)
		if (a.displayName ~= "" or a.isOwnHouse) and (b.displayName == "" and not b.isOwnHouse) then
			return true
		elseif (a.displayName == "" and not a.isOwnHouse) and (b.displayName ~= "" or b.isOwnHouse) then
			return false
		end
		--]]
		
		-- second, by search match position of key1
		if key1 then
			local pos1 = string.find(string.lower(tostring(a[key1])), string.lower(inputString))
			local pos2 = string.find(string.lower(tostring(b[key1])), string.lower(inputString))
			if pos1 and not pos2 then
				return true
			elseif pos2 and not pos1 then
				return false
			elseif pos1 and pos2 then
				return pos1 < pos2
			end
		end
		
		-- third, by search match position of key2
		if key2 then
			local pos1 = string.find(string.lower(tostring(a[key2])), string.lower(inputString))
			local pos2 = string.find(string.lower(tostring(b[key2])), string.lower(inputString))
			if pos1 and not pos2 then
				return true
			elseif pos2 and not pos1 then
				return false
			elseif pos1 and pos2 then
				return pos1 < pos2
			end
		end		
	end)
	
	return portalPlayers
end


function Teleporter.createTableGuilds(repeatFlag)
	-- abort repeating the function if user switched to other tab
	if repeatFlag and Teleporter.state ~= 13 then
		return
	end

	-- change global state to 13, to have the correct tab active
	Teleporter.changeState(13)
	local resultList = {}
	
	-- headline for the official guilds
	local entry = Teleporter.createBlankRecord()
	entry.zoneName = "-- OFFICIAL GUILDS --"
	entry.textColorZoneName = Teleporter.var.color.colTrash
	table.insert(resultList, entry)
	
	-- official guilds
	local success = true
	for _, guildId in pairs(Teleporter.var.BMUGuilds[GetWorldName()]) do
		local guildData = GUILD_BROWSER_MANAGER:GetGuildData(guildId)
		if guildData then
			-- display only guilds that are listed/active
			if guildData.guildName ~= nil and guildData.guildName ~= "" then
				local entry = Teleporter.createBlankRecord()
				entry.guildId = guildId
				entry.isGuild = true
				entry.displayName = guildData.guildName
				entry.textColorZoneName = Teleporter.var.color.colWhite
				entry.textColorDisplayName = Teleporter.var.color.colLegendary
				local prefixMembers = GetString("SI_GUILDMETADATAATTRIBUTE", GUILD_META_DATA_ATTRIBUTE_SIZE) .. ": "
				local prefixLanguage = GetString("SI_GUILDMETADATAATTRIBUTE", GUILD_META_DATA_ATTRIBUTE_LANGUAGES) .. ": "
				local guildSizeText = guildData.size .. "/500"
				entry.hideButton = false
				-- hide button and change text color if guild almost full
				if guildData.size >= 495 then
					entry.hideButton = true
					guildSizeText = Teleporter.var.color.colRed .. guildSizeText .. "|r"
				end
				entry.guildTooltip = {guildData.headerMessage, Teleporter.textures.tooltipSeperator, prefixMembers .. guildSizeText, prefixLanguage .. GetString("SI_GUILDLANGUAGEATTRIBUTEVALUE", guildData.language)}
				entry.zoneName = GetString("SI_GUILDLANGUAGEATTRIBUTEVALUE", guildData.language) .. " || " .. guildSizeText
				table.insert(resultList, entry)
			end
		else
			success = false
		end
	end
	
	
	-- headline for the partner guilds
	local entry = Teleporter.createBlankRecord()
	entry.zoneName = "-- PARTNER GUILDS --"
	entry.textColorZoneName = Teleporter.var.color.colTrash
	table.insert(resultList, entry)
	
	-- partner guilds
	local tempList = {}
	for _, guildId in pairs(Teleporter.var.partnerGuilds[GetWorldName()]) do
		local guildData = GUILD_BROWSER_MANAGER:GetGuildData(guildId)
		if guildData then
			-- display only guilds that are listed/active
			if guildData.guildName ~= nil and guildData.guildName ~= "" then
				local entry = Teleporter.createBlankRecord()
				entry.guildId = guildId
				entry.isGuild = true
				entry.displayName = guildData.guildName
				entry.languageCode = guildData.language
				entry.size = guildData.size
				local prefixMembers = GetString("SI_GUILDMETADATAATTRIBUTE", GUILD_META_DATA_ATTRIBUTE_SIZE) .. ": "
				local prefixLanguage = GetString("SI_GUILDMETADATAATTRIBUTE", GUILD_META_DATA_ATTRIBUTE_LANGUAGES) .. ": "
				local guildSizeText = guildData.size .. "/500"
				entry.prio = 1
				-- change text color if guild almost full and reduce prio
				if guildData.size >= 495 then
					entry.prio = 2
					guildSizeText = Teleporter.var.color.colRed .. guildSizeText .. "|r"
				end
				entry.guildTooltip = {guildData.headerMessage, Teleporter.textures.tooltipSeperator, prefixMembers .. guildSizeText, prefixLanguage .. GetString("SI_GUILDLANGUAGEATTRIBUTEVALUE", guildData.language)}
				entry.zoneName = GetString("SI_GUILDLANGUAGEATTRIBUTEVALUE", guildData.language) .. " || " .. guildSizeText
				table.insert(tempList, entry)
			end
		else
			success = false
		end
	end
	-- only sort partner guilds
	table.sort(tempList, function(a, b)
		if a.languageCode ~= b.languageCode then
			return a.languageCode < b.languageCode
		end
		if a.prio ~= b.prio then
			return a.prio < b.prio
		end
		if a.size ~= b.size then
			return a.size > b.size
		end
	end)
	-- add partner guild list to final list
	for _, v in pairs(tempList) do table.insert(resultList, v) end
	
	TeleporterList:add_messages(resultList)
	
	if not success then
		-- try again
		zo_callLater(function() Teleporter.createTableGuilds(true) end, 650)
	end
end



-- create table of Dungeons, Trials, Arenas depending on the settings
function Teleporter.createTableDungeons()
	-- change global state to 14, to have the correct tab active
	Teleporter.changeState(14)
	local resultListArenas = {}
	local resultListGroupArenas = {}
	local resultListTrials = {}
	local resultListGroupDungeons = {}

	if Teleporter.savedVarsChar.df_showArenas then		
		for _, zoneId in ipairs(Teleporter.blacklistSoloArenas) do
			local entry = Teleporter.createDungeonRecord(zoneId)
			if entry then
				table.insert(resultListArenas, entry)
			end
		end
		
		if Teleporter.savedVarsChar.df_sortByAcronym then
			-- sort by acronym
			table.sort(resultListArenas, function(a, b)
				return a.acronym < b.acronym
			end)
		else
			-- sort by name
			table.sort(resultListArenas, function(a, b)
				return a.zoneName < b.zoneName
			end)
		end
		
		-- add headline
		local entry = Teleporter.createBlankRecord()
		entry.zoneName = "-- " .. string.upper(SI.get(SI.TELE_UI_TOGGLE_ARENAS)) .. " --"
		entry.textColorZoneName = Teleporter.var.color.colTrash
		table.insert(resultListArenas, 1, entry)
	end
	
	
	
	if Teleporter.savedVarsChar.df_showGroupArenas then
		for _, zoneId in ipairs(Teleporter.blacklistGroupArenas) do
			local entry = Teleporter.createDungeonRecord(zoneId)
			if entry then
				table.insert(resultListGroupArenas, entry)
			end
		end
		
		if Teleporter.savedVarsChar.df_sortByAcronym then
			-- sort by acronym
			table.sort(resultListGroupArenas, function(a, b)
				return a.acronym < b.acronym
			end)
		else
			-- sort by name
			table.sort(resultListGroupArenas, function(a, b)
				return a.zoneName < b.zoneName
			end)
		end
		
		-- add headline
		local entry = Teleporter.createBlankRecord()
		entry.zoneName = "-- " .. string.upper(SI.get(SI.TELE_UI_TOGGLE_GROUP_ARENAS)) .. " --"
		entry.textColorZoneName = Teleporter.var.color.colTrash
		table.insert(resultListGroupArenas, 1, entry)
	end
	
	
	if Teleporter.savedVarsChar.df_showTrials then
		for _, zoneId in ipairs(Teleporter.blacklistRaids) do
			local entry = Teleporter.createDungeonRecord(zoneId)
			if entry then
				table.insert(resultListTrials, entry)
			end
		end
		
		if Teleporter.savedVarsChar.df_sortByAcronym then
			-- sort by acronym
			table.sort(resultListTrials, function(a, b)
				return a.acronym < b.acronym
			end)
		else
			-- sort by name
			table.sort(resultListTrials, function(a, b)
				return a.zoneName < b.zoneName
			end)
		end
		
		-- add headline
		local entry = Teleporter.createBlankRecord()
		entry.zoneName = "-- " .. string.upper(SI.get(SI.TELE_UI_TOGGLE_TRIALS)) .. " --"
		entry.textColorZoneName = Teleporter.var.color.colTrash
		table.insert(resultListTrials, 1, entry)
	end


	if Teleporter.savedVarsChar.df_showDungeons then
		for _, zoneId in ipairs(Teleporter.blacklistGroupDungeons) do
			local entry = Teleporter.createDungeonRecord(zoneId)
			if entry then
				table.insert(resultListGroupDungeons, entry)
			end
		end
		
		if Teleporter.savedVarsChar.df_sortByAcronym then
			-- sort by acronym
			table.sort(resultListGroupDungeons, function(a, b)
				return a.acronym < b.acronym
			end)
		else
			-- sort by name
			table.sort(resultListGroupDungeons, function(a, b)
				return a.zoneName < b.zoneName
			end)
		end
		
		-- add headline
		local entry = Teleporter.createBlankRecord()
		entry.zoneName = "-- " .. string.upper(SI.get(SI.TELE_UI_TOGGLE_GROUP_DUNGEONS)) .. " --"
		entry.textColorZoneName = Teleporter.var.color.colTrash
		table.insert(resultListGroupDungeons, 1, entry)
	end
	
	-- merge all lists together
	local resultList = {}
	for _, v in pairs(resultListArenas) do table.insert(resultList, v) end
	for _, v in pairs(resultListGroupArenas) do table.insert(resultList, v) end
	for _, v in pairs(resultListTrials) do table.insert(resultList, v) end
	for _, v in pairs(resultListGroupDungeons) do table.insert(resultList, v) end
	
	-- add no results info if player disabled all categories
	if #resultList == 0 then
		table.insert(resultList, Teleporter.createNoResultsInfo())
	end
	
	TeleporterList:add_messages(resultList)
end


-- creates an record for an dungeon entry
function Teleporter.createDungeonRecord(zoneId)
	local entry = Teleporter.createBlankRecord()
	entry.isDungeon = true
	entry.zoneId = zoneId
	entry.zoneNameUnformatted = GetZoneNameById(entry.zoneId)
	-- in the case that new DLC dungeons from PTS are already added but not published on live servers so far
	-- prevent them from showing as empty row
	if not entry.zoneNameUnformatted or entry.zoneNameUnformatted == "" then
		return nil
	end
	--entry.textColorDisplayName = Teleporter.var.color.colTrash
	entry.zoneNameClickable = true
	entry.mapIndex = Teleporter.getMapIndex(entry.zoneId)
	entry.parentZoneId = Teleporter.getParentZoneId(entry.zoneId)
	entry.parentZoneName = Teleporter.formatName(GetZoneNameById(entry.parentZoneId))
	entry.category = Teleporter.categorizeZone(entry.zoneId)
	entry.zoneNameSecondLanguage = Teleporter.getZoneNameSecondLanguage(entry.zoneId)
	
	local nodeObject = Teleporter.nodeIndexMap[zoneId]
	entry.nodeIndex = nodeObject[1]
	entry.acronym = nodeObject[2] or ""
	entry.dlc = nodeObject[3] or ""
	if Teleporter.savedVarsChar.df_showDLCNames then
		-- use DLC names
		entry.displayName = entry.dlc
	else
		-- use acronyms
		entry.displayName = entry.acronym
	end
	entry.zoneName = Teleporter.formatName(entry.zoneNameUnformatted, Teleporter.savedVarsAcc.formatZoneName)
	entry.difficultyText = GetString(SI_DUNGEONDIFFICULTY1)
	
	if ZO_ConvertToIsVeteranDifficulty(ZO_GetEffectiveDungeonDifficulty()) then
		entry.difficultyText = GetString(SI_DUNGEONDIFFICULTY2)
	end
	
	return entry
end


-- create and initialize a list entry (record)
function Teleporter.createBlankRecord()
	local record = {}
	record.displayName = ""
	record.textColorDisplayName = Teleporter.var.color.colWhite
	record.textColorZoneName = Teleporter.var.color.colWhite
	record.countRelatedQuests = 0
	record.countRelatedItems = 0
	record.relatedItems = {}
	record.relatedQuests = {}
	record.relatedQuestsSlotIndex = {}
	return record
end


-- find exact quest location by setting the map via questmarker
function Teleporter.findExactQuestLocation(questIndex)
	local questName, _, _, _, _, _, _ = GetJournalQuestInfo(questIndex)
	local questZoneId = 0
	
	if Teleporter.questDataCache[questIndex] ~= nil and not Teleporter.questDataChanged then
		-- quest data did not changed -> use location data from cache
		questZoneId = Teleporter.questDataCache[questIndex]["zoneId"]
	else
		-- gather location info
		local result = Teleporter.setMapToQuest(questIndex)
		questZoneId = GetZoneId(GetCurrentMapZoneIndex())
		-- set map back to player location
		SetMapToPlayerLocation()
		CALLBACK_MANAGER:FireCallbacks("OnWorldMapChanged")
		
		-- save location data into cache
		Teleporter.questDataCache[questIndex] = {}
		Teleporter.questDataCache[questIndex]["zoneId"] = questZoneId
	end
	
	return questZoneId
end


-- set map to actual quest location depending on the active step and conditions
-- code is based on the function "ZO_WorldMap_ShowQuestOnMap(questIndex)"
-- https://esoapi.uesp.net/100028/src/ingame/map/worldmap.lua.html#6838
function Teleporter.setMapToQuest(questIndex)
    --first try to set the map to one of the quest's step pins
    local result = SET_MAP_RESULT_FAILED
    for stepIndex = QUEST_MAIN_STEP_INDEX, GetJournalQuestNumSteps(questIndex) do
        --Loop through the conditions, if there are any. Prefer non-completed conditions to completed ones.
        local requireNotCompleted = true
        local conditionsExhausted = false
        while result == SET_MAP_RESULT_FAILED and not conditionsExhausted do 
            for conditionIndex = 1, GetJournalQuestNumConditions(questIndex, stepIndex) do
                local tryCondition = true
                if requireNotCompleted then
                    local complete = select(4, GetJournalQuestConditionValues(questIndex, stepIndex, conditionIndex))
                    tryCondition = not complete
                end
                if tryCondition then
                    result = SetMapToQuestCondition(questIndex, stepIndex, conditionIndex)
                    if result ~= SET_MAP_RESULT_FAILED then
                        break
                    end
                end
            end
            if requireNotCompleted then
                requireNotCompleted = false
            else
                conditionsExhausted = true
            end
        end
        if result ~= SET_MAP_RESULT_FAILED then
            break
        end
        --If it's the end, set the map to the ending location (Endings don't have conditions)
        if IsJournalQuestStepEnding(questIndex, stepIndex) then
            result = SetMapToQuestStepEnding(questIndex, stepIndex)
            if result ~= SET_MAP_RESULT_FAILED then
                break
            end
        end
    end
    --if it has no condition pins, set it to the quest's zone
    if result == SET_MAP_RESULT_FAILED then
		result = SetMapToQuestZone(questIndex)
    end
    --if that doesn't work, bail
    if result == SET_MAP_RESULT_FAILED then
        ZO_Alert(UI_ALERT_CATEGORY_ERROR, SOUNDS.NEGATIVE_CLICK, SI_WORLD_MAP_NO_QUEST_MAP_LOCATION)
    end
	
	return result
end


-- get completion info for specific zone and completionType
function Teleporter.getZoneGuideDiscoveryInfo(zoneId, completionType)

	-- check for any zone exceptions
	local mainZoneId = Teleporter.getMainZoneId(zoneId)
	if mainZoneId then
		zoneId = mainZoneId
	end

	local numCompletedActivities, totalActivities, numUnblockedActivities, blockingBranchErrorStringId = ZO_ZoneStories_Manager.GetActivityCompletionProgressValues(zoneId, completionType)
	if totalActivities == 0 then
		return nil
	end
	
	local infoString = numCompletedActivities .. "/" .. totalActivities
	if numCompletedActivities == totalActivities then
		infoString = Teleporter.var.color.colGreen .. infoString
	end
	
	if completionType == ZONE_COMPLETION_TYPE_WAYSHRINES then
		infoString = SI.get(SI.TELE_UI_DISCOVERED_WAYSHRINES) .. " " .. infoString
	elseif completionType == ZONE_COMPLETION_TYPE_SKYSHARDS then
		infoString = SI.get(SI.TELE_UI_DISCOVERED_SKYSHARDS) .. " " .. infoString
	end
	
	return infoString, numCompletedActivities, totalActivities
end


-- exception handling
-- check if the zone belongs to another (main) zone which holds the map completion information
-- returns the corresponding zoneId if the input zone is part of a zone realtionship
function Teleporter.getMainZoneId(zoneId)
	if zoneId == 1011 or zoneId == 1027 then
		-- Summerset/Artaeum
		return 1011
	elseif zoneId == 1160 or zoneId == 1161 then
		-- Blackreach/Western Skyrim
		return 1160
	elseif zoneId == 1207 or zoneId == 1208 then
		-- Reach/Blackreach(Arkthzand)
		return 1207
	elseif zoneId == 1286 or zoneId == 1282 or zoneId == 1283 then
		-- Deadlands/Fargrave(City)/The Shambles
		return 1286
	else
		return false
	end
end

