local Equip_Weapon
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 3 do
				_accum_0[_len_0] = "dysphoria/weapons/wield_gun" .. tostring(i) .. ".ogg"
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
		__name = "Equip_Weapon",
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
	Equip_Weapon = _class_0
end
local SpawnedWeapon
do
	local _class_0
	local _parent_0 = ITEM
	local _base_0 = {
		PrintName = "Spawned Weapon",
		Spawnable = false,
		IsSpawnedWeapon = true,
		Interesting = true,
		ImpactSound = {
			soft = "weapon.ImpactSoft",
			hard = "weapon.ImpactHard"
		},
		SetupDataTables = function(self)
			_class_0.__parent.__base.SetupDataTables(self)
			return self:NetworkVar("String", "WeaponClass")
		end,
		Draw = function(self)
			local ret = hook.Call("onDrawSpawnedWeapon", nil, self)
			if ret ~= nil then
				return
			end
			return self:DrawModel()
		end,
		PMRender = function(item)
			local ct = { }
			if item.wepcls then
				local wt = weapons.Get(item.wepcls)
				ct[#ct + 1] = wt.PrintName
				if wt.Description then
					ct[#ct + 1] = ""
				end
				ct[#ct + 1] = {
					text = wt.Description,
					font = "Spleen_Label_Small"
				}
				return ct
			end
		end,
		HUDRender = function(self)
			local ct = { }
			local wt = weapons.Get(self:GetWeaponClass())
			ct[#ct + 1] = wt.PrintName
			if wt.Description then
				ct[#ct + 1] = ""
				ct[#ct + 1] = {
					text = wt.Description,
					font = "Spleen_Label_Small"
				}
			end
			return ct
		end,
		Sound = "Equip_Weapon",
		Initialize = function(self)
			if SERVER then
				DarkRP.ValidatedPhysicsInit(self, SOLID_VPHYSICS, "The issue lies with weapon \"" .. tostring(self:GetWeaponClass() or 'unknown') .. "\"")
				self:SetMoveType(MOVETYPE_VPHYSICS)
				self:SetSolid(SOLID_VPHYSICS)
				return self:PhysWake()
			end
		end,
		OnTakeDamage = function(self, dmg)
			return self:TakePhysicsDamage(dmg)
		end,
		OnUseFinish = function(self, ply)
			_class_0.__parent.__base.OnUseFinish(self, ply)
			local cls = self:GetWeaponClass()
			if ply:HasWeapon(cls) then
				return
			end
			local wep = ply:Give(cls, true)
			ply:SelectWeapon(cls)
			self:GivePlayerAmmo(ply, wep, false)
			return self:Remove()
		end,
		GivePlayerAmmo = function(self, ply, weapon, had_weapon)
			local primary_ammo_type = weapon:GetPrimaryAmmoType()
			local secondary_ammo_type = weapon:GetSecondaryAmmoType()
			local clip1, clip2 = self.clip1, self.clip2
			if had_weapon then
				if clip2 and clip2 > 0 and weapon:Clip2() ~= -1 then
					weapon:SetClip2(weapon:Clip2() + clip2)
					clip2 = 0
				end
			else
				if clip1 and clip1 ~= -1 and weapon:Clip1() ~= -1 then
					weapon:SetClip1(clip1)
					clip1 = 0
				end
				if clip2 and clip2 ~= -1 and weapon:Clip2() ~= -1 then
					weapon:SetClip2(clip2)
				end
			end
			if primary_ammo_type > 0 then
				local prim_ammo = ply:GetAmmoCount(primary_ammo_type)
				prim_ammo = prim_ammo + ((self.ammoadd or 0) + (clip1 or 0))
				ply:SetAmmo(prim_ammo, primary_ammo_type)
			end
			if secondary_ammo_type > 0 then
				local sec_ammo = ply:GetAmmoCount(secondary_ammo_type) + (clip2 or 0)
				return ply:SetAmmo(sec_ammo, secondary_ammo_type)
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
		__name = "SpawnedWeapon",
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
	self.__entity = "evilrp/spawned/weapon"
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	SpawnedWeapon = _class_0
end
if SERVER then
	local block_types = {
		"Physgun1",
		"Spawning1",
		"Toolgun1"
	}
	return FPP.AddDefaultBlocked(block_types, "evilrp/spawned/weapon")
end
