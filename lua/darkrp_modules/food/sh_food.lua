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
		Despair = 35, -- 81
		Description = "A bloody, festering human skull.\nThe brain is still largely intact.", -- 82
		RotTime = 120, -- 84
		UseText = { -- 85
			"munches and crunches on a slop skull.", -- 85
			"slurps the brain matter out of a slop skull.", -- 86
			"digs around in a slop skull with their tongue.", -- 87
			"ravenously consumes a slop skull.", -- 88
			"gets pink sludge everywhere while eating a slop skull.", -- 89
			"scours a slop skull for brainmeat.", -- 90
			"cracks open a slop skull and slurps the brains out." -- 91
		}, -- 94
		Precursor = { -- 95
			biomass = 1 -- 95
		} -- 76
	} -- 76
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 95
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 76
			_base_0[_key_0] = _val_0 -- 76
		end -- 76
	end -- 95
	if _base_0.__index == nil then -- 76
		_base_0.__index = _base_0 -- 76
	end -- 95
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
end -- 95
local Paper -- 97
do -- 97
	local _class_0 -- 97
	local _parent_0 = Food -- 97
	local _base_0 = { -- 97
		PrintName = "Paper", -- 99
		Model = Model("models/props_lab/papersheet001a.mdl"), -- 100
		Hunger = -7, -- 101
		Thirst = 10, -- 102
		Description = "A dirty scrap of used paper.\nThe writing is too faint to make out.", -- 104
		UseText = { -- 105
			"chokes down a sheet of paper.", -- 105
			"tears up and eats a sheet of paper.", -- 106
			"chews the paper into a stiff pulp and swallows.", -- 107
			"struggles to swallow a dry sheet of paper.", -- 108
			"eats paper.", -- 109
			"crumples up some paper and struggles to chew it.", -- 110
			"munches on a piece of paper." -- 111
		} -- 97
	} -- 97
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 112
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 97
			_base_0[_key_0] = _val_0 -- 97
		end -- 97
	end -- 112
	if _base_0.__index == nil then -- 97
		_base_0.__index = _base_0 -- 97
	end -- 112
	setmetatable(_base_0, _parent_0.__base) -- 97
	_class_0 = setmetatable({ -- 97
		__init = function(self, ...) -- 97
			return _class_0.__parent.__init(self, ...) -- 97
		end, -- 97
		__base = _base_0, -- 97
		__name = "Paper", -- 97
		__parent = _parent_0 -- 97
	}, { -- 97
		__index = function(cls, name) -- 97
			local val = rawget(_base_0, name) -- 97
			if val == nil then -- 97
				local parent = rawget(cls, "__parent") -- 97
				if parent then -- 97
					return parent[name] -- 97
				end -- 97
			else -- 97
				return val -- 97
			end -- 97
		end, -- 97
		__call = function(cls, ...) -- 97
			local _self_0 = setmetatable({ }, _base_0) -- 97
			cls.__init(_self_0, ...) -- 97
			return _self_0 -- 97
		end -- 97
	}) -- 97
	_base_0.__class = _class_0 -- 97
	if _parent_0.__inherited then -- 97
		_parent_0.__inherited(_parent_0, _class_0) -- 97
	end -- 97
	Paper = _class_0 -- 97
end -- 112
local RibBone -- 114
do -- 114
	local _class_0 -- 114
	local _parent_0 = Food -- 114
	local _base_0 = { -- 114
		PrintName = "Dry Rib", -- 116
		Model = Model("models/Gibs/hgibs_rib.mdl"), -- 117
		Hunger = -8, -- 118
		HealthAdd = -7, -- 119
		RotTime = 240, -- 120
		Description = "A lone human rib.\nYou could chew the marrow out, but it'd probably hurt.", -- 122
		UseText = { -- 123
			"breaks a tooth chewing on a rib bone.", -- 123
			"sucks marrow and bone shards from the rib.", -- 124
			"cuts up their throat eating a rib bone.", -- 125
			"bleeds from the mouth as they eat a rib bone.", -- 126
			"eats a bone, like a vulture.", -- 127
			"chokes on the broken points of a rib bone." -- 128
		}, -- 131
		Precursor = { -- 132
			biomass = 1 -- 132
		} -- 114
	} -- 114
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 132
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 114
			_base_0[_key_0] = _val_0 -- 114
		end -- 114
	end -- 132
	if _base_0.__index == nil then -- 114
		_base_0.__index = _base_0 -- 114
	end -- 132
	setmetatable(_base_0, _parent_0.__base) -- 114
	_class_0 = setmetatable({ -- 114
		__init = function(self, ...) -- 114
			return _class_0.__parent.__init(self, ...) -- 114
		end, -- 114
		__base = _base_0, -- 114
		__name = "RibBone", -- 114
		__parent = _parent_0 -- 114
	}, { -- 114
		__index = function(cls, name) -- 114
			local val = rawget(_base_0, name) -- 114
			if val == nil then -- 114
				local parent = rawget(cls, "__parent") -- 114
				if parent then -- 114
					return parent[name] -- 114
				end -- 114
			else -- 114
				return val -- 114
			end -- 114
		end, -- 114
		__call = function(cls, ...) -- 114
			local _self_0 = setmetatable({ }, _base_0) -- 114
			cls.__init(_self_0, ...) -- 114
			return _self_0 -- 114
		end -- 114
	}) -- 114
	_base_0.__class = _class_0 -- 114
	if _parent_0.__inherited then -- 114
		_parent_0.__inherited(_parent_0, _class_0) -- 114
	end -- 114
	RibBone = _class_0 -- 114
end -- 132
local Skin -- 134
do -- 134
	local _class_0 -- 134
	local _parent_0 = Food -- 134
	local _base_0 = { -- 134
		PrintName = "Skin", -- 136
		Description = "A greasy patch of some kind of hide.\nIt would probably taste nasty.", -- 137
		Model = Model("models/gibs/antlion_gib_small_2.mdl"), -- 138
		HealthAdd = function(self) -- 138
			return math.random(10, 20) -- 138
		end -- 134
	} -- 134
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 138
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 134
			_base_0[_key_0] = _val_0 -- 134
		end -- 134
	end -- 138
	if _base_0.__index == nil then -- 134
		_base_0.__index = _base_0 -- 134
	end -- 138
	setmetatable(_base_0, _parent_0.__base) -- 134
	_class_0 = setmetatable({ -- 134
		__init = function(self, ...) -- 134
			return _class_0.__parent.__init(self, ...) -- 134
		end, -- 134
		__base = _base_0, -- 134
		__name = "Skin", -- 134
		__parent = _parent_0 -- 134
	}, { -- 134
		__index = function(cls, name) -- 134
			local val = rawget(_base_0, name) -- 134
			if val == nil then -- 134
				local parent = rawget(cls, "__parent") -- 134
				if parent then -- 134
					return parent[name] -- 134
				end -- 134
			else -- 134
				return val -- 134
			end -- 134
		end, -- 134
		__call = function(cls, ...) -- 134
			local _self_0 = setmetatable({ }, _base_0) -- 134
			cls.__init(_self_0, ...) -- 134
			return _self_0 -- 134
		end -- 134
	}) -- 134
	_base_0.__class = _class_0 -- 134
	if _parent_0.__inherited then -- 134
		_parent_0.__inherited(_parent_0, _class_0) -- 134
	end -- 134
	Skin = _class_0 -- 134
end -- 138
local Abortion -- 140
do -- 140
	local _class_0 -- 140
	local _parent_0 = Food -- 140
	local _base_0 = { -- 140
		PrintName = "Abortion", -- 142
		Model = Model("models/props_c17/doll01.mdl"), -- 143
		Hunger = -23, -- 144
		Thirst = -20, -- 145
		HealthAdd = 20, -- 146
		RotTime = 240, -- 147
		Description = "An artificial baby that never got the chance to be born.\nDelicious.", -- 149
		UseText = { -- 150
			"eats a baby.", -- 150
			"rips apart an abortion and eats the pieces.", -- 151
			"bites the head off an abortion and swallows the rest.", -- 152
			"chews an abortion into pink paste.", -- 153
			"tears chunks off an abortion until it's all gone.", -- 154
			"eats an abortion, baby blood dribbling down their neck.", -- 155
			"eats an abortion legs-first." -- 156
		}, -- 159
		Eat = function(self, ply) -- 159
			_class_0.__parent.__base.Eat(self, ply) -- 160
			if CLIENT then -- 161
				return -- 161
			end -- 161
			return ply:AddStemCells(1) -- 162
		end -- 140
	} -- 140
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 162
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 140
			_base_0[_key_0] = _val_0 -- 140
		end -- 140
	end -- 162
	if _base_0.__index == nil then -- 140
		_base_0.__index = _base_0 -- 140
	end -- 162
	setmetatable(_base_0, _parent_0.__base) -- 140
	_class_0 = setmetatable({ -- 140
		__init = function(self, ...) -- 140
			return _class_0.__parent.__init(self, ...) -- 140
		end, -- 140
		__base = _base_0, -- 140
		__name = "Abortion", -- 140
		__parent = _parent_0 -- 140
	}, { -- 140
		__index = function(cls, name) -- 140
			local val = rawget(_base_0, name) -- 140
			if val == nil then -- 140
				local parent = rawget(cls, "__parent") -- 140
				if parent then -- 140
					return parent[name] -- 140
				end -- 140
			else -- 140
				return val -- 140
			end -- 140
		end, -- 140
		__call = function(cls, ...) -- 140
			local _self_0 = setmetatable({ }, _base_0) -- 140
			cls.__init(_self_0, ...) -- 140
			return _self_0 -- 140
		end -- 140
	}) -- 140
	_base_0.__class = _class_0 -- 140
	if _parent_0.__inherited then -- 140
		_parent_0.__inherited(_parent_0, _class_0) -- 140
	end -- 140
	Abortion = _class_0 -- 140
