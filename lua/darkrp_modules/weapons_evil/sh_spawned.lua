-- [yue]: darkrp_modules\weapons_evil\sh_spawned.yue
local Equip_Weapon -- 1
do -- 1
	local _class_0 -- 1
	local _parent_0 = SOUND -- 1
	local _base_0 = { -- 1
		sound = (function() -- 2
			local _accum_0 = { } -- 2
			local _len_0 = 1 -- 2
			for i = 1, 3 do -- 2
				_accum_0[_len_0] = "dysphoria/weapons/wield_gun" .. tostring(i) .. ".ogg" -- 2
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
		__name = "Equip_Weapon", -- 1
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
	Equip_Weapon = _class_0 -- 1
end -- 2
local SpawnedWeapon -- 4
do -- 4
	local _class_0 -- 4
	local _parent_0 = ITEM -- 4
	local _base_0 = { -- 4
		PrintName = "Spawned Weapon", -- 7
		Spawnable = false, -- 8
		IsSpawnedWeapon = true, -- 9
		Interesting = true, -- 11
		ImpactSound = { -- 12
			soft = "weapon.ImpactSoft", -- 12
			hard = "weapon.ImpactHard" -- 13
		}, -- 15
		SetupDataTables = function(self) -- 15
			_class_0.__parent.__base.SetupDataTables(self) -- 16
			return self:NetworkVar("String", "WeaponClass") -- 17
		end, -- 19
		Draw = function(self) -- 19
			local ret = hook.Call("onDrawSpawnedWeapon", nil, self) -- 20
			if ret ~= nil then -- 21
				return -- 21
			end -- 21
			return self:DrawModel() -- 22
		end, -- 27
		PMRender = function(item) -- 27
			local ct = { } -- 28
			if item.wepcls then -- 29
				local wt = weapons.Get(item.wepcls) -- 30
				ct[#ct + 1] = wt.PrintName -- 31
				if wt.Description then -- 32
					ct[#ct + 1] = "" -- 33
				end -- 32
				ct[#ct + 1] = { -- 34
					text = wt.Description, -- 34
					font = "Spleen_Label_Small" -- 34
				} -- 34
				return ct -- 35
			end -- 29
		end, -- 37
		HUDRender = function(self) -- 37
			local ct = { } -- 38
			local wt = weapons.Get(self:GetWeaponClass()) -- 39
			ct[#ct + 1] = wt.PrintName -- 40
			if wt.Description then -- 41
				ct[#ct + 1] = "" -- 42
				ct[#ct + 1] = { -- 43
					text = wt.Description, -- 43
					font = "Spleen_Label_Small" -- 43
				} -- 43
			end -- 41
			return ct -- 44
		end, -- 46
		Sound = "Equip_Weapon", -- 48
		Initialize = function(self) -- 48
			if SERVER then -- 49
				DarkRP.ValidatedPhysicsInit(self, SOLID_VPHYSICS, "The issue lies with weapon \"" .. tostring(self:GetWeaponClass() or 'unknown') .. "\"") -- 50
				self:SetMoveType(MOVETYPE_VPHYSICS) -- 51
				self:SetSolid(SOLID_VPHYSICS) -- 52
				return self:PhysWake() -- 53
			end -- 49
		end, -- 55
		OnTakeDamage = function(self, dmg) -- 55
			return self:TakePhysicsDamage(dmg) -- 55
		end, -- 59
		OnUseFinish = function(self, ply) -- 59
			_class_0.__parent.__base.OnUseFinish(self, ply) -- 60
			local cls = self:GetWeaponClass() -- 61
			if ply:HasWeapon(cls) then -- 62
				return -- 62
			end -- 62
			local wep = ply:Give(cls, true) -- 63
			ply:SelectWeapon(cls) -- 64
			self:GivePlayerAmmo(ply, wep, false) -- 65
			return self:Remove() -- 66
		end, -- 68
		GivePlayerAmmo = function(self, ply, weapon, had_weapon) -- 68
			local primary_ammo_type = weapon:GetPrimaryAmmoType() -- 69
			local secondary_ammo_type = weapon:GetSecondaryAmmoType() -- 70
			local clip1, clip2 = self.clip1, self.clip2 -- 71
			if had_weapon then -- 72
				if clip2 and clip2 > 0 and weapon:Clip2() ~= -1 then -- 73
					weapon:SetClip2(weapon:Clip2() + clip2) -- 74
					clip2 = 0 -- 75
				end -- 73
			else -- 77
				if clip1 and clip1 ~= -1 and weapon:Clip1() ~= -1 then -- 77
					weapon:SetClip1(clip1) -- 78
					clip1 = 0 -- 79
				end -- 77
				if clip2 and clip2 ~= -1 and weapon:Clip2() ~= -1 then -- 80
					weapon:SetClip2(clip2) -- 81
				end -- 80
			end -- 72
			if primary_ammo_type > 0 then -- 82
				local prim_ammo = ply:GetAmmoCount(primary_ammo_type) -- 83
				prim_ammo = prim_ammo + ((self.ammoadd or 0) + (clip1 or 0)) -- 84
				ply:SetAmmo(prim_ammo, primary_ammo_type) -- 85
			end -- 82
			if secondary_ammo_type > 0 then -- 86
				local sec_ammo = ply:GetAmmoCount(secondary_ammo_type) + (clip2 or 0) -- 87
				return ply:SetAmmo(sec_ammo, secondary_ammo_type) -- 88
			end -- 86
		end -- 4
	} -- 4
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 89
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 4
			_base_0[_key_0] = _val_0 -- 4
		end -- 4
	end -- 89
	if _base_0.__index == nil then -- 4
		_base_0.__index = _base_0 -- 4
	end -- 89
	setmetatable(_base_0, _parent_0.__base) -- 4
	_class_0 = setmetatable({ -- 4
		__init = function(self, ...) -- 4
			return _class_0.__parent.__init(self, ...) -- 4
		end, -- 4
		__base = _base_0, -- 4
		__name = "SpawnedWeapon", -- 4
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
	self.__entity = "evilrp/spawned/weapon" -- 5
	if _parent_0.__inherited then -- 4
		_parent_0.__inherited(_parent_0, _class_0) -- 4
	end -- 4
	SpawnedWeapon = _class_0 -- 4
end -- 89
if SERVER then -- 90
	local block_types = { -- 91
		"Physgun1", -- 91
		"Spawning1", -- 91
		"Toolgun1" -- 91
	} -- 91
	return FPP.AddDefaultBlocked(block_types, "evilrp/spawned/weapon") -- 92
end -- 90
