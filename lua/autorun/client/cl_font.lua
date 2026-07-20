-- [yue]: autorun\client\cl_font.yue
local CreateFont = surface.CreateFont -- 1
local lower, sub = string.lower, string.sub -- 2
do -- 3
	local _class_0 -- 3
	local _base_0 = { -- 3
		font = 'Arial', -- 16
		extended = false, -- 17
		size = 13, -- 18
		weight = 500, -- 19
		blursize = 0, -- 20
		antialias = false, -- 21
		underline = false, -- 22
		italic = false, -- 23
		strikeout = false, -- 24
		symbol = false, -- 25
		rotary = false, -- 26
		shadow = false, -- 27
		additive = false, -- 28
		outline = false -- 3
	} -- 3
	if _base_0.__index == nil then -- 3
		_base_0.__index = _base_0 -- 3
	end -- 28
	_class_0 = setmetatable({ -- 3
		__init = function() end, -- 3
		__base = _base_0, -- 3
		__name = "FONT" -- 3
	}, { -- 3
		__index = _base_0, -- 3
		__call = function(cls, ...) -- 3
			local _self_0 = setmetatable({ }, _base_0) -- 3
			cls.__init(_self_0, ...) -- 3
			return _self_0 -- 3
		end -- 3
	}) -- 3
	_base_0.__class = _class_0 -- 3
	local self = _class_0; -- 3
	self.__inherited = function(self, child) -- 4
		local fields = { } -- 5
		local ancestor = child -- 6
		while ancestor do -- 7
			local inheritance -- 8
			do -- 8
				local _tbl_0 = { } -- 8
				for k, v in pairs(ancestor.__base) do -- 8
					if not fields[k] and k ~= 'new' and sub(k, 1, 2) ~= '__' then -- 8
						_tbl_0[k] = v -- 8
					end -- 8
				end -- 8
				inheritance = _tbl_0 -- 8
			end -- 8
			for k, v in pairs(inheritance) do -- 9
				fields[k] = v -- 9
			end -- 9
			if not ancestor.__parent then -- 10
				break -- 10
			end -- 10
			ancestor = ancestor.__parent -- 11
		end -- 11
		child.__barcode = tostring(self.__barcode and self.__barcode .. '/' or '') .. tostring(child.__name) -- 12
		CreateFont(child.__barcode, fields) -- 13
		return MsgC(Color(0, 200, 0), "+FONT: " .. tostring(child.__barcode) .. "\n") -- 14
	end -- 4
	FONT = _class_0 -- 3
end -- 28
