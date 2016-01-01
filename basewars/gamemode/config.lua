BASEWARS_CHOSEN_LANGUAGE = "ENGLISH"

BaseWars.Config = {
	Forums 		= "http://www.hexahedronic.org/forum",
	SteamGroup 	= "http://steamcommunity.com/groups/hexahedronic",

	Ents = {
		Electronics = {
			Explode		= true,
			WaterProof	= false,
		},
		SpawnPoint = {
			Offset 		= Vector(0, 0, 16),
		},
	},
	
	Drugs = {
		DoubleJump = {
			JumpHeight 	= Vector(0, 0, 320),
			Duration	= 120,
		},
		Steroid = {
			Walk 		= 330,
			Run 		= 580,
			Duration	= 120,
		},
		Regen = {
			Duration 	= 30,
		},
		Adrenaline = {
			Mult		= 1.5,
			Duration	= 120,
		},
		PainKiller = {
			Mult 		= .675,
			Duration	= 80,
		},
		Rage = {
			Mult 		= 1.675,
			Duration	= 120,
		},
		Shield = {
		
		},
		Antidote = {
		
		},
		CookTime	= 60 * 3,
	},
	
	Notifications = {
		LinesAmount = 11,
		Width		= 582,
		BackColor	= Color(30, 30, 30, 140),
		OpenTime	= 10,
	},
	
	Raid = {
		Time 			= 60 * 5,
		CoolDownTime	= 60 * 15,
		NeededPrinters	= 3,
	},
	
	AFK  = {
		Time 	= 30,
	},
	
	HUD = {
		EntFont = "TargetID",
		EntFont2 = "BudgetLabel",
		EntW	= 175,
		EntH	= 25,
	},
	
	Rules = {
		IsHTML 	= false,
		HTML	= "http://www.hexahedronic.org/faq.html",
	},
	
	Adverts = {
		Time = 120,
	},
	
	SpawnWeps = {
		"weapon_physcannon",
		"hands",
	},
	
	WeaponDropBlacklist = {
		["weapon_physgun"] = true,
		["weapon_physcannon"] = true,
		["hands"] = true,
		["gmod_tool"] = true,
		["gmod_camera"] = true,
	},
	
	PhysgunBlockClasses = {
		["bw_spawnpoint"] = true,
	},
	
	BlockedTools = {
		["dynamite"] = true,
		["duplicator"] = true,
		["motor"] = true,
		["emiter"] = true,
		["lamp"] = true,
		["balloon"] = true,
		["hoverball"] = true,
		["thruster"] = true,
		["paint"] = true,
	},
	
	ModelBlacklist = {
		["models/props_vehicles/apc001.mdl"] = true,
		["models/props_combine/combinetower001.mdl"] = true,
		["models/cranes/crane_frame.mdl"] = true,
		["models/items/item_item_crate.mdl"] = true,
		["models/props/cs_militia/silo_01.mdl"] = true,
		["models/props/cs_office/microwave.mdl"] = true,
		["models/props/de_train/biohazardtank.mdl"] = true,
		["models/props_buildings/building_002a.mdl"] = true,
		["models/props_buildings/collapsedbuilding01a.mdl"] = true,
		["models/props_buildings/project_building01.mdl"] = true,
		["models/props_buildings/row_church_fullscale.mdl"] = true,
		["models/props_c17/consolebox01a.mdl"] = true,
		["models/props_c17/oildrum001_explosive.mdl"] = true,
		["models/props_c17/paper01.mdl"] = true,
		["models/props_c17/trappropeller_engine.mdl"] = true,
		["models/props_canal/canal_bridge01.mdl"] = true,
		["models/props_canal/canal_bridge02.mdl"] = true,
		["models/props_canal/canal_bridge03a.mdl"] = true,
		["models/props_canal/canal_bridge03b.mdl"] = true,
		["models/props_combine/combine_citadel001.mdl"] = true,
		["models/props_combine/combine_mine01.mdl"] = true,
		["models/props_combine/combinetrain01.mdl"] = true,
		["models/props_combine/combinetrain02a.mdl"] = true,
		["models/props_combine/combinetrain02b.mdl"] = true,
		["models/props_combine/prison01.mdl"] = true,
		["models/props_combine/prison01c.mdl"] = true,
		["models/props_industrial/bridge.mdl"] = true,
		["models/props_junk/garbage_takeoutcarton001a.mdl"] = true,
		["models/props_junk/gascan001a.mdl"] = true,
		["models/props_junk/glassjug01.mdl"] = true,
		["models/props_junk/trashdumpster02.mdl"] = true,
		["models/props_phx/amraam.mdl"] = true,
		["models/props_phx/ball.mdl"] = true,
		["models/props_phx/cannonball.mdl"] = true,
		["models/props_phx/huge/evildisc_corp.mdl"] = true,
		["models/props_phx/misc/flakshell_big.mdl"] = true,
		["models/props_phx/misc/potato_launcher_explosive.mdl"] = true,
		["models/props_phx/mk-82.mdl"] = true,
		["models/props_phx/oildrum001_explosive.mdl"] = true,
		["models/props_phx/torpedo.mdl"] = true,
		["models/props_phx/ww2bomb.mdl"] = true,
		["models/props_wasteland/cargo_container01.mdl"] = true,
		["models/props_wasteland/cargo_container01.mdl"] = true,
		["models/props_wasteland/cargo_container01b.mdl"] = true,
		["models/props_wasteland/cargo_container01c.mdl"] = true,
		["models/props_wasteland/depot.mdl"] = true,
		["models/xqm/coastertrack/special_full_corkscrew_left_4.mdl"] = true,
		["models/props_junk/propane_tank001a.mdl"] = true,
		["models/props_c17/fountain_01.mdl"] = true,
		["models/props_trainstation/train003.mdl"] = true,
		["models/props_foliage/tree_poplar_01.mdl"] = true,
		["models/mechanics/solid_steel/i_beam2_32.mdl"] = true,
		["models/props_c17/furnituredrawer001a_chunk06.mdl"] = true,
		["models/mechanics/solid_steel/i_beam2_32.mdl"] = true,
		["models/props_phx/mechanics/slider2.mdl"] = true,
		["models/props_phx/gears/rack70.mdl"] = true,
		["models/mechanics/gears2/pinion_80t1.mdl"] = true,
		["models/nova/airboat_seat.mdl"] = true,
		["models/mechanics/robotics/a4.mdl"] = true,
		["models/mechanics/roboticslarge/claw_hub_8.mdl"] = true,
		["models/perftest/loader_static.mdl"] = true,
		["models/mechanics/robotics/e4.mdl"] = true,
		["models/mechanics/roboticslarge/e4.mdl"] = true,
		["models/perftest/rocksground01b.mdl"] = true,
		["models/mechanics/roboticslarge/g4.mdl"] = true,
		["models/mechanics/roboticslarge/e4.mdl"] = true,
		["models/mechanics/roboticslarge/j4.mdl"] = true,
		["models/props_animated_breakable/smokestack.mdl"] = true,
		["models/props_animated_breakable/smokestack_gib_01.mdl"] = true,
		["models/xqm/rails/slope_down_90.mdl"] = true,
		["models/props_animated_breakable/smokestack_gib_02.mdl"] = true,
		["models/props_animated_breakable/smokestack_gib_03.mdl"] = true,
		["models/props_animated_breakable/smokestack_gib_04.mdl"] = true,
		["models/props_animated_breakable/smokestack_gib_05.mdl"] = true,
		["models/props_animated_breakable/smokestack_gib_06.mdl"] = true,
		["models/props_animated_breakable/smokestack_gib_07.mdl"] = true,
		["models/props_animated_breakable/smokestack_gib_08.mdl"] = true,
		["models/xqm/coastertrack/special_full_loop_3.mdl"] = true,
		["models/props_animated_breakable/smokestack_gib_09.mdl"] = true,
		["models/props_animated_breakable/smokestack_gib_10.mdl"] = true,
		["models/xqm/coastertrack/special_full_corkscrew_right_4.mdl"] = true,
		["models/props_buildings/collapsedbuilding01awall.mdl"] = true,
		["models/props_buildings/collapsedbuilding02a.mdl"] = true,
		["models/props_buildings/collapsedbuilding02b.mdl"] = true,
		["models/xqm/coastertrack/special_half_corkscrew_right_4.mdl"] = true,
		["models/props_buildings/collapsedbuilding02c.mdl"] = true,
		["models/props_buildings/project_destroyedbuildings01.mdl"] = true,
		["models/props_buildings/project_building03_skybox.mdl"] = true,
		["models/props_buildings/project_building03.mdl"] = true,
		["models/props_buildings/project_building02_skybox.mdl"] = true,
		["models/props_buildings/project_building02.mdl"] = true,
		["models/props_buildings/project_building01_skybox.mdl"] = true,
		["models/props_buildings/factory_skybox001a.mdl"] = true,
		["models/xqm/coastertrack/special_full_corkscrew_right_3.mdl"] = true,
		["models/props_buildings/row_res_1_fullscale.mdl"] = true,
		["models/props_buildings/watertower_002a.mdl"] = true,
		["models/props_buildings/watertower_001c.mdl"] = true,
		["models/props_buildings/watertower_001a.mdl"] = true,
		["models/props_buildings/short_building001a.mdl"] = true,
		["models/props_buildings/row_res_2_fullscale.mdl"] = true,
		["models/props_buildings/row_res_2_ascend_fullscale.mdl"] = true,
		["models/xqm/coastertrack/special_full_corkscrew_left_2.mdl"] = true,
		["models/props_canal/generator01.mdl"] = true,
		["models/props_canal/generator02.mdl"] = true,
		["models/props_canal/locks_large.mdl"] = true,
		["models/props_canal/locks_large_b.mdl"] = true,
		["models/props_canal/locks_small.mdl"] = true,
		["models/props_canal/locks_small_b.mdl"] = true,
		["models/xqm/coastertrack/special_half_corkscrew_right_4.mdl"] = true,
		["models/props_canal/canal_bars001.mdl"] = true,
		["models/props_trainstation\train003.mdl"] = true,
		["models/props_canal/canal_bridge04.mdl"] = true,
		["models/props_canal/pipe_bracket001.mdl"] = true,
		["models/props_canal/canal_bridge_railing_lamps.mdl"] = true,
		["models/props_canal/canal_bridge_railing02.mdl"] = true,
		["models/props_canal/canal_bridge_railing01.mdl"] = true,
		["models/xqm/coastertrack/special_half_corkscrew_right_3.mdl"] = true,
		["models/props_canal/winch01.mdl"] = true,
		["models/props_canal/rock_riverbed01c.mdl"] = true,
		["models/props_canal/rock_riverbed01d.mdl"] = true,
		["models/props_canal/rock_riverbed02a.mdl"] = true,
		["models/props_canal/rock_riverbed02b.mdl"] = true,
		["models/props_canal/winch02c.mdl"] = true,
		["models/props_canal/winch02d.mdl"] = true,
		["models/props_canal/rock_riverbed01b.mdl"] = true,
		["models/props_canal/refinery_04.mdl"] = true,
		["models/props_canal/refinery_05.mdl"] = true,
		["models/xqm/rails/twist_90_left.mdl"] = true,
		["models/props_canal/canal_bars001.mdl"] = true,
		["models/props_canal/bridge_pillar02.mdl"] = true,
		["models/xqm/rails/loop_right.mdl"] = true,
		["models/props_citizen_tech/windmill_blade002a.mdl"] = true,
		["models/props_citizen_tech/till001a_base01.mdl"] = true,
		["models/props_citizen_tech/steamengine001a.mdl"] = true,
		["models/props_citizen_tech/guillotine001a_base01.mdl"] = true,
		["models/props_citizen_tech/firetrap_gashose01c.mdl"] = true,
		["models/props_citizen_tech/firetrap_gashose01b.mdl"] = true,
		["models/props_citizen_tech/firetrap_button01a.mdl"] = true,
		["models/props_citizen_tech/windmill_blade004a.mdl"] = true,
		["models/props_phx/misc/potato_launcher_chamber.mdl"] = true,
		["models/props_combine/combine_train02a.mdl"] = true,
	},
	
	NPC = {
		FadeOut = 400,
	},
	
	AntiRDM = {
		HurtTime 		= 80,
		RDMSecondsAdd 	= 2,
		KarmaSecondPer 	= 10,
		KarmaLoss 		= -2,
		KarmaGlowLevel 	= 65,
	},
	
	PayDayBase 			= 500,
	PayDayMin			= 50,
	PayDayDivisor		= 1000,
	PayDayRate 			= 60 * 3,
	PayDayRandom		= 50,
	
	StartMoney 			= 5000,
	
	CustomChat			= true,
	ExtraStuff			= true,
	
	AllowFriendlyFire	= false,
	
	DefaultWalk			= 200,
	DefaultRun			= 400,
	
	DefaultLimit		= 4,
	SpawnOffset			= Vector(0, 0, 40),
	
	UniversalPropConstant = 2.7,
	DestroyReturn 		= 0.6,
	
	RestrictProps 		= false,
	
	DispenserTime		= 2,

	LevelSettings = {

		BuyWeapons = 2,

	},

}

