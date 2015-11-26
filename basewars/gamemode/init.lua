include("include.lua")
AddCSLuaFile("include.lua")

local tag = "BaseWars.UTIL"

BaseWars.UTIL = {}

function BaseWars.UTIL.Log(...)
	
	MsgC("[BASEWARS] ", ...)
	MsgN("")
	
end

include("modules.lua")
AddCSLuaFile("modules.lua")

BaseWars.ModuleLoader:Load()
