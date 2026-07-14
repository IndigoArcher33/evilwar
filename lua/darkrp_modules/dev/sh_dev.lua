local gph_callback
gph_callback = function(ply, cmd, args, argstr)
	if CLIENT then
		if not ply:IsAdmin() then
			if CLIENT then
				MsgC(Color(200, 0, 0), "You are too curious for your own good. This incident will be reported.\n")
			end
			return
		end
	end
	local p = ply:GetPos()
	MsgN("Vector( " .. tostring(math.ceil(p.x)) .. ", " .. tostring(math.ceil(p.y)) .. ", " .. tostring(math.ceil(p.z)) .. " )\n")
	local spawn = ClientsideModel("models/player/corpse1.mdl", RENDERGROUP_BOTH)
	spawn:SetPos(Vector(math.ceil(p.x), math.ceil(p.y), math.ceil(p.z)))
	spawn:SetRenderMode(RENDERMODE_GLOW)
	spawn:SetRenderFX(16)
	return spawn
end
concommand.Add("gph", gph_callback)
local gp_callback
gp_callback = function(ply, cmd, args, argstr)
	if CLIENT then
		if not ply:IsAdmin() then
			if CLIENT then
				MsgC(Color(200, 0, 0), "You are too curious for your own good. This incident will be reported.\n")
			end
			return
		end
	end
	local ent = ply:GetEyeTrace().Entity
	local p = ent:GetPos()
	MsgN("Vector( " .. tostring(math.ceil(p.x)) .. ", " .. tostring(math.ceil(p.y)) .. ", " .. tostring(math.ceil(p.z)) .. " )")
	local a = ent:GetAngles()
	return MsgN("Angle( " .. tostring(math.ceil(a.p)) .. ", " .. tostring(math.ceil(a.y)) .. ", " .. tostring(math.ceil(a.r)) .. " )")
end
return concommand.Add("gp", gp_callback)
