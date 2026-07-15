-- [yue]: darkrp_modules\gui\cl_chatbox.yue
DEFINE_BASECLASS("EditablePanel") -- 1
local pmeta = FindMetaTable("Panel") -- 5
pmeta.SetCloseOnPause = function(self) -- 6
	self.m_bCloseOnPause = true -- 7
	return hook.Add("OnPauseMenuShow", self, function() -- 8
		if vgui.FocusedHasParent(self) then -- 9
			self:Close() -- 10
			return false -- 11
		end -- 9
	end) -- 12
end -- 6
local create_chat -- 13
create_chat = function() -- 13
	local panel = GUI.Get("Chat") -- 14
	if IsValid(panel) then -- 15
		local buffer = panel:ExportBuffer() -- 16
		GUI.Open("Chat"):ImportBuffer(buffer) -- 17
	else -- 19
		GUI.Open("Chat") -- 19
	end -- 15
	return -- 20
end -- 13
hook.Add("Initialize", "evilrp_create_chat", create_chat) -- 22
hook.Add("OnReloaded", "evilrp_create_chat", create_chat) -- 23
local open_chat -- 25
open_chat = function(ply, bind, down) -- 25
	if down then -- 26
		if "messagemode" == bind then -- 28
			GUI.Get("Chat"):Show() -- 29
			return true -- 30
		end -- 30
	end -- 26
	return -- 31
