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
	
	IncludeCS("shared/player_util.lua")
	IncludeCS("shared/karma.lua")
	IncludeCS("shared/factions.lua")
	IncludeCS("shared/money.lua")

end

do

	LoadFileCS("client/hud.lua")
	LoadFileCS("client/playtime_money.lua")

end
