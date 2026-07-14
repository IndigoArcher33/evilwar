-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/gui/cl_frame.yue
local PANEL = { } -- 1
DEFINE_BASECLASS("EditablePanel") -- 2
AccessorFunc(PANEL, "ToggleKey", "ToggleKey") -- 4
AccessorFunc(PANEL, "Draggable", "Draggable") -- 5
for k, v in pairs({ -- 8
	Init = function(self) -- 8
		return self:SetSkin("EvilRP") -- 8
	end, -- 8
	Close = function(self) -- 10
		return self:OnClose() -- 10
	end, -- 10
	OnClose = function(self) -- 12
		return self:Remove() -- 12
	end, -- 12
	SetTopBar = function(self, title) -- 14
		if self.m_bTopBar then -- 15
			self.Title:SetText(title) -- 16
			return -- 17
		end -- 15
		self.m_bTopBar = true -- 18
		local padding = self:GetDockPadding() -- 19
		self:SetTall(self:GetTall() + 24) -- 20
		self:DockPadding(padding, padding + 24, padding, padding) -- 21
		if self.m_bCloseOnPause then -- 22
			local _with_0 = self:Add("DButton") -- 23
			self.ButtonClose = _with_0 -- 23
			_with_0:SetSize(24, 24) -- 24
			_with_0:SetFont("marlett") -- 25
			_with_0:SetText("r") -- 26
			_with_0:PerformLayout() -- 27
			_with_0.Paint = function() end -- 28
			_with_0.DoClick = function(pnl) -- 29
				return self:Close() -- 29
			end -- 29
		end -- 22
		do -- 30
			local _with_0 = self:Add("DLabel") -- 30
			self.Title = _with_0 -- 30
			_with_0:SetFont("Spleen_Label_Small") -- 31
			_with_0:SetText(title) -- 32
		end -- 30
		return self:PerformLayout() -- 33
	end, -- 14
	Think = function(self) -- 35
		if self.Dragging then -- 36
			local mousex = math.Clamp(gui.MouseX(), 1, ScrW() - 1) -- 37
			local mousey = math.Clamp(gui.Mousey(), 1, ScrH() - 1) -- 38
			local x = math.Clamp(mousex - self.Dragging[1], 0, ScrW() - self:GetWide()) -- 39
			local y = math.Clamp(mousey - self.Dragging[2], 0, ScrH() - self:GetTall()) -- 40
			return self:SetPos(x, y) -- 41
		end -- 36
	end, -- 35
	SetSize = function(self, w, h) -- 43
		if self.bDrawTopbar then -- 44
			h = h + 24 -- 44
		end -- 44
		return BaseClass.SetSize(self, w, h) -- 45
	end, -- 43
	OnKeyCodePressed = function(self, key) -- 47
		if self.ToggleKey and input.LookupKeyBinding(key) == self.ToggleKey then -- 48
			return self:Remove() -- 49
		end -- 48
	end, -- 47
	OnMousePressed = function(self) -- 51
		local x, y = self:ScreenToLocal(input.GetCursorPos()) -- 52
		if self.Draggable and math.InRange(x, 0, self:GetWide()) and math.InRange(y, 0, 24) then -- 53
			self.Dragging = { -- 54
				x, -- 54
				y -- 54
			} -- 54
			return self:MouseCapture(true) -- 55
		end -- 53
	end, -- 51
	OnMouseReleased = function(self) -- 57
		self.Dragging = nil -- 58
		return self:MouseCapture(false) -- 59
	end, -- 57
	PerformLayout = function(self) -- 61
		if IsValid(self.ButtonClose) then -- 62
			self.ButtonClose:SetPos(self:GetWide() - 24, 0) -- 62
		end -- 62
		if IsValid(self.Title) then -- 63
			self.Title:SetPos(6, 0) -- 64
			return self.Title:SetSize(self:GetWide() - 24, 25) -- 65
		end -- 63
	end, -- 61
	PaintFullScreen = function(self, x, y, w, h) end, -- 67
	Paint = function(self, w, h) -- 69
		local was = DisableClipping(true) -- 70
		local x, y = self:LocalToScreen(0, 0) -- 71
		self:PaintFullScreen(x * -1, y * -1, ScrW(), ScrH()) -- 72
		DisableClipping(was) -- 73
		return derma.SkinHook("Paint", "Frame", self, w, h) -- 74
	end -- 69
}) do -- 75
	PANEL[k] = v -- 7
end -- 7
return derma.DefineControl("EvilRP_Frame", "", PANEL, "EditablePanel") -- 77
