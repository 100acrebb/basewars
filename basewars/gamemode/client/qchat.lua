if qchat and IsValid(qchat.pPanel) then
	qchat:Close()
end

qchat = {}

qchat.TimeStamps = false

qchat.red 	= Color(255,  10, 100, 255)
qchat.green = Color(100, 255, 100, 255)
qchat.back 	= Color(10 ,  0 , 10 , 100)
qchat.baka  = Color(90 , 10 , 90 , 255)
qchat.back2	= Color(90 , 10 , 90 , 255)
qchat.twhit = Color(255, 255, 255, 100)
qchat.tbaka = Color(0  , 0  , 0  , 100)

function qchat:CreateChatTab()
	-- The tab for the actual chat.
	self.chatTab 		= vgui.Create("DPanel", self.pPanel)
	self.chatTab.Paint 	= function(self, w, h)
		surface.SetDrawColor(qchat.back)
		surface.DrawRect(0, 0, w, h)
	end 

	-- The text entry for the chat.
	self.chatTab.pTBase = vgui.Create("DPanel", self.chatTab)
	self.chatTab.pTBase.Paint 	= function(self, w, h)
	end

	self.chatTab.pTBase:Dock(BOTTOM)

	self.chatTab.pText 	= vgui.Create("DTextEntry", self.chatTab.pTBase)
	self.chatTab.pText:SetHistoryEnabled(true)
	
	self.chatTab.pGr 	= vgui.Create("DPanel", self.chatTab.pTBase)
	self.chatTab.pGr.Paint 	= function(self, w, h)
		surface.SetDrawColor(qchat.back2)
		surface.DrawRect(0, 0, w, h)
	end

	self.chatTab.pText.OnKeyCodeTyped = function(pan, key)
	
		local txt = pan:GetText():Trim()
		hook.Run("ChatTextChanged", txt)
		
		if (key == KEY_ENTER) then
			if (txt != "") then
				pan:AddHistory(txt)
				pan:SetText("")
				
				pan.HistoryPos = 0

				if chitchat and chitchat.Say then
					chitchat.Say(txt, (self.isTeamChat and 2 or 1))
				else
					LocalPlayer():ConCommand((self.isTeamChat and "say_team \"" or "say \"") .. txt .. "\"")
				end
			end

			self:Close()
		end

		if (key == KEY_TAB) then
			local tab = hook.Run("OnChatTab", txt)
			
			if (tab and isstring(tab)) then
				pan:SetText(tab)
			end
			
			timer.Simple(0, function() pan:RequestFocus() pan:SetCaretPos((tab or txt):len()) end)
		end
		
		if (key == KEY_UP) then
			pan.HistoryPos = pan.HistoryPos - 1
			pan:UpdateFromHistory()
		end
		
		if (key == KEY_DOWN) then	
			pan.HistoryPos = pan.HistoryPos + 1
			pan:UpdateFromHistory()
		end
		
	end

	self.chatTab.pText.Paint = function(pan, w, h)
		surface.SetDrawColor(qchat.twhit)
		surface.DrawRect(0, 0, w, h)

		pan:DrawTextEntryText(pan.m_colText, pan.m_colHighlight, pan.m_colCursor)
	end

	self.chatTab.pText.OnChange = function(pan)
		gamemode.Call("ChatTextChanged", pan:GetText() or "")
	end

	self.chatTab.pGr:Dock(LEFT)
	self.chatTab.pText:Dock(FILL)
	
	self.chatTab.pGr.OnMousePressed = function(pan)
		local mousex = math.Clamp(gui.MouseX(), 1, ScrW() - 1)
		local mousey = math.Clamp(gui.MouseY(), 1, ScrH() - 1)

		self.pPanel.Dragging = {mousex - self.pPanel.x, mousey - self.pPanel.y}
		self.pPanel:MouseCapture(true)
	end

	self.chatTab.pGrLab = vgui.Create("DLabel", self.chatTab.pGr)
	self.chatTab.pGrLab:SetPos(8, 2)

	self.chatTab.pGrLab:SetTextColor(color_black)

	-- The element to actually display the chat its-self.
	self.chatTab.pFeed 	= vgui.Create("RichText", self.chatTab)
	self.chatTab.pFeed:Dock(FILL)

	self.chatTab.pFeed.Font = "ChatFont"

	self.chatTab.pFeed.PerformLayout = function(pan)
		pan:SetFontInternal(pan.Font)
	end
end

function qchat:SaveCookies()
	local x, y, w, h = self.pPanel:GetBounds()

	self.pPanel:SetCookie("x", x)
	self.pPanel:SetCookie("y", y)
	self.pPanel:SetCookie("w", w)
	self.pPanel:SetCookie("h", h)