end -- 162
local LiveBaby -- 164
do -- 164
	local _class_0 -- 164
	local _parent_0 = Food -- 164
	local _base_0 = { -- 164
		PrintName = "Live baby", -- 166
		Model = Model("models/props_c17/doll01.mdl"), -- 167
		Hunger = -30, -- 168
		Thirst = -22, -- 169
		HealthAdd = 15, -- 170
		Description = "An artifical baby, born paralyzed below the eyes.\nIt will know nothing but fear and pain.", -- 172
		UseText = { -- 173
			"eats a living infant.", -- 173
			"chews the head off a live baby and drinks its blood.", -- 174
			"eats a baby alive.", -- 175
			"eats a live baby and tastes its tears.", -- 176
			"rips apart a living baby and eats the pieces.", -- 177
			"tears open a live baby and feeds on its entrails.", -- 178
			"eats a live baby as it cries silently." -- 179
		} -- 164
	} -- 164
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 180
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 164
			_base_0[_key_0] = _val_0 -- 164
		end -- 164
	end -- 180
	if _base_0.__index == nil then -- 164
		_base_0.__index = _base_0 -- 164
	end -- 180
	setmetatable(_base_0, _parent_0.__base) -- 164
	_class_0 = setmetatable({ -- 164
		__init = function(self, ...) -- 164
			return _class_0.__parent.__init(self, ...) -- 164
		end, -- 164
		__base = _base_0, -- 164
		__name = "LiveBaby", -- 164
		__parent = _parent_0 -- 164
	}, { -- 164
		__index = function(cls, name) -- 164
			local val = rawget(_base_0, name) -- 164
			if val == nil then -- 164
				local parent = rawget(cls, "__parent") -- 164
				if parent then -- 164
					return parent[name] -- 164
				end -- 164
			else -- 164
				return val -- 164
			end -- 164
		end, -- 164
		__call = function(cls, ...) -- 164
			local _self_0 = setmetatable({ }, _base_0) -- 164
			cls.__init(_self_0, ...) -- 164
			return _self_0 -- 164
		end -- 164
	}) -- 164
	_base_0.__class = _class_0 -- 164
	if _parent_0.__inherited then -- 164
		_parent_0.__inherited(_parent_0, _class_0) -- 164
	end -- 164
	LiveBaby = _class_0 -- 164
