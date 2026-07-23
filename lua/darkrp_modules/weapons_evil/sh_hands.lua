-- [yue]: darkrp_modules\weapons_evil\sh_hands.yue
local Hand_Break -- 1
do -- 1
	local _class_0 -- 1
	local _parent_0 = SOUND -- 1
	local _base_0 = { -- 1
		sound = (function() -- 2
			local _accum_0 = { } -- 2
			local _len_0 = 1 -- 2
			for i = 2, 4 do -- 2
				_accum_0[_len_0] = "physics/body/body_medium_break" .. tostring(i) .. ".wav" -- 2
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
		__name = "Hand_Break", -- 1
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
	Hand_Break = _class_0 -- 1
end -- 2
local select_hands -- 4
select_hands = function(ply) -- 4
	timer.Simple(0.1, function() -- 5
		if ply:HasWeapon("evilrp_melee/hands") then -- 6
			return ply:SelectWeapon("evilrp_melee/hands") -- 6
		end -- 6
	end) -- 5
	return -- 7
end -- 4
hook.Add("PlayerLoadout", "evilrp_select_hands", select_hands) -- 9
local Hands -- 11
do -- 11
	local _class_0 -- 11
	local _parent_0 = EvilRP_Melee -- 11
	local _base_0 = { -- 11
		PrintName = "Hands", -- 13
		Description = "", -- 15
		Slot = 0, -- 17
		Spawnable = true, -- 18
		UseHands = true, -- 20
		ViewModelFOV = 54, -- 22
		ViewModel = Model("models/weapons/c_arms.mdl"), -- 23
		WorldModel = "", -- 25
		DrawWorldModel = function(self) end, -- 27
		HoldType = "fist", -- 28
		LowerHoldType = "normal", -- 30
		DrawAnim = "fists_draw", -- 31
		HolsterAnim = "fists_holster", -- 33
		DoPickup = function(self, ent) -- 33
			if ent:IsPlayerHolding() then -- 34
				return -- 34
			end -- 34
			local phys_obj = ent:GetPhysicsObject() -- 35
			if phys_obj:GetMass() > 115 then -- 36
				return -- 36
			end -- 36
			if not phys_obj:IsMoveable() then -- 37
				return -- 37
			end -- 37
			self.held_entity = ent -- 38
			return timer.Simple(0.2, function() -- 39
				if (not IsValid(ent) or ent:IsPlayerHolding() or self.held_entity ~= ent) then -- 40
					self.held_entity = nil -- 41
					return -- 42
				end -- 40
				self.Owner:PickupObject(ent) -- 43
				self.Owner:EmitSound("physics/body/body_medium_impact_soft" .. tostring(math.random(1, 3)) .. ".wav") -- 44
				return ent:SetNWEntity("evilrp_submitter", self.Owner) -- 45
			end) -- 45
		end, -- 47
		AltFire = function(self) -- 47
			if not SERVER then -- 48
				return -- 48
			end -- 48
			if not self:GetLowered() then -- 49
				return -- 49
			end -- 49
			local ply = self:GetOwner() -- 50
			local hit, tr = self:GetAttackTrace(80) -- 51
			local ent -- 52
			if hit and tr.Entity and IsValid(tr.Entity) then -- 53
				ent = tr.Entity -- 54
			end -- 53
			if IsValid(ent) then -- 55
				if (not ent:IsPlayer() and not ent:IsNPC()) and not IsValid(self.held_entity) then -- 56
					ent:PhysWake() -- 57
					return self:DoPickup(ent) -- 58
				elseif IsValid(self.held_entity) and not self.held_entity:IsPlayerHolding() then -- 59
					self.held_entity = nil -- 60
				end -- 56
			end -- 55
		end, -- 62
		Primary = { -- 63
			ChargeTime = 0.4, -- 63
			Light = { -- 66
				Damage = 4, -- 66
				DamageType = DMG_CLUB, -- 67
				Range = 50, -- 69
				Delay = 1, -- 70
				Act = { -- 72
					ACT_VM_HITCENTER, -- 72
					ACT_VM_MISSCENTER -- 72
				}, -- 72
				Sound = { -- 74
					"npc/fast_zombie/claw_strike1.wav", -- 74
					"npc/vort/claw_swing1.wav" -- 74
				} -- 74
			}, -- 65
			Heavy = { -- 78
				Damage = 10, -- 78
				DamageType = DMG_CLUB, -- 79
				Range = 70, -- 81
				Delay = 1.5, -- 82
				Act = ACT_VM_MISSCENTER, -- 84
				Sound = { -- 86
					"npc/fast_zombie/claw_strike1.wav", -- 86
					"npc/vort/claw_swing1.wav" -- 86
				} -- 86
			} -- 77
		}, -- 90
		ChargeOffset = { -- 91
			Pos = Vector(0, 0, -0), -- 91
			Ang = Angle(10, 0, 0) -- 92
		}, -- 95
		GenericAttack = function(self, heavy) -- 95
			local hit, trace = _class_0.__parent.__base.GenericAttack(self, heavy) -- 96
			local vm = self.Owner:GetViewModel() -- 97
			local anims -- 98
			if heavy then -- 99
				anims = { -- 101
					{ -- 101
						"fists_uppercut", -- 101
						Angle(0, 0, 0) -- 101
					} -- 101
				} -- 100
			else -- 103
				anims = { -- 104
					{ -- 104
						"fists_left", -- 104
						Angle(0, -10, 0) -- 104
					}, -- 104
					{ -- 105
						"fists_right", -- 105
						Angle(0, 10, 0) -- 105
					} -- 105
				} -- 103
			end -- 99
			local anim = anims[math.random(1, #anims)] -- 106
			vm:SendViewModelMatchingSequence(vm:LookupSequence(anim[1])) -- 107
			if trace.Hit then -- 108
				do -- 109
					local _exp_0 = trace.MatType -- 109
					if MAT_FLESH == _exp_0 or MAT_BLOODYFLESH == _exp_0 or MAT_ALIENFLESH == _exp_0 then -- 110
					else -- 113
						if SERVER then -- 114
							local dmg = DamageInfo() -- 115
							dmg:SetDamageType(DMG_CLUB) -- 117
							dmg:SetDamagePosition(trace.HitPos) -- 118
							dmg:SetAttacker(self.Owner) -- 119
							dmg:SetInflictor(self) -- 120
							dmg:SetDamage(5) -- 121
							self.Owner:TakeDamageInfo(dmg) -- 122
						end -- 114
						self.Owner:EmitSound("Hand_Break") -- 123
					end -- 123
				end -- 123
			end -- 108
			return hit, trace -- 124
		end -- 11
	} -- 11
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 124
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 11
			_base_0[_key_0] = _val_0 -- 11
		end -- 11
	end -- 124
	if _base_0.__index == nil then -- 11
		_base_0.__index = _base_0 -- 11
	end -- 124
	setmetatable(_base_0, _parent_0.__base) -- 11
	_class_0 = setmetatable({ -- 11
		__init = function(self, ...) -- 11
			return _class_0.__parent.__init(self, ...) -- 11
		end, -- 11
		__base = _base_0, -- 11
		__name = "Hands", -- 11
		__parent = _parent_0 -- 11
	}, { -- 11
		__index = function(cls, name) -- 11
			local val = rawget(_base_0, name) -- 11
			if val == nil then -- 11
				local parent = rawget(cls, "__parent") -- 11
				if parent then -- 11
					return parent[name] -- 11
				end -- 11
			else -- 11
				return val -- 11
			end -- 11
		end, -- 11
		__call = function(cls, ...) -- 11
			local _self_0 = setmetatable({ }, _base_0) -- 11
			cls.__init(_self_0, ...) -- 11
			return _self_0 -- 11
		end -- 11
	}) -- 11
	_base_0.__class = _class_0 -- 11
	if _parent_0.__inherited then -- 11
		_parent_0.__inherited(_parent_0, _class_0) -- 11
	end -- 11
	Hands = _class_0 -- 11
end -- 124
local BoneclawsHit_Light -- 127
do -- 127
	local _class_0 -- 127
	local _parent_0 = SOUND -- 127
	local _base_0 = { -- 127
		sound = (function() -- 128
			local _accum_0 = { } -- 128
			local _len_0 = 1 -- 128
			for i = 1, 2 do -- 128
				_accum_0[_len_0] = "placenta/bonehead_slice" .. tostring(i) .. ".wav" -- 128
				_len_0 = _len_0 + 1 -- 128
			end -- 128
			return _accum_0 -- 128
		end)(), -- 129
		pitch = { -- 129
			100, -- 129
			120 -- 129
		} -- 127
	} -- 127
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 129
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 127
			_base_0[_key_0] = _val_0 -- 127
		end -- 127
	end -- 129
	if _base_0.__index == nil then -- 127
		_base_0.__index = _base_0 -- 127
	end -- 129
	setmetatable(_base_0, _parent_0.__base) -- 127
	_class_0 = setmetatable({ -- 127
		__init = function(self, ...) -- 127
			return _class_0.__parent.__init(self, ...) -- 127
		end, -- 127
		__base = _base_0, -- 127
		__name = "BoneclawsHit_Light", -- 127
		__parent = _parent_0 -- 127
	}, { -- 127
		__index = function(cls, name) -- 127
			local val = rawget(_base_0, name) -- 127
			if val == nil then -- 127
				local parent = rawget(cls, "__parent") -- 127
				if parent then -- 127
					return parent[name] -- 127
				end -- 127
			else -- 127
				return val -- 127
			end -- 127
		end, -- 127
		__call = function(cls, ...) -- 127
			local _self_0 = setmetatable({ }, _base_0) -- 127
			cls.__init(_self_0, ...) -- 127
			return _self_0 -- 127
		end -- 127
	}) -- 127
	_base_0.__class = _class_0 -- 127
	if _parent_0.__inherited then -- 127
		_parent_0.__inherited(_parent_0, _class_0) -- 127
	end -- 127
	BoneclawsHit_Light = _class_0 -- 127
end -- 129
local BoneclawsHit_Heavy -- 131
do -- 131
	local _class_0 -- 131
	local _parent_0 = SOUND -- 131
	local _base_0 = { -- 131
		sound = (function() -- 132
			local _accum_0 = { } -- 132
			local _len_0 = 1 -- 132
			for i = 1, 2 do -- 132
				_accum_0[_len_0] = "placenta/bonehead_slice" .. tostring(i) .. ".wav" -- 132
				_len_0 = _len_0 + 1 -- 132
			end -- 132
			return _accum_0 -- 132
		end)(), -- 133
		pitch = { -- 133
			60, -- 133
			80 -- 133
		} -- 131
	} -- 131
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 133
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 131
			_base_0[_key_0] = _val_0 -- 131
		end -- 131
	end -- 133
	if _base_0.__index == nil then -- 131
		_base_0.__index = _base_0 -- 131
	end -- 133
	setmetatable(_base_0, _parent_0.__base) -- 131
	_class_0 = setmetatable({ -- 131
		__init = function(self, ...) -- 131
			return _class_0.__parent.__init(self, ...) -- 131
		end, -- 131
		__base = _base_0, -- 131
		__name = "BoneclawsHit_Heavy", -- 131
		__parent = _parent_0 -- 131
	}, { -- 131
		__index = function(cls, name) -- 131
			local val = rawget(_base_0, name) -- 131
			if val == nil then -- 131
				local parent = rawget(cls, "__parent") -- 131
				if parent then -- 131
					return parent[name] -- 131
				end -- 131
			else -- 131
				return val -- 131
			end -- 131
		end, -- 131
		__call = function(cls, ...) -- 131
			local _self_0 = setmetatable({ }, _base_0) -- 131
			cls.__init(_self_0, ...) -- 131
			return _self_0 -- 131
		end -- 131
	}) -- 131
	_base_0.__class = _class_0 -- 131
	if _parent_0.__inherited then -- 131
		_parent_0.__inherited(_parent_0, _class_0) -- 131
	end -- 131
	BoneclawsHit_Heavy = _class_0 -- 131
end -- 133
local Boneclaws -- 135
do -- 135
	local _class_0 -- 135
	local _parent_0 = Hands -- 135
	local _base_0 = { -- 135
		PrintName = "Bone Claws", -- 137
		CanLower = function(self) -- 137
			return false -- 137
		end, -- 138
		Primary = { -- 139
			ChargeTime = 0.4, -- 139
			Light = { -- 142
				Damage = 10, -- 142
				DamageType = DMG_CLUB, -- 143
				Range = 50, -- 145
				Delay = 0.3, -- 146
				Act = { -- 148
					ACT_VM_HITCENTER, -- 148
					ACT_VM_MISSCENTER -- 148
				}, -- 148
				Sound = { -- 150
					"BoneclawsHit_Light", -- 150
					"npc/vort/claw_swing1.wav" -- 150
				} -- 150
			}, -- 141
			Heavy = { -- 154
				Damage = 20, -- 154
				DamageType = DMG_CLUB, -- 155
				Range = 70, -- 157
				Delay = 1, -- 158
				Act = ACT_VM_MISSCENTER, -- 160
				Sound = { -- 162
					"BoneclawsHit_Heavy", -- 162
					"npc/vort/claw_swing1.wav" -- 162
				} -- 162
			} -- 153
		}, -- 165
		GenericAttack = function(self, ...) -- 165
			_class_0.__parent.__base.GenericAttack(self, ...) -- 166
			return self:GetOwner():DoAnimationEvent(ACT_GMOD_GESTURE_RANGE_FRENZY) -- 167
		end -- 135
	} -- 135
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 167
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 135
			_base_0[_key_0] = _val_0 -- 135
		end -- 135
	end -- 167
	if _base_0.__index == nil then -- 135
		_base_0.__index = _base_0 -- 135
	end -- 167
	setmetatable(_base_0, _parent_0.__base) -- 135
	_class_0 = setmetatable({ -- 135
		__init = function(self, ...) -- 135
			return _class_0.__parent.__init(self, ...) -- 135
		end, -- 135
		__base = _base_0, -- 135
		__name = "Boneclaws", -- 135
		__parent = _parent_0 -- 135
	}, { -- 135
		__index = function(cls, name) -- 135
			local val = rawget(_base_0, name) -- 135
			if val == nil then -- 135
				local parent = rawget(cls, "__parent") -- 135
				if parent then -- 135
					return parent[name] -- 135
				end -- 135
			else -- 135
				return val -- 135
			end -- 135
		end, -- 135
		__call = function(cls, ...) -- 135
			local _self_0 = setmetatable({ }, _base_0) -- 135
			cls.__init(_self_0, ...) -- 135
			return _self_0 -- 135
		end -- 135
	}) -- 135
	_base_0.__class = _class_0 -- 135
	if _parent_0.__inherited then -- 135
		_parent_0.__inherited(_parent_0, _class_0) -- 135
	end -- 135
	Boneclaws = _class_0 -- 135
	return _class_0 -- 167
end -- 167
