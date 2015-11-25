BaseWars.Factions = {FactionTable = {}}

local tag = "BaseWars.Factions"
local PLAYER = debug.getregistry().Player

if SERVER then

	util.AddNetworkString(tag)
	
	function BaseWars.Factions.HandleNetMessage(len, ply)
	
		local Mode = net.ReadString()
		
		if Mode == "Set" then
			
			local value = net.ReadString()
			local password = net.ReadString()
			
			BaseWars.Factions.Set(ply, value, password, false)
		
		elseif Mode == "Leave" then
		
			local disband = net.ReadBool()
		
			BaseWars.Factions.Leave(ply, password, disband)
		
		elseif Mode == "Create" then
		
			local value = net.ReadString()
			local password = net.ReadString()
			
			if password:Trim() == "" then password = nil end
			
			BaseWars.Factions.Create(ply, value, password)
			
		end
		
	end
	net.Receive(tag, BaseWars.Factions.HandleNetMessage)
	
	for k, v in next, player.GetAll() do
		
		v:SetNWString(tag, "")
		
	end
	
end

function BaseWars.Factions.Get(ply)

	return ply:GetNWString(tag, "")

end
PLAYER.GetFaction = BaseWars.Factions.Get

function BaseWars.Factions.Set(ply, value, password, force)

	if not value or not isstring(value) then
	
		ErrorNoHalt("Error setting Faction, invalid value.")
		debug.Trace()
	
		return
	
	end

	if CLIENT then
	
		net.Start(tag)
			net.WriteString("Set")
			net.WriteString(value)
			net.WriteString(password or "")
		net.SendToServer()
	
		return
	
	end
	
	local Table = BaseWars.Factions.FactionTable
	local Faction = Table[value]
	
	if not Faction then
		
		
		BaseWars.Util_Player.Notification(ply, BaseWars.LANG.FactionNotExist, BASEWARS_NOTIFICATION_ERROR)
	
		return
		
	end
	
	if ply:InFaction(nil, true) then
	
		BaseWars.Util_Player.Notification(ply, BaseWars.LANG.FactionCantLeaveLeader, BASEWARS_NOTIFICATION_ERROR)
		
		return
		
	end
	
	if Faction.password and Faction.password ~= password and not force then
	
		BaseWars.Util_Player.Notification(ply, BaseWars.LANG.FactionWrongPass, BASEWARS_NOTIFICATION_ERROR)
	
		return
	
	end
	
	
	Faction.members[ply:SteamID()] = ply
	ply:SetNWString(tag, value)

end
PLAYER.SetFaction = BaseWars.Factions.Set
PLAYER.JoinFaction = BaseWars.Factions.Set

function BaseWars.Factions.Leave(ply, disband, forcedisband)

	if CLIENT then
	
		net.Start(tag)
			net.WriteString("Leave")
			net.WriteBool(disband)
		net.SendToServer()
		
		return
		
	end
	
	local Table = BaseWars.Factions.FactionTable
	local Fac = ply:GetFaction()
	local Faction = Table[Fac]
	
	if not Faction then
	
		ply:SetNWString(tag, "")
		
		return
		
	end

	if not forcedisband and disband and (Faction.leader ~= ply:SteamID() and not ply:IsAdmin()) then
	
		BaseWars.Util_Player.Notification(ply, BaseWars.LANG.FactionCantDisband, BASEWARS_NOTIFICATION_ERROR)
		
		return
		
	end
	
	if forcedisband or disband then
	
		BaseWars.UTIL.Log("Faction disband for ", Fac, ". ", #Faction.members, " members.")
	
		for k, v in next, Faction.members do
			
			if v == ply then continue end
			
			BaseWars.Factions.Leave(v, false)
			
		end
		
		Table[Fac] = nil
		
	else
	
		if Faction.leader == ply:SteamID() then
		
			BaseWars.Util_Player.Notification(ply, BaseWars.LANG.FactionCantLeaveLeader, BASEWARS_NOTIFICATION_ERROR)
			
			return
			
		end
		
		ply:SetNWString(tag, "")
		
		Table[Fac].members[ply:SteamID()] = nil
		
	end

end
PLAYER.LeaveFaction = BaseWars.Factions.Leave

function BaseWars.Factions.InFaction(ply, name, leader)
	
	local Table = BaseWars.Factions.FactionTable
	local Fac = ply:GetFaction()
	local Faction = Table[Fac]
	
	local Leader = (not leader or Faction and Faction.leader == ply:SteamID())
	
	if not name then
	
		return Fac ~= "" and Leader
		
	end
	
	return Fac == name and Leader
	
end
PLAYER.InFaction = BaseWars.Factions.InFaction

function BaseWars.Factions.Clean(ply)

	local Table = BaseWars.Factions.FactionTable
	local Fac = ply:GetFaction()
	local Faction = Table[Fac]
	
	BaseWars.Factions.Leave(ply, Faction.leader == ply:SteamID())
	
end
hook.Add("PlayerDisconnect", tag .. ".Clean", BaseWars.Factions.Clean)

function BaseWars.Factions.Create(ply, name, password, color)

	if not name or not isstring(name) or (password and not isstring(password)) then
	
		ErrorNoHalt("Error creating Faction, invalid name or password.")
		debug.Trace()
	
		return
	
	end
	
	if CLIENT then
	
		net.Start(tag)
			net.WriteString("Create")
			net.WriteString(name)
			net.WriteString(password or "")
		net.SendToServer()
		
		return
		
	end
	
	local Table = BaseWars.Factions.FactionTable
	
	if Table[name] then
	
		BaseWars.Util_Player.Notification(ply, BaseWars.LANG.FactionNameTaken, BASEWARS_NOTIFICATION_ERROR)
	
		return
		
	end
	
	BaseWars.UTIL.Log("Faction created for ", name, ". Leader: ", ply:Nick(), ". Password: ", password, ".")
	
	Table[name] = {
		leader = ply:SteamID(),
		password = password,
		members = {},
		color = color or color_white,
	}
		
	ply:SetFaction(name, nil, true)

end
