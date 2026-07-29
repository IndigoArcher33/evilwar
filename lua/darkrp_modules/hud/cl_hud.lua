-- [yue]: darkrp_modules\hud\cl_hud.yue
local Spleen_Label -- 1
do -- 1
	local _class_0 -- 1
	local _parent_0 = FONT -- 1
	local _base_0 = { -- 1
		font = "Spleen 8x16", -- 3
		size = 24 -- 1
	} -- 1
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 3
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 1
			_base_0[_key_0] = _val_0 -- 1
		end -- 1
	end -- 3
	if _base_0.__index == nil then -- 1
		_base_0.__index = _base_0 -- 1
	end -- 3
	setmetatable(_base_0, _parent_0.__base) -- 1
	_class_0 = setmetatable({ -- 1
		__init = function(self, ...) -- 1
			return _class_0.__parent.__init(self, ...) -- 1
		end, -- 1
		__base = _base_0, -- 1
		__name = "Spleen_Label", -- 1
		__parent = _parent_0 -- 1
	}, { -- 1
		__index = function(cls, name) -- 1
			local val = rawget(_base_0, name) -- 1
			if val == nil then -- 1
				local parent = rawget(cls, "__parent") -- 1
				if parent then -- 1
					return parent[name] -- 1
				end -- 1
			else -- 1
				return val -- 1
			end -- 1
		end, -- 1
		__call = function(cls, ...) -- 1
			local _self_0 = setmetatable({ }, _base_0) -- 1
			cls.__init(_self_0, ...) -- 1
			return _self_0 -- 1
		end -- 1
	}) -- 1
	_base_0.__class = _class_0 -- 1
	if _parent_0.__inherited then -- 1
		_parent_0.__inherited(_parent_0, _class_0) -- 1
	end -- 1
	Spleen_Label = _class_0 -- 1
end -- 3
local Spleen_Label_Small -- 5
do -- 5
	local _class_0 -- 5
	local _parent_0 = FONT -- 5
	local _base_0 = { -- 5
		font = "Spleen 8x16", -- 7
		size = 18 -- 5
	} -- 5
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 7
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 5
			_base_0[_key_0] = _val_0 -- 5
		end -- 5
	end -- 7
	if _base_0.__index == nil then -- 5
		_base_0.__index = _base_0 -- 5
	end -- 7
	setmetatable(_base_0, _parent_0.__base) -- 5
	_class_0 = setmetatable({ -- 5
		__init = function(self, ...) -- 5
			return _class_0.__parent.__init(self, ...) -- 5
		end, -- 5
		__base = _base_0, -- 5
		__name = "Spleen_Label_Small", -- 5
		__parent = _parent_0 -- 5
	}, { -- 5
		__index = function(cls, name) -- 5
			local val = rawget(_base_0, name) -- 5
			if val == nil then -- 5
				local parent = rawget(cls, "__parent") -- 5
				if parent then -- 5
					return parent[name] -- 5
				end -- 5
			else -- 5
				return val -- 5
			end -- 5
		end, -- 5
		__call = function(cls, ...) -- 5
			local _self_0 = setmetatable({ }, _base_0) -- 5
			cls.__init(_self_0, ...) -- 5
			return _self_0 -- 5
		end -- 5
	}) -- 5
	_base_0.__class = _class_0 -- 5
	if _parent_0.__inherited then -- 5
		_parent_0.__inherited(_parent_0, _class_0) -- 5
	end -- 5
	Spleen_Label_Small = _class_0 -- 5
end -- 7
local Spleen_Chat -- 9
do -- 9
	local _class_0 -- 9
	local _parent_0 = FONT -- 9
	local _base_0 = { -- 9
		font = "Spleen 8x16", -- 11
		size = 24 -- 9
	} -- 9
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 11
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 9
			_base_0[_key_0] = _val_0 -- 9
		end -- 9
	end -- 11
	if _base_0.__index == nil then -- 9
		_base_0.__index = _base_0 -- 9
	end -- 11
	setmetatable(_base_0, _parent_0.__base) -- 9
	_class_0 = setmetatable({ -- 9
		__init = function(self, ...) -- 9
			return _class_0.__parent.__init(self, ...) -- 9
		end, -- 9
		__base = _base_0, -- 9
		__name = "Spleen_Chat", -- 9
		__parent = _parent_0 -- 9
	}, { -- 9
		__index = function(cls, name) -- 9
			local val = rawget(_base_0, name) -- 9
			if val == nil then -- 9
				local parent = rawget(cls, "__parent") -- 9
				if parent then -- 9
					return parent[name] -- 9
				end -- 9
			else -- 9
				return val -- 9
			end -- 9
		end, -- 9
		__call = function(cls, ...) -- 9
			local _self_0 = setmetatable({ }, _base_0) -- 9
			cls.__init(_self_0, ...) -- 9
			return _self_0 -- 9
		end -- 9
	}) -- 9
	_base_0.__class = _class_0 -- 9
	if _parent_0.__inherited then -- 9
		_parent_0.__inherited(_parent_0, _class_0) -- 9
	end -- 9
	Spleen_Chat = _class_0 -- 9
