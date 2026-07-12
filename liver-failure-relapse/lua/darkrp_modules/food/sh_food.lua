-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/food/sh_food.yue
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
		Model = Model("models/props_junk/garbage_plasticbottle002a.mdl"), -- 11
		Category = "EvilRP: Food", -- 12
		Spawnable = true, -- 13
		Interesting = true, -- 15
		Sound = Sound("npc/barnacle/barnacle_crunch2.wav"), -- 17
		Hunger = 0, -- 18
		Thirst = 0, -- 19
		Despair = 0, -- 20
		HealthAdd = 0, -- 22
		RotTime = 0, -- 24
		Eat = function(self, ply) -- 24
			if CLIENT then -- 25
				return -- 25
			end -- 25
			local amt -- 26
			if self.Hunger then -- 27
				amt = self.Hunger -- 28
				if isfunction(amt) then -- 29
					amt = amt() -- 29
				end -- 29
				ply:AddHunger(amt) -- 30
			end -- 27
			if self.Thirst then -- 31
				amt = self.Thirst -- 32
				if isfunction(amt) then -- 33
					amt = amt() -- 33
				end -- 33
				ply:AddThirst(amt) -- 34
			end -- 31
			if self.Despair then -- 35
				amt = self.Despair -- 36
				if isfunction(amt) then -- 37
					amt = amt() -- 37
				end -- 37
				ply:AddDespair(amt) -- 38
			end -- 35
			if self.HealthAdd then -- 39
				amt = self.HealthAdd -- 40
				if isfunction(amt) then -- 41
					amt = amt() -- 41
				end -- 41
				if amt > 0 then -- 42
					ply:SetHealth(math.min(ply:Health() + amt, ply:GetMaxHealth())) -- 43
				elseif amt < 0 then -- 44
					ply:TakeDamage(-amt) -- 45
				end -- 42
			end -- 39
			if not self.PersistAfterEat then -- 48
				return self:Trash() -- 48
			end -- 48
		end, -- 50
		OnUseFinish = function(self, ply) -- 50
			_class_0.__parent.__base.OnUseFinish(self, ply) -- 51
			return self:Eat(ply) -- 52
		end, -- 54
		OnSpawned = function(self) -- 54
			_class_0.__parent.__base.OnSpawned(self) -- 55
			self:SetRotten(false) -- 56
			if self.RotTime > 0 then -- 57
				self.RotsIn = CurTime() + self.RotTime -- 57
			end -- 57
			return -- 58
		end, -- 60
		Think = function(self) -- 60
			_class_0.__parent.__base.Think(self) -- 61
			if CLIENT then -- 62
				return -- 62
			end -- 62
			if self.RotsIn and (not self:GetRotten()) and self.RotsIn < CurTime() then -- 63
				return self:Rot() -- 63
			end -- 63
		end, -- 65
		Rot = function(self) -- 65
			self:SetRotten(true) -- 66
			self:SetColor(Color(100, 0, 150)) -- 67
			return self:EmitSound("FoodRot") -- 68
		end -- 5
	} -- 5
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 68
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 5
			_base_0[_key_0] = _val_0 -- 5
		end -- 5
	end -- 68
	if _base_0.__index == nil then -- 5
		_base_0.__index = _base_0 -- 5
	end -- 68
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
end -- 68
local SlopSkull -- 70
do -- 70
	local _class_0 -- 70
	local _parent_0 = Food -- 70
	local _base_0 = { -- 70
		PrintName = "Slop Skull", -- 72
		Model = Model("models/Gibs/HGIBS.mdl"), -- 73
		Hunger = -10, -- 74
		Description = "A bloody, festering human skull.\nThe brain is still largely intact.", -- 75
		RotTime = 120, -- 77
		UseText = { -- 78
			"munches and crunches on a slop skull.", -- 78
			"slurps the brain matter out of a slop skull.", -- 79
			"digs around in a slop skull with their tongue.", -- 80
			"ravenously consumes a slop skull.", -- 81
			"gets pink sludge everywhere while eating a slop skull.", -- 82
			"scours a slop skull for brainmeat.", -- 83
			"cracks open a slop skull and slurps the brains out." -- 84
		}, -- 87
		Precursor = { -- 88
			biomass = 1 -- 88
		} -- 70
	} -- 70
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 88
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 70
			_base_0[_key_0] = _val_0 -- 70
		end -- 70
	end -- 88
	if _base_0.__index == nil then -- 70
		_base_0.__index = _base_0 -- 70
	end -- 88
	setmetatable(_base_0, _parent_0.__base) -- 70
	_class_0 = setmetatable({ -- 70
		__init = function(self, ...) -- 70
			return _class_0.__parent.__init(self, ...) -- 70
		end, -- 70
		__base = _base_0, -- 70
		__name = "SlopSkull", -- 70
		__parent = _parent_0 -- 70
	}, { -- 70
		__index = function(cls, name) -- 70
			local val = rawget(_base_0, name) -- 70
			if val == nil then -- 70
				local parent = rawget(cls, "__parent") -- 70
				if parent then -- 70
					return parent[name] -- 70
				end -- 70
			else -- 70
				return val -- 70
			end -- 70
		end, -- 70
		__call = function(cls, ...) -- 70
			local _self_0 = setmetatable({ }, _base_0) -- 70
			cls.__init(_self_0, ...) -- 70
			return _self_0 -- 70
		end -- 70
	}) -- 70
	_base_0.__class = _class_0 -- 70
	if _parent_0.__inherited then -- 70
		_parent_0.__inherited(_parent_0, _class_0) -- 70
	end -- 70
	SlopSkull = _class_0 -- 70
