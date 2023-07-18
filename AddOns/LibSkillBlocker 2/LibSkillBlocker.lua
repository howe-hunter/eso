LibSkillBlocker = {}
LibSkillBlocker.name = "LibSkillBlocker"
LibSkillBlocker.blockedSkills = {}

function LibSkillBlocker.GetRegisteredAbilityIds()
  return LibSkillBlocker.blockedSkills
end

function LibSkillBlocker.GetRegisteredAbilityId(abilityId)
  return LibSkillBlocker.blockedSkills[abilityId]
end

function LibSkillBlocker.GetRegisteredAbilityIdsByAddon(addonName)
  local abilityIds = {}
  for abilityId, v in pairs(LibSkillBlocker.blockedSkills) do
    if v[addonName] then
      abilityIds[abilityId] = v.blocks[addonName]
    end
  end

  return abilityIds
end

function LibSkillBlocker.IsSlotBlocked(slotNum)
  if IsInGamepadPreferredMode() then return false end
  local abilityId = GetSlotBoundId(slotNum)
  if LibSkillBlocker.blockedSkills[abilityId] == nil then return false end
  for _, blockHandler in pairs(LibSkillBlocker.blockedSkills[abilityId].blocks) do
    if blockHandler(slotNum, abilityId, LibSkillBlocker.blockedSkills[abilityId].lastTrigger) then return true end
  end
  return false
end

function LibSkillBlocker.CanUseActionSlots()
  local slotNum = tonumber(debug.traceback():match('keybind = "ACTION_BUTTON_(%d)')) or tonumber(debug.traceback():match('keybind = "GAMEPAD_ACTION_BUTTON_(%d)'))

  if slotNum then
    if not LibSkillBlocker.IsSlotBlocked(slotNum) then return false end
    
    ZO_Alert(UI_ALERT_CATEGORY_ERROR, SOUNDS.NEGATIVE_CLICK, SI_RESPECRESULT10)
    ZO_ActionBar_OnActionButtonUp(slotNum)
    
    return true
  end
end

function LibSkillBlocker.RecordButtonDown(slotNum)
  local abilityId = GetSlotBoundId(slotNum)
  if not LibSkillBlocker.blockedSkills[abilityId] then return end
  LibSkillBlocker.blockedSkills[abilityId].lastTrigger = GetGameTimeMilliseconds()
end

function LibSkillBlocker.RecordButtonUp(slotNum)
  local abilityId = GetSlotBoundId(slotNum)
  if not LibSkillBlocker.blockedSkills[abilityId] then return end
  LibSkillBlocker.blockedSkills[abilityId].lastTrigger = nil
end

function LibSkillBlocker.RegisterSkillBlock(blockName, abilityId, customBlockHandler)
  if not LibSkillBlocker.blockedSkills[abilityId] then LibSkillBlocker.blockedSkills[abilityId] = { blocks = {} } end
  if customBlockHandler then
    LibSkillBlocker.blockedSkills[abilityId].blocks[blockName] = customBlockHandler
  else
    LibSkillBlocker.blockedSkills[abilityId].blocks[blockName] = function() return true end
  end
end

function LibSkillBlocker.UnregisterSkillBlock(blockName, abilityId)
  if LibSkillBlocker.blockedSkills[abilityId] then
    LibSkillBlocker.blockedSkills[abilityId].blocks[blockName] = nil
  end
end

function LibSkillBlocker.OnAddonLoaded(_, addonName)
  if addonName == LibSkillBlocker.name then
    EVENT_MANAGER:UnregisterForEvent(LibSkillBlocker.name, EVENT_ADD_ON_LOADED)
    ZO_PreHook("ZO_ActionBar_CanUseActionSlots", LibSkillBlocker.CanUseActionSlots)
    ZO_PreHook("ZO_ActionBar_OnActionButtonDown", LibSkillBlocker.RecordButtonDown)
    ZO_PreHook("ZO_ActionBar_OnActionButtonUp", LibSkillBlocker.RecordButtonUp)
  end
end

EVENT_MANAGER:RegisterForEvent(LibSkillBlocker.name, EVENT_ADD_ON_LOADED, LibSkillBlocker.OnAddonLoaded)
