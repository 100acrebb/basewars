bwa = {}

bwa.Reasons = {
	"Cheating",
	"Mingebag",
	"Too young",
	"Multi-Basing",
	"Prop-Blocking People",
	"Exploiting",
	"Multi-Faction Base",
}

function bwa.Kick(ply, caller, res)

	ply:Kick("bwa: Kicked by " .. caller:Nick() .. " for '" .. res .. "'.")

end

function bwa.Ban(ply, caller, res, length)

	--local NiceTime = "NYI"
	--ply:Kick("bwa: Banned by " .. caller:Nick() .. " for '" .. res .. "' until " .. NiceTime .. ".")

end

function bwa.UnBan(steamid, caller)

	-- NYI

end

properties.Add("bwa_copymodel", {

	MenuLabel = "Copy Model",
	MenuIcon = "icon16/page_copy.png",
	Order =	-100,
	
	Filter = function(self, ent, ply)
	
		if not IsValid(ent) then return false end
		
		return true 
		
	end,
	
	Action = function(self, ent)
		
		local Model = ent:GetModel()
		SetClipboardText(Model)
		
	end,
		
})

properties.Add("bwa_kick", {

	MenuLabel = "Kick",
	MenuIcon = "icon16/error_delete.png",
	Order =	math.huge,
	
	Filter = function(self, ent, ply)
	
		if not IsValid(ent) or not ply:IsAdmin() or not ent:IsPlayer() then return false end
		
		return true 
		
	end,
	
	Action = function(self, ent)
	
		self:MsgStart()
			net.WriteEntity(ent)
			net.WriteString("No Reason")
		self:MsgEnd()
		
	end,
	
	KickOption = function(self, ent, res)
	
		self:MsgStart()
			net.WriteEntity(ent)
			net.WriteString(res)
		self:MsgEnd()
		
	end,
	
	Receive = function(self, length, ply)
	
		local ent = net.ReadEntity()
		local res = net.ReadString()

		if not IsValid(ply) or not IsValid(ent) or not self:Filter(ent, ply) then return false end
		
		bwa.Kick(ent, ply, res)
		
	end,
	
	MenuOpen = function(self, option, ent, tr)

		if IsValid(ent.AttachedEntity) then ent = ent.AttachedEntity end

		local options = bwa.Reasons
		local submenu = option:AddSubMenu()

		for k, v in next, options do

			submenu:AddOption(v, function() self:KickOption(ent, v) end)

		end
		
		submenu:AddOption("Custom...", function()
			
			Derma_StringRequest("Custom Kick Reason", "Kick " .. ent:Nick() .. " for...", "", function(t) self:KickOption(ent, t) end)
			
		end)

	end,
		
})
