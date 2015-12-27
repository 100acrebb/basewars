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
		HurtTime = 80,
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
	
	DispenserTime		= 1,
	
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

}

BaseWars.SpawnList = {}
BaseWars.SpawnList.Models = {

	--[[
	Barricades = {

		["Fences and Doors"] = {
			["Barred door"] 		= BaseWars.GenSpawnList"models/props_building_details/Storefront_Template001a_Bars.mdl",
			["Long fence a"] 		= BaseWars.GenSpawnList"models/props_c17/fence01a.mdl",
			["Short fence a"] 		= BaseWars.GenSpawnList"models/props_c17/fence01b.mdl",
			["Long fence b"] 		= BaseWars.GenSpawnList"models/props_c17/fence02a.mdl",
			["Short fence b"] 		= BaseWars.GenSpawnList"models/props_c17/fence02b.mdl",
			["Long fence c"]		= BaseWars.GenSpawnList"models/props_c17/fence03a.mdl",
			["Long fence d"]		= BaseWars.GenSpawnList"models/props_wasteland/interior_fence002d.mdl",
			["Bent fence"] 			= BaseWars.GenSpawnList"models/props_c17/fence04a.mdl",
			["Gate door"] 			= BaseWars.GenSpawnList"models/props_c17/gate_door01a.mdl",
			["Long gate door"] 		= BaseWars.GenSpawnList"models/props_c17/gate_door02a.mdl",
			["Elevator door"]		= BaseWars.GenSpawnList"models/props_interiors/ElevatorShaft_Door01a.mdl",
			["Fence door"]			= BaseWars.GenSpawnList"models/props_wasteland/interior_fence001g.mdl",
			["Fence door open"] 	= BaseWars.GenSpawnList"models/props_wasteland/interior_fence002e.mdl",
			["Prison door"]			= BaseWars.GenSpawnList"models/props_wasteland/prison_celldoor001b.mdl",
		},

		Barriers = {
			["Concrete barrier"] 	= BaseWars.GenSpawnList"models/props_c17/concrete_barrier001a.mdl",
			["Metal"] 				= BaseWars.GenSpawnList"models/props_debris/metal_panel01a.mdl",
			["Long metal"]			= BaseWars.GenSpawnList"models/props_debris/metal_panel02a.mdl",
			["Blast door a"]		= BaseWars.GenSpawnList"models/props_lab/blastdoor001a.mdl",
			["Blast door b"] 		= BaseWars.GenSpawnList"models/props_lab/blastdoor001b.mdl",
			["Double blast door"]	= BaseWars.GenSpawnList("models/props_lab/blastdoor001c.mdl", 5),
			["Striped barrier a"] 	= BaseWars.GenSpawnList("models/props_wasteland/barricade001a.mdl", 10),
			["Striped barrier b"]	= BaseWars.GenSpawnList("models/props_wasteland/barricade002a.mdl", 10),
			["Train track stopper"] = BaseWars.GenSpawnList("models/props_trainstation/TrackSign02.mdl", 10),
		}

	},

	Furniture = {

		["Beds and Mattresses"] = {
			["Metal bedframe"]		= BaseWars.GenSpawnList"models/props_c17/FurnitureBed001a.mdl",
			["Prison bedframe"]		= BaseWars.GenSpawnList"models/props_wasteland/prison_bedframe001b.mdl",
		},

		["Chairs and Benches"] = {
			["Park bench"]			= BaseWars.GenSpawnList"models/props_c17/bench01a.mdl",
			["Plastic chair"]		= BaseWars.GenSpawnList"models/props_c17/chair02a.mdl",
			["Wooden chair"]		= BaseWars.GenSpawnList"models/props_c17/FurnitureChair001a.mdl",
			["Plaza chair"]			= BaseWars.GenSpawnList"models/props_interiors/Furniture_chair01a.mdl",
			["Plastic chair"]		= BaseWars.GenSpawnList"models/props_interiors/Furniture_chair03a.mdl",
			["Outdoors bench"]		= BaseWars.GenSpawnList"models/props_trainstation/BenchOutdoor01a.mdl",
			["Indoors bench"]		= BaseWars.GenSpawnList"models/props_trainstation/bench_indoor001a.mdl",
			["Cafeteria bench"]		= BaseWars.GenSpawnList"models/props_wasteland/cafeteria_bench001a.mdl",
			["Folding chair"]		= BaseWars.GenSpawnList"models/props_wasteland/controlroom_chair001a.mdl",
			["Office chair"]		= BaseWars.GenSpawnList"models/props_combine/breenchair.mdl",
			["Train station bench"]	= BaseWars.GenSpawnList"models/props_trainstation/traincar_seats001.mdl",
		},

		["Tables, Desks and Storage"] = {
			["Round table"]				= BaseWars.GenSpawnList"models/props_c17/FurnitureTable001a.mdl",
			["Big rectangular table"]	= BaseWars.GenSpawnList"models/props_c17/FurnitureTable002a.mdl",
			["Small rectangular table"]	= BaseWars.GenSpawnList"models/props_c17/FurnitureTable003a.mdl",
			["Vanity"]					= BaseWars.GenSpawnList"models/props_interiors/Furniture_Vanity01a.mdl",
			["Shelf 1"]					= BaseWars.GenSpawnList"models/props_interiors/Furniture_shelf01a.mdl",
			["Shelf 2"]					= BaseWars.GenSpawnList"models/props_c17/shelfunit01a.mdl",
			["Wall shelf"]				= BaseWars.GenSpawnList"models/props_c17/FurnitureShelf002a.mdl",
			["Desk"]					= BaseWars.GenSpawnList"models/props_interiors/Furniture_Desk01a.mdl",
			["Office desk"]				= BaseWars.GenSpawnList"models/props_combine/breendesk.mdl",

		},

		["Signs"] = {

			["Ravenholm sign"]			= BaseWars.GenSpawnList"models/props_junk/ravenholmsign.mdl",
			["cF sign"]					= BaseWars.GenSpawnList"models/props_trainstation/TrackSign08.mdl",
			["Nf sign"]					= BaseWars.GenSpawnList"models/props_trainstation/TrackSign09.mdl",
			["Right arrow sign"]		= BaseWars.GenSpawnList"models/props_trainstation/TrackSign10.mdl",
			["Speed limit sign (20)"] 	= BaseWars.GenSpawnList("models/props_c17/streetsign001c.mdl",1),
			["Speed limit sign (30)"] 	= BaseWars.GenSpawnList("models/props_c17/streetsign002b.mdl",1),
			["Train crossing sign"] 	= BaseWars.GenSpawnList("models/props_c17/streetsign003b.mdl",1),
			["Crossed sign"]		 	= BaseWars.GenSpawnList("models/props_c17/streetsign004e.mdl",1),
			["No entry sign"]			= BaseWars.GenSpawnList("models/props_c17/streetsign004f.mdl",1),
			["Zebra crossing sign"]		= BaseWars.GenSpawnList("models/props_c17/streetsign005b.mdl",1),
			["Tire warning sign"]		= BaseWars.GenSpawnList("models/props_c17/streetsign005c.mdl",1),
			["Rockfall warning sign"]	= BaseWars.GenSpawnList("models/props_c17/streetsign005d.mdl",1),
			["Signpole"]				= BaseWars.GenSpawnList("models/props_c17/signpole001.mdl",0),

		},

		["Vegetation"] = {

			["Cheap potted plant"]		= BaseWars.GenSpawnList"models/props/cs_office/plant01.mdl",
			["Old potted plant"]		= BaseWars.GenSpawnList("models/props/de_inferno/claypot03.mdl",1),
			["Big potted plant"]		= BaseWars.GenSpawnList("models/props/de_inferno/pot_big.mdl",1),
			["Flower barrel"]			= BaseWars.GenSpawnList("models/props/de_inferno/flower_barrel.mdl",1),
			["Potted plant a"]			= BaseWars.GenSpawnList("models/props/de_inferno/potted_plant1.mdl",1),
			["Potted plant b"]			= BaseWars.GenSpawnList("models/props/de_inferno/potted_plant2.mdl",1),
			["Potted plant c"]			= BaseWars.GenSpawnList("models/props/de_inferno/potted_plant3.mdl",1),

		},

		["Appliances"] = {

			["Washing machine"]			= BaseWars.GenSpawnList("models/props_c17/FurnitureWashingmachine001a.mdl", 5),
			["Radiator"]				= BaseWars.GenSpawnList("models/props_interiors/Radiator01a.mdl", 5),
			["Fridge"]					= BaseWars.GenSpawnList("models/props_wasteland/kitchen_fridge001a.mdl", 5),
			["Stove"]					= BaseWars.GenSpawnList("models/props_wasteland/kitchen_stove001a.mdl", 5),
			["Big stove"]				= BaseWars.GenSpawnList("models/props_wasteland/kitchen_stove002a.mdl", 10),
			["Rusty tumble dryer"]		= BaseWars.GenSpawnList("models/props_wasteland/laundry_dryer001.mdl", 1),
			["Tumble dryer"]			= BaseWars.GenSpawnList("models/props_wasteland/laundry_dryer002.mdl", 5),
			["Launderette washer"]		= BaseWars.GenSpawnList("models/props_wasteland/laundry_washer001a.mdl", 10),
			["Spotlight"]				= BaseWars.GenSpawnList("models/props_wasteland/light_spotlight01_lamp.mdl", 5),
			["Prison light"]			= BaseWars.GenSpawnList("models/props_wasteland/prison_lamp001c.mdl", 1),

		},

	},

	["Build"] = {

		["Plastic"] = {
			-- 1x plates
			["1x1 plate"]			= BaseWars.GenSpawnList"models/hunter/plates/plate1x1.mdl",
			["1x2 plate"]			= BaseWars.GenSpawnList"models/hunter/plates/plate1x2.mdl",
			["1x3 plate"]			= BaseWars.GenSpawnList"models/hunter/plates/plate1x3.mdl",
			["1x4 plate"]			= BaseWars.GenSpawnList"models/hunter/plates/plate1x4.mdl",
			["1x5 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate1x5.mdl", 5),
			["1x6 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate1x6.mdl", 5),
			["1x7 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate1x7.mdl", 5),
			["1x8 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate1x8.mdl", 10),

			-- 2x plates
			["2x2 plate"]			= BaseWars.GenSpawnList"models/hunter/plates/plate2x2.mdl",
			["2x3 plate"]			= BaseWars.GenSpawnList"models/hunter/plates/plate2x3.mdl",
			["2x4 plate"]			= BaseWars.GenSpawnList"models/hunter/plates/plate2x4.mdl",
			["2x5 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate2x5.mdl", 5),
			["2x6 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate2x6.mdl", 5),
			["2x7 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate2x7.mdl", 5),
			["2x8 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate2x8.mdl", 10),

			-- 3x plates
			["3x3 plate"]			= BaseWars.GenSpawnList"models/hunter/plates/plate3x3.mdl",
			["3x4 plate"]			= BaseWars.GenSpawnList"models/hunter/plates/plate3x4.mdl",
			["3x5 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate3x5.mdl", 5),
			["3x6 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate3x6.mdl", 5),
			["3x7 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate3x7.mdl", 5),
			["3x8 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate3x8.mdl", 10),

			-- 4x plates
			["4x4 plate"]			= BaseWars.GenSpawnList"models/hunter/plates/plate4x4.mdl",
			["4x5 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate4x5.mdl", 5),
			["4x6 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate4x6.mdl", 5),
			["4x7 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate4x7.mdl", 5),
			["4x8 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate4x8.mdl", 10),

			-- 5x plates
			["5x5 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate5x5.mdl", 5),
			["5x6 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate5x6.mdl", 5),
			["5x7 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate5x7.mdl", 5),
			["5x8 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate5x8.mdl", 10),

			-- 6x plates
			["6x6 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate6x6.mdl", 5),
			["6x7 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate6x7.mdl", 5),
			["6x8 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate6x8.mdl", 10),

			-- 7x plates
			["7x7 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate7x7.mdl", 5),
			["7x8 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate7x8.mdl", 10),

			["8x8 plate"]			= BaseWars.GenSpawnList("models/hunter/plates/plate8x8.mdl", 15),

		},

		["Wood"] = {

			["Short plank"]			= BaseWars.GenSpawnList"models/props_phx/construct/wood/wood_boardx1.mdl",
			["Medium plank"]		= BaseWars.GenSpawnList"models/props_phx/construct/wood/wood_boardx2.mdl",
			["Long plank"]			= BaseWars.GenSpawnList"models/props_phx/construct/wood/wood_boardx4.mdl",

			["1x1 panel"]			= BaseWars.GenSpawnList"models/props_phx/construct/wood/wood_panel1x1.mdl",
			["1x2 panel"]			= BaseWars.GenSpawnList"models/props_phx/construct/wood/wood_panel1x2.mdl",
			["2x2 panel"]			= BaseWars.GenSpawnList"models/props_phx/construct/wood/wood_panel2x2.mdl",
			["2x4 panel"]			= BaseWars.GenSpawnList"models/props_phx/construct/wood/wood_panel2x4.mdl",

			["1x1 rectangle"]		= BaseWars.GenSpawnList"models/props_phx/construct/wood/wood_wire1x1.mdl",
			["1x1x1 cube"]			= BaseWars.GenSpawnList"models/props_phx/construct/wood/wood_wire1x1x1.mdl",
			["1x1x2 cube a"]		= BaseWars.GenSpawnList"models/props_phx/construct/wood/wood_wire1x1x2.mdl",
			["1x1x2 cube b"]		= BaseWars.GenSpawnList"models/props_phx/construct/wood/wood_wire1x1x2b.mdl",
			["1x2 rectangle a"]		= BaseWars.GenSpawnList"models/props_phx/construct/wood/wood_wire1x2.mdl",
			["1x2 rectangle b"]		= BaseWars.GenSpawnList"models/props_phx/construct/wood/wood_wire1x2b.mdl",
			["1x2x2 cube"]			= BaseWars.GenSpawnList"models/props_phx/construct/wood/wood_wire1x2x2b.mdl",
			["2x2 rectangle a"]		= BaseWars.GenSpawnList"models/props_phx/construct/wood/wood_wire2x2.mdl",
			["2x2 rectangle b"]		= BaseWars.GenSpawnList"models/props_phx/construct/wood/wood_wire2x2b.mdl",
			["2x2x2 cube"]			= BaseWars.GenSpawnList"models/props_phx/construct/wood/wood_wire2x2x2b.mdl",

		},

		--["Metal"] = {


		--},

	},

	Junk = {

		["Garbage"] = {

			["Pipe"]				= BaseWars.GenSpawnList"models/props_canal/mattpipe.mdl",
			["Pot"]					= BaseWars.GenSpawnList"models/props_interiors/pot02a.mdl",
			["Assorted junk a"]		= BaseWars.GenSpawnList"models/props_junk/garbage128_composite001a.mdl",
			["Assorted junk b"]		= BaseWars.GenSpawnList"models/props_junk/garbage128_composite001b.mdl",
			["Assorted junk c"]		= BaseWars.GenSpawnList"models/props_junk/garbage128_composite001c.mdl",
			["Assorted junk d"]		= BaseWars.GenSpawnList"models/props_junk/garbage128_composite001d.mdl",
			["Assorted junk e"]		= BaseWars.GenSpawnList"models/props_junk/garbage256_composite001a.mdl",
			["Assorted junk f"]		= BaseWars.GenSpawnList"models/props_junk/garbage256_composite001b.mdl",
			["Assorted junk g"]		= BaseWars.GenSpawnList"models/props_junk/garbage256_composite002a.mdl",
			["Assorted junk h"]		= BaseWars.GenSpawnList"models/props_junk/garbage256_composite002b.mdl",
			["Newspaper"]			= BaseWars.GenSpawnList"models/props_junk/garbage_newspaper001a.mdl",
			["Milk carton a"]		= BaseWars.GenSpawnList"models/props_junk/garbage_milkcarton001a.mdl",
			["Milk carton b"]		= BaseWars.GenSpawnList"models/props_junk/garbage_milkcarton002a.mdl",
			["Detergent bottle a"]	= BaseWars.GenSpawnList"models/props_junk/garbage_plasticbottle001a.mdl",
			["Detergent bottle b"]	= BaseWars.GenSpawnList"models/props_junk/garbage_plasticbottle002a.mdl",
			["Juice bottle"]		= BaseWars.GenSpawnList"models/props_junk/garbage_plasticbottle003a.mdl",
			["Leftover chinese"]	= BaseWars.GenSpawnList"models/props_junk/garbage_takeoutcarton001a.mdl",
			["Bottle of beer"]		= BaseWars.GenSpawnList"models/props_junk/GlassBottle01a.mdl",
			["Bottle of rum"]		= BaseWars.GenSpawnList"models/props_junk/glassjug01.mdl",
			["Fishing hook"]		= BaseWars.GenSpawnList"models/props_junk/meathook001a.mdl",
			["Spear"]				= BaseWars.GenSpawnList"models/props_junk/harpoon002a.mdl",
			["Paint can a"]			= BaseWars.GenSpawnList"models/props_junk/metal_paintcan001a.mdl",
			["Paint can b"]			= BaseWars.GenSpawnList"models/props_junk/metal_paintcan001b.mdl",
			["Bucket"]				= BaseWars.GenSpawnList"models/props_junk/MetalBucket01a.mdl",
			["Double bucket"]		= BaseWars.GenSpawnList"models/props_junk/MetalBucket02a.mdl",
			["Plastic container"]	= BaseWars.GenSpawnList"models/props_junk/PlasticCrate01a.mdl",

		},

		["Barrels and Explosives"] = {

			["Barrel"]				= BaseWars.GenSpawnList("models/props_c17/oildrum001.mdl",100),
			["Explosive barrel"]	= BaseWars.GenSpawnList("models/props_c17/oildrum001_explosive.mdl",1000),
			["MK-82 bomb"]			= BaseWars.GenSpawnList("models/props_phx/mk-82.mdl",1000),
			["WW2 bomb"]			= BaseWars.GenSpawnList("models/props_phx/ww2bomb.mdl",1050),
			["Amraam missile"]		= BaseWars.GenSpawnList("models/props_phx/amraam.mdl",5000),
			["Torpedo"]				= BaseWars.GenSpawnList("models/props_phx/torpedo.mdl",5050),

		},

	},]]
	
	Entities = {

		["Generators"] = {

			["Solar Panel"]				= BaseWars.GenSpawnList("models/props_lab/miniteleport.mdl", 1500, "bw_gen_solar"),
			["Coal Fired Generator"]	= BaseWars.GenSpawnList("models/props_wasteland/laundry_washer003.mdl", 10000, "bw_gen_coalfired"),
			["Fission Reactor"]			= BaseWars.GenSpawnList("models/props/de_nuke/equipment1.mdl", 50000, "bw_gen_fission"),
			["Fusion Reactor"]			= BaseWars.GenSpawnList("models/xqm/hydcontrolbox.mdl", 250000, "bw_gen_fusion"),
			--["Hentai Generator"]		= BaseWars.GenSpawnList("models/props_junk/garbage_newspaper001a.mdl", 20, "bw_gen_hentai"),

		},
		
		["Dispensers"] = {

			["Vending Machine"]			= BaseWars.GenSpawnList("models/props_interiors/VendingMachineSoda01a.mdl", 10000, "bw_vendingmachine"),
			["Ammo Dispenser"]			= BaseWars.GenSpawnList("models/props_lab/reciever_cart.mdl", 12000, "bw_dispenser_ammo"),
			["Armour Dispenser"]		= BaseWars.GenSpawnList("models/props_combine/suit_charger001.mdl", 25000, "bw_dispenser_armor"),
			["HealthPad"]				= BaseWars.GenSpawnList("models/props_lab/teleplatform.mdl", 30000, "bw_healthpad", true),

		},
		
		["Structures"] = {
		
			["Spawnpoint"]			= BaseWars.GenSpawnList("models/props_trainstation/trainstation_clock001.mdl", 15000, "bw_spawnpoint", true),
			["Drug Lab"]			= BaseWars.GenSpawnList("models/props_lab/crematorcase.mdl", 25000, "bw_druglab"),
		
		},
		
		["Defence"] = {
		
			["Ballistic Turret"] 	= BaseWars.GenSpawnList("models/Combine_turrets/Floor_turret.mdl", 50000, "bw_turret_ballistic", false, 2),
			["Laser Turret"] 		= BaseWars.GenSpawnList("models/Combine_turrets/Floor_turret.mdl", 80000, "bw_turret_laser", false, 1),
			["Tesla Coil"]			= BaseWars.GenSpawnList("models/props_c17/substation_transformer01d.mdl", 500000, "bw_tesla", false, 1)
		
		},
		
		["Consumables"] = {

			["Repair Kit"]			= BaseWars.GenSpawnList("models/Items/car_battery01.mdl", 2000, "bw_repairkit", true),
			["Printer Paper"]		= BaseWars.GenSpawnList("models/props_junk/garbage_newspaper001a.mdl", 250, "bw_printerpaper", true),

		},
		
		["Printers"] = {

			["Basic Printer"]			= BaseWars.GenSpawnList("models/props_lab/reciever01a.mdl", 2000, "bw_base_moneyprinter"),
			["Copper Printer"]			= BaseWars.GenSpawnList("models/props_lab/reciever01a.mdl", 12500, "bw_printer_copper"),
			["Silver Printer"]			= BaseWars.GenSpawnList("models/props_lab/reciever01a.mdl", 20000, "bw_printer_silver"),
			["Gold Printer"]			= BaseWars.GenSpawnList("models/props_lab/reciever01a.mdl", 50000, "bw_printer_gold"),
			["Platinum Printer"]		= BaseWars.GenSpawnList("models/props_lab/reciever01a.mdl", 75000, "bw_printer_platinum"),
			["Diamond Printer"]			= BaseWars.GenSpawnList("models/props_lab/reciever01a.mdl", 150000, "bw_printer_diamond"),

		},

	},
	
	Loadout = {
	
		["Drugs"] = {
		
			["DoubleJump"] 	= BaseWars.GenDrug(10000, "DoubleJump"),
			["Regen"] 		= BaseWars.GenDrug(10000, "Regen"),
			["PainKiller"] 	= BaseWars.GenDrug(10000, "PainKiller"),
			["Steroid"] 	= BaseWars.GenDrug(10000, "Steroid"),
			["Adrenaline"] 	= BaseWars.GenDrug(10000, "Adrenaline"),
			["Rage"] 		= BaseWars.GenDrug(10000, "Rage"),
			["Shield"] 		= BaseWars.GenDrug(10000, "Shield"),
			["Antidote"]	= BaseWars.GenDrug(10000, "Antidote"),
		
		},
		
		["Weapons"] = {
		
			["USP"] 			= BaseWars.GenWeapon("models/weapons/w_pist_usp.mdl", 1000, "weapon_twitch_usp"),
			["Deagle"] 			= BaseWars.GenWeapon("models/weapons/w_pist_deagle.mdl", 1800, "weapon_twitch_deagle"),
			
			["UMP"] 			= BaseWars.GenWeapon("models/weapons/w_smg_ump45.mdl", 2500, "weapon_twitch_ump45"),
			["MP5"] 			= BaseWars.GenWeapon("models/weapons/w_smg_mp5.mdl", 2500, "weapon_twitch_mp5"),
		
			["AR2"] 			= BaseWars.GenWeapon("models/weapons/w_irifle.mdl", 3250, "weapon_twitch_hl2pulserifle"),
			["P90"] 			= BaseWars.GenWeapon("models/weapons/w_smg_p90.mdl", 3000, "weapon_twitch_p90"),
			["Galil"] 			= BaseWars.GenWeapon("models/weapons/w_rif_galil.mdl", 3000, "weapon_twitch_galil"),
			["AK47"] 			= BaseWars.GenWeapon("models/weapons/w_rif_ak47.mdl", 3250, "weapon_twitch_ak47"),
			["M4A1"] 			= BaseWars.GenWeapon("models/weapons/w_rif_m4a1.mdl", 3250, "weapon_twitch_m4"),
			
			["M3"] 				= BaseWars.GenWeapon("models/weapons/w_shot_m3super90.mdl", 5000, "weapon_twitch_m3"),
			
			["Crowbar"] 		= BaseWars.GenWeapon("models/weapons/w_crowbar.mdl", 500, "weapon_crowbar"),
			["Frag"]			= BaseWars.GenWeapon("models/weapons/w_grenade.mdl", 12500, "weapon_frag"),
		
		},
		
		["Super Weapons"] = {
		
			["Heal Gun"]			= BaseWars.GenWeapon("models/weapons/w_physics.mdl", 30000, "weapon_health"),
			--["Crescent Rose"]			= BaseWars.GenWeapon("models/rubyscythe.mdl", 300000, "weapon_rubyrose_scythe"),
			--["Red Scissor Blade"]		= BaseWars.GenWeapon("models/anfrien/kill_la_kill/scissor_blade/red_scissor_blade.mdl", 250000, "weapon_scissorblade_red"),
			--["Purple Scissor Blade"]	= BaseWars.GenWeapon("models/anfrien/kill_la_kill/scissor_blade/purple_scissor_blade.mdl", 250000, "weapon_scissorblade_purple"),
		
		},
	
	}

}
