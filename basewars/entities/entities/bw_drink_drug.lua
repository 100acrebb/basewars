ENT.Base = "bw_base_drink"
ENT.HealAmount = 0
ENT.Random = true

ENT.Model = "models/props_junk/PopCan01a.mdl"

ENT.Effects = {
	"DoubleJump",
	"Steroid",
	"Adrenaline",
	"Rage",
	"Regen",
	"Shield",
}

if SERVER then

	AddCSLuaFile()

	function ENT:Init()

		if self.Random then

			self:SetSkin(math.random(0, 2))

			self.DrugEffect = self.Effects[math.random(1, #self.Effects)]
			
		end

	end
	
	function ENT:OnDrink(ply)
	
		ply:ApplyDrug(self.DrugEffect, self.DrugDuration)
	
	end

end
