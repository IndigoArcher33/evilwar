local should_do_third_person
should_do_third_person = function()
	local lp = LocalPlayer()
	local rag = lp:Ragdoll()
	local team = lp:Team()
	if lp.gT_TextEntry and IsValid(lp.gT_TextEntry) then
		return false
	end
	if rag and IsValid(rag) and (not lp:Alive()) then
		return true
	end
	if team == TEAM_GHOST or team == TEAM_BONEHEAD then
		return true
	end
	if cookie.GetNumber("evilrp_thirdperson", 0) == 1 then
		return true
	end
	return false
end
local toggle_third_person
toggle_third_person = function(ply, cmd, args)
	return cookie.Set("evilrp_thirdperson", 1 - cookie.GetNumber("evilrp_thirdperson", 0))
end
concommand.Add("rp_thirdperson", toggle_third_person)
local bones = {
	"ValveBiped.Bip01_Head1",
	"ValveBiped.Bip01_Neck1"
}
local calc_view
calc_view = function(ply, pos, angles, fov, znear, zfar)
	if not evil_fov then
		evil_fov = fov
	end
	local terminal = ply.gterm_entity
	if terminal and IsValid(terminal) then
		fov = fov - 23
	end
	evil_fov = Lerp(FrameTime() * 3, evil_fov, fov)
	fov = evil_fov
	local body = ply:GetBodyEntity()
	local viewer = ply:GetViewEntity()
	local alive = ply:Alive()
	local cls = body:GetClass()
	for _index_0 = 1, #bones do
		local bone = bones[_index_0]
		local shrink, not_shrink = Vector(0, 0, 0), Vector(1, 1, 1)
		local val = shrink
		if viewer ~= self then
			val = not_shrink
		elseif cls == "prop_ragdoll" and not alive then
			val = not_shrink
		elseif body == ply and alive then
			val = not_shrink
		end
		bone = body:LookupBone(bone)
		if bone then
			body:ManipulateBoneScale(bone, val)
		end
	end
	if viewer ~= ply then
		return
	end
	local attach = body:GetAttachment(body:LookupAttachment("eyes"))
	if ply:Fallen() then
		pos, angles = attach.Pos, attach.Ang
	end
	if (not third_cur_pos) then
		third_cur_pos = ply:GetPos()
		third_cur_ang = Angle()
		third_dest_pos = ply:GetPos()
		third_dest_ang = Angle()
	end
	if third_cur_pos then
		body = ply
		local rag = ply:Ragdoll()
		if rag and IsValid(rag) and (not ply:Alive()) then
			body = rag
			pos = body:GetPos()
		end
		local target_pos = body:EyePos() + ply:GetAimVector() * -40
		target_pos = target_pos + body:GetForward() * -10
		target_pos = target_pos + body:GetRight() * 35
		local distance = 50
		third_dest_ang = angles
		third_dest_pos = target_pos - third_dest_ang:Forward() * distance
		local tr = util.TraceLine({
			start = pos,
			endpos = third_dest_pos,
			filter = {
				ply,
				body
			}
		})
		third_dest_pos = pos + tr.Normal * (distance - 2) * tr.Fraction
		third_cur_pos = LerpVector(0.08, third_cur_pos, third_dest_pos)
		third_cur_ang = LerpAngle(0.5, third_cur_ang, third_dest_ang)
		local view = {
			origin = third_cur_pos,
			angles = third_cur_ang,
			fov = fov,
			drawviewer = true
		}
		if should_do_third_person() then
			return view
		end
	end
	local view = {
		origin = pos,
		angles = angles,
		fov = fov
	}
	return view
end
return hook.Add("CalcView", "evilrp_calcview", calc_view)
