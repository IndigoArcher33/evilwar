-- [yue]: autorun\sh_oddity.yue
ODDITIES = { } -- 1
do -- 2
	local _class_0 -- 2
	local _base_0 = { -- 2
		name = "", -- 13
		desc = "An idiosyncracy that affects you.", -- 15
		GetDesc = function(self, ply) -- 15
			return self.desc -- 15
		end, -- 17
		Inform = function(self, ply) -- 17
			return ply:Notify("<c=128,128,128>\"" .. tostring(self:GetDesc(ply)) .. "\"") -- 18
		end -- 2
	} -- 2
	if _base_0.__index == nil then -- 2
		_base_0.__index = _base_0 -- 2
	end -- 19
	_class_0 = setmetatable({ -- 2
		__init = function() end, -- 2
		__base = _base_0, -- 2
		__name = "ODDITY" -- 2
	}, { -- 2
		__index = _base_0, -- 2
		__call = function(cls, ...) -- 2
			local _self_0 = setmetatable({ }, _base_0) -- 2
			cls.__init(_self_0, ...) -- 2
			return _self_0 -- 2
		end -- 2
	}) -- 2
	_base_0.__class = _class_0 -- 2
	local self = _class_0; -- 2
	self.__inherited = function(self, child) -- 3
		self.index = self.index + 1 -- 4
		ODDITIES[2 ^ self.index] = child -- 5
		child.index = 2 ^ self.index -- 6
		do -- 7
			local _obj_0 = self.list -- 7
			_obj_0[#_obj_0 + 1] = child.index -- 7
		end -- 7
	end -- 3
	self.index = 0 -- 9
	self.list = { } -- 10
	ODDITY = _class_0 -- 2
end -- 19
