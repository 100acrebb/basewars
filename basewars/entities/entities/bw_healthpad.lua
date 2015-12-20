ENT.Base = "bw_base_electronics"
ENT.Type = "anim"
 
ENT.PrintName = "HealthPad"
ENT.Model = "models/props_trainstation/trainstation_clock001.mdl"
 
ENT.PowerRequired = 10
ENT.PowerCapacity = 5000
 
ENT.Drain = 50
 
ENT.RegenRate = 1
ENT.Plys = {}

ENT.Sound = Sound("npc/vort/health_charge.wav")
ENT.Radius = 48

if CLIENT then return end

local ForceAngle = Angle(-90, 0, 0)
function ENT:Init()

	self:SetAngles(ForceAngle)
	self:SetTrigger(true)
   
	self.Maxs = Vector(self.Radius, self.Radius, 105)
	self.Mins = Vector(-self.Radius, -self.Radius, 0)
   
end

function ENT:ThinkFunc()
	
	local Ents = ents.FindInBox(self:GetPos() + self.Mins, self:GetPos() + self.Maxs)
   
	for k, ply in next, Ents do
		
		if not BaseWars.Ents:ValidPlayer(ply) then continue end
		if ply:Health() >= ply:GetMaxHealth() then continue end
		
		ply:SetHealth(ply:Health() + self.RegenRate)
		
		self:DrainPower(self.Drain)
		self:EmitSound(self.Sound)
		
		if ply:Health() >= ply:GetMaxHealth() then
			
			ply:SetHealth(ply:GetMaxHealth())
			
		end
		
	end
	
end
