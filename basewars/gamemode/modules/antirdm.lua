MODULE.Name 	= "AntiRDM"
MODULE.Author 	= "Q2F2 & Ghosty"

local tag = "BaseWars.AntiRDM"
local PLAYER = debug.getregistry().Player

local function Curry(f)

	local MODULE = MODULE
	local function curriedFunction(...)
		return f(MODULE, ...)
	end

	return curriedFunction

end

if CLIENT then

surface.CreateFont(tag, {
	font = "FixedSys",
	size = 46,
	weight = 2000,
	antialias = false,
})

function MODULE:GetRespawnTime(ply)
	return ply:GetNWInt( "RespawnTime", 0 )
end
PLAYER.GetRespawnTime = Curry(MODULE.GetRespawnTime)
	
function MODULE:Paint()

	local ply = LocalPlayer()

	if (ply.IsAFK and ply:IsAFK()) or not ply:GetRespawnTime() or ply:Alive() then return end
	
	local len = ply:GetRespawnTime()
	local m = math.floor(len / 60) % 60
	local s = math.floor(len) % 60

	local RespawnTime = string.format("%.2d:%.2d", m, s)

	surface.SetFont(tag)
	local w, h = surface.GetTextSize(RespawnTime)
	
	surface.SetTextColor(color_black)
	
	surface.SetTextPos(ScrW() / 2 - w / 2 + 1, ScrH() / 3 + 1)
	surface.DrawText(RespawnTime)
	
	surface.SetTextColor(color_white)
	
	surface.SetTextPos(ScrW() / 2 - w / 2, ScrH() / 3)
	surface.DrawText(RespawnTime)
	
	local Txt = BaseWars.LANG.RespawnIn
	local w2, h2 = surface.GetTextSize(Txt)
	
	surface.SetTextColor(color_black)
	
	surface.SetTextPos(ScrW() / 2 - w2 / 2 + 1, ScrH() / 3 - h2)
	surface.DrawText(Txt)
	
	surface.SetTextColor(color_white)
	
	surface.SetTextPos(ScrW() / 2 - w2 / 2, ScrH() / 3 - h2 - 1)
	surface.DrawText(Txt)
	
end
hook.Add("HUDPaint", tag .. ".Paint", Curry(MODULE.Paint))
	
else

function MODULE:IsRDM(ply, ply2)

	if ply == ply2 then return false end

	if ply:InRaid() and ply2:InRaid() then return false end
	
	if ply.RecentlyHurtBy[ply2] and ply.RecentlyHurtBy[ply2] < CurTime() + BaseWars.Config.AntiRDM.HurtTime then return false end
	
	ply2.RDMS = ply2.RDMS or 0
	ply2.RDMS = ply2.RDMS + 1
	print( ply2:Name() .. " Rdmed" )
	return true

end

function MODULE:CalculateSpawnTime( ply )
	local delay = 0
	delay = delay + (ply.RDMS * 2)
	
	local karma = ply:GetKarma()
	if karma < 0 then
		local karma = math.abs( ply:GetKarma() )
		delay = delay + (karma/10)
	end
	
	print( "SPAWNTIME FOR " .. ply:Name() .. " = " .. delay )
	
	return CurTime() + delay
end
PLAYER.CalculateSpawnTime = Curry(MODULE.CalculateSpawnTime)

function MODULE:OnEntityTakeDamage(ply, dmginfo)

	local Attacker = dmginfo:GetAttacker()
	if not BaseWars.Ents:ValidPlayer(Attacker) then return end
	
	ply.RecentlyHurtBy = ply.RecentlyHurtBy or {}
	ply.RecentlyHurtBy[Attacker] = CurTime()

end
hook.Add("OnTakeDamage", tag .. ".TakeDamage", Curry(MODULE.OnEntityTakeDamage))

function MODULE:PlayerDeath(ply, inflictor, attacker)

	if not BaseWars.Ents:ValidPlayer(attacker) then return end
	if not self:IsRDM(ply, attacker) then return end
	
	ply.RecentlyHurtBy = {}
	ply.NextSpawn = ply:CalculateSpawnTime()
	ply.RDMS = 0

end
hook.Add("PlayerDeath", tag .. ".PlayerDeath", Curry(MODULE.PlayerDeath))

function MODULE:PlayerDeathThink()
	for k, ply in pairs( player.GetAll() ) do
		if ply:Alive() then return end
		ply:SetNWInt( "RespawnTime", ply.NextSpawn - CurTime() )
		
		if CurTime() >= ply.NextSpawn then
			return true
		end
		
		return false
	end
end
hook.Add("PlayerDeathThink", tag .. ".PlayerDeathThink", Curry(MODULE.PlayerDeathThink))

function MODULE:PlayerInitialSpawn( ply )
	ply.NextSpawn = math.huge
	ply.RecentlyHurtBy = {}
	ply.RDMS = 0
end
hook.Add("PlayerInitialSpawn", tag .. ".PlayerInitialSpawn", Curry(MODULE.PlayerInitialSpawn))

end
