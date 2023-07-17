LibMultilingualName = LibMultilingualName
LibMultilingualName_GetRawAbilityDescription_Data = LibMultilingualName_GetRawAbilityDescription_Data or {}
local LIB = LibMultilingualName -- local name
local LMN = LIB -- Lib Multilingual Name
local RAW_DATA = LibMultilingualName_GetRawAbilityDescription_Data

--------
-- Public Methods, Consts
--------

function LIB.GetRawAbilityDescription(langCode, id)
    if langCode == nil then
        return false
    end
    if id == nil then
        return false
    end
    if RAW_DATA[langCode] == nil then
        return false
    end
    if RAW_DATA[langCode][id] == nil then
        return false
    end

    return RAW_DATA[langCode][id]
end

function LIB.GetAbilityDescription(langCode, id)
    local name = LIB.GetRawAbilityDescription(langCode, id)
    if name then
        -- TODO resolve ability param (but impossible?)
        -- return ZO_CachedStrFormat("<<C:1>>", name)
        return name
    else
        return "NotFound. Lang Code " .. langCode .. " Id " .. id
    end
end