end

function qchat:BuildPanels()
	-- The actual frame of the chatbox.
	self.pPanel 		= vgui.Create("DFrame")
	self.pPanel:SetTitle("")
	self.pPanel.Paint 	= function(self, w, h)
	end

	self.pPanel:SetSizable(true)
	self.pPanel:ShowCloseButton(false)
	
	self.pPanel.Think 	= function(self)
		local mousex = math.Clamp(gui.MouseX(), 1, ScrW() - 1)
		local mousey = math.Clamp(gui.MouseY(), 1, ScrH() - 1)

		if (self.Dragging) then
			local x = mousex - self.Dragging[1]
			local y = mousey - self.Dragging[2]

			if (self:GetScreenLock()) then
				x = math.Clamp(x, 0, ScrW() - self:GetWide())
				y = math.Clamp(y, 0, ScrH() - self:GetTall())
			end

			self:SetPos(x, y)
		end

		if (self.Sizing) then
			local x = mousex - self.Sizing[1]
			local y = mousey - self.Sizing[2]
			local px, py = self:GetPos()

			if (x < self.m_iMinWidth) then x = self.m_iMinWidth elseif (x > ScrW() - px and self:GetScreenLock()) then x = ScrW() - px end
			if (y < self.m_iMinHeight) then y = self.m_iMinHeight elseif (y > ScrH() - py and self:GetScreenLock()) then y = ScrH() - py end

			self:SetSize(x, y)
			self:SetCursor("sizenwse")
			return
		end

		if (self.Hovered and mousex > (self.x + self:GetWide() - 20) and mousey > (self.y + self:GetTall() - 20)) then
			self:SetCursor("sizenwse")
			return
		end

		self:SetCursor( "arrow" )

		if (self.y < 0) then
			self:SetPos(self.x, 0)
		end
	end

	self.pPanel.OnMousePressed = function(self)
		local mousex = math.Clamp(gui.MouseX(), 1, ScrW() - 1)
		local mousey = math.Clamp(gui.MouseY(), 1, ScrH() - 1)

		if (mousex > (self.x + self:GetWide() - 20) and mousey > (self.y + self:GetTall() - 20)) then

			self.Sizing = {mousex - self:GetWide(), mousey - self:GetTall()}
			self:MouseCapture(true)
			return
		end
	end

	self:CreateChatTab()
	self.chatTab:Dock(FILL)

	self.pPanel:SetCookieName("qchat")

	local x = self.pPanel:GetCookie("x", 20)
	local y = self.pPanel:GetCookie("y", 220)
	local w = self.pPanel:GetCookie("w", 800)
	local h = self.pPanel:GetCookie("h", 500)

	self.pPanel:SetPos 	(x, y)
	self.pPanel:SetSize (w, h)
end

function qchat:SetUpChat()
	if (not self.pPanel or not ValidPanel(self.pPanel)) then
		self:BuildPanels()
	else
		self.pPanel:SetVisible(true)
		self.pPanel:MakePopup()
	end

	self.chatTab.pGrLab:SetTextColor(color_white)
	self.chatTab.pGrLab:SetText(qchat.isTeamChat and "(TEAM)" or "(GLOBAL)")
	self.chatTab.pText:SetText("")
	
	self.chatTab.pText:RequestFocus()

	gamemode.Call("StartChat")
end

function qchat:BuildIfNotExist()
	if (not self.pPanel or not ValidPanel(self.pPanel)) then
		self:BuildPanels()
		self.pPanel:SetVisible(false)
	end
end

function qchat:ParseChatLine(tbl)
	self:BuildIfNotExist()

	if (qchat.TimeStamps) then
		self.chatTab.pFeed:InsertColorChange(20, 20, 90, 255)

		self.chatTab.pFeed:AppendText("[" .. os.date("%X") .. "] ")
	end

	if (isstring(tbl)) then
		self.chatTab.pFeed:InsertColorChange(120, 240, 140, 255)

		self.chatTab.pFeed:AppendText(tbl)
		self.chatTab.pFeed:AppendText("\n")
		
		return
	end

	for i = 1, #tbl do
		local v = tbl[i]

		if (IsColor(v) or istable(v)) then
			self.chatTab.pFeed:InsertColorChange(v.r, v.g, v.b, 255)

		elseif (isstring(v) and v != "") then
			self.chatTab.pFeed:AppendText(v)

		elseif (isentity(v) and v:IsPlayer()) then
			local col = GAMEMODE:GetTeamColor(v)
			self.chatTab.pFeed:InsertColorChange(col.r, col.g, col.b, 255)

			self.chatTab.pFeed:AppendText(v:Nick())

		else
			self.chatTab.pFeed:AppendText("[" .. type(v) .. ": " .. tostring(v) .. "]")
		end
	end

	self.chatTab.pFeed:AppendText("\n")
