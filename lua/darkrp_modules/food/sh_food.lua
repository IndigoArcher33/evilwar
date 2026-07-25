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
		Despair = -5, -- 208
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
		Despair = -20, -- 224
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
local GroundRibs -- 263
do -- 263
	local _class_0 -- 263
	local _parent_0 = Food -- 263
	local _base_0 = { -- 263
		PrintName = "Ground Ribs", -- 265
		Model = Model("models/props_c17/metalPot001a.mdl"), -- 266
		Hunger = -10, -- 267
		Thirst = 5, -- 268
		Despair = 15, -- 269
		HealthAdd = -5, -- 270
		Description = "Human ribs, ground up into a fibrous powder.\nIt doesn't look edible yet.", -- 271
		CookTime = 5, -- 273
		Price = 30, -- 275
		UseText = { -- 276
			"eats some ground ribs and spits them out.", -- 276
			"bleeds from a chunk of ground ribs.", -- 277
			"munches on some ground ribs, lacerating their throat.", -- 278
			"regrets putting rib powder in their mouth." -- 279
		} -- 263
	} -- 263
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 279
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 263
			_base_0[_key_0] = _val_0 -- 263
		end -- 263
	end -- 279
	if _base_0.__index == nil then -- 263
		_base_0.__index = _base_0 -- 263
	end -- 279
	setmetatable(_base_0, _parent_0.__base) -- 263
	_class_0 = setmetatable({ -- 263
		__init = function(self, ...) -- 263
			return _class_0.__parent.__init(self, ...) -- 263
		end, -- 263
		__base = _base_0, -- 263
		__name = "GroundRibs", -- 263
		__parent = _parent_0 -- 263
	}, { -- 263
		__index = function(cls, name) -- 263
			local val = rawget(_base_0, name) -- 263
			if val == nil then -- 263
				local parent = rawget(cls, "__parent") -- 263
				if parent then -- 263
					return parent[name] -- 263
				end -- 263
			else -- 263
				return val -- 263
			end -- 263
		end, -- 263
		__call = function(cls, ...) -- 263
			local _self_0 = setmetatable({ }, _base_0) -- 263
			cls.__init(_self_0, ...) -- 263
			return _self_0 -- 263
		end -- 263
	}) -- 263
	_base_0.__class = _class_0 -- 263
	if _parent_0.__inherited then -- 263
		_parent_0.__inherited(_parent_0, _class_0) -- 263
	end -- 263
	GroundRibs = _class_0 -- 263
end -- 279
local Boot -- 284
do -- 284
	local _class_0 -- 284
	local _parent_0 = Food -- 284
	local _base_0 = { -- 284
		PrintName = "Boot", -- 286
		Model = Model("models/props_junk/Shoe001a.mdl"), -- 287
		HealthAdd = -4, -- 288
		Hunger = -5, -- 289
		Thirst = 40, -- 290
		Despair = 40, -- 291
		Description = "A dirty old boot, nearly fallen apart.", -- 293
		UseText = { -- 294
			"chews on a nasty boot!", -- 294
			"chokes on an old boot.", -- 295
			"gnaws a boot to shreds.", -- 296
			"shoves a boot in their mouth!", -- 297
			"eats a rotten leather boot.", -- 298
			"devours a dirty old boot!", -- 299
			"eats a boot." -- 300
		} -- 284
	} -- 284
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 301
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 284
			_base_0[_key_0] = _val_0 -- 284
		end -- 284
	end -- 301
	if _base_0.__index == nil then -- 284
		_base_0.__index = _base_0 -- 284
	end -- 301
	setmetatable(_base_0, _parent_0.__base) -- 284
	_class_0 = setmetatable({ -- 284
		__init = function(self, ...) -- 284
			return _class_0.__parent.__init(self, ...) -- 284
		end, -- 284
		__base = _base_0, -- 284
		__name = "Boot", -- 284
		__parent = _parent_0 -- 284
	}, { -- 284
		__index = function(cls, name) -- 284
			local val = rawget(_base_0, name) -- 284
			if val == nil then -- 284
				local parent = rawget(cls, "__parent") -- 284
				if parent then -- 284
					return parent[name] -- 284
				end -- 284
			else -- 284
				return val -- 284
			end -- 284
		end, -- 284
		__call = function(cls, ...) -- 284
			local _self_0 = setmetatable({ }, _base_0) -- 284
			cls.__init(_self_0, ...) -- 284
			return _self_0 -- 284
		end -- 284
	}) -- 284
	_base_0.__class = _class_0 -- 284
	if _parent_0.__inherited then -- 284
		_parent_0.__inherited(_parent_0, _class_0) -- 284
	end -- 284
	Boot = _class_0 -- 284
end -- 301
local BleachedMelon -- 303
do -- 303
	local _class_0 -- 303
	local _parent_0 = Food -- 303
	local _base_0 = { -- 303
		PrintName = "Bleached Melon", -- 305
		Model = Model("models/props_junk/watermelon01_chunk01c.mdl"), -- 306
		HealthAdd = -3, -- 307
		Hunger = -15, -- 308
		Thirst = -4, -- 309
		Description = "This was covered in mold before, hopefully the chlorine got rid of it.", -- 311
		CookTime = 10, -- 312
		Price = 25, -- 314
		UseText = { -- 315
			"eats a melon.", -- 315
			"devours a chunk of melon.", -- 316
			"munches on a melon." -- 317
		} -- 303
	} -- 303
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 317
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 303
			_base_0[_key_0] = _val_0 -- 303
		end -- 303
	end -- 317
	if _base_0.__index == nil then -- 303
		_base_0.__index = _base_0 -- 303
	end -- 317
	setmetatable(_base_0, _parent_0.__base) -- 303
	_class_0 = setmetatable({ -- 303
		__init = function(self, ...) -- 303
			return _class_0.__parent.__init(self, ...) -- 303
		end, -- 303
		__base = _base_0, -- 303
		__name = "BleachedMelon", -- 303
		__parent = _parent_0 -- 303
	}, { -- 303
		__index = function(cls, name) -- 303
			local val = rawget(_base_0, name) -- 303
			if val == nil then -- 303
				local parent = rawget(cls, "__parent") -- 303
				if parent then -- 303
					return parent[name] -- 303
				end -- 303
			else -- 303
				return val -- 303
			end -- 303
		end, -- 303
		__call = function(cls, ...) -- 303
			local _self_0 = setmetatable({ }, _base_0) -- 303
			cls.__init(_self_0, ...) -- 303
			return _self_0 -- 303
		end -- 303
	}) -- 303
	_base_0.__class = _class_0 -- 303
	if _parent_0.__inherited then -- 303
		_parent_0.__inherited(_parent_0, _class_0) -- 303
	end -- 303
	BleachedMelon = _class_0 -- 303
