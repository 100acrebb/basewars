include("include.lua")
AddCSLuaFile("include.lua")

local tag = "BaseWars.UTIL"

BaseWars.UTIL = {}

function BaseWars.UTIL.Log(...)
	
	MsgC("[BASEWARS] ", ...)
	MsgN("")
	
end

function BaseWars.UTIL.CleanupMap()

	for k, v in next, ents.FindByClass("game_text") do
	
		SafeRemoveEntity(v)
	
	end
	
end

include("modules.lua")
AddCSLuaFile("modules.lua")

BaseWars.ModuleLoader:Load()

hook.Add("InitPostEntity", tag .. ".CleanupMap", BaseWars.UTIL.CleanupMap)
