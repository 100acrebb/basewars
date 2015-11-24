BaseWars.Purchasable["item_buyhealth"] = {
	name = "Medkit",
	price = 2000,
	level = 1,
	model = "models/items/healthkit.mdl",
	category = "Equipment",
	description = "un-stab un-stab un-shoot un-shoot",
}

BaseWars.Purchasable["item_snipeshield"] = {
	name = "Snipe Shield",
	price = 5000,
	level = 1,
	model = "models/items/car_battery01.mdl",
	category = "Equipment",
	description = "A portable, single use person shield, that will save your life.",
}

BaseWars.Purchasable["item_helmet"] = {
	name = "Helmet",
	price = 2000,
	level = 1,
	model = "models/props/de_tides/vending_hat.mdl",
	category = "Equipment",
	description = "A helmet, to make getting shot in the head hurt a bit less.",
}

BaseWars.Purchasable["item_scanner"] = {
	name = "Scan Blocker",
	price = 3000,
	level = 1,
	model = "models/props_lab/monitor01b.mdl",
	category = "Equipment",
	description = "A single use radar scrambler.",
}

BaseWars.Purchasable["item_toolkit"] = {
	name = "Wrench",
	price = 8000,
	level = 1,
	model = "models/props_c17/tools_pliers01a.mdl",
	category = "Equipment",
	description = "Need a sentry riggght here.",
}

BaseWars.Purchasable["item_armor"] = {
	name = "Kevlar",
	price = 1000,
	level = 1,
	model = "models/props_c17/utilityconducter001.mdl",
	category = "Equipment",
	description = "Coat yourself in metal, it makes bullets hurt less!",
}

BaseWars.Purchasable["weapon_health"] = {
	name = "Health Laser",
	price = 8000,
	level = 1,
	model = "models/weapons/w_physics.mdl",
	category = "Equipment",
	description = "Heal yourself and your friends.",
	weapon = true,
	spawnfunc = function(se, c, p, s) BaseWars.GenericGunHandler(se, c, p, s) end,
}