end -- 317
local MoldMelon -- 321
do -- 321
	local _class_0 -- 321
	local _parent_0 = Food -- 321
	local _base_0 = { -- 321
		PrintName = "Mold Melon", -- 323
		Model = Model("models/props_junk/watermelon01_chunk01c.mdl"), -- 324
		HealthAdd = -10, -- 325
		Hunger = -6, -- 326
		Despair = 4, -- 327
		Description = "A pithy husk of fruit, fully colonized by white mold.", -- 329
		Price = 25, -- 331
		UseText = { -- 332
			"eats a moldy melon.", -- 332
			"devours a moldy chunk of melon.", -- 333
			"munches on a mold melon.", -- 334
			"feasts on a fungus fruit.", -- 335
			"tears into some mold melon.", -- 336
			"crunches up a mold melon.", -- 337
			"chows down on a mold melon." -- 338
		} -- 321
	} -- 321
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 339
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 321
			_base_0[_key_0] = _val_0 -- 321
		end -- 321
	end -- 339
	if _base_0.__index == nil then -- 321
		_base_0.__index = _base_0 -- 321
	end -- 339
	setmetatable(_base_0, _parent_0.__base) -- 321
	_class_0 = setmetatable({ -- 321
		__init = function(self, ...) -- 321
			return _class_0.__parent.__init(self, ...) -- 321
		end, -- 321
		__base = _base_0, -- 321
		__name = "MoldMelon", -- 321
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
	MoldMelon = _class_0 -- 321
end -- 339
local DrinkFluid -- 341
do -- 341
	local _class_0 -- 341
	local _parent_0 = SOUND -- 341
	local _base_0 = { -- 341
		sound = (function() -- 342
			local _accum_0 = { } -- 342
			local _len_0 = 1 -- 342
			for i = 1, 2 do -- 342
				_accum_0[_len_0] = "npc/barnacle/barnacle_gulp" .. tostring(i) .. ".wav" -- 342
				_len_0 = _len_0 + 1 -- 342
			end -- 342
			return _accum_0 -- 342
		end)(), -- 343
		level = SNDLVL_65DB -- 341
	} -- 341
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 343
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 341
			_base_0[_key_0] = _val_0 -- 341
		end -- 341
	end -- 343
	if _base_0.__index == nil then -- 341
		_base_0.__index = _base_0 -- 341
	end -- 343
	setmetatable(_base_0, _parent_0.__base) -- 341
	_class_0 = setmetatable({ -- 341
		__init = function(self, ...) -- 341
			return _class_0.__parent.__init(self, ...) -- 341
		end, -- 341
		__base = _base_0, -- 341
		__name = "DrinkFluid", -- 341
		__parent = _parent_0 -- 341
	}, { -- 341
		__index = function(cls, name) -- 341
			local val = rawget(_base_0, name) -- 341
			if val == nil then -- 341
				local parent = rawget(cls, "__parent") -- 341
				if parent then -- 341
					return parent[name] -- 341
				end -- 341
			else -- 341
				return val -- 341
			end -- 341
		end, -- 341
		__call = function(cls, ...) -- 341
			local _self_0 = setmetatable({ }, _base_0) -- 341
			cls.__init(_self_0, ...) -- 341
			return _self_0 -- 341
		end -- 341
	}) -- 341
	_base_0.__class = _class_0 -- 341
	if _parent_0.__inherited then -- 341
		_parent_0.__inherited(_parent_0, _class_0) -- 341
	end -- 341
	DrinkFluid = _class_0 -- 341
end -- 343
local Drink -- 345
do -- 345
	local _class_0 -- 345
	local _parent_0 = Food -- 345
	local _base_0 = { -- 345
		PrintName = "Drink", -- 347
		Sound = "DrinkFluid" -- 345
	} -- 345
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 347
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 345
			_base_0[_key_0] = _val_0 -- 345
		end -- 345
	end -- 347
	if _base_0.__index == nil then -- 345
		_base_0.__index = _base_0 -- 345
	end -- 347
	setmetatable(_base_0, _parent_0.__base) -- 345
	_class_0 = setmetatable({ -- 345
		__init = function(self, ...) -- 345
			return _class_0.__parent.__init(self, ...) -- 345
		end, -- 345
		__base = _base_0, -- 345
		__name = "Drink", -- 345
		__parent = _parent_0 -- 345
	}, { -- 345
		__index = function(cls, name) -- 345
			local val = rawget(_base_0, name) -- 345
			if val == nil then -- 345
				local parent = rawget(cls, "__parent") -- 345
				if parent then -- 345
					return parent[name] -- 345
				end -- 345
			else -- 345
				return val -- 345
			end -- 345
		end, -- 345
		__call = function(cls, ...) -- 345
			local _self_0 = setmetatable({ }, _base_0) -- 345
			cls.__init(_self_0, ...) -- 345
			return _self_0 -- 345
		end -- 345
	}) -- 345
	_base_0.__class = _class_0 -- 345
	if _parent_0.__inherited then -- 345
		_parent_0.__inherited(_parent_0, _class_0) -- 345
	end -- 345
	Drink = _class_0 -- 345
end -- 347
local FearBeer -- 349
do -- 349
	local _class_0 -- 349
	local _parent_0 = Drink -- 349
	local _base_0 = { -- 349
		PrintName = "Fear Beer", -- 351
		Model = Model("models/props_junk/garbage_glassbottle001a.mdl"), -- 352
		Thirst = -25, -- 353
		Despair = -30, -- 354
		Description = "A bottle of foul off-yellow liquid.\n'BEER' is hand-written on the label.", -- 356
		Price = 60, -- 358
		TrashClass = "trash/bottle/fearbeer", -- 360
		ImpactThreshold = 256, -- 362
		UseText = { -- 363
			"chugs a fear beer.", -- 363
			"downs a bottle of piss beer.", -- 364
			"drinks a ratty bottle of brew.", -- 365
			"quaffs a beer and grimaces.", -- 366
			"takes a swig of fear beer and shivers.", -- 367
			"guzzles a fear beer.", -- 368
			"chokes down some piss beer." -- 369
		}, -- 372
		Initialize = function(self) -- 372
			_class_0.__parent.__base.Initialize(self) -- 373
			if SERVER then -- 374
				return self:PrecacheGibs() -- 374
			end -- 374
		end, -- 376
		OnTakeDamage = function(self, dmg) -- 376
			_class_0.__parent.__base.OnTakeDamage(self, dmg) -- 377
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH -- 378
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then -- 379
				self:Shatter(dmg:GetDamageForce()) -- 379
			end -- 379
			if attacker and IsValid(attacker) and attacker:IsPlayer() then -- 380
				if attacker:HasOddity(ODDITY_DELINQUENCY) then -- 381
					return attacker:AddDespair(-math.random(2, 4)) -- 382
				end -- 381
			end -- 380
		end, -- 384
		PhysicsCollide = function(self, data) -- 384
			_class_0.__parent.__base.PhysicsCollide(self, data) -- 385
			if CLIENT then -- 386
				return -- 386
			end -- 386
			if data.Speed > self.ImpactThreshold then -- 387
				if data.HitEntity and IsValid(data.HitEntity) then -- 388
					local attacker = self:GetNWEntity("evilrp_submitter") -- 389
					do -- 390
						local dmg = DamageInfo() -- 390
						dmg:SetDamage(25) -- 391
						if IsValid(attacker) then -- 392
							dmg:SetAttacker(attacker) -- 392
						end -- 392
						dmg:SetInflictor(self) -- 393
						dmg:SetDamageType(DMG_SLASH) -- 394
						dmg:SetDamagePosition(data.HitPos) -- 395
						data.HitEntity:TakeDamageInfo(dmg) -- 396
					end -- 390
				end -- 388
				local force = data.OurNewVelocity -- 397
				return self:Shatter(force) -- 398
			end -- 387
		end, -- 400
		Shatter = function(self, force) -- 400
			if self.broken then -- 401
				return -- 401
			end -- 401
			self.broken = true -- 402
			local pos = self:GetPos() -- 403
			local _list_0 = player.GetAll() -- 404
			for _index_0 = 1, #_list_0 do -- 404
				local ply = _list_0[_index_0] -- 404
				local _continue_0 = false -- 405
				repeat -- 405
					if not ply:HasOddity(ODDITY_DELINQUENCY) then -- 405
						_continue_0 = true -- 405
						break -- 405
					end -- 405
					if ply:CanSee(self) and ply:LookingInDirection(pos) then -- 406
						ply:AddDespair(-math.random(2, 4)) -- 407
					end -- 406
					_continue_0 = true -- 405
				until true -- 407
				if not _continue_0 then -- 407
					break -- 407
				end -- 407
			end -- 407
			do -- 408
				local ed = EffectData() -- 408
				ed:SetStart(pos) -- 409
				ed:SetOrigin(pos) -- 410
				ed:SetScale(8) -- 411
				util.Effect("GlassImpact", ed, true, true) -- 412
			end -- 408
			self:EmitSound("BottleSmash") -- 413
			self:GibBreakServer(force) -- 414
			return self:Remove() -- 415
		end -- 349
	} -- 349
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 415
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 349
			_base_0[_key_0] = _val_0 -- 349
		end -- 349
	end -- 415
	if _base_0.__index == nil then -- 349
		_base_0.__index = _base_0 -- 349
	end -- 415
	setmetatable(_base_0, _parent_0.__base) -- 349
	_class_0 = setmetatable({ -- 349
		__init = function(self, ...) -- 349
			return _class_0.__parent.__init(self, ...) -- 349
		end, -- 349
		__base = _base_0, -- 349
		__name = "FearBeer", -- 349
		__parent = _parent_0 -- 349
	}, { -- 349
		__index = function(cls, name) -- 349
			local val = rawget(_base_0, name) -- 349
			if val == nil then -- 349
				local parent = rawget(cls, "__parent") -- 349
				if parent then -- 349
					return parent[name] -- 349
				end -- 349
			else -- 349
				return val -- 349
			end -- 349
		end, -- 349
		__call = function(cls, ...) -- 349
			local _self_0 = setmetatable({ }, _base_0) -- 349
			cls.__init(_self_0, ...) -- 349
			return _self_0 -- 349
		end -- 349
	}) -- 349
	_base_0.__class = _class_0 -- 349
	if _parent_0.__inherited then -- 349
		_parent_0.__inherited(_parent_0, _class_0) -- 349
	end -- 349
	FearBeer = _class_0 -- 349
end -- 415
local SmearBeer -- 417
do -- 417
	local _class_0 -- 417
	local _parent_0 = Drink -- 417
	local _base_0 = { -- 417
		PrintName = "Smear Beer", -- 419
		Model = Model("models/props_junk/garbage_glassbottle003a.mdl"), -- 420
		Thirst = -45, -- 421
		Despair = -50, -- 422
		Description = "A bottle of cloudy, greyish red booze.\nThe label is obscured with a smear of old blood.", -- 424
		Price = 95, -- 426
		TrashClass = "trash/bottle", -- 428
		ImpactThreshold = 256, -- 430
		UseText = { -- 431
			"chugs a smear beer.", -- 431
			"downs a bottle of red brew.", -- 432
			"drinks a cloudy bottle of beer.", -- 433
			"quaffs a smear beer and shivers.", -- 434
			"takes a swig of smear beer.", -- 435
			"guzzles a bloody beer.", -- 436
			"nurses a bottle of blood beer." -- 437
		}, -- 440
		Initialize = function(self) -- 440
			_class_0.__parent.__base.Initialize(self) -- 441
			if SERVER then -- 442
				return self:PrecacheGibs() -- 442
			end -- 442
		end, -- 444
		OnTakeDamage = function(self, dmg) -- 444
			_class_0.__parent.__base.OnTakeDamage(self, dmg) -- 445
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH -- 446
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then -- 447
				self:Shatter(dmg:GetDamageForce()) -- 447
			end -- 447
			if attacker and IsValid(attacker) and attacker:IsPlayer() then -- 448
				if attacker:HasOddity(ODDITY_DELINQUENCY) then -- 449
					return attacker:AddDespair(-math.random(2, 4)) -- 450
				end -- 449
			end -- 448
		end, -- 452
		PhysicsCollide = function(self, data) -- 452
			_class_0.__parent.__base.PhysicsCollide(self, data) -- 453
			if CLIENT then -- 454
				return -- 454
			end -- 454
			if data.Speed > self.ImpactThreshold then -- 455
				if data.HitEntity and IsValid(data.HitEntity) then -- 456
					local attacker = self:GetNWEntity("evilrp_submitter") -- 457
					do -- 458
						local dmg = DamageInfo() -- 458
						dmg:SetDamage(25) -- 459
						if IsValid(attacker) then -- 460
							dmg:SetAttacker(attacker) -- 460
						end -- 460
						dmg:SetInflictor(self) -- 461
						dmg:SetDamageType(DMG_SLASH) -- 462
						dmg:SetDamagePosition(data.HitPos) -- 463
						data.HitEntity:TakeDamageInfo(dmg) -- 464
					end -- 458
				end -- 456
				local force = data.OurNewVelocity -- 465
				return self:Shatter(force) -- 466
			end -- 455
		end, -- 468
		Shatter = function(self, force) -- 468
			if self.broken then -- 469
				return -- 469
			end -- 469
			self.broken = true -- 470
			local pos = self:GetPos() -- 471
			local _list_0 = player.GetAll() -- 472
			for _index_0 = 1, #_list_0 do -- 472
				local ply = _list_0[_index_0] -- 472
				local _continue_0 = false -- 473
				repeat -- 473
					if not ply:HasOddity(ODDITY_DELINQUENCY) then -- 473
						_continue_0 = true -- 473
						break -- 473
					end -- 473
					if ply:CanSee(self) and ply:LookingInDirection(pos) then -- 474
						ply:AddDespair(-math.random(2, 4)) -- 475
					end -- 474
					_continue_0 = true -- 473
				until true -- 475
				if not _continue_0 then -- 475
					break -- 475
				end -- 475
			end -- 475
			do -- 476
				local ed = EffectData() -- 476
				ed:SetStart(pos) -- 477
				ed:SetOrigin(pos) -- 478
				ed:SetScale(8) -- 479
				util.Effect("GlassImpact", ed, true, true) -- 480
			end -- 476
			self:EmitSound("BottleSmash") -- 481
			self:GibBreakServer(force) -- 482
			return self:Remove() -- 483
		end -- 417
	} -- 417
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 483
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 417
			_base_0[_key_0] = _val_0 -- 417
		end -- 417
	end -- 483
	if _base_0.__index == nil then -- 417
		_base_0.__index = _base_0 -- 417
	end -- 483
	setmetatable(_base_0, _parent_0.__base) -- 417
	_class_0 = setmetatable({ -- 417
		__init = function(self, ...) -- 417
			return _class_0.__parent.__init(self, ...) -- 417
		end, -- 417
		__base = _base_0, -- 417
		__name = "SmearBeer", -- 417
		__parent = _parent_0 -- 417
	}, { -- 417
		__index = function(cls, name) -- 417
			local val = rawget(_base_0, name) -- 417
			if val == nil then -- 417
				local parent = rawget(cls, "__parent") -- 417
				if parent then -- 417
					return parent[name] -- 417
				end -- 417
			else -- 417
				return val -- 417
			end -- 417
		end, -- 417
		__call = function(cls, ...) -- 417
			local _self_0 = setmetatable({ }, _base_0) -- 417
			cls.__init(_self_0, ...) -- 417
			return _self_0 -- 417
		end -- 417
	}) -- 417
	_base_0.__class = _class_0 -- 417
	if _parent_0.__inherited then -- 417
		_parent_0.__inherited(_parent_0, _class_0) -- 417
	end -- 417
	SmearBeer = _class_0 -- 417
end -- 483
local Shake -- 485
do -- 485
	local _class_0 -- 485
	local _parent_0 = Drink -- 485
	local _base_0 = { -- 485
		PrintName = "Soylent Shake", -- 487
		Model = Model("models/props_junk/garbage_milkcarton001a.mdl"), -- 488
		Thirst = -40, -- 489
		Hunger = -40, -- 490
		Despair = 30, -- 491
		Description = "A jug full of partially blended human remains.\nIt's warm and chunky.", -- 493
		Price = 120, -- 495
		TrashClass = "trash/plastic/shake", -- 497
		UseText = { -- 498
			"chokes down a soylent shake.", -- 498
			"slurps up a soylent shake.", -- 499
			"swigs blended peoplemeat and shudders.", -- 500
			"struggles down a jug of human sludge.", -- 501
			"shoots back a bad protein shake.", -- 502
			"guzzles a meat smoothie.", -- 503
			"quaffs an entire soylent shake." -- 504
		} -- 485
	} -- 485
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 505
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 485
			_base_0[_key_0] = _val_0 -- 485
		end -- 485
	end -- 505
	if _base_0.__index == nil then -- 485
		_base_0.__index = _base_0 -- 485
	end -- 505
	setmetatable(_base_0, _parent_0.__base) -- 485
	_class_0 = setmetatable({ -- 485
		__init = function(self, ...) -- 485
			return _class_0.__parent.__init(self, ...) -- 485
		end, -- 485
		__base = _base_0, -- 485
		__name = "Shake", -- 485
		__parent = _parent_0 -- 485
	}, { -- 485
		__index = function(cls, name) -- 485
			local val = rawget(_base_0, name) -- 485
			if val == nil then -- 485
				local parent = rawget(cls, "__parent") -- 485
				if parent then -- 485
					return parent[name] -- 485
				end -- 485
			else -- 485
				return val -- 485
			end -- 485
		end, -- 485
		__call = function(cls, ...) -- 485
			local _self_0 = setmetatable({ }, _base_0) -- 485
			cls.__init(_self_0, ...) -- 485
			return _self_0 -- 485
		end -- 485
	}) -- 485
	_base_0.__class = _class_0 -- 485
	if _parent_0.__inherited then -- 485
		_parent_0.__inherited(_parent_0, _class_0) -- 485
	end -- 485
	Shake = _class_0 -- 485
end -- 505
local Twitchel -- 507
do -- 507
	local _class_0 -- 507
	local _parent_0 = Drink -- 507
	local _base_0 = { -- 507
		PrintName = "Twitchel", -- 509
		Model = Model("models/props_junk/garbage_plasticbottle003a.mdl"), -- 510
		Thirst = -44, -- 511
		Hunger = 6, -- 512
		Despair = 6, -- 513
		Description = "A bottle of refreshingly lukewarm, cloudy green drink.", -- 515
		Price = 80, -- 517
		TrashClass = "trash/plastic/twitchel", -- 519
		UseText = { -- 520
			"necks a bottle of twitchel.", -- 520
			"can't get enough of that green stuff.", -- 521
			"sucks down a bottle of twitchel.", -- 522
			"sips up their twitchel.", -- 523
			"pours twitchel down their throat.", -- 524
			"drinks a bottle of twitchel.", -- 525
			"slurps up a green drink." -- 526
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
		__name = "Twitchel", -- 507
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
	Twitchel = _class_0 -- 507
end -- 527
local TakeMeds -- 529
do -- 529
	local _class_0 -- 529
	local _parent_0 = SOUND -- 529
	local _base_0 = { -- 529
		sound = (function() -- 530
			local _accum_0 = { } -- 530
			local _len_0 = 1 -- 530
			for i = 1, 3 do -- 530
				_accum_0[_len_0] = "npc/zombie/zombie_pain" .. tostring(i) .. ".wav" -- 530
				_len_0 = _len_0 + 1 -- 530
			end -- 530
			return _accum_0 -- 530
		end)() -- 529
	} -- 529
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 530
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 529
			_base_0[_key_0] = _val_0 -- 529
		end -- 529
	end -- 530
	if _base_0.__index == nil then -- 529
		_base_0.__index = _base_0 -- 529
	end -- 530
	setmetatable(_base_0, _parent_0.__base) -- 529
	_class_0 = setmetatable({ -- 529
		__init = function(self, ...) -- 529
			return _class_0.__parent.__init(self, ...) -- 529
		end, -- 529
		__base = _base_0, -- 529
		__name = "TakeMeds", -- 529
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
	TakeMeds = _class_0 -- 529
end -- 530
local Medicine -- 532
do -- 532
	local _class_0 -- 532
	local _parent_0 = Food -- 532
	local _base_0 = { -- 532
		PrintName = "Medicine", -- 534
		Sound = "TakeMeds" -- 532
	} -- 532
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 534
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 532
			_base_0[_key_0] = _val_0 -- 532
		end -- 532
	end -- 534
	if _base_0.__index == nil then -- 532
		_base_0.__index = _base_0 -- 532
	end -- 534
	setmetatable(_base_0, _parent_0.__base) -- 532
	_class_0 = setmetatable({ -- 532
		__init = function(self, ...) -- 532
			return _class_0.__parent.__init(self, ...) -- 532
		end, -- 532
		__base = _base_0, -- 532
		__name = "Medicine", -- 532
		__parent = _parent_0 -- 532
	}, { -- 532
		__index = function(cls, name) -- 532
			local val = rawget(_base_0, name) -- 532
			if val == nil then -- 532
				local parent = rawget(cls, "__parent") -- 532
				if parent then -- 532
					return parent[name] -- 532
				end -- 532
			else -- 532
				return val -- 532
			end -- 532
		end, -- 532
		__call = function(cls, ...) -- 532
			local _self_0 = setmetatable({ }, _base_0) -- 532
			cls.__init(_self_0, ...) -- 532
			return _self_0 -- 532
		end -- 532
	}) -- 532
	_base_0.__class = _class_0 -- 532
	if _parent_0.__inherited then -- 532
		_parent_0.__inherited(_parent_0, _class_0) -- 532
	end -- 532
	Medicine = _class_0 -- 532
end -- 534
local Pills -- 536
do -- 536
	local _class_0 -- 536
	local _parent_0 = Medicine -- 536
	local _base_0 = { -- 536
		PrintName = "Pills", -- 538
		Model = Model("models/props_lab/jar01b.mdl"), -- 539
		HealthAdd = function(self) -- 539
			return math.random(-15, -30) -- 539
		end, -- 540
		Hunger = function(self) -- 540
			return math.random(30, 50) -- 540
		end, -- 541
		Thirst = function(self) -- 541
			return math.random(30, 60) -- 541
		end, -- 542
		Despair = function(self) -- 542
			return math.random(-60, -100) -- 542
		end, -- 544
		Description = "A white plastic bottle, full of random pills.", -- 546
		Price = 125, -- 548
		TrashClass = "trash/plastic/pills", -- 550
		UseText = { -- 551
			"throws a mess of pills into eir mouth.", -- 551
			"consumes the whole contents of a pill bottle.", -- 552
			"devours handfuls of scary-looking pills.", -- 553
			"chokes down some strange pills.", -- 554
			"takes their medicine, like a good citizen should.", -- 555
			"swallows a mouthful of pills.", -- 556
			"takes an excessive dose of colorful pills.", -- 557
			"tosses back an entire bottle of pills.", -- 558
			"throws back a bottle of mystery pills." -- 559
		} -- 536
	} -- 536
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 560
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 536
			_base_0[_key_0] = _val_0 -- 536
		end -- 536
	end -- 560
	if _base_0.__index == nil then -- 536
		_base_0.__index = _base_0 -- 536
	end -- 560
	setmetatable(_base_0, _parent_0.__base) -- 536
	_class_0 = setmetatable({ -- 536
		__init = function(self, ...) -- 536
			return _class_0.__parent.__init(self, ...) -- 536
		end, -- 536
		__base = _base_0, -- 536
		__name = "Pills", -- 536
		__parent = _parent_0 -- 536
	}, { -- 536
		__index = function(cls, name) -- 536
			local val = rawget(_base_0, name) -- 536
			if val == nil then -- 536
				local parent = rawget(cls, "__parent") -- 536
				if parent then -- 536
					return parent[name] -- 536
				end -- 536
			else -- 536
				return val -- 536
			end -- 536
		end, -- 536
		__call = function(cls, ...) -- 536
			local _self_0 = setmetatable({ }, _base_0) -- 536
			cls.__init(_self_0, ...) -- 536
			return _self_0 -- 536
		end -- 536
	}) -- 536
	_base_0.__class = _class_0 -- 536
	if _parent_0.__inherited then -- 536
		_parent_0.__inherited(_parent_0, _class_0) -- 536
	end -- 536
	Pills = _class_0 -- 536
end -- 560
local TimeGas -- 562
do -- 562
	local _class_0 -- 562
	local _parent_0 = Medicine -- 562
	local _base_0 = { -- 562
		PrintName = "Time Gas", -- 564
		Model = Model("models/props_wasteland/prison_sinkchunk001e.mdl"), -- 565
		Sound = (function() -- 565
			local _accum_0 = { } -- 565
			local _len_0 = 1 -- 565
			for i = 2, 3 do -- 565
				_accum_0[_len_0] = "npc/fast_zombie/idle" .. tostring(i) -- 565
				_len_0 = _len_0 + 1 -- 565
			end -- 565
			return _accum_0 -- 565
		end)(), -- 566
		AddHealth = function(self) -- 566
			return math.random(20, 40) -- 566
		end, -- 567
		Hunger = function(self) -- 567
			return math.random(10, 20) -- 567
		end, -- 568
		Thirst = function(self) -- 568
			return math.random(20, 30) -- 568
		end, -- 569
		Despair = function(self) -- 569
			return math.random(0, 10) -- 569
		end, -- 571
		Description = "An inhaler of time acceleration gas.\nSpeeds up healing, and dying.", -- 573
		Price = 100, -- 575
		TrashClass = "trash/inhaler", -- 577
		UseText = { -- 578
			"breathes in some time gas.", -- 578
			"huffs a healing gas.", -- 579
			"isn't yet tired of the time gas.", -- 580
			"inhales a big cloud of time gas.", -- 581
			"takes a deep breath of time gas.", -- 582
			"drags in a lungful of time gas.", -- 583
			"sniffs up a cloud of time gas.", -- 584
			"huffs time gas from the rusty inhaler." -- 585
		} -- 562
	} -- 562
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 586
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 562
			_base_0[_key_0] = _val_0 -- 562
		end -- 562
	end -- 586
	if _base_0.__index == nil then -- 562
		_base_0.__index = _base_0 -- 562
	end -- 586
	setmetatable(_base_0, _parent_0.__base) -- 562
	_class_0 = setmetatable({ -- 562
		__init = function(self, ...) -- 562
			return _class_0.__parent.__init(self, ...) -- 562
		end, -- 562
		__base = _base_0, -- 562
		__name = "TimeGas", -- 562
		__parent = _parent_0 -- 562
	}, { -- 562
		__index = function(cls, name) -- 562
			local val = rawget(_base_0, name) -- 562
			if val == nil then -- 562
				local parent = rawget(cls, "__parent") -- 562
				if parent then -- 562
					return parent[name] -- 562
				end -- 562
			else -- 562
				return val -- 562
			end -- 562
		end, -- 562
		__call = function(cls, ...) -- 562
			local _self_0 = setmetatable({ }, _base_0) -- 562
			cls.__init(_self_0, ...) -- 562
			return _self_0 -- 562
		end -- 562
	}) -- 562
	_base_0.__class = _class_0 -- 562
	if _parent_0.__inherited then -- 562
		_parent_0.__inherited(_parent_0, _class_0) -- 562
	end -- 562
	TimeGas = _class_0 -- 562
end -- 586
local Bleach -- 588
do -- 588
	local _class_0 -- 588
	local _parent_0 = Medicine -- 588
	local _base_0 = { -- 588
		PrintName = "Chlorine", -- 590
		Model = Model("models/props_junk/garbage_plasticbottle002a.mdl"), -- 591
		Sound = "DrinkFluid", -- 593
		Description = "Do NOT even think about drinking this. \n Last guy who tried couldn't even finish it before falling over.", -- 594
		HealthAdd = -50, -- 595
		Hunger = 40, -- 596
		Thirst = -40, -- 597
		Despair = { -- 599
			Description = "A jug full of bleach." -- 599
		}, -- 600
		Price = 100, -- 602
		TrashClass = "trash/plastic/bleach", -- 604
		UseText = { -- 605
			"drinks bleach.", -- 605
			"chugs an entire fucking jug of chlorine.", -- 606
			"unscrews a jug of bleach and pours it down the hatch.", -- 607
			"chokes down gulp after gulp of chlorine bleach." -- 608
		} -- 588
	} -- 588
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 609
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 588
			_base_0[_key_0] = _val_0 -- 588
		end -- 588
	end -- 609
	if _base_0.__index == nil then -- 588
		_base_0.__index = _base_0 -- 588
	end -- 609
	setmetatable(_base_0, _parent_0.__base) -- 588
	_class_0 = setmetatable({ -- 588
		__init = function(self, ...) -- 588
			return _class_0.__parent.__init(self, ...) -- 588
		end, -- 588
		__base = _base_0, -- 588
		__name = "Bleach", -- 588
		__parent = _parent_0 -- 588
	}, { -- 588
		__index = function(cls, name) -- 588
			local val = rawget(_base_0, name) -- 588
			if val == nil then -- 588
				local parent = rawget(cls, "__parent") -- 588
				if parent then -- 588
					return parent[name] -- 588
				end -- 588
			else -- 588
				return val -- 588
			end -- 588
		end, -- 588
		__call = function(cls, ...) -- 588
			local _self_0 = setmetatable({ }, _base_0) -- 588
			cls.__init(_self_0, ...) -- 588
			return _self_0 -- 588
		end -- 588
	}) -- 588
	_base_0.__class = _class_0 -- 588
	if _parent_0.__inherited then -- 588
		_parent_0.__inherited(_parent_0, _class_0) -- 588
	end -- 588
	Bleach = _class_0 -- 588
end -- 609
local Ambrosia -- 611
do -- 611
	local _class_0 -- 611
	local _parent_0 = Food -- 611
	local _base_0 = { -- 611
		PrintName = "Ambrosia", -- 613
		Model = Model("models/Gibs/HGIBS.mdl"), -- 614
		Hunger = -100, -- 615
		Thirst = -100, -- 616
		Despair = -100, -- 617
		HealthAdd = 100, -- 618
		Description = "A food made for gods.", -- 619
		RotTime = 0, -- 621
		UseText = { -- 622
			"indulges in some ambrosia." -- 622
		}, -- 625
		Precursor = { -- 626
			biomass = 15, -- 626
			wood = 15, -- 627
			metal = 15 -- 628
		}, -- 630
		Eat = function(self, ply) -- 630
			_class_0.__parent.__base.Eat(self, ply) -- 631
			if CLIENT then -- 632
				return -- 632
			end -- 632
			return ply:AddStemCells(5) -- 633
		end -- 611
	} -- 611
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 633
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 611
			_base_0[_key_0] = _val_0 -- 611
		end -- 611
	end -- 633
	if _base_0.__index == nil then -- 611
		_base_0.__index = _base_0 -- 611
	end -- 633
	setmetatable(_base_0, _parent_0.__base) -- 611
	_class_0 = setmetatable({ -- 611
		__init = function(self, ...) -- 611
			return _class_0.__parent.__init(self, ...) -- 611
		end, -- 611
		__base = _base_0, -- 611
		__name = "Ambrosia", -- 611
		__parent = _parent_0 -- 611
	}, { -- 611
		__index = function(cls, name) -- 611
			local val = rawget(_base_0, name) -- 611
			if val == nil then -- 611
				local parent = rawget(cls, "__parent") -- 611
				if parent then -- 611
					return parent[name] -- 611
				end -- 611
			else -- 611
				return val -- 611
			end -- 611
		end, -- 611
		__call = function(cls, ...) -- 611
			local _self_0 = setmetatable({ }, _base_0) -- 611
			cls.__init(_self_0, ...) -- 611
			return _self_0 -- 611
		end -- 611
	}) -- 611
	_base_0.__class = _class_0 -- 611
	if _parent_0.__inherited then -- 611
		_parent_0.__inherited(_parent_0, _class_0) -- 611
	end -- 611
	Ambrosia = _class_0 -- 611
end -- 633
local Chow -- 635
do -- 635
	local _class_0 -- 635
	local _parent_0 = Food -- 635
	local _base_0 = { -- 635
		PrintName = "Wasteland Chow", -- 637
		Model = Model("models/props_junk/garbage_takeoutcarton001a.mdl"), -- 638
		Hunger = -20, -- 639
		Thirst = -6, -- 640
		Despair = 10, -- 641
		Description = "An amalgamation of entrails, bones, and rotten flesh with a side of maggots. \n Wastelanders love it!", -- 642
		RotTime = 0, -- 643
		CookTime = 10, -- 645
		UseText = { -- 646
			"begrudgingly eats some wasteland chow.", -- 646
			"puts some chow in their mouth while gagging.", -- 647
			"eats some wasteland chow, then spits out the tiny bones.", -- 648
			"chomps on some wasteland chow.", -- 649
			"forces down some wasteland chow down their throat.", -- 650
			"eats some chow, secretly enjoying it" -- 651
		}, -- 654
		Eat = function(self, ply) -- 654
			_class_0.__parent.__base.Eat(self, ply) -- 655
			if CLIENT then -- 656
				return -- 656
			end -- 656
			local plyJob = RPExtraTeams[ply:Team()] -- 657
			if plyJob.category == "Wasteland" then -- 658
				ply:AddDespair(-30) -- 659
				ply:AddHunger(-30) -- 660
				return ply:AddThirst(-10) -- 661
			end -- 658
		end -- 635
	} -- 635
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 661
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 635
			_base_0[_key_0] = _val_0 -- 635
		end -- 635
	end -- 661
	if _base_0.__index == nil then -- 635
		_base_0.__index = _base_0 -- 635
	end -- 661
	setmetatable(_base_0, _parent_0.__base) -- 635
	_class_0 = setmetatable({ -- 635
		__init = function(self, ...) -- 635
			return _class_0.__parent.__init(self, ...) -- 635
		end, -- 635
		__base = _base_0, -- 635
		__name = "Chow", -- 635
		__parent = _parent_0 -- 635
	}, { -- 635
		__index = function(cls, name) -- 635
			local val = rawget(_base_0, name) -- 635
			if val == nil then -- 635
				local parent = rawget(cls, "__parent") -- 635
				if parent then -- 635
					return parent[name] -- 635
				end -- 635
			else -- 635
				return val -- 635
			end -- 635
		end, -- 635
		__call = function(cls, ...) -- 635
			local _self_0 = setmetatable({ }, _base_0) -- 635
			cls.__init(_self_0, ...) -- 635
			return _self_0 -- 635
		end -- 635
	}) -- 635
	_base_0.__class = _class_0 -- 635
	if _parent_0.__inherited then -- 635
		_parent_0.__inherited(_parent_0, _class_0) -- 635
	end -- 635
	Chow = _class_0 -- 635
end -- 661
local SloppyRibs -- 664
do -- 664
	local _class_0 -- 664
	local _parent_0 = Food -- 664
	local _base_0 = { -- 664
		PrintName = "Sloppy Ribs", -- 666
		Model = Model("models/vel/evilwar/sloppyribs.mdl"), -- 667
		Hunger = -28, -- 668
		Thirst = -4, -- 669
		Despair = -15, -- 670
		Description = "Fresh ribs from an unknown source, now glazed in slop! \n They look delicious.", -- 672
		CookTime = 10, -- 674
		Price = 115, -- 675
		UseText = { -- 676
			"devours all of the flesh and slop on the rib, then throws it away.", -- 676
			"munches on the rib, and then licks the glaze off his hands.", -- 677
			"gobbles down the rib, and spits out the bone." -- 678
		} -- 664
	} -- 664
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 678
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 664
			_base_0[_key_0] = _val_0 -- 664
		end -- 664
	end -- 678
	if _base_0.__index == nil then -- 664
		_base_0.__index = _base_0 -- 664
	end -- 678
	setmetatable(_base_0, _parent_0.__base) -- 664
	_class_0 = setmetatable({ -- 664
		__init = function(self, ...) -- 664
			return _class_0.__parent.__init(self, ...) -- 664
		end, -- 664
		__base = _base_0, -- 664
		__name = "SloppyRibs", -- 664
		__parent = _parent_0 -- 664
	}, { -- 664
		__index = function(cls, name) -- 664
			local val = rawget(_base_0, name) -- 664
			if val == nil then -- 664
				local parent = rawget(cls, "__parent") -- 664
				if parent then -- 664
					return parent[name] -- 664
				end -- 664
			else -- 664
				return val -- 664
			end -- 664
		end, -- 664
		__call = function(cls, ...) -- 664
			local _self_0 = setmetatable({ }, _base_0) -- 664
			cls.__init(_self_0, ...) -- 664
			return _self_0 -- 664
		end -- 664
	}) -- 664
	_base_0.__class = _class_0 -- 664
	if _parent_0.__inherited then -- 664
		_parent_0.__inherited(_parent_0, _class_0) -- 664
	end -- 664
	SloppyRibs = _class_0 -- 664
end -- 678
local EyeballNoodles -- 681
do -- 681
	local _class_0 -- 681
	local _parent_0 = Food -- 681
	local _base_0 = { -- 681
		PrintName = "Eyeball Noodles", -- 683
		Model = Model("models/vel/evilwar/eyenoodle.mdl"), -- 684
		Hunger = -40, -- 685
		Thirst = -20, -- 686
		Despair = -20, -- 687
		Description = "A traditional Lymphomian dish, usually served to go. \n The texture is an acquired taste.", -- 689
		CookTime = 8, -- 691
		Price = 130, -- 693
		UseText = { -- 694
			"slurps all of the noodles.", -- 694
			"slurps the noodles, gagging at the wet crunch of the eyeball.", -- 695
			"eats the noodles, and then spits out the eyeball.", -- 696
			"gags on the noodles, and then throws out the eyeball." -- 697
		} -- 681
	} -- 681
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 698
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 681
			_base_0[_key_0] = _val_0 -- 681
		end -- 681
	end -- 698
	if _base_0.__index == nil then -- 681
		_base_0.__index = _base_0 -- 681
	end -- 698
	setmetatable(_base_0, _parent_0.__base) -- 681
	_class_0 = setmetatable({ -- 681
		__init = function(self, ...) -- 681
			return _class_0.__parent.__init(self, ...) -- 681
		end, -- 681
		__base = _base_0, -- 681
		__name = "EyeballNoodles", -- 681
		__parent = _parent_0 -- 681
	}, { -- 681
		__index = function(cls, name) -- 681
			local val = rawget(_base_0, name) -- 681
			if val == nil then -- 681
				local parent = rawget(cls, "__parent") -- 681
				if parent then -- 681
					return parent[name] -- 681
				end -- 681
			else -- 681
				return val -- 681
			end -- 681
		end, -- 681
		__call = function(cls, ...) -- 681
			local _self_0 = setmetatable({ }, _base_0) -- 681
			cls.__init(_self_0, ...) -- 681
			return _self_0 -- 681
		end -- 681
	}) -- 681
	_base_0.__class = _class_0 -- 681
	if _parent_0.__inherited then -- 681
		_parent_0.__inherited(_parent_0, _class_0) -- 681
	end -- 681
	EyeballNoodles = _class_0 -- 681
end -- 698
local PaperMache -- 700
do -- 700
	local _class_0 -- 700
	local _parent_0 = Food -- 700
	local _base_0 = { -- 700
		PrintName = "Paper Mache", -- 702
		Model = Model("models/props_junk/garbage_bag001a.mdl"), -- 703
		Hunger = -10, -- 704
		Thirst = -10, -- 705
		Despair = 15, -- 706
		Description = "An old crumpled paper. \n now it's watered down into a little ball.", -- 708
		CookTime = 3, -- 710
		Price = 30, -- 712
		UseText = { -- 713
			"stoves the paper mache into his mouth, gagging horribly.", -- 713
			"forces the paper down his throat, throwing up slightly", -- 714
			"rips apart the paper mache, eating small pieces at a time.", -- 715
			"looks miserable trying to eat watered down paper." -- 716
		} -- 700
	} -- 700
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 716
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 700
			_base_0[_key_0] = _val_0 -- 700
		end -- 700
	end -- 716
	if _base_0.__index == nil then -- 700
		_base_0.__index = _base_0 -- 700
	end -- 716
	setmetatable(_base_0, _parent_0.__base) -- 700
	_class_0 = setmetatable({ -- 700
		__init = function(self, ...) -- 700
			return _class_0.__parent.__init(self, ...) -- 700
		end, -- 700
		__base = _base_0, -- 700
		__name = "PaperMache", -- 700
		__parent = _parent_0 -- 700
	}, { -- 700
		__index = function(cls, name) -- 700
			local val = rawget(_base_0, name) -- 700
			if val == nil then -- 700
				local parent = rawget(cls, "__parent") -- 700
				if parent then -- 700
					return parent[name] -- 700
				end -- 700
			else -- 700
				return val -- 700
			end -- 700
		end, -- 700
		__call = function(cls, ...) -- 700
			local _self_0 = setmetatable({ }, _base_0) -- 700
			cls.__init(_self_0, ...) -- 700
			return _self_0 -- 700
		end -- 700
	}) -- 700
	_base_0.__class = _class_0 -- 700
	if _parent_0.__inherited then -- 700
		_parent_0.__inherited(_parent_0, _class_0) -- 700
	end -- 700
	PaperMache = _class_0 -- 700
	return _class_0 -- 716
end -- 716
