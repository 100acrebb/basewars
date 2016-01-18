AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')
function ENT:Initialize()
self.Entity:SetModel("models/weapons/w_eq_flashbang.mdl")
self.Entity:SetMaterial("models/dav0r/hoverball")
self.Entity:SetColor(Color(50,255,50))
self.Entity:PhysicsInit( SOLID_VPHYSICS )
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
self.Entity:SetSolid( SOLID_VPHYSICS )
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
	phys:Wake()
	local GasTheJews = function()
	if !self then return end
	if !self.Entity then return end
	if !self.Entity:IsValid() then return end
	if (SERVER) then
		self.Entity:SetMoveType(MOVETYPE_NONE)
		self.Entity:EmitSound( "weapons/ar2/npc_ar2_altfire.wav", 72, 100 )
		self.Entity:EmitSound( "weapons/ar2/ar2_altfire.wav", 72, 100 )
		local gas = EffectData()
		gas:SetOrigin(self:GetPos())
		util.Effect("gasnade_gas",gas)
		timer.Create("GasNade"..tostring(self.Entity),0.10,138,function()
		if not BaseWars.Ents:ValidPlayer(v) or not v:Alive() then return end
		if not self.Owner:IsEnemy(v) then return end
		local Plys = ents.FindInSphere(self:GetPos(), 220)
		local Pos = self:GetPos()
		if !self.Entity then return end
		if !self.Entity:IsValid() then return end
		for k, v in next, Plys do
			if !v:IsPlayer() then continue end
			local d = DamageInfo()
			d:SetDamage(2)
			d:SetDamageType(DMG_RADIATION)
			d:SetAttacker(self)

			v:TakeDamageInfo(d)
			v:ApplyDrug("Poison", 4,self.Owner,self.Owner)
			v:ScreenFade(SCREENFADE.IN, Color(20,200,20,100), 0.1, 0)

			local e = EffectData()
			e:SetStart(v:GetPos()+Vector(0,0,32))
			e:SetOrigin(v:GetPos()+Vector(0,0,32))
			e:SetScale(4)

			util.Effect("AntlionGib", e)
		end
		end)
		timer.Simple(14,function()
			self:Remove()
		end)
		end
		end
		timer.Simple(4,GasTheJews)
		end
end

function ENT:PhysicsCollide( data, physobj )
	self.Entity:EmitSound("physics/metal/weapon_impact_soft" .. (math.random(1,2)) .. ".wav", 200, 100,1)
end