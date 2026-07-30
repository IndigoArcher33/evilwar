-- [yue]: darkrp_modules\business\sv_business.yue
if not GAMEMODE.Stocks then -- 3
	GAMEMODE.Stocks = { -- 2
		["evilrp_melee/pipe"] = 5 -- 2
	} -- 1
end -- 3
net.Start("evilrp_receive_stocks") -- 5
net.WriteTable(GAMEMODE.Stocks) -- 6
net.Broadcast() -- 7
GAMEMODE.AddStock = function(self, item) -- 10
	local etab = scripted_ents.Get(item) or weapons.Get(item) -- 11
	if not etab then -- 13
		return -- 13
	end -- 13
	if self.Stocks[item] then -- 14
		local _obj_0 = self.Stocks -- 15
		_obj_0[item] = _obj_0[item] + 1 -- 15
	else -- 17
		self.Stocks[item] = 1 -- 17
	end -- 14
	local name = etab.PrintName -- 18
	local _list_0 = player.GetAll() -- 19
	for _index_0 = 1, #_list_0 do -- 19
		local p = _list_0[_index_0] -- 19
		local _continue_0 = false -- 20
		repeat -- 20
			if not p:Alive() then -- 20
				_continue_0 = true -- 20
				break -- 20
			end -- 20
			if not (p:Team() == TEAM_DEALER) then -- 21
				_continue_0 = true -- 21
				break -- 21
			end -- 21
			p:SendChat("NOTICE", "[+STOCK] " .. tostring(name) .. ": " .. tostring(self.Stocks[item])) -- 22
			_continue_0 = true -- 20
		until true -- 22
		if not _continue_0 then -- 22
			break -- 22
		end -- 22
	end -- 22
	net.Start("evilrp_receive_stocks") -- 23
	net.WriteTable(self.Stocks) -- 24
	return net.Broadcast() -- 25
end -- 10
local _obj_0 = GAMEMODE -- 27
_obj_0.taxes = _obj_0.taxes or { -- 28
	labor = 50, -- 28
	sales = 50 -- 29
} -- 27
SetGlobalInt("tax_labor", GAMEMODE.taxes.labor) -- 32
SetGlobalInt("tax_sales", GAMEMODE.taxes.sales) -- 33
local _obj_1 = GAMEMODE -- 35
_obj_1.taxes_stored = _obj_1.taxes_stored or { -- 36
	labor = 0, -- 36
	sales = 0 -- 37
} -- 35
