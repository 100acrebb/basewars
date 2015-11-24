BaseWars.Purchasable["cse_eq_flashbang"] = {
	name = "Stun Grenade",
	price = 1500,
	level = 1,
	model = "models/weapons/w_eq_smokegrenade_thrown.mdl",
	category = "Grenades",
	description = "A grenade that blinds everyone within its radius.",
	weapon = true,
	spawnfunc = function(se, c, p, s) BaseWars.GenericGunHandler(se, c, p, s) end,
}

BaseWars.Purchasable["weapon_gasgrenade"] = {
	name = "Neurotoxin Grenade",
	price = 2000,
	level = 2,
	model = "models/weapons/w_eq_smokegrenade.mdl",
	category = "Grenades",
	description = "Chemical warfare, now in your back pocket.",
	weapon = true,
	spawnfunc = function(se, c, p, s) BaseWars.GenericGunHandler(se, c, p, s) end,
}

BaseWars.Purchasable["weapon_stickgrenade"] = {
	name = "Sticky Grenade",
	price = 3000,
	level = 2,
	model = "models/dav0r/hoverball.mdl",
	category = "Grenades",
	description = "A grenade covered in a very strange substance...",
	weapon = true,
	spawnfunc = function(se, c, p, s) BaseWars.GenericGunHandler(se, c, p, s) end,
}

BaseWars.Purchasable["weapon_mad_c4"] = {
	name = "C4 Charge",
	price = 5000,
	level = 2,
	model = "models/weapons/w_c4_planted.mdl",
	category = "Grenades",
	description = "A grenade covered in a very strange substance...",
	weapon = true,
	spawnfunc = function(se, c, p, s) BaseWars.GenericGunHandler(se, c, p, s) end,
}
