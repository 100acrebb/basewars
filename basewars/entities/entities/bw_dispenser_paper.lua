AddCSLuaFile()

ENT.Base 				= "bw_base_electronics"
ENT.Type 				= "anim"

ENT.PrintName 			= "Automated Paper Dispenser"
ENT.Author 				= "Q2F2"

ENT.Model 				= "models/props_lab/plotter.mdl"
ENT.Sound				= Sound("HL1/fvox/blip.wav")

ENT.Radius				= 600
ENT.PaperAmt			= 50

ENT.PowerRequired		= 15
ENT.Drain				= 10

function ENT:Init()

	self:SetModel(self.Model)
	self:SetHealth(1000)
	
	self:SetUseType(CONTINUOUS_USE)
	
end

function ENT:UseFunc(ply)
	
	if not BaseWars.Ents:ValidPlayer(ply) then return end
	if self.Time and self.Time + BaseWars.Config.DispenserTime > CurTime() then return end
	
	self.Time = CurTime()
	
	local Ents = ents.FindInSphere(self:GetPos(), self.Radius)
	
	for k, v in next, Ents do
	
		if not BaseWars.Ents:Valid(v) then continue end
		if not v.AddPaper then continue end
		
		if not self:DrainPower(self.Drain) then return end
		
		v:AddPaper(self.PaperAmt)
		
	end
	
end
