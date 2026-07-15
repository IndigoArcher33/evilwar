-- [yue]: darkrp_modules\pocket_evil\sh_pocket.yue
local Pocket_Item -- 1
do -- 1
	local _class_0 -- 1
	local _parent_0 = SOUND -- 1
	local _base_0 = { -- 1
		sound = (function() -- 2
			local _accum_0 = { } -- 2
			local _len_0 = 1 -- 2
			for i = 1, 7 do -- 2
				_accum_0[_len_0] = "physics/cardboard/cardboard_box_impact_hard" .. tostring(i) .. ".wav" -- 2
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
		__name = "Pocket_Item", -- 1
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
	Pocket_Item = _class_0 -- 1
end -- 2
local Pocket -- 4
do -- 4
	local _class_0 -- 4
	local _parent_0 = WEAPON -- 4
	local _base_0 = { -- 4
		PrintName = "Pocket", -- 8
		Slot = 1, -- 9
		SlotPos = 1, -- 10
		DrawAmmo = false, -- 11
		DrawCrosshair = true, -- 13
		Base = "weapon_cs_base2", -- 15
		IconLetter = "", -- 17
		ViewModelFOV = 62, -- 18
		ViewModelFlip = false, -- 20
		WorldModel = "", -- 22
		Spawnable = true, -- 23
		AdminOnly = true, -- 24
		Category = "EvilRP (Utility)", -- 26
		Primary = { -- 27
			ClipSize = -1, -- 27
			DefaultClip = 0, -- 28
			Automatic = false, -- 29
			Ammo = "" -- 30
		}, -- 32
		Secondary = { -- 33
			ClipSize = -1, -- 33
			DefaultClip = 0, -- 34
			Automatic = false, -- 35
			Ammo = "" -- 36
		}, -- 38
		Initialize = function(self) -- 38
			return self:SetHoldType("normal") -- 38
		end, -- 39
		Deploy = function(self) -- 39
			return true -- 39
		end, -- 41
		DrawWorldModel = function(self) end, -- 42
		PreDrawViewModel = function(self, vm) -- 42
			return true -- 42
		end, -- 44
		Holster = function(self) -- 44
			if not SERVER then -- 45
				return true -- 45
			end -- 45
			do -- 46
				local _with_0 = self:GetOwner() -- 46
				_with_0:DrawViewModel(true) -- 47
				_with_0:DrawWorldModel(true) -- 48
			end -- 46
			return true -- 49
		end, -- 51
		PrimaryAttack = function(self) -- 51
			self:SetNextPrimaryFire(CurTime() + 0.2) -- 52
			local ply = self:GetOwner() -- 53
			if not IsValid(ply) then -- 54
				return -- 54
			end -- 54
			local ent = ply:GetEyeTrace().Entity -- 55
			if ent.Pocketable == false then -- 56
				return -- 56
			end -- 56
			local can_pickup, message = hook.Call("canPocket", GAMEMODE, ply, ent) -- 57
			if not can_pickup then -- 58
				if message and SERVER then -- 59
					DarkRP.notify(ply, 1, 4, message) -- 59
				end -- 59
				return -- 60
			end -- 58
			if SERVER then -- 61
				ply:PlaySignal(ACT_GMOD_GESTURE_ITEM_GIVE, true) -- 62
				ply:EmitSound("Pocket_Item") -- 63
				return ply:addPocketItem(ent) -- 64
			end -- 61
		end, -- 66
		SecondaryAttack = function(self) -- 66
			if not SERVER then -- 67
				return -- 67
			end -- 67
			local ply = self:GetOwner() -- 68
			if not IsValid(ply) then -- 69
				return -- 69
			end -- 69
			local max_k = 0 -- 70
			for k in pairs(ply:GetPocketItems()) do -- 71
				local _continue_0 = false -- 72
				repeat -- 72
					if k < max_k then -- 72
						_continue_0 = true -- 72
						break -- 72
					end -- 72
					max_k = k -- 73
					_continue_0 = true -- 72
				until true -- 73
				if not _continue_0 then -- 73
					break -- 73
				end -- 73
			end -- 73
			if max_k > 0 then -- 74
				local item = ply:dropPocketItem(max_k) -- 75
				return timer.Simple(0.0666, function() -- 76
					if item:GetClass():find("trash/*") then -- 76
						return ply:PickupObject(item) -- 76
					end -- 76
				end) -- 76
			end -- 74
		end, -- 78
		Reload = function(self) -- 78
			if CLIENT then -- 79
				if not ECP.pmenu or not ECP.pmenu:IsValid() then -- 80
					return GAMEMODE:CreatePlayerMenu() -- 81
				end -- 80
			end -- 79
		end -- 4
	} -- 4
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 81
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 4
			_base_0[_key_0] = _val_0 -- 4
		end -- 4
	end -- 81
	if _base_0.__index == nil then -- 4
		_base_0.__index = _base_0 -- 4
	end -- 81
	setmetatable(_base_0, _parent_0.__base) -- 4
	_class_0 = setmetatable({ -- 4
		__init = function(self, ...) -- 4
			return _class_0.__parent.__init(self, ...) -- 4
		end, -- 4
		__base = _base_0, -- 4
		__name = "Pocket", -- 4
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
	self.__weapon = "evilrp/pocket" -- 6
	if _parent_0.__inherited then -- 4
		_parent_0.__inherited(_parent_0, _class_0) -- 4
	end -- 4
	Pocket = _class_0 -- 4
	return _class_0 -- 81
end -- 81
