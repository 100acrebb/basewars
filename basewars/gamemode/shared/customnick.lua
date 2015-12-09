if SERVER then
	AddCSLuaFile()
end

local Tag = "NickOverride"

local META = FindMetaTable("Player")

META.OldNick = META.OldNick or META.Nick
META.EngineNick = META.OldNick
META.RealName = META.OldNick

local function GoodNick(nick)

	local nick = utf8.force(tostring(nick or ""):Trim())

	return utf8.sub(nick, 1, 40)
end

function META:Nick()
	return GoodNick(self:GetNWString(Tag,self:OldNick()))
end

META.GetNick = META.Nick
META.Name = META.GetNick
META.GetName = META.GetName

if SERVER then
	util.AddNetworkString(Tag)

	local function MakeChange(ply,oldnick,str)
		net.Start(Tag)
			net.WriteEntity(ply)
			net.WriteString(oldnick)
			net.WriteString(str)
		net.Broadcast()
	end

	function META:ChangeNick(newnick)
		local nick = self:Nick()
		--if GoodNick(nick) == GoodNick(newnick) then return end
		self:SetNick(newnick)
		--if nick == self:Nick() then return end
		MakeChange(self,nick,newnick or self:Nick())
	end

	net.Receive(Tag,function(_,ply)
		local str = net.ReadString()
		str = GoodNick(str)
		if #str < 1 then return end
		local oldnick = ply:Nick()
		ply:ChangeNick(str)
	end)

	function META:SetNick(nick)
		if not nick then
			nick = self:OldNick()
			self:SetNWString(Tag, GoodNick(nick))
			self:RemovePData(Tag)
			return
		end
		self:SetNWString(Tag, GoodNick(nick))
		self:SetPData(Tag,nick)
	end

	hook.Add("PlayerInitialSpawn",Tag,function(ply)
		local e = ply:GetPData(Tag)
		if e then
			local nick = ply:Nick()
			ply:ChangeNick(e)
		end
	end)

else

	net.Receive(Tag,function()

		local ply = net.ReadEntity()
		local oldnick = net.ReadString()
		local newnick = net.ReadString()

		if oldnick == newnick then return end

		timer.Simple(0,function()

			if not IsValid(ply) then return end

			local tbl = {}
			tbl[1] = team.GetColor(ply:Team())
			tbl[2] = oldnick
			tbl[3] = Color(255,255,255)
			tbl[4] = " is now called "
			tbl[5] = team.GetColor(ply:Team())
			tbl[6] = newnick
			tbl[7] = Color(255,255,255)
			tbl[8] = "."

			chat.AddText(unpack(tbl))

		end)

	end)

	function META:SetNick(nick)
		if not self == LocalPlayer() then
			self:SetNWString(Tag,GoodNick(nick))
		else
			net.Start(Tag)
				net.WriteString(GoodNick(nick))
			net.SendToServer()
		end
	end

end