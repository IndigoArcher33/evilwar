-- [yue]: darkrp_modules\teeth\sv_teeth.yue
hook.Add("Initialize", "evilrp_setup_table_teeth", function() -- 1
	if not sql.TableExists("evilrp_teeth") then -- 2
		return sql.Query("CREATE TABLE evilrp_teeth( SteamID TEXT, Amount INTEGER )") -- 3
	end -- 2
end) -- 1
hook.Add("PlayerInitialSpawn", "evilrp_setup_teeth", function(ply) -- 5
	local teeth_check = sql.Query("SELECT SteamID, Amount FROM evilrp_teeth WHERE SteamID = '" .. ply:SteamID64() .. "'") -- 6
	if not teeth_check then -- 7
		sql.Query("INSERT INTO evilrp_teeth( SteamID, Amount ) VALUES( '" .. ply:SteamID64() .. "', 0 )") -- 8
	end -- 7
	local teeth = sql.Query("SELECT SteamID, Amount FROM evilrp_teeth WHERE SteamID = '" .. ply:SteamID64() .. "'")[1] -- 9
	if teeth then -- 10
		teeth = teeth.Amount -- 10
	end -- 10
	return ply:SetNWFloat("evilrp_teeth", tonumber(teeth or 0)) -- 11
end) -- 5
local lose_teeth_on_death -- 13
lose_teeth_on_death = function(ply, attacker, dmg) -- 13
	if ply:Team() == TEAM_GHOST then -- 14
		return -- 14
	end -- 14
	local amount = -1 -- 15
	if ply.death_by_neglect then -- 16
		amount = amount - 1 -- 17
		ply.death_by_neglect = nil -- 18
	end -- 16
	local old_amt = ply:GetTeeth() -- 19
	ply:AddTeeth(amount) -- 20
	if old_amt ~= ply:GetTeeth() then -- 21
		return timer.Simple(1, function() -- 22
			if not (ply and ply:IsValid() and ply:IsPlayer()) then -- 23
				return -- 23
			end -- 23
			local rag = ply:Ragdoll() -- 24
			if not (rag and IsValid(rag)) then -- 25
				return -- 25
			end -- 25
			return rag:SetNWInt("sanitar_cells", math.abs(amount)) -- 26
		end) -- 27
	end -- 21
end -- 13
return hook.Add("DoPlayerDeath", "evilrp_lose_teeth_on_death", lose_teeth_on_death) -- 29
