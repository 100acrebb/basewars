DeriveGamemode("sandbox")

local function IncludeCS(File)

	include(File)
	
	if SERVER then
	
		AddCSLuaFile(File)
		
	end
	
end

local function LoadFileCS(File)

	if CLIENT then
		
		include(File)
		
	else

		AddCSLuaFile(File)
		
	end
	
end

do

	IncludeCS("shared.lua")
	IncludeCS("language.lua")
	IncludeCS("config.lua")
	
	IncludeCS("shared/spawnmenu.lua")
	
	--IncludeCS("shared/player_util.lua")
	--IncludeCS("shared/karma.lua")
	--IncludeCS("shared/factions.lua")
	--IncludeCS("shared/money.lua")
	
	IncludeCS("shared/cppi.lua")
	
	if BaseWars.Config.CustomChat then
	
		IncludeCS("shared/chitchat.lua")
		
	end
	
	IncludeCS("shared/utf8_extender.lua")
	
	if BaseWars.Config.ExtraStuff then
		
		IncludeCS("shared/playuhr.lua")
		IncludeCS("shared/customnick.lua")
		IncludeCS("shared/hostnamefix.lua")
		
		IncludeCS("shared/MetaStruct/anime.lua")
		
	end

end

do

	LoadFileCS("client/cl_bwmenu.lua")
	LoadFileCS("client/cl_npcmenu.lua")

	if BaseWars.Config.CustomChat then
	
		LoadFileCS("shared/MetaStruct/markup.lua")
		LoadFileCS("shared/MetaStruct/expression.lua")
		LoadFileCS("shared/MetaStruct/ch.lua")
	
		LoadFileCS("client/qchat.lua")
		
	end
	
	--LoadFileCS("client/hud.lua")
	--LoadFileCS("client/playtime_money.lua")

end
