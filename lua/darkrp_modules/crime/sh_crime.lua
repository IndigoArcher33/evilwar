-- [yue]: darkrp_modules\crime\sh_crime.yue
CRIMES = { } -- 1
local CRIME -- 2
do -- 2
	local _class_0 -- 2
	local _base_0 = { -- 2
		name = "crime", -- 10
		duration = 60, -- 12
		CommittedBy = function(self, who) -- 12
			local pos = who:EyePos() -- 13
			local _list_0 = player.GetAll() -- 14
			for _index_0 = 1, #_list_0 do -- 14
				local ply = _list_0[_index_0] -- 14
				local _continue_0 = false -- 15
				repeat -- 15
					if ply == who then -- 15
						_continue_0 = true -- 15
						break -- 15
					end -- 15
					local team = ply:Team() -- 16
					if not (team == TEAM_SANITAR or team == TEAM_EMPEROR or team == TEAM_CONSCRIPT) then -- 17
						_continue_0 = true -- 17
						break -- 17
					end -- 17
					if ply:CanSee(who) and ply:LookingInDirection(who:EyePos(), 0.6) then -- 18
						who:MakeWanted(self.duration, self.name) -- 19
						return true -- 20
					end -- 18
					_continue_0 = true -- 15
				until true -- 20
				if not _continue_0 then -- 20
					break -- 20
				end -- 20
			end -- 20
		end -- 2
	} -- 2
	if _base_0.__index == nil then -- 2
		_base_0.__index = _base_0 -- 2
	end -- 20
	_class_0 = setmetatable({ -- 2
		__init = function() end, -- 2
		__base = _base_0, -- 2
		__name = "CRIME" -- 2
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
	self.index = 0 -- 3
	self.__inherited = function(self, child) -- 4
		CRIMES[child.__name:lower()] = child -- 5
		self.index = self.index + 1 -- 6
		child.index = self.index -- 7
	end -- 4
	CRIME = _class_0 -- 2
end -- 20
local Thought -- 22
do -- 22
	local _class_0 -- 22
	local _parent_0 = CRIME -- 22
	local _base_0 = { -- 22
		name = "thoughtcrime", -- 24
		duration = 60, -- 25
		CommittedBy = function(self, who) -- 25
			local made_wanted = _class_0.__parent.__base.CommittedBy(self, who) -- 26
			if not made_wanted then -- 27
				return GAMEMODE:LightningPunish(who) -- 27
			end -- 27
		end -- 22
	} -- 22
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 28
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 22
			_base_0[_key_0] = _val_0 -- 22
		end -- 22
	end -- 28
	if _base_0.__index == nil then -- 22
		_base_0.__index = _base_0 -- 22
	end -- 28
	setmetatable(_base_0, _parent_0.__base) -- 22
	_class_0 = setmetatable({ -- 22
		__init = function(self, ...) -- 22
			return _class_0.__parent.__init(self, ...) -- 22
		end, -- 22
		__base = _base_0, -- 22
		__name = "Thought", -- 22
		__parent = _parent_0 -- 22
	}, { -- 22
		__index = function(cls, name) -- 22
			local val = rawget(_base_0, name) -- 22
			if val == nil then -- 22
				local parent = rawget(cls, "__parent") -- 22
				if parent then -- 22
					return parent[name] -- 22
				end -- 22
			else -- 22
				return val -- 22
			end -- 22
		end, -- 22
		__call = function(cls, ...) -- 22
			local _self_0 = setmetatable({ }, _base_0) -- 22
			cls.__init(_self_0, ...) -- 22
			return _self_0 -- 22
		end -- 22
	}) -- 22
	_base_0.__class = _class_0 -- 22
	if _parent_0.__inherited then -- 22
		_parent_0.__inherited(_parent_0, _class_0) -- 22
	end -- 22
	Thought = _class_0 -- 22
end -- 28
local Assault -- 29
do -- 29
	local _class_0 -- 29
	local _parent_0 = CRIME -- 29
	local _base_0 = { -- 29
		name = "assault", -- 31
		duration = 90, -- 32
		CommittedBy = function(self, who, victim) -- 32
			if who == victim then -- 33
				return -- 33
			end -- 33
			return _class_0.__parent.__base.CommittedBy(self, who) -- 34
		end -- 29
	} -- 29
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 34
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 29
			_base_0[_key_0] = _val_0 -- 29
		end -- 29
	end -- 34
	if _base_0.__index == nil then -- 29
		_base_0.__index = _base_0 -- 29
	end -- 34
	setmetatable(_base_0, _parent_0.__base) -- 29
	_class_0 = setmetatable({ -- 29
		__init = function(self, ...) -- 29
			return _class_0.__parent.__init(self, ...) -- 29
		end, -- 29
		__base = _base_0, -- 29
		__name = "Assault", -- 29
		__parent = _parent_0 -- 29
	}, { -- 29
		__index = function(cls, name) -- 29
			local val = rawget(_base_0, name) -- 29
			if val == nil then -- 29
				local parent = rawget(cls, "__parent") -- 29
				if parent then -- 29
					return parent[name] -- 29
				end -- 29
			else -- 29
				return val -- 29
			end -- 29
		end, -- 29
		__call = function(cls, ...) -- 29
			local _self_0 = setmetatable({ }, _base_0) -- 29
			cls.__init(_self_0, ...) -- 29
			return _self_0 -- 29
		end -- 29
	}) -- 29
	_base_0.__class = _class_0 -- 29
	if _parent_0.__inherited then -- 29
		_parent_0.__inherited(_parent_0, _class_0) -- 29
	end -- 29
	Assault = _class_0 -- 29
end -- 34
local Assassination -- 36
do -- 36
	local _class_0 -- 36
	local _parent_0 = CRIME -- 36
	local _base_0 = { -- 36
		name = "assassination", -- 38
		duration = 500, -- 39
		CommittedBy = function(self, who, victim) -- 39
			if who == victim then -- 40
				return -- 40
			end -- 40
			return _class_0.__parent.__base.CommittedBy(self, who) -- 41
		end -- 36
	} -- 36
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 41
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 36
			_base_0[_key_0] = _val_0 -- 36
		end -- 36
	end -- 41
	if _base_0.__index == nil then -- 36
		_base_0.__index = _base_0 -- 36
	end -- 41
	setmetatable(_base_0, _parent_0.__base) -- 36
	_class_0 = setmetatable({ -- 36
		__init = function(self, ...) -- 36
			return _class_0.__parent.__init(self, ...) -- 36
		end, -- 36
		__base = _base_0, -- 36
		__name = "Assassination", -- 36
		__parent = _parent_0 -- 36
	}, { -- 36
		__index = function(cls, name) -- 36
			local val = rawget(_base_0, name) -- 36
			if val == nil then -- 36
				local parent = rawget(cls, "__parent") -- 36
				if parent then -- 36
					return parent[name] -- 36
				end -- 36
			else -- 36
				return val -- 36
			end -- 36
		end, -- 36
		__call = function(cls, ...) -- 36
			local _self_0 = setmetatable({ }, _base_0) -- 36
			cls.__init(_self_0, ...) -- 36
			return _self_0 -- 36
		end -- 36
	}) -- 36
	_base_0.__class = _class_0 -- 36
	if _parent_0.__inherited then -- 36
		_parent_0.__inherited(_parent_0, _class_0) -- 36
	end -- 36
	Assassination = _class_0 -- 36
end -- 41
local Murder -- 43
do -- 43
	local _class_0 -- 43
	local _parent_0 = CRIME -- 43
	local _base_0 = { -- 43
		name = "murder", -- 45
		duration = 300, -- 46
		CommittedBy = function(self, who, victim) -- 46
			if who == victim then -- 47
				return -- 47
			end -- 47
			return _class_0.__parent.__base.CommittedBy(self, who) -- 48
		end -- 43
	} -- 43
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 48
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 43
			_base_0[_key_0] = _val_0 -- 43
		end -- 43
	end -- 48
	if _base_0.__index == nil then -- 43
		_base_0.__index = _base_0 -- 43
	end -- 48
	setmetatable(_base_0, _parent_0.__base) -- 43
	_class_0 = setmetatable({ -- 43
		__init = function(self, ...) -- 43
			return _class_0.__parent.__init(self, ...) -- 43
		end, -- 43
		__base = _base_0, -- 43
		__name = "Murder", -- 43
		__parent = _parent_0 -- 43
	}, { -- 43
		__index = function(cls, name) -- 43
			local val = rawget(_base_0, name) -- 43
			if val == nil then -- 43
				local parent = rawget(cls, "__parent") -- 43
				if parent then -- 43
					return parent[name] -- 43
				end -- 43
			else -- 43
				return val -- 43
			end -- 43
		end, -- 43
		__call = function(cls, ...) -- 43
			local _self_0 = setmetatable({ }, _base_0) -- 43
			cls.__init(_self_0, ...) -- 43
			return _self_0 -- 43
		end -- 43
	}) -- 43
	_base_0.__class = _class_0 -- 43
	if _parent_0.__inherited then -- 43
		_parent_0.__inherited(_parent_0, _class_0) -- 43
	end -- 43
	Murder = _class_0 -- 43
end -- 48
local Regicide -- 50
do -- 50
	local _class_0 -- 50
	local _parent_0 = CRIME -- 50
	local _base_0 = { -- 50
		name = "regicide", -- 52
		duration = 1000, -- 53
		CommittedBy = function(self, who, victim) -- 53
			if who == victim then -- 54
				return -- 54
			end -- 54
			return _class_0.__parent.__base.CommittedBy(self, who) -- 55
		end -- 50
	} -- 50
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 55
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 50
			_base_0[_key_0] = _val_0 -- 50
		end -- 50
	end -- 55
	if _base_0.__index == nil then -- 50
		_base_0.__index = _base_0 -- 50
	end -- 55
	setmetatable(_base_0, _parent_0.__base) -- 50
	_class_0 = setmetatable({ -- 50
		__init = function(self, ...) -- 50
			return _class_0.__parent.__init(self, ...) -- 50
		end, -- 50
		__base = _base_0, -- 50
		__name = "Regicide", -- 50
		__parent = _parent_0 -- 50
	}, { -- 50
		__index = function(cls, name) -- 50
			local val = rawget(_base_0, name) -- 50
			if val == nil then -- 50
				local parent = rawget(cls, "__parent") -- 50
				if parent then -- 50
					return parent[name] -- 50
				end -- 50
			else -- 50
				return val -- 50
			end -- 50
		end, -- 50
		__call = function(cls, ...) -- 50
			local _self_0 = setmetatable({ }, _base_0) -- 50
			cls.__init(_self_0, ...) -- 50
			return _self_0 -- 50
		end -- 50
	}) -- 50
	_base_0.__class = _class_0 -- 50
	if _parent_0.__inherited then -- 50
		_parent_0.__inherited(_parent_0, _class_0) -- 50
	end -- 50
	Regicide = _class_0 -- 50
	return _class_0 -- 55
end -- 55
