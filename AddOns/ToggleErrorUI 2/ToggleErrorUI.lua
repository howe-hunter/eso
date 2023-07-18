--[[ 
  Dies ist ein mehrzeiliger
  Kommentar.

	Version: 0.22

  ]]


ToggleErrorUIAddon = {}
ToggleErrorUIAddon.name = "ToggleErrorUI"

local temp=0

function ToogleXXX()
	ZO_UIErrors_ToggleSupressDialog()
	ToggleErrorUIAddon.print('Toogle.')
end

function ReloadUIXXX()
	ReloadUI("ingame")
end

function GotoShipXXX()
	JumpToHouse("@Jaensn")
end

function GotoHomeXXX()
	JumpToHouse("@Wool15")
end

function GotoGipfelXXX()
	JumpToHouse("@lausebengel")
end

function GotoSchubseXXX()
	JumpToHouse("@Schubse")
end


function HalloX()
	ToggleErrorUIAddon.HalloXXX()
end

function ToggleErrorUIAddon.HalloXXX()
    if IsUnitGrouped('player') then

	--	zo_callLater(function() d("coming soon(?) - send some text to chatgroup") end, 2000)
	-- 	CHAT_CHANNEL_PARTY

		StartChatInput("Hello Together.", CHAT_CHANNEL)

	--	BeginGroupElection (nil, GetUnitDisplayName ('player') .. "Test")
	else
	--	StartChatInput("Test", CHAT_CHANNEL)

		BeginGroupElection (nil, GetUnitDisplayName ('player') .. "Test")

        	ToggleErrorUIAddon.print('You must be in a group to send a message')
    end
end

function ToggleErrorUIAddon.print(msg)
    d("ToggleErrorUI: " .. msg)
end

function OnAddonLoaded(_, addonName)

if addonName ~= ToggleErrorUIAddon.name then 
		return 
	end

 	if (temp==0) then
    		ZO_UIErrors_ToggleSupressDialog()
    		temp=1
  	end
	
	EVENT_MANAGER:UnregisterForEvent(ToggleErrorUIAddon.name, EVENT_ADD_ON_LOADED)
	SLASH_COMMANDS["/ö"] = HalloX
	SLASH_COMMANDS["/xxx"] = ToogleXXX
	SLASH_COMMANDS["/yyy"] = ReloadUIXXX
	SLASH_COMMANDS["/ccc"] = GotoShipXXX	
	SLASH_COMMANDS["/hr"] = GotoHomeXXX
	SLASH_COMMANDS["/vvv"] = GotoGipfelXXX
	SLASH_COMMANDS["/se"] = GotoSchubseXXX

  	zo_callLater(function() d("ToggleErrorUI: loaded, error messages switched off.") end, 500)
	zo_callLater(function() d("ToggleErrorUI: Type /xxx in chat to toggle.") end, 500)

	-- d("ToggleErrorUI: loaded, error messages switched off. Type /xxx in chat to toggle.")
  
end

EVENT_MANAGER:RegisterForEvent(ToggleErrorUIAddon.name, EVENT_ADD_ON_LOADED, OnAddonLoaded)

