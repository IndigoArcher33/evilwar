local Pocket_Item
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 7 do
				_accum_0[_len_0] = "physics/cardboard/cardboard_box_impact_hard" .. tostring(i) .. ".wav"
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
		__name = "Pocket_Item",
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
	Pocket_Item = _class_0
end
local Pocket
do
	local _class_0
	local _parent_0 = WEAPON
	local _base_0 = {
		PrintName = "Pocket",
		Slot = 1,
		SlotPos = 1,
		DrawAmmo = false,
		DrawCrosshair = true,
		Base = "weapon_cs_base2",
		IconLetter = "",
		ViewModelFOV = 62,
		ViewModelFlip = false,
		WorldModel = "",
		Spawnable = true,
		AdminOnly = true,
		Category = "EvilRP (Utility)",
		Primary = {
			ClipSize = -1,
			DefaultClip = 0,
			Automatic = false,
			Ammo = ""
		},
		Secondary = {
			ClipSize = -1,
			DefaultClip = 0,
			Automatic = false,
			Ammo = ""
		},
		Initialize = function(self)
			return self:SetHoldType("normal")
		end,
		Deploy = function(self)
			return true
		end,
		DrawWorldModel = function(self) end,
		PreDrawViewModel = function(self, vm)
			return true
		end,
		Holster = function(self)
			if not SERVER then
				return true
			end
			do
				local _with_0 = self:GetOwner()
				_with_0:DrawViewModel(true)
				_with_0:DrawWorldModel(true)
			end
			return true
		end,
		PrimaryAttack = function(self)
			self:SetNextPrimaryFire(CurTime() + 0.2)
			local ply = self:GetOwner()
			if not IsValid(ply) then
				return
			end
			local ent = ply:GetEyeTrace().Entity
			if ent.Pocketable == false then
				return
			end
			local can_pickup, message = hook.Call("canPocket", GAMEMODE, ply, ent)
			if not can_pickup then
				if message and SERVER then
					DarkRP.notify(ply, 1, 4, message)
				end
				return
			end
			if SERVER then
				ply:PlaySignal(ACT_GMOD_GESTURE_ITEM_GIVE, true)
				ply:EmitSound("Pocket_Item")
				return ply:addPocketItem(ent)
			end
		end,
		SecondaryAttack = function(self)
			if not SERVER then
				return
			end
			local ply = self:GetOwner()
			if not IsValid(ply) then
				return
			end
			local max_k = 0
			for k in pairs(ply:GetPocketItems()) do
				if k < max_k then
					goto _continue_0
				end
				max_k = k
				::_continue_0::
			end
			if max_k > 0 then
				local item = ply:dropPocketItem(max_k)
				return timer.Simple(0.0666, function()
					if item:GetClass():find("trash/*") then
						return ply:PickupObject(item)
					end
				end)
			end
		end,
		Reload = function(self)
			if CLIENT then
				if not ECP.pmenu or not ECP.pmenu:IsValid() then
					return GAMEMODE:CreatePlayerMenu()
				end
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
		__name = "Pocket",
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
	self.__weapon = "evilrp/pocket"
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Pocket = _class_0
	return _class_0
end
