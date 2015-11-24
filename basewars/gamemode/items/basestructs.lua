local function buySpawn(self, class, ply, secondary)
	local pos = ply:GetPos()
	local trace = {}
		trace.start = pos + Vector(0, 0, 1)
		trace.endpos = trace.start + Vector(0, 0, 90)
		trace.filter = ply
	trace = util.TraceLine(trace)
	
	if (trace.Fraction < 1) then
		Notify(ply, 4, 3, "You need more room")
		return
	end
	
	if (not ply:CanAfford(self.price)) then
		Notify(ply, 4, 3, "Cannot afford this")
		return
	end
	
	if (not ply:Alive())then
		Notify(ply, 4, 3, "Dead men buy no spawn points")
		return
	end
		
	if IsValid(ply.spawnpoint) then
		ply.spawnpoint:Remove()
		Notify(ply, 1, 3, "Destroyed your old spawn point to create this one")
	end
	
	ply:AddMoney(self.price * -1)
	Notify(ply, 0, 3, "You bought a spawn point")
	
	local ent = ents.Create(class)
		ent.Owner = ply
		ent:CPPISetOwner(ply)
		ent:SetPos(pos)
		ply:SetPos(pos + Vector(0,0,3))
	ent:Spawn()
	ent:Activate()
	ply.spawnpoint = ent
end

local function buyTurret(self, class, ply, secondary)
	local trace = {}
		trace.start = ply:EyePos()
		trace.endpos = trace.start + ply:GetAimVector() * 150
		trace.filter = ply
	trace = util.TraceLine(trace)
	
	if (not trace.HitWorld) then
		Notify(ply, 4, 3, "Please look at the ground to spawn sentry turret")
		return
	end
	
	if (not ply:CanAfford(self.price)) then
		Notify(ply, 4, 3, "Cannot afford this")
		return
	end
	
	if self.limit then
		if (self.limit <= (ply:GetTable()["limit_"..class] or 0)) then
			Notify(ply, 4, 3, "You have reached the limit of "..self.name.."s")
			return NULL
		end
		ply:GetTable()["limit_"..class] = (ply:GetTable()["limit_"..class] or 0) + 1
	end
	
	local SpawnPos = trace.HitPos + trace.HitNormal * 20
	local SpawnAng = trace.HitNormal:Angle()
	
	for k, v in pairs(ents.FindInSphere(SpawnPos, 1250)) do
		
		local class = v:GetClass()
		if (class == "info_player_deathmatch" or class == "info_player_rebel" or
		class == "gmod_player_start" or class == "info_player_start" or
		class == "info_player_allies" or class == "info_player_axis" or
		class == "info_player_counterterrorist" or class == "info_player_terrorist") then
			Notify(ply, 4, 3, "Cannot create sentry turret near a spawn point!")
			return
		end
	end
	ply:AddMoney(self.price * -1 )
	Notify(ply, 0, 3, "You bought a Sentry turret")

	local ent = ents.Create("auto_turret")
		ent:SetPos( SpawnPos + (trace.HitNormal * -3) )
		ent:SetAngles( SpawnAng + Angle(90, 0, 0) )
		ent.Owner = ply
		ent:CPPISetOwner(ply)
		ent:SetNWString("ally", "")
		ent:SetNWString("jobally", "")
		ent:SetNWString("enemytarget", "")
		ent:SetNWBool("hatetarget", false)
		
		if self.limit then
			ent.o_OnRemove = ent.OnRemove
			ent.OnRemove = function(self)
				if (self.Owner and self.Owner:IsValid()) then
					self.Owner:GetTable()["limit_"..class] = self.Owner:GetTable()["limit_"..class] - 1
				end
				self:o_OnRemove()
			end
		end
		
	ent:Spawn()
	ent:Activate()
	
	local head = ents.Create("auto_turret_gun")
		head:SetPos( SpawnPos + (trace.HitNormal*18) )
		head:SetAngles( SpawnAng + Angle(90, 0, 0) )
		head:SetParent(ent)
		head:SetOwner(ply)
		head.Owner = ply
		head:CPPISetOwner(ply)
	head:Spawn()
	head:Activate()
	
	head.Body = ent
	ent.Head = head
end
	
BaseWars.Purchasable["auto_turret"] = {
	name = "Sentry Gun",
	price = 1000,
	level = 1,
	model = "models/props_c17/TrapPropeller_Engine.mdl",
	category = "Base Structures",
	description = "Are you still there?",
	limit = 3,
	spawnfunc = function(se, c, p, s) buyTurret(se, c, p, s) end,
}

BaseWars.Purchasable["spawnpoint"] = {
	name = "Spawnpoint",
	price = 150,
	level = 1,
	model = "models/props_trainstation/trainstation_clock001.mdl",
	category = "Base Structures",
	description = "Life can be great with infinite lives.",
	limit = 10,
	spawnfunc = function(se, c, p, s) buySpawn(se, c, p, s) end,
}

BaseWars.Purchasable["dispenser"] = {
	name = "Dispenser",
	price = 400,
	level = 1,
	model = "models/props_lab/reciever_cart.mdl",
	category = "Base Structures",
	description = "Can make ammo out of thin air.",
	limit = 10,
}

BaseWars.Purchasable["radartower"] = {
	name = "Radar Tower",
	price = 500,
	level = 1,
	model = "models/props_rooftop/roof_dish001.mdl",
	category = "Base Structures",
	description = "Beep beep.",
	limit = 10,
}

BaseWars.Purchasable["gunfactory"] = {
	name = "Gun Factory",
	price = 1000,
	level = 1,
	model = "models/props/de_prodigy/transformer.mdl",
	category = "Base Structures",
	description = "Can make weapons out of thin air",
	limit = 10,
}

BaseWars.Purchasable["powerplant"] = {
	name = "Generator",
	price = 1000,
	level = 1,
	model = "models/props_vehicles/generatortrailer01.mdl",
	category = "Base Structures",
	description = "Provides power to your machines.",
	limit = 10,
}

BaseWars.Purchasable["superpowerplant"] = {
	name = "Super Generator",
	price = 52500,
	level = 3,
	model = "models/props_wasteland/laundry_washer003.mdl",
	category = "Base Structures",
	description = "Provides even more power to your machines.",
	limit = 10,
}

BaseWars.Purchasable["moneyvault"] = {
	name = "Money Vault",
	price = 5000,
	level = 1,
	model = "models/props_lab/powerbox01a.mdl",
	category = "Base Structures",
	description = "Keeps your money safe. Until someone raids you.",
	limit = 1,
}

BaseWars.Purchasable["supplytable"] = {
	name = "Supply Table",
	price = 10000,
	level = 3,
	model = "models/props/CS_militia/table_shed.mdl",
	category = "Base Structures",
	description = "Has all of the raiding essentials.",
	limit = 1,
}
