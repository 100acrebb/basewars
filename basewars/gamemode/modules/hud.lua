MODULE.Name 	= "HUD"
MODULE.Author 	= "Q2F2 & Ghosty"
MODULE.Realm 	= 2
MODULE.Credits 	= "Based on geist by ghosty; https://github.com/TrenchFroast/ghostys-server-stuff/blob/master/lua/autorun/client/geist_hud.lua"

local tag = "BaseWars.HUD"

local function Curry(f)

	local MODULE = MODULE
	local function curriedFunction(...)
		return f(MODULE, ...)
	end

	return curriedFunction

end

function MODULE:__INIT()

	surface.CreateFont(tag, {
		font = "Roboto",
		size = 16,
		weight = 800,
	})

end

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
local trans = Color(255, 255, 255, 150)

function MODULE:Paint()

	local me = LocalPlayer()
	if not me:IsPlayer() or not IsValid(me) then return end

	local hp, su = me:Health(), me:Armor()

	if not me:Alive() then hp = 0 su = 0 end

	local hpF = Lerp(0.15, oldHP, hp)
	oldHP = hpF

	local suF = Lerp(0.15, oldAM, su)
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
	draw.DrawText("HP", tag, 64 + 16, sH - 128 - 32 - 10, trans, TEXT_ALIGN_RIGHT)

	if hW > 0.01 then
	
		draw.RoundedBox(0, 64 + 24, sH - 128 - 32 - 4, hW, pbarH, Color(1,159,1,150))
		draw.RoundedBox(0, 64 + 24 - nhW + pbarW, sH - 128 - 32 - 4, nhW, pbarH, Color(159,1,1,150))
		
	else
	
		draw.RoundedBox(0, 64 + 24, sH - 128 - 32 - 4, pbarW, pbarH, Color(159,1,1,150))
		
	end
	
	draw.DrawText(round(hpF), tag, pbarW + 98, sH - 128 - 32 - 8, shade, TEXT_ALIGN_LEFT)	
	draw.DrawText(round(hpF), tag, pbarW + 96, sH - 128 - 32 - 10, trans, TEXT_ALIGN_LEFT)	

	-- Armor
	draw.DrawText("SUIT", tag, 64 + 18, sH - 128 - 16 - 8, shade, TEXT_ALIGN_RIGHT)
	draw.DrawText("SUIT", tag, 64 + 16, sH - 128 - 16 - 10, trans, TEXT_ALIGN_RIGHT)
	
	if aW > 0.01 then
	
		draw.RoundedBox(0, 64 + 24, sH - 128 - 16 - 4, aW, pbarH, Color(90,120,200,150))
		draw.RoundedBox(0, 64 + 24 - naW + pbarW, sH - 128 - 16 - 4, naW, pbarH, Color(10,40,150,150))
		
	else
	
		draw.RoundedBox(0, 64 + 24, sH - 128 - 16 - 4, pbarW, pbarH, Color(10,40,150,150))
		
	end

	draw.DrawText(round(suF), tag, pbarW + 98, sH - 128 - 16 - 8, shade, TEXT_ALIGN_LEFT)
	draw.DrawText(round(suF), tag, pbarW + 96, sH - 128 - 16 - 10, trans, TEXT_ALIGN_LEFT)

end
hook.Add("HUDPaint", tag .. ".Paint", Curry(MODULE.Paint))

function HideHUD(name)

    for k, v in next, {"CHudHealth", "CHudBattery", --[["CHudAmmo", "CHudSecondaryAmmo"]]} do
	
        if name == v then
		
			return false
		
		end
		
    end
	
end
hook.Add("HUDShouldDraw", tag .. ".HideOldHUD", HideHUD)
