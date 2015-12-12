BASEWARS_CHOSEN_LANGUAGE = "ENGLISH"

BaseWars.Config = {
	Ents = {
		Electronics = {
			Explode		= true,
			WaterProof	= false,
		},
		Turret = {
			Health 		= 75,
			Model		= "models/props_c17/TrapPropeller_Engine.mdl",
		},
		BigBomb = {
			Model 		= "models/props_c17/oildrum001.mdl",
			Skin		= 1,
			Sound		= "weapons/c4/c4_beep1.wav",
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
	},
	
	Notifications = {
		LinesAmount = 11,
		Width		= 582,
		BackColor	= Color(30, 30, 30, 140),
		OpenTime	= 10,
	},
	
	Raid = {
		Time 			= 360,
		CoolDownTime	= 60 * 15,
	},
	
	AFK  = {
		Time 	= 30,
	},
	
	HUD = {
		EntFont = "BudgetLabel",
		EntW	= 175,
		EntH	= 25,
	},
	
	PayDayBase 			= 500,
	PayDayMin			= 50,
	PayDayDivisor		= 1000,
	PayDayRate 			= 180,
	PayDayRandom		= 50,
	
	StartMoney 			= 5000,
	
	CustomChat			= true,
	ExtraStuff			= true,
	
	AllowFriendlyFire	= false,
	
	DefaultWalk			= 200,
	DefaultRun			= 400,
}

local function M(model, price, ent)
	return {

		Model = model,
		Price = price or 0,
		ClassName = ent,

	}
end

local function M2(model, price, ent, sf)
	return {

		Model = model,
		Price = price or 0,
		ClassName = ent,
		ShouldFreeze = true,
		UseSpawnFunc = sf,

	}
end

BaseWars.SpawnList = {}
BaseWars.SpawnList.Models = {

	Barricades = {

		["Fences and Doors"] = {
			["Barred door"] 		= M2"models/props_building_details/Storefront_Template001a_Bars.mdl",
			["Long fence a"] 		= M2"models/props_c17/fence01a.mdl",
			["Short fence a"] 		= M2"models/props_c17/fence01b.mdl",
			["Long fence b"] 		= M2"models/props_c17/fence02a.mdl",
			["Short fence b"] 		= M2"models/props_c17/fence02b.mdl",
			["Long fence c"]		= M2"models/props_c17/fence03a.mdl",
			["Long fence d"]		= M2"models/props_wasteland/interior_fence002d.mdl",
			["Bent fence"] 			= M2"models/props_c17/fence04a.mdl",
			["Gate door"] 			= M2"models/props_c17/gate_door01a.mdl",
			["Long gate door"] 		= M2"models/props_c17/gate_door02a.mdl",
			["Elevator door"]		= M2"models/props_interiors/ElevatorShaft_Door01a.mdl",
			["Fence door"]			= M2"models/props_wasteland/interior_fence001g.mdl",
			["Fence door open"] 	= M2"models/props_wasteland/interior_fence002e.mdl",
			["Prison door"]			= M2"models/props_wasteland/prison_celldoor001b.mdl",
		},

		Barriers = {
			["Concrete barrier"] 	= M2"models/props_c17/concrete_barrier001a.mdl",
			["Metal"] 				= M2"models/props_debris/metal_panel01a.mdl",
			["Long metal"]			= M2"models/props_debris/metal_panel02a.mdl",
			["Blast door a"]		= M2"models/props_lab/blastdoor001a.mdl",
			["Blast door b"] 		= M2"models/props_lab/blastdoor001b.mdl",
			["Double blast door"]	= M2("models/props_lab/blastdoor001c.mdl", 5),
			["Striped barrier a"] 	= M2("models/props_wasteland/barricade001a.mdl", 10),
			["Striped barrier b"]	= M2("models/props_wasteland/barricade002a.mdl", 10),
			["Train track stopper"] = M2("models/props_trainstation/TrackSign02.mdl", 10),
		}

	},

	Furniture = {

		["Beds and Mattresses"] = {
			["Metal bedframe"]		= M"models/props_c17/FurnitureBed001a.mdl",
			["Prison bedframe"]		= M"models/props_wasteland/prison_bedframe001b.mdl",
		},

		["Chairs and Benches"] = {
			["Park bench"]			= M"models/props_c17/bench01a.mdl",
			["Plastic chair"]		= M"models/props_c17/chair02a.mdl",
			["Wooden chair"]		= M"models/props_c17/FurnitureChair001a.mdl",
			["Plaza chair"]			= M"models/props_interiors/Furniture_chair01a.mdl",
			["Plastic chair"]		= M"models/props_interiors/Furniture_chair03a.mdl",
			["Outdoors bench"]		= M2"models/props_trainstation/BenchOutdoor01a.mdl",
			["Indoors bench"]		= M2"models/props_trainstation/bench_indoor001a.mdl",
			["Cafeteria bench"]		= M"models/props_wasteland/cafeteria_bench001a.mdl",
			["Folding chair"]		= M"models/props_wasteland/controlroom_chair001a.mdl",
			["Office chair"]		= M"models/props_combine/breenchair.mdl",
			["Train station bench"]	= M"models/props_trainstation/traincar_seats001.mdl",
		},

		["Tables, Desks and Storage"] = {
			["Round table"]				= M"models/props_c17/FurnitureTable001a.mdl",
			["Big rectangular table"]	= M"models/props_c17/FurnitureTable002a.mdl",
			["Small rectangular table"]	= M"models/props_c17/FurnitureTable003a.mdl",
			["Vanity"]					= M"models/props_interiors/Furniture_Vanity01a.mdl",
			["Shelf 1"]					= M"models/props_interiors/Furniture_shelf01a.mdl",
			["Shelf 2"]					= M"models/props_c17/shelfunit01a.mdl",
			["Wall shelf"]				= M2"models/props_c17/FurnitureShelf002a.mdl",
			["Desk"]					= M"models/props_interiors/Furniture_Desk01a.mdl",
			["Office desk"]				= M"models/props_combine/breendesk.mdl",

		},

		["Signs"] = {

			["Ravenholm sign"]			= M2"models/props_junk/ravenholmsign.mdl",
			["cF sign"]					= M"models/props_trainstation/TrackSign08.mdl",
			["Nf sign"]					= M"models/props_trainstation/TrackSign09.mdl",
			["Right arrow sign"]		= M"models/props_trainstation/TrackSign10.mdl",
			["Speed limit sign (20)"] 	= M("models/props_c17/streetsign001c.mdl",1),
			["Speed limit sign (30)"] 	= M("models/props_c17/streetsign002b.mdl",1),
			["Train crossing sign"] 	= M("models/props_c17/streetsign003b.mdl",1),
			["Crossed sign"]		 	= M("models/props_c17/streetsign004e.mdl",1),
			["No entry sign"]			= M("models/props_c17/streetsign004f.mdl",1),
			["Zebra crossing sign"]		= M("models/props_c17/streetsign005b.mdl",1),
			["Tire warning sign"]		= M("models/props_c17/streetsign005c.mdl",1),
			["Rockfall warning sign"]	= M("models/props_c17/streetsign005d.mdl",1),
			["Signpole"]				= M2("models/props_c17/signpole001.mdl",0),

		},

		["Vegetation"] = {

			["Cheap potted plant"]		= M"models/props/cs_office/plant01.mdl",
			["Old potted plant"]		= M("models/props/de_inferno/claypot03.mdl",1),
			["Big potted plant"]		= M("models/props/de_inferno/pot_big.mdl",1),
			["Flower barrel"]			= M("models/props/de_inferno/flower_barrel.mdl",1),
			["Potted plant a"]			= M("models/props/de_inferno/potted_plant1.mdl",1),
			["Potted plant b"]			= M("models/props/de_inferno/potted_plant2.mdl",1),
			["Potted plant c"]			= M("models/props/de_inferno/potted_plant3.mdl",1),

		},

		["Appliances"] = {

			["Washing machine"]			= M2("models/props_c17/FurnitureWashingmachine001a.mdl", 5),
			["Radiator"]				= M2("models/props_interiors/Radiator01a.mdl", 5),
			["Broken Vending machine"]	= M2("models/props_interiors/VendingMachineSoda01a.mdl", 10),
			["Fridge"]					= M2("models/props_wasteland/kitchen_fridge001a.mdl", 5),
			["Stove"]					= M2("models/props_wasteland/kitchen_stove001a.mdl", 5),
			["Big stove"]				= M2("models/props_wasteland/kitchen_stove002a.mdl", 10),
			["Rusty tumble dryer"]		= M2("models/props_wasteland/laundry_dryer001.mdl", 1),
			["Tumble dryer"]			= M2("models/props_wasteland/laundry_dryer002.mdl", 5),
			["Launderette washer"]		= M2("models/props_wasteland/laundry_washer001a.mdl", 10),
			["Generator"]				= M2("models/props_wasteland/laundry_washer003.mdl", 20),
			["Spotlight"]				= M2("models/props_wasteland/light_spotlight01_lamp.mdl", 5),
			["Prison light"]			= M2("models/props_wasteland/prison_lamp001c.mdl", 1),

		},

	},

	["Build"] = {

		["Plastic"] = {
			-- 1x plates
			["1x1 plate"]			= M"models/hunter/plates/plate1x1.mdl",
			["1x2 plate"]			= M"models/hunter/plates/plate1x2.mdl",
			["1x3 plate"]			= M"models/hunter/plates/plate1x3.mdl",
			["1x4 plate"]			= M"models/hunter/plates/plate1x4.mdl",
			["1x5 plate"]			= M("models/hunter/plates/plate1x5.mdl", 5),
			["1x6 plate"]			= M("models/hunter/plates/plate1x6.mdl", 5),
			["1x7 plate"]			= M("models/hunter/plates/plate1x7.mdl", 5),
			["1x8 plate"]			= M("models/hunter/plates/plate1x8.mdl", 10),

			-- 2x plates
			["2x2 plate"]			= M"models/hunter/plates/plate2x2.mdl",
			["2x3 plate"]			= M"models/hunter/plates/plate2x3.mdl",
			["2x4 plate"]			= M"models/hunter/plates/plate2x4.mdl",
			["2x5 plate"]			= M("models/hunter/plates/plate2x5.mdl", 5),
			["2x6 plate"]			= M("models/hunter/plates/plate2x6.mdl", 5),
			["2x7 plate"]			= M("models/hunter/plates/plate2x7.mdl", 5),
			["2x8 plate"]			= M("models/hunter/plates/plate2x8.mdl", 10),

			-- 3x plates
			["3x3 plate"]			= M"models/hunter/plates/plate3x3.mdl",
			["3x4 plate"]			= M"models/hunter/plates/plate3x4.mdl",
			["3x5 plate"]			= M("models/hunter/plates/plate3x5.mdl", 5),
			["3x6 plate"]			= M("models/hunter/plates/plate3x6.mdl", 5),
			["3x7 plate"]			= M("models/hunter/plates/plate3x7.mdl", 5),
			["3x8 plate"]			= M("models/hunter/plates/plate3x8.mdl", 10),

			-- 4x plates
			["4x4 plate"]			= M"models/hunter/plates/plate4x4.mdl",
			["4x5 plate"]			= M("models/hunter/plates/plate4x5.mdl", 5),
			["4x6 plate"]			= M("models/hunter/plates/plate4x6.mdl", 5),
			["4x7 plate"]			= M("models/hunter/plates/plate4x7.mdl", 5),
			["4x8 plate"]			= M("models/hunter/plates/plate4x8.mdl", 10),

			-- 5x plates
			["5x5 plate"]			= M("models/hunter/plates/plate5x5.mdl", 5),
			["5x6 plate"]			= M("models/hunter/plates/plate5x6.mdl", 5),
			["5x7 plate"]			= M("models/hunter/plates/plate5x7.mdl", 5),
			["5x8 plate"]			= M("models/hunter/plates/plate5x8.mdl", 10),

			-- 6x plates
			["6x6 plate"]			= M("models/hunter/plates/plate6x6.mdl", 5),
			["6x7 plate"]			= M("models/hunter/plates/plate6x7.mdl", 5),
			["6x8 plate"]			= M("models/hunter/plates/plate6x8.mdl", 10),

			-- 7x plates
			["7x7 plate"]			= M("models/hunter/plates/plate7x7.mdl", 5),
			["7x8 plate"]			= M("models/hunter/plates/plate7x8.mdl", 10),

			["8x8 plate"]			= M("models/hunter/plates/plate8x8.mdl", 15),

		},

		["Wood"] = {

			["Short plank"]			= M"models/props_phx/construct/wood/wood_boardx1.mdl",
			["Medium plank"]		= M"models/props_phx/construct/wood/wood_boardx2.mdl",
			["Long plank"]			= M"models/props_phx/construct/wood/wood_boardx4.mdl",

			["1x1 panel"]			= M"models/props_phx/construct/wood/wood_panel1x1.mdl",
			["1x2 panel"]			= M"models/props_phx/construct/wood/wood_panel1x2.mdl",
			["2x2 panel"]			= M"models/props_phx/construct/wood/wood_panel2x2.mdl",
			["2x4 panel"]			= M"models/props_phx/construct/wood/wood_panel2x4.mdl",

			["1x1 rectangle"]		= M"models/props_phx/construct/wood/wood_wire1x1.mdl",
			["1x1x1 cube"]			= M"models/props_phx/construct/wood/wood_wire1x1x1.mdl",
			["1x1x2 cube a"]		= M"models/props_phx/construct/wood/wood_wire1x1x2.mdl",
			["1x1x2 cube b"]		= M"models/props_phx/construct/wood/wood_wire1x1x2b.mdl",
			["1x2 rectangle a"]		= M"models/props_phx/construct/wood/wood_wire1x2.mdl",
			["1x2 rectangle b"]		= M"models/props_phx/construct/wood/wood_wire1x2b.mdl",
			["1x2x2 cube"]			= M"models/props_phx/construct/wood/wood_wire1x2x2b.mdl",
			["2x2 rectangle a"]		= M"models/props_phx/construct/wood/wood_wire2x2.mdl",
			["2x2 rectangle b"]		= M"models/props_phx/construct/wood/wood_wire2x2b.mdl",
			["2x2x2 cube"]			= M"models/props_phx/construct/wood/wood_wire2x2x2b.mdl",

		},

		--["Metal"] = {


		--},

	},

	Junk = {

		["Garbage"] = {

			["Pipe"]				= M"models/props_canal/mattpipe.mdl",
			["Pot"]					= M"models/props_interiors/pot02a.mdl",
			["Assorted junk a"]		= M"models/props_junk/garbage128_composite001a.mdl",
			["Assorted junk b"]		= M"models/props_junk/garbage128_composite001b.mdl",
			["Assorted junk c"]		= M"models/props_junk/garbage128_composite001c.mdl",
			["Assorted junk d"]		= M"models/props_junk/garbage128_composite001d.mdl",
			["Assorted junk e"]		= M"models/props_junk/garbage256_composite001a.mdl",
			["Assorted junk f"]		= M"models/props_junk/garbage256_composite001b.mdl",
			["Assorted junk g"]		= M"models/props_junk/garbage256_composite002a.mdl",
			["Assorted junk h"]		= M"models/props_junk/garbage256_composite002b.mdl",
			["Newspaper"]			= M"models/props_junk/garbage_newspaper001a.mdl",
			["Milk carton a"]		= M"models/props_junk/garbage_milkcarton001a.mdl",
			["Milk carton b"]		= M"models/props_junk/garbage_milkcarton002a.mdl",
			["Detergent bottle a"]	= M"models/props_junk/garbage_plasticbottle001a.mdl",
			["Detergent bottle b"]	= M"models/props_junk/garbage_plasticbottle002a.mdl",
			["Juice bottle"]		= M"models/props_junk/garbage_plasticbottle003a.mdl",
			["Leftover chinese"]	= M"models/props_junk/garbage_takeoutcarton001a.mdl",
			["Bottle of beer"]		= M"models/props_junk/GlassBottle01a.mdl",
			["Bottle of rum"]		= M"models/props_junk/glassjug01.mdl",
			["Fishing hook"]		= M"models/props_junk/meathook001a.mdl",
			["Spear"]				= M"models/props_junk/harpoon002a.mdl",
			["Paint can a"]			= M"models/props_junk/metal_paintcan001a.mdl",
			["Paint can b"]			= M"models/props_junk/metal_paintcan001b.mdl",
			["Bucket"]				= M"models/props_junk/MetalBucket01a.mdl",
			["Double bucket"]		= M"models/props_junk/MetalBucket02a.mdl",
			["Plastic container"]	= M"models/props_junk/PlasticCrate01a.mdl",

		},

		["Barrels and Explosives"] = {

			["Barrel"]				= M2("models/props_c17/oildrum001.mdl",100),
			["Explosive barrel"]	= M2("models/props_c17/oildrum001_explosive.mdl",1000),
			["MK-82 bomb"]			= M2("models/props_phx/mk-82.mdl",1000),
			["WW2 bomb"]			= M2("models/props_phx/ww2bomb.mdl",1050),
			["Amraam missile"]		= M2("models/props_phx/amraam.mdl",5000),
			["Torpedo"]				= M2("models/props_phx/torpedo.mdl",5050),

		},

	},
	
	Entities = {

		["Generators"] = {

			["Coal Fired Generator"]	= M2("models/props_wasteland/laundry_washer003.mdl", 3000, "bw_gen_coalfired"),
			["Fission Reactor"]			= M2("models/props/de_nuke/equipment1.mdl", 50000, "bw_gen_fission"),
			["Fusion Reactor"]			= M2("models/xqm/hydcontrolbox.mdl", 1000000, "bw_gen_fusion"),

		},
		
		["Dispensers"] = {

			["Vending Machine"]			= M2("models/props_interiors/VendingMachineSoda01a.mdl", 2000, "bw_vendingmachine"),

		},
		
		["Misc"] = {

			["Spawnpoint"]			= M2("models/props_trainstation/trainstation_clock001.mdl", 10000, "bw_spawnpoint", true),
			["Repair Kit"]			= M("models/Items/car_battery01.mdl", 2000, "bw_repairkit"),
			["Printer Paper"]		= M("models/props_junk/garbage_newspaper001a.mdl", 250, "bw_printerpaper"),

		},
		
		["Printers"] = {

			["Basic Printer"]			= M2("models/props_lab/reciever01a.mdl", 2000, "bw_base_moneyprinter"),
			["Copper Printer"]			= M2("models/props_lab/reciever01a.mdl", 5000, "bw_printer_copper"),
			["Silver Printer"]			= M2("models/props_lab/reciever01a.mdl", 15000, "bw_printer_silver"),
			["Gold Printer"]			= M2("models/props_lab/reciever01a.mdl", 30000, "bw_printer_gold"),

		},

	},

}
