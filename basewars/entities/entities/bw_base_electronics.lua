ENT.Base = "base_gmodentity"
ENT.Type = "anim"
ENT.PrintName = "Base Electricals"

ENT.Model = "models/props_c17/metalPot002a.mdl"
ENT.Skin = 0

ENT.IsElectronic = true
ENT.PowerRequired = 5
ENT.PowerCapacity = 1000

function ENT:Init()

end

function ENT:ThinkFunc()

end

function ENT:UseFunc()

end

function ENT:UseFuncBypass()

end

function ENT:BadlyDamaged()

	return self:Health() <= 25

end

function ENT:WaterProof(val)

	if val and SERVER then
	
		self:SetNWBool("WaterProof", val)
	
	return end

return self:GetNWBool("WaterProof") end

function ENT:MaxHealth(val)

	if val and SERVER then
	
		self:SetNWBool("MaxHealth", val)
	
	return end

return self:GetNWBool("MaxHealth") end

do
	-- Power System

	function ENT:Power(val)

		if val and SERVER then
		
			if val > self:MaxPower() then val = self:MaxPower() end
		
			self:SetNWInt("Power", val)
		
		return end

	return self:GetNWInt("Power", 0) or 0 end
	
	function ENT:MaxPower(val)

		if val and SERVER then
		
			self:SetNWBool("MaxPower", val)
		
		return end

	return self:GetNWBool("MaxPower", 0) or 0 end

	function ENT:DrainPower(val)
	
		if not self:IsPowered(val) then return false end

		self:Power(self:Power() - (val or self.PowerRequired))
		
		return true
		
	end

	function ENT:ReceivePower(val)
	
		if val < 1 then return end

		self:Power(self:Power() + val)

	end
	
	function ENT:IsPowered(val)
	
		return self:Power() >= (val or self.PowerRequired)
		
	end
	
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
		self:SetHealth(100)
		
		self.rtb = 0
		
		self:SetNWBool("WaterProof", BaseWars.Config.Ents.Electronics.WaterProof)
		
		self:Init()
		
		self:MaxHealth(self.PresetMaxHealth or self:Health())
		self:MaxPower(self.PowerCapacity)

	end
	
	function ENT:Repair()
	
		self:SetHealth(self:MaxHealth())
		
	end

	function ENT:Think()

		if self:IsPowered() and self:Health() <= 25 and math.random(0, 11) == 0 then
			
			self:Spark()

		end
	
		if self:WaterLevel() > 0 and not self:WaterProof() then

			if not self.FirstTime and self:Health() > 25 then
				
				self:SetHealth(25)
				self:Spark()
				
				self.FirstTime = true

			end
			
			if self.rtb == 2 then
				
				self.rtb = 0
				self:TakeDamage(1)

			else

				self.rtb = self.rtb + 1

			end

		else
			
			self.FirstTime = false
			
		end
		
		if not self:DrainPower() then return end

		self:ThinkFunc()

	end
	
	function ENT:Use(activator, caller, usetype, value)
	
		self:UseFuncBypass(activator, caller, usetype, value)
	
		if not self:IsPowered() or self:BadlyDamaged() then 
		
			self:EmitSound("buttons/button10.wav")

		return end
	
		self:UseFunc(activator, caller, usetype, value)
		
	end

	function ENT:Spark(a, ply)

		local vPoint = self:GetPos()
		local effectdata = EffectData()
		effectdata:SetOrigin(vPoint)
		util.Effect(a or "ManhackSparks", effectdata)
		self:EmitSound("DoSpark")

		if ply and ply:GetPos():Distance(self:GetPos()) < 80 and math.random(0, 10) == 0 then

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
		local Attacker = dmginfo:GetAttacker()

		self:SetHealth(self:Health() - dmg)

		if self:Health() <= 0 then
		
			BaseWars.UTIL.PayOut(self, Attacker)
		
			if dmginfo:IsExplosionDamage() then
			
				self:Explode(false)

			return end

			self:Explode()

		return end

		self:Spark(nil, Attacker)

	end

	function ENT:Explode(e)

		if e == false then

			local vPoint = self:GetPos()
			local effectdata = EffectData()
			effectdata:SetOrigin(vPoint)
			util.Effect("Explosion", effectdata)

			self:Remove()
			
		return end

		local ex = ents.Create("env_explosion")
			ex:SetPos(self:GetPos())
		ex:Spawn()
		ex:Activate()
		
		ex:SetKeyValue("iMagnitude", 100)
		
		ex:Fire("explode")

		self:Spark("cball_bounce")
		self:Remove()

		SafeRemoveEntityDelayed(ex, 0.1)

	end
	
end
