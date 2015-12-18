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
