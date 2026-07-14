GAMEMODE.action_menu = {
	on = false,
	target = nil,
	where = Vector(0, 0, 0),
	options = { },
	create_time = 0,
	choice_idx = -1,
	cursor = true,
	width = 0
}
local get_intrinsic_actions
get_intrinsic_actions = function()
	local actions = { }
	local wep = lp:GetActiveWeapon()
	if wep:IsValid() and wep:GetModel() ~= "" then
		actions[#actions + 1] = {
			desc = "Drop " .. tostring(wep.PrintName),
			func = (function()
				return netstream.Send("DropWeapon")
			end)
		}
	end
	actions[#actions + 1] = {
		desc = "Payment",
		func = (function()
			return netstream.Send("BeginPaying")
		end)
	}
	return actions
end
local render_action_menu
render_action_menu = function()
	local menu = GAMEMODE.action_menu
	if not (menu.on and menu.where) then
		return
	end
	local dist = lp:EyePos():DistToSqr(menu.where)
	if not (dist <= 120 ^ 2) then
		GAMEMODE:CloseActionMenu()
		return
	end
	local target = menu.target
	local actions = { }
	if target and IsValid(target) and target.Interactions then
		actions = target.Interactions
		if isfunction(actions) then
			actions = actions(target, lp)
		end
	end
	if #actions <= 0 then
		actions = get_intrinsic_actions()
	end
	menu.options = actions
	surface.SetFont("Spleen_Label")
	local _list_0 = menu.options
	for _index_0 = 1, #_list_0 do
		local o = _list_0[_index_0]
		local width = surface.GetTextSize(o.desc)
		if (width + 10) > menu.width then
			menu.width = width + 10
		end
	end
	if #menu.options == 0 then
		GAMEMODE:CloseActionMenu()
	end
	local mx = ScrW() / 2
	local my = ScrH() / 2
	local ct = CurTime()
	local a = 255 * (1 - (dist / 120 ^ 2))
	local orix
	local oriy
	local w
	local h
	local where = menu.where
	local vec = where:ToScreen()
	orix = vec.x - (menu.width / 2)
	oriy = vec.y - 16
	w = 150
	h = 30 + (#menu.options * 30)
	local font = "Spleen_Label"
	draw.RoundedBox(4, orix, oriy, menu.width, h, Color(60, 60, 60, math.Clamp(a, 0, 180)))
	local txt_obj = scribe.Parse("<f=" .. tostring(font) .. "><ol=2>Actions", menu.width)
	local txt_h = txt_obj:GetTall()
	txt_obj:Draw(orix + (menu.width / 2), vec.y - txt_h / 2, a / 255, TEXT_ALIGN_CENTER)
	local chose = false
	for n = 1, #menu.options do
		local o = menu.options[n]
		local desc = o.desc
		local curx = orix + 5
		local cury = oriy + 30 + (30 * (n - 1))
		local curw = 142
		local curh = 25
		local color = Color(0, 0, 0, math.Clamp(a, 0, 180))
		if (my >= cury) and (my <= cury + curh) then
			if (mx >= curx) and (mx <= curx + curw) then
				color = Color(0, 0, 150, math.Clamp(a, 0, 180))
				menu.choice_idx = n
				chose = true
			end
		end
		draw.RoundedBox(4, curx, cury, menu.width - 10, curh, color)
		draw.DrawText(desc, "Spleen_Label", orix + 6, oriy + 30 + (30 * (n - 1)), Color(255, 255, 255, a))
	end
	if not chose then
		menu.choice_idx = -1
	end
	menu.cursor = false
	if (my >= oriy) and (my <= oriy + h) then
		if (mx >= orix) and (mx <= orix + w) then
			menu.cursor = true
		end
	end
end
hook.Add("HUDPaint", "evilrp_action_menu", render_action_menu)
GAMEMODE.OpenActionMenu = function(self, pos, ent)
	local menu = self.action_menu
	if menu.on and menu.cursor then
		return self:CloseActionMenu()
	end
	menu.where = pos
	surface.SetFont("Spleen_Label")
	local width = surface.GetTextSize("Actions")
	menu.width = width + 10
	local alpha = 0
	menu.on = true
	menu.closing = false
	if ent and IsValid(ent) then
		menu.target = ent
	else
		menu.target = nil
	end
end
GAMEMODE.CloseActionMenu = function(self)
	local menu = self.action_menu
	menu.closing = true
	menu.on = false
	menu.choice_idx = -1
end
local action_menu_usage
action_menu_usage = function(ply, bind, pressed)
	local menu = GAMEMODE.action_menu
	if menu.on and menu.cursor then
		local target = menu.target
		local actions = { }
		if target and IsValid(target) and target.Interactions then
			actions = target.Interactions
			if isfunction(actions) then
				actions = actions(target, lp)
			end
		end
		if #actions > 0 then
			do
				local _tab_0 = { }
				local _idx_0 = 1
				for _key_0, _value_0 in pairs(actions) do
					if _idx_0 == _key_0 then
						_tab_0[#_tab_0 + 1] = _value_0
						_idx_0 = _idx_0 + 1
					else
						_tab_0[_key_0] = _value_0
					end
				end
				local _obj_0 = get_intrinsic_actions()
				local _idx_1 = 1
				for _key_0, _value_0 in pairs(_obj_0) do
					if _idx_1 == _key_0 then
						_tab_0[#_tab_0 + 1] = _value_0
						_idx_1 = _idx_1 + 1
					else
						_tab_0[_key_0] = _value_0
					end
				end
				actions = _tab_0
			end
		else
			actions = get_intrinsic_actions()
		end
		if bind:find("+attack") and menu.choice_idx > 0 then
			actions[menu.choice_idx].func(ply)
			GAMEMODE:CloseActionMenu()
			return true
		end
	end
	return
end
hook.Add("PlayerBindPress", "evilrp_action_menu", action_menu_usage)
local open_action_menu
open_action_menu = function(ply, bind, down)
	return
end
return hook.Add("PlayerBindPress", "evilrp_open_action_menu", open_action_menu)
