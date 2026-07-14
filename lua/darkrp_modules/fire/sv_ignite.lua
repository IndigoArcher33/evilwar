local max, min, random = math.max, math.min, math.random
local damage_igniting
damage_igniting = function(ent, dmg)
	local ct = CurTime()
	if (dmg:GetDamageType() == DMG_BURN and not ent:IsOnFire() and ent:GetClass() ~= "prop_dynamic" and math.random(1, 100) < 35 and not ent.NoBurn and not (ent:IsPlayer() and ent:Team() == TEAM_GHOST)) then
		ent:Ignite(math.random(5, 15), 48)
	end
	return
end
hook.Add("EntityTakeDamage", "evilrp_ignite", damage_igniting)
local death_extinguish
death_extinguish = function(ply)
	ply:Extinguish()
	return
end
return hook.Add("DoPlayerDeath", "evilrp_death_extinguish", death_extinguish)
