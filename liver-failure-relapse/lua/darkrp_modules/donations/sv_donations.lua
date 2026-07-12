-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/donations/sv_donations.yue
hook.Add("Initialize", "evilrp_setup_table_donations", function() -- 1
	if not sql.TableExists("evilrp_donations") then -- 2
		return sql.Query("CREATE TABLE evilrp_donations( SteamID TEXT, Donations TEXT )") -- 3
	end -- 2
end) -- 1
local get_donations_from_string -- 7
get_donations_from_string = function(str) -- 7
	local donos = { } -- 8
	if str and string.len(str) > 0 then -- 9
		local expl = string.Explode("|", str) -- 10
		for _index_0 = 1, #expl do -- 11
			local v = expl[_index_0] -- 11
			donos[#donos + 1] = v -- 11
		end -- 11
	end -- 9
	return donos -- 12
end -- 7
return hook.Add("PlayerInitialSpawn", "evilrp_setup_donations", function(ply) -- 14
	local donations_check = sql.Query("SELECT SteamID, Donations FROM evilrp_donations WHERE SteamID = '" .. ply:SteamID64() .. "'") -- 15
	if not donations_check then -- 16
		sql.Query("INSERT INTO evilrp_donations( SteamID, Donations ) VALUES( '" .. ply:SteamID64() .. "', '' )") -- 17
	end -- 16
	local donations = sql.Query("SELECT SteamID, Donations FROM evilrp_donations WHERE SteamID = '" .. ply:SteamID64() .. "'")[1] -- 18
	donations = get_donations_from_string(donations.Donations) -- 19
	ply.donations = donations -- 20
end) -- 20
