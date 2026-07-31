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
			if self.Armor then -- 45
				amt = self.Armor -- 46
				if isfunction(amt) then -- 47
					amt = amt() -- 47
				end -- 47
				if amt > 0 then -- 48
					ply:SetArmor((ply:Armor() + amt)) -- 49
				end -- 48
			end -- 45
			if self.HealthAdd then -- 50
				amt = self.HealthAdd -- 51
				if isfunction(amt) then -- 52
					amt = amt() -- 52
				end -- 52
				if amt > 0 then -- 53
					ply:SetHealth(math.min(ply:Health() + amt, ply:GetMaxHealth())) -- 54
				elseif amt < 0 then -- 55
					ply:TakeDamage(-amt) -- 56
				end -- 53
			end -- 50
			if not self.PersistAfterEat then -- 59
				return self:Trash() -- 59
			end -- 59
		end, -- 61
		OnUseFinish = function(self, ply) -- 61
			_class_0.__parent.__base.OnUseFinish(self, ply) -- 62
			return self:Eat(ply) -- 63
		end, -- 65
		OnSpawned = function(self) -- 65
			_class_0.__parent.__base.OnSpawned(self) -- 66
			self:SetRotten(false) -- 67
			if self.RotTime > 0 then -- 68
				self.RotsIn = CurTime() + self.RotTime -- 68
			end -- 68
			return -- 69
		end, -- 71
		Think = function(self) -- 71
			_class_0.__parent.__base.Think(self) -- 72
			if CLIENT then -- 73
				return -- 73
			end -- 73
			if self.RotsIn and (not self:GetRotten()) and self.RotsIn < CurTime() then -- 74
				return self:Rot() -- 74
			end -- 74
		end, -- 76
		Rot = function(self) -- 76
			self:SetRotten(true) -- 77
			self:SetColor(Color(100, 0, 150)) -- 78
			return self:EmitSound("FoodRot") -- 79
		end -- 8
	} -- 8
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 79
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 8
			_base_0[_key_0] = _val_0 -- 8
		end -- 8
	end -- 79
	if _base_0.__index == nil then -- 8
		_base_0.__index = _base_0 -- 8
	end -- 79
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
end -- 79
local SlopSkull -- 81
do -- 81
	local _class_0 -- 81
	local _parent_0 = Food -- 81
	local _base_0 = { -- 81
		PrintName = "Slop Skull", -- 83
		Model = Model("models/Gibs/HGIBS.mdl"), -- 84
		Hunger = -10, -- 85
		Despair = 35, -- 86
		Description = "A bloody, festering human skull.\nThe brain is still largely intact.", -- 87
		RotTime = 120, -- 89
		UseText = { -- 90
			"munches and crunches on a slop skull.", -- 90
			"slurps the brain matter out of a slop skull.", -- 91
			"digs around in a slop skull with their tongue.", -- 92
			"ravenously consumes a slop skull.", -- 93
			"gets pink sludge everywhere while eating a slop skull.", -- 94
			"scours a slop skull for brainmeat.", -- 95
			"cracks open a slop skull and slurps the brains out." -- 96
		}, -- 99
		Precursor = { -- 100
			biomass = 1 -- 100
		} -- 81
	} -- 81
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 100
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 81
			_base_0[_key_0] = _val_0 -- 81
		end -- 81
	end -- 100
	if _base_0.__index == nil then -- 81
		_base_0.__index = _base_0 -- 81
	end -- 100
	setmetatable(_base_0, _parent_0.__base) -- 81
	_class_0 = setmetatable({ -- 81
		__init = function(self, ...) -- 81
			return _class_0.__parent.__init(self, ...) -- 81
		end, -- 81
		__base = _base_0, -- 81
		__name = "SlopSkull", -- 81
		__parent = _parent_0 -- 81
	}, { -- 81
		__index = function(cls, name) -- 81
			local val = rawget(_base_0, name) -- 81
			if val == nil then -- 81
				local parent = rawget(cls, "__parent") -- 81
				if parent then -- 81
					return parent[name] -- 81
				end -- 81
			else -- 81
				return val -- 81
			end -- 81
		end, -- 81
		__call = function(cls, ...) -- 81
			local _self_0 = setmetatable({ }, _base_0) -- 81
			cls.__init(_self_0, ...) -- 81
			return _self_0 -- 81
		end -- 81
	}) -- 81
	_base_0.__class = _class_0 -- 81
	if _parent_0.__inherited then -- 81
		_parent_0.__inherited(_parent_0, _class_0) -- 81
	end -- 81
	SlopSkull = _class_0 -- 81
end -- 100
local Paper -- 102
do -- 102
	local _class_0 -- 102
	local _parent_0 = Food -- 102
	local _base_0 = { -- 102
		PrintName = "Paper", -- 104
		Model = Model("models/props_lab/papersheet001a.mdl"), -- 105
		Hunger = -7, -- 106
		Thirst = 10, -- 107
		Description = "A dirty scrap of used paper.\nThe writing is too faint to make out.", -- 109
		UseText = { -- 110
			"chokes down a sheet of paper.", -- 110
			"tears up and eats a sheet of paper.", -- 111
			"chews the paper into a stiff pulp and swallows.", -- 112
			"struggles to swallow a dry sheet of paper.", -- 113
			"eats paper.", -- 114
			"crumples up some paper and struggles to chew it.", -- 115
			"munches on a piece of paper." -- 116
		} -- 102
	} -- 102
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 117
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 102
			_base_0[_key_0] = _val_0 -- 102
		end -- 102
	end -- 117
	if _base_0.__index == nil then -- 102
		_base_0.__index = _base_0 -- 102
	end -- 117
	setmetatable(_base_0, _parent_0.__base) -- 102
	_class_0 = setmetatable({ -- 102
		__init = function(self, ...) -- 102
			return _class_0.__parent.__init(self, ...) -- 102
		end, -- 102
		__base = _base_0, -- 102
		__name = "Paper", -- 102
		__parent = _parent_0 -- 102
	}, { -- 102
		__index = function(cls, name) -- 102
			local val = rawget(_base_0, name) -- 102
			if val == nil then -- 102
				local parent = rawget(cls, "__parent") -- 102
				if parent then -- 102
					return parent[name] -- 102
				end -- 102
			else -- 102
				return val -- 102
			end -- 102
		end, -- 102
		__call = function(cls, ...) -- 102
			local _self_0 = setmetatable({ }, _base_0) -- 102
			cls.__init(_self_0, ...) -- 102
			return _self_0 -- 102
		end -- 102
	}) -- 102
	_base_0.__class = _class_0 -- 102
	if _parent_0.__inherited then -- 102
		_parent_0.__inherited(_parent_0, _class_0) -- 102
	end -- 102
	Paper = _class_0 -- 102
end -- 117
local RibBone -- 119
do -- 119
	local _class_0 -- 119
	local _parent_0 = Food -- 119
	local _base_0 = { -- 119
		PrintName = "Dry Rib", -- 121
		Model = Model("models/Gibs/hgibs_rib.mdl"), -- 122
		Hunger = -8, -- 123
		HealthAdd = -7, -- 124
		RotTime = 240, -- 125
		Description = "A lone human rib.\nYou could chew the marrow out, but it'd probably hurt.", -- 127
		UseText = { -- 128
			"breaks a tooth chewing on a rib bone.", -- 128
			"sucks marrow and bone shards from the rib.", -- 129
			"cuts up their throat eating a rib bone.", -- 130
			"bleeds from the mouth as they eat a rib bone.", -- 131
			"eats a bone, like a vulture.", -- 132
			"chokes on the broken points of a rib bone." -- 133
		}, -- 136
		Precursor = { -- 137
			biomass = 1 -- 137
		} -- 119
	} -- 119
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 137
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 119
			_base_0[_key_0] = _val_0 -- 119
		end -- 119
	end -- 137
	if _base_0.__index == nil then -- 119
		_base_0.__index = _base_0 -- 119
	end -- 137
	setmetatable(_base_0, _parent_0.__base) -- 119
	_class_0 = setmetatable({ -- 119
		__init = function(self, ...) -- 119
			return _class_0.__parent.__init(self, ...) -- 119
		end, -- 119
		__base = _base_0, -- 119
		__name = "RibBone", -- 119
		__parent = _parent_0 -- 119
	}, { -- 119
		__index = function(cls, name) -- 119
			local val = rawget(_base_0, name) -- 119
			if val == nil then -- 119
				local parent = rawget(cls, "__parent") -- 119
				if parent then -- 119
					return parent[name] -- 119
				end -- 119
			else -- 119
				return val -- 119
			end -- 119
		end, -- 119
		__call = function(cls, ...) -- 119
			local _self_0 = setmetatable({ }, _base_0) -- 119
			cls.__init(_self_0, ...) -- 119
			return _self_0 -- 119
		end -- 119
	}) -- 119
	_base_0.__class = _class_0 -- 119
	if _parent_0.__inherited then -- 119
		_parent_0.__inherited(_parent_0, _class_0) -- 119
	end -- 119
	RibBone = _class_0 -- 119
