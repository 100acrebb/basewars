ENT.Base = "base_gmodentity"
ENT.Type = "anim"

ENT.Items 		= {
	soda = {
		Price = 5,
		Entity = "basewars_drink_vendingsoda",
		Skin = 1,
	},
}

ENT.Model 		= "models/props_interiors/VendingMachineSoda01a.mdl"
ENT.Skin 		= 0

ENT.Stages = {

	[function(self, ply, i)

		if not IsValid(ply) then self.Busy = nil return end

		self:EmitSound("ambient/levels/labs/coinslot1.wav")
		ply:SetMoney(ply:GetMoney() - i.Price)

	end] = 1,

	[function(self, ply, i)

		if not IsValid(ply) then self.Busy = nil return end

		self:EmitSound("buttons/combine_button7.wav")

	end] = 3,

	[function(self, ply, i, iname)

		if not IsValid(ply) then self.Busy = nil return end

		ply:Freeze(false)

		self:SpawnItem(iname)
		self.Busy = nil
		self.PlayedStages = {}


	end] = 3.62,

}

ENT.PlayedStages = {}

function ENT:Init()

end

if SERVER then

	function ENT:Initialize()

		self:SetModel(self.Model)
		self:SetSkin(self.Skin)

		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)

		self:PhysWake()

		self:SetUseType(SIMPLE_USE)

		self:Init()

	end

	function ENT:SpawnItem(id)

		local i = self.Items[id]

		if not i then return end

		local ent, price = i.Entity, i.Price or 0

		if not ent then return end

		local e = ents.Create(ent)

		if not e then return end

		local ang = self:GetAngles()
		local spawnPos = self:GetPos()

		spawnPos = spawnPos + ang:Forward() * 20 + ang:Right() * 4 + ang:Up() * -24

		e:SetPos(spawnPos)
		e:Spawn()
		e:Activate()

		local phys = e:GetPhysicsObject()

		if IsValid(phys) then
			
			phys:AddVelocity(ang:Forward() * 100)

		end

		self:EmitSound("buttons/lever7.wav")

	end

	function ENT:Use(activator, caller, usetype, value)

		if activator:IsPlayer() and caller:IsPlayer() then

			if activator:GetEyeTrace().Entity ~= self then return end

			local fw = self:GetAngles():Forward() * 100
			fw.z = 0

			local trace = {}
			local t = {}
			t.start = self:GetPos()
			t.endpos = self:GetPos() + fw
			t.maxs = Vector(16, 16, 16)
			t.minxs = Vector(-16, -16, -16)
			t.filter = self
			t.ignoreworld = true
			t.output = trace

			util.TraceHull(t)

			if not trace.Hit then return end
			if not IsValid(trace.Entity) then return end

			if self.Busy or activator:GetMoney() < self.Items.soda.Price then
				
				self:EmitSound("buttons/button10.wav")

			return end
			
			self:EmitSound("buttons/blip1.wav")
			self.BuyingPlayer = activator
			self.Busy = true
			self.Time = CurTime()
			self.Item = "soda"

		end

	end

	function ENT:Think()

		if self.Busy then
			
			local ctime = CurTime() - self.Time

			for func, stage in next, self.Stages do
				
				if not self.PlayedStages[stage] and stage <= math.Round(ctime, 2) + 0.1 then
					
					func(self, self.BuyingPlayer, self.Items[self.Item], self.Item)
					self.PlayedStages[stage] = true

				break end

			end

		else

			self.PlayedStages = {}

		end

		if self.Time and self.Time >= CurTime() + 4 then

			self.Busy = nil
		
		end		


	end

else

	-- Nothing yet.

end
