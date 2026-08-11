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
		Interesting = true, -- 18
		CanSell = true, -- 20
		Sound = Sound("npc/barnacle/barnacle_crunch2.wav"), -- 21
		SubmitSound = "Submit_Food", -- 23
		Hunger = 0, -- 24
		Thirst = 0, -- 25
		Despair = 0, -- 26
		HealthAdd = 0, -- 27
		CookTime = 0, -- 29
		RotTime = 0, -- 31
		Eat = function(self, ply) -- 31
			if CLIENT then -- 32
				return -- 32
			end -- 32
			local amt -- 33
			if self.Hunger then -- 34
				amt = self.Hunger -- 35
				if isfunction(amt) then -- 36
					amt = amt() -- 36
				end -- 36
				ply:AddHunger(amt) -- 37
			end -- 34
			if self.Thirst then -- 38
				amt = self.Thirst -- 39
				if isfunction(amt) then -- 40
					amt = amt() -- 40
				end -- 40
				ply:AddThirst(amt) -- 41
			end -- 38
			if self.Despair then -- 42
				amt = self.Despair -- 43
				if isfunction(amt) then -- 44
					amt = amt() -- 44
				end -- 44
				ply:AddDespair(amt) -- 45
			end -- 42
			if self.Armor then -- 46
				amt = self.Armor -- 47
				if isfunction(amt) then -- 48
					amt = amt() -- 48
				end -- 48
				if amt > 0 then -- 49
					ply:SetArmor((ply:Armor() + amt)) -- 50
				end -- 49
			end -- 46
			if self.HealthAdd then -- 51
				amt = self.HealthAdd -- 52
				if isfunction(amt) then -- 53
					amt = amt() -- 53
				end -- 53
				if amt > 0 then -- 54
					ply:SetHealth(math.min(ply:Health() + amt, ply:GetMaxHealth())) -- 55
				elseif amt < 0 then -- 56
					ply:TakeDamage(-amt) -- 57
				end -- 54
			end -- 51
			if not self.PersistAfterEat then -- 60
				return self:Trash() -- 60
			end -- 60
		end, -- 62
		OnUseFinish = function(self, ply) -- 62
			_class_0.__parent.__base.OnUseFinish(self, ply) -- 63
			return self:Eat(ply) -- 64
		end, -- 66
		OnSpawned = function(self) -- 66
			_class_0.__parent.__base.OnSpawned(self) -- 67
			self:SetRotten(false) -- 68
			if self.RotTime > 0 then -- 69
				self.RotsIn = CurTime() + self.RotTime -- 69
			end -- 69
			return -- 70
		end, -- 72
		Think = function(self) -- 72
			_class_0.__parent.__base.Think(self) -- 73
			if CLIENT then -- 74
				return -- 74
			end -- 74
			if self.RotsIn and (not self:GetRotten()) and self.RotsIn < CurTime() then -- 75
				return self:Rot() -- 75
			end -- 75
		end, -- 77
		Rot = function(self) -- 77
			self:SetRotten(true) -- 78
			self:SetColor(Color(100, 0, 150)) -- 79
			return self:EmitSound("FoodRot") -- 80
		end -- 8
	} -- 8
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 80
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 8
			_base_0[_key_0] = _val_0 -- 8
		end -- 8
	end -- 80
	if _base_0.__index == nil then -- 8
		_base_0.__index = _base_0 -- 8
	end -- 80
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
end -- 80
local SlopSkull -- 82
do -- 82
	local _class_0 -- 82
	local _parent_0 = Food -- 82
	local _base_0 = { -- 82
		PrintName = "Slop Skull", -- 84
		Model = Model("models/Gibs/HGIBS.mdl"), -- 85
		Hunger = -10, -- 86
		Despair = 35, -- 87
		Description = "A bloody, festering human skull.\nThe brain is still largely intact.", -- 88
		RotTime = 120, -- 90
		UseText = { -- 91
			"munches and crunches on a slop skull.", -- 91
			"slurps the brain matter out of a slop skull.", -- 92
			"digs around in a slop skull with their tongue.", -- 93
			"ravenously consumes a slop skull.", -- 94
			"gets pink sludge everywhere while eating a slop skull.", -- 95
			"scours a slop skull for brainmeat.", -- 96
			"cracks open a slop skull and slurps the brains out." -- 97
		}, -- 100
		Precursor = { -- 101
			biomass = 1 -- 101
		} -- 82
	} -- 82
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 101
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 82
			_base_0[_key_0] = _val_0 -- 82
		end -- 82
	end -- 101
	if _base_0.__index == nil then -- 82
		_base_0.__index = _base_0 -- 82
	end -- 101
	setmetatable(_base_0, _parent_0.__base) -- 82
	_class_0 = setmetatable({ -- 82
		__init = function(self, ...) -- 82
			return _class_0.__parent.__init(self, ...) -- 82
		end, -- 82
		__base = _base_0, -- 82
		__name = "SlopSkull", -- 82
		__parent = _parent_0 -- 82
	}, { -- 82
		__index = function(cls, name) -- 82
			local val = rawget(_base_0, name) -- 82
			if val == nil then -- 82
				local parent = rawget(cls, "__parent") -- 82
				if parent then -- 82
					return parent[name] -- 82
				end -- 82
			else -- 82
				return val -- 82
			end -- 82
		end, -- 82
		__call = function(cls, ...) -- 82
			local _self_0 = setmetatable({ }, _base_0) -- 82
			cls.__init(_self_0, ...) -- 82
			return _self_0 -- 82
		end -- 82
	}) -- 82
	_base_0.__class = _class_0 -- 82
	if _parent_0.__inherited then -- 82
		_parent_0.__inherited(_parent_0, _class_0) -- 82
	end -- 82
	SlopSkull = _class_0 -- 82
end -- 101
local Paper -- 103
do -- 103
	local _class_0 -- 103
	local _parent_0 = Food -- 103
	local _base_0 = { -- 103
		PrintName = "Paper", -- 105
		Model = Model("models/props_lab/papersheet001a.mdl"), -- 106
		Hunger = -7, -- 107
		Thirst = 10, -- 108
		Description = "A dirty scrap of used paper.\nThe writing is too faint to make out.", -- 110
		UseText = { -- 111
			"chokes down a sheet of paper.", -- 111
			"tears up and eats a sheet of paper.", -- 112
			"chews the paper into a stiff pulp and swallows.", -- 113
			"struggles to swallow a dry sheet of paper.", -- 114
			"eats paper.", -- 115
			"crumples up some paper and struggles to chew it.", -- 116
			"munches on a piece of paper." -- 117
		} -- 103
	} -- 103
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 118
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 103
			_base_0[_key_0] = _val_0 -- 103
		end -- 103
	end -- 118
	if _base_0.__index == nil then -- 103
		_base_0.__index = _base_0 -- 103
	end -- 118
	setmetatable(_base_0, _parent_0.__base) -- 103
	_class_0 = setmetatable({ -- 103
		__init = function(self, ...) -- 103
			return _class_0.__parent.__init(self, ...) -- 103
		end, -- 103
		__base = _base_0, -- 103
		__name = "Paper", -- 103
		__parent = _parent_0 -- 103
	}, { -- 103
		__index = function(cls, name) -- 103
			local val = rawget(_base_0, name) -- 103
			if val == nil then -- 103
				local parent = rawget(cls, "__parent") -- 103
				if parent then -- 103
					return parent[name] -- 103
				end -- 103
			else -- 103
				return val -- 103
			end -- 103
		end, -- 103
		__call = function(cls, ...) -- 103
			local _self_0 = setmetatable({ }, _base_0) -- 103
			cls.__init(_self_0, ...) -- 103
			return _self_0 -- 103
		end -- 103
	}) -- 103
	_base_0.__class = _class_0 -- 103
	if _parent_0.__inherited then -- 103
		_parent_0.__inherited(_parent_0, _class_0) -- 103
	end -- 103
	Paper = _class_0 -- 103
end -- 118
local RibBone -- 120
do -- 120
	local _class_0 -- 120
	local _parent_0 = Food -- 120
	local _base_0 = { -- 120
		PrintName = "Dry Rib", -- 122
		Model = Model("models/Gibs/hgibs_rib.mdl"), -- 123
		Hunger = -8, -- 124
		HealthAdd = -7, -- 125
		RotTime = 240, -- 126
		Description = "A lone human rib.\nYou could chew the marrow out, but it'd probably hurt.", -- 128
		UseText = { -- 129
			"breaks a tooth chewing on a rib bone.", -- 129
			"sucks marrow and bone shards from the rib.", -- 130
			"cuts up their throat eating a rib bone.", -- 131
			"bleeds from the mouth as they eat a rib bone.", -- 132
			"eats a bone, like a vulture.", -- 133
			"chokes on the broken points of a rib bone." -- 134
		}, -- 137
		Precursor = { -- 138
			biomass = 1 -- 138
		} -- 120
	} -- 120
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 138
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 120
			_base_0[_key_0] = _val_0 -- 120
		end -- 120
	end -- 138
	if _base_0.__index == nil then -- 120
		_base_0.__index = _base_0 -- 120
	end -- 138
	setmetatable(_base_0, _parent_0.__base) -- 120
	_class_0 = setmetatable({ -- 120
		__init = function(self, ...) -- 120
			return _class_0.__parent.__init(self, ...) -- 120
		end, -- 120
		__base = _base_0, -- 120
		__name = "RibBone", -- 120
		__parent = _parent_0 -- 120
	}, { -- 120
		__index = function(cls, name) -- 120
			local val = rawget(_base_0, name) -- 120
			if val == nil then -- 120
				local parent = rawget(cls, "__parent") -- 120
				if parent then -- 120
					return parent[name] -- 120
				end -- 120
			else -- 120
				return val -- 120
			end -- 120
		end, -- 120
		__call = function(cls, ...) -- 120
			local _self_0 = setmetatable({ }, _base_0) -- 120
			cls.__init(_self_0, ...) -- 120
			return _self_0 -- 120
		end -- 120
	}) -- 120
	_base_0.__class = _class_0 -- 120
	if _parent_0.__inherited then -- 120
		_parent_0.__inherited(_parent_0, _class_0) -- 120
	end -- 120
	RibBone = _class_0 -- 120
