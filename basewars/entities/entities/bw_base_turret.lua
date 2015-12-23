AddCSLuaFile()

ENT.Base = "bw_base_electronics"
ENT.Type = "anim"
 
ENT.PrintName = "Turret"
ENT.Model = "models/Combine_turrets/Floor_turret.mdl"
 
ENT.PowerRequired = 10
ENT.PowerMin = 1000
ENT.PowerCapacity = 2500
 
ENT.Drain = 35
 
ENT.Damage = 2
ENT.Radius = 750
ENT.ShootingDelay = 0.08
ENT.Ammo = -1
 
ENT.EyePosOffset = Vector( 0, 0, 0 )
ENT.Sounds = Sound( "npc/turret_floor/shoot1.wav" )

ENT.PresetMaxHealth = 500

ENT.AllwaysRaidable = true
 
if SERVER then
 
ENT.Spread = 15
ENT.NextShot = 0

function ENT:Init()

	self:SetModel(self.Model)
	
end
 
function ENT:SpawnBullet( target )
	if not self:IsPowered(self.PowerMin) then return end
   
	local tr = util.TraceLine( {
		start = self:GetPos() + self.EyePosOffset,
		endpos = target:LocalToWorld(target:OBBCenter()) + Vector( 0, 0, 10 ),
		filter = function( ent ) if ent:GetClass() == "player" or ent:GetClass() == "prop_physics" then return true end end,
	} )
 
	if tr.Entity == target then
		local bullet = self:GetBulletInfo(target)
	   
		self:DrainPower( self.Drain )
		self:FireBullets( bullet )
		self:EmitSound( self.Sounds )
		self.Ammo = self.Ammo - 1
	end
end

function ENT:GetBulletInfo(target)

	local bullet = {}
		bullet.Num = 1
		bullet.Damage = self.Damage
		bullet.Force = 1
		bullet.TracerName = "AR2Tracer"
		bullet.Spread = Vector( self.Spread, self.Spread, 0 )
		bullet.Src = self:GetPos() + self.EyePosOffset
		bullet.Dir = (target:LocalToWorld(target:OBBCenter()) + Vector( 0, 0, 10 )) - (self:GetPos() + self.EyePosOffset)
		
	return bullet
		
end
 
function ENT:ThinkFunc()
	if self.NextShot > CurTime() then return end
   
	self.EyePosOffset = self:GetUp() * 58 + self:GetForward() * 7 + self:GetRight() * 2
	local eyepos = self:GetPos() + self.EyePosOffset
   
	self.NextShot = CurTime() + self.ShootingDelay
   
	local plys = {}
   
	local find = ents.FindInCone( eyepos, self:GetForward(), self.Radius, math.rad(45) )
	for k, v in pairs( find ) do
		if not BaseWars.Ents:ValidPlayer( v ) then continue end
		if v == BaseWars.Ents:ValidOwner( self ) then continue end
		local Owner = BaseWars.Ents:ValidOwner( self )
		if Owner and not Owner:IsEnemy(v) then return end
		table.insert( plys, {ply=v, dist=self:GetPos():Distance( v:GetPos() ) } )
	end
   
	if #plys <= 0 then return end
	table.SortByMember( plys, "dist", true )
	if not BaseWars.Ents:ValidPlayer( plys[1].ply ) then return end
	if self.Ammo == 0 then return end
	self:SpawnBullet( plys[1].ply )
end
 
--[[else
 
ENT.Debug = 0
 
function ENT:Draw()
	self:DrawModel()
   
	if not self.Debug then return end
   
	self.EyePosOffset = self:GetUp() * 58 + self:GetForward() * 7 + self:GetRight() * 2
   
	local eyepos = self:GetPos() + self.EyePosOffset
   
	local find = ents.FindInCone( eyepos, self:GetForward(), self.Radius, math.rad(45) )
	for k, v in pairs( find ) do
		if v:GetClass() == "prop_physics" then
			local tr = util.TraceLine( {
				start = self:GetPos(),
				endpos = v:LocalToWorld(v:OBBCenter()),
				filter = function( ent ) if ent:GetClass() == "player" or ent:GetClass() == "prop_physics" then return true end end,
			} )
		   
			if tr.Entity ~= v then
				render.DrawLine( eyepos, tr.HitPos, Color( 255, 255, 0 ), true ) //If prop isnt the right one
			else
				render.DrawLine( eyepos, tr.HitPos, Color( 0, 255, 0 ), true ) //If prop is the right one
			end
		   
		elseif BaseWars.Ents:ValidPlayer( v ) then
			local tr = util.TraceLine( {
				start = self:GetPos() + self.EyePosOffset,
				endpos = v:LocalToWorld(v:OBBCenter()) + Vector( 0, 0, 10 ),
				filter = function( ent ) if ent:GetClass() == "player" or ent:GetClass() == "prop_physics" then return true end end,
			} )
		   
			if tr.Entity ~= v then
				render.DrawLine( eyepos, v:LocalToWorld(v:OBBCenter()) + Vector( 0, 0, 10 ), Color( 255, 0, 255 ), true ) //If prop is between player and turret
			else
				render.DrawLine( eyepos, tr.HitPos, Color( 0, 255, 0 ), true ) //If player is hitted
			end
		   
		end
	end
   
	for I=0,360 do
		local cone_direction = self:GetForward()
		cone_direction:Normalize()
	   
		local cosang = math.cos( math.rad( 45 ) )
	   
		local sin = math.sin( I ) * self.Radius
		local cos = math.cos( I ) * self.Radius
	   
		local pos = self:LocalToWorld( Vector( sin, cos, 5 ) )
		local dir = pos - self:LocalToWorld( Vector( 0, 0, 5 ) )
		dir:Normalize()
	   
		local dot = cone_direction:Dot( dir )
	   
		if dot > cosang then
			render.DrawLine( self:GetPos() + self:GetUp() * 5, self:LocalToWorld( Vector( sin, cos, 5 ) ), Color( 255, 0, 0 ), true )
		end
	end
end]]
 
end
