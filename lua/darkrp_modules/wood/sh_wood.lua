-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/wood/sh_wood.yue
local Submit_Wood -- 1
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
		__name = "Submit_Wood", -- 1
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
	Submit_Wood = _class_0 -- 1
end -- 2
local Wood -- 4
do -- 4
	local _class_0 -- 4
	local _parent_0 = ITEM -- 4
	local _base_0 = { -- 4
		Spawnable = true, -- 8
		Category = "EvilRP: Precursor", -- 10
		Sound = "npc/barnacle/neck_snap" .. tostring(math.random(1, 2)) .. ".wav", -- 12
		SubmitSound = "Submit_Wood", -- 14
		Submitted = function(self) -- 14
			local pos = self:GetPos() -- 15
			local ed = EffectData() -- 16
			ed:SetOrigin(pos) -- 18
			ed:SetScale(1) -- 19
			ed:SetMagnitude(1) -- 20
			ed:SetRadius(3) -- 21
			return util.Effect("Sparks", ed) -- 22
		end, -- 24
		OnlyInventoryUse = false, -- 26
		OnUseFinish = function(self, ply) -- 26
			_class_0.__parent.__base.OnUseFinish(self, ply) -- 27
			local dmg = DamageInfo() -- 28
			dmg:SetDamage(self.BiteDamage) -- 30
			dmg:SetDamageType(DMG_SLASH) -- 31
			dmg:SetAttacker(ply) -- 32
			dmg:SetInflictor(self) -- 33
			dmg:SetDamagePosition(ply:EyePos()) -- 34
			ply:TakeDamageInfo(dmg) -- 35
			return self:Remove() -- 36
		end -- 4
	} -- 4
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 37
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 4
			_base_0[_key_0] = _val_0 -- 4
		end -- 4
	end -- 37
	if _base_0.__index == nil then -- 4
		_base_0.__index = _base_0 -- 4
	end -- 37
	setmetatable(_base_0, _parent_0.__base) -- 4
	_class_0 = setmetatable({ -- 4
		__init = function(self, ...) -- 4
			return _class_0.__parent.__init(self, ...) -- 4
		end, -- 4
		__base = _base_0, -- 4
		__name = "Wood", -- 4
		__parent = _parent_0 -- 4
	}, { -- 4
		__index = function(cls, name) -- 4
			local val = rawget(_base_0, name) -- 4
			if val == nil then -- 4
				local parent = rawget(cls, "__parent") -- 4
				if parent then -- 4
					return parent[name] -- 4
				end -- 4
			else -- 4
				return val -- 4
			end -- 4
		end, -- 4
		__call = function(cls, ...) -- 4
			local _self_0 = setmetatable({ }, _base_0) -- 4
			cls.__init(_self_0, ...) -- 4
			return _self_0 -- 4
		end -- 4
	}) -- 4
	_base_0.__class = _class_0 -- 4
	local self = _class_0; -- 4
	self.__entity = "wood" -- 5
	if _parent_0.__inherited then -- 4
		_parent_0.__inherited(_parent_0, _class_0) -- 4
	end -- 4
	Wood = _class_0 -- 4
end -- 37
local Scrap -- 38
local _class_0 -- 38
local _parent_0 = Wood -- 38
local _base_0 = { -- 38
	Model = Model("models/gibs/wood_gib01a.mdl"), -- 41
	PrintName = "Scrap Wood", -- 42
	Description = "A rough wedge of a tree's flesh.", -- 43
	UseText = { -- 44
		"%s swallows splinters trying to gnaw on a hunk of wood." -- 44
	}, -- 47
	BiteDamage = 25, -- 49
	Precursor = { -- 50
		wood = 1 -- 50
	} -- 38
} -- 38
for _key_0, _val_0 in pairs(_parent_0.__base) do -- 50
	if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 38
		_base_0[_key_0] = _val_0 -- 38
	end -- 38
end -- 50
if _base_0.__index == nil then -- 38
	_base_0.__index = _base_0 -- 38
end -- 50
setmetatable(_base_0, _parent_0.__base) -- 38
_class_0 = setmetatable({ -- 38
	__init = function(self, ...) -- 38
		return _class_0.__parent.__init(self, ...) -- 38
	end, -- 38
	__base = _base_0, -- 38
	__name = "Scrap", -- 38
	__parent = _parent_0 -- 38
}, { -- 38
	__index = function(cls, name) -- 38
		local val = rawget(_base_0, name) -- 38
		if val == nil then -- 38
			local parent = rawget(cls, "__parent") -- 38
			if parent then -- 38
				return parent[name] -- 38
			end -- 38
		else -- 38
			return val -- 38
		end -- 38
	end, -- 38
	__call = function(cls, ...) -- 38
		local _self_0 = setmetatable({ }, _base_0) -- 38
		cls.__init(_self_0, ...) -- 38
		return _self_0 -- 38
	end -- 38
}) -- 38
_base_0.__class = _class_0 -- 38
if _parent_0.__inherited then -- 38
	_parent_0.__inherited(_parent_0, _class_0) -- 38
end -- 38
Scrap = _class_0 -- 38
return _class_0 -- 50
