-- [yue]: darkrp_modules\machines\sh_fuel.yue
local Fuel -- 1
do -- 1
	local _class_0 -- 1
	local _parent_0 = ITEM -- 1
	local _base_0 = { -- 1
		Spawnable = true, -- 5
		Model = Model("models/props_junk/metalgascan.mdl"), -- 7
		PrintName = "Biofuel", -- 8
		Description = "A big ol' jerrycan full of corpse oil-turned-generator juice.", -- 9
		UseText = { -- 10
			"lifts a heavy jerrycan to his lips and chugs some strong-smelling, fuming oil.", -- 10
			"unscrews a jerrycan, gets a good sniff of corpse oil fumes, bends backwards -- and FUCKING DRINKS IT." -- 11
		}, -- 14
		FuelAdd = 15, -- 16
		TrashClass = "trash/fuel", -- 18
		OnlyInventoryUse = false, -- 20
		Sound = "DrinkFluid", -- 22
		OnUseFinish = function(self, ply) -- 22
			_class_0.__parent.__base.OnUseFinish(self, ply) -- 23
			local dmg = DamageInfo() -- 24
			dmg:SetDamage(25) -- 26
			dmg:SetDamageType(DMG_NERVEGAS) -- 27
			dmg:SetAttacker(ply) -- 28
			dmg:SetInflictor(self) -- 29
			dmg:SetDamagePosition(ply:EyePos()) -- 30
			ply:TakeDamageInfo(dmg) -- 31
			return self:Trash() -- 32
		end, -- 34
		Explode = function(self) -- 34
			if self.exploding then -- 35
				return -- 35
			end -- 35
			self.exploding = true -- 36
			util.ScreenShake(self:GetPos(), 25, 150, 1, 750) -- 37
			local explo = ents.Create("env_explosion") -- 38
			explo:SetOwner(self) -- 40
			explo:SetPos(self:GetPos()) -- 41
			explo:SetKeyValue("iMagnitude", self.FuelAdd * 2.5) -- 42
			explo:SetKeyValue("iRadiusOverride", math.min(400, self.FuelAdd * 1.5)) -- 43
			explo:Spawn() -- 44
			explo:Activate() -- 45
			explo:Fire("Explode") -- 46
			local fire_ent = ents.Create("env_fire") -- 47
			fire_ent:SetPos(self:GetPos()) -- 49
			fire_ent:SetKeyValue("spawnflags", "1") -- 50
			fire_ent:SetKeyValue("attack", tostring(math.random(10, 15))) -- 51
			fire_ent:SetKeyValue("firesize", tostring(math.random(100, 150))) -- 52
			fire_ent:Spawn() -- 53
			fire_ent:Activate() -- 54
			fire_ent:Fire("Enable", "", del) -- 55
			fire_ent:Fire("StartFire", "", del) -- 56
			SafeRemoveEntityDelayed(fire_ent, math.random(60, 70)) -- 57
			local victims = ents.FindInSphere(self:GetPos(), self.FuelAdd * 6) -- 58
			for _index_0 = 1, #victims do -- 59
				local victim = victims[_index_0] -- 59
				local ignition = false -- 60
				if victim:IsPlayer() and victim:Alive() then -- 61
					ignition = true -- 61
				end -- 61
				if victim:GetClass() == "prop_physics" then -- 62
					ignition = true -- 62
				end -- 62
				if ignition then -- 63
					victim:Ignite(math.random(5, 10)) -- 63
				end -- 63
			end -- 63
			return self:Remove() -- 64
		end -- 1
	} -- 1
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 64
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 1
			_base_0[_key_0] = _val_0 -- 1
		end -- 1
	end -- 64
	if _base_0.__index == nil then -- 1
		_base_0.__index = _base_0 -- 1
	end -- 64
	setmetatable(_base_0, _parent_0.__base) -- 1
	_class_0 = setmetatable({ -- 1
		__init = function(self, ...) -- 1
			return _class_0.__parent.__init(self, ...) -- 1
		end, -- 1
		__base = _base_0, -- 1
		__name = "Fuel", -- 1
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
	local self = _class_0; -- 1
	self.__entity = "fuel" -- 2
	if _parent_0.__inherited then -- 1
		_parent_0.__inherited(_parent_0, _class_0) -- 1
	end -- 1
	Fuel = _class_0 -- 1
	return _class_0 -- 64
end -- 64
