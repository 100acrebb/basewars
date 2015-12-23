MODULE.Name 	= "Factions"
MODULE.Author 	= "Q2F2 & Ghosty"
MODULE.FactionTable = {}

local tag = "BaseWars.Factions"
local PLAYER = debug.getregistry().Player

if SERVER then

	util.AddNetworkString(tag)
	
	-- Modes:
	-- Set -> 0
	-- Leave -> 1
	-- Create -> 2

	function MODULE:HandleNetMessage(len, ply)
	
		local Mode = net.ReadUInt(2)
		
		if Mode == 0 then
			
			local value = net.ReadString()
			local password = net.ReadString()
			
			self:Set(ply, value, password, false)
		
		elseif Mode == 1 then
		
			local disband = net.ReadBool()
		
			self:Leave(ply, disband)
		
		elseif Mode == 2 then
		
			local value = net.ReadString()
			local password = net.ReadString()
			
			if password:Trim() == "" then password = nil end
			
			self:Create(ply, value, password)
			
		end
		
	end

	net.Receive(tag, Curry(MODULE.HandleNetMessage))
	
	for k, v in next, player.GetAll() do
		
		v:SetNWString(tag, "")
		
	end
	
end

function MODULE:Get(ply)

	return ply:GetNWString(tag, "")

end

PLAYER.GetFaction = Curry(MODULE.Get)

function MODULE:Set(ply, value, password, force)

	if not value or not isstring(value) then
	
		ErrorNoHalt("Error setting Faction, invalid value.")
		debug.Trace()
	
		return
	
	end

	if CLIENT then
	
		net.Start(tag)
			net.WriteUInt(0, 2)
			net.WriteString(value)
			net.WriteString(password or "")
		net.SendToServer()
	
		return
	
	end
	
	local Table = BaseWars.Factions.FactionTable
	local Faction = Table[value]
	
	if not Faction then
		
		ply:Notify(BaseWars.LANG.FactionNotExist, BASEWARS_NOTIFICATION_ERROR)
	
		return
		
	end
	
	local Call, Error = hook.Run("CanJoinFaction", ply, value, password)
	
	if Call == false then
	
		ply:Notify(Error, BASEWARS_NOTIFICATION_ERROR)
		
		return
		
	end
	
	local Lead = ply:InFaction(nil, true)
	
	if ply:InFaction() then
	
		ply:LeaveFaction(Lead)
		
	end
	
	if Faction.password and Faction.password ~= password and not force then
	
		ply:Notify(BaseWars.LANG.FactionWrongPass, BASEWARS_NOTIFICATION_ERROR)
	
		return
	
	end
	
	Faction.members[ply:SteamID()] = ply
	ply:SetNWString(tag, value)

end
local setFaction = Curry(MODULE.Set)
PLAYER.SetFaction = setFaction
PLAYER.JoinFaction = setFaction

function MODULE:Leave(ply, disband, forcedisband)

	if CLIENT then
	
		net.Start(tag)
			net.WriteUInt(1, 2)
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
	
	local Call, Error = hook.Run("CanLeaveFaction", ply, disband)
	
	if Call == false then
	
		ply:Notify(Error, BASEWARS_NOTIFICATION_ERROR)
		
		return
		
	end

	if not forcedisband and disband and (Faction.leader ~= ply:SteamID() and not ply:IsAdmin()) then
	
		disband = false
		
	end
	
	if forcedisband or disband then
	
		BaseWars.UTIL.Log("Faction disband for ", Fac, ". ", table.Count(Faction.members), " members.")
	
		for k, v in next, Faction.members do
			
			if v == ply then continue end
			
			self:Leave(v, false)
			
		end
		
		ply:SetNWString(tag, "")
		
		Table[Fac] = nil
		
	else
	
		if Faction.leader == ply:SteamID() then
		
			ply:Notify(BaseWars.LANG.FactionCantLeaveLeader, BASEWARS_NOTIFICATION_ERROR)
			
			return
			
		end
		
		ply:SetNWString(tag, "")
		
		Table[Fac].members[ply:SteamID()] = nil
		
		if table.Count(Table[Fac].members) < 1 then
		
			BaseWars.UTIL.Log("Faction disband for ", Fac, ". All members left. <Leader must have D/C'ed>")
		
			Table[Fac] = nil
			
		end
		
	end

