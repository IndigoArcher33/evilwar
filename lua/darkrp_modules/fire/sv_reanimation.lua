-- [yue]: /mnt/c/Program Files (x86)/Steam/steamapps/common/GarrysMod/garrysmod/addons/DarkRPmodification/lua/darkrp_modules/fire/sv_reanimation.yue
local reanimate_burning -- 1
reanimate_burning = function(ent, dmg) -- 1
	if (not ent:IsPlayer() and not ent:IsValid()) then -- 2
		return -- 3
	end -- 2
	if not ((dmg:GetDamageType() == 8 or ent:GetNWBool("burning")) and ent:IsPlayer()) then -- 4
		return -- 5
	end -- 4
	if not (ent:Health() < 10 and math.random(15, 50) == 50) then -- 6
		return -- 7
	end -- 6
	if (ent:Team() == TEAM_BONEHEAD) then -- 8
		return -- 9
	end -- 8
	ent:changeTeam(TEAM_BONEHEAD) -- 10
	ent:SetHealth(100) -- 11
	ent:Ignite(600, 48) -- 12
	return -- 13
end -- 1
return hook.Add("EntityTakeDamage", "evilrp_burning_reanimate", reanimate_burning) -- 15
