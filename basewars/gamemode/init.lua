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

function GM:GetFallDamage(ply, speed)

	local Velocity = speed - 526.5

	return Velocity * 0.225
	
end

function GM:SetupMove(ply, move)

	local State = self.BaseClass:SetupMove(ply, move)

	if not ply:Alive() then
	
		return State
		
	end
	
	if BaseWars.Drugs and ply:IsOnGround() then
	
		ply.DoubleJump_OnGround = true
		
	end
	
	if BaseWars.Drugs and ply:HasDrug("Steroid") then
	
		ply:SetWalkSpeed(BaseWars.Config.Drugs.Steroid.Walk)
		ply:SetRunSpeed(BaseWars.Config.Drugs.Steroid.Run)
		
	end
	
	return State
	
end

function GM:KeyPress(ply, code)

	if BaseWars.AFK then
	
		ply:ClearAFK()
		
	end
	
	local State = self.BaseClass:KeyPress(ply, code)

	if BaseWars.Drugs and code == IN_JUMP and ply.DoubleJump_OnGround and not ply:IsOnGround() and ply:HasDrug("DoubleJump") then
	
		ply:SetVelocity(ply:GetForward() * 100 + BaseWars.Config.Drugs.DoubleJump.JumpHeight)
		ply.DoubleJump_OnGround = false
		
	end
	
	return State
	
end

function GM:EntityTakeDamage(ent, dmginfo)

	local Inflictor = dmginfo:GetInflictor()
	local Attacker 	= dmginfo:GetAttacker()
	local Damage 	= dmginfo:GetDamage()
	
	local State = self.BaseClass:EntityTakeDamage(ent, dmginfo)
	
	if ent:IsPlayer() and dmginfo:IsDamageType(DMG_CRUSH) and Attacker:IsWorld() or (IsValid(Attacker) and not Attacker:CreatedByMap()) then
	
		dmginfo:SetDamage(0)
		
		return State
		
	end
	
	-- What the fuck is this
	-- Todo, rewrite this
	
	--[[
	local ignoredrug = false
	if inflictor:GetClass()=="env_fire" or inflictor:GetClass()=="env_physexplosion" or inflictor:GetClass()=="auto_turret_gun" or inflictor:GetClass()=="weapon_molotov" or inflictor:GetClass()=="weapon_flamethrower" orinflictor:GetClass()=="weapon_knife2" or inflictor:GetClass()=="weapon_gasgrenade" or inflictor:GetClass()=="weapon_tranqgun" or inflictor:GetClass()=="bigbomb" then
		ignoredrug = true
	end
	local scaler = 1
	if (inflictor:GetClass()=="env_physexplosion" or inflictor:GetClass()=="env_fire") && IsValid(inflictor.attacker) then
		attacker = inflictor.attacker
	end
	if (attacker.Amp == true && not inflictor:IsPlayer() && inflictor:GetClass()~="auto_turret_gun" && inflictor:GetClass()~="weapon_knife2" && inflictor:GetClass()~="weapon_gasgrenade" && inflictor:GetClass()~="weapon_tranqgun" && inflictor:GetClass()~="bigbomb") then
		--dmginfo:ScaleDamage(1.5)
		scaler = scaler*1.4
	end
	-- before even applying painkiller or anything, take the max damage it can be, then bounce back part of that.
	-- dont bounce knife damage because we dont want to risk bouncing poison
	-- dont bounce burning damage because itl get annoying for people to have to burn with other people
	if (ply.Mirror == true && attacker~=ply && not inflictor:IsPlayer() && ((dmginfo:IsExplosionDamage() && inflictor:GetClass()~="bigbomb" ) or not ignoredrug)) then
		attacker:TakeDamage(scaler*damage*0.25, ply, ply)
	end
	if (ply.PainKillered == true && attacker:IsPlayer() && attacker~=ply && inflictor:IsPlayer()==false) then
		--dmginfo:ScaleDamage(0.675)
		scaler = scaler*.675
	end
	-- fuck the mingebags and thier propfaggotry. only thing that would be left is prop pushing, but at least you dont die and lose your gun.
	if (attacker~=nil && attacker:IsPlayer()==false) then
		local class = attacker:GetClass()
		local donotwant = false
		if class== "entityflame" or inflictor:IsVehicle() or attacker:IsVehicle() or class==v or (class==v && v=="bigbomb" && not dmginfo:IsExplosionDamage()) or (inflictor:IsWorld() && (not dmginfo:IsFallDamage() or ply.Knockbacked)) then
			donotwant = true
		end
		for k, v in ipairs(BaseWars.Physgunables) do
			if (class==v && v~="bigbomb") or (class==v && v=="bigbomb" && not dmginfo:IsExplosionDamage()) or (inflictor:IsWorld() && not dmginfo:IsFallDamage()) then
				donotwant = true
			end
		end
		if donotwant then
			--dmginfo:ScaleDamage(0)
			scaler = 0
		end
	end
	if (inflictor~=nil && inflictor:IsPlayer()==false) then
		local class = inflictor:GetClass()
		local donotwant = false
		if class== "entityflame" or inflictor:IsVehicle() or attacker:IsVehicle() or class==v or (class==v && v=="bigbomb" && not dmginfo:IsExplosionDamage()) or (inflictor:IsWorld() && (not dmginfo:IsFallDamage() or ply.Knockbacked)) then
			donotwant = true
		end
		if donotwant then
			--dmginfo:ScaleDamage(0)
			scaler = 0
		end
	end
	if (ply:IsPlayer() or ply:IsNPC()) && attacker:IsPlayer() && not inflictor:IsPlayer() && not ignoredrug && attacker.Knockbacked && math.Rand(0,1)>.3 then
		local origin = inflictor:GetPos()
		local pos = ply:GetPos()+Vector(0,0,50)
		local yomomma = (pos-origin)
		yomomma:Normalize()
		local force = (dmginfo:GetDamage()*5)
		if force<100 then force = 100 end
		if force>700 then force = 700 end
		local knockdirection = yomomma*force+Vector(0,0,20)
		ply:SetVelocity(knockdirection)
		StunPlayer(ply, math.ceil(dmginfo:GetDamage()*0.1))
	end
	local tdamage = damage*scaler
	if not ply:IsPlayer() then return end
	if (scaler>0 && tdamage>=(ply:Health()+ply:Armor()) && ply.Shielded) then
		ply.Shieldon = true
		local IDSteam = BaseWars.FormatID(ply:SteamID())
		timer.Create(IDSteam .. "shield", 0.25, 1, function() if not IsValid(ply) then return end UnShield(ply) end)
		Notify(ply, 1, 3, "Snipe Shield Activated")
		ply:SetNWBool("shielded", false)
		ply.Shielded = false
		-- this is here so that fags can stop making bullshit claims about godmode.
		if (attacker:IsPlayer() && attacker~=ply) then
			Notify(attacker, 1, 3, "Target survived using Snipe Shieldnot ")
		end
		dmginfo:SetDamage((ply:Health()+ply:Armor())-1)
		dmginfo:ScaleDamage(1)
	elseif (ply.Shieldon) then
		-- for that 4th of a second, godmode them just so that this works against shotguns.
		--dmginfo:SetDamage(0)
		scaler = 0
		dmginfo:ScaleDamage(0)
	else
		dmginfo:ScaleDamage(scaler)
	end
	-- let leech heal the attacker, but only if they hit a player or npc, and its not poison or returned damage
	if (ply:IsPlayer() or ply:IsNPC()) && attacker:IsPlayer() && not inflictor:IsPlayer() && not ignoredrug && attacker.Leeched && attacker:Health()<attacker:GetMaxHealth() then
		attacker:SetHealth(attacker:Health()+(tdamage*.35))
		if attacker:Health()>attacker:GetMaxHealth() then
			attacker:SetHealth(attacker:GetMaxHealth())
		end
	end]]
	
	return State
	
