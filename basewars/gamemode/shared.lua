GM.Name 		= "BaseWars"
GM.Author 		= "Q2F2, Ghosty, Liquid, Tenrys"
GM.Website 		= "http://hexahedronic.org/"
GM.Credits		= [[
Thanks to the following people:
	Q2F2			- Main backend dev.
	Ghosty			- Main frontent dev.
	Liquid			- Misc dev, good friend.
	Tenrys			- Misc dev, good friend also.
	Pyro-Fire		- Owner of Lagnation, ideas ect.
	HLTV Proxy		- Original dev of BaseWars.
	
This GM has been built from scratch with almost no
traces of the original BaseWars existing outside of
a few miscellaneous entities, albiet, in heavily modified
form. Due to this, anybody trying to dispute
our ownership of the gamemode (as I remember happening on
the previous version I made) will be told where to
stick it.
]]

BaseWars = {}

function BaseWars.GenSpawnList(model, price, ent, sf, lim)

	return {

		Model = model,
		Price = price or 0,
		ClassName = ent,
		UseSpawnFunc = sf,
		Limit = lim or (ent and BaseWars.Config.DefaultLimit) or nil,
		ShouldFreeze = true,

	}
	
end

function BaseWars.GenWeapon(model, price, class)

	return {
	
		Gun = true,
		Model = model,
		Price = price or 0,
		ClassName = class,

	}
	
end

function BaseWars.GenDrug(price, effect)

	return {
	
		Drug = true,
		Model = "models/props_junk/PopCan01a.mdl",
		Price = price or 0,
		ClassName = effect,

	}
	
end

BASEWARS_NOTIFICATION_ADMIN = color_white
BASEWARS_NOTIFICATION_ERROR = Color(255, 0, 0, 255)
BASEWARS_NOTIFICATION_MONEY = Color(0, 255, 0, 255)
BASEWARS_NOTIFICATION_RAID 	= Color(255, 255, 0, 255)
BASEWARS_NOTIFICATION_GENRL = Color(255, 0, 255, 255)
BASEWARS_NOTIFICATION_DRUG	= Color(0, 255, 255, 255)

function BaseWars.PrinterCheck(ply)

	local Ents = ents.GetAll()

	for k, v in next, Ents do
	
		if not BaseWars.Ents:Valid(v) or not v.CPPIGetOwner then continue end
		
		local Owner = v:CPPIGetOwner()
		if not BaseWars.Ents:ValidPlayer(Owner) or Owner ~= ply then continue end
		
		local Raidable = v.IsValidRaidable
		
		if Raidable then return true end
		
	end

return false, BaseWars.LANG.NoPrinters end
hook.Add("PlayerIsRaidable", "BaseWars.Raidability.PrinterCheck", BaseWars.PrinterCheck)

local tag = "BaseWars.UTIL"

BaseWars.UTIL = {}

local colorRed 		= Color(255, 0, 0)
local colorBlue 	= Color(0, 0, 255)
local colorWhite 	= Color(255, 255, 255)

function BaseWars.UTIL.Log(...)
	
	MsgC(SERVER and colorRed or colorBlue, "[BaseWars] ", colorWhite, ...)
	MsgN("")
	
end

function BaseWars.UTIL.TimerAdv(name, spacing, reps, tickf, endf)

	timer.Create(name, spacing * reps, 1, endf)
	timer.Create(name .. ".Tick", spacing, reps, tickf)
	
end

function BaseWars.UTIL.TimerAdvDestroy(name)

	timer.Destroy(name)
	timer.Destroy(name .. ".Tick")
	
end

function BaseWars.UTIL.PayOutInfo(ent, attacker)

	return {}

end

local NumTable = {
	[5] = {10^6 , "Million"},
	[4] = {10^9 , "Billion"},
	[3] = {10^12, "Trillion"},
	[2] = {10^15, "Quadrillion"},
	[1] = {10^18, "Pentillion"},
}

function BaseWars.NumberFormat(num)
	
	for i = 1, #NumTable do
	
		local Div = NumTable[i][1]
		local Str = NumTable[i][2]
		
		if num >= Div or num <= -Div then
			
			return string.Comma(math.Round(num / Div, 1)) .. " " .. Str
			
		end
		
	end
	
	return string.Comma(math.Round(num, 1))
	
end

local PlayersCol = Color(125, 125, 125, 255)
team.SetUp(1, "Players", PlayersCol)

function GM:PlayerNoClip(ply)

	local Admin = ply:IsAdmin()
	
	if SERVER then
	
		-- Second argument doesn't work??
		local State = ply:GetMoveType() == MOVETYPE_NOCLIP
	
		if aowl and not Admin and State and not ply.__is_being_physgunned then
		
			return true
			
		end
	
	end
	
	return Admin
	
end

local function BlockInteraction(ply, ent, ret)

	if not BaseWars.Ents:Valid(ent) then return end

	local Classes = BaseWars.Config.PhysgunBlockClasses
	if Classes[ent:GetClass()] then return false end
	
	local Owner = ent.CPPIGetOwner and ent:CPPIGetOwner()
	
	if BaseWars.Ents:ValidPlayer(ply) and ply:InRaid() then return false end
	if BaseWars.Ents:ValidPlayer(Owner) and Owner:InRaid() then return false end
	
	return ret == nil or ret
	
end

function GM:PhysgunPickup(ply, ent)

	local Ret = self.BaseClass:PhysgunPickup(ply, ent)

	return BlockInteraction(ply, ent, Ret)

end

function GM:CanPlayerUnfreeze(ply, ent, phys)

	local Ret = self.BaseClass:CanPlayerUnfreeze(ply, ent, phys)
	
	return BlockInteraction(ply, ent, Ret)

end
