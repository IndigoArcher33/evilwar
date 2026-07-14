local Crowbar
do
	local _class_0
	local _parent_0 = EvilRP_Melee
	local _base_0 = {
		PrintName = "Crowbar",
		Description = "Check out the teeth on this thing.\nThey're stronger than yours.",
		Slot = 0,
		Price = 150,
		Spawnable = true,
		UseHands = true,
		ViewModelFOV = 54,
		ViewModel = Model("models/weapons/c_crowbar.mdl"),
		WorldModel = Model("models/weapons/w_crowbar.mdl"),
		HoldType = "melee",
		LowerHoldType = "normal",
		Primary = {
			ChargeTime = 0.4,
			Light = {
				Damage = 24,
				DamageType = DMG_CLUB,
				Range = 75,
				Delay = 0.4,
				Act = {
					ACT_VM_HITCENTER,
					ACT_VM_MISSCENTER
				},
				Sound = {
					"Weapon_Crowbar.Melee_Hit",
					"Weapon_Crowbar.Single"
				}
			},
			Heavy = {
				Damage = 40,
				DamageType = DMG_CLUB,
				Range = 100,
				Delay = 1,
				Act = ACT_VM_MISSCENTER,
				Sound = {
					"Weapon_Crowbar.Melee_Hit",
					"Weapon_Crowbar.Single"
				}
			}
		},
		ChargeOffset = {
			Pos = Vector(-15, 0, -10),
			Ang = Angle(-35, 0, 0)
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
		__name = "Crowbar",
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
	Crowbar = _class_0
end
local Knife
do
	local _class_0
	local _parent_0 = EvilRP_Melee
	local _base_0 = {
		PrintName = "Knife",
		Description = "Key to the kingdom.",
		Slot = 0,
		Price = 200,
		SkinHarvest = true,
		Spawnable = true,
		UseHands = true,
		ViewModelFOV = 54,
		ViewModel = Model("models/weapons/cstrike/c_knife_t.mdl"),
		WorldModel = Model("models/weapons/w_knife_t.mdl"),
		HoldType = "knife",
		LowerHoldType = "normal",
		Primary = {
			ChargeTime = 0.2,
			Light = {
				Damage = 15,
				DamageType = DMG_SLASH,
				Range = 75,
				Delay = 0.2,
				Act = ACT_VM_MISSCENTER,
				Sound = {
					"weapons/knife/knife_hit1.wav",
					"weapons/knife/knife_slash1.wav"
				}
			},
			Heavy = {
				Damage = 30,
				DamageType = DMG_SLASH,
				Range = 75,
				Delay = 0.5,
				Act = ACT_VM_MISSCENTER,
				Sound = {
					"weapons/knife/knife_hit1.wav",
					"weapons/knife/knife_slash1.wav"
				}
			}
		},
		ChargeOffset = {
			Pos = Vector(0, 0, 0),
			Ang = Angle(0, -35, 0)
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
		__name = "Knife",
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
	Knife = _class_0
end
local Pan
do
	local _class_0
	local _parent_0 = EvilRP_Melee
	local _base_0 = {
		PrintName = "Pan",
		Description = "They used to cook food in these.\nFeels like you put it to better use.",
		Slot = 0,
		Price = 100,
		Spawnable = true,
		UseHands = true,
		ViewModelFOV = 54,
		ViewModel = Model("models/weapons/hl2meleepack/v_pan.mdl"),
		WorldModel = Model("models/weapons/hl2meleepack/w_pan.mdl"),
		HoldType = "melee",
		LowerHoldType = "normal",
		Primary = {
			ChargeTime = 0.4,
			Light = {
				Damage = 20,
				DamageType = DMG_CLUB,
				Range = 75,
				Delay = 0.4,
				Act = {
					ACT_VM_MISSCENTER,
					ACT_VM_MISSCENTER
				},
				Sound = {
					"Weapon_Crowbar.Melee_Hit",
					"Weapon_Crowbar.Single"
				}
			},
			Heavy = {
				Damage = 50,
				DamageType = DMG_CLUB,
				Range = 75,
				Delay = 1,
				Act = ACT_VM_MISSCENTER,
				Sound = {
					"Weapon_Crowbar.Melee_Hit",
					"Weapon_Crowbar.Single"
				}
			}
		},
		ChargeOffset = {
			Pos = Vector(-15, 0, -10),
			Ang = Angle(-35, 0, 0)
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
		__name = "Pan",
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
	Pan = _class_0
end
local Pickaxe
do
	local _class_0
	local _parent_0 = EvilRP_Melee
	local _base_0 = {
		PrintName = "Pickaxe",
		Description = "Good against rocks. Also good against skulls.",
		MineBonus = 2,
		Slot = 0,
		Price = 320,
		Spawnable = true,
		UseHands = true,
		ViewModelFOV = 54,
		ViewModel = Model("models/weapons/hl2meleepack/v_pickaxe.mdl"),
		WorldModel = Model("models/weapons/hl2meleepack/w_pickaxe.mdl"),
		HoldType = "melee2",
		LowerHoldType = "normal",
		Primary = {
			ChargeTime = 1,
			Light = {
				Damage = 45,
				DamageType = DMG_CLUB,
				Range = 80,
				Delay = 1.2,
				Act = {
					ACT_VM_MISSCENTER,
					ACT_VM_MISSCENTER
				},
				Sound = {
					"Weapon_Crowbar.Melee_Hit",
					"Weapon_Crowbar.Single"
				}
			},
			Heavy = {
				Damage = 75,
				DamageType = DMG_CLUB,
				Range = 75,
				Delay = 3,
				Act = ACT_VM_MISSCENTER,
				Sound = {
					"Weapon_Crowbar.Melee_Hit",
					"Weapon_Crowbar.Single"
				}
			}
		},
		ChargeOffset = {
			Pos = Vector(-15, 0, -10),
			Ang = Angle(-35, 0, 0)
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
		__name = "Pickaxe",
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
	Pickaxe = _class_0
end
local Pipe
do
	local _class_0
	local _parent_0 = EvilRP_Melee
	local _base_0 = {
		PrintName = "Pipe",
		Description = "You're supposed to smoke it, not swing it about.",
		Slot = 0,
		Price = 90,
		Spawnable = true,
		UseHands = true,
		ViewModelFOV = 54,
		ViewModel = Model("models/weapons/hl2meleepack/v_pipe.mdl"),
		WorldModel = Model("models/props_canal/mattpipe.mdl"),
		HoldType = "melee",
		LowerHoldType = "normal",
		Primary = {
			ChargeTime = 1,
			Light = {
				Damage = 20,
				DamageType = DMG_CLUB,
				Range = 75,
				Delay = 0.5,
				Act = {
					ACT_VM_MISSCENTER,
					ACT_VM_MISSCENTER
				},
				Sound = {
					"Weapon_Crowbar.Melee_Hit",
					"Weapon_Crowbar.Single"
				}
			},
			Heavy = {
				Damage = 40,
				DamageType = DMG_CLUB,
				Range = 75,
				Delay = 1.2,
				Act = ACT_VM_MISSCENTER,
				Sound = {
					"Weapon_Crowbar.Melee_Hit",
					"Weapon_Crowbar.Single"
				}
			}
		},
		ChargeOffset = {
			Pos = Vector(-15, 0, -10),
			Ang = Angle(-35, 0, 0)
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
		__name = "Pipe",
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
	Pipe = _class_0
end
local Pot
do
	local _class_0
	local _parent_0 = EvilRP_Melee
	local _base_0 = {
		PrintName = "Pot",
		Description = "Sizzle and squirm.",
		Slot = 0,
		Price = 70,
		Spawnable = true,
		UseHands = true,
		ViewModelFOV = 54,
		ViewModel = Model("models/weapons/hl2meleepack/v_pot.mdl"),
		WorldModel = Model("models/weapons/hl2meleepack/w_pot.mdl"),
		HoldType = "melee",
		LowerHoldType = "normal",
		Primary = {
			ChargeTime = 1,
			Light = {
				Damage = 15,
				DamageType = DMG_CLUB,
				Range = 75,
				Delay = 0.4,
				Act = {
					ACT_VM_MISSCENTER,
					ACT_VM_MISSCENTER
				},
				Sound = {
					"Weapon_Crowbar.Melee_Hit",
					"Weapon_Crowbar.Single"
				}
			},
			Heavy = {
				Damage = 30,
				DamageType = DMG_CLUB,
				Range = 75,
				Delay = 1,
				Act = ACT_VM_MISSCENTER,
				Sound = {
					"Weapon_Crowbar.Melee_Hit",
					"Weapon_Crowbar.Single"
				}
			}
		},
		ChargeOffset = {
			Pos = Vector(-15, 0, -10),
			Ang = Angle(-35, 0, 0)
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
		__name = "Pot",
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
	Pot = _class_0
end
local Shovel
do
	local _class_0
	local _parent_0 = EvilRP_Melee
	local _base_0 = {
		PrintName = "Shovel",
		Description = "Kidneystani partisan used to dig holes in concrete walls with these.",
		Slot = 0,
		Price = 400,
		Spawnable = true,
		UseHands = true,
		ViewModelFOV = 54,
		ViewModel = Model("models/weapons/hl2meleepack/v_shovel.mdl"),
		WorldModel = Model("models/weapons/hl2meleepack/w_shovel.mdl"),
		HoldType = "melee2",
		LowerHoldType = "normal",
		Primary = {
			ChargeTime = 1,
			Light = {
				Damage = 45,
				DamageType = DMG_CLUB,
				Range = 120,
				Delay = 0.8,
				Act = {
					ACT_VM_MISSCENTER,
					ACT_VM_MISSCENTER
				},
				Sound = {
					"Weapon_Crowbar.Melee_Hit",
					"Weapon_Crowbar.Single"
				}
			},
			Heavy = {
				Damage = 60,
				DamageType = DMG_CLUB,
				Range = 120,
				Delay = 1,
				Act = ACT_VM_MISSCENTER,
				Sound = {
					"Weapon_Crowbar.Melee_Hit",
					"Weapon_Crowbar.Single"
				}
			}
		},
		ChargeOffset = {
			Pos = Vector(-15, 0, -10),
			Ang = Angle(-35, 0, 0)
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
		__name = "Shovel",
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
	Shovel = _class_0
end
local AxeSwing
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = "placenta/weapons/axe_swing.wav"
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
		__name = "AxeSwing",
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
	AxeSwing = _class_0
end
local AxeHitBody
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = "placenta/weapons/axe_hitbody.wav"
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
		__name = "AxeHitBody",
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
	AxeHitBody = _class_0
end
local AxeHitWall
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = "placenta/weapons/axe_hitwall.wav"
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
		__name = "AxeHitWall",
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
	AxeHitWall = _class_0
end
local Axe
do
	local _class_0
	local _parent_0 = EvilRP_Melee
	local _base_0 = {
		PrintName = "Axe",
		Description = "A corpse's best friend, maybe yours. Terror of trees.",
		TreeBonus = 2,
		Slot = 0,
		Price = 400,
		Spawnable = true,
		UseHands = true,
		ViewModelFOV = 54,
		ViewModel = Model("models/weapons/hl2meleepack/v_axe.mdl"),
		WorldModel = Model("models/weapons/hl2meleepack/w_axe.mdl"),
		HoldType = "melee2",
		LowerHoldType = "normal",
		Primary = {
			ChargeTime = 1,
			Light = {
				Damage = 45,
				DamageType = DMG_SLASH,
				Range = 120,
				Delay = 0.8,
				Act = {
					ACT_VM_MISSCENTER,
					ACT_VM_MISSCENTER
				},
				Sound = {
					"AxeHitBody",
					"AxeSwing",
					"AxeHitWall"
				}
			},
			Heavy = {
				Damage = 60,
				DamageType = DMG_SLASH,
				Range = 120,
				Delay = 1,
				Act = ACT_VM_MISSCENTER,
				Sound = {
					"AxeHitBody",
					"AxeSwing",
					"AxeHitWall"
				}
			}
		},
		ViewOffset = {
			Pos = Vector(-6, 0, 6)
		},
		ChargeOffset = {
			Pos = Vector(-15, 0, -10),
			Ang = Angle(-35, 0, 0)
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
		__name = "Axe",
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
	Axe = _class_0
	return _class_0
end
