-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/laws/sh_laws.yue
local _obj_0 = GAMEMODE -- 1
_obj_0.laws = _obj_0.laws or { } -- 1
GAMEMODE.default_laws = { -- 4
	"Liver Failure Forever." -- 4
} -- 3
GAMEMODE.Laws = function(self) -- 7
	local _tab_0 = { } -- 7
	local _obj_1 = self.default_laws -- 7
	local _idx_0 = 1 -- 7
	for _key_0, _value_0 in pairs(_obj_1) do -- 7
		if _idx_0 == _key_0 then -- 7
			_tab_0[#_tab_0 + 1] = _value_0 -- 7
			_idx_0 = _idx_0 + 1 -- 7
		else -- 7
			_tab_0[_key_0] = _value_0 -- 7
		end -- 7
	end -- 7
	local _obj_2 = self.laws -- 7
	local _idx_1 = 1 -- 7
	for _key_0, _value_0 in pairs(_obj_2) do -- 7
		if _idx_1 == _key_0 then -- 7
			_tab_0[#_tab_0 + 1] = _value_0 -- 7
			_idx_1 = _idx_1 + 1 -- 7
		else -- 7
			_tab_0[_key_0] = _value_0 -- 7
		end -- 7
	end -- 7
	return _tab_0 -- 7
end -- 7
