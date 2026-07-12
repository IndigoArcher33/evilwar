-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/hurt/sv_hurt.yue
local play_hurt_sound -- 1
play_hurt_sound = function(ent) -- 1
	local ct = CurTime() -- 2
	if not ent.NextGrunt then -- 3
		ent.NextGrunt = ct -- 4
	end -- 3
	if ent:IsPlayer() and ent:IsValid() and ent:Alive() then -- 5
		if (ct >= ent.NextGrunt and ent:Team() ~= TEAM_GHOST) then -- 6
			ent.NextGrunt = ct + math.random(0.5, 2) -- 7
			if ent.dont_scream then -- 8
				ent.dont_scream = false -- 9
			else -- 11
				local jt = ent:getJobTable() -- 11
				if jt.hurt_sounds then -- 12
					local sounds = jt.hurt_sounds -- 13
					local snd = sounds[math.random(1, #sounds)] -- 14
					ent:EmitSound(snd, 80, math.random(95, 110)) -- 15
				end -- 12
			end -- 8
		end -- 6
	end -- 5
	return -- 16
end -- 1
return hook.Add("EntityTakeDamage", "evilrp_hurt_sound", play_hurt_sound) -- 18
