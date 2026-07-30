-- [yue]: darkrp_modules\needs\sv_needs.yue
hook.Add("Initialize", "evilrp_setup_table_needs", function() -- 1
	if not sql.TableExists("evilrp_needs") then -- 2
		return sql.Query("CREATE TABLE evilrp_needs( SteamID TEXT, Hunger FLOAT, Thirst FLOAT, Despair FLOAT )") -- 3
	end -- 2
end) -- 1
return hook.Add("PlayerInitialSpawn", "evilrp_setup_player_needs", function(ply) -- 5
	ply.evilrp_needs_rtable = sql.Query("SELECT SteamID, Hunger, Thirst, Despair FROM evilrp_needs WHERE SteamID = '" .. ply:SteamID64() .. "'") -- 6
	if not ply.evilrp_needs_rtable then -- 7
		sql.Query("INSERT INTO evilrp_needs( SteamID, Hunger, Thirst, Despair ) VALUES( '" .. ply:SteamID64() .. "', 0, 0, 0 )") -- 8
	end -- 7
	ply.evilrp_needs = sql.Query("SELECT SteamID, Hunger, Thirst, Despair FROM evilrp_needs WHERE SteamID = '" .. ply:SteamID64() .. "'")[1] -- 9
	ply:SetNWFloat("evilrp_needs_hunger", tonumber(0)) -- 10
	ply:SetNWFloat("evilrp_needs_thirst", tonumber(0)) -- 11
	return ply:SetNWFloat("evilrp_needs_despair", tonumber(0)) -- 12
end) -- 12
