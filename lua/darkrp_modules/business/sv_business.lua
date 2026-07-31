-- [yue]: darkrp_modules\business\sv_business.yue
if not GAMEMODE.Stocks then -- 3
	GAMEMODE.Stocks = { -- 2
		["evilrp_melee/pipe"] = 5 -- 2
	} -- 1
end -- 3
GAMEMODE.AddStock = function(self, item) -- 6
	local etab = scripted_ents.Get(item) or weapons.Get(item) -- 7
	if not etab then -- 9
		return -- 9
	end -- 9
	if self.Stocks[item] then -- 10
		local _obj_0 = self.Stocks -- 11
		_obj_0[item] = _obj_0[item] + 1 -- 11
	else -- 13
		self.Stocks[item] = 1 -- 13
	end -- 10
	local name = etab.PrintName -- 14
	local _list_0 = player.GetAll() -- 15
	for _index_0 = 1, #_list_0 do -- 15
		local p = _list_0[_index_0] -- 15
		local _continue_0 = false -- 16
		repeat -- 16
			if not p:Alive() then -- 16
				_continue_0 = true -- 16
				break -- 16
			end -- 16
			if not (p:Team() == TEAM_DEALER) then -- 17
				_continue_0 = true -- 17
				break -- 17
			end -- 17
			p:SendChat("NOTICE", "[+STOCK] " .. tostring(name) .. ": " .. tostring(self.Stocks[item])) -- 18
			_continue_0 = true -- 16
		until true -- 18
		if not _continue_0 then -- 18
			break -- 18
		end -- 18
	end -- 18
	net.Start("evilrp_receive_stocks") -- 19
	net.WriteTable(self.Stocks) -- 20
	return net.Broadcast() -- 21
end -- 6
local _obj_0 = GAMEMODE -- 23
_obj_0.taxes = _obj_0.taxes or { -- 24
	labor = 50, -- 24
	sales = 50 -- 25
} -- 23
SetGlobalInt("tax_labor", GAMEMODE.taxes.labor) -- 28
SetGlobalInt("tax_sales", GAMEMODE.taxes.sales) -- 29
local _obj_1 = GAMEMODE -- 31
_obj_1.taxes_stored = _obj_1.taxes_stored or { -- 32
	labor = 0, -- 32
	sales = 0 -- 33
} -- 31
