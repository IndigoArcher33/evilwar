-- [yue]: darkrp_modules\trees\sh_tree.yue
local TreeHurt -- 1
do -- 1
	local _class_0 -- 1
	local _parent_0 = SOUND -- 1
	local _base_0 = { -- 1
		sound = (function() -- 2
			local _accum_0 = { } -- 2
			local _len_0 = 1 -- 2
			for i = 1, 4 do -- 2
				_accum_0[_len_0] = "physics/flesh/flesh_squishy_impact_hard" .. tostring(i) .. ".wav" -- 2
				_len_0 = _len_0 + 1 -- 2
			end -- 2
			return _accum_0 -- 2
		end)(), -- 3
		pitch = { -- 3
			80, -- 3
			115 -- 3
		} -- 1
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
		__name = "TreeHurt", -- 1
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
	TreeHurt = _class_0 -- 1
end -- 3
local TreeBirth -- 5
do -- 5
	local _class_0 -- 5
	local _parent_0 = SOUND -- 5
	local _base_0 = { -- 5
		sound = "placenta/bonehead_aggrod3.wav", -- 7
		pitch = { -- 7
			80, -- 7
			130 -- 7
		} -- 5
	} -- 5
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 7
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 5
			_base_0[_key_0] = _val_0 -- 5
		end -- 5
	end -- 7
	if _base_0.__index == nil then -- 5
		_base_0.__index = _base_0 -- 5
	end -- 7
	setmetatable(_base_0, _parent_0.__base) -- 5
	_class_0 = setmetatable({ -- 5
		__init = function(self, ...) -- 5
			return _class_0.__parent.__init(self, ...) -- 5
		end, -- 5
		__base = _base_0, -- 5
		__name = "TreeBirth", -- 5
		__parent = _parent_0 -- 5
	}, { -- 5
		__index = function(cls, name) -- 5
			local val = rawget(_base_0, name) -- 5
			if val == nil then -- 5
				local parent = rawget(cls, "__parent") -- 5
				if parent then -- 5
					return parent[name] -- 5
				end -- 5
			else -- 5
				return val -- 5
			end -- 5
		end, -- 5
		__call = function(cls, ...) -- 5
			local _self_0 = setmetatable({ }, _base_0) -- 5
			cls.__init(_self_0, ...) -- 5
			return _self_0 -- 5
		end -- 5
	}) -- 5
	_base_0.__class = _class_0 -- 5
	if _parent_0.__inherited then -- 5
		_parent_0.__inherited(_parent_0, _class_0) -- 5
	end -- 5
	TreeBirth = _class_0 -- 5
end -- 7
local TreeDeath -- 9
do -- 9
	local _class_0 -- 9
	local _parent_0 = SOUND -- 9
	local _base_0 = { -- 9
		sound = "placenta/bonehead_aggrod2.wav", -- 11
		pitch = { -- 11
			80, -- 11
			130 -- 11
		} -- 9
	} -- 9
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 11
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 9
			_base_0[_key_0] = _val_0 -- 9
		end -- 9
	end -- 11
	if _base_0.__index == nil then -- 9
		_base_0.__index = _base_0 -- 9
	end -- 11
	setmetatable(_base_0, _parent_0.__base) -- 9
	_class_0 = setmetatable({ -- 9
		__init = function(self, ...) -- 9
			return _class_0.__parent.__init(self, ...) -- 9
		end, -- 9
		__base = _base_0, -- 9
		__name = "TreeDeath", -- 9
		__parent = _parent_0 -- 9
	}, { -- 9
		__index = function(cls, name) -- 9
			local val = rawget(_base_0, name) -- 9
			if val == nil then -- 9
				local parent = rawget(cls, "__parent") -- 9
				if parent then -- 9
					return parent[name] -- 9
				end -- 9
			else -- 9
				return val -- 9
			end -- 9
		end, -- 9
		__call = function(cls, ...) -- 9
			local _self_0 = setmetatable({ }, _base_0) -- 9
			cls.__init(_self_0, ...) -- 9
			return _self_0 -- 9
		end -- 9
	}) -- 9
	_base_0.__class = _class_0 -- 9
	if _parent_0.__inherited then -- 9
		_parent_0.__inherited(_parent_0, _class_0) -- 9
	end -- 9
	TreeDeath = _class_0 -- 9
end -- 11
local Tree -- 13
do -- 13
	local _class_0 -- 13
	local _parent_0 = ENTITY -- 13
	local _base_0 = { -- 13
		Base = "base_anim", -- 15
		Type = "anim", -- 16
		Spawnable = true, -- 17
		AdminSpawnable = true, -- 19
		Pocketable = false, -- 21
		LootTable = { -- 22
			"wood/scrap", -- 22
			"item/food/skin" -- 23
		}, -- 25
		SetupDataTables = function(self) -- 25
			return self:NetworkVar("Int", "Integrity") -- 26
		end, -- 28
		Initialize = function(self) -- 28
			if CLIENT then -- 29
				return -- 29
			end -- 29
			self:SetModel("models/props_foliage/tree_deciduous_03a.mdl") -- 30
			self:SetMaterial("models/charple/charple3_sheet") -- 31
			self:PhysicsInit(SOLID_VPHYSICS) -- 32
			self:SetIntegrity(300) -- 33
			self:PhysWake() -- 34
			return self:EmitSound("TreeBirth") -- 35
		end, -- 37
		OnTakeDamage = function(self, dmg) -- 37
			local dtype = dmg:GetDamageType() -- 38
			if not (dtype == DMG_SLASH) then -- 39
				return -- 39
			end -- 39
			local dmg_int = dmg:GetDamage() -- 40
			local inflictor = dmg:GetInflictor() -- 41
			if inflictor.TreeBonus then -- 42
				dmg_int = dmg_int * inflictor.TreeBonus -- 42
			end -- 42
			local pos = dmg:GetDamagePosition() -- 43
			do -- 44
				local edata = EffectData() -- 44
				edata:SetOrigin(pos) -- 45
				edata:SetScale(60) -- 46
				util.Effect("BloodImpact", edata) -- 47
			end -- 44
			self:SetIntegrity(self:GetIntegrity() - dmg_int) -- 49
			self.NextSound = self.NextSound or CurTime() -- 50
			if CurTime() >= self.NextSound then -- 51
				self.NextSound = CurTime() + 0.1 -- 52
				self:EmitSound("TreeHurt") -- 53
			end -- 51
			if (self:GetIntegrity() <= 0) and not self.Breaking then -- 54
				self.Breaking = true -- 55
				self:EmitSound("TreeDeath") -- 56
				for i = 1, math.random(1, 3) do -- 57
					local cls = self.LootTable[math.random(1, #self.LootTable)] -- 58
					local loot = ents.Create(cls) -- 59
					loot:Spawn() -- 61
					loot:Activate() -- 62
					loot:SetPos(pos) -- 63
				end -- 63
				return self:Remove() -- 64
			end -- 54
		end -- 13
	} -- 13
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 65
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 13
			_base_0[_key_0] = _val_0 -- 13
		end -- 13
	end -- 65
	if _base_0.__index == nil then -- 13
		_base_0.__index = _base_0 -- 13
	end -- 65
	setmetatable(_base_0, _parent_0.__base) -- 13
	_class_0 = setmetatable({ -- 13
		__init = function(self, ...) -- 13
			return _class_0.__parent.__init(self, ...) -- 13
		end, -- 13
		__base = _base_0, -- 13
		__name = "Tree", -- 13
		__parent = _parent_0 -- 13
	}, { -- 13
		__index = function(cls, name) -- 13
			local val = rawget(_base_0, name) -- 13
			if val == nil then -- 13
				local parent = rawget(cls, "__parent") -- 13
				if parent then -- 13
					return parent[name] -- 13
				end -- 13
			else -- 13
				return val -- 13
			end -- 13
		end, -- 13
		__call = function(cls, ...) -- 13
			local _self_0 = setmetatable({ }, _base_0) -- 13
			cls.__init(_self_0, ...) -- 13
			return _self_0 -- 13
		end -- 13
	}) -- 13
	_base_0.__class = _class_0 -- 13
	if _parent_0.__inherited then -- 13
		_parent_0.__inherited(_parent_0, _class_0) -- 13
	end -- 13
	Tree = _class_0 -- 13
	return _class_0 -- 65
end -- 65
