-- [yue]: darkrp_modules\gui\cl_chatscroll.yue
local PANEL = { -- 2
	Init = function(self) -- 2
		self.Buffer = { } -- 3
		self.BufferSize = 0 -- 4
		self.VBar = self:Add("DVScrollBar") -- 5
		self.VBar:Dock(RIGHT) -- 6
		self.VBar.AddScroll = function(pnl, delta) -- 7
			local old = pnl:GetScroll() -- 8
			pnl:SetScroll(old + delta * 18) -- 9
			return old ~= pnl:GetScroll() -- 10
		end -- 7
		return self:SetMouseInputEnabled(false) -- 11
	end, -- 2
	OnMouseWheeled = function(self, delta) -- 13
		return self.VBar:OnMouseWheeled(delta) -- 14
	end, -- 13
	PerformLayout = function(self, w) -- 16
		if self.IsOpen then -- 17
			self.VBar:SetUp(self:GetTall(), self.BufferSize + 1) -- 17
		end -- 17
		local width = w - self.VBar:GetWide() - 5 -- 18
		for _, buffer in pairs(self.Buffer) do -- 19
			buffer.Scribe.MaxWidth = width -- 20
		end -- 20
	end, -- 16
	AddMessage = function(self, message, console_message, tabs) -- 22
		local data = { -- 24
			Message = message, -- 24
			Scribe = scribe.Parse("<stutter>" .. tostring(message), self:GetWide() - self.VBar:GetWide()), -- 25
			ReceiveTime = CurTime(), -- 26
			Tabs = tabs -- 27
		} -- 23
		_G.ScribeCache = data.Scribe -- 29
		if console_message then -- 30
			local console = scribe.Parse(console_message) -- 31
			console:PrintToConsole() -- 32
		else -- 35
			data.Scribe:PrintToConsole() -- 35
		end -- 30
		do -- 37
			local _obj_0 = self.Buffer -- 37
			_obj_0[#_obj_0 + 1] = data -- 37
		end -- 37
		local do_scroll = self.VBar:GetOffset() - self:GetTall() + self.BufferSize == -1 -- 38
		self.BufferSize = self.BufferSize + data.Scribe:GetTall() -- 39
		while self.BufferSize > 2 ^ 15 - 1 do -- 40
			local line = table.remove(self.Buffer, 1) -- 41
			self.BufferSize = self.BufferSize - line.Scribe:GetTall() -- 42
		end -- 42
		if self.IsOpen then -- 43
			self.VBar:SetUp(self:GetTall(), self.BufferSize + 1) -- 44
			if do_scroll then -- 45
				return self.VBar:SetScroll(math.huge) -- 45
			end -- 45
		end -- 43
	end, -- 22
	Hide = function(self) -- 47
		self.IsOpen = false -- 48
		self.VBar:Hide() -- 49
		return self:SetMouseInputEnabled(false) -- 50
	end, -- 47
	Show = function(self) -- 52
		self.IsOpen = true -- 53
		self.VBar:Show() -- 54
		self.VBar:SetUp(self:GetTall(), self.BufferSize + 1) -- 55
		self.VBar:SetScroll(math.huge) -- 56
		return self:SetMouseInputEnabled(true) -- 57
	end, -- 52
	Paint = function(self, w, h) -- 59
		local open = self:GetParent().IsOpen -- 60
		if open then -- 61
			local color = Color(0, 0, 0, 70) -- 62
			surface.SetDrawColor(color) -- 63
			surface.DrawRect(0, 0, w, h) -- 64
			surface.SetDrawColor(0, 0, 0, 100) -- 65
			surface.DrawOutlinedRect(0, 0, w, h) -- 66
		end -- 61
		local offset = (self.IsOpen and self.VBar:IsVisible()) and self.VBar:GetOffset() - self:GetTall() + 1 + self.BufferSize or 0 -- 67
		local y = h - 3 -- 68
		for i = #self.Buffer, 1, -1 do -- 69
			local _continue_0 = false -- 70
			repeat -- 70
				local data = self.Buffer[i] -- 70
				local lifetime = CurTime() - data.ReceiveTime -- 71
				local alpha = 255 -- 72
				if not open then -- 73
					if lifetime >= 15 then -- 74
						break -- 77
					else -- 79
						alpha = (15 - lifetime) * .2 -- 79
					end -- 74
				end -- 73
				if self:GetParent():CanSeeTab(data.Tabs) then -- 80
					if y + offset <= 0 then -- 82
						break -- 82
					end -- 82
					y = y - data.Scribe:GetTall() -- 83
					if y + offset >= h then -- 85
						_continue_0 = true -- 85
						break -- 85
					end -- 85
					data.Scribe:Draw(5, y + offset, alpha, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP) -- 86
				end -- 80
				_continue_0 = true -- 70
			until true -- 91
			if not _continue_0 then -- 91
				break -- 91
			end -- 91
		end -- 91
	end -- 59
} -- 1
return derma.DefineControl("EvilRP_ChatScroll", "", PANEL, "Panel") -- 94
