-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/fire/sv_ignite.yue
local max, min, random = math.max, math.min, math.random -- 1
local damage_igniting -- 3
damage_igniting = function(ent, dmg) -- 3
	local ct = CurTime() -- 4
	if (dmg:GetDamageType() == DMG_BURN and not ent:IsOnFire() and ent:GetClass() ~= "prop_dynamic" and math.random(1, 100) < 35 and not ent.NoBurn and not (ent:IsPlayer() and ent:Team() == TEAM_GHOST)) then -- 5
		ent:Ignite(math.random(5, 15), 48) -- 6
	end -- 5
	return -- 7
end -- 3
hook.Add("EntityTakeDamage", "evilrp_ignite", damage_igniting) -- 8
local death_extinguish -- 10
death_extinguish = function(ply) -- 10
	ply:Extinguish() -- 11
	return -- 12
end -- 10
return hook.Add("DoPlayerDeath", "evilrp_death_extinguish", death_extinguish) -- 13
