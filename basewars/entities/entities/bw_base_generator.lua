AddCSLuaFile()

ENT.Base = "base_gmodentity"
ENT.Type = "anim"
ENT.PrintName = "Base Generator"

ENT.Model = "models/props_wasteland/laundry_washer003.mdl"
ENT.Skin = 0

ENT.IsGenerator = true

ENT.PowerGenerated = 15
ENT.PowerCapacity = 1000
ENT.TransmitRadius = 600
ENT.TransmitRate = 20

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

function ENT:SetupDataTables()

	self:NetworkVar("Bool", 0, "WaterProof")
	
	self:NetworkVar("Int", 0, "MaxHealth")
	self:NetworkVar("Int", 1, "Power")

end

do
	-- Power System
	function ENT:DrainPower(val)

		local Value = self:GetPower() - val
	
		if Value > self:GetMaxPower() then val = self:GetMaxPower() end
		if Value < 0 then val = 0 end
	
		self:SetPower(self:GetPower() - val)
		
	end

	function ENT:ReceivePower(val)
	
		local Value = self:GetPower() + val
	
		if Value > self:GetMaxPower() then Value = self:GetMaxPower() end
		if Value < 0 then val = 0 end

		return self:SetPower(Value)

	end

	function ENT:TransmitPower()
	
		local Ents = ents.FindInSphere(self:GetPos(), self.TransmitRadius)
	
		for k, v in next, Ents do
		
			if not v or not IsValid(v) or v == self then continue end
			if not v.IsElectronic or not v.ReceivePower then continue end
			
			local Pow = v.GetPower and v:GetPower() or 0
			local Max = v.GetMaxPower and v:GetMaxPower() or 0
			
			if Max < 1 then continue end
			
			if Pow >= Max then continue end
			
			local Transmit = math.min(self.TransmitRate, self:GetPower())
			Transmit = math.min(Transmit, (Max - Pow))
			
			v:ReceivePower(Transmit)
			
			local Drain = Transmit - (PowerNotUsed or 0)
			self:DrainPower(Drain)
			
		end
		
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

		self:SetUseType(SIMPLE_USE)
		self:AddEffects(EF_ITEM_BLINK)
		
		self:PhysWake()
		self:Activate()
		
		self:SetHealth(self.PresetMaxHealth)
		self:SetMaxPower(self.PowerCapacity)
		
		self.rtb = 0
		
		self:SetWaterProof(BaseWars.Config.Ents.Electronics.WaterProof)
		
		self:Init()

	end
	
	function ENT:Repair()
	
		self:SetHealth(self:GetMaxHealth())
		
	end

	function ENT:Think()
	
		if not self:BadlyDamaged() then
		
			self:ReceivePower(self.PowerGenerated)
			
		end
		
		self:TransmitPower()

		if self:IsPowered() and self:BadlyDamaged() and math.random(0, 11) == 0 then
			
			self:Spark()

		end
	
		if self:WaterLevel() > 0 and not self:GetWaterProof() then

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
		
		if not self:DrainPower() or self:BadlyDamaged() then return end

		self:ThinkFunc()

	end
	
	function ENT:Use(activator, caller, usetype, value)
	
		self:UseFuncBypass(activator, caller, usetype, value)
	
		if self:BadlyDamaged() then 
		
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
