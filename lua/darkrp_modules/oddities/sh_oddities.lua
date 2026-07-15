-- [yue]: darkrp_modules\oddities\sh_oddities.yue
ODDITY.index = 0 -- 1
ODDITY.list = { } -- 2
local Cotardism -- 4
do -- 4
	local _class_0 -- 4
	local _parent_0 = ODDITY -- 4
	local _base_0 = { -- 4
		name = "Cotardism", -- 6
		desc = "I see dead people, and I fear them.", -- 7
		GetDesc = function(self, ply) -- 7
			local desc = _class_0.__parent.__base.GetDesc(self, ply) -- 8
			if ply:Team() == TEAM_KORPSMAN then -- 9
				desc = desc .. "\n     <c=128,0,0>...but they will fear me <wiggle>more.</wiggle>" -- 10
			end -- 9
			return desc -- 11
		end -- 4
	} -- 4
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 11
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 4
			_base_0[_key_0] = _val_0 -- 4
		end -- 4
	end -- 11
	if _base_0.__index == nil then -- 4
		_base_0.__index = _base_0 -- 4
	end -- 11
	setmetatable(_base_0, _parent_0.__base) -- 4
	_class_0 = setmetatable({ -- 4
		__init = function(self, ...) -- 4
			return _class_0.__parent.__init(self, ...) -- 4
		end, -- 4
		__base = _base_0, -- 4
		__name = "Cotardism", -- 4
		__parent = _parent_0 -- 4
	}, { -- 4
		__index = function(cls, name) -- 4
			local val = rawget(_base_0, name) -- 4
			if val == nil then -- 4
				local parent = rawget(cls, "__parent") -- 4
				if parent then -- 4
					return parent[name] -- 4
				end -- 4
			else -- 4
				return val -- 4
			end -- 4
		end, -- 4
		__call = function(cls, ...) -- 4
			local _self_0 = setmetatable({ }, _base_0) -- 4
			cls.__init(_self_0, ...) -- 4
			return _self_0 -- 4
		end -- 4
	}) -- 4
	_base_0.__class = _class_0 -- 4
	if _parent_0.__inherited then -- 4
		_parent_0.__inherited(_parent_0, _class_0) -- 4
	end -- 4
	Cotardism = _class_0 -- 4
end -- 11
ODDITY_COTARDISM = Cotardism.index -- 12
local Necrophilia -- 14
do -- 14
	local _class_0 -- 14
	local _parent_0 = ODDITY -- 14
	local _base_0 = { -- 14
		name = "Necrophilia", -- 16
		desc = "I love the dead. The more rotten, the better." -- 14
	} -- 14
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 16
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 14
			_base_0[_key_0] = _val_0 -- 14
		end -- 14
	end -- 16
	if _base_0.__index == nil then -- 14
		_base_0.__index = _base_0 -- 14
	end -- 16
	setmetatable(_base_0, _parent_0.__base) -- 14
	_class_0 = setmetatable({ -- 14
		__init = function(self, ...) -- 14
			return _class_0.__parent.__init(self, ...) -- 14
		end, -- 14
		__base = _base_0, -- 14
		__name = "Necrophilia", -- 14
		__parent = _parent_0 -- 14
	}, { -- 14
		__index = function(cls, name) -- 14
			local val = rawget(_base_0, name) -- 14
			if val == nil then -- 14
				local parent = rawget(cls, "__parent") -- 14
				if parent then -- 14
					return parent[name] -- 14
				end -- 14
			else -- 14
				return val -- 14
			end -- 14
		end, -- 14
		__call = function(cls, ...) -- 14
			local _self_0 = setmetatable({ }, _base_0) -- 14
			cls.__init(_self_0, ...) -- 14
			return _self_0 -- 14
		end -- 14
	}) -- 14
	_base_0.__class = _class_0 -- 14
	if _parent_0.__inherited then -- 14
		_parent_0.__inherited(_parent_0, _class_0) -- 14
	end -- 14
	Necrophilia = _class_0 -- 14
