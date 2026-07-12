-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/actionmenu/cl_actionmenu.yue
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
	return actions -- 24
end -- 18
local render_action_menu -- 26
render_action_menu = function() -- 26
	local menu = GAMEMODE.action_menu -- 27
	if not (menu.on and menu.where) then -- 28
		return -- 28
	end -- 28
	local dist = lp:EyePos():DistToSqr(menu.where) -- 29
	if not (dist <= 120 ^ 2) then -- 30
		GAMEMODE:CloseActionMenu() -- 31
		return -- 32
	end -- 30
	local target = menu.target -- 33
	local actions = { } -- 34
	if target and IsValid(target) and target.Interactions then -- 35
		actions = target.Interactions -- 36
		if isfunction(actions) then -- 37
			actions = actions(target, lp) -- 37
		end -- 37
	end -- 35
	if #actions <= 0 then -- 38
		actions = get_intrinsic_actions() -- 39
	end -- 38
	menu.options = actions -- 40
	surface.SetFont("Spleen_Label") -- 41
	local _list_0 = menu.options -- 42
	for _index_0 = 1, #_list_0 do -- 42
		local o = _list_0[_index_0] -- 42
		local width = surface.GetTextSize(o.desc) -- 43
		if (width + 10) > menu.width then -- 44
			menu.width = width + 10 -- 44
		end -- 44
	end -- 44
	if #menu.options == 0 then -- 45
		GAMEMODE:CloseActionMenu() -- 45
	end -- 45
	local mx = ScrW() / 2 -- 47
	local my = ScrH() / 2 -- 48
	local ct = CurTime() -- 49
	local a = 255 * (1 - (dist / 120 ^ 2)) -- 51
	local orix -- 53
	local oriy -- 54
	local w -- 55
	local h -- 56
	local where = menu.where -- 58
	local vec = where:ToScreen() -- 59
	orix = vec.x - (menu.width / 2) -- 60
	oriy = vec.y - 16 -- 61
	w = 150 -- 63
	h = 30 + (#menu.options * 30) -- 64
	local font = "Spleen_Label" -- 66
	draw.RoundedBox(4, orix, oriy, menu.width, h, Color(60, 60, 60, math.Clamp(a, 0, 180))) -- 68
	local txt_obj = scribe.Parse("<f=" .. tostring(font) .. "><ol=2>Actions", menu.width) -- 70
	local txt_h = txt_obj:GetTall() -- 71
	txt_obj:Draw(orix + (menu.width / 2), vec.y - txt_h / 2, a / 255, TEXT_ALIGN_CENTER) -- 72
	local chose = false -- 75
	for n = 1, #menu.options do -- 77
		local o = menu.options[n] -- 78
		local desc = o.desc -- 79
		local curx = orix + 5 -- 80
		local cury = oriy + 30 + (30 * (n - 1)) -- 81
		local curw = 142 -- 82
		local curh = 25 -- 83
		local color = Color(0, 0, 0, math.Clamp(a, 0, 180)) -- 85
		if (my >= cury) and (my <= cury + curh) then -- 87
			if (mx >= curx) and (mx <= curx + curw) then -- 88
				color = Color(0, 0, 150, math.Clamp(a, 0, 180)) -- 89
				menu.choice_idx = n -- 90
				chose = true -- 91
			end -- 88
		end -- 87
		draw.RoundedBox(4, curx, cury, menu.width - 10, curh, color) -- 92
		draw.DrawText(desc, "Spleen_Label", orix + 6, oriy + 30 + (30 * (n - 1)), Color(255, 255, 255, a)) -- 93
	end -- 94
	if not chose then -- 95
		menu.choice_idx = -1 -- 95
	end -- 95
	menu.cursor = false -- 96
	if (my >= oriy) and (my <= oriy + h) then -- 98
		if (mx >= orix) and (mx <= orix + w) then -- 99
			menu.cursor = true -- 101
		end -- 99
	end -- 98
end -- 26
hook.Add("HUDPaint", "evilrp_action_menu", render_action_menu) -- 103
GAMEMODE.OpenActionMenu = function(self, pos, ent) -- 105
	local menu = self.action_menu -- 106
	if menu.on and menu.cursor then -- 107
		return self:CloseActionMenu() -- 108
	end -- 107
	menu.where = pos -- 109
	surface.SetFont("Spleen_Label") -- 110
	local width = surface.GetTextSize("Actions") -- 111
	menu.width = width + 10 -- 112
	local alpha = 0 -- 113
	menu.on = true -- 114
	menu.closing = false -- 115
	if ent and IsValid(ent) then -- 116
		menu.target = ent -- 117
	else -- 119
		menu.target = nil -- 119
	end -- 116
end -- 105
GAMEMODE.CloseActionMenu = function(self) -- 121
	local menu = self.action_menu -- 122
	menu.closing = true -- 123
	menu.on = false -- 124
	menu.choice_idx = -1 -- 125
end -- 121
local action_menu_usage -- 127
action_menu_usage = function(ply, bind, pressed) -- 127
	local menu = GAMEMODE.action_menu -- 128
	if menu.on and menu.cursor then -- 129
		local target = menu.target -- 130
		local actions = { } -- 131
		if target and IsValid(target) and target.Interactions then -- 132
			actions = target.Interactions -- 133
			if isfunction(actions) then -- 134
				actions = actions(target, lp) -- 134
			end -- 134
		end -- 132
		if #actions > 0 then -- 135
			local _tab_0 = { } -- 136
			local _idx_0 = 1 -- 136
			for _key_0, _value_0 in pairs(actions) do -- 136
				if _idx_0 == _key_0 then -- 136
					_tab_0[#_tab_0 + 1] = _value_0 -- 136
					_idx_0 = _idx_0 + 1 -- 136
				else -- 136
					_tab_0[_key_0] = _value_0 -- 136
				end -- 136
			end -- 136
			local _obj_0 = get_intrinsic_actions() -- 136
			local _idx_1 = 1 -- 136
			for _key_0, _value_0 in pairs(_obj_0) do -- 136
				if _idx_1 == _key_0 then -- 136
					_tab_0[#_tab_0 + 1] = _value_0 -- 136
					_idx_1 = _idx_1 + 1 -- 136
				else -- 136
					_tab_0[_key_0] = _value_0 -- 136
				end -- 136
			end -- 136
			actions = _tab_0 -- 136
		else -- 138
			actions = get_intrinsic_actions() -- 138
		end -- 135
		if bind:find("+attack") and menu.choice_idx > 0 then -- 139
			actions[menu.choice_idx].func(ply) -- 140
			GAMEMODE:CloseActionMenu() -- 141
			return true -- 142
		end -- 139
	end -- 129
	return -- 143
end -- 127
hook.Add("PlayerBindPress", "evilrp_action_menu", action_menu_usage) -- 145
local open_action_menu -- 147
open_action_menu = function(ply, bind, down) -- 147
	return -- 152
end -- 147
return hook.Add("PlayerBindPress", "evilrp_open_action_menu", open_action_menu) -- 154
