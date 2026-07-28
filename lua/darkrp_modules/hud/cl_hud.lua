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
	hunger = HUDBar((function() -- 97
		local lp = LocalPlayer() -- 98
		local jt = lp:getJobTable() -- 99
		return (function() -- 100
			local _obj_0 = jt.bar_colors -- 100
			if _obj_0 ~= nil then -- 100
				return _obj_0.hunger -- 100
			end -- 100
			return nil -- 100
		end)() or Color(0, 168, 0) -- 100
	end), (function(self) -- 100
		local lp = LocalPlayer() -- 101
		local jt = lp:getJobTable() -- 102
		if jt.no_needs then -- 103
			return -- 103
		end -- 103
		if lp:Alive() then -- 104
			return lp:GetHunger() -- 104
		end -- 104
	end), function() -- 104
		local lp = LocalPlayer() -- 105
		local jt = lp:getJobTable() -- 106
		return (function() -- 107
			local _obj_0 = jt.bar_names -- 107
			if _obj_0 ~= nil then -- 107
				return _obj_0.hunger -- 107
			end -- 107
			return nil -- 107
		end)() or "emptiness" -- 107
	end), -- 97
	thirst = HUDBar((function() -- 108
		local lp = LocalPlayer() -- 109
		local jt = lp:getJobTable() -- 110
		return (function() -- 111
			local _obj_0 = jt.bar_colors -- 111
			if _obj_0 ~= nil then -- 111
				return _obj_0.thirst -- 111
			end -- 111
			return nil -- 111
		end)() or Color(0, 168, 168) -- 111
	end), (function(self) -- 111
		local lp = LocalPlayer() -- 112
		local jt = lp:getJobTable() -- 113
		if jt.no_needs then -- 114
			return -- 114
		end -- 114
		if lp:Alive() then -- 115
			return lp:GetThirst() -- 115
		end -- 115
	end), function() -- 115
		local lp = LocalPlayer() -- 116
		local jt = lp:getJobTable() -- 117
		return (function() -- 118
			local _obj_0 = jt.bar_names -- 118
			if _obj_0 ~= nil then -- 118
				return _obj_0.thirst -- 118
			end -- 118
			return nil -- 118
		end)() or "dryness" -- 118
	end), -- 108
	despair = HUDBar((function() -- 119
		local lp = LocalPlayer() -- 120
		local jt = lp:getJobTable() -- 121
		return (function() -- 122
			local _obj_0 = jt.bar_colors -- 122
			if _obj_0 ~= nil then -- 122
				return _obj_0.despair -- 122
			end -- 122
			return nil -- 122
		end)() or Color(168, 168, 168) -- 122
	end), (function(self) -- 122
		local lp = LocalPlayer() -- 123
		local jt = lp:getJobTable() -- 124
		if jt.no_needs then -- 125
			return -- 125
		end -- 125
		if lp:Alive() then -- 126
			return lp:GetDespair() -- 126
		end -- 126
	end), function() -- 126
		local lp = LocalPlayer() -- 127
		local jt = lp:getJobTable() -- 128
		return (function() -- 129
			local _obj_0 = jt.bar_names -- 129
			if _obj_0 ~= nil then -- 129
				return _obj_0.despair -- 129
			end -- 129
			return nil -- 129
		end)() or "sadness" -- 129
	end), -- 119
	death = HUDBar(Color(128, 128, 128), (function(self) -- 130
		local rag = LocalPlayer():Ragdoll() -- 131
		if not (rag and IsValid(rag) and rag:GetNWBool("corpse")) then -- 132
			return -- 132
		end -- 132
		local cur = CurTime() - rag:GetNWInt("decomp_start") -- 133
		local ending = rag:GetNWInt("decomp_finish") - rag:GetNWInt("decomp_start") -- 134
		return 100 - ((cur / ending) * 100) -- 135
	end), "death") -- 130
} -- 89
local draw_bars -- 138
draw_bars = function() -- 138
	local ply = LocalPlayer() -- 139
	local w = ScrW() * .5 -- 141
	local xd, yd = 5 * sin(CurTime() * 0.666), 5 * sin(CurTime() * 0.333) -- 142
	local x, y = (ScrW() / 2) - (w / 2) + (2 * xd), 12 + yd -- 143
	local _exp_0 = ply:Team() -- 145
	if TEAM_GHOST == _exp_0 then -- 146
	else -- 149
		if ply:Alive() then -- 149
			if ply:HasOddity(ODDITY_ANASOGONSIA) then -- 150
				local desp = ply:GetDespair() * 0.01 -- 151
				local ct = CurTime() -- 152
				local font = "Spleen_Label" -- 153
				local txt = "i don't know" -- 154
				local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil) -- 155
				return txt_obj:Draw(x + (w / 2), y - 2, .23 + math.abs(math.sin(ct * .5) * .38), TEXT_ALIGN_CENTER) -- 156
			else -- 158
				if bars.health:render(x, y, w) then -- 158
					y = y + 24 -- 158
				end -- 158
				if bars.hunger:render(x, y, w) then -- 159
					y = y + 24 -- 159
				end -- 159
				if bars.thirst:render(x, y, w) then -- 160
					y = y + 24 -- 160
				end -- 160
				if bars.despair:render(x, y, w) then -- 161
					y = y + 24 -- 161
				end -- 161
			end -- 150
		else -- 163
			return bars.death:render(x, y, w) -- 163
		end -- 149
	end -- 163
end -- 138
local prog_width = 400 -- 166
local prog_height = 40 -- 167
local prog_spacing = 60 -- 168
local prog_offset = 40 -- 169
local col_bg = Color(64, 64, 64, 200) -- 171
local col_fg = Color(168, 0, 0) -- 172
local col_tx = color_white -- 173
local back = surface.GetFontHeight("Spleen_Label") * 1.25 -- 175
local draw_prog -- 177
draw_prog = function() -- 177
	local sw = ScrW() -- 178
	local sh = ScrH() -- 179
	local w = prog_width * 0.5 -- 180
	for k, data in ipairs(progress.Active) do -- 181
		local x = (sw * 0.5) - w -- 182
		local y = (sh * 0.5) + prog_offset + ((k - 1) * prog_spacing) -- 183
		surface.SetDrawColor(col_bg) -- 184
		surface.DrawRect(x, y, prog_width, prog_height) -- 185
		surface.SetDrawColor(col_fg) -- 186
		surface.DrawRect(x + 1, y + 1, (prog_width - 2) * data.Fraction, prog_height - 2) -- 187
		local desp = lp:GetDespair() * 0.01 -- 188
		local ct = CurTime() -- 189
		local font = "Spleen_Label" -- 190
		local txt = data.Name or "Uhh..." -- 191
		local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil) -- 192
		txt_obj:Draw(sw * 0.5, y + prog_height - back, .23 + math.abs(math.sin(ct * .5) * .38), TEXT_ALIGN_CENTER) -- 193
	end -- 193
end -- 177
return hook.Add("HUDPaint", "evilrp_xhud", function() -- 195
	draw_bars() -- 196
	draw_prog() -- 197
	return -- 198
end) -- 198