end -- 88
local Paper -- 90
do -- 90
	local _class_0 -- 90
	local _parent_0 = Food -- 90
	local _base_0 = { -- 90
		PrintName = "Paper", -- 92
		Model = Model("models/props_lab/papersheet001a.mdl"), -- 93
		Hunger = -7, -- 94
		Thirst = 10, -- 95
		Description = "A dirty scrap of used paper.\nThe writing is too faint to make out.", -- 97
		UseText = { -- 98
			"chokes down a sheet of paper.", -- 98
			"tears up and eats a sheet of paper.", -- 99
			"chews the paper into a stiff pulp and swallows.", -- 100
			"struggles to swallow a dry sheet of paper.", -- 101
			"eats paper.", -- 102
			"crumples up some paper and struggles to chew it.", -- 103
			"munches on a piece of paper." -- 104
		} -- 90
	} -- 90
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 105
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 90
			_base_0[_key_0] = _val_0 -- 90
		end -- 90
	end -- 105
	if _base_0.__index == nil then -- 90
		_base_0.__index = _base_0 -- 90
	end -- 105
	setmetatable(_base_0, _parent_0.__base) -- 90
	_class_0 = setmetatable({ -- 90
		__init = function(self, ...) -- 90
			return _class_0.__parent.__init(self, ...) -- 90
		end, -- 90
		__base = _base_0, -- 90
		__name = "Paper", -- 90
		__parent = _parent_0 -- 90
	}, { -- 90
		__index = function(cls, name) -- 90
			local val = rawget(_base_0, name) -- 90
			if val == nil then -- 90
				local parent = rawget(cls, "__parent") -- 90
				if parent then -- 90
					return parent[name] -- 90
				end -- 90
			else -- 90
				return val -- 90
			end -- 90
		end, -- 90
		__call = function(cls, ...) -- 90
			local _self_0 = setmetatable({ }, _base_0) -- 90
			cls.__init(_self_0, ...) -- 90
			return _self_0 -- 90
		end -- 90
	}) -- 90
	_base_0.__class = _class_0 -- 90
	if _parent_0.__inherited then -- 90
		_parent_0.__inherited(_parent_0, _class_0) -- 90
	end -- 90
	Paper = _class_0 -- 90
end -- 105
local RibBone -- 107
do -- 107
	local _class_0 -- 107
	local _parent_0 = Food -- 107
	local _base_0 = { -- 107
		PrintName = "Dry Rib", -- 109
		Model = Model("models/Gibs/hgibs_rib.mdl"), -- 110
		Hunger = -8, -- 111
		HealthAdd = -7, -- 112
		RotTime = 240, -- 113
		Description = "A lone human rib.\nYou could chew the marrow out, but it'd probably hurt.", -- 115
		UseText = { -- 116
			"breaks a tooth chewing on a rib bone.", -- 116
			"sucks marrow and bone shards from the rib.", -- 117
			"cuts up their throat eating a rib bone.", -- 118
			"bleeds from the mouth as they eat a rib bone.", -- 119
			"eats a bone, like a vulture.", -- 120
			"chokes on the broken points of a rib bone." -- 121
		}, -- 124
		Precursor = { -- 125
			biomass = 1 -- 125
		} -- 107
	} -- 107
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 125
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 107
			_base_0[_key_0] = _val_0 -- 107
		end -- 107
	end -- 125
	if _base_0.__index == nil then -- 107
		_base_0.__index = _base_0 -- 107
	end -- 125
	setmetatable(_base_0, _parent_0.__base) -- 107
	_class_0 = setmetatable({ -- 107
		__init = function(self, ...) -- 107
			return _class_0.__parent.__init(self, ...) -- 107
		end, -- 107
		__base = _base_0, -- 107
		__name = "RibBone", -- 107
		__parent = _parent_0 -- 107
	}, { -- 107
		__index = function(cls, name) -- 107
			local val = rawget(_base_0, name) -- 107
			if val == nil then -- 107
				local parent = rawget(cls, "__parent") -- 107
				if parent then -- 107
					return parent[name] -- 107
				end -- 107
			else -- 107
				return val -- 107
			end -- 107
		end, -- 107
		__call = function(cls, ...) -- 107
			local _self_0 = setmetatable({ }, _base_0) -- 107
			cls.__init(_self_0, ...) -- 107
			return _self_0 -- 107
		end -- 107
	}) -- 107
	_base_0.__class = _class_0 -- 107
	if _parent_0.__inherited then -- 107
		_parent_0.__inherited(_parent_0, _class_0) -- 107
	end -- 107
	RibBone = _class_0 -- 107
end -- 125
local Skin -- 127
do -- 127
	local _class_0 -- 127
	local _parent_0 = Food -- 127
	local _base_0 = { -- 127
		PrintName = "Skin", -- 129
		Description = "A greasy patch of some kind of hide.\nIt would probably taste nasty.", -- 130
		Model = Model("models/gibs/antlion_gib_small_2.mdl"), -- 131
		HealthAdd = function(self) -- 131
			return math.random(10, 20) -- 131
		end -- 127
	} -- 127
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 131
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 127
			_base_0[_key_0] = _val_0 -- 127
		end -- 127
	end -- 131
	if _base_0.__index == nil then -- 127
		_base_0.__index = _base_0 -- 127
	end -- 131
	setmetatable(_base_0, _parent_0.__base) -- 127
	_class_0 = setmetatable({ -- 127
		__init = function(self, ...) -- 127
			return _class_0.__parent.__init(self, ...) -- 127
		end, -- 127
		__base = _base_0, -- 127
		__name = "Skin", -- 127
		__parent = _parent_0 -- 127
	}, { -- 127
		__index = function(cls, name) -- 127
			local val = rawget(_base_0, name) -- 127
			if val == nil then -- 127
				local parent = rawget(cls, "__parent") -- 127
				if parent then -- 127
					return parent[name] -- 127
				end -- 127
			else -- 127
				return val -- 127
			end -- 127
		end, -- 127
		__call = function(cls, ...) -- 127
			local _self_0 = setmetatable({ }, _base_0) -- 127
			cls.__init(_self_0, ...) -- 127
			return _self_0 -- 127
		end -- 127
	}) -- 127
	_base_0.__class = _class_0 -- 127
	if _parent_0.__inherited then -- 127
		_parent_0.__inherited(_parent_0, _class_0) -- 127
	end -- 127
	Skin = _class_0 -- 127
