-- [yue]: darkrp_modules\needs\sv_needs.yue
hook.Add("Initialize", "evilrp_setup_table_needs", function() -- 1
	if not sql.TableExists("evilrp_needs") then -- 2
		return sql.Query("CREATE TABLE evilrp_needs( SteamID TEXT, Hunger FLOAT, Thirst FLOAT, Despair FLOAT )") -- 3
	end -- 2
end) -- 1
hook.Add("PlayerInitialSpawn", "evilrp_setup_player_needs", function(ply) -- 5
	ply.evilrp_needs_rtable = sql.Query("SELECT SteamID, Hunger, Thirst, Despair FROM evilrp_needs WHERE SteamID = '" .. ply:SteamID64() .. "'") -- 6
	if not ply.evilrp_needs_rtable then -- 7
		sql.Query("INSERT INTO evilrp_needs( SteamID, Hunger, Thirst, Despair ) VALUES( '" .. ply:SteamID64() .. "', 0, 0, 0 )") -- 8
	else -- 10
		sql.Query("UPDATE evilrp_needs SET Hunger = 0, Thirst = 0, Despair = 0 WHERE SteamID = '" .. ply:SteamID64() .. "'") -- 10
	end -- 7
	ply.evilrp_needs = sql.Query("SELECT SteamID, Hunger, Thirst, Despair FROM evilrp_needs WHERE SteamID = '" .. ply:SteamID64() .. "'")[1] -- 11
	ply:SetNWFloat("evilrp_needs_hunger", tonumber(0)) -- 12
	ply:SetNWFloat("evilrp_needs_thirst", tonumber(0)) -- 13
	return ply:SetNWFloat("evilrp_needs_despair", tonumber(0)) -- 14
end) -- 5
return hook.Add("PlayerSpawn", "evilrp_setup_player_needs", function(ply) -- 16
	sql.Query("UPDATE evilrp_needs SET Hunger = 0, Thirst = 0, Despair = 0 WHERE SteamID = '" .. ply:SteamID64() .. "'") -- 18
	ply.evilrp_needs = sql.Query("SELECT SteamID, Hunger, Thirst, Despair FROM evilrp_needs WHERE SteamID = '" .. ply:SteamID64() .. "'")[1] -- 19
	ply:SetNWFloat("evilrp_needs_hunger", tonumber(0)) -- 20
	ply:SetNWFloat("evilrp_needs_thirst", tonumber(0)) -- 21
	return ply:SetNWFloat("evilrp_needs_despair", tonumber(0)) -- 22
end) -- 22
