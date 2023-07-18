--========================================
--        vars
--========================================
local addon = ActionDurationReminder -- Addon#M
local utils = addon.load("Utils#M")
local settings = addon.load("Settings#M")
local models = addon.load("Models#M")
local l = {} -- #L
local m = {l=l} -- #M

-- In Game Debug Usage:
-- /script ActionDurationReminder.debugLevels.action=2
-- /script ActionDurationReminder.debugLevels.effect=2
-- /script ActionDurationReminder.debugLevels.target=2
-- /script ActionDurationReminder.debugLevels.all=2

local DS_ACTION = "action" -- debug switch for action
local DS_EFFECT = "effect" -- debug switch for effect
local DS_TARGET = "target" -- debug switch for target
local DS_ALL = "all" -- debug switch for all

---
--@type CoreSavedVars
local coreSavedVarsDefaults = {
  coreMultipleTargetTracking = true,
  coreSecondsBeforeFade = 5,
  coreMinimumDurationSeconds = 2.5,
  coreKeyWords = '',
  coreBlackKeyWords = '',
  coreClearWhenCombatEnd = false,
}

local GetGameTimeMilliseconds =GetGameTimeMilliseconds

local fStripBracket -- #(#string:origin)->(#string)
= function(origin)
  return origin:gsub("^[^<]+<%s*([^>]+)%s*>.*$","%1",1)
end

--========================================
--        l
--========================================
l.actionQueue = {} --#list<Models#Action>

l.idActionMap = {}--#map<#number,Models#Action>

l.idFilteringMap = {} --#map<#number,#boolean>

l.gallopAction = nil -- Models#Action

l.lastAction = nil -- Models#Action

l.lastEffectAction = nil -- Models#Action

l.lastQuickslotTime = 0 -- #number

l.ignoredCache = utils.newRecentCache(5)

l.ignoredIds = {} -- #map<#number,#boolean>

l.timeActionMap = {}--#map<#number,Models#Action>

l.queueAction -- #(Models#Action:action)->()
= function(action)
  l.lastAction = action
  local newQueue = {} --#list<Models#Action>
  newQueue[1] = action
  for key, a in ipairs(l.actionQueue) do
    if not a.newAction and a:getEndTime()+l.getSavedVars().coreSecondsBeforeFade*1000 > action.startTime then
      table.insert(newQueue,a)
    end
  end
  l.actionQueue = newQueue
end

l.debug -- #(#string:switch,#number:level)->(#(#string:format, #string:...)->())
=function(switch, level)
  return function(format, ...)
    if (m.debugLevels[switch] and m.debugLevels[switch]>=level) or
      (m.debugLevels[DS_ALL] and m.debugLevels[DS_ALL]>=level)
    then
      d(os.date()..'>', string.format(format, ...))
    end
  end
end

l.filterAbilityOk -- #(Models#Ability:ability)->(#boolean)
= function(ability)
  local savedValue = l.idFilteringMap[ability.id]
  if savedValue ~= nil then return savedValue end

  -- check white list
  local keywords = l.getSavedVars().coreKeyWords:lower()
  local checked = false
  local checkOk = false
  for line in keywords:gmatch("[^\r\n]+") do
    line = line:match "^%s*(.-)%s*$"
    if line and #line>0 then
      checked = true
      if line:match('%d+') then
        checkOk = tonumber(line) == ability.id
      else
        checkOk = zo_strformat("<<1>>", ability.name):lower():find(line,1,true)
      end
      if checkOk then break end
    end
  end
  if checked and not checkOk then
    l.idFilteringMap[ability.id] = false
    return false
  end
  -- check black list
  keywords = l.getSavedVars().coreBlackKeyWords:lower()
  for line in keywords:gmatch("[^\r\n]+") do
    line = line:match "^%s*(.-)%s*$"
    if line and #line>0 then
      local match = false
      if line:match('%d+') then
        local id = tonumber(line)
        match = id == ability.id
      else
        match = zo_strformat("<<1>>", ability.name):lower():find(line,1,true)
      end
      if match then
        l.idFilteringMap[ability.id] = false
        return false
      end
    end
  end
  --
  l.idFilteringMap[ability.id] = true
  return true
end

