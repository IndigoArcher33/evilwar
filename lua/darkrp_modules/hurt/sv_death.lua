-- [yue]: darkrp_modules\hurt\sv_death.yue
local play_death_sound -- 1
play_death_sound = function(ply) -- 1
	if (ply:IsPlayer() and ply:IsValid() and (function() -- 2
		local _base_0 = ply -- 2
		local _fn_0 = _base_0.Team -- 2
		return _fn_0 and function(...) -- 2
			return _fn_0(_base_0, ...) -- 2
		end -- 2
	end)() ~= TEAM_GHOST) then -- 2
		local jt = ply:getJobTable() -- 3
		if jt.death_sounds then -- 4
			local sounds = jt.death_sounds -- 5
			local snd = sounds[math.random(1, #sounds)] -- 6
			ply:EmitSound(snd, 80, math.random(95, 110)) -- 7
		end -- 4
	end -- 2
	return -- 8
end -- 1
return hook.Add("DoPlayerDeath", "evilrp_death_sound", play_death_sound) -- 10
