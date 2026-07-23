local Submit_Crate
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 2 do
				_accum_0[_len_0] = "weapons/crowbar/crowbar_impact" .. tostring(i) .. ".wav"
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
		__name = "Submit_Crate",
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
	Submit_Crate = _class_0
end
local weapons = {
	"evilrp_weapon/obrez",
	"evilrp_weapon/obrez",
	"evilrp_weapon/obrez",
	"evilrp_weapon/obrez",
	"evilrp_weapon/obrez",
	"evilrp_weapon/pacifier",
	"evilrp_weapon/pacifier",
	"evilrp_weapon/pacifier",
	"evilrp_weapon/painkiller",
	"evilrp_weapon/painkiller",
	"evilrp_weapon/painkiller",
	"evilrp_weapon/greaser",
	"evilrp_weapon/greaser",
	"evilrp_weapon/greaser",
	"evilrp_weapon/greaser",
	"evilrp_weapon/greaser",
	"evilrp_weapon/owler",
	"evilrp_weapon/owler",
	"evilrp_weapon/owler",
	"evilrp_weapon/owler",
	"evilrp_weapon/trooper",
	"evilrp_weapon/enforcer",
	"evilrp_weapon/enforcer",
	"evilrp_weapon/enforcer",
	"evilrp_weapon/subjugator",
	"evilrp_weapon/subjugator"
}
local Crate
do
	local _class_0
	local _parent_0 = ITEM
	local _base_0 = {
		Spawnable = true,
		Pocketable = false,
		PrintName = "Crate",
		Model = Model("models/props_junk/garbage_plasticbottle002a.mdl"),
		Material = Material("models/gibs/humans/brain_gib"),
		Category = "EvilWar: Precursor",
		Spawnable = true,
		Interesting = true,
		Sound = "npc/barnacle/neck_snap" .. tostring(math.random(1, 2)) .. ".wav",
		SubmitSound = "Submit_Crate",
		Submitted = function(self)
			local pos = self:GetPos()
			local ed = EffectData()
			ed:SetOrigin(pos)
			ed:SetScale(1)
			ed:SetMagnitude(1)
			ed:SetRadius(3)
			return util.Effect("Sparks", ed)
		end,
		OnlyInventoryUse = false
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
		__name = "Crate",
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
	local self = _class_0;
	self.__entity = "crate"
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Crate = _class_0
end
local Fleshcrate
local _class_0
local _parent_0 = Crate
local _base_0 = {
	Model = Model("models/props/de_prodigy/ammo_can_02.mdl"),
	Material = Material("models/gibs/humans/brain_gib"),
	PrintName = "Flesh Crate",
	Description = "A crate held shut by decayed flesh.\nCan be opened in a Refinery.",
	UseText = {
		"%s can't get it open.",
		"%s struggles to crack open the crate.",
		"%s looks like an idiot."
	},
	BiteDamage = 34,
	Refinement = {
		result = weapons[math.random(1, #weapons)],
		time = 6
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
	__name = "Fleshcrate",
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
Fleshcrate = _class_0
return _class_0
