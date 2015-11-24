AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:Initialize()
	self.Entity:SetModel(self.PrimaryModel)
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:SetColor(self.LabelColor)
	
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then phys:Wake() end
	
	timer.Create(tostring(self.Entity), 122, 0, function() self:GiveMoney() end)
	timer.Create(tostring(self.Entity).."_AntiAFK", 750, 1, function() self:ShutOff() end)
	timer.Create(tostring(self.Entity).."_Notify", 700, 1, function() self:NotifyOwner() end)
	
	self.Entity:SetNWInt("Health", self.MaxHP)
	self.Entity:SetLevel(0)
	
	self.Entity:SetNWBool("sparking", false)
	self.Entity:SetNWInt("power", 0)

	self.CurrentValue = self.Price
	
	self.Inactive = false
	self.NearInact = false
end

function ENT:GiveMoney()
	local ply = self.Owner
	if (IsValid(ply) and not self.Inactive and self.Entity:IsPowered()) then
		
		local trace = { }
		
		trace.start = self.Entity:GetPos() + self.Entity:GetAngles():Up() * 15
		trace.endpos = trace.start + self.Entity:GetAngles():Forward() + self.Entity:GetAngles():Right()
		trace.filter = self.Entity
		
		local amount = self:CalculateMoney()
		
		local tr = util.TraceLine(trace)

		local moneybag = ents.Create("prop_moneybag")
		if not moneybag:IsValid() then return end
			moneybag:SetModel( "models/props/cs_assault/Money.mdl")
			moneybag:SetPos(tr.HitPos)
			moneybag:SetAngles(self.Entity:GetAngles())
		moneybag:Spawn()
		moneybag:SetColor(Color(200,255,200,255))
		moneybag:SetMoveType(MOVETYPE_VPHYSICS)
		
		moneybag:GetTable().MoneyBag = true
		moneybag:GetTable().Amount = amount
		
		Notify(ply, 0, 3, "A printer created £"..amount)
	elseif (self.Inactive) then
		Notify(ply, 4, 3, "A money printer is inactive, press use on it to make it active again.")
	elseif (not self.Entity:IsPowered()) then
		Notify(ply, 4, 3, "A money printer does not have enough power. Get a power plant.")
	end
end

function ENT:ShutOff()
	local ply = self.Owner
	self.Inactive = true
	Notify(ply, 1, 3, "NOTICE: A MONEY PRINTER HAS GONE INACTIVE")
	Notify(ply, 1, 3, "PRESS USE ON IT TO CONTINUE GETTING MONEY")
	self.Entity:SetColor(Color(255,0,0,254))
end

function ENT:NotifyOwner()
	self.NearInact = true
	local ply = self.Owner
	Notify(ply, 4, 3, "NOTICE: A MONEY PRINTER IS ABOUT TO GO INACTIVE")
	Notify(ply, 4, 3, "PRESS USE ON IT TO PREVENT THIS")
	self.Entity:SetColor(Color(255,150,150,254))
end

function ENT:Use(activator, caller)
	local ply = self.Owner
	if not (activator == ply) then return end
	if ((self.NearInact or self.Inactive) and not self.Entity:GetNWBool("sparking") and ply:CanAfford(100)) then
		ply:AddMoney(-100)
		self.NearInact = false
		self.Entity:SetNWBool("sparking", true)
		timer.Simple(1, function() self:Reload() end)
	end
end

function ENT:Reload()
	Notify(self.Owner, 0, 3, "Money printer resupplied")
	
	timer.Create( tostring(self.Entity) .. "_AntiAFK", 640, 1, function() self:ShutOff() end)
	timer.Create( tostring(self.Entity) .. "_Notify", 600, 1, function() self:NotifyOwner() end)
	
	self.Inactive = false
	self.NearInact = false
	
	self.Entity:SetColor(self.LabelColor)
	self.Entity:SetNWBool("sparking",false)
end
 
function ENT:Think()
	if (not IsValid(self.Owner)) then
		self.Entity:Remove()
	end
end

function ENT:OnRemove( )
	timer.Destroy(tostring(self.Entity)) 
	timer.Destroy(tostring(self.Entity).."_AntiAFK")
	timer.Destroy(tostring(self.Entity).."_Notify")
end
