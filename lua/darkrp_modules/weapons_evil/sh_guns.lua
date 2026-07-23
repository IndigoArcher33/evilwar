-- [yue]: darkrp_modules\weapons_evil\sh_guns.yue
local Bodyguard -- 1
do -- 1
	local _class_0 -- 1
	local _parent_0 = EvilRP_Weapon -- 1
	local _base_0 = { -- 1
		PrintName = "Bodyguard", -- 3
		Description = "A simple revolver made for both enforcers and protectors alike. Ol' Reliable.", -- 5
		Slot = 1, -- 7
		Spawnable = true, -- 9
		UseHands = true, -- 10
		ViewModelTargetFOV = 54, -- 11
		ViewModel = Model("models/weapons/c_bodyguard.mdl"), -- 12
		WorldModel = Model("models/weapons/w_bodyguard.mdl"), -- 14
		HoldType = "revolver", -- 15
		LowerHoldType = "normal", -- 17
		Price = 1873, -- 19
		Firemode = 0, -- 20
		Primary = { -- 21
			Ammo = "357", -- 21
			ClipSize = 5, -- 23
			DefaultClip = 10, -- 24
			Damage = 55, -- 26
			Delay = 60 / 120, -- 27
			Range = 400, -- 29
			Accuracy = 12, -- 30
			RangeModifier = 0.78, -- 32
			Recoil = { -- 35
				MinAng = Angle(5.2, -0.3, 0), -- 35
				MaxAng = Angle(7.2, 0.3, 0), -- 36
				Punch = 0.9, -- 37
				Ratio = 0.3 -- 38
			}, -- 34
			Reload = { -- 42
				Sound = "Weapon_357.Reload" -- 42
			}, -- 41
			Sound = "tekka/weapons/weapon_canon.wav", -- 45
			TracerName = "Tracer" -- 46
		} -- 1
	} -- 1
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 47
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 1
			_base_0[_key_0] = _val_0 -- 1
		end -- 1
	end -- 47
	if _base_0.__index == nil then -- 1
		_base_0.__index = _base_0 -- 1
	end -- 47
	setmetatable(_base_0, _parent_0.__base) -- 1
	_class_0 = setmetatable({ -- 1
		__init = function(self, ...) -- 1
			return _class_0.__parent.__init(self, ...) -- 1
		end, -- 1
		__base = _base_0, -- 1
		__name = "Bodyguard", -- 1
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
	Bodyguard = _class_0 -- 1
end -- 47
local Brainpaster -- 49
do -- 49
	local _class_0 -- 49
	local _parent_0 = EvilRP_Weapon -- 49
	local _base_0 = { -- 49
		PrintName = "Brainpaster", -- 51
		Description = "Arrhythmia's number one wall painter.", -- 53
		Slot = 1, -- 55
		Spawnable = true, -- 57
		UseHands = true, -- 58
		ViewModelTargetFOV = 54, -- 59
		ViewModel = Model("models/weapons/c_brainpaster.mdl"), -- 60
		WorldModel = Model("models/weapons/w_brainpaster.mdl"), -- 62
		HoldType = "revolver", -- 63
		LowerHoldType = "normal", -- 65
		Firemode = 0, -- 66
		Primary = { -- 67
			Ammo = "357", -- 67
			ClipSize = 5, -- 69
			DefaultClip = 10, -- 70
			Damage = 40, -- 72
			Delay = 60 / 267, -- 73
			Range = 10 / 00, -- 75
			Accuracy = 12, -- 76
			RangeModifier = 0.8, -- 78
			Recoil = { -- 81
				MinAng = Angle(5.8, -0.7, 0), -- 81
				MaxAng = Angle(7.5, 0.7, 0), -- 82
				Punch = 0.7, -- 83
				Ratio = 0.2 -- 84
			}, -- 80
			Reload = { -- 88
				Sound = "Weapon_Pistol.Reload" -- 88
			}, -- 87
			Sound = "tekka/weapons/weapon_sniper.wav", -- 91
			TracerName = "Tracer" -- 92
		} -- 49
	} -- 49
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 93
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 49
			_base_0[_key_0] = _val_0 -- 49
		end -- 49
	end -- 93
	if _base_0.__index == nil then -- 49
		_base_0.__index = _base_0 -- 49
	end -- 93
	setmetatable(_base_0, _parent_0.__base) -- 49
	_class_0 = setmetatable({ -- 49
		__init = function(self, ...) -- 49
			return _class_0.__parent.__init(self, ...) -- 49
		end, -- 49
		__base = _base_0, -- 49
		__name = "Brainpaster", -- 49
		__parent = _parent_0 -- 49
	}, { -- 49
		__index = function(cls, name) -- 49
			local val = rawget(_base_0, name) -- 49
			if val == nil then -- 49
				local parent = rawget(cls, "__parent") -- 49
				if parent then -- 49
					return parent[name] -- 49
				end -- 49
			else -- 49
				return val -- 49
			end -- 49
		end, -- 49
		__call = function(cls, ...) -- 49
			local _self_0 = setmetatable({ }, _base_0) -- 49
			cls.__init(_self_0, ...) -- 49
			return _self_0 -- 49
		end -- 49
	}) -- 49
	_base_0.__class = _class_0 -- 49
	if _parent_0.__inherited then -- 49
		_parent_0.__inherited(_parent_0, _class_0) -- 49
	end -- 49
	Brainpaster = _class_0 -- 49
end -- 93
local Coach -- 95
do -- 95
	local _class_0 -- 95
	local _parent_0 = EvilRP_Weapon -- 95
	local _base_0 = { -- 95
		PrintName = "Coach", -- 97
		Description = "A dead simple double-barreled shotgun.\nThe wood is full of splinters.", -- 99
		Slot = 1, -- 101
		Spawnable = true, -- 103
		Price = 2468, -- 105
		UseHands = true, -- 106
		ViewModelTargetFOV = 54, -- 107
		ViewModel = Model("models/weapons/c_coach.mdl"), -- 108
		WorldModel = Model("models/weapons/w_coach.mdl"), -- 110
		HoldType = "shotgun", -- 111
		LowerHoldType = "passive", -- 113
		Firemode = 0, -- 114
		Primary = { -- 115
			Ammo = "Buckshot", -- 115
			ClipSize = 2, -- 117
			DefaultClip = 2, -- 118
			Damage = 17, -- 120
			Count = 14, -- 121
			Delay = 0.4, -- 122
			Range = 250, -- 124
			Accuracy = 24, -- 125
			RangeModifier = 0.7, -- 127
			Recoil = { -- 130
				MinAng = Angle(17, -7, 0), -- 130
				MaxAng = Angle(20, 7, 0), -- 131
				Punch = 0.9, -- 132
				Ratio = 0.8 -- 133
			}, -- 129
			Reload = { -- 137
				Sound = "Weapon_Shotgun.Reload" -- 137
			}, -- 136
			Sound = "weapons/shotgun/shotgun_dbl_fire.wav", -- 140
			TracerName = "Tracer" -- 141
		} -- 95
	} -- 95
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 142
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 95
			_base_0[_key_0] = _val_0 -- 95
		end -- 95
	end -- 142
	if _base_0.__index == nil then -- 95
		_base_0.__index = _base_0 -- 95
	end -- 142
	setmetatable(_base_0, _parent_0.__base) -- 95
	_class_0 = setmetatable({ -- 95
		__init = function(self, ...) -- 95
			return _class_0.__parent.__init(self, ...) -- 95
		end, -- 95
		__base = _base_0, -- 95
		__name = "Coach", -- 95
		__parent = _parent_0 -- 95
	}, { -- 95
		__index = function(cls, name) -- 95
			local val = rawget(_base_0, name) -- 95
			if val == nil then -- 95
				local parent = rawget(cls, "__parent") -- 95
				if parent then -- 95
					return parent[name] -- 95
				end -- 95
			else -- 95
				return val -- 95
			end -- 95
		end, -- 95
		__call = function(cls, ...) -- 95
			local _self_0 = setmetatable({ }, _base_0) -- 95
			cls.__init(_self_0, ...) -- 95
			return _self_0 -- 95
		end -- 95
	}) -- 95
	_base_0.__class = _class_0 -- 95
	if _parent_0.__inherited then -- 95
		_parent_0.__inherited(_parent_0, _class_0) -- 95
	end -- 95
	Coach = _class_0 -- 95
end -- 142
local Reload_Shell -- 144
do -- 144
	local _class_0 -- 144
	local _parent_0 = SOUND -- 144
	local _base_0 = { -- 144
		sound = (function() -- 145
			local _accum_0 = { } -- 145
			local _len_0 = 1 -- 145
			for i = 1, 3 do -- 145
				_accum_0[_len_0] = "weapons/shotgun/shotgun_reload" .. tostring(i) .. ".wav" -- 145
				_len_0 = _len_0 + 1 -- 145
			end -- 145
			return _accum_0 -- 145
		end)() -- 144
	} -- 144
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 145
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 144
			_base_0[_key_0] = _val_0 -- 144
		end -- 144
	end -- 145
	if _base_0.__index == nil then -- 144
		_base_0.__index = _base_0 -- 144
	end -- 145
	setmetatable(_base_0, _parent_0.__base) -- 144
	_class_0 = setmetatable({ -- 144
		__init = function(self, ...) -- 144
			return _class_0.__parent.__init(self, ...) -- 144
		end, -- 144
		__base = _base_0, -- 144
		__name = "Reload_Shell", -- 144
		__parent = _parent_0 -- 144
	}, { -- 144
		__index = function(cls, name) -- 144
			local val = rawget(_base_0, name) -- 144
			if val == nil then -- 144
				local parent = rawget(cls, "__parent") -- 144
				if parent then -- 144
					return parent[name] -- 144
				end -- 144
			else -- 144
				return val -- 144
			end -- 144
		end, -- 144
		__call = function(cls, ...) -- 144
			local _self_0 = setmetatable({ }, _base_0) -- 144
			cls.__init(_self_0, ...) -- 144
			return _self_0 -- 144
		end -- 144
	}) -- 144
	_base_0.__class = _class_0 -- 144
	if _parent_0.__inherited then -- 144
		_parent_0.__inherited(_parent_0, _class_0) -- 144
	end -- 144
	Reload_Shell = _class_0 -- 144
end -- 145
local Candlewood_Fire -- 147
do -- 147
	local _class_0 -- 147
	local _parent_0 = SOUND -- 147
	local _base_0 = { -- 147
		sound = "tekka/weapons/weapon_warhammer.wav", -- 149
		chan = CHAN_WEAPON -- 147
	} -- 147
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 149
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 147
			_base_0[_key_0] = _val_0 -- 147
		end -- 147
	end -- 149
	if _base_0.__index == nil then -- 147
		_base_0.__index = _base_0 -- 147
	end -- 149
	setmetatable(_base_0, _parent_0.__base) -- 147
	_class_0 = setmetatable({ -- 147
		__init = function(self, ...) -- 147
			return _class_0.__parent.__init(self, ...) -- 147
		end, -- 147
		__base = _base_0, -- 147
		__name = "Candlewood_Fire", -- 147
		__parent = _parent_0 -- 147
	}, { -- 147
		__index = function(cls, name) -- 147
			local val = rawget(_base_0, name) -- 147
			if val == nil then -- 147
				local parent = rawget(cls, "__parent") -- 147
				if parent then -- 147
					return parent[name] -- 147
				end -- 147
			else -- 147
				return val -- 147
			end -- 147
		end, -- 147
		__call = function(cls, ...) -- 147
			local _self_0 = setmetatable({ }, _base_0) -- 147
			cls.__init(_self_0, ...) -- 147
			return _self_0 -- 147
		end -- 147
	}) -- 147
	_base_0.__class = _class_0 -- 147
	if _parent_0.__inherited then -- 147
		_parent_0.__inherited(_parent_0, _class_0) -- 147
	end -- 147
	Candlewood_Fire = _class_0 -- 147
end -- 149
local Candlewood -- 151
do -- 151
	local _class_0 -- 151
	local _parent_0 = EvilRP_Weapon -- 151
	local _base_0 = { -- 151
		PrintName = "Candlewood", -- 153
		Description = "An unwieldy pump-action shotgun.\nRust is eating it alive.", -- 155
		Slot = 1, -- 157
		Spawnable = true, -- 159
		UseHands = true, -- 160
		ViewModelTargetFOV = 54, -- 161
		ViewModel = Model("models/weapons/c_candlewood.mdl"), -- 162
		WorldModel = Model("models/weapons/w_candlewood.mdl"), -- 164
		HoldType = "shotgun", -- 165
		LowerHoldType = "passive", -- 167
		Firemode = 0, -- 168
		Primary = { -- 169
			Ammo = "Buckshot", -- 169
			ClipSize = 4, -- 171
			DefaultClip = 8, -- 172
			Damage = 17, -- 174
			PumpAction = false, -- 175
			Pump = { -- 178
				Delay = 0.4, -- 178
				Sound = "weapons/shotgun/shotgun_cock.wav", -- 179
				FromEmpty = true -- 180
			}, -- 177
			Count = 7, -- 182
			Delay = -1, -- 183
			Range = 400, -- 185
			Accuracy = 12, -- 186
			RangeModifier = 0.7, -- 188
			Recoil = { -- 191
				MinAng = Angle(10, -2, 0), -- 191
				MaxAng = Angle(14, 2, 0), -- 192
				Punch = 0.9, -- 193
				Ratio = 0.8 -- 194
			}, -- 190
			Reload = { -- 198
				Amount = 1, -- 198
				Sound = "Reload_Shell", -- 199
				Shotgun = true -- 200
			}, -- 197
			Sound = "Candlewood_Fire", -- 203
			TracerName = "Tracer" -- 204
		} -- 151
	} -- 151
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 205
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 151
			_base_0[_key_0] = _val_0 -- 151
		end -- 151
	end -- 205
	if _base_0.__index == nil then -- 151
		_base_0.__index = _base_0 -- 151
	end -- 205
	setmetatable(_base_0, _parent_0.__base) -- 151
	_class_0 = setmetatable({ -- 151
		__init = function(self, ...) -- 151
			return _class_0.__parent.__init(self, ...) -- 151
		end, -- 151
		__base = _base_0, -- 151
		__name = "Candlewood", -- 151
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
	Candlewood = _class_0 -- 151
end -- 205
local Enforcer -- 207
do -- 207
	local _class_0 -- 207
	local _parent_0 = EvilRP_Weapon -- 207
	local _base_0 = { -- 207
		PrintName = "Enforcer", -- 209
		Description = "They used to hunt people with these.", -- 211
		Slot = 2, -- 213
		Spawnable = true, -- 215
		UseHands = true, -- 216
		ViewModelTargetFOV = 54, -- 217
		ViewModel = Model("models/weapons/c_livermann.mdl"), -- 218
		WorldModel = Model("models/weapons/w_livermann.mdl"), -- 220
		HoldType = "ar2", -- 221
		LowerHoldType = "passive", -- 223
		Firemode = 0, -- 224
		Primary = { -- 225
			Ammo = "AR2", -- 225
			ClipSize = 6, -- 227
			DefaultClip = 12, -- 228
			Damage = 75, -- 230
			Delay = 1.25, -- 231
			Range = 2000, -- 233
			Accuracy = 5, -- 234
			RangeModifier = 0.95, -- 236
			Recoil = { -- 239
				MinAng = Angle(14.6, -2.7, 0), -- 239
				MaxAng = Angle(17, 2.7, 0), -- 240
				Punch = 0.9, -- 241
				Ratio = 0.2 -- 242
			}, -- 238
			Reload = { -- 246
				Sound = "Weapon_SMG1.Reload", -- 246
				Amount = 6, -- 247
				Shotgun = true, -- 248
				DontFinishPump = true -- 249
			}, -- 245
			Sound = "placenta/weapons/enforcer.wav", -- 252
			TracerName = "Tracer" -- 253
		} -- 207
	} -- 207
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 254
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 207
			_base_0[_key_0] = _val_0 -- 207
		end -- 207
	end -- 254
	if _base_0.__index == nil then -- 207
		_base_0.__index = _base_0 -- 207
	end -- 254
	setmetatable(_base_0, _parent_0.__base) -- 207
	_class_0 = setmetatable({ -- 207
		__init = function(self, ...) -- 207
			return _class_0.__parent.__init(self, ...) -- 207
		end, -- 207
		__base = _base_0, -- 207
		__name = "Enforcer", -- 207
		__parent = _parent_0 -- 207
	}, { -- 207
		__index = function(cls, name) -- 207
			local val = rawget(_base_0, name) -- 207
			if val == nil then -- 207
				local parent = rawget(cls, "__parent") -- 207
				if parent then -- 207
					return parent[name] -- 207
				end -- 207
			else -- 207
				return val -- 207
			end -- 207
		end, -- 207
		__call = function(cls, ...) -- 207
			local _self_0 = setmetatable({ }, _base_0) -- 207
			cls.__init(_self_0, ...) -- 207
			return _self_0 -- 207
		end -- 207
	}) -- 207
	_base_0.__class = _class_0 -- 207
	if _parent_0.__inherited then -- 207
		_parent_0.__inherited(_parent_0, _class_0) -- 207
	end -- 207
	Enforcer = _class_0 -- 207
end -- 254
local Greaser -- 256
do -- 256
	local _class_0 -- 256
	local _parent_0 = EvilRP_Weapon -- 256
	local _base_0 = { -- 256
		PrintName = "Greaser", -- 258
		Description = "A shitty, greasy submachine gun.", -- 260
		Slot = 3, -- 262
		Spawnable = true, -- 264
		UseHands = true, -- 265
		ViewModelTargetFOV = 54, -- 266
		ViewModel = Model("models/weapons/c_greaser.mdl"), -- 267
		WorldModel = Model("models/weapons/w_greaser.mdl"), -- 269
		HoldType = "pistol", -- 270
		LowerHoldType = "normal", -- 272
		Firemode = 5, -- 273
		Primary = { -- 274
			Ammo = "SMG1", -- 274
			ClipSize = 16, -- 276
			DefaultClip = 32, -- 277
			Damage = 32, -- 279
			Delay = 60 / 340, -- 280
			Range = 400, -- 282
			Accuracy = 12, -- 283
			RangeModifier = 0.75, -- 285
			Recoil = { -- 288
				MinAng = Angle(3, -0.8, 0), -- 288
				MaxAng = Angle(4, 0.8, 0), -- 289
				Punch = 0.6, -- 290
				Ratio = 0.8 -- 291
			}, -- 287
			Reload = { -- 295
				Sound = "Weapon_Pistol.Reload" -- 295
			}, -- 294
			Sound = "tekka/weapons/weapon_mg.wav", -- 298
			TracerName = "Tracer" -- 299
		} -- 256
	} -- 256
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 300
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 256
			_base_0[_key_0] = _val_0 -- 256
		end -- 256
	end -- 300
	if _base_0.__index == nil then -- 256
		_base_0.__index = _base_0 -- 256
	end -- 300
	setmetatable(_base_0, _parent_0.__base) -- 256
	_class_0 = setmetatable({ -- 256
		__init = function(self, ...) -- 256
			return _class_0.__parent.__init(self, ...) -- 256
		end, -- 256
		__base = _base_0, -- 256
		__name = "Greaser", -- 256
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
	Greaser = _class_0 -- 256
end -- 300
local Novoluger -- 302
do -- 302
	local _class_0 -- 302
	local _parent_0 = EvilRP_Weapon -- 302
	local _base_0 = { -- 302
		PrintName = "Novoluger", -- 304
		Description = "A well-made, well-kept pistol. It's associated with the great.", -- 306
		Slot = 1, -- 308
		Spawnable = true, -- 310
		UseHands = true, -- 311
		ViewModelTargetFOV = 54, -- 312
		ViewModel = Model("models/weapons/c_novoluger.mdl"), -- 313
		WorldModel = Model("models/weapons/w_novoluger.mdl"), -- 315
		HoldType = "pistol", -- 316
		LowerHoldType = "normal", -- 318
		Firemode = 0, -- 319
		Primary = { -- 320
			Ammo = "Pistol", -- 320
			ClipSize = 8, -- 322
			DefaultClip = 24, -- 323
			Damage = 40, -- 325
			Delay = 60 / 200, -- 326
			Range = 750, -- 328
			Accuracy = 12, -- 329
			RangeModifier = 0.85, -- 331
			Recoil = { -- 334
				MinAng = Angle(5, -0.5, 0), -- 334
				MaxAng = Angle(6.5, 0.5, 0), -- 335
				Punch = 0.8, -- 336
				Ratio = 0.6 -- 337
			}, -- 333
			Reload = { -- 341
				Sound = "Weapon_Pistol.Reload" -- 341
			}, -- 340
			Sound = "tekka/weapons/weapon_m92.wav", -- 344
			TracerName = "Tracer" -- 345
		} -- 302
	} -- 302
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 346
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 302
			_base_0[_key_0] = _val_0 -- 302
		end -- 302
	end -- 346
	if _base_0.__index == nil then -- 302
		_base_0.__index = _base_0 -- 302
	end -- 346
	setmetatable(_base_0, _parent_0.__base) -- 302
	_class_0 = setmetatable({ -- 302
		__init = function(self, ...) -- 302
			return _class_0.__parent.__init(self, ...) -- 302
		end, -- 302
		__base = _base_0, -- 302
		__name = "Novoluger", -- 302
		__parent = _parent_0 -- 302
	}, { -- 302
		__index = function(cls, name) -- 302
			local val = rawget(_base_0, name) -- 302
			if val == nil then -- 302
				local parent = rawget(cls, "__parent") -- 302
				if parent then -- 302
					return parent[name] -- 302
				end -- 302
			else -- 302
				return val -- 302
			end -- 302
		end, -- 302
		__call = function(cls, ...) -- 302
			local _self_0 = setmetatable({ }, _base_0) -- 302
			cls.__init(_self_0, ...) -- 302
			return _self_0 -- 302
		end -- 302
	}) -- 302
	_base_0.__class = _class_0 -- 302
	if _parent_0.__inherited then -- 302
		_parent_0.__inherited(_parent_0, _class_0) -- 302
	end -- 302
	Novoluger = _class_0 -- 302
end -- 346
local Obrez -- 348
do -- 348
	local _class_0 -- 348
	local _parent_0 = EvilRP_Weapon -- 348
	local _base_0 = { -- 348
		PrintName = "Obrez", -- 350
		Description = "A mutilated rifle, ruined and barely functional.", -- 352
		Slot = 2, -- 354
		Spawnable = true, -- 356
		UseHands = true, -- 357
		ViewModelTargetFOV = 54, -- 358
		ViewModel = Model("models/weapons/c_obrez.mdl"), -- 359
		WorldModel = Model("models/weapons/w_obrez.mdl"), -- 361
		HoldType = "ar2", -- 362
		LowerHoldType = "passive", -- 364
		Firemode = 0, -- 365
		Primary = { -- 366
			Ammo = "AR2", -- 366
			ClipSize = 3, -- 368
			DefaultClip = 6, -- 369
			Damage = 65, -- 371
			Delay = 1.25, -- 372
			Range = 300, -- 374
			Accuracy = 12, -- 375
			RangeModifier = 0.95, -- 377
			Recoil = { -- 380
				MinAng = Angle(8, -6.2, 0), -- 380
				MaxAng = Angle(16, 6.2, 0), -- 381
				Punch = 0.95, -- 382
				Ratio = 0.2 -- 383
			}, -- 379
			Reload = { -- 387
				Sound = "Weapon_SMG1.Reload" -- 387
			}, -- 386
			Sound = "tekka/weapons/weapon_western.wav", -- 390
			TracerName = "Tracer" -- 391
		} -- 348
	} -- 348
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 392
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 348
			_base_0[_key_0] = _val_0 -- 348
		end -- 348
	end -- 392
	if _base_0.__index == nil then -- 348
		_base_0.__index = _base_0 -- 348
	end -- 392
	setmetatable(_base_0, _parent_0.__base) -- 348
	_class_0 = setmetatable({ -- 348
		__init = function(self, ...) -- 348
			return _class_0.__parent.__init(self, ...) -- 348
		end, -- 348
		__base = _base_0, -- 348
		__name = "Obrez", -- 348
		__parent = _parent_0 -- 348
	}, { -- 348
		__index = function(cls, name) -- 348
			local val = rawget(_base_0, name) -- 348
			if val == nil then -- 348
				local parent = rawget(cls, "__parent") -- 348
				if parent then -- 348
					return parent[name] -- 348
				end -- 348
			else -- 348
				return val -- 348
			end -- 348
		end, -- 348
		__call = function(cls, ...) -- 348
			local _self_0 = setmetatable({ }, _base_0) -- 348
			cls.__init(_self_0, ...) -- 348
			return _self_0 -- 348
		end -- 348
	}) -- 348
	_base_0.__class = _class_0 -- 348
	if _parent_0.__inherited then -- 348
		_parent_0.__inherited(_parent_0, _class_0) -- 348
	end -- 348
	Obrez = _class_0 -- 348
end -- 392
local Owler -- 394
do -- 394
	local _class_0 -- 394
	local _parent_0 = EvilRP_Weapon -- 394
	local _base_0 = { -- 394
		PrintName = "Owler", -- 396
		Description = "They all hate you.", -- 398
		Slot = 2, -- 400
		Spawnable = true, -- 402
		UseHands = true, -- 403
		ViewModelTargetFOV = 54, -- 404
		ViewModel = Model("models/weapons/c_owler.mdl"), -- 405
		WorldModel = Model("models/weapons/w_owler.mdl"), -- 407
		HoldType = "pistol", -- 408
		LowerHoldType = "normal", -- 410
		Firemode = -1, -- 411
		Primary = { -- 412
			Ammo = "SMG1", -- 412
			ClipSize = 20, -- 414
			DefaultClip = 40, -- 415
			Damage = 20, -- 417
			Delay = 60 / 1000, -- 418
			Range = 200, -- 420
			Accuracy = 8, -- 421
			RangeModifier = 0.55, -- 423
			Recoil = { -- 426
				MinAng = Angle(2.3, -0.5, 0), -- 426
				MaxAng = Angle(-1.3, 0.5, 0), -- 427
				Punch = 0.6, -- 428
				Ratio = 0.8 -- 429
			}, -- 425
			Reload = { -- 433
				Sound = "Weapon_Pistol.Reload" -- 433
			}, -- 432
			Sound = "tekka/weapons/weapon_mp40.wav", -- 436
			TracerName = "Tracer" -- 437
		} -- 394
	} -- 394
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 438
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 394
			_base_0[_key_0] = _val_0 -- 394
		end -- 394
	end -- 438
	if _base_0.__index == nil then -- 394
		_base_0.__index = _base_0 -- 394
	end -- 438
	setmetatable(_base_0, _parent_0.__base) -- 394
	_class_0 = setmetatable({ -- 394
		__init = function(self, ...) -- 394
			return _class_0.__parent.__init(self, ...) -- 394
		end, -- 394
		__base = _base_0, -- 394
		__name = "Owler", -- 394
		__parent = _parent_0 -- 394
	}, { -- 394
		__index = function(cls, name) -- 394
			local val = rawget(_base_0, name) -- 394
			if val == nil then -- 394
				local parent = rawget(cls, "__parent") -- 394
				if parent then -- 394
					return parent[name] -- 394
				end -- 394
			else -- 394
				return val -- 394
			end -- 394
		end, -- 394
		__call = function(cls, ...) -- 394
			local _self_0 = setmetatable({ }, _base_0) -- 394
			cls.__init(_self_0, ...) -- 394
			return _self_0 -- 394
		end -- 394
	}) -- 394
	_base_0.__class = _class_0 -- 394
	if _parent_0.__inherited then -- 394
		_parent_0.__inherited(_parent_0, _class_0) -- 394
	end -- 394
	Owler = _class_0 -- 394
end -- 438
local Pacifier -- 440
do -- 440
	local _class_0 -- 440
	local _parent_0 = EvilRP_Weapon -- 440
	local _base_0 = { -- 440
		PrintName = "Pacifier", -- 442
		Description = "The favourite pistol of the Sanitar Squad.", -- 444
		Slot = 1, -- 446
		Spawnable = true, -- 448
		UseHands = true, -- 449
		ViewModelTargetFOV = 54, -- 450
		ViewModel = Model("models/weapons/c_pacifier.mdl"), -- 451
		WorldModel = Model("models/weapons/w_pacifier.mdl"), -- 453
		HoldType = "pistol", -- 454
		LowerHoldType = "normal", -- 456
		Firemode = 0, -- 457
		Primary = { -- 458
			Ammo = "Pistol", -- 458
			ClipSize = 15, -- 460
			DefaultClip = 30, -- 461
			Damage = 32, -- 463
			Delay = 60 / 400, -- 464
			Range = 750, -- 466
			Accuracy = 12, -- 467
			RangeModifier = 0.85, -- 469
			Recoil = { -- 472
				MinAng = Angle(6.4, -0.3, 0), -- 472
				MaxAng = Angle(8, 0.3, 0), -- 473
				Punch = 0.8, -- 474
				Ratio = 0.6 -- 475
			}, -- 471
			Reload = { -- 479
				Sound = "Weapon_Pistol.Reload" -- 479
			}, -- 478
			Sound = "tekka/weapons/weapon_m92.wav", -- 482
			TracerName = "Tracer", -- 483
			AltFire = function(self) -- 485
				self.Primary.Automatic = false -- 486
				self:SetFiremode((self:GetFiremode() == 0) and 3 or 0) -- 487
				return self:EmitSound("Weapon_SMG1.Special1") -- 488
			end -- 485
		} -- 440
	} -- 440
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 489
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 440
			_base_0[_key_0] = _val_0 -- 440
		end -- 440
	end -- 489
	if _base_0.__index == nil then -- 440
		_base_0.__index = _base_0 -- 440
	end -- 489
	setmetatable(_base_0, _parent_0.__base) -- 440
	_class_0 = setmetatable({ -- 440
		__init = function(self, ...) -- 440
			return _class_0.__parent.__init(self, ...) -- 440
		end, -- 440
		__base = _base_0, -- 440
		__name = "Pacifier", -- 440
		__parent = _parent_0 -- 440
	}, { -- 440
		__index = function(cls, name) -- 440
			local val = rawget(_base_0, name) -- 440
			if val == nil then -- 440
				local parent = rawget(cls, "__parent") -- 440
				if parent then -- 440
					return parent[name] -- 440
				end -- 440
			else -- 440
				return val -- 440
			end -- 440
		end, -- 440
		__call = function(cls, ...) -- 440
			local _self_0 = setmetatable({ }, _base_0) -- 440
			cls.__init(_self_0, ...) -- 440
			return _self_0 -- 440
		end -- 440
	}) -- 440
	_base_0.__class = _class_0 -- 440
	if _parent_0.__inherited then -- 440
		_parent_0.__inherited(_parent_0, _class_0) -- 440
	end -- 440
	Pacifier = _class_0 -- 440
end -- 489
local Painkiller -- 491
do -- 491
	local _class_0 -- 491
	local _parent_0 = EvilRP_Weapon -- 491
	local _base_0 = { -- 491
		PrintName = "Painkiller", -- 493
		Description = "The dead feel no pain.", -- 495
		Slot = 1, -- 497
		Spawnable = true, -- 499
		UseHands = true, -- 500
		ViewModelTargetFOV = 54, -- 501
		ViewModel = Model("models/weapons/c_painkiller.mdl"), -- 502
		WorldModel = Model("models/weapons/w_painkiller.mdl"), -- 504
		HoldType = "pistol", -- 505
		LowerHoldType = "normal", -- 507
		Firemode = 0, -- 508
		Primary = { -- 509
			Ammo = "Pistol", -- 509
			ClipSize = 5, -- 511
			DefaultClip = 10, -- 512
			Damage = 60, -- 514
			Delay = 60 / 360, -- 515
			Range = 1200, -- 517
			Accuracy = 12, -- 518
			RangeModifier = 0.90, -- 520
			Recoil = { -- 523
				MinAng = Angle(8.2, -1.6, 0), -- 523
				MaxAng = Angle(11.2, 1.6, 0), -- 524
				Punch = 0.9, -- 525
				Ratio = 0.1 -- 526
			}, -- 522
			Reload = { -- 530
				Sound = "Weapon_Pistol.Reload" -- 530
			}, -- 529
			Sound = "tekka/weapons/weapon_50cal.wav", -- 533
			TracerName = "Tracer" -- 534
		} -- 491
	} -- 491
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 536
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 491
			_base_0[_key_0] = _val_0 -- 491
		end -- 491
	end -- 536
	if _base_0.__index == nil then -- 491
		_base_0.__index = _base_0 -- 491
	end -- 536
	setmetatable(_base_0, _parent_0.__base) -- 491
	_class_0 = setmetatable({ -- 491
		__init = function(self, ...) -- 491
			return _class_0.__parent.__init(self, ...) -- 491
		end, -- 491
		__base = _base_0, -- 491
		__name = "Painkiller", -- 491
		__parent = _parent_0 -- 491
	}, { -- 491
		__index = function(cls, name) -- 491
			local val = rawget(_base_0, name) -- 491
			if val == nil then -- 491
				local parent = rawget(cls, "__parent") -- 491
				if parent then -- 491
					return parent[name] -- 491
				end -- 491
			else -- 491
				return val -- 491
			end -- 491
		end, -- 491
		__call = function(cls, ...) -- 491
			local _self_0 = setmetatable({ }, _base_0) -- 491
			cls.__init(_self_0, ...) -- 491
			return _self_0 -- 491
		end -- 491
	}) -- 491
	_base_0.__class = _class_0 -- 491
	if _parent_0.__inherited then -- 491
		_parent_0.__inherited(_parent_0, _class_0) -- 491
	end -- 491
	Painkiller = _class_0 -- 491
end -- 536
local Prettyboy -- 538
do -- 538
	local _class_0 -- 538
	local _parent_0 = EvilRP_Weapon -- 538
	local _base_0 = { -- 538
		PrintName = "Pretty Boy", -- 540
		Description = "It's named after its most common users.", -- 542
		Slot = 1, -- 544
		Spawnable = true, -- 546
		UseHands = true, -- 547
		ViewModelTargetFOV = 54, -- 548
		ViewModel = Model("models/weapons/c_prettyboy.mdl"), -- 549
		WorldModel = Model("models/weapons/w_prettyboy.mdl"), -- 551
		HoldType = "pistol", -- 552
		LowerHoldType = "normal", -- 554
		Firemode = 0, -- 555
		Primary = { -- 556
			Ammo = "Pistol", -- 556
			ClipSize = 7, -- 558
			DefaultClip = 14, -- 559
			Damage = 30, -- 561
			Delay = 60 / 400, -- 562
			Range = 1000, -- 564
			Accuracy = 12, -- 565
			RangeModifier = 0.85, -- 567
			Recoil = { -- 570
				MinAng = Angle(2, -0.1, 0), -- 570
				MaxAng = Angle(4, 0.1, 0), -- 571
				Punch = 0.6, -- 572
				Ratio = 0.8 -- 573
			}, -- 569
			Reload = { -- 577
				Sound = "Weapon_Pistol.Reload" -- 577
			}, -- 576
			Sound = "tekka/weapons/weapon_pistolsmall.wav", -- 580
			TracerName = "Tracer" -- 581
		} -- 538
	} -- 538
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 583
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 538
			_base_0[_key_0] = _val_0 -- 538
		end -- 538
	end -- 583
	if _base_0.__index == nil then -- 538
		_base_0.__index = _base_0 -- 538
	end -- 583
	setmetatable(_base_0, _parent_0.__base) -- 538
	_class_0 = setmetatable({ -- 538
		__init = function(self, ...) -- 538
			return _class_0.__parent.__init(self, ...) -- 538
		end, -- 538
		__base = _base_0, -- 538
		__name = "Prettyboy", -- 538
		__parent = _parent_0 -- 538
	}, { -- 538
		__index = function(cls, name) -- 538
			local val = rawget(_base_0, name) -- 538
			if val == nil then -- 538
				local parent = rawget(cls, "__parent") -- 538
				if parent then -- 538
					return parent[name] -- 538
				end -- 538
			else -- 538
				return val -- 538
			end -- 538
		end, -- 538
		__call = function(cls, ...) -- 538
			local _self_0 = setmetatable({ }, _base_0) -- 538
			cls.__init(_self_0, ...) -- 538
			return _self_0 -- 538
		end -- 538
	}) -- 538
	_base_0.__class = _class_0 -- 538
	if _parent_0.__inherited then -- 538
		_parent_0.__inherited(_parent_0, _class_0) -- 538
	end -- 538
	Prettyboy = _class_0 -- 538
end -- 583
local Subjugator -- 585
do -- 585
	local _class_0 -- 585
	local _parent_0 = EvilRP_Weapon -- 585
	local _base_0 = { -- 585
		PrintName = "Subjugator", -- 587
		Description = "It'll subjugate the living and the dead.", -- 589
		Slot = 2, -- 591
		Spawnable = true, -- 593
		UseHands = true, -- 594
		ViewModelTargetFOV = 54, -- 595
		ViewModel = Model("models/weapons/c_subjugator.mdl"), -- 596
		WorldModel = Model("models/weapons/w_subjugator.mdl"), -- 598
		HoldType = "ar2", -- 599
		LowerHoldType = "passive", -- 601
		Firemode = -1, -- 602
		Primary = { -- 603
			Ammo = "AR2", -- 603
			ClipSize = 8, -- 605
			DefaultClip = 16, -- 606
			Damage = 65, -- 608
			Delay = 1, -- 609
			Range = 1500, -- 611
			Accuracy = 4, -- 612
			RangeModifier = 0.99, -- 614
			Recoil = { -- 617
				MinAng = Angle(10, -0.9, 0), -- 617
				MaxAng = Angle(14, 0.9, 0), -- 618
				Punch = 0.9, -- 619
				Ratio = 0.2 -- 620
			}, -- 616
			Reload = { -- 624
				Sound = "Weapon_Pistol.Reload" -- 624
			}, -- 623
			Sound = "tekka/weapons/weapon_mossberg.wav", -- 627
			TracerName = "Tracer" -- 628
		} -- 585
	} -- 585
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 630
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 585
			_base_0[_key_0] = _val_0 -- 585
		end -- 585
	end -- 630
	if _base_0.__index == nil then -- 585
		_base_0.__index = _base_0 -- 585
	end -- 630
	setmetatable(_base_0, _parent_0.__base) -- 585
	_class_0 = setmetatable({ -- 585
		__init = function(self, ...) -- 585
			return _class_0.__parent.__init(self, ...) -- 585
		end, -- 585
		__base = _base_0, -- 585
		__name = "Subjugator", -- 585
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
	Subjugator = _class_0 -- 585
end -- 630
local Trooper -- 632
do -- 632
	local _class_0 -- 632
	local _parent_0 = EvilRP_Weapon -- 632
	local _base_0 = { -- 632
		PrintName = "Trooper", -- 634
		Description = "A fully automatic instrument of death.\nRespect it, or else.", -- 636
		Slot = 2, -- 638
		Spawnable = true, -- 640
		UseHands = true, -- 641
		ViewModelTargetFOV = 54, -- 642
		ViewModel = Model("models/weapons/c_trooper.mdl"), -- 643
		WorldModel = Model("models/weapons/w_trooper.mdl"), -- 645
		HoldType = "ar2", -- 646
		LowerHoldType = "passive", -- 648
		Firemode = -1, -- 649
		Primary = { -- 650
			Ammo = "AR2", -- 650
			ClipSize = 20, -- 652
			DefaultClip = 40, -- 653
			Damage = 65, -- 655
			Delay = 60 / 400, -- 656
			Range = 1300, -- 658
			Accuracy = 4, -- 659
			RangeModifier = 0.99, -- 661
			Recoil = { -- 664
				MinAng = Angle(3.8, -0.9, 0), -- 664
				MaxAng = Angle(4.8, 0.9, 0), -- 665
				Punch = 0.8, -- 666
				Ratio = 0.5 -- 667
			}, -- 663
			Reload = { -- 671
				Sound = "Weapon_Pistol.Reload" -- 671
			}, -- 670
			Sound = "tekka/weapons/weapon_thud.wav", -- 674
			TracerName = "Tracer" -- 675
		} -- 632
	} -- 632
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 677
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 632
			_base_0[_key_0] = _val_0 -- 632
		end -- 632
	end -- 677
	if _base_0.__index == nil then -- 632
		_base_0.__index = _base_0 -- 632
	end -- 677
	setmetatable(_base_0, _parent_0.__base) -- 632
	_class_0 = setmetatable({ -- 632
		__init = function(self, ...) -- 632
			return _class_0.__parent.__init(self, ...) -- 632
		end, -- 632
		__base = _base_0, -- 632
		__name = "Trooper", -- 632
		__parent = _parent_0 -- 632
	}, { -- 632
		__index = function(cls, name) -- 632
			local val = rawget(_base_0, name) -- 632
			if val == nil then -- 632
				local parent = rawget(cls, "__parent") -- 632
				if parent then -- 632
					return parent[name] -- 632
				end -- 632
			else -- 632
				return val -- 632
			end -- 632
		end, -- 632
		__call = function(cls, ...) -- 632
			local _self_0 = setmetatable({ }, _base_0) -- 632
			cls.__init(_self_0, ...) -- 632
			return _self_0 -- 632
		end -- 632
	}) -- 632
	_base_0.__class = _class_0 -- 632
	if _parent_0.__inherited then -- 632
		_parent_0.__inherited(_parent_0, _class_0) -- 632
	end -- 632
	Trooper = _class_0 -- 632
end -- 677
local Mark -- 679
do -- 679
	local _class_0 -- 679
	local _parent_0 = EvilRP_Weapon -- 679
	local _base_0 = { -- 679
		PrintName = "The Mark", -- 681
		Description = "A rusty scrap pistol, rigged to fire one massive bullet.", -- 683
		Price = 1666, -- 685
		Slot = 1, -- 687
		Spawnable = true, -- 689
		UseHands = true, -- 690
		ViewModelTargetFOV = 54, -- 691
		ViewModel = Model("models/weapons/c_mark.mdl"), -- 692
		WorldModel = Model("models/weapons/w_mark.mdl"), -- 694
		HoldType = "pistol", -- 695
		LowerHoldType = "passive", -- 697
		Firemode = 1, -- 698
		Primary = { -- 699
			Ammo = "Pistol", -- 699
			ClipSize = 1, -- 701
			DefaultClip = 1, -- 702
			Damage = 80, -- 704
			Delay = 60 / 120, -- 705
			Range = 200, -- 707
			Accuracy = 12, -- 708
			RangeModifier = 0.4, -- 710
			Recoil = { -- 713
				MinAng = Angle(11, -3, 0), -- 713
				MaxAng = Angle(15, 3, 0), -- 714
				Punch = 0.95, -- 715
				Ratio = 0.3 -- 716
			}, -- 712
			Reload = { -- 720
				Sound = "Weapon_Pistol.Reload" -- 720
			}, -- 719
			Sound = "tekka/weapons/weapon_smg3.wav", -- 723
			TracerName = "Tracer" -- 724
		} -- 679
	} -- 679
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 726
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 679
			_base_0[_key_0] = _val_0 -- 679
		end -- 679
	end -- 726
	if _base_0.__index == nil then -- 679
		_base_0.__index = _base_0 -- 679
	end -- 726
	setmetatable(_base_0, _parent_0.__base) -- 679
	_class_0 = setmetatable({ -- 679
		__init = function(self, ...) -- 679
			return _class_0.__parent.__init(self, ...) -- 679
		end, -- 679
		__base = _base_0, -- 679
		__name = "Mark", -- 679
		__parent = _parent_0 -- 679
	}, { -- 679
		__index = function(cls, name) -- 679
			local val = rawget(_base_0, name) -- 679
			if val == nil then -- 679
				local parent = rawget(cls, "__parent") -- 679
				if parent then -- 679
					return parent[name] -- 679
				end -- 679
			else -- 679
				return val -- 679
			end -- 679
		end, -- 679
		__call = function(cls, ...) -- 679
			local _self_0 = setmetatable({ }, _base_0) -- 679
			cls.__init(_self_0, ...) -- 679
			return _self_0 -- 679
		end -- 679
	}) -- 679
	_base_0.__class = _class_0 -- 679
	if _parent_0.__inherited then -- 679
		_parent_0.__inherited(_parent_0, _class_0) -- 679
	end -- 679
	Mark = _class_0 -- 679
end -- 726
local Hope -- 729
do -- 729
	local _class_0 -- 729
	local _parent_0 = EvilRP_Weapon -- 729
	local _base_0 = { -- 729
		PrintName = "Hope", -- 731
		Description = "The standard issue Dragoon firearm, some say it speaks to them.", -- 733
		Slot = 1, -- 735
		Spawnable = true, -- 737
		UseHands = true, -- 738
		ViewModelTargetFOV = 54, -- 739
		ViewModel = Model("models/tnb/weapons/c_1911.mdl"), -- 740
		WorldModel = Model("models/tnb/weapons/w_1911.mdl"), -- 742
		HoldType = "pistol", -- 743
		LowerHoldType = "normal", -- 745
		Firemode = 0, -- 746
		Primary = { -- 747
			Ammo = "Pistol", -- 747
			ClipSize = 10, -- 749
			DefaultClip = 20, -- 750
			Damage = 35, -- 752
			Delay = 60 / 200, -- 753
			Range = 850, -- 755
			Accuracy = 12, -- 756
			RangeModifier = 0.85, -- 758
			Recoil = { -- 761
				MinAng = Angle(6, -0.5, 0), -- 761
				MaxAng = Angle(7.5, 0.5, 0), -- 762
				Punch = 0.8, -- 763
				Ratio = 0.6 -- 764
			}, -- 760
			Reload = { -- 768
				Sound = "Weapon_Pistol.Reload" -- 768
			}, -- 767
			Sound = "tekka/weapons/weapon_mac10.wav", -- 771
			TracerName = "Tracer" -- 772
		} -- 729
	} -- 729
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 773
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 729
			_base_0[_key_0] = _val_0 -- 729
		end -- 729
	end -- 773
	if _base_0.__index == nil then -- 729
		_base_0.__index = _base_0 -- 729
	end -- 773
	setmetatable(_base_0, _parent_0.__base) -- 729
	_class_0 = setmetatable({ -- 729
		__init = function(self, ...) -- 729
			return _class_0.__parent.__init(self, ...) -- 729
		end, -- 729
		__base = _base_0, -- 729
		__name = "Hope", -- 729
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
	Hope = _class_0 -- 729
end -- 773
local Whisper -- 776
do -- 776
	local _class_0 -- 776
	local _parent_0 = EvilRP_Weapon -- 776
	local _base_0 = { -- 776
		PrintName = "Whisper", -- 778
		Description = "A handmade pistol with a built in suppressor.\n It has earned its name from the gasps of outsiders whispering their final prayers as their carotid arteries were miraculously severed by this sidearm.", -- 780
		Slot = 1, -- 782
		Spawnable = true, -- 784
		UseHands = true, -- 785
		ViewModelTargetFOV = 54, -- 786
		ViewModel = Model("models/tnb/weapons/c_welrod.mdl"), -- 787
		WorldModel = Model("models/tnb/weapons/w_welrod.mdl"), -- 789
		HoldType = "pistol", -- 790
		LowerHoldType = "normal", -- 792
		Firemode = 0, -- 793
		Primary = { -- 794
			Ammo = "Pistol", -- 794
			ClipSize = 3, -- 796
			DefaultClip = 9, -- 797
			Damage = 15, -- 799
			Delay = 60 / 200, -- 800
			Range = 650, -- 802
			Accuracy = 12, -- 803
			RangeModifier = 0.85, -- 805
			Recoil = { -- 808
				MinAng = Angle(7, -0.5, 0), -- 808
				MaxAng = Angle(8.5, 0.5, 0), -- 809
				Punch = 0.8, -- 810
				Ratio = 0.6 -- 811
			}, -- 807
			Reload = { -- 815
				Sound = "Weapon_Pistol.Reload" -- 815
			}, -- 814
			Sound = "tekka/weapons/weapon_silencedthud.wav", -- 818
			TracerName = "Tracer" -- 819
		} -- 776
	} -- 776
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 820
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 776
			_base_0[_key_0] = _val_0 -- 776
		end -- 776
	end -- 820
	if _base_0.__index == nil then -- 776
		_base_0.__index = _base_0 -- 776
	end -- 820
	setmetatable(_base_0, _parent_0.__base) -- 776
	_class_0 = setmetatable({ -- 776
		__init = function(self, ...) -- 776
			return _class_0.__parent.__init(self, ...) -- 776
		end, -- 776
		__base = _base_0, -- 776
		__name = "Whisper", -- 776
		__parent = _parent_0 -- 776
	}, { -- 776
		__index = function(cls, name) -- 776
			local val = rawget(_base_0, name) -- 776
			if val == nil then -- 776
				local parent = rawget(cls, "__parent") -- 776
				if parent then -- 776
					return parent[name] -- 776
				end -- 776
			else -- 776
				return val -- 776
			end -- 776
		end, -- 776
		__call = function(cls, ...) -- 776
			local _self_0 = setmetatable({ }, _base_0) -- 776
			cls.__init(_self_0, ...) -- 776
			return _self_0 -- 776
		end -- 776
	}) -- 776
	_base_0.__class = _class_0 -- 776
	if _parent_0.__inherited then -- 776
		_parent_0.__inherited(_parent_0, _class_0) -- 776
	end -- 776
	Whisper = _class_0 -- 776
	return _class_0 -- 820
end -- 820
