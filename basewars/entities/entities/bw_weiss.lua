AddCSLuaFile()

ENT.Base 		= "base_gmodentity"
ENT.Type 		= "anim"--e

ENT.PrintName 	= "Weiss Schnee"

ENT.Model 		= "models/jazzmcfly/rwby/weiss_schnee.mdl"
ENT.AutomaticFrameAdvance = true

ENT.Offset 		= Vector(0, 0, -3)
ENT.Offset2		= Vector(0, 0, 4)

ENT.TextColor	= Color(0, 150, 255, 255)

if CLIENT then

	local font = "BaseWars.NPCs.Weiss"
	surface.CreateFont(font, {
		font = "Segoe UI",
		size = 72,
		weight = 1200,
	})

	function ENT:Draw()

		self.Entity:DrawModel()

		local Ang = self:GetAngles()

		Ang:RotateAroundAxis(Ang:Forward(), 90)
		Ang:RotateAroundAxis(Ang:Right(), -90)
		
		local Tall = self:OBBMaxs()
		Tall.y = 0
		Tall.x = 0

		cam.Start3D2D(self:GetPos() + Tall - self:GetUp(), Ang, 0.095)
		
			draw.SimpleTextOutlined(self.PrintName, font, 0, 0, self.TextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 0.85, color_black)	
			
		cam.End3D2D()

	end

return end

function ENT:OnUse(ply)



end

function ENT:Initialize()

	self:SetModel(self.Model)

	self:PhysicsInit(SOLID_OBB)
	self:SetSolid(SOLID_OBB)
	self:SetMoveType(MOVETYPE_NONE)

	self:Activate()

	self.IDLESequence = 17--self:LookupSequence("idle_angry")
	
	timer.Simple(0, function() self:FixPosition() end)
	
end

function ENT:FixPosition()

	self:SetPos(self:GetPos() + self.Offset2)

	self:DropToFloor()
	self:SetPos(self:GetPos() + self.Offset)
	
	local Ang = self:GetAngles()
	Ang.r = 0
	Ang.p = 0
	
	self:SetAngles(Ang)
	
	local Phys = self:GetPhysicsObject()
	
	if BaseWars.Ents:Valid(Phys) then Phys:Sleep() end
	
	self:Activate()
	
end

function ENT:Think()

	if not self.IDLESequence then return end

    self:SetSequence(self.IDLESequence)
	
	local Time = CurTime() + self:SequenceDuration(self.IDLESequence)
	self:NextThink(Time)
	
	return true
	
end
