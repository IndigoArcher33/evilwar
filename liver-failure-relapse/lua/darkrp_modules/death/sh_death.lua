GAMEMODE.Deaths = function()
	return GetGlobalInt("DEATH")
end
local death
death = function(ply)
	local deaths = GAMEMODE.Deaths() + 1
	SetGlobalInt("DEATH", deaths)
	local bodies = "BODIES"
	if deaths == 1 then
		bodies = "BODY"
	end
	return RunConsoleCommand("hostname", tostring(string.english_number(deaths):upper()) .. " DEAD " .. tostring(bodies) .. " TODAY")
end
return hook.Add("DoPlayerDeath", "evilrp_death", death)
