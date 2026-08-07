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
		Price = 1400, -- 19
		Firemode = 0, -- 20
		Primary = { -- 21
			Ammo = "357", -- 21
			ClipSize = 5, -- 23
			DefaultClip = 10, -- 24
			Damage = 20, -- 26
			Delay = 60 / 60, -- 27
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
		Description = "Lymphoma's number one wall painter.", -- 53
		Price = 1900, -- 55
		Slot = 1, -- 57
		Spawnable = true, -- 59
		UseHands = true, -- 60
		ViewModelTargetFOV = 54, -- 61
		ViewModel = Model("models/weapons/c_brainpaster.mdl"), -- 62
		WorldModel = Model("models/weapons/w_brainpaster.mdl"), -- 64
		HoldType = "revolver", -- 65
		LowerHoldType = "normal", -- 67
		Firemode = 0, -- 68
		Primary = { -- 69
			Ammo = "357", -- 69
			ClipSize = 5, -- 71
			DefaultClip = 10, -- 72
			Damage = 40, -- 74
			Delay = 60 / 267, -- 75
			Range = 10 / 00, -- 77
			Accuracy = 12, -- 78
			RangeModifier = 0.8, -- 80
			Recoil = { -- 83
				MinAng = Angle(5.8, -0.7, 0), -- 83
				MaxAng = Angle(7.5, 0.7, 0), -- 84
				Punch = 0.7, -- 85
				Ratio = 0.2 -- 86
			}, -- 82
			Reload = { -- 90
				Sound = "Weapon_Pistol.Reload" -- 90
			}, -- 89
			Sound = "tekka/weapons/weapon_sniper.wav", -- 93
			TracerName = "Tracer" -- 94
		} -- 49
	} -- 49
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 95
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 49
			_base_0[_key_0] = _val_0 -- 49
		end -- 49
	end -- 95
	if _base_0.__index == nil then -- 49
		_base_0.__index = _base_0 -- 49
	end -- 95
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
end -- 95
local Coach -- 97
do -- 97
	local _class_0 -- 97
	local _parent_0 = EvilRP_Weapon -- 97
	local _base_0 = { -- 97
		PrintName = "Coach", -- 99
		Description = "A dead simple double-barreled shotgun.\nThe wood is full of splinters.", -- 101
		Slot = 1, -- 103
		Spawnable = true, -- 105
		Price = 2000, -- 107
		UseHands = true, -- 108
		ViewModelTargetFOV = 54, -- 109
		ViewModel = Model("models/weapons/c_coach.mdl"), -- 110
		WorldModel = Model("models/weapons/w_coach.mdl"), -- 112
		HoldType = "shotgun", -- 113
		LowerHoldType = "passive", -- 115
		Firemode = 0, -- 116
		Primary = { -- 117
			Ammo = "Buckshot", -- 117
			ClipSize = 2, -- 119
			DefaultClip = 2, -- 120
			Damage = 18, -- 122
			Count = 14, -- 123
			Delay = 0.4, -- 124
			Range = 250, -- 126
			Accuracy = 24, -- 127
			RangeModifier = 0.7, -- 129
			Recoil = { -- 132
				MinAng = Angle(17, -7, 0), -- 132
				MaxAng = Angle(20, 7, 0), -- 133
				Punch = 0.9, -- 134
				Ratio = 0.8 -- 135
			}, -- 131
			Reload = { -- 139
				Sound = "Weapon_Shotgun.Reload" -- 139
			}, -- 138
			Sound = "weapons/shotgun/shotgun_dbl_fire.wav", -- 142
			TracerName = "Tracer" -- 143
		} -- 97
	} -- 97
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 144
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 97
			_base_0[_key_0] = _val_0 -- 97
		end -- 97
	end -- 144
	if _base_0.__index == nil then -- 97
		_base_0.__index = _base_0 -- 97
	end -- 144
	setmetatable(_base_0, _parent_0.__base) -- 97
	_class_0 = setmetatable({ -- 97
		__init = function(self, ...) -- 97
			return _class_0.__parent.__init(self, ...) -- 97
		end, -- 97
		__base = _base_0, -- 97
		__name = "Coach", -- 97
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
	Coach = _class_0 -- 97
end -- 144
local Reload_Shell -- 146
do -- 146
	local _class_0 -- 146
	local _parent_0 = SOUND -- 146
	local _base_0 = { -- 146
		sound = (function() -- 147
			local _accum_0 = { } -- 147
			local _len_0 = 1 -- 147
			for i = 1, 3 do -- 147
				_accum_0[_len_0] = "weapons/shotgun/shotgun_reload" .. tostring(i) .. ".wav" -- 147
				_len_0 = _len_0 + 1 -- 147
			end -- 147
			return _accum_0 -- 147
		end)() -- 146
	} -- 146
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 147
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 146
			_base_0[_key_0] = _val_0 -- 146
		end -- 146
	end -- 147
	if _base_0.__index == nil then -- 146
		_base_0.__index = _base_0 -- 146
	end -- 147
	setmetatable(_base_0, _parent_0.__base) -- 146
	_class_0 = setmetatable({ -- 146
		__init = function(self, ...) -- 146
			return _class_0.__parent.__init(self, ...) -- 146
		end, -- 146
		__base = _base_0, -- 146
		__name = "Reload_Shell", -- 146
		__parent = _parent_0 -- 146
	}, { -- 146
		__index = function(cls, name) -- 146
			local val = rawget(_base_0, name) -- 146
			if val == nil then -- 146
				local parent = rawget(cls, "__parent") -- 146
				if parent then -- 146
					return parent[name] -- 146
				end -- 146
			else -- 146
				return val -- 146
			end -- 146
		end, -- 146
		__call = function(cls, ...) -- 146
			local _self_0 = setmetatable({ }, _base_0) -- 146
			cls.__init(_self_0, ...) -- 146
			return _self_0 -- 146
		end -- 146
	}) -- 146
	_base_0.__class = _class_0 -- 146
	if _parent_0.__inherited then -- 146
		_parent_0.__inherited(_parent_0, _class_0) -- 146
	end -- 146
	Reload_Shell = _class_0 -- 146
end -- 147
local Candlewood_Fire -- 149
do -- 149
	local _class_0 -- 149
	local _parent_0 = SOUND -- 149
	local _base_0 = { -- 149
		sound = "tekka/weapons/weapon_warhammer.wav", -- 151
		chan = CHAN_WEAPON -- 149
	} -- 149
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 151
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 149
			_base_0[_key_0] = _val_0 -- 149
		end -- 149
	end -- 151
	if _base_0.__index == nil then -- 149
		_base_0.__index = _base_0 -- 149
	end -- 151
	setmetatable(_base_0, _parent_0.__base) -- 149
	_class_0 = setmetatable({ -- 149
		__init = function(self, ...) -- 149
			return _class_0.__parent.__init(self, ...) -- 149
		end, -- 149
		__base = _base_0, -- 149
		__name = "Candlewood_Fire", -- 149
		__parent = _parent_0 -- 149
	}, { -- 149
		__index = function(cls, name) -- 149
			local val = rawget(_base_0, name) -- 149
			if val == nil then -- 149
				local parent = rawget(cls, "__parent") -- 149
				if parent then -- 149
					return parent[name] -- 149
				end -- 149
			else -- 149
				return val -- 149
			end -- 149
		end, -- 149
		__call = function(cls, ...) -- 149
			local _self_0 = setmetatable({ }, _base_0) -- 149
			cls.__init(_self_0, ...) -- 149
			return _self_0 -- 149
		end -- 149
	}) -- 149
	_base_0.__class = _class_0 -- 149
	if _parent_0.__inherited then -- 149
		_parent_0.__inherited(_parent_0, _class_0) -- 149
	end -- 149
	Candlewood_Fire = _class_0 -- 149
end -- 151
local Candlewood -- 153
do -- 153
	local _class_0 -- 153
	local _parent_0 = EvilRP_Weapon -- 153
	local _base_0 = { -- 153
		PrintName = "Candlewood", -- 155
		Description = "An unwieldy pump-action shotgun.\nRust is eating it alive.", -- 157
		Slot = 1, -- 159
		Price = 2400, -- 161
		Spawnable = true, -- 163
		UseHands = true, -- 164
		ViewModelTargetFOV = 54, -- 165
		ViewModel = Model("models/tnb/weapons/c_mossberg.mdl"), -- 166
		WorldModel = Model("models/tnb/weapons/w_mossberg.mdl"), -- 168
		HoldType = "shotgun", -- 169
		LowerHoldType = "passive", -- 171
		Firemode = 0, -- 172
		Primary = { -- 173
			Ammo = "Buckshot", -- 173
			ClipSize = 5, -- 175
			DefaultClip = 10, -- 176
			Damage = 15, -- 178
			PumpAction = false, -- 179
			Pump = { -- 182
				Delay = 0.4, -- 182
				Sound = "weapons/shotgun/shotgun_cock.wav", -- 183
				FromEmpty = true -- 184
			}, -- 181
			Count = 7, -- 186
			Delay = -1, -- 187
			Range = 400, -- 189
			Accuracy = 12, -- 190
			RangeModifier = 0.7, -- 192
			Recoil = { -- 195
				MinAng = Angle(10, -2, 0), -- 195
				MaxAng = Angle(14, 2, 0), -- 196
				Punch = 0.9, -- 197
				Ratio = 0.8 -- 198
			}, -- 194
			Reload = { -- 202
				Amount = 1, -- 202
				Sound = "Reload_Shell", -- 203
				Shotgun = true -- 204
			}, -- 201
			Sound = "Candlewood_Fire", -- 207
			TracerName = "Tracer" -- 208
		} -- 153
	} -- 153
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 209
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 153
			_base_0[_key_0] = _val_0 -- 153
		end -- 153
	end -- 209
	if _base_0.__index == nil then -- 153
		_base_0.__index = _base_0 -- 153
	end -- 209
	setmetatable(_base_0, _parent_0.__base) -- 153
	_class_0 = setmetatable({ -- 153
		__init = function(self, ...) -- 153
			return _class_0.__parent.__init(self, ...) -- 153
		end, -- 153
		__base = _base_0, -- 153
		__name = "Candlewood", -- 153
		__parent = _parent_0 -- 153
	}, { -- 153
		__index = function(cls, name) -- 153
			local val = rawget(_base_0, name) -- 153
			if val == nil then -- 153
				local parent = rawget(cls, "__parent") -- 153
				if parent then -- 153
					return parent[name] -- 153
				end -- 153
			else -- 153
				return val -- 153
			end -- 153
		end, -- 153
		__call = function(cls, ...) -- 153
			local _self_0 = setmetatable({ }, _base_0) -- 153
			cls.__init(_self_0, ...) -- 153
			return _self_0 -- 153
		end -- 153
	}) -- 153
	_base_0.__class = _class_0 -- 153
	if _parent_0.__inherited then -- 153
		_parent_0.__inherited(_parent_0, _class_0) -- 153
	end -- 153
	Candlewood = _class_0 -- 153
end -- 209
local Enforcer -- 211
do -- 211
	local _class_0 -- 211
	local _parent_0 = EvilRP_Weapon -- 211
	local _base_0 = { -- 211
		PrintName = "Enforcer", -- 213
		Description = "They used to hunt people with these.", -- 215
		Slot = 2, -- 217
		Spawnable = true, -- 219
		Price = 2900, -- 221
		UseHands = true, -- 222
		ViewModelTargetFOV = 54, -- 223
		ViewModel = Model("models/tnb/weapons/c_k98.mdl"), -- 224
		WorldModel = Model("models/tnb/weapons/w_k98.mdl"), -- 226
		HoldType = "ar2", -- 227
		LowerHoldType = "passive", -- 229
		Firemode = 0, -- 230
		Primary = { -- 231
			Ammo = "AR2", -- 231
			ClipSize = 6, -- 233
			DefaultClip = 12, -- 234
			Damage = 50, -- 236
			Delay = 1.25, -- 237
			Range = 2000, -- 239
			Accuracy = 5, -- 240
			RangeModifier = 0.95, -- 242
			Recoil = { -- 245
				MinAng = Angle(14.6, -2.7, 0), -- 245
				MaxAng = Angle(17, 2.7, 0), -- 246
				Punch = 0.9, -- 247
				Ratio = 0.2 -- 248
			}, -- 244
			Reload = { -- 252
				Sound = "Weapon_SMG1.Reload", -- 252
				Amount = 6, -- 253
				Shotgun = true, -- 254
				DontFinishPump = true -- 255
			}, -- 251
			Sound = "placenta/weapons/enforcer.wav", -- 258
			TracerName = "Tracer" -- 259
		} -- 211
	} -- 211
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 260
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 211
			_base_0[_key_0] = _val_0 -- 211
		end -- 211
	end -- 260
	if _base_0.__index == nil then -- 211
		_base_0.__index = _base_0 -- 211
	end -- 260
	setmetatable(_base_0, _parent_0.__base) -- 211
	_class_0 = setmetatable({ -- 211
		__init = function(self, ...) -- 211
			return _class_0.__parent.__init(self, ...) -- 211
		end, -- 211
		__base = _base_0, -- 211
		__name = "Enforcer", -- 211
		__parent = _parent_0 -- 211
	}, { -- 211
		__index = function(cls, name) -- 211
			local val = rawget(_base_0, name) -- 211
			if val == nil then -- 211
				local parent = rawget(cls, "__parent") -- 211
				if parent then -- 211
					return parent[name] -- 211
				end -- 211
			else -- 211
				return val -- 211
			end -- 211
		end, -- 211
		__call = function(cls, ...) -- 211
			local _self_0 = setmetatable({ }, _base_0) -- 211
			cls.__init(_self_0, ...) -- 211
			return _self_0 -- 211
		end -- 211
	}) -- 211
	_base_0.__class = _class_0 -- 211
	if _parent_0.__inherited then -- 211
		_parent_0.__inherited(_parent_0, _class_0) -- 211
	end -- 211
	Enforcer = _class_0 -- 211
end -- 260
local Greaser -- 262
do -- 262
	local _class_0 -- 262
	local _parent_0 = EvilRP_Weapon -- 262
	local _base_0 = { -- 262
		PrintName = "Greaser", -- 264
		Description = "A shitty, greasy submachine gun.", -- 266
		Slot = 3, -- 268
		Spawnable = true, -- 270
		UseHands = true, -- 271
		ViewModelTargetFOV = 54, -- 272
		ViewModel = Model("models/tnb/weapons/c_tec9.mdl"), -- 273
		WorldModel = Model("models/tnb/weapons/w_tec9.mdl"), -- 275
		HoldType = "pistol", -- 276
		LowerHoldType = "normal", -- 278
		Firemode = 5, -- 279
		Primary = { -- 280
			Ammo = "SMG1", -- 280
			ClipSize = 16, -- 282
			DefaultClip = 32, -- 283
			Damage = 32, -- 285
			Delay = 60 / 340, -- 286
			Range = 400, -- 288
			Accuracy = 12, -- 289
			RangeModifier = 0.75, -- 291
			Recoil = { -- 294
				MinAng = Angle(3, -0.8, 0), -- 294
				MaxAng = Angle(4, 0.8, 0), -- 295
				Punch = 0.6, -- 296
				Ratio = 0.8 -- 297
			}, -- 293
			Reload = { -- 301
				Sound = "Weapon_Pistol.Reload" -- 301
			}, -- 300
			Sound = "tekka/weapons/weapon_mg.wav", -- 304
			TracerName = "Tracer" -- 305
		} -- 262
	} -- 262
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 306
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 262
			_base_0[_key_0] = _val_0 -- 262
		end -- 262
	end -- 306
	if _base_0.__index == nil then -- 262
		_base_0.__index = _base_0 -- 262
	end -- 306
	setmetatable(_base_0, _parent_0.__base) -- 262
	_class_0 = setmetatable({ -- 262
		__init = function(self, ...) -- 262
			return _class_0.__parent.__init(self, ...) -- 262
		end, -- 262
		__base = _base_0, -- 262
		__name = "Greaser", -- 262
		__parent = _parent_0 -- 262
	}, { -- 262
		__index = function(cls, name) -- 262
			local val = rawget(_base_0, name) -- 262
			if val == nil then -- 262
				local parent = rawget(cls, "__parent") -- 262
				if parent then -- 262
					return parent[name] -- 262
				end -- 262
			else -- 262
				return val -- 262
			end -- 262
		end, -- 262
		__call = function(cls, ...) -- 262
			local _self_0 = setmetatable({ }, _base_0) -- 262
			cls.__init(_self_0, ...) -- 262
			return _self_0 -- 262
		end -- 262
	}) -- 262
	_base_0.__class = _class_0 -- 262
	if _parent_0.__inherited then -- 262
		_parent_0.__inherited(_parent_0, _class_0) -- 262
	end -- 262
	Greaser = _class_0 -- 262
end -- 306
local Novoluger -- 308
do -- 308
	local _class_0 -- 308
	local _parent_0 = EvilRP_Weapon -- 308
	local _base_0 = { -- 308
		PrintName = "Novoluger", -- 310
		Description = "A well-made, well-kept pistol. It's associated with the great.", -- 312
		Slot = 1, -- 314
		Spawnable = true, -- 316
		UseHands = true, -- 317
		ViewModelTargetFOV = 54, -- 318
		ViewModel = Model("models/tnb/weapons/c_luger.mdl"), -- 319
		WorldModel = Model("models/tnb/weapons/w_luger.mdl"), -- 321
		HoldType = "pistol", -- 322
		LowerHoldType = "normal", -- 324
		Firemode = 0, -- 325
		Primary = { -- 326
			Ammo = "Pistol", -- 326
			ClipSize = 8, -- 328
			DefaultClip = 24, -- 329
			Damage = 40, -- 331
			Delay = 60 / 200, -- 332
			Range = 750, -- 334
			Accuracy = 12, -- 335
			RangeModifier = 0.85, -- 337
			Recoil = { -- 340
				MinAng = Angle(5, -0.5, 0), -- 340
				MaxAng = Angle(6.5, 0.5, 0), -- 341
				Punch = 0.8, -- 342
				Ratio = 0.6 -- 343
			}, -- 339
			Reload = { -- 347
				Sound = "Weapon_Pistol.Reload" -- 347
			}, -- 346
			Sound = "tekka/weapons/weapon_pistolcrack.wav", -- 350
			TracerName = "Tracer" -- 351
		} -- 308
	} -- 308
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 352
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 308
			_base_0[_key_0] = _val_0 -- 308
		end -- 308
	end -- 352
	if _base_0.__index == nil then -- 308
		_base_0.__index = _base_0 -- 308
	end -- 352
	setmetatable(_base_0, _parent_0.__base) -- 308
	_class_0 = setmetatable({ -- 308
		__init = function(self, ...) -- 308
			return _class_0.__parent.__init(self, ...) -- 308
		end, -- 308
		__base = _base_0, -- 308
		__name = "Novoluger", -- 308
		__parent = _parent_0 -- 308
	}, { -- 308
		__index = function(cls, name) -- 308
			local val = rawget(_base_0, name) -- 308
			if val == nil then -- 308
				local parent = rawget(cls, "__parent") -- 308
				if parent then -- 308
					return parent[name] -- 308
				end -- 308
			else -- 308
				return val -- 308
			end -- 308
		end, -- 308
		__call = function(cls, ...) -- 308
			local _self_0 = setmetatable({ }, _base_0) -- 308
			cls.__init(_self_0, ...) -- 308
			return _self_0 -- 308
		end -- 308
	}) -- 308
	_base_0.__class = _class_0 -- 308
	if _parent_0.__inherited then -- 308
		_parent_0.__inherited(_parent_0, _class_0) -- 308
	end -- 308
	Novoluger = _class_0 -- 308
end -- 352
local Obrez -- 354
do -- 354
	local _class_0 -- 354
	local _parent_0 = EvilRP_Weapon -- 354
	local _base_0 = { -- 354
		PrintName = "Obrez", -- 356
		Description = "A mutilated rifle, ruined and barely functional.", -- 358
		Slot = 2, -- 360
		Price = 1000, -- 362
		Spawnable = true, -- 364
		UseHands = true, -- 365
		ViewModelTargetFOV = 54, -- 366
		ViewModel = Model("models/tnb/weapons/c_obrez.mdl"), -- 367
		WorldModel = Model("models/tnb/weapons/w_obrez.mdl"), -- 369
		HoldType = "ar2", -- 370
		LowerHoldType = "passive", -- 372
		Firemode = 0, -- 373
		Primary = { -- 374
			Ammo = "AR2", -- 374
			ClipSize = 5, -- 376
			DefaultClip = 15, -- 377
			Damage = 40, -- 379
			Delay = 1.25, -- 380
			Range = 300, -- 382
			Accuracy = 8, -- 383
			RangeModifier = 0.95, -- 385
			Recoil = { -- 388
				MinAng = Angle(15 - 6.2, 0), -- 388
				MaxAng = Angle(20, 6.2, 0), -- 389
				Punch = 0.95, -- 390
				Ratio = 0.2 -- 391
			}, -- 387
			Reload = { -- 395
				Sound = "Weapon_SMG1.Reload" -- 395
			}, -- 394
			Sound = "tekka/weapons/weapon_western.wav", -- 398
			TracerName = "Tracer" -- 399
		} -- 354
	} -- 354
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 400
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 354
			_base_0[_key_0] = _val_0 -- 354
		end -- 354
	end -- 400
	if _base_0.__index == nil then -- 354
		_base_0.__index = _base_0 -- 354
	end -- 400
	setmetatable(_base_0, _parent_0.__base) -- 354
	_class_0 = setmetatable({ -- 354
		__init = function(self, ...) -- 354
			return _class_0.__parent.__init(self, ...) -- 354
		end, -- 354
		__base = _base_0, -- 354
		__name = "Obrez", -- 354
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
	Obrez = _class_0 -- 354
end -- 400
local Owler -- 402
do -- 402
	local _class_0 -- 402
	local _parent_0 = EvilRP_Weapon -- 402
	local _base_0 = { -- 402
		PrintName = "Owler", -- 404
		Description = "They all hate you.", -- 406
		Slot = 2, -- 408
		Spawnable = true, -- 410
		UseHands = true, -- 411
		ViewModelTargetFOV = 54, -- 412
		ViewModel = Model("models/weapons/c_owler.mdl"), -- 413
		WorldModel = Model("models/weapons/w_owler.mdl"), -- 415
		HoldType = "pistol", -- 416
		LowerHoldType = "normal", -- 418
		Firemode = -1, -- 419
		Primary = { -- 420
			Ammo = "SMG1", -- 420
			ClipSize = 15, -- 422
			DefaultClip = 40, -- 423
			Damage = 10, -- 425
			Delay = 60 / 1000, -- 426
			Range = 200, -- 428
			Accuracy = 24, -- 429
			RangeModifier = 0.55, -- 431
			Recoil = { -- 434
				MinAng = Angle(2.3, -0.5, 0), -- 434
				MaxAng = Angle(-1.3, 0.5, 0), -- 435
				Punch = 0.6, -- 436
				Ratio = 0.8 -- 437
			}, -- 433
			Reload = { -- 441
				Sound = "Weapon_Pistol.Reload" -- 441
			}, -- 440
			Sound = "tekka/weapons/weapon_mp40.wav", -- 444
			TracerName = "Tracer" -- 445
		} -- 402
	} -- 402
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 446
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 402
			_base_0[_key_0] = _val_0 -- 402
		end -- 402
	end -- 446
	if _base_0.__index == nil then -- 402
		_base_0.__index = _base_0 -- 402
	end -- 446
	setmetatable(_base_0, _parent_0.__base) -- 402
	_class_0 = setmetatable({ -- 402
		__init = function(self, ...) -- 402
			return _class_0.__parent.__init(self, ...) -- 402
		end, -- 402
		__base = _base_0, -- 402
		__name = "Owler", -- 402
		__parent = _parent_0 -- 402
	}, { -- 402
		__index = function(cls, name) -- 402
			local val = rawget(_base_0, name) -- 402
			if val == nil then -- 402
				local parent = rawget(cls, "__parent") -- 402
				if parent then -- 402
					return parent[name] -- 402
				end -- 402
			else -- 402
				return val -- 402
			end -- 402
		end, -- 402
		__call = function(cls, ...) -- 402
			local _self_0 = setmetatable({ }, _base_0) -- 402
			cls.__init(_self_0, ...) -- 402
			return _self_0 -- 402
		end -- 402
	}) -- 402
	_base_0.__class = _class_0 -- 402
	if _parent_0.__inherited then -- 402
		_parent_0.__inherited(_parent_0, _class_0) -- 402
	end -- 402
	Owler = _class_0 -- 402
end -- 446
local Pacifier -- 448
do -- 448
	local _class_0 -- 448
	local _parent_0 = EvilRP_Weapon -- 448
	local _base_0 = { -- 448
		PrintName = "Pacifier", -- 450
		Description = "The favourite pistol of the quartermaster.", -- 452
		Slot = 1, -- 454
		Spawnable = true, -- 457
		Price = 1750, -- 459
		UseHands = true, -- 460
		ViewModelTargetFOV = 54, -- 461
		ViewModel = Model("models/tnb/weapons/c_m9.mdl"), -- 462
		WorldModel = Model("models/tnb/weapons/w_m9.mdl"), -- 464
		HoldType = "pistol", -- 465
		LowerHoldType = "normal", -- 467
		Firemode = 0, -- 468
		Primary = { -- 469
			Ammo = "Pistol", -- 469
			ClipSize = 15, -- 471
			DefaultClip = 30, -- 472
			Damage = 32, -- 474
			Delay = 60 / 400, -- 475
			Range = 750, -- 477
			Accuracy = 12, -- 478
			RangeModifier = 0.85, -- 480
			Recoil = { -- 483
				MinAng = Angle(6.4, -0.3, 0), -- 483
				MaxAng = Angle(8, 0.3, 0), -- 484
				Punch = 0.8, -- 485
				Ratio = 0.6 -- 486
			}, -- 482
			Reload = { -- 490
				Sound = "Weapon_Pistol.Reload" -- 490
			}, -- 489
			Sound = "tekka/weapons/weapon_socom.wav", -- 493
			TracerName = "Tracer", -- 494
			AltFire = function(self) -- 496
				self.Primary.Automatic = false -- 497
				self:SetFiremode((self:GetFiremode() == 0) and 3 or 0) -- 498
				return self:EmitSound("Weapon_SMG1.Special1") -- 499
			end -- 496
		} -- 448
	} -- 448
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 500
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 448
			_base_0[_key_0] = _val_0 -- 448
		end -- 448
	end -- 500
	if _base_0.__index == nil then -- 448
		_base_0.__index = _base_0 -- 448
	end -- 500
	setmetatable(_base_0, _parent_0.__base) -- 448
	_class_0 = setmetatable({ -- 448
		__init = function(self, ...) -- 448
			return _class_0.__parent.__init(self, ...) -- 448
		end, -- 448
		__base = _base_0, -- 448
		__name = "Pacifier", -- 448
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
	Pacifier = _class_0 -- 448
end -- 500
local Painkiller -- 502
do -- 502
	local _class_0 -- 502
	local _parent_0 = EvilRP_Weapon -- 502
	local _base_0 = { -- 502
		PrintName = "Painkiller", -- 504
		Description = "The dead feel no pain.", -- 506
		Slot = 1, -- 508
		Spawnable = true, -- 510
		Price = 2500, -- 512
		UseHands = true, -- 513
		ViewModelTargetFOV = 54, -- 514
		ViewModel = Model("models/tnb/weapons/c_magnum.mdl"), -- 515
		WorldModel = Model("models/tnb/weapons/w_magnum.mdl"), -- 517
		HoldType = "pistol", -- 518
		LowerHoldType = "normal", -- 520
		Firemode = 0, -- 521
		Primary = { -- 522
			Ammo = "Pistol", -- 522
			ClipSize = 5, -- 524
			DefaultClip = 10, -- 525
			Damage = 45, -- 527
			Delay = 60 / 80, -- 528
			Range = 1200, -- 530
			Accuracy = 12, -- 531
			RangeModifier = 0.90, -- 533
			Recoil = { -- 536
				MinAng = Angle(8.2, -1.6, 0), -- 536
				MaxAng = Angle(11.2, 1.6, 0), -- 537
				Punch = 0.9, -- 538
				Ratio = 0.1 -- 539
			}, -- 535
			Reload = { -- 543
				Sound = "Weapon_Pistol.Reload" -- 543
			}, -- 542
			Sound = "tekka/weapons/weapon_50cal.wav", -- 546
			TracerName = "Tracer" -- 547
		} -- 502
	} -- 502
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 549
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 502
			_base_0[_key_0] = _val_0 -- 502
		end -- 502
	end -- 549
	if _base_0.__index == nil then -- 502
		_base_0.__index = _base_0 -- 502
	end -- 549
	setmetatable(_base_0, _parent_0.__base) -- 502
	_class_0 = setmetatable({ -- 502
		__init = function(self, ...) -- 502
			return _class_0.__parent.__init(self, ...) -- 502
		end, -- 502
		__base = _base_0, -- 502
		__name = "Painkiller", -- 502
		__parent = _parent_0 -- 502
	}, { -- 502
		__index = function(cls, name) -- 502
			local val = rawget(_base_0, name) -- 502
			if val == nil then -- 502
				local parent = rawget(cls, "__parent") -- 502
				if parent then -- 502
					return parent[name] -- 502
				end -- 502
			else -- 502
				return val -- 502
			end -- 502
		end, -- 502
		__call = function(cls, ...) -- 502
			local _self_0 = setmetatable({ }, _base_0) -- 502
			cls.__init(_self_0, ...) -- 502
			return _self_0 -- 502
		end -- 502
	}) -- 502
	_base_0.__class = _class_0 -- 502
	if _parent_0.__inherited then -- 502
		_parent_0.__inherited(_parent_0, _class_0) -- 502
	end -- 502
	Painkiller = _class_0 -- 502
end -- 549
local Prettyboy -- 551
do -- 551
	local _class_0 -- 551
	local _parent_0 = EvilRP_Weapon -- 551
	local _base_0 = { -- 551
		PrintName = "Pretty Boy", -- 553
		Description = "It's named after its most common users.", -- 555
		Slot = 1, -- 557
		Spawnable = true, -- 559
		UseHands = true, -- 560
		ViewModelTargetFOV = 54, -- 561
		ViewModel = Model("models/weapons/c_prettyboy.mdl"), -- 562
		WorldModel = Model("models/weapons/w_prettyboy.mdl"), -- 564
		HoldType = "pistol", -- 565
		LowerHoldType = "normal", -- 567
		Firemode = 0, -- 568
		Primary = { -- 569
			Ammo = "Pistol", -- 569
			ClipSize = 7, -- 571
			DefaultClip = 14, -- 572
			Damage = 30, -- 574
			Delay = 60 / 400, -- 575
			Range = 1000, -- 577
			Accuracy = 12, -- 578
			RangeModifier = 0.85, -- 580
			Recoil = { -- 583
				MinAng = Angle(2, -0.1, 0), -- 583
				MaxAng = Angle(4, 0.1, 0), -- 584
				Punch = 0.6, -- 585
				Ratio = 0.8 -- 586
			}, -- 582
			Reload = { -- 590
				Sound = "Weapon_Pistol.Reload" -- 590
			}, -- 589
			Sound = "tekka/weapons/weapon_pistolsmall.wav", -- 593
			TracerName = "Tracer" -- 594
		} -- 551
	} -- 551
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 596
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 551
			_base_0[_key_0] = _val_0 -- 551
		end -- 551
	end -- 596
	if _base_0.__index == nil then -- 551
		_base_0.__index = _base_0 -- 551
	end -- 596
	setmetatable(_base_0, _parent_0.__base) -- 551
	_class_0 = setmetatable({ -- 551
		__init = function(self, ...) -- 551
			return _class_0.__parent.__init(self, ...) -- 551
		end, -- 551
		__base = _base_0, -- 551
		__name = "Prettyboy", -- 551
		__parent = _parent_0 -- 551
	}, { -- 551
		__index = function(cls, name) -- 551
			local val = rawget(_base_0, name) -- 551
			if val == nil then -- 551
				local parent = rawget(cls, "__parent") -- 551
				if parent then -- 551
					return parent[name] -- 551
				end -- 551
			else -- 551
				return val -- 551
			end -- 551
		end, -- 551
		__call = function(cls, ...) -- 551
			local _self_0 = setmetatable({ }, _base_0) -- 551
			cls.__init(_self_0, ...) -- 551
			return _self_0 -- 551
		end -- 551
	}) -- 551
	_base_0.__class = _class_0 -- 551
	if _parent_0.__inherited then -- 551
		_parent_0.__inherited(_parent_0, _class_0) -- 551
	end -- 551
	Prettyboy = _class_0 -- 551
end -- 596
local Subjugator -- 598
do -- 598
	local _class_0 -- 598
	local _parent_0 = EvilRP_Weapon -- 598
	local _base_0 = { -- 598
		PrintName = "Subjugator", -- 600
		Description = "It'll subjugate the living and the dead.", -- 602
		Slot = 2, -- 604
		Spawnable = true, -- 606
		Price = 3600, -- 608
		UseHands = true, -- 609
		ViewModelTargetFOV = 54, -- 610
		ViewModel = Model("models/weapons/c_subjugator.mdl"), -- 611
		WorldModel = Model("models/weapons/w_subjugator.mdl"), -- 613
		HoldType = "ar2", -- 614
		LowerHoldType = "passive", -- 616
		Firemode = -1, -- 617
		Primary = { -- 618
			Ammo = "AR2", -- 618
			ClipSize = 8, -- 620
			DefaultClip = 16, -- 621
			Damage = 65, -- 623
			Delay = 1, -- 624
			Range = 1500, -- 626
			Accuracy = 4, -- 627
			RangeModifier = 0.99, -- 629
			Recoil = { -- 632
				MinAng = Angle(10, -0.9, 0), -- 632
				MaxAng = Angle(14, 0.9, 0), -- 633
				Punch = 0.9, -- 634
				Ratio = 0.2 -- 635
			}, -- 631
			Reload = { -- 639
				Sound = "Weapon_Pistol.Reload" -- 639
			}, -- 638
			Sound = "tekka/weapons/weapon_mossberg.wav", -- 642
			TracerName = "Tracer" -- 643
		} -- 598
	} -- 598
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 645
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 598
			_base_0[_key_0] = _val_0 -- 598
		end -- 598
	end -- 645
	if _base_0.__index == nil then -- 598
		_base_0.__index = _base_0 -- 598
	end -- 645
	setmetatable(_base_0, _parent_0.__base) -- 598
	_class_0 = setmetatable({ -- 598
		__init = function(self, ...) -- 598
			return _class_0.__parent.__init(self, ...) -- 598
		end, -- 598
		__base = _base_0, -- 598
		__name = "Subjugator", -- 598
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
	Subjugator = _class_0 -- 598
end -- 645
local Trooper -- 647
do -- 647
	local _class_0 -- 647
	local _parent_0 = EvilRP_Weapon -- 647
	local _base_0 = { -- 647
		PrintName = "Trooper", -- 649
		Description = "A fully automatic instrument of death.\nRespect it, or else.", -- 651
		Slot = 2, -- 653
		Price = 6000, -- 655
		Spawnable = true, -- 657
		UseHands = true, -- 658
		ViewModelTargetFOV = 54, -- 659
		ViewModel = Model("models/tnb/weapons/c_g3.mdl"), -- 660
		WorldModel = Model("models/tnb/weapons/w_g3.mdl"), -- 662
		HoldType = "ar2", -- 663
		LowerHoldType = "passive", -- 665
		Firemode = -1, -- 666
		Primary = { -- 667
			Ammo = "AR2", -- 667
			ClipSize = 20, -- 669
			DefaultClip = 40, -- 670
			Damage = 65, -- 672
			Delay = 60 / 400, -- 673
			Range = 1300, -- 675
			Accuracy = 4, -- 676
			RangeModifier = 0.99, -- 678
			Recoil = { -- 681
				MinAng = Angle(3.8, -0.9, 0), -- 681
				MaxAng = Angle(4.8, 0.9, 0), -- 682
				Punch = 0.8, -- 683
				Ratio = 0.5 -- 684
			}, -- 680
			Reload = { -- 688
				Sound = "Weapon_Pistol.Reload" -- 688
			}, -- 687
			Sound = "tekka/weapons/weapon_thud.wav", -- 691
			TracerName = "Tracer" -- 692
		} -- 647
	} -- 647
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 694
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 647
			_base_0[_key_0] = _val_0 -- 647
		end -- 647
	end -- 694
	if _base_0.__index == nil then -- 647
		_base_0.__index = _base_0 -- 647
	end -- 694
	setmetatable(_base_0, _parent_0.__base) -- 647
	_class_0 = setmetatable({ -- 647
		__init = function(self, ...) -- 647
			return _class_0.__parent.__init(self, ...) -- 647
		end, -- 647
		__base = _base_0, -- 647
		__name = "Trooper", -- 647
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
	Trooper = _class_0 -- 647
end -- 694
local Mark -- 696
do -- 696
	local _class_0 -- 696
	local _parent_0 = EvilRP_Weapon -- 696
	local _base_0 = { -- 696
		PrintName = "The Mark", -- 698
		Description = "A rusty scrap pistol, rigged to fire one massive bullet.", -- 700
		Price = 400, -- 702
		Slot = 1, -- 704
		Spawnable = true, -- 706
		UseHands = true, -- 707
		ViewModelTargetFOV = 54, -- 708
		ViewModel = Model("models/weapons/c_mark.mdl"), -- 709
		WorldModel = Model("models/weapons/w_mark.mdl"), -- 711
		HoldType = "pistol", -- 712
		LowerHoldType = "passive", -- 714
		Firemode = 1, -- 715
		Primary = { -- 716
			Ammo = "Pistol", -- 716
			ClipSize = 1, -- 718
			DefaultClip = 1, -- 719
			Damage = 80, -- 721
			Delay = 60 / 120, -- 722
			Range = 200, -- 724
			Accuracy = 12, -- 725
			RangeModifier = 0.4, -- 727
			Recoil = { -- 730
				MinAng = Angle(11, -3, 0), -- 730
				MaxAng = Angle(15, 3, 0), -- 731
				Punch = 0.95, -- 732
				Ratio = 0.3 -- 733
			}, -- 729
			Reload = { -- 737
				Sound = "Weapon_Pistol.Reload" -- 737
			}, -- 736
			Sound = "tekka/weapons/weapon_smg3.wav", -- 740
			TracerName = "Tracer" -- 741
		} -- 696
	} -- 696
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 743
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 696
			_base_0[_key_0] = _val_0 -- 696
		end -- 696
	end -- 743
	if _base_0.__index == nil then -- 696
		_base_0.__index = _base_0 -- 696
	end -- 743
	setmetatable(_base_0, _parent_0.__base) -- 696
	_class_0 = setmetatable({ -- 696
		__init = function(self, ...) -- 696
			return _class_0.__parent.__init(self, ...) -- 696
		end, -- 696
		__base = _base_0, -- 696
		__name = "Mark", -- 696
		__parent = _parent_0 -- 696
	}, { -- 696
		__index = function(cls, name) -- 696
			local val = rawget(_base_0, name) -- 696
			if val == nil then -- 696
				local parent = rawget(cls, "__parent") -- 696
				if parent then -- 696
					return parent[name] -- 696
				end -- 696
			else -- 696
				return val -- 696
			end -- 696
		end, -- 696
		__call = function(cls, ...) -- 696
			local _self_0 = setmetatable({ }, _base_0) -- 696
			cls.__init(_self_0, ...) -- 696
			return _self_0 -- 696
		end -- 696
	}) -- 696
	_base_0.__class = _class_0 -- 696
	if _parent_0.__inherited then -- 696
		_parent_0.__inherited(_parent_0, _class_0) -- 696
	end -- 696
	Mark = _class_0 -- 696
end -- 743
local Hope -- 746
do -- 746
	local _class_0 -- 746
	local _parent_0 = EvilRP_Weapon -- 746
	local _base_0 = { -- 746
		PrintName = "Hope", -- 748
		Description = "The standard issue Dragoon firearm, some say it speaks to them.", -- 750
		Slot = 1, -- 752
		Price = 1500, -- 754
		Spawnable = true, -- 756
		UseHands = true, -- 757
		ViewModelTargetFOV = 54, -- 758
		ViewModel = Model("models/tnb/weapons/c_1911.mdl"), -- 759
		WorldModel = Model("models/tnb/weapons/w_1911.mdl"), -- 761
		HoldType = "pistol", -- 762
		LowerHoldType = "normal", -- 764
		Firemode = 0, -- 765
		Primary = { -- 766
			Ammo = "Pistol", -- 766
			ClipSize = 10, -- 768
			DefaultClip = 20, -- 769
			Damage = 35, -- 771
			Delay = 60 / 200, -- 772
			Range = 850, -- 774
			Accuracy = 12, -- 775
			RangeModifier = 0.85, -- 777
			Recoil = { -- 780
				MinAng = Angle(6, -0.5, 0), -- 780
				MaxAng = Angle(7.5, 0.5, 0), -- 781
				Punch = 0.8, -- 782
				Ratio = 0.6 -- 783
			}, -- 779
			Reload = { -- 787
				Sound = "Weapon_Pistol.Reload" -- 787
			}, -- 786
			Sound = "tekka/weapons/weapon_mac10.wav", -- 790
			TracerName = "Tracer" -- 791
		} -- 746
	} -- 746
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 792
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 746
			_base_0[_key_0] = _val_0 -- 746
		end -- 746
	end -- 792
	if _base_0.__index == nil then -- 746
		_base_0.__index = _base_0 -- 746
	end -- 792
	setmetatable(_base_0, _parent_0.__base) -- 746
	_class_0 = setmetatable({ -- 746
		__init = function(self, ...) -- 746
			return _class_0.__parent.__init(self, ...) -- 746
		end, -- 746
		__base = _base_0, -- 746
		__name = "Hope", -- 746
		__parent = _parent_0 -- 746
	}, { -- 746
		__index = function(cls, name) -- 746
			local val = rawget(_base_0, name) -- 746
			if val == nil then -- 746
				local parent = rawget(cls, "__parent") -- 746
				if parent then -- 746
					return parent[name] -- 746
				end -- 746
			else -- 746
				return val -- 746
			end -- 746
		end, -- 746
		__call = function(cls, ...) -- 746
			local _self_0 = setmetatable({ }, _base_0) -- 746
			cls.__init(_self_0, ...) -- 746
			return _self_0 -- 746
		end -- 746
	}) -- 746
	_base_0.__class = _class_0 -- 746
	if _parent_0.__inherited then -- 746
		_parent_0.__inherited(_parent_0, _class_0) -- 746
	end -- 746
	Hope = _class_0 -- 746
end -- 792
local Whisper -- 795
do -- 795
	local _class_0 -- 795
	local _parent_0 = EvilRP_Weapon -- 795
	local _base_0 = { -- 795
		PrintName = "Whisper", -- 797
		Description = "A handmade pistol with a built in suppressor.\n It has earned its name from the gasps of outsiders whispering their final prayers as their carotid arteries were miraculously severed by this sidearm.", -- 799
		Slot = 1, -- 801
		Spawnable = true, -- 803
		UseHands = true, -- 804
		ViewModelTargetFOV = 54, -- 805
		ViewModel = Model("models/tnb/weapons/c_welrod.mdl"), -- 806
		WorldModel = Model("models/tnb/weapons/w_welrod.mdl"), -- 808
		HoldType = "pistol", -- 809
		LowerHoldType = "normal", -- 811
		Firemode = 0, -- 812
		Primary = { -- 813
			Ammo = "Pistol", -- 813
			ClipSize = 3, -- 815
			DefaultClip = 9, -- 816
			Damage = 15, -- 818
			Delay = 60 / 200, -- 819
			Range = 650, -- 821
			Accuracy = 12, -- 822
			RangeModifier = 0.85, -- 824
			Recoil = { -- 827
				MinAng = Angle(7, -0.5, 0), -- 827
				MaxAng = Angle(8.5, 0.5, 0), -- 828
				Punch = 0.8, -- 829
				Ratio = 0.6 -- 830
			}, -- 826
			Reload = { -- 834
				Sound = "Weapon_Pistol.Reload" -- 834
			}, -- 833
			Sound = "tekka/weapons/weapon_silencedthud.wav", -- 837
			TracerName = "Tracer" -- 838
		} -- 795
	} -- 795
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 839
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 795
			_base_0[_key_0] = _val_0 -- 795
		end -- 795
	end -- 839
	if _base_0.__index == nil then -- 795
		_base_0.__index = _base_0 -- 795
	end -- 839
	setmetatable(_base_0, _parent_0.__base) -- 795
	_class_0 = setmetatable({ -- 795
		__init = function(self, ...) -- 795
			return _class_0.__parent.__init(self, ...) -- 795
		end, -- 795
		__base = _base_0, -- 795
		__name = "Whisper", -- 795
		__parent = _parent_0 -- 795
	}, { -- 795
		__index = function(cls, name) -- 795
			local val = rawget(_base_0, name) -- 795
			if val == nil then -- 795
				local parent = rawget(cls, "__parent") -- 795
				if parent then -- 795
					return parent[name] -- 795
				end -- 795
			else -- 795
				return val -- 795
			end -- 795
		end, -- 795
		__call = function(cls, ...) -- 795
			local _self_0 = setmetatable({ }, _base_0) -- 795
			cls.__init(_self_0, ...) -- 795
			return _self_0 -- 795
		end -- 795
	}) -- 795
	_base_0.__class = _class_0 -- 795
	if _parent_0.__inherited then -- 795
		_parent_0.__inherited(_parent_0, _class_0) -- 795
	end -- 795
	Whisper = _class_0 -- 795
end -- 839
local Obliterator -- 841
do -- 841
	local _class_0 -- 841
	local _parent_0 = EvilRP_Weapon -- 841
	local _base_0 = { -- 841
		PrintName = "Obliterator", -- 843
		Description = "A sleek, modern firearm fit for the soldier of the future.", -- 845
		Slot = 2, -- 847
		Price = 5000, -- 848
		Spawnable = true, -- 850
		UseHands = true, -- 851
		ViewModelTargetFOV = 54, -- 852
		ViewModel = Model("models/tnb/weapons/c_bar.mdl"), -- 853
		WorldModel = Model("models/tnb/weapons/w_bar.mdl"), -- 855
		HoldType = "ar2", -- 856
		LowerHoldType = "passive", -- 858
		Firemode = -1, -- 859
		Primary = { -- 860
			Ammo = "AR2", -- 860
			ClipSize = 20, -- 862
			DefaultClip = 40, -- 863
			Damage = 25, -- 865
			Delay = 60 / 345, -- 866
			Range = 900, -- 868
			Accuracy = 2, -- 869
			RangeModifier = 0.99, -- 871
			Recoil = { -- 874
				MinAng = Angle(5.8, -0.9, 0), -- 874
				MaxAng = Angle(6.8, 0.9, 0), -- 875
				Punch = 0.7, -- 876
				Ratio = 0.5 -- 877
			}, -- 873
			Reload = { -- 881
				Sound = "Weapon_Pistol.Reload" -- 881
			}, -- 880
			Sound = "tekka/weapons/weapon_hk416.wav", -- 884
			TracerName = "Tracer" -- 885
		} -- 841
	} -- 841
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 887
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 841
			_base_0[_key_0] = _val_0 -- 841
		end -- 841
	end -- 887
	if _base_0.__index == nil then -- 841
		_base_0.__index = _base_0 -- 841
	end -- 887
	setmetatable(_base_0, _parent_0.__base) -- 841
	_class_0 = setmetatable({ -- 841
		__init = function(self, ...) -- 841
			return _class_0.__parent.__init(self, ...) -- 841
		end, -- 841
		__base = _base_0, -- 841
		__name = "Obliterator", -- 841
		__parent = _parent_0 -- 841
	}, { -- 841
		__index = function(cls, name) -- 841
			local val = rawget(_base_0, name) -- 841
			if val == nil then -- 841
				local parent = rawget(cls, "__parent") -- 841
				if parent then -- 841
					return parent[name] -- 841
				end -- 841
			else -- 841
				return val -- 841
			end -- 841
		end, -- 841
		__call = function(cls, ...) -- 841
			local _self_0 = setmetatable({ }, _base_0) -- 841
			cls.__init(_self_0, ...) -- 841
			return _self_0 -- 841
		end -- 841
	}) -- 841
	_base_0.__class = _class_0 -- 841
	if _parent_0.__inherited then -- 841
		_parent_0.__inherited(_parent_0, _class_0) -- 841
	end -- 841
	Obliterator = _class_0 -- 841
end -- 887
local Viper -- 890
do -- 890
	local _class_0 -- 890
	local _parent_0 = EvilRP_Weapon -- 890
	local _base_0 = { -- 890
		PrintName = "Viper", -- 892
		Description = "An OLD sub-machine gun. It's impossible to find one that was freshly manufactured nowadays.", -- 894
		Slot = 2, -- 896
		Price = 2500, -- 897
		Spawnable = true, -- 899
		UseHands = true, -- 900
		ViewModelTargetFOV = 54, -- 901
		ViewModel = Model("models/tnb/weapons/c_sten.mdl"), -- 902
		WorldModel = Model("models/tnb/weapons/w_sten.mdl"), -- 904
		HoldType = "ar2", -- 905
		LowerHoldType = "passive", -- 907
		Firemode = -1, -- 908
		Primary = { -- 909
			Ammo = "AR2", -- 909
			ClipSize = 25, -- 911
			DefaultClip = 50, -- 912
			Damage = 15, -- 914
			Delay = 60 / 525, -- 915
			Range = 900, -- 917
			Accuracy = 13, -- 918
			RangeModifier = 0.99, -- 920
			Recoil = { -- 923
				MinAng = Angle(5.8, -0.9, 0), -- 923
				MaxAng = Angle(10.8, 0.9, 0), -- 924
				Punch = 0.7, -- 925
				Ratio = 0.5 -- 926
			}, -- 922
			Reload = { -- 930
				Sound = "Weapon_Pistol.Reload" -- 930
			}, -- 929
			Sound = "tekka/weapons/weapon_k98.wav", -- 933
			TracerName = "Tracer" -- 934
		} -- 890
	} -- 890
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 936
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 890
			_base_0[_key_0] = _val_0 -- 890
		end -- 890
	end -- 936
	if _base_0.__index == nil then -- 890
		_base_0.__index = _base_0 -- 890
	end -- 936
	setmetatable(_base_0, _parent_0.__base) -- 890
	_class_0 = setmetatable({ -- 890
		__init = function(self, ...) -- 890
			return _class_0.__parent.__init(self, ...) -- 890
		end, -- 890
		__base = _base_0, -- 890
		__name = "Viper", -- 890
		__parent = _parent_0 -- 890
	}, { -- 890
		__index = function(cls, name) -- 890
			local val = rawget(_base_0, name) -- 890
			if val == nil then -- 890
				local parent = rawget(cls, "__parent") -- 890
				if parent then -- 890
					return parent[name] -- 890
				end -- 890
			else -- 890
				return val -- 890
			end -- 890
		end, -- 890
		__call = function(cls, ...) -- 890
			local _self_0 = setmetatable({ }, _base_0) -- 890
			cls.__init(_self_0, ...) -- 890
			return _self_0 -- 890
		end -- 890
	}) -- 890
	_base_0.__class = _class_0 -- 890
	if _parent_0.__inherited then -- 890
		_parent_0.__inherited(_parent_0, _class_0) -- 890
	end -- 890
	Viper = _class_0 -- 890
end -- 936
local Warrant_Fire -- 938
do -- 938
	local _class_0 -- 938
	local _parent_0 = SOUND -- 938
	local _base_0 = { -- 938
		sound = "tekka/weapons/weapon_shotgun2.wav", -- 940
		chan = CHAN_WEAPON -- 938
	} -- 938
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 940
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 938
			_base_0[_key_0] = _val_0 -- 938
		end -- 938
	end -- 940
	if _base_0.__index == nil then -- 938
		_base_0.__index = _base_0 -- 938
	end -- 940
	setmetatable(_base_0, _parent_0.__base) -- 938
	_class_0 = setmetatable({ -- 938
		__init = function(self, ...) -- 938
			return _class_0.__parent.__init(self, ...) -- 938
		end, -- 938
		__base = _base_0, -- 938
		__name = "Warrant_Fire", -- 938
		__parent = _parent_0 -- 938
	}, { -- 938
		__index = function(cls, name) -- 938
			local val = rawget(_base_0, name) -- 938
			if val == nil then -- 938
				local parent = rawget(cls, "__parent") -- 938
				if parent then -- 938
					return parent[name] -- 938
				end -- 938
			else -- 938
				return val -- 938
			end -- 938
		end, -- 938
		__call = function(cls, ...) -- 938
			local _self_0 = setmetatable({ }, _base_0) -- 938
			cls.__init(_self_0, ...) -- 938
			return _self_0 -- 938
		end -- 938
	}) -- 938
	_base_0.__class = _class_0 -- 938
	if _parent_0.__inherited then -- 938
		_parent_0.__inherited(_parent_0, _class_0) -- 938
	end -- 938
	Warrant_Fire = _class_0 -- 938
end -- 940
local Warrant -- 942
do -- 942
	local _class_0 -- 942
	local _parent_0 = EvilRP_Weapon -- 942
	local _base_0 = { -- 942
		PrintName = "Warrant", -- 944
		Description = "A pocket-sized shotgun with a bad reputation of horribly failing at its sole purpose, close-ranged combat.", -- 946
		Slot = 1, -- 948
		Price = 2600, -- 950
		Spawnable = true, -- 952
		UseHands = true, -- 953
		ViewModelTargetFOV = 54, -- 954
		ViewModel = Model("models/tnb/weapons/c_shorty.mdl"), -- 955
		WorldModel = Model("models/tnb/weapons/w_shorty.mdl"), -- 957
		HoldType = "shotgun", -- 958
		LowerHoldType = "passive", -- 960
		Firemode = 0, -- 961
		Primary = { -- 962
			Ammo = "Buckshot", -- 962
			ClipSize = 3, -- 964
			DefaultClip = 9, -- 965
			Damage = 10, -- 967
			PumpAction = false, -- 968
			Pump = { -- 971
				Delay = 0.6, -- 971
				Sound = "weapons/shotgun/shotgun_cock.wav", -- 972
				FromEmpty = true -- 973
			}, -- 970
			Count = 5, -- 975
			Delay = -1, -- 976
			Range = 400, -- 978
			Accuracy = 16, -- 979
			RangeModifier = 0.7, -- 981
			Recoil = { -- 984
				MinAng = Angle(15, -2, 0), -- 984
				MaxAng = Angle(20, 2, 0), -- 985
				Punch = 0.9, -- 986
				Ratio = 0.8 -- 987
			}, -- 983
			Reload = { -- 991
				Amount = 1, -- 991
				Sound = "Reload_Shell", -- 992
				Shotgun = true -- 993
			}, -- 990
			Sound = "Warrant_Fire", -- 996
			TracerName = "Tracer" -- 997
		} -- 942
	} -- 942
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 998
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 942
			_base_0[_key_0] = _val_0 -- 942
		end -- 942
	end -- 998
	if _base_0.__index == nil then -- 942
		_base_0.__index = _base_0 -- 942
	end -- 998
	setmetatable(_base_0, _parent_0.__base) -- 942
	_class_0 = setmetatable({ -- 942
		__init = function(self, ...) -- 942
			return _class_0.__parent.__init(self, ...) -- 942
		end, -- 942
		__base = _base_0, -- 942
		__name = "Warrant", -- 942
		__parent = _parent_0 -- 942
	}, { -- 942
		__index = function(cls, name) -- 942
			local val = rawget(_base_0, name) -- 942
			if val == nil then -- 942
				local parent = rawget(cls, "__parent") -- 942
				if parent then -- 942
					return parent[name] -- 942
				end -- 942
			else -- 942
				return val -- 942
			end -- 942
		end, -- 942
		__call = function(cls, ...) -- 942
			local _self_0 = setmetatable({ }, _base_0) -- 942
			cls.__init(_self_0, ...) -- 942
			return _self_0 -- 942
		end -- 942
	}) -- 942
	_base_0.__class = _class_0 -- 942
	if _parent_0.__inherited then -- 942
		_parent_0.__inherited(_parent_0, _class_0) -- 942
	end -- 942
	Warrant = _class_0 -- 942
end -- 998
local Knell -- 1001
do -- 1001
	local _class_0 -- 1001
	local _parent_0 = EvilRP_Weapon -- 1001
	local _base_0 = { -- 1001
		PrintName = "Knell", -- 1003
		Description = "A small but reliable revolver, formerly used for executions.", -- 1005
		Slot = 1, -- 1007
		Spawnable = true, -- 1009
		UseHands = true, -- 1010
		ViewModelTargetFOV = 54, -- 1011
		ViewModel = Model("models/tnb/weapons/c_nagant.mdl"), -- 1012
		WorldModel = Model("models/tnb/weapons/w_nagant.mdl"), -- 1014
		HoldType = "revolver", -- 1015
		LowerHoldType = "normal", -- 1017
		Price = 1400, -- 1019
		Firemode = 0, -- 1020
		Primary = { -- 1021
			Ammo = "357", -- 1021
			ClipSize = 8, -- 1023
			DefaultClip = 16, -- 1024
			Damage = 24, -- 1026
			Delay = 60 / 111, -- 1027
			Range = 400, -- 1029
			Accuracy = 11, -- 1030
			RangeModifier = 0.78, -- 1032
			Recoil = { -- 1035
				MinAng = Angle(6.2, -0.3, 0), -- 1035
				MaxAng = Angle(8.2, 0.3, 0), -- 1036
				Punch = 0.9, -- 1037
				Ratio = 0.3 -- 1038
			}, -- 1034
			Reload = { -- 1042
				Sound = "Weapon_357.Reload" -- 1042
			}, -- 1041
			Sound = "tekka/weapons/weapon_m1.wav", -- 1045
			TracerName = "Tracer" -- 1046
		} -- 1001
	} -- 1001
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 1047
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 1001
			_base_0[_key_0] = _val_0 -- 1001
		end -- 1001
	end -- 1047
	if _base_0.__index == nil then -- 1001
		_base_0.__index = _base_0 -- 1001
	end -- 1047
	setmetatable(_base_0, _parent_0.__base) -- 1001
	_class_0 = setmetatable({ -- 1001
		__init = function(self, ...) -- 1001
			return _class_0.__parent.__init(self, ...) -- 1001
		end, -- 1001
		__base = _base_0, -- 1001
		__name = "Knell", -- 1001
		__parent = _parent_0 -- 1001
	}, { -- 1001
		__index = function(cls, name) -- 1001
			local val = rawget(_base_0, name) -- 1001
			if val == nil then -- 1001
				local parent = rawget(cls, "__parent") -- 1001
				if parent then -- 1001
					return parent[name] -- 1001
				end -- 1001
			else -- 1001
				return val -- 1001
			end -- 1001
		end, -- 1001
		__call = function(cls, ...) -- 1001
			local _self_0 = setmetatable({ }, _base_0) -- 1001
			cls.__init(_self_0, ...) -- 1001
			return _self_0 -- 1001
		end -- 1001
	}) -- 1001
	_base_0.__class = _class_0 -- 1001
	if _parent_0.__inherited then -- 1001
		_parent_0.__inherited(_parent_0, _class_0) -- 1001
	end -- 1001
	Knell = _class_0 -- 1001
	return _class_0 -- 1047
end -- 1047