end -- 180
local SoyLoaf -- 182
do -- 182
	local _class_0 -- 182
	local _parent_0 = Food -- 182
	local _base_0 = { -- 182
		PrintName = "Soylent Loaf", -- 184
		Model = Model("models/gibs/antlion_gib_small_3.mdl"), -- 185
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
		Despair = -5, -- 209
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
local MeatLoaf -- 219
do -- 219
	local _class_0 -- 219
	local _parent_0 = Food -- 219
	local _base_0 = { -- 219
		PrintName = "Meatloaf", -- 221
		Model = Model("models/props_junk/garbage_takeoutcarton001a.mdl"), -- 222
		Hunger = -40, -- 223
		Thirst = -9, -- 224
		Despair = -20, -- 225
		Description = "Delicious meatloaf, a favorite of many soldiers.", -- 226
		CookTime = 15, -- 228
		Price = 100, -- 231
		Eat = function(self, ply) -- 231
			_class_0.__parent.__base.Eat(self, ply) -- 232
			if CLIENT then -- 233
				return -- 233
			end -- 233
			return ply:AddStemCells(1) -- 234
		end, -- 236
		UseText = { -- 237
			"Devours their meatloaf.", -- 237
			"chokes while consuming slop.", -- 238
			"struggles to eat a slop bowl.", -- 239
			"chomps on some slop.", -- 240
			"begrudgingly eats a spoonful of slop.", -- 241
			"consumes slop." -- 242
		} -- 219
	} -- 219
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 242
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 219
			_base_0[_key_0] = _val_0 -- 219
		end -- 219
	end -- 242
	if _base_0.__index == nil then -- 219
		_base_0.__index = _base_0 -- 219
	end -- 242
	setmetatable(_base_0, _parent_0.__base) -- 219
	_class_0 = setmetatable({ -- 219
		__init = function(self, ...) -- 219
			return _class_0.__parent.__init(self, ...) -- 219
		end, -- 219
		__base = _base_0, -- 219
		__name = "MeatLoaf", -- 219
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
	MeatLoaf = _class_0 -- 219
end -- 242
local SlopBowl -- 245
do -- 245
	local _class_0 -- 245
	local _parent_0 = Food -- 245
	local _base_0 = { -- 245
		PrintName = "Slop Bowl", -- 247
		Model = Model("models/props_c17/metalPot001a.mdl"), -- 248
		Hunger = -30, -- 249
		Thirst = 4, -- 250
		Despair = 15, -- 251
		Description = "A festering pot that oozes a disgusting liquid.\nIt seems oddly comforting.", -- 252
		CookTime = 10, -- 254
		Price = 20, -- 256
		UseText = { -- 257
			"enjoys the slop.", -- 257
			"chokes while consuming slop.", -- 258
			"struggles to eat a slop bowl.", -- 259
			"chomps on some slop.", -- 260
			"begrudgingly eats a spoonful of slop.", -- 261
			"consumes slop." -- 262
		} -- 245
	} -- 245
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 262
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 245
			_base_0[_key_0] = _val_0 -- 245
		end -- 245
	end -- 262
	if _base_0.__index == nil then -- 245
		_base_0.__index = _base_0 -- 245
	end -- 262
	setmetatable(_base_0, _parent_0.__base) -- 245
	_class_0 = setmetatable({ -- 245
		__init = function(self, ...) -- 245
			return _class_0.__parent.__init(self, ...) -- 245
		end, -- 245
		__base = _base_0, -- 245
		__name = "SlopBowl", -- 245
		__parent = _parent_0 -- 245
	}, { -- 245
		__index = function(cls, name) -- 245
			local val = rawget(_base_0, name) -- 245
			if val == nil then -- 245
				local parent = rawget(cls, "__parent") -- 245
				if parent then -- 245
					return parent[name] -- 245
				end -- 245
			else -- 245
				return val -- 245
			end -- 245
		end, -- 245
		__call = function(cls, ...) -- 245
			local _self_0 = setmetatable({ }, _base_0) -- 245
			cls.__init(_self_0, ...) -- 245
			return _self_0 -- 245
		end -- 245
	}) -- 245
	_base_0.__class = _class_0 -- 245
	if _parent_0.__inherited then -- 245
		_parent_0.__inherited(_parent_0, _class_0) -- 245
	end -- 245
	SlopBowl = _class_0 -- 245
end -- 262
local GroundRibs -- 264
do -- 264
	local _class_0 -- 264
	local _parent_0 = Food -- 264
	local _base_0 = { -- 264
		PrintName = "Ground Ribs", -- 266
		Model = Model("models/props_c17/metalPot001a.mdl"), -- 267
		Hunger = -10, -- 268
		Thirst = 5, -- 269
		Despair = 15, -- 270
		HealthAdd = -5, -- 271
		Description = "Human ribs, ground up into a fibrous powder.\nIt doesn't look edible yet.", -- 272
		CookTime = 5, -- 274
		Price = 30, -- 276
		UseText = { -- 277
			"eats some ground ribs and spits them out.", -- 277
			"bleeds from a chunk of ground ribs.", -- 278
			"munches on some ground ribs, lacerating their throat.", -- 279
			"regrets putting rib powder in their mouth." -- 280
		} -- 264
	} -- 264
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 280
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 264
			_base_0[_key_0] = _val_0 -- 264
		end -- 264
	end -- 280
	if _base_0.__index == nil then -- 264
		_base_0.__index = _base_0 -- 264
	end -- 280
	setmetatable(_base_0, _parent_0.__base) -- 264
	_class_0 = setmetatable({ -- 264
		__init = function(self, ...) -- 264
			return _class_0.__parent.__init(self, ...) -- 264
		end, -- 264
		__base = _base_0, -- 264
		__name = "GroundRibs", -- 264
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
	GroundRibs = _class_0 -- 264
end -- 280
local Boot -- 285
do -- 285
	local _class_0 -- 285
	local _parent_0 = Food -- 285
	local _base_0 = { -- 285
		PrintName = "Boot", -- 287
		Model = Model("models/props_junk/Shoe001a.mdl"), -- 288
		HealthAdd = -4, -- 289
		Hunger = -5, -- 290
		Thirst = 40, -- 291
		Despair = 40, -- 292
		Description = "A dirty old boot, nearly fallen apart.", -- 294
		UseText = { -- 295
			"chews on a nasty boot!", -- 295
			"chokes on an old boot.", -- 296
			"gnaws a boot to shreds.", -- 297
			"shoves a boot in their mouth!", -- 298
			"eats a rotten leather boot.", -- 299
			"devours a dirty old boot!", -- 300
			"eats a boot." -- 301
		} -- 285
	} -- 285
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 302
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 285
			_base_0[_key_0] = _val_0 -- 285
		end -- 285
	end -- 302
	if _base_0.__index == nil then -- 285
		_base_0.__index = _base_0 -- 285
	end -- 302
	setmetatable(_base_0, _parent_0.__base) -- 285
	_class_0 = setmetatable({ -- 285
		__init = function(self, ...) -- 285
			return _class_0.__parent.__init(self, ...) -- 285
		end, -- 285
		__base = _base_0, -- 285
		__name = "Boot", -- 285
		__parent = _parent_0 -- 285
	}, { -- 285
		__index = function(cls, name) -- 285
			local val = rawget(_base_0, name) -- 285
			if val == nil then -- 285
				local parent = rawget(cls, "__parent") -- 285
				if parent then -- 285
					return parent[name] -- 285
				end -- 285
			else -- 285
				return val -- 285
			end -- 285
		end, -- 285
		__call = function(cls, ...) -- 285
			local _self_0 = setmetatable({ }, _base_0) -- 285
			cls.__init(_self_0, ...) -- 285
			return _self_0 -- 285
		end -- 285
	}) -- 285
	_base_0.__class = _class_0 -- 285
	if _parent_0.__inherited then -- 285
		_parent_0.__inherited(_parent_0, _class_0) -- 285
	end -- 285
	Boot = _class_0 -- 285
end -- 302
local BleachedMelon -- 304
do -- 304
	local _class_0 -- 304
	local _parent_0 = Food -- 304
	local _base_0 = { -- 304
		PrintName = "Bleached Melon", -- 306
		Model = Model("models/props_junk/watermelon01_chunk01c.mdl"), -- 307
		HealthAdd = -3, -- 308
		Hunger = -15, -- 309
		Thirst = -4, -- 310
		Description = "This was covered in mold before, hopefully the chlorine got rid of it.", -- 312
		CookTime = 10, -- 313
		Price = 25, -- 315
		UseText = { -- 316
			"eats a melon.", -- 316
			"devours a chunk of melon.", -- 317
			"munches on a melon." -- 318
		} -- 304
	} -- 304
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 318
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 304
			_base_0[_key_0] = _val_0 -- 304
		end -- 304
	end -- 318
	if _base_0.__index == nil then -- 304
		_base_0.__index = _base_0 -- 304
	end -- 318
	setmetatable(_base_0, _parent_0.__base) -- 304
	_class_0 = setmetatable({ -- 304
		__init = function(self, ...) -- 304
			return _class_0.__parent.__init(self, ...) -- 304
		end, -- 304
		__base = _base_0, -- 304
		__name = "BleachedMelon", -- 304
		__parent = _parent_0 -- 304
	}, { -- 304
		__index = function(cls, name) -- 304
			local val = rawget(_base_0, name) -- 304
			if val == nil then -- 304
				local parent = rawget(cls, "__parent") -- 304
				if parent then -- 304
					return parent[name] -- 304
				end -- 304
			else -- 304
				return val -- 304
			end -- 304
		end, -- 304
		__call = function(cls, ...) -- 304
			local _self_0 = setmetatable({ }, _base_0) -- 304
			cls.__init(_self_0, ...) -- 304
			return _self_0 -- 304
		end -- 304
	}) -- 304
	_base_0.__class = _class_0 -- 304
	if _parent_0.__inherited then -- 304
		_parent_0.__inherited(_parent_0, _class_0) -- 304
	end -- 304
	BleachedMelon = _class_0 -- 304
end -- 318
local MoldMelon -- 322
do -- 322
	local _class_0 -- 322
	local _parent_0 = Food -- 322
	local _base_0 = { -- 322
		PrintName = "Mold Melon", -- 324
		Model = Model("models/props_junk/watermelon01_chunk01c.mdl"), -- 325
		HealthAdd = -10, -- 326
		Hunger = -6, -- 327
		Despair = 4, -- 328
		Description = "A pithy husk of fruit, fully colonized by white mold.", -- 330
		Price = 25, -- 332
		UseText = { -- 333
			"eats a moldy melon.", -- 333
			"devours a moldy chunk of melon.", -- 334
			"munches on a mold melon.", -- 335
			"feasts on a fungus fruit.", -- 336
			"tears into some mold melon.", -- 337
			"crunches up a mold melon.", -- 338
			"chows down on a mold melon." -- 339
		} -- 322
	} -- 322
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 340
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 322
			_base_0[_key_0] = _val_0 -- 322
		end -- 322
	end -- 340
	if _base_0.__index == nil then -- 322
		_base_0.__index = _base_0 -- 322
	end -- 340
	setmetatable(_base_0, _parent_0.__base) -- 322
	_class_0 = setmetatable({ -- 322
		__init = function(self, ...) -- 322
			return _class_0.__parent.__init(self, ...) -- 322
		end, -- 322
		__base = _base_0, -- 322
		__name = "MoldMelon", -- 322
		__parent = _parent_0 -- 322
	}, { -- 322
		__index = function(cls, name) -- 322
			local val = rawget(_base_0, name) -- 322
			if val == nil then -- 322
				local parent = rawget(cls, "__parent") -- 322
				if parent then -- 322
					return parent[name] -- 322
				end -- 322
			else -- 322
				return val -- 322
			end -- 322
		end, -- 322
		__call = function(cls, ...) -- 322
			local _self_0 = setmetatable({ }, _base_0) -- 322
			cls.__init(_self_0, ...) -- 322
			return _self_0 -- 322
		end -- 322
	}) -- 322
	_base_0.__class = _class_0 -- 322
	if _parent_0.__inherited then -- 322
		_parent_0.__inherited(_parent_0, _class_0) -- 322
	end -- 322
	MoldMelon = _class_0 -- 322
end -- 340
local DrinkFluid -- 342
do -- 342
	local _class_0 -- 342
	local _parent_0 = SOUND -- 342
	local _base_0 = { -- 342
		sound = (function() -- 343
			local _accum_0 = { } -- 343
			local _len_0 = 1 -- 343
			for i = 1, 2 do -- 343
				_accum_0[_len_0] = "npc/barnacle/barnacle_gulp" .. tostring(i) .. ".wav" -- 343
				_len_0 = _len_0 + 1 -- 343
			end -- 343
			return _accum_0 -- 343
		end)(), -- 344
		level = SNDLVL_65DB -- 342
	} -- 342
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 344
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 342
			_base_0[_key_0] = _val_0 -- 342
		end -- 342
	end -- 344
	if _base_0.__index == nil then -- 342
		_base_0.__index = _base_0 -- 342
	end -- 344
	setmetatable(_base_0, _parent_0.__base) -- 342
	_class_0 = setmetatable({ -- 342
		__init = function(self, ...) -- 342
			return _class_0.__parent.__init(self, ...) -- 342
		end, -- 342
		__base = _base_0, -- 342
		__name = "DrinkFluid", -- 342
		__parent = _parent_0 -- 342
	}, { -- 342
		__index = function(cls, name) -- 342
			local val = rawget(_base_0, name) -- 342
			if val == nil then -- 342
				local parent = rawget(cls, "__parent") -- 342
				if parent then -- 342
					return parent[name] -- 342
				end -- 342
			else -- 342
				return val -- 342
			end -- 342
		end, -- 342
		__call = function(cls, ...) -- 342
			local _self_0 = setmetatable({ }, _base_0) -- 342
			cls.__init(_self_0, ...) -- 342
			return _self_0 -- 342
		end -- 342
	}) -- 342
	_base_0.__class = _class_0 -- 342
	if _parent_0.__inherited then -- 342
		_parent_0.__inherited(_parent_0, _class_0) -- 342
	end -- 342
	DrinkFluid = _class_0 -- 342
end -- 344
local Drink -- 346
do -- 346
	local _class_0 -- 346
	local _parent_0 = Food -- 346
	local _base_0 = { -- 346
		PrintName = "Drink", -- 348
		Sound = "DrinkFluid" -- 346
	} -- 346
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 348
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 346
			_base_0[_key_0] = _val_0 -- 346
		end -- 346
	end -- 348
	if _base_0.__index == nil then -- 346
		_base_0.__index = _base_0 -- 346
	end -- 348
	setmetatable(_base_0, _parent_0.__base) -- 346
	_class_0 = setmetatable({ -- 346
		__init = function(self, ...) -- 346
			return _class_0.__parent.__init(self, ...) -- 346
		end, -- 346
		__base = _base_0, -- 346
		__name = "Drink", -- 346
		__parent = _parent_0 -- 346
	}, { -- 346
		__index = function(cls, name) -- 346
			local val = rawget(_base_0, name) -- 346
			if val == nil then -- 346
				local parent = rawget(cls, "__parent") -- 346
				if parent then -- 346
					return parent[name] -- 346
				end -- 346
			else -- 346
				return val -- 346
			end -- 346
		end, -- 346
		__call = function(cls, ...) -- 346
			local _self_0 = setmetatable({ }, _base_0) -- 346
			cls.__init(_self_0, ...) -- 346
			return _self_0 -- 346
		end -- 346
	}) -- 346
	_base_0.__class = _class_0 -- 346
	if _parent_0.__inherited then -- 346
		_parent_0.__inherited(_parent_0, _class_0) -- 346
	end -- 346
	Drink = _class_0 -- 346
end -- 348
local FearBeer -- 350
do -- 350
	local _class_0 -- 350
	local _parent_0 = Drink -- 350
	local _base_0 = { -- 350
		PrintName = "Fear Beer", -- 352
		Model = Model("models/props_junk/garbage_glassbottle001a.mdl"), -- 353
		Thirst = -20, -- 354
		Despair = -25, -- 355
		Description = "A bottle of foul off-yellow liquid.\n'BEER' is hand-written on the label.", -- 357
		Price = 60, -- 359
		TrashClass = "trash/bottle/fearbeer", -- 361
		ImpactThreshold = 256, -- 363
		UseText = { -- 364
			"chugs a fear beer.", -- 364
			"downs a bottle of piss beer.", -- 365
			"drinks a ratty bottle of brew.", -- 366
			"quaffs a beer and grimaces.", -- 367
			"takes a swig of fear beer and shivers.", -- 368
			"guzzles a fear beer.", -- 369
			"chokes down some piss beer." -- 370
		}, -- 373
		Initialize = function(self) -- 373
			_class_0.__parent.__base.Initialize(self) -- 374
			if SERVER then -- 375
				return self:PrecacheGibs() -- 375
			end -- 375
		end, -- 377
		OnTakeDamage = function(self, dmg) -- 377
			_class_0.__parent.__base.OnTakeDamage(self, dmg) -- 378
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH -- 379
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then -- 380
				self:Shatter(dmg:GetDamageForce()) -- 380
			end -- 380
			if attacker and IsValid(attacker) and attacker:IsPlayer() then -- 381
				if attacker:HasOddity(ODDITY_DELINQUENCY) then -- 382
					return attacker:AddDespair(-math.random(2, 4)) -- 383
				end -- 382
			end -- 381
		end, -- 385
		PhysicsCollide = function(self, data) -- 385
			_class_0.__parent.__base.PhysicsCollide(self, data) -- 386
			if CLIENT then -- 387
				return -- 387
			end -- 387
			if data.Speed > self.ImpactThreshold then -- 388
				if data.HitEntity and IsValid(data.HitEntity) then -- 389
					local attacker = self:GetNWEntity("evilrp_submitter") -- 390
					do -- 391
						local dmg = DamageInfo() -- 391
						dmg:SetDamage(10) -- 392
						if IsValid(attacker) then -- 393
							dmg:SetAttacker(attacker) -- 393
						end -- 393
						dmg:SetInflictor(self) -- 394
						dmg:SetDamageType(DMG_SLASH) -- 395
						dmg:SetDamagePosition(data.HitPos) -- 396
						data.HitEntity:TakeDamageInfo(dmg) -- 397
					end -- 391
				end -- 389
				local force = data.OurNewVelocity -- 398
				return self:Shatter(force) -- 399
			end -- 388
		end, -- 401
		Shatter = function(self, force) -- 401
			if self.broken then -- 402
				return -- 402
			end -- 402
			self.broken = true -- 403
			local pos = self:GetPos() -- 404
			local _list_0 = player.GetAll() -- 405
			for _index_0 = 1, #_list_0 do -- 405
				local ply = _list_0[_index_0] -- 405
				local _continue_0 = false -- 406
				repeat -- 406
					if not ply:HasOddity(ODDITY_DELINQUENCY) then -- 406
						_continue_0 = true -- 406
						break -- 406
					end -- 406
					if ply:CanSee(self) and ply:LookingInDirection(pos) then -- 407
						ply:AddDespair(-math.random(2, 4)) -- 408
					end -- 407
					_continue_0 = true -- 406
				until true -- 408
				if not _continue_0 then -- 408
					break -- 408
				end -- 408
			end -- 408
			do -- 409
				local ed = EffectData() -- 409
				ed:SetStart(pos) -- 410
				ed:SetOrigin(pos) -- 411
				ed:SetScale(8) -- 412
				util.Effect("GlassImpact", ed, true, true) -- 413
			end -- 409
			self:EmitSound("BottleSmash") -- 414
			self:GibBreakServer(force) -- 415
			return self:Remove() -- 416
		end -- 350
	} -- 350
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 416
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 350
			_base_0[_key_0] = _val_0 -- 350
		end -- 350
	end -- 416
	if _base_0.__index == nil then -- 350
		_base_0.__index = _base_0 -- 350
	end -- 416
	setmetatable(_base_0, _parent_0.__base) -- 350
	_class_0 = setmetatable({ -- 350
		__init = function(self, ...) -- 350
			return _class_0.__parent.__init(self, ...) -- 350
		end, -- 350
		__base = _base_0, -- 350
		__name = "FearBeer", -- 350
		__parent = _parent_0 -- 350
	}, { -- 350
		__index = function(cls, name) -- 350
			local val = rawget(_base_0, name) -- 350
			if val == nil then -- 350
				local parent = rawget(cls, "__parent") -- 350
				if parent then -- 350
					return parent[name] -- 350
				end -- 350
			else -- 350
				return val -- 350
			end -- 350
		end, -- 350
		__call = function(cls, ...) -- 350
			local _self_0 = setmetatable({ }, _base_0) -- 350
			cls.__init(_self_0, ...) -- 350
			return _self_0 -- 350
		end -- 350
	}) -- 350
	_base_0.__class = _class_0 -- 350
	if _parent_0.__inherited then -- 350
		_parent_0.__inherited(_parent_0, _class_0) -- 350
	end -- 350
	FearBeer = _class_0 -- 350
end -- 416
local SmearBeer -- 418
do -- 418
	local _class_0 -- 418
	local _parent_0 = Drink -- 418
	local _base_0 = { -- 418
		PrintName = "Smear Beer", -- 420
		Model = Model("models/props_junk/garbage_glassbottle003a.mdl"), -- 421
		Thirst = -25, -- 422
		Despair = -35, -- 423
		Description = "A bottle of cloudy, greyish red booze.\nThe label is obscured with a smear of old blood.", -- 425
		Price = 95, -- 427
		TrashClass = "trash/bottle", -- 429
		ImpactThreshold = 256, -- 431
		UseText = { -- 432
			"chugs a smear beer.", -- 432
			"downs a bottle of red brew.", -- 433
			"drinks a cloudy bottle of beer.", -- 434
			"quaffs a smear beer and shivers.", -- 435
			"takes a swig of smear beer.", -- 436
			"guzzles a bloody beer.", -- 437
			"nurses a bottle of blood beer." -- 438
		}, -- 441
		Initialize = function(self) -- 441
			_class_0.__parent.__base.Initialize(self) -- 442
			if SERVER then -- 443
				return self:PrecacheGibs() -- 443
			end -- 443
		end, -- 445
		OnTakeDamage = function(self, dmg) -- 445
			_class_0.__parent.__base.OnTakeDamage(self, dmg) -- 446
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH -- 447
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then -- 448
				self:Shatter(dmg:GetDamageForce()) -- 448
			end -- 448
			if attacker and IsValid(attacker) and attacker:IsPlayer() then -- 449
				if attacker:HasOddity(ODDITY_DELINQUENCY) then -- 450
					return attacker:AddDespair(-math.random(2, 4)) -- 451
				end -- 450
			end -- 449
		end, -- 453
		PhysicsCollide = function(self, data) -- 453
			_class_0.__parent.__base.PhysicsCollide(self, data) -- 454
			if CLIENT then -- 455
				return -- 455
			end -- 455
			if data.Speed > self.ImpactThreshold then -- 456
				if data.HitEntity and IsValid(data.HitEntity) then -- 457
					local attacker = self:GetNWEntity("evilrp_submitter") -- 458
					do -- 459
						local dmg = DamageInfo() -- 459
						dmg:SetDamage(10) -- 460
						if IsValid(attacker) then -- 461
							dmg:SetAttacker(attacker) -- 461
						end -- 461
						dmg:SetInflictor(self) -- 462
						dmg:SetDamageType(DMG_SLASH) -- 463
						dmg:SetDamagePosition(data.HitPos) -- 464
						data.HitEntity:TakeDamageInfo(dmg) -- 465
					end -- 459
				end -- 457
				local force = data.OurNewVelocity -- 466
				return self:Shatter(force) -- 467
			end -- 456
		end, -- 469
		Shatter = function(self, force) -- 469
			if self.broken then -- 470
				return -- 470
			end -- 470
			self.broken = true -- 471
			local pos = self:GetPos() -- 472
			local _list_0 = player.GetAll() -- 473
			for _index_0 = 1, #_list_0 do -- 473
				local ply = _list_0[_index_0] -- 473
				local _continue_0 = false -- 474
				repeat -- 474
					if not ply:HasOddity(ODDITY_DELINQUENCY) then -- 474
						_continue_0 = true -- 474
						break -- 474
					end -- 474
					if ply:CanSee(self) and ply:LookingInDirection(pos) then -- 475
						ply:AddDespair(-math.random(2, 4)) -- 476
					end -- 475
					_continue_0 = true -- 474
				until true -- 476
				if not _continue_0 then -- 476
					break -- 476
				end -- 476
			end -- 476
			do -- 477
				local ed = EffectData() -- 477
				ed:SetStart(pos) -- 478
				ed:SetOrigin(pos) -- 479
				ed:SetScale(8) -- 480
				util.Effect("GlassImpact", ed, true, true) -- 481
			end -- 477
			self:EmitSound("BottleSmash") -- 482
			self:GibBreakServer(force) -- 483
			return self:Remove() -- 484
		end -- 418
	} -- 418
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 484
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 418
			_base_0[_key_0] = _val_0 -- 418
		end -- 418
	end -- 484
	if _base_0.__index == nil then -- 418
		_base_0.__index = _base_0 -- 418
	end -- 484
	setmetatable(_base_0, _parent_0.__base) -- 418
	_class_0 = setmetatable({ -- 418
		__init = function(self, ...) -- 418
			return _class_0.__parent.__init(self, ...) -- 418
		end, -- 418
		__base = _base_0, -- 418
		__name = "SmearBeer", -- 418
		__parent = _parent_0 -- 418
	}, { -- 418
		__index = function(cls, name) -- 418
			local val = rawget(_base_0, name) -- 418
			if val == nil then -- 418
				local parent = rawget(cls, "__parent") -- 418
				if parent then -- 418
					return parent[name] -- 418
				end -- 418
			else -- 418
				return val -- 418
			end -- 418
		end, -- 418
		__call = function(cls, ...) -- 418
			local _self_0 = setmetatable({ }, _base_0) -- 418
			cls.__init(_self_0, ...) -- 418
			return _self_0 -- 418
		end -- 418
	}) -- 418
	_base_0.__class = _class_0 -- 418
	if _parent_0.__inherited then -- 418
		_parent_0.__inherited(_parent_0, _class_0) -- 418
	end -- 418
	SmearBeer = _class_0 -- 418
end -- 484
local Shake -- 486
do -- 486
	local _class_0 -- 486
	local _parent_0 = Drink -- 486
	local _base_0 = { -- 486
		PrintName = "Soylent Shake", -- 488
		Model = Model("models/props_junk/garbage_milkcarton001a.mdl"), -- 489
		Thirst = -40, -- 490
		Hunger = -40, -- 491
		Despair = 30, -- 492
		Description = "A jug full of partially blended human remains.\nIt's warm and chunky.", -- 494
		Price = 120, -- 496
		TrashClass = "trash/plastic/shake", -- 498
		UseText = { -- 499
			"chokes down a soylent shake.", -- 499
			"slurps up a soylent shake.", -- 500
			"swigs blended peoplemeat and shudders.", -- 501
			"struggles down a jug of human sludge.", -- 502
			"shoots back a bad protein shake.", -- 503
			"guzzles a meat smoothie.", -- 504
			"quaffs an entire soylent shake." -- 505
		} -- 486
	} -- 486
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 506
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 486
			_base_0[_key_0] = _val_0 -- 486
		end -- 486
	end -- 506
	if _base_0.__index == nil then -- 486
		_base_0.__index = _base_0 -- 486
	end -- 506
	setmetatable(_base_0, _parent_0.__base) -- 486
	_class_0 = setmetatable({ -- 486
		__init = function(self, ...) -- 486
			return _class_0.__parent.__init(self, ...) -- 486
		end, -- 486
		__base = _base_0, -- 486
		__name = "Shake", -- 486
		__parent = _parent_0 -- 486
	}, { -- 486
		__index = function(cls, name) -- 486
			local val = rawget(_base_0, name) -- 486
			if val == nil then -- 486
				local parent = rawget(cls, "__parent") -- 486
				if parent then -- 486
					return parent[name] -- 486
				end -- 486
			else -- 486
				return val -- 486
			end -- 486
		end, -- 486
		__call = function(cls, ...) -- 486
			local _self_0 = setmetatable({ }, _base_0) -- 486
			cls.__init(_self_0, ...) -- 486
			return _self_0 -- 486
		end -- 486
	}) -- 486
	_base_0.__class = _class_0 -- 486
	if _parent_0.__inherited then -- 486
		_parent_0.__inherited(_parent_0, _class_0) -- 486
	end -- 486
	Shake = _class_0 -- 486
end -- 506
local BootLeg -- 508
do -- 508
	local _class_0 -- 508
	local _parent_0 = Drink -- 508
	local _base_0 = { -- 508
		PrintName = "Bootleg", -- 510
		Model = Model("models/props_junk/garbage_plasticbottle003a.mdl"), -- 511
		Thirst = -40, -- 512
		Hunger = -5, -- 513
		Despair = -45, -- 514
		HealthAdd = -18, -- 515
		Description = "An old bootleg of a wasteland wine recipe that has been lost to time. \n Tales say that the wastelander with the original recipe burned it and killed himself.", -- 516
		Price = 250, -- 518
		CookTime = 15, -- 520
		TrashClass = "trash/plastic/twitchel", -- 523
		UseText = { -- 524
			"takes small swigs of the bootlegged wine, wincing in pain as the strong liquor trickles down and burns his scabbed and cut skin.", -- 524
			"tries to drink all of the bootlegged wine, before gasping heavily.", -- 525
			"breathes in before taking a massive swig of the bootlegged wine, grimacing upon burning his mouth." -- 526
		}, -- 529
		Eat = function(self, ply) -- 529
			_class_0.__parent.__base.Eat(self, ply) -- 530
			if CLIENT then -- 531
				return -- 531
			end -- 531
			local plyJob = RPExtraTeams[ply:Team()] -- 532
			if plyJob.category == "Wasteland" then -- 533
				ply:AddDespair(-55) -- 534
				ply:AddHunger(-15) -- 535
				ply:AddThirst(-48) -- 536
				return ply:TakeDamage(-5) -- 537
			end -- 533
		end -- 508
	} -- 508
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 541
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 508
			_base_0[_key_0] = _val_0 -- 508
		end -- 508
	end -- 541
	if _base_0.__index == nil then -- 508
		_base_0.__index = _base_0 -- 508
	end -- 541
	setmetatable(_base_0, _parent_0.__base) -- 508
	_class_0 = setmetatable({ -- 508
		__init = function(self, ...) -- 508
			return _class_0.__parent.__init(self, ...) -- 508
		end, -- 508
		__base = _base_0, -- 508
		__name = "BootLeg", -- 508
		__parent = _parent_0 -- 508
	}, { -- 508
		__index = function(cls, name) -- 508
			local val = rawget(_base_0, name) -- 508
			if val == nil then -- 508
				local parent = rawget(cls, "__parent") -- 508
				if parent then -- 508
					return parent[name] -- 508
				end -- 508
			else -- 508
				return val -- 508
			end -- 508
		end, -- 508
		__call = function(cls, ...) -- 508
			local _self_0 = setmetatable({ }, _base_0) -- 508
			cls.__init(_self_0, ...) -- 508
			return _self_0 -- 508
		end -- 508
	}) -- 508
	_base_0.__class = _class_0 -- 508
	if _parent_0.__inherited then -- 508
		_parent_0.__inherited(_parent_0, _class_0) -- 508
	end -- 508
	BootLeg = _class_0 -- 508
end -- 541
local Twitchel -- 543
do -- 543
	local _class_0 -- 543
	local _parent_0 = Drink -- 543
	local _base_0 = { -- 543
		PrintName = "Twitchel", -- 545
		Model = Model("models/props_junk/garbage_plasticbottle003a.mdl"), -- 546
		Thirst = -44, -- 547
		Hunger = 6, -- 548
		Despair = 6, -- 549
		Description = "A bottle of refreshingly lukewarm, cloudy green drink.", -- 551
		Price = 80, -- 553
		TrashClass = "trash/plastic/twitchel", -- 555
		UseText = { -- 556
			"necks a bottle of twitchel.", -- 556
			"can't get enough of that green stuff.", -- 557
			"sucks down a bottle of twitchel.", -- 558
			"sips up their twitchel.", -- 559
			"pours twitchel down their throat.", -- 560
			"drinks a bottle of twitchel.", -- 561
			"slurps up a green drink." -- 562
		} -- 543
	} -- 543
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 563
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 543
			_base_0[_key_0] = _val_0 -- 543
		end -- 543
	end -- 563
	if _base_0.__index == nil then -- 543
		_base_0.__index = _base_0 -- 543
	end -- 563
	setmetatable(_base_0, _parent_0.__base) -- 543
	_class_0 = setmetatable({ -- 543
		__init = function(self, ...) -- 543
			return _class_0.__parent.__init(self, ...) -- 543
		end, -- 543
		__base = _base_0, -- 543
		__name = "Twitchel", -- 543
		__parent = _parent_0 -- 543
	}, { -- 543
		__index = function(cls, name) -- 543
			local val = rawget(_base_0, name) -- 543
			if val == nil then -- 543
				local parent = rawget(cls, "__parent") -- 543
				if parent then -- 543
					return parent[name] -- 543
				end -- 543
			else -- 543
				return val -- 543
			end -- 543
		end, -- 543
		__call = function(cls, ...) -- 543
			local _self_0 = setmetatable({ }, _base_0) -- 543
			cls.__init(_self_0, ...) -- 543
			return _self_0 -- 543
		end -- 543
	}) -- 543
	_base_0.__class = _class_0 -- 543
	if _parent_0.__inherited then -- 543
		_parent_0.__inherited(_parent_0, _class_0) -- 543
	end -- 543
	Twitchel = _class_0 -- 543
end -- 563
local TakeMeds -- 565
do -- 565
	local _class_0 -- 565
	local _parent_0 = SOUND -- 565
	local _base_0 = { -- 565
		sound = (function() -- 566
			local _accum_0 = { } -- 566
			local _len_0 = 1 -- 566
			for i = 1, 3 do -- 566
				_accum_0[_len_0] = "npc/zombie/zombie_pain" .. tostring(i) .. ".wav" -- 566
				_len_0 = _len_0 + 1 -- 566
			end -- 566
			return _accum_0 -- 566
		end)() -- 565
	} -- 565
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 566
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 565
			_base_0[_key_0] = _val_0 -- 565
		end -- 565
	end -- 566
	if _base_0.__index == nil then -- 565
		_base_0.__index = _base_0 -- 565
	end -- 566
	setmetatable(_base_0, _parent_0.__base) -- 565
	_class_0 = setmetatable({ -- 565
		__init = function(self, ...) -- 565
			return _class_0.__parent.__init(self, ...) -- 565
		end, -- 565
		__base = _base_0, -- 565
		__name = "TakeMeds", -- 565
		__parent = _parent_0 -- 565
	}, { -- 565
		__index = function(cls, name) -- 565
			local val = rawget(_base_0, name) -- 565
			if val == nil then -- 565
				local parent = rawget(cls, "__parent") -- 565
				if parent then -- 565
					return parent[name] -- 565
				end -- 565
			else -- 565
				return val -- 565
			end -- 565
		end, -- 565
		__call = function(cls, ...) -- 565
			local _self_0 = setmetatable({ }, _base_0) -- 565
			cls.__init(_self_0, ...) -- 565
			return _self_0 -- 565
		end -- 565
	}) -- 565
	_base_0.__class = _class_0 -- 565
	if _parent_0.__inherited then -- 565
		_parent_0.__inherited(_parent_0, _class_0) -- 565
	end -- 565
	TakeMeds = _class_0 -- 565
end -- 566
local Medicine -- 568
do -- 568
	local _class_0 -- 568
	local _parent_0 = Food -- 568
	local _base_0 = { -- 568
		PrintName = "Medicine", -- 570
		Sound = "TakeMeds" -- 568
	} -- 568
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 570
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 568
			_base_0[_key_0] = _val_0 -- 568
		end -- 568
	end -- 570
	if _base_0.__index == nil then -- 568
		_base_0.__index = _base_0 -- 568
	end -- 570
	setmetatable(_base_0, _parent_0.__base) -- 568
	_class_0 = setmetatable({ -- 568
		__init = function(self, ...) -- 568
			return _class_0.__parent.__init(self, ...) -- 568
		end, -- 568
		__base = _base_0, -- 568
		__name = "Medicine", -- 568
		__parent = _parent_0 -- 568
	}, { -- 568
		__index = function(cls, name) -- 568
			local val = rawget(_base_0, name) -- 568
			if val == nil then -- 568
				local parent = rawget(cls, "__parent") -- 568
				if parent then -- 568
					return parent[name] -- 568
				end -- 568
			else -- 568
				return val -- 568
			end -- 568
		end, -- 568
		__call = function(cls, ...) -- 568
			local _self_0 = setmetatable({ }, _base_0) -- 568
			cls.__init(_self_0, ...) -- 568
			return _self_0 -- 568
		end -- 568
	}) -- 568
	_base_0.__class = _class_0 -- 568
	if _parent_0.__inherited then -- 568
		_parent_0.__inherited(_parent_0, _class_0) -- 568
	end -- 568
	Medicine = _class_0 -- 568
end -- 570
local Pills -- 572
do -- 572
	local _class_0 -- 572
	local _parent_0 = Medicine -- 572
	local _base_0 = { -- 572
		PrintName = "Pills", -- 574
		Model = Model("models/props_lab/jar01b.mdl"), -- 575
		HealthAdd = function(self) -- 575
			return math.random(-15, -30) -- 575
		end, -- 576
		Hunger = function(self) -- 576
			return math.random(30, 50) -- 576
		end, -- 577
		Thirst = function(self) -- 577
			return math.random(30, 60) -- 577
		end, -- 578
		Despair = function(self) -- 578
			return math.random(-60, -100) -- 578
		end, -- 580
		Description = "A white plastic bottle, full of random pills.", -- 582
		Price = 125, -- 584
		TrashClass = "trash/plastic/pills", -- 586
		UseText = { -- 587
			"throws a mess of pills into eir mouth.", -- 587
			"consumes the whole contents of a pill bottle.", -- 588
			"devours handfuls of scary-looking pills.", -- 589
			"chokes down some strange pills.", -- 590
			"takes their medicine, like a good citizen should.", -- 591
			"swallows a mouthful of pills.", -- 592
			"takes an excessive dose of colorful pills.", -- 593
			"tosses back an entire bottle of pills.", -- 594
			"throws back a bottle of mystery pills." -- 595
		} -- 572
	} -- 572
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 596
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 572
			_base_0[_key_0] = _val_0 -- 572
		end -- 572
	end -- 596
	if _base_0.__index == nil then -- 572
		_base_0.__index = _base_0 -- 572
	end -- 596
	setmetatable(_base_0, _parent_0.__base) -- 572
	_class_0 = setmetatable({ -- 572
		__init = function(self, ...) -- 572
			return _class_0.__parent.__init(self, ...) -- 572
		end, -- 572
		__base = _base_0, -- 572
		__name = "Pills", -- 572
		__parent = _parent_0 -- 572
	}, { -- 572
		__index = function(cls, name) -- 572
			local val = rawget(_base_0, name) -- 572
			if val == nil then -- 572
				local parent = rawget(cls, "__parent") -- 572
				if parent then -- 572
					return parent[name] -- 572
				end -- 572
			else -- 572
				return val -- 572
			end -- 572
		end, -- 572
		__call = function(cls, ...) -- 572
			local _self_0 = setmetatable({ }, _base_0) -- 572
			cls.__init(_self_0, ...) -- 572
			return _self_0 -- 572
		end -- 572
	}) -- 572
	_base_0.__class = _class_0 -- 572
	if _parent_0.__inherited then -- 572
		_parent_0.__inherited(_parent_0, _class_0) -- 572
	end -- 572
	Pills = _class_0 -- 572
end -- 596
local TimeGas -- 598
do -- 598
	local _class_0 -- 598
	local _parent_0 = Medicine -- 598
	local _base_0 = { -- 598
		PrintName = "Time Gas", -- 600
		Model = Model("models/props_wasteland/prison_sinkchunk001e.mdl"), -- 601
		Sound = (function() -- 601
			local _accum_0 = { } -- 601
			local _len_0 = 1 -- 601
			for i = 2, 3 do -- 601
				_accum_0[_len_0] = "npc/fast_zombie/idle" .. tostring(i) -- 601
				_len_0 = _len_0 + 1 -- 601
			end -- 601
			return _accum_0 -- 601
		end)(), -- 602
		AddHealth = function(self) -- 602
			return math.random(20, 40) -- 602
		end, -- 603
		Hunger = function(self) -- 603
			return math.random(10, 20) -- 603
		end, -- 604
		Thirst = function(self) -- 604
			return math.random(20, 30) -- 604
		end, -- 605
		Despair = function(self) -- 605
			return math.random(0, 10) -- 605
		end, -- 607
		Description = "An inhaler of time acceleration gas.\nSpeeds up healing, and dying.", -- 609
		Price = 100, -- 611
		TrashClass = "trash/inhaler", -- 613
		UseText = { -- 614
			"breathes in some time gas.", -- 614
			"huffs a healing gas.", -- 615
			"isn't yet tired of the time gas.", -- 616
			"inhales a big cloud of time gas.", -- 617
			"takes a deep breath of time gas.", -- 618
			"drags in a lungful of time gas.", -- 619
			"sniffs up a cloud of time gas.", -- 620
			"huffs time gas from the rusty inhaler." -- 621
		} -- 598
	} -- 598
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 622
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 598
			_base_0[_key_0] = _val_0 -- 598
		end -- 598
	end -- 622
	if _base_0.__index == nil then -- 598
		_base_0.__index = _base_0 -- 598
	end -- 622
	setmetatable(_base_0, _parent_0.__base) -- 598
	_class_0 = setmetatable({ -- 598
		__init = function(self, ...) -- 598
			return _class_0.__parent.__init(self, ...) -- 598
		end, -- 598
		__base = _base_0, -- 598
		__name = "TimeGas", -- 598
		__parent = _parent_0 -- 598
	}, { -- 598
		__index = function(cls, name) -- 598
			local val = rawget(_base_0, name) -- 598
			if val == nil then -- 598
				local parent = rawget(cls, "__parent") -- 598
				if parent then -- 598
					return parent[name] -- 598
				end -- 598
			else -- 598
				return val -- 598
			end -- 598
		end, -- 598
		__call = function(cls, ...) -- 598
			local _self_0 = setmetatable({ }, _base_0) -- 598
			cls.__init(_self_0, ...) -- 598
			return _self_0 -- 598
		end -- 598
	}) -- 598
	_base_0.__class = _class_0 -- 598
	if _parent_0.__inherited then -- 598
		_parent_0.__inherited(_parent_0, _class_0) -- 598
	end -- 598
	TimeGas = _class_0 -- 598
end -- 622
local Bleach -- 624
do -- 624
	local _class_0 -- 624
	local _parent_0 = Medicine -- 624
	local _base_0 = { -- 624
		PrintName = "Chlorine", -- 626
		Model = Model("models/props_junk/garbage_plasticbottle002a.mdl"), -- 627
		Sound = "DrinkFluid", -- 629
		Description = "Do NOT even think about drinking this. \n Last guy who tried couldn't even finish it before falling over.", -- 630
		HealthAdd = -50, -- 631
		Hunger = 40, -- 632
		Thirst = -40, -- 633
		Despair = { -- 635
			Description = "A jug full of bleach." -- 635
		}, -- 636
		Price = 100, -- 638
		TrashClass = "trash/plastic/bleach", -- 640
		UseText = { -- 641
			"drinks bleach.", -- 641
			"chugs an entire fucking jug of chlorine.", -- 642
			"unscrews a jug of bleach and pours it down the hatch.", -- 643
			"chokes down gulp after gulp of chlorine bleach." -- 644
		} -- 624
	} -- 624
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 645
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 624
			_base_0[_key_0] = _val_0 -- 624
		end -- 624
	end -- 645
	if _base_0.__index == nil then -- 624
		_base_0.__index = _base_0 -- 624
	end -- 645
	setmetatable(_base_0, _parent_0.__base) -- 624
	_class_0 = setmetatable({ -- 624
		__init = function(self, ...) -- 624
			return _class_0.__parent.__init(self, ...) -- 624
		end, -- 624
		__base = _base_0, -- 624
		__name = "Bleach", -- 624
		__parent = _parent_0 -- 624
	}, { -- 624
		__index = function(cls, name) -- 624
			local val = rawget(_base_0, name) -- 624
			if val == nil then -- 624
				local parent = rawget(cls, "__parent") -- 624
				if parent then -- 624
					return parent[name] -- 624
				end -- 624
			else -- 624
				return val -- 624
			end -- 624
		end, -- 624
		__call = function(cls, ...) -- 624
			local _self_0 = setmetatable({ }, _base_0) -- 624
			cls.__init(_self_0, ...) -- 624
			return _self_0 -- 624
		end -- 624
	}) -- 624
	_base_0.__class = _class_0 -- 624
	if _parent_0.__inherited then -- 624
		_parent_0.__inherited(_parent_0, _class_0) -- 624
	end -- 624
	Bleach = _class_0 -- 624
end -- 645
local Ambrosia -- 647
do -- 647
	local _class_0 -- 647
	local _parent_0 = Food -- 647
	local _base_0 = { -- 647
		PrintName = "Ambrosia", -- 649
		Model = Model("models/props_lab/cactus.mdl"), -- 650
		Hunger = -100, -- 651
		Thirst = -100, -- 652
		Despair = -100, -- 653
		HealthAdd = 100, -- 654
		Description = "A food made for gods.", -- 655
		RotTime = 0, -- 657
		UseText = { -- 658
			"indulges in some ambrosia." -- 658
		}, -- 661
		Precursor = { -- 662
			biomass = 20, -- 662
			wood = 20, -- 663
			metal = 20, -- 664
			polymer = 20 -- 665
		}, -- 667
		Eat = function(self, ply) -- 667
			_class_0.__parent.__base.Eat(self, ply) -- 668
			if CLIENT then -- 669
				return -- 669
			end -- 669
			return ply:AddStemCells(5) -- 670
		end -- 647
	} -- 647
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 670
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 647
			_base_0[_key_0] = _val_0 -- 647
		end -- 647
	end -- 670
	if _base_0.__index == nil then -- 647
		_base_0.__index = _base_0 -- 647
	end -- 670
	setmetatable(_base_0, _parent_0.__base) -- 647
	_class_0 = setmetatable({ -- 647
		__init = function(self, ...) -- 647
			return _class_0.__parent.__init(self, ...) -- 647
		end, -- 647
		__base = _base_0, -- 647
		__name = "Ambrosia", -- 647
		__parent = _parent_0 -- 647
	}, { -- 647
		__index = function(cls, name) -- 647
			local val = rawget(_base_0, name) -- 647
			if val == nil then -- 647
				local parent = rawget(cls, "__parent") -- 647
				if parent then -- 647
					return parent[name] -- 647
				end -- 647
			else -- 647
				return val -- 647
			end -- 647
		end, -- 647
		__call = function(cls, ...) -- 647
			local _self_0 = setmetatable({ }, _base_0) -- 647
			cls.__init(_self_0, ...) -- 647
			return _self_0 -- 647
		end -- 647
	}) -- 647
	_base_0.__class = _class_0 -- 647
	if _parent_0.__inherited then -- 647
		_parent_0.__inherited(_parent_0, _class_0) -- 647
	end -- 647
	Ambrosia = _class_0 -- 647
end -- 670
local Chow -- 672
do -- 672
	local _class_0 -- 672
	local _parent_0 = Food -- 672
	local _base_0 = { -- 672
		PrintName = "Wasteland Chow", -- 674
		Model = Model("models/props_junk/garbage_takeoutcarton001a.mdl"), -- 675
		Hunger = -20, -- 676
		Thirst = -6, -- 677
		Despair = 10, -- 678
		Description = "An amalgamation of entrails, bones, and rotten flesh with a side of maggots. \n Wastelanders love it!", -- 679
		RotTime = 0, -- 680
		CookTime = 10, -- 682
		UseText = { -- 683
			"begrudgingly eats some wasteland chow.", -- 683
			"puts some chow in their mouth while gagging.", -- 684
			"eats some wasteland chow, then spits out the tiny bones.", -- 685
			"chomps on some wasteland chow.", -- 686
			"forces down some wasteland chow down their throat.", -- 687
			"eats some chow, secretly enjoying it" -- 688
		}, -- 691
		Eat = function(self, ply) -- 691
			_class_0.__parent.__base.Eat(self, ply) -- 692
			if CLIENT then -- 693
				return -- 693
			end -- 693
			local plyJob = RPExtraTeams[ply:Team()] -- 694
			if plyJob.category == "Wasteland" then -- 695
				ply:AddDespair(-30) -- 696
				ply:AddHunger(-30) -- 697
				return ply:AddThirst(-10) -- 698
			end -- 695
		end -- 672
	} -- 672
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 698
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 672
			_base_0[_key_0] = _val_0 -- 672
		end -- 672
	end -- 698
	if _base_0.__index == nil then -- 672
		_base_0.__index = _base_0 -- 672
	end -- 698
	setmetatable(_base_0, _parent_0.__base) -- 672
	_class_0 = setmetatable({ -- 672
		__init = function(self, ...) -- 672
			return _class_0.__parent.__init(self, ...) -- 672
		end, -- 672
		__base = _base_0, -- 672
		__name = "Chow", -- 672
		__parent = _parent_0 -- 672
	}, { -- 672
		__index = function(cls, name) -- 672
			local val = rawget(_base_0, name) -- 672
			if val == nil then -- 672
				local parent = rawget(cls, "__parent") -- 672
				if parent then -- 672
					return parent[name] -- 672
				end -- 672
			else -- 672
				return val -- 672
			end -- 672
		end, -- 672
		__call = function(cls, ...) -- 672
			local _self_0 = setmetatable({ }, _base_0) -- 672
			cls.__init(_self_0, ...) -- 672
			return _self_0 -- 672
		end -- 672
	}) -- 672
	_base_0.__class = _class_0 -- 672
	if _parent_0.__inherited then -- 672
		_parent_0.__inherited(_parent_0, _class_0) -- 672
	end -- 672
	Chow = _class_0 -- 672
end -- 698
local SloppyRibs -- 701
do -- 701
	local _class_0 -- 701
	local _parent_0 = Food -- 701
	local _base_0 = { -- 701
		PrintName = "Sloppy Ribs", -- 703
		Model = Model("models/vel/evilwar/sloppyribs.mdl"), -- 704
		Hunger = -28, -- 705
		Thirst = -4, -- 706
		Despair = -15, -- 707
		Description = "Fresh ribs from an unknown source, now glazed in slop! \n They look delicious.", -- 709
		CookTime = 10, -- 711
		Price = 115, -- 712
		UseText = { -- 713
			"devours all of the flesh and slop on the rib, then throws it away.", -- 713
			"munches on the rib, and then licks the glaze off his hands.", -- 714
			"gobbles down the rib, and spits out the bone." -- 715
		} -- 701
	} -- 701
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 715
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 701
			_base_0[_key_0] = _val_0 -- 701
		end -- 701
	end -- 715
	if _base_0.__index == nil then -- 701
		_base_0.__index = _base_0 -- 701
	end -- 715
	setmetatable(_base_0, _parent_0.__base) -- 701
	_class_0 = setmetatable({ -- 701
		__init = function(self, ...) -- 701
			return _class_0.__parent.__init(self, ...) -- 701
		end, -- 701
		__base = _base_0, -- 701
		__name = "SloppyRibs", -- 701
		__parent = _parent_0 -- 701
	}, { -- 701
		__index = function(cls, name) -- 701
			local val = rawget(_base_0, name) -- 701
			if val == nil then -- 701
				local parent = rawget(cls, "__parent") -- 701
				if parent then -- 701
					return parent[name] -- 701
				end -- 701
			else -- 701
				return val -- 701
			end -- 701
		end, -- 701
		__call = function(cls, ...) -- 701
			local _self_0 = setmetatable({ }, _base_0) -- 701
			cls.__init(_self_0, ...) -- 701
			return _self_0 -- 701
		end -- 701
	}) -- 701
	_base_0.__class = _class_0 -- 701
	if _parent_0.__inherited then -- 701
		_parent_0.__inherited(_parent_0, _class_0) -- 701
	end -- 701
	SloppyRibs = _class_0 -- 701
end -- 715
local EyeballNoodles -- 718
do -- 718
	local _class_0 -- 718
	local _parent_0 = Food -- 718
	local _base_0 = { -- 718
		PrintName = "Eyeball Noodles", -- 720
		Model = Model("models/vel/evilwar/eyenoodle.mdl"), -- 721
		Hunger = -40, -- 722
		Thirst = -20, -- 723
		Despair = -20, -- 724
		Description = "A traditional Lymphomian dish, usually served to go. \n The texture is an acquired taste.", -- 726
		CookTime = 8, -- 728
		Price = 130, -- 730
		UseText = { -- 731
			"slurps all of the noodles.", -- 731
			"slurps the noodles, gagging at the wet crunch of the eyeball.", -- 732
			"eats the noodles, and then spits out the eyeball.", -- 733
			"gags on the noodles, and then throws out the eyeball." -- 734
		} -- 718
	} -- 718
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 735
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 718
			_base_0[_key_0] = _val_0 -- 718
		end -- 718
	end -- 735
	if _base_0.__index == nil then -- 718
		_base_0.__index = _base_0 -- 718
	end -- 735
	setmetatable(_base_0, _parent_0.__base) -- 718
	_class_0 = setmetatable({ -- 718
		__init = function(self, ...) -- 718
			return _class_0.__parent.__init(self, ...) -- 718
		end, -- 718
		__base = _base_0, -- 718
		__name = "EyeballNoodles", -- 718
		__parent = _parent_0 -- 718
	}, { -- 718
		__index = function(cls, name) -- 718
			local val = rawget(_base_0, name) -- 718
			if val == nil then -- 718
				local parent = rawget(cls, "__parent") -- 718
				if parent then -- 718
					return parent[name] -- 718
				end -- 718
			else -- 718
				return val -- 718
			end -- 718
		end, -- 718
		__call = function(cls, ...) -- 718
			local _self_0 = setmetatable({ }, _base_0) -- 718
			cls.__init(_self_0, ...) -- 718
			return _self_0 -- 718
		end -- 718
	}) -- 718
	_base_0.__class = _class_0 -- 718
	if _parent_0.__inherited then -- 718
		_parent_0.__inherited(_parent_0, _class_0) -- 718
	end -- 718
	EyeballNoodles = _class_0 -- 718
end -- 735
local PaperMache -- 737
do -- 737
	local _class_0 -- 737
	local _parent_0 = Food -- 737
	local _base_0 = { -- 737
		PrintName = "Paper Mache", -- 739
		Model = Model("models/props_junk/garbage_bag001a.mdl"), -- 740
		Hunger = -10, -- 741
		Thirst = -10, -- 742
		Despair = 15, -- 743
		Description = "An old crumpled paper. \n now it's watered down into a little ball.", -- 745
		CookTime = 3, -- 747
		Price = 30, -- 749
		UseText = { -- 750
			"stoves the paper mache into his mouth, gagging horribly.", -- 750
			"forces the paper down his throat, throwing up slightly", -- 751
			"rips apart the paper mache, eating small pieces at a time.", -- 752
			"looks miserable trying to eat watered down paper." -- 753
		} -- 737
	} -- 737
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 753
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 737
			_base_0[_key_0] = _val_0 -- 737
		end -- 737
	end -- 753
	if _base_0.__index == nil then -- 737
		_base_0.__index = _base_0 -- 737
	end -- 753
	setmetatable(_base_0, _parent_0.__base) -- 737
	_class_0 = setmetatable({ -- 737
		__init = function(self, ...) -- 737
			return _class_0.__parent.__init(self, ...) -- 737
		end, -- 737
		__base = _base_0, -- 737
		__name = "PaperMache", -- 737
		__parent = _parent_0 -- 737
	}, { -- 737
		__index = function(cls, name) -- 737
			local val = rawget(_base_0, name) -- 737
			if val == nil then -- 737
				local parent = rawget(cls, "__parent") -- 737
				if parent then -- 737
					return parent[name] -- 737
				end -- 737
			else -- 737
				return val -- 737
			end -- 737
		end, -- 737
		__call = function(cls, ...) -- 737
			local _self_0 = setmetatable({ }, _base_0) -- 737
			cls.__init(_self_0, ...) -- 737
			return _self_0 -- 737
		end -- 737
	}) -- 737
	_base_0.__class = _class_0 -- 737
	if _parent_0.__inherited then -- 737
		_parent_0.__inherited(_parent_0, _class_0) -- 737
	end -- 737
	PaperMache = _class_0 -- 737
	return _class_0 -- 753
end -- 753
