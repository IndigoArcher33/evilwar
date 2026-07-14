local reanimate_burning
reanimate_burning = function(ent, dmg)
	if (not ent:IsPlayer() and not ent:IsValid()) then
		return
	end
	if not ((dmg:GetDamageType() == 8 or ent:GetNWBool("burning")) and ent:IsPlayer()) then
		return
	end
	if not (ent:Health() < 10 and math.random(15, 50) == 50) then
		return
	end
	if (ent:Team() == TEAM_BONEHEAD) then
		return
	end
	ent:changeTeam(TEAM_BONEHEAD)
	ent:SetHealth(100)
	ent:Ignite(600, 48)
	return
end
return hook.Add("EntityTakeDamage", "evilrp_burning_reanimate", reanimate_burning)
