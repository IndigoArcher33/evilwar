if not GAMEMODE.Stocks then
	GAMEMODE.Stocks = { }
end
GAMEMODE.AddStock = function(self, item)
	local etab = scripted_ents.Get(item) or weapons.Get(item)
	if not etab then
		return
	end
	if self.Stocks[item] then
		local _obj_0 = self.Stocks
		_obj_0[item] = _obj_0[item] + 1
	else
		self.Stocks[item] = 1
	end
	local name = etab.PrintName
	local _list_0 = player.GetAll()
	for _index_0 = 1, #_list_0 do
		local p = _list_0[_index_0]
		if not p:Alive() then
			goto _continue_0
		end
		if not (p:Team() == TEAM_DEALER) then
			goto _continue_0
		end
		p:SendChat("NOTICE", "[+STOCK] " .. tostring(name) .. ": " .. tostring(self.Stocks[item]))
		::_continue_0::
	end
	net.Start("evilrp_receive_stocks")
	net.WriteTable(self.Stocks)
	return net.Broadcast()
end
local _obj_0 = GAMEMODE
_obj_0.taxes = _obj_0.taxes or {
	labor = 50,
	sales = 50
}
SetGlobalInt("tax_labor", GAMEMODE.taxes.labor)
SetGlobalInt("tax_sales", GAMEMODE.taxes.sales)
local _obj_1 = GAMEMODE
_obj_1.taxes_stored = _obj_1.taxes_stored or {
	labor = 0,
	sales = 0
}
