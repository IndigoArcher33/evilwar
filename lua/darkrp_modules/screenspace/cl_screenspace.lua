-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/screenspace/cl_screenspace.yue
local max = math.max -- 1
local blend_sets = { -- 3
	HPPD = { -- 4
		src_blend = function() -- 4
			local lp = LocalPlayer() -- 5
			local blend = BLEND_DST_COLOR -- 6
			local terminal = lp.gterm_entity -- 7
			if terminal and IsValid(terminal) then -- 8
				blend = BLEND_ONE_MINUS_SRC_ALPHA -- 9
			end -- 8
			return blend -- 10
		end, -- 4
		dst_blend = function() -- 11
			local lp = LocalPlayer() -- 12
			local blend = BLEND_DST_ALPHA -- 13
			local terminal = lp.gterm_entity -- 14
			if terminal and IsValid(terminal) then -- 15
				blend = BLEND_ONE -- 16
			end -- 15
			return blend -- 17
		end, -- 11
		blend_fnc = BLENDFUNC_ADD, -- 18
		rate = function() -- 19
			local lp = LocalPlayer() -- 20
			local team = lp:Team() -- 21
			if team == TEAM_GHOST then -- 22
				return 16 -- 23
			else -- 25
				return 6 -- 25
			end -- 22
		end, -- 19
		passes = function() -- 26
			local lp = LocalPlayer() -- 27
			local team = lp:Team() -- 28
			if team == TEAM_GHOST then -- 29
				return 4 -- 30
			else -- 32
				return 1 + math.floor(9 * (lp:GetDespair() * 0.01)) -- 32
			end -- 29
		end, -- 26
		textures = { } -- 33
	} -- 3
} -- 2
local aberration = 1 -- 36
local aberrations = { -- 39
	{ -- 40
		r = 0, -- 40
		g = 0, -- 41
		b = 0, -- 42
		col = 0, -- 43
		con = 0, -- 44
		bri = 0 -- 45
	}, -- 39
	{ -- 48
		r = 0, -- 48
		g = 0, -- 49
		b = 0, -- 50
		col = 0, -- 51
		con = 3, -- 52
		bri = -0.04 -- 53
	}, -- 47
	{ -- 56
		r = 3, -- 56
		g = 3, -- 57
		b = 0, -- 58
		col = 0, -- 59
		con = 0, -- 60
		bri = -0.03 -- 61
	}, -- 55
	{ -- 64
		r = 0, -- 64
		g = 0, -- 65
		b = 0, -- 66
		col = -4, -- 67
		con = 0, -- 68
		bri = -0.03 -- 69
	}, -- 63
	{ -- 72
		r = 0, -- 72
		g = 0, -- 73
		b = 0, -- 74
		col = 0, -- 75
		con = 0, -- 76
		bri = 0 -- 77
	} -- 71
} -- 38
local blend_overlay -- 81
blend_overlay = function(set, mul) -- 81
	if mul == nil then -- 81
		mul = 1 -- 81
	end -- 81
	local OverrideAlphaWriteEnable, OverrideDepthEnable, OverrideBlend, SetMaterial, DrawScreenQuadEx = render.OverrideAlphaWriteEnable, render.OverrideDepthEnable, render.OverrideBlend, render.SetMaterial, render.DrawScreenQuadEx -- 82
	local floor, sin, cos = math.floor, math.sin, math.cos -- 83
	OverrideAlphaWriteEnable(true, true) -- 84
	OverrideDepthEnable(true, false) -- 85
	local blendfunc = set.blend_fnc -- 86
	if isfunction(blendfunc) then -- 87
		blendfunc = blendfunc() -- 87
	end -- 87
	local dst_blend = set.dst_blend -- 88
	if isfunction(dst_blend) then -- 89
		dst_blend = dst_blend() -- 89
	end -- 89
	local src_blend = set.src_blend -- 90
	if isfunction(src_blend) then -- 91
		src_blend = src_blend() -- 91
	end -- 91
	OverrideBlend(true, src_blend, dst_blend, blendfunc, BLEND_ONE, BLEND_ZERO, BLENDFUNC_ADD) -- 92
	local passes = set.passes -- 93
	if isfunction(passes) then -- 94
		passes = passes() -- 94
	end -- 94
	local rate = set.rate -- 95
	if isfunction(rate) then -- 96
		rate = rate() -- 96
	end -- 96
	for i = 1, passes do -- 97
		local idx = (floor((CurTime() * 1 + (passes / 5)) * rate) % #set.textures) + 1 -- 98
		SetMaterial(set.textures[idx]) -- 99
		local x = ScrW() * -0.15 + ScrW() * 0.1 * sin(CurTime() * (i / 10) * mul) -- 100
		local y = ScrH() * -0.15 + ScrH() * 0.1 * cos(CurTime() * (i / 10) * mul) -- 101
		DrawScreenQuadEx(x, y, ScrW() * (1.5 + i / 10), ScrH() * (1.5 + i / 10)) -- 102
	end -- 102
	OverrideBlend(false) -- 103
	OverrideAlphaWriteEnable(false) -- 104
	return OverrideDepthEnable(false) -- 105
end -- 81
local next_aberration = CurTime() -- 106
hook.Add("RenderScreenspaceEffects", "evilrp_screenspace", function() -- 107
	local sin, abs = math.sin, math.abs -- 109
	local tab -- 110
	local ct = CurTime() -- 111
	local lp = LocalPlayer() -- 113
	local jt = lp:getJobTable() -- 114
	if jt and jt.RenderScreenspaceEffects then -- 115
		jt.RenderScreenspaceEffects(lp) -- 116
	end -- 115
	local tab -- 117
	if jt and jt.ColorMod then -- 118
		tab = jt.ColorMod(lp) -- 119
	else -- 121
		ct = CurTime() -- 121
		lp = LocalPlayer() -- 122
		local ab -- 123
		if (ct >= next_aberration) then -- 124
			if aberration > 1 then -- 125
				aberration = 1 -- 126
				next_aberration = ct + math.random(60, 240) -- 127
			else -- 129
				aberration = math.random(2, #aberrations) -- 129
				next_aberration = ct + math.random(1, 3) -- 130
			end -- 125
		end -- 124
		ab = aberrations[aberration] -- 131
		local r = 1 + (1 * math.sin(ct * (0.75 + (1 * (1 - (lp:Health() / lp:GetMaxHealth())))))) -- 132
		local g = 1 + (1 * math.sin(ct)) -- 133
		local b = 1 + (1 * math.sin(ct)) -- 134
		local cmul = 2 + (0.5 * math.sin(ct * 0.5)) + (0.5 * math.sin(ct * 0.5)) - (1 - (lp:Health() / lp:GetMaxHealth())) -- 135
		if MUTATORS[MUTATOR_CHROMOPHOBIA].active then -- 136
			r = 0 -- 137
			g = 0 -- 137
			b = 0 -- 137
			cmul = 0 -- 137
		end -- 136
		tab = { -- 139
			["$pp_colour_addr"] = 0, -- 139
			["$pp_colour_addg"] = 0, -- 140
			["$pp_colour_addb"] = 0, -- 141
			["$pp_colour_brightness"] = 0.06 + ab.bri, -- 142
			["$pp_colour_contrast"] = 0.6 + ab.con + (0.2 * math.cos(ct * 0.8)), -- 143
			["$pp_colour_colour"] = cmul + ab.col, -- 144
			["$pp_colour_mulr"] = r + ab.r, -- 145
			["$pp_colour_mulg"] = g + ab.g, -- 146
			["$pp_colour_mulb"] = b + ab.b -- 147
		} -- 138
	end -- 118
	blend_overlay(blend_sets.HPPD) -- 149
	DrawColorModify(tab) -- 150
	do -- 152
		local _exp_0 = lp:Team() -- 152
		if TEAM_GHOST == _exp_0 then -- 153
			DrawMotionBlur(0.15, 0.7, 0.2 + math.abs(0.5 * math.sin(ct))) -- 154
		end -- 154
	end -- 154
	local hp = lp:Health() -- 156
	local hpm = lp:GetMaxHealth() -- 157
	if hp < (hpm / 2) then -- 158
		DrawMotionBlur(0.15 * (1 - (hp / hpm)), 0.8 * (1 - (hp / hpm)), 0.2) -- 159
	end -- 158
	local desp = lp:GetDespair() -- 161
	DrawSharpen(1 * math.sin(ct * 0.5), 4 * math.random(0.8, 1.2) * (desp / 100)) -- 162
	local autostitcher = lp:GetNWEntity("evilrp_autostitcher", NULL) -- 164
	if IsValid(autostitcher) and autostitcher:GetPatient() == lp then -- 165
		tab = { -- 167
			["$pp_colour_addr"] = 0, -- 167
			["$pp_colour_addg"] = 0, -- 168
			["$pp_colour_addb"] = 0, -- 169
			["$pp_colour_brightness"] = 0.06, -- 170
			["$pp_colour_contrast"] = 2 + (0.2 * math.cos(ct * 0.8)), -- 171
			["$pp_colour_colour"] = 7 + (-4 * (desp / 100)) + (1 * math.sin(ct)), -- 172
			["$pp_colour_mulr"] = 0, -- 173
			["$pp_colour_mulg"] = 0, -- 174
			["$pp_colour_mulb"] = 0 -- 175
		} -- 166
		DrawColorModify(tab) -- 176
		DrawMotionBlur(0.1, 0.8, 0.05) -- 177
		DrawSharpen(1.2, 10 * math.cos(ct)) -- 178
	end -- 165
	local terminal = lp.gterm_entity -- 180
	if terminal and IsValid(terminal) then -- 181
		tab = { -- 183
			["$pp_colour_addr"] = 0, -- 183
			["$pp_colour_addg"] = 0, -- 184
			["$pp_colour_addb"] = 0, -- 185
			["$pp_colour_brightness"] = -0.06, -- 186
			["$pp_colour_contrast"] = 2 + (0.2 * math.cos(ct * 0.8)), -- 187
			["$pp_colour_colour"] = 7 + (-4 * (desp / 100)) + (1 * math.sin(ct)), -- 188
			["$pp_colour_mulr"] = 0, -- 189
			["$pp_colour_mulg"] = 0, -- 190
			["$pp_colour_mulb"] = 0 -- 191
		} -- 182
		return DrawColorModify(tab) -- 192
	end -- 181
end) -- 107
for i = 1, 8 do -- 197
	local mat = Material("dysphoria/blends/colornoise/a" .. tostring(i) .. ".png") -- 198
	table.insert(blend_sets.HPPD.textures, mat) -- 199
end -- 199
local mat_death = Material("effects/water_warp01") -- 201
local death_screenspace -- 202
death_screenspace = function() -- 202
	local lp = LocalPlayer() -- 203
	if lp:Alive() then -- 204
		return -- 204
	end -- 204
	local rag = lp:Ragdoll() -- 205
	if not (rag and IsValid(rag) and rag:GetNWBool("corpse")) then -- 206
		return -- 206
	end -- 206
	local decomp_start = rag:GetNWInt("decomp_start") -- 207
	local decomp_finish = rag:GetNWInt("decomp_finish") - decomp_start -- 208
	local ct = CurTime() -- 209
	local cur = ct - decomp_start -- 210
	local ending = decomp_finish - decomp_start -- 211
	local mul = cur / ending -- 212
	local tab = { -- 214
		["$pp_colour_addr"] = 0, -- 214
		["$pp_colour_addg"] = 0, -- 215
		["$pp_colour_addb"] = 0, -- 216
		["$pp_colour_brightness"] = -0.02, -- 217
		["$pp_colour_contrast"] = 2, -- 218
		["$pp_colour_colour"] = math.sin(ct * 1.5) * (10 * (1 - (mul * 2))), -- 219
		["$pp_colour_mulr"] = 3 + (3 * math.sin(ct)), -- 220
		["$pp_colour_mulg"] = 0, -- 221
		["$pp_colour_mulb"] = 0 -- 222
	} -- 213
	DrawColorModify(tab) -- 223
	DrawMotionBlur(0.15, 0.8, 0.2) -- 224
	DrawSharpen(1 * math.sin(ct), 2 * math.random(0.8, 1.2)) -- 225
	DrawSobel(math.abs(2.3 * (math.sin(ct)))) -- 226
	render.SetBlend(mul) -- 227
	render.UpdateScreenEffectTexture() -- 228
	mat_death:SetFloat("$envmap", 0) -- 230
	mat_death:SetFloat("$envmaptint", 0) -- 231
	mat_death:SetFloat("$refractamount", mul * 0.5) -- 232
	mat_death:SetInt("$ignorez", 1) -- 233
	render.SetMaterial(mat_death) -- 234
	render.DrawScreenQuad() -- 235
	return -- 236
end -- 202
hook.Add("RenderScreenspaceEffects", "evilrp_screenspace_death", death_screenspace) -- 237
local blur_material = Material("pp/blurscreen") -- 239
local blur_intensity = 0 -- 240
local max_blur_intensity = 4 -- 241
local fade_speed = 5 -- 242
return net.Receive("evilrp_blur_on_damage", function() -- 244
	blur_intensity = max_blur_intensity -- 245
	return hook.Add("RenderScreenspaceEffects", "evilrp_blur_on_damage", function() -- 246
		if blur_intensity >= 0 then -- 247
			local x = 0 -- 248
			local y = 0 -- 249
			local w = ScrW() -- 250
			local h = ScrH() -- 251
			surface.SetMaterial(blur_material) -- 252
			surface.SetDrawColor(255, 255, 255, 255) -- 253
			for i = 1, 3 do -- 254
				blur_material:SetFloat("$blur", (i / 3) * blur_intensity) -- 255
				blur_material:Recompute() -- 256
				render.UpdateScreenEffectTexture() -- 257
				surface.DrawTexturedRect(x, y, w, h) -- 258
			end -- 258
			blur_intensity = math.max(0, blur_intensity - (fade_speed * FrameTime())) -- 259
		else -- 261
			return hook.Remove("RenderScreenspaceEffects", "evilrp_blur_on_damage") -- 261
		end -- 247
	end) -- 262
end) -- 263
