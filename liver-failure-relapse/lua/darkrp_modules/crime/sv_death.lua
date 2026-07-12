-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/crime/sv_death.yue
local justice -- 1
justice = function(ply, attacker, dmg) -- 1
	if not (ply and IsValid(ply)) then -- 2
		return -- 2
	end -- 2
	if not ply:IsPlayer() then -- 3
		return -- 3
	end -- 3
	if not ply:Wanted() then -- 4
		return -- 4
	end -- 4
	ply:Notify("<c=0,200,0>Despicable criminal " .. tostring(ply:Name()) .. " was slain. Good riddance!") -- 5
	ply:MakeUnwanted() -- 6
	if not (attacker and IsValid(attacker)) then -- 7
		return -- 7
	end -- 7
	if not attacker:IsPlayer() then -- 8
		return -- 8
	end -- 8
	if attacker:Wanted() then -- 9
		return -- 9
	end -- 9
	if not (attacker:Team() == TEAM_SANITAR) then -- 10
		return -- 10
	end -- 10
	if attacker == ply then -- 11
		return -- 11
	end -- 11
	local cells = ply:GetStemCells() -- 12
	if not (cells > 0) then -- 13
		return -- 13
	end -- 13
	ply:AddStemCells(-1) -- 14
	return ply:Notify("<c=200,0,0>The long tentacle of the law got you.") -- 15
end -- 1
return hook.Add("DoPlayerDeath", "evilrp_justice", justice) -- 17
