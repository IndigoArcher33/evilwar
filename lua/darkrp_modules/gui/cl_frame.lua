local PANEL = { }
DEFINE_BASECLASS("EditablePanel")
AccessorFunc(PANEL, "ToggleKey", "ToggleKey")
AccessorFunc(PANEL, "Draggable", "Draggable")
for k, v in pairs({
	Init = function(self)
		return self:SetSkin("EvilRP")
	end,
	Close = function(self)
		return self:OnClose()
	end,
	OnClose = function(self)
		return self:Remove()
	end,
	SetTopBar = function(self, title)
		if self.m_bTopBar then
			self.Title:SetText(title)
			return
		end
		self.m_bTopBar = true
		local padding = self:GetDockPadding()
		self:SetTall(self:GetTall() + 24)
		self:DockPadding(padding, padding + 24, padding, padding)
		if self.m_bCloseOnPause then
			do
				local _with_0 = self:Add("DButton")
				self.ButtonClose = _with_0
				_with_0:SetSize(24, 24)
				_with_0:SetFont("marlett")
				_with_0:SetText("r")
				_with_0:PerformLayout()
				_with_0.Paint = function() end
				_with_0.DoClick = function(pnl)
					return self:Close()
				end
			end
		end
		do
			local _with_0 = self:Add("DLabel")
			self.Title = _with_0
			_with_0:SetFont("Spleen_Label_Small")
			_with_0:SetText(title)
		end
		return self:PerformLayout()
	end,
	Think = function(self)
		if self.Dragging then
			local mousex = math.Clamp(gui.MouseX(), 1, ScrW() - 1)
			local mousey = math.Clamp(gui.Mousey(), 1, ScrH() - 1)
			local x = math.Clamp(mousex - self.Dragging[1], 0, ScrW() - self:GetWide())
			local y = math.Clamp(mousey - self.Dragging[2], 0, ScrH() - self:GetTall())
			return self:SetPos(x, y)
		end
	end,
	SetSize = function(self, w, h)
		if self.bDrawTopbar then
			h = h + 24
		end
		return BaseClass.SetSize(self, w, h)
	end,
	OnKeyCodePressed = function(self, key)
		if self.ToggleKey and input.LookupKeyBinding(key) == self.ToggleKey then
			return self:Remove()
		end
	end,
	OnMousePressed = function(self)
		local x, y = self:ScreenToLocal(input.GetCursorPos())
		if self.Draggable and math.InRange(x, 0, self:GetWide()) and math.InRange(y, 0, 24) then
			self.Dragging = {
				x,
				y
			}
			return self:MouseCapture(true)
		end
	end,
	OnMouseReleased = function(self)
		self.Dragging = nil
		return self:MouseCapture(false)
	end,
	PerformLayout = function(self)
		if IsValid(self.ButtonClose) then
			self.ButtonClose:SetPos(self:GetWide() - 24, 0)
		end
		if IsValid(self.Title) then
			self.Title:SetPos(6, 0)
			return self.Title:SetSize(self:GetWide() - 24, 25)
		end
	end,
	PaintFullScreen = function(self, x, y, w, h) end,
	Paint = function(self, w, h)
		local was = DisableClipping(true)
		local x, y = self:LocalToScreen(0, 0)
		self:PaintFullScreen(x * -1, y * -1, ScrW(), ScrH())
		DisableClipping(was)
		return derma.SkinHook("Paint", "Frame", self, w, h)
	end
}) do
	PANEL[k] = v
end
return derma.DefineControl("EvilRP_Frame", "", PANEL, "EditablePanel")
