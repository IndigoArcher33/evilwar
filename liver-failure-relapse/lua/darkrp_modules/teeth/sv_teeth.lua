hook.Add("Initialize", "evilrp_setup_table_teeth", function()
	if not sql.TableExists("evilrp_teeth") then
		return sql.Query("CREATE TABLE evilrp_teeth( SteamID TEXT, Amount INTEGER )")
	end
end)
hook.Add("PlayerInitialSpawn", "evilrp_setup_teeth", function(ply)
	local teeth_check = sql.Query("SELECT SteamID, Amount FROM evilrp_teeth WHERE SteamID = '" .. ply:SteamID64() .. "'")
	if not teeth_check then
		sql.Query("INSERT INTO evilrp_teeth( SteamID, Amount ) VALUES( '" .. ply:SteamID64() .. "', 0 )")
	end
	local teeth = sql.Query("SELECT SteamID, Amount FROM evilrp_teeth WHERE SteamID = '" .. ply:SteamID64() .. "'")[1]
	if teeth then
		teeth = teeth.Amount
	end
	return ply:SetNWFloat("evilrp_teeth", tonumber(teeth or 0))
end)
local lose_teeth_on_death
lose_teeth_on_death = function(ply, attacker, dmg)
	if ply:Team() == TEAM_GHOST then
		return
	end
	local amount = -1
	if ply.death_by_neglect then
		amount = amount - 1
		ply.death_by_neglect = nil
	end
	local old_amt = ply:GetTeeth()
	ply:AddTeeth(amount)
	if old_amt ~= ply:GetTeeth() then
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
return hook.Add("DoPlayerDeath", "evilrp_lose_teeth_on_death", lose_teeth_on_death)
