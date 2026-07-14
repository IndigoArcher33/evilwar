hook.Add("Initialize", "evilrp_setup_table_stem_cells", function()
	if not sql.TableExists("evilrp_stem_cells") then
		return sql.Query("CREATE TABLE evilrp_stem_cells( SteamID TEXT, Amount INTEGER )")
	end
end)
hook.Add("PlayerInitialSpawn", "evilrp_setup_stem_cells", function(ply)
	local stem_cells_check = sql.Query("SELECT SteamID, Amount FROM evilrp_stem_cells WHERE SteamID = '" .. ply:SteamID64() .. "'")
	if not stem_cells_check then
		sql.Query("INSERT INTO evilrp_stem_cells( SteamID, Amount ) VALUES( '" .. ply:SteamID64() .. "', 0 )")
	end
	local stem_cells = sql.Query("SELECT SteamID, Amount FROM evilrp_stem_cells WHERE SteamID = '" .. ply:SteamID64() .. "'")[1]
	if stem_cells then
		stem_cells = stem_cells.Amount
	end
	return ply:SetNWFloat("evilrp_stem_cells", tonumber(stem_cells or 0))
end)
local lose_stem_cells_on_death
lose_stem_cells_on_death = function(ply, attacker, dmg)
	if ply:Team() == TEAM_GHOST then
		return
	end
	local amount = -1
	if ply.death_by_neglect then
		amount = amount - 1
		ply.death_by_neglect = nil
	end
	local old_amt = ply:GetStemCells()
	ply:AddStemCells(amount)
	if old_amt ~= ply:GetStemCells() then
		return timer.Simple(1, function()
			if not (ply and ply:IsValid() and ply:IsPlayer()) then
				return
			end
			local rag = ply:Ragdoll()
			if not (rag and IsValid(rag)) then
				return
			end
			return rag:SetNWInt("sanitar_cells", math.abs(amount))
		end)
	end
end
return hook.Add("DoPlayerDeath", "evilrp_lose_stem_cells_on_death", lose_stem_cells_on_death)
