-- [yue]: autorun\client\cl_skin.yue
evilrp_perform_layout = function(self) -- 1
	if self.btnClose and self.btnClose:IsValid() then -- 2
		do -- 3
			local _with_0 = self.btnClose -- 3
			_with_0:SetPos(self:GetWide() - 24, 0) -- 4
			_with_0:SetSize(24, 24) -- 5
			_with_0:SetFont("marlett") -- 6
			_with_0:SetText("r") -- 7
			_with_0:PerformLayout() -- 8
		end -- 3
	end -- 2
	if self.btnMaxim and self.btnMaxim:IsValid() then -- 9
		self.btnMaxim:Remove() -- 9
	end -- 9
	if self.btnMinim and self.btnMinim:IsValid() then -- 10
		self.btnMinim:Remove() -- 10
	end -- 10
	if self.lblTitle and self.lblTitle:IsValid() then -- 11
		local _with_0 = self.lblTitle -- 12
		_with_0:SetPos(6, 0) -- 13
		_with_0:SetSize(self:GetWide() - 25, 24) -- 14
		return _with_0 -- 12
	end -- 11
end -- 1
local alpha = 230 -- 16
local SKIN = { -- 22
	PrintName = "EvilRP", -- 22
	Author = "Sotla", -- 23
	DermaVersion = 1 -- 24
} -- 21
SKIN.Colors = { -- 27
	Primary = HSVToColor(0, 1, 0.8):Register("evilrp_primary"), -- 27
	Border = Color(20, 20, 20):Register("evilrp_border"), -- 28
	TextEntry = Color(35, 35, 35), -- 29
	FillLight = Color(60, 60, 60):Register("evilrp_fill_light"), -- 30
	FillMedium = Color(40, 40, 40):Register("evilrp_fill"), -- 31
	FillDark = Color(30, 30, 30):Register("evilrp_fill_dark") -- 32
} -- 26
SKIN.Text = { -- 35
	Normal = Color(200, 200, 200):Register("evilrp_normal"), -- 35
	Hover = Color(255, 128, 128):Register("evilrp_hover"), -- 36
	Primary = SKIN.Colors.Primary, -- 37
	Disabled = Color(128, 0, 0):Register("evilrp_disabled"), -- 38
	Highlight = Color(64, 32, 32):Register("evilrp_highlight"), -- 39
	Bad = Color(255, 0, 0):Register("evilrp_bad"), -- 40
	Dark = Color(128, 128, 128):Register("evilrp_dark") -- 41
} -- 34
SKIN.GwenTexture = Material("gwenskin/gmoddefault.png") -- 43
SKIN.Colours = { -- 46
	Button = { -- 47
		Disabled = SKIN.Text.Disabled, -- 47
		Down = SKIN.Text.Primary, -- 48
		Hover = SKIN.Text.Hover, -- 49
		Normal = SKIN.Text.Normal -- 50
	}, -- 46
	Label = { -- 53
		Default = SKIN.Text.Normal, -- 53
		Bright = SKIN.Text.Hover, -- 54
		Dark = SKIN.Text.Dark, -- 55
		Highlight = SKIN.Colors.Primary -- 56
	}, -- 52
	Window = { -- 74
		TitleActive = Color(0, 200, 0, 204):Register("evilrp_window_active"), -- 74
		TitleInactive = Color(64, 64, 64, 102):Register("evilrp_window_inactive") -- 75
	} -- 73
} -- 45
SKIN.DrawButton = function(self, disabled, w, h) -- 78
	surface.SetDrawColor(disabled and self.Colors.FillDark or self.Colors.FillLight) -- 79
	surface.DrawRect(0, 0, w, h) -- 80
	local col = self.Colors.Border -- 81
	surface.SetDrawColor(col.r, col.g, col.b, 150) -- 82
	return surface.DrawOutlinedRect(0, 0, w, h) -- 83
end -- 78
SKIN.SetButtonTextColor = function(self, panel) -- 85
	local col = self.Text.Normal -- 86
	if panel:GetDisabled() then -- 87
		col = self.Text.Disabled -- 88
	elseif panel.IsDown and panel:IsDown() then -- 89
		col = self.Text.Primary -- 90
	elseif panel:IsHovered() then -- 91
		col = self.Text.Hover -- 92
	end -- 87
	local ct = CurTime() -- 93
	col.r = col.r + math.abs(math.sin(ct) * 64) -- 94
	col.g = col.g + math.cos(math.sin(ct) * 128) -- 95
	col.b = col.b + math.abs(math.sin(ct) * 64) -- 96
	col.r = math.min(col.r, 255) -- 97
	col.g = math.min(col.g, 255) -- 98
	col.b = math.min(col.b, 255) -- 99
	return surface.SetTextColor(col) -- 100
