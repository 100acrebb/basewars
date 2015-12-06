--easylua.StartEntity("bw_base_electronics")

ENT.Base = "base_gmodentity"
ENT.Type = "anim"

ENT.Model = "models/props_c17/metalPot002a.mdl"
ENT.Skin = 0

function ENT:Init()
end

function ENT:ThinkFunc()

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
		self:SetHealth(100)

	end

	function ENT:Think()

		if self:Health() <= 25 and math.random(0, 10) == 0 then
			
			self:Spark()

		end
	
		if self:WaterLevel() > 0 then

			if not self.FirstTime and self:Health() > 20 then
				
				self:SetHealth(20)
				self:Spark()
				self.FirstTime = true

			end
			
			if self.rtb == 2 then
				
				self.rtb = 0
				self:TakeDamage(5)

			else

				self.rtb = self.rtb + 1

			end

		end

		self:ThinkFunc()

	end

	function ENT:Spark(a,ply)

		local vPoint = self:GetPos()
		local effectdata = EffectData()
		effectdata:SetOrigin(vPoint)
		util.Effect(a or "ManhackSparks", effectdata)
		self:EmitSound("DoSpark")

		if ply and ply:GetPos():Distance(self:GetPos()) < 100 and math.random(0, 10) == 0 then

			local d = DamageInfo()

			d:SetAttacker(ply)
			d:SetInflictor(ply)
			d:SetDamage(ply:Health() / 2)
			d:SetDamageType(DMG_SHOCK)

			local vPoint = ply:GetPos()
			local effectdata = EffectData()
			effectdata:SetOrigin(vPoint)
			util.Effect(a or "ManhackSparks", effectdata)

			ply:TakeDamageInfo(d)

		end

	end

	function ENT:OnTakeDamage(dmginfo)

		local dmg = dmginfo:GetDamage()

		if dmginfo:IsExplosionDamage() then
			
			self:Explode(false)

		return end

		self:SetHealth(self:Health() - dmg)

		if self:Health() <= 0 then

			self:Explode()

		return end

		self:Spark(nil, dmginfo:GetAttacker())

	end

	function ENT:Explode(e)

		if e == false then

			local vPoint = self:GetPos()
			local effectdata = EffectData()
			effectdata:SetOrigin(vPoint)
			util.Effect("Explosion", effectdata)

			self:Remove()
			
		return end

		local ex = ents.Create"env_explosion"
		ex:SetPos(self:GetPos())
		ex:Spawn()
		ex:Activate()
		ex:Fire"explode"
		ex:SetKeyValue("iMagnitude",100)

		self:Spark("cball_bounce")
		self:Remove()

		SafeRemoveEntityDelayed(ex,0.1)

	end

end

--easylua.EndEntity()