local class = ZO_InitializingObject:Subclass()
libHandlerZoneChange = class

function class:Initialize(owner, trackedZoneId, enterHandler, exitHandler)
    self.owner = owner
    self.name = string.format("%sZoneChange", self.owner.name)

    self.zoneId = trackedZoneId
    self.enterHandler = enterHandler
    self.exitHandler = exitHandler

    self.lastZoneId = nil
    EVENT_MANAGER:RegisterForEvent(string.format("%s-%d", self.name, self.owner:getNextHandlerId()), EVENT_PLAYER_ACTIVATED, function(eventCode, initial)
        self:check()
    end)
end

function class:check()
    local zoneId, worldX, worldY, worldZ = GetUnitWorldPosition("player")

    if zoneId == self.lastZoneId then
        return
    end

    if zoneId == self.zoneId and type(self.enterHandler) == "function" then
        self.enterHandler(self.lastZoneId, zoneId)
    end

    if self.lastZoneId == self.zoneId and type(self.exitHandler) == "function" then
        self.exitHandler(self.lastZoneId, zoneId)
    end

    self.lastZoneId = zoneId
end
