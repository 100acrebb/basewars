BaseWars.Purchasable["weapon_nyangun"] = {
	name = "Nyan Cat Gun",
	price = 20000000,
	level = 1,
	model = "models/weapons/w_smg1.mdl",
	category = "Super Weapons",
	description = "NYAN NYAN NYAN NYAN NYAN NYAN",
	weapon = true,
	spawnfunc = function(se, c, p, s) BaseWars.GenericGunHandler(se, c, p, s) end,
}

BaseWars.Purchasable["weapon_grapple"] = {
	name = "Grapple Hook",
	price = 350000000,
	level = 2,
	model = "models/weapons/w_crossbow.mdl",
	category = "Super Weapons",
	description = "It grapples on to anything, even the sky!",
	weapon = true,
	spawnfunc = function(se, c, p, s) BaseWars.GenericGunHandler(se, c, p, s) end,
}

BaseWars.Purchasable["jump_stick"] = {
	name = "Jump Stick",
	price = 40000000,
	level = 1,
	model = "models/weapons/w_stunbaton.mdl",
	category = "Super Weapons",
	description = "FLY, FLY MY PRETTY!",
	weapon = true,
	spawnfunc = function(se, c, p, s) BaseWars.GenericGunHandler(se, c, p, s) end,
}

BaseWars.Purchasable["weapon_flamethrower"] = {
	name = "Flame-thrower",
	price = 5000000,
	level = 1,
	model = "models/weapons/w_physics.mdl",
	category = "Super Weapons",
	description = "I don't want to set the world on fire...",
	weapon = true,
	spawnfunc = function(se, c, p, s) BaseWars.GenericGunHandler(se, c, p, s) end,
}

BaseWars.Purchasable["weapon_mad_rpg"] = {
	name = "Rapid RPG",
	price = 8000000,
	level = 1,
	model = "models/weapons/w_rocket_launcher.mdl",
	category = "Super Weapons",
	description = "A rocket launcher preloaded with 4 rockets.",
	weapon = true,
	spawnfunc = function(se, c, p, s) BaseWars.GenericGunHandler(se, c, p, s) end,
}
