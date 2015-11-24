ENT.Type 			= "anim"
ENT.Base 			= "base_gmodentity"

ENT.PrintName		= "Base Structure"
ENT.Author			= "HLTV Proxy And Q2F2"

ENT.Spawnable		= false
ENT.AdminSpawnable	= false

ENT.Power			= 0
ENT.Structure		= true

ENT.MaxLevel		= 2
ENT.Price			= 1337
ENT.CurrentValue	= 1337

function ENT:Initialize()
	self:SetNWInt("power", 0)
end

function ENT:IsPowered()
	return (self:GetNWInt("power") >= self.Power)
end

function ENT:GetLevel()
	return self:GetNWInt("upgrade")
end
