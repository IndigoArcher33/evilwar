-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/ghosts/sv_ghosts.yue
local ghostpoints = { -- 2
	["rp_liverfailure_kidneydagger"] = { -- 3
		Vector(4719, 1913, 337), -- 3
		Vector(1930, 1890, 321), -- 4
		Vector(3565, 1160, 321), -- 5
		Vector(4629, 1171, 369), -- 6
		Vector(4246, 2609, 241), -- 7
		Vector(3817, 2267, 321), -- 8
		Vector(3238, 2329, 250), -- 9
		Vector(4666, 3370, 241), -- 10
		Vector(743, 1922, 321) -- 11
	} -- 2
} -- 1
local ghost_reload -- 15
ghost_reload = function(ply, key) -- 15
	if ply:Team() == TEAM_GHOST then -- 16
		if key == IN_RELOAD then -- 17
			local gp = ghostpoints[game.GetMap()] -- 18
			if gp then -- 19
				return ply:SetPos(gp[math.random(1, #gp)]) -- 20
			end -- 19
		end -- 17
	end -- 16
end -- 15
hook.Add("KeyPress", "evilrp_ghost_reload", ghost_reload) -- 22
local ghosts_dont_fall_damage -- 24
ghosts_dont_fall_damage = function(ply, speed) -- 24
	local team = ply:Team() -- 25
	if team == TEAM_GHOST then -- 26
		return 0 -- 27
	end -- 26
	return -- 28
end -- 24
hook.Add("GetFallDamage", "evilrp_ghost_braces", ghosts_dont_fall_damage) -- 30
local only_respawn_ghosts -- 32
only_respawn_ghosts = function(ply) -- 32
	if not (ply:Team() == TEAM_GHOST) then -- 33
		return false -- 33
	end -- 33
end -- 32
hook.Add("PlayerDeathThink", "evilrp_disable_respawns", only_respawn_ghosts) -- 34
local ghosts_dont_damage -- 36
ghosts_dont_damage = function(ent) -- 36
	if ent:IsPlayer() and ent:IsValid() then -- 37
		local team = ent:Team() -- 38
		if team == TEAM_GHOST then -- 39
			return true -- 40
		end -- 39
	end -- 37
	return -- 41
end -- 36
hook.Add("EntityTakeDamage", "evilrp_ghost_damage", ghosts_dont_damage) -- 43
local ghosts_dont_spawn_props -- 45
ghosts_dont_spawn_props = function(ply, mdl) -- 45
	if ply:Team() == TEAM_GHOST then -- 46
		return false -- 46
	end -- 46
	return -- 47
end -- 45
hook.Add("PlayerSpawnProp", "evilrp_ghost_spawn", ghosts_dont_spawn_props) -- 49
local msgs = { -- 52
	"Spooks!", -- 52
	"Oh no, the spirits!", -- 53
	"My soul burns!", -- 54
	"The horror!", -- 55
	"Agh! A ghost!" -- 56
} -- 51
local ghosts_frighten_cotards -- 58
ghosts_frighten_cotards = function(ply, mv) -- 58
	if not (ply:Alive() and ply:HasOddity(ODDITY_COTARDISM)) then -- 59
		return -- 59
	end -- 59
	if ply:GetMoveType() == MOVETYPE_NOCLIP then -- 60
		return -- 60
	end -- 60
	if not ply.next_ghost_frighten then -- 61
		ply.next_ghost_frighten = CurTime() -- 61
	end -- 61
	if CurTime() < ply.next_ghost_frighten then -- 62
		return -- 62
	end -- 62
	ply.next_ghost_frighten = CurTime() + 10 -- 63
	local range = 256 ^ 2 -- 64
	local scared = false -- 65
	local _list_0 = player.GetAll() -- 66
	for _index_0 = 1, #_list_0 do -- 66
		local oply = _list_0[_index_0] -- 66
		local _continue_0 = false -- 67
		repeat -- 67
			if not (oply:Alive() and oply:Team() == TEAM_GHOST) then -- 67
				_continue_0 = true -- 67
				break -- 67
			end -- 67
			if not (ply:GetPos():DistToSqr(oply:GetPos()) <= range) then -- 68
				_continue_0 = true -- 68
				break -- 68
			end -- 68
			scared = true -- 69
			ply:AddDespair(5) -- 70
			_continue_0 = true -- 67
		until true -- 70
		if not _continue_0 then -- 70
			break -- 70
		end -- 70
	end -- 70
	if scared then -- 71
		ply:SendChat("GENERIC", "<c=200,0,0>" .. tostring(msgs[math.random(#msgs)])) -- 72
		ply:EmitSound("Startled") -- 73
		net.Start("evilrp_frighten") -- 74
		return net.Send(ply) -- 75
	end -- 71
end -- 58
return hook.Add("PlayerTick", "evilrp_ghost_think", ghosts_frighten_cotards) -- 79