end -- 11
local Spleen_Chat_Small -- 13
do -- 13
	local _class_0 -- 13
	local _parent_0 = FONT -- 13
	local _base_0 = { -- 13
		font = "Spleen 8x16", -- 15
		size = 16 -- 13
	} -- 13
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 15
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 13
			_base_0[_key_0] = _val_0 -- 13
		end -- 13
	end -- 15
	if _base_0.__index == nil then -- 13
		_base_0.__index = _base_0 -- 13
	end -- 15
	setmetatable(_base_0, _parent_0.__base) -- 13
	_class_0 = setmetatable({ -- 13
		__init = function(self, ...) -- 13
			return _class_0.__parent.__init(self, ...) -- 13
		end, -- 13
		__base = _base_0, -- 13
		__name = "Spleen_Chat_Small", -- 13
		__parent = _parent_0 -- 13
	}, { -- 13
		__index = function(cls, name) -- 13
			local val = rawget(_base_0, name) -- 13
			if val == nil then -- 13
				local parent = rawget(cls, "__parent") -- 13
				if parent then -- 13
					return parent[name] -- 13
				end -- 13
			else -- 13
				return val -- 13
			end -- 13
		end, -- 13
		__call = function(cls, ...) -- 13
			local _self_0 = setmetatable({ }, _base_0) -- 13
			cls.__init(_self_0, ...) -- 13
			return _self_0 -- 13
		end -- 13
	}) -- 13
	_base_0.__class = _class_0 -- 13
	if _parent_0.__inherited then -- 13
		_parent_0.__inherited(_parent_0, _class_0) -- 13
	end -- 13
	Spleen_Chat_Small = _class_0 -- 13
end -- 15
local Spleen_TTY -- 17
do -- 17
	local _class_0 -- 17
	local _parent_0 = FONT -- 17
	local _base_0 = { -- 17
		font = "Spleen 8x16", -- 19
		size = 28 -- 17
	} -- 17
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 19
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 17
			_base_0[_key_0] = _val_0 -- 17
		end -- 17
	end -- 19
	if _base_0.__index == nil then -- 17
		_base_0.__index = _base_0 -- 17
	end -- 19
	setmetatable(_base_0, _parent_0.__base) -- 17
	_class_0 = setmetatable({ -- 17
		__init = function(self, ...) -- 17
			return _class_0.__parent.__init(self, ...) -- 17
		end, -- 17
		__base = _base_0, -- 17
		__name = "Spleen_TTY", -- 17
		__parent = _parent_0 -- 17
	}, { -- 17
		__index = function(cls, name) -- 17
			local val = rawget(_base_0, name) -- 17
			if val == nil then -- 17
				local parent = rawget(cls, "__parent") -- 17
				if parent then -- 17
					return parent[name] -- 17
				end -- 17
			else -- 17
				return val -- 17
			end -- 17
		end, -- 17
		__call = function(cls, ...) -- 17
			local _self_0 = setmetatable({ }, _base_0) -- 17
			cls.__init(_self_0, ...) -- 17
			return _self_0 -- 17
		end -- 17
	}) -- 17
	_base_0.__class = _class_0 -- 17
	if _parent_0.__inherited then -- 17
		_parent_0.__inherited(_parent_0, _class_0) -- 17
	end -- 17
	Spleen_TTY = _class_0 -- 17
