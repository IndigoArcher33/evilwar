-- [yue]: darkrp_modules\stem_cells\sv_stem_cells.yue
hook.Add("Initialize", "evilrp_setup_table_stem_cells", function() -- 1
	if not sql.TableExists("evilrp_stem_cells") then -- 2
		return sql.Query("CREATE TABLE evilrp_stem_cells( SteamID TEXT, Amount INTEGER )") -- 3
	end -- 2
end) -- 1
hook.Add("PlayerInitialSpawn", "evilrp_setup_stem_cells", function(ply) -- 5
	local stem_cells_check = sql.Query("SELECT SteamID, Amount FROM evilrp_stem_cells WHERE SteamID = '" .. ply:SteamID64() .. "'") -- 6
	if not stem_cells_check then -- 7
		sql.Query("INSERT INTO evilrp_stem_cells( SteamID, Amount ) VALUES( '" .. ply:SteamID64() .. "', 0 )") -- 8
	end -- 7
	local stem_cells = sql.Query("SELECT SteamID, Amount FROM evilrp_stem_cells WHERE SteamID = '" .. ply:SteamID64() .. "'")[1] -- 9
	if stem_cells then -- 10
		stem_cells = stem_cells.Amount -- 10
	end -- 10
	return ply:SetNWFloat("evilrp_stem_cells", tonumber(stem_cells or 0)) -- 11
end) -- 5
local lose_stem_cells_on_death -- 13
lose_stem_cells_on_death = function(ply, attacker, dmg) -- 13
	if ply:Team() == TEAM_GHOST then -- 14
		return -- 14
	end -- 14
	local amount = -1 -- 15
	if ply.death_by_neglect then -- 16
		amount = amount - 1 -- 17
		ply.death_by_neglect = nil -- 18
	end -- 16
	local old_amt = ply:GetStemCells() -- 19
	ply:AddStemCells(amount) -- 20
	if old_amt ~= ply:GetStemCells() then -- 21
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
return hook.Add("DoPlayerDeath", "evilrp_lose_stem_cells_on_death", lose_stem_cells_on_death) -- 29