end -- 16
ODDITY_NECROPHILIA = Necrophilia.index -- 17
local Cannibalism -- 19
do -- 19
	local _class_0 -- 19
	local _parent_0 = ODDITY -- 19
	local _base_0 = { -- 19
		name = "Cannibalism", -- 21
		desc = "Only other corpses can sate my hunger. My only drinking buddies are dead bodies." -- 19
	} -- 19
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 21
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 19
			_base_0[_key_0] = _val_0 -- 19
		end -- 19
	end -- 21
	if _base_0.__index == nil then -- 19
		_base_0.__index = _base_0 -- 19
	end -- 21
	setmetatable(_base_0, _parent_0.__base) -- 19
	_class_0 = setmetatable({ -- 19
		__init = function(self, ...) -- 19
			return _class_0.__parent.__init(self, ...) -- 19
		end, -- 19
		__base = _base_0, -- 19
		__name = "Cannibalism", -- 19
		__parent = _parent_0 -- 19
	}, { -- 19
		__index = function(cls, name) -- 19
			local val = rawget(_base_0, name) -- 19
			if val == nil then -- 19
				local parent = rawget(cls, "__parent") -- 19
				if parent then -- 19
					return parent[name] -- 19
				end -- 19
			else -- 19
				return val -- 19
			end -- 19
		end, -- 19
		__call = function(cls, ...) -- 19
			local _self_0 = setmetatable({ }, _base_0) -- 19
			cls.__init(_self_0, ...) -- 19
			return _self_0 -- 19
		end -- 19
	}) -- 19
	_base_0.__class = _class_0 -- 19
	if _parent_0.__inherited then -- 19
		_parent_0.__inherited(_parent_0, _class_0) -- 19
	end -- 19
	Cannibalism = _class_0 -- 19
end -- 21
ODDITY_CANNIBALISM = Cannibalism.index -- 22
local Depression -- 24
do -- 24
	local _class_0 -- 24
	local _parent_0 = ODDITY -- 24
	local _base_0 = { -- 24
		name = "Depression", -- 26
		desc = "It's hard being a corpse. It's hard, and nobody understands." -- 24
	} -- 24
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 26
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 24
			_base_0[_key_0] = _val_0 -- 24
		end -- 24
	end -- 26
	if _base_0.__index == nil then -- 24
		_base_0.__index = _base_0 -- 24
	end -- 26
	setmetatable(_base_0, _parent_0.__base) -- 24
	_class_0 = setmetatable({ -- 24
		__init = function(self, ...) -- 24
			return _class_0.__parent.__init(self, ...) -- 24
		end, -- 24
		__base = _base_0, -- 24
		__name = "Depression", -- 24
		__parent = _parent_0 -- 24
	}, { -- 24
		__index = function(cls, name) -- 24
			local val = rawget(_base_0, name) -- 24
			if val == nil then -- 24
				local parent = rawget(cls, "__parent") -- 24
				if parent then -- 24
					return parent[name] -- 24
				end -- 24
			else -- 24
				return val -- 24
			end -- 24
		end, -- 24
		__call = function(cls, ...) -- 24
			local _self_0 = setmetatable({ }, _base_0) -- 24
			cls.__init(_self_0, ...) -- 24
			return _self_0 -- 24
		end -- 24
	}) -- 24
	_base_0.__class = _class_0 -- 24
	if _parent_0.__inherited then -- 24
		_parent_0.__inherited(_parent_0, _class_0) -- 24
	end -- 24
	Depression = _class_0 -- 24
