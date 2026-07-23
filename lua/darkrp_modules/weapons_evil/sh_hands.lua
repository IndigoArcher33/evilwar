local Hand_Break
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 2, 4 do
				_accum_0[_len_0] = "physics/body/body_medium_break" .. tostring(i) .. ".wav"
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
		__name = "Hand_Break",
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
	Hand_Break = _class_0
end
local select_hands
select_hands = function(ply)
	timer.Simple(0.1, function()
		if ply:HasWeapon("evilrp_melee/hands") then
			return ply:SelectWeapon("evilrp_melee/hands")
		end
	end)
	return
end
hook.Add("PlayerLoadout", "evilrp_select_hands", select_hands)
local Hands
do
	local _class_0
	local _parent_0 = EvilRP_Melee
	local _base_0 = {
		PrintName = "Hands",
		Description = "",
		Slot = 0,
		Spawnable = true,
		UseHands = true,
		ViewModelFOV = 54,
		ViewModel = Model("models/weapons/c_arms.mdl"),
		WorldModel = "",
		DrawWorldModel = function(self) end,
		HoldType = "fist",
		LowerHoldType = "normal",
		DrawAnim = "fists_draw",
		HolsterAnim = "fists_holster",
		DoPickup = function(self, ent)
			if ent:IsPlayerHolding() then
				return
			end
			local phys_obj = ent:GetPhysicsObject()
			if phys_obj:GetMass() > 115 then
				return
			end
			if not phys_obj:IsMoveable() then
				return
			end
			self.held_entity = ent
			return timer.Simple(0.2, function()
				if (not IsValid(ent) or ent:IsPlayerHolding() or self.held_entity ~= ent) then
					self.held_entity = nil
					return
				end
				self.Owner:PickupObject(ent)
				self.Owner:EmitSound("physics/body/body_medium_impact_soft" .. tostring(math.random(1, 3)) .. ".wav")
				return ent:SetNWEntity("evilrp_submitter", self.Owner)
			end)
		end,
		AltFire = function(self)
			if not SERVER then
				return
			end
			if not self:GetLowered() then
				return
			end
			local ply = self:GetOwner()
			local hit, tr = self:GetAttackTrace(80)
			local ent
			if hit and tr.Entity and IsValid(tr.Entity) then
				ent = tr.Entity
			end
			if IsValid(ent) then
				if (not ent:IsPlayer() and not ent:IsNPC()) and not IsValid(self.held_entity) then
					ent:PhysWake()
					return self:DoPickup(ent)
				elseif IsValid(self.held_entity) and not self.held_entity:IsPlayerHolding() then
					self.held_entity = nil
				end
			end
		end,
		Primary = {
			ChargeTime = 0.4,
			Light = {
				Damage = 4,
				DamageType = DMG_CLUB,
				Range = 50,
				Delay = 1,
				Act = {
					ACT_VM_HITCENTER,
					ACT_VM_MISSCENTER
				},
				Sound = {
					"npc/fast_zombie/claw_strike1.wav",
					"npc/vort/claw_swing1.wav"
				}
			},
			Heavy = {
				Damage = 10,
				DamageType = DMG_CLUB,
				Range = 70,
				Delay = 1.5,
				Act = ACT_VM_MISSCENTER,
				Sound = {
					"npc/fast_zombie/claw_strike1.wav",
					"npc/vort/claw_swing1.wav"
				}
			}
		},
		ChargeOffset = {
			Pos = Vector(0, 0, -0),
			Ang = Angle(10, 0, 0)
		},
		GenericAttack = function(self, heavy)
			local hit, trace = _class_0.__parent.__base.GenericAttack(self, heavy)
			local vm = self.Owner:GetViewModel()
			local anims
			if heavy then
				anims = {
					{
						"fists_uppercut",
						Angle(0, 0, 0)
					}
				}
			else
				anims = {
					{
						"fists_left",
						Angle(0, -10, 0)
					},
					{
						"fists_right",
						Angle(0, 10, 0)
					}
				}
			end
			local anim = anims[math.random(1, #anims)]
			vm:SendViewModelMatchingSequence(vm:LookupSequence(anim[1]))
			if trace.Hit then
				local _exp_0 = trace.MatType
				if MAT_FLESH == _exp_0 or MAT_BLOODYFLESH == _exp_0 or MAT_ALIENFLESH == _exp_0 then
				else
					if SERVER then
						local dmg = DamageInfo()
						dmg:SetDamageType(DMG_CLUB)
						dmg:SetDamagePosition(trace.HitPos)
						dmg:SetAttacker(self.Owner)
						dmg:SetInflictor(self)
						dmg:SetDamage(5)
						self.Owner:TakeDamageInfo(dmg)
					end
					self.Owner:EmitSound("Hand_Break")
				end
			end
			return hit, trace
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
		__name = "Hands",
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
	Hands = _class_0
end
local BoneclawsHit_Light
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 2 do
				_accum_0[_len_0] = "placenta/bonehead_slice" .. tostring(i) .. ".wav"
				_len_0 = _len_0 + 1
			end
			return _accum_0
		end)(),
		pitch = {
			100,
			120
		}
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
		__name = "BoneclawsHit_Light",
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
	BoneclawsHit_Light = _class_0
end
local BoneclawsHit_Heavy
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 2 do
				_accum_0[_len_0] = "placenta/bonehead_slice" .. tostring(i) .. ".wav"
				_len_0 = _len_0 + 1
			end
			return _accum_0
		end)(),
		pitch = {
			60,
			80
		}
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
		__name = "BoneclawsHit_Heavy",
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
	BoneclawsHit_Heavy = _class_0
end
local Boneclaws
local _class_0
local _parent_0 = Hands
local _base_0 = {
	PrintName = "Bone Claws",
	CanLower = function(self)
		return false
	end,
	Primary = {
		ChargeTime = 0.4,
		Light = {
			Damage = 10,
			DamageType = DMG_CLUB,
			Range = 50,
			Delay = 0.3,
			Act = {
				ACT_VM_HITCENTER,
				ACT_VM_MISSCENTER
			},
			Sound = {
				"BoneclawsHit_Light",
				"npc/vort/claw_swing1.wav"
			}
		},
		Heavy = {
			Damage = 20,
			DamageType = DMG_CLUB,
			Range = 70,
			Delay = 1,
			Act = ACT_VM_MISSCENTER,
			Sound = {
				"BoneclawsHit_Heavy",
				"npc/vort/claw_swing1.wav"
			}
		}
	},
	GenericAttack = function(self, ...)
		_class_0.__parent.__base.GenericAttack(self, ...)
		return self:GetOwner():DoAnimationEvent(ACT_GMOD_GESTURE_RANGE_FRENZY)
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
	__name = "Boneclaws",
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
Boneclaws = _class_0
return _class_0
