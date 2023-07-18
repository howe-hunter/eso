local ADDON_NAME = "ScootworksHUD"
local ADDON_DISPLAY_NAME = "Scootworks HUD"

local LibFoodDrinkBuff = LIB_FOOD_DRINK_BUFF
local LibSavedVars = LibSavedVars

local IsArmorEffectivenessReduced, DoesItemHaveDurability, ZO_Inventory_EnumerateEquipSlots, HasItemInSlot, GetSoulGemItemInfo, GetRepairKitTier = IsArmorEffectivenessReduced, DoesItemHaveDurability, ZO_Inventory_EnumerateEquipSlots, HasItemInSlot, GetSoulGemItemInfo, GetRepairKitTier

local ZO_ONE_MINUTE_IN_SECONDS = ZO_ONE_MINUTE_IN_SECONDS
local UNIT_TAG_PLAYER = "player"
local THRESHOLD_WEAPON_CHARGE = 1 -- in [%]
local THRESHOLD_ARMOR_REPAIR = 1 -- in [%]


-- Indicators
--------------

local HUDIndicator = getmetatable(select(2, next(HUD_EQUIPMENT_STATUS.indicators)))

local FOOD_INDICATOR = "FoodIndicator"
local MOUNT_INDICATOR = "MountIndicator"
local WEAPON_INDICATOR = "WeaponIndicator"
local WEAPON_RECHARGE = "WeaponRecharge"
local ARMOR_INDICATOR = "ArmorIndicator"
local ARMOR_REPAIR = "ArmorRepair"

local DEFAULTS =
{
	[FOOD_INDICATOR] = { enabled = true, announceTimer = 6 },
	[MOUNT_INDICATOR] = { enabled = true },
	[WEAPON_RECHARGE] = { enabled = true },
	[ARMOR_REPAIR] = { enabled = true },
	soundEnabled = true,
	accountWideSettings = true,
}


-- HUDArmorRepair
-----------------

local HUDArmorRepair = ZO_Object:Subclass()

function HUDArmorRepair:New(...)
	local object = ZO_Object.New(self)
	object.repairKitList = { }
	return object
end

