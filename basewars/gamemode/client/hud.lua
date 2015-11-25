BaseWars.HUD = {}

local tag = "BaseWars.HUD"

BaseWars.HUD.Credits = "Based on geist by ghosty; https://github.com/TrenchFroast/ghostys-server-stuff/blob/master/lua/autorun/client/geist_hud.lua"

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

surface.CreateFont(tag, {
	font = "Roboto",
	size = 16,
	weight = 800,
})

local clamp = math.Clamp
local floor = math.floor
local round = math.Round

local function Calc(real, max, min, w)

	real = clamp(real,min or 0,max)
	real = real / max
	
	if w then
	
		local calw = w * real
		
		return calw, w - calw
		
	else
	
		return real
		
	end
	
end

local oldhW = 0
local oldHP = 0

local oldaW = 0
local oldAM = 0

local shade = Color(0, 0, 0, 140)

function BaseWars.HUD.Paint()

	local me = LocalPlayer()
	if not me:IsPlayer() or not IsValid(me) then return end

	local hp, su = me:Health(), me:Armor()

	if not me:Alive() then su = 0 end

	local hpF = Lerp(0.15,oldHP,hp)
	oldHP = hpF

	local suF = Lerp(0.15,oldAM,su)
	oldAM = suF

	local pbarW, pbarH = 256, 6

	local sW, sH = ScrW(), ScrH()

	local hW = Calc(hp, 100, 0, pbarW)
	local aW = Calc(su, 100, 0, pbarW)

	local nhW,naW = 0,0

	hW = Lerp(0.15,oldhW,hW)
	oldhW = hW
	nhW = pbarW - hW

	aW = Lerp(0.15,oldaW,aW)
	oldaW = aW
	naW = pbarW - aW

	-- Health

	draw.DrawText("HP", tag, 64 + 18, sH - 128 - 32 - 8, shade, TEXT_ALIGN_RIGHT)
	draw.DrawText("HP", tag, 64 + 16, sH - 128 - 32 - 10, Color(255,255,255,150), TEXT_ALIGN_RIGHT)

	if hW > 0.01 then
	
		draw.RoundedBox(0, 64 + 24, sH - 128 - 32 - 4, hW, pbarH, Color(1,159,1,150))
		draw.RoundedBox(0, 64 + 24 - nhW + pbarW, sH - 128 - 32 - 4, nhW, pbarH, Color(159,1,1,150))
		
	else
	
		draw.RoundedBox(0, 64 + 24, sH - 128 - 32 - 4, pbarW, pbarH, Color(159,1,1,150))
		
	end
	
	draw.DrawText(round(hpF), tag, pbarW + 98, sH - 128 - 32 - 8, shade, TEXT_ALIGN_LEFT)	
	draw.DrawText(round(hpF), tag, pbarW + 96, sH - 128 - 32 - 10, Color(255,255,255,150), TEXT_ALIGN_LEFT)	

	-- Armor
	draw.DrawText("SUIT", tag, 64 + 18, sH - 128 - 16 - 8, shade, TEXT_ALIGN_RIGHT)
	draw.DrawText("SUIT", tag, 64 + 16, sH - 128 - 16 - 10, Color(255,255,255,150), TEXT_ALIGN_RIGHT)
	
	if aW > 0.01 then
	
		draw.RoundedBox(0, 64 + 24, sH - 128 - 16 - 4, aW, pbarH, Color(90,120,200,150))
		draw.RoundedBox(0, 64 + 24 - naW + pbarW, sH - 128 - 16 - 4, naW, pbarH, Color(10,40,150,150))
		
	else
	
		draw.RoundedBox(0, 64 + 24, sH - 128 - 16 - 4, pbarW, pbarH, Color(10,40,150,150))
		
	end

	draw.DrawText(round(suF), tag, pbarW + 98, sH - 128 - 16 - 8, shade, TEXT_ALIGN_LEFT)
	draw.DrawText(round(suF), tag, pbarW + 96, sH - 128 - 16 - 10, Color(255,255,255,150), TEXT_ALIGN_LEFT)

end
hook.Add("HUDPaint", tag .. ".Paint", BaseWars.HUD.Paint)

local function HideHUD(name)

    for k, v in next, {"CHudHealth", "CHudBattery", --[["CHudAmmo", "CHudSecondaryAmmo"]]} do
	
        if name == v then
		
			return false
		
		end
		
    end
	
end
hook.Add("HUDShouldDraw", tag .. ".HideOldHUD", HideHUD)