end -- 85
local SetTextPos, SetFont, DrawText, SetDrawColor, DrawRect, DrawOutlinedRect = surface.SetTextPos, surface.SetFont, surface.DrawText, surface.SetDrawColor, surface.DrawRect, surface.DrawOutlinedRect -- 102
SKIN.PaintPanel = function(self, panel, w, h) -- 105
	if not panel.m_bBackground then -- 106
		return -- 106
	end -- 106
	local col = panel.m_bgColor or color_white -- 107
	SetDrawColor(col.r, col.g, col.b, col.a) -- 108
	return DrawRect(0, 0, w, h) -- 109
end -- 105
SKIN.PaintListView = function(self, panel, w, h) -- 111
	if not panel.m_bBackground then -- 112
		return -- 112
	end -- 112
	SetDrawColor(self.Colors.FillDark) -- 113
	DrawRect(0, 0, w, h) -- 114
	SetDrawColor(ColorAlpha(self.Colors.Border, 100)) -- 115
	return DrawOutlinedRect(0, 0, w, h) -- 116
end -- 111
SKIN.PaintListViewColumn = function(self, panel, w, h) -- 118
	SetDrawColor(self.Colors.FillDark) -- 119
	DrawRect(0, 0, w, h) -- 120
	SetDrawColor(ColorAlpha(self.Colors.Border, 100)) -- 121
	return DrawOutlinedRect(0, 0, w, h) -- 122
end -- 118
SKIN.PaintListViewLine = function(self, panel, w, h) -- 124
	if panel.Hovered then -- 125
		SetDrawColor(self.Colors.FillLight) -- 126
		DrawRect(0, 0, w, h) -- 127
	elseif panel.m_bAlt then -- 128
		SetDrawColor(self.Colors.FillMedium) -- 129
		Drawrect(0, 0, w, h) -- 130
	end -- 125
	if panel:IsSelected() then -- 131
		local col = self.Colors.Primary -- 132
		SetDrawColor(col.r, col.g, col.b, 100) -- 133
		return DrawRect(0, 0, w, h) -- 134
	end -- 131
end -- 124
SKIN.PaintItemList = function(self, panel, w, h) -- 136
	SetDrawColor(0, 0, 0, 70) -- 137
	DrawRect(0, 0, w, h) -- 138
	SetDrawColor(0, 0, 0, 100) -- 139
	return DrawOutlinedRect(0, 0, w, h) -- 140
end -- 136
SKIN.PaintFrame = function(self, panel, w, h) -- 142
	local col = self.Colors.FillDark -- 143
	SetDrawColor(col.r, col.g, col.b, 230) -- 144
	DrawRect(0, 0, w, h) -- 145
	SetDrawColor(self.Colors.Border) -- 146
	DrawOutlinedRect(0, 0, w, h) -- 147
	if panel.m_bTopBar then -- 148
		return DrawRect(0, 0, w, 25) -- 148
	end -- 148
end -- 142
SKIN.PaintChat = function(self, panel, w, h) -- 150
	local col = self.Colors.FillDark -- 151
	SetDrawColor(col.r, col.g, col.b, 230) -- 152
	DrawRect(0, 0, w, h) -- 153
	SetDrawColor(self.Colors.Border) -- 154
	return DrawOutlinedRect(0, 0, w, h) -- 155
end -- 150
SKIN.PaintButton = function(self, panel, w, h) -- 157
	if not panel.m_bBackground then -- 158
		return -- 158
	end -- 158
	local bool = panel.GetDisabled and panel:GetDisabled() or false -- 159
	if panel.SkinVar then -- 161
		bool = panel[panel.SkinVar] -- 161
	end -- 161
	if panel.SkinInverted then -- 162
		bool = not bool -- 162
	end -- 162
	return self:DrawButton(bool, w, h) -- 163
end -- 157
SKIN.PaintCheckBox = function(self, panel, w, h) -- 165
	self:DrawButton(panel:GetDisabled(), w, h) -- 166
	local col = self.Colors.Primary -- 167
	alpha = 0 -- 168
	if panel.Depressed then -- 169
		alpha = 255 -- 170
	elseif panel:GetChecked() then -- 171
		alpha = panel:IsHovered() and 150 or 100 -- 172
	end -- 169
	if alpha > 0 then -- 173
		SetDrawColor(col.r, col.g, col.b, alpha) -- 174
		return DrawRect(3, 3, w - 6, h - 6) -- 175
	end -- 173
