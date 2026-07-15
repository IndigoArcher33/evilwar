-- [yue]: darkrp_modules\mutators\sh_mutators.yue
local Chromophobia -- 1
do -- 1
	local _class_0 -- 1
	local _parent_0 = MUTATOR -- 1
	local _base_0 = { -- 1
		name = "Chromophobia", -- 3
		description = "Everyone is colorblind today." -- 1
	} -- 1
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 3
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 1
			_base_0[_key_0] = _val_0 -- 1
		end -- 1
	end -- 3
	if _base_0.__index == nil then -- 1
		_base_0.__index = _base_0 -- 1
	end -- 3
	setmetatable(_base_0, _parent_0.__base) -- 1
	_class_0 = setmetatable({ -- 1
		__init = function(self, ...) -- 1
			return _class_0.__parent.__init(self, ...) -- 1
		end, -- 1
		__base = _base_0, -- 1
		__name = "Chromophobia", -- 1
		__parent = _parent_0 -- 1
	}, { -- 1
		__index = function(cls, name) -- 1
			local val = rawget(_base_0, name) -- 1
			if val == nil then -- 1
				local parent = rawget(cls, "__parent") -- 1
				if parent then -- 1
					return parent[name] -- 1
				end -- 1
			else -- 1
				return val -- 1
			end -- 1
		end, -- 1
		__call = function(cls, ...) -- 1
			local _self_0 = setmetatable({ }, _base_0) -- 1
			cls.__init(_self_0, ...) -- 1
			return _self_0 -- 1
		end -- 1
	}) -- 1
	_base_0.__class = _class_0 -- 1
	if _parent_0.__inherited then -- 1
		_parent_0.__inherited(_parent_0, _class_0) -- 1
	end -- 1
	Chromophobia = _class_0 -- 1
end -- 3
MUTATOR_CHROMOPHOBIA = Chromophobia.index -- 4
local EerieSilence -- 6
do -- 6
	local _class_0 -- 6
	local _parent_0 = MUTATOR -- 6
	local _base_0 = { -- 6
		name = "Eerie Silence", -- 8
		description = "Something's not there that should be...?" -- 6
	} -- 6
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 8
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 6
			_base_0[_key_0] = _val_0 -- 6
		end -- 6
	end -- 8
	if _base_0.__index == nil then -- 6
		_base_0.__index = _base_0 -- 6
	end -- 8
	setmetatable(_base_0, _parent_0.__base) -- 6
	_class_0 = setmetatable({ -- 6
		__init = function(self, ...) -- 6
			return _class_0.__parent.__init(self, ...) -- 6
		end, -- 6
		__base = _base_0, -- 6
		__name = "EerieSilence", -- 6
		__parent = _parent_0 -- 6
	}, { -- 6
		__index = function(cls, name) -- 6
			local val = rawget(_base_0, name) -- 6
			if val == nil then -- 6
				local parent = rawget(cls, "__parent") -- 6
				if parent then -- 6
					return parent[name] -- 6
				end -- 6
			else -- 6
				return val -- 6
			end -- 6
		end, -- 6
		__call = function(cls, ...) -- 6
			local _self_0 = setmetatable({ }, _base_0) -- 6
			cls.__init(_self_0, ...) -- 6
			return _self_0 -- 6
		end -- 6
	}) -- 6
	_base_0.__class = _class_0 -- 6
	if _parent_0.__inherited then -- 6
		_parent_0.__inherited(_parent_0, _class_0) -- 6
	end -- 6
	EerieSilence = _class_0 -- 6
end -- 8
MUTATOR_EERIESILENCE = EerieSilence.index -- 9
