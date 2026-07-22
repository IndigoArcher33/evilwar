-- [yue]: darkrp_modules\fleshbox\sh_fleshbox.yue
local BoxHurt -- 1
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
		__name = "BoxHurt", -- 1
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
	BoxHurt = _class_0 -- 1
end -- 3
local BoxSpawn -- 5
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
		__name = "BoxSpawn", -- 5
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
	BoxSpawn = _class_0 -- 5
end -- 7
local BoxDeath -- 9
do -- 9
	local _class_0 -- 9
	local _parent_0 = SOUND -- 9
	local _base_0 = { -- 9
		sound = "dysphoria/gore/skullcrush1.ogg", -- 11
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
		__name = "BoxDeath", -- 9
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
	BoxDeath = _class_0 -- 9
end -- 11
local damage_types = { -- 14
	DMG_SLASH, -- 14
	DMG_CLUB, -- 15
	DMG_BURN, -- 16
	DMG_BULLET, -- 17
	DMG_BLAST -- 18
} -- 13
local Fleshbox -- 21
do -- 21
	local _class_0 -- 21
	local _parent_0 = ENTITY -- 21
	local _base_0 = { -- 21
		Base = "base_anim", -- 23
		Type = "anim", -- 24
		Spawnable = true, -- 25
		Interesting = true, -- 26
		AdminSpawnable = true, -- 28
		Pocketable = false, -- 29
		PrintName = "Decaying Cache", -- 31
		LootTable = { -- 32
			"crate/fleshcrate" -- 32
		}, -- 34
		SetupDataTables = function(self) -- 34
			self:NetworkVar("Int", "Integrity") -- 35
			return self:NetworkVar("Int", "DamageFilter") -- 36
		end, -- 38
		Initialize = function(self) -- 38
			if CLIENT then -- 39
				return -- 39
			end -- 39
			self:SetModel("models/props/de_prodigy/ammo_can_01.mdl") -- 40
			self:SetMaterial("models/gibs/humans/liver_gib") -- 41
			self:PhysicsInit(SOLID_VPHYSICS) -- 42
			self:SetIntegrity(300) -- 43
			self:PhysWake() -- 44
			self:EmitSound("BoxSpawn") -- 45
			return self:SetDamageFilter(damage_types[math.random(1, #damage_types)]) -- 46
		end, -- 48
		HUDRender = function(self) -- 48
			local ct = { } -- 49
			ct[#ct + 1] = self.PrintName -- 50
			ct[#ct + 1] = { -- 52
				text = "An old military cache, you don't recognise the markings.", -- 52
				font = "Spleen_Label_Small" -- 53
			} -- 51
			ct[#ct + 1] = { -- 56
				text = "It seems to have something inside. DMG: " .. tostring(self.GetDamageFilter), -- 56
				font = "Spleen_Label_Small" -- 57
			} -- 55
			return ct -- 59
		end, -- 62
		OnTakeDamage = function(self, dmg) -- 62
			local dtype = dmg:GetDamageType() -- 63
			if not (dtype == self:GetDamageFilter()) then -- 64
				return -- 64
			end -- 64
			local dmg_int = dmg:GetDamage() -- 65
			local inflictor = dmg:GetInflictor() -- 66
			if inflictor.TreeBonus then -- 67
				dmg_int = dmg_int * inflictor.TreeBonus -- 67
			end -- 67
			local pos = dmg:GetDamagePosition() -- 68
			do -- 69
				local edata = EffectData() -- 69
				edata:SetOrigin(pos) -- 70
				edata:SetScale(60) -- 71
				util.Effect("BloodImpact", edata) -- 72
			end -- 69
			self:SetIntegrity(self:GetIntegrity() - dmg_int) -- 74
			self.NextSound = self.NextSound or CurTime() -- 75
			if CurTime() >= self.NextSound then -- 76
				self.NextSound = CurTime() + 0.1 -- 77
				self:EmitSound("TreeHurt") -- 78
			end -- 76
			if (self:GetIntegrity() <= 0) and not self.Breaking then -- 79
				self.Breaking = true -- 80
				self:EmitSound("BoxDeath") -- 81
				for i = 1, math.random(1, 3) do -- 82
					local cls = self.LootTable[math.random(1, #self.LootTable)] -- 83
					local loot = ents.Create(cls) -- 84
					loot:Spawn() -- 86
					loot:Activate() -- 87
					loot:SetPos(pos) -- 88
				end -- 88
				return self:Remove() -- 89
			end -- 79
		end -- 21
	} -- 21
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 89
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 21
			_base_0[_key_0] = _val_0 -- 21
		end -- 21
	end -- 89
	if _base_0.__index == nil then -- 21
		_base_0.__index = _base_0 -- 21
	end -- 89
	setmetatable(_base_0, _parent_0.__base) -- 21
	_class_0 = setmetatable({ -- 21
		__init = function(self, ...) -- 21
			return _class_0.__parent.__init(self, ...) -- 21
		end, -- 21
		__base = _base_0, -- 21
		__name = "Fleshbox", -- 21
		__parent = _parent_0 -- 21
	}, { -- 21
		__index = function(cls, name) -- 21
			local val = rawget(_base_0, name) -- 21
			if val == nil then -- 21
				local parent = rawget(cls, "__parent") -- 21
				if parent then -- 21
					return parent[name] -- 21
				end -- 21
			else -- 21
				return val -- 21
			end -- 21
		end, -- 21
		__call = function(cls, ...) -- 21
			local _self_0 = setmetatable({ }, _base_0) -- 21
			cls.__init(_self_0, ...) -- 21
			return _self_0 -- 21
		end -- 21
	}) -- 21
	_base_0.__class = _class_0 -- 21
	if _parent_0.__inherited then -- 21
		_parent_0.__inherited(_parent_0, _class_0) -- 21
	end -- 21
	Fleshbox = _class_0 -- 21
	return _class_0 -- 89
end -- 89
