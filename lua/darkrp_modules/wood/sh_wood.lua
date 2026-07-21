local Submit_Wood
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
		__name = "Submit_Wood",
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
	Submit_Wood = _class_0
end
local Wood
do
	local _class_0
	local _parent_0 = ITEM
	local _base_0 = {
		Spawnable = true,
		PrintName = "Wood",
		Model = Model("models/props_junk/garbage_plasticbottle002a.mdl"),
		Category = "EvilRP: Precursor",
		Spawnable = true,
		Interesting = true,
		Sound = "npc/barnacle/neck_snap" .. tostring(math.random(1, 2)) .. ".wav",
		SubmitSound = "Submit_Wood",
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
		__name = "Wood",
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
	self.__entity = "wood"
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Wood = _class_0
end
local Scrap
local _class_0
local _parent_0 = Wood
local _base_0 = {
	Model = Model("models/gibs/wood_gib01a.mdl"),
	PrintName = "Scrap Wood",
	Description = "A rough wedge of a tree's flesh.",
	UseText = {
		"%s swallows splinters trying to gnaw on a hunk of wood."
	},
	BiteDamage = 25,
	Precursor = {
		wood = 1
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
	__name = "Scrap",
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
Scrap = _class_0
return _class_0
