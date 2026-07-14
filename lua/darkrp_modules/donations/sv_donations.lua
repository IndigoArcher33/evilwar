hook.Add("Initialize", "evilrp_setup_table_donations", function()
	if not sql.TableExists("evilrp_donations") then
		return sql.Query("CREATE TABLE evilrp_donations( SteamID TEXT, Donations TEXT )")
	end
end)
local get_donations_from_string
get_donations_from_string = function(str)
	local donos = { }
	if str and string.len(str) > 0 then
		local expl = string.Explode("|", str)
		for _index_0 = 1, #expl do
			local v = expl[_index_0]
			donos[#donos + 1] = v
		end
	end
	return donos
end
return hook.Add("PlayerInitialSpawn", "evilrp_setup_donations", function(ply)
	local donations_check = sql.Query("SELECT SteamID, Donations FROM evilrp_donations WHERE SteamID = '" .. ply:SteamID64() .. "'")
	if not donations_check then
		sql.Query("INSERT INTO evilrp_donations( SteamID, Donations ) VALUES( '" .. ply:SteamID64() .. "', '' )")
	end
	local donations = sql.Query("SELECT SteamID, Donations FROM evilrp_donations WHERE SteamID = '" .. ply:SteamID64() .. "'")[1]
	donations = get_donations_from_string(donations.Donations)
	ply.donations = donations
end)
