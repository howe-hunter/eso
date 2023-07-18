local LAM2 = Teleporter.LAM
local SI = Teleporter.SI ---- used for localization

local teleporterVars    = Teleporter.var
local appName           = teleporterVars.appName
local wm                = WINDOW_MANAGER

-- list of tuples (guildId & displayname) for invite queue (only for admin)
local inviteQueue = {}

local function SetupOptionsMenu(index) --index == Addon name
    local teleporterWin     = Teleporter.win

    local panelData = {
            type 				= 'panel',
            name 				= index,
            displayName 		= teleporterVars.color.colLegendary .. index,
            author 				= teleporterVars.color.colBlue .. teleporterVars.author .. teleporterVars.color.colWhite,
            version 			= teleporterVars.color.colBlue .. teleporterVars.version,
            website             = teleporterVars.website,
            feedback            = teleporterVars.feedback,
            registerForRefresh  = true,
            registerForDefaults = true,
        }


    Teleporter.SettingsPanel = LAM2:RegisterAddonPanel(appName .. "Options", panelData) -- for quick access
	
	-- retreive most ported zones for statistic
	local portCounterPerZoneSorted = {}
	for index, value in pairs(Teleporter.savedVarsAcc.portCounterPerZone) do
		table.insert(portCounterPerZoneSorted, {["zoneId"]=index, ["count"]=value})
	end
	-- sort by counts
	table.sort(portCounterPerZoneSorted, function(a, b) return a["count"] > b["count"] end)
	-- build text block
	local mostPortedZonesText = ""
	for i=1, 10 do
		if portCounterPerZoneSorted[i] == nil then
			mostPortedZonesText = mostPortedZonesText .. "\n"
		else
			mostPortedZonesText = mostPortedZonesText .. Teleporter.formatName(GetZoneNameById(portCounterPerZoneSorted[i]["zoneId"])) .. " (" .. portCounterPerZoneSorted[i]["count"] .. ")\n"
		end
	end

    local optionsData = {
		 {
              type = "slider",
              name = SI.get(SI.TELE_SETTINGS_NUMBER_LINES),
              tooltip = SI.get(SI.TELE_SETTINGS_NUMBER_LINES_TOOLTIP) .. " [DEFAULT: " .. Teleporter.DefaultsAccount["numberLines"] .. "]",
              min = 6,
              max = 16,
              getFunc = function() return Teleporter.savedVarsAcc.numberLines end,
              setFunc = function(value) Teleporter.savedVarsAcc.numberLines = value
							teleporterWin.Main_Control:SetHeight(Teleporter.calculateListHeight())
							teleporterWin.Main_Control.bd:SetHeight(Teleporter.calculateListHeight() + 280*Teleporter.savedVarsAcc.Scale)
				end,
			  default = Teleporter.DefaultsAccount["numberLines"],
			  submenu = "ui",
         },
         {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_SHOW_ON_MAP_OPEN),
              tooltip = SI.get(SI.TELE_SETTINGS_SHOW_ON_MAP_OPEN_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["ShowOnMapOpen"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.ShowOnMapOpen end,
              setFunc = function(value) Teleporter.savedVarsAcc.ShowOnMapOpen = value end,
			  default = Teleporter.DefaultsAccount["ShowOnMapOpen"],
			  submenu = "ui",
         },
         {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_HIDE_ON_MAP_CLOSE),
              tooltip = SI.get(SI.TELE_SETTINGS_HIDE_ON_MAP_CLOSE_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["HideOnMapClose"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.HideOnMapClose end,
              setFunc = function(value) Teleporter.savedVarsAcc.HideOnMapClose = value end,
			  default = Teleporter.DefaultsAccount["HideOnMapClose"],
			  submenu = "ui",
         },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_CLOSE_ON_PORTING),
              tooltip = SI.get(SI.TELE_SETTINGS_CLOSE_ON_PORTING_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["closeOnPorting"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.closeOnPorting end,
              setFunc = function(value) Teleporter.savedVarsAcc.closeOnPorting = value end,
			  default = Teleporter.DefaultsAccount["closeOnPorting"],
			  submenu = "ui",
		 },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_WINDOW_STAY),
              tooltip = SI.get(SI.TELE_SETTINGS_WINDOW_STAY_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["windowStay"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.windowStay end,
              setFunc = function(value) Teleporter.savedVarsAcc.windowStay = value end,
			  default = Teleporter.DefaultsAccount["windowStay"],
			  submenu = "ui",
		 },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_FOCUS_ON_MAP_OPEN),
              tooltip = SI.get(SI.TELE_SETTINGS_FOCUS_ON_MAP_OPEN_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["focusZoneSearchOnOpening"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.focusZoneSearchOnOpening end,
              setFunc = function(value) Teleporter.savedVarsAcc.focusZoneSearchOnOpening = value end,
			  default = Teleporter.DefaultsAccount["focusZoneSearchOnOpening"],
			  submenu = "ui",
         },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_DISABLE_DIALOG),
              tooltip = SI.get(SI.TELE_SETTINGS_DISABLE_DIALOG_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["disableDialog"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.disableDialog end,
              setFunc = function(value) Teleporter.savedVarsAcc.disableDialog = value end,
			  default = Teleporter.DefaultsAccount["disableDialog"],
			  submenu = "ui",
         },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_UNLOCKING_LESS_CHAT_OUTPUT),
              tooltip = SI.get(SI.TELE_SETTINGS_UNLOCKING_LESS_CHAT_OUTPUT_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["unlockingLessChatOutput"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.unlockingLessChatOutput end,
              setFunc = function(value) Teleporter.savedVarsAcc.unlockingLessChatOutput = value end,
			  default = Teleporter.DefaultsAccount["unlockingLessChatOutput"],
			  submenu = "ui",
         },
		 {
              type = "slider",
              name = SI.get(SI.TELE_SETTINGS_AUTO_PORT_FREQ),
              tooltip = SI.get(SI.TELE_SETTINGS_AUTO_PORT_FREQ_TOOLTIP) .. " [DEFAULT: " .. Teleporter.DefaultsAccount["AutoPortFreq"] .. "]",
              min = 50,
              max = 500,
              getFunc = function() return Teleporter.savedVarsAcc.AutoPortFreq end,
              setFunc = function(value) Teleporter.savedVarsAcc.AutoPortFreq = value end,
			  default = Teleporter.DefaultsAccount["AutoPortFreq"],
			  submenu = "ui",
         },
		 {
              type = "divider",
			  submenu = "ui",
         },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_SHOW_BUTTON_ON_MAP),
              tooltip = SI.get(SI.TELE_SETTINGS_SHOW_BUTTON_ON_MAP_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["showOpenButtonOnMap"]) .. "]",
              requiresReload = true,
			  getFunc = function() return Teleporter.savedVarsAcc.showOpenButtonOnMap end,
              setFunc = function(value) Teleporter.savedVarsAcc.showOpenButtonOnMap = value end,
			  default = Teleporter.DefaultsAccount["showOpenButtonOnMap"],
			  submenu = "ui",
         },
		 {
              type = "slider",
              name = SI.get(SI.TELE_SETTINGS_SCALE),
			  tooltip = SI.get(SI.TELE_SETTINGS_SCALE_TOOLTIP) .. " [DEFAULT: " .. Teleporter.DefaultsAccount["Scale"] .. "]",
			  min = 0.7,
			  max = 1.4,
			  step = 0.05,
			  decimals = 2,
			  requiresReload = true,
              getFunc = function() return Teleporter.savedVarsAcc.Scale end,
              setFunc = function(value) Teleporter.savedVarsAcc.Scale = value end,
			  default = Teleporter.DefaultsAccount["Scale"],
			  submenu = "ui",
         },
		 {
              type = "slider",
              name = SI.get(SI.TELE_SETTINGS_CHAT_BUTTON_OFFSET),
              tooltip = SI.get(SI.TELE_SETTINGS_CHAT_BUTTON_OFFSET_TOOLTIP) .. " [DEFAULT: " .. Teleporter.DefaultsAccount["chatButtonHorizontalOffset"] .. "]",
              min = 0,
              max = 200,
              getFunc = function() return Teleporter.savedVarsAcc.chatButtonHorizontalOffset end,
              setFunc = function(value) Teleporter.savedVarsAcc.chatButtonHorizontalOffset = value
							Teleporter.chatButtonTex:SetAnchor(TOPRIGHT, ZO_ChatWindow, TOPRIGHT, -40 - Teleporter.savedVarsAcc.chatButtonHorizontalOffset, 6)
						end,
			  default = Teleporter.DefaultsAccount["chatButtonHorizontalOffset"],
			  submenu = "ui",
         },
		 {
              type = "slider",
              name = SI.get(SI.TELE_SETTINGS_MAP_DOCK_OFFSET_HORIZONTAL),
              tooltip = SI.get(SI.TELE_SETTINGS_MAP_DOCK_OFFSET_HORIZONTAL_TOOLTIP) .. " [DEFAULT: " .. Teleporter.DefaultsAccount["anchorMapOffset_x"] .. "]",
			  min = -100,
              max = 100,
              getFunc = function() return Teleporter.savedVarsAcc.anchorMapOffset_x end,
              setFunc = function(value) Teleporter.savedVarsAcc.anchorMapOffset_x = value end,
			  default = Teleporter.DefaultsAccount["anchorMapOffset_x"],
			  submenu = "ui",
         },
		 {
              type = "slider",
              name = SI.get(SI.TELE_SETTINGS_MAP_DOCK_OFFSET_VERTICAL),
			  tooltip = SI.get(SI.TELE_SETTINGS_MAP_DOCK_OFFSET_VERTICAL_TOOLTIP) .. " [DEFAULT: " .. Teleporter.DefaultsAccount["anchorMapOffset_y"] .. "]",
			  min = -150,
			  max = 150,
              getFunc = function() return Teleporter.savedVarsAcc.anchorMapOffset_y end,
              setFunc = function(value) Teleporter.savedVarsAcc.anchorMapOffset_y = value end,
			  default = Teleporter.DefaultsAccount["anchorMapOffset_y"],
			  submenu = "ui",
         },
		 {
              type = "button",
              name = SI.get(SI.TELE_SETTINGS_RESET_UI),
			  tooltip = SI.get(SI.TELE_SETTINGS_RESET_UI_TOOLTIP),
			  func = function() Teleporter.savedVarsAcc.Scale = Teleporter.DefaultsAccount["Scale"]
								Teleporter.savedVarsAcc.chatButtonHorizontalOffset = Teleporter.DefaultsAccount["chatButtonHorizontalOffset"]
								Teleporter.savedVarsAcc.anchorMapOffset_x = Teleporter.DefaultsAccount["anchorMapOffset_x"]
								Teleporter.savedVarsAcc.anchorMapOffset_y = Teleporter.DefaultsAccount["anchorMapOffset_y"]
								Teleporter.savedVarsAcc.pos_MapScene_x = Teleporter.DefaultsAccount["pos_MapScene_x"]
								Teleporter.savedVarsAcc.pos_MapScene_y = Teleporter.DefaultsAccount["pos_MapScene_y"]
								Teleporter.savedVarsAcc.pos_x = Teleporter.DefaultsAccount["pos_x"]
								Teleporter.savedVarsAcc.pos_y = Teleporter.DefaultsAccount["pos_y"]
								Teleporter.savedVarsAcc.anchorOnMap = Teleporter.DefaultsAccount["anchorOnMap"]
								ReloadUI()
						end,
			  width = "half",
			  warning = "This will automatically reload your UI!",
			  submenu = "ui",
         },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_AUTO_REFRESH),
              tooltip = SI.get(SI.TELE_SETTINGS_AUTO_REFRESH_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["autoRefresh"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.autoRefresh end,
              setFunc = function(value) Teleporter.savedVarsAcc.autoRefresh = value end,
			  default = Teleporter.DefaultsAccount["autoRefresh"],
			  submenu = "rec",
         },
		 {
              type = "dropdown",
              name = SI.get(SI.TELE_SETTINGS_SORTING),
              tooltip = SI.get(SI.TELE_SETTINGS_SORTING_TOOLTIP) .. " [DEFAULT: " .. Teleporter.dropdownSortChoices[Teleporter.DefaultsCharacter["sorting"]] .. "]",
			  choices = Teleporter.dropdownSortChoices,
			  choicesValues = Teleporter.dropdownSortValues,
              getFunc = function() return Teleporter.savedVarsChar.sorting end,
			  setFunc = function(value) Teleporter.savedVarsChar.sorting = value end,
			  default = Teleporter.DefaultsCharacter["sorting"],
			  warning = SI.get(SI.TELE_SETTINGS_INFO_CHARACTER_DEPENDING),
			  submenu = "rec",
        },
         {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_SHOW_NUMBER_PLAYERS),
              tooltip = SI.get(SI.TELE_SETTINGS_SHOW_NUMBER_PLAYERS_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["showNumberPlayers"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.showNumberPlayers end,
              setFunc = function(value) Teleporter.savedVarsAcc.showNumberPlayers = value end,
			  default = Teleporter.DefaultsAccount["showNumberPlayers"],
			  submenu = "rec",
		 },
         {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_SEARCH_CHARACTERNAMES),
              tooltip = SI.get(SI.TELE_SETTINGS_SEARCH_CHARACTERNAMES_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["searchCharacterNames"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.searchCharacterNames end,
              setFunc = function(value) Teleporter.savedVarsAcc.searchCharacterNames = value end,
			  default = Teleporter.DefaultsAccount["searchCharacterNames"],
			  submenu = "rec",
		 },		 
         {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_ZONE_ONCE_ONLY),
              tooltip = SI.get(SI.TELE_SETTINGS_ZONE_ONCE_ONLY_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["zoneOnceOnly"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.zoneOnceOnly end,
              setFunc = function(value) Teleporter.savedVarsAcc.zoneOnceOnly = value end,
			  default = Teleporter.DefaultsAccount["zoneOnceOnly"],
			  submenu = "rec",
		 },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_CURRENT_ZONE_ALWAYS_TOP),
              tooltip = SI.get(SI.TELE_SETTINGS_CURRENT_ZONE_ALWAYS_TOP_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["currentZoneAlwaysTop"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.currentZoneAlwaysTop end,
              setFunc = function(value) Teleporter.savedVarsAcc.currentZoneAlwaysTop = value end,
			  default = Teleporter.DefaultsAccount["currentZoneAlwaysTop"],
			  submenu = "rec",
		 },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_FORMAT_ZONE_NAME),
              tooltip = SI.get(SI.TELE_SETTINGS_FORMAT_ZONE_NAME_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["formatZoneName"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.formatZoneName end,
              setFunc = function(value) Teleporter.savedVarsAcc.formatZoneName = value end,
			  default = Teleporter.DefaultsAccount["formatZoneName"],
			  submenu = "rec",
         },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_HOUSE_NICKNAMES),
              tooltip = SI.get(SI.TELE_SETTINGS_HOUSE_NICKNAMES_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["houseNickNames"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.houseNickNames end,
              setFunc = function(value) Teleporter.savedVarsAcc.houseNickNames = value end,
			  default = Teleporter.DefaultsAccount["houseNickNames"],
			  submenu = "rec",
         },
		 {
              type = "slider",
              name = SI.get(SI.TELE_SETTINGS_AUTO_REFRESH_FREQ),
              tooltip = SI.get(SI.TELE_SETTINGS_AUTO_REFRESH_FREQ_TOOLTIP) .. " [DEFAULT: " .. Teleporter.DefaultsAccount["autoRefreshFreq"] .. "]",
              min = 0,
              max = 15,
              getFunc = function() return Teleporter.savedVarsAcc.autoRefreshFreq end,
              setFunc = function(value) Teleporter.savedVarsAcc.autoRefreshFreq = value end,
			  default = Teleporter.DefaultsAccount["autoRefreshFreq"],
			  submenu = "rec",
         },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_ONLY_MAPS),
              tooltip = SI.get(SI.TELE_SETTINGS_ONLY_MAPS_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["onlyMaps"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.onlyMaps end,
              setFunc = function(value) Teleporter.savedVarsAcc.onlyMaps = value end,
			  default = Teleporter.DefaultsAccount["onlyMaps"],
			  submenu = "bl",
         },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_HIDE_OTHERS),
              tooltip = SI.get(SI.TELE_SETTINGS_HIDE_OTHERS_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["hideOthers"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.hideOthers end,
              setFunc = function(value) Teleporter.savedVarsAcc.hideOthers = value end,
			  disabled = function() return Teleporter.savedVarsAcc.onlyMaps end,
			  default = Teleporter.DefaultsAccount["hideOthers"],
			  submenu = "bl",
         },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_HIDE_PVP),
              tooltip = SI.get(SI.TELE_SETTINGS_HIDE_PVP_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["hidePVP"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.hidePVP end,
              setFunc = function(value) Teleporter.savedVarsAcc.hidePVP = value end,
			  disabled = function() return Teleporter.savedVarsAcc.onlyMaps end,
			  default = Teleporter.DefaultsAccount["hidePVP"],
			  submenu = "bl",
         },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_HIDE_CLOSED_DUNGEONS),
              tooltip = SI.get(SI.TELE_SETTINGS_HIDE_CLOSED_DUNGEONS_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["hideClosedDungeons"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.hideClosedDungeons end,
              setFunc = function(value) Teleporter.savedVarsAcc.hideClosedDungeons = value end,
			  disabled = function() return Teleporter.savedVarsAcc.onlyMaps end,
			  default = Teleporter.DefaultsAccount["hideClosedDungeons"],
			  submenu = "bl",
         },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_HIDE_DELVES),
              tooltip = SI.get(SI.TELE_SETTINGS_HIDE_DELVES_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["hideDelves"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.hideDelves end,
              setFunc = function(value) Teleporter.savedVarsAcc.hideDelves = value end,
			  disabled = function() return Teleporter.savedVarsAcc.onlyMaps end,
			  default = Teleporter.DefaultsAccount["hideDelves"],
			  submenu = "bl",
         },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_HIDE_PUBLIC_DUNGEONS),
              tooltip = SI.get(SI.TELE_SETTINGS_HIDE_PUBLIC_DUNGEONS_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["hidePublicDungeons"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.hidePublicDungeons end,
              setFunc = function(value) Teleporter.savedVarsAcc.hidePublicDungeons = value end,
			  disabled = function() return Teleporter.savedVarsAcc.onlyMaps end,
			  default = Teleporter.DefaultsAccount["hidePublicDungeons"],
			  submenu = "bl",
         },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_HIDE_HOUSES),
              tooltip = SI.get(SI.TELE_SETTINGS_HIDE_HOUSES_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["hideHouses"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.hideHouses end,
              setFunc = function(value) Teleporter.savedVarsAcc.hideHouses = value end,
			  disabled = function() return Teleporter.savedVarsAcc.onlyMaps end,
			  default = Teleporter.DefaultsAccount["hideHouses"],
			  submenu = "bl",
         },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_HIDE_OWN_HOUSES),
              tooltip = SI.get(SI.TELE_SETTINGS_HIDE_OWN_HOUSES_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["hideOwnHouses"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.hideOwnHouses end,
              setFunc = function(value) Teleporter.savedVarsAcc.hideOwnHouses = value end,
			  default = Teleporter.DefaultsAccount["hideOwnHouses"],
			  submenu = "bl",
         },
		 {
              type = "description",
              text = SI.get(SI.TELE_SETTINGS_PRIORITIZATION_DESCRIPTION),
			  submenu = "prio",
         },
         {
              type = "dropdown",
			  width = "half",
              name = "PRIO 1",
              tooltip = "",
			  choices = Teleporter.dropdownPrioSourceChoices,
			  choicesValues = Teleporter.dropdownPrioSourceValues,
              getFunc = function() return Teleporter.savedVarsServ.prioritizationSource[1] end,
			  setFunc = function(value)
				-- swap positions
				local index = Teleporter.getIndexFromValue(Teleporter.savedVarsServ.prioritizationSource, value)
				Teleporter.savedVarsServ.prioritizationSource[index] = Teleporter.savedVarsServ.prioritizationSource[1]
				Teleporter.savedVarsServ.prioritizationSource[1] = value
			  end,
			  default = Teleporter.DefaultsServer["prioritizationSource"][1],
			  submenu = "prio",
        },
		{
              type = "dropdown",
			  width = "half",
              name = "PRIO 2",
              tooltip = "",
			  choices = Teleporter.dropdownPrioSourceChoices,
			  choicesValues = Teleporter.dropdownPrioSourceValues,
              getFunc = function() return Teleporter.savedVarsServ.prioritizationSource[2] end,
			  setFunc = function(value)
				-- swap positions
				local index = Teleporter.getIndexFromValue(Teleporter.savedVarsServ.prioritizationSource, value)
				Teleporter.savedVarsServ.prioritizationSource[index] = Teleporter.savedVarsServ.prioritizationSource[2]
				Teleporter.savedVarsServ.prioritizationSource[2] = value
			  end,
			  disabled = function()
				if #Teleporter.dropdownPrioSourceValues >= 2 then
					return false
				else
					return true
				end
			  end,
			  default = Teleporter.DefaultsServer["prioritizationSource"][2],
			  submenu = "prio",
        },
		{
              type = "dropdown",
			  width = "half",
              name = "PRIO 3",
              tooltip = "",
			  choices = Teleporter.dropdownPrioSourceChoices,
			  choicesValues = Teleporter.dropdownPrioSourceValues,
              getFunc = function() return Teleporter.savedVarsServ.prioritizationSource[3] end,
			  setFunc = function(value)
			  	-- swap positions
				local index = Teleporter.getIndexFromValue(Teleporter.savedVarsServ.prioritizationSource, value)
				Teleporter.savedVarsServ.prioritizationSource[index] = Teleporter.savedVarsServ.prioritizationSource[3]
				Teleporter.savedVarsServ.prioritizationSource[3] = value
			  end,
			  disabled = function()
				if #Teleporter.dropdownPrioSourceValues >= 3 then
					return false
				else
					return true
				end
			  end,
			  default = Teleporter.DefaultsServer["prioritizationSource"][3],
			  submenu = "prio",
        },
		{
              type = "dropdown",
			  width = "half",
              name = "PRIO 4",
              tooltip = "",
			  choices = Teleporter.dropdownPrioSourceChoices,
			  choicesValues = Teleporter.dropdownPrioSourceValues,
              getFunc = function() return Teleporter.savedVarsServ.prioritizationSource[4] end,
			  setFunc = function(value)
				-- swap positions
				local index = Teleporter.getIndexFromValue(Teleporter.savedVarsServ.prioritizationSource, value)
				Teleporter.savedVarsServ.prioritizationSource[index] = Teleporter.savedVarsServ.prioritizationSource[4]
				Teleporter.savedVarsServ.prioritizationSource[4] = value
			  end,
			  disabled = function()
				if #Teleporter.dropdownPrioSourceValues >= 4 then
					return false
				else
					return true
				end
			  end,
			  default = Teleporter.DefaultsServer["prioritizationSource"][4],
			  submenu = "prio",
        },
		{
              type = "dropdown",
			  width = "half",
              name = "PRIO 5",
              tooltip = "",
			  choices = Teleporter.dropdownPrioSourceChoices,
			  choicesValues = Teleporter.dropdownPrioSourceValues,
              getFunc = function() return Teleporter.savedVarsServ.prioritizationSource[5] end,
			  setFunc = function(value)
			  			  	-- swap positions
				local index = Teleporter.getIndexFromValue(Teleporter.savedVarsServ.prioritizationSource, value)
				Teleporter.savedVarsServ.prioritizationSource[index] = Teleporter.savedVarsServ.prioritizationSource[5]
				Teleporter.savedVarsServ.prioritizationSource[5] = value
			  end,
			  disabled = function()
				if #Teleporter.dropdownPrioSourceValues >= 5 then
					return false
				else
					return true
				end
			  end,
			  default = Teleporter.DefaultsServer["prioritizationSource"][5],
			  submenu = "prio",
        },
		{
              type = "dropdown",
			  width = "half",
              name = "PRIO 6",
              tooltip = "",
			  choices = Teleporter.dropdownPrioSourceChoices,
			  choicesValues = Teleporter.dropdownPrioSourceValues,
              getFunc = function() return Teleporter.savedVarsServ.prioritizationSource[6] end,
			  setFunc = function(value)
			  	-- swap positions
				local index = Teleporter.getIndexFromValue(Teleporter.savedVarsServ.prioritizationSource, value)
				Teleporter.savedVarsServ.prioritizationSource[index] = Teleporter.savedVarsServ.prioritizationSource[6]
				Teleporter.savedVarsServ.prioritizationSource[6] = value
			  end,
			  disabled = function()
				if #Teleporter.dropdownPrioSourceValues >= 6 then
					return false
				else
					return true
				end
			  end,
			  default = Teleporter.DefaultsServer["prioritizationSource"][6],
			  submenu = "prio",
        },
         {
              type = "dropdown",
              name = SI.get(SI.TELE_SETTINGS_SECOND_SEARCH_LANGUAGE),
              tooltip = SI.get(SI.TELE_SETTINGS_SECOND_SEARCH_LANGUAGE_TOOLTIP) .. " [DEFAULT: " .. Teleporter.dropdownSecLangChoices[Teleporter.DefaultsAccount["secondLanguage"]] .. "]",
			  choices = Teleporter.dropdownSecLangChoices,
			  choicesValues = Teleporter.dropdownSecLangValues,
              getFunc = function() return Teleporter.savedVarsAcc.secondLanguage end,
			  setFunc = function(value) Teleporter.savedVarsAcc.secondLanguage = value end,
			  default = Teleporter.DefaultsAccount["secondLanguage"],
			  submenu = "adv",
        },
		 {
              type = "divider",
			  submenu = "adv",
         },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_NOTIFICATION_PLAYER_FAVORITE_ONLINE),
              tooltip = SI.get(SI.TELE_SETTINGS_NOTIFICATION_PLAYER_FAVORITE_ONLINE_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["FavoritePlayerStatusNotification"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.FavoritePlayerStatusNotification end,
              setFunc = function(value) Teleporter.savedVarsAcc.FavoritePlayerStatusNotification = value end,
			  default = Teleporter.DefaultsAccount["FavoritePlayerStatusNotification"],
			  requiresReload = true,
			  submenu = "adv",
         },
		 {
              type = "divider",
			  submenu = "adv",
         },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_SURVEY_MAP_NOTIFICATION),
              tooltip = SI.get(SI.TELE_SETTINGS_SURVEY_MAP_NOTIFICATION_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["surveyMapsNotification"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.surveyMapsNotification end,
              setFunc = function(value) Teleporter.savedVarsAcc.surveyMapsNotification = value end,
			  default = Teleporter.DefaultsAccount["surveyMapsNotification"],
			  requiresReload = true,
			  width = "half",
			  submenu = "adv",
         },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_SURVEY_MAP_NOTIFICATION_SOUND),
              tooltip = SI.get(SI.TELE_SETTINGS_SURVEY_MAP_NOTIFICATION_SOUND_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["surveyMapsNotificationSound"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.surveyMapsNotificationSound end,
              setFunc = function(value) Teleporter.savedVarsAcc.surveyMapsNotificationSound = value end,
			  default = Teleporter.DefaultsAccount["surveyMapsNotificationSound"],
			  disabled = function() return not Teleporter.savedVarsAcc.surveyMapsNotification end,
			  width = "half",
			  submenu = "adv",
         },
		 {
              type = "divider",
			  submenu = "adv",
         },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_AUTO_CONFIRM_WAYSHRINE_TRAVEL),
              tooltip = SI.get(SI.TELE_SETTINGS_AUTO_CONFIRM_WAYSHRINE_TRAVEL_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["wayshrineTravelAutoConfirm"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.wayshrineTravelAutoConfirm end,
              setFunc = function(value) Teleporter.savedVarsAcc.wayshrineTravelAutoConfirm = value end,
			  default = Teleporter.DefaultsAccount["wayshrineTravelAutoConfirm"],
			  requiresReload = true,
			  submenu = "adv",
         },
		 {
              type = "divider",
			  submenu = "adv",
         },
		 {
              type = "checkbox",
              name = SI.get(SI.TELE_SETTINGS_OFFLINE_NOTE),
              tooltip = SI.get(SI.TELE_SETTINGS_OFFLINE_NOTE_TOOLTIP) .. " [DEFAULT: " .. tostring(Teleporter.DefaultsAccount["showOfflineReminder"]) .. "]",
              getFunc = function() return Teleporter.savedVarsAcc.showOfflineReminder end,
              setFunc = function(value) Teleporter.savedVarsAcc.showOfflineReminder = value end,
			  default = Teleporter.DefaultsAccount["showOfflineReminder"],
			  requiresReload = true,
			  submenu = "adv",
         },
		 {
              type = "divider",
			  submenu = "adv",
         },
		 {
              type = "button",
              name = teleporterVars.color.colRed .. SI.get(SI.TELE_SETTINGS_RESET_ALL_COUNTERS),
			  tooltip = SI.get(SI.TELE_SETTINGS_RESET_ALL_COUNTERS_TOOLTIP),
			  func = function() for zoneId, _ in pairs(Teleporter.savedVarsAcc.portCounterPerZone) do
									Teleporter.savedVarsAcc.portCounterPerZone[zoneId] = nil
								end
								d("[" .. Teleporter.var.appNameAbbr .. "]: " .. "ALL COUNTERS RESETTET!")
						end,
			  width = "half",
			  warning = "All zone counters are reset. Therefore, the sorting by most used and your personal statistics are reset.",
			  submenu = "adv",
         },
	     {
              type = "description",
              text = "Port to specific zone\n(Hint: when you start typing /<zone name> the Addons suggestion will also appears on top)\n" .. teleporterVars.color.colLegendary .. "/bmutp/<zone name>|r\n" .. teleporterVars.color.colGray .. "Example: /bmutp/deshaan",
			  submenu = "cc",
         },
	     {
              type = "description",
              text = "Port to group leader\n" .. teleporterVars.color.colLegendary .. "/bmutp/leader|r",
			  submenu = "cc",
         },
	     {
              type = "description",
              text = "Port to own primary residence\n" .. teleporterVars.color.colLegendary .. "/bmutp/house|r",
			  submenu = "cc",
         },
	     {
              type = "description",
              text = "Port to currently focused quest\n" .. teleporterVars.color.colLegendary .. "/bmutp/quest|r",
			  submenu = "cc",
         },
		 {
              type = "divider",
			  submenu = "cc",
         },
	     {
              type = "description",
              text = "Add player favorite manually\n" .. teleporterVars.color.colLegendary .. "/bmu/favorites/add/player <player name> <fav slot>|r\n" .. teleporterVars.color.colGray .. "Example: /bmu/favorites/add/player @DeadSoon 1",
			  submenu = "cc",
         },
	     {
              type = "description",
              text = "Add zone favorite manually\n" .. teleporterVars.color.colLegendary .. "/bmu/favorites/add/zone <zoneId> <fav slot>|r\n" .. teleporterVars.color.colGray .. "Example: /bmu/favorites/add/zone 57 1",
			  submenu = "cc",
         },
	     {
              type = "description",
              text = "Get current zoneId (where the player actually is)\n" .. teleporterVars.color.colLegendary .. "/bmu/misc/current_zone_id|r",
			  submenu = "cc",
         },
		 {
              type = "divider",
			  submenu = "cc",
         },
	     {
              type = "description",
              text = "Promote BeamMeUp by printing short advertising text in the chat\n" .. teleporterVars.color.colLegendary .. "/bmu/advertise|r",
			  submenu = "cc",
         },
		 {
              type = "divider",
			  submenu = "cc",
         },
	     {
              type = "description",
              text = "Start custom vote in group (100% are necessary)\n" .. teleporterVars.color.colLegendary .. "/bmu/vote/custom_vote_unanimous <your text>|r\n" .. teleporterVars.color.colGray .. "Example: /bmu/vote/custom_vote_unanimous Do you like BeamMeUp?",
			  submenu = "cc",
         },
	     {
              type = "description",
              text = "Start custom vote in group (>=60% are necessary)\n" .. teleporterVars.color.colLegendary .. "/bmu/vote/custom_vote_supermajority <your text>|r",
			  submenu = "cc",
         },
	     {
              type = "description",
              text = "Start custom vote in group (>50% are necessary)\n" .. teleporterVars.color.colLegendary .. "/bmu/vote/custom_vote_simplemajority <your text>|r",
			  submenu = "cc",
         },
		 {
              type = "divider",
			  submenu = "cc",
         },
	     {
              type = "description",
              text = SI.get(SI.TELE_SETTINGS_INSTALLED_SCINCE),
			  width = "half",
			  submenu = "stats",
         },
	     {
              type = "description",
              text = tostring(os.date('%Y/%m/%d', Teleporter.savedVarsAcc.initialTimeStamp)),
			  width = "half",
			  submenu = "stats",
         },
	     {
              type = "description",
              text = SI.get(SI.TELE_UI_TOTAL_PORTS),
			  width = "half",
			  submenu = "stats",
         },
	     {
              type = "description",
              text = Teleporter.formatGold(Teleporter.savedVarsAcc.totalPortCounter),
			  width = "half",
			  submenu = "stats",
         },
	     {
              type = "description",
              text = SI.get(SI.TELE_UI_GOLD),
			  width = "half",
			  submenu = "stats",
         },
	     {
              type = "description",
              text = Teleporter.formatGold(Teleporter.savedVarsAcc.savedGold),
			  width = "half",
			  submenu = "stats",
         },
	     {
              type = "description",
              text = SI.get(SI.TELE_SETTINGS_MOST_PORTED_ZONES),
			  width = "half",
			  submenu = "stats",
         },
	     {
              type = "description",
              text = mostPortedZonesText,
			  width = "half",
			  submenu = "stats",
         },
    }
	
	--LAM2:RegisterOptionControls(appName .. "Options", optionsData)
	
	-- group options by submenu
	local optionsBySubmenu = {}
	for _, option in ipairs(optionsData) do
		if option.submenu ~= nil then
			if optionsBySubmenu[option.submenu] == nil then
				optionsBySubmenu[option.submenu] = {}
			end
			table.insert(optionsBySubmenu[option.submenu], option)
		end
	end
	
	-- create submenus
	local submenu1 = {
		type = "submenu",
		name = SI.get(SI.TELE_SETTINGS_HEADER_UI),
		controls = optionsBySubmenu["ui"],
	}
	local submenu2 = {
		type = "submenu",
		name = SI.get(SI.TELE_SETTINGS_HEADER_RECORDS),
		controls = optionsBySubmenu["rec"],
	}
	local submenu3 = {
		type = "submenu",
		name = SI.get(SI.TELE_SETTINGS_HEADER_BLACKLISTING),
		controls = optionsBySubmenu["bl"],
	}
	local submenu4 = {
		type = "submenu",
		name = SI.get(SI.TELE_SETTINGS_HEADER_PRIO),
		controls = optionsBySubmenu["prio"],
	}
	local submenu5 = {
		type = "submenu",
		name = SI.get(SI.TELE_SETTINGS_HEADER_ADVANCED),
		controls = optionsBySubmenu["adv"],
	}
	local submenu6 = {
		type = "submenu",
		name = SI.get(SI.TELE_SETTINGS_HEADER_CHAT_COMMANDS),
		controls = optionsBySubmenu["cc"],
	}
	local submenu7 = {
		type = "submenu",
		name = SI.get(SI.TELE_SETTINGS_HEADER_STATS),
		controls = optionsBySubmenu["stats"],
	}
	
	-- register all submenus with options
	LAM2:RegisterOptionControls(appName .. "Options", {submenu1, submenu2, submenu3, submenu4, submenu5, submenu6, submenu7})
	
end


local function SetupUI()
	-----------------------------------------------
	-- Fonts
	
	-- default font
	local fontSize = Teleporter.round(17*Teleporter.savedVarsAcc.Scale, 0)
	local fontStyle = ZoFontGame:GetFontInfo()
	local fontWeight = "soft-shadow-thin"
	Teleporter.font1 = string.format("%s|$(KB_%s)|%s", fontStyle, fontSize, fontWeight)
	
	-- font of statistics
	fontSize = Teleporter.round(13*Teleporter.savedVarsAcc.Scale, 0)
	fontStyle = ZoFontBookTablet:GetFontInfo()
	--fontStyle = "EsoUI/Common/Fonts/consola.ttf"
	fontWeight = "soft-shadow-thin"
	Teleporter.font2 = string.format("%s|$(KB_%s)|%s", fontStyle, fontSize, fontWeight)
	
	-----------------------------------------------
    local teleporterWin = Teleporter.win

    -----------------------------------------------
	-- Button on Chat Window
	
	-- Texture
	Teleporter.chatButtonTex = wm:CreateControl(nil, ZO_ChatWindow, CT_TEXTURE)
	Teleporter.chatButtonTex:SetDimensions(33, 33)
	Teleporter.chatButtonTex:SetAnchor(TOPRIGHT, ZO_ChatWindow, TOPRIGHT, -40 - Teleporter.savedVarsAcc.chatButtonHorizontalOffset, 6)
	Teleporter.chatButtonTex:SetTexture(Teleporter.textures.wayshrineBtn)
	Teleporter.chatButtonTex:SetMouseEnabled(true)
	--Handlers
	Teleporter.chatButtonTex:SetHandler("OnMouseUp", function()
		Teleporter.OpenTeleporter(true)
	end)
	
	Teleporter.chatButtonTex:SetHandler("OnMouseEnter", function(self)
		Teleporter.chatButtonTex:SetTexture(Teleporter.textures.wayshrineBtnOver)
		Teleporter:tooltipTextEnter(Teleporter.chatButtonTex, appName)
	end)
  
	Teleporter.chatButtonTex:SetHandler("OnMouseExit", function(self)
		Teleporter.chatButtonTex:SetTexture(Teleporter.textures.wayshrineBtn)
		Teleporter:tooltipTextEnter(Teleporter.chatButtonTex)
	end)
	
	-----------------------------------------------
	
	-----------------------------------------------
	-- Bandits Integration -> Add custom button to the side bar (with delay to ensure, that BUI is loaded)
	zo_callLater(function()
		if BUI and BUI.PanelAdd then
			local content = {
					{	
						icon = Teleporter.textures.wayshrineBtn,
						tooltip	= Teleporter.var.appName,
						func = function() Teleporter.OpenTeleporter(true) end,
						enabled	= true
					},
					--	{icon="",tooltip="",func=function()end,enabled=true},	-- Button 2, etc.
				}
		
			-- add custom button to side bar (Allowing of custom side bar buttons must be activated in BUI settings)
			BUI.PanelAdd(content)
		end
	end,1000)
	-----------------------------------------------

  --------------------------------------------------------------------------------------------------------------
  --Main Controller. Please notice that teleporterWin comes from our globals variables, as does wm
  -----------------------------------------------------------------------------------------------------------------
  teleporterWin.Main_Control = wm:CreateTopLevelWindow("Teleporter_Location_MainController")

  teleporterWin.Main_Control:SetMouseEnabled(true)
  teleporterWin.Main_Control:SetDimensions(500*Teleporter.savedVarsAcc.Scale,400*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Main_Control:SetHidden(true)

  teleporterWin.appTitle =  wm:CreateControl("Teleporter" .. "_appTitle", teleporterWin.Main_Control, CT_LABEL)
  teleporterWin.appTitle:SetFont(Teleporter.font1)
  teleporterWin.appTitle:SetColor(255, 255, 255, 1)
  teleporterWin.appTitle:SetText(teleporterVars.color.colLegendary .. appName .. teleporterVars.color.colWhite.. " - Teleporter")
  --teleporterWin.appTitle:SetAnchor(TOP, teleporterWin.Main_Control, TOP, -31*Teleporter.savedVarsAcc.Scale, -62*Teleporter.savedVarsAcc.Scale)
  teleporterWin.appTitle:SetAnchor(CENTER, teleporterWin.Main_Control, TOP, nil, -62*Teleporter.savedVarsAcc.Scale)
  
  ----- This is where we create the list element for TeleUnicorn/ List
  TeleporterList = Teleporter.ListView.new(teleporterWin.Main_Control,  {
    width = 750*Teleporter.savedVarsAcc.Scale,
    height = 500*Teleporter.savedVarsAcc.Scale,
  })
  
  ---------

  
    -------------------------------------------------------------------
  -- Switch BUTTON ON ZoneGuide window

  teleporterWin.zoneGuideSwapTexture = wm:CreateControl(nil, ZO_WorldMapZoneStoryTopLevel_Keyboard, CT_TEXTURE)
  teleporterWin.zoneGuideSwapTexture:SetDimensions(50*Teleporter.savedVarsAcc.Scale, 50*Teleporter.savedVarsAcc.Scale)
  teleporterWin.zoneGuideSwapTexture:SetAnchor(TOPRIGHT, ZO_WorldMapZoneStoryTopLevel_Keyboard, TOPRIGHT, TOPRIGHT -10*Teleporter.savedVarsAcc.Scale, -35*Teleporter.savedVarsAcc.Scale)
  teleporterWin.zoneGuideSwapTexture:SetTexture(Teleporter.textures.swapBtn)
  teleporterWin.zoneGuideSwapTexture:SetMouseEnabled(true)
  
  teleporterWin.zoneGuideSwapTexture:SetHandler("OnMouseUp", function()
	  Teleporter.OpenTeleporter(true)
	end)
	  
  teleporterWin.zoneGuideSwapTexture:SetHandler("OnMouseEnter", function(self)
      teleporterWin.zoneGuideSwapTexture:SetTexture(Teleporter.textures.swapBtnOver)
      Teleporter:tooltipTextEnter(teleporterWin.zoneGuideSwapTexture,
          SI.get(SI.TELE_UI_BTN_TOGGLE_ZONE_GUIDE))
  end)

  teleporterWin.zoneGuideSwapTexture:SetHandler("OnMouseExit", function(self)
      teleporterWin.zoneGuideSwapTexture:SetTexture(Teleporter.textures.swapBtn)
      Teleporter:tooltipTextEnter(teleporterWin.zoneGuideSwapTexture)
  end)

  ---------------------------------------------------------------------------------------------------------------
    -------------------------------------------------------------------
  -- Feedback BUTTON

  teleporterWin.feedbackTexture = wm:CreateControl(nil, teleporterWin.Main_Control, CT_TEXTURE)
  teleporterWin.feedbackTexture:SetDimensions(50*Teleporter.savedVarsAcc.Scale, 50*Teleporter.savedVarsAcc.Scale)
  teleporterWin.feedbackTexture:SetAnchor(TOPLEFT, teleporterWin.Main_Control, TOPLEFT, TOPLEFT-35*Teleporter.savedVarsAcc.Scale, -75*Teleporter.savedVarsAcc.Scale)
  teleporterWin.feedbackTexture:SetTexture(Teleporter.textures.feedbackBtn)
  teleporterWin.feedbackTexture:SetMouseEnabled(true)
  
  teleporterWin.feedbackTexture:SetHandler("OnMouseUp", function()
      Teleporter.createMail("@DeadSoon", "Feedback - BeamMeUp", "")
	end)
	  
  teleporterWin.feedbackTexture:SetHandler("OnMouseEnter", function(self)
      teleporterWin.feedbackTexture:SetTexture(Teleporter.textures.feedbackBtnOver)
      Teleporter:tooltipTextEnter(teleporterWin.feedbackTexture,
          SI.get(SI.TELE_UI_BTN_FEEDBACK))
  end)

  teleporterWin.feedbackTexture:SetHandler("OnMouseExit", function(self)
      teleporterWin.feedbackTexture:SetTexture(Teleporter.textures.feedbackBtn)
      Teleporter:tooltipTextEnter(teleporterWin.feedbackTexture)
  end)
  
      -------------------------------------------------------------------
  -- Guild BUTTON
  -- display button only if guilds are available on players game server
	if Teleporter.var.BMUGuilds[GetWorldName()] ~= nil then
		teleporterWin.guildTexture = wm:CreateControl(nil, teleporterWin.Main_Control, CT_TEXTURE)
		teleporterWin.guildTexture:SetDimensions(40*Teleporter.savedVarsAcc.Scale, 40*Teleporter.savedVarsAcc.Scale)
		teleporterWin.guildTexture:SetAnchor(TOPLEFT, teleporterWin.Main_Control, TOPLEFT, TOPLEFT+10*Teleporter.savedVarsAcc.Scale, -75*Teleporter.savedVarsAcc.Scale)
		teleporterWin.guildTexture:SetTexture(Teleporter.textures.guildBtn)
		teleporterWin.guildTexture:SetMouseEnabled(true)
	  
		teleporterWin.guildTexture:SetHandler("OnMouseUp", function(self, button)
			if not Teleporter.isCurrentlyRequestingGuildData then
				Teleporter.requestGuildData()
			end
			Teleporter.clearInputFields()
			zo_callLater(function() Teleporter.createTableGuilds() end, 300)
		end)
			  
		teleporterWin.guildTexture:SetHandler("OnMouseEnter", function(self)
		  teleporterWin.guildTexture:SetTexture(Teleporter.textures.guildBtnOver)
		  Teleporter:tooltipTextEnter(teleporterWin.guildTexture,
			SI.get(SI.TELE_UI_BTN_GUILD_BMU))
		end)

		teleporterWin.guildTexture:SetHandler("OnMouseExit", function(self)
		  Teleporter:tooltipTextEnter(teleporterWin.guildTexture)
		  if Teleporter.state ~= 13 then
			teleporterWin.guildTexture:SetTexture(Teleporter.textures.guildBtn)
		  end
		end)
	end
  
  
      -------------------------------------------------------------------
  -- Guild House BUTTON
  -- display button only if guild house is available on players game server
  if Teleporter.var.guildHouse[GetWorldName()] ~= nil then
	  teleporterWin.guildHouseTexture = wm:CreateControl(nil, teleporterWin.Main_Control, CT_TEXTURE)
	  teleporterWin.guildHouseTexture:SetDimensions(40*Teleporter.savedVarsAcc.Scale, 40*Teleporter.savedVarsAcc.Scale)
	  teleporterWin.guildHouseTexture:SetAnchor(TOPLEFT, teleporterWin.Main_Control, TOPLEFT, TOPLEFT+55*Teleporter.savedVarsAcc.Scale, -75*Teleporter.savedVarsAcc.Scale)
	  teleporterWin.guildHouseTexture:SetTexture(Teleporter.textures.guildHouseBtn)
	  teleporterWin.guildHouseTexture:SetMouseEnabled(true)
  
	  teleporterWin.guildHouseTexture:SetHandler("OnMouseUp", function()
		  Teleporter.portToBMUGuildHouse()
		end)
		  
	  teleporterWin.guildHouseTexture:SetHandler("OnMouseEnter", function(self)
		  teleporterWin.guildHouseTexture:SetTexture(Teleporter.textures.guildHouseBtnOver)
		  Teleporter:tooltipTextEnter(teleporterWin.guildHouseTexture,
			  SI.get(SI.TELE_UI_BTN_GUILD_HOUSE_BMU))
	  end)

	  teleporterWin.guildHouseTexture:SetHandler("OnMouseExit", function(self)
		  teleporterWin.guildHouseTexture:SetTexture(Teleporter.textures.guildHouseBtn)
		  Teleporter:tooltipTextEnter(teleporterWin.guildHouseTexture)
	  end)
  end
  
  
  -------------------------------------------------------------------
	-- Lock/Fix window BUTTON
	local lockTexture

	teleporterWin.fixWindowTexture = wm:CreateControl(nil, teleporterWin.Main_Control, CT_TEXTURE)
	teleporterWin.fixWindowTexture:SetDimensions(50*Teleporter.savedVarsAcc.Scale, 50*Teleporter.savedVarsAcc.Scale)
	teleporterWin.fixWindowTexture:SetAnchor(TOPRIGHT, teleporterWin.Main_Control, TOPRIGHT, TOPRIGHT-65*Teleporter.savedVarsAcc.Scale, -75*Teleporter.savedVarsAcc.Scale)
	-- decide which texture to show
	if Teleporter.savedVarsAcc.fixedWindow == true then
		lockTexture = Teleporter.textures.lockClosedBtn
	else
		lockTexture = Teleporter.textures.lockOpenBtn
	end
	teleporterWin.fixWindowTexture:SetTexture(lockTexture)
	teleporterWin.fixWindowTexture:SetMouseEnabled(true)
 
	teleporterWin.fixWindowTexture:SetHandler("OnMouseUp", function()
		-- change setting
		Teleporter.savedVarsAcc.fixedWindow = not Teleporter.savedVarsAcc.fixedWindow
		-- fix/unfix window
		Teleporter.control_global.bd:SetMovable(not Teleporter.savedVarsAcc.fixedWindow)
		-- change texture
		if Teleporter.savedVarsAcc.fixedWindow then
			-- show closed lock over
			lockTexture = Teleporter.textures.lockClosedBtnOver
		else
			-- show open lock over
			lockTexture = Teleporter.textures.lockOpenBtnOver
		end
		teleporterWin.fixWindowTexture:SetTexture(lockTexture)
	end)
	
	teleporterWin.fixWindowTexture:SetHandler("OnMouseEnter", function(self)
		if Teleporter.savedVarsAcc.fixedWindow then
			-- show closed lock over
			lockTexture = Teleporter.textures.lockClosedBtnOver
		else
			-- show open lock over
			lockTexture = Teleporter.textures.lockOpenBtnOver
		end
		teleporterWin.fixWindowTexture:SetTexture(lockTexture)
		Teleporter:tooltipTextEnter(teleporterWin.fixWindowTexture,SI.get(SI.TELE_UI_BTN_FIX_WINDOW))
	end)

	teleporterWin.fixWindowTexture:SetHandler("OnMouseExit", function(self)
		if Teleporter.savedVarsAcc.fixedWindow then
			-- show closed lock
			lockTexture = Teleporter.textures.lockClosedBtn
		else
			-- show open lock
			lockTexture = Teleporter.textures.lockOpenBtn
		end
		teleporterWin.fixWindowTexture:SetTexture(lockTexture)
		Teleporter:tooltipTextEnter(teleporterWin.fixWindowTexture)
	end)


  ---------------------------------------------------------------------------------------------------------------
  -- ANCHOR BUTTON

  teleporterWin.anchorTexture = wm:CreateControl(nil, teleporterWin.Main_Control, CT_TEXTURE)
  teleporterWin.anchorTexture:SetDimensions(50*Teleporter.savedVarsAcc.Scale, 50*Teleporter.savedVarsAcc.Scale)
  teleporterWin.anchorTexture:SetAnchor(TOPRIGHT, teleporterWin.Main_Control, TOPRIGHT, TOPRIGHT-20*Teleporter.savedVarsAcc.Scale, -75*Teleporter.savedVarsAcc.Scale)
  teleporterWin.anchorTexture:SetTexture(Teleporter.textures.anchorMapBtn)
  teleporterWin.anchorTexture:SetMouseEnabled(true)
  
  teleporterWin.anchorTexture:SetHandler("OnMouseUp", function()
	Teleporter.savedVarsAcc.anchorOnMap = not Teleporter.savedVarsAcc.anchorOnMap
    Teleporter.updatePosition()
  end)
	  
  teleporterWin.anchorTexture:SetHandler("OnMouseEnter", function(self)
	teleporterWin.anchorTexture:SetTexture(Teleporter.textures.anchorMapBtnOver)
      Teleporter:tooltipTextEnter(teleporterWin.anchorTexture,
          SI.get(SI.TELE_UI_BTN_ANCHOR_ON_MAP))
  end)

  teleporterWin.anchorTexture:SetHandler("OnMouseExit", function(self)
	if not Teleporter.savedVarsAcc.anchorOnMap then
		teleporterWin.anchorTexture:SetTexture(Teleporter.textures.anchorMapBtn)
	end
      Teleporter:tooltipTextEnter(teleporterWin.anchorTexture)
  end)

  
  -------------------------------------------------------------------
  -- CLOSE / SWAP BUTTON

  teleporterWin.closeTexture = wm:CreateControl(nil, teleporterWin.Main_Control, CT_TEXTURE)
  teleporterWin.closeTexture:SetDimensions(50*Teleporter.savedVarsAcc.Scale, 50*Teleporter.savedVarsAcc.Scale)
  teleporterWin.closeTexture:SetAnchor(TOPRIGHT, teleporterWin.Main_Control, TOPRIGHT, TOPRIGHT+25*Teleporter.savedVarsAcc.Scale, -75*Teleporter.savedVarsAcc.Scale)
  teleporterWin.closeTexture:SetTexture(Teleporter.textures.closeBtn)
  teleporterWin.closeTexture:SetMouseEnabled(true)

  teleporterWin.closeTexture:SetHandler("OnMouseUp", function()
      Teleporter.HideTeleporter()  end)
	  
  teleporterWin.closeTexture:SetHandler("OnMouseEnter", function(self)
	teleporterWin.closeTexture:SetTexture(Teleporter.textures.closeBtnOver)
      Teleporter:tooltipTextEnter(teleporterWin.closeTexture,
          SI.get(SI.TELECLOSE))
  end)

  teleporterWin.closeTexture:SetHandler("OnMouseExit", function(self)
      Teleporter:tooltipTextEnter(teleporterWin.closeTexture)
  end)


  -------------------------------------------------------------------
  -- OPEN BUTTON ON MAP (upper left corner)
  
	if Teleporter.savedVarsAcc.showOpenButtonOnMap then
		teleporterWin.MapOpen = CreateControlFromVirtual("TeleporterReopenButon", ZO_WorldMap, "ZO_DefaultButton")
		teleporterWin.MapOpen:SetAnchor(TOPLEFT)
		teleporterWin.MapOpen:SetWidth(200)
		teleporterWin.MapOpen:SetText(appName)
		teleporterWin.MapOpen:SetHidden(true)
  
		teleporterWin.MapOpen:SetHandler("OnClicked",function()
			Teleporter.OpenTeleporter(true)
		end)
	end

   ---------------------------------------------------------------------------------------------------------------
   -- Search Symbol (no button)
   
  teleporterWin.SearchTexture = wm:CreateControl(nil, teleporterWin.Main_Control, CT_TEXTURE)
  teleporterWin.SearchTexture:SetDimensions(25*Teleporter.savedVarsAcc.Scale, 25*Teleporter.savedVarsAcc.Scale)
  teleporterWin.SearchTexture:SetAnchor(TOPLEFT, teleporterWin.Main_Control, TOPLEFT, TOPLEFT-35*Teleporter.savedVarsAcc.Scale, -10*Teleporter.savedVarsAcc.Scale)

  teleporterWin.SearchTexture:SetTexture(Teleporter.textures.searchBtn)
  
  ---------------------------------------------------------------------------------------------------------------
  -- Searcher (Search for Players)
  
   teleporterWin.Searcher_Player = CreateControlFromVirtual("Teleporter_SEARCH_EDITBOX",  teleporterWin.Main_Control, "ZO_DefaultEditForBackdrop")
   teleporterWin.Searcher_Player:SetParent(teleporterWin.Main_Control)
   teleporterWin.Searcher_Player:SetSimpleAnchorParent(10*Teleporter.savedVarsAcc.Scale,-10*Teleporter.savedVarsAcc.Scale)
   teleporterWin.Searcher_Player:SetDimensions(105*Teleporter.savedVarsAcc.Scale,25*Teleporter.savedVarsAcc.Scale)
   teleporterWin.Searcher_Player:SetResizeToFitDescendents(false)
   teleporterWin.Searcher_Player:SetFont(Teleporter.font1)

	-- Placeholder
  	teleporterWin.Searcher_Player.Placeholder = wm:CreateControl("Teleporter_SEARCH_EDITBOX_Placeholder", teleporterWin.Searcher_Player, CT_LABEL)
    teleporterWin.Searcher_Player.Placeholder:SetSimpleAnchorParent(4*Teleporter.savedVarsAcc.Scale,0)
	teleporterWin.Searcher_Player.Placeholder:SetFont(Teleporter.font1)
	teleporterWin.Searcher_Player.Placeholder:SetText(teleporterVars.color.colGray .. SI.get(SI.TELE_UI_PLAYER))
    
  -- BackGround
  teleporterWin.SearchBG = wm:CreateControlFromVirtual(" teleporterWin.SearchBG",  teleporterWin.Searcher_Player, "ZO_DefaultBackdrop")
  teleporterWin.SearchBG:ClearAnchors()
  teleporterWin.SearchBG:SetAnchorFill(teleporterWin.Searcher_Player)
  teleporterWin.SearchBG:SetDimensions(teleporterWin.Searcher_Player:GetWidth(),  teleporterWin.Searcher_Player:GetHeight())
  teleporterWin.SearchBG.controlType = CT_CONTROL
  teleporterWin.SearchBG.system = SETTING_TYPE_UI
  teleporterWin.SearchBG:SetHidden(false)
  teleporterWin.SearchBG:SetMouseEnabled(false)
  teleporterWin.SearchBG:SetMovable(false)
  teleporterWin.SearchBG:SetClampedToScreen(true)
  
  -- Handlers
  ZO_PreHookHandler(teleporterWin.Searcher_Player, "OnTextChanged", function(self)
	if self:HasFocus() and (teleporterWin.Searcher_Player:GetText() ~= "" or (teleporterWin.Searcher_Player:GetText() == "" and Teleporter.state == 2)) then
		-- make sure player placeholder is hidden
		teleporterWin.Searcher_Player.Placeholder:SetHidden(true)
		-- clear zone input field
		teleporterWin.Searcher_Zone:SetText("")
		-- show zone placeholder
		teleporterWin.Searcher_Zone.Placeholder:SetHidden(false)
		Teleporter.createTable({index=2, inputString=teleporterWin.Searcher_Player:GetText()})
	end
  end)
  
  teleporterWin.Searcher_Player:SetHandler("OnFocusGained", function(self)
	teleporterWin.Searcher_Player.Placeholder:SetHidden(true)
  end)
  
  teleporterWin.Searcher_Player:SetHandler("OnFocusLost", function(self)
	if teleporterWin.Searcher_Player:GetText() == "" then
		teleporterWin.Searcher_Player.Placeholder:SetHidden(false)
	end
  end)

  ---------------------------------------------------------------------------------------------------------------
  -- Searcher (Search for zones)

  teleporterWin.Searcher_Zone = CreateControlFromVirtual("Teleporter_Searcher_Player_EDITBOX1",  teleporterWin.Main_Control, "ZO_DefaultEditForBackdrop")
  teleporterWin.Searcher_Zone:SetParent(teleporterWin.Main_Control)
  teleporterWin.Searcher_Zone:SetSimpleAnchorParent(140*Teleporter.savedVarsAcc.Scale,-10*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Searcher_Zone:SetDimensions(105*Teleporter.savedVarsAcc.Scale,25*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Searcher_Zone:SetResizeToFitDescendents(false)
  teleporterWin.Searcher_Zone:SetFont(Teleporter.font1)
  
  -- Placeholder
  teleporterWin.Searcher_Zone.Placeholder = wm:CreateControl("TTeleporter_Searcher_Player_EDITBOX1_Placeholder", teleporterWin.Searcher_Zone, CT_LABEL)
  teleporterWin.Searcher_Zone.Placeholder:SetSimpleAnchorParent(4*Teleporter.savedVarsAcc.Scale,0*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Searcher_Zone.Placeholder:SetFont(Teleporter.font1)
  teleporterWin.Searcher_Zone.Placeholder:SetText(teleporterVars.color.colGray .. SI.get(SI.TELE_UI_ZONE))

  -- BG
  teleporterWin.SearchBG_Player = wm:CreateControlFromVirtual(" teleporterWin.SearchBG_Zone",  teleporterWin.Searcher_Zone, "ZO_DefaultBackdrop")
  teleporterWin.SearchBG_Player:ClearAnchors()
  teleporterWin.SearchBG_Player:SetAnchorFill( teleporterWin.Searcher_Zone)
  teleporterWin.SearchBG_Player:SetDimensions( teleporterWin.Searcher_Zone:GetWidth(),  teleporterWin.Searcher_Zone:GetHeight())
  teleporterWin.SearchBG_Player.controlType = CT_CONTROL
  teleporterWin.SearchBG_Player.system = SETTING_TYPE_UI
  teleporterWin.SearchBG_Player:SetHidden(false)
  teleporterWin.SearchBG_Player:SetMouseEnabled(false)
  teleporterWin.SearchBG_Player:SetMovable(false)
  teleporterWin.SearchBG_Player:SetClampedToScreen(true)
  
  -- Handlers
    ZO_PreHookHandler(teleporterWin.Searcher_Zone, "OnTextChanged", function(self)
		if self:HasFocus() and (teleporterWin.Searcher_Zone:GetText() ~= "" or (teleporterWin.Searcher_Zone:GetText() == "" and Teleporter.state == 3)) then
			-- make sure zone placeholder is hidden
			teleporterWin.Searcher_Zone.Placeholder:SetHidden(true)
			-- clear player input field
			teleporterWin.Searcher_Player:SetText("")
			-- show player placeholder
			teleporterWin.Searcher_Player.Placeholder:SetHidden(false)
			Teleporter.createTable({index=3, inputString=teleporterWin.Searcher_Zone:GetText()})
		end
	end)
	
	teleporterWin.Searcher_Zone:SetHandler("OnFocusGained", function(self)
		teleporterWin.Searcher_Zone.Placeholder:SetHidden(true)
	end)
  
	teleporterWin.Searcher_Zone:SetHandler("OnFocusLost", function(self)
		if teleporterWin.Searcher_Zone:GetText() == "" then
			teleporterWin.Searcher_Zone.Placeholder:SetHidden(false)
		end
	end)


  ---------------------------------------------------------------------------------------------------------------
  -- Refresh Button
  
  teleporterWin.Main_Control.RefreshTexture = wm:CreateControl(nil, teleporterWin.Main_Control, CT_TEXTURE)
  teleporterWin.Main_Control.RefreshTexture:SetDimensions(50*Teleporter.savedVarsAcc.Scale, 50*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Main_Control.RefreshTexture:SetAnchor(TOPRIGHT, teleporterWin.Main_Control, TOPRIGHT, -80*Teleporter.savedVarsAcc.Scale, -5*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Main_Control.RefreshTexture:SetTexture(Teleporter.textures.refreshBtn)
  teleporterWin.Main_Control.RefreshTexture:SetMouseEnabled(true)

  teleporterWin.Main_Control.RefreshTexture:SetHandler("OnMouseUp", function(self)
	if Teleporter.state == 0 then
		-- dont reset slider if user stays already on main list
		Teleporter.createTable({index=0, dontResetSlider=true})
	else
		Teleporter.createTable({index=0})
	end
  end)
  
  teleporterWin.Main_Control.RefreshTexture:SetHandler("OnMouseEnter", function(self)
      Teleporter:tooltipTextEnter(teleporterWin.Main_Control.RefreshTexture,
          SI.get(SI.TELE_UI_BTN_REFRESH_ALL))
      teleporterWin.Main_Control.RefreshTexture:SetTexture(Teleporter.textures.refreshBtnOver)end)

  teleporterWin.Main_Control.RefreshTexture:SetHandler("OnMouseExit", function(self)
      Teleporter:tooltipTextEnter(teleporterWin.Main_Control.RefreshTexture)
      teleporterWin.Main_Control.RefreshTexture:SetTexture(Teleporter.textures.refreshBtn)end)


  ---------------------------------------------------------------------------------------------------------------
  -- Unlock wayshrines

  teleporterWin.Main_Control.portalToAllTexture = wm:CreateControl(nil, teleporterWin.Main_Control, CT_TEXTURE)
  teleporterWin.Main_Control.portalToAllTexture:SetDimensions(50*Teleporter.savedVarsAcc.Scale, 50*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Main_Control.portalToAllTexture:SetAnchor(TOPRIGHT, teleporterWin.Main_Control, TOPRIGHT, -40*Teleporter.savedVarsAcc.Scale, -5*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Main_Control.portalToAllTexture:SetTexture(Teleporter.textures.wayshrineBtn2)
  teleporterWin.Main_Control.portalToAllTexture:SetMouseEnabled(true)
  
  teleporterWin.Main_Control.portalToAllTexture:SetHandler("OnMouseUp", function(self)
	Teleporter.dialogAutoUnlock()
  end)
  
  teleporterWin.Main_Control.portalToAllTexture:SetHandler("OnMouseEnter", function(self)
	teleporterWin.Main_Control.portalToAllTexture:SetTexture(Teleporter.textures.wayshrineBtnOver2)
		local tooltipTextCompletion = ""
		if Teleporter.isCurrentMapOverlandZone() then
			--add wayshrine discovery info from ZoneGuide
			local zoneWayhsrineDiscoveryInfo, zoneWayshrineDiscovered, zoneWayshrineTotal = Teleporter.getZoneGuideDiscoveryInfo(GetZoneId(GetUnitZoneIndex("player")), ZONE_COMPLETION_TYPE_WAYSHRINES)
			if zoneWayhsrineDiscoveryInfo ~= nil then
				tooltipTextCompletion = "(" .. zoneWayshrineDiscovered .. "/" .. zoneWayshrineTotal .. ")"
				if zoneWayshrineDiscovered >= zoneWayshrineTotal then
					tooltipTextCompletion = Teleporter.var.color.colGreen .. tooltipTextCompletion
				end
			end
		end
		-- display number of unlocked wayshrines in current zone
		Teleporter:tooltipTextEnter(teleporterWin.Main_Control.portalToAllTexture, SI.get(SI.TELE_UI_BTN_UNLOCK_WS) .. " " .. tooltipTextCompletion)
	end)

  teleporterWin.Main_Control.portalToAllTexture:SetHandler("OnMouseExit", function(self)
	Teleporter.autoUnlockButtonOver = false
	Teleporter:tooltipTextEnter(teleporterWin.Main_Control.portalToAllTexture)
	if not Teleporter.autoUnlockStarted then
		teleporterWin.Main_Control.portalToAllTexture:SetTexture(Teleporter.textures.wayshrineBtn2)
	end
  end)
  
  
  ---------------------------------------------------------------------------------------------------------------
  -- Settings
  
  teleporterWin.Main_Control.SettingsTexture = wm:CreateControl(nil, teleporterWin.Main_Control, CT_TEXTURE)
  teleporterWin.Main_Control.SettingsTexture:SetDimensions(50*Teleporter.savedVarsAcc.Scale, 50*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Main_Control.SettingsTexture:SetAnchor(TOPRIGHT, teleporterWin.Main_Control, TOPRIGHT, 0, -5*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Main_Control.SettingsTexture:SetTexture(Teleporter.textures.settingsBtn)
  teleporterWin.Main_Control.SettingsTexture:SetMouseEnabled(true)

  teleporterWin.Main_Control.SettingsTexture:SetHandler("OnMouseUp", function(self)
	Teleporter.HideTeleporter()
	LAM2:OpenToPanel(Teleporter.SettingsPanel)
  end)
  
  teleporterWin.Main_Control.SettingsTexture:SetHandler("OnMouseEnter", function(self)
      Teleporter:tooltipTextEnter(teleporterWin.Main_Control.SettingsTexture,
          SI.get(SI.TELE_UI_BTN_SETTINGS))
      teleporterWin.Main_Control.SettingsTexture:SetTexture(Teleporter.textures.settingsBtnOver)
  end)

  teleporterWin.Main_Control.SettingsTexture:SetHandler("OnMouseExit", function(self)
      Teleporter:tooltipTextEnter(teleporterWin.Main_Control.SettingsTexture)
      teleporterWin.Main_Control.SettingsTexture:SetTexture(Teleporter.textures.settingsBtn)
  end)
	  

  ---------------------------------------------------------------------------------------------------------------
  -- "Port to Friends House" Integration
  
  teleporterWin.Main_Control.PTFTexture = wm:CreateControl(nil, teleporterWin.Main_Control, CT_TEXTURE)
  teleporterWin.Main_Control.PTFTexture:SetDimensions(50*Teleporter.savedVarsAcc.Scale, 50*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Main_Control.PTFTexture:SetAnchor(TOPRIGHT, teleporterWin.Main_Control, TOPRIGHT, -250*Teleporter.savedVarsAcc.Scale, 40*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Main_Control.PTFTexture:SetTexture(Teleporter.textures.ptfHouseBtn)
  teleporterWin.Main_Control.PTFTexture:SetMouseEnabled(true)
  
	if PortToFriend and PortToFriend.GetFavorites then
		-- enable tab	
		teleporterWin.Main_Control.PTFTexture:SetHandler("OnMouseUp", function()
			Teleporter.clearInputFields()
			Teleporter.createTablePTF()
		end)
  
		teleporterWin.Main_Control.PTFTexture:SetHandler("OnMouseEnter", function(self)
			Teleporter:tooltipTextEnter(teleporterWin.Main_Control.PTFTexture, SI.get(SI.TELE_UI_BTN_PTF_INTEGRATION))
			teleporterWin.Main_Control.PTFTexture:SetTexture(Teleporter.textures.ptfHouseBtnOver)
		end)

		teleporterWin.Main_Control.PTFTexture:SetHandler("OnMouseExit", function(self)
			Teleporter:tooltipTextEnter(teleporterWin.Main_Control.PTFTexture)
			if Teleporter.state ~= 12 then
				teleporterWin.Main_Control.PTFTexture:SetTexture(Teleporter.textures.ptfHouseBtn)
			end
		end)
	else
		-- disable tab
		teleporterWin.Main_Control.PTFTexture:SetAlpha(0.4)
		
		teleporterWin.Main_Control.PTFTexture:SetHandler("OnMouseUp", function()
			Teleporter.showDialog("PTFIntegrationMissing", SI.get(SI.TELE_DIALOG_PTF_INTEGRATION_MISSING_TITLE), SI.get(SI.TELE_DIALOG_PTF_INTEGRATION_MISSING_BODY), function() RequestOpenUnsafeURL("https://www.esoui.com/downloads/info1758-PorttoFriendsHouse.html") end, nil)
		end)
		
		teleporterWin.Main_Control.PTFTexture:SetHandler("OnMouseEnter", function(self)
			Teleporter:tooltipTextEnter(teleporterWin.Main_Control.PTFTexture, SI.get(SI.TELE_UI_BTN_PTF_INTEGRATION))
		end)
		
		teleporterWin.Main_Control.PTFTexture:SetHandler("OnMouseExit", function(self)
			Teleporter:tooltipTextEnter(teleporterWin.Main_Control.PTFTexture)
		end)
	end
	  
  ---------------------------------------------------------------------------------------------------------------
  -- Port to own Residences
  
  teleporterWin.Main_Control.OwnHouseTexture = wm:CreateControl(nil, teleporterWin.Main_Control, CT_TEXTURE)
  teleporterWin.Main_Control.OwnHouseTexture:SetDimensions(50*Teleporter.savedVarsAcc.Scale, 50*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Main_Control.OwnHouseTexture:SetAnchor(TOPRIGHT, teleporterWin.Main_Control, TOPRIGHT, -205*Teleporter.savedVarsAcc.Scale, 40*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Main_Control.OwnHouseTexture:SetTexture(Teleporter.textures.houseBtn)
  teleporterWin.Main_Control.OwnHouseTexture:SetMouseEnabled(true)

  teleporterWin.Main_Control.OwnHouseTexture:SetHandler("OnMouseUp", function()
	Teleporter.clearInputFields()
	Teleporter.createTableHouses()
  end)
  
  teleporterWin.Main_Control.OwnHouseTexture:SetHandler("OnMouseEnter", function(self)
    Teleporter:tooltipTextEnter(teleporterWin.Main_Control.OwnHouseTexture, SI.get(SI.TELE_UI_BTN_PORT_TO_OWN_HOUSE))
    teleporterWin.Main_Control.OwnHouseTexture:SetTexture(Teleporter.textures.houseBtnOver)
  end)

  teleporterWin.Main_Control.OwnHouseTexture:SetHandler("OnMouseExit", function(self)
    Teleporter:tooltipTextEnter(teleporterWin.Main_Control.OwnHouseTexture)
	if Teleporter.state ~= 11 then
		teleporterWin.Main_Control.OwnHouseTexture:SetTexture(Teleporter.textures.houseBtn)
	end
  end)

  
    ---------------------------------------------------------------------------------------------------------------
  -- Related Quests
  
  teleporterWin.Main_Control.QuestTexture = wm:CreateControl(nil, teleporterWin.Main_Control, CT_TEXTURE)
  teleporterWin.Main_Control.QuestTexture:SetDimensions(50*Teleporter.savedVarsAcc.Scale, 50*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Main_Control.QuestTexture:SetAnchor(TOPRIGHT, teleporterWin.Main_Control, TOPRIGHT, -160*Teleporter.savedVarsAcc.Scale, 40*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Main_Control.QuestTexture:SetTexture(Teleporter.textures.questBtn)
  teleporterWin.Main_Control.QuestTexture:SetMouseEnabled(true)

  teleporterWin.Main_Control.QuestTexture:SetHandler("OnMouseUp", function()
	Teleporter.createTable({index=9})
  end)
  
  teleporterWin.Main_Control.QuestTexture:SetHandler("OnMouseEnter", function(self)
    Teleporter:tooltipTextEnter(teleporterWin.Main_Control.QuestTexture, SI.get(SI.TELE_UI_BTN_RELATED_QUESTS))
    teleporterWin.Main_Control.QuestTexture:SetTexture(Teleporter.textures.questBtnOver)
  end)

  teleporterWin.Main_Control.QuestTexture:SetHandler("OnMouseExit", function(self)
    Teleporter:tooltipTextEnter(teleporterWin.Main_Control.QuestTexture)
	if Teleporter.state ~= 9 then
		teleporterWin.Main_Control.QuestTexture:SetTexture(Teleporter.textures.questBtn)
	end
  end)
 
 
 ---------------------------------------------------------------------------------------------------------------
  -- Related Items
  
  teleporterWin.Main_Control.ItemTexture = wm:CreateControl(nil, teleporterWin.Main_Control, CT_TEXTURE)
  teleporterWin.Main_Control.ItemTexture:SetDimensions(50*Teleporter.savedVarsAcc.Scale, 50*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Main_Control.ItemTexture:SetAnchor(TOPRIGHT, teleporterWin.Main_Control, TOPRIGHT, -120*Teleporter.savedVarsAcc.Scale, 40*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Main_Control.ItemTexture:SetTexture(Teleporter.textures.relatedItemsBtn)
  teleporterWin.Main_Control.ItemTexture:SetMouseEnabled(true)

  teleporterWin.Main_Control.ItemTexture:SetHandler("OnMouseUp", function(self, button)
	if button == MOUSE_BUTTON_INDEX_RIGHT then
		-- show filter menu
		ClearMenu()
		local menuIndex = AddCustomMenuItem(SI.get(SI.TELE_UI_TOGGLE_SURVEY_MAP), function() Teleporter.savedVarsChar.displaySurveyMaps = not Teleporter.savedVarsChar.displaySurveyMaps Teleporter.createTable({index=4}) end, MENU_ADD_OPTION_CHECKBOX)
		if Teleporter.savedVarsChar.displaySurveyMaps then
			ZO_CheckButton_SetChecked(ZO_Menu.items[menuIndex].checkbox)
		end
		
		menuIndex = AddCustomMenuItem(SI.get(SI.TELE_UI_TOGGLE_TREASURE_MAP), function() Teleporter.savedVarsChar.displayTreasureMaps = not Teleporter.savedVarsChar.displayTreasureMaps Teleporter.createTable({index=4}) end, MENU_ADD_OPTION_CHECKBOX)
		if Teleporter.savedVarsChar.displayTreasureMaps then
			ZO_CheckButton_SetChecked(ZO_Menu.items[menuIndex].checkbox)
		end
		
		menuIndex = AddCustomMenuItem(SI.get(SI.TELE_UI_TOGGLE_LEADS_MAP), function() Teleporter.savedVarsChar.displayLeads = not Teleporter.savedVarsChar.displayLeads Teleporter.createTable({index=4}) end, MENU_ADD_OPTION_CHECKBOX)
		if Teleporter.savedVarsChar.displayLeads then
			ZO_CheckButton_SetChecked(ZO_Menu.items[menuIndex].checkbox)
		end
		
		-- divider
		AddCustomMenuItem("-", function() end)
		
		menuIndex = AddCustomMenuItem(SI.get(SI.TELE_UI_TOGGLE_INCLUDE_BANK_MAP), function() Teleporter.savedVarsChar.scanBankForMaps = not Teleporter.savedVarsChar.scanBankForMaps Teleporter.createTable({index=4}) end, MENU_ADD_OPTION_CHECKBOX)
		if Teleporter.savedVarsChar.scanBankForMaps then
			ZO_CheckButton_SetChecked(ZO_Menu.items[menuIndex].checkbox)
		end
		ShowMenu()
	else
		Teleporter.createTable({index=4})
		Teleporter.showNotification(true)
	end
  end)
  
  teleporterWin.Main_Control.ItemTexture:SetHandler("OnMouseEnter", function(self)
	-- st tooltip accordingly to the selected filter
	local tooltip = ""
	if Teleporter.savedVarsChar.displaySurveyMaps then
		tooltip = SI.get(SI.TELE_UI_TOGGLE_SURVEY_MAP)
	end
	if Teleporter.savedVarsChar.displayTreasureMaps then
		if tooltip ~= "" then
			tooltip = tooltip .. " + " .. SI.get(SI.TELE_UI_TOGGLE_TREASURE_MAP)
		else
			tooltip = SI.get(SI.TELE_UI_TOGGLE_TREASURE_MAP)
		end
	end
	if Teleporter.savedVarsChar.displayLeads then
		if tooltip ~= "" then
			tooltip = tooltip .. " + " .. SI.get(SI.TELE_UI_TOGGLE_LEADS_MAP)
		else
			tooltip = SI.get(SI.TELE_UI_TOGGLE_LEADS_MAP)
		end
	end
	-- add right-click info
	tooltip = tooltip .. SI.get(SI.TELE_UI_BTN_TOOLTIP_CONTEXT_MENU)
	
	-- show tooltip
    Teleporter:tooltipTextEnter(teleporterWin.Main_Control.ItemTexture, tooltip)
    -- button highlight
	teleporterWin.Main_Control.ItemTexture:SetTexture(Teleporter.textures.relatedItemsBtnOver)
  end)

  teleporterWin.Main_Control.ItemTexture:SetHandler("OnMouseExit", function(self)
    Teleporter:tooltipTextEnter(teleporterWin.Main_Control.ItemTexture)
	if Teleporter.state ~= 4 then
		teleporterWin.Main_Control.ItemTexture:SetTexture(Teleporter.textures.relatedItemsBtn)
	end
  end)


  ---------------------------------------------------------------------------------------------------------------
  -- Only current zone

  teleporterWin.Main_Control.OnlyYourzoneTexture = wm:CreateControl(nil, teleporterWin.Main_Control, CT_TEXTURE)
  teleporterWin.Main_Control.OnlyYourzoneTexture:SetDimensions(50*Teleporter.savedVarsAcc.Scale, 50*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Main_Control.OnlyYourzoneTexture:SetAnchor(TOPRIGHT, teleporterWin.Main_Control, TOPRIGHT, -80*Teleporter.savedVarsAcc.Scale, 40*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Main_Control.OnlyYourzoneTexture:SetTexture(Teleporter.textures.currentZoneBtn)
  teleporterWin.Main_Control.OnlyYourzoneTexture:SetMouseEnabled(true)
  
	teleporterWin.Main_Control.OnlyYourzoneTexture:SetHandler("OnMouseUp", function(self)
		Teleporter.createTable({index=1})
	end)
  
    teleporterWin.Main_Control.OnlyYourzoneTexture:SetHandler("OnMouseEnter", function(self)
		Teleporter:tooltipTextEnter(teleporterWin.Main_Control.OnlyYourzoneTexture, SI.get(SI.TELE_UI_BTN_CURRENT_ZONE))
		teleporterWin.Main_Control.OnlyYourzoneTexture:SetTexture(Teleporter.textures.currentZoneBtnOver)
	end)
	
	teleporterWin.Main_Control.OnlyYourzoneTexture:SetHandler("OnMouseExit", function(self)
		Teleporter:tooltipTextEnter(teleporterWin.Main_Control.OnlyYourzoneTexture)
		if Teleporter.state ~= 1 then
			teleporterWin.Main_Control.OnlyYourzoneTexture:SetTexture(Teleporter.textures.currentZoneBtn)
		end
	end)
	
	
  ---------------------------------------------------------------------------------------------------------------
  -- Delves in current zone
  
  teleporterWin.Main_Control.DelvesTexture = wm:CreateControl(nil, teleporterWin.Main_Control, CT_TEXTURE)
  teleporterWin.Main_Control.DelvesTexture:SetDimensions(50*Teleporter.savedVarsAcc.Scale, 50*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Main_Control.DelvesTexture:SetAnchor(TOPRIGHT, teleporterWin.Main_Control, TOPRIGHT, -40*Teleporter.savedVarsAcc.Scale, 40*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Main_Control.DelvesTexture:SetTexture(Teleporter.textures.delvesBtn)
  teleporterWin.Main_Control.DelvesTexture:SetMouseEnabled(true)

  teleporterWin.Main_Control.DelvesTexture:SetHandler("OnMouseUp", function(self, button)
	if button == MOUSE_BUTTON_INDEX_RIGHT then
		-- show context menu
		ClearMenu()
		local menuIndex = AddCustomMenuItem(SI.get(SI.TELE_UI_TOGGLE_ALL_DELVES), function() Teleporter.savedVarsChar.showAllDelves = not Teleporter.savedVarsChar.showAllDelves Teleporter.createTable({index=5}) end, MENU_ADD_OPTION_CHECKBOX)
		if Teleporter.savedVarsChar.showAllDelves then
			ZO_CheckButton_SetChecked(ZO_Menu.items[menuIndex].checkbox)
		end
		ShowMenu()
	else
		Teleporter.createTable({index=5})
	end
  end)
  
  teleporterWin.Main_Control.DelvesTexture:SetHandler("OnMouseEnter", function(self)
	Teleporter:tooltipTextEnter(teleporterWin.Main_Control.DelvesTexture, SI.get(SI.TELE_UI_BTN_CURRENT_ZONE_DELVES) .. SI.get(SI.TELE_UI_BTN_TOOLTIP_CONTEXT_MENU))
    teleporterWin.Main_Control.DelvesTexture:SetTexture(Teleporter.textures.delvesBtnOver)
  end)

  teleporterWin.Main_Control.DelvesTexture:SetHandler("OnMouseExit", function(self)
    Teleporter:tooltipTextEnter(teleporterWin.Main_Control.DelvesTexture)
	if Teleporter.state ~= 5 then
		teleporterWin.Main_Control.DelvesTexture:SetTexture(Teleporter.textures.delvesBtn)
	end
  end)
  
  
    ---------------------------------------------------------------------------------------------------------------
  -- DUNGEON FINDER
  
  teleporterWin.Main_Control.DungeonTexture = wm:CreateControl(nil, teleporterWin.Main_Control, CT_TEXTURE)
  teleporterWin.Main_Control.DungeonTexture:SetDimensions(50*Teleporter.savedVarsAcc.Scale, 50*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Main_Control.DungeonTexture:SetAnchor(TOPRIGHT, teleporterWin.Main_Control, TOPRIGHT, 0*Teleporter.savedVarsAcc.Scale, 40*Teleporter.savedVarsAcc.Scale)
  teleporterWin.Main_Control.DungeonTexture:SetTexture(Teleporter.textures.soloArenaBtn)
  teleporterWin.Main_Control.DungeonTexture:SetMouseEnabled(true)

  teleporterWin.Main_Control.DungeonTexture:SetHandler("OnMouseUp", function(self, button)
	if button == MOUSE_BUTTON_INDEX_RIGHT then
		-- show filter menu
		ClearMenu()
		-- add filters
		AddCustomSubMenuItem(SI.get(SI.TELE_UI_SUBMENU_FILTER),
			{
				{
					label = SI.get(SI.TELE_UI_TOGGLE_ARENAS),
					callback = function() Teleporter.savedVarsChar.df_showArenas = not Teleporter.savedVarsChar.df_showArenas Teleporter.createTableDungeons() end,
					itemType = MENU_ADD_OPTION_CHECKBOX,
					checked = function() return Teleporter.savedVarsChar.df_showArenas end,
				},
				{
					label = SI.get(SI.TELE_UI_TOGGLE_GROUP_ARENAS),
					callback = function() Teleporter.savedVarsChar.df_showGroupArenas = not Teleporter.savedVarsChar.df_showGroupArenas Teleporter.createTableDungeons() end,
					itemType = MENU_ADD_OPTION_CHECKBOX,
					checked = function() return Teleporter.savedVarsChar.df_showGroupArenas end,
				},
				{
					label = SI.get(SI.TELE_UI_TOGGLE_TRIALS),
					callback = function() Teleporter.savedVarsChar.df_showTrials = not Teleporter.savedVarsChar.df_showTrials Teleporter.createTableDungeons() end,
					itemType = MENU_ADD_OPTION_CHECKBOX,
					checked = function() return Teleporter.savedVarsChar.df_showTrials end,
				},
				{
					label = SI.get(SI.TELE_UI_TOGGLE_GROUP_DUNGEONS),
					callback = function() Teleporter.savedVarsChar.df_showDungeons = not Teleporter.savedVarsChar.df_showDungeons Teleporter.createTableDungeons() end,
					itemType = MENU_ADD_OPTION_CHECKBOX,
					checked = function() return Teleporter.savedVarsChar.df_showDungeons end,
				},
			}
		)
		-- sorting
		local menuIndex = AddCustomMenuItem(SI.get(SI.TELE_UI_TOGGLE_SORT_ACRONYM), function() Teleporter.savedVarsChar.df_sortByAcronym = not Teleporter.savedVarsChar.df_sortByAcronym Teleporter.createTableDungeons() end, MENU_ADD_OPTION_CHECKBOX)
		if Teleporter.savedVarsChar.df_sortByAcronym then
			ZO_CheckButton_SetChecked(ZO_Menu.items[menuIndex].checkbox)
		end
		-- DLC names
		menuIndex = AddCustomMenuItem(SI.get(SI.TELE_UI_TOGGLE_DLC_NAMES), function() Teleporter.savedVarsChar.df_showDLCNames = not Teleporter.savedVarsChar.df_showDLCNames Teleporter.createTableDungeons() end, MENU_ADD_OPTION_CHECKBOX)
		if Teleporter.savedVarsChar.df_showDLCNames then
			ZO_CheckButton_SetChecked(ZO_Menu.items[menuIndex].checkbox)
		end
			
			-- add dungeon difficulty toggle
		if CanPlayerChangeGroupDifficulty() then
			local menuIndex = AddCustomMenuItem(Teleporter.textures.dungeonDifficultyVeteran .. GetString(SI_DUNGEONDIFFICULTY2), function() Teleporter.setDungeonDifficulty(not ZO_ConvertToIsVeteranDifficulty(ZO_GetEffectiveDungeonDifficulty())) zo_callLater(function() Teleporter.createTableDungeons() end, 200) end, MENU_ADD_OPTION_CHECKBOX)
			if ZO_ConvertToIsVeteranDifficulty(ZO_GetEffectiveDungeonDifficulty()) then
				ZO_CheckButton_SetChecked(ZO_Menu.items[menuIndex].checkbox)
			end
		end
		ShowMenu()
	else
		Teleporter.clearInputFields()
		Teleporter.createTableDungeons()
	end
  end)
  
  teleporterWin.Main_Control.DungeonTexture:SetHandler("OnMouseEnter", function(self)
	Teleporter:tooltipTextEnter(teleporterWin.Main_Control.DungeonTexture, SI.get(SI.TELE_UI_BTN_DUNGEON_FINDER) .. SI.get(SI.TELE_UI_BTN_TOOLTIP_CONTEXT_MENU))
    teleporterWin.Main_Control.DungeonTexture:SetTexture(Teleporter.textures.soloArenaBtnOver)
  end)

  teleporterWin.Main_Control.DungeonTexture:SetHandler("OnMouseExit", function(self)
    Teleporter:tooltipTextEnter(teleporterWin.Main_Control.DungeonTexture)
	if Teleporter.state ~= 14 then
		teleporterWin.Main_Control.DungeonTexture:SetTexture(Teleporter.textures.soloArenaBtn)
	end
  end)
	  
end


function Teleporter.updatePosition()
    local teleporterWin     = Teleporter.win
	if SCENE_MANAGER:IsShowing("worldMap") then
	
		-- show anchor button
		teleporterWin.anchorTexture:SetHidden(false)
		-- show swap button
		Teleporter.closeBtnSwitchTexture(true)
		
		if Teleporter.savedVarsAcc.anchorOnMap then
			-- anchor to map
			Teleporter.control_global.bd:ClearAnchors()
			--Teleporter.control_global.bd:SetAnchor(TOPLEFT, ZO_WorldMap, TOPLEFT, Teleporter.savedVarsAcc.anchorMap_x, Teleporter.savedVarsAcc.anchorMap_y)
			Teleporter.control_global.bd:SetAnchor(TOPRIGHT, ZO_WorldMap, TOPLEFT, Teleporter.savedVarsAcc.anchorMapOffset_x, (-70*Teleporter.savedVarsAcc.Scale) + Teleporter.savedVarsAcc.anchorMapOffset_y)
			-- fix position
			Teleporter.control_global.bd:SetMovable(false)
			-- hide fix/unfix button
			teleporterWin.fixWindowTexture:SetHidden(true)
			-- set anchor button texture
			teleporterWin.anchorTexture:SetTexture(Teleporter.textures.anchorMapBtnOver)
		else
			-- use saved pos when map is open
			Teleporter.control_global.bd:ClearAnchors()
			Teleporter.control_global.bd:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, LEFT + Teleporter.savedVarsAcc.pos_MapScene_x, Teleporter.savedVarsAcc.pos_MapScene_y)
			-- set fix/unfix state
			Teleporter.control_global.bd:SetMovable(not Teleporter.savedVarsAcc.fixedWindow)
			-- show fix/unfix button
			teleporterWin.fixWindowTexture:SetHidden(false)
			-- set anchor button texture
			teleporterWin.anchorTexture:SetTexture(Teleporter.textures.anchorMapBtn)
		end
	else
		-- hide anchor button
		teleporterWin.anchorTexture:SetHidden(true)
		-- hide swap button
		Teleporter.closeBtnSwitchTexture(false)
		
		-- use saved pos when map is NOT open
		Teleporter.control_global.bd:ClearAnchors()
		Teleporter.control_global.bd:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, LEFT + Teleporter.savedVarsAcc.pos_x, Teleporter.savedVarsAcc.pos_y)
		-- set fix/unfix state
		Teleporter.control_global.bd:SetMovable(not Teleporter.savedVarsAcc.fixedWindow)
		-- show fix/unfix button
		teleporterWin.fixWindowTexture:SetHidden(false)
	end
end


function Teleporter.closeBtnSwitchTexture(flag)
    local teleporterWin     = Teleporter.win
	if flag then
		-- show swap button
		-- set texture and handlers
		teleporterWin.closeTexture:SetTexture(Teleporter.textures.swapBtn)
		teleporterWin.closeTexture:SetHandler("OnMouseEnter", function(self)
			teleporterWin.closeTexture:SetTexture(Teleporter.textures.swapBtnOver)
			Teleporter:tooltipTextEnter(teleporterWin.closeTexture,
				SI.get(SI.TELE_UI_BTN_TOGGLE_BMU))
		end)
		teleporterWin.closeTexture:SetHandler("OnMouseExit", function(self)
			Teleporter:tooltipTextEnter(teleporterWin.closeTexture)
			teleporterWin.closeTexture:SetTexture(Teleporter.textures.swapBtn)
		end)
		
	else
		-- show normal close button
		-- set textures and handlers
		teleporterWin.closeTexture:SetTexture(Teleporter.textures.closeBtn)
		teleporterWin.closeTexture:SetHandler("OnMouseEnter", function(self)
		teleporterWin.closeTexture:SetTexture(Teleporter.textures.closeBtnOver)
			Teleporter:tooltipTextEnter(teleporterWin.closeTexture,
				SI.get(SI.TELECLOSE))
		end)
		teleporterWin.closeTexture:SetHandler("OnMouseExit", function(self)
			Teleporter:tooltipTextEnter(teleporterWin.closeTexture)
			teleporterWin.closeTexture:SetTexture(Teleporter.textures.closeBtn)
		end)
	end
end


function Teleporter.clearInputFields()
    local teleporterWin = Teleporter.win
	-- Clear Input Field Player
	teleporterWin.Searcher_Player:SetText("")
	-- Show Placeholder
	teleporterWin.Searcher_Player.Placeholder:SetHidden(false)
	-- Clear Input Field Zone
	teleporterWin.Searcher_Zone:SetText("")
	-- Show Placeholder
	teleporterWin.Searcher_Zone.Placeholder:SetHidden(false)
end



-- display the correct persistent MouseOver depending on Button
-- also set global state for auto refresh
function Teleporter.changeState(index)
	if Teleporter.debugMode == 1 then
		-- debug mode
		d("[" .. Teleporter.var.appNameAbbr .. "]: " .. "Changed - state: " .. tostring(index))
	end
    local teleporterWin     = Teleporter.win

	-- first disable all MouseOver
	teleporterWin.Main_Control.ItemTexture:SetTexture(Teleporter.textures.relatedItemsBtn)
	teleporterWin.Main_Control.OnlyYourzoneTexture:SetTexture(Teleporter.textures.currentZoneBtn)
	teleporterWin.Main_Control.DelvesTexture:SetTexture(Teleporter.textures.delvesBtn)
	teleporterWin.SearchTexture:SetTexture(Teleporter.textures.searchBtn)
	teleporterWin.Main_Control.QuestTexture:SetTexture(Teleporter.textures.questBtn)
	teleporterWin.Main_Control.OwnHouseTexture:SetTexture(Teleporter.textures.houseBtn)
	teleporterWin.Main_Control.PTFTexture:SetTexture(Teleporter.textures.ptfHouseBtn)
	teleporterWin.Main_Control.DungeonTexture:SetTexture(Teleporter.textures.soloArenaBtn)
	if teleporterWin.guildTexture then
		teleporterWin.guildTexture:SetTexture(Teleporter.textures.guildBtn)
	end
	
	-- check new state
	if index == 4 then
		-- related Items
		teleporterWin.Main_Control.ItemTexture:SetTexture(Teleporter.textures.relatedItemsBtnOver)
	elseif index == 1 then
		-- current zone
		teleporterWin.Main_Control.OnlyYourzoneTexture:SetTexture(Teleporter.textures.currentZoneBtnOver)
	elseif index == 5 then
		-- current zone delves
		teleporterWin.Main_Control.DelvesTexture:SetTexture(Teleporter.textures.delvesBtnOver)
	elseif index == 2 or index == 3 then
		-- serach by player name or zone name
		teleporterWin.SearchTexture:SetTexture(Teleporter.textures.searchBtnOver)
	elseif index == 9 then
		-- related quests
		teleporterWin.Main_Control.QuestTexture:SetTexture(Teleporter.textures.questBtnOver)
	elseif index == 11 then
		-- own houses
		teleporterWin.Main_Control.OwnHouseTexture:SetTexture(Teleporter.textures.houseBtnOver)
	elseif index == 12 then
		-- PTF houses
		teleporterWin.Main_Control.PTFTexture:SetTexture(Teleporter.textures.ptfHouseBtnOver)
	elseif index == 13 then
		-- guilds
		if teleporterWin.guildTexture then
			teleporterWin.guildTexture:SetTexture(Teleporter.textures.guildBtnOver)
		end
	elseif index == 14 then
		-- dungeon finder
		teleporterWin.Main_Control.DungeonTexture:SetTexture(Teleporter.textures.soloArenaBtnOver)
	end
	
	Teleporter.state = index
end


-- Initialize and show dialogs with libDialog
function Teleporter.showDialog(dialogName, dialogTitle, dialogBody, callbackYes, callbackNo)
	local libDialog = Teleporter.LibDialog
	local forceUpdate = true -- update/re-register every dialog to prevent errors or outdated/wrong dialog callbacks
	local callbackSetup = nil
	local textParams = nil
	local additionalOptions = nil
	--[[
	local additionalOptions = {
		showLoadingIcon = true,
		["buttonData"] = {
			[1] = {
			visible = false,
			text = "Button 1 Text",
			},
			[2] = {
			text = "Button 2 Text",
			}
		},
	}
	--]]
	libDialog:RegisterDialog(Teleporter.var.appName, dialogName, dialogTitle, dialogBody, callbackYes, callbackNo, callbackSetup, forceUpdate, additionalOptions, textParams)
	-- Optional: Add radio buttons
	--libDialog:AddRadioButtons(Teleporter.var.appName, Teleporter.var.appName .. dialogName, radioButtonsParams, "radio1", rb1Data, rb1ClickedCallback, "rb2Text", rb2Data, rb2ClickedCallback, rb3Text, rb3Data, rb3ClickedCallback, rb4Text, rb4Data, rb4ClickedCallback, rb5Text, rb5Data, rb5ClickedCallback)
	
	-- show the dialog
	libDialog:ShowDialog(Teleporter.var.appName, dialogName, nil)
end


function Teleporter.TeleporterSetupUI(addOnName)
	if appName ~= addOnName then return end
		addOnName = appName .. " - Teleporter"
		SetupOptionsMenu(addOnName)
		SetupUI()
end


function Teleporter.journalUpdated()
	Teleporter.questDataChanged = true
end


-- handles event when player clicks on a chat link
	-- 1. for sharing teleport destination to the group (built-in type with drive-by data)
	-- 2. for wayshrine map ping (custom link)
function Teleporter.handleChatLinkClick(rawLink, mouseButton, linkText, linkStyle, linkType, data1, data2, data3, data4) -- can contain more data fields
	local number_to_bool ={ [0]=false, [1]=true }
	-- sharing
	if linkType == "book" then
		local bookId = data1
		local signature = tostring(data2)
		
		-- sharing player
		if signature == "BMU_S_P" then
			local playerFrom = tostring(data3)
			local playerTo = tostring(data4)
			if playerFrom ~= nil and playerTo ~= nil then
				-- try to find the destination player
				local result = Teleporter.createTable({index=2, inputString=playerTo, dontDisplay=true})
				local firstRecord = result[1]
				if firstRecord.displayName == "" then
					-- player not found
					d("[" .. Teleporter.var.appNameAbbr .. "]: " .. playerTo .. " - " .. SI.get(SI.TELE_CHAT_ERROR_WHILE_PORTING))
				else
					d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_SHARING_FOLLOW_LINK))
					Teleporter.PortalToPlayer(firstRecord.displayName, firstRecord.sourceIndexLeading, firstRecord.zoneName, firstRecord.zoneId, firstRecord.category, true, false, true)
				end
				return true
			end
			
		-- sharing house
		elseif signature == "BMU_S_H" then
			local player = tostring(data3)
			local houseId = tonumber(data4)
			if player ~= nil and houseId ~= nil then
				-- try to port to the house of the player
				d("[" .. Teleporter.var.appNameAbbr .. "]: " .. SI.get(SI.TELE_CHAT_SHARING_FOLLOW_LINK))
				JumpToSpecificHouse(player, houseId)
			end
			return true
		end
	
	
	-- custom link (wayshrine map ping)
	elseif linkType == "BMU" then
		local signature = tostring(data1)
		local mapIndex = tonumber(data2)
		local coorX = tonumber(data3)
		local coorY = tonumber(data4)
		
		-- check if link is for map pings
		if signature == "BMU_P" and mapIndex ~= nil and coorX ~= nil and coorY ~= nil then
			-- valid map ping
			-- switch to Tamriel and back to specific map in order to reset any subzone or zoom
			ZO_WorldMap_SetMapByIndex(1)
			ZO_WorldMap_SetMapByIndex(mapIndex)
			-- start ping
			if not SCENE_MANAGER:IsShowing("worldMap") then SCENE_MANAGER:Show("worldMap") end
			PingMap(MAP_PIN_TYPE_RALLY_POINT, MAP_TYPE_LOCATION_CENTERED, coorX, coorY)
		end
		
		-- return true in any case because not handled custom link leads to UI error
		return true
	end
end


-- click on guild button
function Teleporter.redirectToBMUGuild()
	for _, guildId in pairs(Teleporter.var.BMUGuilds[GetWorldName()]) do
		local guildData = GUILD_BROWSER_MANAGER:GetGuildData(guildId)
		if guildId and guildData and guildData.size and guildData.size < 495 then
			ZO_LinkHandler_OnLinkClicked("|H1:guild:" .. guildId .. "|hBeamMeUp Guild|h", 1, nil)
			return
		end
	end
	-- just redirect to latest BMU guild
	ZO_LinkHandler_OnLinkClicked("|H1:guild:" .. Teleporter.var.BMUGuilds[GetWorldName()][#Teleporter.var.BMUGuilds[GetWorldName()]] .. "|hBeamMeUp Guild|h", 1, nil)
end


-------------------------------------------------------------------
-- EXTRAS
-------------------------------------------------------------------

-- Show Notification when favorite player goes online
function Teleporter.FavoritePlayerStatusNotification(eventCode, option1, option2, option3, option4, option5) --GUILD:(eventCode, guildID, displayName, prevStatus, curStatus) FRIEND:(eventCode, displayName, characterName, prevStatus, curStatus)
	local displayName = ""
	local prevStatus = option3
	local curStatus = option4
	
	-- in case of EVENT_GUILD_MEMBER_PLAYER_STATUS_CHANGED first option is guildID instead of displayName
	if eventCode == EVENT_GUILD_MEMBER_PLAYER_STATUS_CHANGED then
		-- EVENT_GUILD_MEMBER_PLAYER_STATUS_CHANGED
		displayName = option2
	else
		-- EVENT_FRIEND_PLAYER_STATUS_CHANGED
		displayName = option1
	end
	
	if Teleporter.savedVarsAcc.FavoritePlayerStatusNotification and Teleporter.isFavoritePlayer(displayName) and prevStatus == 4 and curStatus ~= 4 then
		CENTER_SCREEN_ANNOUNCE:AddMessage(0, CSA_CATEGORY_MAJOR_TEXT, SOUNDS.DEFER_NOTIFICATION, "Favorite Player Switched Status", teleporterVars.color.colLegendary .. displayName .. teleporterVars.color.colWhite .. " " .. SI.get(SI.TELE_CENTERSCREEN_FAVORITE_PLAYER_ONLINE), "esoui/art/mainmenu/menubar_social_up.dds", "EsoUI/Art/Achievements/achievements_iconBG.dds", nil, nil, 4000)
	end
end

--[[
-- Show Note, when player sends a whisper message and is offline -> player cannot receive any whisper messages
function Teleporter.HintOfflineWhisper(eventCode, messageType, from, test, isFromCustomerService, _)
	if Teleporter.savedVarsAcc.HintOfflineWhisper and messageType == CHAT_CHANNEL_WHISPER_SENT and GetPlayerStatus() == PLAYER_STATUS_OFFLINE then
		d("[" .. Teleporter.var.appNameAbbr .. "]: " .. teleporterVars.color.colRed .. SI.get(SI.TELE_CHAT_WHISPER_NOTE))
	end
end
--]]

function Teleporter.surveyMapUsed(bagId, slotIndex, slotData)
	if bagId ~= nil and slotData ~= nil then
		if bagId == BAG_BACKPACK and slotData.specializedItemType == SPECIALIZED_ITEMTYPE_TROPHY_SURVEY_REPORT and not IsBankOpen() then
			-- d("Item Name: " .. Teleporter.formatName(slotData.rawName, false))
			-- d("Anzahl übrig: " .. slotData.stackCount - 1)
			if slotData.stackCount > 1 then
				-- still more available -> Show center screen message
				local sound = nil
				if Teleporter.savedVarsAcc.surveyMapsNotificationSound then
					-- set sound
					sound = SOUNDS.GUILD_WINDOW_OPEN  -- SOUNDS.DUEL_START
				end
				zo_callLater(function()
					CENTER_SCREEN_ANNOUNCE:AddMessage(0, CSA_CATEGORY_MAJOR_TEXT, sound, "Survey Maps Note", string.format(SI.get(SI.TELE_CENTERSCREEN_SURVEY_MAPS), slotData.stackCount-1), "esoui/art/icons/quest_scroll_001.dds", "EsoUI/Art/Achievements/achievements_iconBG.dds", nil, nil, 5000)
				end, 12000)
			end
		end
	end
end


function Teleporter.activateWayshrineTravelAutoConfirm()
		ESO_Dialogs["RECALL_CONFIRM"]={
			gamepadInfo={dialogType=GAMEPAD_DIALOGS.BASIC},
			title={text=SI_PROMPT_TITLE_FAST_TRAVEL_CONFIRM},
			mainText={text=SI_FAST_TRAVEL_DIALOG_MAIN_TEXT},
			updateFn=function(dialog)
					FastTravelToNode(dialog.data.nodeIndex)
					SCENE_MANAGER:ShowBaseScene()
					ZO_Dialogs_ReleaseDialog("RECALL_CONFIRM")
			end
		}
		ESO_Dialogs["FAST_TRAVEL_CONFIRM"]={
			gamepadInfo={dialogType=GAMEPAD_DIALOGS.BASIC},
			title={text=SI_PROMPT_TITLE_FAST_TRAVEL_CONFIRM},
			mainText={text=SI_FAST_TRAVEL_DIALOG_MAIN_TEXT},
			updateFn=function(dialog)
					FastTravelToNode(dialog.data.nodeIndex)
					ZO_Dialogs_ReleaseDialog("FAST_TRAVEL_CONFIRM")
			end
		}
end


--Request all BMU and partner guilds information
function Teleporter.requestGuildData()
	Teleporter.isCurrentlyRequestingGuildData = true
	local guildsQueue = {}
	-- official guilds
	if Teleporter.var.BMUGuilds[GetWorldName()] ~= nil then
		guildsQueue = Teleporter.var.BMUGuilds[GetWorldName()]
	end
	-- partner guilds
	if Teleporter.var.partnerGuilds[GetWorldName()] ~= nil then
		guildsQueue = Teleporter.mergeTables(guildsQueue, Teleporter.var.partnerGuilds[GetWorldName()])
	end

	Teleporter.requestGuildDataRecursive(guildsQueue)
end

-- request all guilds in queue
function Teleporter.requestGuildDataRecursive(guildIds)
	if #guildIds > 0 then
		GUILD_BROWSER_MANAGER:RequestGuildData(table.remove(guildIds))
		zo_callLater(function() Teleporter.requestGuildDataRecursive(guildIds) end, 600)
	else
		Teleporter.isCurrentlyRequestingGuildData = false
	end
end


--------------------------------------------------
-- GUILD ADMINISTRATION TOOL
--------------------------------------------------

function Teleporter.AdminAddContextMenuToGuildRoster()
	-- add context menu to guild roster
	local GuildRosterRow_OnMouseUp = GUILD_ROSTER_KEYBOARD.GuildRosterRow_OnMouseUp --ZO_GuildRecruitment_ApplicationsList_Keyboard.Row_OnMouseUp
	GUILD_ROSTER_KEYBOARD.GuildRosterRow_OnMouseUp = function(self, control, button, upInside)

		local data = ZO_ScrollList_GetData(control)
		GuildRosterRow_OnMouseUp(self, control, button, upInside)
		
		local currentGuildId = GUILD_ROSTER_MANAGER:GetGuildId()
		if (button ~= MOUSE_BUTTON_INDEX_RIGHT --[[and not upInside]]) or data == nil or not Teleporter.AdminIsBMUGuild(currentGuildId) then
			return
		end
		
		local isAlreadyMember, memberStatusText = Teleporter.AdminIsAlreadyInGuild(data.displayName)
		
		local entries = {}
		
		-- welcome message
		table.insert(entries, {label = "Willkommensnachricht",
								callback = function(state)
									local guildId = currentGuildId
									local guildIndex = Teleporter.AdminGetGuildIndexFromGuildId(guildId)
									StartChatInput("Welcome on the bridge " .. data.displayName, _G["CHAT_CHANNEL_GUILD_" .. guildIndex])
								end,
								})
								
		-- new message
		table.insert(entries, {label = "Neue Nachricht",
								callback = function(state) Teleporter.createMail(data.displayName, "", "") d("[" .. Teleporter.var.appNameAbbr .. "]: Nachricht erstellt an: " .. data.displayName) end,
								})
								
		-- copy account name
		table.insert(entries, {label = "Account-ID kopieren",
								callback = function(state) Teleporter.AdminCopyTextToChat(data.displayName) end,
								})
		
		-- invite to BMU guilds
		if Teleporter.var.BMUGuilds[GetWorldName()] ~= nil then
			for _, guildId in pairs(Teleporter.var.BMUGuilds[GetWorldName()]) do
				if IsPlayerInGuild(guildId) and not GetGuildMemberIndexFromDisplayName(guildId, data.displayName) then
					table.insert(entries, {label = "Einladen in: " .. GetGuildName(guildId),
											callback = function(state) Teleporter.AdminInviteToGuilds(guildId, data.displayName) end,
											})
				end
			end
		end
		
		-- invite to partner guilds
		if Teleporter.var.partnerGuilds[GetWorldName()] ~= nil then
			for _, guildId in pairs(Teleporter.var.partnerGuilds[GetWorldName()]) do
				if IsPlayerInGuild(guildId) and not GetGuildMemberIndexFromDisplayName(guildId, data.displayName) then
					table.insert(entries, {label = "Einladen in: " .. GetGuildName(guildId),
											callback = function(state) Teleporter.AdminInviteToGuilds(guildId, data.displayName) end,
											})
				end
			end
		end
		
		-- check if the player is also in other BMU guilds and add info
		table.insert(entries, {label = memberStatusText,
								callback = function(state) end,
								})
		
		AddCustomSubMenuItem("BMU Admin", entries)
		self:ShowMenu(control)
	end
end


function Teleporter.AdminAddContextMenuToGuildApplicationRoster()
	-- add context menu to guild recruitment application roster (if player is already in a one of the BMU guilds + redirection to the other guilds)
	local Row_OnMouseUp = ZO_GuildRecruitment_ApplicationsList_Keyboard.Row_OnMouseUp
	ZO_GuildRecruitment_ApplicationsList_Keyboard.Row_OnMouseUp = function(self, control, button, upInside)

		local data = ZO_ScrollList_GetData(control)
		Row_OnMouseUp(self, control, button, upInside)
	
		local currentGuildId = GUILD_ROSTER_MANAGER:GetGuildId()
		if (button ~= MOUSE_BUTTON_INDEX_RIGHT --[[and not upInside]]) or data == nil or not Teleporter.AdminIsBMUGuild(currentGuildId) then
			return
		end
		
		local isAlreadyMember, memberStatusText = Teleporter.AdminIsAlreadyInGuild(data.name)

		local entries = {}
		
		-- new message
		table.insert(entries, {label = "Neue Nachricht",
								callback = function(state) Teleporter.createMail(data.name, "", "") d("[" .. Teleporter.var.appNameAbbr .. "]: Nachricht erstellt an: " .. data.name) end,
								})
								
		-- copy account name
		table.insert(entries, {label = "Account-ID kopieren",
								callback = function(state) Teleporter.AdminCopyTextToChat(data.name) end,
								})
		
		-- invite to BMU guilds
		if Teleporter.var.BMUGuilds[GetWorldName()] ~= nil then
			for _, guildId in pairs(Teleporter.var.BMUGuilds[GetWorldName()]) do
				if IsPlayerInGuild(guildId) and not GetGuildMemberIndexFromDisplayName(guildId, data.name) then
					table.insert(entries, {label = "Einladen in: " .. GetGuildName(guildId),
											callback = function(state) Teleporter.AdminInviteToGuilds(guildId, data.name) end,
											})
				end
			end
		end
		
		-- invite to partner guilds
		if Teleporter.var.partnerGuilds[GetWorldName()] ~= nil then
			for _, guildId in pairs(Teleporter.var.partnerGuilds[GetWorldName()]) do
				if IsPlayerInGuild(guildId) and not GetGuildMemberIndexFromDisplayName(guildId, data.name) then
					table.insert(entries, {label = "Einladen in: " .. GetGuildName(guildId),
											callback = function(state) Teleporter.AdminInviteToGuilds(guildId, data.name) end,
											})
				end
			end
		end
		
		-- check if the player is also in other BMU guilds and add info
		table.insert(entries, {label = memberStatusText,
								callback = function(state) end,
								})
		
		AddCustomSubMenuItem("BMU Admin", entries)
		self:ShowMenu(control)
	end
end

function Teleporter.AdminAddTooltipInfoToGuildApplicationRoster()
	-- add info to the tooltip in guild recruitment application roster
	local Row_OnMouseEnter = ZO_GuildRecruitment_ApplicationsList_Keyboard.Row_OnMouseEnter
	ZO_GuildRecruitment_ApplicationsList_Keyboard.Row_OnMouseEnter = function(self, control)
		
		local data = ZO_ScrollList_GetData(control)
		local currentGuildId = GUILD_ROSTER_MANAGER:GetGuildId()
		
		if data ~= nil and not data.BMUInfo and Teleporter.AdminIsBMUGuild(currentGuildId) then
			local isAlreadyMember, memberStatusText = Teleporter.AdminIsAlreadyInGuild(data.name)
			data.message = data.message .. "\n\n" .. memberStatusText
			data.BMUInfo = true
		end
	
		Row_OnMouseEnter(self, control)		
	end
end

function Teleporter.AdminGetGuildIndexFromGuildId(guildId)
	for i = 1, GetNumGuilds() do
		if GetGuildId(i) == guildId then
			return i
		end
	end
	return 0
end

function Teleporter.AdminCopyTextToChat(message)
	-- Max of input box is 351 chars
	if string.len(message) < 351 then
		if CHAT_SYSTEM.textEntry:GetText() == "" then
			CHAT_SYSTEM.textEntry:Open(message)
			ZO_ChatWindowTextEntryEditBox:SelectAll()
		end
	end
end

function Teleporter.AdminAutoWelcome(eventCode, guildId, displayName, result)
	-- only for BMU guilds
	if not Teleporter.AdminIsBMUGuild(guildId) then
		return
	end
	
	zo_callLater(function()
		if result == 0 then
			local guildIndex = Teleporter.AdminGetGuildIndexFromGuildId(guildId)
			local totalGuildMembers = GetNumGuildMembers(guildId)
			
			-- find new guild member
			for j = 0, totalGuildMembers do
				local displayName_info, note, guildMemberRankIndex, status, secsSinceLogoff = GetGuildMemberInfo(guildId, j)
				if displayName_info == displayName and status ~= PLAYER_STATUS_OFFLINE then
					-- new guild member is online -> write welcome message to chat
					StartChatInput("Welcome on the bridge " .. displayName, _G["CHAT_CHANNEL_GUILD_" .. guildIndex])
				end
			end
		end
	end, 1300)
end

function Teleporter.AdminIsAlreadyInGuild(displayName)
	local text = ""
	
	if GetGuildMemberIndexFromDisplayName(Teleporter.var.BMUGuilds[GetWorldName()][1], displayName) then
		text = text .. " 1 "
	end
	if GetGuildMemberIndexFromDisplayName(Teleporter.var.BMUGuilds[GetWorldName()][2], displayName) then
		text = text .. " 2 "
	end
	if GetGuildMemberIndexFromDisplayName(Teleporter.var.BMUGuilds[GetWorldName()][3], displayName) then
		text = text .. " 3 "
	end
	if GetGuildMemberIndexFromDisplayName(Teleporter.var.BMUGuilds[GetWorldName()][4], displayName) then
		text = text .. " 4 "
	end
	
	if text ~= "" then
		-- already member
		return true, Teleporter.var.color.colRed .. "Bereits Mitglied in " .. text
	else
		-- not a member or admin is not member of the BMU guilds
		return false, Teleporter.var.color.colGreen .. "Neues Mitglied"
	end
end

function Teleporter.AdminIsBMUGuild(guildId)
	if Teleporter.has_value(Teleporter.var.BMUGuilds[GetWorldName()], guildId) then
		return true
	else
		return false
	end
end

function Teleporter.AdminInviteToGuilds(guildId, displayName)
	-- add tuple to queue
	table.insert(inviteQueue, {guildId, displayName})
	if #inviteQueue == 1 then
		Teleporter.AdminInviteToGuildsQueue()
	end
end

function Teleporter.AdminInviteToGuildsQueue()
	if #inviteQueue > 0 then
		-- get first element and send invite
		local first = inviteQueue[1]
		GuildInvite(first[1], first[2])
		PlaySound(SOUNDS.BOOK_OPEN)
		-- restart to check for other elements
		zo_callLater(function() table.remove(inviteQueue, 1) Teleporter.AdminInviteToGuildsQueue() end, 16000)
	end		
end

function Teleporter.AdminAddAutoFillToDeclineApplicationDialog()
	local font = string.format("%s|$(KB_%s)|%s", ZoFontGame:GetFontInfo(), 21, "soft-shadow-thin")
	-- default message
	local autoFill_1 = WINDOW_MANAGER:CreateControl(nil, ZO_ConfirmDeclineApplicationDialog_Keyboard, CT_LABEL)
	autoFill_1:SetAnchor(TOPRIGHT, ZO_ConfirmDeclineApplicationDialog_Keyboard, TOPRIGHT, -5, 10)
	autoFill_1:SetFont(font)
	autoFill_1:SetText(Teleporter.var.color.colLegendary .. "BMU_AM")
	autoFill_1:SetMouseEnabled(true)
	autoFill_1:SetHandler("OnMouseUp", function(self)
		ZO_ConfirmDeclineApplicationDialog_KeyboardDeclineMessageEdit:SetText("You are already a member of one of our other BMU guilds. Sorry, but we only allow joining one guild. You are welcome to join and support our partner guilds (flag button in the upper left corner).")
	end)
	-- message when player is already in 5 guilds
	local autoFill_2 = WINDOW_MANAGER:CreateControl(nil, ZO_ConfirmDeclineApplicationDialog_Keyboard, CT_LABEL)
	autoFill_2:SetAnchor(TOPRIGHT, ZO_ConfirmDeclineApplicationDialog_Keyboard, TOPRIGHT, -5, 40)
	autoFill_2:SetFont(font)
	autoFill_2:SetText(Teleporter.var.color.colLegendary .. "BMU_5G")
	autoFill_2:SetMouseEnabled(true)
	autoFill_2:SetHandler("OnMouseUp", function(self)
		ZO_ConfirmDeclineApplicationDialog_KeyboardDeclineMessageEdit:SetText("We cannot accpect your application because you have already joined 5 other guilds (which is the maximum). If you want to join us, please submit a new application with free guild slot.")
	end)
end

