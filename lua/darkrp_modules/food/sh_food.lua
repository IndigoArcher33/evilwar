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
		Hunger = -30, -- 167
		Thirst = -10, -- 168
		HealthAdd = 15, -- 169
		Description = "An artifical baby, born paralyzed below the eyes.\nIt will know nothing but fear and pain.", -- 171
		UseText = { -- 172
			"eats a living infant.", -- 172
			"chews the head off a live baby and drinks its blood.", -- 173
			"eats a baby alive.", -- 174
			"eats a live baby and tastes its tears.", -- 175
			"rips apart a living baby and eats the pieces.", -- 176
			"tears open a live baby and feeds on its entrails.", -- 177
			"eats a live baby as it cries silently." -- 178
		} -- 163
	} -- 163
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 179
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 163
			_base_0[_key_0] = _val_0 -- 163
		end -- 163
	end -- 179
	if _base_0.__index == nil then -- 163
		_base_0.__index = _base_0 -- 163
	end -- 179
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
end -- 179
local SoyLoaf -- 181
do -- 181
	local _class_0 -- 181
	local _parent_0 = Food -- 181
	local _base_0 = { -- 181
		PrintName = "Soylent Loaf", -- 183
		Model = Model("models/gibs/antlion_gib_small_3.mdl"), -- 184
		Hunger = -15, -- 185
		Thirst = 3, -- 186
		Despair = 5, -- 187
		Description = "A chewy loaf of dried Long Pig byproducts.\nLoathsome food, but it'll keep for a century.", -- 189
		Price = 20, -- 191
		UseText = { -- 192
			"gnaws at a soylent loaf.", -- 192
			"chokes down a soylent loaf.", -- 193
			"struggles to eat a soylent loaf.", -- 194
			"chomps on a loaf of mummified meat.", -- 195
			"grinds their teeth on a soylent loaf.", -- 196
			"chews off a chunk from a soylent loaf.", -- 197
			"eats some soylent, like a good citizen should." -- 198
		} -- 181
	} -- 181
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 199
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 181
			_base_0[_key_0] = _val_0 -- 181
		end -- 181
	end -- 199
	if _base_0.__index == nil then -- 181
		_base_0.__index = _base_0 -- 181
	end -- 199
	setmetatable(_base_0, _parent_0.__base) -- 181
	_class_0 = setmetatable({ -- 181
		__init = function(self, ...) -- 181
			return _class_0.__parent.__init(self, ...) -- 181
		end, -- 181
		__base = _base_0, -- 181
		__name = "SoyLoaf", -- 181
		__parent = _parent_0 -- 181
	}, { -- 181
		__index = function(cls, name) -- 181
			local val = rawget(_base_0, name) -- 181
			if val == nil then -- 181
				local parent = rawget(cls, "__parent") -- 181
				if parent then -- 181
					return parent[name] -- 181
				end -- 181
			else -- 181
				return val -- 181
			end -- 181
		end, -- 181
		__call = function(cls, ...) -- 181
			local _self_0 = setmetatable({ }, _base_0) -- 181
			cls.__init(_self_0, ...) -- 181
			return _self_0 -- 181
		end -- 181
	}) -- 181
	_base_0.__class = _class_0 -- 181
	if _parent_0.__inherited then -- 181
		_parent_0.__inherited(_parent_0, _class_0) -- 181
	end -- 181
	SoyLoaf = _class_0 -- 181
end -- 199
local BootSoup -- 201
do -- 201
	local _class_0 -- 201
	local _parent_0 = Food -- 201
	local _base_0 = { -- 201
		PrintName = "Boot n' soup", -- 203
		Model = Model("models/props_c17/metalPot001a.mdl"), -- 204
		HealthAdd = -5, -- 205
		Hunger = -40, -- 206
		Thirst = -4, -- 207
		Despair = 25, -- 208
		Description = "Formerly only filled with slop, now comes with 'vegan-meat'!", -- 209
		CookTime = 13, -- 211
		Price = 20, -- 213
		UseText = { -- 214
			"drinks the soup slowly, but chokes on the 'vegan-meat' .", -- 214
			"miserably slurps the soup, spitting out small chunks of 'vegan-meat'.", -- 215
			"struggles to eat any of the soup and 'vegan-meat'." -- 216
		} -- 201
	} -- 201
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 216
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 201
			_base_0[_key_0] = _val_0 -- 201
		end -- 201
	end -- 216
	if _base_0.__index == nil then -- 201
		_base_0.__index = _base_0 -- 201
	end -- 216
	setmetatable(_base_0, _parent_0.__base) -- 201
	_class_0 = setmetatable({ -- 201
		__init = function(self, ...) -- 201
			return _class_0.__parent.__init(self, ...) -- 201
		end, -- 201
		__base = _base_0, -- 201
		__name = "BootSoup", -- 201
		__parent = _parent_0 -- 201
	}, { -- 201
		__index = function(cls, name) -- 201
			local val = rawget(_base_0, name) -- 201
			if val == nil then -- 201
				local parent = rawget(cls, "__parent") -- 201
				if parent then -- 201
					return parent[name] -- 201
				end -- 201
			else -- 201
				return val -- 201
			end -- 201
		end, -- 201
		__call = function(cls, ...) -- 201
			local _self_0 = setmetatable({ }, _base_0) -- 201
			cls.__init(_self_0, ...) -- 201
			return _self_0 -- 201
		end -- 201
	}) -- 201
	_base_0.__class = _class_0 -- 201
	if _parent_0.__inherited then -- 201
		_parent_0.__inherited(_parent_0, _class_0) -- 201
	end -- 201
	BootSoup = _class_0 -- 201
end -- 216
local MeatLoaf -- 218
do -- 218
	local _class_0 -- 218
	local _parent_0 = Food -- 218
	local _base_0 = { -- 218
		PrintName = "Meatloaf", -- 220
		Model = Model("models/props_junk/garbage_takeoutcarton001a.mdl"), -- 221
		Hunger = -40, -- 222
		Thirst = -9, -- 223
		Despair = 4, -- 224
		Description = "Delicious meatloaf, a favorite of many soldiers.", -- 225
		CookTime = 15, -- 227
		Price = 100, -- 230
		Eat = function(self, ply) -- 230
			_class_0.__parent.__base.Eat(self, ply) -- 231
			if CLIENT then -- 232
				return -- 232
			end -- 232
			return ply:AddStemCells(1) -- 233
		end, -- 235
		UseText = { -- 236
			"Devours their meatloaf.", -- 236
			"chokes while consuming slop.", -- 237
			"struggles to eat a slop bowl.", -- 238
			"chomps on some slop.", -- 239
			"begrudgingly eats a spoonful of slop.", -- 240
			"consumes slop." -- 241
		} -- 218
	} -- 218
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 241
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 218
			_base_0[_key_0] = _val_0 -- 218
		end -- 218
	end -- 241
	if _base_0.__index == nil then -- 218
		_base_0.__index = _base_0 -- 218
	end -- 241
	setmetatable(_base_0, _parent_0.__base) -- 218
	_class_0 = setmetatable({ -- 218
		__init = function(self, ...) -- 218
			return _class_0.__parent.__init(self, ...) -- 218
		end, -- 218
		__base = _base_0, -- 218
		__name = "MeatLoaf", -- 218
		__parent = _parent_0 -- 218
	}, { -- 218
		__index = function(cls, name) -- 218
			local val = rawget(_base_0, name) -- 218
			if val == nil then -- 218
				local parent = rawget(cls, "__parent") -- 218
				if parent then -- 218
					return parent[name] -- 218
				end -- 218
			else -- 218
				return val -- 218
			end -- 218
		end, -- 218
		__call = function(cls, ...) -- 218
			local _self_0 = setmetatable({ }, _base_0) -- 218
			cls.__init(_self_0, ...) -- 218
			return _self_0 -- 218
		end -- 218
	}) -- 218
	_base_0.__class = _class_0 -- 218
	if _parent_0.__inherited then -- 218
		_parent_0.__inherited(_parent_0, _class_0) -- 218
	end -- 218
	MeatLoaf = _class_0 -- 218
