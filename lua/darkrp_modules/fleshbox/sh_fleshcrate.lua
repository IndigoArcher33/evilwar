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
	"evilrp_weapon/trooper", -- 26
	"evilrp_weapon/enforcer", -- 27
	"evilrp_weapon/enforcer", -- 28
	"evilrp_weapon/enforcer", -- 29
	"evilrp_weapon/subjugator", -- 30
	"evilrp_weapon/subjugator" -- 31
} -- 5
local Crate -- 34
do -- 34
	local _class_0 -- 34
	local _parent_0 = ITEM -- 34
	local _base_0 = { -- 34
		Spawnable = true, -- 38
		Pocketable = false, -- 40
		PrintName = "Crate", -- 41
		Model = Model("models/props_junk/garbage_plasticbottle002a.mdl"), -- 42
		Material = Material("models/gibs/humans/brain_gib"), -- 43
		Category = "EvilWar: Precursor", -- 44
		Spawnable = true, -- 45
		Interesting = true, -- 47
		Sound = "npc/barnacle/neck_snap" .. tostring(math.random(1, 2)) .. ".wav", -- 49
		SubmitSound = "Submit_Crate", -- 51
		Submitted = function(self) -- 51
			local pos = self:GetPos() -- 52
			local ed = EffectData() -- 53
			ed:SetOrigin(pos) -- 55
			ed:SetScale(1) -- 56
			ed:SetMagnitude(1) -- 57
			ed:SetRadius(3) -- 58
			return util.Effect("Sparks", ed) -- 59
		end, -- 61
		OnlyInventoryUse = false -- 34
	} -- 34
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 61
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 34
			_base_0[_key_0] = _val_0 -- 34
		end -- 34
	end -- 61
	if _base_0.__index == nil then -- 34
		_base_0.__index = _base_0 -- 34
	end -- 61
	setmetatable(_base_0, _parent_0.__base) -- 34
	_class_0 = setmetatable({ -- 34
		__init = function(self, ...) -- 34
			return _class_0.__parent.__init(self, ...) -- 34
		end, -- 34
		__base = _base_0, -- 34
		__name = "Crate", -- 34
		__parent = _parent_0 -- 34
	}, { -- 34
		__index = function(cls, name) -- 34
			local val = rawget(_base_0, name) -- 34
			if val == nil then -- 34
				local parent = rawget(cls, "__parent") -- 34
				if parent then -- 34
					return parent[name] -- 34
				end -- 34
			else -- 34
				return val -- 34
			end -- 34
		end, -- 34
		__call = function(cls, ...) -- 34
			local _self_0 = setmetatable({ }, _base_0) -- 34
			cls.__init(_self_0, ...) -- 34
			return _self_0 -- 34
		end -- 34
	}) -- 34
	_base_0.__class = _class_0 -- 34
	local self = _class_0; -- 34
	self.__entity = "crate" -- 35
	if _parent_0.__inherited then -- 34
		_parent_0.__inherited(_parent_0, _class_0) -- 34
	end -- 34
	Crate = _class_0 -- 34
end -- 61
local Fleshcrate -- 64
do -- 64
	local _class_0 -- 64
	local _parent_0 = Crate -- 64
	local _base_0 = { -- 64
		Model = Model("models/props/de_prodigy/ammo_can_02.mdl"), -- 66
		Material = Material("models/gibs/humans/brain_gib"), -- 68
		PrintName = "Flesh Crate", -- 69
		Description = "A crate held shut by decayed flesh.\nCan be opened in a Refinery.", -- 70
		UseText = { -- 71
			"%s can't get it open.", -- 71
			"%s struggles to crack open the crate.", -- 72
			"%s looks like an idiot." -- 73
		}, -- 76
		BiteDamage = 34, -- 78
		Refinement = { -- 79
			result = weapons[math.random(1, #weapons)], -- 79
			time = 6 -- 80
		} -- 64
	} -- 64
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 80
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 64
			_base_0[_key_0] = _val_0 -- 64
		end -- 64
	end -- 80
	if _base_0.__index == nil then -- 64
		_base_0.__index = _base_0 -- 64
	end -- 80
	setmetatable(_base_0, _parent_0.__base) -- 64
	_class_0 = setmetatable({ -- 64
		__init = function(self, ...) -- 64
			return _class_0.__parent.__init(self, ...) -- 64
		end, -- 64
		__base = _base_0, -- 64
		__name = "Fleshcrate", -- 64
		__parent = _parent_0 -- 64
	}, { -- 64
		__index = function(cls, name) -- 64
			local val = rawget(_base_0, name) -- 64
			if val == nil then -- 64
				local parent = rawget(cls, "__parent") -- 64
				if parent then -- 64
					return parent[name] -- 64
				end -- 64
			else -- 64
				return val -- 64
			end -- 64
		end, -- 64
		__call = function(cls, ...) -- 64
			local _self_0 = setmetatable({ }, _base_0) -- 64
			cls.__init(_self_0, ...) -- 64
			return _self_0 -- 64
		end -- 64
	}) -- 64
	_base_0.__class = _class_0 -- 64
	if _parent_0.__inherited then -- 64
		_parent_0.__inherited(_parent_0, _class_0) -- 64
	end -- 64
	Fleshcrate = _class_0 -- 64
	return _class_0 -- 80
end -- 80