end -- 19
local hide_these = { -- 23
	DarkRP_HUD = false, -- 23
	DarkRP_EntityDisplay = false, -- 24
	DarkRP_LocalPlayerHUD = true, -- 25
	DarkRP_Hungermod = false, -- 26
	DarkRP_Agenda = false, -- 27
	DarkRP_LockdownHUD = false, -- 28
	DarkRP_ArrestedHUD = false, -- 29
	DarkRP_ChatReceivers = false, -- 30
	CHudCrosshair = true, -- 31
	CHudDamageIndicator = true, -- 32
	CHudHistoryResource = true, -- 33
	CHudAmmo = true, -- 34
	CHudSecondaryAmmo = true -- 35
} -- 22
hook.Add("HUDShouldDraw", "evilrp_hud_hide_default", function(name) -- 38
	if hide_these[name] then -- 39
		return false -- 39
	end -- 39
end) -- 38
GAMEMODE.HUDDrawPickupHistory = function(self) end -- 41
GAMEMODE.HUDPaint = function(self) end -- 42
local toggle_hud -- 44
toggle_hud = function(ply, cmd, args) -- 44
	return cookie.Set("evilrp_hud", 1 - cookie.GetNumber("evilrp_hud", 1)) -- 45
end -- 44
concommand.Add("rp_togglehud", toggle_hud) -- 46
local abs, cos, sin, min, max = math.abs, math.cos, math.sin, math.min, math.max -- 48
local HUDBar -- 50
do -- 50
	local _class_0 -- 50
	local _base_0 = { -- 50
		draw_current = 0, -- 53
		calculate = function(self) -- 53
			local target = self:draw_target() -- 54
			if not target then -- 55
				return -- 55
			end -- 55
			local inc = 0.1 -- 56
			if abs(self.draw_current - target) > 5 then -- 57
				inc = 1 -- 58
			end -- 57
			if self.draw_current > target then -- 59
				self.draw_current = self.draw_current - inc -- 60
			elseif self.draw_current < target then -- 61
				self.draw_current = self.draw_current + inc -- 62
			end -- 59
			if abs(self.draw_current - target) < 0.2 then -- 63
				self.draw_current = target -- 63
			end -- 63
			self.draw_current = math.Clamp(self.draw_current, 0, 100) -- 64
		end, -- 65
		render = function(self, x, y, w) -- 65
			self:calculate() -- 66
			if cookie.GetNumber("evilrp_hud", 1) == 0 then -- 67
				return -- 67
			end -- 67
			local font = "Spleen_Label" -- 68
			if self.draw_current > 0 then -- 69
				local ct = CurTime() -- 70
				local lp = LocalPlayer() -- 71
				local desp = (lp:GetDespair() * 0.01) -- 72
				local roundedness = abs(sin(ct) * 8 * desp) -- 73
				draw.RoundedBox(roundedness, x, y, w, 20, Color(30, 30, 30, 200)) -- 74
				local col -- 75
				if MUTATORS[MUTATOR_CHROMOPHOBIA].active then -- 75
					col = Color(128, 128, 128) -- 76
				else -- 78
					col = self.color -- 78
				end -- 75
				if isfunction(col) then -- 79
					col = col() -- 79
				end -- 79
				col.a = 128 + math.abs(127 * math.sin(ct)) -- 80
				draw.RoundedBox(roundedness, x + 2, y + 2, (w - 4) * (self.draw_current / 100), 18, col) -- 81
				local txt = self.label -- 82
				if isfunction(txt) then -- 83
					txt = txt() -- 83
				end -- 83
				local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil) -- 84
				txt_obj:Draw(x + (w / 2), y - 2, .23 + math.abs(math.sin(ct * .5) * .38), TEXT_ALIGN_CENTER) -- 85
				return true -- 86
			end -- 69
			return false -- 87
		end -- 50
	} -- 50
	if _base_0.__index == nil then -- 50
		_base_0.__index = _base_0 -- 50
	end -- 87
	_class_0 = setmetatable({ -- 50
		__init = function(self, color, draw_target, label) -- 51
			self.color = color -- 51
			self.draw_target = draw_target -- 51
			self.label = label -- 51
		end, -- 50
		__base = _base_0, -- 50
		__name = "HUDBar" -- 50
	}, { -- 50
		__index = _base_0, -- 50
		__call = function(cls, ...) -- 50
			local _self_0 = setmetatable({ }, _base_0) -- 50
			cls.__init(_self_0, ...) -- 50
			return _self_0 -- 50
		end -- 50
	}) -- 50
	_base_0.__class = _class_0 -- 50
	HUDBar = _class_0 -- 50
