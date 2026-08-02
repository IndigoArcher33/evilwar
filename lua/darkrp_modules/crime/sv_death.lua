-- [yue]: darkrp_modules\crime\sv_death.yue
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
	Chat.Announce("GENERIC", "<c=230,0,0>Despicable criminal " .. tostring(ply:Name()) .. " was slain. Good riddance!") -- 5
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
	if not Gamemode.CivilProtection[attacker:Team()] then -- 10
		return -- 10
	end -- 10
	if attacker == ply then -- 11
		return -- 11
	end -- 11
	attacker:Notify("<c=0,200,0>You have executed a criminal.") -- 12
	attacker:AddSteamCells(2) -- 13
	local cells = ply:GetStemCells() -- 14
	if not (cells > 0) then -- 15
		return -- 15
	end -- 15
	ply:AddStemCells(-2) -- 16
	return ply:Notify("<c=200,0,0>The long tentacle of the law got you.") -- 17
end -- 1
local regicide -- 19
regicide = function(ply, attacker, dmg) -- 19
	if not (attacker:IsPlayer() and attacker:Alive()) then -- 20
		return -- 20
	end -- 20
	if not (ply:IsPlayer() and ply:Team() == TEAM_EMPEROR) then -- 21
		return -- 21
	end -- 21
	if attacker:Wanted() then -- 22
		if attacker:WantedLength() <= CRIMES.regicide.duration then -- 23
			return -- 23
		end -- 23
	end -- 22
	return CRIMES.regicide:CommittedBy(attacker, ply) -- 25
end -- 19
local assault_and_battery -- 27
assault_and_battery = function(ent, dmg) -- 27
	if not (ent:IsPlayer() and ent:Alive()) then -- 28
		return -- 28
	end -- 28
	local attacker = dmg:GetAttacker() -- 29
	if not (attacker and IsValid(attacker)) then -- 30
		return -- 30
	end -- 30
	if not attacker:IsPlayer() then -- 31
		return -- 31
	end -- 31
	if ent:Wanted() then -- 32
		return -- 32
	end -- 32
	if ent:Team() == TEAM_EMPEROR then -- 33
		return -- 33
	end -- 33
	if attacker:Wanted() then -- 34
		if attacker:WantedLength() <= CRIMES.assault.duration then -- 35
			return -- 35
		end -- 35
	end -- 34
	return CRIMES.assault:CommittedBy(attacker, ent) -- 36
end -- 27
local attempted_assassination -- 38
attempted_assassination = function(ply, dmg) -- 38
	if not (ply:IsPlayer() and ply:Alive()) then -- 39
		return -- 39
	end -- 39
	if not (ply:IsPlayer() and ply:Team() == TEAM_EMPEROR) then -- 40
		return -- 40
	end -- 40
	local attacker = dmg:GetAttacker() -- 41
	if not (attacker and IsValid(attacker)) then -- 42
		return -- 42
	end -- 42
	if not attacker:IsPlayer() then -- 43
		return -- 43
	end -- 43
	if attacker:Wanted() then -- 44
		if attacker:WantedLength() <= CRIMES.assassination.duration then -- 45
			return -- 45
		end -- 45
	end -- 44
	return CRIMES.assassination:CommittedBy(attacker, ent) -- 46
end -- 38
hook.Add("EntityTakeDamage", "evilrp_assault_and_battery", assault_and_battery) -- 48
hook.Add("EntityTakeDamage", "evilrp_assassination", attempted_assassination) -- 49
hook.Add("DoPlayerDeath", "evilrp_justice", justice) -- 52
return hook.Add("DoPlayerDeath", "evilrp_regicide", regicide) -- 53
