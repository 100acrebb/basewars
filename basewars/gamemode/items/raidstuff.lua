BaseWars.Purchasable["weapon_knife2"] = {
	name = "Knife",
	price = 100,
	level = 1,
	model = "models/weapons/w_knife_t.mdl",
	category = "Raiding and Other",
	description = "stab stab stab stab",
	weapon = true,
	spawnfunc = function(se, c, p, s) BaseWars.GenericGunHandler(se, c, p, s) end,
}

BaseWars.Purchasable["lockpick"] = {
	name = "Lockpick",
	price = 3000,
	level = 2,
	model = "models/weapons/w_crowbar.mdl",
	category = "Raiding and Other",
	description = "And by 'picking' we mean hitting with a crowbar.",
	weapon = true,
	spawnfunc = function(se, c, p, s) BaseWars.GenericGunHandler(se, c, p, s) end,
}

BaseWars.Purchasable["weapon_welder"] = {
	name = "Blowtorch",
	price = 10000,
	level = 1,
	model = "models/weapons/w_IRifle.mdl",
	category = "Raiding and Other",
	description = "Vaporise props by turning them in to sparks..?",
	weapon = true,
	spawnfunc = function(se, c, p, s) BaseWars.GenericGunHandler(se, c, p, s) end,
}

BaseWars.Purchasable["bigbomb"] = {
	name = "Big Bomb",
	price = 200000000,
	level = 2,
	model = "models/props_c17/oildrum001_explosive.mdl",
	category = "Raiding and Other",
	description = "ALLAH AKBAR!",
}

BaseWars.Purchasable["ent_nuke"] = {
	name = "Nuke (WIP)",
	price = 2000000000,
	level = 99,
	model = "models/props_phx/mk-82.mdl",
	category = "Raiding and Other",
	description = "Straight from 'merica, even covered in crude oil!",
}

BaseWars.Purchasable["ent_nuke"] = {
	name = "Nuke (WIP)",
	price = 20000000000000,
	level = 99,
	model = "models/props_phx/mk-82.mdl",
	category = "Raiding and Other",
	description = "Straight from 'merica, even covered in crude oil!",
}

BaseWars.Purchasable["gunvault"] = {
	name = "Gun Vault (WIP)",
	price = 5000,
	level = 99,
	model = "models/props/cs_militia/footlocker01_closed.mdl",
	category = "Raiding and Other",
	description = "Store weapons for later use.",
}

BaseWars.Purchasable["pillbox"] = {
	name = "Pill Box (WIP)",
	price = 5000,
	level = 99,
	model = "models/props_c17/furniturefridge001a.mdl",
	category = "Raiding and Other",
	description = "Store drugs for later use.",
}
