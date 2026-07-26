-- [yue]: darkrp_modules\fleshbox\sh_fleshcrate.yue
local Submit_Crate -- 1
do -- 1
	local _class_0 -- 1
	local _parent_0 = SOUND -- 1
	local _base_0 = { -- 1
		sound = (function() -- 2
			local _accum_0 = { } -- 2
			local _len_0 = 1 -- 2
			for i = 1, 2 do -- 2
				_accum_0[_len_0] = "weapons/crowbar/crowbar_impact" .. tostring(i) .. ".wav" -- 2
				_len_0 = _len_0 + 1 -- 2
			end -- 2
			return _accum_0 -- 2
		end)() -- 1
	} -- 1
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 2
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 1
			_base_0[_key_0] = _val_0 -- 1
		end -- 1
	end -- 2
	if _base_0.__index == nil then -- 1
		_base_0.__index = _base_0 -- 1
	end -- 2
	setmetatable(_base_0, _parent_0.__base) -- 1
	_class_0 = setmetatable({ -- 1
		__init = function(self, ...) -- 1
			return _class_0.__parent.__init(self, ...) -- 1
		end, -- 1
		__base = _base_0, -- 1
		__name = "Submit_Crate", -- 1
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
	Submit_Crate = _class_0 -- 1
end -- 2
local weapons = { -- 6
	"evilrp_weapon/obrez", -- 6
	"evilrp_weapon/obrez", -- 7
	"evilrp_weapon/obrez", -- 8
	"evilrp_weapon/obrez", -- 9
	"evilrp_weapon/obrez", -- 10
	"evilrp_weapon/pacifier", -- 11
	"evilrp_weapon/pacifier", -- 12
	"evilrp_weapon/pacifier", -- 13
	"evilrp_weapon/painkiller", -- 14
	"evilrp_weapon/painkiller", -- 15
	"evilrp_weapon/painkiller", -- 16
	"evilrp_weapon/greaser", -- 17
	"evilrp_weapon/greaser", -- 18
	"evilrp_weapon/greaser", -- 19
	"evilrp_weapon/greaser", -- 20
	"evilrp_weapon/greaser", -- 21
	"evilrp_weapon/owler", -- 22
	"evilrp_weapon/owler", -- 23
	"evilrp_weapon/owler", -- 24
	"evilrp_weapon/owler", -- 25
	"evilrp_weapon/enforcer" -- 26
} -- 5
local Crate -- 29
do -- 29
	local _class_0 -- 29
	local _parent_0 = ITEM -- 29
	local _base_0 = { -- 29
		Spawnable = true, -- 33
		Pocketable = true, -- 35
		PrintName = "Crate", -- 36
		Model = Model("models/props_junk/garbage_plasticbottle002a.mdl"), -- 37
		Material = Material("models/gibs/humans/brain_gib"), -- 38
		Category = "EvilWar: Precursor", -- 39
		Spawnable = true, -- 40
		Interesting = true, -- 42
		Sound = "npc/barnacle/neck_snap" .. tostring(math.random(1, 2)) .. ".wav", -- 44
		SubmitSound = "Submit_Crate", -- 46
		Submitted = function(self) -- 46
			local pos = self:GetPos() -- 47
			local ed = EffectData() -- 48
			ed:SetOrigin(pos) -- 50
			ed:SetScale(1) -- 51
			ed:SetMagnitude(1) -- 52
			ed:SetRadius(3) -- 53
			return util.Effect("Sparks", ed) -- 54
		end, -- 56
		OnlyInventoryUse = false -- 29
	} -- 29
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 56
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 29
			_base_0[_key_0] = _val_0 -- 29
		end -- 29
	end -- 56
	if _base_0.__index == nil then -- 29
		_base_0.__index = _base_0 -- 29
	end -- 56
	setmetatable(_base_0, _parent_0.__base) -- 29
	_class_0 = setmetatable({ -- 29
		__init = function(self, ...) -- 29
			return _class_0.__parent.__init(self, ...) -- 29
		end, -- 29
		__base = _base_0, -- 29
		__name = "Crate", -- 29
		__parent = _parent_0 -- 29
	}, { -- 29
		__index = function(cls, name) -- 29
			local val = rawget(_base_0, name) -- 29
			if val == nil then -- 29
				local parent = rawget(cls, "__parent") -- 29
				if parent then -- 29
					return parent[name] -- 29
				end -- 29
			else -- 29
				return val -- 29
			end -- 29
		end, -- 29
		__call = function(cls, ...) -- 29
			local _self_0 = setmetatable({ }, _base_0) -- 29
			cls.__init(_self_0, ...) -- 29
			return _self_0 -- 29
		end -- 29
	}) -- 29
	_base_0.__class = _class_0 -- 29
	local self = _class_0; -- 29
	self.__entity = "crate" -- 30
	if _parent_0.__inherited then -- 29
		_parent_0.__inherited(_parent_0, _class_0) -- 29
	end -- 29
	Crate = _class_0 -- 29
end -- 56
local Fleshcrate -- 59
do -- 59
	local _class_0 -- 59
	local _parent_0 = Crate -- 59
	local _base_0 = { -- 59
		Model = Model("models/props/de_prodigy/ammo_can_02.mdl"), -- 61
		Material = Material("models/gibs/humans/brain_gib"), -- 63
		PrintName = "Flesh Crate", -- 64
		Description = "A crate held shut by decayed flesh.\nCan be opened in a Refinery.", -- 65
		UseText = { -- 66
			"%s can't get it open.", -- 66
			"%s struggles to crack open the crate.", -- 67
			"%s looks like an idiot." -- 68
		}, -- 71
		BiteDamage = 34, -- 73
		Refinement = { -- 74
			result = weapons[math.random(1, #weapons)], -- 74
			time = 6 -- 75
		} -- 59
	} -- 59
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 75
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 59
			_base_0[_key_0] = _val_0 -- 59
		end -- 59
	end -- 75
	if _base_0.__index == nil then -- 59
		_base_0.__index = _base_0 -- 59
	end -- 75
	setmetatable(_base_0, _parent_0.__base) -- 59
	_class_0 = setmetatable({ -- 59
		__init = function(self, ...) -- 59
			return _class_0.__parent.__init(self, ...) -- 59
		end, -- 59
		__base = _base_0, -- 59
		__name = "Fleshcrate", -- 59
		__parent = _parent_0 -- 59
	}, { -- 59
		__index = function(cls, name) -- 59
			local val = rawget(_base_0, name) -- 59
			if val == nil then -- 59
				local parent = rawget(cls, "__parent") -- 59
				if parent then -- 59
					return parent[name] -- 59
				end -- 59
			else -- 59
				return val -- 59
			end -- 59
		end, -- 59
		__call = function(cls, ...) -- 59
			local _self_0 = setmetatable({ }, _base_0) -- 59
			cls.__init(_self_0, ...) -- 59
			return _self_0 -- 59
		end -- 59
	}) -- 59
	_base_0.__class = _class_0 -- 59
	if _parent_0.__inherited then -- 59
		_parent_0.__inherited(_parent_0, _class_0) -- 59
	end -- 59
	Fleshcrate = _class_0 -- 59
	return _class_0 -- 75
end -- 75
