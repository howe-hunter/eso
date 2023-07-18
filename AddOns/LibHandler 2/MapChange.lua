local class = ZO_InitializingObject:Subclass()
libHandlerMapChange = class

function class:Initialize(owner, trackedMapId, enterHandler, exitHandler)
    self.owner = owner
    self.name = string.format("%sMapChange", self.owner.name)

    self.mapId = trackedMapId
    self.enterHandler = enterHandler
    self.exitHandler = exitHandler

    self.lastMapId = nil
    EVENT_MANAGER:RegisterForEvent(string.format("%s-%d", self.name, self.owner:getNextHandlerId()), EVENT_PLAYER_ACTIVATED, function(eventCode, initial)
        self:check()
    end)
end

function class:check()
    local mapId = GetCurrentMapId()

    if mapId == self.lastMapId then
        return
    end

    if mapId == self.mapId and type(self.enterHandler) == "function" then
        self.enterHandler(self.lastMapId, mapId)
    end

    if self.lastMapId == self.mapId and type(self.exitHandler) == "function" then
        self.exitHandler(self.lastMapId, mapId)
    end

    self.lastMapId = mapId
end