end -- 241
local SlopBowl -- 244
do -- 244
	local _class_0 -- 244
	local _parent_0 = Food -- 244
	local _base_0 = { -- 244
		PrintName = "Slop Bowl", -- 246
		Model = Model("models/props_c17/metalPot001a.mdl"), -- 247
		Hunger = -30, -- 248
		Thirst = 4, -- 249
		Despair = 15, -- 250
		Description = "A festering pot that oozes a disgusting liquid.\nIt seems oddly comforting.", -- 251
		CookTime = 10, -- 253
		Price = 20, -- 255
		UseText = { -- 256
			"enjoys the slop.", -- 256
			"chokes while consuming slop.", -- 257
			"struggles to eat a slop bowl.", -- 258
			"chomps on some slop.", -- 259
			"begrudgingly eats a spoonful of slop.", -- 260
			"consumes slop." -- 261
		} -- 244
	} -- 244
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 261
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 244
			_base_0[_key_0] = _val_0 -- 244
		end -- 244
	end -- 261
	if _base_0.__index == nil then -- 244
		_base_0.__index = _base_0 -- 244
	end -- 261
	setmetatable(_base_0, _parent_0.__base) -- 244
	_class_0 = setmetatable({ -- 244
		__init = function(self, ...) -- 244
			return _class_0.__parent.__init(self, ...) -- 244
		end, -- 244
		__base = _base_0, -- 244
		__name = "SlopBowl", -- 244
		__parent = _parent_0 -- 244
	}, { -- 244
		__index = function(cls, name) -- 244
			local val = rawget(_base_0, name) -- 244
			if val == nil then -- 244
				local parent = rawget(cls, "__parent") -- 244
				if parent then -- 244
					return parent[name] -- 244
				end -- 244
			else -- 244
				return val -- 244
			end -- 244
		end, -- 244
		__call = function(cls, ...) -- 244
			local _self_0 = setmetatable({ }, _base_0) -- 244
			cls.__init(_self_0, ...) -- 244
			return _self_0 -- 244
		end -- 244
	}) -- 244
	_base_0.__class = _class_0 -- 244
	if _parent_0.__inherited then -- 244
		_parent_0.__inherited(_parent_0, _class_0) -- 244
	end -- 244
	SlopBowl = _class_0 -- 244
