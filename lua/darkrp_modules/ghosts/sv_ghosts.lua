-- [yue]: darkrp_modules\ghosts\sv_ghosts.yue
local ghostpoints = { -- 2
	["rp_lymphoma"] = { -- 3
		Vector(-16, 1166, 99), -- 3
		Vector(396, -184, 292), -- 4
		Vector(-351, 852, 137), -- 5
		Vector(344, -7042, -816), -- 6
		Vector(-1121, 808, 88), -- 7
		Vector(846, 722, 65) -- 8
	} -- 2
} -- 1
local ghost_reload -- 12
ghost_reload = function(ply, key) -- 12
	if ply:Team() == TEAM_GHOST then -- 13
		if key == IN_RELOAD then -- 14
			local gp = ghostpoints[game.GetMap()] -- 15
			if gp then -- 16
				return ply:SetPos(gp[math.random(1, #gp)]) -- 17
			end -- 16
		end -- 14
	end -- 13
end -- 12
hook.Add("KeyPress", "evilrp_ghost_reload", ghost_reload) -- 19
local ghosts_dont_fall_damage -- 21
ghosts_dont_fall_damage = function(ply, speed) -- 21
	local team = ply:Team() -- 22
	if team == TEAM_GHOST then -- 23
		return 0 -- 24
	end -- 23
	return -- 25
end -- 21
hook.Add("GetFallDamage", "evilrp_ghost_braces", ghosts_dont_fall_damage) -- 27
local only_respawn_ghosts -- 29
only_respawn_ghosts = function(ply) -- 29
	if not (ply:Team() == TEAM_GHOST) then -- 30
		return false -- 30
	end -- 30
end -- 29
hook.Add("PlayerDeathThink", "evilrp_disable_respawns", only_respawn_ghosts) -- 31
local ghosts_dont_damage -- 33
ghosts_dont_damage = function(ent) -- 33
	if ent:IsPlayer() and ent:IsValid() then -- 34
		local team = ent:Team() -- 35
		if team == TEAM_GHOST then -- 36
			return true -- 37
		end -- 36
	end -- 34
	return -- 38
end -- 33
hook.Add("EntityTakeDamage", "evilrp_ghost_damage", ghosts_dont_damage) -- 40
local ghosts_dont_spawn_props -- 42
ghosts_dont_spawn_props = function(ply, mdl) -- 42
	if ply:Team() == TEAM_GHOST then -- 43
		return false -- 43
	end -- 43
	return -- 44
end -- 42
hook.Add("PlayerSpawnProp", "evilrp_ghost_spawn", ghosts_dont_spawn_props) -- 46
local msgs = { -- 49
	"Spooks!", -- 49
	"Oh no, the spirits!", -- 50
	"My soul burns!", -- 51
	"The horror!", -- 52
	"Agh! A ghost!" -- 53
} -- 48
local ghosts_frighten_cotards -- 55
ghosts_frighten_cotards = function(ply, mv) -- 55
	if not (ply:Alive() and ply:HasOddity(ODDITY_COTARDISM)) then -- 56
		return -- 56
	end -- 56
	if ply:GetMoveType() == MOVETYPE_NOCLIP then -- 57
		return -- 57
	end -- 57
	if not ply.next_ghost_frighten then -- 58
		ply.next_ghost_frighten = CurTime() -- 58
	end -- 58
	if CurTime() < ply.next_ghost_frighten then -- 59
		return -- 59
	end -- 59
	ply.next_ghost_frighten = CurTime() + 10 -- 60
	local range = 256 ^ 2 -- 61
	local scared = false -- 62
	local _list_0 = player.GetAll() -- 63
	for _index_0 = 1, #_list_0 do -- 63
		local oply = _list_0[_index_0] -- 63
		local _continue_0 = false -- 64
		repeat -- 64
			if not (oply:Alive() and oply:Team() == TEAM_GHOST) then -- 64
				_continue_0 = true -- 64
				break -- 64
			end -- 64
			if not (ply:GetPos():DistToSqr(oply:GetPos()) <= range) then -- 65
				_continue_0 = true -- 65
				break -- 65
			end -- 65
			scared = true -- 66
			ply:AddDespair(5) -- 67
			_continue_0 = true -- 64
		until true -- 67
		if not _continue_0 then -- 67
			break -- 67
		end -- 67
	end -- 67
	if scared then -- 68
		ply:SendChat("GENERIC", "<c=200,0,0>" .. tostring(msgs[math.random(#msgs)])) -- 69
		ply:EmitSound("Startled") -- 70
		net.Start("evilrp_frighten") -- 71
		return net.Send(ply) -- 72
	end -- 68
end -- 55
return hook.Add("PlayerTick", "evilrp_ghost_think", ghosts_frighten_cotards) -- 76
