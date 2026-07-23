local Bodyguard
do
	local _class_0
	local _parent_0 = EvilRP_Weapon
	local _base_0 = {
		PrintName = "Bodyguard",
		Description = "A simple revolver made for both enforcers and protectors alike. Ol' Reliable.",
		Slot = 1,
		Spawnable = true,
		UseHands = true,
		ViewModelTargetFOV = 54,
		ViewModel = Model("models/weapons/c_bodyguard.mdl"),
		WorldModel = Model("models/weapons/w_bodyguard.mdl"),
		HoldType = "revolver",
		LowerHoldType = "normal",
		Price = 1873,
		Firemode = 0,
		Primary = {
			Ammo = "357",
			ClipSize = 5,
			DefaultClip = 10,
			Damage = 55,
			Delay = 60 / 120,
			Range = 400,
			Accuracy = 12,
			RangeModifier = 0.78,
			Recoil = {
				MinAng = Angle(5.2, -0.3, 0),
				MaxAng = Angle(7.2, 0.3, 0),
				Punch = 0.9,
				Ratio = 0.3
			},
			Reload = {
				Sound = "Weapon_357.Reload"
			},
			Sound = "tekka/weapons/weapon_canon.wav",
			TracerName = "Tracer"
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Bodyguard",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Bodyguard = _class_0
end
local Brainpaster
do
	local _class_0
	local _parent_0 = EvilRP_Weapon
	local _base_0 = {
		PrintName = "Brainpaster",
		Description = "Arrhythmia's number one wall painter.",
		Slot = 1,
		Spawnable = true,
		UseHands = true,
		ViewModelTargetFOV = 54,
		ViewModel = Model("models/weapons/c_brainpaster.mdl"),
		WorldModel = Model("models/weapons/w_brainpaster.mdl"),
		HoldType = "revolver",
		LowerHoldType = "normal",
		Firemode = 0,
		Primary = {
			Ammo = "357",
			ClipSize = 5,
			DefaultClip = 10,
			Damage = 40,
			Delay = 60 / 267,
			Range = 10 / 00,
			Accuracy = 12,
			RangeModifier = 0.8,
			Recoil = {
				MinAng = Angle(5.8, -0.7, 0),
				MaxAng = Angle(7.5, 0.7, 0),
				Punch = 0.7,
				Ratio = 0.2
			},
			Reload = {
				Sound = "Weapon_Pistol.Reload"
			},
			Sound = "tekka/weapons/weapon_sniper.wav",
			TracerName = "Tracer"
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Brainpaster",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Brainpaster = _class_0
end
local Coach
do
	local _class_0
	local _parent_0 = EvilRP_Weapon
	local _base_0 = {
		PrintName = "Coach",
		Description = "A dead simple double-barreled shotgun.\nThe wood is full of splinters.",
		Slot = 1,
		Spawnable = true,
		Price = 2468,
		UseHands = true,
		ViewModelTargetFOV = 54,
		ViewModel = Model("models/weapons/c_coach.mdl"),
		WorldModel = Model("models/weapons/w_coach.mdl"),
		HoldType = "shotgun",
		LowerHoldType = "passive",
		Firemode = 0,
		Primary = {
			Ammo = "Buckshot",
			ClipSize = 2,
			DefaultClip = 2,
			Damage = 17,
			Count = 14,
			Delay = 0.4,
			Range = 250,
			Accuracy = 24,
			RangeModifier = 0.7,
			Recoil = {
				MinAng = Angle(17, -7, 0),
				MaxAng = Angle(20, 7, 0),
				Punch = 0.9,
				Ratio = 0.8
			},
			Reload = {
				Sound = "Weapon_Shotgun.Reload"
			},
			Sound = "weapons/shotgun/shotgun_dbl_fire.wav",
			TracerName = "Tracer"
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Coach",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Coach = _class_0
end
local Reload_Shell
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 3 do
				_accum_0[_len_0] = "weapons/shotgun/shotgun_reload" .. tostring(i) .. ".wav"
				_len_0 = _len_0 + 1
			end
			return _accum_0
		end)()
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Reload_Shell",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Reload_Shell = _class_0
end
local Candlewood_Fire
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = "tekka/weapons/weapon_warhammer.wav",
		chan = CHAN_WEAPON
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Candlewood_Fire",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Candlewood_Fire = _class_0
end
local Candlewood
do
	local _class_0
	local _parent_0 = EvilRP_Weapon
	local _base_0 = {
		PrintName = "Candlewood",
		Description = "An unwieldy pump-action shotgun.\nRust is eating it alive.",
		Slot = 1,
		Spawnable = true,
		UseHands = true,
		ViewModelTargetFOV = 54,
		ViewModel = Model("models/weapons/c_candlewood.mdl"),
		WorldModel = Model("models/weapons/w_candlewood.mdl"),
		HoldType = "shotgun",
		LowerHoldType = "passive",
		Firemode = 0,
		Primary = {
			Ammo = "Buckshot",
			ClipSize = 4,
			DefaultClip = 8,
			Damage = 17,
			PumpAction = false,
			Pump = {
				Delay = 0.4,
				Sound = "weapons/shotgun/shotgun_cock.wav",
				FromEmpty = true
			},
			Count = 7,
			Delay = -1,
			Range = 400,
			Accuracy = 12,
			RangeModifier = 0.7,
			Recoil = {
				MinAng = Angle(10, -2, 0),
				MaxAng = Angle(14, 2, 0),
				Punch = 0.9,
				Ratio = 0.8
			},
			Reload = {
				Amount = 1,
				Sound = "Reload_Shell",
				Shotgun = true
			},
			Sound = "Candlewood_Fire",
			TracerName = "Tracer"
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Candlewood",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Candlewood = _class_0
end
local Enforcer
do
	local _class_0
	local _parent_0 = EvilRP_Weapon
	local _base_0 = {
		PrintName = "Enforcer",
		Description = "They used to hunt people with these.",
		Slot = 2,
		Spawnable = true,
		UseHands = true,
		ViewModelTargetFOV = 54,
		ViewModel = Model("models/weapons/c_livermann.mdl"),
		WorldModel = Model("models/weapons/w_livermann.mdl"),
		HoldType = "ar2",
		LowerHoldType = "passive",
		Firemode = 0,
		Primary = {
			Ammo = "AR2",
			ClipSize = 6,
			DefaultClip = 12,
			Damage = 75,
			Delay = 1.25,
			Range = 2000,
			Accuracy = 5,
			RangeModifier = 0.95,
			Recoil = {
				MinAng = Angle(14.6, -2.7, 0),
				MaxAng = Angle(17, 2.7, 0),
				Punch = 0.9,
				Ratio = 0.2
			},
			Reload = {
				Sound = "Weapon_SMG1.Reload",
				Amount = 6,
				Shotgun = true,
				DontFinishPump = true
			},
			Sound = "placenta/weapons/enforcer.wav",
			TracerName = "Tracer"
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Enforcer",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Enforcer = _class_0
end
local Greaser
do
	local _class_0
	local _parent_0 = EvilRP_Weapon
	local _base_0 = {
		PrintName = "Greaser",
		Description = "A shitty, greasy submachine gun.",
		Slot = 3,
		Spawnable = true,
		UseHands = true,
		ViewModelTargetFOV = 54,
		ViewModel = Model("models/weapons/c_greaser.mdl"),
		WorldModel = Model("models/weapons/w_greaser.mdl"),
		HoldType = "pistol",
		LowerHoldType = "normal",
		Firemode = 5,
		Primary = {
			Ammo = "SMG1",
			ClipSize = 16,
			DefaultClip = 32,
			Damage = 32,
			Delay = 60 / 340,
			Range = 400,
			Accuracy = 12,
			RangeModifier = 0.75,
			Recoil = {
				MinAng = Angle(3, -0.8, 0),
				MaxAng = Angle(4, 0.8, 0),
				Punch = 0.6,
				Ratio = 0.8
			},
			Reload = {
				Sound = "Weapon_Pistol.Reload"
			},
			Sound = "tekka/weapons/weapon_mg.wav",
			TracerName = "Tracer"
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Greaser",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Greaser = _class_0
end
local Novoluger
do
	local _class_0
	local _parent_0 = EvilRP_Weapon
	local _base_0 = {
		PrintName = "Novoluger",
		Description = "A well-made, well-kept pistol. It's associated with the great.",
		Slot = 1,
		Spawnable = true,
		UseHands = true,
		ViewModelTargetFOV = 54,
		ViewModel = Model("models/weapons/c_novoluger.mdl"),
		WorldModel = Model("models/weapons/w_novoluger.mdl"),
		HoldType = "pistol",
		LowerHoldType = "normal",
		Firemode = 0,
		Primary = {
			Ammo = "Pistol",
			ClipSize = 8,
			DefaultClip = 24,
			Damage = 40,
			Delay = 60 / 200,
			Range = 750,
			Accuracy = 12,
			RangeModifier = 0.85,
			Recoil = {
				MinAng = Angle(5, -0.5, 0),
				MaxAng = Angle(6.5, 0.5, 0),
				Punch = 0.8,
				Ratio = 0.6
			},
			Reload = {
				Sound = "Weapon_Pistol.Reload"
			},
			Sound = "tekka/weapons/weapon_m92.wav",
			TracerName = "Tracer"
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Novoluger",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Novoluger = _class_0
end
local Obrez
do
	local _class_0
	local _parent_0 = EvilRP_Weapon
	local _base_0 = {
		PrintName = "Obrez",
		Description = "A mutilated rifle, ruined and barely functional.",
		Slot = 2,
		Spawnable = true,
		UseHands = true,
		ViewModelTargetFOV = 54,
		ViewModel = Model("models/weapons/c_obrez.mdl"),
		WorldModel = Model("models/weapons/w_obrez.mdl"),
		HoldType = "ar2",
		LowerHoldType = "passive",
		Firemode = 0,
		Primary = {
			Ammo = "AR2",
			ClipSize = 3,
			DefaultClip = 6,
			Damage = 65,
			Delay = 1.25,
			Range = 300,
			Accuracy = 12,
			RangeModifier = 0.95,
			Recoil = {
				MinAng = Angle(8, -6.2, 0),
				MaxAng = Angle(16, 6.2, 0),
				Punch = 0.95,
				Ratio = 0.2
			},
			Reload = {
				Sound = "Weapon_SMG1.Reload"
			},
			Sound = "tekka/weapons/weapon_western.wav",
			TracerName = "Tracer"
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Obrez",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Obrez = _class_0
end
local Owler
do
	local _class_0
	local _parent_0 = EvilRP_Weapon
	local _base_0 = {
		PrintName = "Owler",
		Description = "They all hate you.",
		Slot = 2,
		Spawnable = true,
		UseHands = true,
		ViewModelTargetFOV = 54,
		ViewModel = Model("models/weapons/c_owler.mdl"),
		WorldModel = Model("models/weapons/w_owler.mdl"),
		HoldType = "pistol",
		LowerHoldType = "normal",
		Firemode = -1,
		Primary = {
			Ammo = "SMG1",
			ClipSize = 20,
			DefaultClip = 40,
			Damage = 20,
			Delay = 60 / 1000,
			Range = 200,
			Accuracy = 8,
			RangeModifier = 0.55,
			Recoil = {
				MinAng = Angle(2.3, -0.5, 0),
				MaxAng = Angle(-1.3, 0.5, 0),
				Punch = 0.6,
				Ratio = 0.8
			},
			Reload = {
				Sound = "Weapon_Pistol.Reload"
			},
			Sound = "tekka/weapons/weapon_mp40.wav",
			TracerName = "Tracer"
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Owler",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Owler = _class_0
end
local Pacifier
do
	local _class_0
	local _parent_0 = EvilRP_Weapon
	local _base_0 = {
		PrintName = "Pacifier",
		Description = "The favourite pistol of the Sanitar Squad.",
		Slot = 1,
		Spawnable = true,
		UseHands = true,
		ViewModelTargetFOV = 54,
		ViewModel = Model("models/weapons/c_pacifier.mdl"),
		WorldModel = Model("models/weapons/w_pacifier.mdl"),
		HoldType = "pistol",
		LowerHoldType = "normal",
		Firemode = 0,
		Primary = {
			Ammo = "Pistol",
			ClipSize = 15,
			DefaultClip = 30,
			Damage = 32,
			Delay = 60 / 400,
			Range = 750,
			Accuracy = 12,
			RangeModifier = 0.85,
			Recoil = {
				MinAng = Angle(6.4, -0.3, 0),
				MaxAng = Angle(8, 0.3, 0),
				Punch = 0.8,
				Ratio = 0.6
			},
			Reload = {
				Sound = "Weapon_Pistol.Reload"
			},
			Sound = "tekka/weapons/weapon_m92.wav",
			TracerName = "Tracer",
			AltFire = function(self)
				self.Primary.Automatic = false
				self:SetFiremode((self:GetFiremode() == 0) and 3 or 0)
				return self:EmitSound("Weapon_SMG1.Special1")
			end
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Pacifier",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Pacifier = _class_0
end
local Painkiller
do
	local _class_0
	local _parent_0 = EvilRP_Weapon
	local _base_0 = {
		PrintName = "Painkiller",
		Description = "The dead feel no pain.",
		Slot = 1,
		Spawnable = true,
		UseHands = true,
		ViewModelTargetFOV = 54,
		ViewModel = Model("models/weapons/c_painkiller.mdl"),
		WorldModel = Model("models/weapons/w_painkiller.mdl"),
		HoldType = "pistol",
		LowerHoldType = "normal",
		Firemode = 0,
		Primary = {
			Ammo = "Pistol",
			ClipSize = 5,
			DefaultClip = 10,
			Damage = 60,
			Delay = 60 / 360,
			Range = 1200,
			Accuracy = 12,
			RangeModifier = 0.90,
			Recoil = {
				MinAng = Angle(8.2, -1.6, 0),
				MaxAng = Angle(11.2, 1.6, 0),
				Punch = 0.9,
				Ratio = 0.1
			},
			Reload = {
				Sound = "Weapon_Pistol.Reload"
			},
			Sound = "tekka/weapons/weapon_50cal.wav",
			TracerName = "Tracer"
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Painkiller",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Painkiller = _class_0
end
local Prettyboy
do
	local _class_0
	local _parent_0 = EvilRP_Weapon
	local _base_0 = {
		PrintName = "Pretty Boy",
		Description = "It's named after its most common users.",
		Slot = 1,
		Spawnable = true,
		UseHands = true,
		ViewModelTargetFOV = 54,
		ViewModel = Model("models/weapons/c_prettyboy.mdl"),
		WorldModel = Model("models/weapons/w_prettyboy.mdl"),
		HoldType = "pistol",
		LowerHoldType = "normal",
		Firemode = 0,
		Primary = {
			Ammo = "Pistol",
			ClipSize = 7,
			DefaultClip = 14,
			Damage = 30,
			Delay = 60 / 400,
			Range = 1000,
			Accuracy = 12,
			RangeModifier = 0.85,
			Recoil = {
				MinAng = Angle(2, -0.1, 0),
				MaxAng = Angle(4, 0.1, 0),
				Punch = 0.6,
				Ratio = 0.8
			},
			Reload = {
				Sound = "Weapon_Pistol.Reload"
			},
			Sound = "tekka/weapons/weapon_pistolsmall.wav",
			TracerName = "Tracer"
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Prettyboy",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Prettyboy = _class_0
end
local Subjugator
do
	local _class_0
	local _parent_0 = EvilRP_Weapon
	local _base_0 = {
		PrintName = "Subjugator",
		Description = "It'll subjugate the living and the dead.",
		Slot = 2,
		Spawnable = true,
		UseHands = true,
		ViewModelTargetFOV = 54,
		ViewModel = Model("models/weapons/c_subjugator.mdl"),
		WorldModel = Model("models/weapons/w_subjugator.mdl"),
		HoldType = "ar2",
		LowerHoldType = "passive",
		Firemode = -1,
		Primary = {
			Ammo = "AR2",
			ClipSize = 8,
			DefaultClip = 16,
			Damage = 65,
			Delay = 1,
			Range = 1500,
			Accuracy = 4,
			RangeModifier = 0.99,
			Recoil = {
				MinAng = Angle(10, -0.9, 0),
				MaxAng = Angle(14, 0.9, 0),
				Punch = 0.9,
				Ratio = 0.2
			},
			Reload = {
				Sound = "Weapon_Pistol.Reload"
			},
			Sound = "tekka/weapons/weapon_mossberg.wav",
			TracerName = "Tracer"
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Subjugator",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Subjugator = _class_0
end
local Trooper
do
	local _class_0
	local _parent_0 = EvilRP_Weapon
	local _base_0 = {
		PrintName = "Trooper",
		Description = "A fully automatic instrument of death.\nRespect it, or else.",
		Slot = 2,
		Spawnable = true,
		UseHands = true,
		ViewModelTargetFOV = 54,
		ViewModel = Model("models/weapons/c_trooper.mdl"),
		WorldModel = Model("models/weapons/w_trooper.mdl"),
		HoldType = "ar2",
		LowerHoldType = "passive",
		Firemode = -1,
		Primary = {
			Ammo = "AR2",
			ClipSize = 20,
			DefaultClip = 40,
			Damage = 65,
			Delay = 60 / 400,
			Range = 1300,
			Accuracy = 4,
			RangeModifier = 0.99,
			Recoil = {
				MinAng = Angle(3.8, -0.9, 0),
				MaxAng = Angle(4.8, 0.9, 0),
				Punch = 0.8,
				Ratio = 0.5
			},
			Reload = {
				Sound = "Weapon_Pistol.Reload"
			},
			Sound = "tekka/weapons/weapon_thud.wav",
			TracerName = "Tracer"
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Trooper",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Trooper = _class_0
end
local Mark
do
	local _class_0
	local _parent_0 = EvilRP_Weapon
	local _base_0 = {
		PrintName = "The Mark",
		Description = "A rusty scrap pistol, rigged to fire one massive bullet.",
		Price = 1666,
		Slot = 1,
		Spawnable = true,
		UseHands = true,
		ViewModelTargetFOV = 54,
		ViewModel = Model("models/weapons/c_mark.mdl"),
		WorldModel = Model("models/weapons/w_mark.mdl"),
		HoldType = "pistol",
		LowerHoldType = "passive",
		Firemode = 1,
		Primary = {
			Ammo = "Pistol",
			ClipSize = 1,
			DefaultClip = 1,
			Damage = 80,
			Delay = 60 / 120,
			Range = 200,
			Accuracy = 12,
			RangeModifier = 0.4,
			Recoil = {
				MinAng = Angle(11, -3, 0),
				MaxAng = Angle(15, 3, 0),
				Punch = 0.95,
				Ratio = 0.3
			},
			Reload = {
				Sound = "Weapon_Pistol.Reload"
			},
			Sound = "tekka/weapons/weapon_smg3.wav",
			TracerName = "Tracer"
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Mark",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Mark = _class_0
end
local Hope
do
	local _class_0
	local _parent_0 = EvilRP_Weapon
	local _base_0 = {
		PrintName = "Hope",
		Description = "The standard issue Dragoon firearm, some say it speaks to them.",
		Slot = 1,
		Spawnable = true,
		UseHands = true,
		ViewModelTargetFOV = 54,
		ViewModel = Model("models/tnb/weapons/c_1911.mdl"),
		WorldModel = Model("models/tnb/weapons/w_1911.mdl"),
		HoldType = "pistol",
		LowerHoldType = "normal",
		Firemode = 0,
		Primary = {
			Ammo = "Pistol",
			ClipSize = 10,
			DefaultClip = 20,
			Damage = 35,
			Delay = 60 / 200,
			Range = 850,
			Accuracy = 12,
			RangeModifier = 0.85,
			Recoil = {
				MinAng = Angle(6, -0.5, 0),
				MaxAng = Angle(7.5, 0.5, 0),
				Punch = 0.8,
				Ratio = 0.6
			},
			Reload = {
				Sound = "Weapon_Pistol.Reload"
			},
			Sound = "tekka/weapons/weapon_mac10.wav",
			TracerName = "Tracer"
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Hope",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Hope = _class_0
end
local Whisper
local _class_0
local _parent_0 = EvilRP_Weapon
local _base_0 = {
	PrintName = "Whisper",
	Description = "A handmade pistol with a built in suppressor.\n It has earned its name from the gasps of outsiders whispering their final prayers as their carotid arteries were miraculously severed by this sidearm.",
	Slot = 1,
	Spawnable = true,
	UseHands = true,
	ViewModelTargetFOV = 54,
	ViewModel = Model("models/tnb/weapons/c_welrod.mdl"),
	WorldModel = Model("models/tnb/weapons/w_welrod.mdl"),
	HoldType = "pistol",
	LowerHoldType = "normal",
	Firemode = 0,
	Primary = {
		Ammo = "Pistol",
		ClipSize = 3,
		DefaultClip = 9,
		Damage = 15,
		Delay = 60 / 200,
		Range = 650,
		Accuracy = 12,
		RangeModifier = 0.85,
		Recoil = {
			MinAng = Angle(7, -0.5, 0),
			MaxAng = Angle(8.5, 0.5, 0),
			Punch = 0.8,
			Ratio = 0.6
		},
		Reload = {
			Sound = "Weapon_Pistol.Reload"
		},
		Sound = "tekka/weapons/weapon_silencedthud.wav",
		TracerName = "Tracer"
	}
}
for _key_0, _val_0 in pairs(_parent_0.__base) do
	if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
		_base_0[_key_0] = _val_0
	end
end
if _base_0.__index == nil then
	_base_0.__index = _base_0
end
setmetatable(_base_0, _parent_0.__base)
_class_0 = setmetatable({
	__init = function(self, ...)
		return _class_0.__parent.__init(self, ...)
	end,
	__base = _base_0,
	__name = "Whisper",
	__parent = _parent_0
}, {
	__index = function(cls, name)
		local val = rawget(_base_0, name)
		if val == nil then
			local parent = rawget(cls, "__parent")
			if parent then
				return parent[name]
			end
		else
			return val
		end
	end,
	__call = function(cls, ...)
		local _self_0 = setmetatable({ }, _base_0)
		cls.__init(_self_0, ...)
		return _self_0
	end
})
_base_0.__class = _class_0
if _parent_0.__inherited then
	_parent_0.__inherited(_parent_0, _class_0)
end
Whisper = _class_0
return _class_0
