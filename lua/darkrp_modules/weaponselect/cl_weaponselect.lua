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
		local selling = lp:GetNWBool("evilrp_selling") -- 32
		if paying then -- 33
			local amount = lp.payment_amount or 0 -- 34
			local index_local = delta_index -- 35
			local money = lp:getDarkRPVar("money") -- 36
			if not (amount < money) then -- 37
				index = money -- 37
			end -- 37
			local remaining = math.min(amount + 10, money - amount) -- 38
			local _, ty = surface.GetTextSize(tostring(amount)) -- 39
			local desp = lp:GetDespair() * 0.01 -- 40
			local font = "Spleen_Label" -- 41
			local txt = amount -- 43
			if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then -- 44
				txt = "<c=0," .. tostring(180 + math.sin(CurTime()) * 30) .. ",0>" .. tostring(txt) -- 44
			end -- 44
			local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil) -- 45
			local txt_w = txt_obj:GetWide() -- 46
			local txt_h = txt_obj:GetTall() -- 47
			local last_y = (txt_h) * fraction -- 48
			local p = lp:GetEyeTrace().HitPos:ToScreen() -- 49
			ct = CurTime() -- 50
			local x = p.x -- 51
			x = x + math.cos(ct * 0.75) -- 52
			local y = ScrH() * .7 -- 53
			y = y + math.sin(ct * 0.95) -- 54
			txt_obj:Draw(x, y, alpha_delta, TEXT_ALIGN_CENTER) -- 55
		else -- 56
			if selling then -- 56
				local amount = lp.sellable_price or 0 -- 57
				local index_local = delta_index -- 58
				local money = lp:getDarkRPVar("money") -- 59
				if not (amount > 0) then -- 60
					index = money -- 60
				end -- 60
				local remaining = math.min(amount + 10, money - amount) -- 61
				local _, ty = surface.GetTextSize(tostring(amount)) -- 62
				local desp = lp:GetDespair() * 0.01 -- 63
				local font = "Spleen_Label" -- 64
				local txt = amount -- 66
				if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then -- 67
					txt = "<c=0," .. tostring(180 + math.sin(CurTime()) * 30) .. ",0>" .. tostring(txt) -- 67
				end -- 67
				local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil) -- 68
				local txt_w = txt_obj:GetWide() -- 69
				local txt_h = txt_obj:GetTall() -- 70
				local last_y = (txt_h) * fraction -- 71
				local p = lp:GetEyeTrace().HitPos:ToScreen() -- 72
				ct = CurTime() -- 73
				local x = p.x -- 74
				x = x + math.cos(ct * 0.75) -- 75
				local y = ScrH() * .7 -- 76
				y = y + math.sin(ct * 0.95) -- 77
				txt_obj:Draw(x, y, alpha_delta, TEXT_ALIGN_CENTER) -- 78
			else -- 80
				local x = ScrW() * .3 -- 80
				local y = ScrH() * .5 -- 81
				local weapons = lp:GetWeapons() -- 82
				local index_local = delta_index -- 83
				if not weapons[index] then -- 84
					index = #weapons -- 84
				end -- 84
				for i = 1, #weapons do -- 85
					local theta = (i - index_local) * .1 -- 86
					local name = weapons[i]:GetPrintName() -- 87
					if names[name] then -- 88
						name = names[name] -- 88
					end -- 88
					local _, ty = surface.GetTextSize(name) -- 89
					local scale = 1 - math.abs(theta * 2) -- 90
					local matrix = Matrix() -- 91
					local desp = lp:GetDespair() * 0.01 -- 92
					local font = "Spleen_Label" -- 93
					local txt = name -- 95
					if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then -- 96
						txt = "<rgb=1,1," .. tostring(i == index and 60 or 30) .. ">" .. tostring(txt) -- 96
					end -- 96
					local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp * (theta * 2)) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp + (i == index and 10 or 3)) .. "," .. tostring(0.38 * desp + (i == index and 3 or 1.23)) .. ",2><ol=2>" .. tostring(txt), nil) -- 97
					local txt_w = txt_obj:GetWide() -- 98
					local txt_h = txt_obj:GetTall() -- 99
					local last_y = (txt_h) * fraction -- 100
					local translator = Vector(shift_x + x + math.cos(theta * spacing + math.pi) * radius + radius, y + last_y + math.sin(theta * spacing + math.pi) * radius - ty / 2, 1) -- 102
					matrix:Translate(translator) -- 107
					matrix:Scale(matrix_scale * scale) -- 108
					cam.PushModelMatrix(matrix) -- 109
					txt_obj:Draw(64, 0, alpha_delta, TEXT_ALIGN_LEFT) -- 110
					cam.PopModelMatrix() -- 111
				end -- 111
				if fade_time < ct and alpha > 0 then -- 112
					alpha = 0 -- 112
				end -- 112
			end -- 56
		end -- 33
	end -- 26
	return -- 113
