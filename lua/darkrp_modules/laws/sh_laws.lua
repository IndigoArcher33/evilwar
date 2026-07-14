local _obj_0 = GAMEMODE
_obj_0.laws = _obj_0.laws or { }
GAMEMODE.default_laws = {
	"Liver Failure Forever."
}
GAMEMODE.Laws = function(self)
	local _tab_0 = { }
	local _obj_1 = self.default_laws
	local _idx_0 = 1
	for _key_0, _value_0 in pairs(_obj_1) do
		if _idx_0 == _key_0 then
			_tab_0[#_tab_0 + 1] = _value_0
			_idx_0 = _idx_0 + 1
		else
			_tab_0[_key_0] = _value_0
		end
	end
	local _obj_2 = self.laws
	local _idx_1 = 1
	for _key_0, _value_0 in pairs(_obj_2) do
		if _idx_1 == _key_0 then
			_tab_0[#_tab_0 + 1] = _value_0
			_idx_1 = _idx_1 + 1
		else
			_tab_0[_key_0] = _value_0
		end
	end
	return _tab_0
end
