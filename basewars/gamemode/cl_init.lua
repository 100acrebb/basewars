include("include.lua")
include("modules.lua")

BaseWars.ModuleLoader:Load()

local function XmasMode()

	if BaseWars.IsXmasTime() and materials then

		materials.ReplaceTexture("GM_CONSTRUCT/GRASS", "nature/snowfloor002a")

	end
	
end
hook.Add("InitPostEntity", "BaseWars.XmasMode", XmasMode)
XmasMode()

local a
local b
local function PreventDefocus()

	if system.HasFocus() and not a then
	
		a = true
		b = false
		gui.EnableScreenClicker(false)
		
	elseif not system.HasFocus() and not b then
	
		a = false
		b = true
		gui.EnableScreenClicker(true)
		
	end
	
end
hook.Add("Think", "preventdefocusclick", PreventDefocus)

local PLAYER = debug.getregistry().Player

PLAYER.__SetMuted = PLAYER.__SetMuted or PLAYER.SetMuted
function PLAYER:SetMuted(bool)

	if bool and self:IsAdmin() then return end
	
	self:__SetMuted(bool)
	
end
