-- [yue]: darkrp_modules\actionmenu\cl_actionmenu.yue
GAMEMODE.action_menu = { -- 5
	on = false, -- 5
	target = nil, -- 6
	where = Vector(0, 0, 0), -- 7
	options = { }, -- 8
	create_time = 0, -- 10
	choice_idx = -1, -- 11
	cursor = true, -- 13
	width = 0 -- 15
} -- 4
local get_intrinsic_actions -- 18
get_intrinsic_actions = function() -- 18
	local actions = { } -- 19
	local wep = lp:GetActiveWeapon() -- 20
	if wep:IsValid() and wep:GetModel() ~= "" then -- 21
		actions[#actions + 1] = { -- 22
			desc = "Drop " .. tostring(wep.PrintName), -- 22
			func = (function() -- 22
				return netstream.Send("DropWeapon") -- 22
			end) -- 22
		} -- 22
	end -- 21
	actions[#actions + 1] = { -- 23
		desc = "Payment", -- 23
		func = (function() -- 23
			return netstream.Send("BeginPaying") -- 23
		end) -- 23
	} -- 23
	if lp:CanBuild() then -- 24
		actions[#actions + 1] = { -- 25
			desc = "Build", -- 25
			func = (function() -- 25
				return netstream.Send("BeginBuild") -- 25
			end) -- 25
		} -- 25
	end -- 24
	if lp:CanSell() then -- 26
		actions[#actions + 1] = { -- 27
			desc = "Sell", -- 27
			func = (function() -- 27
				return netstream.Send("BeginSelling") -- 27
			end) -- 27
		} -- 27
	end -- 26
	return actions -- 28
