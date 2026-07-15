-- [yue]: darkrp_modules\weaponselect\cl_weaponselect.yue
hook.Add("HUDShouldDraw", "evilrp_weapon_select", function(name) -- 4
	if name == "CHudWeaponSelection" then -- 5
		return false -- 5
	end -- 5
	return -- 6
end) -- 4
local index = 1 -- 8
local delta_index = index -- 9
local info_alpha = 0 -- 10
local alpha = 0 -- 11
local alpha_delta = alpha -- 12
local fade_time = 0 -- 13
local matrix_scale = Vector(1, 1, 0) -- 14
local names = { -- 17
	["#gmod_tool"] = "Hexengland", -- 17
	["#GMOD_Physgun"] = "Telegland" -- 18
} -- 16
hook.Add("HUDPaint", "evilrp_weapon_select", function() -- 21
	local ft = FrameTime() -- 22
	local ct = CurTime() -- 23
	alpha_delta = Lerp(ft * 10, alpha_delta, alpha) -- 24
	local fraction = alpha_delta -- 25
	if fraction > .01 then -- 26
		local spacing = math.pi * .85 -- 27
		local radius = 240 * alpha_delta -- 28
		local shift_x = ScrW() * .02 -- 29
		delta_index = Lerp(ft * 12, delta_index, index) -- 30
		local paying = lp:GetNWBool("evilrp_paying") -- 31
		if paying then -- 32
			local amount = lp.payment_amount or 0 -- 33
			local index_local = delta_index -- 34
			local money = lp:getDarkRPVar("money") -- 35
			if not (amount < money) then -- 36
				index = money -- 36
			end -- 36
			local remaining = math.min(amount + 10, money - amount) -- 37
			local _, ty = surface.GetTextSize(tostring(amount)) -- 38
			local desp = lp:GetDespair() * 0.01 -- 39
			local font = "Spleen_Label" -- 40
			local txt = amount -- 42
			if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then -- 43
				txt = "<c=0," .. tostring(180 + math.sin(CurTime()) * 30) .. ",0>" .. tostring(txt) -- 43
			end -- 43
			local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil) -- 44
			local txt_w = txt_obj:GetWide() -- 45
			local txt_h = txt_obj:GetTall() -- 46
			local last_y = (txt_h) * fraction -- 47
			local p = lp:GetEyeTrace().HitPos:ToScreen() -- 48
			ct = CurTime() -- 49
			local x = p.x -- 50
			x = x + math.cos(ct * 0.75) -- 51
			local y = ScrH() * .7 -- 52
			y = y + math.sin(ct * 0.95) -- 53
			txt_obj:Draw(x, y, alpha_delta, TEXT_ALIGN_CENTER) -- 54
		else -- 56
			local x = ScrW() * .3 -- 56
			local y = ScrH() * .5 -- 57
			local weapons = lp:GetWeapons() -- 58
			local index_local = delta_index -- 59
			if not weapons[index] then -- 60
				index = #weapons -- 60
			end -- 60
			for i = 1, #weapons do -- 61
				local theta = (i - index_local) * .1 -- 62
				local name = weapons[i]:GetPrintName() -- 63
				if names[name] then -- 64
					name = names[name] -- 64
				end -- 64
				local _, ty = surface.GetTextSize(name) -- 65
				local scale = 1 - math.abs(theta * 2) -- 66
				local matrix = Matrix() -- 67
				local desp = lp:GetDespair() * 0.01 -- 68
				local font = "Spleen_Label" -- 69
				local txt = name -- 71
				if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then -- 72
					txt = "<rgb=1,1," .. tostring(i == index and 60 or 30) .. ">" .. tostring(txt) -- 72
				end -- 72
				local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp * (theta * 2)) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp + (i == index and 10 or 3)) .. "," .. tostring(0.38 * desp + (i == index and 3 or 1.23)) .. ",2><ol=2>" .. tostring(txt), nil) -- 73
				local txt_w = txt_obj:GetWide() -- 74
				local txt_h = txt_obj:GetTall() -- 75
				local last_y = (txt_h) * fraction -- 76
				local translator = Vector(shift_x + x + math.cos(theta * spacing + math.pi) * radius + radius, y + last_y + math.sin(theta * spacing + math.pi) * radius - ty / 2, 1) -- 78
				matrix:Translate(translator) -- 83
				matrix:Scale(matrix_scale * scale) -- 84
				cam.PushModelMatrix(matrix) -- 85
				txt_obj:Draw(64, 0, alpha_delta, TEXT_ALIGN_LEFT) -- 86
				cam.PopModelMatrix() -- 87
			end -- 87
			if fade_time < ct and alpha > 0 then -- 88
				alpha = 0 -- 88
			end -- 88
		end -- 32
	end -- 26
	return -- 89
