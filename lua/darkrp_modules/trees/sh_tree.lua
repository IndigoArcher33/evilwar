local TreeHurt
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 4 do
				_accum_0[_len_0] = "physics/flesh/flesh_squishy_impact_hard" .. tostring(i) .. ".wav"
				_len_0 = _len_0 + 1
			end
			return _accum_0
		end)(),
		pitch = {
			80,
			115
		}
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
		__name = "TreeHurt",
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
	TreeHurt = _class_0
end
local TreeBirth
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = "placenta/bonehead_aggrod3.wav",
		pitch = {
			80,
			130
		}
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
		__name = "TreeBirth",
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
	TreeBirth = _class_0
end
local TreeDeath
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = "placenta/bonehead_aggrod2.wav",
		pitch = {
			80,
			130
		}
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
		__name = "TreeDeath",
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
	TreeDeath = _class_0
end
local Tree
do
	local _class_0
	local _parent_0 = ENTITY
	local _base_0 = {
		Base = "base_anim",
		Type = "anim",
		Spawnable = true,
		AdminSpawnable = true,
		Pocketable = false,
		LootTable = {
			"wood/scrap"
		},
		SetupDataTables = function(self)
			return self:NetworkVar("Int", "Integrity")
		end,
		Initialize = function(self)
			if CLIENT then
				return
			end
			self:SetModel("models/props_foliage/tree_deciduous_03a.mdl")
			self:SetMaterial("models/charple/charple3_sheet")
			self:PhysicsInit(SOLID_VPHYSICS)
			self:SetIntegrity(300)
			self:PhysWake()
			return self:EmitSound("TreeBirth")
		end,
		OnTakeDamage = function(self, dmg)
			local dtype = dmg:GetDamageType()
			if not (dtype == DMG_SLASH) then
				return
			end
			local dmg_int = dmg:GetDamage()
			local inflictor = dmg:GetInflictor()
			if inflictor.TreeBonus then
				dmg_int = dmg_int * inflictor.TreeBonus
			end
			local pos = dmg:GetDamagePosition()
			do
				local edata = EffectData()
				edata:SetOrigin(pos)
				edata:SetScale(60)
				util.Effect("BloodImpact", edata)
			end
			self:SetIntegrity(self:GetIntegrity() - dmg_int)
			self.NextSound = self.NextSound or CurTime()
			if CurTime() >= self.NextSound then
				self.NextSound = CurTime() + 0.1
				self:EmitSound("TreeHurt")
			end
			if (self:GetIntegrity() <= 0) and not self.Breaking then
				self.Breaking = true
				self:EmitSound("TreeDeath")
				for i = 1, math.random(1, 3) do
					local cls = self.LootTable[math.random(1, #self.LootTable)]
					local loot = ents.Create(cls)
					loot:Spawn()
					loot:Activate()
					loot:SetPos(pos)
				end
				return self:Remove()
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
		__name = "Tree",
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
	Tree = _class_0
	return _class_0
end