local NiceGreen = Color(100, 250, 125)
local Grey = Color(200, 200, 200)

BaseWars.AdvertTbl = {

	{Grey, "Remember to join our ", NiceGreen, "Steam Group", Grey, "! (/steam)"},
	{Grey, "You can find out more on the ",  NiceGreen, "Forums", Grey, "! (/forums)"}

}

BaseWars.Config.RulesTbl = {

	"1. Do not base with someone unless you are in a faction with them.",
	"2. Do not propblock OTHER peoples bases (You CAN block your own).",
	"3. Do not attempt to circumvent Anti-RandomRaid or similar systems.",
	"4. You must base in A SINGLE CONTINGOUS SPACE. NO multi-basing!",

}

BaseWars.Config.Help = {

	["What is this server?"] = {
		
		"This is the HexaHedronic.ORG BaseWars server.",
		"It runs a custom version of basewars coded by Q2F2 and Ghosty!",
		"",
		"BaseWars is a gamemode about making money and raiding.",
		"It also contains cool guns and ways to defend your base!",
	
	},
	
	["What are the controls?"] = {
		
		"To spawn printers and other entities you can open the spawnmenu by holding [Q] or your binding for it,",
		"From here you can select the [Entities] sub-category of the [BaseWars] tab. (NOT THE ENTITIES TAB!)",
		"",
		"To Raid or Create a Faction you can press [F3] to open the [Main Menu]. From here you can select [Factions],",
		"[Raids], [Rules] and in the future the [Store] and your [Equipment Inventory]!",
	
	},
	
	["How do I make a base?"] = {
	
		"Firstly find an area in the map which is secure, and you would be happy defending,",
		"Then use some props from spawnmenu sub-categories to secure the entrances,",
		"Finally use the [Fading Door] tool to make yourself a secure way in and out.",
		"",
		"After you have secured the area, you can buy Printers and Generators from the [BaseWars] tab.",
		"You will need to make sure you have enough power to supply your printers!",
	
	},
	
	["How do I Raid?"] = {
	
		"To Raid you and your TARGET must both have GOLD or HIGHER printer-types.",
		"",
		"If you are raidable, press F3, then select the [Raids] tab, followed by clicking on your TARGET's name.",
		"Watch the [Notifications] in the top left to see if they are raidable, if they were, then a raid will",
		"have started, if not, it will tell you why not.",
		"",
		"Once a raid has started you can destroy any props your enemy owns, along with electronics! But be carefull!",
		"They can counter raid you while it is on-going!",
	
	},
	
	["Are there any rules?"] = BaseWars.Config.RulesTbl,
	
	["How does the power system work?"] = {
	
		"Generators will transmit power to all nearby powered items in an AOE.",
		"This means you do not need to worry about 'wiring' or similar.",
		"",
		"If an electronic has a [POWER FAILURE] then you may need more generators, or you might",
		"just need to wait for the power supply to stabilise.",
		"",
		"If a generator has a [POWER FAILURE] then that means its power generation is being strained,",
		"but it does not mean it is not working!",
	
	},
	
	["What about RDM (Killing people randomly)?"] = {
	
		"RDM is ALLOWED. Do not complain and instead if you so desire seek your own revenge.",
		"In the future the [Karma] system will punish mass RDMers with longer respawns and other debuffs.",
	
	},
	
	["How do I upgrade my printers?"] = {
	
		"All you need to do is look at them and type /upg",
		"You can bind \"basewars upgrade\" to a key to do it automaticly!",
	
	},

	["How do I sell my printers?"] = {
	
		"All you need to do is look at them and type /sell",
		"You can bind \"basewars sell\" to a key to do it automaticly!",
	
	},

}

