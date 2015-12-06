include("include.lua")
AddCSLuaFile("include.lua")

include("modules.lua")
AddCSLuaFile("modules.lua")

BaseWars.ModuleLoader:Load()

function GM:SetupPlayerVisibility(ply)

	for _, v in next, ents.FindByClass("bw_bigbomb") do
	
		if v:GetNWBool("armed") then
		
			AddOriginToPVS(v:GetPos())
			
		end
		
	end
	
end

function GM:GetFallDamage(ply, speed)

	local Velocity = speed - 526.5
	local Armor = math.Clamp(ply:Armor(), 0, 100)

	if Armor > 0 and Velocity > 0 then
		
		ply:SetArmor(ply:Armor() - Velocity * 0.025)

	end

	return Velocity * 0.225 * ((200 - Armor) / 500)
	
end

function GM:SetupMove(ply, move)

	local State = self.BaseClass:SetupMove(ply, move)

	if not ply:Alive() then
	
		return State
		
	end
	
	if BaseWars.Drugs and ply:IsOnGround() then
	
		ply.DoubleJump_OnGround = true
		
	end
	
	return State
	
end

function GM:KeyPress(ply, code)

	self.BaseClass:KeyPress(ply, code)

	if BaseWars.Drugs and code == IN_JUMP and ply.DoubleJump_OnGround and not ply:IsOnGround() and ply:HasDrug("DoubleJump") then
	
		ply:SetVelocity(ply:GetForward() * 100 + BaseWars.Config.Drugs.DoubleJump.JumpHeight)
		ply.DoubleJump_OnGround = false
		
	end
	
end

function GM:EntityTakeDamage(ent, dmginfo)
	
	self.BaseClass:EntityTakeDamage(ent, dmginfo)
	
	local Inflictor = dmginfo:GetInflictor()
	local Attacker 	= dmginfo:GetAttacker()
	local Damage 	= dmginfo:GetDamage()
	
	local Scale = 1
	
	if Attacker:IsPlayer() and Attacker:HasDrug("Rage") and Attacker ~= ent and not Inflictor.IsRaidDevice then
	
		Scale = Scale * BaseWars.Config.Drugs.Rage.Mult
		
	end
	
	if ent:IsPlayer() then
	
		if not Attacker:IsPlayer() and dmginfo:IsDamageType(DMG_CRUSH) and (Attacker:IsWorld() or (IsValid(Attacker) and not Attacker:CreatedByMap())) then
		
			dmginfo:SetDamage(0)
			
			return
			
		end
		
		local FriendlyFire = BaseWars.Config.AllowFriendlyFire
		local Team = ent:GetFaction()
		
		if not FriendlyFire and ent:InFaction() and Attacker:IsPlayer() and Attacker:InFaction(Team) then
			
			dmginfo:SetDamage(0)
			
			return
			
		end
		
		if ent:HasDrug("PainKiller") and Attacker:IsPlayer() and Attacker ~= ent then
		
			Scale = Scale * BaseWars.Config.Drugs.PainKiller.Mult
			
		end
		
		local TakeDamage = Damage * Scale
		
		if TakeDamage >= ent:Health() and ent:HasDrug("Shield") and not ent.ShieldOn then
		
			ent.ShieldOn = true
			ent:RemoveDrug("Shield")
			
			local TID = ent:SteamID64() .. ".ShieldGod"
			local f = function()
			
				if not IsValid(ent) then return end
				
				ent.ShieldOn = nil
				
			end
			timer.Create(TID, 0.5, 1, f)
			
			if Attacker:IsPlayer() and Attacker ~= ent then
			
				Attacker:Notify(BaseWars.LANG.ShieldSave, BASEWARS_NOTIFICATION_DRUG)
				
			end
			
			dmginfo:SetDamage(math.min(ent:Health() * 0.9, ent:Health() - 1))
			dmginfo:ScaleDamage(1)
			
			return
			
		elseif ent.ShieldOn then
		
			dmginfo:ScaleDamage(0)
			
		return end
		
	end
	
	dmginfo:ScaleDamage(Scale)
	
end

local SpawnClasses = {
	["info_player_deathmatch"] = true,
	["info_player_rebel"] = true,
	["gmod_player_start"] = true,
	["info_player_start"] = true,
	["info_player_allies"] = true,
	["info_player_axis"] = true,
	["info_player_counterterrorist"] = true,
	["info_player_terrorist"] = true,
}

local LastThink = CurTime()
local Spawns 	= {}

local function ScanEntities()

	Spawns = {}

	for k, v in next, ents.GetAll() do
	
		if not v or not IsValid(v) or k < 1 then continue end

		local Class = v:GetClass()
		
		if SpawnClasses[Class] then
			
			Spawns[#Spawns+1] =  v
			
		end
		
	end
	
end

function GM:PlayerShouldTakeDamage(ply, atk)
	
	if not IsValid(atk) or not atk:IsPlayer() or ply == atk then
	
		return true
		
	end

	for k, v in next, ents.FindInSphere(ply:GetPos(), 500) do
	
		local Class = v:GetClass()
	
		if SpawnClasses[Class] then
		
			atk:Notify(BaseWars.LANG.SpawnKill, BASEWARS_NOTIFICATION_ERROR)
			
			return false
			
		end
		
	end
	
	for k, v in next, ents.FindInSphere(atk:GetPos(), 500) do
	
		local Class = v:GetClass()
	
		if SpawnClasses[Class] then
		
			atk:Notify(BaseWars.LANG.SpawnCamp, BASEWARS_NOTIFICATION_ERROR)
			
			return false
			
		end
		
	end
	
	return true
	
end

function GM:Think()

	local State = self.BaseClass:Think()
	
	if LastThink < CurTime() - 3 then
	
		for k, s in next, Spawns do
		
			if not s or not IsValid(s) then
			
				ScanEntities()
				
				return State
				
			end
			
			local Ents = ents.FindInSphere(s:GetPos(), 700)
			
			if #Ents < 2 then
			
				continue
				
			end
		
			for _, v in next, Ents do
			
				if v.BeingRemoved or v.NoFizz then
				
					continue
					
				end
			
				local Owner = v:CPPIGetOwner()
				
				if not Owner or not IsValid(Owner) or not Owner:IsPlayer() then
				
					continue
					
				end
			
				if v:GetClass() == "prop_physics" then
				
					v.BeingRemoved = true
					v:Remove()
					
					Owner:Notify(BaseWars.LANG.DontBuildSpawn, BASEWARS_NOTIFICATION_ERROR)
					
				end
				
			end
			
		end
		
		LastThink = CurTime()
	
	end
	
	return State
	
end

function GM:InitPostEntity()

	self.BaseClass:InitPostEntity()
	
	ScanEntities()
	
end

ScanEntities()
