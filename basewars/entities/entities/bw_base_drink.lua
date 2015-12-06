--easylua.StartEntity("bw_base_drink")

ENT.Base = "base_gmodentity"
ENT.Type = "anim"

ENT.HealAmount 	= 15
ENT.MaxHealth 	= 200
ENT.MinHealth	= 5

ENT.Model 		= "models/props_junk/PopCan01a.mdl"
ENT.Skin 		= 0
ENT.DrinkSound	= "ambient/levels/canals/toxic_slime_gurgle4.wav"

function ENT:Init()

end

if SERVER then

	AddCSLuaFile()
	
	function ENT:Initialize()

		self:SetModel(self.Model)
		self:SetSkin(self.Skin)

		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)

		self:PhysWake()

		self:Activate()

		self:SetUseType(SIMPLE_USE)

		self:Init()

	end

	function ENT:Drink(ply)

		ply:EmitSound(self.DrinkSound)

		if ply:Health() <= self.MaxHealth then

			ply:SetHealth(math.Clamp(ply:Health() + self.HealAmount, self.MinHealth, self.MaxHealth))

		end

		self:Remove()

	end

	function ENT:Use(activator, caller, usetype, value)

		if activator:IsPlayer() and caller:IsPlayer() then
			
			self:Drink(activator)

		end

	end

else

	function ENT:Initialize()

		self:Init()

	end

end

--easylua.EndEntity()