end -- 26
ODDITY_DEPRESSION = Depression.index -- 27
local Anasogonsia -- 39
do -- 39
	local _class_0 -- 39
	local _parent_0 = ODDITY -- 39
	local _base_0 = { -- 39
		name = "Anasogonsia", -- 41
		desc = "I can't determine anything about myself." -- 39
	} -- 39
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 41
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 39
			_base_0[_key_0] = _val_0 -- 39
		end -- 39
	end -- 41
	if _base_0.__index == nil then -- 39
		_base_0.__index = _base_0 -- 39
	end -- 41
	setmetatable(_base_0, _parent_0.__base) -- 39
	_class_0 = setmetatable({ -- 39
		__init = function(self, ...) -- 39
			return _class_0.__parent.__init(self, ...) -- 39
		end, -- 39
		__base = _base_0, -- 39
		__name = "Anasogonsia", -- 39
		__parent = _parent_0 -- 39
	}, { -- 39
		__index = function(cls, name) -- 39
			local val = rawget(_base_0, name) -- 39
			if val == nil then -- 39
				local parent = rawget(cls, "__parent") -- 39
				if parent then -- 39
					return parent[name] -- 39
				end -- 39
			else -- 39
				return val -- 39
			end -- 39
		end, -- 39
		__call = function(cls, ...) -- 39
			local _self_0 = setmetatable({ }, _base_0) -- 39
			cls.__init(_self_0, ...) -- 39
			return _self_0 -- 39
		end -- 39
	}) -- 39
	_base_0.__class = _class_0 -- 39
	if _parent_0.__inherited then -- 39
		_parent_0.__inherited(_parent_0, _class_0) -- 39
	end -- 39
	Anasogonsia = _class_0 -- 39
end -- 41
ODDITY_ANASOGONSIA = Anasogonsia.index -- 42
local Illiteracy -- 49
do -- 49
	local _class_0 -- 49
	local _parent_0 = ODDITY -- 49
	local _base_0 = { -- 49
		name = "Illiteracy", -- 51
		desc = "I have no ability to read or write. Whatever." -- 49
	} -- 49
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 51
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 49
			_base_0[_key_0] = _val_0 -- 49
		end -- 49
	end -- 51
	if _base_0.__index == nil then -- 49
		_base_0.__index = _base_0 -- 49
	end -- 51
	setmetatable(_base_0, _parent_0.__base) -- 49
	_class_0 = setmetatable({ -- 49
		__init = function(self, ...) -- 49
			return _class_0.__parent.__init(self, ...) -- 49
		end, -- 49
		__base = _base_0, -- 49
		__name = "Illiteracy", -- 49
		__parent = _parent_0 -- 49
	}, { -- 49
		__index = function(cls, name) -- 49
			local val = rawget(_base_0, name) -- 49
			if val == nil then -- 49
				local parent = rawget(cls, "__parent") -- 49
				if parent then -- 49
					return parent[name] -- 49
				end -- 49
			else -- 49
				return val -- 49
			end -- 49
		end, -- 49
		__call = function(cls, ...) -- 49
			local _self_0 = setmetatable({ }, _base_0) -- 49
			cls.__init(_self_0, ...) -- 49
			return _self_0 -- 49
		end -- 49
	}) -- 49
	_base_0.__class = _class_0 -- 49
	if _parent_0.__inherited then -- 49
		_parent_0.__inherited(_parent_0, _class_0) -- 49
	end -- 49
	Illiteracy = _class_0 -- 49
end -- 51
ODDITY_ILLITERACY = Illiteracy.index -- 52
local Delinquency -- 54
do -- 54
	local _class_0 -- 54
	local _parent_0 = ODDITY -- 54
	local _base_0 = { -- 54
		name = "Delinquency", -- 56
		desc = "I love to cause trouble and break things." -- 54
	} -- 54
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 56
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 54
			_base_0[_key_0] = _val_0 -- 54
		end -- 54
	end -- 56
	if _base_0.__index == nil then -- 54
		_base_0.__index = _base_0 -- 54
	end -- 56
	setmetatable(_base_0, _parent_0.__base) -- 54
	_class_0 = setmetatable({ -- 54
		__init = function(self, ...) -- 54
			return _class_0.__parent.__init(self, ...) -- 54
		end, -- 54
		__base = _base_0, -- 54
		__name = "Delinquency", -- 54
		__parent = _parent_0 -- 54
	}, { -- 54
		__index = function(cls, name) -- 54
			local val = rawget(_base_0, name) -- 54
			if val == nil then -- 54
				local parent = rawget(cls, "__parent") -- 54
				if parent then -- 54
					return parent[name] -- 54
				end -- 54
			else -- 54
				return val -- 54
			end -- 54
		end, -- 54
		__call = function(cls, ...) -- 54
			local _self_0 = setmetatable({ }, _base_0) -- 54
			cls.__init(_self_0, ...) -- 54
			return _self_0 -- 54
		end -- 54
	}) -- 54
	_base_0.__class = _class_0 -- 54
	if _parent_0.__inherited then -- 54
		_parent_0.__inherited(_parent_0, _class_0) -- 54
	end -- 54
	Delinquency = _class_0 -- 54
