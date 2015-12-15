MODULE.Name 	= "NPCs"
MODULE.Author 	= "Q2F2 & Ghosty"

local tag = "BaseWars.NPCs"
local PLAYER = debug.getregistry().Player

local function Curry(f)

	local MODULE = MODULE
	local function curriedFunction(...)
		return f(MODULE, ...)
	end

	return curriedFunction

end

function MODULE:CreateNPC(type)



end