end -- 18
local render_action_menu -- 30
render_action_menu = function() -- 30
	local menu = GAMEMODE.action_menu -- 31
	if not (menu.on and menu.where) then -- 32
		return -- 32
	end -- 32
	local dist = lp:EyePos():DistToSqr(menu.where) -- 33
	if not (dist <= 120 ^ 2) then -- 34
		GAMEMODE:CloseActionMenu() -- 35
		return -- 36
	end -- 34
	local target = menu.target -- 37
	local actions = { } -- 38
	if target and IsValid(target) and target.Interactions then -- 39
		actions = target.Interactions -- 40
		if isfunction(actions) then -- 41
			actions = actions(target, lp) -- 41
		end -- 41
	end -- 39
	if #actions <= 0 then -- 42
		actions = get_intrinsic_actions() -- 43
	end -- 42
	menu.options = actions -- 44
	surface.SetFont("Spleen_Label") -- 45
	local _list_0 = menu.options -- 46
	for _index_0 = 1, #_list_0 do -- 46
		local o = _list_0[_index_0] -- 46
		local width = surface.GetTextSize(o.desc) -- 47
		if (width + 10) > menu.width then -- 48
			menu.width = width + 10 -- 48
		end -- 48
	end -- 48
	if #menu.options == 0 then -- 49
		GAMEMODE:CloseActionMenu() -- 49
	end -- 49
	local mx = ScrW() / 2 -- 51
	local my = ScrH() / 2 -- 52
	local ct = CurTime() -- 53
	local a = 255 * (1 - (dist / 120 ^ 2)) -- 55
	local orix -- 57
	local oriy -- 58
	local w -- 59
	local h -- 60
	local where = menu.where -- 62
	local vec = where:ToScreen() -- 63
	orix = vec.x - (menu.width / 2) -- 64
	oriy = vec.y - 16 -- 65
	w = 150 -- 67
	h = 30 + (#menu.options * 30) -- 68
	local font = "Spleen_Label" -- 70
	draw.RoundedBox(4, orix, oriy, menu.width, h, Color(60, 60, 60, math.Clamp(a, 0, 180))) -- 72
	local txt_obj = scribe.Parse("<f=" .. tostring(font) .. "><ol=2>Actions", menu.width) -- 74
	local txt_h = txt_obj:GetTall() -- 75
	txt_obj:Draw(orix + (menu.width / 2), vec.y - txt_h / 2, a / 255, TEXT_ALIGN_CENTER) -- 76
	local chose = false -- 79
	for n = 1, #menu.options do -- 81
		local o = menu.options[n] -- 82
		local desc = o.desc -- 83
		local curx = orix + 5 -- 84
		local cury = oriy + 30 + (30 * (n - 1)) -- 85
		local curw = 142 -- 86
		local curh = 25 -- 87
		local color = Color(0, 0, 0, math.Clamp(a, 0, 180)) -- 89
		if (my >= cury) and (my <= cury + curh) then -- 91
			if (mx >= curx) and (mx <= curx + curw) then -- 92
				color = Color(0, 0, 150, math.Clamp(a, 0, 180)) -- 93
				menu.choice_idx = n -- 94
				chose = true -- 95
			end -- 92
		end -- 91
		draw.RoundedBox(4, curx, cury, menu.width - 10, curh, color) -- 96
		draw.DrawText(desc, "Spleen_Label", orix + 6, oriy + 30 + (30 * (n - 1)), Color(255, 255, 255, a)) -- 97
	end -- 98
	if not chose then -- 99
		menu.choice_idx = -1 -- 99
	end -- 99
	menu.cursor = false -- 100
	if (my >= oriy) and (my <= oriy + h) then -- 102
		if (mx >= orix) and (mx <= orix + w) then -- 103
			menu.cursor = true -- 105
		end -- 103
	end -- 102
end -- 30
hook.Add("HUDPaint", "evilrp_action_menu", render_action_menu) -- 107
GAMEMODE.OpenActionMenu = function(self, pos, ent) -- 109
	local menu = self.action_menu -- 110
	if menu.on and menu.cursor then -- 111
		return self:CloseActionMenu() -- 112
	end -- 111
	menu.where = pos -- 113
	surface.SetFont("Spleen_Label") -- 114
	local width = surface.GetTextSize("Actions") -- 115
	menu.width = width + 10 -- 116
	local alpha = 0 -- 117
	menu.on = true -- 118
	menu.closing = false -- 119
	if ent and IsValid(ent) then -- 120
		menu.target = ent -- 121
	else -- 123
		menu.target = nil -- 123
	end -- 120
end -- 109
GAMEMODE.CloseActionMenu = function(self) -- 125
	local menu = self.action_menu -- 126
	menu.closing = true -- 127
	menu.on = false -- 128
	menu.choice_idx = -1 -- 129
end -- 125
local action_menu_usage -- 131
action_menu_usage = function(ply, bind, pressed) -- 131
	local menu = GAMEMODE.action_menu -- 132
	if menu.on and menu.cursor then -- 133
		local target = menu.target -- 134
		local actions = { } -- 135
		if target and IsValid(target) and target.Interactions then -- 136
			actions = target.Interactions -- 137
			if isfunction(actions) then -- 138
				actions = actions(target, lp) -- 138
			end -- 138
		end -- 136
		if #actions > 0 then -- 139
			do -- 140
				local _tab_0 = { } -- 140
				local _idx_0 = 1 -- 140
				for _key_0, _value_0 in pairs(actions) do -- 140
					if _idx_0 == _key_0 then -- 140
						_tab_0[#_tab_0 + 1] = _value_0 -- 140
						_idx_0 = _idx_0 + 1 -- 140
					else -- 140
						_tab_0[_key_0] = _value_0 -- 140
					end -- 140
				end -- 140
				local _obj_0 = get_intrinsic_actions() -- 140
				local _idx_1 = 1 -- 140
				for _key_0, _value_0 in pairs(_obj_0) do -- 140
					if _idx_1 == _key_0 then -- 140
						_tab_0[#_tab_0 + 1] = _value_0 -- 140
						_idx_1 = _idx_1 + 1 -- 140
					else -- 140
						_tab_0[_key_0] = _value_0 -- 140
					end -- 140
				end -- 140
				actions = _tab_0 -- 140
			end -- 140
		else -- 142
			actions = get_intrinsic_actions() -- 142
		end -- 139
		if bind:find("+attack") and menu.choice_idx > 0 then -- 143
			actions[menu.choice_idx].func(ply) -- 144
			GAMEMODE:CloseActionMenu() -- 145
			return true -- 146
		end -- 143
	end -- 133
	return -- 147
end -- 131
hook.Add("PlayerBindPress", "evilrp_action_menu", action_menu_usage) -- 149
local open_action_menu -- 151
open_action_menu = function(ply, bind, down) -- 151
	return -- 156
end -- 151
return hook.Add("PlayerBindPress", "evilrp_open_action_menu", open_action_menu) -- 158
