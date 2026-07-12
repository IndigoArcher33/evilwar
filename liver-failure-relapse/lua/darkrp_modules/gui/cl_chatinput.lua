-- [yue]: /home/corpse/gmodserver/garrysmod/addons/darkrpmodification/lua/darkrp_modules/gui/cl_chatinput.yue
local PANEL = { -- 2
	Init = function(self) -- 2
		self:SetFont("Spleen_Label_Small") -- 3
		self:SetUpdateOnType(true) -- 4
		self.MultiLine = false -- 5
		self.m_bLoseFocusOnClickAway = false -- 6
		self.History = { } -- 7
		self.HistoryIndex = 0 -- 8
	end, -- 2
	OnKeyCodeTyped = function(self, code) -- 10
		self:OnKeyCode(code) -- 11
		if KEY_ENTER == code then -- 13
			self:OnEnter() -- 14
			return true -- 15
		elseif KEY_UP == code or KEY_DOWN == code then -- 16
			self:CycleChatHistory(code) -- 17
			return true -- 18
		end -- 18
	end, -- 10
	CycleChatHistory = function(self, code) -- 20
		if code == KEY_UP and self.HistoryIndex == 1 then -- 21
			return -- 21
		end -- 21
		if code == KEY_DOWN and self.HistoryIndex == 0 then -- 22
			return -- 22
		end -- 22
		if code == KEY_UP and self.HistoryIndex == 0 then -- 23
			self.Backup = self:GetText() -- 24
		end -- 23
		local change = (code == KEY_DOWN) and 1 or -1 -- 25
		local index = (self.HistoryIndex + change) % (#self.History + 1) -- 26
		local text -- 27
		if index == 0 then -- 28
			text = self.Backup -- 29
			self.Backup = nil -- 30
		else -- 32
			text = self.History[index] -- 32
		end -- 28
		self:SetText(text) -- 33
		self:SetCaretPos(#text) -- 34
		self:UpdateHeight(text) -- 35
		self.HistoryIndex = index -- 36
	end, -- 20
	OnValueChange = function(self, str) -- 38
		self:UpdateHeight(str) -- 39
		local _, cmd, args = Chat.Process(lp, str) -- 40
		local command = Chat.commands[cmd] -- 41
		if not (command and command.typing) then -- 42
			cmd = nil -- 42
		end -- 42
		if #args < 1 then -- 43
			cmd = nil -- 43
		end -- 43
		if args == "/" then -- 44
			cmd = nil -- 44
		end -- 44
		if cmd ~= lp:Typing() then -- 45
			lp:SetTyping(cmd) -- 46
			return netstream.Send("Typing", cmd) -- 47
		end -- 45
	end, -- 38
	UpdateHeight = function(self, str) -- 49
		local multi = true -- 50
		local height = self:GetTall() -- 51
		if multi ~= self.MultiLine then -- 52
			self:SetMultiline(multi) -- 53
			self.MultiLine = multi -- 54
		end -- 52
		if not multi then -- 55
			if height ~= 20 then -- 56
				self:SetTall(20) -- 56
			end -- 56
			return -- 57
		end -- 55
		local font = self:GetFont() -- 58
		local max_width = self:GetWide() - 6 -- 59
		local acc = 0 -- 60
		local lines = 1 -- 61
		for _, code in utf8.codes(str) do -- 62
			local char = utf8.char(code) -- 63
			local w = surface.GetFontSize(font, char) -- 64
			if acc + w > max_width then -- 65
				lines = lines + 1 -- 66
				acc = 0 -- 67
			end -- 65
			acc = acc + w -- 68
		end -- 68
		local target_height = math.max(lines * 20, 20) -- 69
		if height ~= target_height then -- 70
			return self:SetTall(target_height) -- 70
		end -- 70
	end, -- 49
	OnEnter = function(self) -- 72
		local str = self:GetText() -- 73
		if #str == 0 then -- 74
			GUI.Get("Chat"):Hide() -- 75
			return -- 76
		end -- 74
		if #self.History > 100 then -- 77
			table.remove(self.History, 1) -- 77
		end -- 77
		do -- 78
			local _obj_0 = self.History -- 78
			_obj_0[#_obj_0 + 1] = str -- 78
		end -- 78
		Chat.Parse(lp, str) -- 79
		return Chat.Hide() -- 80
	end, -- 72
	AllowInput = function(self, char) -- 83
		if #self:GetValue() > 500 then -- 84
			surface.PlaySound("weapons/pistol/pistol_empty.wav") -- 85
			return true -- 86
		elseif char == input.LookupBinding("toggleconsole") then -- 87
			return true -- 88
		end -- 84
	end -- 83
} -- 1
return derma.DefineControl("EvilRP_ChatInput", "", PANEL, "DTextEntry") -- 91
