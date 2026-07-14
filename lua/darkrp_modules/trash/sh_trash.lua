local Trash_Cardboard
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 3 do
				_accum_0[_len_0] = "physics/cardboard/cardboard_box_break" .. tostring(i) .. ".wav"
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
		__name = "Trash_Cardboard",
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
	Trash_Cardboard = _class_0
end
local Trash_Metal
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 2 do
				_accum_0[_len_0] = "physics/metal/metal_box_break" .. tostring(i) .. ".wav"
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
		__name = "Trash_Metal",
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
	Trash_Metal = _class_0
end
local Trash_Glass
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 2, 3 do
				_accum_0[_len_0] = "physics/glass/glass_largesheet_break" .. tostring(i) .. ".wav"
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
		__name = "Trash_Glass",
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
	Trash_Glass = _class_0
end
local Trash_Plastic
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 2 do
				_accum_0[_len_0] = "physics/plastic/plastic_barrel_break" .. tostring(i) .. ".wav"
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
		__name = "Trash_Plastic",
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
	Trash_Plastic = _class_0
end
local Trash
do
	local _class_0
	local _parent_0 = ENTITY
	local _base_0 = {
		Base = "base_anim",
		Type = "anim",
		Spawnable = true,
		AdminSpawnable = true,
		Category = "EvilRP: Trash",
		Interesting = true,
		PrintName = "Trash",
		Description = "It no longer serves its intended purpose.\nIts corpse could be recycled at a Refinery.",
		OnTakeDamage = function(self, dmg)
			return self:TakePhysicsDamage(dmg)
		end,
		PhysicsCollide = function(self, data, physobj)
			local prop1 = util.GetSurfaceData(data.OurSurfaceProps)
			local prop2 = util.GetSurfaceData(data.TheirSurfaceProps)
			if data.Speed >= 75 and ((self.LastImpact or 0) + 0.1 < CurTime()) then
				self.LastImpact = CurTime()
				local snd
				do
					local _exp_0 = type(self.ImpactSound)
					if "table" == _exp_0 then
						snd = self.ImpactSound.hard
					elseif "string" == _exp_0 then
						snd = self.ImpactSound
					elseif "nil" == _exp_0 then
						snd = prop1.impactHardSound
					end
				end
				return self:EmitSound(snd)
			elseif data.Speed >= 25 and ((self.LastImpact or 0) + 0.1 < CurTime()) then
				self.LastImpact = CurTime()
				local snd
				do
					local _exp_0 = type(self.ImpactSound)
					if "table" == _exp_0 then
						snd = self.ImpactSound.soft
					elseif "string" == _exp_0 then
						snd = self.ImpactSound
					elseif "nil" == _exp_0 then
						snd = prop1.impactSoftSound
					end
				end
				return self:EmitSound(snd)
			end
		end,
		SubmitSound = "Trash_Cardboard",
		Initialize = function(self)
			self:SetModel(self.Model)
			if SERVER then
				self:PhysicsInit(SOLID_VPHYSICS)
				self:SetMoveType(MOVETYPE_VPHYSICS)
				self:SetSolid(SOLID_VPHYSICS)
				self:SetUseType(SIMPLE_USE)
				return self:PhysWake()
			end
		end,
		Use = function(self, ply)
			if self:IsPlayerHolding() and ply == self.ply then
				return ply:DropObject()
			else
				self.ply = ply
				ply:PickupObject(self)
				return self:SetNWEntity("evilrp_submitter", ply)
			end
		end,
		PMRender = function(item)
			local ct = { }
			local wt = scripted_ents.Get(item.class)
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
		HUDRender = function(self)
			local ct = { }
			ct[#ct + 1] = self.PrintName
			if self.Description then
				ct[#ct + 1] = ""
				ct[#ct + 1] = {
					text = self.Description,
					font = "Spleen_Label_Small"
				}
			end
			return ct
		end,
		Interactions = function(self, ply)
			local actions = { }
			if (self.Pocketable ~= false) then
				actions[#actions + 1] = {
					desc = "Pocket",
					func = (function()
						return netstream.Send("PocketItem", self)
					end)
				}
			end
			return actions
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
		__name = "Trash",
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
	Trash = _class_0
end
local Fuel
do
	local _class_0
	local _parent_0 = Trash
	local _base_0 = {
		PrintName = "Empty Jerrycan",
		Model = Model("models/props_junk/metalgascan.mdl"),
		SubmitSound = "Trash_Metal",
		Refinement = {
			result = "metal/scrap",
			time = 5,
			rust = 3
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
		__name = "Fuel",
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
	Fuel = _class_0
end
local Inhaler
do
	local _class_0
	local _parent_0 = Trash
	local _base_0 = {
		PrintName = "Dead Inhaler",
		Model = Model("models/props_wasteland/prison_sinkchunk001e.mdl"),
		SubmitSound = "Trash_Metal",
		Refinement = {
			result = "metal/scrap",
			time = 5,
			rust = 3
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
		__name = "Inhaler",
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
	Inhaler = _class_0
end
local BottleSmash
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = "placenta/weapons/bottle_break.wav"
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
		__name = "BottleSmash",
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
	BottleSmash = _class_0
end
local Bottle
do
	local _class_0
	local _parent_0 = Trash
	local _base_0 = {
		PrintName = "Empty Bottle",
		Model = Model("models/props_junk/garbage_glassbottle003a.mdl"),
		Description = "Where's the booze?",
		SubmitSound = "Trash_Glass",
		Refinement = {
			time = 2,
			rust = 1
		},
		ImpactThreshold = 256,
		Initialize = function(self)
			_class_0.__parent.__base.Initialize(self)
			if SERVER then
				return self:PrecacheGibs()
			end
		end,
		OnTakeDamage = function(self, dmg)
			_class_0.__parent.__base.OnTakeDamage(self, dmg)
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH
			local attacker = dmg:GetAttacker()
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then
				self:Shatter(dmg:GetDamageForce(), attacker)
			end
			if attacker and IsValid(attacker) and attacker:IsPlayer() then
				if attacker:HasOddity(ODDITY_DELINQUENCY) then
					return attacker:AddDespair(-math.random(2, 4))
				end
			end
		end,
		PhysicsCollide = function(self, data)
			_class_0.__parent.__base.PhysicsCollide(self, data)
			if CLIENT then
				return
			end
			if data.Speed > self.ImpactThreshold then
				if data.HitEntity and IsValid(data.HitEntity) then
					local attacker = self:GetNWEntity("evilrp_submitter")
					do
						local dmg = DamageInfo()
						dmg:SetDamage(25)
						if IsValid(attacker) then
							dmg:SetAttacker(attacker)
						end
						dmg:SetInflictor(self)
						dmg:SetDamageType(DMG_SLASH)
						dmg:SetDamagePosition(data.HitPos)
						data.HitEntity:TakeDamageInfo(dmg)
					end
				end
				local force = data.OurNewVelocity
				return self:Shatter(force)
			end
		end,
		Shatter = function(self, force, attacker)
			if attacker == nil then
				attacker = self:GetNWEntity("evilrp_submitter")
			end
			if self.broken then
				return
			end
			self.broken = true
			local pos = self:GetPos()
			local _list_0 = player.GetAll()
			for _index_0 = 1, #_list_0 do
				local ply = _list_0[_index_0]
				if not ply:HasOddity(ODDITY_DELINQUENCY) then
					goto _continue_0
				end
				if ply:CanSee(self) and ply:LookingInDirection(pos) then
					ply:AddDespair(-math.random(2, 4))
				end
				::_continue_0::
			end
			do
				local ed = EffectData()
				ed:SetStart(pos)
				ed:SetOrigin(pos)
				ed:SetScale(8)
				util.Effect("GlassImpact", ed, true, true)
			end
			self:EmitSound("BottleSmash")
			if force then
				self:GibBreakServer(force)
			end
			return self:Remove()
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
		__name = "Bottle",
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
	Bottle = _class_0
end
local FearBeer
do
	local _class_0
	local _parent_0 = Bottle
	local _base_0 = {
		Model = Model("models/props_junk/garbage_glassbottle001a.mdl")
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
		__name = "FearBeer",
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
	FearBeer = _class_0
end
local Plastic
do
	local _class_0
	local _parent_0 = Trash
	local _base_0 = {
		PrintName = "Macroplastics",
		Model = Model("models/props_junk/garbage_bag001a"),
		Description = "Plastic waste, dead to the world.\nRecycle in a refinery, or dispose of it properly in a nearby river.",
		SubmitSound = "Trash_Plastic",
		Refinement = {
			time = 2,
			rust = 1
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
		__name = "Plastic",
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
	Plastic = _class_0
end
local Twitchel
do
	local _class_0
	local _parent_0 = Plastic
	local _base_0 = {
		Model = Model("models/props_junk/garbage_plasticbottle003a.mdl")
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
		__name = "Twitchel",
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
	Twitchel = _class_0
end
local Shake
do
	local _class_0
	local _parent_0 = Plastic
	local _base_0 = {
		Model = Model("models/props_junk/garbage_milkcarton001a.mdl")
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
		__name = "Shake",
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
	Shake = _class_0
end
local Pills
do
	local _class_0
	local _parent_0 = Plastic
	local _base_0 = {
		Model = Model("models/props_lab/jar01b.mdl")
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
		__name = "Pills",
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
	Pills = _class_0
end
local Bleach
do
	local _class_0
	local _parent_0 = Plastic
	local _base_0 = {
		Model = Model("models/props_junk/garbage_plasticbottle001a.mdl")
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
		__name = "Bleach",
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
	Bleach = _class_0
	return _class_0
end
