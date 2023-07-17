LibMultilingualName_fr = LibMultilingualName_fr or {}
local LIB = LibMultilingualName_fr
local LIB_PARENT = LibMultilingualName

--------
-- Public Methods, Consts
--------

LIB.NAME = "LibMultilingualName_fr"

--------
-- Register
--------

local playerOnceActivated = false

local function onLibraryLoaded(event, name)
    if (name ~= LIB.NAME) then
        return
    end

    EVENT_MANAGER:UnregisterForEvent(LIB.NAME, EVENT_ADD_ON_LOADED)

    table.insert(LIB_PARENT.LOADED_LANG_CODES, LIB_PARENT.CODE_FRENCH)
end

local function onPlayerActivated()
	-- require once
	if (playerOnceActivated) then
		return
	end
	playerOnceActivated = true
    EVENT_MANAGER:UnregisterForEvent(LIB.NAME, EVENT_PLAYER_ACTIVATED)
end


EVENT_MANAGER:RegisterForEvent(LIB.NAME, EVENT_ADD_ON_LOADED, onLibraryLoaded)
EVENT_MANAGER:RegisterForEvent(LIB.NAME, EVENT_PLAYER_ACTIVATED, onPlayerActivated)