--[[
    LuiExtended
    License: The MIT License (MIT)
--]]

LUIE.CombatTextResourcesUltimateEventListener = LUIE.CombatTextEventListener:Subclass()
local CombatTextResourcesUltimateEventListener = LUIE.CombatTextResourcesUltimateEventListener

local eventType = LUIE.Data.CombatTextConstants.eventType
local resourceType = LUIE.Data.CombatTextConstants.resourceType

function CombatTextResourcesUltimateEventListener:New()
    local obj = LUIE.CombatTextEventListener:New()
    obj:RegisterForEvent(EVENT_POWER_UPDATE, function(...) self:OnEvent(...) end, REGISTER_FILTER_UNIT_TAG, 'player', REGISTER_FILTER_POWER_TYPE, POWERTYPE_ULTIMATE)
    obj:RegisterForEvent(EVENT_ACTION_SLOTS_FULL_UPDATE, function() self:UpdateMaximum() end)
    obj:RegisterForEvent(EVENT_ACTION_SLOT_STATE_UPDATED, function() self:UpdateMaximum() end)
    self.powerInfo = { maximum = 0, wasNotified = false }
    self:UpdateMaximum()
    return obj
end

function CombatTextResourcesUltimateEventListener:OnEvent(unit, powerPoolIndex, powerType, power, powerMax)
    local Settings = LUIE.CombatText.SV
    if (power <= 0 or not Settings.toggles.showUltimate or self.powerInfo.maximum == 0) then
        return
    end

    -- Check if we need to show the notification
    if (power >= self.powerInfo.maximum) then
        if (not self.powerInfo.wasNotified) then
            self:TriggerEvent(eventType.RESOURCE, resourceType.ULTIMATE, power)
            self.powerInfo.wasNotified = true
        end
    else
        self.powerInfo.wasNotified = false
    end
end

function CombatTextResourcesUltimateEventListener:UpdateMaximum()
    self.powerInfo.maximum = GetSlotAbilityCost(ACTION_BAR_ULTIMATE_SLOT_INDEX + 1)
end
