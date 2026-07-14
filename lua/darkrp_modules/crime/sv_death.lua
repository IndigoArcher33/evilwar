local justice
justice = function(ply, attacker, dmg)
	if not (ply and IsValid(ply)) then
		return
	end
	if not ply:IsPlayer() then
		return
	end
	if not ply:Wanted() then
		return
	end
	ply:Notify("<c=0,200,0>Despicable criminal " .. tostring(ply:Name()) .. " was slain. Good riddance!")
	ply:MakeUnwanted()
	if not (attacker and IsValid(attacker)) then
		return
	end
	if not attacker:IsPlayer() then
		return
	end
	if attacker:Wanted() then
		return
	end
	if not (attacker:Team() == TEAM_SANITAR) then
		return
	end
	if attacker == ply then
		return
	end
	local cells = ply:GetStemCells()
	if not (cells > 0) then
		return
	end
	ply:AddStemCells(-1)
	return ply:Notify("<c=200,0,0>The long tentacle of the law got you.")
end
return hook.Add("DoPlayerDeath", "evilrp_justice", justice)
