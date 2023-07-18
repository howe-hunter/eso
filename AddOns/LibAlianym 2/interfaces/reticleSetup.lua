if not ALCINamespace then ALCINamespace = {} end
if not ALCINamespace.ALCIHookRegister then ALCINamespace.ALCIHookRegister = {} end
if not ALCINamespace.ALCIReticleShown then ALCINamespace.ALCIReticleShown = {} end

local reticleControls = {}

local lang = GetCVar("language.2")

local INTERACTABLE_FOUND = true
local INTERACTABLE_NOT_FOUND = false

do
	local function CustomReticleSetup()
		local RETICLE_KEYBOARD_STYLE =
		{
			font = "ZoInteractionPrompt",
			keybindButtonStyle = KEYBIND_STRIP_STANDARD_STYLE,
		}
		local RETICLE_GAMEPAD_STYLE =
		{
			font = "ZoFontGamepad42",
			keybindButtonStyle = KEYBIND_STRIP_GAMEPAD_STYLE,
		}

		local reticleInteract = WINDOW_MANAGER:CreateControl("LibCustomInteractReticleInteract", ZO_ReticleContainer, CT_CONTROL)
		reticleInteract:SetDimensions(200, 50)
		reticleInteract:SetAnchor(LEFT, ZO_ReticleContainer, CENTER, 45, 40)

		local reticleContext = WINDOW_MANAGER:CreateControl("LibCustomInteractReticleInteractContext", reticleInteract, CT_LABEL)
		reticleContext:SetDimensionConstraints(-1, -1, 380, -1)
		reticleContext:SetAnchor(BOTTOMLEFT, ZO_ReticleContainerInteract, BOTTOMLEFT, 0, 0)

		local reticleKeybindButton = WINDOW_MANAGER: CreateControlFromVirtual("LibCustomInteractReticleInteractKeybindButton", reticleInteract, "ZO_KeybindButton")
		reticleKeybindButton:SetAnchor(TOPLEFT, ZO_ReticleContainerInteract, BOTTOMLEFT, 20, 46)

		if IsInGamepadPreferredMode() then
			reticleContext:SetFont(RETICLE_GAMEPAD_STYLE.font)
			reticleKeybindButton:SetNameFont(RETICLE_GAMEPAD_STYLE.font)
			reticleKeybindButton:SetupStyle(RETICLE_GAMEPAD_STYLE.keybindButtonStyle)
		else
			reticleContext:SetFont(RETICLE_KEYBOARD_STYLE.font)
			reticleKeybindButton:SetNameFont(RETICLE_KEYBOARD_STYLE.font)
			reticleKeybindButton:SetupStyle(RETICLE_KEYBOARD_STYLE.keybindButtonStyle)
		end

		reticleControls.interactControl = reticleInteract
		reticleControls.contextControl = reticleContext
		reticleControls.keybindControl = reticleKeybindButton
	end
	CustomReticleSetup()
end

local AlianymCustomReticle = ZO_Object:Subclass()

function ALCINamespace:New(addOnName, reticleInstanceType)
	if not addOnName or not reticleInstanceType then 
		zo_callLater(function() d("Error with ALCI Reticle Register") end, 1000) return 
	end

	local reticle = ZO_Object:New(AlianymCustomReticle)
	reticle:Initialize(addOnName, reticleInstanceType)
	return reticle
end

function AlianymCustomReticle:DoesReticleNeedUpdate()
	return false --Override
end

function AlianymCustomReticle:IsInteractableFoundNotFound(interactableFound)
	return false --Override
end

function AlianymCustomReticle:GetReticleControls()
	return reticleControls.interactControl, reticleControls.contextControl, reticleControls.keybindControl
end

function AlianymCustomReticle:SetCustomInteractActionAndKeys(customInteractAction, customInteractKey, customInteractKeyGamepad)
	self.customAction = customInteractAction
	self.interactKey = customInteractKey
	self.interactKeyGamepad = customInteractKeyGamepad
end

function AlianymCustomReticle:IsThisReticleInstanceValidShowing()
	return ALCINamespace.ALCIReticleShown[self].result and not self.interactionBlocked and not self.interact:IsHidden()
end