end -- 261
local Boot -- 264
do -- 264
	local _class_0 -- 264
	local _parent_0 = Food -- 264
	local _base_0 = { -- 264
		PrintName = "Boot", -- 266
		Model = Model("models/props_junk/Shoe001a.mdl"), -- 267
		AddHealth = -4, -- 268
		Hunger = -5, -- 269
		Thirst = 40, -- 270
		Despair = 40, -- 271
		Description = "A dirty old boot, nearly fallen apart.", -- 273
		UseText = { -- 274
			"chews on a nasty boot!", -- 274
			"chokes on an old boot.", -- 275
			"gnaws a boot to shreds.", -- 276
			"shoves a boot in their mouth!", -- 277
			"eats a rotten leather boot.", -- 278
			"devours a dirty old boot!", -- 279
			"eats a boot." -- 280
		} -- 264
	} -- 264
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 281
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 264
			_base_0[_key_0] = _val_0 -- 264
		end -- 264
	end -- 281
	if _base_0.__index == nil then -- 264
		_base_0.__index = _base_0 -- 264
	end -- 281
	setmetatable(_base_0, _parent_0.__base) -- 264
	_class_0 = setmetatable({ -- 264
		__init = function(self, ...) -- 264
			return _class_0.__parent.__init(self, ...) -- 264
		end, -- 264
		__base = _base_0, -- 264
		__name = "Boot", -- 264
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
	Boot = _class_0 -- 264
end -- 281
local BleachedMelon -- 283
do -- 283
	local _class_0 -- 283
	local _parent_0 = Food -- 283
	local _base_0 = { -- 283
		PrintName = "Bleached Melon", -- 285
		Model = Model("models/props_junk/watermelon01_chunk01c.mdl"), -- 286
		HealthAdd = -3, -- 287
		Hunger = -15, -- 288
		Thirst = -4, -- 289
		Description = "This was covered in mold before, but hopefully the chlorine got rid of it.", -- 291
		CookTime = 10, -- 292
		Price = 25, -- 294
		UseText = { -- 295
			"eats a melon.", -- 295
			"devours a chunk of melon.", -- 296
			"munches on a melon." -- 297
		} -- 283
	} -- 283
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 297
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 283
			_base_0[_key_0] = _val_0 -- 283
		end -- 283
	end -- 297
	if _base_0.__index == nil then -- 283
		_base_0.__index = _base_0 -- 283
	end -- 297
	setmetatable(_base_0, _parent_0.__base) -- 283
	_class_0 = setmetatable({ -- 283
		__init = function(self, ...) -- 283
			return _class_0.__parent.__init(self, ...) -- 283
		end, -- 283
		__base = _base_0, -- 283
		__name = "BleachedMelon", -- 283
		__parent = _parent_0 -- 283
	}, { -- 283
		__index = function(cls, name) -- 283
			local val = rawget(_base_0, name) -- 283
			if val == nil then -- 283
				local parent = rawget(cls, "__parent") -- 283
				if parent then -- 283
					return parent[name] -- 283
				end -- 283
			else -- 283
				return val -- 283
			end -- 283
		end, -- 283
		__call = function(cls, ...) -- 283
			local _self_0 = setmetatable({ }, _base_0) -- 283
			cls.__init(_self_0, ...) -- 283
			return _self_0 -- 283
		end -- 283
	}) -- 283
	_base_0.__class = _class_0 -- 283
	if _parent_0.__inherited then -- 283
		_parent_0.__inherited(_parent_0, _class_0) -- 283
	end -- 283
	BleachedMelon = _class_0 -- 283
end -- 297
local MoldMelon -- 301
do -- 301
	local _class_0 -- 301
	local _parent_0 = Food -- 301
	local _base_0 = { -- 301
		PrintName = "Mold Melon", -- 303
		Model = Model("models/props_junk/watermelon01_chunk01c.mdl"), -- 304
		HealthAdd = -10, -- 305
		Hunger = -6, -- 306
		Despair = 4, -- 307
		Description = "A pithy husk of fruit, fully colonized by white mold.", -- 309
		Price = 25, -- 311
		UseText = { -- 312
			"eats a moldy melon.", -- 312
			"devours a moldy chunk of melon.", -- 313
			"munches on a mold melon.", -- 314
			"feasts on a fungus fruit.", -- 315
			"tears into some mold melon.", -- 316
			"crunches up a mold melon.", -- 317
			"chows down on a mold melon." -- 318
		} -- 301
	} -- 301
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 319
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 301
			_base_0[_key_0] = _val_0 -- 301
		end -- 301
	end -- 319
	if _base_0.__index == nil then -- 301
		_base_0.__index = _base_0 -- 301
	end -- 319
	setmetatable(_base_0, _parent_0.__base) -- 301
	_class_0 = setmetatable({ -- 301
		__init = function(self, ...) -- 301
			return _class_0.__parent.__init(self, ...) -- 301
		end, -- 301
		__base = _base_0, -- 301
		__name = "MoldMelon", -- 301
		__parent = _parent_0 -- 301
	}, { -- 301
		__index = function(cls, name) -- 301
			local val = rawget(_base_0, name) -- 301
			if val == nil then -- 301
				local parent = rawget(cls, "__parent") -- 301
				if parent then -- 301
					return parent[name] -- 301
				end -- 301
			else -- 301
				return val -- 301
			end -- 301
		end, -- 301
		__call = function(cls, ...) -- 301
			local _self_0 = setmetatable({ }, _base_0) -- 301
			cls.__init(_self_0, ...) -- 301
			return _self_0 -- 301
		end -- 301
	}) -- 301
	_base_0.__class = _class_0 -- 301
	if _parent_0.__inherited then -- 301
		_parent_0.__inherited(_parent_0, _class_0) -- 301
	end -- 301
	MoldMelon = _class_0 -- 301
end -- 319
local DrinkFluid -- 321
do -- 321
	local _class_0 -- 321
	local _parent_0 = SOUND -- 321
	local _base_0 = { -- 321
		sound = (function() -- 322
			local _accum_0 = { } -- 322
			local _len_0 = 1 -- 322
			for i = 1, 2 do -- 322
				_accum_0[_len_0] = "npc/barnacle/barnacle_gulp" .. tostring(i) .. ".wav" -- 322
				_len_0 = _len_0 + 1 -- 322
			end -- 322
			return _accum_0 -- 322
		end)(), -- 323
		level = SNDLVL_65DB -- 321
	} -- 321
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 323
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 321
			_base_0[_key_0] = _val_0 -- 321
		end -- 321
	end -- 323
	if _base_0.__index == nil then -- 321
		_base_0.__index = _base_0 -- 321
	end -- 323
	setmetatable(_base_0, _parent_0.__base) -- 321
	_class_0 = setmetatable({ -- 321
		__init = function(self, ...) -- 321
			return _class_0.__parent.__init(self, ...) -- 321
		end, -- 321
		__base = _base_0, -- 321
		__name = "DrinkFluid", -- 321
		__parent = _parent_0 -- 321
	}, { -- 321
		__index = function(cls, name) -- 321
			local val = rawget(_base_0, name) -- 321
			if val == nil then -- 321
				local parent = rawget(cls, "__parent") -- 321
				if parent then -- 321
					return parent[name] -- 321
				end -- 321
			else -- 321
				return val -- 321
			end -- 321
		end, -- 321
		__call = function(cls, ...) -- 321
			local _self_0 = setmetatable({ }, _base_0) -- 321
			cls.__init(_self_0, ...) -- 321
			return _self_0 -- 321
		end -- 321
	}) -- 321
	_base_0.__class = _class_0 -- 321
	if _parent_0.__inherited then -- 321
		_parent_0.__inherited(_parent_0, _class_0) -- 321
	end -- 321
	DrinkFluid = _class_0 -- 321
end -- 323
local Drink -- 325
do -- 325
	local _class_0 -- 325
	local _parent_0 = Food -- 325
	local _base_0 = { -- 325
		PrintName = "Drink", -- 327
		Sound = "DrinkFluid" -- 325
	} -- 325
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 327
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 325
			_base_0[_key_0] = _val_0 -- 325
		end -- 325
	end -- 327
	if _base_0.__index == nil then -- 325
		_base_0.__index = _base_0 -- 325
	end -- 327
	setmetatable(_base_0, _parent_0.__base) -- 325
	_class_0 = setmetatable({ -- 325
		__init = function(self, ...) -- 325
			return _class_0.__parent.__init(self, ...) -- 325
		end, -- 325
		__base = _base_0, -- 325
		__name = "Drink", -- 325
		__parent = _parent_0 -- 325
	}, { -- 325
		__index = function(cls, name) -- 325
			local val = rawget(_base_0, name) -- 325
			if val == nil then -- 325
				local parent = rawget(cls, "__parent") -- 325
				if parent then -- 325
					return parent[name] -- 325
				end -- 325
			else -- 325
				return val -- 325
			end -- 325
		end, -- 325
		__call = function(cls, ...) -- 325
			local _self_0 = setmetatable({ }, _base_0) -- 325
			cls.__init(_self_0, ...) -- 325
			return _self_0 -- 325
		end -- 325
	}) -- 325
	_base_0.__class = _class_0 -- 325
	if _parent_0.__inherited then -- 325
		_parent_0.__inherited(_parent_0, _class_0) -- 325
	end -- 325
	Drink = _class_0 -- 325
end -- 327
local FearBeer -- 329
do -- 329
	local _class_0 -- 329
	local _parent_0 = Drink -- 329
	local _base_0 = { -- 329
		PrintName = "Fear Beer", -- 331
		Model = Model("models/props_junk/garbage_glassbottle001a.mdl"), -- 332
		Thirst = -12, -- 333
		Despair = -15, -- 334
		Description = "A bottle of foul off-yellow liquid.\n'BEER' is hand-written on the label.", -- 336
		Price = 60, -- 338
		TrashClass = "trash/bottle/fearbeer", -- 340
		ImpactThreshold = 256, -- 342
		UseText = { -- 343
			"chugs a fear beer.", -- 343
			"downs a bottle of piss beer.", -- 344
			"drinks a ratty bottle of brew.", -- 345
			"quaffs a beer and grimaces.", -- 346
			"takes a swig of fear beer and shivers.", -- 347
			"guzzles a fear beer.", -- 348
			"chokes down some piss beer." -- 349
		}, -- 352
		Initialize = function(self) -- 352
			_class_0.__parent.__base.Initialize(self) -- 353
			if SERVER then -- 354
				return self:PrecacheGibs() -- 354
			end -- 354
		end, -- 356
		OnTakeDamage = function(self, dmg) -- 356
			_class_0.__parent.__base.OnTakeDamage(self, dmg) -- 357
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH -- 358
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then -- 359
				self:Shatter(dmg:GetDamageForce()) -- 359
			end -- 359
			if attacker and IsValid(attacker) and attacker:IsPlayer() then -- 360
				if attacker:HasOddity(ODDITY_DELINQUENCY) then -- 361
					return attacker:AddDespair(-math.random(2, 4)) -- 362
				end -- 361
			end -- 360
		end, -- 364
		PhysicsCollide = function(self, data) -- 364
			_class_0.__parent.__base.PhysicsCollide(self, data) -- 365
			if CLIENT then -- 366
				return -- 366
			end -- 366
			if data.Speed > self.ImpactThreshold then -- 367
				if data.HitEntity and IsValid(data.HitEntity) then -- 368
					local attacker = self:GetNWEntity("evilrp_submitter") -- 369
					do -- 370
						local dmg = DamageInfo() -- 370
						dmg:SetDamage(25) -- 371
						if IsValid(attacker) then -- 372
							dmg:SetAttacker(attacker) -- 372
						end -- 372
						dmg:SetInflictor(self) -- 373
						dmg:SetDamageType(DMG_SLASH) -- 374
						dmg:SetDamagePosition(data.HitPos) -- 375
						data.HitEntity:TakeDamageInfo(dmg) -- 376
					end -- 370
				end -- 368
				local force = data.OurNewVelocity -- 377
				return self:Shatter(force) -- 378
			end -- 367
		end, -- 380
		Shatter = function(self, force) -- 380
			if self.broken then -- 381
				return -- 381
			end -- 381
			self.broken = true -- 382
			local pos = self:GetPos() -- 383
			local _list_0 = player.GetAll() -- 384
			for _index_0 = 1, #_list_0 do -- 384
				local ply = _list_0[_index_0] -- 384
				local _continue_0 = false -- 385
				repeat -- 385
					if not ply:HasOddity(ODDITY_DELINQUENCY) then -- 385
						_continue_0 = true -- 385
						break -- 385
					end -- 385
					if ply:CanSee(self) and ply:LookingInDirection(pos) then -- 386
						ply:AddDespair(-math.random(2, 4)) -- 387
					end -- 386
					_continue_0 = true -- 385
				until true -- 387
				if not _continue_0 then -- 387
					break -- 387
				end -- 387
			end -- 387
			do -- 388
				local ed = EffectData() -- 388
				ed:SetStart(pos) -- 389
				ed:SetOrigin(pos) -- 390
				ed:SetScale(8) -- 391
				util.Effect("GlassImpact", ed, true, true) -- 392
			end -- 388
			self:EmitSound("BottleSmash") -- 393
			self:GibBreakServer(force) -- 394
			return self:Remove() -- 395
		end -- 329
	} -- 329
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 395
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 329
			_base_0[_key_0] = _val_0 -- 329
		end -- 329
	end -- 395
	if _base_0.__index == nil then -- 329
		_base_0.__index = _base_0 -- 329
	end -- 395
	setmetatable(_base_0, _parent_0.__base) -- 329
	_class_0 = setmetatable({ -- 329
		__init = function(self, ...) -- 329
			return _class_0.__parent.__init(self, ...) -- 329
		end, -- 329
		__base = _base_0, -- 329
		__name = "FearBeer", -- 329
		__parent = _parent_0 -- 329
	}, { -- 329
		__index = function(cls, name) -- 329
			local val = rawget(_base_0, name) -- 329
			if val == nil then -- 329
				local parent = rawget(cls, "__parent") -- 329
				if parent then -- 329
					return parent[name] -- 329
				end -- 329
			else -- 329
				return val -- 329
			end -- 329
		end, -- 329
		__call = function(cls, ...) -- 329
			local _self_0 = setmetatable({ }, _base_0) -- 329
			cls.__init(_self_0, ...) -- 329
			return _self_0 -- 329
		end -- 329
	}) -- 329
	_base_0.__class = _class_0 -- 329
	if _parent_0.__inherited then -- 329
		_parent_0.__inherited(_parent_0, _class_0) -- 329
	end -- 329
	FearBeer = _class_0 -- 329
end -- 395
local SmearBeer -- 397
do -- 397
	local _class_0 -- 397
	local _parent_0 = Drink -- 397
	local _base_0 = { -- 397
		PrintName = "Smear Beer", -- 399
		Model = Model("models/props_junk/garbage_glassbottle003a.mdl"), -- 400
		Thirst = -27, -- 401
		Despair = -35, -- 402
		Description = "A bottle of cloudy, greyish red booze.\nThe label is obscured with a smear of old blood.", -- 404
		Price = 95, -- 406
		TrashClass = "trash/bottle", -- 408
		ImpactThreshold = 256, -- 410
		UseText = { -- 411
			"chugs a smear beer.", -- 411
			"downs a bottle of red brew.", -- 412
			"drinks a cloudy bottle of beer.", -- 413
			"quaffs a smear beer and shivers.", -- 414
			"takes a swig of smear beer.", -- 415
			"guzzles a bloody beer.", -- 416
			"nurses a bottle of blood beer." -- 417
		}, -- 420
		Initialize = function(self) -- 420
			_class_0.__parent.__base.Initialize(self) -- 421
			if SERVER then -- 422
				return self:PrecacheGibs() -- 422
			end -- 422
		end, -- 424
		OnTakeDamage = function(self, dmg) -- 424
			_class_0.__parent.__base.OnTakeDamage(self, dmg) -- 425
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH -- 426
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then -- 427
				self:Shatter(dmg:GetDamageForce()) -- 427
			end -- 427
			if attacker and IsValid(attacker) and attacker:IsPlayer() then -- 428
				if attacker:HasOddity(ODDITY_DELINQUENCY) then -- 429
					return attacker:AddDespair(-math.random(2, 4)) -- 430
				end -- 429
			end -- 428
		end, -- 432
		PhysicsCollide = function(self, data) -- 432
			_class_0.__parent.__base.PhysicsCollide(self, data) -- 433
			if CLIENT then -- 434
				return -- 434
			end -- 434
			if data.Speed > self.ImpactThreshold then -- 435
				if data.HitEntity and IsValid(data.HitEntity) then -- 436
					local attacker = self:GetNWEntity("evilrp_submitter") -- 437
					do -- 438
						local dmg = DamageInfo() -- 438
						dmg:SetDamage(25) -- 439
						if IsValid(attacker) then -- 440
							dmg:SetAttacker(attacker) -- 440
						end -- 440
						dmg:SetInflictor(self) -- 441
						dmg:SetDamageType(DMG_SLASH) -- 442
						dmg:SetDamagePosition(data.HitPos) -- 443
						data.HitEntity:TakeDamageInfo(dmg) -- 444
					end -- 438
				end -- 436
				local force = data.OurNewVelocity -- 445
				return self:Shatter(force) -- 446
			end -- 435
		end, -- 448
		Shatter = function(self, force) -- 448
			if self.broken then -- 449
				return -- 449
			end -- 449
			self.broken = true -- 450
			local pos = self:GetPos() -- 451
			local _list_0 = player.GetAll() -- 452
			for _index_0 = 1, #_list_0 do -- 452
				local ply = _list_0[_index_0] -- 452
				local _continue_0 = false -- 453
				repeat -- 453
					if not ply:HasOddity(ODDITY_DELINQUENCY) then -- 453
						_continue_0 = true -- 453
						break -- 453
					end -- 453
					if ply:CanSee(self) and ply:LookingInDirection(pos) then -- 454
						ply:AddDespair(-math.random(2, 4)) -- 455
					end -- 454
					_continue_0 = true -- 453
				until true -- 455
				if not _continue_0 then -- 455
					break -- 455
				end -- 455
			end -- 455
			do -- 456
				local ed = EffectData() -- 456
				ed:SetStart(pos) -- 457
				ed:SetOrigin(pos) -- 458
				ed:SetScale(8) -- 459
				util.Effect("GlassImpact", ed, true, true) -- 460
			end -- 456
			self:EmitSound("BottleSmash") -- 461
			self:GibBreakServer(force) -- 462
			return self:Remove() -- 463
		end -- 397
	} -- 397
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 463
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 397
			_base_0[_key_0] = _val_0 -- 397
		end -- 397
	end -- 463
	if _base_0.__index == nil then -- 397
		_base_0.__index = _base_0 -- 397
	end -- 463
	setmetatable(_base_0, _parent_0.__base) -- 397
	_class_0 = setmetatable({ -- 397
		__init = function(self, ...) -- 397
			return _class_0.__parent.__init(self, ...) -- 397
		end, -- 397
		__base = _base_0, -- 397
		__name = "SmearBeer", -- 397
		__parent = _parent_0 -- 397
	}, { -- 397
		__index = function(cls, name) -- 397
			local val = rawget(_base_0, name) -- 397
			if val == nil then -- 397
				local parent = rawget(cls, "__parent") -- 397
				if parent then -- 397
					return parent[name] -- 397
				end -- 397
			else -- 397
				return val -- 397
			end -- 397
		end, -- 397
		__call = function(cls, ...) -- 397
			local _self_0 = setmetatable({ }, _base_0) -- 397
			cls.__init(_self_0, ...) -- 397
			return _self_0 -- 397
		end -- 397
	}) -- 397
	_base_0.__class = _class_0 -- 397
	if _parent_0.__inherited then -- 397
		_parent_0.__inherited(_parent_0, _class_0) -- 397
	end -- 397
	SmearBeer = _class_0 -- 397
end -- 463
local Shake -- 465
do -- 465
	local _class_0 -- 465
	local _parent_0 = Drink -- 465
	local _base_0 = { -- 465
		PrintName = "Soylent Shake", -- 467
		Model = Model("models/props_junk/garbage_milkcarton001a.mdl"), -- 468
		Thirst = -40, -- 469
		Hunger = -40, -- 470
		Despair = 30, -- 471
		Description = "A jug full of partially blended human remains.\nIt's warm and chunky.", -- 473
		Price = 120, -- 475
		TrashClass = "trash/plastic/shake", -- 477
		UseText = { -- 478
			"chokes down a soylent shake.", -- 478
			"slurps up a soylent shake.", -- 479
			"swigs blended peoplemeat and shudders.", -- 480
			"struggles down a jug of human sludge.", -- 481
			"shoots back a bad protein shake.", -- 482
			"guzzles a meat smoothie.", -- 483
			"quaffs an entire soylent shake." -- 484
		} -- 465
	} -- 465
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 485
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 465
			_base_0[_key_0] = _val_0 -- 465
		end -- 465
	end -- 485
	if _base_0.__index == nil then -- 465
		_base_0.__index = _base_0 -- 465
	end -- 485
	setmetatable(_base_0, _parent_0.__base) -- 465
	_class_0 = setmetatable({ -- 465
		__init = function(self, ...) -- 465
			return _class_0.__parent.__init(self, ...) -- 465
		end, -- 465
		__base = _base_0, -- 465
		__name = "Shake", -- 465
		__parent = _parent_0 -- 465
	}, { -- 465
		__index = function(cls, name) -- 465
			local val = rawget(_base_0, name) -- 465
			if val == nil then -- 465
				local parent = rawget(cls, "__parent") -- 465
				if parent then -- 465
					return parent[name] -- 465
				end -- 465
			else -- 465
				return val -- 465
			end -- 465
		end, -- 465
		__call = function(cls, ...) -- 465
			local _self_0 = setmetatable({ }, _base_0) -- 465
			cls.__init(_self_0, ...) -- 465
			return _self_0 -- 465
		end -- 465
	}) -- 465
	_base_0.__class = _class_0 -- 465
	if _parent_0.__inherited then -- 465
		_parent_0.__inherited(_parent_0, _class_0) -- 465
	end -- 465
	Shake = _class_0 -- 465
end -- 485
local Twitchel -- 487
do -- 487
	local _class_0 -- 487
	local _parent_0 = Drink -- 487
	local _base_0 = { -- 487
		PrintName = "Twitchel", -- 489
		Model = Model("models/props_junk/garbage_plasticbottle003a.mdl"), -- 490
		Thirst = -44, -- 491
		Hunger = 6, -- 492
		Despair = 6, -- 493
		Description = "A bottle of refreshingly lukewarm, cloudy green drink.", -- 495
		Price = 80, -- 497
		TrashClass = "trash/plastic/twitchel", -- 499
		UseText = { -- 500
			"necks a bottle of twitchel.", -- 500
			"can't get enough of that green stuff.", -- 501
			"sucks down a bottle of twitchel.", -- 502
			"sips up their twitchel.", -- 503
			"pours twitchel down their throat.", -- 504
			"drinks a bottle of twitchel.", -- 505
			"slurps up a green drink." -- 506
		} -- 487
	} -- 487
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 507
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 487
			_base_0[_key_0] = _val_0 -- 487
		end -- 487
	end -- 507
	if _base_0.__index == nil then -- 487
		_base_0.__index = _base_0 -- 487
	end -- 507
	setmetatable(_base_0, _parent_0.__base) -- 487
	_class_0 = setmetatable({ -- 487
		__init = function(self, ...) -- 487
			return _class_0.__parent.__init(self, ...) -- 487
		end, -- 487
		__base = _base_0, -- 487
		__name = "Twitchel", -- 487
		__parent = _parent_0 -- 487
	}, { -- 487
		__index = function(cls, name) -- 487
			local val = rawget(_base_0, name) -- 487
			if val == nil then -- 487
				local parent = rawget(cls, "__parent") -- 487
				if parent then -- 487
					return parent[name] -- 487
				end -- 487
			else -- 487
				return val -- 487
			end -- 487
		end, -- 487
		__call = function(cls, ...) -- 487
			local _self_0 = setmetatable({ }, _base_0) -- 487
			cls.__init(_self_0, ...) -- 487
			return _self_0 -- 487
		end -- 487
	}) -- 487
	_base_0.__class = _class_0 -- 487
	if _parent_0.__inherited then -- 487
		_parent_0.__inherited(_parent_0, _class_0) -- 487
	end -- 487
	Twitchel = _class_0 -- 487
end -- 507
local TakeMeds -- 509
do -- 509
	local _class_0 -- 509
	local _parent_0 = SOUND -- 509
	local _base_0 = { -- 509
		sound = (function() -- 510
			local _accum_0 = { } -- 510
			local _len_0 = 1 -- 510
			for i = 1, 3 do -- 510
				_accum_0[_len_0] = "npc/zombie/zombie_pain" .. tostring(i) .. ".wav" -- 510
				_len_0 = _len_0 + 1 -- 510
			end -- 510
			return _accum_0 -- 510
		end)() -- 509
	} -- 509
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 510
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 509
			_base_0[_key_0] = _val_0 -- 509
		end -- 509
	end -- 510
	if _base_0.__index == nil then -- 509
		_base_0.__index = _base_0 -- 509
	end -- 510
	setmetatable(_base_0, _parent_0.__base) -- 509
	_class_0 = setmetatable({ -- 509
		__init = function(self, ...) -- 509
			return _class_0.__parent.__init(self, ...) -- 509
		end, -- 509
		__base = _base_0, -- 509
		__name = "TakeMeds", -- 509
		__parent = _parent_0 -- 509
	}, { -- 509
		__index = function(cls, name) -- 509
			local val = rawget(_base_0, name) -- 509
			if val == nil then -- 509
				local parent = rawget(cls, "__parent") -- 509
				if parent then -- 509
					return parent[name] -- 509
				end -- 509
			else -- 509
				return val -- 509
			end -- 509
		end, -- 509
		__call = function(cls, ...) -- 509
			local _self_0 = setmetatable({ }, _base_0) -- 509
			cls.__init(_self_0, ...) -- 509
			return _self_0 -- 509
		end -- 509
	}) -- 509
	_base_0.__class = _class_0 -- 509
	if _parent_0.__inherited then -- 509
		_parent_0.__inherited(_parent_0, _class_0) -- 509
	end -- 509
	TakeMeds = _class_0 -- 509
end -- 510
local Medicine -- 512
do -- 512
	local _class_0 -- 512
	local _parent_0 = Food -- 512
	local _base_0 = { -- 512
		PrintName = "Medicine", -- 514
		Sound = "TakeMeds" -- 512
	} -- 512
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 514
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 512
			_base_0[_key_0] = _val_0 -- 512
		end -- 512
	end -- 514
	if _base_0.__index == nil then -- 512
		_base_0.__index = _base_0 -- 512
	end -- 514
	setmetatable(_base_0, _parent_0.__base) -- 512
	_class_0 = setmetatable({ -- 512
		__init = function(self, ...) -- 512
			return _class_0.__parent.__init(self, ...) -- 512
		end, -- 512
		__base = _base_0, -- 512
		__name = "Medicine", -- 512
		__parent = _parent_0 -- 512
	}, { -- 512
		__index = function(cls, name) -- 512
			local val = rawget(_base_0, name) -- 512
			if val == nil then -- 512
				local parent = rawget(cls, "__parent") -- 512
				if parent then -- 512
					return parent[name] -- 512
				end -- 512
			else -- 512
				return val -- 512
			end -- 512
		end, -- 512
		__call = function(cls, ...) -- 512
			local _self_0 = setmetatable({ }, _base_0) -- 512
			cls.__init(_self_0, ...) -- 512
			return _self_0 -- 512
		end -- 512
	}) -- 512
	_base_0.__class = _class_0 -- 512
	if _parent_0.__inherited then -- 512
		_parent_0.__inherited(_parent_0, _class_0) -- 512
	end -- 512
	Medicine = _class_0 -- 512
end -- 514
local Pills -- 516
do -- 516
	local _class_0 -- 516
	local _parent_0 = Medicine -- 516
	local _base_0 = { -- 516
		PrintName = "Pills", -- 518
		Model = Model("models/props_lab/jar01b.mdl"), -- 519
		HealthAdd = function(self) -- 519
			return math.random(-15, -30) -- 519
		end, -- 520
		Hunger = function(self) -- 520
			return math.random(30, 50) -- 520
		end, -- 521
		Thirst = function(self) -- 521
			return math.random(30, 60) -- 521
		end, -- 522
		Despair = function(self) -- 522
			return math.random(-60, -100) -- 522
		end, -- 524
		Description = "A white plastic bottle, full of random pills.", -- 526
		Price = 125, -- 528
		TrashClass = "trash/plastic/pills", -- 530
		UseText = { -- 531
			"throws a mess of pills into eir mouth.", -- 531
			"consumes the whole contents of a pill bottle.", -- 532
			"devours handfuls of scary-looking pills.", -- 533
			"chokes down some strange pills.", -- 534
			"takes their medicine, like a good citizen should.", -- 535
			"swallows a mouthful of pills.", -- 536
			"takes an excessive dose of colorful pills.", -- 537
			"tosses back an entire bottle of pills.", -- 538
			"throws back a bottle of mystery pills." -- 539
		} -- 516
	} -- 516
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 540
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 516
			_base_0[_key_0] = _val_0 -- 516
		end -- 516
	end -- 540
	if _base_0.__index == nil then -- 516
		_base_0.__index = _base_0 -- 516
	end -- 540
	setmetatable(_base_0, _parent_0.__base) -- 516
	_class_0 = setmetatable({ -- 516
		__init = function(self, ...) -- 516
			return _class_0.__parent.__init(self, ...) -- 516
		end, -- 516
		__base = _base_0, -- 516
		__name = "Pills", -- 516
		__parent = _parent_0 -- 516
	}, { -- 516
		__index = function(cls, name) -- 516
			local val = rawget(_base_0, name) -- 516
			if val == nil then -- 516
				local parent = rawget(cls, "__parent") -- 516
				if parent then -- 516
					return parent[name] -- 516
				end -- 516
			else -- 516
				return val -- 516
			end -- 516
		end, -- 516
		__call = function(cls, ...) -- 516
			local _self_0 = setmetatable({ }, _base_0) -- 516
			cls.__init(_self_0, ...) -- 516
			return _self_0 -- 516
		end -- 516
	}) -- 516
	_base_0.__class = _class_0 -- 516
	if _parent_0.__inherited then -- 516
		_parent_0.__inherited(_parent_0, _class_0) -- 516
	end -- 516
	Pills = _class_0 -- 516
end -- 540
local TimeGas -- 542
do -- 542
	local _class_0 -- 542
	local _parent_0 = Medicine -- 542
	local _base_0 = { -- 542
		PrintName = "Time Gas", -- 544
		Model = Model("models/props_wasteland/prison_sinkchunk001e.mdl"), -- 545
		Sound = (function() -- 545
			local _accum_0 = { } -- 545
			local _len_0 = 1 -- 545
			for i = 2, 3 do -- 545
				_accum_0[_len_0] = "npc/fast_zombie/idle" .. tostring(i) -- 545
				_len_0 = _len_0 + 1 -- 545
			end -- 545
			return _accum_0 -- 545
		end)(), -- 546
		AddHealth = function(self) -- 546
			return math.random(20, 40) -- 546
		end, -- 547
		Hunger = function(self) -- 547
			return math.random(10, 20) -- 547
		end, -- 548
		Thirst = function(self) -- 548
			return math.random(20, 30) -- 548
		end, -- 549
		Despair = function(self) -- 549
			return math.random(0, 10) -- 549
		end, -- 551
		Description = "An inhaler of time acceleration gas.\nSpeeds up healing, and dying.", -- 553
		Price = 100, -- 555
		TrashClass = "trash/inhaler", -- 557
		UseText = { -- 558
			"breathes in some time gas.", -- 558
			"huffs a healing gas.", -- 559
			"isn't yet tired of the time gas.", -- 560
			"inhales a big cloud of time gas.", -- 561
			"takes a deep breath of time gas.", -- 562
			"drags in a lungful of time gas.", -- 563
			"sniffs up a cloud of time gas.", -- 564
			"huffs time gas from the rusty inhaler." -- 565
		} -- 542
	} -- 542
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 566
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 542
			_base_0[_key_0] = _val_0 -- 542
		end -- 542
	end -- 566
	if _base_0.__index == nil then -- 542
		_base_0.__index = _base_0 -- 542
	end -- 566
	setmetatable(_base_0, _parent_0.__base) -- 542
	_class_0 = setmetatable({ -- 542
		__init = function(self, ...) -- 542
			return _class_0.__parent.__init(self, ...) -- 542
		end, -- 542
		__base = _base_0, -- 542
		__name = "TimeGas", -- 542
		__parent = _parent_0 -- 542
	}, { -- 542
		__index = function(cls, name) -- 542
			local val = rawget(_base_0, name) -- 542
			if val == nil then -- 542
				local parent = rawget(cls, "__parent") -- 542
				if parent then -- 542
					return parent[name] -- 542
				end -- 542
			else -- 542
				return val -- 542
			end -- 542
		end, -- 542
		__call = function(cls, ...) -- 542
			local _self_0 = setmetatable({ }, _base_0) -- 542
			cls.__init(_self_0, ...) -- 542
			return _self_0 -- 542
		end -- 542
	}) -- 542
	_base_0.__class = _class_0 -- 542
	if _parent_0.__inherited then -- 542
		_parent_0.__inherited(_parent_0, _class_0) -- 542
	end -- 542
	TimeGas = _class_0 -- 542
end -- 566
local Bleach -- 568
do -- 568
	local _class_0 -- 568
	local _parent_0 = Medicine -- 568
	local _base_0 = { -- 568
		PrintName = "Chlorine", -- 570
		Model = Model("models/props_junk/garbage_plasticbottle002a.mdl"), -- 571
		Sound = "DrinkFluid", -- 573
		Description = "Do NOT even think about drinking this. \n Last guy who tried couldn't even finish it before falling over.", -- 574
		AddHealth = -50, -- 575
		Hunger = 40, -- 576
		Thirst = -40, -- 577
		Despair = { -- 579
			Description = "A jug full of bleach." -- 579
		}, -- 580
		Price = 100, -- 582
		TrashClass = "trash/plastic/bleach", -- 584
		UseText = { -- 585
			"drinks bleach.", -- 585
			"chugs an entire fucking jug of chlorine.", -- 586
			"unscrews a jug of bleach and pours it down the hatch.", -- 587
			"chokes down gulp after gulp of chlorine bleach." -- 588
		} -- 568
	} -- 568
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 589
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 568
			_base_0[_key_0] = _val_0 -- 568
		end -- 568
	end -- 589
	if _base_0.__index == nil then -- 568
		_base_0.__index = _base_0 -- 568
	end -- 589
	setmetatable(_base_0, _parent_0.__base) -- 568
	_class_0 = setmetatable({ -- 568
		__init = function(self, ...) -- 568
			return _class_0.__parent.__init(self, ...) -- 568
		end, -- 568
		__base = _base_0, -- 568
		__name = "Bleach", -- 568
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
	Bleach = _class_0 -- 568
end -- 589
local Ambrosia -- 591
do -- 591
	local _class_0 -- 591
	local _parent_0 = Food -- 591
	local _base_0 = { -- 591
		PrintName = "Ambrosia", -- 593
		Model = Model("models/Gibs/HGIBS.mdl"), -- 594
		Hunger = -100, -- 595
		Thirst = -100, -- 596
		Despair = -100, -- 597
		HealthAdd = 100, -- 598
		Description = "A food made for gods.", -- 599
		RotTime = 0, -- 601
		UseText = { -- 602
			"indulges in some ambrosia." -- 602
		}, -- 605
		Precursor = { -- 606
			biomass = 15, -- 606
			wood = 15, -- 607
			metal = 15 -- 608
		}, -- 613
		Eat = function(self, ply) -- 613
			_class_0.__parent.__base.Eat(self, ply) -- 614
			if CLIENT then -- 615
				return -- 615
			end -- 615
			return ply:AddStemCells(5) -- 616
		end -- 591
	} -- 591
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 616
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 591
			_base_0[_key_0] = _val_0 -- 591
		end -- 591
	end -- 616
	if _base_0.__index == nil then -- 591
		_base_0.__index = _base_0 -- 591
	end -- 616
	setmetatable(_base_0, _parent_0.__base) -- 591
	_class_0 = setmetatable({ -- 591
		__init = function(self, ...) -- 591
			return _class_0.__parent.__init(self, ...) -- 591
		end, -- 591
		__base = _base_0, -- 591
		__name = "Ambrosia", -- 591
		__parent = _parent_0 -- 591
	}, { -- 591
		__index = function(cls, name) -- 591
			local val = rawget(_base_0, name) -- 591
			if val == nil then -- 591
				local parent = rawget(cls, "__parent") -- 591
				if parent then -- 591
					return parent[name] -- 591
				end -- 591
			else -- 591
				return val -- 591
			end -- 591
		end, -- 591
		__call = function(cls, ...) -- 591
			local _self_0 = setmetatable({ }, _base_0) -- 591
			cls.__init(_self_0, ...) -- 591
			return _self_0 -- 591
		end -- 591
	}) -- 591
	_base_0.__class = _class_0 -- 591
	if _parent_0.__inherited then -- 591
		_parent_0.__inherited(_parent_0, _class_0) -- 591
	end -- 591
	Ambrosia = _class_0 -- 591
end -- 616
local SloppyRibs -- 623
do -- 623
	local _class_0 -- 623
	local _parent_0 = Food -- 623
	local _base_0 = { -- 623
		PrintName = "Sloppy Ribs", -- 625
		Model = Model("models/vel/evilwar/sloppyribs.mdl"), -- 626
		Hunger = -28, -- 627
		Thirst = -4, -- 628
		Despair = 5, -- 629
		Description = "Fresh ribs from an unknown source, now glazed in slop! \n They look delicious.", -- 631
		CookTime = 10, -- 633
		Price = 115, -- 634
		UseText = { -- 635
			"devours all of the flesh and slop on the rib, then throws it away.", -- 635
			"munches on the rib, and then licks the glaze off his hands.", -- 636
			"gobbles down the rib, and spits out the bone." -- 637
		} -- 623
	} -- 623
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 637
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 623
			_base_0[_key_0] = _val_0 -- 623
		end -- 623
	end -- 637
	if _base_0.__index == nil then -- 623
		_base_0.__index = _base_0 -- 623
	end -- 637
	setmetatable(_base_0, _parent_0.__base) -- 623
	_class_0 = setmetatable({ -- 623
		__init = function(self, ...) -- 623
			return _class_0.__parent.__init(self, ...) -- 623
		end, -- 623
		__base = _base_0, -- 623
		__name = "SloppyRibs", -- 623
		__parent = _parent_0 -- 623
	}, { -- 623
		__index = function(cls, name) -- 623
			local val = rawget(_base_0, name) -- 623
			if val == nil then -- 623
				local parent = rawget(cls, "__parent") -- 623
				if parent then -- 623
					return parent[name] -- 623
				end -- 623
			else -- 623
				return val -- 623
			end -- 623
		end, -- 623
		__call = function(cls, ...) -- 623
			local _self_0 = setmetatable({ }, _base_0) -- 623
			cls.__init(_self_0, ...) -- 623
			return _self_0 -- 623
		end -- 623
	}) -- 623
	_base_0.__class = _class_0 -- 623
	if _parent_0.__inherited then -- 623
		_parent_0.__inherited(_parent_0, _class_0) -- 623
	end -- 623
	SloppyRibs = _class_0 -- 623
end -- 637
local EyeballNoodles -- 640
do -- 640
	local _class_0 -- 640
	local _parent_0 = Food -- 640
	local _base_0 = { -- 640
		PrintName = "Eyeball Noodles", -- 642
		Model = Model("models/vel/evilwar/eyenoodle.mdl"), -- 643
		Hunger = -50, -- 644
		Thirst = -20, -- 645
		Despair = 5, -- 646
		Description = "A traditional Lymphomian dish, usually served to go. \n The texture is an acquired taste.", -- 648
		CookTime = 8, -- 650
		Price = 130, -- 652
		UseText = { -- 653
			"slurps all of the noodles.", -- 653
			"slurps the noodles, gagging at the wet crunch of the eyeball.", -- 654
			"eats the noodles, and then spits out the eyeball.", -- 655
			"gags on the noodles, and then throws out the eyeball." -- 656
		} -- 640
	} -- 640
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 657
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 640
			_base_0[_key_0] = _val_0 -- 640
		end -- 640
	end -- 657
	if _base_0.__index == nil then -- 640
		_base_0.__index = _base_0 -- 640
	end -- 657
	setmetatable(_base_0, _parent_0.__base) -- 640
	_class_0 = setmetatable({ -- 640
		__init = function(self, ...) -- 640
			return _class_0.__parent.__init(self, ...) -- 640
		end, -- 640
		__base = _base_0, -- 640
		__name = "EyeballNoodles", -- 640
		__parent = _parent_0 -- 640
	}, { -- 640
		__index = function(cls, name) -- 640
			local val = rawget(_base_0, name) -- 640
			if val == nil then -- 640
				local parent = rawget(cls, "__parent") -- 640
				if parent then -- 640
					return parent[name] -- 640
				end -- 640
			else -- 640
				return val -- 640
			end -- 640
		end, -- 640
		__call = function(cls, ...) -- 640
			local _self_0 = setmetatable({ }, _base_0) -- 640
			cls.__init(_self_0, ...) -- 640
			return _self_0 -- 640
		end -- 640
	}) -- 640
	_base_0.__class = _class_0 -- 640
	if _parent_0.__inherited then -- 640
		_parent_0.__inherited(_parent_0, _class_0) -- 640
	end -- 640
	EyeballNoodles = _class_0 -- 640
end -- 657
local PaperMache -- 659
do -- 659
	local _class_0 -- 659
	local _parent_0 = Food -- 659
	local _base_0 = { -- 659
		PrintName = "Paper Mache", -- 661
		Model = Model("models/props_junk/garbage_bag001a.mdl"), -- 662
		Hunger = -10, -- 663
		Thirst = -10, -- 664
		Despair = 15, -- 665
		Description = "An old crumpled paper. \n now it's watered down into a little ball.", -- 667
		CookTime = 3, -- 669
		Price = 30, -- 671
		UseText = { -- 672
			"stoves the paper mache into his mouth, gagging horribly.", -- 672
			"forces the paper down his throat, throwing up slightly", -- 673
			"rips apart the paper mache, eating small pieces at a time.", -- 674
			"looks miserable trying to eat watered down paper." -- 675
		} -- 659
	} -- 659
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 675
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 659
			_base_0[_key_0] = _val_0 -- 659
		end -- 659
	end -- 675
	if _base_0.__index == nil then -- 659
		_base_0.__index = _base_0 -- 659
	end -- 675
	setmetatable(_base_0, _parent_0.__base) -- 659
	_class_0 = setmetatable({ -- 659
		__init = function(self, ...) -- 659
			return _class_0.__parent.__init(self, ...) -- 659
		end, -- 659
		__base = _base_0, -- 659
		__name = "PaperMache", -- 659
		__parent = _parent_0 -- 659
	}, { -- 659
		__index = function(cls, name) -- 659
			local val = rawget(_base_0, name) -- 659
			if val == nil then -- 659
				local parent = rawget(cls, "__parent") -- 659
				if parent then -- 659
					return parent[name] -- 659
				end -- 659
			else -- 659
				return val -- 659
			end -- 659
		end, -- 659
		__call = function(cls, ...) -- 659
			local _self_0 = setmetatable({ }, _base_0) -- 659
			cls.__init(_self_0, ...) -- 659
			return _self_0 -- 659
		end -- 659
	}) -- 659
	_base_0.__class = _class_0 -- 659
	if _parent_0.__inherited then -- 659
		_parent_0.__inherited(_parent_0, _class_0) -- 659
	end -- 659
	PaperMache = _class_0 -- 659
	return _class_0 -- 675
end -- 675
