MODULE.Name 	= "Util_Player"
MODULE.Author 	= "Q2F2 & Ghosty"

local tag = "BaseWars.Util_Player"

local function Curry(f)

	local MODULE = MODULE
	local function curriedFunction(...)
		return f(MODULE, ...)
	end

	return curriedFunction

end

if SERVER then

	util.AddNetworkString(tag)
	
end
	
function MODULE:HandleNetMessage(len, ply)

	local Mode = net.ReadUInt(1)
	
	if CLIENT then
	
		local ply = LocalPlayer()
	
		if Mode == 0 then
		
			local text = net.ReadString()
			local col = net.ReadColor()
		
			self:Notification(ply, text, col)
		
		end
	
	end
	
end
net.Receive(tag, Curry(MODULE.HandleNetMessage))

function MODULE:Notification(ply, text, col)

	if SERVER then
		
		net.Start(tag)
			net.WriteUInt(0, 1)
			net.WriteString(text)
			net.WriteColor(col)
		if ply then net.Send(ply) else net.Broadcast() end
		
		BaseWars.UTIL.Log(ply, " -> ", text)
		
		return
		
	end
	
	-- Temporary for tests
	chat.AddText(col, text)
	
end
Notify = Curry(MODULE.Notification)

function MODULE:NotificationAll(text, col)

	self:Notification(nil, text, col)

end
NotifyAll = Curry(MODULE.NotificationAll)

function MODULE:Spawn(ply) 

	local col = ply:GetInfo("cl_playercolor")
	ply:SetPlayerColor(Vector(col))

	local col = Vector(ply:GetInfo("cl_weaponcolor"))
	
	if col:Length() == 0 then
	
		col = Vector(0.001, 0.001, 0.001)
		
	end
	
	ply:SetWeaponColor(col)

end
hook.Add("PlayerSpawn", tag .. ".Spawn", MODULE:Spawn)

function MODULE:EnableFlashlight(ply)

	ply:AllowFlashlight(true)
	
end

hook.Add("PlayerSpawn", tag .. ".EnableFlashlight", Curry(MODULE.EnableFlashlight))

function MODULE:PlayerSetHandsModel(ply, ent)

	local PlayerModel 	= player_manager.TranslateToPlayerModelName(ply:GetModel())
	local HandsInfo 	= player_manager.TranslatePlayerHands(PlayerModel)
	
	if HandsInfo then
	
		ent:SetModel(HandsInfo.model)
		ent:SetSkin(HandsInfo.skin)
		ent:SetBodyGroups(HandsInfo.body)
		
	end

end
hook.Add("PlayerSetHandsModel", tag .. ".PlayerSetHandsModel", Curry(MODULE.PlayerSetHandsModel))