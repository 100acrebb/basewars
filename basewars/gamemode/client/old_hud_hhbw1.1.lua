local rgb = Color

local bgrey = rgb(44, 62, 80, 90)

local red2 = rgb(192, 57, 43, 170)
local blue2 = rgb(41, 128, 185, 170)
local green2 = rgb(39, 174, 96, 170)
local purp2 = rgb(142, 68, 173, 170)

local nblack = rgb(0, 0, 0, 210)

local twhite = Color(255, 255, 255, 100)

local function DrawBar2(x, y, width, depth, variable, varmax, secondary, primary, text, font, col, font2)
	surface.SetDrawColor(nblack)
	surface.DrawRect(x, y - depth, width, depth)
	
	surface.SetDrawColor(secondary)
	surface.DrawRect(x + 2, y - depth + 2, width - 4, depth - 4)
	
	local var = math.Clamp(variable, 0, varmax)
	local height = (var / varmax) * (depth - 4)
	
	surface.SetDrawColor(primary)
	surface.DrawRect(x + 2, y - height - 2, width - 4, height)
	
	surface.SetTextColor(col)
	
	local w, h, w2, h2
	local num = tostring(var)
	
	surface.SetFont(font2)
	w, h = surface.GetTextSize(num)
	
	surface.SetFont(font)
	w2, h2 = surface.GetTextSize(text)
	
	surface.SetTextPos(x + (width / 2) - (w2 / 2) + 1, y - h - 2 - 20)
	surface.DrawText(text)
	
	surface.SetFont(font2)
	surface.SetTextPos(x + (width / 2) - (w / 2), y - 20)
	surface.DrawText(num)
end

if system.IsWindows() then
	surface.CreateFont("QUI", {font = "Segoe UI", size = 20, weight = 1300})
	surface.CreateFont("QUIl", {font = "Segoe UI", size = 32, weight = 600})
	surface.CreateFont("QUIs", {font = "Segoe UI", size = 18, weight = 1280})
	surface.CreateFont("QUI2", {font = "Segoe UI", size = 16, weight = 1100})
	surface.CreateFont("QUI3", {font = "Tahoma", size = 32, weight = 700})
else
	surface.CreateFont("QUI", {font = "Tahoma", size = 20, weight = 1300})
	surface.CreateFont("QUIl", {font = "Tahoma", size = 32, weight = 600})
	surface.CreateFont("QUIs", {font = "Tahoma", size = 18, weight = 1280})
	surface.CreateFont("QUI2", {font = "Tahoma", size = 16, weight = 1100})
	surface.CreateFont("QUI3", {font = "Tahoma", size = 32, weight = 700})
end

local MaxAmmo = {}
MaxAmmo["weapon_crowbar"]		= 0
MaxAmmo["weapon_physcannon"]	= 0
MaxAmmo["weapon_physgun"]		= 0
MaxAmmo["weapon_pistol"]		= 18
MaxAmmo["weapon_357"]			= 6
MaxAmmo["weapon_smg1"]			= 45
MaxAmmo["weapon_ar2"]			= 30
MaxAmmo["weapon_crossbow"]		= 1
MaxAmmo["weapon_frag"]			= -1
MaxAmmo["weapon_rpg"]			= -1

local gEXP = 0
local level = 0
local scrh = ScrH()
local scrw = ScrW()

local shield = false
local helmet = false
local scan = false
local tool = false

local money = MyMoney or 0

timer.Create("recachehud", 2.5, 0, function()
	if not LocalPlayer():IsValid() then return end
	gEXP = LocalPlayer():GetNWInt("EXP")
	level = MyLevel()
	
	scrh = ScrH()
	scrw = ScrW()
	
	shield = LocalPlayer():GetNWBool("shielded")
	helmet = LocalPlayer():GetNWBool("helmeted")
	scan = LocalPlayer():GetNWBool("scannered")
	tool = LocalPlayer():GetNWBool("tooled")
	
	money = BaseWars.MoneyFormat(MyMoney)
end)
	
