local max = math.max
local blend_sets = {
	HPPD = {
		src_blend = function()
			local lp = LocalPlayer()
			local blend = BLEND_DST_COLOR
			local terminal = lp.gterm_entity
			if terminal and IsValid(terminal) then
				blend = BLEND_ONE_MINUS_SRC_ALPHA
			end
			return blend
		end,
		dst_blend = function()
			local lp = LocalPlayer()
			local blend = BLEND_DST_ALPHA
			local terminal = lp.gterm_entity
			if terminal and IsValid(terminal) then
				blend = BLEND_ONE
			end
			return blend
		end,
		blend_fnc = BLENDFUNC_ADD,
		rate = function()
			local lp = LocalPlayer()
			local team = lp:Team()
			if team == TEAM_GHOST then
				return 16
			else
				return 6
			end
		end,
		passes = function()
			local lp = LocalPlayer()
			local team = lp:Team()
			if team == TEAM_GHOST then
				return 4
			else
				return 1 + math.floor(9 * (lp:GetDespair() * 0.01))
			end
		end,
		textures = { }
	}
}
local aberration = 1
local aberrations = {
	{
		r = 0,
		g = 0,
		b = 0,
		col = 0,
		con = 0,
		bri = 0
	},
	{
		r = 0,
		g = 0,
		b = 0,
		col = 0,
		con = 3,
		bri = -0.04
	},
	{
		r = 3,
		g = 3,
		b = 0,
		col = 0,
		con = 0,
		bri = -0.03
	},
	{
		r = 0,
		g = 0,
		b = 0,
		col = -4,
		con = 0,
		bri = -0.03
	},
	{
		r = 0,
		g = 0,
		b = 0,
		col = 0,
		con = 0,
		bri = 0
	}
}
local blend_overlay
blend_overlay = function(set, mul)
	if mul == nil then
		mul = 1
	end
	local OverrideAlphaWriteEnable, OverrideDepthEnable, OverrideBlend, SetMaterial, DrawScreenQuadEx = render.OverrideAlphaWriteEnable, render.OverrideDepthEnable, render.OverrideBlend, render.SetMaterial, render.DrawScreenQuadEx
	local floor, sin, cos = math.floor, math.sin, math.cos
	OverrideAlphaWriteEnable(true, true)
	OverrideDepthEnable(true, false)
	local blendfunc = set.blend_fnc
	if isfunction(blendfunc) then
		blendfunc = blendfunc()
	end
	local dst_blend = set.dst_blend
	if isfunction(dst_blend) then
		dst_blend = dst_blend()
	end
	local src_blend = set.src_blend
	if isfunction(src_blend) then
		src_blend = src_blend()
	end
	OverrideBlend(true, src_blend, dst_blend, blendfunc, BLEND_ONE, BLEND_ZERO, BLENDFUNC_ADD)
	local passes = set.passes
	if isfunction(passes) then
		passes = passes()
	end
	local rate = set.rate
	if isfunction(rate) then
		rate = rate()
	end
	for i = 1, passes do
		local idx = (floor((CurTime() * 1 + (passes / 5)) * rate) % #set.textures) + 1
		SetMaterial(set.textures[idx])
		local x = ScrW() * -0.15 + ScrW() * 0.1 * sin(CurTime() * (i / 10) * mul)
		local y = ScrH() * -0.15 + ScrH() * 0.1 * cos(CurTime() * (i / 10) * mul)
		DrawScreenQuadEx(x, y, ScrW() * (1.5 + i / 10), ScrH() * (1.5 + i / 10))
	end
	OverrideBlend(false)
	OverrideAlphaWriteEnable(false)
	return OverrideDepthEnable(false)
end
local next_aberration = CurTime()
hook.Add("RenderScreenspaceEffects", "evilrp_screenspace", function()
	local sin, abs = math.sin, math.abs
	local tab
	local ct = CurTime()
	local lp = LocalPlayer()
	local jt = lp:getJobTable()
	if jt and jt.RenderScreenspaceEffects then
		jt.RenderScreenspaceEffects(lp)
	end
	local tab
	if jt and jt.ColorMod then
		tab = jt.ColorMod(lp)
	else
		ct = CurTime()
		lp = LocalPlayer()
		local ab
		if (ct >= next_aberration) then
			if aberration > 1 then
				aberration = 1
				next_aberration = ct + math.random(60, 240)
			else
				aberration = math.random(2, #aberrations)
				next_aberration = ct + math.random(1, 3)
			end
		end
		ab = aberrations[aberration]
		local r = 1 + (1 * math.sin(ct * (0.75 + (1 * (1 - (lp:Health() / lp:GetMaxHealth()))))))
		local g = 1 + (1 * math.sin(ct))
		local b = 1 + (1 * math.sin(ct))
		local cmul = 2 + (0.5 * math.sin(ct * 0.5)) + (0.5 * math.sin(ct * 0.5)) - (1 - (lp:Health() / lp:GetMaxHealth()))
		if MUTATORS[MUTATOR_CHROMOPHOBIA].active then
			r = 0
			g = 0
			b = 0
			cmul = 0
		end
		tab = {
			["$pp_colour_addr"] = 0,
			["$pp_colour_addg"] = 0,
			["$pp_colour_addb"] = 0,
			["$pp_colour_brightness"] = 0.06 + ab.bri,
			["$pp_colour_contrast"] = 0.6 + ab.con + (0.2 * math.cos(ct * 0.8)),
			["$pp_colour_colour"] = cmul + ab.col,
			["$pp_colour_mulr"] = r + ab.r,
			["$pp_colour_mulg"] = g + ab.g,
			["$pp_colour_mulb"] = b + ab.b
		}
	end
	blend_overlay(blend_sets.HPPD)
	DrawColorModify(tab)
	do
		local _exp_0 = lp:Team()
		if TEAM_GHOST == _exp_0 then
			DrawMotionBlur(0.15, 0.7, 0.2 + math.abs(0.5 * math.sin(ct)))
		end
	end
	local hp = lp:Health()
	local hpm = lp:GetMaxHealth()
	if hp < (hpm / 2) then
		DrawMotionBlur(0.15 * (1 - (hp / hpm)), 0.8 * (1 - (hp / hpm)), 0.2)
	end
	local desp = lp:GetDespair()
	DrawSharpen(1 * math.sin(ct * 0.5), 4 * math.random(0.8, 1.2) * (desp / 100))
	local autostitcher = lp:GetNWEntity("evilrp_autostitcher", NULL)
	if IsValid(autostitcher) and autostitcher:GetPatient() == lp then
		tab = {
			["$pp_colour_addr"] = 0,
			["$pp_colour_addg"] = 0,
			["$pp_colour_addb"] = 0,
			["$pp_colour_brightness"] = 0.06,
			["$pp_colour_contrast"] = 2 + (0.2 * math.cos(ct * 0.8)),
			["$pp_colour_colour"] = 7 + (-4 * (desp / 100)) + (1 * math.sin(ct)),
			["$pp_colour_mulr"] = 0,
			["$pp_colour_mulg"] = 0,
			["$pp_colour_mulb"] = 0
		}
		DrawColorModify(tab)
		DrawMotionBlur(0.1, 0.8, 0.05)
		DrawSharpen(1.2, 10 * math.cos(ct))
	end
	local terminal = lp.gterm_entity
	if terminal and IsValid(terminal) then
		tab = {
			["$pp_colour_addr"] = 0,
			["$pp_colour_addg"] = 0,
			["$pp_colour_addb"] = 0,
			["$pp_colour_brightness"] = -0.06,
			["$pp_colour_contrast"] = 2 + (0.2 * math.cos(ct * 0.8)),
			["$pp_colour_colour"] = 7 + (-4 * (desp / 100)) + (1 * math.sin(ct)),
			["$pp_colour_mulr"] = 0,
			["$pp_colour_mulg"] = 0,
			["$pp_colour_mulb"] = 0
		}
		return DrawColorModify(tab)
	end
end)
for i = 1, 8 do
	local mat = Material("dysphoria/blends/colornoise/a" .. tostring(i) .. ".png")
	table.insert(blend_sets.HPPD.textures, mat)
end
local mat_death = Material("effects/water_warp01")
local death_screenspace
death_screenspace = function()
	local lp = LocalPlayer()
	if lp:Alive() then
		return
	end
	local rag = lp:Ragdoll()
	if not (rag and IsValid(rag) and rag:GetNWBool("corpse")) then
		return
	end
	local decomp_start = rag:GetNWInt("decomp_start")
	local decomp_finish = rag:GetNWInt("decomp_finish") - decomp_start
	local ct = CurTime()
	local cur = ct - decomp_start
	local ending = decomp_finish - decomp_start
	local mul = cur / ending
	local tab = {
		["$pp_colour_addr"] = 0,
		["$pp_colour_addg"] = 0,
		["$pp_colour_addb"] = 0,
		["$pp_colour_brightness"] = -0.02,
		["$pp_colour_contrast"] = 2,
		["$pp_colour_colour"] = math.sin(ct * 1.5) * (10 * (1 - (mul * 2))),
		["$pp_colour_mulr"] = 3 + (3 * math.sin(ct)),
		["$pp_colour_mulg"] = 0,
		["$pp_colour_mulb"] = 0
	}
	DrawColorModify(tab)
	DrawMotionBlur(0.15, 0.8, 0.2)
	DrawSharpen(1 * math.sin(ct), 2 * math.random(0.8, 1.2))
	DrawSobel(math.abs(2.3 * (math.sin(ct))))
	render.SetBlend(mul)
	render.UpdateScreenEffectTexture()
	mat_death:SetFloat("$envmap", 0)
	mat_death:SetFloat("$envmaptint", 0)
	mat_death:SetFloat("$refractamount", mul * 0.5)
	mat_death:SetInt("$ignorez", 1)
	render.SetMaterial(mat_death)
	render.DrawScreenQuad()
	return
end
hook.Add("RenderScreenspaceEffects", "evilrp_screenspace_death", death_screenspace)
local blur_material = Material("pp/blurscreen")
local blur_intensity = 0
local max_blur_intensity = 4
local fade_speed = 5
return net.Receive("evilrp_blur_on_damage", function()
	blur_intensity = max_blur_intensity
	return hook.Add("RenderScreenspaceEffects", "evilrp_blur_on_damage", function()
		if blur_intensity >= 0 then
			local x = 0
			local y = 0
			local w = ScrW()
			local h = ScrH()
			surface.SetMaterial(blur_material)
			surface.SetDrawColor(255, 255, 255, 255)
			for i = 1, 3 do
				blur_material:SetFloat("$blur", (i / 3) * blur_intensity)
				blur_material:Recompute()
				render.UpdateScreenEffectTexture()
				surface.DrawTexturedRect(x, y, w, h)
			end
			blur_intensity = math.max(0, blur_intensity - (fade_speed * FrameTime()))
		else
			return hook.Remove("RenderScreenspaceEffects", "evilrp_blur_on_damage")
		end
	end)
end)
