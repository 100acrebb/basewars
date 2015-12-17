include("include.lua")
include("modules.lua")

BaseWars.ModuleLoader:Load()

if BaseWars.IsXmasTime() and materials then

	materials.ReplaceTexture("GM_CONSTRUCT/GRASS", "nature/snowfloor002a")

end
