
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:Initialize()

	self.Entity:SetModel( "models/props_lab/jar01a.mdl")
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	local phys = self.Entity:GetPhysicsObject()
	if(phys:IsValid()) then phys:Wake() end
	self.Entity:SetNWInt("damage", 20)
	self.Time = CurTime()
	timer.Create(tostring(self).."_Despawn", 40, 1, function()
		if not (self and IsValid(self)) then return end
		self:Remove()
	end)
end

function ENT:OnTakeDamage(dmg)
	self.Entity:SetNWInt("damage", self.Entity:GetNWInt("damage") - dmg:GetDamage())

	if(self.Entity:GetNWInt("damage") <= 0) then
		local effectdata = EffectData()
			effectdata:SetOrigin(self.Entity:GetPos())
			effectdata:SetMagnitude(2)
			effectdata:SetScale(2)
			effectdata:SetRadius(3)
		util.Effect("Sparks", effectdata)
		self.Entity:Remove()
	end
end

function ENT:Use(activator,caller)
	if (not caller:GetTable()[self.TableEntry]) then
		self.UseFunction(caller)
		self.Entity:Remove()
	end
end

function ENT:GetTime()
	return self.Time
end

function ENT:ResetTime()
	self.Time = CurTime()
end
