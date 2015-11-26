MODULE.Name 	= "Events"
MODULE.Author 	= "Q2F2 & Ghosty"

local tag = "BaseWars.Events"
local PLAYER = debug.getregistry().Player

local function Curry(f)

	local MODULE = MODULE
	local function curriedFunction(...)
		return f(MODULE, ...)
	end

	return curriedFunction

end

if SERVER then

	function MODULE:PayDay(ply)
		
		if not ply then
		
			for k,v in next, player.GetAll() do
			
				v:PayDay()
				
			end
			
			return
			
		end
		
		local Money 		= ply:GetMoney()
		
		local BaseRate 		= BaseWars.Config.PayDayBase
		local Thousands  	= math.floor(Money / BaseWars.Config.PayDayDivisor)
		
		local Final 		= math.max(BaseWars.Config.PayDayMin, BaseRate - Thousands)
		
		ply:Notify(string.format(BaseWars.LANG.PayDay, Final), BASEWARS_NOTIFICATION_ERROR)
		
		ply:GiveMoney(Final)

	end
	PLAYER.PayDay = Curry(MODULE.PayDay)

	function  MODULE:CleanupMap()

		for k, v in next, ents.FindByClass("game_text") do
		
			SafeRemoveEntity(v)
		
		end
		
	end

	timer.Create(tag .. ".PayDay", BaseWars.Config.PayDayRate, 0, Curry(MODULE.PayDay))
	hook.Add("InitPostEntity", tag .. ".CleanupMap", Curry(MODULE.CleanupMap))

end
