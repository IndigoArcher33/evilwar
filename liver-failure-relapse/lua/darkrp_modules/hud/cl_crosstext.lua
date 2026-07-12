-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/hud/cl_crosstext.yue
cross_prog = 0 -- 1
cross_texts = { } -- 2
local cross_text_alpha = 0 -- 3
local is_door -- 5
is_door = function(ent) -- 5
	local _exp_0 = ent:GetClass() -- 6
	if "func_door" == _exp_0 or "func_door_rotating" == _exp_0 or "prop_door_rotating" == _exp_0 or "func_movelinear" == _exp_0 or "prop_dynamic" == _exp_0 then -- 7
		return true -- 8
	else -- 10
		return false -- 10
	end -- 10
end -- 5
local sin, abs = math.sin, math.abs -- 12
local portal -- 14
local next_portal_check -- 15
next_portal_check = CurTime() -- 15
local draw_cross_texts -- 17
draw_cross_texts = function() -- 17
	local ply = LocalPlayer() -- 18
	local ct = CurTime() -- 19
	local get = ply:GetEyeTrace() -- 20
	local p = get.HitPos:ToScreen() -- 21
	local x = p.x -- 22
	local y = p.y -- 23
	local ent = get.Entity -- 24
	if not IsValid(ent) then -- 25
		if ct >= next_portal_check then -- 26
			next_portal_check = CurTime() + .23 -- 27
			local nearby = ents.FindInSphere(ply:GetPos(), 16) -- 28
			local found -- 29
			for _index_0 = 1, #nearby do -- 30
				local ent = nearby[_index_0] -- 30
				if ent:GetClass():find("portal/spawn") then -- 31
					found = ent -- 32
					break -- 33
				end -- 31
			end -- 33
			if found and IsValid(found) then -- 34
				portal = found -- 35
			else -- 37
				portal = nil -- 37
			end -- 34
		end -- 26
	end -- 25
	if portal and IsValid(portal) then -- 38
		ent = portal -- 38
	end -- 38
	if ent and IsValid(ent) and ((is_door(ent) and ent:isKeysOwnable()) or ent:IsPlayer() or ent:GetClass() == "prop_ragdoll" or ent.Interesting) and ent:GetPos():DistToSqr(ply:GetPos()) < (384 ^ 2) then -- 42
		cross_text_alpha = math.Clamp(cross_text_alpha + FrameTime(), 0, 0.7) -- 43
		cross_prog = Lerp(0.05, cross_prog, 1) -- 44
		if ent.HUDRender then -- 45
			cross_texts = ent:HUDRender() -- 46
		else -- 48
			cross_texts = ent:_HUDRender() -- 48
		end -- 45
	else -- 50
		cross_text_alpha = math.Clamp(cross_text_alpha - FrameTime(), 0, 0.7) -- 50
		cross_prog = Lerp(0.05, cross_prog, 0) -- 51
	end -- 42
	if (not ply:KeyDown(IN_WALK)) and cross_texts and cross_text_alpha > 0.02 then -- 52
		local rgb = HSVToColor((ct * 13) % 360, 1, 1) -- 53
		y = y + (20 * cross_prog) -- 54
		x = x + (12 * math.sin(ct)) -- 55
		local idx = 0 -- 56
		local desp = (ply:GetDespair() * 0.01) -- 57
		local _list_0 = cross_texts -- 58
		for _index_0 = 1, #_list_0 do -- 58
			local t = _list_0[_index_0] -- 58
			idx = idx + 1 -- 59
			if type(t) == "string" then -- 60
				local txt = t -- 61
				local font = "Spleen_Label" -- 62
				if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then -- 64
					txt = "<rgb=1,1,30>" .. tostring(txt) -- 64
				end -- 64
				local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil) -- 65
				local txt_w = txt_obj:GetWide() -- 66
				local txt_h = txt_obj:GetTall() -- 67
				txt_obj:Draw(x, y, cross_text_alpha, TEXT_ALIGN_CENTER) -- 69
				y = y + (txt_h * cross_prog) -- 71
			else -- 73
				local txt = t.text -- 73
				local font = t.font or "Spleen_Label" -- 74
				if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then -- 76
					txt = "<rgb=1,1,30>" .. tostring(txt) -- 76
				end -- 76
				local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil) -- 77
				local txt_w = txt_obj:GetWide() -- 78
				local txt_h = txt_obj:GetTall() -- 79
				txt_obj:Draw(x, y, cross_text_alpha, TEXT_ALIGN_CENTER) -- 81
				y = y + (txt_h * cross_prog) -- 83
			end -- 60
		end -- 83
	elseif cross_text_alpha < 0.1 then -- 84
		cross_prog = 0 -- 86
	end -- 52
	return -- 87
end -- 17
hook.Add("HUDPaint", "evilrp_hud_crosstexts", draw_cross_texts) -- 89
local racism -- 91
racism = function(who) -- 91
	local text = "Not like me." -- 92
	if who:GetModel() == lp:GetModel() then -- 93
		text = "Brother in blood." -- 93
	end -- 93
	if lp:Team() == TEAM_GHOST then -- 94
		text = "A pitiful mortal." -- 94
	end -- 94
	return { -- 95
		text = text, -- 95
		font = "Spleen_Label_Small" -- 95
	} -- 95
end -- 91
local model_funcs = { -- 98
	["models/liver_failure/liverish/liverish.mdl"] = racism, -- 98
	["models/liver_failure/kidneystani/kidneystani.mdl"] = racism, -- 99
	["models/liver_failure/arrythmian/arrythmian.mdl"] = racism -- 100
} -- 97
local meta = FindMetaTable("Player") -- 103
meta.HUDRender = function(self) -- 104
	local ct = { } -- 105
	if self:Team() == TEAM_GHOST and lp:Team() ~= TEAM_GHOST and not lp:HasOddity(ODDITY_COTARDISM) then -- 106
		return -- 106
	end -- 106
	ct[#ct + 1] = self:Name() -- 107
	local mdl = self:GetModel() -- 108
	local jt = self:getJobTable() -- 109
	local skip_model = false -- 110
	local job_ct -- 111
	if jt.crosstext then -- 112
		job_ct, skip_model = jt.crosstext(self) -- 113
	end -- 112
	if not skip_model then -- 114
		if model_funcs[mdl] then -- 115
			ct[#ct + 1] = model_funcs[mdl](self) -- 115
		end -- 115
	end -- 114
	if job_ct then -- 116
		ct[#ct + 1] = job_ct -- 116
	end -- 116
	return ct -- 117
end -- 104
