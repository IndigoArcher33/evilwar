-- [yue]: darkrp_modules\camera\cl_calcview.yue
local should_do_third_person -- 7
should_do_third_person = function() -- 7
	local lp = LocalPlayer() -- 8
	local rag = lp:Ragdoll() -- 9
	local team = lp:Team() -- 10
	if lp.gT_TextEntry and IsValid(lp.gT_TextEntry) then -- 11
		return false -- 11
	end -- 11
	if rag and IsValid(rag) and (not lp:Alive()) then -- 12
		return true -- 12
	end -- 12
	if team == TEAM_GHOST or team == TEAM_BONEHEAD then -- 13
		return true -- 13
	end -- 13
	if cookie.GetNumber("evilrp_thirdperson", 0) == 1 then -- 14
		return true -- 14
	end -- 14
	return false -- 15
end -- 7
local toggle_third_person -- 17
toggle_third_person = function(ply, cmd, args) -- 17
	return cookie.Set("evilrp_thirdperson", 1 - cookie.GetNumber("evilrp_thirdperson", 0)) -- 18
end -- 17
concommand.Add("rp_thirdperson", toggle_third_person) -- 20
local bones = { -- 23
	"ValveBiped.Bip01_Head1", -- 23
	"ValveBiped.Bip01_Neck1" -- 24
} -- 22
local calc_view -- 26
calc_view = function(ply, pos, angles, fov, znear, zfar) -- 26
	if not evil_fov then -- 27
		evil_fov = fov -- 27
	end -- 27
	local terminal = ply.gterm_entity -- 29
	if terminal and IsValid(terminal) then -- 30
		fov = fov - 23 -- 31
	end -- 30
	evil_fov = Lerp(FrameTime() * 3, evil_fov, fov) -- 33
	fov = evil_fov -- 34
	local body = ply:GetBodyEntity() -- 36
	local viewer = ply:GetViewEntity() -- 37
	local alive = ply:Alive() -- 38
	local cls = body:GetClass() -- 39
	for _index_0 = 1, #bones do -- 40
		local bone = bones[_index_0] -- 40
		local shrink, not_shrink = Vector(0, 0, 0), Vector(1, 1, 1) -- 41
		local val = shrink -- 42
		if viewer ~= self then -- 43
			val = not_shrink -- 44
		elseif cls == "prop_ragdoll" and not alive then -- 45
			val = not_shrink -- 46
		elseif body == ply and alive then -- 47
			val = not_shrink -- 48
		end -- 43
		bone = body:LookupBone(bone) -- 49
		if bone then -- 50
			body:ManipulateBoneScale(bone, val) -- 50
		end -- 50
	end -- 50
	if viewer ~= ply then -- 51
		return -- 51
	end -- 51
	local attach = body:GetAttachment(body:LookupAttachment("eyes")) -- 52
	if ply:Fallen() then -- 53
		pos, angles = attach.Pos, attach.Ang -- 54
	end -- 53
	if (not third_cur_pos) then -- 56
		third_cur_pos = ply:GetPos() -- 57
		third_cur_ang = Angle() -- 58
		third_dest_pos = ply:GetPos() -- 59
		third_dest_ang = Angle() -- 60
	end -- 56
	if third_cur_pos then -- 61
		body = ply -- 62
		local rag = ply:Ragdoll() -- 63
		if rag and IsValid(rag) and (not ply:Alive()) then -- 64
			body = rag -- 65
			pos = body:GetPos() -- 66
		end -- 64
		local target_pos = body:EyePos() + ply:GetAimVector() * -40 -- 67
		target_pos = target_pos + body:GetForward() * -10 -- 68
		target_pos = target_pos + body:GetRight() * 35 -- 69
		local distance = 50 -- 70
		third_dest_ang = angles -- 71
		third_dest_pos = target_pos - third_dest_ang:Forward() * distance -- 72
		local tr = util.TraceLine({ -- 74
			start = pos, -- 74
			endpos = third_dest_pos, -- 75
			filter = { -- 76
				ply, -- 76
				body -- 76
			} -- 76
		}) -- 73
		third_dest_pos = pos + tr.Normal * (distance - 2) * tr.Fraction -- 78
		third_cur_pos = LerpVector(0.08, third_cur_pos, third_dest_pos) -- 79
		third_cur_ang = LerpAngle(0.5, third_cur_ang, third_dest_ang) -- 80
		local view = { -- 82
			origin = third_cur_pos, -- 82
			angles = third_cur_ang, -- 83
			fov = fov, -- 84
			drawviewer = true -- 85
		} -- 81
		if should_do_third_person() then -- 86
			return view -- 90
		end -- 86
	end -- 61
	local view = { -- 93
		origin = pos, -- 93
		angles = angles, -- 94
		fov = fov -- 95
	} -- 92
	return view -- 96
end -- 26
return hook.Add("CalcView", "evilrp_calcview", calc_view) -- 98
