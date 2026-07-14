-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/business/sv_business.yue
if not GAMEMODE.Stocks then -- 1
	GAMEMODE.Stocks = { } -- 1
end -- 1
GAMEMODE.AddStock = function(self, item) -- 3
	local etab = scripted_ents.Get(item) or weapons.Get(item) -- 4
	if not etab then -- 6
		return -- 6
	end -- 6
	if self.Stocks[item] then -- 7
		local _obj_0 = self.Stocks -- 8
		_obj_0[item] = _obj_0[item] + 1 -- 8
	else -- 10
		self.Stocks[item] = 1 -- 10
	end -- 7
	local name = etab.PrintName -- 11
	local _list_0 = player.GetAll() -- 12
	for _index_0 = 1, #_list_0 do -- 12
		local p = _list_0[_index_0] -- 12
		local _continue_0 = false -- 13
		repeat -- 13
			if not p:Alive() then -- 13
				_continue_0 = true -- 13
				break -- 13
			end -- 13
			if not (p:Team() == TEAM_DEALER) then -- 14
				_continue_0 = true -- 14
				break -- 14
			end -- 14
			p:SendChat("NOTICE", "[+STOCK] " .. tostring(name) .. ": " .. tostring(self.Stocks[item])) -- 15
			_continue_0 = true -- 13
		until true -- 15
		if not _continue_0 then -- 15
			break -- 15
		end -- 15
	end -- 15
	net.Start("evilrp_receive_stocks") -- 16
	net.WriteTable(self.Stocks) -- 17
	return net.Broadcast() -- 18
end -- 3
local _obj_0 = GAMEMODE -- 20
_obj_0.taxes = _obj_0.taxes or { -- 21
	labor = 50, -- 21
	sales = 50 -- 22
} -- 20
SetGlobalInt("tax_labor", GAMEMODE.taxes.labor) -- 25
SetGlobalInt("tax_sales", GAMEMODE.taxes.sales) -- 26
local _obj_1 = GAMEMODE -- 28
_obj_1.taxes_stored = _obj_1.taxes_stored or { -- 29
	labor = 0, -- 29
	sales = 0 -- 30
} -- 28
