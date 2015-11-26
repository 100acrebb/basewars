BaseWars.Karma = {}

local tag = "BaseWars.Karma"
local PLAYER = debug.getregistry().Player

function BaseWars.Karma.Get(ply)

	return 50

end
PLAYER.GetKarma = BaseWars.Karma.Get

function BaseWars.Karma.Set(ply, value)

	if not value or not isnumber(value) then
	
		ErrorNoHalt("Error setting Karma, invalid value.")
		debug.Trace()
	
		return
	
	end

	if CLIENT then
	
		ErrorNoHalt("Cannot set Karma clientside.")
	
		return
	
	end

end
PLAYER.SetKarma = BaseWars.Karma.Set

function BaseWars.Karma.Add(ply, amount)
	
	local Value = ply:GetKarma()
	
	ply:SetKarma(Value + amount)
	
end
PLAYER.AddKarma = BaseWars.Karma.Add
