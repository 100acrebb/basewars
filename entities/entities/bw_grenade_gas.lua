AddCSLuaFile()

ENT.Base = "base_gmodentity"
ENT.Type = "anim"
ENT.PrintName = "Gas Grenade"

ENT.Model = "models/weapons/w_eq_flashbang.mdl"

ENT.Color = Color(50, 255, 50, 255)

if SERVER then

function ENT:Initialize()

	self:SetModel(self.Model)
	self:SetMaterial("models/dav0r/hoverball")

	self:SetColor(self.Color)

	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then phys:Wake() end

	local Gas = function()

		if not self:IsValid() then return end

		self:SetMoveType(MOVETYPE_NONE)

		self:EmitSound("weapons/ar2/npc_ar2_altfire.wav", 72, 100)
		self:EmitSound("weapons/ar2/ar2_altfire.wav", 72, 100)

		local gas = EffectData()
			gas:SetOrigin(self:GetPos())
		util.Effect("gasnade_gas", gas)

		timer.Create("GasNade"..tostring(self), 0.10, 138, function()

			if not self:IsValid() then return end

			local Owner = self.Owner

			if not Owner then return end

			local Pos = self:GetPos()
			local Plys = ents.FindInSphere(Pos, 220)

			for k, v in next, Plys do

				if not BaseWars.Ents:ValidPlayer(v) or not v:Alive() then continue end
				if not Owner:IsEnemy(v) then continue end

				v:ApplyDrug("Poison", 4, self.Owner, self.Owner)
				v:ScreenFade(SCREENFADE.IN, Color(20,200,20,100), 0.1, 0)

				local e = EffectData()
					e:SetStart(v:GetPos() + Vector(0,0,32))
					e:SetOrigin(v:GetPos() + Vector(0,0,32))
					e:SetScale(4)
				util.Effect("BloodImpact", e)

			end

		end)

		timer.Simple(14, function()

			if not self:IsValid() then return end

			self:Remove()

		end)

	end

	timer.Simple(4, Gas)

end

function ENT:PhysicsCollide(data, physobj)

	self:EmitSound("physics/metal/weapon_impact_soft" .. math.random(1,2) .. ".wav", 200, 100, 1)

end

end