end -- 137
local Skin -- 139
do -- 139
	local _class_0 -- 139
	local _parent_0 = Food -- 139
	local _base_0 = { -- 139
		PrintName = "Skin", -- 141
		Description = "A greasy patch of some kind of hide.\nIt would probably taste nasty.", -- 142
		Model = Model("models/gibs/antlion_gib_small_2.mdl"), -- 143
		HealthAdd = function(self) -- 143
			return math.random(10, 20) -- 143
		end, -- 144
		Despair = function(self) -- 144
			return math.random(1, 5) -- 144
		end, -- 146
		UseText = { -- 147
			"applies some skin to their wounds.", -- 147
			"glues on some skin." -- 148
		} -- 139
	} -- 139
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 149
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 139
			_base_0[_key_0] = _val_0 -- 139
		end -- 139
	end -- 149
	if _base_0.__index == nil then -- 139
		_base_0.__index = _base_0 -- 139
	end -- 149
	setmetatable(_base_0, _parent_0.__base) -- 139
	_class_0 = setmetatable({ -- 139
		__init = function(self, ...) -- 139
			return _class_0.__parent.__init(self, ...) -- 139
		end, -- 139
		__base = _base_0, -- 139
		__name = "Skin", -- 139
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
	Skin = _class_0 -- 139
end -- 149
local Abortion -- 151
do -- 151
	local _class_0 -- 151
	local _parent_0 = Food -- 151
	local _base_0 = { -- 151
		PrintName = "Abortion", -- 153
		Model = Model("models/props_c17/doll01.mdl"), -- 154
		Hunger = -23, -- 155
		Thirst = -20, -- 156
		HealthAdd = 20, -- 157
		RotTime = 240, -- 158
		Description = "An artificial baby that never got the chance to be born.\nDelicious.", -- 159
		Price = 175, -- 160
		UseText = { -- 161
			"eats a baby.", -- 161
			"rips apart an abortion and eats the pieces.", -- 162
			"bites the head off an abortion and swallows the rest.", -- 163
			"chews an abortion into pink paste.", -- 164
			"tears chunks off an abortion until it's all gone.", -- 165
			"eats an abortion, baby blood dribbling down their neck.", -- 166
			"eats an abortion legs-first." -- 167
		}, -- 170
		Eat = function(self, ply) -- 170
			_class_0.__parent.__base.Eat(self, ply) -- 171
			if CLIENT then -- 172
				return -- 172
			end -- 172
			return ply:AddStemCells(1) -- 173
		end -- 151
	} -- 151
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 173
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 151
			_base_0[_key_0] = _val_0 -- 151
		end -- 151
	end -- 173
	if _base_0.__index == nil then -- 151
		_base_0.__index = _base_0 -- 151
	end -- 173
	setmetatable(_base_0, _parent_0.__base) -- 151
	_class_0 = setmetatable({ -- 151
		__init = function(self, ...) -- 151
			return _class_0.__parent.__init(self, ...) -- 151
		end, -- 151
		__base = _base_0, -- 151
		__name = "Abortion", -- 151
		__parent = _parent_0 -- 151
	}, { -- 151
		__index = function(cls, name) -- 151
			local val = rawget(_base_0, name) -- 151
			if val == nil then -- 151
				local parent = rawget(cls, "__parent") -- 151
				if parent then -- 151
					return parent[name] -- 151
				end -- 151
			else -- 151
				return val -- 151
			end -- 151
		end, -- 151
		__call = function(cls, ...) -- 151
			local _self_0 = setmetatable({ }, _base_0) -- 151
			cls.__init(_self_0, ...) -- 151
			return _self_0 -- 151
		end -- 151
	}) -- 151
	_base_0.__class = _class_0 -- 151
	if _parent_0.__inherited then -- 151
		_parent_0.__inherited(_parent_0, _class_0) -- 151
	end -- 151
	Abortion = _class_0 -- 151
end -- 173
local LiveBaby -- 175
do -- 175
	local _class_0 -- 175
	local _parent_0 = Food -- 175
	local _base_0 = { -- 175
		PrintName = "Live baby", -- 177
		Model = Model("models/props_c17/doll01.mdl"), -- 178
		Hunger = -30, -- 179
		Thirst = -22, -- 180
		HealthAdd = 15, -- 181
		Description = "An artifical baby, born paralyzed below the eyes.\nIt will know nothing but fear and pain.", -- 183
		UseText = { -- 184
			"eats a living infant.", -- 184
			"chews the head off a live baby and drinks its blood.", -- 185
			"eats a baby alive.", -- 186
			"eats a live baby and tastes its tears.", -- 187
			"rips apart a living baby and eats the pieces.", -- 188
			"tears open a live baby and feeds on its entrails.", -- 189
			"eats a live baby as it cries silently." -- 190
		} -- 175
	} -- 175
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 191
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 175
			_base_0[_key_0] = _val_0 -- 175
		end -- 175
	end -- 191
	if _base_0.__index == nil then -- 175
		_base_0.__index = _base_0 -- 175
	end -- 191
	setmetatable(_base_0, _parent_0.__base) -- 175
	_class_0 = setmetatable({ -- 175
		__init = function(self, ...) -- 175
			return _class_0.__parent.__init(self, ...) -- 175
		end, -- 175
		__base = _base_0, -- 175
		__name = "LiveBaby", -- 175
		__parent = _parent_0 -- 175
	}, { -- 175
		__index = function(cls, name) -- 175
			local val = rawget(_base_0, name) -- 175
			if val == nil then -- 175
				local parent = rawget(cls, "__parent") -- 175
				if parent then -- 175
					return parent[name] -- 175
				end -- 175
			else -- 175
				return val -- 175
			end -- 175
		end, -- 175
		__call = function(cls, ...) -- 175
			local _self_0 = setmetatable({ }, _base_0) -- 175
			cls.__init(_self_0, ...) -- 175
			return _self_0 -- 175
		end -- 175
	}) -- 175
	_base_0.__class = _class_0 -- 175
	if _parent_0.__inherited then -- 175
		_parent_0.__inherited(_parent_0, _class_0) -- 175
	end -- 175
	LiveBaby = _class_0 -- 175
end -- 191
local SoyLoaf -- 193
do -- 193
	local _class_0 -- 193
	local _parent_0 = Food -- 193
	local _base_0 = { -- 193
		PrintName = "Soylent Loaf", -- 195
		Model = Model("models/gibs/antlion_gib_small_3.mdl"), -- 196
		Hunger = -15, -- 197
		Thirst = 3, -- 198
		Despair = 5, -- 199
		Description = "A chewy loaf of dried Long Pig byproducts.\nLoathsome food, but it'll keep for a century.", -- 201
		Price = 20, -- 203
		UseText = { -- 204
			"gnaws at a soylent loaf.", -- 204
			"chokes down a soylent loaf.", -- 205
			"struggles to eat a soylent loaf.", -- 206
			"chomps on a loaf of mummified meat.", -- 207
			"grinds their teeth on a soylent loaf.", -- 208
			"chews off a chunk from a soylent loaf.", -- 209
			"eats some soylent, like a good citizen should." -- 210
		} -- 193
	} -- 193
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 211
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 193
			_base_0[_key_0] = _val_0 -- 193
		end -- 193
	end -- 211
	if _base_0.__index == nil then -- 193
		_base_0.__index = _base_0 -- 193
	end -- 211
	setmetatable(_base_0, _parent_0.__base) -- 193
	_class_0 = setmetatable({ -- 193
		__init = function(self, ...) -- 193
			return _class_0.__parent.__init(self, ...) -- 193
		end, -- 193
		__base = _base_0, -- 193
		__name = "SoyLoaf", -- 193
		__parent = _parent_0 -- 193
	}, { -- 193
		__index = function(cls, name) -- 193
			local val = rawget(_base_0, name) -- 193
			if val == nil then -- 193
				local parent = rawget(cls, "__parent") -- 193
				if parent then -- 193
					return parent[name] -- 193
				end -- 193
			else -- 193
				return val -- 193
			end -- 193
		end, -- 193
		__call = function(cls, ...) -- 193
			local _self_0 = setmetatable({ }, _base_0) -- 193
			cls.__init(_self_0, ...) -- 193
			return _self_0 -- 193
		end -- 193
	}) -- 193
	_base_0.__class = _class_0 -- 193
	if _parent_0.__inherited then -- 193
		_parent_0.__inherited(_parent_0, _class_0) -- 193
	end -- 193
	SoyLoaf = _class_0 -- 193
end -- 211
local BootSoup -- 213
do -- 213
	local _class_0 -- 213
	local _parent_0 = Food -- 213
	local _base_0 = { -- 213
		PrintName = "Boot n' soup", -- 215
		Model = Model("models/props_c17/metalPot001a.mdl"), -- 216
		HealthAdd = -5, -- 217
		Hunger = -40, -- 218
		Thirst = -4, -- 219
		Despair = -5, -- 220
		Description = "Formerly only filled with slop, now comes with 'vegan-meat'!", -- 221
		CookTime = 13, -- 223
		Price = 20, -- 225
		UseText = { -- 226
			"drinks the soup slowly, but chokes on the 'vegan-meat' .", -- 226
			"miserably slurps the soup, spitting out small chunks of 'vegan-meat'.", -- 227
			"struggles to eat any of the soup and 'vegan-meat'." -- 228
		} -- 213
	} -- 213
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 228
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 213
			_base_0[_key_0] = _val_0 -- 213
		end -- 213
	end -- 228
	if _base_0.__index == nil then -- 213
		_base_0.__index = _base_0 -- 213
	end -- 228
	setmetatable(_base_0, _parent_0.__base) -- 213
	_class_0 = setmetatable({ -- 213
		__init = function(self, ...) -- 213
			return _class_0.__parent.__init(self, ...) -- 213
		end, -- 213
		__base = _base_0, -- 213
		__name = "BootSoup", -- 213
		__parent = _parent_0 -- 213
	}, { -- 213
		__index = function(cls, name) -- 213
			local val = rawget(_base_0, name) -- 213
			if val == nil then -- 213
				local parent = rawget(cls, "__parent") -- 213
				if parent then -- 213
					return parent[name] -- 213
				end -- 213
			else -- 213
				return val -- 213
			end -- 213
		end, -- 213
		__call = function(cls, ...) -- 213
			local _self_0 = setmetatable({ }, _base_0) -- 213
			cls.__init(_self_0, ...) -- 213
			return _self_0 -- 213
		end -- 213
	}) -- 213
	_base_0.__class = _class_0 -- 213
	if _parent_0.__inherited then -- 213
		_parent_0.__inherited(_parent_0, _class_0) -- 213
	end -- 213
	BootSoup = _class_0 -- 213
end -- 228
local MeatLoaf -- 230
do -- 230
	local _class_0 -- 230
	local _parent_0 = Food -- 230
	local _base_0 = { -- 230
		PrintName = "Meatloaf", -- 232
		Model = Model("models/props_junk/garbage_takeoutcarton001a.mdl"), -- 233
		Armor = 5, -- 234
		Hunger = -40, -- 235
		Thirst = -9, -- 236
		Despair = -20, -- 237
		Description = "Delicious meatloaf, a favorite of many soldiers.", -- 238
		CookTime = 15, -- 240
		Price = 100, -- 243
		Eat = function(self, ply) -- 243
			_class_0.__parent.__base.Eat(self, ply) -- 244
			if CLIENT then -- 245
				return -- 245
			end -- 245
			return ply:AddStemCells(1) -- 246
		end, -- 248
		UseText = { -- 249
			"devours their meatloaf.", -- 249
			"gobbles down their meatloaf, and looks amazed.", -- 250
			"savors the taste of the meatloaf whilst ingesting it." -- 251
		} -- 230
	} -- 230
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 252
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 230
			_base_0[_key_0] = _val_0 -- 230
		end -- 230
	end -- 252
	if _base_0.__index == nil then -- 230
		_base_0.__index = _base_0 -- 230
	end -- 252
	setmetatable(_base_0, _parent_0.__base) -- 230
	_class_0 = setmetatable({ -- 230
		__init = function(self, ...) -- 230
			return _class_0.__parent.__init(self, ...) -- 230
		end, -- 230
		__base = _base_0, -- 230
		__name = "MeatLoaf", -- 230
		__parent = _parent_0 -- 230
	}, { -- 230
		__index = function(cls, name) -- 230
			local val = rawget(_base_0, name) -- 230
			if val == nil then -- 230
				local parent = rawget(cls, "__parent") -- 230
				if parent then -- 230
					return parent[name] -- 230
				end -- 230
			else -- 230
				return val -- 230
			end -- 230
		end, -- 230
		__call = function(cls, ...) -- 230
			local _self_0 = setmetatable({ }, _base_0) -- 230
			cls.__init(_self_0, ...) -- 230
			return _self_0 -- 230
		end -- 230
	}) -- 230
	_base_0.__class = _class_0 -- 230
	if _parent_0.__inherited then -- 230
		_parent_0.__inherited(_parent_0, _class_0) -- 230
	end -- 230
	MeatLoaf = _class_0 -- 230
end -- 252
local SlopBowl -- 255
do -- 255
	local _class_0 -- 255
	local _parent_0 = Food -- 255
	local _base_0 = { -- 255
		PrintName = "Slop Bowl", -- 257
		Model = Model("models/props_c17/metalPot001a.mdl"), -- 258
		Hunger = -30, -- 259
		Thirst = 4, -- 260
		Despair = 15, -- 261
		Description = "A festering pot that oozes a disgusting liquid.\nIt seems oddly comforting.", -- 262
		CookTime = 10, -- 264
		Price = 20, -- 266
		UseText = { -- 267
			"enjoys the slop.", -- 267
			"chokes while consuming slop.", -- 268
			"struggles to eat a slop bowl.", -- 269
			"chomps on some slop.", -- 270
			"begrudgingly eats a spoonful of slop.", -- 271
			"consumes slop." -- 272
		} -- 255
	} -- 255
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 272
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 255
			_base_0[_key_0] = _val_0 -- 255
		end -- 255
	end -- 272
	if _base_0.__index == nil then -- 255
		_base_0.__index = _base_0 -- 255
	end -- 272
	setmetatable(_base_0, _parent_0.__base) -- 255
	_class_0 = setmetatable({ -- 255
		__init = function(self, ...) -- 255
			return _class_0.__parent.__init(self, ...) -- 255
		end, -- 255
		__base = _base_0, -- 255
		__name = "SlopBowl", -- 255
		__parent = _parent_0 -- 255
	}, { -- 255
		__index = function(cls, name) -- 255
			local val = rawget(_base_0, name) -- 255
			if val == nil then -- 255
				local parent = rawget(cls, "__parent") -- 255
				if parent then -- 255
					return parent[name] -- 255
				end -- 255
			else -- 255
				return val -- 255
			end -- 255
		end, -- 255
		__call = function(cls, ...) -- 255
			local _self_0 = setmetatable({ }, _base_0) -- 255
			cls.__init(_self_0, ...) -- 255
			return _self_0 -- 255
		end -- 255
	}) -- 255
	_base_0.__class = _class_0 -- 255
	if _parent_0.__inherited then -- 255
		_parent_0.__inherited(_parent_0, _class_0) -- 255
	end -- 255
	SlopBowl = _class_0 -- 255
end -- 272
local GroundRibs -- 274
do -- 274
	local _class_0 -- 274
	local _parent_0 = Food -- 274
	local _base_0 = { -- 274
		PrintName = "Ground Ribs", -- 276
		Model = Model("models/props_c17/metalPot001a.mdl"), -- 277
		Hunger = -10, -- 278
		Thirst = 5, -- 279
		Despair = 15, -- 280
		HealthAdd = -5, -- 281
		Description = "Human ribs, ground up into a fibrous powder.\nIt doesn't look edible yet.", -- 282
		CookTime = 5, -- 284
		Price = 30, -- 286
		UseText = { -- 287
			"eats some ground ribs and spits them out.", -- 287
			"bleeds from a chunk of ground ribs.", -- 288
			"munches on some ground ribs, lacerating their throat.", -- 289
			"regrets putting rib powder in their mouth." -- 290
		} -- 274
	} -- 274
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 290
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 274
			_base_0[_key_0] = _val_0 -- 274
		end -- 274
	end -- 290
	if _base_0.__index == nil then -- 274
		_base_0.__index = _base_0 -- 274
	end -- 290
	setmetatable(_base_0, _parent_0.__base) -- 274
	_class_0 = setmetatable({ -- 274
		__init = function(self, ...) -- 274
			return _class_0.__parent.__init(self, ...) -- 274
		end, -- 274
		__base = _base_0, -- 274
		__name = "GroundRibs", -- 274
		__parent = _parent_0 -- 274
	}, { -- 274
		__index = function(cls, name) -- 274
			local val = rawget(_base_0, name) -- 274
			if val == nil then -- 274
				local parent = rawget(cls, "__parent") -- 274
				if parent then -- 274
					return parent[name] -- 274
				end -- 274
			else -- 274
				return val -- 274
			end -- 274
		end, -- 274
		__call = function(cls, ...) -- 274
			local _self_0 = setmetatable({ }, _base_0) -- 274
			cls.__init(_self_0, ...) -- 274
			return _self_0 -- 274
		end -- 274
	}) -- 274
	_base_0.__class = _class_0 -- 274
	if _parent_0.__inherited then -- 274
		_parent_0.__inherited(_parent_0, _class_0) -- 274
	end -- 274
	GroundRibs = _class_0 -- 274
end -- 290
local Boot -- 295
do -- 295
	local _class_0 -- 295
	local _parent_0 = Food -- 295
	local _base_0 = { -- 295
		PrintName = "Boot", -- 297
		Model = Model("models/props_junk/Shoe001a.mdl"), -- 298
		HealthAdd = -4, -- 299
		Hunger = -5, -- 300
		Thirst = 40, -- 301
		Despair = 40, -- 302
		Description = "A dirty old boot, nearly fallen apart.", -- 304
		UseText = { -- 305
			"chews on a nasty boot!", -- 305
			"chokes on an old boot.", -- 306
			"gnaws a boot to shreds.", -- 307
			"shoves a boot in their mouth!", -- 308
			"eats a rotten leather boot.", -- 309
			"devours a dirty old boot!", -- 310
			"eats a boot." -- 311
		} -- 295
	} -- 295
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 312
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 295
			_base_0[_key_0] = _val_0 -- 295
		end -- 295
	end -- 312
	if _base_0.__index == nil then -- 295
		_base_0.__index = _base_0 -- 295
	end -- 312
	setmetatable(_base_0, _parent_0.__base) -- 295
	_class_0 = setmetatable({ -- 295
		__init = function(self, ...) -- 295
			return _class_0.__parent.__init(self, ...) -- 295
		end, -- 295
		__base = _base_0, -- 295
		__name = "Boot", -- 295
		__parent = _parent_0 -- 295
	}, { -- 295
		__index = function(cls, name) -- 295
			local val = rawget(_base_0, name) -- 295
			if val == nil then -- 295
				local parent = rawget(cls, "__parent") -- 295
				if parent then -- 295
					return parent[name] -- 295
				end -- 295
			else -- 295
				return val -- 295
			end -- 295
		end, -- 295
		__call = function(cls, ...) -- 295
			local _self_0 = setmetatable({ }, _base_0) -- 295
			cls.__init(_self_0, ...) -- 295
			return _self_0 -- 295
		end -- 295
	}) -- 295
	_base_0.__class = _class_0 -- 295
	if _parent_0.__inherited then -- 295
		_parent_0.__inherited(_parent_0, _class_0) -- 295
	end -- 295
	Boot = _class_0 -- 295
end -- 312
local BleachedMelon -- 314
do -- 314
	local _class_0 -- 314
	local _parent_0 = Food -- 314
	local _base_0 = { -- 314
		PrintName = "Bleached Melon", -- 316
		Model = Model("models/props_junk/watermelon01_chunk01c.mdl"), -- 317
		HealthAdd = -3, -- 318
		Hunger = -15, -- 319
		Thirst = -4, -- 320
		Description = "This was covered in mold before, hopefully the chlorine got rid of it.", -- 322
		CookTime = 10, -- 323
		Price = 25, -- 325
		UseText = { -- 326
			"eats a melon.", -- 326
			"devours a chunk of melon.", -- 327
			"munches on a melon." -- 328
		} -- 314
	} -- 314
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 328
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 314
			_base_0[_key_0] = _val_0 -- 314
		end -- 314
	end -- 328
	if _base_0.__index == nil then -- 314
		_base_0.__index = _base_0 -- 314
	end -- 328
	setmetatable(_base_0, _parent_0.__base) -- 314
	_class_0 = setmetatable({ -- 314
		__init = function(self, ...) -- 314
			return _class_0.__parent.__init(self, ...) -- 314
		end, -- 314
		__base = _base_0, -- 314
		__name = "BleachedMelon", -- 314
		__parent = _parent_0 -- 314
	}, { -- 314
		__index = function(cls, name) -- 314
			local val = rawget(_base_0, name) -- 314
			if val == nil then -- 314
				local parent = rawget(cls, "__parent") -- 314
				if parent then -- 314
					return parent[name] -- 314
				end -- 314
			else -- 314
				return val -- 314
			end -- 314
		end, -- 314
		__call = function(cls, ...) -- 314
			local _self_0 = setmetatable({ }, _base_0) -- 314
			cls.__init(_self_0, ...) -- 314
			return _self_0 -- 314
		end -- 314
	}) -- 314
	_base_0.__class = _class_0 -- 314
	if _parent_0.__inherited then -- 314
		_parent_0.__inherited(_parent_0, _class_0) -- 314
	end -- 314
	BleachedMelon = _class_0 -- 314
end -- 328
local MoldMelon -- 332
do -- 332
	local _class_0 -- 332
	local _parent_0 = Food -- 332
	local _base_0 = { -- 332
		PrintName = "Mold Melon", -- 334
		Model = Model("models/props_junk/watermelon01_chunk01c.mdl"), -- 335
		HealthAdd = -10, -- 336
		Hunger = -6, -- 337
		Despair = 4, -- 338
		Description = "A pithy husk of fruit, fully colonized by white mold.", -- 340
		Price = 45, -- 342
		UseText = { -- 343
			"eats a moldy melon.", -- 343
			"devours a moldy chunk of melon.", -- 344
			"munches on a mold melon.", -- 345
			"feasts on a fungus fruit.", -- 346
			"tears into some mold melon.", -- 347
			"crunches up a mold melon.", -- 348
			"chows down on a mold melon." -- 349
		} -- 332
	} -- 332
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 350
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 332
			_base_0[_key_0] = _val_0 -- 332
		end -- 332
	end -- 350
	if _base_0.__index == nil then -- 332
		_base_0.__index = _base_0 -- 332
	end -- 350
	setmetatable(_base_0, _parent_0.__base) -- 332
	_class_0 = setmetatable({ -- 332
		__init = function(self, ...) -- 332
			return _class_0.__parent.__init(self, ...) -- 332
		end, -- 332
		__base = _base_0, -- 332
		__name = "MoldMelon", -- 332
		__parent = _parent_0 -- 332
	}, { -- 332
		__index = function(cls, name) -- 332
			local val = rawget(_base_0, name) -- 332
			if val == nil then -- 332
				local parent = rawget(cls, "__parent") -- 332
				if parent then -- 332
					return parent[name] -- 332
				end -- 332
			else -- 332
				return val -- 332
			end -- 332
		end, -- 332
		__call = function(cls, ...) -- 332
			local _self_0 = setmetatable({ }, _base_0) -- 332
			cls.__init(_self_0, ...) -- 332
			return _self_0 -- 332
		end -- 332
	}) -- 332
	_base_0.__class = _class_0 -- 332
	if _parent_0.__inherited then -- 332
		_parent_0.__inherited(_parent_0, _class_0) -- 332
	end -- 332
	MoldMelon = _class_0 -- 332
end -- 350
local DrinkFluid -- 352
do -- 352
	local _class_0 -- 352
	local _parent_0 = SOUND -- 352
	local _base_0 = { -- 352
		sound = (function() -- 353
			local _accum_0 = { } -- 353
			local _len_0 = 1 -- 353
			for i = 1, 2 do -- 353
				_accum_0[_len_0] = "npc/barnacle/barnacle_gulp" .. tostring(i) .. ".wav" -- 353
				_len_0 = _len_0 + 1 -- 353
			end -- 353
			return _accum_0 -- 353
		end)(), -- 354
		level = SNDLVL_65DB -- 352
	} -- 352
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 354
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 352
			_base_0[_key_0] = _val_0 -- 352
		end -- 352
	end -- 354
	if _base_0.__index == nil then -- 352
		_base_0.__index = _base_0 -- 352
	end -- 354
	setmetatable(_base_0, _parent_0.__base) -- 352
	_class_0 = setmetatable({ -- 352
		__init = function(self, ...) -- 352
			return _class_0.__parent.__init(self, ...) -- 352
		end, -- 352
		__base = _base_0, -- 352
		__name = "DrinkFluid", -- 352
		__parent = _parent_0 -- 352
	}, { -- 352
		__index = function(cls, name) -- 352
			local val = rawget(_base_0, name) -- 352
			if val == nil then -- 352
				local parent = rawget(cls, "__parent") -- 352
				if parent then -- 352
					return parent[name] -- 352
				end -- 352
			else -- 352
				return val -- 352
			end -- 352
		end, -- 352
		__call = function(cls, ...) -- 352
			local _self_0 = setmetatable({ }, _base_0) -- 352
			cls.__init(_self_0, ...) -- 352
			return _self_0 -- 352
		end -- 352
	}) -- 352
	_base_0.__class = _class_0 -- 352
	if _parent_0.__inherited then -- 352
		_parent_0.__inherited(_parent_0, _class_0) -- 352
	end -- 352
	DrinkFluid = _class_0 -- 352
end -- 354
local Drink -- 356
do -- 356
	local _class_0 -- 356
	local _parent_0 = Food -- 356
	local _base_0 = { -- 356
		PrintName = "Drink", -- 358
		Sound = "DrinkFluid" -- 356
	} -- 356
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 358
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 356
			_base_0[_key_0] = _val_0 -- 356
		end -- 356
	end -- 358
	if _base_0.__index == nil then -- 356
		_base_0.__index = _base_0 -- 356
	end -- 358
	setmetatable(_base_0, _parent_0.__base) -- 356
	_class_0 = setmetatable({ -- 356
		__init = function(self, ...) -- 356
			return _class_0.__parent.__init(self, ...) -- 356
		end, -- 356
		__base = _base_0, -- 356
		__name = "Drink", -- 356
		__parent = _parent_0 -- 356
	}, { -- 356
		__index = function(cls, name) -- 356
			local val = rawget(_base_0, name) -- 356
			if val == nil then -- 356
				local parent = rawget(cls, "__parent") -- 356
				if parent then -- 356
					return parent[name] -- 356
				end -- 356
			else -- 356
				return val -- 356
			end -- 356
		end, -- 356
		__call = function(cls, ...) -- 356
			local _self_0 = setmetatable({ }, _base_0) -- 356
			cls.__init(_self_0, ...) -- 356
			return _self_0 -- 356
		end -- 356
	}) -- 356
	_base_0.__class = _class_0 -- 356
	if _parent_0.__inherited then -- 356
		_parent_0.__inherited(_parent_0, _class_0) -- 356
	end -- 356
	Drink = _class_0 -- 356
end -- 358
local FearBeer -- 360
do -- 360
	local _class_0 -- 360
	local _parent_0 = Drink -- 360
	local _base_0 = { -- 360
		PrintName = "Fear Beer", -- 362
		Model = Model("models/props_junk/garbage_glassbottle001a.mdl"), -- 363
		Thirst = -20, -- 364
		Despair = -25, -- 365
		Description = "A bottle of foul off-yellow liquid.\n'BEER' is hand-written on the label.", -- 367
		Price = 80, -- 369
		TrashClass = "trash/bottle/fearbeer", -- 371
		ImpactThreshold = 256, -- 373
		UseText = { -- 374
			"chugs a fear beer.", -- 374
			"downs a bottle of piss beer.", -- 375
			"drinks a ratty bottle of brew.", -- 376
			"quaffs a beer and grimaces.", -- 377
			"takes a swig of fear beer and shivers.", -- 378
			"guzzles a fear beer.", -- 379
			"chokes down some piss beer." -- 380
		}, -- 383
		Initialize = function(self) -- 383
			_class_0.__parent.__base.Initialize(self) -- 384
			if SERVER then -- 385
				return self:PrecacheGibs() -- 385
			end -- 385
		end, -- 387
		OnTakeDamage = function(self, dmg) -- 387
			_class_0.__parent.__base.OnTakeDamage(self, dmg) -- 388
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH -- 389
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then -- 390
				self:Shatter(dmg:GetDamageForce()) -- 390
			end -- 390
			if attacker and IsValid(attacker) and attacker:IsPlayer() then -- 391
				if attacker:HasOddity(ODDITY_DELINQUENCY) then -- 392
					return attacker:AddDespair(-math.random(2, 4)) -- 393
				end -- 392
			end -- 391
		end, -- 395
		PhysicsCollide = function(self, data) -- 395
			_class_0.__parent.__base.PhysicsCollide(self, data) -- 396
			if CLIENT then -- 397
				return -- 397
			end -- 397
			if data.Speed > self.ImpactThreshold then -- 398
				if data.HitEntity and IsValid(data.HitEntity) then -- 399
					local attacker = self:GetNWEntity("evilrp_submitter") -- 400
					do -- 401
						local dmg = DamageInfo() -- 401
						dmg:SetDamage(10) -- 402
						if IsValid(attacker) then -- 403
							dmg:SetAttacker(attacker) -- 403
						end -- 403
						dmg:SetInflictor(self) -- 404
						dmg:SetDamageType(DMG_SLASH) -- 405
						dmg:SetDamagePosition(data.HitPos) -- 406
						data.HitEntity:TakeDamageInfo(dmg) -- 407
					end -- 401
				end -- 399
				local force = data.OurNewVelocity -- 408
				return self:Shatter(force) -- 409
			end -- 398
		end, -- 411
		Shatter = function(self, force) -- 411
			if self.broken then -- 412
				return -- 412
			end -- 412
			self.broken = true -- 413
			local pos = self:GetPos() -- 414
			local _list_0 = player.GetAll() -- 415
			for _index_0 = 1, #_list_0 do -- 415
				local ply = _list_0[_index_0] -- 415
				local _continue_0 = false -- 416
				repeat -- 416
					if not ply:HasOddity(ODDITY_DELINQUENCY) then -- 416
						_continue_0 = true -- 416
						break -- 416
					end -- 416
					if ply:CanSee(self) and ply:LookingInDirection(pos) then -- 417
						ply:AddDespair(-math.random(2, 4)) -- 418
					end -- 417
					_continue_0 = true -- 416
				until true -- 418
				if not _continue_0 then -- 418
					break -- 418
				end -- 418
			end -- 418
			do -- 419
				local ed = EffectData() -- 419
				ed:SetStart(pos) -- 420
				ed:SetOrigin(pos) -- 421
				ed:SetScale(8) -- 422
				util.Effect("GlassImpact", ed, true, true) -- 423
			end -- 419
			self:EmitSound("BottleSmash") -- 424
			self:GibBreakServer(force) -- 425
			return self:Remove() -- 426
		end -- 360
	} -- 360
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 426
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 360
			_base_0[_key_0] = _val_0 -- 360
		end -- 360
	end -- 426
	if _base_0.__index == nil then -- 360
		_base_0.__index = _base_0 -- 360
	end -- 426
	setmetatable(_base_0, _parent_0.__base) -- 360
	_class_0 = setmetatable({ -- 360
		__init = function(self, ...) -- 360
			return _class_0.__parent.__init(self, ...) -- 360
		end, -- 360
		__base = _base_0, -- 360
		__name = "FearBeer", -- 360
		__parent = _parent_0 -- 360
	}, { -- 360
		__index = function(cls, name) -- 360
			local val = rawget(_base_0, name) -- 360
			if val == nil then -- 360
				local parent = rawget(cls, "__parent") -- 360
				if parent then -- 360
					return parent[name] -- 360
				end -- 360
			else -- 360
				return val -- 360
			end -- 360
		end, -- 360
		__call = function(cls, ...) -- 360
			local _self_0 = setmetatable({ }, _base_0) -- 360
			cls.__init(_self_0, ...) -- 360
			return _self_0 -- 360
		end -- 360
	}) -- 360
	_base_0.__class = _class_0 -- 360
	if _parent_0.__inherited then -- 360
		_parent_0.__inherited(_parent_0, _class_0) -- 360
	end -- 360
	FearBeer = _class_0 -- 360
end -- 426
local SmearBeer -- 428
do -- 428
	local _class_0 -- 428
	local _parent_0 = Drink -- 428
	local _base_0 = { -- 428
		PrintName = "Smear Beer", -- 430
		Model = Model("models/props_junk/garbage_glassbottle003a.mdl"), -- 431
		Thirst = -25, -- 432
		Despair = -35, -- 433
		Description = "A bottle of cloudy, greyish red booze.\nThe label is obscured with a smear of old blood.", -- 435
		Price = 150, -- 437
		TrashClass = "trash/bottle", -- 439
		ImpactThreshold = 256, -- 441
		UseText = { -- 442
			"chugs a smear beer.", -- 442
			"downs a bottle of red brew.", -- 443
			"drinks a cloudy bottle of beer.", -- 444
			"quaffs a smear beer and shivers.", -- 445
			"takes a swig of smear beer.", -- 446
			"guzzles a bloody beer.", -- 447
			"nurses a bottle of blood beer." -- 448
		}, -- 451
		Initialize = function(self) -- 451
			_class_0.__parent.__base.Initialize(self) -- 452
			if SERVER then -- 453
				return self:PrecacheGibs() -- 453
			end -- 453
		end, -- 455
		OnTakeDamage = function(self, dmg) -- 455
			_class_0.__parent.__base.OnTakeDamage(self, dmg) -- 456
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH -- 457
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then -- 458
				self:Shatter(dmg:GetDamageForce()) -- 458
			end -- 458
			if attacker and IsValid(attacker) and attacker:IsPlayer() then -- 459
				if attacker:HasOddity(ODDITY_DELINQUENCY) then -- 460
					return attacker:AddDespair(-math.random(2, 4)) -- 461
				end -- 460
			end -- 459
		end, -- 463
		PhysicsCollide = function(self, data) -- 463
			_class_0.__parent.__base.PhysicsCollide(self, data) -- 464
			if CLIENT then -- 465
				return -- 465
			end -- 465
			if data.Speed > self.ImpactThreshold then -- 466
				if data.HitEntity and IsValid(data.HitEntity) then -- 467
					local attacker = self:GetNWEntity("evilrp_submitter") -- 468
					do -- 469
						local dmg = DamageInfo() -- 469
						dmg:SetDamage(10) -- 470
						if IsValid(attacker) then -- 471
							dmg:SetAttacker(attacker) -- 471
						end -- 471
						dmg:SetInflictor(self) -- 472
						dmg:SetDamageType(DMG_SLASH) -- 473
						dmg:SetDamagePosition(data.HitPos) -- 474
						data.HitEntity:TakeDamageInfo(dmg) -- 475
					end -- 469
				end -- 467
				local force = data.OurNewVelocity -- 476
				return self:Shatter(force) -- 477
			end -- 466
		end, -- 479
		Shatter = function(self, force) -- 479
			if self.broken then -- 480
				return -- 480
			end -- 480
			self.broken = true -- 481
			local pos = self:GetPos() -- 482
			local _list_0 = player.GetAll() -- 483
			for _index_0 = 1, #_list_0 do -- 483
				local ply = _list_0[_index_0] -- 483
				local _continue_0 = false -- 484
				repeat -- 484
					if not ply:HasOddity(ODDITY_DELINQUENCY) then -- 484
						_continue_0 = true -- 484
						break -- 484
					end -- 484
					if ply:CanSee(self) and ply:LookingInDirection(pos) then -- 485
						ply:AddDespair(-math.random(2, 4)) -- 486
					end -- 485
					_continue_0 = true -- 484
				until true -- 486
				if not _continue_0 then -- 486
					break -- 486
				end -- 486
			end -- 486
			do -- 487
				local ed = EffectData() -- 487
				ed:SetStart(pos) -- 488
				ed:SetOrigin(pos) -- 489
				ed:SetScale(8) -- 490
				util.Effect("GlassImpact", ed, true, true) -- 491
			end -- 487
			self:EmitSound("BottleSmash") -- 492
			self:GibBreakServer(force) -- 493
			return self:Remove() -- 494
		end -- 428
	} -- 428
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 494
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 428
			_base_0[_key_0] = _val_0 -- 428
		end -- 428
	end -- 494
	if _base_0.__index == nil then -- 428
		_base_0.__index = _base_0 -- 428
	end -- 494
	setmetatable(_base_0, _parent_0.__base) -- 428
	_class_0 = setmetatable({ -- 428
		__init = function(self, ...) -- 428
			return _class_0.__parent.__init(self, ...) -- 428
		end, -- 428
		__base = _base_0, -- 428
		__name = "SmearBeer", -- 428
		__parent = _parent_0 -- 428
	}, { -- 428
		__index = function(cls, name) -- 428
			local val = rawget(_base_0, name) -- 428
			if val == nil then -- 428
				local parent = rawget(cls, "__parent") -- 428
				if parent then -- 428
					return parent[name] -- 428
				end -- 428
			else -- 428
				return val -- 428
			end -- 428
		end, -- 428
		__call = function(cls, ...) -- 428
			local _self_0 = setmetatable({ }, _base_0) -- 428
			cls.__init(_self_0, ...) -- 428
			return _self_0 -- 428
		end -- 428
	}) -- 428
	_base_0.__class = _class_0 -- 428
	if _parent_0.__inherited then -- 428
		_parent_0.__inherited(_parent_0, _class_0) -- 428
	end -- 428
	SmearBeer = _class_0 -- 428
end -- 494
local Shake -- 496
do -- 496
	local _class_0 -- 496
	local _parent_0 = Drink -- 496
	local _base_0 = { -- 496
		PrintName = "Soylent Shake", -- 498
		Model = Model("models/props_junk/garbage_milkcarton001a.mdl"), -- 499
		Thirst = -40, -- 500
		Hunger = -40, -- 501
		Despair = 30, -- 502
		Description = "A jug full of partially blended human remains.\nIt's warm and chunky.", -- 504
		Price = 140, -- 506
		TrashClass = "trash/plastic/shake", -- 508
		UseText = { -- 509
			"chokes down a soylent shake.", -- 509
			"slurps up a soylent shake.", -- 510
			"swigs blended peoplemeat and shudders.", -- 511
			"struggles down a jug of human sludge.", -- 512
			"shoots back a bad protein shake.", -- 513
			"guzzles a meat smoothie.", -- 514
			"quaffs an entire soylent shake." -- 515
		} -- 496
	} -- 496
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 516
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 496
			_base_0[_key_0] = _val_0 -- 496
		end -- 496
	end -- 516
	if _base_0.__index == nil then -- 496
		_base_0.__index = _base_0 -- 496
	end -- 516
	setmetatable(_base_0, _parent_0.__base) -- 496
	_class_0 = setmetatable({ -- 496
		__init = function(self, ...) -- 496
			return _class_0.__parent.__init(self, ...) -- 496
		end, -- 496
		__base = _base_0, -- 496
		__name = "Shake", -- 496
		__parent = _parent_0 -- 496
	}, { -- 496
		__index = function(cls, name) -- 496
			local val = rawget(_base_0, name) -- 496
			if val == nil then -- 496
				local parent = rawget(cls, "__parent") -- 496
				if parent then -- 496
					return parent[name] -- 496
				end -- 496
			else -- 496
				return val -- 496
			end -- 496
		end, -- 496
		__call = function(cls, ...) -- 496
			local _self_0 = setmetatable({ }, _base_0) -- 496
			cls.__init(_self_0, ...) -- 496
			return _self_0 -- 496
		end -- 496
	}) -- 496
	_base_0.__class = _class_0 -- 496
	if _parent_0.__inherited then -- 496
		_parent_0.__inherited(_parent_0, _class_0) -- 496
	end -- 496
	Shake = _class_0 -- 496
end -- 516
local BootLeg -- 518
do -- 518
	local _class_0 -- 518
	local _parent_0 = Drink -- 518
	local _base_0 = { -- 518
		PrintName = "Bootleg", -- 520
		Model = Model("models/props_junk/garbage_plasticbottle003a.mdl"), -- 521
		Thirst = -40, -- 522
		Hunger = -5, -- 523
		Despair = -45, -- 524
		HealthAdd = -18, -- 525
		Description = "An old bootleg of a wasteland wine recipe that has been lost to time. \n Tales say that the wastelander with the original recipe burned it and killed himself.", -- 526
		Price = 250, -- 528
		CookTime = 15, -- 530
		TrashClass = "trash/plastic/twitchel", -- 533
		UseText = { -- 534
			"takes a swig of the bootlegged wine, wincing as the strong liquor trickles down and burns his scabbed and cut skin.", -- 534
			"tries to drink all of the bootlegged wine, before gasping heavily.", -- 535
			"breathes in before taking a massive swig of the bootlegged wine, grimacing upon burning his mouth." -- 536
		}, -- 539
		Eat = function(self, ply) -- 539
			_class_0.__parent.__base.Eat(self, ply) -- 540
			if CLIENT then -- 541
				return -- 541
			end -- 541
			local plyJob = RPExtraTeams[ply:Team()] -- 542
			if plyJob.category == "Wasteland" then -- 543
				ply:AddDespair(-55) -- 544
				ply:AddHunger(-15) -- 545
				ply:AddThirst(-48) -- 546
				return ply:TakeDamage(-5) -- 547
			end -- 543
		end -- 518
	} -- 518
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 551
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 518
			_base_0[_key_0] = _val_0 -- 518
		end -- 518
	end -- 551
	if _base_0.__index == nil then -- 518
		_base_0.__index = _base_0 -- 518
	end -- 551
	setmetatable(_base_0, _parent_0.__base) -- 518
	_class_0 = setmetatable({ -- 518
		__init = function(self, ...) -- 518
			return _class_0.__parent.__init(self, ...) -- 518
		end, -- 518
		__base = _base_0, -- 518
		__name = "BootLeg", -- 518
		__parent = _parent_0 -- 518
	}, { -- 518
		__index = function(cls, name) -- 518
			local val = rawget(_base_0, name) -- 518
			if val == nil then -- 518
				local parent = rawget(cls, "__parent") -- 518
				if parent then -- 518
					return parent[name] -- 518
				end -- 518
			else -- 518
				return val -- 518
			end -- 518
		end, -- 518
		__call = function(cls, ...) -- 518
			local _self_0 = setmetatable({ }, _base_0) -- 518
			cls.__init(_self_0, ...) -- 518
			return _self_0 -- 518
		end -- 518
	}) -- 518
	_base_0.__class = _class_0 -- 518
	if _parent_0.__inherited then -- 518
		_parent_0.__inherited(_parent_0, _class_0) -- 518
	end -- 518
	BootLeg = _class_0 -- 518
end -- 551
local Twitchel -- 553
do -- 553
	local _class_0 -- 553
	local _parent_0 = Drink -- 553
	local _base_0 = { -- 553
		PrintName = "Twitchel", -- 555
		Model = Model("models/props_junk/garbage_plasticbottle003a.mdl"), -- 556
		Thirst = -44, -- 557
		Hunger = 6, -- 558
		Despair = 6, -- 559
		Description = "A bottle of refreshingly lukewarm, cloudy green drink.", -- 561
		Price = 120, -- 563
		TrashClass = "trash/plastic/twitchel", -- 565
		UseText = { -- 566
			"necks a bottle of twitchel.", -- 566
			"can't get enough of that green stuff.", -- 567
			"sucks down a bottle of twitchel.", -- 568
			"sips up their twitchel.", -- 569
			"pours twitchel down their throat.", -- 570
			"drinks a bottle of twitchel.", -- 571
			"slurps up a green drink." -- 572
		} -- 553
	} -- 553
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 573
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 553
			_base_0[_key_0] = _val_0 -- 553
		end -- 553
	end -- 573
	if _base_0.__index == nil then -- 553
		_base_0.__index = _base_0 -- 553
	end -- 573
	setmetatable(_base_0, _parent_0.__base) -- 553
	_class_0 = setmetatable({ -- 553
		__init = function(self, ...) -- 553
			return _class_0.__parent.__init(self, ...) -- 553
		end, -- 553
		__base = _base_0, -- 553
		__name = "Twitchel", -- 553
		__parent = _parent_0 -- 553
	}, { -- 553
		__index = function(cls, name) -- 553
			local val = rawget(_base_0, name) -- 553
			if val == nil then -- 553
				local parent = rawget(cls, "__parent") -- 553
				if parent then -- 553
					return parent[name] -- 553
				end -- 553
			else -- 553
				return val -- 553
			end -- 553
		end, -- 553
		__call = function(cls, ...) -- 553
			local _self_0 = setmetatable({ }, _base_0) -- 553
			cls.__init(_self_0, ...) -- 553
			return _self_0 -- 553
		end -- 553
	}) -- 553
	_base_0.__class = _class_0 -- 553
	if _parent_0.__inherited then -- 553
		_parent_0.__inherited(_parent_0, _class_0) -- 553
	end -- 553
	Twitchel = _class_0 -- 553
end -- 573
local TakeMeds -- 575
do -- 575
	local _class_0 -- 575
	local _parent_0 = SOUND -- 575
	local _base_0 = { -- 575
		sound = (function() -- 576
			local _accum_0 = { } -- 576
			local _len_0 = 1 -- 576
			for i = 1, 3 do -- 576
				_accum_0[_len_0] = "npc/zombie/zombie_pain" .. tostring(i) .. ".wav" -- 576
				_len_0 = _len_0 + 1 -- 576
			end -- 576
			return _accum_0 -- 576
		end)() -- 575
	} -- 575
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 576
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 575
			_base_0[_key_0] = _val_0 -- 575
		end -- 575
	end -- 576
	if _base_0.__index == nil then -- 575
		_base_0.__index = _base_0 -- 575
	end -- 576
	setmetatable(_base_0, _parent_0.__base) -- 575
	_class_0 = setmetatable({ -- 575
		__init = function(self, ...) -- 575
			return _class_0.__parent.__init(self, ...) -- 575
		end, -- 575
		__base = _base_0, -- 575
		__name = "TakeMeds", -- 575
		__parent = _parent_0 -- 575
	}, { -- 575
		__index = function(cls, name) -- 575
			local val = rawget(_base_0, name) -- 575
			if val == nil then -- 575
				local parent = rawget(cls, "__parent") -- 575
				if parent then -- 575
					return parent[name] -- 575
				end -- 575
			else -- 575
				return val -- 575
			end -- 575
		end, -- 575
		__call = function(cls, ...) -- 575
			local _self_0 = setmetatable({ }, _base_0) -- 575
			cls.__init(_self_0, ...) -- 575
			return _self_0 -- 575
		end -- 575
	}) -- 575
	_base_0.__class = _class_0 -- 575
	if _parent_0.__inherited then -- 575
		_parent_0.__inherited(_parent_0, _class_0) -- 575
	end -- 575
	TakeMeds = _class_0 -- 575
end -- 576
local Medicine -- 580
do -- 580
	local _class_0 -- 580
	local _parent_0 = Food -- 580
	local _base_0 = { -- 580
		PrintName = "Medicine", -- 582
		Sound = "TakeMeds" -- 580
	} -- 580
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 582
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 580
			_base_0[_key_0] = _val_0 -- 580
		end -- 580
	end -- 582
	if _base_0.__index == nil then -- 580
		_base_0.__index = _base_0 -- 580
	end -- 582
	setmetatable(_base_0, _parent_0.__base) -- 580
	_class_0 = setmetatable({ -- 580
		__init = function(self, ...) -- 580
			return _class_0.__parent.__init(self, ...) -- 580
		end, -- 580
		__base = _base_0, -- 580
		__name = "Medicine", -- 580
		__parent = _parent_0 -- 580
	}, { -- 580
		__index = function(cls, name) -- 580
			local val = rawget(_base_0, name) -- 580
			if val == nil then -- 580
				local parent = rawget(cls, "__parent") -- 580
				if parent then -- 580
					return parent[name] -- 580
				end -- 580
			else -- 580
				return val -- 580
			end -- 580
		end, -- 580
		__call = function(cls, ...) -- 580
			local _self_0 = setmetatable({ }, _base_0) -- 580
			cls.__init(_self_0, ...) -- 580
			return _self_0 -- 580
		end -- 580
	}) -- 580
	_base_0.__class = _class_0 -- 580
	if _parent_0.__inherited then -- 580
		_parent_0.__inherited(_parent_0, _class_0) -- 580
	end -- 580
	Medicine = _class_0 -- 580
end -- 582
local Pills -- 584
do -- 584
	local _class_0 -- 584
	local _parent_0 = Medicine -- 584
	local _base_0 = { -- 584
		PrintName = "Pills", -- 586
		Model = Model("models/props_lab/jar01b.mdl"), -- 587
		HealthAdd = function(self) -- 587
			return math.random(-15, -30) -- 587
		end, -- 588
		Hunger = function(self) -- 588
			return math.random(30, 50) -- 588
		end, -- 589
		Thirst = function(self) -- 589
			return math.random(30, 60) -- 589
		end, -- 590
		Despair = function(self) -- 590
			return math.random(-60, -100) -- 590
		end, -- 592
		Description = "A white plastic bottle, full of random pills.", -- 594
		Price = 125, -- 596
		TrashClass = "trash/plastic/pills", -- 598
		UseText = { -- 599
			"throws a mess of pills into eir mouth.", -- 599
			"consumes the whole contents of a pill bottle.", -- 600
			"devours handfuls of scary-looking pills.", -- 601
			"chokes down some strange pills.", -- 602
			"takes their medicine, like a good citizen should.", -- 603
			"swallows a mouthful of pills.", -- 604
			"takes an excessive dose of colorful pills.", -- 605
			"tosses back an entire bottle of pills.", -- 606
			"throws back a bottle of mystery pills." -- 607
		} -- 584
	} -- 584
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 608
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 584
			_base_0[_key_0] = _val_0 -- 584
		end -- 584
	end -- 608
	if _base_0.__index == nil then -- 584
		_base_0.__index = _base_0 -- 584
	end -- 608
	setmetatable(_base_0, _parent_0.__base) -- 584
	_class_0 = setmetatable({ -- 584
		__init = function(self, ...) -- 584
			return _class_0.__parent.__init(self, ...) -- 584
		end, -- 584
		__base = _base_0, -- 584
		__name = "Pills", -- 584
		__parent = _parent_0 -- 584
	}, { -- 584
		__index = function(cls, name) -- 584
			local val = rawget(_base_0, name) -- 584
			if val == nil then -- 584
				local parent = rawget(cls, "__parent") -- 584
				if parent then -- 584
					return parent[name] -- 584
				end -- 584
			else -- 584
				return val -- 584
			end -- 584
		end, -- 584
		__call = function(cls, ...) -- 584
			local _self_0 = setmetatable({ }, _base_0) -- 584
			cls.__init(_self_0, ...) -- 584
			return _self_0 -- 584
		end -- 584
	}) -- 584
	_base_0.__class = _class_0 -- 584
	if _parent_0.__inherited then -- 584
		_parent_0.__inherited(_parent_0, _class_0) -- 584
	end -- 584
	Pills = _class_0 -- 584
end -- 608
local TimeGas -- 610
do -- 610
	local _class_0 -- 610
	local _parent_0 = Medicine -- 610
	local _base_0 = { -- 610
		PrintName = "Time Gas", -- 612
		Model = Model("models/props_wasteland/prison_sinkchunk001e.mdl"), -- 613
		Sound = (function() -- 613
			local _accum_0 = { } -- 613
			local _len_0 = 1 -- 613
			for i = 2, 3 do -- 613
				_accum_0[_len_0] = "npc/fast_zombie/idle" .. tostring(i) -- 613
				_len_0 = _len_0 + 1 -- 613
			end -- 613
			return _accum_0 -- 613
		end)(), -- 614
		AddHealth = function(self) -- 614
			return math.random(20, 40) -- 614
		end, -- 615
		Hunger = function(self) -- 615
			return math.random(10, 20) -- 615
		end, -- 616
		Thirst = function(self) -- 616
			return math.random(20, 30) -- 616
		end, -- 617
		Despair = function(self) -- 617
			return math.random(0, 10) -- 617
		end, -- 619
		Description = "An inhaler of time acceleration gas.\nSpeeds up healing, and dying.", -- 621
		Price = 100, -- 623
		TrashClass = "trash/inhaler", -- 625
		UseText = { -- 626
			"breathes in some time gas.", -- 626
			"huffs a healing gas.", -- 627
			"isn't yet tired of the time gas.", -- 628
			"inhales a big cloud of time gas.", -- 629
			"takes a deep breath of time gas.", -- 630
			"drags in a lungful of time gas.", -- 631
			"sniffs up a cloud of time gas.", -- 632
			"huffs time gas from the rusty inhaler." -- 633
		} -- 610
	} -- 610
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 634
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 610
			_base_0[_key_0] = _val_0 -- 610
		end -- 610
	end -- 634
	if _base_0.__index == nil then -- 610
		_base_0.__index = _base_0 -- 610
	end -- 634
	setmetatable(_base_0, _parent_0.__base) -- 610
	_class_0 = setmetatable({ -- 610
		__init = function(self, ...) -- 610
			return _class_0.__parent.__init(self, ...) -- 610
		end, -- 610
		__base = _base_0, -- 610
		__name = "TimeGas", -- 610
		__parent = _parent_0 -- 610
	}, { -- 610
		__index = function(cls, name) -- 610
			local val = rawget(_base_0, name) -- 610
			if val == nil then -- 610
				local parent = rawget(cls, "__parent") -- 610
				if parent then -- 610
					return parent[name] -- 610
				end -- 610
			else -- 610
				return val -- 610
			end -- 610
		end, -- 610
		__call = function(cls, ...) -- 610
			local _self_0 = setmetatable({ }, _base_0) -- 610
			cls.__init(_self_0, ...) -- 610
			return _self_0 -- 610
		end -- 610
	}) -- 610
	_base_0.__class = _class_0 -- 610
	if _parent_0.__inherited then -- 610
		_parent_0.__inherited(_parent_0, _class_0) -- 610
	end -- 610
	TimeGas = _class_0 -- 610
end -- 634
local Bleach -- 636
do -- 636
	local _class_0 -- 636
	local _parent_0 = Medicine -- 636
	local _base_0 = { -- 636
		PrintName = "Chlorine", -- 638
		Model = Model("models/props_junk/garbage_plasticbottle002a.mdl"), -- 639
		Sound = "DrinkFluid", -- 640
		Description = "Do NOT even think about drinking this. \n Last guy who tried couldn't even finish it before falling over.", -- 641
		HealthAdd = -50, -- 642
		Hunger = 40, -- 643
		Thirst = -40, -- 644
		Despair = { -- 646
			Description = "A jug full of bleach." -- 646
		}, -- 647
		Price = 100, -- 649
		TrashClass = "trash/plastic/bleach", -- 651
		UseText = { -- 652
			"drinks bleach.", -- 652
			"chugs an entire fucking jug of chlorine.", -- 653
			"unscrews a jug of bleach and pours it down the hatch.", -- 654
			"chokes down gulp after gulp of chlorine bleach." -- 655
		} -- 636
	} -- 636
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 656
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 636
			_base_0[_key_0] = _val_0 -- 636
		end -- 636
	end -- 656
	if _base_0.__index == nil then -- 636
		_base_0.__index = _base_0 -- 636
	end -- 656
	setmetatable(_base_0, _parent_0.__base) -- 636
	_class_0 = setmetatable({ -- 636
		__init = function(self, ...) -- 636
			return _class_0.__parent.__init(self, ...) -- 636
		end, -- 636
		__base = _base_0, -- 636
		__name = "Bleach", -- 636
		__parent = _parent_0 -- 636
	}, { -- 636
		__index = function(cls, name) -- 636
			local val = rawget(_base_0, name) -- 636
			if val == nil then -- 636
				local parent = rawget(cls, "__parent") -- 636
				if parent then -- 636
					return parent[name] -- 636
				end -- 636
			else -- 636
				return val -- 636
			end -- 636
		end, -- 636
		__call = function(cls, ...) -- 636
			local _self_0 = setmetatable({ }, _base_0) -- 636
			cls.__init(_self_0, ...) -- 636
			return _self_0 -- 636
		end -- 636
	}) -- 636
	_base_0.__class = _class_0 -- 636
	if _parent_0.__inherited then -- 636
		_parent_0.__inherited(_parent_0, _class_0) -- 636
	end -- 636
	Bleach = _class_0 -- 636
end -- 656
local Ambrosia -- 658
do -- 658
	local _class_0 -- 658
	local _parent_0 = Food -- 658
	local _base_0 = { -- 658
		PrintName = "Ambrosia", -- 660
		Model = Model("models/props_lab/cactus.mdl"), -- 661
		Hunger = -100, -- 662
		Thirst = -100, -- 663
		Despair = -100, -- 664
		HealthAdd = 100, -- 665
		Description = "A food made for gods.", -- 666
		RotTime = 0, -- 668
		UseText = { -- 669
			"indulges in some ambrosia." -- 669
		}, -- 672
		Precursor = { -- 673
			biomass = 20, -- 673
			wood = 20, -- 674
			metal = 20, -- 675
			polymer = 20 -- 676
		}, -- 678
		Eat = function(self, ply) -- 678
			_class_0.__parent.__base.Eat(self, ply) -- 679
			if CLIENT then -- 680
				return -- 680
			end -- 680
			return ply:AddStemCells(5) -- 681
		end -- 658
	} -- 658
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 681
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 658
			_base_0[_key_0] = _val_0 -- 658
		end -- 658
	end -- 681
	if _base_0.__index == nil then -- 658
		_base_0.__index = _base_0 -- 658
	end -- 681
	setmetatable(_base_0, _parent_0.__base) -- 658
	_class_0 = setmetatable({ -- 658
		__init = function(self, ...) -- 658
			return _class_0.__parent.__init(self, ...) -- 658
		end, -- 658
		__base = _base_0, -- 658
		__name = "Ambrosia", -- 658
		__parent = _parent_0 -- 658
	}, { -- 658
		__index = function(cls, name) -- 658
			local val = rawget(_base_0, name) -- 658
			if val == nil then -- 658
				local parent = rawget(cls, "__parent") -- 658
				if parent then -- 658
					return parent[name] -- 658
				end -- 658
			else -- 658
				return val -- 658
			end -- 658
		end, -- 658
		__call = function(cls, ...) -- 658
			local _self_0 = setmetatable({ }, _base_0) -- 658
			cls.__init(_self_0, ...) -- 658
			return _self_0 -- 658
		end -- 658
	}) -- 658
	_base_0.__class = _class_0 -- 658
	if _parent_0.__inherited then -- 658
		_parent_0.__inherited(_parent_0, _class_0) -- 658
	end -- 658
	Ambrosia = _class_0 -- 658
end -- 681
local Chow -- 683
do -- 683
	local _class_0 -- 683
	local _parent_0 = Food -- 683
	local _base_0 = { -- 683
		PrintName = "Wasteland Chow", -- 685
		Model = Model("models/props_junk/garbage_takeoutcarton001a.mdl"), -- 686
		Hunger = -20, -- 687
		Thirst = -6, -- 688
		Despair = 10, -- 689
		Description = "An amalgamation of entrails, bones, and rotten flesh with a side of maggots. \n Wastelanders love it!", -- 690
		RotTime = 0, -- 691
		CookTime = 10, -- 693
		UseText = { -- 694
			"begrudgingly eats some wasteland chow.", -- 694
			"puts some chow in their mouth while gagging.", -- 695
			"eats some wasteland chow, then spits out the tiny bones.", -- 696
			"chomps on some wasteland chow.", -- 697
			"forces down some wasteland chow down their throat.", -- 698
			"eats some chow, secretly enjoying it." -- 699
		}, -- 702
		Eat = function(self, ply) -- 702
			_class_0.__parent.__base.Eat(self, ply) -- 703
			if CLIENT then -- 704
				return -- 704
			end -- 704
			local plyJob = RPExtraTeams[ply:Team()] -- 705
			if plyJob.category == "Wasteland" then -- 706
				ply:SetArmor((ply:Armor() + 20)) -- 707
				ply:AddDespair(-30) -- 708
				ply:AddHunger(-30) -- 709
				return ply:AddThirst(-10) -- 710
			end -- 706
		end -- 683
	} -- 683
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 710
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 683
			_base_0[_key_0] = _val_0 -- 683
		end -- 683
	end -- 710
	if _base_0.__index == nil then -- 683
		_base_0.__index = _base_0 -- 683
	end -- 710
	setmetatable(_base_0, _parent_0.__base) -- 683
	_class_0 = setmetatable({ -- 683
		__init = function(self, ...) -- 683
			return _class_0.__parent.__init(self, ...) -- 683
		end, -- 683
		__base = _base_0, -- 683
		__name = "Chow", -- 683
		__parent = _parent_0 -- 683
	}, { -- 683
		__index = function(cls, name) -- 683
			local val = rawget(_base_0, name) -- 683
			if val == nil then -- 683
				local parent = rawget(cls, "__parent") -- 683
				if parent then -- 683
					return parent[name] -- 683
				end -- 683
			else -- 683
				return val -- 683
			end -- 683
		end, -- 683
		__call = function(cls, ...) -- 683
			local _self_0 = setmetatable({ }, _base_0) -- 683
			cls.__init(_self_0, ...) -- 683
			return _self_0 -- 683
		end -- 683
	}) -- 683
	_base_0.__class = _class_0 -- 683
	if _parent_0.__inherited then -- 683
		_parent_0.__inherited(_parent_0, _class_0) -- 683
	end -- 683
	Chow = _class_0 -- 683
end -- 710
local SloppyRibs -- 713
do -- 713
	local _class_0 -- 713
	local _parent_0 = Food -- 713
	local _base_0 = { -- 713
		PrintName = "Sloppy Ribs", -- 715
		Model = Model("models/vel/evilwar/sloppyribs.mdl"), -- 716
		Hunger = -28, -- 717
		Thirst = -4, -- 718
		Despair = -15, -- 719
		Description = "Fresh ribs from an unknown source, now glazed in slop! \n They look delicious.", -- 721
		CookTime = 10, -- 723
		Price = 115, -- 724
		UseText = { -- 725
			"devours all of the flesh and slop on the rib, then throws it away.", -- 725
			"munches on the rib, and then licks the glaze off his hands.", -- 726
			"gobbles down the rib, and spits out the bone." -- 727
		} -- 713
	} -- 713
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 727
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 713
			_base_0[_key_0] = _val_0 -- 713
		end -- 713
	end -- 727
	if _base_0.__index == nil then -- 713
		_base_0.__index = _base_0 -- 713
	end -- 727
	setmetatable(_base_0, _parent_0.__base) -- 713
	_class_0 = setmetatable({ -- 713
		__init = function(self, ...) -- 713
			return _class_0.__parent.__init(self, ...) -- 713
		end, -- 713
		__base = _base_0, -- 713
		__name = "SloppyRibs", -- 713
		__parent = _parent_0 -- 713
	}, { -- 713
		__index = function(cls, name) -- 713
			local val = rawget(_base_0, name) -- 713
			if val == nil then -- 713
				local parent = rawget(cls, "__parent") -- 713
				if parent then -- 713
					return parent[name] -- 713
				end -- 713
			else -- 713
				return val -- 713
			end -- 713
		end, -- 713
		__call = function(cls, ...) -- 713
			local _self_0 = setmetatable({ }, _base_0) -- 713
			cls.__init(_self_0, ...) -- 713
			return _self_0 -- 713
		end -- 713
	}) -- 713
	_base_0.__class = _class_0 -- 713
	if _parent_0.__inherited then -- 713
		_parent_0.__inherited(_parent_0, _class_0) -- 713
	end -- 713
	SloppyRibs = _class_0 -- 713
end -- 727
local AblativePaste -- 729
do -- 729
	local _class_0 -- 729
	local _parent_0 = Medicine -- 729
	local _base_0 = { -- 729
		PrintName = "Ablative paste", -- 731
		Model = Model("models/props_lab/jar01a.mdl"), -- 732
		Price = 380, -- 733
		Armor = 35, -- 734
		Despair = 15, -- 735
		Description = "A rough, sticky, uncomfortable paste but, at least it'll prevent your blood from leaking out.", -- 736
		Sound = "foley/alyx_hug_eli.wav", -- 737
		UseText = { -- 737
			"applies the paste to their delicate skin." -- 737
		} -- 729
	} -- 729
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 737
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 729
			_base_0[_key_0] = _val_0 -- 729
		end -- 729
	end -- 737
	if _base_0.__index == nil then -- 729
		_base_0.__index = _base_0 -- 729
	end -- 737
	setmetatable(_base_0, _parent_0.__base) -- 729
	_class_0 = setmetatable({ -- 729
		__init = function(self, ...) -- 729
			return _class_0.__parent.__init(self, ...) -- 729
		end, -- 729
		__base = _base_0, -- 729
		__name = "AblativePaste", -- 729
		__parent = _parent_0 -- 729
	}, { -- 729
		__index = function(cls, name) -- 729
			local val = rawget(_base_0, name) -- 729
			if val == nil then -- 729
				local parent = rawget(cls, "__parent") -- 729
				if parent then -- 729
					return parent[name] -- 729
				end -- 729
			else -- 729
				return val -- 729
			end -- 729
		end, -- 729
		__call = function(cls, ...) -- 729
			local _self_0 = setmetatable({ }, _base_0) -- 729
			cls.__init(_self_0, ...) -- 729
			return _self_0 -- 729
		end -- 729
	}) -- 729
	_base_0.__class = _class_0 -- 729
	if _parent_0.__inherited then -- 729
		_parent_0.__inherited(_parent_0, _class_0) -- 729
	end -- 729
	AblativePaste = _class_0 -- 729
end -- 737
local EyeballNoodles -- 739
do -- 739
	local _class_0 -- 739
	local _parent_0 = Food -- 739
	local _base_0 = { -- 739
		PrintName = "Eyeball Noodles", -- 741
		Model = Model("models/vel/evilwar/eyenoodle.mdl"), -- 742
		Hunger = -40, -- 743
		Thirst = -20, -- 744
		Despair = -20, -- 745
		Description = "A traditional Lymphomian dish, usually served to go. \n The texture is an acquired taste.", -- 747
		CookTime = 8, -- 749
		Price = 130, -- 751
		UseText = { -- 752
			"slurps all of the noodles.", -- 752
			"slurps the noodles, gagging at the wet crunch of the eyeball.", -- 753
			"eats the noodles, and then spits out the eyeball.", -- 754
			"gags on the noodles, and then throws out the eyeball." -- 755
		} -- 739
	} -- 739
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 756
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 739
			_base_0[_key_0] = _val_0 -- 739
		end -- 739
	end -- 756
	if _base_0.__index == nil then -- 739
		_base_0.__index = _base_0 -- 739
	end -- 756
	setmetatable(_base_0, _parent_0.__base) -- 739
	_class_0 = setmetatable({ -- 739
		__init = function(self, ...) -- 739
			return _class_0.__parent.__init(self, ...) -- 739
		end, -- 739
		__base = _base_0, -- 739
		__name = "EyeballNoodles", -- 739
		__parent = _parent_0 -- 739
	}, { -- 739
		__index = function(cls, name) -- 739
			local val = rawget(_base_0, name) -- 739
			if val == nil then -- 739
				local parent = rawget(cls, "__parent") -- 739
				if parent then -- 739
					return parent[name] -- 739
				end -- 739
			else -- 739
				return val -- 739
			end -- 739
		end, -- 739
		__call = function(cls, ...) -- 739
			local _self_0 = setmetatable({ }, _base_0) -- 739
			cls.__init(_self_0, ...) -- 739
			return _self_0 -- 739
		end -- 739
	}) -- 739
	_base_0.__class = _class_0 -- 739
	if _parent_0.__inherited then -- 739
		_parent_0.__inherited(_parent_0, _class_0) -- 739
	end -- 739
	EyeballNoodles = _class_0 -- 739
end -- 756
local PaperMache -- 758
do -- 758
	local _class_0 -- 758
	local _parent_0 = Food -- 758
	local _base_0 = { -- 758
		PrintName = "Paper Mache", -- 760
		Model = Model("models/props_junk/garbage_bag001a.mdl"), -- 761
		Hunger = -10, -- 762
		Thirst = -10, -- 763
		Despair = 15, -- 764
		Description = "An old crumpled paper. \n now it's watered down into a little ball.", -- 766
		CookTime = 3, -- 768
		Price = 30, -- 770
		UseText = { -- 771
			"stoves the paper mache into his mouth, gagging horribly.", -- 771
			"forces the paper down his throat, throwing up slightly", -- 772
			"rips apart the paper mache, eating small pieces at a time.", -- 773
			"looks miserable trying to eat watered down paper." -- 774
		} -- 758
	} -- 758
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 774
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 758
			_base_0[_key_0] = _val_0 -- 758
		end -- 758
	end -- 774
	if _base_0.__index == nil then -- 758
		_base_0.__index = _base_0 -- 758
	end -- 774
	setmetatable(_base_0, _parent_0.__base) -- 758
	_class_0 = setmetatable({ -- 758
		__init = function(self, ...) -- 758
			return _class_0.__parent.__init(self, ...) -- 758
		end, -- 758
		__base = _base_0, -- 758
		__name = "PaperMache", -- 758
		__parent = _parent_0 -- 758
	}, { -- 758
		__index = function(cls, name) -- 758
			local val = rawget(_base_0, name) -- 758
			if val == nil then -- 758
				local parent = rawget(cls, "__parent") -- 758
				if parent then -- 758
					return parent[name] -- 758
				end -- 758
			else -- 758
				return val -- 758
			end -- 758
		end, -- 758
		__call = function(cls, ...) -- 758
			local _self_0 = setmetatable({ }, _base_0) -- 758
			cls.__init(_self_0, ...) -- 758
			return _self_0 -- 758
		end -- 758
	}) -- 758
	_base_0.__class = _class_0 -- 758
	if _parent_0.__inherited then -- 758
		_parent_0.__inherited(_parent_0, _class_0) -- 758
	end -- 758
	PaperMache = _class_0 -- 758
	return _class_0 -- 774
end -- 774
