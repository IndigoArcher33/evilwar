local Submit_Polymer
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 2 do
				_accum_0[_len_0] = "physics/plastic/plastic_barrel_break" .. tostring(i) .. ".wav"
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
		__name = "Submit_Polymer",
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
	Submit_Polymer = _class_0
end
local Polymer
do
	local _class_0
	local _parent_0 = ITEM
	local _base_0 = {
		Spawnable = true,
		PrintName = "Polymer",
		Model = Model("models/props_junk/garbage_plasticbottle002a.mdl"),
		Category = "EvilWar: Precursor",
		Spawnable = true,
		Interesting = true,
		Sound = "physics/plastic/plastic_box_strain" .. tostring(math.random(1, 2, 3)) .. ".wav",
		SubmitSound = "Submit_Polymer",
		Submitted = function(self)
			local pos = self:GetPos()
			local ed = EffectData()
			ed:SetOrigin(pos)
			ed:SetScale(1)
			ed:SetMagnitude(1)
			ed:SetRadius(3)
			return util.Effect("Sparks", ed)
		end,
		OnlyInventoryUse = false,
		OnUseFinish = function(self, ply)
			_class_0.__parent.__base.OnUseFinish(self, ply)
			local dmg = DamageInfo()
			dmg:SetDamage(self.BiteDamage)
			dmg:SetDamageType(DMG_SLASH)
			dmg:SetAttacker(ply)
			dmg:SetInflictor(self)
			dmg:SetDamagePosition(ply:EyePos())
			ply:TakeDamageInfo(dmg)
			return self:Remove()
		end
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
		__name = "Polymer",
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
	self.__entity = "polymer"
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Polymer = _class_0
end
local Pure
do
	local _class_0
	local _parent_0 = Polymer
	local _base_0 = {
		Model = Model("models/props_junk/plasticbucket001a.mdl"),
		PrintName = "Plastic Polymer",
		Description = "A pure block of plastic.",
		UseText = {
			"%s chokes on perfection.",
			"%s cracks a molar on pure plastic.",
			"%s lets the pure plastic melt in their stomach.",
			"%s cracks their jaw on a hunk of polymer."
		},
		BiteDamage = 25,
		CookTime = 5,
		Precursor = {
			polymer = 1
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
		__name = "Pure",
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
	Pure = _class_0
end
local Refined
local _class_0
local _parent_0 = Polymer
local _base_0 = {
	Model = Model("models/Items/CrossbowRounds.mdl"),
	PrintName = "Pure Plastic",
	Description = "A small bundle of recycled plastic.\nCan be cooked into a usable chunk.",
	UseText = {
		"%s chokes on the plastic tubes.",
		"%s doubled their chance of getting cancer.",
		"%s hurts their mouth chewing on hard plastic."
	},
	BiteDamage = 34
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
	__name = "Refined",
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
Refined = _class_0
return _class_0
