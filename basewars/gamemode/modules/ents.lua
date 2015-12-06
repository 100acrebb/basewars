MODULE.Name 	= "Ents"
MODULE.Author 	= "Q2F2 & Ghosty"

local tag = "BaseWars.Ents"
local PLAYER = debug.getregistry().Player

local function Curry(f)

	local MODULE = MODULE
	local function curriedFunction(...)
		return f(MODULE, ...)
	end

	return curriedFunction

end

function MODULE:ValidOwner(ent)

	local Owner = ent.Owner or (ent.CPPIGetOwner and ent:CPPIGetOwner())
	
	return Owner and IsValid(Owner) and Owner:IsPlayer()
	
end

function MODULE:ValidPlayer(ply)

	return ply and IsValid(ply) and ply:IsPlayer()
	
end