end -- 87
local bars = { -- 90
	health = HUDBar((function() -- 90
		local lp = LocalPlayer() -- 91
		local jt = lp:getJobTable() -- 92
		return (function() -- 93
			local _obj_0 = jt.bar_colors -- 93
			if _obj_0 ~= nil then -- 93
				return _obj_0.health -- 93
			end -- 93
			return nil -- 93
		end)() or Color(168, 0, 0) -- 93
	end), (function(self) -- 93
		return LocalPlayer():Health() -- 93
	end), function() -- 93
		local lp = LocalPlayer() -- 94
		local jt = lp:getJobTable() -- 95
		return (function() -- 96
			local _obj_0 = jt.bar_names -- 96
			if _obj_0 ~= nil then -- 96
				return _obj_0.health -- 96
			end -- 96
			return nil -- 96
		end)() or "blood" -- 96
	end), -- 90
	armor = HUDBar((function() -- 97
		local lp = LocalPlayer() -- 98
		local jt = lp:getJobTable() -- 99
		return (function() -- 100
			local _obj_0 = jt.bar_colors -- 100
			if _obj_0 ~= nil then -- 100
				return _obj_0.armor -- 100
			end -- 100
			return nil -- 100
		end)() or Color(0, 0, 200) -- 100
	end), (function(self) -- 100
		return LocalPlayer():Armor() -- 100
	end), function() -- 100
		local lp = LocalPlayer() -- 101
		local jt = lp:getJobTable() -- 102
		return (function() -- 103
			local _obj_0 = jt.bar_names -- 103
			if _obj_0 ~= nil then -- 103
				return _obj_0.armor -- 103
			end -- 103
			return nil -- 103
		end)() or "carapace" -- 103
	end), -- 97
	hunger = HUDBar((function() -- 104
		local lp = LocalPlayer() -- 105
		local jt = lp:getJobTable() -- 106
		return (function() -- 107
			local _obj_0 = jt.bar_colors -- 107
			if _obj_0 ~= nil then -- 107
				return _obj_0.hunger -- 107
			end -- 107
			return nil -- 107
		end)() or Color(0, 168, 0) -- 107
	end), (function(self) -- 107
		local lp = LocalPlayer() -- 108
		local jt = lp:getJobTable() -- 109
		if jt.no_needs then -- 110
			return -- 110
		end -- 110
		if lp:Alive() then -- 111
			return lp:GetHunger() -- 111
		end -- 111
	end), function() -- 111
		local lp = LocalPlayer() -- 112
		local jt = lp:getJobTable() -- 113
		return (function() -- 114
			local _obj_0 = jt.bar_names -- 114
			if _obj_0 ~= nil then -- 114
				return _obj_0.hunger -- 114
			end -- 114
			return nil -- 114
		end)() or "emptiness" -- 114
	end), -- 104
	thirst = HUDBar((function() -- 115
		local lp = LocalPlayer() -- 116
		local jt = lp:getJobTable() -- 117
		return (function() -- 118
			local _obj_0 = jt.bar_colors -- 118
			if _obj_0 ~= nil then -- 118
				return _obj_0.thirst -- 118
			end -- 118
			return nil -- 118
		end)() or Color(0, 168, 168) -- 118
	end), (function(self) -- 118
		local lp = LocalPlayer() -- 119
		local jt = lp:getJobTable() -- 120
		if jt.no_needs then -- 121
			return -- 121
		end -- 121
		if lp:Alive() then -- 122
			return lp:GetThirst() -- 122
		end -- 122
	end), function() -- 122
		local lp = LocalPlayer() -- 123
		local jt = lp:getJobTable() -- 124
		return (function() -- 125
			local _obj_0 = jt.bar_names -- 125
			if _obj_0 ~= nil then -- 125
				return _obj_0.thirst -- 125
			end -- 125
			return nil -- 125
		end)() or "dryness" -- 125
	end), -- 115
	despair = HUDBar((function() -- 126
		local lp = LocalPlayer() -- 127
		local jt = lp:getJobTable() -- 128
		return (function() -- 129
			local _obj_0 = jt.bar_colors -- 129
			if _obj_0 ~= nil then -- 129
				return _obj_0.despair -- 129
			end -- 129
			return nil -- 129
		end)() or Color(168, 168, 168) -- 129
	end), (function(self) -- 129
		local lp = LocalPlayer() -- 130
		local jt = lp:getJobTable() -- 131
		if jt.no_needs then -- 132
			return -- 132
		end -- 132
		if lp:Alive() then -- 133
			return lp:GetDespair() -- 133
		end -- 133
	end), function() -- 133
		local lp = LocalPlayer() -- 134
		local jt = lp:getJobTable() -- 135
		return (function() -- 136
			local _obj_0 = jt.bar_names -- 136
			if _obj_0 ~= nil then -- 136
				return _obj_0.despair -- 136
			end -- 136
			return nil -- 136
		end)() or "sadness" -- 136
	end), -- 126
	death = HUDBar(Color(128, 128, 128), (function(self) -- 137
		local rag = LocalPlayer():Ragdoll() -- 138
		if not (rag and IsValid(rag) and rag:GetNWBool("corpse")) then -- 139
			return -- 139
		end -- 139
		local cur = CurTime() - rag:GetNWInt("decomp_start") -- 140
		local ending = rag:GetNWInt("decomp_finish") - rag:GetNWInt("decomp_start") -- 141
		return 100 - ((cur / ending) * 100) -- 142
	end), "death") -- 137
} -- 89
local draw_bars -- 145
draw_bars = function() -- 145
	local ply = LocalPlayer() -- 146
	local w = ScrW() * .5 -- 148
	local xd, yd = 5 * sin(CurTime() * 0.666), 5 * sin(CurTime() * 0.333) -- 149
	local x, y = (ScrW() / 2) - (w / 2) + (2 * xd), 12 + yd -- 150
	local _exp_0 = ply:Team() -- 151
	if TEAM_GHOST == _exp_0 then -- 152
	else -- 155
		if ply:Alive() then -- 155
			if ply:HasOddity(ODDITY_ANASOGONSIA) then -- 156
				local desp = ply:GetDespair() * 0.01 -- 157
				local ct = CurTime() -- 158
				local font = "Spleen_Label" -- 159
				local txt = "i don't know" -- 160
				local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil) -- 161
				return txt_obj:Draw(x + (w / 2), y - 2, .23 + math.abs(math.sin(ct * .5) * .38), TEXT_ALIGN_CENTER) -- 162
			else -- 164
				if bars.health:render(x, y, w) then -- 164
					y = y + 24 -- 164
				end -- 164
				if bars.armor:render(x, y, w) then -- 165
					y = y + 24 -- 165
				end -- 165
				if bars.hunger:render(x, y, w) then -- 166
					y = y + 24 -- 166
				end -- 166
				if bars.thirst:render(x, y, w) then -- 167
					y = y + 24 -- 167
				end -- 167
				if bars.despair:render(x, y, w) then -- 168
					y = y + 24 -- 168
				end -- 168
			end -- 156
		else -- 170
			return bars.death:render(x, y, w) -- 170
		end -- 155
	end -- 170
