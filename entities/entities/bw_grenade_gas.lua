AddCSLuaFile()

ENT.Base = "base_gmodentity"
ENT.Type = "anim"
ENT.PrintName = "Gas Grenade"

ENT.Model = "models/weapons/w_eq_flashbang.mdl"

ENT.Curtime = CurTime()

ENT.Once = false

ENT.Color = Color(50, 255, 50, 255)

function ENT:SpewGas()

		if self.Once then return end
		
		if not self then return end
		if not self.Entity then return end
		if not self.Entity:IsValid() then return end
		
		self.Once = true
		
		self:SetMoveType(MOVETYPE_NONE)
		self:EmitSound("weapons/ar2/npc_ar2_altfire.wav", 72, 100)
		self:EmitSound("weapons/ar2/ar2_altfire.wav", 72, 100)
		local gas = EffectData()
			gas:SetOrigin(self:GetPos())
			
		util.Effect("gasnade_gas", gas)
		
end
function ENT:Think()

	if CurTime() > self.Curtime + 4 then
		if not self:IsValid() then return end
		if not self.Owner then return end
		
		self:SpewGas()
		
		for k, v in next, ents.FindInSphere(self:GetPos(), 220) do
		
			if !v:IsPlayer() then continue end
			
			local d = DamageInfo()
				d:SetDamage(3)
				d:SetDamageType(DMG_RADIATION)
				d:SetAttacker(self)
			v:TakeDamageInfo(d)
			
			v:ApplyDrug("Poison", 8, self.Owner, self.Owner)
			v:ScreenFade(SCREENFADE.IN, Color(20, 200, 20, 100), 0.1, 0)
			
			local e = EffectData()
				e:SetStart(v:GetPos()+Vector(0, 0, 32))
				e:SetOrigin(v:GetPos()+Vector(0, 0, 32))
				e:SetScale(4)
			util.Effect("AntlionGib", e) -- fuck you
		end
	end
	
	if CurTime() > self.Curtime + 19 then
	
		if not self:IsValid() then return end
		
		self:Remove()
		
	end
	
end

function ENT:Initialize()

	self.Curtime = CurTime()
	self:SetModel(self.Model)
	self:SetMaterial("models/dav0r/hoverball")

	self:SetColor(self.Color)

	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then phys:Wake() end
	
end

function ENT:PhysicsCollide( data, physobj )

	self.Entity:EmitSound("physics/metal/weapon_impact_soft" .. (math.random(1, 2)) .. ".wav", 200, 100,1)
	
end