l.findActionByNewEffect --#(Models#Effect:effect, #boolean:stacking)->(Models#Action)
= function(effect,stacking)
  -- try last performed action
  if l.lastAction and l.lastAction.flags.forGround then
    if l.lastAction:matchesNewEffect(effect) then
      l.debug(DS_ACTION,1)('[F]found last action by new match:%s@%.2f', l.lastAction.ability.name, l.lastAction.startTime/1000)
      return l.lastAction
    end
  end
  -- try last effect action
  if l.lastEffectAction and l.lastEffectAction.lastEffectTime+50>effect.startTime then
    if l.lastEffectAction.ability:matches(effect.ability,false) then
      l.debug(DS_ACTION,1)('[F]found last effect action by new match:%s@%.2f', l.lastEffectAction.ability.name, l.lastEffectAction.startTime/1000)
      return l.lastEffectAction
    end
  end
  -- try performed actions
  for i = 1,#l.actionQueue do
    local action = l.actionQueue[i]
    if action:matchesNewEffect(effect) then
      l.debug(DS_ACTION,1)('[F]found one by new match:%s@%.2f', action.ability.name, action.startTime/1000)
      return action
    else
      l.debug(DS_ACTION,1)('[F?]not found one by new match:%s@%.2f', action.ability.name, action.startTime/1000)
    end
  end
  -- try slotted actions
  local action = l.findBarActionByNewEffect(effect, stacking)
  if action then return action end
  -- not found
  l.debug(DS_ACTION,1)('[?]not found in %i actions, lastAction: %s, lastEffectAction: %s', #l.actionQueue, l.lastAction and l.lastAction.ability.name or 'nil',
    l.lastEffectAction and l.lastEffectAction.ability.name or 'nil')
  return nil
end

