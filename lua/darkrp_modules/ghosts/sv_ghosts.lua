local ghostpoints = {
	["rp_liverfailure_kidneydagger"] = {
		Vector(4719, 1913, 337),
		Vector(1930, 1890, 321),
		Vector(3565, 1160, 321),
		Vector(4629, 1171, 369),
		Vector(4246, 2609, 241),
		Vector(3817, 2267, 321),
		Vector(3238, 2329, 250),
		Vector(4666, 3370, 241),
		Vector(743, 1922, 321)
	}
}
local ghost_reload
ghost_reload = function(ply, key)
	if ply:Team() == TEAM_GHOST then
		if key == IN_RELOAD then
			local gp = ghostpoints[game.GetMap()]
			if gp then
				return ply:SetPos(gp[math.random(1, #gp)])
			end
		end
	end
end
hook.Add("KeyPress", "evilrp_ghost_reload", ghost_reload)
local ghosts_dont_fall_damage
ghosts_dont_fall_damage = function(ply, speed)
	local team = ply:Team()
	if team == TEAM_GHOST then
		return 0
	end
	return
end
hook.Add("GetFallDamage", "evilrp_ghost_braces", ghosts_dont_fall_damage)
local only_respawn_ghosts
only_respawn_ghosts = function(ply)
	if not (ply:Team() == TEAM_GHOST) then
		return false
	end
end
hook.Add("PlayerDeathThink", "evilrp_disable_respawns", only_respawn_ghosts)
local ghosts_dont_damage
ghosts_dont_damage = function(ent)
	if ent:IsPlayer() and ent:IsValid() then
		local team = ent:Team()
		if team == TEAM_GHOST then
			return true
		end
	end
	return
end
hook.Add("EntityTakeDamage", "evilrp_ghost_damage", ghosts_dont_damage)
local ghosts_dont_spawn_props
ghosts_dont_spawn_props = function(ply, mdl)
	if ply:Team() == TEAM_GHOST then
		return false
	end
	return
end
hook.Add("PlayerSpawnProp", "evilrp_ghost_spawn", ghosts_dont_spawn_props)
local msgs = {
	"Spooks!",
	"Oh no, the spirits!",
	"My soul burns!",
	"The horror!",
	"Agh! A ghost!"
}
local ghosts_frighten_cotards
ghosts_frighten_cotards = function(ply, mv)
	if not (ply:Alive() and ply:HasOddity(ODDITY_COTARDISM)) then
		return
	end
	if ply:GetMoveType() == MOVETYPE_NOCLIP then
		return
	end
	if not ply.next_ghost_frighten then
		ply.next_ghost_frighten = CurTime()
	end
	if CurTime() < ply.next_ghost_frighten then
		return
	end
	ply.next_ghost_frighten = CurTime() + 10
	local range = 256 ^ 2
	local scared = false
	local _list_0 = player.GetAll()
	for _index_0 = 1, #_list_0 do
		local oply = _list_0[_index_0]
		if not (oply:Alive() and oply:Team() == TEAM_GHOST) then
			goto _continue_0
		end
		if not (ply:GetPos():DistToSqr(oply:GetPos()) <= range) then
			goto _continue_0
		end
		scared = true
		ply:AddDespair(5)
		::_continue_0::
	end
	if scared then
		ply:SendChat("GENERIC", "<c=200,0,0>" .. tostring(msgs[math.random(#msgs)]))
		ply:EmitSound("Startled")
		net.Start("evilrp_frighten")
		return net.Send(ply)
	end
end
return hook.Add("PlayerTick", "evilrp_ghost_think", ghosts_frighten_cotards)