end -- 131
local Abortion -- 133
do -- 133
	local _class_0 -- 133
	local _parent_0 = Food -- 133
	local _base_0 = { -- 133
		PrintName = "Abortion", -- 135
		Model = Model("models/props_c17/doll01.mdl"), -- 136
		Hunger = -23, -- 137
		Thirst = -20, -- 138
		HealthAdd = 20, -- 139
		RotTime = 240, -- 140
		Description = "An artificial baby that never got the chance to be born.\nDelicious.", -- 142
		UseText = { -- 143
			"eats a baby.", -- 143
			"rips apart an abortion and eats the pieces.", -- 144
			"bites the head off an abortion and swallows the rest.", -- 145
			"chews an abortion into pink paste.", -- 146
			"tears chunks off an abortion until it's all gone.", -- 147
			"eats an abortion, baby blood dribbling down their neck.", -- 148
			"eats an abortion legs-first." -- 149
		}, -- 152
		Eat = function(self, ply) -- 152
			_class_0.__parent.__base.Eat(self, ply) -- 153
			if CLIENT then -- 154
				return -- 154
			end -- 154
			return ply:AddStemCells(1) -- 155
		end -- 133
	} -- 133
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 155
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 133
			_base_0[_key_0] = _val_0 -- 133
		end -- 133
	end -- 155
	if _base_0.__index == nil then -- 133
		_base_0.__index = _base_0 -- 133
	end -- 155
	setmetatable(_base_0, _parent_0.__base) -- 133
	_class_0 = setmetatable({ -- 133
		__init = function(self, ...) -- 133
			return _class_0.__parent.__init(self, ...) -- 133
		end, -- 133
		__base = _base_0, -- 133
		__name = "Abortion", -- 133
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
	Abortion = _class_0 -- 133
end -- 155
local LiveBaby -- 157
do -- 157
	local _class_0 -- 157
	local _parent_0 = Food -- 157
	local _base_0 = { -- 157
		PrintName = "Live baby", -- 159
		Model = Model("models/props_c17/doll01.mdl"), -- 160
		Hunger = -52, -- 161
		Thirst = -47, -- 162
		HealthAdd = 40, -- 163
		RotTime = 480, -- 164
		Description = "An artifical baby, born paralyzed below the eyes.\nIt will know nothing but fear and pain.", -- 166
		UseText = { -- 167
			"eats a living infant.", -- 167
			"chews the head off a live baby and drinks its blood.", -- 168
			"eats a baby alive.", -- 169
			"eats a live baby and tastes its tears.", -- 170
			"rips apart a living baby and eats the pieces.", -- 171
			"tears open a live baby and feeds on its entrails.", -- 172
			"eats a live baby as it cries silently." -- 173
		} -- 157
	} -- 157
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 174
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 157
			_base_0[_key_0] = _val_0 -- 157
		end -- 157
	end -- 174
	if _base_0.__index == nil then -- 157
		_base_0.__index = _base_0 -- 157
	end -- 174
	setmetatable(_base_0, _parent_0.__base) -- 157
	_class_0 = setmetatable({ -- 157
		__init = function(self, ...) -- 157
			return _class_0.__parent.__init(self, ...) -- 157
		end, -- 157
		__base = _base_0, -- 157
		__name = "LiveBaby", -- 157
		__parent = _parent_0 -- 157
	}, { -- 157
		__index = function(cls, name) -- 157
			local val = rawget(_base_0, name) -- 157
			if val == nil then -- 157
				local parent = rawget(cls, "__parent") -- 157
				if parent then -- 157
					return parent[name] -- 157
				end -- 157
			else -- 157
				return val -- 157
			end -- 157
		end, -- 157
		__call = function(cls, ...) -- 157
			local _self_0 = setmetatable({ }, _base_0) -- 157
			cls.__init(_self_0, ...) -- 157
			return _self_0 -- 157
		end -- 157
	}) -- 157
	_base_0.__class = _class_0 -- 157
	if _parent_0.__inherited then -- 157
		_parent_0.__inherited(_parent_0, _class_0) -- 157
	end -- 157
	LiveBaby = _class_0 -- 157
end -- 174
local SoyLoaf -- 176
do -- 176
	local _class_0 -- 176
	local _parent_0 = Food -- 176
	local _base_0 = { -- 176
		PrintName = "Soylent Loaf", -- 178
		Model = Model("models/leakgibs/antlion_gib_small_3.mdl"), -- 179
		Hunger = -15, -- 180
		Thirst = 3, -- 181
		Despair = 5, -- 182
		Description = "A chewy loaf of dried Long Pig byproducts.\nLoathsome food, but it'll keep for a century.", -- 184
		Price = 20, -- 186
		UseText = { -- 187
			"gnaws at a soylent loaf.", -- 187
			"chokes down a soylent loaf.", -- 188
			"struggles to eat a soylent loaf.", -- 189
			"chomps on a loaf of mummified meat.", -- 190
			"grinds their teeth on a soylent loaf.", -- 191
			"chews off a chunk from a soylent loaf.", -- 192
			"eats some soylent, like a good citizen should." -- 193
		} -- 176
	} -- 176
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 194
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 176
			_base_0[_key_0] = _val_0 -- 176
		end -- 176
	end -- 194
	if _base_0.__index == nil then -- 176
		_base_0.__index = _base_0 -- 176
	end -- 194
	setmetatable(_base_0, _parent_0.__base) -- 176
	_class_0 = setmetatable({ -- 176
		__init = function(self, ...) -- 176
			return _class_0.__parent.__init(self, ...) -- 176
		end, -- 176
		__base = _base_0, -- 176
		__name = "SoyLoaf", -- 176
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
	SoyLoaf = _class_0 -- 176
end -- 194
local Boot -- 196
do -- 196
	local _class_0 -- 196
	local _parent_0 = Food -- 196
	local _base_0 = { -- 196
		PrintName = "Boot", -- 198
		Model = Model("models/props_junk/Shoe001a.mdl"), -- 199
		AddHealth = -4, -- 200
		Hunger = -5, -- 201
		Thirst = 40, -- 202
		Despair = 40, -- 203
		Description = "A dirty old boot, nearly fallen apart.", -- 205
		UseText = { -- 206
			"chews on a nasty boot!", -- 206
			"chokes on an old boot.", -- 207
			"gnaws a boot to shreds.", -- 208
			"shoves a boot in their mouth!", -- 209
			"eats a rotten leather boot.", -- 210
			"devours a dirty old boot!", -- 211
			"eats a boot." -- 212
		} -- 196
	} -- 196
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 213
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 196
			_base_0[_key_0] = _val_0 -- 196
		end -- 196
	end -- 213
	if _base_0.__index == nil then -- 196
		_base_0.__index = _base_0 -- 196
	end -- 213
	setmetatable(_base_0, _parent_0.__base) -- 196
	_class_0 = setmetatable({ -- 196
		__init = function(self, ...) -- 196
			return _class_0.__parent.__init(self, ...) -- 196
		end, -- 196
		__base = _base_0, -- 196
		__name = "Boot", -- 196
		__parent = _parent_0 -- 196
	}, { -- 196
		__index = function(cls, name) -- 196
			local val = rawget(_base_0, name) -- 196
			if val == nil then -- 196
				local parent = rawget(cls, "__parent") -- 196
				if parent then -- 196
					return parent[name] -- 196
				end -- 196
			else -- 196
				return val -- 196
			end -- 196
		end, -- 196
		__call = function(cls, ...) -- 196
			local _self_0 = setmetatable({ }, _base_0) -- 196
			cls.__init(_self_0, ...) -- 196
			return _self_0 -- 196
		end -- 196
	}) -- 196
	_base_0.__class = _class_0 -- 196
	if _parent_0.__inherited then -- 196
		_parent_0.__inherited(_parent_0, _class_0) -- 196
	end -- 196
	Boot = _class_0 -- 196
end -- 213
local MoldMelon -- 215
do -- 215
	local _class_0 -- 215
	local _parent_0 = Food -- 215
	local _base_0 = { -- 215
		PrintName = "Mold Melon", -- 217
		Model = Model("models/gibs/antlionegg01_chunk01c.mdl"), -- 218
		AddHealth = 5, -- 219
		Hunger = function(self) -- 219
			return math.random(-10, -18) -- 219
		end, -- 220
		Description = "A pithy husk of fruit, fully colonized by white mold.", -- 222
		Price = 25, -- 224
		UseText = { -- 225
			"eats a moldy melon.", -- 225
			"devours a moldy chunk of melon.", -- 226
			"munches on a mold melon.", -- 227
			"feasts on a fungus fruit.", -- 228
			"tears into some mold melon.", -- 229
			"crunches up a mold melon.", -- 230
			"chows down on a mold melon." -- 231
		} -- 215
	} -- 215
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 232
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 215
			_base_0[_key_0] = _val_0 -- 215
		end -- 215
	end -- 232
	if _base_0.__index == nil then -- 215
		_base_0.__index = _base_0 -- 215
	end -- 232
	setmetatable(_base_0, _parent_0.__base) -- 215
	_class_0 = setmetatable({ -- 215
		__init = function(self, ...) -- 215
			return _class_0.__parent.__init(self, ...) -- 215
		end, -- 215
		__base = _base_0, -- 215
		__name = "MoldMelon", -- 215
		__parent = _parent_0 -- 215
	}, { -- 215
		__index = function(cls, name) -- 215
			local val = rawget(_base_0, name) -- 215
			if val == nil then -- 215
				local parent = rawget(cls, "__parent") -- 215
				if parent then -- 215
					return parent[name] -- 215
				end -- 215
			else -- 215
				return val -- 215
			end -- 215
		end, -- 215
		__call = function(cls, ...) -- 215
			local _self_0 = setmetatable({ }, _base_0) -- 215
			cls.__init(_self_0, ...) -- 215
			return _self_0 -- 215
		end -- 215
	}) -- 215
	_base_0.__class = _class_0 -- 215
	if _parent_0.__inherited then -- 215
		_parent_0.__inherited(_parent_0, _class_0) -- 215
	end -- 215
	MoldMelon = _class_0 -- 215
end -- 232
local DrinkFluid -- 234
do -- 234
	local _class_0 -- 234
	local _parent_0 = SOUND -- 234
	local _base_0 = { -- 234
		sound = (function() -- 235
			local _accum_0 = { } -- 235
			local _len_0 = 1 -- 235
			for i = 1, 2 do -- 235
				_accum_0[_len_0] = "npc/barnacle/barnacle_gulp" .. tostring(i) .. ".wav" -- 235
				_len_0 = _len_0 + 1 -- 235
			end -- 235
			return _accum_0 -- 235
		end)(), -- 236
		level = SNDLVL_65DB -- 234
	} -- 234
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 236
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 234
			_base_0[_key_0] = _val_0 -- 234
		end -- 234
	end -- 236
	if _base_0.__index == nil then -- 234
		_base_0.__index = _base_0 -- 234
	end -- 236
	setmetatable(_base_0, _parent_0.__base) -- 234
	_class_0 = setmetatable({ -- 234
		__init = function(self, ...) -- 234
			return _class_0.__parent.__init(self, ...) -- 234
		end, -- 234
		__base = _base_0, -- 234
		__name = "DrinkFluid", -- 234
		__parent = _parent_0 -- 234
	}, { -- 234
		__index = function(cls, name) -- 234
			local val = rawget(_base_0, name) -- 234
			if val == nil then -- 234
				local parent = rawget(cls, "__parent") -- 234
				if parent then -- 234
					return parent[name] -- 234
				end -- 234
			else -- 234
				return val -- 234
			end -- 234
		end, -- 234
		__call = function(cls, ...) -- 234
			local _self_0 = setmetatable({ }, _base_0) -- 234
			cls.__init(_self_0, ...) -- 234
			return _self_0 -- 234
		end -- 234
	}) -- 234
	_base_0.__class = _class_0 -- 234
	if _parent_0.__inherited then -- 234
		_parent_0.__inherited(_parent_0, _class_0) -- 234
	end -- 234
	DrinkFluid = _class_0 -- 234
end -- 236
local Drink -- 238
do -- 238
	local _class_0 -- 238
	local _parent_0 = Food -- 238
	local _base_0 = { -- 238
		Sound = "DrinkFluid" -- 238
	} -- 238
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 239
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 238
			_base_0[_key_0] = _val_0 -- 238
		end -- 238
	end -- 239
	if _base_0.__index == nil then -- 238
		_base_0.__index = _base_0 -- 238
	end -- 239
	setmetatable(_base_0, _parent_0.__base) -- 238
	_class_0 = setmetatable({ -- 238
		__init = function(self, ...) -- 238
			return _class_0.__parent.__init(self, ...) -- 238
		end, -- 238
		__base = _base_0, -- 238
		__name = "Drink", -- 238
		__parent = _parent_0 -- 238
	}, { -- 238
		__index = function(cls, name) -- 238
			local val = rawget(_base_0, name) -- 238
			if val == nil then -- 238
				local parent = rawget(cls, "__parent") -- 238
				if parent then -- 238
					return parent[name] -- 238
				end -- 238
			else -- 238
				return val -- 238
			end -- 238
		end, -- 238
		__call = function(cls, ...) -- 238
			local _self_0 = setmetatable({ }, _base_0) -- 238
			cls.__init(_self_0, ...) -- 238
			return _self_0 -- 238
		end -- 238
	}) -- 238
	_base_0.__class = _class_0 -- 238
	if _parent_0.__inherited then -- 238
		_parent_0.__inherited(_parent_0, _class_0) -- 238
	end -- 238
	Drink = _class_0 -- 238
end -- 239
local FearBeer -- 241
do -- 241
	local _class_0 -- 241
	local _parent_0 = Drink -- 241
	local _base_0 = { -- 241
		PrintName = "Fear Beer", -- 243
		Model = Model("models/props_junk/garbage_glassbottle001a.mdl"), -- 244
		Thirst = -12, -- 245
		Despair = -15, -- 246
		Description = "A bottle of foul off-yellow liquid.\n'BEER' is hand-written on the label.", -- 248
		Price = 60, -- 250
		TrashClass = "trash/bottle/fearbeer", -- 252
		ImpactThreshold = 256, -- 254
		UseText = { -- 255
			"chugs a fear beer.", -- 255
			"downs a bottle of piss beer.", -- 256
			"drinks a ratty bottle of brew.", -- 257
			"quaffs a beer and grimaces.", -- 258
			"takes a swig of fear beer and shivers.", -- 259
			"guzzles a fear beer.", -- 260
			"chokes down some piss beer." -- 261
		}, -- 264
		Initialize = function(self) -- 264
			_class_0.__parent.__base.Initialize(self) -- 265
			if SERVER then -- 266
				return self:PrecacheGibs() -- 266
			end -- 266
		end, -- 268
		OnTakeDamage = function(self, dmg) -- 268
			_class_0.__parent.__base.OnTakeDamage(self, dmg) -- 269
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH -- 270
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then -- 271
				self:Shatter(dmg:GetDamageForce()) -- 271
			end -- 271
			if attacker and IsValid(attacker) and attacker:IsPlayer() then -- 272
				if attacker:HasOddity(ODDITY_DELINQUENCY) then -- 273
					return attacker:AddDespair(-math.random(2, 4)) -- 274
				end -- 273
			end -- 272
		end, -- 276
		PhysicsCollide = function(self, data) -- 276
			_class_0.__parent.__base.PhysicsCollide(self, data) -- 277
			if CLIENT then -- 278
				return -- 278
			end -- 278
			if data.Speed > self.ImpactThreshold then -- 279
				if data.HitEntity and IsValid(data.HitEntity) then -- 280
					local attacker = self:GetNWEntity("evilrp_submitter") -- 281
					local dmg = DamageInfo() -- 282
					dmg:SetDamage(25) -- 283
					if IsValid(attacker) then -- 284
						dmg:SetAttacker(attacker) -- 284
					end -- 284
					dmg:SetInflictor(self) -- 285
					dmg:SetDamageType(DMG_SLASH) -- 286
					dmg:SetDamagePosition(data.HitPos) -- 287
					data.HitEntity:TakeDamageInfo(dmg) -- 288
				end -- 280
				local force = data.OurNewVelocity -- 289
				return self:Shatter(force) -- 290
			end -- 279
		end, -- 292
		Shatter = function(self, force) -- 292
			if self.broken then -- 293
				return -- 293
			end -- 293
			self.broken = true -- 294
			local pos = self:GetPos() -- 295
			local _list_0 = player.GetAll() -- 296
			for _index_0 = 1, #_list_0 do -- 296
				local ply = _list_0[_index_0] -- 296
				local _continue_0 = false -- 297
				repeat -- 297
					if not ply:HasOddity(ODDITY_DELINQUENCY) then -- 297
						_continue_0 = true -- 297
						break -- 297
					end -- 297
					if ply:CanSee(self) and ply:LookingInDirection(pos) then -- 298
						ply:AddDespair(-math.random(2, 4)) -- 299
					end -- 298
					_continue_0 = true -- 297
				until true -- 299
				if not _continue_0 then -- 299
					break -- 299
				end -- 299
			end -- 299
			do -- 300
				local ed = EffectData() -- 300
				ed:SetStart(pos) -- 301
				ed:SetOrigin(pos) -- 302
				ed:SetScale(8) -- 303
				util.Effect("GlassImpact", ed, true, true) -- 304
			end -- 300
			self:EmitSound("BottleSmash") -- 305
			self:GibBreakServer(force) -- 306
			return self:Remove() -- 307
		end -- 241
	} -- 241
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 307
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 241
			_base_0[_key_0] = _val_0 -- 241
		end -- 241
	end -- 307
	if _base_0.__index == nil then -- 241
		_base_0.__index = _base_0 -- 241
	end -- 307
	setmetatable(_base_0, _parent_0.__base) -- 241
	_class_0 = setmetatable({ -- 241
		__init = function(self, ...) -- 241
			return _class_0.__parent.__init(self, ...) -- 241
		end, -- 241
		__base = _base_0, -- 241
		__name = "FearBeer", -- 241
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
	FearBeer = _class_0 -- 241
end -- 307
local SmearBeer -- 309
do -- 309
	local _class_0 -- 309
	local _parent_0 = Drink -- 309
	local _base_0 = { -- 309
		PrintName = "Smear Beer", -- 311
		Model = Model("models/props_junk/garbage_glassbottle003a.mdl"), -- 312
		Thirst = -12, -- 313
		Despair = -35, -- 314
		Description = "A bottle of cloudy, greyish red booze.\nThe label is obscured with a smear of old blood.", -- 316
		Price = 95, -- 318
		TrashClass = "trash/bottle", -- 320
		ImpactThreshold = 256, -- 322
		UseText = { -- 323
			"chugs a smear beer.", -- 323
			"downs a bottle of red brew.", -- 324
			"drinks a cloudy bottle of beer.", -- 325
			"quaffs a smear beer and shivers.", -- 326
			"takes a swig of smear beer.", -- 327
			"guzzles a bloody beer.", -- 328
			"nurses a bottle of blood beer." -- 329
		}, -- 332
		Initialize = function(self) -- 332
			_class_0.__parent.__base.Initialize(self) -- 333
			if SERVER then -- 334
				return self:PrecacheGibs() -- 334
			end -- 334
		end, -- 336
		OnTakeDamage = function(self, dmg) -- 336
			_class_0.__parent.__base.OnTakeDamage(self, dmg) -- 337
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH -- 338
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then -- 339
				self:Shatter(dmg:GetDamageForce()) -- 339
			end -- 339
			if attacker and IsValid(attacker) and attacker:IsPlayer() then -- 340
				if attacker:HasOddity(ODDITY_DELINQUENCY) then -- 341
					return attacker:AddDespair(-math.random(2, 4)) -- 342
				end -- 341
			end -- 340
		end, -- 344
		PhysicsCollide = function(self, data) -- 344
			_class_0.__parent.__base.PhysicsCollide(self, data) -- 345
			if CLIENT then -- 346
				return -- 346
			end -- 346
			if data.Speed > self.ImpactThreshold then -- 347
				if data.HitEntity and IsValid(data.HitEntity) then -- 348
					local attacker = self:GetNWEntity("evilrp_submitter") -- 349
					local dmg = DamageInfo() -- 350
					dmg:SetDamage(25) -- 351
					if IsValid(attacker) then -- 352
						dmg:SetAttacker(attacker) -- 352
					end -- 352
					dmg:SetInflictor(self) -- 353
					dmg:SetDamageType(DMG_SLASH) -- 354
					dmg:SetDamagePosition(data.HitPos) -- 355
					data.HitEntity:TakeDamageInfo(dmg) -- 356
				end -- 348
				local force = data.OurNewVelocity -- 357
				return self:Shatter(force) -- 358
			end -- 347
		end, -- 360
		Shatter = function(self, force) -- 360
			if self.broken then -- 361
				return -- 361
			end -- 361
			self.broken = true -- 362
			local pos = self:GetPos() -- 363
			local _list_0 = player.GetAll() -- 364
			for _index_0 = 1, #_list_0 do -- 364
				local ply = _list_0[_index_0] -- 364
				local _continue_0 = false -- 365
				repeat -- 365
					if not ply:HasOddity(ODDITY_DELINQUENCY) then -- 365
						_continue_0 = true -- 365
						break -- 365
					end -- 365
					if ply:CanSee(self) and ply:LookingInDirection(pos) then -- 366
						ply:AddDespair(-math.random(2, 4)) -- 367
					end -- 366
					_continue_0 = true -- 365
				until true -- 367
				if not _continue_0 then -- 367
					break -- 367
				end -- 367
			end -- 367
			do -- 368
				local ed = EffectData() -- 368
				ed:SetStart(pos) -- 369
				ed:SetOrigin(pos) -- 370
				ed:SetScale(8) -- 371
				util.Effect("GlassImpact", ed, true, true) -- 372
			end -- 368
			self:EmitSound("BottleSmash") -- 373
			self:GibBreakServer(force) -- 374
			return self:Remove() -- 375
		end -- 309
	} -- 309
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 375
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 309
			_base_0[_key_0] = _val_0 -- 309
		end -- 309
	end -- 375
	if _base_0.__index == nil then -- 309
		_base_0.__index = _base_0 -- 309
	end -- 375
	setmetatable(_base_0, _parent_0.__base) -- 309
	_class_0 = setmetatable({ -- 309
		__init = function(self, ...) -- 309
			return _class_0.__parent.__init(self, ...) -- 309
		end, -- 309
		__base = _base_0, -- 309
		__name = "SmearBeer", -- 309
		__parent = _parent_0 -- 309
	}, { -- 309
		__index = function(cls, name) -- 309
			local val = rawget(_base_0, name) -- 309
			if val == nil then -- 309
				local parent = rawget(cls, "__parent") -- 309
				if parent then -- 309
					return parent[name] -- 309
				end -- 309
			else -- 309
				return val -- 309
			end -- 309
		end, -- 309
		__call = function(cls, ...) -- 309
			local _self_0 = setmetatable({ }, _base_0) -- 309
			cls.__init(_self_0, ...) -- 309
			return _self_0 -- 309
		end -- 309
	}) -- 309
	_base_0.__class = _class_0 -- 309
	if _parent_0.__inherited then -- 309
		_parent_0.__inherited(_parent_0, _class_0) -- 309
	end -- 309
	SmearBeer = _class_0 -- 309
end -- 375
local Shake -- 377
do -- 377
	local _class_0 -- 377
	local _parent_0 = Drink -- 377
	local _base_0 = { -- 377
		PrintName = "Soylent Shake", -- 379
		Model = Model("models/props_junk/garbage_milkcarton001a.mdl"), -- 380
		Thirst = -40, -- 381
		Hunger = -40, -- 382
		Despair = 30, -- 383
		Description = "A jug full of partially blended human remains.\nIt's warm and chunky.", -- 385
		Price = 120, -- 387
		TrashClass = "trash/plastic/shake", -- 389
		UseText = { -- 390
			"chokes down a soylent shake.", -- 390
			"slurps up a soylent shake.", -- 391
			"swigs blended peoplemeat and shudders.", -- 392
			"struggles down a jug of human sludge.", -- 393
			"shoots back a bad protein shake.", -- 394
			"guzzles a meat smoothie.", -- 395
			"quaffs an entire soylent shake." -- 396
		} -- 377
	} -- 377
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 397
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 377
			_base_0[_key_0] = _val_0 -- 377
		end -- 377
	end -- 397
	if _base_0.__index == nil then -- 377
		_base_0.__index = _base_0 -- 377
	end -- 397
	setmetatable(_base_0, _parent_0.__base) -- 377
	_class_0 = setmetatable({ -- 377
		__init = function(self, ...) -- 377
			return _class_0.__parent.__init(self, ...) -- 377
		end, -- 377
		__base = _base_0, -- 377
		__name = "Shake", -- 377
		__parent = _parent_0 -- 377
	}, { -- 377
		__index = function(cls, name) -- 377
			local val = rawget(_base_0, name) -- 377
			if val == nil then -- 377
				local parent = rawget(cls, "__parent") -- 377
				if parent then -- 377
					return parent[name] -- 377
				end -- 377
			else -- 377
				return val -- 377
			end -- 377
		end, -- 377
		__call = function(cls, ...) -- 377
			local _self_0 = setmetatable({ }, _base_0) -- 377
			cls.__init(_self_0, ...) -- 377
			return _self_0 -- 377
		end -- 377
	}) -- 377
	_base_0.__class = _class_0 -- 377
	if _parent_0.__inherited then -- 377
		_parent_0.__inherited(_parent_0, _class_0) -- 377
	end -- 377
	Shake = _class_0 -- 377
end -- 397
local Twitchel -- 399
do -- 399
	local _class_0 -- 399
	local _parent_0 = Drink -- 399
	local _base_0 = { -- 399
		PrintName = "Twitchel", -- 401
		Model = Model("models/props_junk/garbage_plasticbottle003a.mdl"), -- 402
		Thirst = -44, -- 403
		Hunger = 6, -- 404
		Despair = 6, -- 405
		Description = "A bottle of refreshingly lukewarm, cloudy green drink.", -- 407
		Price = 80, -- 409
		TrashClass = "trash/plastic/twitchel", -- 411
		UseText = { -- 412
			"necks a bottle of twitchel.", -- 412
			"can't get enough of that green stuff.", -- 413
			"sucks down a bottle of twitchel.", -- 414
			"sips up their twitchel.", -- 415
			"pours twitchel down their throat.", -- 416
			"drinks a bottle of twitchel.", -- 417
			"slurps up a green drink." -- 418
		} -- 399
	} -- 399
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 419
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 399
			_base_0[_key_0] = _val_0 -- 399
		end -- 399
	end -- 419
	if _base_0.__index == nil then -- 399
		_base_0.__index = _base_0 -- 399
	end -- 419
	setmetatable(_base_0, _parent_0.__base) -- 399
	_class_0 = setmetatable({ -- 399
		__init = function(self, ...) -- 399
			return _class_0.__parent.__init(self, ...) -- 399
		end, -- 399
		__base = _base_0, -- 399
		__name = "Twitchel", -- 399
		__parent = _parent_0 -- 399
	}, { -- 399
		__index = function(cls, name) -- 399
			local val = rawget(_base_0, name) -- 399
			if val == nil then -- 399
				local parent = rawget(cls, "__parent") -- 399
				if parent then -- 399
					return parent[name] -- 399
				end -- 399
			else -- 399
				return val -- 399
			end -- 399
		end, -- 399
		__call = function(cls, ...) -- 399
			local _self_0 = setmetatable({ }, _base_0) -- 399
			cls.__init(_self_0, ...) -- 399
			return _self_0 -- 399
		end -- 399
	}) -- 399
	_base_0.__class = _class_0 -- 399
	if _parent_0.__inherited then -- 399
		_parent_0.__inherited(_parent_0, _class_0) -- 399
	end -- 399
	Twitchel = _class_0 -- 399
end -- 419
local TakeMeds -- 421
do -- 421
	local _class_0 -- 421
	local _parent_0 = SOUND -- 421
	local _base_0 = { -- 421
		sound = (function() -- 422
			local _accum_0 = { } -- 422
			local _len_0 = 1 -- 422
			for i = 1, 3 do -- 422
				_accum_0[_len_0] = "npc/zombie/zombie_pain" .. tostring(i) .. ".wav" -- 422
				_len_0 = _len_0 + 1 -- 422
			end -- 422
			return _accum_0 -- 422
		end)() -- 421
	} -- 421
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 422
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 421
			_base_0[_key_0] = _val_0 -- 421
		end -- 421
	end -- 422
	if _base_0.__index == nil then -- 421
		_base_0.__index = _base_0 -- 421
	end -- 422
	setmetatable(_base_0, _parent_0.__base) -- 421
	_class_0 = setmetatable({ -- 421
		__init = function(self, ...) -- 421
			return _class_0.__parent.__init(self, ...) -- 421
		end, -- 421
		__base = _base_0, -- 421
		__name = "TakeMeds", -- 421
		__parent = _parent_0 -- 421
	}, { -- 421
		__index = function(cls, name) -- 421
			local val = rawget(_base_0, name) -- 421
			if val == nil then -- 421
				local parent = rawget(cls, "__parent") -- 421
				if parent then -- 421
					return parent[name] -- 421
				end -- 421
			else -- 421
				return val -- 421
			end -- 421
		end, -- 421
		__call = function(cls, ...) -- 421
			local _self_0 = setmetatable({ }, _base_0) -- 421
			cls.__init(_self_0, ...) -- 421
			return _self_0 -- 421
		end -- 421
	}) -- 421
	_base_0.__class = _class_0 -- 421
	if _parent_0.__inherited then -- 421
		_parent_0.__inherited(_parent_0, _class_0) -- 421
	end -- 421
	TakeMeds = _class_0 -- 421
end -- 422
local Medicine -- 424
do -- 424
	local _class_0 -- 424
	local _parent_0 = Food -- 424
	local _base_0 = { -- 424
		Sound = "TakeMeds" -- 424
	} -- 424
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 425
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 424
			_base_0[_key_0] = _val_0 -- 424
		end -- 424
	end -- 425
	if _base_0.__index == nil then -- 424
		_base_0.__index = _base_0 -- 424
	end -- 425
	setmetatable(_base_0, _parent_0.__base) -- 424
	_class_0 = setmetatable({ -- 424
		__init = function(self, ...) -- 424
			return _class_0.__parent.__init(self, ...) -- 424
		end, -- 424
		__base = _base_0, -- 424
		__name = "Medicine", -- 424
		__parent = _parent_0 -- 424
	}, { -- 424
		__index = function(cls, name) -- 424
			local val = rawget(_base_0, name) -- 424
			if val == nil then -- 424
				local parent = rawget(cls, "__parent") -- 424
				if parent then -- 424
					return parent[name] -- 424
				end -- 424
			else -- 424
				return val -- 424
			end -- 424
		end, -- 424
		__call = function(cls, ...) -- 424
			local _self_0 = setmetatable({ }, _base_0) -- 424
			cls.__init(_self_0, ...) -- 424
			return _self_0 -- 424
		end -- 424
	}) -- 424
	_base_0.__class = _class_0 -- 424
	if _parent_0.__inherited then -- 424
		_parent_0.__inherited(_parent_0, _class_0) -- 424
	end -- 424
	Medicine = _class_0 -- 424
end -- 425
local Pills -- 427
do -- 427
	local _class_0 -- 427
	local _parent_0 = Medicine -- 427
	local _base_0 = { -- 427
		PrintName = "Pills", -- 429
		Model = Model("models/props_lab/jar01b.mdl"), -- 430
		AddHealth = function(self) -- 430
			return math.random(-15, -30) -- 430
		end, -- 431
		Hunger = function(self) -- 431
			return math.random(30, 50) -- 431
		end, -- 432
		Thirst = function(self) -- 432
			return math.random(30, 60) -- 432
		end, -- 433
		Despair = function(self) -- 433
			return math.random(-60, -100) -- 433
		end, -- 435
		Description = "A white plastic bottle, full of random pills.", -- 437
		Price = 125, -- 439
		TrashClass = "trash/plastic/pills", -- 441
		UseText = { -- 442
			"throws a mess of pills into eir mouth.", -- 442
			"consumes the whole contents of a pill bottle.", -- 443
			"devours handfuls of scary-looking pills.", -- 444
			"chokes down some strange pills.", -- 445
			"takes eir medicine, like a good citizen should.", -- 446
			"swallows a mouthful of pills.", -- 447
			"takes an excessive dose of colorful pills.", -- 448
			"tosses back an entire bottle of pills.", -- 449
			"throws back a bottle of mystery pills." -- 450
		} -- 427
	} -- 427
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 451
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 427
			_base_0[_key_0] = _val_0 -- 427
		end -- 427
	end -- 451
	if _base_0.__index == nil then -- 427
		_base_0.__index = _base_0 -- 427
	end -- 451
	setmetatable(_base_0, _parent_0.__base) -- 427
	_class_0 = setmetatable({ -- 427
		__init = function(self, ...) -- 427
			return _class_0.__parent.__init(self, ...) -- 427
		end, -- 427
		__base = _base_0, -- 427
		__name = "Pills", -- 427
		__parent = _parent_0 -- 427
	}, { -- 427
		__index = function(cls, name) -- 427
			local val = rawget(_base_0, name) -- 427
			if val == nil then -- 427
				local parent = rawget(cls, "__parent") -- 427
				if parent then -- 427
					return parent[name] -- 427
				end -- 427
			else -- 427
				return val -- 427
			end -- 427
		end, -- 427
		__call = function(cls, ...) -- 427
			local _self_0 = setmetatable({ }, _base_0) -- 427
			cls.__init(_self_0, ...) -- 427
			return _self_0 -- 427
		end -- 427
	}) -- 427
	_base_0.__class = _class_0 -- 427
	if _parent_0.__inherited then -- 427
		_parent_0.__inherited(_parent_0, _class_0) -- 427
	end -- 427
	Pills = _class_0 -- 427
end -- 451
local TimeGas -- 453
do -- 453
	local _class_0 -- 453
	local _parent_0 = Medicine -- 453
	local _base_0 = { -- 453
		PrintName = "Time Gas", -- 455
		Model = Model("models/props_wasteland/prison_sinkchunk001e.mdl"), -- 456
		Sound = (function() -- 456
			local _accum_0 = { } -- 456
			local _len_0 = 1 -- 456
			for i = 2, 3 do -- 456
				_accum_0[_len_0] = "npc/fast_zombie/idle" .. tostring(i) -- 456
				_len_0 = _len_0 + 1 -- 456
			end -- 456
			return _accum_0 -- 456
		end)(), -- 457
		AddHealth = function(self) -- 457
			return math.random(20, 40) -- 457
		end, -- 458
		Hunger = function(self) -- 458
			return math.random(10, 20) -- 458
		end, -- 459
		Thirst = function(self) -- 459
			return math.random(20, 30) -- 459
		end, -- 460
		Despair = function(self) -- 460
			return math.random(0, 10) -- 460
		end, -- 462
		Description = "An inhaler of time acceleration gas.\nSpeeds up healing, and dying.", -- 464
		Price = 100, -- 466
		TrashClass = "trash/inhaler", -- 468
		UseText = { -- 469
			"breathes in some time gas.", -- 469
			"huffs a healing gas.", -- 470
			"isn't yet tired of the time gas.", -- 471
			"inhales a big cloud of time gas.", -- 472
			"takes a deep breath of time gas.", -- 473
			"drags in a lungful of time gas.", -- 474
			"sniffs up a cloud of time gas.", -- 475
			"huffs time gas from the rusty inhaler." -- 476
		} -- 453
	} -- 453
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 477
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 453
			_base_0[_key_0] = _val_0 -- 453
		end -- 453
	end -- 477
	if _base_0.__index == nil then -- 453
		_base_0.__index = _base_0 -- 453
	end -- 477
	setmetatable(_base_0, _parent_0.__base) -- 453
	_class_0 = setmetatable({ -- 453
		__init = function(self, ...) -- 453
			return _class_0.__parent.__init(self, ...) -- 453
		end, -- 453
		__base = _base_0, -- 453
		__name = "TimeGas", -- 453
		__parent = _parent_0 -- 453
	}, { -- 453
		__index = function(cls, name) -- 453
			local val = rawget(_base_0, name) -- 453
			if val == nil then -- 453
				local parent = rawget(cls, "__parent") -- 453
				if parent then -- 453
					return parent[name] -- 453
				end -- 453
			else -- 453
				return val -- 453
			end -- 453
		end, -- 453
		__call = function(cls, ...) -- 453
			local _self_0 = setmetatable({ }, _base_0) -- 453
			cls.__init(_self_0, ...) -- 453
			return _self_0 -- 453
		end -- 453
	}) -- 453
	_base_0.__class = _class_0 -- 453
	if _parent_0.__inherited then -- 453
		_parent_0.__inherited(_parent_0, _class_0) -- 453
	end -- 453
	TimeGas = _class_0 -- 453
end -- 477
local Bleach -- 479
local _class_0 -- 479
local _parent_0 = Medicine -- 479
local _base_0 = { -- 479
	PrintName = "Chlorine", -- 481
	Model = Model("models/props_junk/garbage_plasticbottle002a"), -- 482
	Sound = "DrinkFluid", -- 483
	AddHealth = function(self) -- 483
		return math.random(75, 99) -- 483
	end, -- 484
	Hunger = 70, -- 485
	Thirst = 70, -- 486
	Despair = 70, -- 488
	Description = "A jug full of bleach.", -- 490
	Price = 100, -- 492
	TrashClass = "trash/plastic/bleach", -- 494
	UseText = { -- 495
		"drinks bleach.", -- 495
		"chugs an entire fucking jug of chlorine.", -- 496
		"unscrews a jug of bleach and pours it down the hatch.", -- 497
		"chokes down gulp after gulp of chlorine bleach." -- 498
	} -- 479
} -- 479
for _key_0, _val_0 in pairs(_parent_0.__base) do -- 499
	if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 479
		_base_0[_key_0] = _val_0 -- 479
	end -- 479
end -- 499
if _base_0.__index == nil then -- 479
	_base_0.__index = _base_0 -- 479
end -- 499
setmetatable(_base_0, _parent_0.__base) -- 479
_class_0 = setmetatable({ -- 479
	__init = function(self, ...) -- 479
		return _class_0.__parent.__init(self, ...) -- 479
	end, -- 479
	__base = _base_0, -- 479
	__name = "Bleach", -- 479
	__parent = _parent_0 -- 479
}, { -- 479
	__index = function(cls, name) -- 479
		local val = rawget(_base_0, name) -- 479
		if val == nil then -- 479
			local parent = rawget(cls, "__parent") -- 479
			if parent then -- 479
				return parent[name] -- 479
			end -- 479
		else -- 479
			return val -- 479
		end -- 479
	end, -- 479
	__call = function(cls, ...) -- 479
		local _self_0 = setmetatable({ }, _base_0) -- 479
		cls.__init(_self_0, ...) -- 479
		return _self_0 -- 479
	end -- 479
}) -- 479
_base_0.__class = _class_0 -- 479
if _parent_0.__inherited then -- 479
	_parent_0.__inherited(_parent_0, _class_0) -- 479
end -- 479
Bleach = _class_0 -- 479
return _class_0 -- 499
