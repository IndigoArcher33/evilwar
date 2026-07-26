-- [yue]: darkrp_modules\death\sh_death.yue
GAMEMODE.Deaths = function() -- 1
	return GetGlobalInt("DEATH") -- 1
end -- 1
local death -- 3
death = function(ply) -- 3
	local deaths = GAMEMODE.Deaths() + 1 -- 4
	SetGlobalInt("DEATH", deaths) -- 5
	local bodies = "BODIES" -- 6
	if deaths == 1 then -- 7
		bodies = "BODY" -- 7
	end -- 7
	local team = RPExtraTeams[ply:Team()] -- 9
	if team == TEAM_EMPEROR then -- 10
		ply:ConCommand("say /ad THE KOMMANDANT HAS FALLEN. LONG LIVE THE KOMMANDANT.") -- 11
	end -- 10
	return RunConsoleCommand("hostname", tostring(string.english_number(deaths):upper()) .. " DEAD " .. tostring(bodies) .. " TODAY") -- 13
end -- 3
return hook.Add("DoPlayerDeath", "evilrp_death", death) -- 15
