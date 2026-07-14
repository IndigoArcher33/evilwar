DEFINE_BASECLASS("EditablePanel")
local pmeta = FindMetaTable("Panel")
pmeta.SetCloseOnPause = function(self)
	self.m_bCloseOnPause = true
	return hook.Add("OnPauseMenuShow", self, function()
		if vgui.FocusedHasParent(self) then
			self:Close()
			return false
		end
	end)
end
local create_chat
create_chat = function()
	local panel = GUI.Get("Chat")
	if IsValid(panel) then
		local buffer = panel:ExportBuffer()
		GUI.Open("Chat"):ImportBuffer(buffer)
	else
		GUI.Open("Chat")
	end
	return
end
hook.Add("Initialize", "evilrp_create_chat", create_chat)
hook.Add("OnReloaded", "evilrp_create_chat", create_chat)
local open_chat
open_chat = function(ply, bind, down)
	if down then
		if "messagemode" == bind then
			GUI.Get("Chat"):Show()
			return true
		end
	end
	return
end
hook.Add("PlayerBindPress", "evilrp_chatbox", open_chat)
local PANEL = {
	Init = function(self)
		self:SetSkin("EvilRP")
		self:SetCloseOnPause()
		self:ResizeWithScale(1.0)
		self:SetWide(ScrW() * .5)
		self:MakePopup()
		self.Scroll = self:Add("EvilRP_ChatScroll")
		do
			local _with_0 = self:Add("Panel")
			self.TopBar = _with_0
			_with_0:SetTall(20)
		end
		self.Tabs = cookie.GetNumber("evilrp_chat_tabs", 0)
		self.Buttons = { }
		local tabs = {
			{
				"LOOC",
				TAB_LOOC
			},
			{
				"OOC",
				TAB_OOC
			},
			{
				"IC",
				TAB_IC
			},
			{
				"Sotla",
				TAB_ADMIN
			},
			{
				"PM",
				TAB_PM
			},
			{
				"Radio",
				TAB_RADIO
			}
		}
		for _index_0 = 1, #tabs do
			local v = tabs[_index_0]
			local button = self.TopBar:Add("DButton")
			button:SetFont("Spleen_Label_Small")
			button:SetText(v[1])
			button:Dock(LEFT)
			button:DockMargin(0, 0, 5, 0)
			button.SkinVar = "Active"
			button.SkinInverted = true
			button.Active = self:CanSeeTab(v[2])
			button.Tab = v[2]
			button.DoClick = function(pnl)
				pnl.Active = not pnl.Active
				pnl:SetTextColor(nil)
				return self:SaveTabConfig()
			end
			do
				local _obj_0 = self.Buttons
				_obj_0[#_obj_0 + 1] = button
			end
		end
		self.Input = self:Add("EvilRP_ChatInput")
		do
			local _with_0 = self.Input
			_with_0:SetTall(20)
			_with_0:SetX(10)
		end
		self.CloseButton = self.TopBar:Add("DButton")
		do
			local _with_0 = self.CloseButton
			_with_0:SetFont("marlett")
			_with_0:SetText("r")
			_with_0:Dock(RIGHT)
			_with_0:SetWide(20)
			_with_0.DoClick = function(pnl)
				return self:Close()
			end
		end
		return hook.Add("OnChatScaleSettingChanged", self, function(_, _, old, new)
			return self:ResizeWithScale(new)
		end)
	end,
	ResizeWithScale = function(self, multiplier)
		if multiplier == nil then
			multiplier = 1.0
		end
		local s_w = 200
		local s_h = 133
		BaseClass.SetSize(self, ScreenScale(s_h) * multiplier, ScreenScaleH(s_h) * multiplier)
		return self:SetPos(20, ScrH() - self:GetTall() - 200)
	end,
	Close = function(self)
		return self:OnClose()
	end,
	OnClose = function(self)
		return GUI.Get("Chat"):Hide()
	end,
	SaveTabConfig = function(self)
		local val = 0
		local _list_0 = self.Buttons
		for _index_0 = 1, #_list_0 do
			local button = _list_0[_index_0]
			if not button.Active then
				val = val + button.Tab
			end
		end
		self.Tabs = val
		return cookie.Set("evilrp_chat_tabs", val)
	end,
	CanSeeTab = function(self, tab)
		if not tab then
			return true
		end
		return not tobool(bit.band(self.Tabs, tab))
	end,
	AddMessage = function(self, message, console_message, tabs)
		self.Scroll:AddMessage(message, console_message, tabs)
		if tabs then
			local _list_0 = self.Buttons
			for _index_0 = 1, #_list_0 do
				local button = _list_0[_index_0]
				if tobool(bit.band(button.Tab, tabs)) and not button.Active then
					button:SetTextColor(self:GetSkin().Text.Primary)
				end
			end
		end
		if not system.HasFocus() and self:CanSeeTab(tabs) then
			return system.FlashWindow()
		end
	end,
	Show = function(self)
		self.IsOpen = true
		self:SetKeyboardInputEnabled(true)
		self:SetMouseInputEnabled(true)
		self.Scroll:Show()
		do
			local _with_0 = self.Input
			_with_0:Show()
			_with_0:RequestFocus()
			_with_0.HistoryIndex = 0
		end
		local _list_0 = self.Buttons
		for _index_0 = 1, #_list_0 do
			local button = _list_0[_index_0]
			button:Show()
		end
		return self.CloseButton:Show()
	end,
	Hide = function(self)
		self.IsOpen = false
		self:SetKeyboardInputEnabled(false)
		self:SetMouseInputEnabled(false)
		do
			local _with_0 = self.Input
			_with_0:SetText("")
			_with_0:SetTall(20)
		end
		self:InvalidateLayout(true)
		self.Scroll:Hide()
		self.Input:Hide()
		local _list_0 = self.Buttons
		for _index_0 = 1, #_list_0 do
			local button = _list_0[_index_0]
			button:Hide()
		end
		return self.CloseButton:Hide()
	end,
	ExportBuffer = function(self)
		return {
			self.Scroll.Buffer,
			self.Scroll.BufferSize,
			self.IsOpen,
			self.Scroll.VBar:GetScroll(),
			self.Input:GetText(),
			self.Input.History,
			self.Input.HistoryIndex
		}
	end,
	ImportBuffer = function(self, buffer)
		do
			local _with_0 = self.Scroll
			_with_0.Buffer = buffer[1]
			_with_0.BufferSize = buffer[2]
			_with_0:InvalidateLayout()
		end
		if buffer[3] then
			self:Show()
			self.Scroll.VBar:SetScroll(buffer[4])
		end
		self.Input:SetText(buffer[5] or "")
		self.Input.History = buffer[6]
		self.Input.HistoryIndex = buffer[7]
	end,
	PerformLayout = function(self, w, h)
		do
			local _with_0 = self.TopBar
			_with_0:AlignLeft(10)
			_with_0:AlignTop(10)
			_with_0:StretchToParent(nil, nil, 10)
		end
		do
			local _with_0 = self.Input
			_with_0:AlignLeft(10)
			_with_0:AlignBottom(10)
			_with_0:StretchToParent(nil, nil, 10)
		end
		local pre_scroll = self.Scroll:GetTall()
		do
			local _with_0 = self.Scroll
			_with_0:AlignLeft(10)
			_with_0:MoveBelow(self.TopBar, 5)
			_with_0:StretchToParent(nil, nil, 10)
			_with_0:StretchBottomTo(self.Input, 5)
		end
		local scroll_bar = self.Scroll.VBar
		local diff = self.Scroll:GetTall() - pre_scroll
		if diff ~= 0 then
			self.Scroll:InvalidateLayout(true)
			return scroll_bar:SetScroll(scroll_bar:GetScroll() - diff)
		end
	end,
	Paint = function(self, w, h)
		if self.IsOpen then
			return derma.SkinHook("Paint", "Chat", self, w, h)
		end
	end
}
derma.DefineControl("EvilRP_Chat", "", PANEL, "EditablePanel")
return GUI.Register("Chat", (function()
	local panel = vgui.Create("EvilRP_Chat")
	panel:Hide()
	return panel
end), true)
