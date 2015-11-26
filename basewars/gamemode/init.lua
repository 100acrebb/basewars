include("include.lua")
AddCSLuaFile("include.lua")

local tag = "BaseWars.UTIL"

BaseWars.UTIL = {}

local colorRed 		= Color(255, 0, 0)
local colorBlue 	= Color(0, 0, 255)
local colorWhite 	= Color(255, 255, 255)

function BaseWars.UTIL.Log(...)
	
	MsgC(SERVER and colorRed or colorBlue, "[BaseWars] ", colorWhite, ...)
	MsgN("")
	
end

include("modules.lua")
AddCSLuaFile("modules.lua")

BaseWars.ModuleLoader:Load()