end -- 165
SKIN.PaintTextEntry = function(self, panel, w, h) -- 177
	if panel.m_bBackground then -- 178
		SetDrawColor(self.Colors.TextEntry) -- 179
		DrawRect(0, 0, w, h) -- 180
		SetDrawColor(self.Colors.FillDark) -- 181
		DrawOutlinedRect(0, 0, w, h) -- 182
	end -- 178
	if panel.GetPlaceholderText and panel.GetPlaceholderColor then -- 185
		local text = panel:GetPlaceholderText() -- 186
		local color = panel:GetPlaceholderColor() -- 187
		local ptext = panel:GetText() -- 188
		if text and text:Trim() ~= "" and color and ((not ptext) or ptext == "") then -- 189
			if text:StartWith("#") then -- 190
				text = text:sub(2) -- 190
			end -- 190
			text = language.GetPhrase(text) -- 191
			panel:SetText(text) -- 192
			panel:DrawTextEntryText(self.Text.Disabled, self.Text.Disabled, self.Text.Disabled) -- 193
			panel:SetText(ptext) -- 194
			return -- 195
		end -- 189
		return panel:DrawTextEntryText(self.Text.Normal, self.Text.Highlight, self.Text.Normal) -- 196
	end -- 185
end -- 177
SKIN.PaintVScrollBar = function(self, panel, w, h) -- 198
	SetDrawColor(self.Colors.FillDark) -- 199
	return DrawRect(0, 0, w, h) -- 200
end -- 198
SKIN.PaintScrollBarGrip = function(self, panel, w, h) -- 202
	return self:DrawButton(panel:GetDisabled(), w, h) -- 203
end -- 202
SKIN.PaintButtonDown = function(self, panel, w, h) -- 205
	if not panel.m_bBackground then -- 206
		return -- 206
	end -- 206
	self:DrawButton(panel:GetDisabled(), w, h) -- 207
	self:SetButtonTextColor(panel) -- 208
	SetFont("marlett") -- 209
	local tw, th = surface.GetTextSize("6") -- 210
	SetTextPos(math.ceil(w * 0.5 - tw * 0.5), math.ceil(h * 0.5 - th * 0.5)) -- 211
	return DrawText("6") -- 212
end -- 205
SKIN.PaintButtonUp = function(self, panel, w, h) -- 214
	if not panel.m_bBackground then -- 215
		return -- 215
	end -- 215
	self:DrawButton(panel:GetDisabled(), w, h) -- 216
	self:SetButtonTextColor(panel) -- 217
	SetFont("marlett") -- 218
	local tw, th = surface.GetTextSize("5") -- 219
	SetTextPos(math.ceil(w * 0.5 - tw * 0.5), math.ceil(h * 0.5 - th * 0.5)) -- 220
	return DrawText("5") -- 221
end -- 214
SKIN.PaintButtonLeft = function(self, panel, w, h) -- 223
	if not panel.m_bBackground then -- 224
		return -- 224
	end -- 224
	self:DrawButton(panel:GetDisabled(), w, h) -- 225
	self:SetButtonTextColor(panel) -- 226
	SetFont("marlett") -- 227
	local tw, th = surface.GetTextSize("3") -- 228
	SetTextPos(math.ceil(w * 0.5 - tw * 0.5), math.ceil(h * 0.5 - th * 0.5)) -- 229
	return DrawText("3") -- 230
end -- 223
SKIN.PaintButtonRight = function(self, panel, w, h) -- 232
	if not panel.m_bBackground then -- 233
		return -- 233
	end -- 233
	self:DrawButton(panel:GetDisabled(), w, h) -- 234
	self:SetButtonTextColor(panel) -- 235
	SetFont("marlett") -- 236
	local tw, th = surface.GetTextSize("4") -- 237
	SetTextPos(math.ceil(w * 0.5 - tw * 0.5), math.ceil(h * 0.5 - th * 0.5)) -- 238
	return DrawText("4") -- 239
end -- 232
SKIN.PaintProgressBar = function(self, panel, w, h) -- 241
	SetDrawColor(self.Colors.FillDark) -- 242
	DrawRect(0, 0, w, h) -- 243
	local width = w - 2 -- 244
	SetDrawColor(self.Colors.Primary) -- 245
	DrawRect(1, 1, width * math.Clamp(panel:GetProgress(), 0, 1), h - 2) -- 246
	return draw.SimpleText(panel:GetText(), "Spleen_Label_Small", w * 0.5, h * 0.5, self.Text.Normal, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER) -- 247