end

function GM:PlayerShouldTakeDamage(ply, atk)
	
	local State = self.BaseClass:PlayerShouldTakeDamage(ply, atk)

	--[[
	for k, v in ipairs( ents.FindInSphere(ply:GetPos(), 500) ) do
		if (v:GetClass() == "info_player_deathmatch" or v:GetClass() == "info_player_rebel" or v:GetClass() == "gmod_player_start" or v:GetClass() == "info_player_start" or v:GetClass() == "info_player_allies" or v:GetClass() == "info_player_axis" or v:GetClass() == "info_player_counterterrorist" or v:GetClass() == "info_player_terrorist") then
			if IsValid(atk) and atk:IsPlayer() then Notify( atk, 4, 3, "Do not attempt to spawnkill" ) end
			return false
		end
	end
	for k, v in ipairs( ents.FindInSphere(atk:GetPos(), 500) ) do
		if (v:GetClass() == "info_player_deathmatch" or v:GetClass() == "info_player_rebel" or v:GetClass() == "gmod_player_start" or v:GetClass() == "info_player_start" or v:GetClass() == "info_player_allies" or v:GetClass() == "info_player_axis" or v:GetClass() == "info_player_counterterrorist" or v:GetClass() == "info_player_terrorist") then
			if IsValid(atk) and atk:IsPlayer() then Notify( atk, 4, 3, "Do not attempt to spawncamp" ) end
			return false
		end
	end
	self.BaseClass:PlayerShouldTakeDamage( ply, atk )
	return true]]
	
	return State
	
end

local LastThink = CurTime()
local Spawns 	= {}

local function ScanEntities()

	Spawns = {}

	for k, v in next, ents.GetAll() do

		local Class = v:GetClass()
		
		if 
			Class == "info_player_deathmatch" or 		Class == "info_player_rebel" or
			Class == "gmod_player_start" or 			Class == "info_player_start" or
			Class == "info_player_allies" or 			Class == "info_player_axis" or
			Class == "info_player_counterterrorist" or 	Class == "info_player_terrorist" then
			
			Spawns[#Spawns+1] =  v
			
		end
		
	end
	
end

function GM:Think()

	local State = self.BaseClass:Think()
	
	if LastThink < CurTime() - 3 then
	
		for k, s in next, Spawns do
		
			if not s or not IsValid(s) then
			
				ScanEntities()
				
				return
				
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

	local State = self.BaseClass:InitPostEntity()
	
	ScanEntities()
	
	return State
	
end

ScanEntities()

function GM:PlayerNoClip(ply, state)

	local Admin = ply:IsAdmin()
	
	if aowl and not Admin and not State and not ply.__is_being_physgunned then
	
		return true
		
	end
	
	return Admin
	
end
