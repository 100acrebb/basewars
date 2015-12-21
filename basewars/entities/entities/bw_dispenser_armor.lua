AddCSLuaFile()

ENT.Base 				= "bw_base_electronics"
ENT.Type 				= "anim"

ENT.PrintName 			= "Armour Dispenser"
ENT.Author 				= "Q2F2"

ENT.Model 				= "models/props_combine/suit_charger001.mdl"

function ENT:Init()

	self:SetModel(self.Model)
	self:SetHealth(500)
	
	self:SetUseType(CONTINUOUS_USE)
	
end

function ENT:UseFunc(ply)
	
	if not BaseWars.Ents:ValidPlayer(ply) then return end
	if self.Time and self.Time + BaseWars.Config.DispenserTime > CurTime() then return end
	
	self.Time = CurTime()
	
	if ply:Armor() > 100 then return end
	
	ply:SetArmor(Armor + 10)
	
	if ply:Armor() > 100 then ply:SetArmor(100) end
	
end
