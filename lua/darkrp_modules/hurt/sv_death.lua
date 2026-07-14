local play_death_sound
play_death_sound = function(ply)
	if (ply:IsPlayer() and ply:IsValid() and (function()
		local _base_0 = ply
		local _fn_0 = _base_0.Team
		return _fn_0 and function(...)
			return _fn_0(_base_0, ...)
		end
	end)() ~= TEAM_GHOST) then
		local jt = ply:getJobTable()
		if jt.death_sounds then
			local sounds = jt.death_sounds
			local snd = sounds[math.random(1, #sounds)]
			ply:EmitSound(snd, 80, math.random(95, 110))
		end
	end
	return
end
return hook.Add("DoPlayerDeath", "evilrp_death_sound", play_death_sound)
