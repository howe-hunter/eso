AUI_QuickSlotButton = ActionButton:Subclass()

local ACTION_BUTTON_BORDERS = {normal = "EsoUI/Art/ActionBar/abilityFrame64_up.dds", mouseDown = "EsoUI/Art/ActionBar/abilityFrame64_down.dds"}
local slotCount = 1
local isDragActive = false

function AUI_QuickSlotButton:New(slotNum, buttonType, parent, controlTemplate)
    local newB = ZO_Object.New(self)

    if newB then
        local ctrlName = "AUI_QuickSlotButton"..slotNum

        local slotCtrl = CreateControlFromVirtual(ctrlName, parent, controlTemplate)

        newB.buttonType             = buttonType
        newB.hasAction              = false
        newB.slot                   = slotCtrl
        newB.slot.slotNum           = slotNum
        newB.button                 = GetControl(slotCtrl, "Button")
        newB.button.slotNum         = slotNum
        newB.button.slotType        = ACTION_TYPE_ITEM
        newB.button.tooltip         = ItemTooltip

        newB.flipCard               = GetControl(slotCtrl, "FlipCard")
        newB.bg                     = GetControl(slotCtrl, "BG")
        newB.icon                   = GetControl(slotCtrl, "Icon")
        newB.glow                   = GetControl(slotCtrl, "Glow")
        newB.buttonText             = GetControl(slotCtrl, "ButtonText")
        newB.countText              = GetControl(slotCtrl, "CountText")
        newB.cooldown               = GetControl(slotCtrl, "Cooldown")
        newB.cooldownCompleteAnim   = GetControl(slotCtrl, "CooldownCompleteAnimation")
        newB.cooldownIcon           = GetControl(slotCtrl, "CooldownIcon")
        newB.cooldownEdge           = GetControl(slotCtrl, "CooldownEdge")
        newB.status                 = GetControl(slotCtrl, "Status")
        newB.inCooldown             = false
        newB.showingCooldown        = false
        newB.activationHighlight    = GetControl(slotCtrl,"ActivationHighlight")

        newB.cooldownIcon:SetDesaturation(1)

        local HIDE_UNBOUND = false
        ZO_Keybindings_RegisterLabelForBindingUpdate(newB.buttonText, "AUI_QUICKSLOT_".. slotCount, HIDE_UNBOUND, "AUI_QUICKSLOT_".. slotCount, nil)
			
		newB.button:SetHandler("OnMouseUp", function(_, _button, _, _, _) newB:OnClicked(_button) end)
		newB.button:SetHandler("OnMouseDown", function(_, _button, _, _, _) ClearTooltip(newB.button.tooltip) end)
		newB.button:SetHandler("OnMouseEnter", function(self) newB:OnMouseEnter(self) end)
		newB.button:SetHandler("OnMouseExit", function(self) newB:OnMouseExit(self) end)
		newB.button:SetHandler("OnDragStart", function(self, button) newB:OnDragStart(self, button) end)			
			
		slotCount = slotCount + 1
    end

    return newB
end

function AUI_QuickSlotButton:OnDragStart(_self, _button)
	isDragActive = true

	CallSecureProtected("PickupAction", self.slot.slotNum)	
end

function AUI_QuickSlotButton:OnMouseEnter(_button)
   local slotType = GetSlotType(self.slot.slotNum)

    if slotType ~= ACTION_TYPE_NOTHING then
		InitializeTooltip(self.button.tooltip, self.slot, BOTTOM, 0, -5, TOP)
        self.button.tooltip:SetAction(self.slot.slotNum)
    else
        ClearTooltip(self.button.tooltip)
    end

	ZO_QuickslotControl_OnMouseEnter(_button)
end

function AUI_QuickSlotButton:OnMouseExit(_button)
	ClearTooltip(self.button.tooltip)
	ZO_QuickslotControl_OnMouseExit(_button)
end

function AUI_QuickSlotButton:OnClicked(_button)
	if _button == 1 and not isDragActive and not QUICKSLOT_FRAGMENT:IsShowing() then
		AUI.Actionbar.QuickButtons.SelectQuickSlotButton(self.slot.slotNum)
		SetCurrentQuickslot(self.slot.slotNum)
		AUI.Actionbar.QuickButtons.SelectCurrentQuickSlot()
	end

	isDragActive = false
end

function AUI_QuickSlotButton:Select()
	self.status:SetHidden(false)
end

function AUI_QuickSlotButton:Unselect()
	self.status:SetHidden(true)
end