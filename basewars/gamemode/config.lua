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
		}
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
		Width		= 570,
		BackColor	= Color(30, 30, 30, 140),
		OpenTime	= 10,
	},
	
	Raid = {
		Time = 360,
	},
	
	AFK  = {
		Time = 30,
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
