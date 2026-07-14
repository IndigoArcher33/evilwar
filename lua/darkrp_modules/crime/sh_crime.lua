CRIMES = { }
local CRIME
do
	local _class_0
	local _base_0 = {
		name = "crime",
		duration = 60,
		CommittedBy = function(self, who)
			local pos = who:EyePos()
			local _list_0 = player.GetAll()
			for _index_0 = 1, #_list_0 do
				local ply = _list_0[_index_0]
				if ply == who then
					goto _continue_0
				end
				local team = ply:Team()
				if not (team == TEAM_SANITAR or team == TEAM_KOMMANDANT) then
					goto _continue_0
				end
				if ply:CanSee(who) and ply:LookingInDirection(who:EyePos(), 0.6) then
					who:MakeWanted(self.duration, self.name)
					return true
				end
				::_continue_0::
			end
		end
	}
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	_class_0 = setmetatable({
		__init = function() end,
		__base = _base_0,
		__name = "CRIME"
	}, {
		__index = _base_0,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	local self = _class_0;
	self.index = 0
	self.__inherited = function(self, child)
		CRIMES[child.__name:lower()] = child
		self.index = self.index + 1
		child.index = self.index
	end
	CRIME = _class_0
end
local Thought
do
	local _class_0
	local _parent_0 = CRIME
	local _base_0 = {
		name = "thoughtcrime",
		duration = 60,
		CommittedBy = function(self, who)
			local made_wanted = _class_0.__parent.__base.CommittedBy(self, who)
			if not made_wanted then
				return GAMEMODE:LightningPunish(who)
			end
		end
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Thought",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Thought = _class_0
end
local Assault
do
	local _class_0
	local _parent_0 = CRIME
	local _base_0 = {
		name = "assault",
		duration = 90,
		CommittedBy = function(self, who, victim)
			if who == victim then
				return
			end
			return _class_0.__parent.__base.CommittedBy(self, who)
		end
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Assault",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Assault = _class_0
end
local Murder
do
	local _class_0
	local _parent_0 = CRIME
	local _base_0 = {
		name = "murder",
		duration = 300
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Murder",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Murder = _class_0
	return _class_0
end
