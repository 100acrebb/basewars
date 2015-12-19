GM.Name 		= "BaseWars"
GM.Author 		= "Q2F2, Ghosty, Liquid, Tenrys"
GM.Website 		= "http://hexahedronic.org/"
GM.Credits		= [[
Thanks to the following people:
	Q2F2			- Main backend dev.
	Ghosty			- Main frontent dev.
	Liquid			- Misc dev, good friend.
	Tenrys			- Misc dev, good friend also.
	Pyro-Fire		- Owner of LagNation, ideas ect.
	Devenger		- Twitch Weaponry 2
	
This GM has been built from scratch with almost no
traces of the original BaseWars existing outside of maybe
a few miscellaneous entities, albiet, in heavily modified
form. Due to this, anybody trying to dispute
our ownership of the gamemode (as I remember happening on
the previous version I made) will be told where to
stick it.
]]
GM.License = [[
Copyright (c) 2015 Hexahedronic, Ghosty, Tenrys

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]

BaseWars = BaseWars or {}

function BaseWars.IsXmasTime(day)

	local Month = tonumber(os.date("%m"))
	local Day	= tonumber(os.date("%d"))

	return Month == 12 and (not day or (Day == 24 or Day == 25))
	
end

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

local function Pay(ply, amt, name, own)

	ply:Notify(string.format(own and BaseWars.LANG.PayOutOwner or BaseWars.LANG.PayOut, BaseWars.NumberFormat(amt), name), BASEWARS_NOTIFICATION_GENRL)
	
	ply:GiveMoney(amt)

end

function BaseWars.UTIL.PayOut(ent, attacker, full)

	if not BaseWars.Ents:Valid(ent) or not BaseWars.Ents:ValidPlayer(attacker) then return end

	local Owner = BaseWars.Ents:ValidOwner(ent)
	local Val = ent.CurrentValue * (not full and BaseWars.Config.DestroyReturn or 1)
	
	local Name = ent.PrintName or ent:GetClass()
	
	if attacker == Owner then 
	
		Pay(Owner, Val, Name, true)
		
	return end
	
	local Members = attacker:FactionMembers()
	local TeamAmt = (attacker:InFaction() and #Members) or 1
	local Involved = Owner and TeamAmt + 1 or TeamAmt
	
	local Fraction = math.floor(Val / Involved)
	
	if #Members > 0 then
		
		for k, v in next, Members do
		
			Pay(v, Fraction, Name)
			
		end
	
	else
	
		Pay(attacker, Fraction, Name)
	
	end
	
	if Owner then
	
		Pay(Owner, Fraction, Name, true)
		
	end

end

function BaseWars.UTIL.RefundAll()

	BaseWars.UTIL.Log("FULL SERVER REFUND IN PROGRESS!!!")

	for k, v in next, ents.GetAll() do
	
		if not BaseWars.Ents:Valid(v) then continue end

		local Owner = BaseWars.Ents:ValidOwner(v)
		if not BaseWars.Ents:Valid(Owner) then continue end
		
		if not v.CurrentValue then continue end
		
		BaseWars.UTIL.PayOut(v, Owner, true)
		
		v:Remove()
		
	end
	
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
	
	return Admin and not ply:InRaid()
	
end

local function BlockInteraction(ply, ent, ret)

	if ent then
	
		if not BaseWars.Ents:Valid(ent) then return end

		local Classes = BaseWars.Config.PhysgunBlockClasses
		if Classes[ent:GetClass()] then return false end
		
		local Owner = ent.CPPIGetOwner and ent:CPPIGetOwner()
		
		if BaseWars.Ents:ValidPlayer(ply) and ply:InRaid() then return false end
		if BaseWars.Ents:ValidPlayer(Owner) and Owner:InRaid() then return false end
	
	else
	
		if ply:InRaid() then return false end
		
	end
	
	return ret == nil or ret
	
end

local function IsAdmin(ply, ent, ret)

	if BlockInteraction(ply, ent, ret) == false then return false end

	return ply:IsAdmin()
	
end

function GM:PhysgunPickup(ply, ent)

	local Ret = self.BaseClass:PhysgunPickup(ply, ent)

	return BlockInteraction(ply, ent, Ret)

end

function GM:CanPlayerUnfreeze(ply, ent, phys)

	local Ret = self.BaseClass:CanPlayerUnfreeze(ply, ent, phys)
	
	return BlockInteraction(ply, ent, Ret)

end

function GM:CanTool(ply, tr, tool)

	local Ret = self.BaseClass:CanTool(ply, tr, tool)
	
	if BaseWars.Config.BlockedTools[tool] then return IsAdmin(ply, ent, Ret) end
	
	if SERVER then
		
		local Pos = tr.HitPos
		local HitString = math.floor(Pos.x) .. "," .. math.floor(Pos.y) .. "," .. math.floor(Pos.z)
		BaseWars.UTIL.Log("TOOL EVENT: ", ply, " -> ", tool, " on pos [", HitString, "]")
		
	end
	
	return BlockInteraction(ply, ent, Ret)
	
end

function GM:CanDrive()

	-- I'm fucking sick of this shit
	return false
	
end

function GM:CanProperty(ply, prop, ent, ...)

	local Ret = self.BaseClass:CanProperty(ply, prop, ent, ...)
	local Class = ent:GetClass()
	
	if prop == "persist" 	then return false end
	if prop == "ignite" 	then return false end
	if prop == "extinguish" then return IsAdmin(ply, ent, Ret) end
	
	if prop == "remover" and Class:find("bw_") then return IsAdmin(ply, ent, Ret) end
	
	return BlockInteraction(ply, ent, Ret)
	
end
