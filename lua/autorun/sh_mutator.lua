-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/autorun/sh_mutator.yue
MUTATORS = { } -- 1
do -- 2
	local _class_0 -- 2
	local _base_0 = { -- 2
		name = "Mutator", -- 8
		desc = "A special condition that alters the game's global state.", -- 9
		active = false -- 2
	} -- 2
	if _base_0.__index == nil then -- 2
		_base_0.__index = _base_0 -- 2
	end -- 9
	_class_0 = setmetatable({ -- 2
		__init = function() end, -- 2
		__base = _base_0, -- 2
		__name = "MUTATOR" -- 2
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
		do -- 4
			local _obj_0 = MUTATORS -- 4
			_obj_0[#_obj_0 + 1] = child -- 4
		end -- 4
		child.index = #MUTATORS -- 5
	end -- 3
	MUTATOR = _class_0 -- 2
end -- 9
