local Fuel
do
	local _class_0
	local _parent_0 = ITEM
	local _base_0 = {
		Spawnable = true,
		Model = Model("models/props_junk/metalgascan.mdl"),
		PrintName = "Biofuel",
		Description = "A big ol' jerrycan full of corpse oil-turned-generator juice.",
		UseText = {
			"lifts a heavy jerrycan to his lips and chugs some strong-smelling, fuming oil.",
			"unscrews a jerrycan, gets a good sniff of corpse oil fumes, bends backwards -- and FUCKING DRINKS IT."
		},
		FuelAdd = 15,
		TrashClass = "trash/fuel",
		OnlyInventoryUse = false,
		Sound = "DrinkFluid",
		OnUseFinish = function(self, ply)
			_class_0.__parent.__base.OnUseFinish(self, ply)
			local dmg = DamageInfo()
			dmg:SetDamage(25)
			dmg:SetDamageType(DMG_NERVEGAS)
			dmg:SetAttacker(ply)
			dmg:SetInflictor(self)
			dmg:SetDamagePosition(ply:EyePos())
			ply:TakeDamageInfo(dmg)
			return self:Trash()
		end,
		Explode = function(self)
			if self.exploding then
				return
			end
			self.exploding = true
			util.ScreenShake(self:GetPos(), 25, 150, 1, 750)
			local explo = ents.Create("env_explosion")
			explo:SetOwner(self)
			explo:SetPos(self:GetPos())
			explo:SetKeyValue("iMagnitude", self.FuelAdd * 2.5)
			explo:SetKeyValue("iRadiusOverride", math.min(400, self.FuelAdd * 1.5))
			explo:Spawn()
			explo:Activate()
			explo:Fire("Explode")
			local fire_ent = ents.Create("env_fire")
			fire_ent:SetPos(self:GetPos())
			fire_ent:SetKeyValue("spawnflags", "1")
			fire_ent:SetKeyValue("attack", tostring(math.random(10, 15)))
			fire_ent:SetKeyValue("firesize", tostring(math.random(100, 150)))
			fire_ent:Spawn()
			fire_ent:Activate()
			fire_ent:Fire("Enable", "", del)
			fire_ent:Fire("StartFire", "", del)
			SafeRemoveEntityDelayed(fire_ent, math.random(60, 70))
			local victims = ents.FindInSphere(self:GetPos(), self.FuelAdd * 6)
			for _index_0 = 1, #victims do
				local victim = victims[_index_0]
				local ignition = false
				if victim:IsPlayer() and victim:Alive() then
					ignition = true
				end
				if victim:GetClass() == "prop_physics" then
					ignition = true
				end
				if ignition then
					victim:Ignite(math.random(5, 10))
				end
			end
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
		__name = "Fuel",
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
	self.__entity = "fuel"
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Fuel = _class_0
	return _class_0
end