hook.Add("HUDPaintBackground", "BW_NewHUD", function()
	local EXP = gEXP - (100 * (level-1))
	
	DrawBar2(2			, scrh - 2, 30, 150, LocalPlayer():Health(), 	100, bgrey, red2, 	"HP" , "QUI" , 	twhite, "QUI2")
	DrawBar2(34			, scrh - 2, 30, 150, LocalPlayer():Armor(), 	100, bgrey, blue2, 	"AP" , "QUI" , 	twhite, "QUI2")
	DrawBar2(scrw - 32, scrh - 2, 30, 150, EXP, 					100, bgrey, green2, "EXP", "QUIs", 	twhite, "QUI2")
	
	surface.SetDrawColor(nblack)
	surface.DrawRect(66, scrh - 2 - 150, 300, 150)
	
	surface.SetDrawColor(bgrey)
	surface.DrawRect(66 + 2, scrh - 2 - 150 + 2, 300 - 4, 150 - 4)
	
	local verStr = BaseWars.Ver.."."..BaseWars.SubVer
	
	surface.SetFont("QUI")
	surface.SetTextPos(66 + 4, scrh - 2 - 150 + 2)
	surface.DrawText("HEXAHEDRONIC BASEWARS V"..verStr)
	
	surface.SetTextPos(66 + 4, scrh - 2 - 150 + 2 + 2 + 16)
	surface.DrawText("Balance:")
	
	surface.SetFont("QUI3")
	surface.SetTextPos(66 + 4, scrh - 2 - 150 + 2 + 2 + 16 + 16)
	surface.DrawText("£" .. money)
	
	if BaseWars.RAIDTIME then
		draw.DrawText( BaseWars.RAIDTIME, "QUI2", 66 + 4 + 300 - 42, scrh - 2 - 150 + 3, Color(255,255,255,255),0) --50
	end
	
	if (shield) then
		draw.DrawText( "p ", "DrugFont", 66 + 4 + 300 - 42, scrh - 2 - 150 + 2 + 2 + 4 + 6 + 6, Color(255,255,255,255),0) --50
	end
	if (helmet) then
		draw.DrawText( "E ", "DrugFont", 66 + 4 + 300 - 42, scrh - 2 - 150 + 2 + 2 + 4 + 28 + 6 + 6, Color(255,255,255,255),0) --50
	end
	if (scan) then
		draw.DrawText( "H ", "DrugFont", 66 + 4 + 300 - 42 + 4, scrh - 2 - 150 + 2 + 2 + 4 + 28 + 28 + 6 + 6, Color(255,255,255,255),0)  --30
	end
	if (tool) then
		draw.DrawText( "f ", "CSDFont", 66 + 4 + 300 - 42 + 8, scrh - 2 - 150 + 2 + 2 + 4 + 28 + 28 + 28 + 6 + 6, Color(255,255,255,255),0) ---35
	end
	
	local effectslots = {}
	effectslots[0] = 0
	effectslots[1] = 0
	effectslots[2] = 0
	
	local curX = 66 + 4
	local curY = scrh - 2 - 150 + 2 + 2 + 2
	
	for k,v in next, BaseWars.Drugs do
		if LocalPlayer():GetNWBool(BaseWars.Drugs[k].string) then
			local offset = 0
			local soffset = 0
			local soffset2 = 0
			if k == "leech" then soffset = -2 soffset2 = 5 end
			if k == "focus" then soffset = -5 end
			if BaseWars.Drugs[k].font == "DrugFont2" then offset = -25 end
			
			draw.DrawText(BaseWars.Drugs[k].symbol, BaseWars.Drugs[k].font, curX + 4+(effectslots[BaseWars.Drugs[k].type]*20)-3+soffset, curY + 68+(BaseWars.Drugs[k].type*20)+offset+soffset2, BaseWars.Drugs[k].color,0)
			effectslots[BaseWars.Drugs[k].type] = effectslots[BaseWars.Drugs[k].type]+1
		end
	end
	
	surface.SetTextColor(twhite)
	surface.SetFont("QUI2")
	surface.SetTextPos(70, scrh - 18)
	surface.DrawText(tostring(os.date()))
	
	surface.SetTextColor(twhite)
	surface.SetFont("QUIl")
	surface.SetTextPos(scrw - 25, scrh - 130)
	surface.DrawText("ofuck")--MyLevel())
	
	if LocalPlayer():GetActiveWeapon() ~= NULL and LocalPlayer():GetActiveWeapon().Clip1 then -- Ammo
		local mag_left = LocalPlayer():GetActiveWeapon():Clip1()
		
		local clipsize = 0
		if (LocalPlayer():GetActiveWeapon():GetNWInt("clipsize") > 0) then
			clipsize = LocalPlayer():GetActiveWeapon():GetNWInt("clipsize", 0)
		elseif (LocalPlayer():GetActiveWeapon().Primary and LocalPlayer():GetActiveWeapon().Primary.ClipSize) then
			clipsize = LocalPlayer():GetActiveWeapon().Primary.ClipSize
		else
			clipsize = (MaxAmmo[LocalPlayer():GetActiveWeapon():GetClass()] or -1)
		end
		
		if clipsize < 1 then
			return
		end
		
		DrawBar2(scrw - 64, scrh - 2, 30, 150, mag_left, clipsize, bgrey, purp2, "AM", "QUIs", twhite, "QUI2")
	end
end)

local function hidehud(name)
    for k, v in pairs{"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo"} do
        if name == v then return false end
    end
end
hook.Add("HUDShouldDraw", "BaseWars_HideOldHUD", hidehud)
