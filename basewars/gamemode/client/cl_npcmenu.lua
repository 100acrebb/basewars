-- BaseWars Menu for things and shit
-- by Ghosty

local me = LocalPlayer()

local grayTop 		= Color(128, 128, 128, 250)
local grayBottom 	= Color(96, 96, 96, 250)

local nodePanelBg	= Color(192, 192, 192, 250)
local shadowColor 	= Color(0, 0, 0, 200)

local bigFont = "BW.NPCMenu.BigFont"
local medFont = "BW.NPCMenu.MedFont"
local smallFont = "BW.NPCMenu.SmallFont"

surface.CreateFont(bigFont, {

	font = "Roboto",
	size = 32,

})

surface.CreateFont(medFont, {

	font = "Roboto",
	size = 18,

})

surface.CreateFont(smallFont, {

	font = "Roboto",
	size = 16,

})

local white = Color(255, 255, 255)
local gray = Color(192, 192, 192)
local black = Color(0, 0, 0)

local function PrepMenu()

	local mainFrame = vgui.Create("DFrame")

	mainFrame:SetSize(900, 600)
	mainFrame:Center()
	mainFrame:SetTitle("BaseWars Menu")
	mainFrame:SetIcon("icon16/application.png")
	mainFrame:MakePopup()
	mainFrame:SetDeleteOnClose(false)

	function mainFrame:Paint(w, h)

		draw.RoundedBoxEx(8, 0, 0, w, 24, grayTop, true, true, false, false)
		draw.RoundedBox(0, 0, 24, w, h - 24, grayBottom)

	end

	function mainFrame:Close()

		self:Hide()
		self:OnClose()

	end

end

local function MakeNotExist()

	if pnl and IsValid(pnl) then return end

	pnl = MakeMenu(PrepMenu())
	pnl:Hide()
	
end
