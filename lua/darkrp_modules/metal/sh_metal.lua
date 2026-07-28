-- [yue]: darkrp_modules\metal\sh_metal.yue
local Submit_Metal -- 1
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
		__name = "Submit_Metal", -- 1
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
	Submit_Metal = _class_0 -- 1
end -- 2
local Metal -- 4
do -- 4
	local _class_0 -- 4
	local _parent_0 = ITEM -- 4
	local _base_0 = { -- 4
		Spawnable = true, -- 8
		PrintName = "Metal", -- 9
		Model = Model("models/props_junk/garbage_plasticbottle002a.mdl"), -- 10
		Category = "EvilRP: Precursor", -- 11
		Spawnable = true, -- 12
		Interesting = true, -- 14
		Sound = "npc/barnacle/neck_snap" .. tostring(math.random(1, 2)) .. ".wav", -- 16
		SubmitSound = "Submit_Metal", -- 18
		Submitted = function(self) -- 18
			local pos = self:GetPos() -- 19
			local ed = EffectData() -- 20
			ed:SetOrigin(pos) -- 22
			ed:SetScale(1) -- 23
			ed:SetMagnitude(1) -- 24
			ed:SetRadius(3) -- 25
			return util.Effect("Sparks", ed) -- 26
		end, -- 28
		OnlyInventoryUse = false, -- 30
		OnUseFinish = function(self, ply) -- 30
			_class_0.__parent.__base.OnUseFinish(self, ply) -- 31
			local dmg = DamageInfo() -- 32
			dmg:SetDamage(self.BiteDamage) -- 34
			dmg:SetDamageType(DMG_SLASH) -- 35
			dmg:SetAttacker(ply) -- 36
			dmg:SetInflictor(self) -- 37
			dmg:SetDamagePosition(ply:EyePos()) -- 38
			ply:TakeDamageInfo(dmg) -- 39
			return self:Remove() -- 40
		end -- 4
	} -- 4
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 41
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 4
			_base_0[_key_0] = _val_0 -- 4
		end -- 4
	end -- 41
	if _base_0.__index == nil then -- 4
		_base_0.__index = _base_0 -- 4
	end -- 41
	setmetatable(_base_0, _parent_0.__base) -- 4
	_class_0 = setmetatable({ -- 4
		__init = function(self, ...) -- 4
			return _class_0.__parent.__init(self, ...) -- 4
		end, -- 4
		__base = _base_0, -- 4
		__name = "Metal", -- 4
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
	self.__entity = "metal" -- 5
	if _parent_0.__inherited then -- 4
		_parent_0.__inherited(_parent_0, _class_0) -- 4
	end -- 4
	Metal = _class_0 -- 4
end -- 41
local Scrap -- 42
do -- 42
	local _class_0 -- 42
	local _parent_0 = Metal -- 42
	local _base_0 = { -- 42
		Model = Model("models/gibs/manhack_gib01.mdl"), -- 45
		PrintName = "Scrap Metal", -- 46
		Description = "A chunk of delectable scrap metal.", -- 47
		UseText = { -- 48
			"cuts their tongue eating the sharp metal.", -- 48
			"disfigures themselves enjoying a nice chunk of metal.", -- 49
			"lets the sharp metal wreak havoc on their stomach.", -- 50
			"pierces their cheeks trying to eat scrap metal." -- 51
		}, -- 54
		BiteDamage = 25, -- 56
		Precursor = { -- 57
			metal = 1 -- 57
		} -- 42
	} -- 42
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 57
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 42
			_base_0[_key_0] = _val_0 -- 42
		end -- 42
	end -- 57
	if _base_0.__index == nil then -- 42
		_base_0.__index = _base_0 -- 42
	end -- 57
	setmetatable(_base_0, _parent_0.__base) -- 42
	_class_0 = setmetatable({ -- 42
		__init = function(self, ...) -- 42
			return _class_0.__parent.__init(self, ...) -- 42
		end, -- 42
		__base = _base_0, -- 42
		__name = "Scrap", -- 42
		__parent = _parent_0 -- 42
	}, { -- 42
		__index = function(cls, name) -- 42
			local val = rawget(_base_0, name) -- 42
			if val == nil then -- 42
				local parent = rawget(cls, "__parent") -- 42
				if parent then -- 42
					return parent[name] -- 42
				end -- 42
			else -- 42
				return val -- 42
			end -- 42
		end, -- 42
		__call = function(cls, ...) -- 42
			local _self_0 = setmetatable({ }, _base_0) -- 42
			cls.__init(_self_0, ...) -- 42
			return _self_0 -- 42
		end -- 42
	}) -- 42
	_base_0.__class = _class_0 -- 42
	if _parent_0.__inherited then -- 42
		_parent_0.__inherited(_parent_0, _class_0) -- 42
	end -- 42
	Scrap = _class_0 -- 42
end -- 57
local Slag -- 60
do -- 60
	local _class_0 -- 60
	local _parent_0 = Metal -- 60
	local _base_0 = { -- 60
		Model = Model("models/props_junk/rock001a.mdl"), -- 63
		PrintName = "Slag Metal", -- 64
		Description = "A rock with a piece of metal stuck in it.\nCan be processed in a Refinery.", -- 65
		UseText = { -- 66
			"breaks their teeth trying to crack open the slag metal.", -- 66
			"shatters their morals gnawing a piece of slag metal.", -- 67
			"hurts their jaw on a piece of slag metal." -- 68
		}, -- 71
		BiteDamage = 34, -- 73
		Refinement = { -- 74
			result = "metal/scrap", -- 74
			time = 2 -- 75
		} -- 60
	} -- 60
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 75
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 60
			_base_0[_key_0] = _val_0 -- 60
		end -- 60
	end -- 75
	if _base_0.__index == nil then -- 60
		_base_0.__index = _base_0 -- 60
	end -- 75
	setmetatable(_base_0, _parent_0.__base) -- 60
	_class_0 = setmetatable({ -- 60
		__init = function(self, ...) -- 60
			return _class_0.__parent.__init(self, ...) -- 60
		end, -- 60
		__base = _base_0, -- 60
		__name = "Slag", -- 60
		__parent = _parent_0 -- 60
	}, { -- 60
		__index = function(cls, name) -- 60
			local val = rawget(_base_0, name) -- 60
			if val == nil then -- 60
				local parent = rawget(cls, "__parent") -- 60
				if parent then -- 60
					return parent[name] -- 60
				end -- 60
			else -- 60
				return val -- 60
			end -- 60
		end, -- 60
		__call = function(cls, ...) -- 60
			local _self_0 = setmetatable({ }, _base_0) -- 60
			cls.__init(_self_0, ...) -- 60
			return _self_0 -- 60
		end -- 60
	}) -- 60
	_base_0.__class = _class_0 -- 60
	if _parent_0.__inherited then -- 60
		_parent_0.__inherited(_parent_0, _class_0) -- 60
	end -- 60
	Slag = _class_0 -- 60
	return _class_0 -- 75
end -- 75
