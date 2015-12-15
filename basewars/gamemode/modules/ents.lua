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

function MODULE:Valid(ent)

	return ent and isentity(ent) and IsValid(ent) and ent
	
end

function MODULE:ValidOwner(ent)

	local Owner = ent and (ent.CPPIGetOwner and ent:CPPIGetOwner())
	
	return self:ValidPlayer(Owner)
	
end

function MODULE:ValidPlayer(ply)

	return ply and IsValid(ply) and ply:IsPlayer() and ply
	
end

function MODULE:ValidClose(ent, ent2, dist)

	return self:Valid(ent) and ent:GetPos():Distance(ent2:GetPos()) <= dist and ent

end
