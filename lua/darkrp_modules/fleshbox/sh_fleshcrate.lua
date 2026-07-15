-- [yue]: darkrp_modules\fleshbox\sh_fleshcrate.yue
local Submit_Crate -- 1
do -- 1
	local _class_0 -- 1
	local _parent_0 = SOUND -- 1
	local _base_0 = { -- 1
		sound = (function() -- 2
			local _accum_0 = { } -- 2
			local _len_0 = 1 -- 2
			for i = 1, 2 do -- 2
				_accum_0[_len_0] = "weapons/crowbar/crowbar_impact" .. tostring(i) .. ".wav" -- 2
				_len_0 = _len_0 + 1 -- 2
			end -- 2
			return _accum_0 -- 2
		end)() -- 1
	} -- 1
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 2
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 1
			_base_0[_key_0] = _val_0 -- 1
		end -- 1
	end -- 2
	if _base_0.__index == nil then -- 1
		_base_0.__index = _base_0 -- 1
	end -- 2
	setmetatable(_base_0, _parent_0.__base) -- 1
	_class_0 = setmetatable({ -- 1
		__init = function(self, ...) -- 1
			return _class_0.__parent.__init(self, ...) -- 1
		end, -- 1
		__base = _base_0, -- 1
		__name = "Submit_Crate", -- 1
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
	Submit_Crate = _class_0 -- 1
end -- 2
local Crate -- 4
do -- 4
	local _class_0 -- 4
	local _parent_0 = ITEM -- 4
	local _base_0 = { -- 4
		Spawnable = true, -- 8
		Pocketable = false, -- 10
		Category = "EvilWar: Precursor", -- 12
		Sound = "npc/barnacle/neck_snap" .. tostring(math.random(1, 2)) .. ".wav", -- 14
		SubmitSound = "Submit_Crate", -- 16
		Submitted = function(self) -- 16
			local pos = self:GetPos() -- 17
			local ed = EffectData() -- 18
			ed:SetOrigin(pos) -- 20
			ed:SetScale(1) -- 21
			ed:SetMagnitude(1) -- 22
			ed:SetRadius(3) -- 23
			return util.Effect("Sparks", ed) -- 24
		end, -- 26
		OnlyInventoryUse = false -- 4
	} -- 4
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 26
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 4
			_base_0[_key_0] = _val_0 -- 4
		end -- 4
	end -- 26
	if _base_0.__index == nil then -- 4
		_base_0.__index = _base_0 -- 4
	end -- 26
	setmetatable(_base_0, _parent_0.__base) -- 4
	_class_0 = setmetatable({ -- 4
		__init = function(self, ...) -- 4
			return _class_0.__parent.__init(self, ...) -- 4
		end, -- 4
		__base = _base_0, -- 4
		__name = "Crate", -- 4
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
	local self = _class_0; -- 4
	self.__entity = "crate" -- 5
	if _parent_0.__inherited then -- 4
		_parent_0.__inherited(_parent_0, _class_0) -- 4
	end -- 4
	Crate = _class_0 -- 4
end -- 26
local Fleshcrate -- 29
do -- 29
	local _class_0 -- 29
	local _parent_0 = Crate -- 29
	local _base_0 = { -- 29
		Model = Model("models/props/de_prodigy/ammo_can_02.mdl"), -- 31
		Material = Material("models/gibs/humans/brain_gib"), -- 33
		PrintName = "Flesh Crate", -- 34
		Description = "A crate held shut by decayed flesh.\nCan be opened in a Refinery.", -- 35
		UseText = { -- 36
			"%s can't get it open.", -- 36
			"%s struggles to crack open the crate.", -- 37
			"%s looks like an idiot." -- 38
		}, -- 41
		BiteDamage = 34, -- 43
		Refinement = { -- 44
			result = "evilrp_weapon/obrez", -- 44
			time = 6 -- 45
		} -- 29
	} -- 29
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 45
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 29
			_base_0[_key_0] = _val_0 -- 29
		end -- 29
	end -- 45
	if _base_0.__index == nil then -- 29
		_base_0.__index = _base_0 -- 29
	end -- 45
	setmetatable(_base_0, _parent_0.__base) -- 29
	_class_0 = setmetatable({ -- 29
		__init = function(self, ...) -- 29
			return _class_0.__parent.__init(self, ...) -- 29
		end, -- 29
		__base = _base_0, -- 29
		__name = "Fleshcrate", -- 29
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
	Fleshcrate = _class_0 -- 29
	return _class_0 -- 45
end -- 45
