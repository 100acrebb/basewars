MODULE.Name 	= "AFK"
MODULE.Author 	= "Q2F2 & Ghosty"

local tag = "BaseWars.AFK"
local PLAYER = debug.getregistry().Player

local function Curry(f)

	local MODULE = MODULE
	local function curriedFunction(...)
		return f(MODULE, ...)
	end

	return curriedFunction

end

function MODULE:ClearAFK(ply, effect)

	return false

end
PLAYER.ClearAFK = Curry(MODULE.ClearAFK)
