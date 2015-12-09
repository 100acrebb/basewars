local CURRENCY = "£"
BaseWars.LANG = {}
BaseWars.LANG.__LANGUAGELOOK = {}

BaseWars.LANG.__LANGUAGELOOK.ENGLISH = {
	CURRENCY				= CURRENCY,

	FactionNameTaken 		= "This faction name is already in use!",
	FactionNotExist			= "That faction does not exist!",
	FactionCantDisband		= "Only the faction leader can disband the faction!",
	FactionWrongPass		= "That is not the correct password!",
	FactionCantLeaveLeader	= "You cannot leave the faction as its leader, you must disband it!",
	FactionCantPassword		= "Only the faction leader can re-password the faction!",
	
	GenericCheat 			= "Nice try! That doesn't work clientside :)",
	
	PayDay					= "PayDay! You received " .. CURRENCY .. "%s!",
	
	DontBuildSpawn			= "Do not build props around spawn.",
	SpawnKill				= "Do not attempt to spawnkill.",
	SpawnCamp				= "Do not attempt to spawncamp.",
	
	RaidOngoing				= "There is allready a raid ongoing!",
	RaidSelfUnraidable		= "You are not raidable youself!",
	RaidTargetUnraidable	= "Your target is not raidable!",
	RaidOver				= "The raid between %s and %s has ENDED!",
	RaidStart				= "Raid started between %s and %s!",
	RaidTargNoFac			= "You cannot raid a factionless player as a faction!",
	RaidSelfNoFac			= "You cannot raid a faction as a factionless player!",
	RaidNoFaction			= "Cannot use faction functions during a raid!",
	CantRaidSelf			= "You can't raid yourself or your faction!",
	
	SteroidEffect			= "You feel full of energy...",
	SteroidRemove			= "Your energy passes...",
	RegenEffect				= "You feel your wounds healing by themselves...",
	RegenRemove				= "Your flesh ceases to heal...",
	PainKillerEffect		= "You feel no pain...",
	PainKillerRemove		= "You once again feel pain...",
	AntidoteEffect			= "You feel very healthy, and less afflicted by poison...",
	AntidoteRemove			= "You no longer feel very healthy...",
	AdrenalineEffect		= "YOU FEEL REALLY PUMPED...",
	AdrenalineRemove		= "You no longer feel pumped...",
	DoubleJumpEffect		= "You feel very light...",
	DoubleJumpRemove		= "You suddenly feel like lead...",
	ShieldEffect			= "You feel energy gathering around you...",
	ShieldRemove			= "The energy that previously protected you disipates...",
	ShieldSave				= "The person you attacked was saved by an energy shield.",
	RageEffect				= "FUCKING KIIIIIIILLLLLLLLLLLL!!!",
	RageRemove				= "Whoa, that was a bit much wasn't it...",
	
	PowerFailure			= "POWER FAILURE!",
	HealthFailure			= "CRITICAL DAMAGE!",
	
	NewSpawnPoint			= "New SpawnPoint has been set!",
	
	SpawnMenuMoney			= "You don't have enough money for that.",
	SpawnMenuBuy			= "You bought a(n) \"%s\" for " .. CURRENCY .. "%s.",
}

local INVALID_LANGUAGE 	= "INVALID LANGUAGE SELECTED! NOTIFY THE SERVER ADMIN!"
local INVALID_STRING 	= "INVALID STRING TRANSLATION! NOTIFY THE SERVER ADMIN!"
local ERROR_UNKNOWN 	= "UKNOWN ERROR IN TRANSLATION SYSTEM!"

setmetatable(BaseWars.LANG, {
	__index = function(t, k)
		
		return 	(not BaseWars.LANG.__LANGUAGELOOK[BASEWARS_CHOSEN_LANGUAGE] and INVALID_LANGUAGE) or
				(not BaseWars.LANG.__LANGUAGELOOK[BASEWARS_CHOSEN_LANGUAGE][k] and INVALID_STRING) or
					BaseWars.LANG.__LANGUAGELOOK[BASEWARS_CHOSEN_LANGUAGE][k] or
					ERROR_UNKNOWN
		
	end
})
