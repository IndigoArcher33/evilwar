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
	return actions -- 26
end -- 18
local render_action_menu -- 28
render_action_menu = function() -- 28
	local menu = GAMEMODE.action_menu -- 29
	if not (menu.on and menu.where) then -- 30
		return -- 30
	end -- 30
	local dist = lp:EyePos():DistToSqr(menu.where) -- 31
	if not (dist <= 120 ^ 2) then -- 32
		GAMEMODE:CloseActionMenu() -- 33
		return -- 34
	end -- 32
	local target = menu.target -- 35
	local actions = { } -- 36
	if target and IsValid(target) and target.Interactions then -- 37
		actions = target.Interactions -- 38
		if isfunction(actions) then -- 39
			actions = actions(target, lp) -- 39
		end -- 39
	end -- 37
	if #actions <= 0 then -- 40
		actions = get_intrinsic_actions() -- 41
	end -- 40
	menu.options = actions -- 42
	surface.SetFont("Spleen_Label") -- 43
	local _list_0 = menu.options -- 44
	for _index_0 = 1, #_list_0 do -- 44
		local o = _list_0[_index_0] -- 44
		local width = surface.GetTextSize(o.desc) -- 45
		if (width + 10) > menu.width then -- 46
			menu.width = width + 10 -- 46
		end -- 46
	end -- 46
	if #menu.options == 0 then -- 47
		GAMEMODE:CloseActionMenu() -- 47
	end -- 47
	local mx = ScrW() / 2 -- 49
	local my = ScrH() / 2 -- 50
	local ct = CurTime() -- 51
	local a = 255 * (1 - (dist / 120 ^ 2)) -- 53
	local orix -- 55
	local oriy -- 56
	local w -- 57
	local h -- 58
	local where = menu.where -- 60
	local vec = where:ToScreen() -- 61
	orix = vec.x - (menu.width / 2) -- 62
	oriy = vec.y - 16 -- 63
	w = 150 -- 65
	h = 30 + (#menu.options * 30) -- 66
	local font = "Spleen_Label" -- 68
	draw.RoundedBox(4, orix, oriy, menu.width, h, Color(60, 60, 60, math.Clamp(a, 0, 180))) -- 70
	local txt_obj = scribe.Parse("<f=" .. tostring(font) .. "><ol=2>Actions", menu.width) -- 72
	local txt_h = txt_obj:GetTall() -- 73
	txt_obj:Draw(orix + (menu.width / 2), vec.y - txt_h / 2, a / 255, TEXT_ALIGN_CENTER) -- 74
	local chose = false -- 77
	for n = 1, #menu.options do -- 79
		local o = menu.options[n] -- 80
		local desc = o.desc -- 81
		local curx = orix + 5 -- 82
		local cury = oriy + 30 + (30 * (n - 1)) -- 83
		local curw = 142 -- 84
		local curh = 25 -- 85
		local color = Color(0, 0, 0, math.Clamp(a, 0, 180)) -- 87
		if (my >= cury) and (my <= cury + curh) then -- 89
			if (mx >= curx) and (mx <= curx + curw) then -- 90
				color = Color(0, 0, 150, math.Clamp(a, 0, 180)) -- 91
				menu.choice_idx = n -- 92
				chose = true -- 93
			end -- 90
		end -- 89
		draw.RoundedBox(4, curx, cury, menu.width - 10, curh, color) -- 94
		draw.DrawText(desc, "Spleen_Label", orix + 6, oriy + 30 + (30 * (n - 1)), Color(255, 255, 255, a)) -- 95
	end -- 96
	if not chose then -- 97
		menu.choice_idx = -1 -- 97
	end -- 97
	menu.cursor = false -- 98
	if (my >= oriy) and (my <= oriy + h) then -- 100
		if (mx >= orix) and (mx <= orix + w) then -- 101
			menu.cursor = true -- 103
		end -- 101
	end -- 100
end -- 28
hook.Add("HUDPaint", "evilrp_action_menu", render_action_menu) -- 105
GAMEMODE.OpenActionMenu = function(self, pos, ent) -- 107
	local menu = self.action_menu -- 108
	if menu.on and menu.cursor then -- 109
		return self:CloseActionMenu() -- 110
	end -- 109
	menu.where = pos -- 111
	surface.SetFont("Spleen_Label") -- 112
	local width = surface.GetTextSize("Actions") -- 113
	menu.width = width + 10 -- 114
	local alpha = 0 -- 115
	menu.on = true -- 116
	menu.closing = false -- 117
	if ent and IsValid(ent) then -- 118
		menu.target = ent -- 119
	else -- 121
		menu.target = nil -- 121
	end -- 118
end -- 107
GAMEMODE.CloseActionMenu = function(self) -- 123
	local menu = self.action_menu -- 124
	menu.closing = true -- 125
	menu.on = false -- 126
	menu.choice_idx = -1 -- 127
end -- 123
local action_menu_usage -- 129
action_menu_usage = function(ply, bind, pressed) -- 129
	local menu = GAMEMODE.action_menu -- 130
	if menu.on and menu.cursor then -- 131
		local target = menu.target -- 132
		local actions = { } -- 133
		if target and IsValid(target) and target.Interactions then -- 134
			actions = target.Interactions -- 135
			if isfunction(actions) then -- 136
				actions = actions(target, lp) -- 136
			end -- 136
		end -- 134
		if #actions > 0 then -- 137
			do -- 138
				local _tab_0 = { } -- 138
				local _idx_0 = 1 -- 138
				for _key_0, _value_0 in pairs(actions) do -- 138
					if _idx_0 == _key_0 then -- 138
						_tab_0[#_tab_0 + 1] = _value_0 -- 138
						_idx_0 = _idx_0 + 1 -- 138
					else -- 138
						_tab_0[_key_0] = _value_0 -- 138
					end -- 138
				end -- 138
				local _obj_0 = get_intrinsic_actions() -- 138
				local _idx_1 = 1 -- 138
				for _key_0, _value_0 in pairs(_obj_0) do -- 138
					if _idx_1 == _key_0 then -- 138
						_tab_0[#_tab_0 + 1] = _value_0 -- 138
						_idx_1 = _idx_1 + 1 -- 138
					else -- 138
						_tab_0[_key_0] = _value_0 -- 138
					end -- 138
				end -- 138
				actions = _tab_0 -- 138
			end -- 138
		else -- 140
			actions = get_intrinsic_actions() -- 140
		end -- 137
		if bind:find("+attack") and menu.choice_idx > 0 then -- 141
			actions[menu.choice_idx].func(ply) -- 142
			GAMEMODE:CloseActionMenu() -- 143
			return true -- 144
		end -- 141
	end -- 131
	return -- 145
end -- 129
hook.Add("PlayerBindPress", "evilrp_action_menu", action_menu_usage) -- 147
local open_action_menu -- 149
open_action_menu = function(ply, bind, down) -- 149
	return -- 154
end -- 149
return hook.Add("PlayerBindPress", "evilrp_open_action_menu", open_action_menu) -- 156
