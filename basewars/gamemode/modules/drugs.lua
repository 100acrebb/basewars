MODULE.Name 	= "Drugs"
MODULE.Author 	= "Q2F2 & Ghosty"

local tag = "BaseWars.Drugs"
local PLAYER = debug.getregistry().Player

local function Curry(f)

	local MODULE = MODULE
	local function curriedFunction(...)
		return f(MODULE, ...)
	end

	return curriedFunction

end

function MODULE:HasDrug(ply, effect)

	return false

end
PLAYER.HasDrug = Curry(MODULE.HasDrug)
