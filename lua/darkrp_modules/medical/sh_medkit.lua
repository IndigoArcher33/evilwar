-- [yue]: darkrp_modules\medical\sh_medkit.yue
local Medkit -- 1
local _class_0 -- 1
local _parent_0 = WEAPON -- 1
local _base_0 = { -- 1
	PrintName = "L.R.D.", -- 3
	Medkit = true, -- 4
	UseHands = true, -- 6
	Slot = 1, -- 8
	SlotPos = 2, -- 9
	Description = "I can make it feel better.", -- 11
	ViewModel = Model("models/weapons/c_medkit.mdl"), -- 13
	WorldModel = Model("models/weapons/w_medkit.mdl"), -- 14
	HoldType = "slam", -- 16
	Primary = { -- 19
		Delay = 0.2, -- 19
		Automatic = true -- 20
	}, -- 18
	Secondary = { -- 23
		Delay = 0.4, -- 23
		Automatic = true, -- 24
		ClipSize = -1, -- 25
		DefaultClip = -1 -- 26
	}, -- 22
	TranslateWeaponAnim = function(self, act) -- 29
		return act -- 29
	end, -- 29
	SendTranslatedWeaponAnim = function(self, act) -- 30
		act = self:TranslateWeaponAnim(act) -- 31
		if not act then -- 32
			return -- 32
		end -- 32
		return self:SendWeaponAnim(act) -- 33
	end, -- 30
	Deploy = function(self) -- 35
		self:SetHoldType(self.HoldType) -- 36
		self:SendTranslatedWeaponAnim(ACT_VM_DRAW) -- 37
		return true -- 38
	end, -- 35
	PrimaryAttack = function(self) -- 40
		self:SetNextPrimaryFire(CurTime() + self.Primary.Delay) -- 41
		local ply = self.Owner -- 42
		if not IsValid(ply) then -- 43
			return -- 43
		end -- 43
		if CLIENT then -- 44
			return -- 44
		end -- 44
		local found -- 45
		local last_dot = -1 -- 46
		ply:LagCompensation(true) -- 47
		local aim_vec = ply:GetAimVector() -- 48
		local shoot_pos = ply:GetShootPos() -- 49
		local _list_0 = player.GetAll() -- 50
		for _index_0 = 1, #_list_0 do -- 50
			local v = _list_0[_index_0] -- 50
			local _continue_0 = false -- 51
			repeat -- 51
				if v == ply then -- 51
					_continue_0 = true -- 51
					break -- 51
				end -- 51
				local max_health = v:GetMaxHealth() or 100 -- 52
				if v:Health() >= max_health then -- 53
					_continue_0 = true -- 53
					break -- 53
				end -- 53
				if not v:Alive() then -- 54
					_continue_0 = true -- 54
					break -- 54
				end -- 54
				local target_shoot_pos = v:GetShootPos() -- 55
				if (target_shoot_pos:DistToSqr(shoot_pos) > 7225) then -- 56
					_continue_0 = true -- 56
					break -- 56
				end -- 56
				local dir = target_shoot_pos - shoot_pos -- 57
				dir:Normalize() -- 58
				local dot = dir:Dot(aim_vec) -- 59
				if dot > last_dot then -- 61
					last_dot = dot -- 62
					found = v -- 63
				end -- 61
				_continue_0 = true -- 51
			until true -- 51
			if not _continue_0 then -- 51
				break -- 51
			end -- 51
		end -- 50
		ply:LagCompensation(false) -- 64
		if found then -- 65
			do -- 66
				local _exp_0 = found:Team() -- 66
				if TEAM_GHOST == _exp_0 then -- 67
					return -- 68
				end -- 66
			end -- 66
			local nh = math.min(found:Health() + 2, found:GetMaxHealth()) -- 69
			found:SetHealth(nh) -- 71
			ply:SetHealth(ply:Health() - 1) -- 72
			ply.heal_stem_progress = ply.heal_stem_progress or 0 -- 73
			ply.heal_stem_progress = ply.heal_stem_progress + 2 -- 74
			if ply.heal_stem_progress >= 150 then -- 75
				ply.heal_stem_progress = 0 -- 76
				ply:AddStemCells(1) -- 77
			end -- 75
			ply:EmitSound("ambient/creatures/teddy.wav", 150, (found:Health() / found:GetMaxHealth()) * 100) -- 78
			if ply:Health() <= 0 and ply:Alive() then -- 80
				return ply:Kill() -- 80
			end -- 80
		end -- 65
	end, -- 40
	SecondaryAttack = function(self) -- 83
		self:SetNextSecondaryFire(CurTime() + self.Secondary.Delay) -- 84
		local ply = self.Owner -- 85
		if not IsValid(ply) then -- 86
			return -- 86
		end -- 86
		if CLIENT then -- 87
			return -- 87
		end -- 87
		local shoot_pos = ply:GetShootPos() -- 88
		local aim_vec = ply:GetAimVector() -- 89
		local tr = util.TraceLine({ -- 91
			start = shoot_pos, -- 91
			endpos = shoot_pos + aim_vec * 50, -- 92
			filter = ply, -- 93
			mask = MASK_SHOT -- 94
		}) -- 90
		local ent = tr.Entity -- 95
		if not (tr.Hit and tr.HitNonWorld and IsValid(ent)) then -- 97
			return -- 97
		end -- 97
		ply:SetHealth(ply:Health() - 5) -- 98
		self:ShootBullet(10, 1, 0) -- 99
		return ply:EmitSound("npc/dog/dog_idle4.wav", 150, (ply:Health() / ply:GetMaxHealth()) * 100) -- 100
	end -- 83
} -- 1
for _key_0, _val_0 in pairs(_parent_0.__base) do -- 1
	if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 1
		_base_0[_key_0] = _val_0 -- 1
	end -- 1
end -- 1
if _base_0.__index == nil then -- 1
	_base_0.__index = _base_0 -- 1
end -- 1
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
return _class_0 -- 1
