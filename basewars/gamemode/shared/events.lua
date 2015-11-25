BaseWars.Events = {}

local tag = "BaseWars.Events"
local PLAYER = debug.getregistry().Player

if SERVER then

	function BaseWars.Events.PayDay(ply)
		
		local Money 		= ply:GetMoney()
		
		local BaseRate 		= BaseWars.Config.PayDayBase
		local Thousands  	= math.floor(Money / BaseWars.Config.PayDayDivisor)
		
		local Final 		= math.max(BaseWars.Config.PayDayMin, BaseRate - Thousands)
		
		ply:GiveMoney(Final)

	end
	PLAYER.PayDay = BaseWars.Events.PayDay

	function BaseWars.Events.CleanupMap()

		for k, v in next, ents.FindByClass("game_text") do
		
			SafeRemoveEntity(v)
		
		end
		
	end

	timer.Create(tag .. ".PayDay", BaseWars.Config.PayDayRate, 0, BaseWars.Events.PayDay)
	hook.Add("InitPostEntity", tag .. ".CleanupMap", BaseWars.Events.CleanupMap)

end
