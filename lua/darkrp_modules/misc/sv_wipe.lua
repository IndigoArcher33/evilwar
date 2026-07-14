local wipe
wipe = function(ply, cmd, args)
	if ply:EntIndex() ~= 0 and not ply:IsSuperAdmin() then
		return
	end
	MsgC(Color(200, 0, 0), "BEGINNING WIPE.\n")
	local starting_money = GAMEMODE.Config.startingmoney
	sql.Query("UPDATE darkrp_player SET wallet = '" .. tostring(starting_money) .. "'")
	MsgC(Color(200, 0, 0), "ALL PLAYER WALLETS WERE SET TO $" .. tostring(starting_money) .. ".\n")
	local _list_0 = {
		"Hunger",
		"Thirst",
		"Despair"
	}
	for _index_0 = 1, #_list_0 do
		local need = _list_0[_index_0]
		sql.Query("UPDATE evilrp_needs SET " .. tostring(need) .. " = '0'")
	end
	MsgC(Color(200, 0, 0), "ALL PLAYER NEEDS WERE FULLY EMPTIED.\n")
	sql.Query("DELETE FROM playerpdata")
	MsgC(Color(200, 0, 0), "ALL PLAYER INVENTORIES WERE FULLY EMPTIED.\n")
	local _list_1 = player.GetAll()
	for _index_0 = 1, #_list_1 do
		local p = _list_1[_index_0]
		p:SendChat("GENERIC", "<c=200,0,0>KISS YOUR PROGRESS GOODBYE.")
	end
	return timer.Simple(6.66, function()
		return RunConsoleCommand("changelevel", game.GetMap())
	end)
end
return concommand.Add("rp_wipe", wipe)