end -- 138
local Skin -- 140
do -- 140
	local _class_0 -- 140
	local _parent_0 = Food -- 140
	local _base_0 = { -- 140
		PrintName = "Skin", -- 142
		Description = "A greasy patch of some kind of hide.\nIt would probably taste nasty.", -- 143
		Model = Model("models/gibs/antlion_gib_small_2.mdl"), -- 144
		HealthAdd = function(self) -- 144
			return math.random(10, 20) -- 144
		end, -- 145
		Despair = function(self) -- 145
			return math.random(1, 5) -- 145
		end, -- 147
		UseText = { -- 148
			"applies some skin to their wounds.", -- 148
			"glues on some skin." -- 149
		} -- 140
	} -- 140
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 150
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 140
			_base_0[_key_0] = _val_0 -- 140
		end -- 140
	end -- 150
	if _base_0.__index == nil then -- 140
		_base_0.__index = _base_0 -- 140
	end -- 150
	setmetatable(_base_0, _parent_0.__base) -- 140
	_class_0 = setmetatable({ -- 140
		__init = function(self, ...) -- 140
			return _class_0.__parent.__init(self, ...) -- 140
		end, -- 140
		__base = _base_0, -- 140
		__name = "Skin", -- 140
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
	Skin = _class_0 -- 140
end -- 150
local Abortion -- 152
do -- 152
	local _class_0 -- 152
	local _parent_0 = Food -- 152
	local _base_0 = { -- 152
		PrintName = "Abortion", -- 154
		Model = Model("models/props_c17/doll01.mdl"), -- 155
		Hunger = -23, -- 156
		Thirst = -20, -- 157
		HealthAdd = 20, -- 158
		RotTime = 240, -- 159
		Description = "An artificial baby that never got the chance to be born.\nDelicious.", -- 160
		Price = 175, -- 161
		UseText = { -- 162
			"eats a baby.", -- 162
			"rips apart an abortion and eats the pieces.", -- 163
			"bites the head off an abortion and swallows the rest.", -- 164
			"chews an abortion into pink paste.", -- 165
			"tears chunks off an abortion until it's all gone.", -- 166
			"eats an abortion, baby blood dribbling down their neck.", -- 167
			"eats an abortion legs-first." -- 168
		}, -- 171
		Eat = function(self, ply) -- 171
			_class_0.__parent.__base.Eat(self, ply) -- 172
			if CLIENT then -- 173
				return -- 173
			end -- 173
			return ply:AddStemCells(1) -- 174
		end -- 152
	} -- 152
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 174
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 152
			_base_0[_key_0] = _val_0 -- 152
		end -- 152
	end -- 174
	if _base_0.__index == nil then -- 152
		_base_0.__index = _base_0 -- 152
	end -- 174
	setmetatable(_base_0, _parent_0.__base) -- 152
	_class_0 = setmetatable({ -- 152
		__init = function(self, ...) -- 152
			return _class_0.__parent.__init(self, ...) -- 152
		end, -- 152
		__base = _base_0, -- 152
		__name = "Abortion", -- 152
		__parent = _parent_0 -- 152
	}, { -- 152
		__index = function(cls, name) -- 152
			local val = rawget(_base_0, name) -- 152
			if val == nil then -- 152
				local parent = rawget(cls, "__parent") -- 152
				if parent then -- 152
					return parent[name] -- 152
				end -- 152
			else -- 152
				return val -- 152
			end -- 152
		end, -- 152
		__call = function(cls, ...) -- 152
			local _self_0 = setmetatable({ }, _base_0) -- 152
			cls.__init(_self_0, ...) -- 152
			return _self_0 -- 152
		end -- 152
	}) -- 152
	_base_0.__class = _class_0 -- 152
	if _parent_0.__inherited then -- 152
		_parent_0.__inherited(_parent_0, _class_0) -- 152
	end -- 152
	Abortion = _class_0 -- 152
end -- 174
local LiveBaby -- 176
do -- 176
	local _class_0 -- 176
	local _parent_0 = Food -- 176
	local _base_0 = { -- 176
		PrintName = "Live baby", -- 178
		Model = Model("models/props_c17/doll01.mdl"), -- 179
		Hunger = -30, -- 180
		Thirst = -22, -- 181
		HealthAdd = 15, -- 182
		Description = "An artifical baby, born paralyzed below the eyes.\nIt will know nothing but fear and pain.", -- 184
		UseText = { -- 185
			"eats a living infant.", -- 185
			"chews the head off a live baby and drinks its blood.", -- 186
			"eats a baby alive.", -- 187
			"eats a live baby and tastes its tears.", -- 188
			"rips apart a living baby and eats the pieces.", -- 189
			"tears open a live baby and feeds on its entrails.", -- 190
			"eats a live baby as it cries silently." -- 191
		} -- 176
	} -- 176
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 192
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 176
			_base_0[_key_0] = _val_0 -- 176
		end -- 176
	end -- 192
	if _base_0.__index == nil then -- 176
		_base_0.__index = _base_0 -- 176
	end -- 192
	setmetatable(_base_0, _parent_0.__base) -- 176
	_class_0 = setmetatable({ -- 176
		__init = function(self, ...) -- 176
			return _class_0.__parent.__init(self, ...) -- 176
		end, -- 176
		__base = _base_0, -- 176
		__name = "LiveBaby", -- 176
		__parent = _parent_0 -- 176
	}, { -- 176
		__index = function(cls, name) -- 176
			local val = rawget(_base_0, name) -- 176
			if val == nil then -- 176
				local parent = rawget(cls, "__parent") -- 176
				if parent then -- 176
					return parent[name] -- 176
				end -- 176
			else -- 176
				return val -- 176
			end -- 176
		end, -- 176
		__call = function(cls, ...) -- 176
			local _self_0 = setmetatable({ }, _base_0) -- 176
			cls.__init(_self_0, ...) -- 176
			return _self_0 -- 176
		end -- 176
	}) -- 176
	_base_0.__class = _class_0 -- 176
	if _parent_0.__inherited then -- 176
		_parent_0.__inherited(_parent_0, _class_0) -- 176
	end -- 176
	LiveBaby = _class_0 -- 176
end -- 192
local SoyLoaf -- 194
do -- 194
	local _class_0 -- 194
	local _parent_0 = Food -- 194
	local _base_0 = { -- 194
		PrintName = "Soylent Loaf", -- 196
		Model = Model("models/gibs/antlion_gib_small_3.mdl"), -- 197
		Hunger = -15, -- 198
		Thirst = 3, -- 199
		Despair = 5, -- 200
		Description = "A chewy loaf of dried Long Pig byproducts.\nLoathsome food, but it'll keep for a century.", -- 202
		Price = 20, -- 204
		UseText = { -- 205
			"gnaws at a soylent loaf.", -- 205
			"chokes down a soylent loaf.", -- 206
			"struggles to eat a soylent loaf.", -- 207
			"chomps on a loaf of mummified meat.", -- 208
			"grinds their teeth on a soylent loaf.", -- 209
			"chews off a chunk from a soylent loaf.", -- 210
			"eats some soylent, like a good citizen should." -- 211
		} -- 194
	} -- 194
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 212
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 194
			_base_0[_key_0] = _val_0 -- 194
		end -- 194
	end -- 212
	if _base_0.__index == nil then -- 194
		_base_0.__index = _base_0 -- 194
	end -- 212
	setmetatable(_base_0, _parent_0.__base) -- 194
	_class_0 = setmetatable({ -- 194
		__init = function(self, ...) -- 194
			return _class_0.__parent.__init(self, ...) -- 194
		end, -- 194
		__base = _base_0, -- 194
		__name = "SoyLoaf", -- 194
		__parent = _parent_0 -- 194
	}, { -- 194
		__index = function(cls, name) -- 194
			local val = rawget(_base_0, name) -- 194
			if val == nil then -- 194
				local parent = rawget(cls, "__parent") -- 194
				if parent then -- 194
					return parent[name] -- 194
				end -- 194
			else -- 194
				return val -- 194
			end -- 194
		end, -- 194
		__call = function(cls, ...) -- 194
			local _self_0 = setmetatable({ }, _base_0) -- 194
			cls.__init(_self_0, ...) -- 194
			return _self_0 -- 194
		end -- 194
	}) -- 194
	_base_0.__class = _class_0 -- 194
	if _parent_0.__inherited then -- 194
		_parent_0.__inherited(_parent_0, _class_0) -- 194
	end -- 194
	SoyLoaf = _class_0 -- 194
end -- 212
local BootSoup -- 214
do -- 214
	local _class_0 -- 214
	local _parent_0 = Food -- 214
	local _base_0 = { -- 214
		PrintName = "Boot n' soup", -- 216
		Model = Model("models/props_c17/metalPot001a.mdl"), -- 217
		HealthAdd = -5, -- 218
		Hunger = -40, -- 219
		Thirst = -4, -- 220
		Despair = -5, -- 221
		Description = "Formerly only filled with slop, now comes with 'vegan-meat'!", -- 222
		CookTime = 13, -- 224
		Price = 20, -- 226
		UseText = { -- 227
			"drinks the soup slowly, but chokes on the 'vegan-meat' .", -- 227
			"miserably slurps the soup, spitting out small chunks of 'vegan-meat'.", -- 228
			"struggles to eat any of the soup and 'vegan-meat'." -- 229
		} -- 214
	} -- 214
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 229
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 214
			_base_0[_key_0] = _val_0 -- 214
		end -- 214
	end -- 229
	if _base_0.__index == nil then -- 214
		_base_0.__index = _base_0 -- 214
	end -- 229
	setmetatable(_base_0, _parent_0.__base) -- 214
	_class_0 = setmetatable({ -- 214
		__init = function(self, ...) -- 214
			return _class_0.__parent.__init(self, ...) -- 214
		end, -- 214
		__base = _base_0, -- 214
		__name = "BootSoup", -- 214
		__parent = _parent_0 -- 214
	}, { -- 214
		__index = function(cls, name) -- 214
			local val = rawget(_base_0, name) -- 214
			if val == nil then -- 214
				local parent = rawget(cls, "__parent") -- 214
				if parent then -- 214
					return parent[name] -- 214
				end -- 214
			else -- 214
				return val -- 214
			end -- 214
		end, -- 214
		__call = function(cls, ...) -- 214
			local _self_0 = setmetatable({ }, _base_0) -- 214
			cls.__init(_self_0, ...) -- 214
			return _self_0 -- 214
		end -- 214
	}) -- 214
	_base_0.__class = _class_0 -- 214
	if _parent_0.__inherited then -- 214
		_parent_0.__inherited(_parent_0, _class_0) -- 214
	end -- 214
	BootSoup = _class_0 -- 214
end -- 229
local MeatLoaf -- 231
do -- 231
	local _class_0 -- 231
	local _parent_0 = Food -- 231
	local _base_0 = { -- 231
		PrintName = "Meatloaf", -- 233
		Model = Model("models/props_junk/garbage_takeoutcarton001a.mdl"), -- 234
		Armor = 5, -- 235
		Hunger = -40, -- 236
		Thirst = -9, -- 237
		Despair = -20, -- 238
		Description = "Delicious meatloaf, a favorite of many soldiers.", -- 239
		CookTime = 15, -- 241
		Price = 100, -- 244
		Eat = function(self, ply) -- 244
			_class_0.__parent.__base.Eat(self, ply) -- 245
			if CLIENT then -- 246
				return -- 246
			end -- 246
			return ply:AddStemCells(1) -- 247
		end, -- 249
		UseText = { -- 250
			"devours their meatloaf.", -- 250
			"gobbles down their meatloaf, and looks amazed.", -- 251
			"savors the taste of the meatloaf whilst ingesting it." -- 252
		} -- 231
	} -- 231
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 253
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 231
			_base_0[_key_0] = _val_0 -- 231
		end -- 231
	end -- 253
	if _base_0.__index == nil then -- 231
		_base_0.__index = _base_0 -- 231
	end -- 253
	setmetatable(_base_0, _parent_0.__base) -- 231
	_class_0 = setmetatable({ -- 231
		__init = function(self, ...) -- 231
			return _class_0.__parent.__init(self, ...) -- 231
		end, -- 231
		__base = _base_0, -- 231
		__name = "MeatLoaf", -- 231
		__parent = _parent_0 -- 231
	}, { -- 231
		__index = function(cls, name) -- 231
			local val = rawget(_base_0, name) -- 231
			if val == nil then -- 231
				local parent = rawget(cls, "__parent") -- 231
				if parent then -- 231
					return parent[name] -- 231
				end -- 231
			else -- 231
				return val -- 231
			end -- 231
		end, -- 231
		__call = function(cls, ...) -- 231
			local _self_0 = setmetatable({ }, _base_0) -- 231
			cls.__init(_self_0, ...) -- 231
			return _self_0 -- 231
		end -- 231
	}) -- 231
	_base_0.__class = _class_0 -- 231
	if _parent_0.__inherited then -- 231
		_parent_0.__inherited(_parent_0, _class_0) -- 231
	end -- 231
	MeatLoaf = _class_0 -- 231
end -- 253
local SlopBowl -- 256
do -- 256
	local _class_0 -- 256
	local _parent_0 = Food -- 256
	local _base_0 = { -- 256
		PrintName = "Slop Bowl", -- 258
		Model = Model("models/props_c17/metalPot001a.mdl"), -- 259
		Hunger = -30, -- 260
		Thirst = 4, -- 261
		Despair = 15, -- 262
		Description = "A festering pot that oozes a disgusting liquid.\nIt seems oddly comforting.", -- 263
		CookTime = 10, -- 265
		Price = 20, -- 267
		UseText = { -- 268
			"enjoys the slop.", -- 268
			"chokes while consuming slop.", -- 269
			"struggles to eat a slop bowl.", -- 270
			"chomps on some slop.", -- 271
			"begrudgingly eats a spoonful of slop.", -- 272
			"consumes slop." -- 273
		} -- 256
	} -- 256
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 273
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 256
			_base_0[_key_0] = _val_0 -- 256
		end -- 256
	end -- 273
	if _base_0.__index == nil then -- 256
		_base_0.__index = _base_0 -- 256
	end -- 273
	setmetatable(_base_0, _parent_0.__base) -- 256
	_class_0 = setmetatable({ -- 256
		__init = function(self, ...) -- 256
			return _class_0.__parent.__init(self, ...) -- 256
		end, -- 256
		__base = _base_0, -- 256
		__name = "SlopBowl", -- 256
		__parent = _parent_0 -- 256
	}, { -- 256
		__index = function(cls, name) -- 256
			local val = rawget(_base_0, name) -- 256
			if val == nil then -- 256
				local parent = rawget(cls, "__parent") -- 256
				if parent then -- 256
					return parent[name] -- 256
				end -- 256
			else -- 256
				return val -- 256
			end -- 256
		end, -- 256
		__call = function(cls, ...) -- 256
			local _self_0 = setmetatable({ }, _base_0) -- 256
			cls.__init(_self_0, ...) -- 256
			return _self_0 -- 256
		end -- 256
	}) -- 256
	_base_0.__class = _class_0 -- 256
	if _parent_0.__inherited then -- 256
		_parent_0.__inherited(_parent_0, _class_0) -- 256
	end -- 256
	SlopBowl = _class_0 -- 256
end -- 273
local GroundRibs -- 275
do -- 275
	local _class_0 -- 275
	local _parent_0 = Food -- 275
	local _base_0 = { -- 275
		PrintName = "Ground Ribs", -- 277
		Model = Model("models/props_c17/metalPot001a.mdl"), -- 278
		Hunger = -10, -- 279
		Thirst = 5, -- 280
		Despair = 15, -- 281
		HealthAdd = -5, -- 282
		Description = "Human ribs, ground up into a fibrous powder.\nIt doesn't look edible yet.", -- 283
		CookTime = 5, -- 285
		Price = 30, -- 287
		UseText = { -- 288
			"eats some ground ribs and spits them out.", -- 288
			"bleeds from a chunk of ground ribs.", -- 289
			"munches on some ground ribs, lacerating their throat.", -- 290
			"regrets putting rib powder in their mouth." -- 291
		} -- 275
	} -- 275
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 291
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 275
			_base_0[_key_0] = _val_0 -- 275
		end -- 275
	end -- 291
	if _base_0.__index == nil then -- 275
		_base_0.__index = _base_0 -- 275
	end -- 291
	setmetatable(_base_0, _parent_0.__base) -- 275
	_class_0 = setmetatable({ -- 275
		__init = function(self, ...) -- 275
			return _class_0.__parent.__init(self, ...) -- 275
		end, -- 275
		__base = _base_0, -- 275
		__name = "GroundRibs", -- 275
		__parent = _parent_0 -- 275
	}, { -- 275
		__index = function(cls, name) -- 275
			local val = rawget(_base_0, name) -- 275
			if val == nil then -- 275
				local parent = rawget(cls, "__parent") -- 275
				if parent then -- 275
					return parent[name] -- 275
				end -- 275
			else -- 275
				return val -- 275
			end -- 275
		end, -- 275
		__call = function(cls, ...) -- 275
			local _self_0 = setmetatable({ }, _base_0) -- 275
			cls.__init(_self_0, ...) -- 275
			return _self_0 -- 275
		end -- 275
	}) -- 275
	_base_0.__class = _class_0 -- 275
	if _parent_0.__inherited then -- 275
		_parent_0.__inherited(_parent_0, _class_0) -- 275
	end -- 275
	GroundRibs = _class_0 -- 275
end -- 291
local Boot -- 296
do -- 296
	local _class_0 -- 296
	local _parent_0 = Food -- 296
	local _base_0 = { -- 296
		PrintName = "Boot", -- 298
		Model = Model("models/props_junk/Shoe001a.mdl"), -- 299
		HealthAdd = -4, -- 300
		Hunger = -5, -- 301
		Thirst = 40, -- 302
		Despair = 40, -- 303
		Description = "A dirty old boot, nearly fallen apart.", -- 305
		UseText = { -- 306
			"chews on a nasty boot!", -- 306
			"chokes on an old boot.", -- 307
			"gnaws a boot to shreds.", -- 308
			"shoves a boot in their mouth!", -- 309
			"eats a rotten leather boot.", -- 310
			"devours a dirty old boot!", -- 311
			"eats a boot." -- 312
		} -- 296
	} -- 296
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 313
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 296
			_base_0[_key_0] = _val_0 -- 296
		end -- 296
	end -- 313
	if _base_0.__index == nil then -- 296
		_base_0.__index = _base_0 -- 296
	end -- 313
	setmetatable(_base_0, _parent_0.__base) -- 296
	_class_0 = setmetatable({ -- 296
		__init = function(self, ...) -- 296
			return _class_0.__parent.__init(self, ...) -- 296
		end, -- 296
		__base = _base_0, -- 296
		__name = "Boot", -- 296
		__parent = _parent_0 -- 296
	}, { -- 296
		__index = function(cls, name) -- 296
			local val = rawget(_base_0, name) -- 296
			if val == nil then -- 296
				local parent = rawget(cls, "__parent") -- 296
				if parent then -- 296
					return parent[name] -- 296
				end -- 296
			else -- 296
				return val -- 296
			end -- 296
		end, -- 296
		__call = function(cls, ...) -- 296
			local _self_0 = setmetatable({ }, _base_0) -- 296
			cls.__init(_self_0, ...) -- 296
			return _self_0 -- 296
		end -- 296
	}) -- 296
	_base_0.__class = _class_0 -- 296
	if _parent_0.__inherited then -- 296
		_parent_0.__inherited(_parent_0, _class_0) -- 296
	end -- 296
	Boot = _class_0 -- 296
end -- 313
local BleachedMelon -- 315
do -- 315
	local _class_0 -- 315
	local _parent_0 = Food -- 315
	local _base_0 = { -- 315
		PrintName = "Bleached Melon", -- 317
		Model = Model("models/props_junk/watermelon01_chunk01c.mdl"), -- 318
		HealthAdd = -3, -- 319
		Hunger = -15, -- 320
		Thirst = -4, -- 321
		Description = "This was covered in mold before, hopefully the chlorine got rid of it.", -- 323
		CookTime = 10, -- 324
		Price = 25, -- 326
		UseText = { -- 327
			"eats a melon.", -- 327
			"devours a chunk of melon.", -- 328
			"munches on a melon." -- 329
		} -- 315
	} -- 315
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 329
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 315
			_base_0[_key_0] = _val_0 -- 315
		end -- 315
	end -- 329
	if _base_0.__index == nil then -- 315
		_base_0.__index = _base_0 -- 315
	end -- 329
	setmetatable(_base_0, _parent_0.__base) -- 315
	_class_0 = setmetatable({ -- 315
		__init = function(self, ...) -- 315
			return _class_0.__parent.__init(self, ...) -- 315
		end, -- 315
		__base = _base_0, -- 315
		__name = "BleachedMelon", -- 315
		__parent = _parent_0 -- 315
	}, { -- 315
		__index = function(cls, name) -- 315
			local val = rawget(_base_0, name) -- 315
			if val == nil then -- 315
				local parent = rawget(cls, "__parent") -- 315
				if parent then -- 315
					return parent[name] -- 315
				end -- 315
			else -- 315
				return val -- 315
			end -- 315
		end, -- 315
		__call = function(cls, ...) -- 315
			local _self_0 = setmetatable({ }, _base_0) -- 315
			cls.__init(_self_0, ...) -- 315
			return _self_0 -- 315
		end -- 315
	}) -- 315
	_base_0.__class = _class_0 -- 315
	if _parent_0.__inherited then -- 315
		_parent_0.__inherited(_parent_0, _class_0) -- 315
	end -- 315
	BleachedMelon = _class_0 -- 315
end -- 329
local MoldMelon -- 333
do -- 333
	local _class_0 -- 333
	local _parent_0 = Food -- 333
	local _base_0 = { -- 333
		PrintName = "Mold Melon", -- 335
		Model = Model("models/props_junk/watermelon01_chunk01c.mdl"), -- 336
		HealthAdd = -10, -- 337
		Hunger = -6, -- 338
		Despair = 4, -- 339
		Description = "A pithy husk of fruit, fully colonized by white mold.", -- 341
		Price = 45, -- 343
		UseText = { -- 344
			"eats a moldy melon.", -- 344
			"devours a moldy chunk of melon.", -- 345
			"munches on a mold melon.", -- 346
			"feasts on a fungus fruit.", -- 347
			"tears into some mold melon.", -- 348
			"crunches up a mold melon.", -- 349
			"chows down on a mold melon." -- 350
		} -- 333
	} -- 333
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 351
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 333
			_base_0[_key_0] = _val_0 -- 333
		end -- 333
	end -- 351
	if _base_0.__index == nil then -- 333
		_base_0.__index = _base_0 -- 333
	end -- 351
	setmetatable(_base_0, _parent_0.__base) -- 333
	_class_0 = setmetatable({ -- 333
		__init = function(self, ...) -- 333
			return _class_0.__parent.__init(self, ...) -- 333
		end, -- 333
		__base = _base_0, -- 333
		__name = "MoldMelon", -- 333
		__parent = _parent_0 -- 333
	}, { -- 333
		__index = function(cls, name) -- 333
			local val = rawget(_base_0, name) -- 333
			if val == nil then -- 333
				local parent = rawget(cls, "__parent") -- 333
				if parent then -- 333
					return parent[name] -- 333
				end -- 333
			else -- 333
				return val -- 333
			end -- 333
		end, -- 333
		__call = function(cls, ...) -- 333
			local _self_0 = setmetatable({ }, _base_0) -- 333
			cls.__init(_self_0, ...) -- 333
			return _self_0 -- 333
		end -- 333
	}) -- 333
	_base_0.__class = _class_0 -- 333
	if _parent_0.__inherited then -- 333
		_parent_0.__inherited(_parent_0, _class_0) -- 333
	end -- 333
	MoldMelon = _class_0 -- 333
end -- 351
local DrinkFluid -- 353
do -- 353
	local _class_0 -- 353
	local _parent_0 = SOUND -- 353
	local _base_0 = { -- 353
		sound = (function() -- 354
			local _accum_0 = { } -- 354
			local _len_0 = 1 -- 354
			for i = 1, 2 do -- 354
				_accum_0[_len_0] = "npc/barnacle/barnacle_gulp" .. tostring(i) .. ".wav" -- 354
				_len_0 = _len_0 + 1 -- 354
			end -- 354
			return _accum_0 -- 354
		end)(), -- 355
		level = SNDLVL_65DB -- 353
	} -- 353
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 355
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 353
			_base_0[_key_0] = _val_0 -- 353
		end -- 353
	end -- 355
	if _base_0.__index == nil then -- 353
		_base_0.__index = _base_0 -- 353
	end -- 355
	setmetatable(_base_0, _parent_0.__base) -- 353
	_class_0 = setmetatable({ -- 353
		__init = function(self, ...) -- 353
			return _class_0.__parent.__init(self, ...) -- 353
		end, -- 353
		__base = _base_0, -- 353
		__name = "DrinkFluid", -- 353
		__parent = _parent_0 -- 353
	}, { -- 353
		__index = function(cls, name) -- 353
			local val = rawget(_base_0, name) -- 353
			if val == nil then -- 353
				local parent = rawget(cls, "__parent") -- 353
				if parent then -- 353
					return parent[name] -- 353
				end -- 353
			else -- 353
				return val -- 353
			end -- 353
		end, -- 353
		__call = function(cls, ...) -- 353
			local _self_0 = setmetatable({ }, _base_0) -- 353
			cls.__init(_self_0, ...) -- 353
			return _self_0 -- 353
		end -- 353
	}) -- 353
	_base_0.__class = _class_0 -- 353
	if _parent_0.__inherited then -- 353
		_parent_0.__inherited(_parent_0, _class_0) -- 353
	end -- 353
	DrinkFluid = _class_0 -- 353
end -- 355
local Drink -- 357
do -- 357
	local _class_0 -- 357
	local _parent_0 = Food -- 357
	local _base_0 = { -- 357
		PrintName = "Drink", -- 359
		Sound = "DrinkFluid" -- 357
	} -- 357
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 359
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 357
			_base_0[_key_0] = _val_0 -- 357
		end -- 357
	end -- 359
	if _base_0.__index == nil then -- 357
		_base_0.__index = _base_0 -- 357
	end -- 359
	setmetatable(_base_0, _parent_0.__base) -- 357
	_class_0 = setmetatable({ -- 357
		__init = function(self, ...) -- 357
			return _class_0.__parent.__init(self, ...) -- 357
		end, -- 357
		__base = _base_0, -- 357
		__name = "Drink", -- 357
		__parent = _parent_0 -- 357
	}, { -- 357
		__index = function(cls, name) -- 357
			local val = rawget(_base_0, name) -- 357
			if val == nil then -- 357
				local parent = rawget(cls, "__parent") -- 357
				if parent then -- 357
					return parent[name] -- 357
				end -- 357
			else -- 357
				return val -- 357
			end -- 357
		end, -- 357
		__call = function(cls, ...) -- 357
			local _self_0 = setmetatable({ }, _base_0) -- 357
			cls.__init(_self_0, ...) -- 357
			return _self_0 -- 357
		end -- 357
	}) -- 357
	_base_0.__class = _class_0 -- 357
	if _parent_0.__inherited then -- 357
		_parent_0.__inherited(_parent_0, _class_0) -- 357
	end -- 357
	Drink = _class_0 -- 357
end -- 359
local FearBeer -- 361
do -- 361
	local _class_0 -- 361
	local _parent_0 = Drink -- 361
	local _base_0 = { -- 361
		PrintName = "Fear Beer", -- 363
		Model = Model("models/props_junk/garbage_glassbottle001a.mdl"), -- 364
		Thirst = -20, -- 365
		Despair = -25, -- 366
		Description = "A bottle of foul off-yellow liquid.\n'BEER' is hand-written on the label.", -- 368
		Price = 80, -- 370
		TrashClass = "trash/bottle/fearbeer", -- 372
		ImpactThreshold = 256, -- 374
		UseText = { -- 375
			"chugs a fear beer.", -- 375
			"downs a bottle of piss beer.", -- 376
			"drinks a ratty bottle of brew.", -- 377
			"quaffs a beer and grimaces.", -- 378
			"takes a swig of fear beer and shivers.", -- 379
			"guzzles a fear beer.", -- 380
			"chokes down some piss beer." -- 381
		}, -- 384
		Initialize = function(self) -- 384
			_class_0.__parent.__base.Initialize(self) -- 385
			if SERVER then -- 386
				return self:PrecacheGibs() -- 386
			end -- 386
		end, -- 388
		OnTakeDamage = function(self, dmg) -- 388
			_class_0.__parent.__base.OnTakeDamage(self, dmg) -- 389
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH -- 390
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then -- 391
				self:Shatter(dmg:GetDamageForce()) -- 391
			end -- 391
			if attacker and IsValid(attacker) and attacker:IsPlayer() then -- 392
				if attacker:HasOddity(ODDITY_DELINQUENCY) then -- 393
					return attacker:AddDespair(-math.random(2, 4)) -- 394
				end -- 393
			end -- 392
		end, -- 396
		PhysicsCollide = function(self, data) -- 396
			_class_0.__parent.__base.PhysicsCollide(self, data) -- 397
			if CLIENT then -- 398
				return -- 398
			end -- 398
			if data.Speed > self.ImpactThreshold then -- 399
				if data.HitEntity and IsValid(data.HitEntity) then -- 400
					local attacker = self:GetNWEntity("evilrp_submitter") -- 401
					do -- 402
						local dmg = DamageInfo() -- 402
						dmg:SetDamage(10) -- 403
						if IsValid(attacker) then -- 404
							dmg:SetAttacker(attacker) -- 404
						end -- 404
						dmg:SetInflictor(self) -- 405
						dmg:SetDamageType(DMG_SLASH) -- 406
						dmg:SetDamagePosition(data.HitPos) -- 407
						data.HitEntity:TakeDamageInfo(dmg) -- 408
					end -- 402
				end -- 400
				local force = data.OurNewVelocity -- 409
				return self:Shatter(force) -- 410
			end -- 399
		end, -- 412
		Shatter = function(self, force) -- 412
			if self.broken then -- 413
				return -- 413
			end -- 413
			self.broken = true -- 414
			local pos = self:GetPos() -- 415
			local _list_0 = player.GetAll() -- 416
			for _index_0 = 1, #_list_0 do -- 416
				local ply = _list_0[_index_0] -- 416
				local _continue_0 = false -- 417
				repeat -- 417
					if not ply:HasOddity(ODDITY_DELINQUENCY) then -- 417
						_continue_0 = true -- 417
						break -- 417
					end -- 417
					if ply:CanSee(self) and ply:LookingInDirection(pos) then -- 418
						ply:AddDespair(-math.random(2, 4)) -- 419
					end -- 418
					_continue_0 = true -- 417
				until true -- 419
				if not _continue_0 then -- 419
					break -- 419
				end -- 419
			end -- 419
			do -- 420
				local ed = EffectData() -- 420
				ed:SetStart(pos) -- 421
				ed:SetOrigin(pos) -- 422
				ed:SetScale(8) -- 423
				util.Effect("GlassImpact", ed, true, true) -- 424
			end -- 420
			self:EmitSound("BottleSmash") -- 425
			self:GibBreakServer(force) -- 426
			return self:Remove() -- 427
		end -- 361
	} -- 361
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 427
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 361
			_base_0[_key_0] = _val_0 -- 361
		end -- 361
	end -- 427
	if _base_0.__index == nil then -- 361
		_base_0.__index = _base_0 -- 361
	end -- 427
	setmetatable(_base_0, _parent_0.__base) -- 361
	_class_0 = setmetatable({ -- 361
		__init = function(self, ...) -- 361
			return _class_0.__parent.__init(self, ...) -- 361
		end, -- 361
		__base = _base_0, -- 361
		__name = "FearBeer", -- 361
		__parent = _parent_0 -- 361
	}, { -- 361
		__index = function(cls, name) -- 361
			local val = rawget(_base_0, name) -- 361
			if val == nil then -- 361
				local parent = rawget(cls, "__parent") -- 361
				if parent then -- 361
					return parent[name] -- 361
				end -- 361
			else -- 361
				return val -- 361
			end -- 361
		end, -- 361
		__call = function(cls, ...) -- 361
			local _self_0 = setmetatable({ }, _base_0) -- 361
			cls.__init(_self_0, ...) -- 361
			return _self_0 -- 361
		end -- 361
	}) -- 361
	_base_0.__class = _class_0 -- 361
	if _parent_0.__inherited then -- 361
		_parent_0.__inherited(_parent_0, _class_0) -- 361
	end -- 361
	FearBeer = _class_0 -- 361
end -- 427
local SmearBeer -- 429
do -- 429
	local _class_0 -- 429
	local _parent_0 = Drink -- 429
	local _base_0 = { -- 429
		PrintName = "Smear Beer", -- 431
		Model = Model("models/props_junk/garbage_glassbottle003a.mdl"), -- 432
		Thirst = -25, -- 433
		Despair = -35, -- 434
		Description = "A bottle of cloudy, greyish red booze.\nThe label is obscured with a smear of old blood.", -- 436
		Price = 150, -- 438
		TrashClass = "trash/bottle", -- 440
		ImpactThreshold = 256, -- 442
		UseText = { -- 443
			"chugs a smear beer.", -- 443
			"downs a bottle of red brew.", -- 444
			"drinks a cloudy bottle of beer.", -- 445
			"quaffs a smear beer and shivers.", -- 446
			"takes a swig of smear beer.", -- 447
			"guzzles a bloody beer.", -- 448
			"nurses a bottle of blood beer." -- 449
		}, -- 452
		Initialize = function(self) -- 452
			_class_0.__parent.__base.Initialize(self) -- 453
			if SERVER then -- 454
				return self:PrecacheGibs() -- 454
			end -- 454
		end, -- 456
		OnTakeDamage = function(self, dmg) -- 456
			_class_0.__parent.__base.OnTakeDamage(self, dmg) -- 457
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH -- 458
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then -- 459
				self:Shatter(dmg:GetDamageForce()) -- 459
			end -- 459
			if attacker and IsValid(attacker) and attacker:IsPlayer() then -- 460
				if attacker:HasOddity(ODDITY_DELINQUENCY) then -- 461
					return attacker:AddDespair(-math.random(2, 4)) -- 462
				end -- 461
			end -- 460
		end, -- 464
		PhysicsCollide = function(self, data) -- 464
			_class_0.__parent.__base.PhysicsCollide(self, data) -- 465
			if CLIENT then -- 466
				return -- 466
			end -- 466
			if data.Speed > self.ImpactThreshold then -- 467
				if data.HitEntity and IsValid(data.HitEntity) then -- 468
					local attacker = self:GetNWEntity("evilrp_submitter") -- 469
					do -- 470
						local dmg = DamageInfo() -- 470
						dmg:SetDamage(10) -- 471
						if IsValid(attacker) then -- 472
							dmg:SetAttacker(attacker) -- 472
						end -- 472
						dmg:SetInflictor(self) -- 473
						dmg:SetDamageType(DMG_SLASH) -- 474
						dmg:SetDamagePosition(data.HitPos) -- 475
						data.HitEntity:TakeDamageInfo(dmg) -- 476
					end -- 470
				end -- 468
				local force = data.OurNewVelocity -- 477
				return self:Shatter(force) -- 478
			end -- 467
		end, -- 480
		Shatter = function(self, force) -- 480
			if self.broken then -- 481
				return -- 481
			end -- 481
			self.broken = true -- 482
			local pos = self:GetPos() -- 483
			local _list_0 = player.GetAll() -- 484
			for _index_0 = 1, #_list_0 do -- 484
				local ply = _list_0[_index_0] -- 484
				local _continue_0 = false -- 485
				repeat -- 485
					if not ply:HasOddity(ODDITY_DELINQUENCY) then -- 485
						_continue_0 = true -- 485
						break -- 485
					end -- 485
					if ply:CanSee(self) and ply:LookingInDirection(pos) then -- 486
						ply:AddDespair(-math.random(2, 4)) -- 487
					end -- 486
					_continue_0 = true -- 485
				until true -- 487
				if not _continue_0 then -- 487
					break -- 487
				end -- 487
			end -- 487
			do -- 488
				local ed = EffectData() -- 488
				ed:SetStart(pos) -- 489
				ed:SetOrigin(pos) -- 490
				ed:SetScale(8) -- 491
				util.Effect("GlassImpact", ed, true, true) -- 492
			end -- 488
			self:EmitSound("BottleSmash") -- 493
			self:GibBreakServer(force) -- 494
			return self:Remove() -- 495
		end -- 429
	} -- 429
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 495
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 429
			_base_0[_key_0] = _val_0 -- 429
		end -- 429
	end -- 495
	if _base_0.__index == nil then -- 429
		_base_0.__index = _base_0 -- 429
	end -- 495
	setmetatable(_base_0, _parent_0.__base) -- 429
	_class_0 = setmetatable({ -- 429
		__init = function(self, ...) -- 429
			return _class_0.__parent.__init(self, ...) -- 429
		end, -- 429
		__base = _base_0, -- 429
		__name = "SmearBeer", -- 429
		__parent = _parent_0 -- 429
	}, { -- 429
		__index = function(cls, name) -- 429
			local val = rawget(_base_0, name) -- 429
			if val == nil then -- 429
				local parent = rawget(cls, "__parent") -- 429
				if parent then -- 429
					return parent[name] -- 429
				end -- 429
			else -- 429
				return val -- 429
			end -- 429
		end, -- 429
		__call = function(cls, ...) -- 429
			local _self_0 = setmetatable({ }, _base_0) -- 429
			cls.__init(_self_0, ...) -- 429
			return _self_0 -- 429
		end -- 429
	}) -- 429
	_base_0.__class = _class_0 -- 429
	if _parent_0.__inherited then -- 429
		_parent_0.__inherited(_parent_0, _class_0) -- 429
	end -- 429
	SmearBeer = _class_0 -- 429
end -- 495
local Shake -- 497
do -- 497
	local _class_0 -- 497
	local _parent_0 = Drink -- 497
	local _base_0 = { -- 497
		PrintName = "Soylent Shake", -- 499
		Model = Model("models/props_junk/garbage_milkcarton001a.mdl"), -- 500
		Thirst = -40, -- 501
		Hunger = -40, -- 502
		Despair = 30, -- 503
		Description = "A jug full of partially blended human remains.\nIt's warm and chunky.", -- 505
		Price = 140, -- 507
		TrashClass = "trash/plastic/shake", -- 509
		UseText = { -- 510
			"chokes down a soylent shake.", -- 510
			"slurps up a soylent shake.", -- 511
			"swigs blended peoplemeat and shudders.", -- 512
			"struggles down a jug of human sludge.", -- 513
			"shoots back a bad protein shake.", -- 514
			"guzzles a meat smoothie.", -- 515
			"quaffs an entire soylent shake." -- 516
		} -- 497
	} -- 497
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 517
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 497
			_base_0[_key_0] = _val_0 -- 497
		end -- 497
	end -- 517
	if _base_0.__index == nil then -- 497
		_base_0.__index = _base_0 -- 497
	end -- 517
	setmetatable(_base_0, _parent_0.__base) -- 497
	_class_0 = setmetatable({ -- 497
		__init = function(self, ...) -- 497
			return _class_0.__parent.__init(self, ...) -- 497
		end, -- 497
		__base = _base_0, -- 497
		__name = "Shake", -- 497
		__parent = _parent_0 -- 497
	}, { -- 497
		__index = function(cls, name) -- 497
			local val = rawget(_base_0, name) -- 497
			if val == nil then -- 497
				local parent = rawget(cls, "__parent") -- 497
				if parent then -- 497
					return parent[name] -- 497
				end -- 497
			else -- 497
				return val -- 497
			end -- 497
		end, -- 497
		__call = function(cls, ...) -- 497
			local _self_0 = setmetatable({ }, _base_0) -- 497
			cls.__init(_self_0, ...) -- 497
			return _self_0 -- 497
		end -- 497
	}) -- 497
	_base_0.__class = _class_0 -- 497
	if _parent_0.__inherited then -- 497
		_parent_0.__inherited(_parent_0, _class_0) -- 497
	end -- 497
	Shake = _class_0 -- 497
end -- 517
local BootLeg -- 519
do -- 519
	local _class_0 -- 519
	local _parent_0 = Drink -- 519
	local _base_0 = { -- 519
		PrintName = "Bootleg", -- 521
		Model = Model("models/props_junk/garbage_plasticbottle003a.mdl"), -- 522
		Thirst = -40, -- 523
		Hunger = -5, -- 524
		Despair = -45, -- 525
		HealthAdd = -18, -- 526
		Description = "An old bootleg of a wasteland wine recipe that has been lost to time. \n Tales say that the wastelander with the original recipe burned it and killed himself.", -- 527
		Price = 250, -- 529
		CookTime = 15, -- 531
		TrashClass = "trash/plastic/twitchel", -- 534
		UseText = { -- 535
			"takes a swig of the bootlegged wine, wincing as the strong liquor trickles down and burns his scabbed and cut skin.", -- 535
			"tries to drink all of the bootlegged wine, before gasping heavily.", -- 536
			"breathes in before taking a massive swig of the bootlegged wine, grimacing upon burning his mouth." -- 537
		}, -- 540
		Eat = function(self, ply) -- 540
			_class_0.__parent.__base.Eat(self, ply) -- 541
			if CLIENT then -- 542
				return -- 542
			end -- 542
			local plyJob = RPExtraTeams[ply:Team()] -- 543
			if plyJob.category == "Wasteland" then -- 544
				ply:AddDespair(-55) -- 545
				ply:AddHunger(-15) -- 546
				ply:AddThirst(-48) -- 547
				return ply:TakeDamage(-5) -- 548
			end -- 544
		end -- 519
	} -- 519
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 552
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 519
			_base_0[_key_0] = _val_0 -- 519
		end -- 519
	end -- 552
	if _base_0.__index == nil then -- 519
		_base_0.__index = _base_0 -- 519
	end -- 552
	setmetatable(_base_0, _parent_0.__base) -- 519
	_class_0 = setmetatable({ -- 519
		__init = function(self, ...) -- 519
			return _class_0.__parent.__init(self, ...) -- 519
		end, -- 519
		__base = _base_0, -- 519
		__name = "BootLeg", -- 519
		__parent = _parent_0 -- 519
	}, { -- 519
		__index = function(cls, name) -- 519
			local val = rawget(_base_0, name) -- 519
			if val == nil then -- 519
				local parent = rawget(cls, "__parent") -- 519
				if parent then -- 519
					return parent[name] -- 519
				end -- 519
			else -- 519
				return val -- 519
			end -- 519
		end, -- 519
		__call = function(cls, ...) -- 519
			local _self_0 = setmetatable({ }, _base_0) -- 519
			cls.__init(_self_0, ...) -- 519
			return _self_0 -- 519
		end -- 519
	}) -- 519
	_base_0.__class = _class_0 -- 519
	if _parent_0.__inherited then -- 519
		_parent_0.__inherited(_parent_0, _class_0) -- 519
	end -- 519
	BootLeg = _class_0 -- 519
end -- 552
local Twitchel -- 554
do -- 554
	local _class_0 -- 554
	local _parent_0 = Drink -- 554
	local _base_0 = { -- 554
		PrintName = "Twitchel", -- 556
		Model = Model("models/props_junk/garbage_plasticbottle003a.mdl"), -- 557
		Thirst = -44, -- 558
		Hunger = 6, -- 559
		Despair = 6, -- 560
		Description = "A bottle of refreshingly lukewarm, cloudy green drink.", -- 562
		Price = 120, -- 564
		TrashClass = "trash/plastic/twitchel", -- 566
		UseText = { -- 567
			"necks a bottle of twitchel.", -- 567
			"can't get enough of that green stuff.", -- 568
			"sucks down a bottle of twitchel.", -- 569
			"sips up their twitchel.", -- 570
			"pours twitchel down their throat.", -- 571
			"drinks a bottle of twitchel.", -- 572
			"slurps up a green drink." -- 573
		} -- 554
	} -- 554
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 574
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 554
			_base_0[_key_0] = _val_0 -- 554
		end -- 554
	end -- 574
	if _base_0.__index == nil then -- 554
		_base_0.__index = _base_0 -- 554
	end -- 574
	setmetatable(_base_0, _parent_0.__base) -- 554
	_class_0 = setmetatable({ -- 554
		__init = function(self, ...) -- 554
			return _class_0.__parent.__init(self, ...) -- 554
		end, -- 554
		__base = _base_0, -- 554
		__name = "Twitchel", -- 554
		__parent = _parent_0 -- 554
	}, { -- 554
		__index = function(cls, name) -- 554
			local val = rawget(_base_0, name) -- 554
			if val == nil then -- 554
				local parent = rawget(cls, "__parent") -- 554
				if parent then -- 554
					return parent[name] -- 554
				end -- 554
			else -- 554
				return val -- 554
			end -- 554
		end, -- 554
		__call = function(cls, ...) -- 554
			local _self_0 = setmetatable({ }, _base_0) -- 554
			cls.__init(_self_0, ...) -- 554
			return _self_0 -- 554
		end -- 554
	}) -- 554
	_base_0.__class = _class_0 -- 554
	if _parent_0.__inherited then -- 554
		_parent_0.__inherited(_parent_0, _class_0) -- 554
	end -- 554
	Twitchel = _class_0 -- 554
end -- 574
local TakeMeds -- 576
do -- 576
	local _class_0 -- 576
	local _parent_0 = SOUND -- 576
	local _base_0 = { -- 576
		sound = (function() -- 577
			local _accum_0 = { } -- 577
			local _len_0 = 1 -- 577
			for i = 1, 3 do -- 577
				_accum_0[_len_0] = "npc/zombie/zombie_pain" .. tostring(i) .. ".wav" -- 577
				_len_0 = _len_0 + 1 -- 577
			end -- 577
			return _accum_0 -- 577
		end)() -- 576
	} -- 576
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 577
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 576
			_base_0[_key_0] = _val_0 -- 576
		end -- 576
	end -- 577
	if _base_0.__index == nil then -- 576
		_base_0.__index = _base_0 -- 576
	end -- 577
	setmetatable(_base_0, _parent_0.__base) -- 576
	_class_0 = setmetatable({ -- 576
		__init = function(self, ...) -- 576
			return _class_0.__parent.__init(self, ...) -- 576
		end, -- 576
		__base = _base_0, -- 576
		__name = "TakeMeds", -- 576
		__parent = _parent_0 -- 576
	}, { -- 576
		__index = function(cls, name) -- 576
			local val = rawget(_base_0, name) -- 576
			if val == nil then -- 576
				local parent = rawget(cls, "__parent") -- 576
				if parent then -- 576
					return parent[name] -- 576
				end -- 576
			else -- 576
				return val -- 576
			end -- 576
		end, -- 576
		__call = function(cls, ...) -- 576
			local _self_0 = setmetatable({ }, _base_0) -- 576
			cls.__init(_self_0, ...) -- 576
			return _self_0 -- 576
		end -- 576
	}) -- 576
	_base_0.__class = _class_0 -- 576
	if _parent_0.__inherited then -- 576
		_parent_0.__inherited(_parent_0, _class_0) -- 576
	end -- 576
	TakeMeds = _class_0 -- 576
end -- 577
local Medicine -- 581
do -- 581
	local _class_0 -- 581
	local _parent_0 = Food -- 581
	local _base_0 = { -- 581
		PrintName = "Medicine", -- 583
		Sound = "TakeMeds" -- 581
	} -- 581
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 583
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 581
			_base_0[_key_0] = _val_0 -- 581
		end -- 581
	end -- 583
	if _base_0.__index == nil then -- 581
		_base_0.__index = _base_0 -- 581
	end -- 583
	setmetatable(_base_0, _parent_0.__base) -- 581
	_class_0 = setmetatable({ -- 581
		__init = function(self, ...) -- 581
			return _class_0.__parent.__init(self, ...) -- 581
		end, -- 581
		__base = _base_0, -- 581
		__name = "Medicine", -- 581
		__parent = _parent_0 -- 581
	}, { -- 581
		__index = function(cls, name) -- 581
			local val = rawget(_base_0, name) -- 581
			if val == nil then -- 581
				local parent = rawget(cls, "__parent") -- 581
				if parent then -- 581
					return parent[name] -- 581
				end -- 581
			else -- 581
				return val -- 581
			end -- 581
		end, -- 581
		__call = function(cls, ...) -- 581
			local _self_0 = setmetatable({ }, _base_0) -- 581
			cls.__init(_self_0, ...) -- 581
			return _self_0 -- 581
		end -- 581
	}) -- 581
	_base_0.__class = _class_0 -- 581
	if _parent_0.__inherited then -- 581
		_parent_0.__inherited(_parent_0, _class_0) -- 581
	end -- 581
	Medicine = _class_0 -- 581
end -- 583
local Pills -- 585
do -- 585
	local _class_0 -- 585
	local _parent_0 = Medicine -- 585
	local _base_0 = { -- 585
		PrintName = "Pills", -- 587
		Model = Model("models/props_lab/jar01b.mdl"), -- 588
		HealthAdd = function(self) -- 588
			return math.random(-15, -30) -- 588
		end, -- 589
		Hunger = function(self) -- 589
			return math.random(30, 50) -- 589
		end, -- 590
		Thirst = function(self) -- 590
			return math.random(30, 60) -- 590
		end, -- 591
		Despair = function(self) -- 591
			return math.random(-60, -100) -- 591
		end, -- 593
		Description = "A white plastic bottle, full of random pills.", -- 595
		Price = 125, -- 597
		TrashClass = "trash/plastic/pills", -- 599
		UseText = { -- 600
			"throws a mess of pills into eir mouth.", -- 600
			"consumes the whole contents of a pill bottle.", -- 601
			"devours handfuls of scary-looking pills.", -- 602
			"chokes down some strange pills.", -- 603
			"takes their medicine, like a good citizen should.", -- 604
			"swallows a mouthful of pills.", -- 605
			"takes an excessive dose of colorful pills.", -- 606
			"tosses back an entire bottle of pills.", -- 607
			"throws back a bottle of mystery pills." -- 608
		} -- 585
	} -- 585
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 609
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 585
			_base_0[_key_0] = _val_0 -- 585
		end -- 585
	end -- 609
	if _base_0.__index == nil then -- 585
		_base_0.__index = _base_0 -- 585
	end -- 609
	setmetatable(_base_0, _parent_0.__base) -- 585
	_class_0 = setmetatable({ -- 585
		__init = function(self, ...) -- 585
			return _class_0.__parent.__init(self, ...) -- 585
		end, -- 585
		__base = _base_0, -- 585
		__name = "Pills", -- 585
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
	Pills = _class_0 -- 585
end -- 609
local TimeGas -- 611
do -- 611
	local _class_0 -- 611
	local _parent_0 = Medicine -- 611
	local _base_0 = { -- 611
		PrintName = "Time Gas", -- 613
		Model = Model("models/props_wasteland/prison_sinkchunk001e.mdl"), -- 614
		Sound = (function() -- 614
			local _accum_0 = { } -- 614
			local _len_0 = 1 -- 614
			for i = 2, 3 do -- 614
				_accum_0[_len_0] = "npc/fast_zombie/idle" .. tostring(i) -- 614
				_len_0 = _len_0 + 1 -- 614
			end -- 614
			return _accum_0 -- 614
		end)(), -- 615
		AddHealth = function(self) -- 615
			return math.random(20, 40) -- 615
		end, -- 616
		Hunger = function(self) -- 616
			return math.random(10, 20) -- 616
		end, -- 617
		Thirst = function(self) -- 617
			return math.random(20, 30) -- 617
		end, -- 618
		Despair = function(self) -- 618
			return math.random(0, 10) -- 618
		end, -- 620
		Description = "An inhaler of time acceleration gas.\nSpeeds up healing, and dying.", -- 622
		Price = 100, -- 624
		TrashClass = "trash/inhaler", -- 626
		UseText = { -- 627
			"breathes in some time gas.", -- 627
			"huffs a healing gas.", -- 628
			"isn't yet tired of the time gas.", -- 629
			"inhales a big cloud of time gas.", -- 630
			"takes a deep breath of time gas.", -- 631
			"drags in a lungful of time gas.", -- 632
			"sniffs up a cloud of time gas.", -- 633
			"huffs time gas from the rusty inhaler." -- 634
		} -- 611
	} -- 611
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 635
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 611
			_base_0[_key_0] = _val_0 -- 611
		end -- 611
	end -- 635
	if _base_0.__index == nil then -- 611
		_base_0.__index = _base_0 -- 611
	end -- 635
	setmetatable(_base_0, _parent_0.__base) -- 611
	_class_0 = setmetatable({ -- 611
		__init = function(self, ...) -- 611
			return _class_0.__parent.__init(self, ...) -- 611
		end, -- 611
		__base = _base_0, -- 611
		__name = "TimeGas", -- 611
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
	TimeGas = _class_0 -- 611
end -- 635
local Bleach -- 637
do -- 637
	local _class_0 -- 637
	local _parent_0 = Medicine -- 637
	local _base_0 = { -- 637
		PrintName = "Chlorine", -- 639
		Model = Model("models/props_junk/garbage_plasticbottle002a.mdl"), -- 640
		Sound = "DrinkFluid", -- 641
		Description = "Do NOT even think about drinking this. \n Last guy who tried couldn't even finish it before falling over.", -- 642
		HealthAdd = -50, -- 643
		Hunger = 40, -- 644
		Thirst = -40, -- 645
		Despair = { -- 647
			Description = "A jug full of bleach." -- 647
		}, -- 648
		Price = 100, -- 650
		TrashClass = "trash/plastic/bleach", -- 652
		UseText = { -- 653
			"drinks bleach.", -- 653
			"chugs an entire fucking jug of chlorine.", -- 654
			"unscrews a jug of bleach and pours it down the hatch.", -- 655
			"chokes down gulp after gulp of chlorine bleach." -- 656
		} -- 637
	} -- 637
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 657
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 637
			_base_0[_key_0] = _val_0 -- 637
		end -- 637
	end -- 657
	if _base_0.__index == nil then -- 637
		_base_0.__index = _base_0 -- 637
	end -- 657
	setmetatable(_base_0, _parent_0.__base) -- 637
	_class_0 = setmetatable({ -- 637
		__init = function(self, ...) -- 637
			return _class_0.__parent.__init(self, ...) -- 637
		end, -- 637
		__base = _base_0, -- 637
		__name = "Bleach", -- 637
		__parent = _parent_0 -- 637
	}, { -- 637
		__index = function(cls, name) -- 637
			local val = rawget(_base_0, name) -- 637
			if val == nil then -- 637
				local parent = rawget(cls, "__parent") -- 637
				if parent then -- 637
					return parent[name] -- 637
				end -- 637
			else -- 637
				return val -- 637
			end -- 637
		end, -- 637
		__call = function(cls, ...) -- 637
			local _self_0 = setmetatable({ }, _base_0) -- 637
			cls.__init(_self_0, ...) -- 637
			return _self_0 -- 637
		end -- 637
	}) -- 637
	_base_0.__class = _class_0 -- 637
	if _parent_0.__inherited then -- 637
		_parent_0.__inherited(_parent_0, _class_0) -- 637
	end -- 637
	Bleach = _class_0 -- 637
end -- 657
local Ambrosia -- 659
do -- 659
	local _class_0 -- 659
	local _parent_0 = Food -- 659
	local _base_0 = { -- 659
		PrintName = "Ambrosia", -- 661
		Model = Model("models/props_lab/cactus.mdl"), -- 662
		Hunger = -100, -- 663
		Thirst = -100, -- 664
		Despair = -100, -- 665
		HealthAdd = 100, -- 666
		Description = "A food made for gods.", -- 667
		RotTime = 0, -- 669
		UseText = { -- 670
			"indulges in some ambrosia." -- 670
		}, -- 673
		Precursor = { -- 674
			biomass = 20, -- 674
			wood = 20, -- 675
			metal = 20, -- 676
			polymer = 20 -- 677
		}, -- 679
		Eat = function(self, ply) -- 679
			_class_0.__parent.__base.Eat(self, ply) -- 680
			if CLIENT then -- 681
				return -- 681
			end -- 681
			return ply:AddStemCells(5) -- 682
		end -- 659
	} -- 659
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 682
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 659
			_base_0[_key_0] = _val_0 -- 659
		end -- 659
	end -- 682
	if _base_0.__index == nil then -- 659
		_base_0.__index = _base_0 -- 659
	end -- 682
	setmetatable(_base_0, _parent_0.__base) -- 659
	_class_0 = setmetatable({ -- 659
		__init = function(self, ...) -- 659
			return _class_0.__parent.__init(self, ...) -- 659
		end, -- 659
		__base = _base_0, -- 659
		__name = "Ambrosia", -- 659
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
	Ambrosia = _class_0 -- 659
end -- 682
local Chow -- 684
do -- 684
	local _class_0 -- 684
	local _parent_0 = Food -- 684
	local _base_0 = { -- 684
		PrintName = "Wasteland Chow", -- 686
		Model = Model("models/props_junk/garbage_takeoutcarton001a.mdl"), -- 687
		Hunger = -20, -- 688
		Thirst = -6, -- 689
		Despair = 10, -- 690
		Description = "An amalgamation of entrails, bones, and rotten flesh with a side of maggots. \n Wastelanders love it!", -- 691
		RotTime = 0, -- 692
		CookTime = 10, -- 694
		UseText = { -- 695
			"begrudgingly eats some wasteland chow.", -- 695
			"puts some chow in their mouth while gagging.", -- 696
			"eats some wasteland chow, then spits out the tiny bones.", -- 697
			"chomps on some wasteland chow.", -- 698
			"forces down some wasteland chow down their throat.", -- 699
			"eats some chow, secretly enjoying it." -- 700
		}, -- 703
		Eat = function(self, ply) -- 703
			_class_0.__parent.__base.Eat(self, ply) -- 704
			if CLIENT then -- 705
				return -- 705
			end -- 705
			local plyJob = RPExtraTeams[ply:Team()] -- 706
			if plyJob.category == "Wasteland" then -- 707
				ply:SetArmor((ply:Armor() + 20)) -- 708
				ply:AddDespair(-30) -- 709
				ply:AddHunger(-30) -- 710
				ply:AddThirst(-10) -- 711
				ply:AddStemCells(1) -- 712
				return ply:Notify("<c=0,200,0>THIS IS GOOD.") -- 713
			end -- 707
		end -- 684
	} -- 684
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 713
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 684
			_base_0[_key_0] = _val_0 -- 684
		end -- 684
	end -- 713
	if _base_0.__index == nil then -- 684
		_base_0.__index = _base_0 -- 684
	end -- 713
	setmetatable(_base_0, _parent_0.__base) -- 684
	_class_0 = setmetatable({ -- 684
		__init = function(self, ...) -- 684
			return _class_0.__parent.__init(self, ...) -- 684
		end, -- 684
		__base = _base_0, -- 684
		__name = "Chow", -- 684
		__parent = _parent_0 -- 684
	}, { -- 684
		__index = function(cls, name) -- 684
			local val = rawget(_base_0, name) -- 684
			if val == nil then -- 684
				local parent = rawget(cls, "__parent") -- 684
				if parent then -- 684
					return parent[name] -- 684
				end -- 684
			else -- 684
				return val -- 684
			end -- 684
		end, -- 684
		__call = function(cls, ...) -- 684
			local _self_0 = setmetatable({ }, _base_0) -- 684
			cls.__init(_self_0, ...) -- 684
			return _self_0 -- 684
		end -- 684
	}) -- 684
	_base_0.__class = _class_0 -- 684
	if _parent_0.__inherited then -- 684
		_parent_0.__inherited(_parent_0, _class_0) -- 684
	end -- 684
	Chow = _class_0 -- 684
end -- 713
local SloppyRibs -- 716
do -- 716
	local _class_0 -- 716
	local _parent_0 = Food -- 716
	local _base_0 = { -- 716
		PrintName = "Sloppy Ribs", -- 718
		Model = Model("models/vel/evilwar/sloppyribs.mdl"), -- 719
		Hunger = -28, -- 720
		Thirst = -4, -- 721
		Despair = -15, -- 722
		Description = "Fresh ribs from an unknown source, now glazed in slop! \n They look delicious.", -- 724
		CookTime = 10, -- 726
		Price = 115, -- 727
		UseText = { -- 728
			"devours all of the flesh and slop on the rib, then throws it away.", -- 728
			"munches on the rib, and then licks the glaze off his hands.", -- 729
			"gobbles down the rib, and spits out the bone." -- 730
		} -- 716
	} -- 716
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 730
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 716
			_base_0[_key_0] = _val_0 -- 716
		end -- 716
	end -- 730
	if _base_0.__index == nil then -- 716
		_base_0.__index = _base_0 -- 716
	end -- 730
	setmetatable(_base_0, _parent_0.__base) -- 716
	_class_0 = setmetatable({ -- 716
		__init = function(self, ...) -- 716
			return _class_0.__parent.__init(self, ...) -- 716
		end, -- 716
		__base = _base_0, -- 716
		__name = "SloppyRibs", -- 716
		__parent = _parent_0 -- 716
	}, { -- 716
		__index = function(cls, name) -- 716
			local val = rawget(_base_0, name) -- 716
			if val == nil then -- 716
				local parent = rawget(cls, "__parent") -- 716
				if parent then -- 716
					return parent[name] -- 716
				end -- 716
			else -- 716
				return val -- 716
			end -- 716
		end, -- 716
		__call = function(cls, ...) -- 716
			local _self_0 = setmetatable({ }, _base_0) -- 716
			cls.__init(_self_0, ...) -- 716
			return _self_0 -- 716
		end -- 716
	}) -- 716
	_base_0.__class = _class_0 -- 716
	if _parent_0.__inherited then -- 716
		_parent_0.__inherited(_parent_0, _class_0) -- 716
	end -- 716
	SloppyRibs = _class_0 -- 716
end -- 730
local AblativePaste -- 732
do -- 732
	local _class_0 -- 732
	local _parent_0 = Medicine -- 732
	local _base_0 = { -- 732
		PrintName = "Ablative paste", -- 734
		Model = Model("models/props_lab/jar01a.mdl"), -- 735
		Price = 380, -- 736
		Armor = 35, -- 737
		Despair = 15, -- 738
		Description = "A rough, sticky, uncomfortable paste but, at least it'll prevent your blood from leaking out.", -- 739
		Sound = "foley/alyx_hug_eli.wav", -- 740
		UseText = { -- 740
			"applies the paste to their delicate skin." -- 740
		} -- 732
	} -- 732
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 740
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 732
			_base_0[_key_0] = _val_0 -- 732
		end -- 732
	end -- 740
	if _base_0.__index == nil then -- 732
		_base_0.__index = _base_0 -- 732
	end -- 740
	setmetatable(_base_0, _parent_0.__base) -- 732
	_class_0 = setmetatable({ -- 732
		__init = function(self, ...) -- 732
			return _class_0.__parent.__init(self, ...) -- 732
		end, -- 732
		__base = _base_0, -- 732
		__name = "AblativePaste", -- 732
		__parent = _parent_0 -- 732
	}, { -- 732
		__index = function(cls, name) -- 732
			local val = rawget(_base_0, name) -- 732
			if val == nil then -- 732
				local parent = rawget(cls, "__parent") -- 732
				if parent then -- 732
					return parent[name] -- 732
				end -- 732
			else -- 732
				return val -- 732
			end -- 732
		end, -- 732
		__call = function(cls, ...) -- 732
			local _self_0 = setmetatable({ }, _base_0) -- 732
			cls.__init(_self_0, ...) -- 732
			return _self_0 -- 732
		end -- 732
	}) -- 732
	_base_0.__class = _class_0 -- 732
	if _parent_0.__inherited then -- 732
		_parent_0.__inherited(_parent_0, _class_0) -- 732
	end -- 732
	AblativePaste = _class_0 -- 732
end -- 740
local EyeballNoodles -- 742
do -- 742
	local _class_0 -- 742
	local _parent_0 = Food -- 742
	local _base_0 = { -- 742
		PrintName = "Eyeball Noodles", -- 744
		Model = Model("models/vel/evilwar/eyenoodle.mdl"), -- 745
		Hunger = -40, -- 746
		Thirst = -20, -- 747
		Despair = -20, -- 748
		Description = "A traditional Lymphomian dish, usually served to go. \n The texture is an acquired taste.", -- 750
		CookTime = 8, -- 752
		Price = 130, -- 754
		UseText = { -- 755
			"slurps all of the noodles.", -- 755
			"slurps the noodles, gagging at the wet crunch of the eyeball.", -- 756
			"eats the noodles, and then spits out the eyeball.", -- 757
			"gags on the noodles, and then throws out the eyeball." -- 758
		} -- 742
	} -- 742
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 759
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 742
			_base_0[_key_0] = _val_0 -- 742
		end -- 742
	end -- 759
	if _base_0.__index == nil then -- 742
		_base_0.__index = _base_0 -- 742
	end -- 759
	setmetatable(_base_0, _parent_0.__base) -- 742
	_class_0 = setmetatable({ -- 742
		__init = function(self, ...) -- 742
			return _class_0.__parent.__init(self, ...) -- 742
		end, -- 742
		__base = _base_0, -- 742
		__name = "EyeballNoodles", -- 742
		__parent = _parent_0 -- 742
	}, { -- 742
		__index = function(cls, name) -- 742
			local val = rawget(_base_0, name) -- 742
			if val == nil then -- 742
				local parent = rawget(cls, "__parent") -- 742
				if parent then -- 742
					return parent[name] -- 742
				end -- 742
			else -- 742
				return val -- 742
			end -- 742
		end, -- 742
		__call = function(cls, ...) -- 742
			local _self_0 = setmetatable({ }, _base_0) -- 742
			cls.__init(_self_0, ...) -- 742
			return _self_0 -- 742
		end -- 742
	}) -- 742
	_base_0.__class = _class_0 -- 742
	if _parent_0.__inherited then -- 742
		_parent_0.__inherited(_parent_0, _class_0) -- 742
	end -- 742
	EyeballNoodles = _class_0 -- 742
end -- 759
local PaperMache -- 761
do -- 761
	local _class_0 -- 761
	local _parent_0 = Food -- 761
	local _base_0 = { -- 761
		PrintName = "Paper Mache", -- 763
		Model = Model("models/props_junk/garbage_bag001a.mdl"), -- 764
		Hunger = -10, -- 765
		Thirst = -10, -- 766
		Despair = 15, -- 767
		Description = "An old crumpled paper. \n now it's watered down into a little ball.", -- 769
		CookTime = 3, -- 771
		Price = 30, -- 773
		UseText = { -- 774
			"stoves the paper mache into his mouth, gagging horribly.", -- 774
			"forces the paper down his throat, throwing up slightly", -- 775
			"rips apart the paper mache, eating small pieces at a time.", -- 776
			"looks miserable trying to eat watered down paper." -- 777
		} -- 761
	} -- 761
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 777
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 761
			_base_0[_key_0] = _val_0 -- 761
		end -- 761
	end -- 777
	if _base_0.__index == nil then -- 761
		_base_0.__index = _base_0 -- 761
	end -- 777
	setmetatable(_base_0, _parent_0.__base) -- 761
	_class_0 = setmetatable({ -- 761
		__init = function(self, ...) -- 761
			return _class_0.__parent.__init(self, ...) -- 761
		end, -- 761
		__base = _base_0, -- 761
		__name = "PaperMache", -- 761
		__parent = _parent_0 -- 761
	}, { -- 761
		__index = function(cls, name) -- 761
			local val = rawget(_base_0, name) -- 761
			if val == nil then -- 761
				local parent = rawget(cls, "__parent") -- 761
				if parent then -- 761
					return parent[name] -- 761
				end -- 761
			else -- 761
				return val -- 761
			end -- 761
		end, -- 761
		__call = function(cls, ...) -- 761
			local _self_0 = setmetatable({ }, _base_0) -- 761
			cls.__init(_self_0, ...) -- 761
			return _self_0 -- 761
		end -- 761
	}) -- 761
	_base_0.__class = _class_0 -- 761
	if _parent_0.__inherited then -- 761
		_parent_0.__inherited(_parent_0, _class_0) -- 761
	end -- 761
	PaperMache = _class_0 -- 761
	return _class_0 -- 777
end -- 777
