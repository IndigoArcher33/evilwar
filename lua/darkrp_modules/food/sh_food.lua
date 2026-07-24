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
local SlopBowl -- 202
do -- 202
	local _class_0 -- 202
	local _parent_0 = Food -- 202
	local _base_0 = { -- 202
		PrintName = "Slop Bowl", -- 204
		Model = Model("models/props_c17/metalPot001a.mdl"), -- 205
		Hunger = -30, -- 206
		Thirst = 4, -- 207
		Despair = 15, -- 208
		Description = "A festering pot that oozes a disgusting liquid.\nIt seems oddly comforting.", -- 209
		CookTime = 10, -- 211
		Price = 20, -- 213
		UseText = { -- 214
			"enjoys the slop.", -- 214
			"chokes while consuming slop.", -- 215
			"struggles to eat a slop bowl.", -- 216
			"chomps on some slop.", -- 217
			"begrudgingly eats a spoonful of slop.", -- 218
			"consumes slop." -- 219
		} -- 202
	} -- 202
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 219
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 202
			_base_0[_key_0] = _val_0 -- 202
		end -- 202
	end -- 219
	if _base_0.__index == nil then -- 202
		_base_0.__index = _base_0 -- 202
	end -- 219
	setmetatable(_base_0, _parent_0.__base) -- 202
	_class_0 = setmetatable({ -- 202
		__init = function(self, ...) -- 202
			return _class_0.__parent.__init(self, ...) -- 202
		end, -- 202
		__base = _base_0, -- 202
		__name = "SlopBowl", -- 202
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
	SlopBowl = _class_0 -- 202
end -- 219
local Boot -- 222
do -- 222
	local _class_0 -- 222
	local _parent_0 = Food -- 222
	local _base_0 = { -- 222
		PrintName = "Boot", -- 224
		Model = Model("models/props_junk/Shoe001a.mdl"), -- 225
		AddHealth = -4, -- 226
		Hunger = -5, -- 227
		Thirst = 40, -- 228
		Despair = 40, -- 229
		Description = "A dirty old boot, nearly fallen apart.", -- 231
		UseText = { -- 232
			"chews on a nasty boot!", -- 232
			"chokes on an old boot.", -- 233
			"gnaws a boot to shreds.", -- 234
			"shoves a boot in their mouth!", -- 235
			"eats a rotten leather boot.", -- 236
			"devours a dirty old boot!", -- 237
			"eats a boot." -- 238
		} -- 222
	} -- 222
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 239
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 222
			_base_0[_key_0] = _val_0 -- 222
		end -- 222
	end -- 239
	if _base_0.__index == nil then -- 222
		_base_0.__index = _base_0 -- 222
	end -- 239
	setmetatable(_base_0, _parent_0.__base) -- 222
	_class_0 = setmetatable({ -- 222
		__init = function(self, ...) -- 222
			return _class_0.__parent.__init(self, ...) -- 222
		end, -- 222
		__base = _base_0, -- 222
		__name = "Boot", -- 222
		__parent = _parent_0 -- 222
	}, { -- 222
		__index = function(cls, name) -- 222
			local val = rawget(_base_0, name) -- 222
			if val == nil then -- 222
				local parent = rawget(cls, "__parent") -- 222
				if parent then -- 222
					return parent[name] -- 222
				end -- 222
			else -- 222
				return val -- 222
			end -- 222
		end, -- 222
		__call = function(cls, ...) -- 222
			local _self_0 = setmetatable({ }, _base_0) -- 222
			cls.__init(_self_0, ...) -- 222
			return _self_0 -- 222
		end -- 222
	}) -- 222
	_base_0.__class = _class_0 -- 222
	if _parent_0.__inherited then -- 222
		_parent_0.__inherited(_parent_0, _class_0) -- 222
	end -- 222
	Boot = _class_0 -- 222
end -- 239
local MoldMelon -- 241
do -- 241
	local _class_0 -- 241
	local _parent_0 = Food -- 241
	local _base_0 = { -- 241
		PrintName = "Mold Melon", -- 243
		Model = Model("models/gibs/antlionegg01_chunk01c.mdl"), -- 244
		AddHealth = 5, -- 245
		Hunger = function(self) -- 245
			return math.random(-10, -18) -- 245
		end, -- 246
		Description = "A pithy husk of fruit, fully colonized by white mold.", -- 248
		Price = 25, -- 250
		UseText = { -- 251
			"eats a moldy melon.", -- 251
			"devours a moldy chunk of melon.", -- 252
			"munches on a mold melon.", -- 253
			"feasts on a fungus fruit.", -- 254
			"tears into some mold melon.", -- 255
			"crunches up a mold melon.", -- 256
			"chows down on a mold melon." -- 257
		} -- 241
	} -- 241
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 258
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 241
			_base_0[_key_0] = _val_0 -- 241
		end -- 241
	end -- 258
	if _base_0.__index == nil then -- 241
		_base_0.__index = _base_0 -- 241
	end -- 258
	setmetatable(_base_0, _parent_0.__base) -- 241
	_class_0 = setmetatable({ -- 241
		__init = function(self, ...) -- 241
			return _class_0.__parent.__init(self, ...) -- 241
		end, -- 241
		__base = _base_0, -- 241
		__name = "MoldMelon", -- 241
		__parent = _parent_0 -- 241
	}, { -- 241
		__index = function(cls, name) -- 241
			local val = rawget(_base_0, name) -- 241
			if val == nil then -- 241
				local parent = rawget(cls, "__parent") -- 241
				if parent then -- 241
					return parent[name] -- 241
				end -- 241
			else -- 241
				return val -- 241
			end -- 241
		end, -- 241
		__call = function(cls, ...) -- 241
			local _self_0 = setmetatable({ }, _base_0) -- 241
			cls.__init(_self_0, ...) -- 241
			return _self_0 -- 241
		end -- 241
	}) -- 241
	_base_0.__class = _class_0 -- 241
	if _parent_0.__inherited then -- 241
		_parent_0.__inherited(_parent_0, _class_0) -- 241
	end -- 241
	MoldMelon = _class_0 -- 241
end -- 258
local DrinkFluid -- 260
do -- 260
	local _class_0 -- 260
	local _parent_0 = SOUND -- 260
	local _base_0 = { -- 260
		sound = (function() -- 261
			local _accum_0 = { } -- 261
			local _len_0 = 1 -- 261
			for i = 1, 2 do -- 261
				_accum_0[_len_0] = "npc/barnacle/barnacle_gulp" .. tostring(i) .. ".wav" -- 261
				_len_0 = _len_0 + 1 -- 261
			end -- 261
			return _accum_0 -- 261
		end)(), -- 262
		level = SNDLVL_65DB -- 260
	} -- 260
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 262
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 260
			_base_0[_key_0] = _val_0 -- 260
		end -- 260
	end -- 262
	if _base_0.__index == nil then -- 260
		_base_0.__index = _base_0 -- 260
	end -- 262
	setmetatable(_base_0, _parent_0.__base) -- 260
	_class_0 = setmetatable({ -- 260
		__init = function(self, ...) -- 260
			return _class_0.__parent.__init(self, ...) -- 260
		end, -- 260
		__base = _base_0, -- 260
		__name = "DrinkFluid", -- 260
		__parent = _parent_0 -- 260
	}, { -- 260
		__index = function(cls, name) -- 260
			local val = rawget(_base_0, name) -- 260
			if val == nil then -- 260
				local parent = rawget(cls, "__parent") -- 260
				if parent then -- 260
					return parent[name] -- 260
				end -- 260
			else -- 260
				return val -- 260
			end -- 260
		end, -- 260
		__call = function(cls, ...) -- 260
			local _self_0 = setmetatable({ }, _base_0) -- 260
			cls.__init(_self_0, ...) -- 260
			return _self_0 -- 260
		end -- 260
	}) -- 260
	_base_0.__class = _class_0 -- 260
	if _parent_0.__inherited then -- 260
		_parent_0.__inherited(_parent_0, _class_0) -- 260
	end -- 260
	DrinkFluid = _class_0 -- 260
end -- 262
local Drink -- 264
do -- 264
	local _class_0 -- 264
	local _parent_0 = Food -- 264
	local _base_0 = { -- 264
		PrintName = "Drink", -- 266
		Sound = "DrinkFluid" -- 264
	} -- 264
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 266
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 264
			_base_0[_key_0] = _val_0 -- 264
		end -- 264
	end -- 266
	if _base_0.__index == nil then -- 264
		_base_0.__index = _base_0 -- 264
	end -- 266
	setmetatable(_base_0, _parent_0.__base) -- 264
	_class_0 = setmetatable({ -- 264
		__init = function(self, ...) -- 264
			return _class_0.__parent.__init(self, ...) -- 264
		end, -- 264
		__base = _base_0, -- 264
		__name = "Drink", -- 264
		__parent = _parent_0 -- 264
	}, { -- 264
		__index = function(cls, name) -- 264
			local val = rawget(_base_0, name) -- 264
			if val == nil then -- 264
				local parent = rawget(cls, "__parent") -- 264
				if parent then -- 264
					return parent[name] -- 264
				end -- 264
			else -- 264
				return val -- 264
			end -- 264
		end, -- 264
		__call = function(cls, ...) -- 264
			local _self_0 = setmetatable({ }, _base_0) -- 264
			cls.__init(_self_0, ...) -- 264
			return _self_0 -- 264
		end -- 264
	}) -- 264
	_base_0.__class = _class_0 -- 264
	if _parent_0.__inherited then -- 264
		_parent_0.__inherited(_parent_0, _class_0) -- 264
	end -- 264
	Drink = _class_0 -- 264
end -- 266
local FearBeer -- 268
do -- 268
	local _class_0 -- 268
	local _parent_0 = Drink -- 268
	local _base_0 = { -- 268
		PrintName = "Fear Beer", -- 270
		Model = Model("models/props_junk/garbage_glassbottle001a.mdl"), -- 271
		Thirst = -12, -- 272
		Despair = -15, -- 273
		Description = "A bottle of foul off-yellow liquid.\n'BEER' is hand-written on the label.", -- 275
		Price = 60, -- 277
		TrashClass = "trash/bottle/fearbeer", -- 279
		ImpactThreshold = 256, -- 281
		UseText = { -- 282
			"chugs a fear beer.", -- 282
			"downs a bottle of piss beer.", -- 283
			"drinks a ratty bottle of brew.", -- 284
			"quaffs a beer and grimaces.", -- 285
			"takes a swig of fear beer and shivers.", -- 286
			"guzzles a fear beer.", -- 287
			"chokes down some piss beer." -- 288
		}, -- 291
		Initialize = function(self) -- 291
			_class_0.__parent.__base.Initialize(self) -- 292
			if SERVER then -- 293
				return self:PrecacheGibs() -- 293
			end -- 293
		end, -- 295
		OnTakeDamage = function(self, dmg) -- 295
			_class_0.__parent.__base.OnTakeDamage(self, dmg) -- 296
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH -- 297
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then -- 298
				self:Shatter(dmg:GetDamageForce()) -- 298
			end -- 298
			if attacker and IsValid(attacker) and attacker:IsPlayer() then -- 299
				if attacker:HasOddity(ODDITY_DELINQUENCY) then -- 300
					return attacker:AddDespair(-math.random(2, 4)) -- 301
				end -- 300
			end -- 299
		end, -- 303
		PhysicsCollide = function(self, data) -- 303
			_class_0.__parent.__base.PhysicsCollide(self, data) -- 304
			if CLIENT then -- 305
				return -- 305
			end -- 305
			if data.Speed > self.ImpactThreshold then -- 306
				if data.HitEntity and IsValid(data.HitEntity) then -- 307
					local attacker = self:GetNWEntity("evilrp_submitter") -- 308
					do -- 309
						local dmg = DamageInfo() -- 309
						dmg:SetDamage(25) -- 310
						if IsValid(attacker) then -- 311
							dmg:SetAttacker(attacker) -- 311
						end -- 311
						dmg:SetInflictor(self) -- 312
						dmg:SetDamageType(DMG_SLASH) -- 313
						dmg:SetDamagePosition(data.HitPos) -- 314
						data.HitEntity:TakeDamageInfo(dmg) -- 315
					end -- 309
				end -- 307
				local force = data.OurNewVelocity -- 316
				return self:Shatter(force) -- 317
			end -- 306
		end, -- 319
		Shatter = function(self, force) -- 319
			if self.broken then -- 320
				return -- 320
			end -- 320
			self.broken = true -- 321
			local pos = self:GetPos() -- 322
			local _list_0 = player.GetAll() -- 323
			for _index_0 = 1, #_list_0 do -- 323
				local ply = _list_0[_index_0] -- 323
				local _continue_0 = false -- 324
				repeat -- 324
					if not ply:HasOddity(ODDITY_DELINQUENCY) then -- 324
						_continue_0 = true -- 324
						break -- 324
					end -- 324
					if ply:CanSee(self) and ply:LookingInDirection(pos) then -- 325
						ply:AddDespair(-math.random(2, 4)) -- 326
					end -- 325
					_continue_0 = true -- 324
				until true -- 326
				if not _continue_0 then -- 326
					break -- 326
				end -- 326
			end -- 326
			do -- 327
				local ed = EffectData() -- 327
				ed:SetStart(pos) -- 328
				ed:SetOrigin(pos) -- 329
				ed:SetScale(8) -- 330
				util.Effect("GlassImpact", ed, true, true) -- 331
			end -- 327
			self:EmitSound("BottleSmash") -- 332
			self:GibBreakServer(force) -- 333
			return self:Remove() -- 334
		end -- 268
	} -- 268
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 334
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 268
			_base_0[_key_0] = _val_0 -- 268
		end -- 268
	end -- 334
	if _base_0.__index == nil then -- 268
		_base_0.__index = _base_0 -- 268
	end -- 334
	setmetatable(_base_0, _parent_0.__base) -- 268
	_class_0 = setmetatable({ -- 268
		__init = function(self, ...) -- 268
			return _class_0.__parent.__init(self, ...) -- 268
		end, -- 268
		__base = _base_0, -- 268
		__name = "FearBeer", -- 268
		__parent = _parent_0 -- 268
	}, { -- 268
		__index = function(cls, name) -- 268
			local val = rawget(_base_0, name) -- 268
			if val == nil then -- 268
				local parent = rawget(cls, "__parent") -- 268
				if parent then -- 268
					return parent[name] -- 268
				end -- 268
			else -- 268
				return val -- 268
			end -- 268
		end, -- 268
		__call = function(cls, ...) -- 268
			local _self_0 = setmetatable({ }, _base_0) -- 268
			cls.__init(_self_0, ...) -- 268
			return _self_0 -- 268
		end -- 268
	}) -- 268
	_base_0.__class = _class_0 -- 268
	if _parent_0.__inherited then -- 268
		_parent_0.__inherited(_parent_0, _class_0) -- 268
	end -- 268
	FearBeer = _class_0 -- 268
end -- 334
local SmearBeer -- 336
do -- 336
	local _class_0 -- 336
	local _parent_0 = Drink -- 336
	local _base_0 = { -- 336
		PrintName = "Smear Beer", -- 338
		Model = Model("models/props_junk/garbage_glassbottle003a.mdl"), -- 339
		Thirst = -12, -- 340
		Despair = -35, -- 341
		Description = "A bottle of cloudy, greyish red booze.\nThe label is obscured with a smear of old blood.", -- 343
		Price = 95, -- 345
		TrashClass = "trash/bottle", -- 347
		ImpactThreshold = 256, -- 349
		UseText = { -- 350
			"chugs a smear beer.", -- 350
			"downs a bottle of red brew.", -- 351
			"drinks a cloudy bottle of beer.", -- 352
			"quaffs a smear beer and shivers.", -- 353
			"takes a swig of smear beer.", -- 354
			"guzzles a bloody beer.", -- 355
			"nurses a bottle of blood beer." -- 356
		}, -- 359
		Initialize = function(self) -- 359
			_class_0.__parent.__base.Initialize(self) -- 360
			if SERVER then -- 361
				return self:PrecacheGibs() -- 361
			end -- 361
		end, -- 363
		OnTakeDamage = function(self, dmg) -- 363
			_class_0.__parent.__base.OnTakeDamage(self, dmg) -- 364
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH -- 365
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then -- 366
				self:Shatter(dmg:GetDamageForce()) -- 366
			end -- 366
			if attacker and IsValid(attacker) and attacker:IsPlayer() then -- 367
				if attacker:HasOddity(ODDITY_DELINQUENCY) then -- 368
					return attacker:AddDespair(-math.random(2, 4)) -- 369
				end -- 368
			end -- 367
		end, -- 371
		PhysicsCollide = function(self, data) -- 371
			_class_0.__parent.__base.PhysicsCollide(self, data) -- 372
			if CLIENT then -- 373
				return -- 373
			end -- 373
			if data.Speed > self.ImpactThreshold then -- 374
				if data.HitEntity and IsValid(data.HitEntity) then -- 375
					local attacker = self:GetNWEntity("evilrp_submitter") -- 376
					do -- 377
						local dmg = DamageInfo() -- 377
						dmg:SetDamage(25) -- 378
						if IsValid(attacker) then -- 379
							dmg:SetAttacker(attacker) -- 379
						end -- 379
						dmg:SetInflictor(self) -- 380
						dmg:SetDamageType(DMG_SLASH) -- 381
						dmg:SetDamagePosition(data.HitPos) -- 382
						data.HitEntity:TakeDamageInfo(dmg) -- 383
					end -- 377
				end -- 375
				local force = data.OurNewVelocity -- 384
				return self:Shatter(force) -- 385
			end -- 374
		end, -- 387
		Shatter = function(self, force) -- 387
			if self.broken then -- 388
				return -- 388
			end -- 388
			self.broken = true -- 389
			local pos = self:GetPos() -- 390
			local _list_0 = player.GetAll() -- 391
			for _index_0 = 1, #_list_0 do -- 391
				local ply = _list_0[_index_0] -- 391
				local _continue_0 = false -- 392
				repeat -- 392
					if not ply:HasOddity(ODDITY_DELINQUENCY) then -- 392
						_continue_0 = true -- 392
						break -- 392
					end -- 392
					if ply:CanSee(self) and ply:LookingInDirection(pos) then -- 393
						ply:AddDespair(-math.random(2, 4)) -- 394
					end -- 393
					_continue_0 = true -- 392
				until true -- 394
				if not _continue_0 then -- 394
					break -- 394
				end -- 394
			end -- 394
			do -- 395
				local ed = EffectData() -- 395
				ed:SetStart(pos) -- 396
				ed:SetOrigin(pos) -- 397
				ed:SetScale(8) -- 398
				util.Effect("GlassImpact", ed, true, true) -- 399
			end -- 395
			self:EmitSound("BottleSmash") -- 400
			self:GibBreakServer(force) -- 401
			return self:Remove() -- 402
		end -- 336
	} -- 336
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 402
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 336
			_base_0[_key_0] = _val_0 -- 336
		end -- 336
	end -- 402
	if _base_0.__index == nil then -- 336
		_base_0.__index = _base_0 -- 336
	end -- 402
	setmetatable(_base_0, _parent_0.__base) -- 336
	_class_0 = setmetatable({ -- 336
		__init = function(self, ...) -- 336
			return _class_0.__parent.__init(self, ...) -- 336
		end, -- 336
		__base = _base_0, -- 336
		__name = "SmearBeer", -- 336
		__parent = _parent_0 -- 336
	}, { -- 336
		__index = function(cls, name) -- 336
			local val = rawget(_base_0, name) -- 336
			if val == nil then -- 336
				local parent = rawget(cls, "__parent") -- 336
				if parent then -- 336
					return parent[name] -- 336
				end -- 336
			else -- 336
				return val -- 336
			end -- 336
		end, -- 336
		__call = function(cls, ...) -- 336
			local _self_0 = setmetatable({ }, _base_0) -- 336
			cls.__init(_self_0, ...) -- 336
			return _self_0 -- 336
		end -- 336
	}) -- 336
	_base_0.__class = _class_0 -- 336
	if _parent_0.__inherited then -- 336
		_parent_0.__inherited(_parent_0, _class_0) -- 336
	end -- 336
	SmearBeer = _class_0 -- 336
end -- 402
local Shake -- 404
do -- 404
	local _class_0 -- 404
	local _parent_0 = Drink -- 404
	local _base_0 = { -- 404
		PrintName = "Soylent Shake", -- 406
		Model = Model("models/props_junk/garbage_milkcarton001a.mdl"), -- 407
		Thirst = -40, -- 408
		Hunger = -40, -- 409
		Despair = 30, -- 410
		Description = "A jug full of partially blended human remains.\nIt's warm and chunky.", -- 412
		Price = 120, -- 414
		TrashClass = "trash/plastic/shake", -- 416
		UseText = { -- 417
			"chokes down a soylent shake.", -- 417
			"slurps up a soylent shake.", -- 418
			"swigs blended peoplemeat and shudders.", -- 419
			"struggles down a jug of human sludge.", -- 420
			"shoots back a bad protein shake.", -- 421
			"guzzles a meat smoothie.", -- 422
			"quaffs an entire soylent shake." -- 423
		} -- 404
	} -- 404
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 424
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 404
			_base_0[_key_0] = _val_0 -- 404
		end -- 404
	end -- 424
	if _base_0.__index == nil then -- 404
		_base_0.__index = _base_0 -- 404
	end -- 424
	setmetatable(_base_0, _parent_0.__base) -- 404
	_class_0 = setmetatable({ -- 404
		__init = function(self, ...) -- 404
			return _class_0.__parent.__init(self, ...) -- 404
		end, -- 404
		__base = _base_0, -- 404
		__name = "Shake", -- 404
		__parent = _parent_0 -- 404
	}, { -- 404
		__index = function(cls, name) -- 404
			local val = rawget(_base_0, name) -- 404
			if val == nil then -- 404
				local parent = rawget(cls, "__parent") -- 404
				if parent then -- 404
					return parent[name] -- 404
				end -- 404
			else -- 404
				return val -- 404
			end -- 404
		end, -- 404
		__call = function(cls, ...) -- 404
			local _self_0 = setmetatable({ }, _base_0) -- 404
			cls.__init(_self_0, ...) -- 404
			return _self_0 -- 404
		end -- 404
	}) -- 404
	_base_0.__class = _class_0 -- 404
	if _parent_0.__inherited then -- 404
		_parent_0.__inherited(_parent_0, _class_0) -- 404
	end -- 404
	Shake = _class_0 -- 404
end -- 424
local Twitchel -- 426
do -- 426
	local _class_0 -- 426
	local _parent_0 = Drink -- 426
	local _base_0 = { -- 426
		PrintName = "Twitchel", -- 428
		Model = Model("models/props_junk/garbage_plasticbottle003a.mdl"), -- 429
		Thirst = -44, -- 430
		Hunger = 6, -- 431
		Despair = 6, -- 432
		Description = "A bottle of refreshingly lukewarm, cloudy green drink.", -- 434
		Price = 80, -- 436
		TrashClass = "trash/plastic/twitchel", -- 438
		UseText = { -- 439
			"necks a bottle of twitchel.", -- 439
			"can't get enough of that green stuff.", -- 440
			"sucks down a bottle of twitchel.", -- 441
			"sips up their twitchel.", -- 442
			"pours twitchel down their throat.", -- 443
			"drinks a bottle of twitchel.", -- 444
			"slurps up a green drink." -- 445
		} -- 426
	} -- 426
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 446
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 426
			_base_0[_key_0] = _val_0 -- 426
		end -- 426
	end -- 446
	if _base_0.__index == nil then -- 426
		_base_0.__index = _base_0 -- 426
	end -- 446
	setmetatable(_base_0, _parent_0.__base) -- 426
	_class_0 = setmetatable({ -- 426
		__init = function(self, ...) -- 426
			return _class_0.__parent.__init(self, ...) -- 426
		end, -- 426
		__base = _base_0, -- 426
		__name = "Twitchel", -- 426
		__parent = _parent_0 -- 426
	}, { -- 426
		__index = function(cls, name) -- 426
			local val = rawget(_base_0, name) -- 426
			if val == nil then -- 426
				local parent = rawget(cls, "__parent") -- 426
				if parent then -- 426
					return parent[name] -- 426
				end -- 426
			else -- 426
				return val -- 426
			end -- 426
		end, -- 426
		__call = function(cls, ...) -- 426
			local _self_0 = setmetatable({ }, _base_0) -- 426
			cls.__init(_self_0, ...) -- 426
			return _self_0 -- 426
		end -- 426
	}) -- 426
	_base_0.__class = _class_0 -- 426
	if _parent_0.__inherited then -- 426
		_parent_0.__inherited(_parent_0, _class_0) -- 426
	end -- 426
	Twitchel = _class_0 -- 426
end -- 446
local TakeMeds -- 448
do -- 448
	local _class_0 -- 448
	local _parent_0 = SOUND -- 448
	local _base_0 = { -- 448
		sound = (function() -- 449
			local _accum_0 = { } -- 449
			local _len_0 = 1 -- 449
			for i = 1, 3 do -- 449
				_accum_0[_len_0] = "npc/zombie/zombie_pain" .. tostring(i) .. ".wav" -- 449
				_len_0 = _len_0 + 1 -- 449
			end -- 449
			return _accum_0 -- 449
		end)() -- 448
	} -- 448
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 449
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 448
			_base_0[_key_0] = _val_0 -- 448
		end -- 448
	end -- 449
	if _base_0.__index == nil then -- 448
		_base_0.__index = _base_0 -- 448
	end -- 449
	setmetatable(_base_0, _parent_0.__base) -- 448
	_class_0 = setmetatable({ -- 448
		__init = function(self, ...) -- 448
			return _class_0.__parent.__init(self, ...) -- 448
		end, -- 448
		__base = _base_0, -- 448
		__name = "TakeMeds", -- 448
		__parent = _parent_0 -- 448
	}, { -- 448
		__index = function(cls, name) -- 448
			local val = rawget(_base_0, name) -- 448
			if val == nil then -- 448
				local parent = rawget(cls, "__parent") -- 448
				if parent then -- 448
					return parent[name] -- 448
				end -- 448
			else -- 448
				return val -- 448
			end -- 448
		end, -- 448
		__call = function(cls, ...) -- 448
			local _self_0 = setmetatable({ }, _base_0) -- 448
			cls.__init(_self_0, ...) -- 448
			return _self_0 -- 448
		end -- 448
	}) -- 448
	_base_0.__class = _class_0 -- 448
	if _parent_0.__inherited then -- 448
		_parent_0.__inherited(_parent_0, _class_0) -- 448
	end -- 448
	TakeMeds = _class_0 -- 448
end -- 449
local Medicine -- 451
do -- 451
	local _class_0 -- 451
	local _parent_0 = Food -- 451
	local _base_0 = { -- 451
		PrintName = "Medicine", -- 453
		Sound = "TakeMeds" -- 451
	} -- 451
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 453
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 451
			_base_0[_key_0] = _val_0 -- 451
		end -- 451
	end -- 453
	if _base_0.__index == nil then -- 451
		_base_0.__index = _base_0 -- 451
	end -- 453
	setmetatable(_base_0, _parent_0.__base) -- 451
	_class_0 = setmetatable({ -- 451
		__init = function(self, ...) -- 451
			return _class_0.__parent.__init(self, ...) -- 451
		end, -- 451
		__base = _base_0, -- 451
		__name = "Medicine", -- 451
		__parent = _parent_0 -- 451
	}, { -- 451
		__index = function(cls, name) -- 451
			local val = rawget(_base_0, name) -- 451
			if val == nil then -- 451
				local parent = rawget(cls, "__parent") -- 451
				if parent then -- 451
					return parent[name] -- 451
				end -- 451
			else -- 451
				return val -- 451
			end -- 451
		end, -- 451
		__call = function(cls, ...) -- 451
			local _self_0 = setmetatable({ }, _base_0) -- 451
			cls.__init(_self_0, ...) -- 451
			return _self_0 -- 451
		end -- 451
	}) -- 451
	_base_0.__class = _class_0 -- 451
	if _parent_0.__inherited then -- 451
		_parent_0.__inherited(_parent_0, _class_0) -- 451
	end -- 451
	Medicine = _class_0 -- 451
end -- 453
local Pills -- 455
do -- 455
	local _class_0 -- 455
	local _parent_0 = Medicine -- 455
	local _base_0 = { -- 455
		PrintName = "Pills", -- 457
		Model = Model("models/props_lab/jar01b.mdl"), -- 458
		AddHealth = function(self) -- 458
			return math.random(-15, -30) -- 458
		end, -- 459
		Hunger = function(self) -- 459
			return math.random(30, 50) -- 459
		end, -- 460
		Thirst = function(self) -- 460
			return math.random(30, 60) -- 460
		end, -- 461
		Despair = function(self) -- 461
			return math.random(-60, -100) -- 461
		end, -- 463
		Description = "A white plastic bottle, full of random pills.", -- 465
		Price = 125, -- 467
		TrashClass = "trash/plastic/pills", -- 469
		UseText = { -- 470
			"throws a mess of pills into eir mouth.", -- 470
			"consumes the whole contents of a pill bottle.", -- 471
			"devours handfuls of scary-looking pills.", -- 472
			"chokes down some strange pills.", -- 473
			"takes eir medicine, like a good citizen should.", -- 474
			"swallows a mouthful of pills.", -- 475
			"takes an excessive dose of colorful pills.", -- 476
			"tosses back an entire bottle of pills.", -- 477
			"throws back a bottle of mystery pills." -- 478
		} -- 455
	} -- 455
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 479
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 455
			_base_0[_key_0] = _val_0 -- 455
		end -- 455
	end -- 479
	if _base_0.__index == nil then -- 455
		_base_0.__index = _base_0 -- 455
	end -- 479
	setmetatable(_base_0, _parent_0.__base) -- 455
	_class_0 = setmetatable({ -- 455
		__init = function(self, ...) -- 455
			return _class_0.__parent.__init(self, ...) -- 455
		end, -- 455
		__base = _base_0, -- 455
		__name = "Pills", -- 455
		__parent = _parent_0 -- 455
	}, { -- 455
		__index = function(cls, name) -- 455
			local val = rawget(_base_0, name) -- 455
			if val == nil then -- 455
				local parent = rawget(cls, "__parent") -- 455
				if parent then -- 455
					return parent[name] -- 455
				end -- 455
			else -- 455
				return val -- 455
			end -- 455
		end, -- 455
		__call = function(cls, ...) -- 455
			local _self_0 = setmetatable({ }, _base_0) -- 455
			cls.__init(_self_0, ...) -- 455
			return _self_0 -- 455
		end -- 455
	}) -- 455
	_base_0.__class = _class_0 -- 455
	if _parent_0.__inherited then -- 455
		_parent_0.__inherited(_parent_0, _class_0) -- 455
	end -- 455
	Pills = _class_0 -- 455
end -- 479
local TimeGas -- 481
do -- 481
	local _class_0 -- 481
	local _parent_0 = Medicine -- 481
	local _base_0 = { -- 481
		PrintName = "Time Gas", -- 483
		Model = Model("models/props_wasteland/prison_sinkchunk001e.mdl"), -- 484
		Sound = (function() -- 484
			local _accum_0 = { } -- 484
			local _len_0 = 1 -- 484
			for i = 2, 3 do -- 484
				_accum_0[_len_0] = "npc/fast_zombie/idle" .. tostring(i) -- 484
				_len_0 = _len_0 + 1 -- 484
			end -- 484
			return _accum_0 -- 484
		end)(), -- 485
		AddHealth = function(self) -- 485
			return math.random(20, 40) -- 485
		end, -- 486
		Hunger = function(self) -- 486
			return math.random(10, 20) -- 486
		end, -- 487
		Thirst = function(self) -- 487
			return math.random(20, 30) -- 487
		end, -- 488
		Despair = function(self) -- 488
			return math.random(0, 10) -- 488
		end, -- 490
		Description = "An inhaler of time acceleration gas.\nSpeeds up healing, and dying.", -- 492
		Price = 100, -- 494
		TrashClass = "trash/inhaler", -- 496
		UseText = { -- 497
			"breathes in some time gas.", -- 497
			"huffs a healing gas.", -- 498
			"isn't yet tired of the time gas.", -- 499
			"inhales a big cloud of time gas.", -- 500
			"takes a deep breath of time gas.", -- 501
			"drags in a lungful of time gas.", -- 502
			"sniffs up a cloud of time gas.", -- 503
			"huffs time gas from the rusty inhaler." -- 504
		} -- 481
	} -- 481
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 505
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 481
			_base_0[_key_0] = _val_0 -- 481
		end -- 481
	end -- 505
	if _base_0.__index == nil then -- 481
		_base_0.__index = _base_0 -- 481
	end -- 505
	setmetatable(_base_0, _parent_0.__base) -- 481
	_class_0 = setmetatable({ -- 481
		__init = function(self, ...) -- 481
			return _class_0.__parent.__init(self, ...) -- 481
		end, -- 481
		__base = _base_0, -- 481
		__name = "TimeGas", -- 481
		__parent = _parent_0 -- 481
	}, { -- 481
		__index = function(cls, name) -- 481
			local val = rawget(_base_0, name) -- 481
			if val == nil then -- 481
				local parent = rawget(cls, "__parent") -- 481
				if parent then -- 481
					return parent[name] -- 481
				end -- 481
			else -- 481
				return val -- 481
			end -- 481
		end, -- 481
		__call = function(cls, ...) -- 481
			local _self_0 = setmetatable({ }, _base_0) -- 481
			cls.__init(_self_0, ...) -- 481
			return _self_0 -- 481
		end -- 481
	}) -- 481
	_base_0.__class = _class_0 -- 481
	if _parent_0.__inherited then -- 481
		_parent_0.__inherited(_parent_0, _class_0) -- 481
	end -- 481
	TimeGas = _class_0 -- 481
end -- 505
local Bleach -- 507
do -- 507
	local _class_0 -- 507
	local _parent_0 = Medicine -- 507
	local _base_0 = { -- 507
		PrintName = "Chlorine", -- 509
		Model = Model("models/props_junk/garbage_plasticbottle002a"), -- 510
		Sound = "DrinkFluid", -- 511
		AddHealth = function(self) -- 511
			return math.random(75, 99) -- 511
		end, -- 512
		Hunger = 70, -- 513
		Thirst = 70, -- 514
		Despair = 70, -- 516
		Description = "A jug full of bleach.", -- 518
		Price = 100, -- 520
		TrashClass = "trash/plastic/bleach", -- 522
		UseText = { -- 523
			"drinks bleach.", -- 523
			"chugs an entire fucking jug of chlorine.", -- 524
			"unscrews a jug of bleach and pours it down the hatch.", -- 525
			"chokes down gulp after gulp of chlorine bleach." -- 526
		} -- 507
	} -- 507
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 527
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 507
			_base_0[_key_0] = _val_0 -- 507
		end -- 507
	end -- 527
	if _base_0.__index == nil then -- 507
		_base_0.__index = _base_0 -- 507
	end -- 527
	setmetatable(_base_0, _parent_0.__base) -- 507
	_class_0 = setmetatable({ -- 507
		__init = function(self, ...) -- 507
			return _class_0.__parent.__init(self, ...) -- 507
		end, -- 507
		__base = _base_0, -- 507
		__name = "Bleach", -- 507
		__parent = _parent_0 -- 507
	}, { -- 507
		__index = function(cls, name) -- 507
			local val = rawget(_base_0, name) -- 507
			if val == nil then -- 507
				local parent = rawget(cls, "__parent") -- 507
				if parent then -- 507
					return parent[name] -- 507
				end -- 507
			else -- 507
				return val -- 507
			end -- 507
		end, -- 507
		__call = function(cls, ...) -- 507
			local _self_0 = setmetatable({ }, _base_0) -- 507
			cls.__init(_self_0, ...) -- 507
			return _self_0 -- 507
		end -- 507
	}) -- 507
	_base_0.__class = _class_0 -- 507
	if _parent_0.__inherited then -- 507
		_parent_0.__inherited(_parent_0, _class_0) -- 507
	end -- 507
	Bleach = _class_0 -- 507
end -- 527
local Ambrosia -- 529
do -- 529
	local _class_0 -- 529
	local _parent_0 = Food -- 529
	local _base_0 = { -- 529
		PrintName = "Ambrosia", -- 531
		Model = Model("models/Gibs/HGIBS.mdl"), -- 532
		Hunger = -100, -- 533
		Thirst = -100, -- 534
		Despair = -100, -- 535
		HealthAdd = 100, -- 536
		Description = "A food made for gods.", -- 537
		RotTime = 0, -- 539
		UseText = { -- 540
			"indulges in some ambrosia." -- 540
		}, -- 543
		Eat = function(self, ply) -- 543
			_class_0.__parent.__base.Eat(self, ply) -- 544
			if CLIENT then -- 545
				return -- 545
			end -- 545
			return ply:AddStemCells(5) -- 546
		end -- 529
	} -- 529
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 546
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 529
			_base_0[_key_0] = _val_0 -- 529
		end -- 529
	end -- 546
	if _base_0.__index == nil then -- 529
		_base_0.__index = _base_0 -- 529
	end -- 546
	setmetatable(_base_0, _parent_0.__base) -- 529
	_class_0 = setmetatable({ -- 529
		__init = function(self, ...) -- 529
			return _class_0.__parent.__init(self, ...) -- 529
		end, -- 529
		__base = _base_0, -- 529
		__name = "Ambrosia", -- 529
		__parent = _parent_0 -- 529
	}, { -- 529
		__index = function(cls, name) -- 529
			local val = rawget(_base_0, name) -- 529
			if val == nil then -- 529
				local parent = rawget(cls, "__parent") -- 529
				if parent then -- 529
					return parent[name] -- 529
				end -- 529
			else -- 529
				return val -- 529
			end -- 529
		end, -- 529
		__call = function(cls, ...) -- 529
			local _self_0 = setmetatable({ }, _base_0) -- 529
			cls.__init(_self_0, ...) -- 529
			return _self_0 -- 529
		end -- 529
	}) -- 529
	_base_0.__class = _class_0 -- 529
	if _parent_0.__inherited then -- 529
		_parent_0.__inherited(_parent_0, _class_0) -- 529
	end -- 529
	Ambrosia = _class_0 -- 529
end -- 546
local SloppyRibs -- 549
do -- 549
	local _class_0 -- 549
	local _parent_0 = Food -- 549
	local _base_0 = { -- 549
		PrintName = "Sloppy Ribs", -- 551
		Model = Model("models/vel/evilwar/sloppyribs.mdl"), -- 552
		Hunger = -28, -- 553
		Thirst = -4, -- 554
		Despair = 5, -- 555
		Description = "Fresh ribs from an unknown source, now glazed in slop! \n They look delicious.", -- 557
		CookTime = 10, -- 559
		Price = 115, -- 560
		UseText = { -- 561
			"devours all of the flesh and slop on the rib, then throws it away.", -- 561
			"munches on the rib, and then licks the glaze off his hands.", -- 562
			"gobbles down the rib, and spits out the bone." -- 563
		} -- 549
	} -- 549
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 563
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 549
			_base_0[_key_0] = _val_0 -- 549
		end -- 549
	end -- 563
	if _base_0.__index == nil then -- 549
		_base_0.__index = _base_0 -- 549
	end -- 563
	setmetatable(_base_0, _parent_0.__base) -- 549
	_class_0 = setmetatable({ -- 549
		__init = function(self, ...) -- 549
			return _class_0.__parent.__init(self, ...) -- 549
		end, -- 549
		__base = _base_0, -- 549
		__name = "SloppyRibs", -- 549
		__parent = _parent_0 -- 549
	}, { -- 549
		__index = function(cls, name) -- 549
			local val = rawget(_base_0, name) -- 549
			if val == nil then -- 549
				local parent = rawget(cls, "__parent") -- 549
				if parent then -- 549
					return parent[name] -- 549
				end -- 549
			else -- 549
				return val -- 549
			end -- 549
		end, -- 549
		__call = function(cls, ...) -- 549
			local _self_0 = setmetatable({ }, _base_0) -- 549
			cls.__init(_self_0, ...) -- 549
			return _self_0 -- 549
		end -- 549
	}) -- 549
	_base_0.__class = _class_0 -- 549
	if _parent_0.__inherited then -- 549
		_parent_0.__inherited(_parent_0, _class_0) -- 549
	end -- 549
	SloppyRibs = _class_0 -- 549
end -- 563
local EyeballNoodles -- 566
do -- 566
	local _class_0 -- 566
	local _parent_0 = Food -- 566
	local _base_0 = { -- 566
		PrintName = "Eyeball Noodles", -- 568
		Model = Model("models/vel/evilwar/eyenoodle.mdl"), -- 569
		Hunger = -40, -- 570
		Thirst = -5, -- 571
		Despair = 10, -- 572
		Description = "A traditional Lymphomian dish, usually served to go. \n The texture is an acquired taste.", -- 574
		CookTime = 8, -- 576
		Price = 130, -- 578
		UseText = { -- 579
			"slurps all of the noodles.", -- 579
			"slurps the noodles, gagging at the wet crunch of the eyeball.", -- 580
			"eats the noodles, and then spits out the eyeball.", -- 581
			"gags on the noodles, and then throws out the eyeball." -- 582
		} -- 566
	} -- 566
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 583
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 566
			_base_0[_key_0] = _val_0 -- 566
		end -- 566
	end -- 583
	if _base_0.__index == nil then -- 566
		_base_0.__index = _base_0 -- 566
	end -- 583
	setmetatable(_base_0, _parent_0.__base) -- 566
	_class_0 = setmetatable({ -- 566
		__init = function(self, ...) -- 566
			return _class_0.__parent.__init(self, ...) -- 566
		end, -- 566
		__base = _base_0, -- 566
		__name = "EyeballNoodles", -- 566
		__parent = _parent_0 -- 566
	}, { -- 566
		__index = function(cls, name) -- 566
			local val = rawget(_base_0, name) -- 566
			if val == nil then -- 566
				local parent = rawget(cls, "__parent") -- 566
				if parent then -- 566
					return parent[name] -- 566
				end -- 566
			else -- 566
				return val -- 566
			end -- 566
		end, -- 566
		__call = function(cls, ...) -- 566
			local _self_0 = setmetatable({ }, _base_0) -- 566
			cls.__init(_self_0, ...) -- 566
			return _self_0 -- 566
		end -- 566
	}) -- 566
	_base_0.__class = _class_0 -- 566
	if _parent_0.__inherited then -- 566
		_parent_0.__inherited(_parent_0, _class_0) -- 566
	end -- 566
	EyeballNoodles = _class_0 -- 566
end -- 583
local PaperMache -- 585
do -- 585
	local _class_0 -- 585
	local _parent_0 = Food -- 585
	local _base_0 = { -- 585
		PrintName = "Paper Mache", -- 587
		Model = Model("models/props_junk/garbage_bag001a.mdl"), -- 588
		Hunger = -10, -- 589
		Thirst = -10, -- 590
		Despair = 15, -- 591
		Description = "An old crumpled paper. \n now it's watered down into a little ball.", -- 593
		CookTime = 3, -- 595
		Price = 30, -- 597
		UseText = { -- 598
			"stoves the paper mache into his mouth, gagging horribly.", -- 598
			"forces the paper down his throat, throwing up slightly", -- 599
			"rips apart the paper mache, eating small pieces at a time.", -- 600
			"looks miserable trying to eat watered down paper." -- 601
		} -- 585
	} -- 585
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 601
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 585
			_base_0[_key_0] = _val_0 -- 585
		end -- 585
	end -- 601
	if _base_0.__index == nil then -- 585
		_base_0.__index = _base_0 -- 585
	end -- 601
	setmetatable(_base_0, _parent_0.__base) -- 585
	_class_0 = setmetatable({ -- 585
		__init = function(self, ...) -- 585
			return _class_0.__parent.__init(self, ...) -- 585
		end, -- 585
		__base = _base_0, -- 585
		__name = "PaperMache", -- 585
		__parent = _parent_0 -- 585
	}, { -- 585
		__index = function(cls, name) -- 585
			local val = rawget(_base_0, name) -- 585
			if val == nil then -- 585
				local parent = rawget(cls, "__parent") -- 585
				if parent then -- 585
					return parent[name] -- 585
				end -- 585
			else -- 585
				return val -- 585
			end -- 585
		end, -- 585
		__call = function(cls, ...) -- 585
			local _self_0 = setmetatable({ }, _base_0) -- 585
			cls.__init(_self_0, ...) -- 585
			return _self_0 -- 585
		end -- 585
	}) -- 585
	_base_0.__class = _class_0 -- 585
	if _parent_0.__inherited then -- 585
		_parent_0.__inherited(_parent_0, _class_0) -- 585
	end -- 585
	PaperMache = _class_0 -- 585
	return _class_0 -- 601
end -- 601
