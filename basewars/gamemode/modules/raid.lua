MODULE.Name 	= "Raid"
MODULE.Author 	= "Q2F2 & Ghosty"

local tag = "BaseWars.Raid"
local PLAYER = debug.getregistry().Player

local function Curry(f)

	local MODULE = MODULE
	local function curriedFunction(...)
		return f(MODULE, ...)
	end

	return curriedFunction

end
