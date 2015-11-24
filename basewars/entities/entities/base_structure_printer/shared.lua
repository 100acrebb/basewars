ENT.Type = "anim"
ENT.Base = "base_structure_new"
ENT.PrintName = "Base Money Printer"
ENT.Author = "Q2F2"

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Power = 1
ENT.Efficiency = .05

ENT.MaxHP = 100
ENT.LabelColor = Color(140, 120, 83, 155)
ENT.DrawScale = 0.1

ENT.PrimaryModel = "models/props_lab/reciever01b.mdl"
ENT.Price = 1500
ENT.TableEntry = "maxBronzePrinter"

ENT.CalculateLabelAngles = function(self)
	local Ang = self:GetAngles()
	Ang:RotateAroundAxis(Ang:Up(), 90)
	return Ang
end

ENT.CalculateLabelPos = function(self)
	local Pos = self:GetPos()
	Pos = Pos + self:CalculateLabelAngles():Up() * 5
	return Pos
end

ENT.CalculateMoney = function(self)
	return self.CurrentValue * self.Efficiency
end