end
PLAYER.LeaveFaction = Curry(MODULE.Leave)

function MODULE:Members(ply)

	if CLIENT then return end

	local Table = BaseWars.Factions.FactionTable
	local Fac = ply:GetFaction()
	local Faction = Table[Fac]
	
	if not Faction then return {[ply:SteamID()] = ply} end
	
	return Faction.members
	
end
PLAYER.FactionMembers = Curry(MODULE.Members)

function MODULE:ChangePass(ply, newpass)

	-- not done dont use

	local Table = BaseWars.Factions.FactionTable
	
	if not Table[name] then
	
		ply:Notify(BaseWars.LANG.FactionNotExist, BASEWARS_NOTIFICATION_ERROR)
	
		return
		
	end

	if Faction.leader ~= ply:SteamID() then
	
		ply:Notify(BaseWars.LANG.FactionCantPassword, BASEWARS_NOTIFICATION_ERROR)
		
		return
		
	end
	
end

function MODULE:InFaction(ply, name, leader)
	
	if not BaseWars.Factions then return false end
	
	local Table = BaseWars.Factions.FactionTable
	local Fac = ply:GetFaction()
	local Faction = Table[Fac]
	
	local Leader = (not leader or Faction and Faction.leader == ply:SteamID())
	
	if not name then
	
		return Fac ~= "" and Leader
		
	end
	
	return Fac == name and Leader
	
end
PLAYER.InFaction = Curry(MODULE.InFaction)

function MODULE:FactionExist(name)

	if CLIENT then
		
		ErrorNoHalt("Error checking Faction, cannot check clienside.")
		debug.Trace()
		
		return
		
	end

	local Table = BaseWars.Factions.FactionTable
	
	if Table[name] then
		
		return true
		
	end
	
	return false
	
end

function MODULE:IsEnemy(ply, ply2)

	if ply == ply2 then return false end
	if ply:InFaction() and ply2:InFaction(ply:GetFaction()) then return false end
	
	return true

end
PLAYER.IsEnemy = Curry(MODULE.IsEnemy)

function MODULE:Clean(ply)

	local Table = BaseWars.Factions.FactionTable
	local Fac = ply:GetFaction()
	local Faction = Table[Fac]
	
	self:Leave(ply, Faction.leader == ply:SteamID())
	
end
hook.Add("PlayerDisconnect", tag .. ".Clean", Curry(MODULE.Clean))

function MODULE:Create(ply, name, password, color)

	if not name or not isstring(name) or (password and not isstring(password)) then
	
		ErrorNoHalt("Error creating Faction, invalid name or password.")
		debug.Trace()
	
		return
	
	end
	
	if CLIENT then
	
		net.Start(tag)
			net.WriteUInt(2, 2)
			net.WriteString(name)
			net.WriteString(password or "")
		net.SendToServer()
		
		return
		
	end
	
	local Table = BaseWars.Factions.FactionTable
	
	if Table[name] then
	
		ply:Notify(BaseWars.LANG.FactionNameTaken, BASEWARS_NOTIFICATION_ERROR)
	
		return
		
	end
	
	local Call, Error = hook.Run("CanCreateFaction", ply, name, password)
	
	if Call == false then
	
		ply:Notify(Error, BASEWARS_NOTIFICATION_ERROR)
		
		return
		
	end
	
	BaseWars.UTIL.Log("Faction created for ", name, ". Leader: ", ply:Nick(), ". Password: ", (password ~= "" and password or "<NONE>"), ".")
	
	Table[name] = {
		leader = ply:SteamID(),
		password = password,
		members = {},
		color = color or color_white,
	}
		
	ply:SetFaction(name, nil, true)

end
PLAYER.CreateFaction = Curry(MODULE.Create)