end -- 145
local prog_width = 400 -- 173
local prog_height = 40 -- 174
local prog_spacing = 60 -- 175
local prog_offset = 40 -- 176
local col_bg = Color(64, 64, 64, 200) -- 178
local col_fg = Color(168, 0, 0) -- 179
local col_tx = color_white -- 180
local back = surface.GetFontHeight("Spleen_Label") * 1.25 -- 182
local draw_prog -- 184
draw_prog = function() -- 184
	local sw = ScrW() -- 185
	local sh = ScrH() -- 186
	local w = prog_width * 0.5 -- 187
	for k, data in ipairs(progress.Active) do -- 188
		local x = (sw * 0.5) - w -- 189
		local y = (sh * 0.5) + prog_offset + ((k - 1) * prog_spacing) -- 190
		surface.SetDrawColor(col_bg) -- 191
		surface.DrawRect(x, y, prog_width, prog_height) -- 192
		surface.SetDrawColor(col_fg) -- 193
		surface.DrawRect(x + 1, y + 1, (prog_width - 2) * data.Fraction, prog_height - 2) -- 194
		local desp = lp:GetDespair() * 0.01 -- 195
		local ct = CurTime() -- 196
		local font = "Spleen_Label" -- 197
		local txt = data.Name or "Uhh..." -- 198
		local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil) -- 199
		txt_obj:Draw(sw * 0.5, y + prog_height - back, .23 + math.abs(math.sin(ct * .5) * .38), TEXT_ALIGN_CENTER) -- 200
	end -- 200
end -- 184
return hook.Add("HUDPaint", "evilrp_xhud", function() -- 202
	draw_bars() -- 203
	draw_prog() -- 204
	return -- 205
end) -- 205
