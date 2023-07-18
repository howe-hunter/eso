--[[
    LuiExtended
    License: The MIT License (MIT)
--]]

LUIE.CombatTextResourcesPotionEventListener = LUIE.CombatTextEventListener:Subclass()
local CombatTextResourcesPotionEventListener = LUIE.CombatTextResourcesPotionEventListener

local eventType = LUIE.Data.CombatTextConstants.eventType
local resourceType = LUIE.Data.CombatTextConstants.resourceType

local inCooldown = false

function CombatTextResourcesPotionEventListener:New()
    local obj = LUIE.CombatTextEventListener:New()
    obj:RegisterForUpdate("PotionCooldown", 100, function() self:PotionCooldown() end)
    return obj
end

function CombatTextResourcesPotionEventListener:PotionCooldown()
    local Settings = LUIE.CombatText.SV
    if not Settings.toggles.showPotionReady then
        return
    end

    local slotIndex = GetCurrentQuickslot()
    if (GetSlotItemSound(slotIndex) == ITEM_SOUND_CATEGORY_POTION) then
        local _, duration = GetSlotCooldownInfo( slotIndex )
        local isInCooldown = duration > 0

        if isInCooldown then
            if inCooldown == false and duration > 5000 then
                inCooldown = true
            end
        else
            if inCooldown == true then
                local slotName = zo_strformat(SI_LINK_FORMAT_ITEM_NAME, GetSlotName(slotNum))
                self:TriggerEvent(eventType.RESOURCE, resourceType.POTION, slotName)
                inCooldown = false
            end
        end
    end
end