do
	local function SortComparator(left, right)
		return GetRepairKitTier(left.stack, left.index) < GetRepairKitTier(right.stack, right.index)
	end

	function HUDArmorRepair:GenerateRepairKitList()
		ZO_ClearNumericallyIndexedTable(self.repairKitList)
		local itemList = PLAYER_INVENTORY:GenerateListOfVirtualStackedItems(INVENTORY_BACKPACK, IsItemNonCrownRepairKit)
		for _, itemInfo in pairs(itemList) do
			self.repairKitList[#self.repairKitList+1] = itemInfo
		end
		table.sort(self.repairKitList, SortComparator)
	end
end

do
	local function IsArmorDurabilityBelowThreshold(condition)
		return condition <= THRESHOLD_ARMOR_REPAIR
	end

	local function IsRepairKitListFilled(data)
		return #data > 0
	end

	local function GetFirstRepairKit(data)
		return data[1].bag, data[1].index
	end

	function HUDArmorRepair:TryToRepairArmor(bagId, slotId)
		-- do not try to repair while player is dead
		if SCOOTWORKS_HUD_STATUS.isPlayerDead then
			return
		end

		local data = SCOOTWORKS_HUD_STATUS.armorRepair.repairKitList
		if data and IsArmorDurabilityBelowThreshold(GetItemCondition(bagId, slotId)) then
			self:GenerateRepairKitList()
			if IsRepairKitListFilled(data) then
				local repairKitToConsumeBagId, repairKitToConsumeSlotIndex = GetFirstRepairKit(data)
				RepairItemWithRepairKit(bagId, slotId, repairKitToConsumeBagId, repairKitToConsumeSlotIndex)
			end
		end
	end
end

function HUDArmorRepair:HandleRefreshFunction(data, origCallback)
	if data.enabled then
		HUD_EQUIPMENT_STATUS.indicators[ARMOR_INDICATOR].refreshFunction = function()
			local checkSlotBrokenCallback = function(slotId)
				if DoesItemHaveDurability(BAG_WORN, slotId) then
					self:TryToRepairArmor(BAG_WORN, slotId)
					if IsArmorEffectivenessReduced(BAG_WORN, slotId) then
						return true
					end
				end
			end
			return ZO_Inventory_EnumerateEquipSlots(checkSlotBrokenCallback) == true
		end
	else
		HUD_EQUIPMENT_STATUS.indicators[ARMOR_INDICATOR].refreshFunction = origCallback
	end
	HUD_EQUIPMENT_STATUS.indicators[ARMOR_INDICATOR]:Refresh()
end


-- HUDWeaponCharge
------------------

local HUDWeaponCharge = ZO_Object:Subclass()

function HUDWeaponCharge:New(...)
	local object = ZO_Object.New(self)
	object.soulGemList = { }
	return object
end

do
	local function SortComparator(left, right)
		return GetSoulGemItemInfo(left.stack, left.index) < GetSoulGemItemInfo(right.stack, right.index)
	end

	local function IsFilledSoulGem(bagId, slotIndex)
		return IsItemSoulGem(SOUL_GEM_TYPE_FILLED, bagId, slotIndex)
	end

	function HUDWeaponCharge:GenerateSoulGemList()
		ZO_ClearNumericallyIndexedTable(self.soulGemList)
		local itemList = PLAYER_INVENTORY:GenerateListOfVirtualStackedItems(INVENTORY_BACKPACK, IsFilledSoulGem)
		for _, itemInfo in pairs(itemList) do
			self.soulGemList[#self.soulGemList+1] = itemInfo
		end
		table.sort(self.soulGemList, SortComparator)
	end
end

do
	local function IsWeaponEnchantmentBelowThreshold(currentCharges, maxCharges)
		if currentCharges == maxCharges then
			return false
		end
		return 100 / maxCharges * currentCharges <= THRESHOLD_WEAPON_CHARGE
	end

	local function IsSoulGemListFilled(data)
		return #data > 0
	end
	
	local function GetFirstSoulGem(data)
		return data[1].index
	end

	local function IsEnchantmentEffectivenessReduced(self, bagId, slotId)
		local currentCharges, maxCharges = GetChargeInfoForItem(bagId, slotId)
		local validMaxCharges = maxCharges > 0
		if validMaxCharges and IsWeaponEnchantmentBelowThreshold(currentCharges, maxCharges) then
			self:GenerateSoulGemList()
			if IsSoulGemListFilled(self.soulGemList) then
				ChargeItemWithSoulGem(bagId, slotId, BAG_BACKPACK, GetFirstSoulGem(self.soulGemList))
			end
		end
		return validMaxCharges and currentCharges == 0
	end

	function HUDWeaponCharge:WeaponRefreshFunction()
		local activeWeaponPair = GetActiveWeaponPairInfo()
		local enchantmentIneffective = false
		local poisonEquipped = false

		if activeWeaponPair == ACTIVE_WEAPON_PAIR_MAIN then
			enchantmentIneffective = IsEnchantmentEffectivenessReduced(self, BAG_WORN, EQUIP_SLOT_MAIN_HAND) or IsEnchantmentEffectivenessReduced(self, BAG_WORN, EQUIP_SLOT_OFF_HAND)
			poisonEquipped = HasItemInSlot(BAG_WORN, EQUIP_SLOT_POISON)
		elseif activeWeaponPair == ACTIVE_WEAPON_PAIR_BACKUP then
			enchantmentIneffective = IsEnchantmentEffectivenessReduced(self, BAG_WORN, EQUIP_SLOT_BACKUP_MAIN) or IsEnchantmentEffectivenessReduced(self, BAG_WORN, EQUIP_SLOT_BACKUP_OFF)
			poisonEquipped = HasItemInSlot(BAG_WORN, EQUIP_SLOT_BACKUP_POISON)
		end

		return enchantmentIneffective and not poisonEquipped
	end
end

function HUDWeaponCharge:HandleRefreshFunction(data, origCallback)
	if data.enabled then
		HUD_EQUIPMENT_STATUS.indicators[WEAPON_INDICATOR].refreshFunction = function() self:WeaponRefreshFunction() end
	else
		HUD_EQUIPMENT_STATUS.indicators[WEAPON_INDICATOR].refreshFunction = origCallback
	end
	HUD_EQUIPMENT_STATUS.indicators[WEAPON_INDICATOR]:Refresh()
end


-- ScootworksHUDStatus
----------------------

local ScootworksHUDStatus = ZO_Object:Subclass()

local IsFoodBuffActiveAndGetTimeLeft = LibFoodDrinkBuff.IsFoodBuffActiveAndGetTimeLeft
local function GetPlayerFoodBuffInfo()
	return IsFoodBuffActiveAndGetTimeLeft(LibFoodDrinkBuff, UNIT_TAG_PLAYER)
	-- Returns: isBuffActive, timeLeftInSeconds
end

function ScootworksHUDStatus:New(...)
	local object = ZO_Object.New(self)
	object:Initialize(...)
	return object
end

function ScootworksHUDStatus:Initialize(control)
	self.control = control

	local function OnAddOnLoaded(event, name)
		if name == ADDON_NAME then
			self.control:UnregisterForEvent(EVENT_ADD_ON_LOADED)

			-- Death
			local function UpdateDeath()
				self.isPlayerDead = IsUnitDead("player")
			end
			UpdateDeath() -- to initialize self.isPlayerDead
			self.control:RegisterForEvent(EVENT_PLAYER_ALIVE, UpdateDeath)
			self.control:RegisterForEvent(EVENT_PLAYER_DEAD, UpdateDeath)

			-- SavedVars
			self.sv = LibSavedVars
				:NewAccountWide(ADDON_NAME.."_Account", DEFAULTS, "Default")
				:AddCharacterSettingsToggle(ADDON_NAME.."_Character")
				:MigrateFromCharacterName({ name = ADDON_NAME.."_Save" })

			self:ReplaceDefaultIndicatorFunctions()
			self.OrigWeaponRefreshFunction = HUD_EQUIPMENT_STATUS.indicators[WEAPON_INDICATOR].refreshFunction
			self.OrigArmorRefreshFunction = HUD_EQUIPMENT_STATUS.indicators[ARMOR_INDICATOR].refreshFunction

			self.FOOD_INDICATOR_DATA =
			{
				tooltipString = function()
					local isBuffActive, timeLeftInSeconds = GetPlayerFoodBuffInfo()
					
					if isBuffActive and timeLeftInSeconds > 0 then
						return GetString(SI_SCOOTWORKS_HUD_FOOD_EXPIRE_SOON_TT)
					else
						return GetString(SI_SCOOTWORKS_HUD_FOOD_EXPIRED_TT)
					end
				end,
				notifySound = SOUNDS.QUEST_ABANDONED,
				displaySetting = self.sv[FOOD_INDICATOR].enabled,
				refreshFunction = function()
					local showIcon = false
					local isBuffActive, timeLeftInSeconds = GetPlayerFoodBuffInfo()
					local announceTimerThreshold = self.sv[FOOD_INDICATOR].announceTimer * ZO_ONE_MINUTE_IN_SECONDS
					if not isBuffActive or timeLeftInSeconds < announceTimerThreshold then
						showIcon = true
					end
					return showIcon
				end,
			}

			self.MOUNT_INDICATOR_DATA =
			{
				tooltipString = GetString(SI_STATS_RIDING_TRAINABLE_TOOLTIP),
				notifySound = SOUNDS.QUEST_ABANDONED,
				displaySetting = self.sv[MOUNT_INDICATOR].enabled,
				refreshFunction = function()
					local showIcon = false
					local ridingSkillMaxedOut = STABLE_MANAGER:IsRidingSkillMaxedOut()
					if not ridingSkillMaxedOut then
						local timeMs = GetTimeUntilCanBeTrained()
						if timeMs < 1000 then
							showIcon = true
						end
					end
					return showIcon
				end,
			}

			HUD_EQUIPMENT_STATUS.indicators[FOOD_INDICATOR] = HUDIndicator:New(GetControl(self.control, FOOD_INDICATOR), self.FOOD_INDICATOR_DATA)
			HUD_EQUIPMENT_STATUS.indicators[MOUNT_INDICATOR] = HUDIndicator:New(GetControl(self.control, MOUNT_INDICATOR), self.MOUNT_INDICATOR_DATA)

			-- Mount
			local function OnMountInfoUpdated()
				HUD_EQUIPMENT_STATUS.indicators[MOUNT_INDICATOR]:Refresh()
			end
			self.control:RegisterForEvent(EVENT_MOUNT_INFO_UPDATED, OnMountInfoUpdated)
			OnMountInfoUpdated()

			-- Food
			local function CheckActiveFoodBuffs()
				HUD_EQUIPMENT_STATUS.indicators[FOOD_INDICATOR]:Refresh()
			end
			EVENT_MANAGER:RegisterForUpdate(control:GetName().."FoodUpdate", ZO_ONE_MINUTE_IN_MILLISECONDS/4, CheckActiveFoodBuffs)
			self.control:RegisterForEvent(EVENT_PLAYER_ACTIVATED, CheckActiveFoodBuffs)
			LibFoodDrinkBuff:RegisterAbilityIdsFilterOnEventEffectChanged(control:GetName(), CheckActiveFoodBuffs, REGISTER_FILTER_UNIT_TAG, UNIT_TAG_PLAYER)

			-- Weapon / Armor
			self.weaponCharge = HUDWeaponCharge:New()
			self.weaponCharge:HandleRefreshFunction(self.sv[WEAPON_RECHARGE], self.OrigWeaponRefreshFunction)

			self.armorRepair = HUDArmorRepair:New()
			self.armorRepair:GenerateRepairKitList()
			self.armorRepair:HandleRefreshFunction(self.sv[ARMOR_REPAIR], self.OrigArmorRefreshFunction)

			-- Settings
			self:InitializeSettingsMenu()
		end
	end	
	self.control:RegisterForEvent(EVENT_ADD_ON_LOADED, OnAddOnLoaded)

	-- Style / Scene
	local KEYBOARD_STYLE =
	{
		template = "ScootworksHUDStatus_Keyboard_Template",
	}
	local GAMEPAD_STYLE =
	{
		template = "ScootworksHUDStatus_Gamepad_Template",
	}
	ZO_PlatformStyle:New(function(...) self:ApplyPlatformStyle(...) end, KEYBOARD_STYLE, GAMEPAD_STYLE)

	SCOOTWORKS_HUD_STATUS_FRAGMENT = ZO_HUDFadeSceneFragment:New(control)
	HUD_SCENE:AddFragment(SCOOTWORKS_HUD_STATUS_FRAGMENT)
	HUD_UI_SCENE:AddFragment(SCOOTWORKS_HUD_STATUS_FRAGMENT)
end

function ScootworksHUDStatus:ReplaceDefaultIndicatorFunctions()
	local function GetSettingType(setting)
		if type(setting) ~= "number" then
			return setting
		end
		return tonumber(GetSetting(SETTING_TYPE_UI, setting)) ~= 0
	end

	function HUDIndicator:Refresh()
		local settingEnabled = GetSettingType(self.displaySetting)
		local showIndicator = settingEnabled and (self.refreshFunction() == true)
		if self.control:IsHidden() and showIndicator then
			local shouldPlaySound = not self.control:GetParent():IsHidden()
			if shouldPlaySound then
				if SCOOTWORKS_HUD_STATUS.sv.soundEnabled then
					PlaySound(self.notifySound)
				end
			else
				self.isNotifySoundQueued = true
			end
		elseif not showIndicator then
			self.isNotifySoundQueued = false
		end

		self.control:SetHidden(not showIndicator)
	end

	function HUDIndicator:SetTooltip()
		InitializeTooltip(InformationTooltip, self.control, BOTTOM, 0, 0, TOP)
		SetTooltipText(InformationTooltip, type(self.tooltipString) == "function" and self.tooltipString() or self.tooltipString)
	end

	local origTryPlayNotifySound = HUDIndicator.TryPlayNotifySound
	function HUDIndicator:TryPlayNotifySound()
		if SCOOTWORKS_HUD_STATUS.sv.soundEnabled then
			return origTryPlayNotifySound(self)
		end
	end

	-- we only want to update the default indicators, not the new ones
	function HUD_EQUIPMENT_STATUS:UpdateAllIndicators()
		HUD_EQUIPMENT_STATUS.indicators[WEAPON_INDICATOR]:Refresh()
		HUD_EQUIPMENT_STATUS.indicators[ARMOR_INDICATOR]:Refresh()
	end
end

function ScootworksHUDStatus:InitializeSettingsMenu()
	local function OnSettingsChanged(indicator)
		local hud = HUD_EQUIPMENT_STATUS.indicators[indicator]
		if hud then
			hud.displaySetting = self.sv[indicator].enabled
			hud:Refresh()
		end
	end

	local LibHarvensAddonSettings = LibHarvensAddonSettings
	local settings = LibHarvensAddonSettings:AddAddon(ADDON_DISPLAY_NAME, { allowRefresh = true })

	settings:AddSetting {
		type = LibHarvensAddonSettings.ST_CHECKBOX,
		label = GetString(SI_LSV_ACCOUNT_WIDE),
		tooltip = GetString(SI_LSV_ACCOUNT_WIDE_TT),
		getFunction = function() 
			self.sv:LoadAllSavedVars()
			return self.sv:GetAccountSavedVarsActive()
		end,
		setFunction = function(value) 
			self.sv:LoadAllSavedVars()
			self.sv:SetAccountSavedVarsActive(value)
		end,
		default = self.sv.__dataSource.defaultToAccount,
	}
	settings:AddSetting {
		type = LibHarvensAddonSettings.ST_SECTION,
		label = "",
	}
	settings:AddSetting {
		type = LibHarvensAddonSettings.ST_CHECKBOX,
		label = GetString(SI_AUDIO_OPTIONS_SOUND_ENABLED),
		getFunction = function() return self.sv.soundEnabled end,
		setFunction = function(value) self.sv.soundEnabled = value end,
	}
	settings:AddSetting {
		type = LibHarvensAddonSettings.ST_SECTION,
		label = "",
	}
	settings:AddSetting {
		type = LibHarvensAddonSettings.ST_CHECKBOX,
		label = GetString(SI_SCOOTWORKS_HUD_LAM_FOOD_INDICATOR),
		tooltip = GetString(SI_SCOOTWORKS_HUD_LAM_FOOD_INDICATOR_TT),
		getFunction = function() return self.sv[FOOD_INDICATOR].enabled end,
		setFunction = function(value)
			self.sv[FOOD_INDICATOR].enabled = value
			OnSettingsChanged(FOOD_INDICATOR)
		end,
		default = DEFAULTS[FOOD_INDICATOR].announceTimer,
	}
	settings:AddSetting {
		type = LibHarvensAddonSettings.ST_SLIDER,
		label = GetString(SI_SCOOTWORKS_HUD_LAM_ANNOUNCE),
		tooltip = GetString(SI_SCOOTWORKS_HUD_LAM_ANNOUNCE_TT),
		min = 1,
		max = 15,
		step = 1,
		format = "%d",
		unit = zo_strformat(SI_TIME_FORMAT_MINUTES, ""),
		getFunction = function() return self.sv[FOOD_INDICATOR].announceTimer end,
		setFunction = function(value)
			self.sv[FOOD_INDICATOR].announceTimer = value
			OnSettingsChanged(FOOD_INDICATOR)
		end,
		default = DEFAULTS[FOOD_INDICATOR].announceTimer,
	}
	settings:AddSetting {
		type = LibHarvensAddonSettings.ST_SECTION,
		label = "",
	}
	settings:AddSetting {
		type = LibHarvensAddonSettings.ST_CHECKBOX,
		label = GetString(SI_SCOOTWORKS_HUD_LAM_MOUNT_INDICATOR),
		tooltip = GetString(SI_SCOOTWORKS_HUD_LAM_MOUNT_INDICATOR_TT),
		getFunction = function() return self.sv[MOUNT_INDICATOR].enabled end,
		setFunction = function(value)
			self.sv[MOUNT_INDICATOR].enabled = value
			OnSettingsChanged(MOUNT_INDICATOR)
		end,
		default = DEFAULTS[MOUNT_INDICATOR].enabled,
	}
	settings:AddSetting {
		type = LibHarvensAddonSettings.ST_CHECKBOX,
		label = GetString(SI_SCOOTWORKS_HUD_LAM_WEAPON_RECHARGE),
		tooltip = GetString(SI_SCOOTWORKS_HUD_LAM_WEAPON_RECHARGE_TT),
		getFunction = function() return self.sv[WEAPON_RECHARGE].enabled end,
		setFunction = function(value)
			self.sv[WEAPON_RECHARGE].enabled = value
			self.weaponCharge:HandleRefreshFunction(self.sv[WEAPON_RECHARGE], self.OrigWeaponRefreshFunction)
		end,
		default = DEFAULTS[WEAPON_RECHARGE].enabled,
	}
	settings:AddSetting {
		type = LibHarvensAddonSettings.ST_CHECKBOX,
		label = GetString(SI_SCOOTWORKS_HUD_LAM_ARMOR_REPAIR),
		tooltip = GetString(SI_SCOOTWORKS_HUD_LAM_ARMOR_REPAIR_TT),
		getFunction = function() return self.sv[ARMOR_REPAIR].enabled end,
		setFunction = function(value)
			self.sv[ARMOR_REPAIR].enabled = value
			self.armorRepair:HandleRefreshFunction(self.sv[ARMOR_REPAIR], self.OrigArmorRefreshFunction)
		end,
		default = DEFAULTS[ARMOR_REPAIR].enabled,
	}
end

function ScootworksHUDStatus:ApplyPlatformStyle(styleTable)
	ApplyTemplateToControl(self.control, styleTable.template)
end

function ScootworksHUDStatus_Initialize(control)
	SCOOTWORKS_HUD_STATUS = ScootworksHUDStatus:New(control)
end
