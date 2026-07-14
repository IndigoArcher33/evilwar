local ghost_invisibility
ghost_invisibility = function(ply)
	local lp = LocalPlayer()
	if (lp ~= ply) and (lp:Team() ~= TEAM_GHOST) and (ply:Team() == TEAM_GHOST) then
		if not lp:HasOddity(ODDITY_COTARDISM) then
			return true
		end
	end
	return
end
hook.Add("PrePlayerDraw", "evilrp_ghost_invisibility", ghost_invisibility)
local ghosts_cant_use
ghosts_cant_use = function(ply, bind, down)
	local lp = LocalPlayer()
	if (down and string.find(bind, "+use") and lp:Team() == TEAM_GHOST) then
		local et = LocalPlayer():GetEyeTrace()
		if (et.Entity and (not et.Entity:GetClass():find("portal/spawn"))) then
			return true
		end
	end
	return
end
return hook.Add("PlayerBindPress", "evilrp_ghost_cantuse", ghosts_cant_use)
