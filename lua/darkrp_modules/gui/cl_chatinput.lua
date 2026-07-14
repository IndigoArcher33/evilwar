local PANEL = {
	Init = function(self)
		self:SetFont("Spleen_Label_Small")
		self:SetUpdateOnType(true)
		self.MultiLine = false
		self.m_bLoseFocusOnClickAway = false
		self.History = { }
		self.HistoryIndex = 0
	end,
	OnKeyCodeTyped = function(self, code)
		self:OnKeyCode(code)
		if KEY_ENTER == code then
			self:OnEnter()
			return true
		elseif KEY_UP == code or KEY_DOWN == code then
			self:CycleChatHistory(code)
			return true
		end
	end,
	CycleChatHistory = function(self, code)
		if code == KEY_UP and self.HistoryIndex == 1 then
			return
		end
		if code == KEY_DOWN and self.HistoryIndex == 0 then
			return
		end
		if code == KEY_UP and self.HistoryIndex == 0 then
			self.Backup = self:GetText()
		end
		local change = (code == KEY_DOWN) and 1 or -1
		local index = (self.HistoryIndex + change) % (#self.History + 1)
		local text
		if index == 0 then
			text = self.Backup
			self.Backup = nil
		else
			text = self.History[index]
		end
		self:SetText(text)
		self:SetCaretPos(#text)
		self:UpdateHeight(text)
		self.HistoryIndex = index
	end,
	OnValueChange = function(self, str)
		self:UpdateHeight(str)
		local _, cmd, args = Chat.Process(lp, str)
		local command = Chat.commands[cmd]
		if not (command and command.typing) then
			cmd = nil
		end
		if #args < 1 then
			cmd = nil
		end
		if args == "/" then
			cmd = nil
		end
		if cmd ~= lp:Typing() then
			lp:SetTyping(cmd)
			return netstream.Send("Typing", cmd)
		end
	end,
	UpdateHeight = function(self, str)
		local multi = true
		local height = self:GetTall()
		if multi ~= self.MultiLine then
			self:SetMultiline(multi)
			self.MultiLine = multi
		end
		if not multi then
			if height ~= 20 then
				self:SetTall(20)
			end
			return
		end
		local font = self:GetFont()
		local max_width = self:GetWide() - 6
		local acc = 0
		local lines = 1
		for _, code in utf8.codes(str) do
			local char = utf8.char(code)
			local w = surface.GetFontSize(font, char)
			if acc + w > max_width then
				lines = lines + 1
				acc = 0
			end
			acc = acc + w
		end
		local target_height = math.max(lines * 20, 20)
		if height ~= target_height then
			return self:SetTall(target_height)
		end
	end,
	OnEnter = function(self)
		local str = self:GetText()
		if #str == 0 then
			GUI.Get("Chat"):Hide()
			return
		end
		if #self.History > 100 then
			table.remove(self.History, 1)
		end
		do
			local _obj_0 = self.History
			_obj_0[#_obj_0 + 1] = str
		end
		Chat.Parse(lp, str)
		return Chat.Hide()
	end,
	AllowInput = function(self, char)
		if #self:GetValue() > 500 then
			surface.PlaySound("weapons/pistol/pistol_empty.wav")
			return true
		elseif char == input.LookupBinding("toggleconsole") then
			return true
		end
	end
}
return derma.DefineControl("EvilRP_ChatInput", "", PANEL, "DTextEntry")
