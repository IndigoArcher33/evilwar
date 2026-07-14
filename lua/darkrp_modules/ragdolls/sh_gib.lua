local Gib
do
	local _class_0
	local _parent_0 = ENTITY
	local _base_0 = {
		Base = "base_anim",
		Type = "anim",
		Spawnable = true,
		AdminSpawnable = true,
		Pocketable = false,
		Initialize = function(self)
			if CLIENT then
				return
			end
			self:PhysicsInit(SOLID_VPHYSICS)
			self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
			self:SetUseType(SIMPLE_USE)
			local phys = self:GetPhysicsObject()
			if phys and IsValid(phys) then
				return phys:Wake()
			end
		end,
		PhysicsCollide = function(self, data, physobj)
			if data.Speed >= 64 then
				local ed = EffectData()
				ed:SetStart(self:GetPos())
				ed:SetOrigin(self:GetPos())
				ed:SetScale(8)
				util.Effect("BloodImpact", ed, true, true)
				util.Decal("Blood", data.HitPos - data.HitNormal, data.HitPos + data.HitNormal)
				if self:GetModel() == "models/in/player/head.mdl" then
					return self:EmitSound("physics/flesh/flesh_squishy_impact_hard" .. tostring(math.random(1, 4)) .. ".wav", 60, math.random(70, 110))
				else
					return self:EmitSound("physics/flesh/flesh_bloody_impact_hard1.wav", 60, math.random(70, 110))
				end
			end
		end,
		OnTakeDamage = function(self, dmg)
			self:TakePhysicsDamage(dmg)
			local dt = dmg:GetDamageType()
			if (self:GetModel() ~= "models/in/player/head.mdl") and (dt == DMG_SLASH or dt == DMG_CLUB) then
				local ed = EffectData()
				ed:SetStart(self:GetPos())
				ed:SetOrigin(self:GetPos())
				ed:SetScale(8)
				util.Effect("BloodImpact", ed, true, true)
				return self:Remove()
			end
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
		__name = "Gib",
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
	Gib = _class_0
	return _class_0
end
