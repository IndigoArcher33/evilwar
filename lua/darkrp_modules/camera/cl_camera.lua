-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/camera/cl_camera.yue
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
	local alive = ply:Alive() -- 37
	local cls = body:GetClass() -- 38
	for _index_0 = 1, #bones do -- 39
		local bone = bones[_index_0] -- 39
		local shrink, not_shrink = Vector(0, 0, 0), Vector(1, 1, 1) -- 40
		local val = shrink -- 41
		if cls == "prop_ragdoll" and not alive then -- 42
			val = not_shrink -- 43
		elseif body == ply and alive then -- 44
			val = not_shrink -- 45
		end -- 42
		bone = body:LookupBone(bone) -- 46
		if bone then -- 47
			body:ManipulateBoneScale(bone, val) -- 47
		end -- 47
	end -- 47
	local attach = body:GetAttachment(body:LookupAttachment("eyes")) -- 48
	if ply:Fallen() then -- 49
		pos, angles = attach.Pos, attach.Ang -- 50
	end -- 49
	if (not third_cur_pos) then -- 52
		third_cur_pos = ply:GetPos() -- 53
		third_cur_ang = Angle() -- 54
		third_dest_pos = ply:GetPos() -- 55
		third_dest_ang = Angle() -- 56
	end -- 52
	if third_cur_pos then -- 57
		body = ply -- 58
		local rag = ply:Ragdoll() -- 59
		if rag and IsValid(rag) and (not ply:Alive()) then -- 60
			body = rag -- 61
			pos = body:GetPos() -- 62
		end -- 60
		local target_pos = body:EyePos() + ply:GetAimVector() * -40 -- 63
		target_pos = target_pos + body:GetForward() * -10 -- 64
		target_pos = target_pos + body:GetRight() * 35 -- 65
		local distance = 50 -- 66
		third_dest_ang = angles -- 67
		third_dest_pos = target_pos - third_dest_ang:Forward() * distance -- 68
		local tr = util.TraceLine({ -- 70
			start = pos, -- 70
			endpos = third_dest_pos, -- 71
			filter = { -- 72
				ply, -- 72
				body -- 72
			} -- 72
		}) -- 69
		third_dest_pos = pos + tr.Normal * (distance - 2) * tr.Fraction -- 74
		third_cur_pos = LerpVector(0.08, third_cur_pos, third_dest_pos) -- 75
		third_cur_ang = LerpAngle(0.5, third_cur_ang, third_dest_ang) -- 76
		local view = { -- 78
			origin = third_cur_pos, -- 78
			angles = third_cur_ang, -- 79
			fov = fov, -- 80
			drawviewer = true -- 81
		} -- 77
		if should_do_third_person() then -- 82
			return view -- 86
		end -- 82
	end -- 57
	local view = { -- 89
		origin = pos, -- 89
		angles = angles, -- 90
		fov = fov -- 91
	} -- 88
	return view -- 92
end -- 26
return hook.Add("CalcView", "evilrp_calcview", calc_view) -- 94
