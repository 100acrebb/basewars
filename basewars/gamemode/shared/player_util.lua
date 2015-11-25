BaseWars.Util_Player = {}

local tag = "BaseWars.Util_Player"

if SERVER then

	util.AddNetworkString(tag)
	
end
	
function BaseWars.Util_Player.HandleNetMessage(len, ply)

	local Mode = net.ReadString()
	
	if CLIENT then
	
		local ply = LocalPlayer()
	
		if Mode == "Notify" then
		
			local text = net.ReadString()
			local col = net.ReadColor()
		
			BaseWars.Util_Player.Notification(ply, text, col)
		
		end
	
	end
	
end
net.Receive(tag, BaseWars.Util_Player.HandleNetMessage)

function BaseWars.Util_Player.Notification(ply, text, col)

	if SERVER then
		
		net.Start(tag)
			net.WriteString("Notify")
			net.WriteString(text)
			net.WriteColor(col)
		if ply then net.Send(ply) else net.Broadcast() end
		
		return
		
	end
	
	-- Temporary for tests
	chat.AddText(col, text)
	
end
Notify = BaseWars.Util_Player.Notification

function BaseWars.Util_Player.NotificationAll(text, col)

	BaseWars.Util_Player.Notification(nil, text, col)

end
NotifyAll = BaseWars.Util_Player.NotificationAll

function BaseWars.Util_Player.Spawn(ply) 

	local col = ply:GetInfo("cl_playercolor")
	ply:SetPlayerColor(Vector(col))

	local col = Vector(ply:GetInfo("cl_weaponcolor"))
	
	if col:Length() == 0 then
	
		col = Vector(0.001, 0.001, 0.001)
		
	end
	
	ply:SetWeaponColor(col)

end
hook.Add("PlayerSpawn", tag .. ".Spawn", BaseWars.Util_Player.Spawn)

function BaseWars.Util_Player.EnableFlashlight(ply)

	ply:AllowFlashlight(true)
	
end

hook.Add("PlayerSpawn", tag .. ".EnableFlashlight", BaseWars.Util_Player.EnableFlashlight)

function BaseWars.Util_Player.PlayerSetHandsModel(ply, ent)

	local PlayerModel 	= player_manager.TranslateToPlayerModelName(ply:GetModel())
	local HandsInfo 	= player_manager.TranslatePlayerHands(PlayerModel)
	
	if HandsInfo then
	
		ent:SetModel(HandsInfo.model)
		ent:SetSkin(HandsInfo.skin)
		ent:SetBodyGroups(HandsInfo.body)
		
	end

end
hook.Add("PlayerSetHandsModel", tag .. ".PlayerSetHandsModel", BaseWars.Util_Player.PlayerSetHandsModel)