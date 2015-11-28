BaseWars.Config = {
	Ents = {
		Turret = {
			Health 		= 75,
			Model		= "models/props_c17/TrapPropeller_Engine.mdl",
		},
		
	},
	
	Drugs = {
		DoubleJump = {
			JumpHeight = Vector(0, 0, 320),
		},
		Steroid = {
			Walk = 330,
			Run = 550,
		},
	},
	
	Notifications = {
		LinesAmount = 11,
		Width		= 570,
		BackColor	= Color(30, 30, 30, 140),
		OpenTime	= 10,
	},
	
	Raid = {
		Time = 360,
	},
	
	PayDayBase 			= 500,
	PayDayMin			= 50,
	PayDayDivisor		= 1000,
	PayDayRate 			= 180,
	PayDayRandom		= 50,
	
	StartMoney 			= 5000,
	
	CustomChat			= true,
	ExtraStuff			= true,
}
