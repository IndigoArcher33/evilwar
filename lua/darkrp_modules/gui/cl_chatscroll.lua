local PANEL = {
	Init = function(self)
		self.Buffer = { }
		self.BufferSize = 0
		self.VBar = self:Add("DVScrollBar")
		self.VBar:Dock(RIGHT)
		self.VBar.AddScroll = function(pnl, delta)
			local old = pnl:GetScroll()
			pnl:SetScroll(old + delta * 18)
			return old ~= pnl:GetScroll()
		end
		return self:SetMouseInputEnabled(false)
	end,
	OnMouseWheeled = function(self, delta)
		return self.VBar:OnMouseWheeled(delta)
	end,
	PerformLayout = function(self, w)
		if self.IsOpen then
			self.VBar:SetUp(self:GetTall(), self.BufferSize + 1)
		end
		local width = w - self.VBar:GetWide() - 5
		for _, buffer in pairs(self.Buffer) do
			buffer.Scribe.MaxWidth = width
		end
	end,
	AddMessage = function(self, message, console_message, tabs)
		local data = {
			Message = message,
			Scribe = scribe.Parse("<stutter>" .. tostring(message), self:GetWide() - self.VBar:GetWide()),
			ReceiveTime = CurTime(),
			Tabs = tabs
		}
		_G.ScribeCache = data.Scribe
		if console_message then
			local console = scribe.Parse(console_message)
			console:PrintToConsole()
		else
			data.Scribe:PrintToConsole()
		end
		do
			local _obj_0 = self.Buffer
			_obj_0[#_obj_0 + 1] = data
		end
		local do_scroll = self.VBar:GetOffset() - self:GetTall() + self.BufferSize == -1
		self.BufferSize = self.BufferSize + data.Scribe:GetTall()
		while self.BufferSize > 2 ^ 15 - 1 do
			local line = table.remove(self.Buffer, 1)
			self.BufferSize = self.BufferSize - line.Scribe:GetTall()
		end
		if self.IsOpen then
			self.VBar:SetUp(self:GetTall(), self.BufferSize + 1)
			if do_scroll then
				return self.VBar:SetScroll(math.huge)
			end
		end
	end,
	Hide = function(self)
		self.IsOpen = false
		self.VBar:Hide()
		return self:SetMouseInputEnabled(false)
	end,
	Show = function(self)
		self.IsOpen = true
		self.VBar:Show()
		self.VBar:SetUp(self:GetTall(), self.BufferSize + 1)
		self.VBar:SetScroll(math.huge)
		return self:SetMouseInputEnabled(true)
	end,
	Paint = function(self, w, h)
		local open = self:GetParent().IsOpen
		if open then
			local color = Color(0, 0, 0, 70)
			surface.SetDrawColor(color)
			surface.DrawRect(0, 0, w, h)
			surface.SetDrawColor(0, 0, 0, 100)
			surface.DrawOutlinedRect(0, 0, w, h)
		end
		local offset = (self.IsOpen and self.VBar:IsVisible()) and self.VBar:GetOffset() - self:GetTall() + 1 + self.BufferSize or 0
		local y = h - 3
		for i = #self.Buffer, 1, -1 do
			local data = self.Buffer[i]
			local lifetime = CurTime() - data.ReceiveTime
			local alpha = 255
			if not open then
				if lifetime >= 15 then
					break
				else
					alpha = (15 - lifetime) * .2
				end
			end
			if self:GetParent():CanSeeTab(data.Tabs) then
				if y + offset <= 0 then
					break
				end
				y = y - data.Scribe:GetTall()
				if y + offset >= h then
					goto _continue_0
				end
				data.Scribe:Draw(5, y + offset, alpha, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			end
			::_continue_0::
		end
	end
}
return derma.DefineControl("EvilRP_ChatScroll", "", PANEL, "Panel")