end -- 241
SKIN.PaintHighlight = function(self, x, y, w, h) -- 249
	local col = self.Colors.Primary -- 250
	SetDrawColor(col.r, col.g, col.b, 25) -- 251
	DrawRect(x, y, w, h) -- 252
	SetDrawColor(col.r, col.g, col.b, 100) -- 253
	return DrawOutlinedRect(x, y, w, h) -- 254
end -- 249
SKIN.PaintItemHover = function(self, x, y, w, h) -- 256
	return self:PaintHighlight(x, y, w, h) -- 257
end -- 256
SKIN.PaintMenu = function(self, panel, w, h) -- 259
	local odd = true -- 260
	for k, v in pairs(panel:GetCanvas():GetChildren()) do -- 261
		local _continue_0 = false -- 262
		repeat -- 262
			local x, y = panel:GetChildPosition(v) -- 262
			local child_width, child_height = v:GetSize() -- 263
			if v:GetClassSize() == "Panel" then -- 264
				SetDrawColor(self.Colors.FillDark) -- 265
				DrawRect(x, y, child_width, child_height) -- 266
				_continue_0 = true -- 267
				break -- 267
			end -- 264
			if odd then -- 268
				surface.SetDrawColor(32, 32, 32, 255) -- 269
			else -- 271
				surface.SetDrawColor(128, 32, 32, 255) -- 271
			end -- 268
			DrawRect(x, y, child_width, child_height) -- 272
			odd = not odd -- 273
			_continue_0 = true -- 262
		until true -- 273
		if not _continue_0 then -- 273
			break -- 273
		end -- 273
	end -- 273
	SetDrawColor(self.Colors.FillDark) -- 274
	return DrawOutlinedRect(0, 0, w, h, 1) -- 275
end -- 259
SKIN.PaintMenuOption = function(self, panel, w, h) -- 277
	if panel.m_bBackground and not panel:IsEnabled() then -- 278
		SetDrawColor(self.Colors.FillDark) -- 279
		DrawRect(0, 0, w, h) -- 280
	end -- 278
	if panel.m_bBackground and (panel.Hovered or panel.Highlight) then -- 281
		return self:PaintHighlight(1, 1, w - 2, h - 2) -- 282
	end -- 281
end -- 277
SKIN.PaintComboBox = function(self, panel, w, h) -- 284
	return self:PaintButton(panel, w, h) -- 285
end -- 284
SKIN.PaintScoreboard = function(self, panel, w, h) -- 287
	SetDrawColor(ColorAlpha(self.Colors.FillDark, alpha)) -- 288
	DrawRect(0, 0, w, h) -- 289
	SetDrawColor(self.Colors.Border) -- 290
	DrawRect(0, 0, w, 50) -- 291
	DrawOutlinedRect(0, 0, w, h) -- 292
	return draw.SimpleText("victims: " .. tostring(#player.GetAll()), "Spleen_Label", w * 0.5, 25, self.Text.Normal, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER) -- 293
end -- 287
SKIN.PaintScoreboardEntry = function(self, panel, w, h) -- 295
	if panel.Alt then -- 296
		SetDrawColor(ColorAlpha(self.Colors.Border, 130)) -- 297
		DrawRect(0, 0, w, h) -- 298
	end -- 296
	if panel.State == SCOREBOARD_HIDDEN then -- 299
		SetDrawColor(ColorAlpha(self.Colors.Primary, 10)) -- 300
		DrawRect(0, 0, w, h) -- 301
	end -- 299
	local ply = panel.Player -- 302
	if lp:IsAdmin() then -- 303
		draw.SimpleText(ply:Name(), "Spleen_Label_Small", h + 19, math.Round(h * 0.33), self.Text.Normal, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER) -- 304
	end -- 303
	draw.DrawText(ply:Ping(), "Spleen_Label_Small", w - 20, 5, self.Text.Normal, TEXT_ALIGN_RIGHT) -- 305
	if lp:IsAdmin() then -- 306
		return draw.DrawText(ply:SteamName(), "Spleen_Label_Small", w - 20, 40, self.Text.Normal, TEXT_ALIGN_RIGHT) -- 307
	end -- 306
end -- 295
SKIN.PaintSliderKnob = function(self, panel, w, h) -- 310
	SetDrawColor(panel:GetDisabled() and self.Colors.FillDark or self.Colors.FillLight) -- 311
	local x = w * 0.2 + 1 -- 312
	local width = w * 0.6 -- 313
	DrawRect(x, 0, width, h) -- 314
	local col = self.Colors.Border -- 315
	SetDrawColor(col.r, col.g, col.b, 150) -- 316
	return DrawOutlinedRect(x, 0, width, h) -- 317
end -- 310
return derma.DefineSkin("EvilRP", "", SKIN) -- 319
