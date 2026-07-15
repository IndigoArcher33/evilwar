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
local Food -- 5
do -- 5
	local _class_0 -- 5
	local _parent_0 = ITEM -- 5
	local _base_0 = { -- 5
		SetupDataTables = function(self) -- 6
			_class_0.__parent.__base.SetupDataTables(self) -- 7
			return self:NetworkVar("Bool", "Rotten") -- 8
		end, -- 10
		PrintName = "Food", -- 11
		Model = Model("models/props_junk/garbage_plasticbottle002a.mdl"), -- 12
		Category = "EvilRP: Food", -- 13
		Spawnable = true, -- 14
		Interesting = true, -- 16
		Sound = Sound("npc/barnacle/barnacle_crunch2.wav"), -- 18
		Hunger = 0, -- 19
		Thirst = 0, -- 20
		Despair = 0, -- 21
		HealthAdd = 0, -- 23
		RotTime = 0, -- 25
		Eat = function(self, ply) -- 25
			if CLIENT then -- 26
				return -- 26
			end -- 26
			local amt -- 27
			if self.Hunger then -- 28
				amt = self.Hunger -- 29
				if isfunction(amt) then -- 30
					amt = amt() -- 30
				end -- 30
				ply:AddHunger(amt) -- 31
			end -- 28
			if self.Thirst then -- 32
				amt = self.Thirst -- 33
				if isfunction(amt) then -- 34
					amt = amt() -- 34
				end -- 34
				ply:AddThirst(amt) -- 35
			end -- 32
			if self.Despair then -- 36
				amt = self.Despair -- 37
				if isfunction(amt) then -- 38
					amt = amt() -- 38
				end -- 38
				ply:AddDespair(amt) -- 39
			end -- 36
			if self.HealthAdd then -- 40
				amt = self.HealthAdd -- 41
				if isfunction(amt) then -- 42
					amt = amt() -- 42
				end -- 42
				if amt > 0 then -- 43
					ply:SetHealth(math.min(ply:Health() + amt, ply:GetMaxHealth())) -- 44
				elseif amt < 0 then -- 45
					ply:TakeDamage(-amt) -- 46
				end -- 43
			end -- 40
			if not self.PersistAfterEat then -- 49
				return self:Trash() -- 49
			end -- 49
		end, -- 51
		OnUseFinish = function(self, ply) -- 51
			_class_0.__parent.__base.OnUseFinish(self, ply) -- 52
			return self:Eat(ply) -- 53
		end, -- 55
		OnSpawned = function(self) -- 55
			_class_0.__parent.__base.OnSpawned(self) -- 56
			self:SetRotten(false) -- 57
			if self.RotTime > 0 then -- 58
				self.RotsIn = CurTime() + self.RotTime -- 58
			end -- 58
			return -- 59
		end, -- 61
		Think = function(self) -- 61
			_class_0.__parent.__base.Think(self) -- 62
			if CLIENT then -- 63
				return -- 63
			end -- 63
			if self.RotsIn and (not self:GetRotten()) and self.RotsIn < CurTime() then -- 64
				return self:Rot() -- 64
			end -- 64
		end, -- 66
		Rot = function(self) -- 66
			self:SetRotten(true) -- 67
			self:SetColor(Color(100, 0, 150)) -- 68
			return self:EmitSound("FoodRot") -- 69
		end -- 5
	} -- 5
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 69
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 5
			_base_0[_key_0] = _val_0 -- 5
		end -- 5
	end -- 69
	if _base_0.__index == nil then -- 5
		_base_0.__index = _base_0 -- 5
	end -- 69
	setmetatable(_base_0, _parent_0.__base) -- 5
	_class_0 = setmetatable({ -- 5
		__init = function(self, ...) -- 5
			return _class_0.__parent.__init(self, ...) -- 5
		end, -- 5
		__base = _base_0, -- 5
		__name = "Food", -- 5
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
	Food = _class_0 -- 5
end -- 69
local SlopSkull -- 71
do -- 71
	local _class_0 -- 71
	local _parent_0 = Food -- 71
	local _base_0 = { -- 71
		PrintName = "Slop Skull", -- 73
		Model = Model("models/Gibs/HGIBS.mdl"), -- 74
		Hunger = -10, -- 75
		Description = "A bloody, festering human skull.\nThe brain is still largely intact.", -- 76
		RotTime = 120, -- 78
		UseText = { -- 79
			"munches and crunches on a slop skull.", -- 79
			"slurps the brain matter out of a slop skull.", -- 80
			"digs around in a slop skull with their tongue.", -- 81
			"ravenously consumes a slop skull.", -- 82
			"gets pink sludge everywhere while eating a slop skull.", -- 83
			"scours a slop skull for brainmeat.", -- 84
			"cracks open a slop skull and slurps the brains out." -- 85
		}, -- 88
		Precursor = { -- 89
			biomass = 1 -- 89
		} -- 71
	} -- 71
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 89
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 71
			_base_0[_key_0] = _val_0 -- 71
		end -- 71
	end -- 89
	if _base_0.__index == nil then -- 71
		_base_0.__index = _base_0 -- 71
	end -- 89
	setmetatable(_base_0, _parent_0.__base) -- 71
	_class_0 = setmetatable({ -- 71
		__init = function(self, ...) -- 71
			return _class_0.__parent.__init(self, ...) -- 71
		end, -- 71
		__base = _base_0, -- 71
		__name = "SlopSkull", -- 71
		__parent = _parent_0 -- 71
	}, { -- 71
		__index = function(cls, name) -- 71
			local val = rawget(_base_0, name) -- 71
			if val == nil then -- 71
				local parent = rawget(cls, "__parent") -- 71
				if parent then -- 71
					return parent[name] -- 71
				end -- 71
			else -- 71
				return val -- 71
			end -- 71
		end, -- 71
		__call = function(cls, ...) -- 71
			local _self_0 = setmetatable({ }, _base_0) -- 71
			cls.__init(_self_0, ...) -- 71
			return _self_0 -- 71
		end -- 71
	}) -- 71
	_base_0.__class = _class_0 -- 71
	if _parent_0.__inherited then -- 71
		_parent_0.__inherited(_parent_0, _class_0) -- 71
	end -- 71
	SlopSkull = _class_0 -- 71
end -- 89
local Paper -- 91
do -- 91
	local _class_0 -- 91
	local _parent_0 = Food -- 91
	local _base_0 = { -- 91
		PrintName = "Paper", -- 93
		Model = Model("models/props_lab/papersheet001a.mdl"), -- 94
		Hunger = -7, -- 95
		Thirst = 10, -- 96
		Description = "A dirty scrap of used paper.\nThe writing is too faint to make out.", -- 98
		UseText = { -- 99
			"chokes down a sheet of paper.", -- 99
			"tears up and eats a sheet of paper.", -- 100
			"chews the paper into a stiff pulp and swallows.", -- 101
			"struggles to swallow a dry sheet of paper.", -- 102
			"eats paper.", -- 103
			"crumples up some paper and struggles to chew it.", -- 104
			"munches on a piece of paper." -- 105
		} -- 91
	} -- 91
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 106
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 91
			_base_0[_key_0] = _val_0 -- 91
		end -- 91
	end -- 106
	if _base_0.__index == nil then -- 91
		_base_0.__index = _base_0 -- 91
	end -- 106
	setmetatable(_base_0, _parent_0.__base) -- 91
	_class_0 = setmetatable({ -- 91
		__init = function(self, ...) -- 91
			return _class_0.__parent.__init(self, ...) -- 91
		end, -- 91
		__base = _base_0, -- 91
		__name = "Paper", -- 91
		__parent = _parent_0 -- 91
	}, { -- 91
		__index = function(cls, name) -- 91
			local val = rawget(_base_0, name) -- 91
			if val == nil then -- 91
				local parent = rawget(cls, "__parent") -- 91
				if parent then -- 91
					return parent[name] -- 91
				end -- 91
			else -- 91
				return val -- 91
			end -- 91
		end, -- 91
		__call = function(cls, ...) -- 91
			local _self_0 = setmetatable({ }, _base_0) -- 91
			cls.__init(_self_0, ...) -- 91
			return _self_0 -- 91
		end -- 91
	}) -- 91
	_base_0.__class = _class_0 -- 91
	if _parent_0.__inherited then -- 91
		_parent_0.__inherited(_parent_0, _class_0) -- 91
	end -- 91
	Paper = _class_0 -- 91
end -- 106
local RibBone -- 108
do -- 108
	local _class_0 -- 108
	local _parent_0 = Food -- 108
	local _base_0 = { -- 108
		PrintName = "Dry Rib", -- 110
		Model = Model("models/Gibs/hgibs_rib.mdl"), -- 111
		Hunger = -8, -- 112
		HealthAdd = -7, -- 113
		RotTime = 240, -- 114
		Description = "A lone human rib.\nYou could chew the marrow out, but it'd probably hurt.", -- 116
		UseText = { -- 117
			"breaks a tooth chewing on a rib bone.", -- 117
			"sucks marrow and bone shards from the rib.", -- 118
			"cuts up their throat eating a rib bone.", -- 119
			"bleeds from the mouth as they eat a rib bone.", -- 120
			"eats a bone, like a vulture.", -- 121
			"chokes on the broken points of a rib bone." -- 122
		}, -- 125
		Precursor = { -- 126
			biomass = 1 -- 126
		} -- 108
	} -- 108
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 126
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 108
			_base_0[_key_0] = _val_0 -- 108
		end -- 108
	end -- 126
	if _base_0.__index == nil then -- 108
		_base_0.__index = _base_0 -- 108
	end -- 126
	setmetatable(_base_0, _parent_0.__base) -- 108
	_class_0 = setmetatable({ -- 108
		__init = function(self, ...) -- 108
			return _class_0.__parent.__init(self, ...) -- 108
		end, -- 108
		__base = _base_0, -- 108
		__name = "RibBone", -- 108
		__parent = _parent_0 -- 108
	}, { -- 108
		__index = function(cls, name) -- 108
			local val = rawget(_base_0, name) -- 108
			if val == nil then -- 108
				local parent = rawget(cls, "__parent") -- 108
				if parent then -- 108
					return parent[name] -- 108
				end -- 108
			else -- 108
				return val -- 108
			end -- 108
		end, -- 108
		__call = function(cls, ...) -- 108
			local _self_0 = setmetatable({ }, _base_0) -- 108
			cls.__init(_self_0, ...) -- 108
			return _self_0 -- 108
		end -- 108
	}) -- 108
	_base_0.__class = _class_0 -- 108
	if _parent_0.__inherited then -- 108
		_parent_0.__inherited(_parent_0, _class_0) -- 108
	end -- 108
	RibBone = _class_0 -- 108
end -- 126
local Skin -- 128
do -- 128
	local _class_0 -- 128
	local _parent_0 = Food -- 128
	local _base_0 = { -- 128
		PrintName = "Skin", -- 130
		Description = "A greasy patch of some kind of hide.\nIt would probably taste nasty.", -- 131
		Model = Model("models/gibs/antlion_gib_small_2.mdl"), -- 132
		HealthAdd = function(self) -- 132
			return math.random(10, 20) -- 132
		end -- 128
	} -- 128
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 132
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 128
			_base_0[_key_0] = _val_0 -- 128
		end -- 128
	end -- 132
	if _base_0.__index == nil then -- 128
		_base_0.__index = _base_0 -- 128
	end -- 132
	setmetatable(_base_0, _parent_0.__base) -- 128
	_class_0 = setmetatable({ -- 128
		__init = function(self, ...) -- 128
			return _class_0.__parent.__init(self, ...) -- 128
		end, -- 128
		__base = _base_0, -- 128
		__name = "Skin", -- 128
		__parent = _parent_0 -- 128
	}, { -- 128
		__index = function(cls, name) -- 128
			local val = rawget(_base_0, name) -- 128
			if val == nil then -- 128
				local parent = rawget(cls, "__parent") -- 128
				if parent then -- 128
					return parent[name] -- 128
				end -- 128
			else -- 128
				return val -- 128
			end -- 128
		end, -- 128
		__call = function(cls, ...) -- 128
			local _self_0 = setmetatable({ }, _base_0) -- 128
			cls.__init(_self_0, ...) -- 128
			return _self_0 -- 128
		end -- 128
	}) -- 128
	_base_0.__class = _class_0 -- 128
	if _parent_0.__inherited then -- 128
		_parent_0.__inherited(_parent_0, _class_0) -- 128
	end -- 128
	Skin = _class_0 -- 128
end -- 132
local Abortion -- 134
do -- 134
	local _class_0 -- 134
	local _parent_0 = Food -- 134
	local _base_0 = { -- 134
		PrintName = "Abortion", -- 136
		Model = Model("models/props_c17/doll01.mdl"), -- 137
		Hunger = -23, -- 138
		Thirst = -20, -- 139
		HealthAdd = 20, -- 140
		RotTime = 240, -- 141
		Description = "An artificial baby that never got the chance to be born.\nDelicious.", -- 143
		UseText = { -- 144
			"eats a baby.", -- 144
			"rips apart an abortion and eats the pieces.", -- 145
			"bites the head off an abortion and swallows the rest.", -- 146
			"chews an abortion into pink paste.", -- 147
			"tears chunks off an abortion until it's all gone.", -- 148
			"eats an abortion, baby blood dribbling down their neck.", -- 149
			"eats an abortion legs-first." -- 150
		}, -- 153
		Eat = function(self, ply) -- 153
			_class_0.__parent.__base.Eat(self, ply) -- 154
			if CLIENT then -- 155
				return -- 155
			end -- 155
			return ply:AddStemCells(1) -- 156
		end -- 134
	} -- 134
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 156
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 134
			_base_0[_key_0] = _val_0 -- 134
		end -- 134
	end -- 156
	if _base_0.__index == nil then -- 134
		_base_0.__index = _base_0 -- 134
	end -- 156
	setmetatable(_base_0, _parent_0.__base) -- 134
	_class_0 = setmetatable({ -- 134
		__init = function(self, ...) -- 134
			return _class_0.__parent.__init(self, ...) -- 134
		end, -- 134
		__base = _base_0, -- 134
		__name = "Abortion", -- 134
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
	Abortion = _class_0 -- 134
end -- 156
local LiveBaby -- 158
do -- 158
	local _class_0 -- 158
	local _parent_0 = Food -- 158
	local _base_0 = { -- 158
		PrintName = "Live baby", -- 160
		Model = Model("models/props_c17/doll01.mdl"), -- 161
		Hunger = -52, -- 162
		Thirst = -47, -- 163
		HealthAdd = 40, -- 164
		RotTime = 480, -- 165
		Description = "An artifical baby, born paralyzed below the eyes.\nIt will know nothing but fear and pain.", -- 167
		UseText = { -- 168
			"eats a living infant.", -- 168
			"chews the head off a live baby and drinks its blood.", -- 169
			"eats a baby alive.", -- 170
			"eats a live baby and tastes its tears.", -- 171
			"rips apart a living baby and eats the pieces.", -- 172
			"tears open a live baby and feeds on its entrails.", -- 173
			"eats a live baby as it cries silently." -- 174
		} -- 158
	} -- 158
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 175
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 158
			_base_0[_key_0] = _val_0 -- 158
		end -- 158
	end -- 175
	if _base_0.__index == nil then -- 158
		_base_0.__index = _base_0 -- 158
	end -- 175
	setmetatable(_base_0, _parent_0.__base) -- 158
	_class_0 = setmetatable({ -- 158
		__init = function(self, ...) -- 158
			return _class_0.__parent.__init(self, ...) -- 158
		end, -- 158
		__base = _base_0, -- 158
		__name = "LiveBaby", -- 158
		__parent = _parent_0 -- 158
	}, { -- 158
		__index = function(cls, name) -- 158
			local val = rawget(_base_0, name) -- 158
			if val == nil then -- 158
				local parent = rawget(cls, "__parent") -- 158
				if parent then -- 158
					return parent[name] -- 158
				end -- 158
			else -- 158
				return val -- 158
			end -- 158
		end, -- 158
		__call = function(cls, ...) -- 158
			local _self_0 = setmetatable({ }, _base_0) -- 158
			cls.__init(_self_0, ...) -- 158
			return _self_0 -- 158
		end -- 158
	}) -- 158
	_base_0.__class = _class_0 -- 158
	if _parent_0.__inherited then -- 158
		_parent_0.__inherited(_parent_0, _class_0) -- 158
	end -- 158
	LiveBaby = _class_0 -- 158
end -- 175
local SoyLoaf -- 177
do -- 177
	local _class_0 -- 177
	local _parent_0 = Food -- 177
	local _base_0 = { -- 177
		PrintName = "Soylent Loaf", -- 179
		Model = Model("models/leakgibs/antlion_gib_small_3.mdl"), -- 180
		Hunger = -15, -- 181
		Thirst = 3, -- 182
		Despair = 5, -- 183
		Description = "A chewy loaf of dried Long Pig byproducts.\nLoathsome food, but it'll keep for a century.", -- 185
		Price = 20, -- 187
		UseText = { -- 188
			"gnaws at a soylent loaf.", -- 188
			"chokes down a soylent loaf.", -- 189
			"struggles to eat a soylent loaf.", -- 190
			"chomps on a loaf of mummified meat.", -- 191
			"grinds their teeth on a soylent loaf.", -- 192
			"chews off a chunk from a soylent loaf.", -- 193
			"eats some soylent, like a good citizen should." -- 194
		} -- 177
	} -- 177
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 195
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 177
			_base_0[_key_0] = _val_0 -- 177
		end -- 177
	end -- 195
	if _base_0.__index == nil then -- 177
		_base_0.__index = _base_0 -- 177
	end -- 195
	setmetatable(_base_0, _parent_0.__base) -- 177
	_class_0 = setmetatable({ -- 177
		__init = function(self, ...) -- 177
			return _class_0.__parent.__init(self, ...) -- 177
		end, -- 177
		__base = _base_0, -- 177
		__name = "SoyLoaf", -- 177
		__parent = _parent_0 -- 177
	}, { -- 177
		__index = function(cls, name) -- 177
			local val = rawget(_base_0, name) -- 177
			if val == nil then -- 177
				local parent = rawget(cls, "__parent") -- 177
				if parent then -- 177
					return parent[name] -- 177
				end -- 177
			else -- 177
				return val -- 177
			end -- 177
		end, -- 177
		__call = function(cls, ...) -- 177
			local _self_0 = setmetatable({ }, _base_0) -- 177
			cls.__init(_self_0, ...) -- 177
			return _self_0 -- 177
		end -- 177
	}) -- 177
	_base_0.__class = _class_0 -- 177
	if _parent_0.__inherited then -- 177
		_parent_0.__inherited(_parent_0, _class_0) -- 177
	end -- 177
	SoyLoaf = _class_0 -- 177
end -- 195
local Boot -- 197
do -- 197
	local _class_0 -- 197
	local _parent_0 = Food -- 197
	local _base_0 = { -- 197
		PrintName = "Boot", -- 199
		Model = Model("models/props_junk/Shoe001a.mdl"), -- 200
		AddHealth = -4, -- 201
		Hunger = -5, -- 202
		Thirst = 40, -- 203
		Despair = 40, -- 204
		Description = "A dirty old boot, nearly fallen apart.", -- 206
		UseText = { -- 207
			"chews on a nasty boot!", -- 207
			"chokes on an old boot.", -- 208
			"gnaws a boot to shreds.", -- 209
			"shoves a boot in their mouth!", -- 210
			"eats a rotten leather boot.", -- 211
			"devours a dirty old boot!", -- 212
			"eats a boot." -- 213
		} -- 197
	} -- 197
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 214
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 197
			_base_0[_key_0] = _val_0 -- 197
		end -- 197
	end -- 214
	if _base_0.__index == nil then -- 197
		_base_0.__index = _base_0 -- 197
	end -- 214
	setmetatable(_base_0, _parent_0.__base) -- 197
	_class_0 = setmetatable({ -- 197
		__init = function(self, ...) -- 197
			return _class_0.__parent.__init(self, ...) -- 197
		end, -- 197
		__base = _base_0, -- 197
		__name = "Boot", -- 197
		__parent = _parent_0 -- 197
	}, { -- 197
		__index = function(cls, name) -- 197
			local val = rawget(_base_0, name) -- 197
			if val == nil then -- 197
				local parent = rawget(cls, "__parent") -- 197
				if parent then -- 197
					return parent[name] -- 197
				end -- 197
			else -- 197
				return val -- 197
			end -- 197
		end, -- 197
		__call = function(cls, ...) -- 197
			local _self_0 = setmetatable({ }, _base_0) -- 197
			cls.__init(_self_0, ...) -- 197
			return _self_0 -- 197
		end -- 197
	}) -- 197
	_base_0.__class = _class_0 -- 197
	if _parent_0.__inherited then -- 197
		_parent_0.__inherited(_parent_0, _class_0) -- 197
	end -- 197
	Boot = _class_0 -- 197
end -- 214
local MoldMelon -- 216
do -- 216
	local _class_0 -- 216
	local _parent_0 = Food -- 216
	local _base_0 = { -- 216
		PrintName = "Mold Melon", -- 218
		Model = Model("models/gibs/antlionegg01_chunk01c.mdl"), -- 219
		AddHealth = 5, -- 220
		Hunger = function(self) -- 220
			return math.random(-10, -18) -- 220
		end, -- 221
		Description = "A pithy husk of fruit, fully colonized by white mold.", -- 223
		Price = 25, -- 225
		UseText = { -- 226
			"eats a moldy melon.", -- 226
			"devours a moldy chunk of melon.", -- 227
			"munches on a mold melon.", -- 228
			"feasts on a fungus fruit.", -- 229
			"tears into some mold melon.", -- 230
			"crunches up a mold melon.", -- 231
			"chows down on a mold melon." -- 232
		} -- 216
	} -- 216
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 233
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 216
			_base_0[_key_0] = _val_0 -- 216
		end -- 216
	end -- 233
	if _base_0.__index == nil then -- 216
		_base_0.__index = _base_0 -- 216
	end -- 233
	setmetatable(_base_0, _parent_0.__base) -- 216
	_class_0 = setmetatable({ -- 216
		__init = function(self, ...) -- 216
			return _class_0.__parent.__init(self, ...) -- 216
		end, -- 216
		__base = _base_0, -- 216
		__name = "MoldMelon", -- 216
		__parent = _parent_0 -- 216
	}, { -- 216
		__index = function(cls, name) -- 216
			local val = rawget(_base_0, name) -- 216
			if val == nil then -- 216
				local parent = rawget(cls, "__parent") -- 216
				if parent then -- 216
					return parent[name] -- 216
				end -- 216
			else -- 216
				return val -- 216
			end -- 216
		end, -- 216
		__call = function(cls, ...) -- 216
			local _self_0 = setmetatable({ }, _base_0) -- 216
			cls.__init(_self_0, ...) -- 216
			return _self_0 -- 216
		end -- 216
	}) -- 216
	_base_0.__class = _class_0 -- 216
	if _parent_0.__inherited then -- 216
		_parent_0.__inherited(_parent_0, _class_0) -- 216
	end -- 216
	MoldMelon = _class_0 -- 216
end -- 233
local DrinkFluid -- 235
do -- 235
	local _class_0 -- 235
	local _parent_0 = SOUND -- 235
	local _base_0 = { -- 235
		sound = (function() -- 236
			local _accum_0 = { } -- 236
			local _len_0 = 1 -- 236
			for i = 1, 2 do -- 236
				_accum_0[_len_0] = "npc/barnacle/barnacle_gulp" .. tostring(i) .. ".wav" -- 236
				_len_0 = _len_0 + 1 -- 236
			end -- 236
			return _accum_0 -- 236
		end)(), -- 237
		level = SNDLVL_65DB -- 235
	} -- 235
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 237
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 235
			_base_0[_key_0] = _val_0 -- 235
		end -- 235
	end -- 237
	if _base_0.__index == nil then -- 235
		_base_0.__index = _base_0 -- 235
	end -- 237
	setmetatable(_base_0, _parent_0.__base) -- 235
	_class_0 = setmetatable({ -- 235
		__init = function(self, ...) -- 235
			return _class_0.__parent.__init(self, ...) -- 235
		end, -- 235
		__base = _base_0, -- 235
		__name = "DrinkFluid", -- 235
		__parent = _parent_0 -- 235
	}, { -- 235
		__index = function(cls, name) -- 235
			local val = rawget(_base_0, name) -- 235
			if val == nil then -- 235
				local parent = rawget(cls, "__parent") -- 235
				if parent then -- 235
					return parent[name] -- 235
				end -- 235
			else -- 235
				return val -- 235
			end -- 235
		end, -- 235
		__call = function(cls, ...) -- 235
			local _self_0 = setmetatable({ }, _base_0) -- 235
			cls.__init(_self_0, ...) -- 235
			return _self_0 -- 235
		end -- 235
	}) -- 235
	_base_0.__class = _class_0 -- 235
	if _parent_0.__inherited then -- 235
		_parent_0.__inherited(_parent_0, _class_0) -- 235
	end -- 235
	DrinkFluid = _class_0 -- 235
end -- 237
local Drink -- 239
do -- 239
	local _class_0 -- 239
	local _parent_0 = Food -- 239
	local _base_0 = { -- 239
		PrintName = "Drink", -- 241
		Sound = "DrinkFluid" -- 239
	} -- 239
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 241
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 239
			_base_0[_key_0] = _val_0 -- 239
		end -- 239
	end -- 241
	if _base_0.__index == nil then -- 239
		_base_0.__index = _base_0 -- 239
	end -- 241
	setmetatable(_base_0, _parent_0.__base) -- 239
	_class_0 = setmetatable({ -- 239
		__init = function(self, ...) -- 239
			return _class_0.__parent.__init(self, ...) -- 239
		end, -- 239
		__base = _base_0, -- 239
		__name = "Drink", -- 239
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
	Drink = _class_0 -- 239
end -- 241
local FearBeer -- 243
do -- 243
	local _class_0 -- 243
	local _parent_0 = Drink -- 243
	local _base_0 = { -- 243
		PrintName = "Fear Beer", -- 245
		Model = Model("models/props_junk/garbage_glassbottle001a.mdl"), -- 246
		Thirst = -12, -- 247
		Despair = -15, -- 248
		Description = "A bottle of foul off-yellow liquid.\n'BEER' is hand-written on the label.", -- 250
		Price = 60, -- 252
		TrashClass = "trash/bottle/fearbeer", -- 254
		ImpactThreshold = 256, -- 256
		UseText = { -- 257
			"chugs a fear beer.", -- 257
			"downs a bottle of piss beer.", -- 258
			"drinks a ratty bottle of brew.", -- 259
			"quaffs a beer and grimaces.", -- 260
			"takes a swig of fear beer and shivers.", -- 261
			"guzzles a fear beer.", -- 262
			"chokes down some piss beer." -- 263
		}, -- 266
		Initialize = function(self) -- 266
			_class_0.__parent.__base.Initialize(self) -- 267
			if SERVER then -- 268
				return self:PrecacheGibs() -- 268
			end -- 268
		end, -- 270
		OnTakeDamage = function(self, dmg) -- 270
			_class_0.__parent.__base.OnTakeDamage(self, dmg) -- 271
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH -- 272
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then -- 273
				self:Shatter(dmg:GetDamageForce()) -- 273
			end -- 273
			if attacker and IsValid(attacker) and attacker:IsPlayer() then -- 274
				if attacker:HasOddity(ODDITY_DELINQUENCY) then -- 275
					return attacker:AddDespair(-math.random(2, 4)) -- 276
				end -- 275
			end -- 274
		end, -- 278
		PhysicsCollide = function(self, data) -- 278
			_class_0.__parent.__base.PhysicsCollide(self, data) -- 279
			if CLIENT then -- 280
				return -- 280
			end -- 280
			if data.Speed > self.ImpactThreshold then -- 281
				if data.HitEntity and IsValid(data.HitEntity) then -- 282
					local attacker = self:GetNWEntity("evilrp_submitter") -- 283
					do -- 284
						local dmg = DamageInfo() -- 284
						dmg:SetDamage(25) -- 285
						if IsValid(attacker) then -- 286
							dmg:SetAttacker(attacker) -- 286
						end -- 286
						dmg:SetInflictor(self) -- 287
						dmg:SetDamageType(DMG_SLASH) -- 288
						dmg:SetDamagePosition(data.HitPos) -- 289
						data.HitEntity:TakeDamageInfo(dmg) -- 290
					end -- 284
				end -- 282
				local force = data.OurNewVelocity -- 291
				return self:Shatter(force) -- 292
			end -- 281
		end, -- 294
		Shatter = function(self, force) -- 294
			if self.broken then -- 295
				return -- 295
			end -- 295
			self.broken = true -- 296
			local pos = self:GetPos() -- 297
			local _list_0 = player.GetAll() -- 298
			for _index_0 = 1, #_list_0 do -- 298
				local ply = _list_0[_index_0] -- 298
				local _continue_0 = false -- 299
				repeat -- 299
					if not ply:HasOddity(ODDITY_DELINQUENCY) then -- 299
						_continue_0 = true -- 299
						break -- 299
					end -- 299
					if ply:CanSee(self) and ply:LookingInDirection(pos) then -- 300
						ply:AddDespair(-math.random(2, 4)) -- 301
					end -- 300
					_continue_0 = true -- 299
				until true -- 301
				if not _continue_0 then -- 301
					break -- 301
				end -- 301
			end -- 301
			do -- 302
				local ed = EffectData() -- 302
				ed:SetStart(pos) -- 303
				ed:SetOrigin(pos) -- 304
				ed:SetScale(8) -- 305
				util.Effect("GlassImpact", ed, true, true) -- 306
			end -- 302
			self:EmitSound("BottleSmash") -- 307
			self:GibBreakServer(force) -- 308
			return self:Remove() -- 309
		end -- 243
	} -- 243
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 309
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 243
			_base_0[_key_0] = _val_0 -- 243
		end -- 243
	end -- 309
	if _base_0.__index == nil then -- 243
		_base_0.__index = _base_0 -- 243
	end -- 309
	setmetatable(_base_0, _parent_0.__base) -- 243
	_class_0 = setmetatable({ -- 243
		__init = function(self, ...) -- 243
			return _class_0.__parent.__init(self, ...) -- 243
		end, -- 243
		__base = _base_0, -- 243
		__name = "FearBeer", -- 243
		__parent = _parent_0 -- 243
	}, { -- 243
		__index = function(cls, name) -- 243
			local val = rawget(_base_0, name) -- 243
			if val == nil then -- 243
				local parent = rawget(cls, "__parent") -- 243
				if parent then -- 243
					return parent[name] -- 243
				end -- 243
			else -- 243
				return val -- 243
			end -- 243
		end, -- 243
		__call = function(cls, ...) -- 243
			local _self_0 = setmetatable({ }, _base_0) -- 243
			cls.__init(_self_0, ...) -- 243
			return _self_0 -- 243
		end -- 243
	}) -- 243
	_base_0.__class = _class_0 -- 243
	if _parent_0.__inherited then -- 243
		_parent_0.__inherited(_parent_0, _class_0) -- 243
	end -- 243
	FearBeer = _class_0 -- 243
end -- 309
local SmearBeer -- 311
do -- 311
	local _class_0 -- 311
	local _parent_0 = Drink -- 311
	local _base_0 = { -- 311
		PrintName = "Smear Beer", -- 313
		Model = Model("models/props_junk/garbage_glassbottle003a.mdl"), -- 314
		Thirst = -12, -- 315
		Despair = -35, -- 316
		Description = "A bottle of cloudy, greyish red booze.\nThe label is obscured with a smear of old blood.", -- 318
		Price = 95, -- 320
		TrashClass = "trash/bottle", -- 322
		ImpactThreshold = 256, -- 324
		UseText = { -- 325
			"chugs a smear beer.", -- 325
			"downs a bottle of red brew.", -- 326
			"drinks a cloudy bottle of beer.", -- 327
			"quaffs a smear beer and shivers.", -- 328
			"takes a swig of smear beer.", -- 329
			"guzzles a bloody beer.", -- 330
			"nurses a bottle of blood beer." -- 331
		}, -- 334
		Initialize = function(self) -- 334
			_class_0.__parent.__base.Initialize(self) -- 335
			if SERVER then -- 336
				return self:PrecacheGibs() -- 336
			end -- 336
		end, -- 338
		OnTakeDamage = function(self, dmg) -- 338
			_class_0.__parent.__base.OnTakeDamage(self, dmg) -- 339
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH -- 340
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then -- 341
				self:Shatter(dmg:GetDamageForce()) -- 341
			end -- 341
			if attacker and IsValid(attacker) and attacker:IsPlayer() then -- 342
				if attacker:HasOddity(ODDITY_DELINQUENCY) then -- 343
					return attacker:AddDespair(-math.random(2, 4)) -- 344
				end -- 343
			end -- 342
		end, -- 346
		PhysicsCollide = function(self, data) -- 346
			_class_0.__parent.__base.PhysicsCollide(self, data) -- 347
			if CLIENT then -- 348
				return -- 348
			end -- 348
			if data.Speed > self.ImpactThreshold then -- 349
				if data.HitEntity and IsValid(data.HitEntity) then -- 350
					local attacker = self:GetNWEntity("evilrp_submitter") -- 351
					do -- 352
						local dmg = DamageInfo() -- 352
						dmg:SetDamage(25) -- 353
						if IsValid(attacker) then -- 354
							dmg:SetAttacker(attacker) -- 354
						end -- 354
						dmg:SetInflictor(self) -- 355
						dmg:SetDamageType(DMG_SLASH) -- 356
						dmg:SetDamagePosition(data.HitPos) -- 357
						data.HitEntity:TakeDamageInfo(dmg) -- 358
					end -- 352
				end -- 350
				local force = data.OurNewVelocity -- 359
				return self:Shatter(force) -- 360
			end -- 349
		end, -- 362
		Shatter = function(self, force) -- 362
			if self.broken then -- 363
				return -- 363
			end -- 363
			self.broken = true -- 364
			local pos = self:GetPos() -- 365
			local _list_0 = player.GetAll() -- 366
			for _index_0 = 1, #_list_0 do -- 366
				local ply = _list_0[_index_0] -- 366
				local _continue_0 = false -- 367
				repeat -- 367
					if not ply:HasOddity(ODDITY_DELINQUENCY) then -- 367
						_continue_0 = true -- 367
						break -- 367
					end -- 367
					if ply:CanSee(self) and ply:LookingInDirection(pos) then -- 368
						ply:AddDespair(-math.random(2, 4)) -- 369
					end -- 368
					_continue_0 = true -- 367
				until true -- 369
				if not _continue_0 then -- 369
					break -- 369
				end -- 369
			end -- 369
			do -- 370
				local ed = EffectData() -- 370
				ed:SetStart(pos) -- 371
				ed:SetOrigin(pos) -- 372
				ed:SetScale(8) -- 373
				util.Effect("GlassImpact", ed, true, true) -- 374
			end -- 370
			self:EmitSound("BottleSmash") -- 375
			self:GibBreakServer(force) -- 376
			return self:Remove() -- 377
		end -- 311
	} -- 311
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 377
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 311
			_base_0[_key_0] = _val_0 -- 311
		end -- 311
	end -- 377
	if _base_0.__index == nil then -- 311
		_base_0.__index = _base_0 -- 311
	end -- 377
	setmetatable(_base_0, _parent_0.__base) -- 311
	_class_0 = setmetatable({ -- 311
		__init = function(self, ...) -- 311
			return _class_0.__parent.__init(self, ...) -- 311
		end, -- 311
		__base = _base_0, -- 311
		__name = "SmearBeer", -- 311
		__parent = _parent_0 -- 311
	}, { -- 311
		__index = function(cls, name) -- 311
			local val = rawget(_base_0, name) -- 311
			if val == nil then -- 311
				local parent = rawget(cls, "__parent") -- 311
				if parent then -- 311
					return parent[name] -- 311
				end -- 311
			else -- 311
				return val -- 311
			end -- 311
		end, -- 311
		__call = function(cls, ...) -- 311
			local _self_0 = setmetatable({ }, _base_0) -- 311
			cls.__init(_self_0, ...) -- 311
			return _self_0 -- 311
		end -- 311
	}) -- 311
	_base_0.__class = _class_0 -- 311
	if _parent_0.__inherited then -- 311
		_parent_0.__inherited(_parent_0, _class_0) -- 311
	end -- 311
	SmearBeer = _class_0 -- 311
end -- 377
local Shake -- 379
do -- 379
	local _class_0 -- 379
	local _parent_0 = Drink -- 379
	local _base_0 = { -- 379
		PrintName = "Soylent Shake", -- 381
		Model = Model("models/props_junk/garbage_milkcarton001a.mdl"), -- 382
		Thirst = -40, -- 383
		Hunger = -40, -- 384
		Despair = 30, -- 385
		Description = "A jug full of partially blended human remains.\nIt's warm and chunky.", -- 387
		Price = 120, -- 389
		TrashClass = "trash/plastic/shake", -- 391
		UseText = { -- 392
			"chokes down a soylent shake.", -- 392
			"slurps up a soylent shake.", -- 393
			"swigs blended peoplemeat and shudders.", -- 394
			"struggles down a jug of human sludge.", -- 395
			"shoots back a bad protein shake.", -- 396
			"guzzles a meat smoothie.", -- 397
			"quaffs an entire soylent shake." -- 398
		} -- 379
	} -- 379
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 399
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 379
			_base_0[_key_0] = _val_0 -- 379
		end -- 379
	end -- 399
	if _base_0.__index == nil then -- 379
		_base_0.__index = _base_0 -- 379
	end -- 399
	setmetatable(_base_0, _parent_0.__base) -- 379
	_class_0 = setmetatable({ -- 379
		__init = function(self, ...) -- 379
			return _class_0.__parent.__init(self, ...) -- 379
		end, -- 379
		__base = _base_0, -- 379
		__name = "Shake", -- 379
		__parent = _parent_0 -- 379
	}, { -- 379
		__index = function(cls, name) -- 379
			local val = rawget(_base_0, name) -- 379
			if val == nil then -- 379
				local parent = rawget(cls, "__parent") -- 379
				if parent then -- 379
					return parent[name] -- 379
				end -- 379
			else -- 379
				return val -- 379
			end -- 379
		end, -- 379
		__call = function(cls, ...) -- 379
			local _self_0 = setmetatable({ }, _base_0) -- 379
			cls.__init(_self_0, ...) -- 379
			return _self_0 -- 379
		end -- 379
	}) -- 379
	_base_0.__class = _class_0 -- 379
	if _parent_0.__inherited then -- 379
		_parent_0.__inherited(_parent_0, _class_0) -- 379
	end -- 379
	Shake = _class_0 -- 379
end -- 399
local Twitchel -- 401
do -- 401
	local _class_0 -- 401
	local _parent_0 = Drink -- 401
	local _base_0 = { -- 401
		PrintName = "Twitchel", -- 403
		Model = Model("models/props_junk/garbage_plasticbottle003a.mdl"), -- 404
		Thirst = -44, -- 405
		Hunger = 6, -- 406
		Despair = 6, -- 407
		Description = "A bottle of refreshingly lukewarm, cloudy green drink.", -- 409
		Price = 80, -- 411
		TrashClass = "trash/plastic/twitchel", -- 413
		UseText = { -- 414
			"necks a bottle of twitchel.", -- 414
			"can't get enough of that green stuff.", -- 415
			"sucks down a bottle of twitchel.", -- 416
			"sips up their twitchel.", -- 417
			"pours twitchel down their throat.", -- 418
			"drinks a bottle of twitchel.", -- 419
			"slurps up a green drink." -- 420
		} -- 401
	} -- 401
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 421
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 401
			_base_0[_key_0] = _val_0 -- 401
		end -- 401
	end -- 421
	if _base_0.__index == nil then -- 401
		_base_0.__index = _base_0 -- 401
	end -- 421
	setmetatable(_base_0, _parent_0.__base) -- 401
	_class_0 = setmetatable({ -- 401
		__init = function(self, ...) -- 401
			return _class_0.__parent.__init(self, ...) -- 401
		end, -- 401
		__base = _base_0, -- 401
		__name = "Twitchel", -- 401
		__parent = _parent_0 -- 401
	}, { -- 401
		__index = function(cls, name) -- 401
			local val = rawget(_base_0, name) -- 401
			if val == nil then -- 401
				local parent = rawget(cls, "__parent") -- 401
				if parent then -- 401
					return parent[name] -- 401
				end -- 401
			else -- 401
				return val -- 401
			end -- 401
		end, -- 401
		__call = function(cls, ...) -- 401
			local _self_0 = setmetatable({ }, _base_0) -- 401
			cls.__init(_self_0, ...) -- 401
			return _self_0 -- 401
		end -- 401
	}) -- 401
	_base_0.__class = _class_0 -- 401
	if _parent_0.__inherited then -- 401
		_parent_0.__inherited(_parent_0, _class_0) -- 401
	end -- 401
	Twitchel = _class_0 -- 401
end -- 421
local TakeMeds -- 423
do -- 423
	local _class_0 -- 423
	local _parent_0 = SOUND -- 423
	local _base_0 = { -- 423
		sound = (function() -- 424
			local _accum_0 = { } -- 424
			local _len_0 = 1 -- 424
			for i = 1, 3 do -- 424
				_accum_0[_len_0] = "npc/zombie/zombie_pain" .. tostring(i) .. ".wav" -- 424
				_len_0 = _len_0 + 1 -- 424
			end -- 424
			return _accum_0 -- 424
		end)() -- 423
	} -- 423
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 424
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 423
			_base_0[_key_0] = _val_0 -- 423
		end -- 423
	end -- 424
	if _base_0.__index == nil then -- 423
		_base_0.__index = _base_0 -- 423
	end -- 424
	setmetatable(_base_0, _parent_0.__base) -- 423
	_class_0 = setmetatable({ -- 423
		__init = function(self, ...) -- 423
			return _class_0.__parent.__init(self, ...) -- 423
		end, -- 423
		__base = _base_0, -- 423
		__name = "TakeMeds", -- 423
		__parent = _parent_0 -- 423
	}, { -- 423
		__index = function(cls, name) -- 423
			local val = rawget(_base_0, name) -- 423
			if val == nil then -- 423
				local parent = rawget(cls, "__parent") -- 423
				if parent then -- 423
					return parent[name] -- 423
				end -- 423
			else -- 423
				return val -- 423
			end -- 423
		end, -- 423
		__call = function(cls, ...) -- 423
			local _self_0 = setmetatable({ }, _base_0) -- 423
			cls.__init(_self_0, ...) -- 423
			return _self_0 -- 423
		end -- 423
	}) -- 423
	_base_0.__class = _class_0 -- 423
	if _parent_0.__inherited then -- 423
		_parent_0.__inherited(_parent_0, _class_0) -- 423
	end -- 423
	TakeMeds = _class_0 -- 423
end -- 424
local Medicine -- 426
do -- 426
	local _class_0 -- 426
	local _parent_0 = Food -- 426
	local _base_0 = { -- 426
		PrintName = "Medicine", -- 428
		Sound = "TakeMeds" -- 426
	} -- 426
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 428
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 426
			_base_0[_key_0] = _val_0 -- 426
		end -- 426
	end -- 428
	if _base_0.__index == nil then -- 426
		_base_0.__index = _base_0 -- 426
	end -- 428
	setmetatable(_base_0, _parent_0.__base) -- 426
	_class_0 = setmetatable({ -- 426
		__init = function(self, ...) -- 426
			return _class_0.__parent.__init(self, ...) -- 426
		end, -- 426
		__base = _base_0, -- 426
		__name = "Medicine", -- 426
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
	Medicine = _class_0 -- 426
end -- 428
local Pills -- 430
do -- 430
	local _class_0 -- 430
	local _parent_0 = Medicine -- 430
	local _base_0 = { -- 430
		PrintName = "Pills", -- 432
		Model = Model("models/props_lab/jar01b.mdl"), -- 433
		AddHealth = function(self) -- 433
			return math.random(-15, -30) -- 433
		end, -- 434
		Hunger = function(self) -- 434
			return math.random(30, 50) -- 434
		end, -- 435
		Thirst = function(self) -- 435
			return math.random(30, 60) -- 435
		end, -- 436
		Despair = function(self) -- 436
			return math.random(-60, -100) -- 436
		end, -- 438
		Description = "A white plastic bottle, full of random pills.", -- 440
		Price = 125, -- 442
		TrashClass = "trash/plastic/pills", -- 444
		UseText = { -- 445
			"throws a mess of pills into eir mouth.", -- 445
			"consumes the whole contents of a pill bottle.", -- 446
			"devours handfuls of scary-looking pills.", -- 447
			"chokes down some strange pills.", -- 448
			"takes eir medicine, like a good citizen should.", -- 449
			"swallows a mouthful of pills.", -- 450
			"takes an excessive dose of colorful pills.", -- 451
			"tosses back an entire bottle of pills.", -- 452
			"throws back a bottle of mystery pills." -- 453
		} -- 430
	} -- 430
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 454
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 430
			_base_0[_key_0] = _val_0 -- 430
		end -- 430
	end -- 454
	if _base_0.__index == nil then -- 430
		_base_0.__index = _base_0 -- 430
	end -- 454
	setmetatable(_base_0, _parent_0.__base) -- 430
	_class_0 = setmetatable({ -- 430
		__init = function(self, ...) -- 430
			return _class_0.__parent.__init(self, ...) -- 430
		end, -- 430
		__base = _base_0, -- 430
		__name = "Pills", -- 430
		__parent = _parent_0 -- 430
	}, { -- 430
		__index = function(cls, name) -- 430
			local val = rawget(_base_0, name) -- 430
			if val == nil then -- 430
				local parent = rawget(cls, "__parent") -- 430
				if parent then -- 430
					return parent[name] -- 430
				end -- 430
			else -- 430
				return val -- 430
			end -- 430
		end, -- 430
		__call = function(cls, ...) -- 430
			local _self_0 = setmetatable({ }, _base_0) -- 430
			cls.__init(_self_0, ...) -- 430
			return _self_0 -- 430
		end -- 430
	}) -- 430
	_base_0.__class = _class_0 -- 430
	if _parent_0.__inherited then -- 430
		_parent_0.__inherited(_parent_0, _class_0) -- 430
	end -- 430
	Pills = _class_0 -- 430
end -- 454
local TimeGas -- 456
do -- 456
	local _class_0 -- 456
	local _parent_0 = Medicine -- 456
	local _base_0 = { -- 456
		PrintName = "Time Gas", -- 458
		Model = Model("models/props_wasteland/prison_sinkchunk001e.mdl"), -- 459
		Sound = (function() -- 459
			local _accum_0 = { } -- 459
			local _len_0 = 1 -- 459
			for i = 2, 3 do -- 459
				_accum_0[_len_0] = "npc/fast_zombie/idle" .. tostring(i) -- 459
				_len_0 = _len_0 + 1 -- 459
			end -- 459
			return _accum_0 -- 459
		end)(), -- 460
		AddHealth = function(self) -- 460
			return math.random(20, 40) -- 460
		end, -- 461
		Hunger = function(self) -- 461
			return math.random(10, 20) -- 461
		end, -- 462
		Thirst = function(self) -- 462
			return math.random(20, 30) -- 462
		end, -- 463
		Despair = function(self) -- 463
			return math.random(0, 10) -- 463
		end, -- 465
		Description = "An inhaler of time acceleration gas.\nSpeeds up healing, and dying.", -- 467
		Price = 100, -- 469
		TrashClass = "trash/inhaler", -- 471
		UseText = { -- 472
			"breathes in some time gas.", -- 472
			"huffs a healing gas.", -- 473
			"isn't yet tired of the time gas.", -- 474
			"inhales a big cloud of time gas.", -- 475
			"takes a deep breath of time gas.", -- 476
			"drags in a lungful of time gas.", -- 477
			"sniffs up a cloud of time gas.", -- 478
			"huffs time gas from the rusty inhaler." -- 479
		} -- 456
	} -- 456
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 480
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 456
			_base_0[_key_0] = _val_0 -- 456
		end -- 456
	end -- 480
	if _base_0.__index == nil then -- 456
		_base_0.__index = _base_0 -- 456
	end -- 480
	setmetatable(_base_0, _parent_0.__base) -- 456
	_class_0 = setmetatable({ -- 456
		__init = function(self, ...) -- 456
			return _class_0.__parent.__init(self, ...) -- 456
		end, -- 456
		__base = _base_0, -- 456
		__name = "TimeGas", -- 456
		__parent = _parent_0 -- 456
	}, { -- 456
		__index = function(cls, name) -- 456
			local val = rawget(_base_0, name) -- 456
			if val == nil then -- 456
				local parent = rawget(cls, "__parent") -- 456
				if parent then -- 456
					return parent[name] -- 456
				end -- 456
			else -- 456
				return val -- 456
			end -- 456
		end, -- 456
		__call = function(cls, ...) -- 456
			local _self_0 = setmetatable({ }, _base_0) -- 456
			cls.__init(_self_0, ...) -- 456
			return _self_0 -- 456
		end -- 456
	}) -- 456
	_base_0.__class = _class_0 -- 456
	if _parent_0.__inherited then -- 456
		_parent_0.__inherited(_parent_0, _class_0) -- 456
	end -- 456
	TimeGas = _class_0 -- 456
end -- 480
local Bleach -- 482
do -- 482
	local _class_0 -- 482
	local _parent_0 = Medicine -- 482
	local _base_0 = { -- 482
		PrintName = "Chlorine", -- 484
		Model = Model("models/props_junk/garbage_plasticbottle002a"), -- 485
		Sound = "DrinkFluid", -- 486
		AddHealth = function(self) -- 486
			return math.random(75, 99) -- 486
		end, -- 487
		Hunger = 70, -- 488
		Thirst = 70, -- 489
		Despair = 70, -- 491
		Description = "A jug full of bleach.", -- 493
		Price = 100, -- 495
		TrashClass = "trash/plastic/bleach", -- 497
		UseText = { -- 498
			"drinks bleach.", -- 498
			"chugs an entire fucking jug of chlorine.", -- 499
			"unscrews a jug of bleach and pours it down the hatch.", -- 500
			"chokes down gulp after gulp of chlorine bleach." -- 501
		} -- 482
	} -- 482
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 502
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 482
			_base_0[_key_0] = _val_0 -- 482
		end -- 482
	end -- 502
	if _base_0.__index == nil then -- 482
		_base_0.__index = _base_0 -- 482
	end -- 502
	setmetatable(_base_0, _parent_0.__base) -- 482
	_class_0 = setmetatable({ -- 482
		__init = function(self, ...) -- 482
			return _class_0.__parent.__init(self, ...) -- 482
		end, -- 482
		__base = _base_0, -- 482
		__name = "Bleach", -- 482
		__parent = _parent_0 -- 482
	}, { -- 482
		__index = function(cls, name) -- 482
			local val = rawget(_base_0, name) -- 482
			if val == nil then -- 482
				local parent = rawget(cls, "__parent") -- 482
				if parent then -- 482
					return parent[name] -- 482
				end -- 482
			else -- 482
				return val -- 482
			end -- 482
		end, -- 482
		__call = function(cls, ...) -- 482
			local _self_0 = setmetatable({ }, _base_0) -- 482
			cls.__init(_self_0, ...) -- 482
			return _self_0 -- 482
		end -- 482
	}) -- 482
	_base_0.__class = _class_0 -- 482
	if _parent_0.__inherited then -- 482
		_parent_0.__inherited(_parent_0, _class_0) -- 482
	end -- 482
	Bleach = _class_0 -- 482
	return _class_0 -- 502
end -- 502