end -- 25
hook.Add("PlayerBindPress", "evilrp_chatbox", open_chat) -- 33
local PANEL = { -- 36
	Init = function(self) -- 36
		self:SetSkin("EvilRP") -- 37
		self:SetCloseOnPause() -- 38
		self:ResizeWithScale(1.0) -- 39
		self:SetWide(ScrW() * .5) -- 40
		self:MakePopup() -- 41
		self.Scroll = self:Add("EvilRP_ChatScroll") -- 42
		do -- 43
			local _with_0 = self:Add("Panel") -- 43
			self.TopBar = _with_0 -- 43
			_with_0:SetTall(20) -- 44
		end -- 43
		self.Tabs = cookie.GetNumber("evilrp_chat_tabs", 0) -- 45
		self.Buttons = { } -- 46
		local tabs = { -- 48
			{ -- 48
				"LOOC", -- 48
				TAB_LOOC -- 49
			}, -- 48
			{ -- 50
				"OOC", -- 50
				TAB_OOC -- 51
			}, -- 50
			{ -- 52
				"IC", -- 52
				TAB_IC -- 53
			}, -- 52
			{ -- 54
				"Sotla", -- 54
				TAB_ADMIN -- 55
			}, -- 54
			{ -- 56
				"PM", -- 56
				TAB_PM -- 57
			}, -- 56
			{ -- 58
				"Radio", -- 58
				TAB_RADIO -- 59
			} -- 58
		} -- 47
		for _index_0 = 1, #tabs do -- 60
			local v = tabs[_index_0] -- 60
			local button = self.TopBar:Add("DButton") -- 61
			button:SetFont("Spleen_Label_Small") -- 63
			button:SetText(v[1]) -- 64
			button:Dock(LEFT) -- 65
			button:DockMargin(0, 0, 5, 0) -- 66
			button.SkinVar = "Active" -- 67
			button.SkinInverted = true -- 68
			button.Active = self:CanSeeTab(v[2]) -- 69
			button.Tab = v[2] -- 70
			button.DoClick = function(pnl) -- 71
				pnl.Active = not pnl.Active -- 72
				pnl:SetTextColor(nil) -- 73
				return self:SaveTabConfig() -- 74
			end -- 71
			do -- 75
				local _obj_0 = self.Buttons -- 75
				_obj_0[#_obj_0 + 1] = button -- 75
			end -- 75
		end -- 75
		self.Input = self:Add("EvilRP_ChatInput") -- 76
		do -- 77
			local _with_0 = self.Input -- 77
			_with_0:SetTall(20) -- 78
			_with_0:SetX(10) -- 79
		end -- 77
		self.CloseButton = self.TopBar:Add("DButton") -- 80
		do -- 81
			local _with_0 = self.CloseButton -- 81
			_with_0:SetFont("marlett") -- 82
			_with_0:SetText("r") -- 83
			_with_0:Dock(RIGHT) -- 84
			_with_0:SetWide(20) -- 85
			_with_0.DoClick = function(pnl) -- 86
				return self:Close() -- 86
			end -- 86
		end -- 81
		return hook.Add("OnChatScaleSettingChanged", self, function(_, _, old, new) -- 87
			return self:ResizeWithScale(new) -- 87
		end) -- 87
	end, -- 36
	ResizeWithScale = function(self, multiplier) -- 89
		if multiplier == nil then -- 89
			multiplier = 1.0 -- 89
		end -- 89
		local s_w = 200 -- 90
		local s_h = 133 -- 91
		BaseClass.SetSize(self, ScreenScale(s_h) * multiplier, ScreenScaleH(s_h) * multiplier) -- 92
		return self:SetPos(20, ScrH() - self:GetTall() - 200) -- 93
	end, -- 89
	Close = function(self) -- 95
		return self:OnClose() -- 95
	end, -- 95
	OnClose = function(self) -- 97
		return GUI.Get("Chat"):Hide() -- 97
	end, -- 97
	SaveTabConfig = function(self) -- 99
		local val = 0 -- 100
		local _list_0 = self.Buttons -- 101
		for _index_0 = 1, #_list_0 do -- 101
			local button = _list_0[_index_0] -- 101
			if not button.Active then -- 102
				val = val + button.Tab -- 102
			end -- 102
		end -- 102
		self.Tabs = val -- 103
		return cookie.Set("evilrp_chat_tabs", val) -- 104
	end, -- 99
	CanSeeTab = function(self, tab) -- 106
		if not tab then -- 107
			return true -- 107
		end -- 107
		return not tobool(bit.band(self.Tabs, tab)) -- 108
	end, -- 106
	AddMessage = function(self, message, console_message, tabs) -- 110
		self.Scroll:AddMessage(message, console_message, tabs) -- 111
		if tabs then -- 112
			local _list_0 = self.Buttons -- 113
			for _index_0 = 1, #_list_0 do -- 113
				local button = _list_0[_index_0] -- 113
				if tobool(bit.band(button.Tab, tabs)) and not button.Active then -- 114
					button:SetTextColor(self:GetSkin().Text.Primary) -- 115
				end -- 114
			end -- 115
		end -- 112
		if not system.HasFocus() and self:CanSeeTab(tabs) then -- 116
			return system.FlashWindow() -- 117
		end -- 116
	end, -- 110
	Show = function(self) -- 123
		self.IsOpen = true -- 124
		self:SetKeyboardInputEnabled(true) -- 125
		self:SetMouseInputEnabled(true) -- 126
		self.Scroll:Show() -- 127
		do -- 128
			local _with_0 = self.Input -- 128
			_with_0:Show() -- 129
			_with_0:RequestFocus() -- 130
			_with_0.HistoryIndex = 0 -- 131
		end -- 128
		local _list_0 = self.Buttons -- 132
		for _index_0 = 1, #_list_0 do -- 132
			local button = _list_0[_index_0] -- 132
			button:Show() -- 132
		end -- 132
		return self.CloseButton:Show() -- 133
	end, -- 123
	Hide = function(self) -- 135
		self.IsOpen = false -- 136
		self:SetKeyboardInputEnabled(false) -- 137
		self:SetMouseInputEnabled(false) -- 138
		do -- 139
			local _with_0 = self.Input -- 139
			_with_0:SetText("") -- 140
			_with_0:SetTall(20) -- 141
		end -- 139
		self:InvalidateLayout(true) -- 142
		self.Scroll:Hide() -- 143
		self.Input:Hide() -- 144
		local _list_0 = self.Buttons -- 145
		for _index_0 = 1, #_list_0 do -- 145
			local button = _list_0[_index_0] -- 145
			button:Hide() -- 145
		end -- 145
		return self.CloseButton:Hide() -- 146
	end, -- 135
	ExportBuffer = function(self) -- 148
		return { -- 150
			self.Scroll.Buffer, -- 150
			self.Scroll.BufferSize, -- 151
			self.IsOpen, -- 152
			self.Scroll.VBar:GetScroll(), -- 153
			self.Input:GetText(), -- 154
			self.Input.History, -- 155
			self.Input.HistoryIndex -- 156
		} -- 157
	end, -- 148
	ImportBuffer = function(self, buffer) -- 159
		do -- 160
			local _with_0 = self.Scroll -- 160
			_with_0.Buffer = buffer[1] -- 161
			_with_0.BufferSize = buffer[2] -- 162
			_with_0:InvalidateLayout() -- 163
		end -- 160
		if buffer[3] then -- 164
			self:Show() -- 165
			self.Scroll.VBar:SetScroll(buffer[4]) -- 166
		end -- 164
		self.Input:SetText(buffer[5] or "") -- 167
		self.Input.History = buffer[6] -- 168
		self.Input.HistoryIndex = buffer[7] -- 169
	end, -- 159
	PerformLayout = function(self, w, h) -- 171
		do -- 172
			local _with_0 = self.TopBar -- 172
			_with_0:AlignLeft(10) -- 173
			_with_0:AlignTop(10) -- 174
			_with_0:StretchToParent(nil, nil, 10) -- 175
		end -- 172
		do -- 176
			local _with_0 = self.Input -- 176
			_with_0:AlignLeft(10) -- 177
			_with_0:AlignBottom(10) -- 178
			_with_0:StretchToParent(nil, nil, 10) -- 179
		end -- 176
		local pre_scroll = self.Scroll:GetTall() -- 180
		do -- 181
			local _with_0 = self.Scroll -- 181
			_with_0:AlignLeft(10) -- 182
			_with_0:MoveBelow(self.TopBar, 5) -- 183
			_with_0:StretchToParent(nil, nil, 10) -- 184
			_with_0:StretchBottomTo(self.Input, 5) -- 185
		end -- 181
		local scroll_bar = self.Scroll.VBar -- 188
		local diff = self.Scroll:GetTall() - pre_scroll -- 189
		if diff ~= 0 then -- 190
			self.Scroll:InvalidateLayout(true) -- 191
			return scroll_bar:SetScroll(scroll_bar:GetScroll() - diff) -- 192
		end -- 190
	end, -- 171
	Paint = function(self, w, h) -- 194
		if self.IsOpen then -- 195
			return derma.SkinHook("Paint", "Chat", self, w, h) -- 195
		end -- 195
	end -- 194
} -- 35
derma.DefineControl("EvilRP_Chat", "", PANEL, "EditablePanel") -- 198
return GUI.Register("Chat", (function() -- 200
	local panel = vgui.Create("EvilRP_Chat") -- 201
	panel:Hide() -- 202
	return panel -- 203
end), true) -- 203
