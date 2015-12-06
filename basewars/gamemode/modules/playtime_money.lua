MODULE.Name 	= "PlayTime_Money"
MODULE.Author 	= "Q2F2 & Ghosty"

local tag = "BaseWars.PlayTime_Money"

local function Curry(f)

	local MODULE = MODULE
	local function curriedFunction(...)
		return f(MODULE, ...)
	end

	return curriedFunction

end

if SERVER then

	resource.AddFile("materials/icon32/clock_wh32.png")
	resource.AddFile("materials/icon32/money_wh32.png")

	return
	
end
	
local TimeMat 	= Material("icon32/clock_wh32.png", "nocull noclamp smooth")
local MoneyMat 	= Material("icon32/money_wh32.png", "nocull noclamp smooth")

local abs 		= math.abs
local floor 	= math.floor
local clamp 	= math.Clamp

function MODULE:__INIT()

	surface.CreateFont(tag, {
		font = "Roboto",
		weight = 800,
		size = 24,
	})

end

local function playTime(n)

	local dat = os.date("!*t",n)
	local str = ""
	
	if dat.hour > 0 then
	
		str = str .. dat.hour .. "h "
		
	end
	if dat.min > 0 then
	
		str = str .. dat.min .. "m "
		
	end
	if dat.sec > 0 then
	
		str = str .. dat.sec  .. "s "
		
	end
	
	return #str > 0 and str or "0s"	
	
end

local me = LocalPlayer()
local white = Color(255, 255, 255, 150)
local shade = Color(0, 0, 0, 140)

local loss = false
local old = 0
local last = CurTime()
local triggered

local efx = {}
local remove = table.remove

local function addEffect(f)

	efx[#efx + 1] = f
	
end

local function popEffect(i)

	remove(efx,i)
	
end

local function drawEffects()

	for i = 1, #efx do
	
		local f = efx[i]
		
		if f then
		
			f(i)
			
		end
		
	end
	
end

local green = Color(42, 255, 0)
local red = Color(255, 0, 0)

function MODULE:Paint()

	local sW, sH = ScrW(), ScrH()
	local cT = CurTime()

	if not IsValid(me) then me = LocalPlayer() return end

	local plTime = me.GetPlayTime and me:GetPlayTime() or 0
	local money = me.GetMoney and me:GetMoney() or 0
	
	local diff = 0

	if money ~= old then
	
		loss = money < old
		triggered = true
		last = cT + 1
		diff = money - old
		
	end

	old = money

	money = BaseWars.NumberFormat(money)

	surface.SetDrawColor(0, 0, 0, 150)
	surface.SetMaterial(TimeMat)
	surface.DrawTexturedRect(66, sH - 126, 32, 32)

	surface.SetDrawColor(255, 255, 255, 150)
	surface.SetMaterial(TimeMat)
	surface.DrawTexturedRect(64, sH - 128, 32, 32)

	draw.DrawText(playTime(plTime), tag, 64 + 44, sH - 128 + 6, shade, TEXT_ALIGN_LEFT)
	draw.DrawText(playTime(plTime), tag, 64 + 42, sH - 128 + 4, white, TEXT_ALIGN_LEFT)

	surface.SetDrawColor(0, 0, 0, 150)
	surface.SetMaterial(MoneyMat)
	surface.DrawTexturedRect(66, sH - 126 + 40, 32, 32)

	surface.SetDrawColor(255, 255, 255, 150)
	surface.SetMaterial(MoneyMat)
	surface.DrawTexturedRect(64, sH - 128 + 40, 32, 32)

	local moneyColor
	if loss then
	
		moneyColor = HSVToColor(0, 1 - clamp(cT - last, 0, 1), 1)
		
	else
	
		moneyColor = HSVToColor(110, 1 - clamp(cT - last, 0, 1), 1)
		
	end
	
	moneyColor = ColorAlpha(moneyColor,150)

	draw.DrawText(BaseWars.LANG.CURRENCY .. "\xe2\x80\x8a" .. money, tag, 64 + 44, sH - 128 + 40 + 6, shade, TEXT_ALIGN_LEFT)
	draw.DrawText(BaseWars.LANG.CURRENCY .. "\xe2\x80\x8a" .. money, tag, 64 + 42, sH - 128 + 40 + 4, moneyColor, TEXT_ALIGN_LEFT)
	
	if triggered then

		triggered = false
		local fLast = last
		local posX,posY = 64 + 42, sH - 128 + 51 + 4
		local change = 4
		local fDiff = diff

		local function effectDraw(i)

			local color = not loss and green or red
			local cT = CurTime()
			local alpha = clamp(fLast - cT,0,1) * 150
			
			if abs(alpha) <= 0.01 then
			
				popEffect(i)
				
				return
				
			end 
			
			color = ColorAlpha(color, alpha)
			change = change / 1.08
			
			draw.DrawText(
				(fDiff > 0 and "+ " .. BaseWars.LANG.CURRENCY or " " .. BaseWars.LANG.CURRENCY) .. BaseWars.NumberFormat(fDiff), tag,
				posX, posY, color, TEXT_ALIGN_LEFT
			)
			posY = posY + change
			
		end

		addEffect(effectDraw)

	end

	drawEffects()

end
hook.Add("HUDPaint", tag .. ".Paint", Curry(MODULE.Paint))
