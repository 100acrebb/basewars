AddCSLuaFile()

ENT.Base 		= "base_gmodentity"
ENT.Type 		= "anim"
ENT.PrintName 	= "Repair Kit"

ENT.Model 		= "models/Items/car_battery01.mdl"

if CLIENT then return end

function ENT:Initialize()

	self.BaseClass:Initialize()

	self:SetModel(self.Model)

	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)

	self:PhysWake()

	self:Activate()
	
end

function ENT:PhysicsCollide(data, phys)

	self.BaseClass:PhysicsCollide(data, phys)

	local ent = data.HitEntity
	if not BaseWars.Ents:Valid(ent) then return end
	
	if ent.Repair and not self.Removing and ent:Health() < ent:MaxHealth() - 1 then
	
		ent:Repair()
		
		self.Removing = true
		self:Remove()
		
	return end
	
	if ent.DestructableProp and not self.Removing and ent:Health() < ent.MaxHealth - 1 then
	
		ent:SetHealth(ent.MaxHealth)
		ent:SetColor(color_white)
	
		self.Removing = true
		self:Remove()
		
	return end

end
