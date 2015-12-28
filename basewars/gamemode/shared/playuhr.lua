PlayTime = {}

local PLAYER = debug.getregistry().Player

if SERVER then
	
PlayTime.LastThink = CurTime() + 1

hook.Add( "Initialize", function()
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
	ply.GlobalTime = self:GetPData( "GlobalTime", 0 )
end )

hook.Add( "PlayerDisconnect", "PlayTime.Disconnect", function( ply )
	ply:SetPData( "GlobalTime", ply.GlobalTime + ply:GetSessionTime() )
end )

end 

function PLAYER:GetPlayTime()
	if SERVER then
		return math.Round( self.GlobalTime + self:GetSessionTime() )
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