l.findActionByOldEffect --#(Models#Effect:effect,#boolean:appending)->(Models#Action)
= function(effect, appending)
  -- 1. find that existed
  for i = 1,#l.actionQueue do
    local action = l.actionQueue[i]
    if action:matchesOldEffect(effect) then
      if action.newAction then action = action:getNewest() end
      l.debug(DS_ACTION,1)('[F]found one by old match:%s@%.2f', action.ability.name, action.startTime/1000)
      return action
    end
  end
  for key, action in pairs(l.idActionMap) do
    if action.fake and action:matchesOldEffect(effect) then
      l.debug(DS_ACTION,1)('[F]found one by old fake match:%s@%.2f', action.ability.name, action.startTime/1000)
      return action
    end
  end
  -- 2. appending
  if appending then
    for i = 1,#l.actionQueue do
      local action = l.actionQueue[i]
      if action:matchesNewEffect(effect) then
        l.debug(DS_ACTION,1)('[F]found one by new match:%s@%.2f', action.ability.name, action.startTime/1000)
        return action
      end
    end
  end
  l.debug(DS_ACTION,1)('[?]not found in %i actions, last:%s', #l.actionQueue, l.lastAction and l.lastAction.ability.name or 'nil')
  return nil
end

l.findBarActionByNewEffect --#(Models#Effect:effect, #boolean:stacking)->(Models#Action)
= function(effect, stacking)
  -- check if it's a buff, e.g. avoid abuse of major expedition
  if effect.ability.icon:find('ability_buff_m',1,true) then return nil end
  -- check if it's a potion effect
  if effect.startTime - l.lastQuickslotTime < 100 then return nil end
  -- check if it's a one word name effect e.g. burning, chilling, concussion
  local checkDescription =  effect.ability.name:find(" ",1,true)
  checkDescription = checkDescription and (stacking or effect.duration >= 5000)
  --
  local matchSlotNum = nil
  for slotNum = 3,8 do
    local slotBoundId = GetSlotBoundId(slotNum)
    if slotBoundId >0 then
      if effect.ability.name:find(fStripBracket(zo_strformat("<<1>>", GetSlotName(slotNum))),1,true)
        or checkDescription and zo_strformat("<<1>>", GetAbilityDescription(slotBoundId)):find(effect.ability.name,1,true)
      then
        matchSlotNum = slotNum
        break
      end
    end
  end
  if matchSlotNum then
    local action = models.newAction(matchSlotNum,GetActiveWeaponPairInfo(), false)
    action.fake = true
    l.debug(DS_ACTION,1)('[F]found one by bar match:%s@%.2f', action.ability.name, action.startTime/1000)
    return action
  end

  l.debug(DS_ACTION,1)('[?]not found in bar actions')
  return nil
end

l.getSavedVars -- #()->(#CoreSavedVars)
= function()
  return settings.getSavedVars()
end

l.getActionByAbilityId -- #(#number:abilityId)->(Models#Action)
= function(abilityId)
  local action = l.idActionMap[abilityId]
  if action then return action end
  for key, var in pairs(l.idActionMap) do
    if var:matchesAbilityId(abilityId) then return var end
  end
  return nil
end

l.getActionByAbilityName -- #(#string:abilityName, #boolean:strict)->(Models#Action)
= function(abilityName, strict)
  for id, action in pairs(l.idActionMap) do
    if action:matchesAbilityName(abilityName) then return action end
  end
  return nil
end

l.getActionByNewAction -- #(Models#Action:action)->(Models#Action)
= function(action)
  local abilityName = action.ability.name
  local matcher -- #(Models#Action:a)->(#boolean)
  = function(a)
    if a.ability.id == action.ability.id then return true end
    -- i.e. Merciless Resolve name can match Assissin's Will action by its related ability list
    for key, var in ipairs(a.relatedAbilityList) do
      if abilityName:find(var.name,1,true) then
        l.debug(DS_ACTION,1)('[aM:related name]')
        return true
      end
    end
    if abilityName:find(a.ability.name,1,true) then return true end
    -- i.e. Assassin's Will name can match Merciless Resolve action by its description
    if action.weaponPairIndex == a.weaponPairIndex and action.slotNum == a.slotNum
      and not addon.isSimpleWord(abilityName) and a.description:find(abilityName,1,true)
    then
      l.debug(DS_ACTION,1)('[aM:slot]')
      return true
    end
  end
  for id, a in pairs(l.idActionMap) do
    if matcher(a) then return a end
  end
  return nil
end

l.onActionSlotAbilityUsed -- #(#number:eventCode,#number:slotNum)->()
= function(eventCode,slotNum)
  -- 1. filter other actions
  if slotNum < 3 or slotNum > 8 then return end
  -- 2. create action
  local action = models.newAction(slotNum,GetActiveWeaponPairInfo(), false)
  l.debug(DS_ACTION,1)('[a]%s@%.2f+%i++%.2f\n%s\n<%.2f~%.2f>', action.ability:toLogString(),
    action.startTime/1000, action.castTime, GetLatency()/1000, action:getFlagsInfo(),
    action:getStartTime()/1000, action:getEndTime()/1000)
  if action.ability.icon:find('_curse',1,true) -- daedric curse, haunting curse, daedric prey
    or action.ability.icon:find('dark_haze',1,true) -- rune cage
    or action.ability.icon:find('dark_fog',1,true) -- rune prison
  then
    action.flags.onlyOneTarget = true
  end
  -- 3. filter by keywords
  if not l.filterAbilityOk(action.ability) then
    l.debug(DS_EFFECT,1)('[]filtered')
    return
  end
  -- 4. queue it
  l.queueAction(action)
  -- 5. replace saved
  local sameNameAction = l.getActionByNewAction(action)
  if sameNameAction then
    sameNameAction = sameNameAction:getNewest()
    l.debug(DS_ACTION,1)('[aM]%s@%.2f\n%s\n<%.2f~%.2f>', sameNameAction.ability:toLogString(),
      sameNameAction.startTime/1000,  action:getFlagsInfo(), action:getStartTime()/1000, action:getEndTime()/1000)
    sameNameAction.newAction = action
    action.effectList = sameNameAction.effectList
    for key, var in ipairs(action.effectList) do
    	var.ignored = false
    end
    sameNameAction.effectList = {}
    action.lastEffectTime = sameNameAction.lastEffectTime
    action.stackCount = sameNameAction.stackCount
    action.stackEffect = sameNameAction.stackEffect
    sameNameAction.stackEffect = nil
    action.oldAction = sameNameAction

    if action.duration == 0 and sameNameAction.duration >0 then
      action.inheritDuration = sameNameAction.duration
    elseif action.duration == 0 and sameNameAction.inheritDuration >0 then
      action.inheritDuration = sameNameAction.inheritDuration
    end
    local abilityAccepter -- # (#Ability:relatedAbility)->()
    = function(relatedAbility)
      if not action.ability.name:find(relatedAbility.name,1,true) then
        table.insert(action.relatedAbilityList, relatedAbility)
        l.debug(DS_ACTION,1)('[aMs]%s, total:%d', relatedAbility:toLogString(), #action.relatedAbilityList)
      end
    end
    abilityAccepter(sameNameAction.ability)
    for key, var in ipairs(sameNameAction.relatedAbilityList) do
      abilityAccepter(var)
    end
    l.saveAction(action)
  end
  -- 6. save
  if action.descriptionDuration and action.descriptionDuration<3000 and action.descriptionDuration>l.getSavedVars().coreMinimumDurationSeconds then
    -- 6.x save short without effects
    l.saveAction(action)
  end
end

l.onActionUpdateCooldowns -- #(#number:eventCode)->()
= function(eventCode)
  local remain,duration = GetSlotCooldownInfo(GetCurrentQuickslot())
  if remain>1000 and duration>1000 and duration-remain<100 then
    l.lastQuickslotTime = GetGameTimeMilliseconds()
  end
end

l.onCombatEventFromPlayer -- #(#number:eventCode,#number:result,#boolean:isError,
--#string:abilityName,#number:abilityGraphic,#number:abilityActionSlotType,#string:sourceName,
--#number:sourceType,#string:targetName,#number:targetType,#number:hitValue,#number:powerType,
--#number:damageType,#boolean:log,#number:sourceUnitId,#number:targetUnitId,#number:abilityId,#number:overflow)->()
= function(eventCode,result,isError,abilityName,abilityGraphic,abilityActionSlotType,sourceName,sourceType,targetName,
  targetType,hitValue,powerType,damageType,log,sourceUnitId,targetUnitId,abilityId,overflow)
  if result ~= 2240 and result ~= 2245 then return end -- ACTION_RESULT_EFFECT_GAINED and ACTION_RESULT_EFFECT_GAINED_DURATION
  if l.idActionMap[abilityId] then return end
  local now = GetGameTimeMilliseconds()
  l.debug(DS_EFFECT, 3)('[CE+]%s(%s)@%.2f[%s] for %s(%i), abilityActionSlotType:%d, targetType:%d, damageType:%d, overflow:%d,result:%d,powerType:%d',
    abilityName,
    abilityId,
    now/1000,
    abilityGraphic,
    targetName,
    targetUnitId,
    abilityActionSlotType,
    targetType,
    damageType,
    overflow,
    result,
    powerType
  )
  for key, action in pairs(l.actionQueue) do
    if action.ability.id == abilityId and now-action.startTime<2000
      and action.duration > l.getSavedVars().coreMinimumDurationSeconds
      and action.flags.forArea
    then
      action.startTime = now
      action.endTime = now+action.duration
      l.saveAction(action)
    end
  end
end

l.onEffectChanged -- #(#number:eventCode,#number:changeType,#number:effectSlot,#string:effectName,
-- #string:unitTag,#number:beginTimeSec,#number:endTimeSec,#number:stackCount,#string:iconName,#string:buffType,
-- #number:effectType,#number:abilityType,#number:statusEffectType,#string:unitName,
-- #number:unitId,#number:abilityId,#number:sourceType)->()
= function(eventCode,changeType,effectSlot,effectName,unitTag,beginTimeSec,endTimeSec,stackCount,iconName,buffType,
  effectType,abilityType,statusEffectType,unitName,unitId,abilityId,sourceType)
  local now = GetGameTimeMilliseconds()
  effectName = effectName:gsub('^.*< (.*) >$','%1'):gsub('%^%w','')
  l.debug(DS_EFFECT, 1)('[%s%s]%s(%s)@%.2f<%.2f>[%s] for %s(%i), effectType:%d, abilityType:%d, statusEffectType:%d',
    ({'+','-','=','*','/'})[changeType] or '?',
    stackCount > 0 and tostring(stackCount) or '',
    effectName,
    abilityId,
    beginTimeSec > 0 and beginTimeSec or now/1000,
    endTimeSec-beginTimeSec,
    iconName,
    unitTag~='' and unitTag or 'none',
    unitId,
    effectType,
    abilityType,
    statusEffectType
  )
  -- ignore rubbish effects
  if l.ignoredIds[abilityId] then
    l.debug(DS_ACTION,1)('[] '..effectName..' ignored by id:'..abilityId)
    return
  end
  local key = abilityId..'_'..effectName
  local numMarks = l.ignoredCache:countMark(key)
  if numMarks>=3 then
    l.debug(DS_ACTION,1)('[] '..key..' ignored by cache'..numMarks)
    l.ignoredCache:mark(key)
    if numMarks>=20 then
      l.ignoredIds[abilityId]=true
    end
    return
  end

  -- 0. prepare
  -- ignore expedition on others
  if unitTag~='player' and iconName:find('buff_major_expedition',1,true) then return end
  -- ignore burning effect
  if not l.ignoredIds['ability_mage_062'] and iconName:find('ability_mage_062',1,true) then
    l.ignoredIds['ability_mage_062']=true
    l.ignoredIds[abilityId]=true
    return
  end

  if unitTag and string.find(unitTag, 'group') then return end -- ignore effects on group members especially those same as player
  local startTime =  math.floor(beginTimeSec * 1000)
  local endTime =  math.floor(endTimeSec * 1000)
  local duration = endTime-startTime
  if duration > 150000 then return end -- ignore effects that last longer than 150 seconds
  if l.lastAction and not l.lastAction.flags.forGround and startTime and
    startTime - (l.lastAction.startTime + l.lastAction.castTime)>2000 then
    l.debug(DS_ACTION,1)('[u] unref lastAction by time')
    l.lastAction = nil
  end
  if l.lastEffectAction and startTime and startTime- l.lastEffectAction.lastEffectTime>50 then
    l.lastEffectAction = nil
  end
  local ability = models.newAbility(abilityId, effectName, iconName)
  local effect = models.newEffect(ability, unitTag, unitId, startTime, endTime);
  -- 1. stack
  if stackCount > 0 then -- e.g. relentless focus
    local action = nil -- Models#Action
    if changeType == EFFECT_RESULT_FADED then
      action = l.findActionByOldEffect(effect)
      if not action then
        l.ignoredCache:mark(key)
        return
      end
      local stackInfoUpdated = action:updateStackInfo(0, effect)
      local oldEffect = action:purgeEffect(effect)
      l.timeActionMap[oldEffect.startTime] = nil
      if stackInfoUpdated then
        l.debug(DS_ACTION,1)('[cs] purged stack info %s (%s)%s', action.ability:toLogString(), action:hasEffect() and 'other effect exists' or 'no other effect',action:getEffectsInfo())
        if action:getEndTime() <= now+20 and action:getStartTime()>now-500 then  -- action trigger effect's end i.e. Crystal Fragment/Molten Whip
          l.debug(DS_ACTION,1)('[P]%s@%.2f~%.2f', action.ability:toLogString(), action.startTime/1000, action:getEndTime())
          l.removeAction(action)
        end
      else
        l.debug(DS_ACTION,1)('[cs] purged ignored stack info %s (%s)', action.ability:toLogString(), action:hasEffect() and 'other effect exists' or 'no other effect')
      end
    else
      action = l.findActionByNewEffect(effect, true)
      if not action then
        l.debug(DS_EFFECT,1)('[]New stack effect action not found.'..l.ignoredCache:countMark(key))
        l.ignoredCache:mark(key)
        return
      end
      if not l.filterAbilityOk(effect.ability) then
        l.debug(DS_EFFECT,1)('[]New stack effect filtered.')
        return
      end
      if action.duration and action.duration > 0 then -- stackable actions with duration should ignore eso buggy effect time e.g. 20s Relentless Focus
        effect.startTime = action.startTime
        effect.duration = action.duration
        effect.endTime = action.endTime
      end
      local stackInfoUpdated = action:updateStackInfo(stackCount, effect)
      action:saveEffect(effect)
      if stackInfoUpdated then
        l.debug(DS_ACTION,1)('[us] updated stack info %s (%.2f~%.2f)', action.ability:toLogString(), action:getStartTime(), action.endTime)
        l.saveAction(action)
      else
        l.debug(DS_ACTION,1)('[us] updated ignored stack info %s (%.2f~%.2f)', action.ability:toLogString(), action:getStartTime(), action.endTime)
      end
    end
    return
  end
  if duration > 0 and duration < l.getSavedVars().coreMinimumDurationSeconds*1000 +100 then return end
  -- 2. gain
  if changeType == EFFECT_RESULT_GAINED then
    if duration == 0 then
      l.debug(DS_EFFECT,1)('[]New effect without duration ignored.')
      return
    end
    if not l.filterAbilityOk(effect.ability) then
      l.debug(DS_EFFECT,1)('[]New effect filtered.')
      return
    end
    local action = l.findActionByNewEffect(effect)
    if action then
      action:saveEffect(effect)
      -- patches
      -- weird patch
      local weird = effect.duration == 0
      if not weird then l.saveAction(action) end
      -- count for daedric mines
      local ofDaedricMines = iconName:find('daedric_mines',1,true)
        or (iconName:find('mage_065',1,true) and action.ability.icon:find('daedric_[mt][io][nm][eb]',1,false)) -- this icon also appears in Wall of Element, we can filter by duration
      if ofDaedricMines then ability.type = abilityType end -- record area effect for daedric mines

      return
    end
    l.debug(DS_EFFECT,1)('[]New effect action not found')
    return
  end
  -- 3. update
  if changeType == EFFECT_RESULT_UPDATED then
    local action = l.findActionByOldEffect(effect, effect.duration>0)
    if action then
      local old = action:saveEffect(effect)
      local weird = not old and effect.duration == 0
      if not weird then l.saveAction(action) end
      return
    end
    return
  end
  -- 4. fade
  if changeType == EFFECT_RESULT_FADED then
    local action = l.findActionByOldEffect(effect)
    if action then
      local oldEffect = action:purgeEffect(effect)
      local clearTimeRecord = true
      for key, var in ipairs(action.effectList) do
        if var.startTime == oldEffect.startTime then clearTimeRecord=false end
      end
      if clearTimeRecord then l.timeActionMap[oldEffect.startTime] = nil end -- don't clear time record if other effect still there
      --  action trigger effect's end i.e. Crystal Fragment/Molten Whip
      if action.oldAction and action.oldAction.fake and action:getEndTime() <= now+20 and  action:getStartTime()>now-500 then
        l.debug(DS_ACTION,1)('[over]%s@%.2f~%.2f', action.ability:toLogString(), action.startTime/1000, action:getEndTime()/1000)
        l.removeAction(action)
      end
      return
    end
    return
  end
end

l.onMountedStateChanged -- #(#number:eventCode,#boolean:mounted)->()
= function(eventCode,mounted)
  if mounted and l.gallopAction then
    local gallopEffect = l.gallopAction:optGallopEffect()
    if gallopEffect and gallopEffect.endTime>GetGameTimeMilliseconds() then
      l.saveAction(l.gallopAction)
      l.gallopAction = nil
    end
  end
end

l.onPlayerActivated -- #(#number:eventCode,#boolean:initial)->()
= function(eventCode,initial)
end

l.onPlayerCombatState -- #(#number:eventCode,#boolean:inCombat)->()
= function(eventCode,inCombat)
  if not l.getSavedVars().coreClearWhenCombatEnd then return end
  zo_callLater(
    function()
      if not IsUnitInCombat('player') then
        for key,action in pairs(l.idActionMap) do
          l.idActionMap[key] = nil
          l.debug(DS_TARGET,1)('[C!]%s@%.2f<%.2f> %s', action.ability:toLogString(), action:getStartTime()/1000,
            action:getDuration()/1000, action:getFlagsInfo())
        end
      end
    end,
    3000
  )
end

l.onReticleTargetChanged -- #(#number:eventCode)->()
= function(eventCode)
  if not l.getSavedVars().coreMultipleTargetTracking then return end
  if not DoesUnitExist('reticleover') then return end
  -- 1. remove all non player and non playerpet effect actions from self.idActionMap
  local ignoredEffectIds = {}
  for key,action in pairs(l.idActionMap) do
    if action.flags.onlyOneTarget then -- e.g. daedric curse, rune cage,  we do not switch on target changing
      for i, effect in ipairs(action.effectList) do
        ignoredEffectIds[effect.ability.id] = true
    end
    elseif not action.flags.forGround and not action.flags.forArea and not action.flags.forSelf --[[ e.g. daedric mines ]] and not action:isOnPlayer() and not action:isOnPlayerpet() then
      l.idActionMap[key] = nil
      l.debug(DS_TARGET,1)('[RT]%s@%.2f<%.2f> %s', action.ability:toLogString(), action:getStartTime()/1000,
        action:getDuration()/1000, action:getFlagsInfo())
    end
  end
  -- 2. scan all matched buffs
  local numBuffs = GetNumBuffs('reticleover') -- #number
  local numRestored = 0
  for i = 1, numBuffs do
    local buffName,timeStarted,timeEnding,buffSlot,stackCount,iconFilename,buffType,effectType,abilityType,
      statusEffectType,abilityId,canClickOff,castByPlayer = GetUnitBuffInfo('reticleover', i)
    if not ignoredEffectIds[abilityId] and castByPlayer and not l.ignoredIds[abilityId] and l.ignoredCache:countMark(abilityId..'_'..buffName)<3 then
      local startTime =  math.floor(timeStarted * 1000)
      local action = l.timeActionMap[startTime]
      if action then
        local ability = models.newAbility(abilityId,buffName,iconFilename)
        local effect = models.newEffect(ability,'none',0,startTime,startTime) -- only for match, no need to be precise timing
        if action:matchesOldEffect(effect) then
          l.idActionMap[action.ability.id] = action
          numRestored = numRestored+1
          l.debug(DS_TARGET,1)('[VT]%s@%.2f<%.2f>', action.ability:toLogString(), action:getStartTime()/1000, action:getDuration()/1000)
        else
          l.debug(DS_TARGET,1)('[XT]%s@%.2f<%.2f>', action.ability:toLogString(), action:getStartTime()/1000, action:getDuration()/1000)
        end
      else
        l.debug(DS_TARGET, 1)('[?T]%s(%i)@%.2f<%.2f> action not found.', buffName, abilityId, timeStarted,timeEnding-timeStarted)
      end
    end
  end
end

l.onStart -- #()->()
= function()
  EVENT_MANAGER:RegisterForEvent(addon.name, EVENT_ACTION_SLOT_ABILITY_USED, l.onActionSlotAbilityUsed)
  EVENT_MANAGER:RegisterForUpdate(addon.name, 100, l.onUpdate)
  EVENT_MANAGER:RegisterForEvent(addon.name, EVENT_EFFECT_CHANGED, l.onEffectChanged)
  EVENT_MANAGER:AddFilterForEvent(addon.name, EVENT_EFFECT_CHANGED, REGISTER_FILTER_SOURCE_COMBAT_UNIT_TYPE, COMBAT_UNIT_TYPE_PLAYER)

  EVENT_MANAGER:RegisterForEvent(addon.name..'_patch', EVENT_EFFECT_CHANGED, function(...)
    local sourceType = select(17, ... ) -- #string
    if sourceType == COMBAT_UNIT_TYPE_NONE or sourceType == COMBAT_UNIT_TYPE_TARGET_DUMMY then
      local icon = select(9, ...) -- #string
      -- patch for Force Siphon, this skill effect can only be filtered by COMBAT_UNIT_TYPE_NONE
      if icon:find('minor_lifesteal',1,true) then l.onEffectChanged(...) end
      -- patch for Restoring Aura, this skill effect can only be filtered by COMBAT_UNIT_TYPE_NONE
      if icon:find('minor_magickasteal',1,true) then l.onEffectChanged(...) end
    end
  end)


  EVENT_MANAGER:RegisterForEvent(addon.name..'_fromPlayer', EVENT_COMBAT_EVENT, l.onCombatEventFromPlayer  )
  EVENT_MANAGER:AddFilterForEvent(addon.name..'_fromPlayer', EVENT_COMBAT_EVENT, REGISTER_FILTER_SOURCE_COMBAT_UNIT_TYPE, COMBAT_UNIT_TYPE_PLAYER)
  EVENT_MANAGER:RegisterForEvent(addon.name, EVENT_RETICLE_TARGET_CHANGED, l.onReticleTargetChanged  )
  EVENT_MANAGER:RegisterForEvent(addon.name, EVENT_PLAYER_COMBAT_STATE, l.onPlayerCombatState)
  EVENT_MANAGER:RegisterForEvent(addon.name, EVENT_PLAYER_ACTIVATED, l.onPlayerActivated )
  EVENT_MANAGER:RegisterForEvent(addon.name,  EVENT_ACTION_UPDATE_COOLDOWNS, l.onActionUpdateCooldowns  )
  EVENT_MANAGER:RegisterForEvent(addon.name,  EVENT_MOUNTED_STATE_CHANGED, l.onMountedStateChanged   )

end

l.lastUpdateLog = 0
l.onUpdate -- #()->()
= function()
  l.refineActions()
  addon.callExtension(m.EXTKEY_UPDATE)
  -- log
  local now = GetGameTimeMilliseconds()
  -- input: /script ActionDurationReminder.debugOnUpdate = true
  if addon.debugOnUpdate and now - l.lastUpdateLog>1000 then
    l.lastUpdateLog = now
    d('<<<<<----')
    for key, action in pairs(l.idActionMap) do
      d(key..':'..action.ability.name)
      local optEffect = action:optEffect()
      for ek, ev in ipairs(action.effectList) do
        d('effect:'..ev.ability.id..' '..ev.ability.name..', endTime-now'..(ev.endTime-now))
      end
      if optEffect then
        d('opt:'..optEffect.ability.id..', endTime-now:'..(optEffect.endTime-now))
      end
    end
    d('---->>>>')
  end
end

l.refineActions -- #()->()
= function()
  local now = GetGameTimeMilliseconds()
  local endLimit = now - l.getSavedVars().coreSecondsBeforeFade * 1000
  for key,action in pairs(l.idActionMap) do
    local endTime = action:isUnlimited() and endLimit+1 or action:getEndTime()
    if endTime < (action.fake and now or endLimit) then
      l.debug(DS_ACTION,1)('[dr]%s@%.2f~%.2f', action.ability:toLogString(), action.startTime/1000, action:getEndTime()/1000)
      l.removeAction(action)
      local gallopEffect = action:optGallopEffect()
      if gallopEffect and gallopEffect.endTime > now then l.gallopAction = action end
    end
  end
  endLimit = endLimit - 3000 -- timeActionMap remains a little longer to be found by further effect
  for key,action in pairs(l.timeActionMap) do
    if action:getEndTime() < endLimit then
      l.timeActionMap[key] = nil
      l.debug(DS_ACTION, 1)('[dt]%s@%.2f<%i>',action.ability:toLogString(),action.startTime/1000, action:getDuration()/1000)
    end
  end
end

l.removeAction -- #(Models#Action:action)->(#boolean)
= function(action)
  local removed = false
  -- remove from idActionMap
  if l.idActionMap[action.ability.id] then
    l.idActionMap[action.ability.id] = nil
    removed = true
    l.debug(DS_ACTION, 1)('[d]%s@%.2f<%i>',action.ability:toLogString(),action.startTime/1000, action:getDuration()/1000)
  end
  -- remove fake/trigger actions from queue, otherwise next fake action will failed to recognize i.e. Crystal Fragment
  if action.oldAction and action.oldAction.fake then
    local newQueue = {} --#list<Models#Action>
    for key, a in ipairs(l.actionQueue) do
      if a.ability.id ~= action.ability.id and a.ability.id~= action.oldAction.ability.id then
        table.insert(newQueue,a)
      end
    end
    l.actionQueue = newQueue
  end
  --
  return removed
end

l.saveAction -- #(Models#Action:action)->()
= function(action)
  l.lastEffectAction = action

  -- clear same name action that can have a different id
  local sameNameAction = l.getActionByNewAction(action)
  if sameNameAction then l.idActionMap[sameNameAction.ability.id] = nil end

  l.idActionMap[action.ability.id] = action
  for i, effect in ipairs(action.effectList) do
    l.timeActionMap[effect.startTime] = action
  end
  local len -- #(#map)->(#number)
  = function(t)
    local count = 0
    for key, var in pairs(t) do
      count=count+1
    end
    return count
  end
  l.debug(DS_ACTION,1)('[s]%s@%.2f,idActionMap(%i),timeActionMap(%i)', action.ability:toLogString(), action.startTime/1000,
    len(l.idActionMap),len(l.timeActionMap))
end

l.getActionBySlot --#(#number:weaponPairIndex, #number:slotNum)->(Models#Action)
= function(weaponPairIndex, slotNum)
  for key, var in pairs(l.idActionMap) do
    if var.weaponPairIndex == weaponPairIndex and var.slotNum == slotNum then
      return var
    end
  end
  return nil
end


--========================================
--        m
--========================================
m.EXTKEY_UPDATE = "Core:update"

m.debugLevels = {} -- config by console e.g. /script ActionDurationReminder.load("Core#M").debugLevels.effect = 1
addon.debugLevels = m.debugLevels

m.getActionByAbilityId = l.getActionByAbilityId -- #(#number:abilityId)->(Models#Action)

m.getActionByAbilityName = l.getActionByAbilityName-- #(#string:abilityName)->(Models#Action)

m.getActionBySlot = l.getActionBySlot-- #(#number:weaponPairIndex,#number:slotNum)->(Models#Action)

m.clearActions -- #()->()
= function()
  l.debug(DS_ACTION, 1)('[clear]')
  l.actionQueue = {}
  l.idActionMap = {}
  l.timeActionMap = {}
end
addon.clearActions = m.clearActions

m.clearAreaActions -- #()->()
= function()
  l.debug(DS_ACTION, 1)('[clear area]')
  local newQueue = {}
  for key, var in ipairs(l.actionQueue) do
    if not var.flags.forArea then table.insert(newQueue, var) end
  end
  l.actionQueue = newQueue
  local newMap = {}
  for key, var in pairs(l.idActionMap) do
    if not var.flags.forArea then newMap[key] = var end
  end
  l.idActionMap = newMap
  newMap = {}
  for key, var in pairs(l.timeActionMap) do
    if not var.flags.forArea then newMap[key] = var end
  end
  l.timeActionMap = newMap
end
addon.clearAreaActions = m.clearAreaActions

m.debug
= function() --#()->()
  for key, var in pairs(l.idActionMap) do
    df('%s(%d)@%d:%s',var.ability.name,var.ability.id,var.startTime,var:getEffectsInfo())
  end
end
addon.debug = m.debug

m.getIdActionMap -- #()->(#map<#number,Models#Action>)
= function()
  return l.idActionMap
end
addon.getIdActionMap = m.getIdActionMap

--========================================
--        register
--========================================
addon.register("Core#M",m)

addon.hookStart(l.onStart)

addon.extend(settings.EXTKEY_ADD_DEFAULTS, function()
  settings.addDefaults(coreSavedVarsDefaults)
end)

addon.extend(settings.EXTKEY_ADD_MENUS, function()
  settings.addMenuOptions(
    {
      type = "submenu",
      name = addon.text("Core"),
      controls = {
        {
          type = "checkbox",
          name = addon.text("Multiple Target Tracking"),
          getFunc = function() return l.getSavedVars().coreMultipleTargetTracking end,
          setFunc = function(value) l.getSavedVars().coreMultipleTargetTracking = value end,
          width = "full",
          default = coreSavedVarsDefaults.coreMultipleTargetTracking,
        },
        {
          type = "checkbox",
          name = addon.text("Clear When Combat End"),
          getFunc = function() return l.getSavedVars().coreClearWhenCombatEnd end,
          setFunc = function(value) l.getSavedVars().coreClearWhenCombatEnd = value end,
          width = "full",
          default = coreSavedVarsDefaults.coreClearWhenCombatEnd,
        },
        {
          type = "slider",
          name = addon.text("Seconds to Keep Timers After Timeout"),
          min = 0, max = 10, step = 1,
          getFunc = function() return l.getSavedVars().coreSecondsBeforeFade end,
          setFunc = function(value) l.getSavedVars().coreSecondsBeforeFade = value end,
          width = "full",
          default = coreSavedVarsDefaults.coreSecondsBeforeFade,
        },
        {
          type = "slider",
          name = addon.text("Seconds of Ignorable Short Timers"),
          min = 1, max = 5, step = 0.5,
          getFunc = function() return l.getSavedVars().coreMinimumDurationSeconds end,
          setFunc = function(value) l.getSavedVars().coreMinimumDurationSeconds = value end,
          width = "full",
          default = coreSavedVarsDefaults.coreMinimumDurationSeconds,
        },
        {
          type = "editbox",
          name = addon.text("Patterns of White List in line"), -- or string id or function returning a string
          getFunc = function() return l.getSavedVars().coreKeyWords end,
          setFunc = function(text) l.getSavedVars().coreKeyWords = text l.idFilteringMap={} end,
          -- tooltip = "Editbox's tooltip text.", -- or string id or function returning a string (optional)
          isMultiline = true, --boolean (optional)
          isExtraWide = true, --boolean (optional)
          width = "full", --or "half" (optional)
          -- warning = "May cause permanent awesomeness.", -- or string id or function returning a string (optional)
          requiresReload = false, -- boolean, if set to true, the warning text will contain a notice that changes are only applied after an UI reload and any change to the value will make the "Apply Settings" button appear on the panel which will reload the UI when pressed (optional)
          default = coreSavedVarsDefaults.coreKeyWords, -- default value or function that returns the default value (optional)
        -- reference = "MyAddonEditbox" -- unique global reference to control (optional)
        },
        {
          type = "editbox",
          name = addon.text("Patterns of Black List in line"), -- or string id or function returning a string
          getFunc = function() return l.getSavedVars().coreBlackKeyWords end,
          setFunc = function(text) l.getSavedVars().coreBlackKeyWords = text l.idFilteringMap={} end,
          -- tooltip = "Editbox's tooltip text.", -- or string id or function returning a string (optional)
          isMultiline = true, --boolean (optional)
          isExtraWide = true, --boolean (optional)
          width = "full", --or "half" (optional)
          -- warning = "May cause permanent awesomeness.", -- or string id or function returning a string (optional)
          requiresReload = false, -- boolean, if set to true, the warning text will contain a notice that changes are only applied after an UI reload and any change to the value will make the "Apply Settings" button appear on the panel which will reload the UI when pressed (optional)
          default = coreSavedVarsDefaults.coreBlackKeyWords, -- default value or function that returns the default value (optional)
        -- reference = "MyAddonEditbox" -- unique global reference to control (optional)
        }
      }
    }
  )
end)
