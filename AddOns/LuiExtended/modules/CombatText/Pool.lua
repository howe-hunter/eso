--[[
    LuiExtended
    License: The MIT License (MIT)
--]]

LUIE.CombatTextPool = ZO_ObjectPool:Subclass()
local CombatTextPool = LUIE.CombatTextPool

local poolTypes = LUIE.Data.CombatTextConstants.poolType

local fastSlow = ZO_GenerateCubicBezierEase(0.3, 0.9, 0.7, 1)
local slowFast = ZO_GenerateCubicBezierEase(0.63, 0.1, 0.83, 0.69)
local even = ZO_GenerateCubicBezierEase(0.63, 1.2, 0.83, 1)

local easeOutIn = function (progress)
    progress = progress < 0.5 and progress * 2 or (1 - progress) * 2
    return zo_sqrt(1 - ((1 - progress) ^ 2))
end

function CombatTextPool:New(poolType)
    -- Check if poolType is not nil or empty
    if not poolType then
        error("poolType is required.")
    end

    local obj
    if poolType == poolTypes.CONTROL then
        obj = ZO_ObjectPool:New(self.CreateNewControl, self.ResetControl)
    else
        -- Assuming that self.ResetAnimation exists
        obj = ZO_ObjectPool:New(self.CreateNewAnimation, self.ResetAnimation)
    end

    obj.poolType = poolType
    return obj
end

function CombatTextPool:CreateNewControl()
    local control = CreateControlFromVirtual("LUIE_CombatText_Virtual_Instance", LUIE_CombatText, "LUIE_CombatText_Virtual", self:GetNextControlId())
    control.label = control:GetNamedChild("_Amount")
    control.icon = control:GetNamedChild("_Icon")
    return control
end

function CombatTextPool.ResetControl(control)
    control:ClearAnchors()
    control.label:ClearAnchors()
    control.icon:ClearAnchors()
    control.icon:SetHidden(true)
end

function CombatTextPool:CreateNewAnimation()
    local anim = LUIE.CombatTextAnimation:New()
    local Settings = LUIE.CombatText.SV
    local animationSpeed = 1 / (Settings.animation.animationDuration / 100)

    local animationTypes = {
        [poolTypes.ANIMATION_CLOUD] = function ()
            anim:Alpha(nil, 0, 1, animationSpeed * 50)
            anim:Alpha(nil, 1, 0, animationSpeed * 500, animationSpeed * 1500, slowFast)
        end,
        [poolTypes.ANIMATION_CLOUD_CRITICAL] = function ()
            anim:Alpha(nil, 0, 1, animationSpeed * 50)
            anim:Scale(nil, 1.5, 1, animationSpeed * 150, 0, slowFast)
            anim:Alpha(nil, 1, 0, animationSpeed * 500, animationSpeed * 1500, slowFast)
        end,
        [poolTypes.ANIMATION_CLOUD_FIREWORKS] = function ()
            anim:Alpha(nil, 0, 1, animationSpeed * 50)
            anim:Move("move", 0, 0, animationSpeed * 250, 0, fastSlow) -- x and y is set before the animation is played
            anim:Alpha("fadeOut", 1, 0, animationSpeed * 500, animationSpeed * 1500, slowFast)
        end,
        [poolTypes.ANIMATION_SCROLL] = function ()
            anim:Alpha(nil, 0, 1, animationSpeed * 50)
            anim:Move("scroll", 0, 0, animationSpeed * 2500, 0, even)
            anim:Alpha("fadeOut", 1, 0, animationSpeed * 500, animationSpeed * 1400, slowFast)
        end,
        [poolTypes.ANIMATION_SCROLL_CRITICAL] = function ()
            anim:Alpha(nil, 0, 1, animationSpeed * 50)
            anim:Scale(nil, 1.5, 1, animationSpeed * 150, 0, slowFast)
            anim:Move("scroll", 0, 0, animationSpeed * 2500, 0, even)
            anim:Alpha("fadeOut", 1, 0, animationSpeed * 500, animationSpeed * 1400, slowFast)
        end,
        [poolTypes.ANIMATION_DEATH] = function ()
            anim:Alpha(nil, 0, 1, animationSpeed * 50)
            anim:Scale(nil, 1.5, 1, animationSpeed * 150, 0, slowFast)
            anim:Move("scroll", 0, 0, animationSpeed * 5000, 0, even)
            anim:Alpha("fadeOut", 1, 0, animationSpeed * 500, animationSpeed * 2000, slowFast)
        end,
        [poolTypes.ANIMATION_ALERT] = function ()
            anim:Alpha(nil, 0, 1, animationSpeed * 50)
            anim:Scale(nil, 0.5, 1.5, animationSpeed * 100, 0, fastSlow)
            anim:Scale(nil, 1.5, 1, animationSpeed * 200, animationSpeed * 250, slowFast)
            anim:Alpha(nil, 1, 0, animationSpeed * 500, animationSpeed * 3000, slowFast)
        end,
        [poolTypes.ANIMATION_COMBATSTATE] = function ()
            anim:Alpha(nil, 0, 1, animationSpeed * 1000, 0, slowFast)
            anim:Alpha(nil, 1, 0, animationSpeed * 500, animationSpeed * 3000, slowFast)
        end,
        [poolTypes.ANIMATION_POINT] = function ()
            anim:Alpha(nil, 0, 1, animationSpeed * 50)
            anim:Alpha(nil, 1, 0, animationSpeed * 500, animationSpeed * 3000, slowFast)
        end,
        [poolTypes.ANIMATION_RESOURCE] = function ()
            anim:Alpha(nil, 0, 1, animationSpeed * 50)
            anim:Scale(nil, 0.5, 1.5, animationSpeed * 100, 0, fastSlow)
            anim:Scale(nil, 1.5, 1, animationSpeed * 200, animationSpeed * 250, slowFast)
            anim:Alpha(nil, 1, 0, animationSpeed * 500, animationSpeed * 3000, slowFast)
        end,
        [poolTypes.ANIMATION_ELLIPSE_X] = function ()
            anim:Move("scrollX", 0, 0, animationSpeed * 2500, 0, easeOutIn)
        end,
        [poolTypes.ANIMATION_ELLIPSE_Y] = function ()
            anim:Alpha(nil, 0, 1, animationSpeed * 50)
            anim:Move("scrollY", 0, 0, animationSpeed * 2500) --for delay and easying function will be used defaults (0, ZO_LinearEase)
            anim:Alpha("fadeOut", 1, 0, animationSpeed * 500, animationSpeed * 1800, slowFast)
        end,
        [poolTypes.ANIMATION_ELLIPSE_X_CRIT] = function ()
            anim:Scale(nil, 1.5, 1, animationSpeed * 150, 0, slowFast)
            anim:Move("scrollX", 0, 0, animationSpeed * 2500, 0, easeOutIn)
        end,
        [poolTypes.ANIMATION_ELLIPSE_Y_CRIT] = function ()
            anim:Alpha(nil, 0, 1, animationSpeed * 50)
            anim:Scale(nil, 1.5, 1, animationSpeed * 150, 0, slowFast)
            anim:Move("scrollY", 0, 0, animationSpeed * 2500)
            anim:Alpha("fadeOut", 1, 0, animationSpeed * 500, animationSpeed * 1800, slowFast)
        end,
    }

    local animationType = animationTypes[self.poolType]
    if animationType then
        animationType()
    end

    return anim
end