end) -- 21
local on_index_changed -- 115
on_index_changed = function(weapon) -- 115
	alpha = 1 -- 116
	fade_time = CurTime() + 5 -- 117
	return lp:EmitSound("common/talk.wav", 50, 180) -- 118
end -- 115
hook.Add("PlayerBindPress", "evilrp_weapon_select", function(ply, bind, pressed) -- 120
	bind = bind:lower() -- 121
	if ply:Fallen() then -- 122
		return -- 122
	end -- 122
	if not pressed then -- 123
		return -- 123
	end -- 123
	if not bind:find("invprev") and not bind:find("invnext") and not bind:find("slot") and not bind:find("attack") then -- 124
		return -- 124
	end -- 124
	local cur_wep = ply:GetActiveWeapon() -- 125
	local valid = IsValid(cur_wep) -- 126
	local wep_cls = valid and cur_wep:GetClass() or nil -- 127
	local btool -- 128
	local paying -- 129
	if ply:InVehicle() then -- 130
		return -- 130
	end -- 130
	if valid and wep_cls == "weapon_physgun" and ply:KeyDown(IN_ATTACK) then -- 131
		return -- 131
	end -- 131
	paying = ply:GetNWBool("evilrp_paying") -- 132
	local selling = ply:GetNWBool("evilrp_selling") -- 133
	if valid then -- 134
		if "gmod_tool" == wep_cls then -- 136
			local tool = ply:GetTool() -- 137
			btool = tool and (tool.Scroll ~= nil) -- 138
		end -- 138
	end -- 134
	if paying then -- 139
		ply.payment_amount = ply.payment_amount or 0 -- 140
		local shift = ply:KeyDown(IN_SPEED) -- 141
		if bind:find("invprev") then -- 142
			ply.payment_amount = ply.payment_amount - (shift and 5 or 1) -- 143
		elseif bind:find("invnext") then -- 144
			ply.payment_amount = ply.payment_amount + (shift and 5 or 1) -- 145
		end -- 142
		ply.payment_amount = math.min(ply:getDarkRPVar("money"), math.max(ply.payment_amount, 0)) -- 146
		local old_index = index -- 147
		index = ply.payment_amount -- 148
		on_index_changed() -- 149
		return -- 150
	end -- 139
	if selling then -- 151
		ply.sellable_price = ply.sellable_price or 0 -- 152
		local shift = ply:KeyDown(IN_SPEED) -- 153
		if bind:find("invprev") then -- 154
			ply.sellable_price = ply.sellable_price - (shift and 5 or 1) -- 155
		elseif bind:find("invnext") then -- 156
			ply.sellable_price = ply.sellable_price + (shift and 5 or 1) -- 157
		end -- 154
		ply.sellable_price = math.max(ply.sellable_price, 0) -- 158
		local old_index = index -- 159
		index = ply.sellable_price -- 160
		on_index_changed() -- 161
		return -- 162
	end -- 151
	local weapons = ply:GetWeapons() -- 163
	if bind:find("invprev") and not btool then -- 164
		local old_index = index -- 165
		index = math.min(index + 1, #weapons) -- 166
		if (alpha == 0 or old_index ~= index) then -- 167
			on_index_changed(weapons[index]) -- 167
		end -- 167
		return true -- 168
	elseif bind:find("invnext") and not btool then -- 169
		local old_index = index -- 170
		index = math.max(index - 1, 1) -- 171
		if (alpha == 0 or old_index ~= index) then -- 172
			on_index_changed(weapons[index]) -- 172
		end -- 172
		return true -- 173
	elseif bind:find("slot") then -- 174
		index = math.Clamp(tonumber(bind:match("slot(%d)")) or 1, 1, #weapons) -- 175
		on_index_changed(weapons[index]) -- 176
		return true -- 177
	elseif bind:find("attack") and alpha > 0 then -- 178
		local weapon = weapons[index] -- 179
		if IsValid(weapon) then -- 180
			lp:EmitSound("HL2Player.Use") -- 181
			input.SelectWeapon(weapon) -- 182
			alpha = 0 -- 183
		end -- 180
		return true -- 184
	end -- 164
	return -- 185
end) -- 120
local was_paying -- 187
return hook.Add("Think", "evilrp_weapon_select", function() -- 189
	if (not IsValid(lp) or not lp:Alive()) then -- 190
		alpha = 0 -- 190
	end -- 190
	was_paying = was_paying or lp:GetNWBool("evilrp_paying") -- 191
	if was_paying and not lp:GetNWBool("evilrp_paying") then -- 192
		was_paying = false -- 193
		index = 0 -- 194
		delta_index = 0 -- 195
		alpha_delta = 0 -- 196
		alpha = 0 -- 197
	end -- 192
	return -- 198
end) -- 198
