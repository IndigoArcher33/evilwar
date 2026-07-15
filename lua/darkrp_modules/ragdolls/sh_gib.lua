-- [yue]: darkrp_modules\ragdolls\sh_gib.yue
local Gib -- 1
do -- 1
	local _class_0 -- 1
	local _parent_0 = ENTITY -- 1
	local _base_0 = { -- 1
		Base = "base_anim", -- 3
		Type = "anim", -- 4
		Spawnable = true, -- 5
		AdminSpawnable = true, -- 6
		Pocketable = false, -- 7
		Initialize = function(self) -- 7
			if CLIENT then -- 8
				return -- 8
			end -- 8
			self:PhysicsInit(SOLID_VPHYSICS) -- 9
			self:SetCollisionGroup(COLLISION_GROUP_WEAPON) -- 10
			self:SetUseType(SIMPLE_USE) -- 11
			local phys = self:GetPhysicsObject() -- 12
			if phys and IsValid(phys) then -- 13
				return phys:Wake() -- 13
			end -- 13
		end, -- 14
		PhysicsCollide = function(self, data, physobj) -- 14
			if data.Speed >= 64 then -- 15
				local ed = EffectData() -- 16
				ed:SetStart(self:GetPos()) -- 18
				ed:SetOrigin(self:GetPos()) -- 19
				ed:SetScale(8) -- 20
				util.Effect("BloodImpact", ed, true, true) -- 21
				util.Decal("Blood", data.HitPos - data.HitNormal, data.HitPos + data.HitNormal) -- 22
				if self:GetModel() == "models/in/player/head.mdl" then -- 25
					return self:EmitSound("physics/flesh/flesh_squishy_impact_hard" .. tostring(math.random(1, 4)) .. ".wav", 60, math.random(70, 110)) -- 28
				else -- 30
					return self:EmitSound("physics/flesh/flesh_bloody_impact_hard1.wav", 60, math.random(70, 110)) -- 32
				end -- 25
			end -- 15
		end, -- 33
		OnTakeDamage = function(self, dmg) -- 33
			self:TakePhysicsDamage(dmg) -- 34
			local dt = dmg:GetDamageType() -- 35
			if (self:GetModel() ~= "models/in/player/head.mdl") and (dt == DMG_SLASH or dt == DMG_CLUB) then -- 36
				local ed = EffectData() -- 37
				ed:SetStart(self:GetPos()) -- 39
				ed:SetOrigin(self:GetPos()) -- 40
				ed:SetScale(8) -- 41
				util.Effect("BloodImpact", ed, true, true) -- 42
				return self:Remove() -- 43
			end -- 36
		end -- 1
	} -- 1
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 43
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 1
			_base_0[_key_0] = _val_0 -- 1
		end -- 1
	end -- 43
	if _base_0.__index == nil then -- 1
		_base_0.__index = _base_0 -- 1
	end -- 43
	setmetatable(_base_0, _parent_0.__base) -- 1
	_class_0 = setmetatable({ -- 1
		__init = function(self, ...) -- 1
			return _class_0.__parent.__init(self, ...) -- 1
		end, -- 1
		__base = _base_0, -- 1
		__name = "Gib", -- 1
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
	Gib = _class_0 -- 1
	return _class_0 -- 43
end -- 43
