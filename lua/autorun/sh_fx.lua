-- [yue]: autorun\sh_fx.yue
local Create = ents.Create -- 1
local Register = effects.Register -- 2
local lower, Left = string.lower, string.Left -- 3
local TraceLine = util.TraceLine -- 4
do -- 5
	local _class_0 -- 5
	local _base_0 = { } -- 5
	if _base_0.__index == nil then -- 5
		_base_0.__index = _base_0 -- 5
	end -- 12
	_class_0 = setmetatable({ -- 5
		__init = function() end, -- 5
		__base = _base_0, -- 5
		__name = "FX" -- 5
	}, { -- 5
		__index = _base_0, -- 5
		__call = function(cls, ...) -- 5
			local _self_0 = setmetatable({ }, _base_0) -- 5
			cls.__init(_self_0, ...) -- 5
			return _self_0 -- 5
		end -- 5
	}) -- 5
	_base_0.__class = _class_0 -- 5
	local self = _class_0; -- 5
	self.registered = { } -- 6
	self.__inherited = function(self, child) -- 7
		local fields -- 8
		do -- 8
			local _tbl_0 = { } -- 8
			for k, v in pairs(child.__base) do -- 8
				if Left(k, 2) ~= "__" then -- 8
					_tbl_0[k] = v -- 8
				end -- 8
			end -- 8
			fields = _tbl_0 -- 8
		end -- 8
		child.__barcode = tostring(self.__barcode and self.__barcode .. '/' or '') .. tostring(lower(rawget(child, '__entity') or child.__name)) -- 9
		if CLIENT then -- 10
			Register(fields, child.__barcode) -- 10
		end -- 10
		MsgC(Color(0, 200, 0), "+EFFECT: " .. tostring(child.__barcode) .. "\n") -- 11
		self.registered[child.__barcode] = child -- 12
	end -- 7
	FX = _class_0 -- 5
end -- 12
