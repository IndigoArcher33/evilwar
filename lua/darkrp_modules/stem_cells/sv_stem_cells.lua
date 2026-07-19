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
local reward_stem_cells_on_kill -- 29
reward_stem_cells_on_kill = function(ply, attacker, dmg) -- 29
	if ply:Team() == TEAM_GHOST then -- 30
		return -- 30
	end -- 30
	if not attacker or not attacker:IsPlayer() then -- 31
		return -- 31
	end -- 31
	if attacker == ply then -- 32
		return -- 32
	end -- 32
	local attackerJob = RPExtraTeams[attacker:Team()] -- 33
	local plyJob = RPExtraTeams[ply:Team()] -- 34
	if attackerJob.category == plyJob.category then -- 35
		local amount = -2 -- 36
		attacker:AddStemCells(amount) -- 37
		attacker:Notify("<c=200,0,0>I HAVE KILLED MY OWN BROTHER.") -- 38
		net.Start("evilrp_frighten") -- 39
		net.Send(attacker) -- 40
		return -- 41
	end -- 35
	local amount = 1 -- 43
	return attacker:AddStemCells(amount) -- 44
end -- 29
hook.Add("DoPlayerDeath", "evilrp_lose_stem_cells_on_death", lose_stem_cells_on_death) -- 47
return hook.Add("DoPlayerDeath", "evilrp_reward_stem_cells_on_kill", reward_stem_cells_on_kill) -- 48
