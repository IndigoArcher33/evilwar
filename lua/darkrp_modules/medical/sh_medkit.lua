-- [yue]: /home/corpse/gmodserver/garrysmod/addons/darkrpmodification/lua/darkrp_modules/medical/sh_medkit.yue
local Medkit -- 1
local _class_0 -- 1
local _parent_0 = WEAPON -- 1
local _base_0 = { -- 1
	PrintName = "L.R.D.", -- 4
	Medkit = true, -- 6
	UseHands = true, -- 8
	Slot = 1, -- 9
	SlotPos = 2, -- 11
	Description = "I can make it feel better.", -- 13
	ViewModel = Model("models/weapons/c_medkit.mdl"), -- 14
	WorldModel = Model("models/weapons/w_medkit.mdl"), -- 16
	HoldType = "slam", -- 18
	Primary = { -- 19
		Delay = 0.2, -- 19
		Automatic = true -- 20
	}, -- 22
	TranslateWeaponAnim = function(self, act) -- 22
		return act -- 22
	end, -- 23
	SendTranslatedWeaponAnim = function(self, act) -- 23
		act = self:TranslateWeaponAnim(act) -- 24
		if not act then -- 25
			return -- 25
		end -- 25
		return self:SendWeaponAnim(act) -- 26
	end, -- 28
	Deploy = function(self) -- 28
		self:SetHoldType(self.HoldType) -- 29
		self:SendTranslatedWeaponAnim(ACT_VM_DRAW) -- 30
		return true -- 31
	end, -- 33
	PrimaryAttack = function(self) -- 33
		self:SetNextPrimaryFire(CurTime() + self.Primary.Delay) -- 34
		local ply = self.Owner -- 35
		if not IsValid(ply) then -- 36
			return -- 36
		end -- 36
		if CLIENT then -- 37
			return -- 37
		end -- 37
		local found -- 38
		local last_dot = -1 -- 39
		ply:LagCompensation(true) -- 40
		local aim_vec = ply:GetAimVector() -- 41
		local shoot_pos = ply:GetShootPos() -- 42
		local _list_0 = player.GetAll() -- 43
		for _index_0 = 1, #_list_0 do -- 43
			local v = _list_0[_index_0] -- 43
			local _continue_0 = false -- 44
			repeat -- 44
				if v == ply then -- 44
					_continue_0 = true -- 44
					break -- 44
				end -- 44
				local max_health = v:GetMaxHealth() or 100 -- 45
				if v:Health() >= max_health then -- 46
					_continue_0 = true -- 46
					break -- 46
				end -- 46
				if not v:Alive() then -- 47
					_continue_0 = true -- 47
					break -- 47
				end -- 47
				local target_shoot_pos = v:GetShootPos() -- 48
				if (target_shoot_pos:DistToSqr(shoot_pos) > 7225) then -- 49
					_continue_0 = true -- 49
					break -- 49
				end -- 49
				local dir = target_shoot_pos - shoot_pos -- 50
				dir:Normalize() -- 51
				local dot = dir:Dot(aim_vec) -- 52
				if dot > last_dot then -- 54
					last_dot = dot -- 55
					found = v -- 56
				end -- 54
				_continue_0 = true -- 44
			until true -- 56
			if not _continue_0 then -- 56
				break -- 56
			end -- 56
		end -- 56
		ply:LagCompensation(false) -- 57
		if found then -- 58
			do -- 59
				local _exp_0 = found:Team() -- 59
				if TEAM_GHOST == _exp_0 then -- 60
					return -- 61
				end -- 61
			end -- 61
			local nh = math.min(found:Health() + 2, found:GetMaxHealth()) -- 62
			found:SetHealth(nh) -- 64
			ply:SetHealth(ply:Health() - 1) -- 65
			ply:EmitSound("ambient/creatures/teddy.wav", 150, (found:Health() / found:GetMaxHealth()) * 100) -- 66
			if ply:Health() <= 0 and ply:Alive() then -- 68
				return ply:Kill() -- 68
			end -- 68
		end -- 58
	end, -- 71
	SecondaryAttack = function(self) end -- 1
} -- 1
for _key_0, _val_0 in pairs(_parent_0.__base) do -- 71
	if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 1
		_base_0[_key_0] = _val_0 -- 1
	end -- 1
end -- 71
if _base_0.__index == nil then -- 1
	_base_0.__index = _base_0 -- 1
end -- 71
setmetatable(_base_0, _parent_0.__base) -- 1
_class_0 = setmetatable({ -- 1
	__init = function(self, ...) -- 1
		return _class_0.__parent.__init(self, ...) -- 1
	end, -- 1
	__base = _base_0, -- 1
	__name = "Medkit", -- 1
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
self.__weapon = "evilrp/medkit" -- 2
if _parent_0.__inherited then -- 1
	_parent_0.__inherited(_parent_0, _class_0) -- 1
end -- 1
Medkit = _class_0 -- 1
return _class_0 -- 71
