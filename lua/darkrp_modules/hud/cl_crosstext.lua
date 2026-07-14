cross_prog = 0
cross_texts = { }
local cross_text_alpha = 0
local is_door
is_door = function(ent)
	local _exp_0 = ent:GetClass()
	if "func_door" == _exp_0 or "func_door_rotating" == _exp_0 or "prop_door_rotating" == _exp_0 or "func_movelinear" == _exp_0 or "prop_dynamic" == _exp_0 then
		return true
	else
		return false
	end
end
local sin, abs = math.sin, math.abs
local portal
local next_portal_check
next_portal_check = CurTime()
local draw_cross_texts
draw_cross_texts = function()
	local ply = LocalPlayer()
	local ct = CurTime()
	local get = ply:GetEyeTrace()
	local p = get.HitPos:ToScreen()
	local x = p.x
	local y = p.y
	local ent = get.Entity
	if not IsValid(ent) then
		if ct >= next_portal_check then
			next_portal_check = CurTime() + .23
			local nearby = ents.FindInSphere(ply:GetPos(), 16)
			local found
			for _index_0 = 1, #nearby do
				local ent = nearby[_index_0]
				if ent:GetClass():find("portal/spawn") then
					found = ent
					break
				end
			end
			if found and IsValid(found) then
				portal = found
			else
				portal = nil
			end
		end
	end
	if portal and IsValid(portal) then
		ent = portal
	end
	if ent and IsValid(ent) and ((is_door(ent) and ent:isKeysOwnable()) or ent:IsPlayer() or ent:GetClass() == "prop_ragdoll" or ent.Interesting) and ent:GetPos():DistToSqr(ply:GetPos()) < (384 ^ 2) then
		cross_text_alpha = math.Clamp(cross_text_alpha + FrameTime(), 0, 0.7)
		cross_prog = Lerp(0.05, cross_prog, 1)
		if ent.HUDRender then
			cross_texts = ent:HUDRender()
		else
			cross_texts = ent:_HUDRender()
		end
	else
		cross_text_alpha = math.Clamp(cross_text_alpha - FrameTime(), 0, 0.7)
		cross_prog = Lerp(0.05, cross_prog, 0)
	end
	if (not ply:KeyDown(IN_WALK)) and cross_texts and cross_text_alpha > 0.02 then
		local rgb = HSVToColor((ct * 13) % 360, 1, 1)
		y = y + (20 * cross_prog)
		x = x + (12 * math.sin(ct))
		local idx = 0
		local desp = (ply:GetDespair() * 0.01)
		local _list_0 = cross_texts
		for _index_0 = 1, #_list_0 do
			local t = _list_0[_index_0]
			idx = idx + 1
			if type(t) == "string" then
				local txt = t
				local font = "Spleen_Label"
				if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then
					txt = "<rgb=1,1,30>" .. tostring(txt)
				end
				local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil)
				local txt_w = txt_obj:GetWide()
				local txt_h = txt_obj:GetTall()
				txt_obj:Draw(x, y, cross_text_alpha, TEXT_ALIGN_CENTER)
				y = y + (txt_h * cross_prog)
			else
				local txt = t.text
				local font = t.font or "Spleen_Label"
				if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then
					txt = "<rgb=1,1,30>" .. tostring(txt)
				end
				local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil)
				local txt_w = txt_obj:GetWide()
				local txt_h = txt_obj:GetTall()
				txt_obj:Draw(x, y, cross_text_alpha, TEXT_ALIGN_CENTER)
				y = y + (txt_h * cross_prog)
			end
		end
	elseif cross_text_alpha < 0.1 then
		cross_prog = 0
	end
	return
end
hook.Add("HUDPaint", "evilrp_hud_crosstexts", draw_cross_texts)
local racism
racism = function(who)
	local text = "Not like me."
	if who:GetModel() == lp:GetModel() then
		text = "Brother in blood."
	end
	if lp:Team() == TEAM_GHOST then
		text = "A pitiful mortal."
	end
	return {
		text = text,
		font = "Spleen_Label_Small"
	}
end
local model_funcs = {
	["models/liver_failure/liverish/liverish.mdl"] = racism,
	["models/liver_failure/kidneystani/kidneystani.mdl"] = racism,
	["models/liver_failure/arrythmian/arrythmian.mdl"] = racism
}
local meta = FindMetaTable("Player")
meta.HUDRender = function(self)
	local ct = { }
	if self:Team() == TEAM_GHOST and lp:Team() ~= TEAM_GHOST and not lp:HasOddity(ODDITY_COTARDISM) then
		return
	end
	ct[#ct + 1] = self:Name()
	local mdl = self:GetModel()
	local jt = self:getJobTable()
	local skip_model = false
	local job_ct
	if jt.crosstext then
		job_ct, skip_model = jt.crosstext(self)
	end
	if not skip_model then
		if model_funcs[mdl] then
			ct[#ct + 1] = model_funcs[mdl](self)
		end
	end
	if job_ct then
		ct[#ct + 1] = job_ct
	end
	return ct
end
