-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/playermenu/cl_playermenu.yue
if not ECP then -- 2
	ECP = { } -- 2
end -- 2
local handframe = 1 -- 4
local next_handframe = CurTime() -- 5
local hand_animation = false -- 6
local handframes = { -- 9
	Material("placenta/cursor/hand1.png"), -- 9
	Material("placenta/cursor/hand2.png"), -- 10
	Material("placenta/cursor/hand3.png"), -- 11
	Material("placenta/cursor/hand2.png") -- 12
} -- 8
local moused = false -- 15
get_handframe = function() -- 17
	local ct = CurTime() -- 18
	if ct > next_handframe then -- 19
		if not hand_animation then -- 20
			if handframe > 1 then -- 21
				next_handframe = ct + .2 -- 22
				handframe = math.min(handframe + 1, #handframes) -- 23
				if handframe >= #handframes then -- 24
					handframe = 1 -- 24
				end -- 24
			end -- 21
		else -- 26
			next_handframe = ct + .2 -- 26
			handframe = math.min(handframe + 1, #handframes) -- 27
			if handframe >= #handframes then -- 28
				handframe = 1 -- 28
			end -- 28
		end -- 20
	end -- 19
	return handframes[handframe] -- 29
end -- 17
GAMEMODE.CreatePlayerMenu = function(self) -- 31
	local lp = LocalPlayer() -- 32
	lp:EmitSound("placenta/ui/menu_open.wav") -- 33
	ECP.pmenu = vgui.Create("DFrame") -- 35
	local sw = ScrW() -- 36
	local sh = ScrH() -- 37
	do -- 38
		local _with_0 = ECP.pmenu -- 38
		_with_0:SetSize(ScrW(), ScrH()) -- 39
		_with_0:Center() -- 40
		_with_0:SetTitle("") -- 41
		_with_0.lblTitle:SetFont("Spleen_Label") -- 42
		_with_0:MakePopup() -- 43
		_with_0.PerformLayout = evilrp_perform_layout -- 44
		_with_0:PerformLayout() -- 45
		_with_0:ShowCloseButton(false) -- 46
		_with_0:SetCursor("blank") -- 47
	end -- 38
	ECP.pmenu.OnClose = function(self) -- 49
		return lp:EmitSound("placenta/ui/menu_close.wav") -- 49
	end -- 49
	ECP.pmenu.content_pane = vgui.Create("DPanel", ECP.pmenu) -- 51
	do -- 52
		local _with_0 = ECP.pmenu.content_pane -- 52
		_with_0:SetPos(0, 0) -- 53
		_with_0:SetSize(sw, sh) -- 54
		_with_0:SetCursor("blank") -- 55
	end -- 52
	ECP.pmenu.content_pane.Paint = function(self) -- 56
		local hf = get_handframe() -- 57
		return draw.CustomCursor(self, hf) -- 58
	end -- 56
	ECP.pmenu.content_pane.PaintOver = function(self) -- 59
		moused = false -- 60
		if not self.menu_hover then -- 61
			self.menu_hover = { -- 63
				alpha = 0, -- 63
				text = "" -- 64
			} -- 62
		end -- 61
		local x, y = self:CursorPos() -- 66
		if ECP.pmenu.icons then -- 67
			local _list_0 = ECP.pmenu.icons -- 68
			for _index_0 = 1, #_list_0 do -- 68
				local i = _list_0[_index_0] -- 68
				if i:IsHovered() then -- 69
					moused = true -- 70
					hand_animation = true -- 71
					local sent = scripted_ents.Get(i.item.class) -- 72
					self.menu_hover.text = sent.PMRender(i.item) -- 73
					self.menu_hover.alpha = Lerp(0.05, self.menu_hover.alpha, 1) -- 74
					y = y + 32 -- 75
				end -- 69
			end -- 75
		end -- 67
		local desp = (lp:GetDespair() * 0.01) -- 76
		local _list_0 = self.menu_hover.text -- 77
		for _index_0 = 1, #_list_0 do -- 77
			local t = _list_0[_index_0] -- 77
			if type(t) == "string" then -- 78
				local font = "Spleen_Label" -- 79
				local txt -- 81
				if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then -- 81
					txt = "<rgb=1,1,30>" .. tostring(t) -- 81
				end -- 81
				local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil) -- 82
				local txt_w = txt_obj:GetWide() -- 83
				local txt_h = txt_obj:GetTall() -- 84
				txt_obj:Draw(x, y, self.menu_hover.alpha, TEXT_ALIGN_CENTER) -- 86
				y = y + (txt_h) -- 88
			else -- 90
				local font = t.font or "Spleen_Label" -- 90
				local txt = t.text -- 91
				if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then -- 93
					txt = "<rgb=1,1,30>" .. tostring(txt) -- 93
				end -- 93
				local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil) -- 94
				local txt_w = txt_obj:GetWide() -- 95
				local txt_h = txt_obj:GetTall() -- 96
				txt_obj:Draw(x, y, cross_text_alpha, TEXT_ALIGN_CENTER) -- 98
				y = y + txt_h -- 100
				local bg = Color(0, 0, 0, self.menu_hover.alpha * 255) -- 101
			end -- 78
		end -- 101
		if not moused and self.menu_hover.alpha and self.menu_hover.alpha > 0 then -- 102
			self.menu_hover.alpha = Lerp(0.05, self.menu_hover.alpha, 0) -- 103
		end -- 102
	end -- 59
	ECP.pmenu.char_model = vgui.Create("DModelPanel", ECP.pmenu.content_pane) -- 105
	do -- 106
		local _with_0 = ECP.pmenu.char_model -- 106
		_with_0:SetModel(lp:GetModel()) -- 107
		_with_0.EntReady = false -- 108
		_with_0.DoClick = function(self) -- 109
			local punches = { -- 111
				"npc/vort/foot_hit.wav", -- 111
				"weapons/crossbow/hitbod1.wav", -- 112
				"weapons/crossbow/hitbod2.wav" -- 113
			} -- 110
			surface.PlaySound(punches[math.random(1, #punches)]) -- 115
			local ct = CurTime() -- 116
			self.next_grunt = self.next_grunt or ct -- 117
			local hurt_sounds -- 118
			do -- 118
				local _obj_0 = lp:getJobTable() -- 118
				hurt_sounds = _obj_0.hurt_sounds -- 118
			end -- 118
			if not (hurt_sounds and #hurt_sounds > 0) then -- 119
				return -- 119
			end -- 119
			if ct >= self.next_grunt then -- 120
				self.next_grunt = ct + math.Rand(0.5, 2.0) -- 121
				timer.Simple(FrameTime() * 3, function() -- 122
					local snd = hurt_sounds[math.random(1, #hurt_sounds)] -- 123
					return lp:EmitSound(snd, 80, math.random(95, 110)) -- 124
				end) -- 122
			end -- 120
			self.FOV = 40 -- 125
		end -- 109
		_with_0.DoRightClick = function(self) -- 126
			local equipment = lp:GetAllEquipment() -- 127
			local equip_dmenu = DermaMenu() -- 128
			if (not equipment) or not (#equipment > 0) then -- 129
				equip_dmenu:AddOption("No removable equipment!") -- 130
			else -- 132
				for _index_0 = 1, #equipment do -- 132
					local eq = equipment[_index_0] -- 132
					local opt = equip_dmenu:AddOption(tostring(eq.PrintName), function() -- 133
						lp:ConCommand("dequip " .. tostring(eq.EquipSlot)) -- 134
						return ECP.pmenu:KILL() -- 135
					end) -- 133
					opt:SetIcon("icon16/disconnect.png") -- 136
				end -- 136
			end -- 129
			return equip_dmenu:Open() -- 137
		end -- 126
		_with_0.PaintOver = function(self) -- 138
			return draw.CustomCursor(self, get_handframe()) -- 138
		end -- 138
		_with_0.Think = function(self) -- 139
			if not self.FOV then -- 140
				self.FOV = 35 -- 140
			end -- 140
			if self:IsHovered() then -- 141
				hand_animation = true -- 141
			end -- 141
			self:SetColor(Color(255, 255, 255, 255)) -- 142
			self.FOV = Lerp(0.1, self.FOV, 35) -- 143
			return self:SetFOV(self.FOV) -- 144
		end -- 139
		_with_0.PostDrawModel = function(self, ent) -- 145
			local outfits = part.Get(ent) -- 146
			if outfits then -- 147
				for k, v in pairs(outfits) do -- 148
					v:Draw() -- 148
				end -- 148
			end -- 147
		end -- 145
		_with_0.Entity.GetPlayerColor = function(self) -- 149
			lp = LocalPlayer() -- 150
			if (not lp) or (not lp:IsValid()) then -- 151
				return Vector(1, 1, 1) -- 151
			end -- 151
			local rainbow = lp:GetInfoNum("lfr_rainbow_playermodel", 1) == 1 -- 152
			return lp:GetPlayerColor() -- 153
		end -- 149
		_with_0:SetColor(Color(255, 255, 255, 0)) -- 155
		lp = LocalPlayer() -- 156
		local ent = _with_0.Entity -- 157
		ent:SetSkin(lp:GetSkin()) -- 158
		for i = 1, 20 do -- 159
			ent:SetBodygroup(i, lp:GetBodygroup(i)) -- 159
		end -- 159
		for i = 1, 20 do -- 160
			ent:SetSubMaterial(i, lp:GetSubMaterial(i)) -- 160
		end -- 160
		local outfits = part.Get(lp) -- 162
		local appearance = outfits and outfits.appearance or nil -- 163
		if appearance then -- 164
			part.Add(ent, "appearance", appearance.Data) -- 165
		end -- 164
		_with_0:SetSize(200, 500) -- 167
		_with_0:SetPos((ECP.pmenu:GetWide() / 2 - _with_0:GetWide() / 2), ECP.pmenu:GetTall() / 5) -- 168
		_with_0:SetFOV(25) -- 169
		_with_0:SetCamPos(Vector(50, 0, 60)) -- 171
		_with_0:SetLookAt(Vector(-80, 0, 10)) -- 172
		_with_0:SetCursor("blank") -- 173
	end -- 106
	ECP.pmenu.Paint = function(self) -- 175
		local ct = CurTime() -- 176
		local font = "Spleen_Label" -- 177
		local desp = (lp:GetDespair() * 0.01) -- 178
		local alpha = 0.5 + (math.abs(math.sin(ct) * 0.5)) -- 179
		local x = (self:GetWide() / 2) + (30 * math.sin(ct)) -- 180
		local y = self:GetTall() * .125 -- 181
		surface.SetFont(font) -- 182
		local name = lp:Name() -- 184
		local txt = "<rgb=1,10,60>" .. tostring(name) -- 185
		local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil) -- 187
		local txt_w = txt_obj:GetWide() -- 188
		local txt_h = txt_obj:GetTall() -- 189
		txt_obj:Draw(x, y, alpha, TEXT_ALIGN_CENTER) -- 191
		local list = lp:OddityList() -- 194
		if #list > 0 then -- 195
			x = (self:GetWide() / 4) * 3.25 -- 196
			y = (self:GetTall() * .2) + (12 * math.cos(ct)) -- 197
			txt = "i have problems such as" -- 198
			txt_obj = scribe.Parse("<stutter><rgb=0,10><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil) -- 199
			txt_obj:Draw(x, y, alpha, TEXT_ALIGN_CENTER) -- 200
			txt_h = txt_obj:GetTall() -- 201
			y = y + txt_h -- 202
			local idx = 0 -- 203
			for _index_0 = 1, #list do -- 204
				local oddity = list[_index_0] -- 204
				idx = idx + 1 -- 205
				txt = oddity.name -- 206
				txt_obj = scribe.Parse("<stutter><rgb=0," .. tostring(15 * idx) .. "><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil) -- 207
				txt_obj:Draw(x, y, alpha, TEXT_ALIGN_CENTER) -- 208
				txt_h = txt_obj:GetTall() -- 209
				y = y + txt_h -- 210
			end -- 210
		end -- 195
		local money = lp:getDarkRPVar("money") -- 212
		txt = "i have " .. tostring(money) .. " Bones in my body" -- 213
		txt_obj = scribe.Parse("<stutter><col=0,200,0><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil) -- 215
		txt_w = txt_obj:GetWide() -- 216
		txt_h = txt_obj:GetTall() -- 217
		x = (self:GetWide() / 2) + (30 * math.cos(ct)) -- 219
		y = self:GetTall() * .725 -- 220
		txt_obj:Draw(x, y, alpha, TEXT_ALIGN_CENTER) -- 221
		local cells = lp:GetStemCells() -- 223
		txt = "i have " .. tostring(cells) .. " Stem Cells in my brain" -- 224
		txt_obj = scribe.Parse("<stutter><col=0,200,0><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil) -- 226
		txt_w = txt_obj:GetWide() -- 227
		txt_h = txt_obj:GetTall() -- 228
		x = (self:GetWide() / 2) + (30 * math.cos(ct)) -- 230
		y = self:GetTall() * .75 -- 231
		return txt_obj:Draw(x, y, alpha, TEXT_ALIGN_CENTER) -- 232
	end -- 175
	ECP.pmenu.KILL = function(self) -- 234
		self:Remove() -- 235
		self:OnClose() -- 236
		self = nil -- 237
		return gui.HideGameUI() -- 238
	end -- 234
	local rotspeed = 0.25 -- 240
	local rotating = true -- 241
	local rotime = 0 -- 242
	ECP.pmenu.Think = function(self) -- 244
		if not moused then -- 245
			rotime = rotime + FrameTime() -- 245
		end -- 245
		if self.icons then -- 246
			local angle = rotime * rotspeed % (2 * math.pi) -- 247
			local offset = ((2 * math.pi) / #table.GetKeys(self.icons)) -- 248
			local idx = 0 -- 249
			for k, v in pairs(self.icons) do -- 250
				local offset_angle = angle + (offset * (k - 1)) -- 251
				local hx = math.cos(offset_angle) * (ScrW() * 0.2) -- 252
				local hy = math.sin(offset_angle) * (ScrH() * 0.35) -- 253
				local item = v.item -- 254
				if not moused then -- 255
					v:SetPos((self:GetWide() / 2.05) - hx, (self:GetTall() / 2.15) - hy) -- 256
				end -- 255
			end -- 256
		end -- 246
		local ct = CurTime() -- 257
		if not self.TryClose then -- 258
			self.TryClose = ct + 0.2 -- 258
		end -- 258
		if ct >= self.TryClose then -- 259
			if not lp:Alive() then -- 260
				self:KILL() -- 260
			end -- 260
			if input.IsKeyDown(KEY_ESCAPE) then -- 261
				self:KILL() -- 261
			end -- 261
			if input.IsKeyDown(KEY_F3) then -- 262
				self:KILL() -- 262
			end -- 262
			if input.IsKeyDown(KEY_R) then -- 263
				self:KILL() -- 263
			end -- 263
			local gx = gui.MouseX() -- 264
			local gy = gui.MouseY() -- 265
			sw = ScrW() -- 266
			sh = ScrH() -- 267
			if gx < (sw * .2) then -- 268
				self:KILL() -- 268
			end -- 268
			if gy < (sh * .1) then -- 269
				self:KILL() -- 269
			end -- 269
			if gx > (sw * .8) then -- 270
				self:KILL() -- 270
			end -- 270
			if gy > (sh * .9) then -- 271
				return self:KILL() -- 271
			end -- 271
		end -- 259
	end -- 244
	return self:PMUpdateInventory() -- 272
end -- 31
hook.Add("HUDPaint", "evilrp_blur_playermenu", function() -- 274
	if ECP.pmenu and ECP.pmenu:IsValid() then -- 275
		draw.DrawBackgroundBlur(1) -- 276
	end -- 275
	return -- 277
end) -- 274
GAMEMODE.CreateEquipmentMenu = function(self) -- 279
	local lp = LocalPlayer() -- 280
	local frame = vgui.Create("DFrame") -- 281
	frame:SetSize(400, 200) -- 283
	frame:Center() -- 284
	frame:SetTitle("Yeah, take 'em off") -- 285
	frame:MakePopup() -- 286
	frame:SetSkin("EvilRP") -- 287
	for i = 1, 4 do -- 288
		local checkbox = vgui.Create("DCheckBox", frame) -- 289
		checkbox:SetPos(8, 16 + i * 24) -- 291
	end -- 291
end -- 279
