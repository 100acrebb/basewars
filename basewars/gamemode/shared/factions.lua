BaseWars.Factions = {}

local tag = "BaseWars.Factions"
local PLAYER = debug.getregistry().Player

BaseWars.Factions.FactionTable = {}

function BaseWars.Factions.Get(ply)

	return ply:GetNWString(tag, "")

end
PLAYER.GetFaction = BaseWars.Factions.Get

function BaseWars.Factions.Set(ply, value)

	if CLIENT then
	
		ErrorNoHalt("Cannot set Faction clientside.")
	
		return
	
	end

	if not value then
	
		ErrorNoHalt("Error setting Faction, invalid value.")
		debug.Trace()
	
		return
	
	end

end
PLAYER.SetFaction = BaseWars.Factions.Set

function BaseWars.Factions.Leave(ply, disband)

	if CLIENT then
	
		-- net message
		
		return
		
	end
	
	local faction = BaseWars.Factions.FactionTable[ply:GetFaction()]
	
	if not faction then
	
		BaseWars.Util_Player.Notification(ply, BaseWars.LANG.FactionNotExist, BASEWARS_NOTIFICATION_ERROR)
		
		return
		
	end

	if disband and faction.leader ~= ply:SteamID() then
	
		BaseWars.Util_Player.Notification(ply, BaseWars.LANG.FactionCantDisband, BASEWARS_NOTIFICATION_ERROR)
		
		return
		
	end

end

function BaseWars.Factions.Create(ply, name, password)

	if not name or not istring(name) or (password and not isstring(password)) then
	
		ErrorNoHalt("Error creating Faction, invalid name or password.")
		debug.Trace()
	
		return
	
	end
	
	if CLIENT then
	
		-- send net message
		
		return
		
	end
	
	local Table = BaseWars.Factions.FactionTable
	
	if Table[name] then
	
		BaseWars.Util_Player.Notification(ply, BaseWars.LANG.FactionNameTaken, BASEWARS_NOTIFICATION_ERROR)
	
		return
		
	end
	
	Table[name] = {leader = ply:SteamID(), password = password, members = {}}
	ply:SetFaction(name)

end
