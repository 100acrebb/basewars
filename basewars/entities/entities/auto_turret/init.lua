AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

function ENT:Initialize()
	self:CPPISetOwner(self.Owner)
	
	self:SetModel("models/props_c17/TrapPropeller_Engine.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	
	self:SetNWInt("Health", 75)
	self:SetLevel(0)
	
	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
		phys:SetMass(1000)
		phys:EnableMotion(false)
	end
	
	self:SetNWBool("IsActive", false)
	self.Build = 50
	self.LastUsed = CurTime()

	util.PrecacheSound("ambient/energy/spark1.wav")
	util.PrecacheSound("ambient/energy/spark2.wav")
	util.PrecacheSound("ambient/energy/spark3.wav")
	util.PrecacheSound("ambient/energy/spark4.wav")
	
	self.AllyTable = {}
	self:SetNWBool("NotBuilt", true)
	self:SetNWInt("power", 0)
	self.CurrentValue = self.Price
	
end

function ENT:SpawnFunction(ply, tr)
	if ( !tr.Hit ) then return end
	
	local SpawnPos = tr.HitPos + tr.HitNormal * 20
	
	local ent = ents.Create("auto_turret")
		ent:SetPos(SpawnPos)
	ent:Spawn()
	ent:Activate()
	
	local head = ents.Create("auto_turret_gun")
	if (not IsValid(head)) then return end
		head:SetPos(SpawnPos + Vector(0, 0, 18))
		head:SetParent(ent)
		head:SetOwner(ply)
	head:Spawn()
	head:Activate()
	
	head.Body = ent
	ent.Head = head
	
	head.Owner = ply
	
	return ent
end

function ENT:Explode()
	self.BaseClass:Explode()
	self.Head:Remove()
end

function ENT:Use(ply, caller)
	if (self.Build <= 0) then
		timer.Create(tostring(self).."_Toggle", 0.2, 1, function() self:ToggleOn(ply) end)
	end
	
	if (self.LastUsed > CurTime()) then return end
	
	if (self.Build > 0) then 
		if (self.LastUsed + 0.3 < CurTime()) then
			self.LastUsed = CurTime() - 0.1
		end
		self.LastUsed = CurTime() + 0.1
		
		if ply.Tooled then
			self.Build = self.Build - 3
			self:EmitSound("ambient/energy/spark" .. math.random(1,4) .. ".wav")
		else
			self.Build = self.Build-1
			if (self.Build % 3 == 0) then
				self:EmitSound("ambient/energy/spark"..math.random(1,4)..".wav")
			end
		end
		
		if (self.Build <= 0) then
			self:SetNWInt("Health",self:GetNWInt("Health") + 225)
			Notify(ply, 0, 3, "Sentry turret built.")
			self:SetNWBool("NotBuilt", false)
		end
	end
end

function ENT:ToggleOn(ply)
	if (not IsValid(self) or not IsValid(self)) then
		return
	end
	
	if (ply ~= self.Owner) then
		Notify(ply, 4, 3, "This is not your turret!")
	else
		self:SetNWBool("IsActive", not self:GetNWBool("IsActive"))
		if (not self:GetNWBool("IsActive")) then
			Notify(ply, 0, 3, "Sentry turret turned OFF" )
		else
			Notify(ply, 0, 3, "Sentry turret turned ON" )
		end
	end
end

function ENT:IsBuilt()
	return (self.Build <= 0)
end