end

function qchat.ChatBind(ply, bind)
	local isTeamChat = false

	if 		(bind == "messagemode2") then
		isTeamChat = true
	elseif 	(bind != "messagemode" ) then
		return
	end

	-- Open chatbox here.
	-- isTeamChat is argument?

	qchat.isTeamChat = isTeamChat
	qchat:SetUpChat()

	return true
end
hook.Add("PlayerBindPress", "qchat.ChatBind", qchat.ChatBind)

function qchat.PreRenderEscape()
	if (gui.IsGameUIVisible() and qchat.pPanel and ValidPanel(qchat.pPanel) and qchat.pPanel:IsVisible()) then
		if (input.IsKeyDown(KEY_ESCAPE)) then
			gui.HideGameUI()

			qchat:Close()
		elseif (gui.IsConsoleVisible()) then
			qchat:Close()
		end
	end
end
hook.Add("PreRender", "qchat.PreRenderEscape", qchat.PreRenderEscape)

function qchat:Close()
	self.pPanel:SetVisible(false)

	gamemode.Call("FinishChat")
	self:SaveCookies()
end

--[[
function qchat.DisableElements(element)
	if (element == "CHudChat") then
		return false
	end
end
hook.Add( "HUDShouldDraw", "qchat.DisableElements", qchat.DisableElements)
]]

function qchat.RelayNotifications(index, name, text, type)
	if (type == "joinleave" or type == "none") then
		qchat:ParseChatLine(text)
	end
end
hook.Add("ChatText", "qchat.RelayNotifications", qchat.RelayNotifications)

function qchat.RelayChat(ply, text, team, dead, internal)
	--[[if (internal) then
		return
	end

	local results = hook.Call("OnPlayerChat", {}, ply, text, team, dead, true)

	if (not results or results == true or results == "") then
		return
	end

	local tbl = {}

	if (dead) then
		tbl[#tbl+1] = qchat.red
		tbl[#tbl+1] = "(DEAD) "
	end

	if (team) then
		tbl[#tbl+1] = qchat.green
		tbl[#tbl+1] = "(TEAM) "
	end

	tbl[#tbl+1] = ply

	tbl[#tbl+1] = color_white
	tbl[#tbl+1] = ": "
	tbl[#tbl+1] = results or text

	-- Todo explode text, check for pattern that indicates colors.

	print("oh no", results)
	qchat:ParseChatLine(tbl)
	]]

	-- Apprently garry calls fucking chat.addtext INSIDE of the basegame with this
	-- hook, this works for now but NEEDS MORE INVESTIGATING.
end
hook.Add("OnPlayerChat", "qchat.RelayChat", qchat.RelayChat)

_G.oldAddText = _G.oldAddText or _G.chat.AddText
function chat.AddText(...)
	qchat:ParseChatLine({...})

	_G.oldAddText(...)
end

_G.oldGetChatBoxPos = _G.oldGetChatBoxPos or _G.chat.GetChatBoxPos
function chat.GetChatBoxPos()
	qchat:BuildIfNotExist()
	return qchat.pPanel:GetPos()
end

_G.oldGetChatBoxSize = _G.oldGetChatBoxSize or _G.chat.GetChatBoxSize
function chat.GetChatBoxSize()
	qchat:BuildIfNotExist()
	return qchat.pPanel:GetSize()
end

_G.oldChatOpen = _G.oldChatOpen or _G.chat.Open
function chat.Open(mode)
	local isTeam = (mode and mode != 1)

	qchat.isTeamChat = isTeam

	qchat:SetUpChat()
end

_G.oldChatClose = _G.oldChatClose or _G.chat.Close
function chat.Close()
	qchat:Close()
end

if chatsounds then
	local f = function()
		if chatsounds.ac.visible() then
			local x, y, w, h

			if chatgui then
				x, y = chatgui:GetPos()
				w, h = chatgui:GetSize()
				y, h = y + h, surface.ScreenHeight() - y - h
			else
				x, y = chat:GetChatBoxPos()
				w, h = chat:GetChatBoxSize()
				y, h = y + h, surface.ScreenHeight() - y - h
			end

			chatsounds.ac.render(x, y, w, h)
		end
	end
	
	hook.Add("PostRenderVGUI", "chatsounds_autocomplete", f)
end
