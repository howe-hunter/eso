--[[
    LuiExtended
    License: The MIT License (MIT)
--]]

LUIE.CombatTextPointsChampionEventListener = LUIE.CombatTextEventListener:Subclass()
local CombatTextPointsChampionEventListener = LUIE.CombatTextPointsChampionEventListener

local eventType = LUIE.Data.CombatTextConstants.eventType
local pointType = LUIE.Data.CombatTextConstants.pointType

function CombatTextPointsChampionEventListener:New()
    local obj = LUIE.CombatTextEventListener:New()
    obj:RegisterForEvent(EVENT_CHAMPION_POINT_UPDATE, function(...) self:OnEvent(...) end, REGISTER_FILTER_UNIT_TAG, 'player')
    self.gain = 0
    self.timeoutActive = false
    self.previousPoints = GetUnitChampionPoints('player')
    self.previousMaxPoints = 3600
    self.previousCP = GetUnitChampionPoints('player')
    self.maxCP = 3600
    self.hasMaxCP = self.previousCP == self.maxCP and self.previousPoints >= self.previousMaxPoints
    return obj
end

function CombatTextPointsChampionEventListener:OnEvent(unit, currentPoints, maxPoints, reason)
    if (LUIE.CombatText.SV.toggles.showPointsChampion and not self.hasMaxCP) then
        local currentVR = GetUnitChampionPoints('player')

        -- Calculate gained CP
        if (currentVR == self.previousCP) then
            self.gain = self.gain + (currentPoints - self.previousPoints)
        else
            self.gain = self.gain + (self.previousMaxPoints - self.previousPoints) + currentPoints
        end

        -- Remember values
        self.previousPoints = currentPoints
        self.previousMaxPoints = maxPoints
        self.previousCP = currentVR
        self.hasMaxCP = self.hasMaxCP or (currentVR == self.maxCP and currentPoints >= maxPoints)

        -- Trigger custom event (500ms buffer)
        if (self.gain > 0 and not self.timeoutActive) then
            self.timeoutActive = true
            zo_callLater(function()
                self:TriggerEvent(eventType.POINT, pointType.CHAMPION_POINTS, self.gain)
                self.gain = 0
                self.timeoutActive = false
            end, 500)
        end
    end
end
