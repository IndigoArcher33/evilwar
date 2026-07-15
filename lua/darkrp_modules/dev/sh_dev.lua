-- [yue]: darkrp_modules\dev\sh_dev.yue
local gph_callback -- 1
gph_callback = function(ply, cmd, args, argstr) -- 1
	if CLIENT then -- 2
		if not ply:IsAdmin() then -- 3
			if CLIENT then -- 4
				MsgC(Color(200, 0, 0), "You are too curious for your own good. This incident will be reported.\n") -- 4
			end -- 4
			return -- 5
		end -- 3
	end -- 2
	local p = ply:GetPos() -- 7
	MsgN("Vector( " .. tostring(math.ceil(p.x)) .. ", " .. tostring(math.ceil(p.y)) .. ", " .. tostring(math.ceil(p.z)) .. " )\n") -- 8
	local spawn = ClientsideModel("models/player/corpse1.mdl", RENDERGROUP_BOTH) -- 10
	spawn:SetPos(Vector(math.ceil(p.x), math.ceil(p.y), math.ceil(p.z))) -- 11
	spawn:SetRenderMode(RENDERMODE_GLOW) -- 12
	spawn:SetRenderFX(16) -- 13
	return spawn -- 10
end -- 1
concommand.Add("gph", gph_callback) -- 15
local gp_callback -- 17
gp_callback = function(ply, cmd, args, argstr) -- 17
	if CLIENT then -- 18
		if not ply:IsAdmin() then -- 19
			if CLIENT then -- 20
				MsgC(Color(200, 0, 0), "You are too curious for your own good. This incident will be reported.\n") -- 20
			end -- 20
			return -- 21
		end -- 19
	end -- 18
	local ent = ply:GetEyeTrace().Entity -- 23
	local p = ent:GetPos() -- 25
	MsgN("Vector( " .. tostring(math.ceil(p.x)) .. ", " .. tostring(math.ceil(p.y)) .. ", " .. tostring(math.ceil(p.z)) .. " )") -- 26
	local a = ent:GetAngles() -- 27
	return MsgN("Angle( " .. tostring(math.ceil(a.p)) .. ", " .. tostring(math.ceil(a.y)) .. ", " .. tostring(math.ceil(a.r)) .. " )") -- 28
end -- 17
return concommand.Add("gp", gp_callback) -- 30
