hook.Add("Initialize", "evilrp_setup_table_needs", function()
	if not sql.TableExists("evilrp_needs") then
		return sql.Query("CREATE TABLE evilrp_needs( SteamID TEXT, Hunger FLOAT, Thirst FLOAT, Despair FLOAT )")
	end
end)
return hook.Add("PlayerInitialSpawn", "evilrp_setup_player_needs", function(ply)
	ply.evilrp_needs_rtable = sql.Query("SELECT SteamID, Hunger, Thirst, Despair FROM evilrp_needs WHERE SteamID = '" .. ply:SteamID64() .. "'")
	if not ply.evilrp_needs_rtable then
		sql.Query("INSERT INTO evilrp_needs( SteamID, Hunger, Thirst, Despair ) VALUES( '" .. ply:SteamID64() .. "', 0, 0, 0 )")
	end
	ply.evilrp_needs = sql.Query("SELECT SteamID, Hunger, Thirst, Despair FROM evilrp_needs WHERE SteamID = '" .. ply:SteamID64() .. "'")[1]
	ply:SetNWFloat("evilrp_needs_hunger", tonumber(ply.evilrp_needs.Hunger or 0))
	ply:SetNWFloat("evilrp_needs_thirst", tonumber(ply.evilrp_needs.Thirst or 0))
	return ply:SetNWFloat("evilrp_needs_despair", tonumber(ply.evilrp_needs.Despair or 0))
end)
