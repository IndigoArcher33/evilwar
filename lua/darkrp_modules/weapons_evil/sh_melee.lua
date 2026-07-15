-- [yue]: darkrp_modules\weapons_evil\sh_melee.yue
local Crowbar -- 1
do -- 1
	local _class_0 -- 1
	local _parent_0 = EvilRP_Melee -- 1
	local _base_0 = { -- 1
		PrintName = "Crowbar", -- 3
		Description = "Check out the teeth on this thing.\nThey're stronger than yours.", -- 5
		Slot = 0, -- 7
		Price = 150, -- 9
		Spawnable = true, -- 10
		UseHands = true, -- 12
		ViewModelFOV = 54, -- 14
		ViewModel = Model("models/weapons/c_crowbar.mdl"), -- 15
		WorldModel = Model("models/weapons/w_crowbar.mdl"), -- 17
		HoldType = "melee", -- 18
		LowerHoldType = "normal", -- 20
		Primary = { -- 21
			ChargeTime = 0.4, -- 21
			Light = { -- 24
				Damage = 24, -- 24
				DamageType = DMG_CLUB, -- 25
				Range = 75, -- 27
				Delay = 0.4, -- 28
				Act = { -- 30
					ACT_VM_HITCENTER, -- 30
					ACT_VM_MISSCENTER -- 30
				}, -- 30
				Sound = { -- 32
					"Weapon_Crowbar.Melee_Hit", -- 32
					"Weapon_Crowbar.Single" -- 32
				} -- 32
			}, -- 23
			Heavy = { -- 36
				Damage = 40, -- 36
				DamageType = DMG_CLUB, -- 37
				Range = 100, -- 39
				Delay = 1, -- 40
				Act = ACT_VM_MISSCENTER, -- 42
				Sound = { -- 44
					"Weapon_Crowbar.Melee_Hit", -- 44
					"Weapon_Crowbar.Single" -- 44
				} -- 44
			} -- 35
		}, -- 48
		ChargeOffset = { -- 49
			Pos = Vector(-15, 0, -10), -- 49
			Ang = Angle(-35, 0, 0) -- 50
		} -- 1
	} -- 1
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 51
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 1
			_base_0[_key_0] = _val_0 -- 1
		end -- 1
	end -- 51
	if _base_0.__index == nil then -- 1
		_base_0.__index = _base_0 -- 1
	end -- 51
	setmetatable(_base_0, _parent_0.__base) -- 1
	_class_0 = setmetatable({ -- 1
		__init = function(self, ...) -- 1
			return _class_0.__parent.__init(self, ...) -- 1
		end, -- 1
		__base = _base_0, -- 1
		__name = "Crowbar", -- 1
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
	Crowbar = _class_0 -- 1
end -- 51
local Knife -- 53
do -- 53
	local _class_0 -- 53
	local _parent_0 = EvilRP_Melee -- 53
	local _base_0 = { -- 53
		PrintName = "Knife", -- 55
		Description = "Key to the kingdom.", -- 57
		Slot = 0, -- 59
		Price = 200, -- 61
		SkinHarvest = true, -- 63
		Spawnable = true, -- 64
		UseHands = true, -- 66
		ViewModelFOV = 54, -- 68
		ViewModel = Model("models/weapons/cstrike/c_knife_t.mdl"), -- 69
		WorldModel = Model("models/weapons/w_knife_t.mdl"), -- 71
		HoldType = "knife", -- 72
		LowerHoldType = "normal", -- 74
		Primary = { -- 75
			ChargeTime = 0.2, -- 75
			Light = { -- 78
				Damage = 15, -- 78
				DamageType = DMG_SLASH, -- 79
				Range = 75, -- 81
				Delay = 0.2, -- 82
				Act = ACT_VM_MISSCENTER, -- 84
				Sound = { -- 86
					"weapons/knife/knife_hit1.wav", -- 86
					"weapons/knife/knife_slash1.wav" -- 86
				} -- 86
			}, -- 77
			Heavy = { -- 90
				Damage = 30, -- 90
				DamageType = DMG_SLASH, -- 91
				Range = 75, -- 93
				Delay = 0.5, -- 94
				Act = ACT_VM_MISSCENTER, -- 96
				Sound = { -- 98
					"weapons/knife/knife_hit1.wav", -- 98
					"weapons/knife/knife_slash1.wav" -- 98
				} -- 98
			} -- 89
		}, -- 102
		ChargeOffset = { -- 103
			Pos = Vector(0, 0, 0), -- 103
			Ang = Angle(0, -35, 0) -- 104
		} -- 53
	} -- 53
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 105
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 53
			_base_0[_key_0] = _val_0 -- 53
		end -- 53
	end -- 105
	if _base_0.__index == nil then -- 53
		_base_0.__index = _base_0 -- 53
	end -- 105
	setmetatable(_base_0, _parent_0.__base) -- 53
	_class_0 = setmetatable({ -- 53
		__init = function(self, ...) -- 53
			return _class_0.__parent.__init(self, ...) -- 53
		end, -- 53
		__base = _base_0, -- 53
		__name = "Knife", -- 53
		__parent = _parent_0 -- 53
	}, { -- 53
		__index = function(cls, name) -- 53
			local val = rawget(_base_0, name) -- 53
			if val == nil then -- 53
				local parent = rawget(cls, "__parent") -- 53
				if parent then -- 53
					return parent[name] -- 53
				end -- 53
			else -- 53
				return val -- 53
			end -- 53
		end, -- 53
		__call = function(cls, ...) -- 53
			local _self_0 = setmetatable({ }, _base_0) -- 53
			cls.__init(_self_0, ...) -- 53
			return _self_0 -- 53
		end -- 53
	}) -- 53
	_base_0.__class = _class_0 -- 53
	if _parent_0.__inherited then -- 53
		_parent_0.__inherited(_parent_0, _class_0) -- 53
	end -- 53
	Knife = _class_0 -- 53
end -- 105
local Pan -- 107
do -- 107
	local _class_0 -- 107
	local _parent_0 = EvilRP_Melee -- 107
	local _base_0 = { -- 107
		PrintName = "Pan", -- 109
		Description = "They used to cook food in these.\nFeels like you put it to better use.", -- 111
		Slot = 0, -- 113
		Price = 100, -- 115
		Spawnable = true, -- 116
		UseHands = true, -- 118
		ViewModelFOV = 54, -- 120
		ViewModel = Model("models/weapons/hl2meleepack/v_pan.mdl"), -- 121
		WorldModel = Model("models/weapons/hl2meleepack/w_pan.mdl"), -- 123
		HoldType = "melee", -- 124
		LowerHoldType = "normal", -- 126
		Primary = { -- 127
			ChargeTime = 0.4, -- 127
			Light = { -- 130
				Damage = 20, -- 130
				DamageType = DMG_CLUB, -- 131
				Range = 75, -- 133
				Delay = 0.4, -- 134
				Act = { -- 136
					ACT_VM_MISSCENTER, -- 136
					ACT_VM_MISSCENTER -- 136
				}, -- 136
				Sound = { -- 138
					"Weapon_Crowbar.Melee_Hit", -- 138
					"Weapon_Crowbar.Single" -- 138
				} -- 138
			}, -- 129
			Heavy = { -- 142
				Damage = 50, -- 142
				DamageType = DMG_CLUB, -- 143
				Range = 75, -- 145
				Delay = 1, -- 146
				Act = ACT_VM_MISSCENTER, -- 148
				Sound = { -- 150
					"Weapon_Crowbar.Melee_Hit", -- 150
					"Weapon_Crowbar.Single" -- 150
				} -- 150
			} -- 141
		}, -- 154
		ChargeOffset = { -- 155
			Pos = Vector(-15, 0, -10), -- 155
			Ang = Angle(-35, 0, 0) -- 156
		} -- 107
	} -- 107
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 157
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 107
			_base_0[_key_0] = _val_0 -- 107
		end -- 107
	end -- 157
	if _base_0.__index == nil then -- 107
		_base_0.__index = _base_0 -- 107
	end -- 157
	setmetatable(_base_0, _parent_0.__base) -- 107
	_class_0 = setmetatable({ -- 107
		__init = function(self, ...) -- 107
			return _class_0.__parent.__init(self, ...) -- 107
		end, -- 107
		__base = _base_0, -- 107
		__name = "Pan", -- 107
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
	Pan = _class_0 -- 107
end -- 157
local Pickaxe -- 159
do -- 159
	local _class_0 -- 159
	local _parent_0 = EvilRP_Melee -- 159
	local _base_0 = { -- 159
		PrintName = "Pickaxe", -- 161
		Description = "Good against rocks. Also good against skulls.", -- 162
		MineBonus = 2, -- 163
		Slot = 0, -- 165
		Price = 320, -- 167
		Spawnable = true, -- 168
		UseHands = true, -- 170
		ViewModelFOV = 54, -- 172
		ViewModel = Model("models/weapons/hl2meleepack/v_pickaxe.mdl"), -- 173
		WorldModel = Model("models/weapons/hl2meleepack/w_pickaxe.mdl"), -- 175
		HoldType = "melee2", -- 176
		LowerHoldType = "normal", -- 178
		Primary = { -- 179
			ChargeTime = 1, -- 179
			Light = { -- 182
				Damage = 45, -- 182
				DamageType = DMG_CLUB, -- 183
				Range = 80, -- 185
				Delay = 1.2, -- 186
				Act = { -- 188
					ACT_VM_MISSCENTER, -- 188
					ACT_VM_MISSCENTER -- 188
				}, -- 188
				Sound = { -- 190
					"Weapon_Crowbar.Melee_Hit", -- 190
					"Weapon_Crowbar.Single" -- 190
				} -- 190
			}, -- 181
			Heavy = { -- 194
				Damage = 75, -- 194
				DamageType = DMG_CLUB, -- 195
				Range = 75, -- 197
				Delay = 3, -- 198
				Act = ACT_VM_MISSCENTER, -- 200
				Sound = { -- 202
					"Weapon_Crowbar.Melee_Hit", -- 202
					"Weapon_Crowbar.Single" -- 202
				} -- 202
			} -- 193
		}, -- 206
		ChargeOffset = { -- 207
			Pos = Vector(-15, 0, -10), -- 207
			Ang = Angle(-35, 0, 0) -- 208
		} -- 159
	} -- 159
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 209
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 159
			_base_0[_key_0] = _val_0 -- 159
		end -- 159
	end -- 209
	if _base_0.__index == nil then -- 159
		_base_0.__index = _base_0 -- 159
	end -- 209
	setmetatable(_base_0, _parent_0.__base) -- 159
	_class_0 = setmetatable({ -- 159
		__init = function(self, ...) -- 159
			return _class_0.__parent.__init(self, ...) -- 159
		end, -- 159
		__base = _base_0, -- 159
		__name = "Pickaxe", -- 159
		__parent = _parent_0 -- 159
	}, { -- 159
		__index = function(cls, name) -- 159
			local val = rawget(_base_0, name) -- 159
			if val == nil then -- 159
				local parent = rawget(cls, "__parent") -- 159
				if parent then -- 159
					return parent[name] -- 159
				end -- 159
			else -- 159
				return val -- 159
			end -- 159
		end, -- 159
		__call = function(cls, ...) -- 159
			local _self_0 = setmetatable({ }, _base_0) -- 159
			cls.__init(_self_0, ...) -- 159
			return _self_0 -- 159
		end -- 159
	}) -- 159
	_base_0.__class = _class_0 -- 159
	if _parent_0.__inherited then -- 159
		_parent_0.__inherited(_parent_0, _class_0) -- 159
	end -- 159
	Pickaxe = _class_0 -- 159
end -- 209
local Pipe -- 211
do -- 211
	local _class_0 -- 211
	local _parent_0 = EvilRP_Melee -- 211
	local _base_0 = { -- 211
		PrintName = "Pipe", -- 213
		Description = "You're supposed to smoke it, not swing it about.", -- 215
		Slot = 0, -- 217
		Price = 90, -- 219
		Spawnable = true, -- 220
		UseHands = true, -- 222
		ViewModelFOV = 54, -- 224
		ViewModel = Model("models/weapons/hl2meleepack/v_pipe.mdl"), -- 225
		WorldModel = Model("models/props_canal/mattpipe.mdl"), -- 227
		HoldType = "melee", -- 228
		LowerHoldType = "normal", -- 230
		Primary = { -- 231
			ChargeTime = 1, -- 231
			Light = { -- 234
				Damage = 20, -- 234
				DamageType = DMG_CLUB, -- 235
				Range = 75, -- 237
				Delay = 0.5, -- 238
				Act = { -- 240
					ACT_VM_MISSCENTER, -- 240
					ACT_VM_MISSCENTER -- 240
				}, -- 240
				Sound = { -- 242
					"Weapon_Crowbar.Melee_Hit", -- 242
					"Weapon_Crowbar.Single" -- 242
				} -- 242
			}, -- 233
			Heavy = { -- 246
				Damage = 40, -- 246
				DamageType = DMG_CLUB, -- 247
				Range = 75, -- 249
				Delay = 1.2, -- 250
				Act = ACT_VM_MISSCENTER, -- 252
				Sound = { -- 254
					"Weapon_Crowbar.Melee_Hit", -- 254
					"Weapon_Crowbar.Single" -- 254
				} -- 254
			} -- 245
		}, -- 258
		ChargeOffset = { -- 259
			Pos = Vector(-15, 0, -10), -- 259
			Ang = Angle(-35, 0, 0) -- 260
		} -- 211
	} -- 211
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 261
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 211
			_base_0[_key_0] = _val_0 -- 211
		end -- 211
	end -- 261
	if _base_0.__index == nil then -- 211
		_base_0.__index = _base_0 -- 211
	end -- 261
	setmetatable(_base_0, _parent_0.__base) -- 211
	_class_0 = setmetatable({ -- 211
		__init = function(self, ...) -- 211
			return _class_0.__parent.__init(self, ...) -- 211
		end, -- 211
		__base = _base_0, -- 211
		__name = "Pipe", -- 211
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
	Pipe = _class_0 -- 211
end -- 261
local Pot -- 263
do -- 263
	local _class_0 -- 263
	local _parent_0 = EvilRP_Melee -- 263
	local _base_0 = { -- 263
		PrintName = "Pot", -- 265
		Description = "Sizzle and squirm.", -- 267
		Slot = 0, -- 269
		Price = 70, -- 271
		Spawnable = true, -- 272
		UseHands = true, -- 274
		ViewModelFOV = 54, -- 276
		ViewModel = Model("models/weapons/hl2meleepack/v_pot.mdl"), -- 277
		WorldModel = Model("models/weapons/hl2meleepack/w_pot.mdl"), -- 279
		HoldType = "melee", -- 280
		LowerHoldType = "normal", -- 282
		Primary = { -- 283
			ChargeTime = 1, -- 283
			Light = { -- 286
				Damage = 15, -- 286
				DamageType = DMG_CLUB, -- 287
				Range = 75, -- 289
				Delay = 0.4, -- 290
				Act = { -- 292
					ACT_VM_MISSCENTER, -- 292
					ACT_VM_MISSCENTER -- 292
				}, -- 292
				Sound = { -- 294
					"Weapon_Crowbar.Melee_Hit", -- 294
					"Weapon_Crowbar.Single" -- 294
				} -- 294
			}, -- 285
			Heavy = { -- 298
				Damage = 30, -- 298
				DamageType = DMG_CLUB, -- 299
				Range = 75, -- 301
				Delay = 1, -- 302
				Act = ACT_VM_MISSCENTER, -- 304
				Sound = { -- 306
					"Weapon_Crowbar.Melee_Hit", -- 306
					"Weapon_Crowbar.Single" -- 306
				} -- 306
			} -- 297
		}, -- 310
		ChargeOffset = { -- 311
			Pos = Vector(-15, 0, -10), -- 311
			Ang = Angle(-35, 0, 0) -- 312
		} -- 263
	} -- 263
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 313
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 263
			_base_0[_key_0] = _val_0 -- 263
		end -- 263
	end -- 313
	if _base_0.__index == nil then -- 263
		_base_0.__index = _base_0 -- 263
	end -- 313
	setmetatable(_base_0, _parent_0.__base) -- 263
	_class_0 = setmetatable({ -- 263
		__init = function(self, ...) -- 263
			return _class_0.__parent.__init(self, ...) -- 263
		end, -- 263
		__base = _base_0, -- 263
		__name = "Pot", -- 263
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
	Pot = _class_0 -- 263
end -- 313
local Shovel -- 315
do -- 315
	local _class_0 -- 315
	local _parent_0 = EvilRP_Melee -- 315
	local _base_0 = { -- 315
		PrintName = "Shovel", -- 317
		Description = "Kidneystani partisan used to dig holes in concrete walls with these.", -- 319
		Slot = 0, -- 321
		Price = 400, -- 323
		Spawnable = true, -- 324
		UseHands = true, -- 326
		ViewModelFOV = 54, -- 328
		ViewModel = Model("models/weapons/hl2meleepack/v_shovel.mdl"), -- 329
		WorldModel = Model("models/weapons/hl2meleepack/w_shovel.mdl"), -- 331
		HoldType = "melee2", -- 332
		LowerHoldType = "normal", -- 334
		Primary = { -- 335
			ChargeTime = 1, -- 335
			Light = { -- 338
				Damage = 45, -- 338
				DamageType = DMG_CLUB, -- 339
				Range = 120, -- 341
				Delay = 0.8, -- 342
				Act = { -- 344
					ACT_VM_MISSCENTER, -- 344
					ACT_VM_MISSCENTER -- 344
				}, -- 344
				Sound = { -- 346
					"Weapon_Crowbar.Melee_Hit", -- 346
					"Weapon_Crowbar.Single" -- 346
				} -- 346
			}, -- 337
			Heavy = { -- 350
				Damage = 60, -- 350
				DamageType = DMG_CLUB, -- 351
				Range = 120, -- 353
				Delay = 1, -- 354
				Act = ACT_VM_MISSCENTER, -- 356
				Sound = { -- 358
					"Weapon_Crowbar.Melee_Hit", -- 358
					"Weapon_Crowbar.Single" -- 358
				} -- 358
			} -- 349
		}, -- 362
		ChargeOffset = { -- 363
			Pos = Vector(-15, 0, -10), -- 363
			Ang = Angle(-35, 0, 0) -- 364
		} -- 315
	} -- 315
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 365
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 315
			_base_0[_key_0] = _val_0 -- 315
		end -- 315
	end -- 365
	if _base_0.__index == nil then -- 315
		_base_0.__index = _base_0 -- 315
	end -- 365
	setmetatable(_base_0, _parent_0.__base) -- 315
	_class_0 = setmetatable({ -- 315
		__init = function(self, ...) -- 315
			return _class_0.__parent.__init(self, ...) -- 315
		end, -- 315
		__base = _base_0, -- 315
		__name = "Shovel", -- 315
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
	Shovel = _class_0 -- 315
end -- 365
local AxeSwing -- 367
do -- 367
	local _class_0 -- 367
	local _parent_0 = SOUND -- 367
	local _base_0 = { -- 367
		sound = "placenta/weapons/axe_swing.wav" -- 367
	} -- 367
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 368
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 367
			_base_0[_key_0] = _val_0 -- 367
		end -- 367
	end -- 368
	if _base_0.__index == nil then -- 367
		_base_0.__index = _base_0 -- 367
	end -- 368
	setmetatable(_base_0, _parent_0.__base) -- 367
	_class_0 = setmetatable({ -- 367
		__init = function(self, ...) -- 367
			return _class_0.__parent.__init(self, ...) -- 367
		end, -- 367
		__base = _base_0, -- 367
		__name = "AxeSwing", -- 367
		__parent = _parent_0 -- 367
	}, { -- 367
		__index = function(cls, name) -- 367
			local val = rawget(_base_0, name) -- 367
			if val == nil then -- 367
				local parent = rawget(cls, "__parent") -- 367
				if parent then -- 367
					return parent[name] -- 367
				end -- 367
			else -- 367
				return val -- 367
			end -- 367
		end, -- 367
		__call = function(cls, ...) -- 367
			local _self_0 = setmetatable({ }, _base_0) -- 367
			cls.__init(_self_0, ...) -- 367
			return _self_0 -- 367
		end -- 367
	}) -- 367
	_base_0.__class = _class_0 -- 367
	if _parent_0.__inherited then -- 367
		_parent_0.__inherited(_parent_0, _class_0) -- 367
	end -- 367
	AxeSwing = _class_0 -- 367
end -- 368
local AxeHitBody -- 369
do -- 369
	local _class_0 -- 369
	local _parent_0 = SOUND -- 369
	local _base_0 = { -- 369
		sound = "placenta/weapons/axe_hitbody.wav" -- 369
	} -- 369
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 370
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 369
			_base_0[_key_0] = _val_0 -- 369
		end -- 369
	end -- 370
	if _base_0.__index == nil then -- 369
		_base_0.__index = _base_0 -- 369
	end -- 370
	setmetatable(_base_0, _parent_0.__base) -- 369
	_class_0 = setmetatable({ -- 369
		__init = function(self, ...) -- 369
			return _class_0.__parent.__init(self, ...) -- 369
		end, -- 369
		__base = _base_0, -- 369
		__name = "AxeHitBody", -- 369
		__parent = _parent_0 -- 369
	}, { -- 369
		__index = function(cls, name) -- 369
			local val = rawget(_base_0, name) -- 369
			if val == nil then -- 369
				local parent = rawget(cls, "__parent") -- 369
				if parent then -- 369
					return parent[name] -- 369
				end -- 369
			else -- 369
				return val -- 369
			end -- 369
		end, -- 369
		__call = function(cls, ...) -- 369
			local _self_0 = setmetatable({ }, _base_0) -- 369
			cls.__init(_self_0, ...) -- 369
			return _self_0 -- 369
		end -- 369
	}) -- 369
	_base_0.__class = _class_0 -- 369
	if _parent_0.__inherited then -- 369
		_parent_0.__inherited(_parent_0, _class_0) -- 369
	end -- 369
	AxeHitBody = _class_0 -- 369
end -- 370
local AxeHitWall -- 371
do -- 371
	local _class_0 -- 371
	local _parent_0 = SOUND -- 371
	local _base_0 = { -- 371
		sound = "placenta/weapons/axe_hitwall.wav" -- 371
	} -- 371
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 372
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 371
			_base_0[_key_0] = _val_0 -- 371
		end -- 371
	end -- 372
	if _base_0.__index == nil then -- 371
		_base_0.__index = _base_0 -- 371
	end -- 372
	setmetatable(_base_0, _parent_0.__base) -- 371
	_class_0 = setmetatable({ -- 371
		__init = function(self, ...) -- 371
			return _class_0.__parent.__init(self, ...) -- 371
		end, -- 371
		__base = _base_0, -- 371
		__name = "AxeHitWall", -- 371
		__parent = _parent_0 -- 371
	}, { -- 371
		__index = function(cls, name) -- 371
			local val = rawget(_base_0, name) -- 371
			if val == nil then -- 371
				local parent = rawget(cls, "__parent") -- 371
				if parent then -- 371
					return parent[name] -- 371
				end -- 371
			else -- 371
				return val -- 371
			end -- 371
		end, -- 371
		__call = function(cls, ...) -- 371
			local _self_0 = setmetatable({ }, _base_0) -- 371
			cls.__init(_self_0, ...) -- 371
			return _self_0 -- 371
		end -- 371
	}) -- 371
	_base_0.__class = _class_0 -- 371
	if _parent_0.__inherited then -- 371
		_parent_0.__inherited(_parent_0, _class_0) -- 371
	end -- 371
	AxeHitWall = _class_0 -- 371
end -- 372
local Axe -- 373
do -- 373
	local _class_0 -- 373
	local _parent_0 = EvilRP_Melee -- 373
	local _base_0 = { -- 373
		PrintName = "Axe", -- 375
		Description = "A corpse's best friend, maybe yours. Terror of trees.", -- 377
		TreeBonus = 2, -- 379
		Slot = 0, -- 381
		Price = 400, -- 383
		Spawnable = true, -- 384
		UseHands = true, -- 386
		ViewModelFOV = 54, -- 388
		ViewModel = Model("models/weapons/hl2meleepack/v_axe.mdl"), -- 389
		WorldModel = Model("models/weapons/hl2meleepack/w_axe.mdl"), -- 391
		HoldType = "melee2", -- 392
		LowerHoldType = "normal", -- 394
		Primary = { -- 395
			ChargeTime = 1, -- 395
			Light = { -- 398
				Damage = 45, -- 398
				DamageType = DMG_SLASH, -- 399
				Range = 120, -- 401
				Delay = 0.8, -- 402
				Act = { -- 404
					ACT_VM_MISSCENTER, -- 404
					ACT_VM_MISSCENTER -- 404
				}, -- 404
				Sound = { -- 406
					"AxeHitBody", -- 406
					"AxeSwing", -- 406
					"AxeHitWall" -- 406
				} -- 406
			}, -- 397
			Heavy = { -- 410
				Damage = 60, -- 410
				DamageType = DMG_SLASH, -- 411
				Range = 120, -- 413
				Delay = 1, -- 414
				Act = ACT_VM_MISSCENTER, -- 416
				Sound = { -- 418
					"AxeHitBody", -- 418
					"AxeSwing", -- 418
					"AxeHitWall" -- 418
				} -- 418
			} -- 409
		}, -- 422
		ViewOffset = { -- 423
			Pos = Vector(-6, 0, 6) -- 423
		}, -- 426
		ChargeOffset = { -- 427
			Pos = Vector(-15, 0, -10), -- 427
			Ang = Angle(-35, 0, 0) -- 428
		} -- 373
	} -- 373
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 429
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 373
			_base_0[_key_0] = _val_0 -- 373
		end -- 373
	end -- 429
	if _base_0.__index == nil then -- 373
		_base_0.__index = _base_0 -- 373
	end -- 429
	setmetatable(_base_0, _parent_0.__base) -- 373
	_class_0 = setmetatable({ -- 373
		__init = function(self, ...) -- 373
			return _class_0.__parent.__init(self, ...) -- 373
		end, -- 373
		__base = _base_0, -- 373
		__name = "Axe", -- 373
		__parent = _parent_0 -- 373
	}, { -- 373
		__index = function(cls, name) -- 373
			local val = rawget(_base_0, name) -- 373
			if val == nil then -- 373
				local parent = rawget(cls, "__parent") -- 373
				if parent then -- 373
					return parent[name] -- 373
				end -- 373
			else -- 373
				return val -- 373
			end -- 373
		end, -- 373
		__call = function(cls, ...) -- 373
			local _self_0 = setmetatable({ }, _base_0) -- 373
			cls.__init(_self_0, ...) -- 373
			return _self_0 -- 373
		end -- 373
	}) -- 373
	_base_0.__class = _class_0 -- 373
	if _parent_0.__inherited then -- 373
		_parent_0.__inherited(_parent_0, _class_0) -- 373
	end -- 373
	Axe = _class_0 -- 373
	return _class_0 -- 429
end -- 429