function AlianymCustomReticle:ReticleHookSetupAndGet(reticleInstanceType)
	local instance = self
	instance.contextAction = ""
	instance.contextTarget = ""

	local reticleHookFunctions = {}
	function reticleHookFunctions:Default()
		if instance.interact then
			instance.interact:SetHidden(true)
		end
	end

	function reticleHookFunctions:ShowReticle(targetName, targetAction)
		local action, interactableName, interactionBlocked, isOwned, additionalInteractInfo, context, contextLink, isCriminalInteract = GetGameCameraInteractableActionInfo()
		local contextAction = targetAction or instance.customAction or action
		local contextTarget = targetName or interactableName

		local hideInteractContextString
		if interactableName then 
			hideInteractContextString = true
			instance.interactKeybindButton:ClearAnchors()
			instance.interactKeybindButton:SetAnchor(TOPLEFT, ZO_ReticleContainerInteractContext, BOTTOMLEFT, 20, 46)
		else
			hideInteractContextString = false
			instance.interactKeybindButton:ClearAnchors()
			instance.interactKeybindButton:SetAnchor(TOPLEFT, ZO_ReticleContainerInteractContext, BOTTOMLEFT, 20, 6)
		end

		local interactKeybindButtonColor = ZO_NORMAL_TEXT
		local additionalInfoLabelColor = ZO_CONTRAST_TEXT

		instance.interactKeybindButton:ShowKeyIcon()
		instance.interactKeybindButton:SetKeybind(instance.interactKey, nil, instance.interactKeyGamepad) 

		if contextAction and contextTarget then
			local interactContextString

			if isOwned or isCriminalInteract then
				interactKeybindButtonColor = ZO_ERROR_COLOR
			end
			
			if hideInteractContextString then interactContextString = ""
			else interactContextString = contextTarget end

			instance.interactContext:SetText(interactContextString)

			instance.interactionBlocked = interactionBlocked

			instance.interactKeybindButton:SetNormalTextColor(interactKeybindButtonColor)
			instance.interactKeybindButton:SetText(zo_strformat(SI_GAME_CAMERA_TARGET, contextAction))

			local interactionType = GetInteractionType()
			local showBusy = interactionType ~= INTERACTION_NONE and interactionType ~= INTERACTION_FISH and interactionType ~= INTERACTION_PICKPOCKET  and interactionType ~= INTERACTION_HIDEYHOLE or (IsInGamepadPreferredMode() and IsBlockActive())

			instance.interactKeybindButton:SetEnabled(not showBusy and not instance.interactionBlocked)
			instance.interact:SetHidden(false)

			instance.contextAction = contextAction
			instance.contextTarget = contextTarget

			ALCINamespace.ALCIReticleShown[instance] = {result=true, action=contextAction}

			return true
		end
	end

	function reticleHookFunctions:OnReticleUpdate()
		local result, targetName, targetAction = instance:DoesReticleNeedUpdate()

		if type(result) ~= "boolean" or not result or not targetName then
			instance.contextAction = ""
			instance.contextTarget = ""
			return
		end

		return result, targetName, targetAction
	end

	local lastFrameTimeSeconds = GetFrameTimeSeconds()
	local function IsTimeForUpdate(currentFrameTimeSeconds) --Approx. 7 loops per 0.1 second
		local isTimeForUpdate = (currentFrameTimeSeconds - lastFrameTimeSeconds) > 0.1
		if isTimeForUpdate then lastFrameTimeSeconds = currentFrameTimeSeconds end

		return isTimeForUpdate
	end

	local interactableNameLast
	--local updateCheckCount = 0
	function reticleHookFunctions:OnInteractableFoundNotFound(currentFrameTimeSeconds)
		local interactionPossible = GetGameCameraInteractableInfo()
		local interactableFound = INTERACTABLE_FOUND

		if interactionPossible then interactableFound = INTERACTABLE_FOUND
		else 
			interactableFound = INTERACTABLE_NOT_FOUND
			if not IsTimeForUpdate(currentFrameTimeSeconds) then 
				--updateCheckCount = updateCheckCount + 1 
				return 
			end
			--d(updateCheckCount)
		end

		local result, targetName, targetAction = instance:IsInteractableFoundNotFound(interactableFound)
		if type(result) ~= "boolean" or not result then
			instance.contextAction = ""
			instance.contextTarget = ""
		end

		ALCINamespace.ALCIReticleShown[instance] = {result=result, action=targetAction}
		return result, targetName, targetAction
	end

	local function ShouldShowReticle() --This is true if at least one reticle hook returns true
		local found, numFound = false, 0
		for _, value in pairs(ALCINamespace.ALCIReticleShown) do
			if value.result then found = true numFound = numFound + 1 end
		end

		--ALCINamespace.NumSuccesses = numFound
		return found
	end

	local reticleHookFunctionBase
	if reticleInstanceType == ALCI_ON_RETICLE_UPDATE then
		reticleHookFunctionBase = function(currentFrameTimeSeconds)
			--if not IsTimeForUpdate(currentFrameTimeSeconds) then return end

			if not ShouldShowReticle() then reticleHookFunctions:Default() end
			local result, targetName, targetAction = reticleHookFunctions:OnReticleUpdate()
			
			if result then --ShouldShowReticle() and  then
				reticleHookFunctions:ShowReticle(targetName, targetAction) 
			end
		end
	elseif reticleInstanceType == ALCI_ON_INTERACT_FOUND_NOT_FOUND then
		reticleHookFunctionBase = function(self, currentFrameTimeSeconds)
			if not ShouldShowReticle() then reticleHookFunctions:Default() end
			local result, targetName, targetAction = reticleHookFunctions:OnInteractableFoundNotFound(currentFrameTimeSeconds)

			if result then --ShouldShowReticle() and result then
				
				reticleHookFunctions:ShowReticle(targetName, targetAction) 
			end
		end
	else
		return --Error out?
	end

	return reticleHookFunctionBase
end

function AlianymCustomReticle:SetOnInteractFunc(addOnName, onInteractFunction)
	if not addOnName or not onInteractFunction then return end
	ALCINamespace.ALCIHookRegister[self]["OnInteractionFunction"] = onInteractFunction
end

function AlianymCustomReticle:Initialize(addOnName, reticleInstanceType)
	local reticleInteract, reticleContext, reticleKeybindButton = self:GetReticleControls()

	self.interact = reticleInteract
	self.interactContext = reticleContext
	self.interactKeybindButton = reticleKeybindButton

	self.ReticleHook = self:ReticleHookSetupAndGet(reticleInstanceType)
	if not ALCINamespace.ALCIHookRegister[self] then ALCINamespace.ALCIHookRegister[self] = {} end
	if not ALCINamespace.ALCIHookRegister[self]["Hooks"] then ALCINamespace.ALCIHookRegister[self]["Hooks"] = {} end
	ALCINamespace.ALCIHookRegister[self].addOnName = addOnName

	for key, value in ipairs(ALCINamespace.ALCIHookRegister[self]["Hooks"]) do
		if value == reticleInstanceType then return end
	end

	table.insert(ALCINamespace.ALCIHookRegister[self]["Hooks"], reticleInstanceType)
	RETICLE.control:SetHandler("OnUpdate", self.ReticleHook, addOnName..reticleInstanceType)
end