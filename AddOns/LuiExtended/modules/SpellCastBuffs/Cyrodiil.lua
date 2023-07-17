--[[
    LuiExtended
    License: The MIT License (MIT)
--]]

local SpellCastBuffs = LUIE.SpellCastBuffs

local Abilities = LUIE.Data.Abilities
local Tooltips = LUIE.Data.Tooltips

local zo_strformat = zo_strformat

local g_currentDuelTarget = nil -- Saved Duel Target for generating Battle Spirit icon when enabled

-- EVENT_DUEL_STARTED handler for creating Battle Spirit Icon on Target
function SpellCastBuffs.DuelStart()
    local duelState, characterName = GetDuelInfo()
    if duelState == 3 and not SpellCastBuffs.SV.HideTargetBuffs and not SpellCastBuffs.SV.IgnoreBattleSpiritTarget then
        g_currentDuelTarget = zo_strformat("<<C:1>>", characterName)
        SpellCastBuffs.ReloadEffects("reticleover")
    end
end

-- EVENT_DUEL_FINISHED handler for removing Battle Spirit Icon on Target
function SpellCastBuffs.DuelEnd()
    g_currentDuelTarget = nil
    SpellCastBuffs.ReloadEffects("reticleover")
end

-- Called by SpellCastBuffs.ReloadEffects(unitTag) from the EVENT_RETICLE_TARGET_CHANGED handler
function SpellCastBuffs.LoadBattleSpiritTarget()
    -- Return if we don't have Battle Spirit enabled for Target
    if SpellCastBuffs.SV.IgnoreBattleSpiritTarget then
        return
    end

    -- Create Battle Spirit Buff if we are in a PVP zone or this is our current Duel Target
    if ( LUIE.ResolvePVPZone() and IsUnitPlayer("reticleover") and (GetUnitReaction("reticleover") == UNIT_REACTION_PLAYER_ALLY) ) or GetUnitName("reticleover") == g_currentDuelTarget then
        local abilityId = 999014
        local tooltip
        -- Imperial City version of battle spirit doesn't extend the range of our abilities, unlike the variant used for Cyrodiil, Duels, and BGs.
        if IsInImperialCity() then
            tooltip = Tooltips.Innate_Battle_Spirit_Imperial_City
        else
            tooltip = Tooltips.Innate_Battle_Spirit
        end
        SpellCastBuffs.EffectsList["reticleover1"][abilityId] = {
            type=1,
            id=abilityId, name=Abilities.Skill_Battle_Spirit, icon = "esoui/art/icons/artificialeffect_battle-spirit.dds", tooltip = tooltip,
            dur=0, starts=1, ends=nil,
            forced = "short",
            restart=true, iconNum=0,
        }
    end
end
