local play_hurt_sound
play_hurt_sound = function(ent)
	local ct = CurTime()
	if not ent.NextGrunt then
		ent.NextGrunt = ct
	end
	if ent:IsPlayer() and ent:IsValid() and ent:Alive() then
		if (ct >= ent.NextGrunt and ent:Team() ~= TEAM_GHOST) then
			ent.NextGrunt = ct + math.random(0.5, 2)
			if ent.dont_scream then
				ent.dont_scream = false
			else
				local jt = ent:getJobTable()
				if jt.hurt_sounds then
					local sounds = jt.hurt_sounds
					local snd = sounds[math.random(1, #sounds)]
					ent:EmitSound(snd, 80, math.random(95, 110))
				end
			end
		end
	end
	return
end
return hook.Add("EntityTakeDamage", "evilrp_hurt_sound", play_hurt_sound)
