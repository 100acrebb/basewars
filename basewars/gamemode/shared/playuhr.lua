PlayTime = PlayTime or {}

local PLAYER = debug.getregistry().Player

if SERVER then
	
PlayTime.LastThink = CurTime() + 1

function PlayTime:Init()
	if not file.IsDir( "basewars_time", "DATA" ) then file.CreateDir( "basewars_time" ) end
end

function PlayTime:GetGlobalTimeFile( ply )
	local dir = "basewars_time/" .. ply:SteamID64()
	if not file.IsDir( dir, "DATA" ) then
		file.CreateDir( dir )
		file.Write( dir .. "/time.txt", "0" )
		return 0	
	else
		return tonumber(file.Read( dir .. "/time.txt" ))
	end
end

function PlayTime:SetGlobalTimeFile( ply, time )
	local dir = "basewars_time/" .. ply:SteamID64()
	if not file.IsDir( dir, "DATA" ) then
		file.CreateDir( dir )
		file.Write( dir .. "/time.txt", "0" )
	else
		file.Write( dir .. "/time.txt", time )
	end
end

hook.Add( "Initialize", function()
	PlayTime:Init()
	PlayTime.LastThink = CurTime() + 1	//Not needed? Don't know
end )

hook.Add( "Think", "PlayTime.Think", function()
	if not (CurTime() > PlayTime.LastThink) then return end
	PlayTime.LastThink = CurTime() + 1
	
	for k, v in pairs( player.GetAll() ) do
		v:SetNWInt( "SessionTime", v:GetSessionTime() )
		v:SetNWInt( "GlobalTime", v:GetPlayTime() )
	end
end )

hook.Add( "PlayerInitialSpawn", "PlayTime.Connect", function( ply )
	ply.JoinTime = CurTime()
	ply.GlobalTime = PlayTime:GetGlobalTimeFile( ply )
end )

hook.Add( "PlayerDisconnected", "PlayTime.Disconnect", function( ply )
	PlayTime:SetGlobalTimeFile( ply, ply.GlobalTime + ply:GetSessionTime() )
end )

end 

function PLAYER:GetPlayTime()
	if SERVER then
		return math.Round( (self.GlobalTime or 0) + self:GetSessionTime() )
	else
		return math.Round( self:GetNWInt( "GlobalTime", 0 ) + self:GetSessionTime() )
	end
end

function PLAYER:GetPlayTimeTable()
	local tbl = {}
	local time = 0
	if SERVER then
		time = self:GetPlayTime() or 0
	else
		time = self:GetNWInt( "GlobalTime", 0 )
	end
	
	tbl.h = math.floor(time / 60 / 60)
	tbl.m = math.floor(time / 60) % 60
	tbl.s = math.floor(time) % 60
	
	return tbl
end

function PLAYER:GetSessionTime()
	if SERVER then
		return math.Round( CurTime() - self.JoinTime )
	else
		return math.Round( CurTime() - self:GetNWInt( "SessionTime", 0 ) )
	end
end

function PLAYER:GetSessionTable()
	local tbl = {}
	local time = 0
	if SERVER then
		time = self:GetSessionTime() or 0
	else
		time = self:GetNWInt( "SessionTime", 0 )
	end
	
	tbl.h = math.floor(time / 60 / 60)
	tbl.m = math.floor(time / 60) % 60
	tbl.s = math.floor(time) % 60
	
	return tbl
end