end -- 56
ODDITY_DELINQUENCY = Delinquency.index -- 57
local Clumsy -- 59
do -- 59
	local _class_0 -- 59
	local _parent_0 = ODDITY -- 59
	local _base_0 = { -- 59
		name = "Clumsy", -- 61
		desc = "I've got two left feet." -- 59
	} -- 59
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 61
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 59
			_base_0[_key_0] = _val_0 -- 59
		end -- 59
	end -- 61
	if _base_0.__index == nil then -- 59
		_base_0.__index = _base_0 -- 59
	end -- 61
	setmetatable(_base_0, _parent_0.__base) -- 59
	_class_0 = setmetatable({ -- 59
		__init = function(self, ...) -- 59
			return _class_0.__parent.__init(self, ...) -- 59
		end, -- 59
		__base = _base_0, -- 59
		__name = "Clumsy", -- 59
		__parent = _parent_0 -- 59
	}, { -- 59
		__index = function(cls, name) -- 59
			local val = rawget(_base_0, name) -- 59
			if val == nil then -- 59
				local parent = rawget(cls, "__parent") -- 59
				if parent then -- 59
					return parent[name] -- 59
				end -- 59
			else -- 59
				return val -- 59
			end -- 59
		end, -- 59
		__call = function(cls, ...) -- 59
			local _self_0 = setmetatable({ }, _base_0) -- 59
			cls.__init(_self_0, ...) -- 59
			return _self_0 -- 59
		end -- 59
	}) -- 59
	_base_0.__class = _class_0 -- 59
	if _parent_0.__inherited then -- 59
		_parent_0.__inherited(_parent_0, _class_0) -- 59
	end -- 59
	Clumsy = _class_0 -- 59
end -- 61
ODDITY_CLUMSY = Clumsy.index -- 62
local meta = FindMetaTable("Player") -- 64
for k, v in pairs({ -- 66
	Oddities = function(self) -- 66
		return self:GetNWInt("evilrp_oddities", 0) -- 66
	end, -- 66
	OddityList = function(self) -- 67
		local returns = { } -- 68
		for k, v in pairs(ODDITIES) do -- 69
			if self:HasOddity(k) then -- 70
				returns[#returns + 1] = v -- 70
			end -- 70
		end -- 70
		return returns -- 71
	end, -- 67
	HasOddity = function(self, oddity) -- 72
		return bit.Check(self:Oddities(), oddity) -- 72
	end, -- 72
	ClearOddities = function(self) -- 73
		return self:SetNWInt("evilrp_oddities", 0) -- 73
	end, -- 73
	AddOddity = function(self, oddity) -- 74
		if self:HasOddity(oddity) then -- 75
			return -- 75
		end -- 75
		local odds = bit.Set(self:Oddities(), oddity) -- 76
		self:SetNWInt("evilrp_oddities", odds) -- 77
		timer.Simple(1, function() -- 78
			return ODDITIES[oddity]:Inform(self) -- 78
		end) -- 78
		return odds -- 79
	end, -- 74
	RemoveOddity = function(self, oddity) -- 80
		if not self:HasOddity(oddity) then -- 81
			return -- 81
		end -- 81
		local odds = bit.Unset(self:Oddities(), oddity) -- 82
		self:SetNWInt("evilrp_oddities", odds) -- 83
		return odds -- 84
	end -- 80
}) do -- 85
	meta[k] = v -- 65
end -- 65
