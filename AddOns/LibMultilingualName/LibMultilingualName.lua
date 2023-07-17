LibMultilingualName = LibMultilingualName or {}
local LIB = LibMultilingualName -- local name
local LMN = LIB -- Lib Multilingual Name

local clientLangCode = nil

local function contains(table, val)
    for i=1,#table do
        if table[i] == val then
            return true
        end
    end
    return false
end

--------
-- Public Methods, Consts
--------

LIB.NAME = "LibMultilingualName"
LIB.VERSION = "1.2.25"

LMN.CODE_ENGLISH = "en"
LMN.CODE_JAPANESE = "jp"
LMN.CODE_GERMAN = "de"
LMN.CODE_FRENCH = "fr"
LMN.CODE_RUSSIAN = "ru"
LMN.CODE_SPANISH = "es" -- Spanish

LMN.ALL_LANG_CODES = {
    LMN.CODE_ENGLISH,
    LMN.CODE_JAPANESE,
    LMN.CODE_GERMAN,
    LMN.CODE_FRENCH,
    LMN.CODE_RUSSIAN,
    LMN.CODE_SPANISH
}
LMN.LOADED_LANG_CODES = {}
LMN.DUMMY_LANG_CODES = {
    ["ja"] = LMN.CODE_JAPANESE,
}

function LIB.IsLoaded(langCode)
    return contains(LMN.LOADED_LANG_CODES, langCode)
end

function LIB.GetClientLangCode()
    if clientLangCode == nil then
        clientLangCode = string.lower(GetCVar("language.2"))
    end

    return clientLangCode
end

--------
-- Register
--------

local function onLibraryLoaded(event, name)
    if (name ~= LIB.NAME) then
        return
    end

    EVENT_MANAGER:UnregisterForEvent(LIB.NAME, EVENT_ADD_ON_LOADED)
end

EVENT_MANAGER:RegisterForEvent(LIB.NAME, EVENT_ADD_ON_LOADED, onLibraryLoaded)