end) -- 21
local on_index_changed -- 91
on_index_changed = function(weapon) -- 91
	alpha = 1 -- 92
	fade_time = CurTime() + 5 -- 93
	return lp:EmitSound("common/talk.wav", 50, 180) -- 94
end -- 91
hook.Add("PlayerBindPress", "evilrp_weapon_select", function(ply, bind, pressed) -- 96
	bind = bind:lower() -- 97
	if ply:Fallen() then -- 98
		return -- 98
	end -- 98
	if not pressed then -- 99
		return -- 99
	end -- 99
	if not bind:find("invprev") and not bind:find("invnext") and not bind:find("slot") and not bind:find("attack") then -- 100
		return -- 100
	end -- 100
	local cur_wep = ply:GetActiveWeapon() -- 101
	local valid = IsValid(cur_wep) -- 102
	local wep_cls = valid and cur_wep:GetClass() or nil -- 103
	local btool -- 104
	local paying -- 105
	if ply:InVehicle() then -- 106
		return -- 106
	end -- 106
	if valid and wep_cls == "weapon_physgun" and ply:KeyDown(IN_ATTACK) then -- 107
		return -- 107
	end -- 107
	paying = ply:GetNWBool("evilrp_paying") -- 108
	if valid then -- 109
		if "gmod_tool" == wep_cls then -- 111
			local tool = ply:GetTool() -- 112
			btool = tool and (tool.Scroll ~= nil) -- 113
		end -- 113
	end -- 109
	if paying then -- 114
		ply.payment_amount = ply.payment_amount or 0 -- 115
		local shift = ply:KeyDown(IN_SPEED) -- 116
		if bind:find("invprev") then -- 117
			ply.payment_amount = ply.payment_amount - (shift and 5 or 1) -- 118
		elseif bind:find("invnext") then -- 119
			ply.payment_amount = ply.payment_amount + (shift and 5 or 1) -- 120
		end -- 117
		ply.payment_amount = math.min(ply:getDarkRPVar("money"), math.max(ply.payment_amount, 0)) -- 121
		local old_index = index -- 122
		index = ply.payment_amount -- 123
		on_index_changed() -- 124
		return -- 125
	end -- 114
	local weapons = ply:GetWeapons() -- 126
	if bind:find("invprev") and not btool then -- 127
		local old_index = index -- 128
		index = math.min(index + 1, #weapons) -- 129
		if (alpha == 0 or old_index ~= index) then -- 130
			on_index_changed(weapons[index]) -- 130
		end -- 130
		return true -- 131
	elseif bind:find("invnext") and not btool then -- 132
		local old_index = index -- 133
		index = math.max(index - 1, 1) -- 134
		if (alpha == 0 or old_index ~= index) then -- 135
			on_index_changed(weapons[index]) -- 135
		end -- 135
		return true -- 136
	elseif bind:find("slot") then -- 137
		index = math.Clamp(tonumber(bind:match("slot(%d)")) or 1, 1, #weapons) -- 138
		on_index_changed(weapons[index]) -- 139
		return true -- 140
	elseif bind:find("attack") and alpha > 0 then -- 141
		local weapon = weapons[index] -- 142
		if IsValid(weapon) then -- 143
			lp:EmitSound("HL2Player.Use") -- 144
			input.SelectWeapon(weapon) -- 145
			alpha = 0 -- 146
		end -- 143
		return true -- 147
	end -- 127
	return -- 148
end) -- 96
local was_paying -- 150
return hook.Add("Think", "evilrp_weapon_select", function() -- 152
	if (not IsValid(lp) or not lp:Alive()) then -- 153
		alpha = 0 -- 153
	end -- 153
	was_paying = was_paying or lp:GetNWBool("evilrp_paying") -- 154
	if was_paying and not lp:GetNWBool("evilrp_paying") then -- 155
		was_paying = false -- 156
		index = 0 -- 157
		delta_index = 0 -- 158
		alpha_delta = 0 -- 159
		alpha = 0 -- 160
	end -- 155
	return -- 161
end) -- 161
