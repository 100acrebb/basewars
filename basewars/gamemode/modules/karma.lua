MODULE.Name 	= "Karma"
MODULE.Author 	= "Q2F2 & Ghosty"

local tag = "BaseWars.Karma"
local PLAYER = debug.getregistry().Player

local function Curry(f)

	local MODULE = MODULE
	local function curriedFunction(...)
		return f(MODULE, ...)
	end

	return curriedFunction

end

function MODULE:Get(ply)

	return ply:GetNWString(tag)

end
PLAYER.GetKarma = Curry(MODULE.Get)

if SERVER then

	function MODULE:Set(ply, value)

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
	PLAYER.SetKarma = Curry(MODULE.Set)

	function MODULE:Add(ply, amount)
		
		local Value = ply:GetKarma()
		
		ply:SetKarma(Value + amount)
		
	end
	PLAYER.AddKarma = Curry(MODULE.Add)
	
	function MODULE:Load(ply, amount)
		

		
	end
	PLAYER.AddKarma = Curry(MODULE.Load)
	
	function MODULE:Save(ply, amount)


	
	end
	PLAYER.AddKarma = Curry(MODULE.Save)
	
	hook.Add("PlayerAuthed", tag .. ".Load", Curry(MODULE.Load))
	hook.Add("PlayerDisconnected", tag .. ".Save", Curry(MODULE.Save))
	
end
