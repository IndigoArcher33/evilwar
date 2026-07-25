-- [yue]: darkrp_modules\food\sh_food.yue
local FoodRot -- 1
do -- 1
	local _class_0 -- 1
	local _parent_0 = SOUND -- 1
	local _base_0 = { -- 1
		sound = (function() -- 2
			local _accum_0 = { } -- 2
			local _len_0 = 1 -- 2
			for i = 1, 3 do -- 2
				_accum_0[_len_0] = "weapons/bugbait/bugbait_squeeze" .. tostring(i) .. ".wav" -- 2
				_len_0 = _len_0 + 1 -- 2
			end -- 2
			return _accum_0 -- 2
		end)(), -- 3
		level = SNDLVL_50dB -- 1
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
		__name = "FoodRot", -- 1
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
	FoodRot = _class_0 -- 1
end -- 3
local Submit_Food -- 5
do -- 5
	local _class_0 -- 5
	local _parent_0 = SOUND -- 5
	local _base_0 = { -- 5
		sound = (function() -- 6
			local _accum_0 = { } -- 6
			local _len_0 = 1 -- 6
			for i = 1, 4 do -- 6
				_accum_0[_len_0] = "npc/barnacle/barnacle_pull" .. tostring(i) .. ".wav" -- 6
				_len_0 = _len_0 + 1 -- 6
			end -- 6
			return _accum_0 -- 6
		end)() -- 5
	} -- 5
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 6
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 5
			_base_0[_key_0] = _val_0 -- 5
		end -- 5
	end -- 6
	if _base_0.__index == nil then -- 5
		_base_0.__index = _base_0 -- 5
	end -- 6
	setmetatable(_base_0, _parent_0.__base) -- 5
	_class_0 = setmetatable({ -- 5
		__init = function(self, ...) -- 5
			return _class_0.__parent.__init(self, ...) -- 5
		end, -- 5
		__base = _base_0, -- 5
		__name = "Submit_Food", -- 5
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
	Submit_Food = _class_0 -- 5
end -- 6
local Food -- 8
do -- 8
	local _class_0 -- 8
	local _parent_0 = ITEM -- 8
	local _base_0 = { -- 8
		SetupDataTables = function(self) -- 9
			_class_0.__parent.__base.SetupDataTables(self) -- 10
			return self:NetworkVar("Bool", "Rotten") -- 11
		end, -- 13
		PrintName = "Food", -- 14
		Model = Model("models/props_junk/garbage_plasticbottle002a.mdl"), -- 15
		Category = "EvilRP: Food", -- 16
		Spawnable = true, -- 17
		Interesting = true, -- 19
		Sound = Sound("npc/barnacle/barnacle_crunch2.wav"), -- 20
		SubmitSound = "Submit_Food", -- 22
		Hunger = 0, -- 23
		Thirst = 0, -- 24
		Despair = 0, -- 25
		HealthAdd = 0, -- 26
		CookTime = 0, -- 28
		RotTime = 0, -- 30
		Eat = function(self, ply) -- 30
			if CLIENT then -- 31
				return -- 31
			end -- 31
			local amt -- 32
			if self.Hunger then -- 33
				amt = self.Hunger -- 34
				if isfunction(amt) then -- 35
					amt = amt() -- 35
				end -- 35
				ply:AddHunger(amt) -- 36
			end -- 33
			if self.Thirst then -- 37
				amt = self.Thirst -- 38
				if isfunction(amt) then -- 39
					amt = amt() -- 39
				end -- 39
				ply:AddThirst(amt) -- 40
			end -- 37
			if self.Despair then -- 41
				amt = self.Despair -- 42
				if isfunction(amt) then -- 43
					amt = amt() -- 43
				end -- 43
				ply:AddDespair(amt) -- 44
			end -- 41
			if self.HealthAdd then -- 45
				amt = self.HealthAdd -- 46
				if isfunction(amt) then -- 47
					amt = amt() -- 47
				end -- 47
				if amt > 0 then -- 48
					ply:SetHealth(math.min(ply:Health() + amt, ply:GetMaxHealth())) -- 49
				elseif amt < 0 then -- 50
					ply:TakeDamage(-amt) -- 51
				end -- 48
			end -- 45
			if not self.PersistAfterEat then -- 54
				return self:Trash() -- 54
			end -- 54
		end, -- 56
		OnUseFinish = function(self, ply) -- 56
			_class_0.__parent.__base.OnUseFinish(self, ply) -- 57
			return self:Eat(ply) -- 58
		end, -- 60
		OnSpawned = function(self) -- 60
			_class_0.__parent.__base.OnSpawned(self) -- 61
			self:SetRotten(false) -- 62
			if self.RotTime > 0 then -- 63
				self.RotsIn = CurTime() + self.RotTime -- 63
			end -- 63
			return -- 64
		end, -- 66
		Think = function(self) -- 66
			_class_0.__parent.__base.Think(self) -- 67
			if CLIENT then -- 68
				return -- 68
			end -- 68
			if self.RotsIn and (not self:GetRotten()) and self.RotsIn < CurTime() then -- 69
				return self:Rot() -- 69
			end -- 69
		end, -- 71
		Rot = function(self) -- 71
			self:SetRotten(true) -- 72
			self:SetColor(Color(100, 0, 150)) -- 73
			return self:EmitSound("FoodRot") -- 74
		end -- 8
	} -- 8
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 74
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 8
			_base_0[_key_0] = _val_0 -- 8
		end -- 8
	end -- 74
	if _base_0.__index == nil then -- 8
		_base_0.__index = _base_0 -- 8
	end -- 74
	setmetatable(_base_0, _parent_0.__base) -- 8
	_class_0 = setmetatable({ -- 8
		__init = function(self, ...) -- 8
			return _class_0.__parent.__init(self, ...) -- 8
		end, -- 8
		__base = _base_0, -- 8
		__name = "Food", -- 8
		__parent = _parent_0 -- 8
	}, { -- 8
		__index = function(cls, name) -- 8
			local val = rawget(_base_0, name) -- 8
			if val == nil then -- 8
				local parent = rawget(cls, "__parent") -- 8
				if parent then -- 8
					return parent[name] -- 8
				end -- 8
			else -- 8
				return val -- 8
			end -- 8
		end, -- 8
		__call = function(cls, ...) -- 8
			local _self_0 = setmetatable({ }, _base_0) -- 8
			cls.__init(_self_0, ...) -- 8
			return _self_0 -- 8
		end -- 8
	}) -- 8
	_base_0.__class = _class_0 -- 8
	if _parent_0.__inherited then -- 8
		_parent_0.__inherited(_parent_0, _class_0) -- 8
	end -- 8
	Food = _class_0 -- 8
end -- 74
local SlopSkull -- 76
do -- 76
	local _class_0 -- 76
	local _parent_0 = Food -- 76
	local _base_0 = { -- 76
		PrintName = "Slop Skull", -- 78
		Model = Model("models/Gibs/HGIBS.mdl"), -- 79
		Hunger = -10, -- 80
		Description = "A bloody, festering human skull.\nThe brain is still largely intact.", -- 81
		RotTime = 120, -- 83
		UseText = { -- 84
			"munches and crunches on a slop skull.", -- 84
			"slurps the brain matter out of a slop skull.", -- 85
			"digs around in a slop skull with their tongue.", -- 86
			"ravenously consumes a slop skull.", -- 87
			"gets pink sludge everywhere while eating a slop skull.", -- 88
			"scours a slop skull for brainmeat.", -- 89
			"cracks open a slop skull and slurps the brains out." -- 90
		}, -- 93
		Precursor = { -- 94
			biomass = 1 -- 94
		} -- 76
	} -- 76
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 94
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 76
			_base_0[_key_0] = _val_0 -- 76
		end -- 76
	end -- 94
	if _base_0.__index == nil then -- 76
		_base_0.__index = _base_0 -- 76
	end -- 94
	setmetatable(_base_0, _parent_0.__base) -- 76
	_class_0 = setmetatable({ -- 76
		__init = function(self, ...) -- 76
			return _class_0.__parent.__init(self, ...) -- 76
		end, -- 76
		__base = _base_0, -- 76
		__name = "SlopSkull", -- 76
		__parent = _parent_0 -- 76
	}, { -- 76
		__index = function(cls, name) -- 76
			local val = rawget(_base_0, name) -- 76
			if val == nil then -- 76
				local parent = rawget(cls, "__parent") -- 76
				if parent then -- 76
					return parent[name] -- 76
				end -- 76
			else -- 76
				return val -- 76
			end -- 76
		end, -- 76
		__call = function(cls, ...) -- 76
			local _self_0 = setmetatable({ }, _base_0) -- 76
			cls.__init(_self_0, ...) -- 76
			return _self_0 -- 76
		end -- 76
	}) -- 76
	_base_0.__class = _class_0 -- 76
	if _parent_0.__inherited then -- 76
		_parent_0.__inherited(_parent_0, _class_0) -- 76
	end -- 76
	SlopSkull = _class_0 -- 76
end -- 94
local Paper -- 96
do -- 96
	local _class_0 -- 96
	local _parent_0 = Food -- 96
	local _base_0 = { -- 96
		PrintName = "Paper", -- 98
		Model = Model("models/props_lab/papersheet001a.mdl"), -- 99
		Hunger = -7, -- 100
		Thirst = 10, -- 101
		Description = "A dirty scrap of used paper.\nThe writing is too faint to make out.", -- 103
		UseText = { -- 104
			"chokes down a sheet of paper.", -- 104
			"tears up and eats a sheet of paper.", -- 105
			"chews the paper into a stiff pulp and swallows.", -- 106
			"struggles to swallow a dry sheet of paper.", -- 107
			"eats paper.", -- 108
			"crumples up some paper and struggles to chew it.", -- 109
			"munches on a piece of paper." -- 110
		} -- 96
	} -- 96
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 111
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 96
			_base_0[_key_0] = _val_0 -- 96
		end -- 96
	end -- 111
	if _base_0.__index == nil then -- 96
		_base_0.__index = _base_0 -- 96
	end -- 111
	setmetatable(_base_0, _parent_0.__base) -- 96
	_class_0 = setmetatable({ -- 96
		__init = function(self, ...) -- 96
			return _class_0.__parent.__init(self, ...) -- 96
		end, -- 96
		__base = _base_0, -- 96
		__name = "Paper", -- 96
		__parent = _parent_0 -- 96
	}, { -- 96
		__index = function(cls, name) -- 96
			local val = rawget(_base_0, name) -- 96
			if val == nil then -- 96
				local parent = rawget(cls, "__parent") -- 96
				if parent then -- 96
					return parent[name] -- 96
				end -- 96
			else -- 96
				return val -- 96
			end -- 96
		end, -- 96
		__call = function(cls, ...) -- 96
			local _self_0 = setmetatable({ }, _base_0) -- 96
			cls.__init(_self_0, ...) -- 96
			return _self_0 -- 96
		end -- 96
	}) -- 96
	_base_0.__class = _class_0 -- 96
	if _parent_0.__inherited then -- 96
		_parent_0.__inherited(_parent_0, _class_0) -- 96
	end -- 96
	Paper = _class_0 -- 96
end -- 111
local RibBone -- 113
do -- 113
	local _class_0 -- 113
	local _parent_0 = Food -- 113
	local _base_0 = { -- 113
		PrintName = "Dry Rib", -- 115
		Model = Model("models/Gibs/hgibs_rib.mdl"), -- 116
		Hunger = -8, -- 117
		HealthAdd = -7, -- 118
		RotTime = 240, -- 119
		Description = "A lone human rib.\nYou could chew the marrow out, but it'd probably hurt.", -- 121
		UseText = { -- 122
			"breaks a tooth chewing on a rib bone.", -- 122
			"sucks marrow and bone shards from the rib.", -- 123
			"cuts up their throat eating a rib bone.", -- 124
			"bleeds from the mouth as they eat a rib bone.", -- 125
			"eats a bone, like a vulture.", -- 126
			"chokes on the broken points of a rib bone." -- 127
		}, -- 130
		Precursor = { -- 131
			biomass = 1 -- 131
		} -- 113
	} -- 113
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 131
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 113
			_base_0[_key_0] = _val_0 -- 113
		end -- 113
	end -- 131
	if _base_0.__index == nil then -- 113
		_base_0.__index = _base_0 -- 113
	end -- 131
	setmetatable(_base_0, _parent_0.__base) -- 113
	_class_0 = setmetatable({ -- 113
		__init = function(self, ...) -- 113
			return _class_0.__parent.__init(self, ...) -- 113
		end, -- 113
		__base = _base_0, -- 113
		__name = "RibBone", -- 113
		__parent = _parent_0 -- 113
	}, { -- 113
		__index = function(cls, name) -- 113
			local val = rawget(_base_0, name) -- 113
			if val == nil then -- 113
				local parent = rawget(cls, "__parent") -- 113
				if parent then -- 113
					return parent[name] -- 113
				end -- 113
			else -- 113
				return val -- 113
			end -- 113
		end, -- 113
		__call = function(cls, ...) -- 113
			local _self_0 = setmetatable({ }, _base_0) -- 113
			cls.__init(_self_0, ...) -- 113
			return _self_0 -- 113
		end -- 113
	}) -- 113
	_base_0.__class = _class_0 -- 113
	if _parent_0.__inherited then -- 113
		_parent_0.__inherited(_parent_0, _class_0) -- 113
	end -- 113
	RibBone = _class_0 -- 113
end -- 131
local Skin -- 133
do -- 133
	local _class_0 -- 133
	local _parent_0 = Food -- 133
	local _base_0 = { -- 133
		PrintName = "Skin", -- 135
		Description = "A greasy patch of some kind of hide.\nIt would probably taste nasty.", -- 136
		Model = Model("models/gibs/antlion_gib_small_2.mdl"), -- 137
		HealthAdd = function(self) -- 137
			return math.random(10, 20) -- 137
		end -- 133
	} -- 133
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 137
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 133
			_base_0[_key_0] = _val_0 -- 133
		end -- 133
	end -- 137
	if _base_0.__index == nil then -- 133
		_base_0.__index = _base_0 -- 133
	end -- 137
	setmetatable(_base_0, _parent_0.__base) -- 133
	_class_0 = setmetatable({ -- 133
		__init = function(self, ...) -- 133
			return _class_0.__parent.__init(self, ...) -- 133
		end, -- 133
		__base = _base_0, -- 133
		__name = "Skin", -- 133
		__parent = _parent_0 -- 133
	}, { -- 133
		__index = function(cls, name) -- 133
			local val = rawget(_base_0, name) -- 133
			if val == nil then -- 133
				local parent = rawget(cls, "__parent") -- 133
				if parent then -- 133
					return parent[name] -- 133
				end -- 133
			else -- 133
				return val -- 133
			end -- 133
		end, -- 133
		__call = function(cls, ...) -- 133
			local _self_0 = setmetatable({ }, _base_0) -- 133
			cls.__init(_self_0, ...) -- 133
			return _self_0 -- 133
		end -- 133
	}) -- 133
	_base_0.__class = _class_0 -- 133
	if _parent_0.__inherited then -- 133
		_parent_0.__inherited(_parent_0, _class_0) -- 133
	end -- 133
	Skin = _class_0 -- 133
end -- 137
local Abortion -- 139
do -- 139
	local _class_0 -- 139
	local _parent_0 = Food -- 139
	local _base_0 = { -- 139
		PrintName = "Abortion", -- 141
		Model = Model("models/props_c17/doll01.mdl"), -- 142
		Hunger = -23, -- 143
		Thirst = -20, -- 144
		HealthAdd = 20, -- 145
		RotTime = 240, -- 146
		Description = "An artificial baby that never got the chance to be born.\nDelicious.", -- 148
		UseText = { -- 149
			"eats a baby.", -- 149
			"rips apart an abortion and eats the pieces.", -- 150
			"bites the head off an abortion and swallows the rest.", -- 151
			"chews an abortion into pink paste.", -- 152
			"tears chunks off an abortion until it's all gone.", -- 153
			"eats an abortion, baby blood dribbling down their neck.", -- 154
			"eats an abortion legs-first." -- 155
		}, -- 158
		Eat = function(self, ply) -- 158
			_class_0.__parent.__base.Eat(self, ply) -- 159
			if CLIENT then -- 160
				return -- 160
			end -- 160
			return ply:AddStemCells(1) -- 161
		end -- 139
	} -- 139
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 161
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 139
			_base_0[_key_0] = _val_0 -- 139
		end -- 139
	end -- 161
	if _base_0.__index == nil then -- 139
		_base_0.__index = _base_0 -- 139
	end -- 161
	setmetatable(_base_0, _parent_0.__base) -- 139
	_class_0 = setmetatable({ -- 139
		__init = function(self, ...) -- 139
			return _class_0.__parent.__init(self, ...) -- 139
		end, -- 139
		__base = _base_0, -- 139
		__name = "Abortion", -- 139
		__parent = _parent_0 -- 139
	}, { -- 139
		__index = function(cls, name) -- 139
			local val = rawget(_base_0, name) -- 139
			if val == nil then -- 139
				local parent = rawget(cls, "__parent") -- 139
				if parent then -- 139
					return parent[name] -- 139
				end -- 139
			else -- 139
				return val -- 139
			end -- 139
		end, -- 139
		__call = function(cls, ...) -- 139
			local _self_0 = setmetatable({ }, _base_0) -- 139
			cls.__init(_self_0, ...) -- 139
			return _self_0 -- 139
		end -- 139
	}) -- 139
	_base_0.__class = _class_0 -- 139
	if _parent_0.__inherited then -- 139
		_parent_0.__inherited(_parent_0, _class_0) -- 139
	end -- 139
	Abortion = _class_0 -- 139
end -- 161
local LiveBaby -- 163
do -- 163
	local _class_0 -- 163
	local _parent_0 = Food -- 163
	local _base_0 = { -- 163
		PrintName = "Live baby", -- 165
		Model = Model("models/props_c17/doll01.mdl"), -- 166
		Hunger = -52, -- 167
		Thirst = -47, -- 168
		HealthAdd = 40, -- 169
		RotTime = 480, -- 170
		Description = "An artifical baby, born paralyzed below the eyes.\nIt will know nothing but fear and pain.", -- 172
		UseText = { -- 173
			"eats a living infant.", -- 173
			"chews the head off a live baby and drinks its blood.", -- 174
			"eats a baby alive.", -- 175
			"eats a live baby and tastes its tears.", -- 176
			"rips apart a living baby and eats the pieces.", -- 177
			"tears open a live baby and feeds on its entrails.", -- 178
			"eats a live baby as it cries silently." -- 179
		} -- 163
	} -- 163
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 180
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 163
			_base_0[_key_0] = _val_0 -- 163
		end -- 163
	end -- 180
	if _base_0.__index == nil then -- 163
		_base_0.__index = _base_0 -- 163
	end -- 180
	setmetatable(_base_0, _parent_0.__base) -- 163
	_class_0 = setmetatable({ -- 163
		__init = function(self, ...) -- 163
			return _class_0.__parent.__init(self, ...) -- 163
		end, -- 163
		__base = _base_0, -- 163
		__name = "LiveBaby", -- 163
		__parent = _parent_0 -- 163
	}, { -- 163
		__index = function(cls, name) -- 163
			local val = rawget(_base_0, name) -- 163
			if val == nil then -- 163
				local parent = rawget(cls, "__parent") -- 163
				if parent then -- 163
					return parent[name] -- 163
				end -- 163
			else -- 163
				return val -- 163
			end -- 163
		end, -- 163
		__call = function(cls, ...) -- 163
			local _self_0 = setmetatable({ }, _base_0) -- 163
			cls.__init(_self_0, ...) -- 163
			return _self_0 -- 163
		end -- 163
	}) -- 163
	_base_0.__class = _class_0 -- 163
	if _parent_0.__inherited then -- 163
		_parent_0.__inherited(_parent_0, _class_0) -- 163
	end -- 163
	LiveBaby = _class_0 -- 163
end -- 180
local SoyLoaf -- 182
do -- 182
	local _class_0 -- 182
	local _parent_0 = Food -- 182
	local _base_0 = { -- 182
		PrintName = "Soylent Loaf", -- 184
		Model = Model("models/leakgibs/antlion_gib_small_3.mdl"), -- 185
		Hunger = -15, -- 186
		Thirst = 3, -- 187
		Despair = 5, -- 188
		Description = "A chewy loaf of dried Long Pig byproducts.\nLoathsome food, but it'll keep for a century.", -- 190
		Price = 20, -- 192
		UseText = { -- 193
			"gnaws at a soylent loaf.", -- 193
			"chokes down a soylent loaf.", -- 194
			"struggles to eat a soylent loaf.", -- 195
			"chomps on a loaf of mummified meat.", -- 196
			"grinds their teeth on a soylent loaf.", -- 197
			"chews off a chunk from a soylent loaf.", -- 198
			"eats some soylent, like a good citizen should." -- 199
		} -- 182
	} -- 182
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 200
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 182
			_base_0[_key_0] = _val_0 -- 182
		end -- 182
	end -- 200
	if _base_0.__index == nil then -- 182
		_base_0.__index = _base_0 -- 182
	end -- 200
	setmetatable(_base_0, _parent_0.__base) -- 182
	_class_0 = setmetatable({ -- 182
		__init = function(self, ...) -- 182
			return _class_0.__parent.__init(self, ...) -- 182
		end, -- 182
		__base = _base_0, -- 182
		__name = "SoyLoaf", -- 182
		__parent = _parent_0 -- 182
	}, { -- 182
		__index = function(cls, name) -- 182
			local val = rawget(_base_0, name) -- 182
			if val == nil then -- 182
				local parent = rawget(cls, "__parent") -- 182
				if parent then -- 182
					return parent[name] -- 182
				end -- 182
			else -- 182
				return val -- 182
			end -- 182
		end, -- 182
		__call = function(cls, ...) -- 182
			local _self_0 = setmetatable({ }, _base_0) -- 182
			cls.__init(_self_0, ...) -- 182
			return _self_0 -- 182
		end -- 182
	}) -- 182
	_base_0.__class = _class_0 -- 182
	if _parent_0.__inherited then -- 182
		_parent_0.__inherited(_parent_0, _class_0) -- 182
	end -- 182
	SoyLoaf = _class_0 -- 182
end -- 200
local BootSoup -- 202
do -- 202
	local _class_0 -- 202
	local _parent_0 = Food -- 202
	local _base_0 = { -- 202
		PrintName = "Boot n' soup", -- 204
		Model = Model("models/props_c17/metalPot001a.mdl"), -- 205
		HealthAdd = -5, -- 206
		Hunger = -40, -- 207
		Thirst = -4, -- 208
		Despair = 25, -- 209
		Description = "Formerly only filled with slop, now comes with 'vegan-meat'!", -- 210
		CookTime = 13, -- 212
		Price = 20, -- 214
		UseText = { -- 215
			"drinks the soup slowly, but chokes on the 'vegan-meat' .", -- 215
			"miserably slurps the soup, spitting out small chunks of 'vegan-meat'.", -- 216
			"struggles to eat any of the soup and 'vegan-meat'." -- 217
		} -- 202
	} -- 202
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 217
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 202
			_base_0[_key_0] = _val_0 -- 202
		end -- 202
	end -- 217
	if _base_0.__index == nil then -- 202
		_base_0.__index = _base_0 -- 202
	end -- 217
	setmetatable(_base_0, _parent_0.__base) -- 202
	_class_0 = setmetatable({ -- 202
		__init = function(self, ...) -- 202
			return _class_0.__parent.__init(self, ...) -- 202
		end, -- 202
		__base = _base_0, -- 202
		__name = "BootSoup", -- 202
		__parent = _parent_0 -- 202
	}, { -- 202
		__index = function(cls, name) -- 202
			local val = rawget(_base_0, name) -- 202
			if val == nil then -- 202
				local parent = rawget(cls, "__parent") -- 202
				if parent then -- 202
					return parent[name] -- 202
				end -- 202
			else -- 202
				return val -- 202
			end -- 202
		end, -- 202
		__call = function(cls, ...) -- 202
			local _self_0 = setmetatable({ }, _base_0) -- 202
			cls.__init(_self_0, ...) -- 202
			return _self_0 -- 202
		end -- 202
	}) -- 202
	_base_0.__class = _class_0 -- 202
	if _parent_0.__inherited then -- 202
		_parent_0.__inherited(_parent_0, _class_0) -- 202
	end -- 202
	BootSoup = _class_0 -- 202
end -- 217
local SlopBowl -- 219
do -- 219
	local _class_0 -- 219
	local _parent_0 = Food -- 219
	local _base_0 = { -- 219
		PrintName = "Slop Bowl", -- 221
		Model = Model("models/props_c17/metalPot001a.mdl"), -- 222
		Hunger = -30, -- 223
		Thirst = 4, -- 224
		Despair = 15, -- 225
		Description = "A festering pot that oozes a disgusting liquid.\nIt seems oddly comforting.", -- 226
		CookTime = 10, -- 228
		Price = 20, -- 230
		UseText = { -- 231
			"enjoys the slop.", -- 231
			"chokes while consuming slop.", -- 232
			"struggles to eat a slop bowl.", -- 233
			"chomps on some slop.", -- 234
			"begrudgingly eats a spoonful of slop.", -- 235
			"consumes slop." -- 236
		} -- 219
	} -- 219
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 236
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 219
			_base_0[_key_0] = _val_0 -- 219
		end -- 219
	end -- 236
	if _base_0.__index == nil then -- 219
		_base_0.__index = _base_0 -- 219
	end -- 236
	setmetatable(_base_0, _parent_0.__base) -- 219
	_class_0 = setmetatable({ -- 219
		__init = function(self, ...) -- 219
			return _class_0.__parent.__init(self, ...) -- 219
		end, -- 219
		__base = _base_0, -- 219
		__name = "SlopBowl", -- 219
		__parent = _parent_0 -- 219
	}, { -- 219
		__index = function(cls, name) -- 219
			local val = rawget(_base_0, name) -- 219
			if val == nil then -- 219
				local parent = rawget(cls, "__parent") -- 219
				if parent then -- 219
					return parent[name] -- 219
				end -- 219
			else -- 219
				return val -- 219
			end -- 219
		end, -- 219
		__call = function(cls, ...) -- 219
			local _self_0 = setmetatable({ }, _base_0) -- 219
			cls.__init(_self_0, ...) -- 219
			return _self_0 -- 219
		end -- 219
	}) -- 219
	_base_0.__class = _class_0 -- 219
	if _parent_0.__inherited then -- 219
		_parent_0.__inherited(_parent_0, _class_0) -- 219
	end -- 219
	SlopBowl = _class_0 -- 219
end -- 236
local Boot -- 239
do -- 239
	local _class_0 -- 239
	local _parent_0 = Food -- 239
	local _base_0 = { -- 239
		PrintName = "Boot", -- 241
		Model = Model("models/props_junk/Shoe001a.mdl"), -- 242
		AddHealth = -4, -- 243
		Hunger = -5, -- 244
		Thirst = 40, -- 245
		Despair = 40, -- 246
		Description = "A dirty old boot, nearly fallen apart.", -- 248
		UseText = { -- 249
			"chews on a nasty boot!", -- 249
			"chokes on an old boot.", -- 250
			"gnaws a boot to shreds.", -- 251
			"shoves a boot in their mouth!", -- 252
			"eats a rotten leather boot.", -- 253
			"devours a dirty old boot!", -- 254
			"eats a boot." -- 255
		} -- 239
	} -- 239
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 256
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 239
			_base_0[_key_0] = _val_0 -- 239
		end -- 239
	end -- 256
	if _base_0.__index == nil then -- 239
		_base_0.__index = _base_0 -- 239
	end -- 256
	setmetatable(_base_0, _parent_0.__base) -- 239
	_class_0 = setmetatable({ -- 239
		__init = function(self, ...) -- 239
			return _class_0.__parent.__init(self, ...) -- 239
		end, -- 239
		__base = _base_0, -- 239
		__name = "Boot", -- 239
		__parent = _parent_0 -- 239
	}, { -- 239
		__index = function(cls, name) -- 239
			local val = rawget(_base_0, name) -- 239
			if val == nil then -- 239
				local parent = rawget(cls, "__parent") -- 239
				if parent then -- 239
					return parent[name] -- 239
				end -- 239
			else -- 239
				return val -- 239
			end -- 239
		end, -- 239
		__call = function(cls, ...) -- 239
			local _self_0 = setmetatable({ }, _base_0) -- 239
			cls.__init(_self_0, ...) -- 239
			return _self_0 -- 239
		end -- 239
	}) -- 239
	_base_0.__class = _class_0 -- 239
	if _parent_0.__inherited then -- 239
		_parent_0.__inherited(_parent_0, _class_0) -- 239
	end -- 239
	Boot = _class_0 -- 239
end -- 256
local MoldMelon -- 258
do -- 258
	local _class_0 -- 258
	local _parent_0 = Food -- 258
	local _base_0 = { -- 258
		PrintName = "Mold Melon", -- 260
		Model = Model("models/props_junk/watermelon01_chunk01c.mdl"), -- 261
		AddHealth = -6, -- 262
		Hunger = -12, -- 263
		Despair = 4, -- 264
		Description = "A pithy husk of fruit, fully colonized by white mold.", -- 266
		Price = 25, -- 268
		UseText = { -- 269
			"eats a moldy melon.", -- 269
			"devours a moldy chunk of melon.", -- 270
			"munches on a mold melon.", -- 271
			"feasts on a fungus fruit.", -- 272
			"tears into some mold melon.", -- 273
			"crunches up a mold melon.", -- 274
			"chows down on a mold melon." -- 275
		} -- 258
	} -- 258
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 276
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 258
			_base_0[_key_0] = _val_0 -- 258
		end -- 258
	end -- 276
	if _base_0.__index == nil then -- 258
		_base_0.__index = _base_0 -- 258
	end -- 276
	setmetatable(_base_0, _parent_0.__base) -- 258
	_class_0 = setmetatable({ -- 258
		__init = function(self, ...) -- 258
			return _class_0.__parent.__init(self, ...) -- 258
		end, -- 258
		__base = _base_0, -- 258
		__name = "MoldMelon", -- 258
		__parent = _parent_0 -- 258
	}, { -- 258
		__index = function(cls, name) -- 258
			local val = rawget(_base_0, name) -- 258
			if val == nil then -- 258
				local parent = rawget(cls, "__parent") -- 258
				if parent then -- 258
					return parent[name] -- 258
				end -- 258
			else -- 258
				return val -- 258
			end -- 258
		end, -- 258
		__call = function(cls, ...) -- 258
			local _self_0 = setmetatable({ }, _base_0) -- 258
			cls.__init(_self_0, ...) -- 258
			return _self_0 -- 258
		end -- 258
	}) -- 258
	_base_0.__class = _class_0 -- 258
	if _parent_0.__inherited then -- 258
		_parent_0.__inherited(_parent_0, _class_0) -- 258
	end -- 258
	MoldMelon = _class_0 -- 258
end -- 276
local DrinkFluid -- 278
do -- 278
	local _class_0 -- 278
	local _parent_0 = SOUND -- 278
	local _base_0 = { -- 278
		sound = (function() -- 279
			local _accum_0 = { } -- 279
			local _len_0 = 1 -- 279
			for i = 1, 2 do -- 279
				_accum_0[_len_0] = "npc/barnacle/barnacle_gulp" .. tostring(i) .. ".wav" -- 279
				_len_0 = _len_0 + 1 -- 279
			end -- 279
			return _accum_0 -- 279
		end)(), -- 280
		level = SNDLVL_65DB -- 278
	} -- 278
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 280
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 278
			_base_0[_key_0] = _val_0 -- 278
		end -- 278
	end -- 280
	if _base_0.__index == nil then -- 278
		_base_0.__index = _base_0 -- 278
	end -- 280
	setmetatable(_base_0, _parent_0.__base) -- 278
	_class_0 = setmetatable({ -- 278
		__init = function(self, ...) -- 278
			return _class_0.__parent.__init(self, ...) -- 278
		end, -- 278
		__base = _base_0, -- 278
		__name = "DrinkFluid", -- 278
		__parent = _parent_0 -- 278
	}, { -- 278
		__index = function(cls, name) -- 278
			local val = rawget(_base_0, name) -- 278
			if val == nil then -- 278
				local parent = rawget(cls, "__parent") -- 278
				if parent then -- 278
					return parent[name] -- 278
				end -- 278
			else -- 278
				return val -- 278
			end -- 278
		end, -- 278
		__call = function(cls, ...) -- 278
			local _self_0 = setmetatable({ }, _base_0) -- 278
			cls.__init(_self_0, ...) -- 278
			return _self_0 -- 278
		end -- 278
	}) -- 278
	_base_0.__class = _class_0 -- 278
	if _parent_0.__inherited then -- 278
		_parent_0.__inherited(_parent_0, _class_0) -- 278
	end -- 278
	DrinkFluid = _class_0 -- 278
end -- 280
local Drink -- 282
do -- 282
	local _class_0 -- 282
	local _parent_0 = Food -- 282
	local _base_0 = { -- 282
		PrintName = "Drink", -- 284
		Sound = "DrinkFluid" -- 282
	} -- 282
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 284
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 282
			_base_0[_key_0] = _val_0 -- 282
		end -- 282
	end -- 284
	if _base_0.__index == nil then -- 282
		_base_0.__index = _base_0 -- 282
	end -- 284
	setmetatable(_base_0, _parent_0.__base) -- 282
	_class_0 = setmetatable({ -- 282
		__init = function(self, ...) -- 282
			return _class_0.__parent.__init(self, ...) -- 282
		end, -- 282
		__base = _base_0, -- 282
		__name = "Drink", -- 282
		__parent = _parent_0 -- 282
	}, { -- 282
		__index = function(cls, name) -- 282
			local val = rawget(_base_0, name) -- 282
			if val == nil then -- 282
				local parent = rawget(cls, "__parent") -- 282
				if parent then -- 282
					return parent[name] -- 282
				end -- 282
			else -- 282
				return val -- 282
			end -- 282
		end, -- 282
		__call = function(cls, ...) -- 282
			local _self_0 = setmetatable({ }, _base_0) -- 282
			cls.__init(_self_0, ...) -- 282
			return _self_0 -- 282
		end -- 282
	}) -- 282
	_base_0.__class = _class_0 -- 282
	if _parent_0.__inherited then -- 282
		_parent_0.__inherited(_parent_0, _class_0) -- 282
	end -- 282
	Drink = _class_0 -- 282
end -- 284
local FearBeer -- 286
do -- 286
	local _class_0 -- 286
	local _parent_0 = Drink -- 286
	local _base_0 = { -- 286
		PrintName = "Fear Beer", -- 288
		Model = Model("models/props_junk/garbage_glassbottle001a.mdl"), -- 289
		Thirst = -12, -- 290
		Despair = -15, -- 291
		Description = "A bottle of foul off-yellow liquid.\n'BEER' is hand-written on the label.", -- 293
		Price = 60, -- 295
		TrashClass = "trash/bottle/fearbeer", -- 297
		ImpactThreshold = 256, -- 299
		UseText = { -- 300
			"chugs a fear beer.", -- 300
			"downs a bottle of piss beer.", -- 301
			"drinks a ratty bottle of brew.", -- 302
			"quaffs a beer and grimaces.", -- 303
			"takes a swig of fear beer and shivers.", -- 304
			"guzzles a fear beer.", -- 305
			"chokes down some piss beer." -- 306
		}, -- 309
		Initialize = function(self) -- 309
			_class_0.__parent.__base.Initialize(self) -- 310
			if SERVER then -- 311
				return self:PrecacheGibs() -- 311
			end -- 311
		end, -- 313
		OnTakeDamage = function(self, dmg) -- 313
			_class_0.__parent.__base.OnTakeDamage(self, dmg) -- 314
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH -- 315
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then -- 316
				self:Shatter(dmg:GetDamageForce()) -- 316
			end -- 316
			if attacker and IsValid(attacker) and attacker:IsPlayer() then -- 317
				if attacker:HasOddity(ODDITY_DELINQUENCY) then -- 318
					return attacker:AddDespair(-math.random(2, 4)) -- 319
				end -- 318
			end -- 317
		end, -- 321
		PhysicsCollide = function(self, data) -- 321
			_class_0.__parent.__base.PhysicsCollide(self, data) -- 322
			if CLIENT then -- 323
				return -- 323
			end -- 323
			if data.Speed > self.ImpactThreshold then -- 324
				if data.HitEntity and IsValid(data.HitEntity) then -- 325
					local attacker = self:GetNWEntity("evilrp_submitter") -- 326
					do -- 327
						local dmg = DamageInfo() -- 327
						dmg:SetDamage(25) -- 328
						if IsValid(attacker) then -- 329
							dmg:SetAttacker(attacker) -- 329
						end -- 329
						dmg:SetInflictor(self) -- 330
						dmg:SetDamageType(DMG_SLASH) -- 331
						dmg:SetDamagePosition(data.HitPos) -- 332
						data.HitEntity:TakeDamageInfo(dmg) -- 333
					end -- 327
				end -- 325
				local force = data.OurNewVelocity -- 334
				return self:Shatter(force) -- 335
			end -- 324
		end, -- 337
		Shatter = function(self, force) -- 337
			if self.broken then -- 338
				return -- 338
			end -- 338
			self.broken = true -- 339
			local pos = self:GetPos() -- 340
			local _list_0 = player.GetAll() -- 341
			for _index_0 = 1, #_list_0 do -- 341
				local ply = _list_0[_index_0] -- 341
				local _continue_0 = false -- 342
				repeat -- 342
					if not ply:HasOddity(ODDITY_DELINQUENCY) then -- 342
						_continue_0 = true -- 342
						break -- 342
					end -- 342
					if ply:CanSee(self) and ply:LookingInDirection(pos) then -- 343
						ply:AddDespair(-math.random(2, 4)) -- 344
					end -- 343
					_continue_0 = true -- 342
				until true -- 344
				if not _continue_0 then -- 344
					break -- 344
				end -- 344
			end -- 344
			do -- 345
				local ed = EffectData() -- 345
				ed:SetStart(pos) -- 346
				ed:SetOrigin(pos) -- 347
				ed:SetScale(8) -- 348
				util.Effect("GlassImpact", ed, true, true) -- 349
			end -- 345
			self:EmitSound("BottleSmash") -- 350
			self:GibBreakServer(force) -- 351
			return self:Remove() -- 352
		end -- 286
	} -- 286
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 352
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 286
			_base_0[_key_0] = _val_0 -- 286
		end -- 286
	end -- 352
	if _base_0.__index == nil then -- 286
		_base_0.__index = _base_0 -- 286
	end -- 352
	setmetatable(_base_0, _parent_0.__base) -- 286
	_class_0 = setmetatable({ -- 286
		__init = function(self, ...) -- 286
			return _class_0.__parent.__init(self, ...) -- 286
		end, -- 286
		__base = _base_0, -- 286
		__name = "FearBeer", -- 286
		__parent = _parent_0 -- 286
	}, { -- 286
		__index = function(cls, name) -- 286
			local val = rawget(_base_0, name) -- 286
			if val == nil then -- 286
				local parent = rawget(cls, "__parent") -- 286
				if parent then -- 286
					return parent[name] -- 286
				end -- 286
			else -- 286
				return val -- 286
			end -- 286
		end, -- 286
		__call = function(cls, ...) -- 286
			local _self_0 = setmetatable({ }, _base_0) -- 286
			cls.__init(_self_0, ...) -- 286
			return _self_0 -- 286
		end -- 286
	}) -- 286
	_base_0.__class = _class_0 -- 286
	if _parent_0.__inherited then -- 286
		_parent_0.__inherited(_parent_0, _class_0) -- 286
	end -- 286
	FearBeer = _class_0 -- 286
end -- 352
local SmearBeer -- 354
do -- 354
	local _class_0 -- 354
	local _parent_0 = Drink -- 354
	local _base_0 = { -- 354
		PrintName = "Smear Beer", -- 356
		Model = Model("models/props_junk/garbage_glassbottle003a.mdl"), -- 357
		Thirst = -12, -- 358
		Despair = -35, -- 359
		Description = "A bottle of cloudy, greyish red booze.\nThe label is obscured with a smear of old blood.", -- 361
		Price = 95, -- 363
		TrashClass = "trash/bottle", -- 365
		ImpactThreshold = 256, -- 367
		UseText = { -- 368
			"chugs a smear beer.", -- 368
			"downs a bottle of red brew.", -- 369
			"drinks a cloudy bottle of beer.", -- 370
			"quaffs a smear beer and shivers.", -- 371
			"takes a swig of smear beer.", -- 372
			"guzzles a bloody beer.", -- 373
			"nurses a bottle of blood beer." -- 374
		}, -- 377
		Initialize = function(self) -- 377
			_class_0.__parent.__base.Initialize(self) -- 378
			if SERVER then -- 379
				return self:PrecacheGibs() -- 379
			end -- 379
		end, -- 381
		OnTakeDamage = function(self, dmg) -- 381
			_class_0.__parent.__base.OnTakeDamage(self, dmg) -- 382
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH -- 383
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then -- 384
				self:Shatter(dmg:GetDamageForce()) -- 384
			end -- 384
			if attacker and IsValid(attacker) and attacker:IsPlayer() then -- 385
				if attacker:HasOddity(ODDITY_DELINQUENCY) then -- 386
					return attacker:AddDespair(-math.random(2, 4)) -- 387
				end -- 386
			end -- 385
		end, -- 389
		PhysicsCollide = function(self, data) -- 389
			_class_0.__parent.__base.PhysicsCollide(self, data) -- 390
			if CLIENT then -- 391
				return -- 391
			end -- 391
			if data.Speed > self.ImpactThreshold then -- 392
				if data.HitEntity and IsValid(data.HitEntity) then -- 393
					local attacker = self:GetNWEntity("evilrp_submitter") -- 394
					do -- 395
						local dmg = DamageInfo() -- 395
						dmg:SetDamage(25) -- 396
						if IsValid(attacker) then -- 397
							dmg:SetAttacker(attacker) -- 397
						end -- 397
						dmg:SetInflictor(self) -- 398
						dmg:SetDamageType(DMG_SLASH) -- 399
						dmg:SetDamagePosition(data.HitPos) -- 400
						data.HitEntity:TakeDamageInfo(dmg) -- 401
					end -- 395
				end -- 393
				local force = data.OurNewVelocity -- 402
				return self:Shatter(force) -- 403
			end -- 392
		end, -- 405
		Shatter = function(self, force) -- 405
			if self.broken then -- 406
				return -- 406
			end -- 406
			self.broken = true -- 407
			local pos = self:GetPos() -- 408
			local _list_0 = player.GetAll() -- 409
			for _index_0 = 1, #_list_0 do -- 409
				local ply = _list_0[_index_0] -- 409
				local _continue_0 = false -- 410
				repeat -- 410
					if not ply:HasOddity(ODDITY_DELINQUENCY) then -- 410
						_continue_0 = true -- 410
						break -- 410
					end -- 410
					if ply:CanSee(self) and ply:LookingInDirection(pos) then -- 411
						ply:AddDespair(-math.random(2, 4)) -- 412
					end -- 411
					_continue_0 = true -- 410
				until true -- 412
				if not _continue_0 then -- 412
					break -- 412
				end -- 412
			end -- 412
			do -- 413
				local ed = EffectData() -- 413
				ed:SetStart(pos) -- 414
				ed:SetOrigin(pos) -- 415
				ed:SetScale(8) -- 416
				util.Effect("GlassImpact", ed, true, true) -- 417
			end -- 413
			self:EmitSound("BottleSmash") -- 418
			self:GibBreakServer(force) -- 419
			return self:Remove() -- 420
		end -- 354
	} -- 354
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 420
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 354
			_base_0[_key_0] = _val_0 -- 354
		end -- 354
	end -- 420
	if _base_0.__index == nil then -- 354
		_base_0.__index = _base_0 -- 354
	end -- 420
	setmetatable(_base_0, _parent_0.__base) -- 354
	_class_0 = setmetatable({ -- 354
		__init = function(self, ...) -- 354
			return _class_0.__parent.__init(self, ...) -- 354
		end, -- 354
		__base = _base_0, -- 354
		__name = "SmearBeer", -- 354
		__parent = _parent_0 -- 354
	}, { -- 354
		__index = function(cls, name) -- 354
			local val = rawget(_base_0, name) -- 354
			if val == nil then -- 354
				local parent = rawget(cls, "__parent") -- 354
				if parent then -- 354
					return parent[name] -- 354
				end -- 354
			else -- 354
				return val -- 354
			end -- 354
		end, -- 354
		__call = function(cls, ...) -- 354
			local _self_0 = setmetatable({ }, _base_0) -- 354
			cls.__init(_self_0, ...) -- 354
			return _self_0 -- 354
		end -- 354
	}) -- 354
	_base_0.__class = _class_0 -- 354
	if _parent_0.__inherited then -- 354
		_parent_0.__inherited(_parent_0, _class_0) -- 354
	end -- 354
	SmearBeer = _class_0 -- 354
end -- 420
local Shake -- 422
do -- 422
	local _class_0 -- 422
	local _parent_0 = Drink -- 422
	local _base_0 = { -- 422
		PrintName = "Soylent Shake", -- 424
		Model = Model("models/props_junk/garbage_milkcarton001a.mdl"), -- 425
		Thirst = -40, -- 426
		Hunger = -40, -- 427
		Despair = 30, -- 428
		Description = "A jug full of partially blended human remains.\nIt's warm and chunky.", -- 430
		Price = 120, -- 432
		TrashClass = "trash/plastic/shake", -- 434
		UseText = { -- 435
			"chokes down a soylent shake.", -- 435
			"slurps up a soylent shake.", -- 436
			"swigs blended peoplemeat and shudders.", -- 437
			"struggles down a jug of human sludge.", -- 438
			"shoots back a bad protein shake.", -- 439
			"guzzles a meat smoothie.", -- 440
			"quaffs an entire soylent shake." -- 441
		} -- 422
	} -- 422
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 442
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 422
			_base_0[_key_0] = _val_0 -- 422
		end -- 422
	end -- 442
	if _base_0.__index == nil then -- 422
		_base_0.__index = _base_0 -- 422
	end -- 442
	setmetatable(_base_0, _parent_0.__base) -- 422
	_class_0 = setmetatable({ -- 422
		__init = function(self, ...) -- 422
			return _class_0.__parent.__init(self, ...) -- 422
		end, -- 422
		__base = _base_0, -- 422
		__name = "Shake", -- 422
		__parent = _parent_0 -- 422
	}, { -- 422
		__index = function(cls, name) -- 422
			local val = rawget(_base_0, name) -- 422
			if val == nil then -- 422
				local parent = rawget(cls, "__parent") -- 422
				if parent then -- 422
					return parent[name] -- 422
				end -- 422
			else -- 422
				return val -- 422
			end -- 422
		end, -- 422
		__call = function(cls, ...) -- 422
			local _self_0 = setmetatable({ }, _base_0) -- 422
			cls.__init(_self_0, ...) -- 422
			return _self_0 -- 422
		end -- 422
	}) -- 422
	_base_0.__class = _class_0 -- 422
	if _parent_0.__inherited then -- 422
		_parent_0.__inherited(_parent_0, _class_0) -- 422
	end -- 422
	Shake = _class_0 -- 422
end -- 442
local Twitchel -- 444
do -- 444
	local _class_0 -- 444
	local _parent_0 = Drink -- 444
	local _base_0 = { -- 444
		PrintName = "Twitchel", -- 446
		Model = Model("models/props_junk/garbage_plasticbottle003a.mdl"), -- 447
		Thirst = -44, -- 448
		Hunger = 6, -- 449
		Despair = 6, -- 450
		Description = "A bottle of refreshingly lukewarm, cloudy green drink.", -- 452
		Price = 80, -- 454
		TrashClass = "trash/plastic/twitchel", -- 456
		UseText = { -- 457
			"necks a bottle of twitchel.", -- 457
			"can't get enough of that green stuff.", -- 458
			"sucks down a bottle of twitchel.", -- 459
			"sips up their twitchel.", -- 460
			"pours twitchel down their throat.", -- 461
			"drinks a bottle of twitchel.", -- 462
			"slurps up a green drink." -- 463
		} -- 444
	} -- 444
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 464
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 444
			_base_0[_key_0] = _val_0 -- 444
		end -- 444
	end -- 464
	if _base_0.__index == nil then -- 444
		_base_0.__index = _base_0 -- 444
	end -- 464
	setmetatable(_base_0, _parent_0.__base) -- 444
	_class_0 = setmetatable({ -- 444
		__init = function(self, ...) -- 444
			return _class_0.__parent.__init(self, ...) -- 444
		end, -- 444
		__base = _base_0, -- 444
		__name = "Twitchel", -- 444
		__parent = _parent_0 -- 444
	}, { -- 444
		__index = function(cls, name) -- 444
			local val = rawget(_base_0, name) -- 444
			if val == nil then -- 444
				local parent = rawget(cls, "__parent") -- 444
				if parent then -- 444
					return parent[name] -- 444
				end -- 444
			else -- 444
				return val -- 444
			end -- 444
		end, -- 444
		__call = function(cls, ...) -- 444
			local _self_0 = setmetatable({ }, _base_0) -- 444
			cls.__init(_self_0, ...) -- 444
			return _self_0 -- 444
		end -- 444
	}) -- 444
	_base_0.__class = _class_0 -- 444
	if _parent_0.__inherited then -- 444
		_parent_0.__inherited(_parent_0, _class_0) -- 444
	end -- 444
	Twitchel = _class_0 -- 444
end -- 464
local TakeMeds -- 466
do -- 466
	local _class_0 -- 466
	local _parent_0 = SOUND -- 466
	local _base_0 = { -- 466
		sound = (function() -- 467
			local _accum_0 = { } -- 467
			local _len_0 = 1 -- 467
			for i = 1, 3 do -- 467
				_accum_0[_len_0] = "npc/zombie/zombie_pain" .. tostring(i) .. ".wav" -- 467
				_len_0 = _len_0 + 1 -- 467
			end -- 467
			return _accum_0 -- 467
		end)() -- 466
	} -- 466
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 467
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 466
			_base_0[_key_0] = _val_0 -- 466
		end -- 466
	end -- 467
	if _base_0.__index == nil then -- 466
		_base_0.__index = _base_0 -- 466
	end -- 467
	setmetatable(_base_0, _parent_0.__base) -- 466
	_class_0 = setmetatable({ -- 466
		__init = function(self, ...) -- 466
			return _class_0.__parent.__init(self, ...) -- 466
		end, -- 466
		__base = _base_0, -- 466
		__name = "TakeMeds", -- 466
		__parent = _parent_0 -- 466
	}, { -- 466
		__index = function(cls, name) -- 466
			local val = rawget(_base_0, name) -- 466
			if val == nil then -- 466
				local parent = rawget(cls, "__parent") -- 466
				if parent then -- 466
					return parent[name] -- 466
				end -- 466
			else -- 466
				return val -- 466
			end -- 466
		end, -- 466
		__call = function(cls, ...) -- 466
			local _self_0 = setmetatable({ }, _base_0) -- 466
			cls.__init(_self_0, ...) -- 466
			return _self_0 -- 466
		end -- 466
	}) -- 466
	_base_0.__class = _class_0 -- 466
	if _parent_0.__inherited then -- 466
		_parent_0.__inherited(_parent_0, _class_0) -- 466
	end -- 466
	TakeMeds = _class_0 -- 466
end -- 467
local Medicine -- 469
do -- 469
	local _class_0 -- 469
	local _parent_0 = Food -- 469
	local _base_0 = { -- 469
		PrintName = "Medicine", -- 471
		Sound = "TakeMeds" -- 469
	} -- 469
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 471
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 469
			_base_0[_key_0] = _val_0 -- 469
		end -- 469
	end -- 471
	if _base_0.__index == nil then -- 469
		_base_0.__index = _base_0 -- 469
	end -- 471
	setmetatable(_base_0, _parent_0.__base) -- 469
	_class_0 = setmetatable({ -- 469
		__init = function(self, ...) -- 469
			return _class_0.__parent.__init(self, ...) -- 469
		end, -- 469
		__base = _base_0, -- 469
		__name = "Medicine", -- 469
		__parent = _parent_0 -- 469
	}, { -- 469
		__index = function(cls, name) -- 469
			local val = rawget(_base_0, name) -- 469
			if val == nil then -- 469
				local parent = rawget(cls, "__parent") -- 469
				if parent then -- 469
					return parent[name] -- 469
				end -- 469
			else -- 469
				return val -- 469
			end -- 469
		end, -- 469
		__call = function(cls, ...) -- 469
			local _self_0 = setmetatable({ }, _base_0) -- 469
			cls.__init(_self_0, ...) -- 469
			return _self_0 -- 469
		end -- 469
	}) -- 469
	_base_0.__class = _class_0 -- 469
	if _parent_0.__inherited then -- 469
		_parent_0.__inherited(_parent_0, _class_0) -- 469
	end -- 469
	Medicine = _class_0 -- 469
end -- 471
local Pills -- 473
do -- 473
	local _class_0 -- 473
	local _parent_0 = Medicine -- 473
	local _base_0 = { -- 473
		PrintName = "Pills", -- 475
		Model = Model("models/props_lab/jar01b.mdl"), -- 476
		AddHealth = function(self) -- 476
			return math.random(-15, -30) -- 476
		end, -- 477
		Hunger = function(self) -- 477
			return math.random(30, 50) -- 477
		end, -- 478
		Thirst = function(self) -- 478
			return math.random(30, 60) -- 478
		end, -- 479
		Despair = function(self) -- 479
			return math.random(-60, -100) -- 479
		end, -- 481
		Description = "A white plastic bottle, full of random pills.", -- 483
		Price = 125, -- 485
		TrashClass = "trash/plastic/pills", -- 487
		UseText = { -- 488
			"throws a mess of pills into eir mouth.", -- 488
			"consumes the whole contents of a pill bottle.", -- 489
			"devours handfuls of scary-looking pills.", -- 490
			"chokes down some strange pills.", -- 491
			"takes eir medicine, like a good citizen should.", -- 492
			"swallows a mouthful of pills.", -- 493
			"takes an excessive dose of colorful pills.", -- 494
			"tosses back an entire bottle of pills.", -- 495
			"throws back a bottle of mystery pills." -- 496
		} -- 473
	} -- 473
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 497
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 473
			_base_0[_key_0] = _val_0 -- 473
		end -- 473
	end -- 497
	if _base_0.__index == nil then -- 473
		_base_0.__index = _base_0 -- 473
	end -- 497
	setmetatable(_base_0, _parent_0.__base) -- 473
	_class_0 = setmetatable({ -- 473
		__init = function(self, ...) -- 473
			return _class_0.__parent.__init(self, ...) -- 473
		end, -- 473
		__base = _base_0, -- 473
		__name = "Pills", -- 473
		__parent = _parent_0 -- 473
	}, { -- 473
		__index = function(cls, name) -- 473
			local val = rawget(_base_0, name) -- 473
			if val == nil then -- 473
				local parent = rawget(cls, "__parent") -- 473
				if parent then -- 473
					return parent[name] -- 473
				end -- 473
			else -- 473
				return val -- 473
			end -- 473
		end, -- 473
		__call = function(cls, ...) -- 473
			local _self_0 = setmetatable({ }, _base_0) -- 473
			cls.__init(_self_0, ...) -- 473
			return _self_0 -- 473
		end -- 473
	}) -- 473
	_base_0.__class = _class_0 -- 473
	if _parent_0.__inherited then -- 473
		_parent_0.__inherited(_parent_0, _class_0) -- 473
	end -- 473
	Pills = _class_0 -- 473
end -- 497
local TimeGas -- 499
do -- 499
	local _class_0 -- 499
	local _parent_0 = Medicine -- 499
	local _base_0 = { -- 499
		PrintName = "Time Gas", -- 501
		Model = Model("models/props_wasteland/prison_sinkchunk001e.mdl"), -- 502
		Sound = (function() -- 502
			local _accum_0 = { } -- 502
			local _len_0 = 1 -- 502
			for i = 2, 3 do -- 502
				_accum_0[_len_0] = "npc/fast_zombie/idle" .. tostring(i) -- 502
				_len_0 = _len_0 + 1 -- 502
			end -- 502
			return _accum_0 -- 502
		end)(), -- 503
		AddHealth = function(self) -- 503
			return math.random(20, 40) -- 503
		end, -- 504
		Hunger = function(self) -- 504
			return math.random(10, 20) -- 504
		end, -- 505
		Thirst = function(self) -- 505
			return math.random(20, 30) -- 505
		end, -- 506
		Despair = function(self) -- 506
			return math.random(0, 10) -- 506
		end, -- 508
		Description = "An inhaler of time acceleration gas.\nSpeeds up healing, and dying.", -- 510
		Price = 100, -- 512
		TrashClass = "trash/inhaler", -- 514
		UseText = { -- 515
			"breathes in some time gas.", -- 515
			"huffs a healing gas.", -- 516
			"isn't yet tired of the time gas.", -- 517
			"inhales a big cloud of time gas.", -- 518
			"takes a deep breath of time gas.", -- 519
			"drags in a lungful of time gas.", -- 520
			"sniffs up a cloud of time gas.", -- 521
			"huffs time gas from the rusty inhaler." -- 522
		} -- 499
	} -- 499
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 523
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 499
			_base_0[_key_0] = _val_0 -- 499
		end -- 499
	end -- 523
	if _base_0.__index == nil then -- 499
		_base_0.__index = _base_0 -- 499
	end -- 523
	setmetatable(_base_0, _parent_0.__base) -- 499
	_class_0 = setmetatable({ -- 499
		__init = function(self, ...) -- 499
			return _class_0.__parent.__init(self, ...) -- 499
		end, -- 499
		__base = _base_0, -- 499
		__name = "TimeGas", -- 499
		__parent = _parent_0 -- 499
	}, { -- 499
		__index = function(cls, name) -- 499
			local val = rawget(_base_0, name) -- 499
			if val == nil then -- 499
				local parent = rawget(cls, "__parent") -- 499
				if parent then -- 499
					return parent[name] -- 499
				end -- 499
			else -- 499
				return val -- 499
			end -- 499
		end, -- 499
		__call = function(cls, ...) -- 499
			local _self_0 = setmetatable({ }, _base_0) -- 499
			cls.__init(_self_0, ...) -- 499
			return _self_0 -- 499
		end -- 499
	}) -- 499
	_base_0.__class = _class_0 -- 499
	if _parent_0.__inherited then -- 499
		_parent_0.__inherited(_parent_0, _class_0) -- 499
	end -- 499
	TimeGas = _class_0 -- 499
end -- 523
local Bleach -- 525
do -- 525
	local _class_0 -- 525
	local _parent_0 = Medicine -- 525
	local _base_0 = { -- 525
		PrintName = "Chlorine", -- 527
		Model = Model("models/props_junk/garbage_plasticbottle002a"), -- 528
		Sound = "DrinkFluid", -- 529
		AddHealth = -50, -- 530
		Hunger = 50, -- 531
		Thirst = -40, -- 532
		Despair = { -- 534
			Description = "A jug full of bleach." -- 534
		}, -- 536
		Price = 100, -- 538
		TrashClass = "trash/plastic/bleach", -- 540
		UseText = { -- 541
			"drinks bleach.", -- 541
			"chugs an entire fucking jug of chlorine.", -- 542
			"unscrews a jug of bleach and pours it down the hatch.", -- 543
			"chokes down gulp after gulp of chlorine bleach." -- 544
		} -- 525
	} -- 525
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 545
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 525
			_base_0[_key_0] = _val_0 -- 525
		end -- 525
	end -- 545
	if _base_0.__index == nil then -- 525
		_base_0.__index = _base_0 -- 525
	end -- 545
	setmetatable(_base_0, _parent_0.__base) -- 525
	_class_0 = setmetatable({ -- 525
		__init = function(self, ...) -- 525
			return _class_0.__parent.__init(self, ...) -- 525
		end, -- 525
		__base = _base_0, -- 525
		__name = "Bleach", -- 525
		__parent = _parent_0 -- 525
	}, { -- 525
		__index = function(cls, name) -- 525
			local val = rawget(_base_0, name) -- 525
			if val == nil then -- 525
				local parent = rawget(cls, "__parent") -- 525
				if parent then -- 525
					return parent[name] -- 525
				end -- 525
			else -- 525
				return val -- 525
			end -- 525
		end, -- 525
		__call = function(cls, ...) -- 525
			local _self_0 = setmetatable({ }, _base_0) -- 525
			cls.__init(_self_0, ...) -- 525
			return _self_0 -- 525
		end -- 525
	}) -- 525
	_base_0.__class = _class_0 -- 525
	if _parent_0.__inherited then -- 525
		_parent_0.__inherited(_parent_0, _class_0) -- 525
	end -- 525
	Bleach = _class_0 -- 525
end -- 545
local Ambrosia -- 547
do -- 547
	local _class_0 -- 547
	local _parent_0 = Food -- 547
	local _base_0 = { -- 547
		PrintName = "Ambrosia", -- 549
		Model = Model("models/Gibs/HGIBS.mdl"), -- 550
		Hunger = -100, -- 551
		Thirst = -100, -- 552
		Despair = -100, -- 553
		HealthAdd = 100, -- 554
		Description = "A food made for gods.", -- 555
		RotTime = 0, -- 557
		UseText = { -- 558
			"indulges in some ambrosia." -- 558
		}, -- 561
		Precursor = { -- 562
			biomass = 15, -- 562
			wood = 15, -- 563
			metal = 15 -- 564
		}, -- 569
		Eat = function(self, ply) -- 569
			_class_0.__parent.__base.Eat(self, ply) -- 570
			if CLIENT then -- 571
				return -- 571
			end -- 571
			return ply:AddStemCells(5) -- 572
		end -- 547
	} -- 547
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 572
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 547
			_base_0[_key_0] = _val_0 -- 547
		end -- 547
	end -- 572
	if _base_0.__index == nil then -- 547
		_base_0.__index = _base_0 -- 547
	end -- 572
	setmetatable(_base_0, _parent_0.__base) -- 547
	_class_0 = setmetatable({ -- 547
		__init = function(self, ...) -- 547
			return _class_0.__parent.__init(self, ...) -- 547
		end, -- 547
		__base = _base_0, -- 547
		__name = "Ambrosia", -- 547
		__parent = _parent_0 -- 547
	}, { -- 547
		__index = function(cls, name) -- 547
			local val = rawget(_base_0, name) -- 547
			if val == nil then -- 547
				local parent = rawget(cls, "__parent") -- 547
				if parent then -- 547
					return parent[name] -- 547
				end -- 547
			else -- 547
				return val -- 547
			end -- 547
		end, -- 547
		__call = function(cls, ...) -- 547
			local _self_0 = setmetatable({ }, _base_0) -- 547
			cls.__init(_self_0, ...) -- 547
			return _self_0 -- 547
		end -- 547
	}) -- 547
	_base_0.__class = _class_0 -- 547
	if _parent_0.__inherited then -- 547
		_parent_0.__inherited(_parent_0, _class_0) -- 547
	end -- 547
	Ambrosia = _class_0 -- 547
end -- 572
local SloppyRibs -- 579
do -- 579
	local _class_0 -- 579
	local _parent_0 = Food -- 579
	local _base_0 = { -- 579
		PrintName = "Sloppy Ribs", -- 581
		Model = Model("models/vel/evilwar/sloppyribs.mdl"), -- 582
		Hunger = -28, -- 583
		Thirst = -4, -- 584
		Despair = 5, -- 585
		Description = "Fresh ribs from an unknown source, now glazed in slop! \n They look delicious.", -- 587
		CookTime = 10, -- 589
		Price = 115, -- 590
		UseText = { -- 591
			"devours all of the flesh and slop on the rib, then throws it away.", -- 591
			"munches on the rib, and then licks the glaze off his hands.", -- 592
			"gobbles down the rib, and spits out the bone." -- 593
		} -- 579
	} -- 579
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 593
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 579
			_base_0[_key_0] = _val_0 -- 579
		end -- 579
	end -- 593
	if _base_0.__index == nil then -- 579
		_base_0.__index = _base_0 -- 579
	end -- 593
	setmetatable(_base_0, _parent_0.__base) -- 579
	_class_0 = setmetatable({ -- 579
		__init = function(self, ...) -- 579
			return _class_0.__parent.__init(self, ...) -- 579
		end, -- 579
		__base = _base_0, -- 579
		__name = "SloppyRibs", -- 579
		__parent = _parent_0 -- 579
	}, { -- 579
		__index = function(cls, name) -- 579
			local val = rawget(_base_0, name) -- 579
			if val == nil then -- 579
				local parent = rawget(cls, "__parent") -- 579
				if parent then -- 579
					return parent[name] -- 579
				end -- 579
			else -- 579
				return val -- 579
			end -- 579
		end, -- 579
		__call = function(cls, ...) -- 579
			local _self_0 = setmetatable({ }, _base_0) -- 579
			cls.__init(_self_0, ...) -- 579
			return _self_0 -- 579
		end -- 579
	}) -- 579
	_base_0.__class = _class_0 -- 579
	if _parent_0.__inherited then -- 579
		_parent_0.__inherited(_parent_0, _class_0) -- 579
	end -- 579
	SloppyRibs = _class_0 -- 579
end -- 593
local EyeballNoodles -- 596
do -- 596
	local _class_0 -- 596
	local _parent_0 = Food -- 596
	local _base_0 = { -- 596
		PrintName = "Eyeball Noodles", -- 598
		Model = Model("models/vel/evilwar/eyenoodle.mdl"), -- 599
		Hunger = -40, -- 600
		Thirst = -5, -- 601
		Despair = 10, -- 602
		Description = "A traditional Lymphomian dish, usually served to go. \n The texture is an acquired taste.", -- 604
		CookTime = 8, -- 606
		Price = 130, -- 608
		UseText = { -- 609
			"slurps all of the noodles.", -- 609
			"slurps the noodles, gagging at the wet crunch of the eyeball.", -- 610
			"eats the noodles, and then spits out the eyeball.", -- 611
			"gags on the noodles, and then throws out the eyeball." -- 612
		} -- 596
	} -- 596
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 613
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 596
			_base_0[_key_0] = _val_0 -- 596
		end -- 596
	end -- 613
	if _base_0.__index == nil then -- 596
		_base_0.__index = _base_0 -- 596
	end -- 613
	setmetatable(_base_0, _parent_0.__base) -- 596
	_class_0 = setmetatable({ -- 596
		__init = function(self, ...) -- 596
			return _class_0.__parent.__init(self, ...) -- 596
		end, -- 596
		__base = _base_0, -- 596
		__name = "EyeballNoodles", -- 596
		__parent = _parent_0 -- 596
	}, { -- 596
		__index = function(cls, name) -- 596
			local val = rawget(_base_0, name) -- 596
			if val == nil then -- 596
				local parent = rawget(cls, "__parent") -- 596
				if parent then -- 596
					return parent[name] -- 596
				end -- 596
			else -- 596
				return val -- 596
			end -- 596
		end, -- 596
		__call = function(cls, ...) -- 596
			local _self_0 = setmetatable({ }, _base_0) -- 596
			cls.__init(_self_0, ...) -- 596
			return _self_0 -- 596
		end -- 596
	}) -- 596
	_base_0.__class = _class_0 -- 596
	if _parent_0.__inherited then -- 596
		_parent_0.__inherited(_parent_0, _class_0) -- 596
	end -- 596
	EyeballNoodles = _class_0 -- 596
end -- 613
local PaperMache -- 615
do -- 615
	local _class_0 -- 615
	local _parent_0 = Food -- 615
	local _base_0 = { -- 615
		PrintName = "Paper Mache", -- 617
		Model = Model("models/props_junk/garbage_bag001a.mdl"), -- 618
		Hunger = -10, -- 619
		Thirst = -10, -- 620
		Despair = 15, -- 621
		Description = "An old crumpled paper. \n now it's watered down into a little ball.", -- 623
		CookTime = 3, -- 625
		Price = 30, -- 627
		UseText = { -- 628
			"stoves the paper mache into his mouth, gagging horribly.", -- 628
			"forces the paper down his throat, throwing up slightly", -- 629
			"rips apart the paper mache, eating small pieces at a time.", -- 630
			"looks miserable trying to eat watered down paper." -- 631
		} -- 615
	} -- 615
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 631
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 615
			_base_0[_key_0] = _val_0 -- 615
		end -- 615
	end -- 631
	if _base_0.__index == nil then -- 615
		_base_0.__index = _base_0 -- 615
	end -- 631
	setmetatable(_base_0, _parent_0.__base) -- 615
	_class_0 = setmetatable({ -- 615
		__init = function(self, ...) -- 615
			return _class_0.__parent.__init(self, ...) -- 615
		end, -- 615
		__base = _base_0, -- 615
		__name = "PaperMache", -- 615
		__parent = _parent_0 -- 615
	}, { -- 615
		__index = function(cls, name) -- 615
			local val = rawget(_base_0, name) -- 615
			if val == nil then -- 615
				local parent = rawget(cls, "__parent") -- 615
				if parent then -- 615
					return parent[name] -- 615
				end -- 615
			else -- 615
				return val -- 615
			end -- 615
		end, -- 615
		__call = function(cls, ...) -- 615
			local _self_0 = setmetatable({ }, _base_0) -- 615
			cls.__init(_self_0, ...) -- 615
			return _self_0 -- 615
		end -- 615
	}) -- 615
	_base_0.__class = _class_0 -- 615
	if _parent_0.__inherited then -- 615
		_parent_0.__inherited(_parent_0, _class_0) -- 615
	end -- 615
	PaperMache = _class_0 -- 615
	return _class_0 -- 631
end -- 631
