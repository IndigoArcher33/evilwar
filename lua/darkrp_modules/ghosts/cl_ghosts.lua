-- [yue]: darkrp_modules\ghosts\cl_ghosts.yue
local ghost_invisibility -- 1
ghost_invisibility = function(ply) -- 1
	local lp = LocalPlayer() -- 2
	if (lp ~= ply) and (lp:Team() ~= TEAM_GHOST) and (ply:Team() == TEAM_GHOST) then -- 3
		if not lp:HasOddity(ODDITY_COTARDISM) then -- 4
			return true -- 4
		end -- 4
	end -- 3
	return -- 5
end -- 1
hook.Add("PrePlayerDraw", "evilrp_ghost_invisibility", ghost_invisibility) -- 7
local ghosts_cant_use -- 9
ghosts_cant_use = function(ply, bind, down) -- 9
	local lp = LocalPlayer() -- 10
	if (down and string.find(bind, "+use") and lp:Team() == TEAM_GHOST) then -- 11
		local et = LocalPlayer():GetEyeTrace() -- 12
		if (et.Entity and (not et.Entity:GetClass():find("portal/spawn"))) then -- 13
			return true -- 15
		end -- 13
	end -- 11
	return -- 16
end -- 9
return hook.Add("PlayerBindPress", "evilrp_ghost_cantuse", ghosts_cant_use) -- 18
