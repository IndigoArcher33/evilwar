local Medkit
do
	local _class_0
	local _parent_0 = WEAPON
	local _base_0 = {
		PrintName = "L.R.D.",
		Medkit = true,
		UseHands = true,
		Slot = 1,
		SlotPos = 2,
		Description = "I can make it feel better.",
		ViewModel = Model("models/weapons/c_medkit.mdl"),
		WorldModel = Model("models/weapons/w_medkit.mdl"),
		HoldType = "slam",
		Primary = {
			Delay = 0.2,
			Automatic = true
		},
		TranslateWeaponAnim = function(self, act)
			return act
		end,
		SendTranslatedWeaponAnim = function(self, act)
			act = self:TranslateWeaponAnim(act)
			if not act then
				return
			end
			return self:SendWeaponAnim(act)
		end,
		Deploy = function(self)
			self:SetHoldType(self.HoldType)
			self:SendTranslatedWeaponAnim(ACT_VM_DRAW)
			return true
		end,
		PrimaryAttack = function(self)
			self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
			local ply = self.Owner
			if not IsValid(ply) then
				return
			end
			if CLIENT then
				return
			end
			local found
			local last_dot = -1
			ply:LagCompensation(true)
			local aim_vec = ply:GetAimVector()
			local shoot_pos = ply:GetShootPos()
			local _list_0 = player.GetAll()
			for _index_0 = 1, #_list_0 do
				local v = _list_0[_index_0]
				if v == ply then
					goto _continue_0
				end
				local max_health = v:GetMaxHealth() or 100
				if v:Health() >= max_health then
					goto _continue_0
				end
				if not v:Alive() then
					goto _continue_0
				end
				local target_shoot_pos = v:GetShootPos()
				if (target_shoot_pos:DistToSqr(shoot_pos) > 7225) then
					goto _continue_0
				end
				local dir = target_shoot_pos - shoot_pos
				dir:Normalize()
				local dot = dir:Dot(aim_vec)
				if dot > last_dot then
					last_dot = dot
					found = v
				end
				::_continue_0::
			end
			ply:LagCompensation(false)
			if found then
				do
					local _exp_0 = found:Team()
					if TEAM_GHOST == _exp_0 then
						return
					end
				end
				local nh = math.min(found:Health() + 2, found:GetMaxHealth())
				found:SetHealth(nh)
				ply:SetHealth(ply:Health() - 1)
				ply:EmitSound("ambient/creatures/teddy.wav", 150, (found:Health() / found:GetMaxHealth()) * 100)
				if ply:Health() <= 0 and ply:Alive() then
					return ply:Kill()
				end
			end
		end,
		SecondaryAttack = function(self) end
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
		__name = "Medkit",
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
	self.__weapon = "evilrp/medkit"
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Medkit = _class_0
	return _class_0
end
