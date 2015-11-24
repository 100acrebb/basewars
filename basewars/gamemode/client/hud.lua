BaseWars.HUD = {}

local tag = "BaseWars.HUD"

local zer = math.rad(0)

function BaseWars.HUD.Circle(x, y, bg, radius, seg)

	local cir = {}
	cir[1] = { x = x, y = y, u = 0.5, v = 0.5 }
	
	for i = 0, seg do
	
		local a = math.rad((i / seg) * -360)
		
		cir[#cir+1] = {
			x = x + math.sin(a) * radius,
			y = y + math.cos(a) * radius,
			u = math.sin(a) / 2 + 0.5,
			v = math.cos(a) / 2 + 0.5
		}
		
	end
	
	cir[#cir+1] = {
		x = x + math.sin(zer) * radius,
		y = y + math.cos(zer) * radius,
		u = math.sin(zer) / 2 + 0.5,
		v = math.cos(zer) / 2 + 0.5
	}

	surface.DrawPoly(cir)
	
	return cir
	
end

function BaseWars.HUD.Dial(x, y, bg, radius, seg, val, max, col, name, font, txtcol)

	local y = ScrH() - y
	local name = name or "N/A"
	local val = math.Clamp(val or 100, 0, max or 100)
	
	local ratio = val / (max or 100)
	local bottom = math.Round(seg * 0.125)
	local available = seg - bottom * 2
	local point = bottom + math.Round(ratio * available) + 1

	surface.SetDrawColor(bg)
	
	local cir = BaseWars.HUD.Circle(x, y, bg, radius, seg)
	local LineEnd = cir[point + 1]
	
	BaseWars.HUD.Circle(x, y, bg, radius + 2, seg)
	
	surface.SetDrawColor(col or color_white)
	surface.DrawLine(x, y, LineEnd.x, LineEnd.y)
	
	surface.SetDrawColor(txtcol)
	BaseWars.HUD.Circle(x, y, bg, radius * 0.1, seg)
	
	surface.SetFont(font)
	
	local w, h = surface.GetTextSize(name)
	
	surface.SetTextPos(x - w / 2, y + h - radius * 0.95)
	surface.SetTextColor(txtcol)
	surface.DrawText(name)
	
	local value = val .. "%"
	
	local w2, h2 = surface.GetTextSize(value)
	
	surface.SetTextPos(x - w2 / 2, y + h2 + h - radius * 0.95)
	surface.SetTextColor(txtcol)
	surface.DrawText(value)
	
end

local BackColor = Color(255, 255, 255, 60)
local LineColor = Color(255, 0, 0, 255)
local LineColor2 = Color(255, 0, 0, 160)
local FrontColor = color_black

surface.CreateFont(tag .. "_Large", {
	font = "Tahoma",
	size = 16,
	weight = 1000,
})

surface.CreateFont(tag .. "_Small", {
	font = "Tahoma",
	size = 11,
	weight = 1000,
})

function BaseWars.HUD.Paint()

	local ply = LocalPlayer()
	
	local BaseFont 		= tag .. "_Large"
	local SubFont		= tag .. "_Small"

	local BaseSize 		= 60
	local Offset 		= 20
	local SegResolution = 64
	
	local SubSize 		= BaseSize * 0.7
	local SubOffset		= SubSize * 0.2
	
	--[[local Points = {
		{x = 0, y = ScrH()},
		{x = 0, y = ScrH() - BaseSize * 2 - Offset * 2},
		{x = BaseSize * 5, y = ScrH() - BaseSize * 2 - Offset * 2},
		{x = BaseSize * 7, y = ScrH()},
	}
	
	surface.SetDrawColor(LineColor2)
	surface.DrawPoly(Points)
	
	local outline = 6
	
	Points = {
		{x = 0, y = ScrH()},
		{x = 0, y = ScrH() - BaseSize * 2 - Offset * 2 + outline},
		{x = BaseSize * 5 - outline, y = ScrH() - BaseSize * 2 - Offset * 2 + outline},
	
	
	surface.SetDrawColor(BackColor)
	surface.DrawPoly(Points)	{x = BaseSize * 7 - outline, y = ScrH()},
	}]]
	
	local cx, cy 	= Offset + BaseSize, Offset + BaseSize
	
	local Health 	= ply:Health()
	local Armour 	= ply:Armor()
	local Karma 	= ply:GetKarma()
	
	BaseWars.HUD.Dial(cx, cy, BackColor, BaseSize, 64, Health, 100, LineColor, "HP", BaseFont, FrontColor)
	
	cx = cx + BaseSize + SubSize + SubOffset
	cy = cy - (BaseSize - SubSize)
	
	BaseWars.HUD.Dial(cx, cy, BackColor, SubSize, 64, Armour, 100, LineColor, "AM", SubFont, FrontColor)
	
	cx = cx + BaseSize + SubSize - SubOffset
	
	BaseWars.HUD.Dial(cx, cy, BackColor, SubSize, 64, Karma, 100, LineColor, "KM", SubFont, FrontColor)

end
hook.Add("HUDPaint", tag .. ".Paint", BaseWars.HUD.Paint)

local function HideHUD(name)

    for k, v in next, {"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo"} do
	
        if name == v then
		
			return false
		
		end
		
    end
	
end
hook.Add("HUDShouldDraw", tag .. ".HideOldHUD", HideHUD)