BaseWars.SpawnList = {}
BaseWars.SpawnList.Models = {

	Entities = {

		["Generators"] = {

			["Solar Panel"]					= BaseWars.GSL{Model = "models/props_lab/miniteleport.mdl", Price = 1500, ClassName = "bw_gen_solar"},
			["Coal Fired Generator"]		= BaseWars.GSL{Model = "models/props_wasteland/laundry_washer003.mdl", Price = 20000, ClassName = "bw_gen_coalfired", Level = 3},
			["Fission Reactor"]				= BaseWars.GSL{Model = "models/props/de_nuke/equipment1.mdl", Price = 75000, ClassName = "bw_gen_fission", Level = 5},
			["Fusion Reactor"]				= BaseWars.GSL{Model = "models/xqm/hydcontrolbox.mdl", Price = 300000, ClassName = "bw_gen_fusion", Level = 8},

		},
		
		["Dispensers"] = {

			["Vending Machine"]				= BaseWars.GSL{Model = "models/props_interiors/VendingMachineSoda01a.mdl", Price = 20000, ClassName = "bw_vendingmachine"},
			["Ammo Dispenser"]				= BaseWars.GSL{Model = "models/props_lab/reciever_cart.mdl", Price = 55000, ClassName = "bw_dispenser_ammo"},
			["Armour Dispenser"]			= BaseWars.GSL{Model = "models/props_combine/suit_charger001.mdl", Price = 35000, ClassName = "bw_dispenser_armor"},
			["Printer-Paper Refiller"]		= BaseWars.GSL{Model = "models/props_lab/plotter.mdl", Price = 550000, ClassName = "bw_dispenser_paper", Limit = 1, Level = 8},
			["HealthPad"]					= BaseWars.GSL{Model = "models/props_lab/teleplatform.mdl", Price = 50000, ClassName = "bw_healthpad", UseSpawnFunc = true},

		},
		
		["Structures"] = {
		
			["Spawnpoint"]					= BaseWars.GSL{Model = "models/props_trainstation/trainstation_clock001.mdl", Price = 15000, ClassName = "bw_spawnpoint", UseSpawnFunc = true},
			["Drug Lab"]					= BaseWars.GSL{Model = "models/props_lab/crematorcase.mdl", Price = 35000, ClassName = "bw_druglab"},
		
		},
		
		["Defence"] = {
		
			["Ballistic Turret"] 			= BaseWars.GSL{Model = "models/Combine_turrets/Floor_turret.mdl", Price = 80000, ClassName = "bw_turret_ballistic", Limit = 2, Level = 5},
			["Laser Turret"] 				= BaseWars.GSL{Model = "models/Combine_turrets/Floor_turret.mdl", Price = 120000, ClassName = "bw_turret_laser", Limit = 1, Level = 8},
			["Tesla Coil"]					= BaseWars.GSL{Model = "models/props_c17/substation_transformer01d.mdl", Price = 500000, ClassName = "bw_tesla", Limit = 1, Level = 10},
		
		},
		
		["Consumables"] = {

			["Repair Kit"]					= BaseWars.GSL{Model = "models/Items/car_battery01.mdl", Price = 2500, ClassName = "bw_repairkit", UseSpawnFunc = true},
			["Armour Kit"]					= BaseWars.GSL{Model = "models/props_junk/cardboard_box004a.mdl", Price = 12500, ClassName = "bw_entityarmor", UseSpawnFunc = true},
			["Printer Paper"]				= BaseWars.GSL{Model = "models/props_junk/garbage_newspaper001a.mdl", Price = 300, ClassName = "bw_printerpaper", UseSpawnFunc = true},

		},
		
		["Printers"] = {

			["Basic Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 2000, ClassName = "bw_base_moneyprinter"},
			["Copper Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 12500, ClassName = "bw_printer_copper", Level = 3},
			["Silver Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 20000, ClassName = "bw_printer_silver", Level = 4},
			["Gold Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 50000, ClassName = "bw_printer_gold", Level = 5},
			["Platinum Printer"]			= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 75000, ClassName = "bw_printer_platinum", Level = 6},
			["Diamond Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 150000, ClassName = "bw_printer_diamond", Level = 7},
			["Nuclear Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 300000, ClassName = "bw_printer_nuclear", Level = 8},
			["Mobius Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 600000, ClassName = "bw_printer_mobius", Level = 9},
			["Dark Matter Printer"]			= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 1000000, ClassName = "bw_printer_darkmatter", Level = 10},

		},

	},
	
	Loadout = {
	
		["Drugs"] = {
		
			["DoubleJump"] 					= BaseWars.GSL{Drug = true, Price = 25000, ClassName = "DoubleJump"},
			["Regen"] 						= BaseWars.GSL{Drug = true, Price = 25000, ClassName = "Regen"},
			["PainKiller"] 					= BaseWars.GSL{Drug = true, Price = 25000, ClassName = "PainKiller"},
			["Steroid"] 					= BaseWars.GSL{Drug = true, Price = 25000, ClassName = "Steroid"},
			["Adrenaline"] 					= BaseWars.GSL{Drug = true, Price = 25000, ClassName = "Adrenaline"},
			["Rage"] 						= BaseWars.GSL{Drug = true, Price = 25000, ClassName = "Rage"},
			["Shield"] 						= BaseWars.GSL{Drug = true, Price = 25000, ClassName = "Shield"},
			["Antidote"]					= BaseWars.GSL{Drug = true, Price = 25000, ClassName = "Antidote"},
		
		},
		
		["Weapons"] = {
		
			["USP"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_usp.mdl", Price = 5000, ClassName = "weapon_twitch_usp"},
			["Deagle"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_deagle.mdl", Price = 10000, ClassName = "weapon_twitch_deagle"},
			
			["UMP"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_smg_ump45.mdl", Price = 10000, ClassName = "weapon_twitch_ump45"},
			["MP5"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_smg_mp5.mdl", Price = 12500, ClassName = "weapon_twitch_mp5"},
		
			["AR2"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_irifle.mdl", Price = 13250, ClassName = "weapon_twitch_hl2pulserifle"},
			["P90"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_smg_p90.mdl", Price = 13000, ClassName = "weapon_twitch_p90"},
			["Galil"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_rif_galil.mdl", Price = 13000, ClassName = "weapon_twitch_galil"},
			["AK47"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_rif_ak47.mdl", Price = 13250, ClassName = "weapon_twitch_ak47"},
			["M4A1"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_rif_m4a1.mdl", Price = 13250, ClassName = "weapon_twitch_m4"},
			
			["M3"] 							= BaseWars.GSL{Gun = true, Model = "models/weapons/w_shot_m3super90.mdl", Price = 35000, ClassName = "weapon_twitch_m3"},
			
			["Crowbar"] 					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_crowbar.mdl", Price = 3000, ClassName = "weapon_crowbar"},
			["Frag"]						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_grenade.mdl", Price = 45000, ClassName = "weapon_frag"},
		
		},
		
		["Super Weapons"] = {
		
			["Heal Gun"]					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_physics.mdl", Price = 350000, ClassName = "weapon_health"},
		
		},
	
	},

}
