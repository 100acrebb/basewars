GM.Name 	= "BaseWars"
GM.Author 	= "Q2F2, Liquid, Ghosty"
GM.Website 	= "http://hexahedronic.org/"
GM.Description = "Fuck luke"

BaseWars = {}

BASEWARS_NOTIFICATION_ERROR = Color(255, 0, 0, 255)
BASEWARS_NOTIFICATION_MONEY = Color(0, 255, 0, 255)
BASEWARS_NOTIFICATION_ADMIN = color_white
BASEWARS_NOTIFICATION_RAID 	= Color(255, 255, 0, 255)
BASEWARS_NOTIFICATION_GENRL = Color(255, 0, 255, 255)

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

	local State = ply:GetMoveType() == MOVETYPE_NOCLIP
	local Admin = ply:IsAdmin()
	
	if SERVER then
	
		if aowl and not Admin and State and not ply.__is_being_physgunned then
		
			return true
			
		end
	
	end
	
	return Admin
	
end
