-- [yue]: darkrp_modules\misc\sv_wipe.yue
local wipe -- 1
wipe = function(ply, cmd, args) -- 1
	if ply:EntIndex() ~= 0 and not ply:IsSuperAdmin() then -- 2
		return -- 2
	end -- 2
	MsgC(Color(200, 0, 0), "BEGINNING WIPE.\n") -- 3
	local starting_money = GAMEMODE.Config.startingmoney -- 4
	sql.Query("UPDATE darkrp_player SET wallet = '" .. tostring(starting_money) .. "'") -- 5
	MsgC(Color(200, 0, 0), "ALL PLAYER WALLETS WERE SET TO $" .. tostring(starting_money) .. ".\n") -- 6
	local _list_0 = { -- 7
		"Hunger", -- 7
		"Thirst", -- 7
		"Despair" -- 7
	} -- 7
	for _index_0 = 1, #_list_0 do -- 7
		local need = _list_0[_index_0] -- 7
		sql.Query("UPDATE evilrp_needs SET " .. tostring(need) .. " = '0'") -- 8
	end -- 8
	MsgC(Color(200, 0, 0), "ALL PLAYER NEEDS WERE FULLY EMPTIED.\n") -- 9
	sql.Query("DELETE FROM playerpdata") -- 11
	MsgC(Color(200, 0, 0), "ALL PLAYER INVENTORIES WERE FULLY EMPTIED.\n") -- 12
	local _list_1 = player.GetAll() -- 13
	for _index_0 = 1, #_list_1 do -- 13
		local p = _list_1[_index_0] -- 13
		p:SendChat("GENERIC", "<c=200,0,0>KISS YOUR PROGRESS GOODBYE.") -- 13
	end -- 13
	return timer.Simple(6.66, function() -- 14
		return RunConsoleCommand("changelevel", game.GetMap()) -- 14
	end) -- 14
end -- 1
return concommand.Add("rp_wipe", wipe) -- 15
