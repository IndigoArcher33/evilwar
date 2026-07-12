-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/trash/sh_trash.yue
local Trash_Cardboard -- 1
do -- 1
	local _class_0 -- 1
	local _parent_0 = SOUND -- 1
	local _base_0 = { -- 1
		sound = (function() -- 2
			local _accum_0 = { } -- 2
			local _len_0 = 1 -- 2
			for i = 1, 3 do -- 2
				_accum_0[_len_0] = "physics/cardboard/cardboard_box_break" .. tostring(i) .. ".wav" -- 2
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
		__name = "Trash_Cardboard", -- 1
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
	Trash_Cardboard = _class_0 -- 1
end -- 2
local Trash_Metal -- 4
do -- 4
	local _class_0 -- 4
	local _parent_0 = SOUND -- 4
	local _base_0 = { -- 4
		sound = (function() -- 5
			local _accum_0 = { } -- 5
			local _len_0 = 1 -- 5
			for i = 1, 2 do -- 5
				_accum_0[_len_0] = "physics/metal/metal_box_break" .. tostring(i) .. ".wav" -- 5
				_len_0 = _len_0 + 1 -- 5
			end -- 5
			return _accum_0 -- 5
		end)() -- 4
	} -- 4
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 5
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 4
			_base_0[_key_0] = _val_0 -- 4
		end -- 4
	end -- 5
	if _base_0.__index == nil then -- 4
		_base_0.__index = _base_0 -- 4
	end -- 5
	setmetatable(_base_0, _parent_0.__base) -- 4
	_class_0 = setmetatable({ -- 4
		__init = function(self, ...) -- 4
			return _class_0.__parent.__init(self, ...) -- 4
		end, -- 4
		__base = _base_0, -- 4
		__name = "Trash_Metal", -- 4
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
	if _parent_0.__inherited then -- 4
		_parent_0.__inherited(_parent_0, _class_0) -- 4
	end -- 4
	Trash_Metal = _class_0 -- 4
end -- 5
local Trash_Glass -- 7
do -- 7
	local _class_0 -- 7
	local _parent_0 = SOUND -- 7
	local _base_0 = { -- 7
		sound = (function() -- 8
			local _accum_0 = { } -- 8
			local _len_0 = 1 -- 8
			for i = 2, 3 do -- 8
				_accum_0[_len_0] = "physics/glass/glass_largesheet_break" .. tostring(i) .. ".wav" -- 8
				_len_0 = _len_0 + 1 -- 8
			end -- 8
			return _accum_0 -- 8
		end)() -- 7
	} -- 7
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 8
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 7
			_base_0[_key_0] = _val_0 -- 7
		end -- 7
	end -- 8
	if _base_0.__index == nil then -- 7
		_base_0.__index = _base_0 -- 7
	end -- 8
	setmetatable(_base_0, _parent_0.__base) -- 7
	_class_0 = setmetatable({ -- 7
		__init = function(self, ...) -- 7
			return _class_0.__parent.__init(self, ...) -- 7
		end, -- 7
		__base = _base_0, -- 7
		__name = "Trash_Glass", -- 7
		__parent = _parent_0 -- 7
	}, { -- 7
		__index = function(cls, name) -- 7
			local val = rawget(_base_0, name) -- 7
			if val == nil then -- 7
				local parent = rawget(cls, "__parent") -- 7
				if parent then -- 7
					return parent[name] -- 7
				end -- 7
			else -- 7
				return val -- 7
			end -- 7
		end, -- 7
		__call = function(cls, ...) -- 7
			local _self_0 = setmetatable({ }, _base_0) -- 7
			cls.__init(_self_0, ...) -- 7
			return _self_0 -- 7
		end -- 7
	}) -- 7
	_base_0.__class = _class_0 -- 7
	if _parent_0.__inherited then -- 7
		_parent_0.__inherited(_parent_0, _class_0) -- 7
	end -- 7
	Trash_Glass = _class_0 -- 7
end -- 8
local Trash_Plastic -- 10
do -- 10
	local _class_0 -- 10
	local _parent_0 = SOUND -- 10
	local _base_0 = { -- 10
		sound = (function() -- 11
			local _accum_0 = { } -- 11
			local _len_0 = 1 -- 11
			for i = 1, 2 do -- 11
				_accum_0[_len_0] = "physics/plastic/plastic_barrel_break" .. tostring(i) .. ".wav" -- 11
				_len_0 = _len_0 + 1 -- 11
			end -- 11
			return _accum_0 -- 11
		end)() -- 10
	} -- 10
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 11
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 10
			_base_0[_key_0] = _val_0 -- 10
		end -- 10
	end -- 11
	if _base_0.__index == nil then -- 10
		_base_0.__index = _base_0 -- 10
	end -- 11
	setmetatable(_base_0, _parent_0.__base) -- 10
	_class_0 = setmetatable({ -- 10
		__init = function(self, ...) -- 10
			return _class_0.__parent.__init(self, ...) -- 10
		end, -- 10
		__base = _base_0, -- 10
		__name = "Trash_Plastic", -- 10
		__parent = _parent_0 -- 10
	}, { -- 10
		__index = function(cls, name) -- 10
			local val = rawget(_base_0, name) -- 10
			if val == nil then -- 10
				local parent = rawget(cls, "__parent") -- 10
				if parent then -- 10
					return parent[name] -- 10
				end -- 10
			else -- 10
				return val -- 10
			end -- 10
		end, -- 10
		__call = function(cls, ...) -- 10
			local _self_0 = setmetatable({ }, _base_0) -- 10
			cls.__init(_self_0, ...) -- 10
			return _self_0 -- 10
		end -- 10
	}) -- 10
	_base_0.__class = _class_0 -- 10
	if _parent_0.__inherited then -- 10
		_parent_0.__inherited(_parent_0, _class_0) -- 10
	end -- 10
	Trash_Plastic = _class_0 -- 10
end -- 11
local Trash -- 13
do -- 13
	local _class_0 -- 13
	local _parent_0 = ENTITY -- 13
	local _base_0 = { -- 13
		Base = "base_anim", -- 15
		Type = "anim", -- 17
		Spawnable = true, -- 18
		AdminSpawnable = true, -- 20
		Category = "EvilRP: Trash", -- 22
		Interesting = true, -- 24
		PrintName = "Trash", -- 26
		Description = "It no longer serves its intended purpose.\nIts corpse could be recycled at a Refinery.", -- 28
		OnTakeDamage = function(self, dmg) -- 28
			return self:TakePhysicsDamage(dmg) -- 29
		end, -- 31
		PhysicsCollide = function(self, data, physobj) -- 31
			local prop1 = util.GetSurfaceData(data.OurSurfaceProps) -- 32
			local prop2 = util.GetSurfaceData(data.TheirSurfaceProps) -- 33
			if data.Speed >= 75 and ((self.LastImpact or 0) + 0.1 < CurTime()) then -- 34
				self.LastImpact = CurTime() -- 35
				local snd -- 36
				do -- 36
					local _exp_0 = type(self.ImpactSound) -- 36
					if "table" == _exp_0 then -- 37
						snd = self.ImpactSound.hard -- 38
					elseif "string" == _exp_0 then -- 39
						snd = self.ImpactSound -- 40
					elseif "nil" == _exp_0 then -- 41
						snd = prop1.impactHardSound -- 42
					end -- 42
				end -- 42
				return self:EmitSound(snd) -- 43
			elseif data.Speed >= 25 and ((self.LastImpact or 0) + 0.1 < CurTime()) then -- 45
				self.LastImpact = CurTime() -- 46
				local snd -- 47
				do -- 47
					local _exp_0 = type(self.ImpactSound) -- 47
					if "table" == _exp_0 then -- 48
						snd = self.ImpactSound.soft -- 49
					elseif "string" == _exp_0 then -- 50
						snd = self.ImpactSound -- 51
					elseif "nil" == _exp_0 then -- 52
						snd = prop1.impactSoftSound -- 53
					end -- 53
				end -- 53
				return self:EmitSound(snd) -- 54
			end -- 34
		end, -- 56
		SubmitSound = "Trash_Cardboard", -- 58
		Initialize = function(self) -- 58
			self:SetModel(self.Model) -- 59
			if SERVER then -- 60
				self:PhysicsInit(SOLID_VPHYSICS) -- 61
				self:SetMoveType(MOVETYPE_VPHYSICS) -- 62
				self:SetSolid(SOLID_VPHYSICS) -- 63
				self:SetUseType(SIMPLE_USE) -- 64
				return self:PhysWake() -- 65
			end -- 60
		end, -- 67
		Use = function(self, ply) -- 67
			if self:IsPlayerHolding() and ply == self.ply then -- 68
				return ply:DropObject() -- 69
			else -- 71
				self.ply = ply -- 71
				ply:PickupObject(self) -- 72
				return self:SetNWEntity("evilrp_submitter", ply) -- 73
			end -- 68
		end, -- 75
		PMRender = function(item) -- 75
			local ct = { } -- 76
			local wt = scripted_ents.Get(item.class) -- 77
			ct[#ct + 1] = wt.PrintName -- 78
			if wt.Description then -- 79
				ct[#ct + 1] = "" -- 80
				ct[#ct + 1] = { -- 81
					text = wt.Description, -- 81
					font = "Spleen_Label_Small" -- 81
				} -- 81
			end -- 79
			return ct -- 82
		end, -- 84
		HUDRender = function(self) -- 84
			local ct = { } -- 85
			ct[#ct + 1] = self.PrintName -- 86
			if self.Description then -- 87
				ct[#ct + 1] = "" -- 88
				ct[#ct + 1] = { -- 89
					text = self.Description, -- 89
					font = "Spleen_Label_Small" -- 89
				} -- 89
			end -- 87
			return ct -- 90
		end, -- 92
		Interactions = function(self, ply) -- 92
			local actions = { } -- 93
			if (self.Pocketable ~= false) then -- 94
				actions[#actions + 1] = { -- 95
					desc = "Pocket", -- 95
					func = (function() -- 95
						return netstream.Send("PocketItem", self) -- 95
					end) -- 95
				} -- 95
			end -- 94
			return actions -- 96
		end -- 13
	} -- 13
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 96
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 13
			_base_0[_key_0] = _val_0 -- 13
		end -- 13
	end -- 96
	if _base_0.__index == nil then -- 13
		_base_0.__index = _base_0 -- 13
	end -- 96
	setmetatable(_base_0, _parent_0.__base) -- 13
	_class_0 = setmetatable({ -- 13
		__init = function(self, ...) -- 13
			return _class_0.__parent.__init(self, ...) -- 13
		end, -- 13
		__base = _base_0, -- 13
		__name = "Trash", -- 13
		__parent = _parent_0 -- 13
	}, { -- 13
		__index = function(cls, name) -- 13
			local val = rawget(_base_0, name) -- 13
			if val == nil then -- 13
				local parent = rawget(cls, "__parent") -- 13
				if parent then -- 13
					return parent[name] -- 13
				end -- 13
			else -- 13
				return val -- 13
			end -- 13
		end, -- 13
		__call = function(cls, ...) -- 13
			local _self_0 = setmetatable({ }, _base_0) -- 13
			cls.__init(_self_0, ...) -- 13
			return _self_0 -- 13
		end -- 13
	}) -- 13
	_base_0.__class = _class_0 -- 13
	if _parent_0.__inherited then -- 13
		_parent_0.__inherited(_parent_0, _class_0) -- 13
	end -- 13
	Trash = _class_0 -- 13
end -- 96
local Fuel -- 99
do -- 99
	local _class_0 -- 99
	local _parent_0 = Trash -- 99
	local _base_0 = { -- 99
		PrintName = "Empty Jerrycan", -- 102
		Model = Model("models/props_junk/metalgascan.mdl"), -- 103
		SubmitSound = "Trash_Metal", -- 104
		Refinement = { -- 105
			result = "metal/scrap", -- 105
			time = 5, -- 106
			rust = 3 -- 107
		} -- 99
	} -- 99
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 107
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 99
			_base_0[_key_0] = _val_0 -- 99
		end -- 99
	end -- 107
	if _base_0.__index == nil then -- 99
		_base_0.__index = _base_0 -- 99
	end -- 107
	setmetatable(_base_0, _parent_0.__base) -- 99
	_class_0 = setmetatable({ -- 99
		__init = function(self, ...) -- 99
			return _class_0.__parent.__init(self, ...) -- 99
		end, -- 99
		__base = _base_0, -- 99
		__name = "Fuel", -- 99
		__parent = _parent_0 -- 99
	}, { -- 99
		__index = function(cls, name) -- 99
			local val = rawget(_base_0, name) -- 99
			if val == nil then -- 99
				local parent = rawget(cls, "__parent") -- 99
				if parent then -- 99
					return parent[name] -- 99
				end -- 99
			else -- 99
				return val -- 99
			end -- 99
		end, -- 99
		__call = function(cls, ...) -- 99
			local _self_0 = setmetatable({ }, _base_0) -- 99
			cls.__init(_self_0, ...) -- 99
			return _self_0 -- 99
		end -- 99
	}) -- 99
	_base_0.__class = _class_0 -- 99
	if _parent_0.__inherited then -- 99
		_parent_0.__inherited(_parent_0, _class_0) -- 99
	end -- 99
	Fuel = _class_0 -- 99
end -- 107
local Inhaler -- 109
do -- 109
	local _class_0 -- 109
	local _parent_0 = Trash -- 109
	local _base_0 = { -- 109
		PrintName = "Dead Inhaler", -- 112
		Model = Model("models/props_wasteland/prison_sinkchunk001e.mdl"), -- 114
		SubmitSound = "Trash_Metal", -- 116
		Refinement = { -- 117
			result = "metal/scrap", -- 117
			time = 5, -- 118
			rust = 3 -- 119
		} -- 109
	} -- 109
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 119
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 109
			_base_0[_key_0] = _val_0 -- 109
		end -- 109
	end -- 119
	if _base_0.__index == nil then -- 109
		_base_0.__index = _base_0 -- 109
	end -- 119
	setmetatable(_base_0, _parent_0.__base) -- 109
	_class_0 = setmetatable({ -- 109
		__init = function(self, ...) -- 109
			return _class_0.__parent.__init(self, ...) -- 109
		end, -- 109
		__base = _base_0, -- 109
		__name = "Inhaler", -- 109
		__parent = _parent_0 -- 109
	}, { -- 109
		__index = function(cls, name) -- 109
			local val = rawget(_base_0, name) -- 109
			if val == nil then -- 109
				local parent = rawget(cls, "__parent") -- 109
				if parent then -- 109
					return parent[name] -- 109
				end -- 109
			else -- 109
				return val -- 109
			end -- 109
		end, -- 109
		__call = function(cls, ...) -- 109
			local _self_0 = setmetatable({ }, _base_0) -- 109
			cls.__init(_self_0, ...) -- 109
			return _self_0 -- 109
		end -- 109
	}) -- 109
	_base_0.__class = _class_0 -- 109
	if _parent_0.__inherited then -- 109
		_parent_0.__inherited(_parent_0, _class_0) -- 109
	end -- 109
	Inhaler = _class_0 -- 109
end -- 119
local BottleSmash -- 121
do -- 121
	local _class_0 -- 121
	local _parent_0 = SOUND -- 121
	local _base_0 = { -- 121
		sound = "placenta/weapons/bottle_break.wav" -- 121
	} -- 121
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 122
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 121
			_base_0[_key_0] = _val_0 -- 121
		end -- 121
	end -- 122
	if _base_0.__index == nil then -- 121
		_base_0.__index = _base_0 -- 121
	end -- 122
	setmetatable(_base_0, _parent_0.__base) -- 121
	_class_0 = setmetatable({ -- 121
		__init = function(self, ...) -- 121
			return _class_0.__parent.__init(self, ...) -- 121
		end, -- 121
		__base = _base_0, -- 121
		__name = "BottleSmash", -- 121
		__parent = _parent_0 -- 121
	}, { -- 121
		__index = function(cls, name) -- 121
			local val = rawget(_base_0, name) -- 121
			if val == nil then -- 121
				local parent = rawget(cls, "__parent") -- 121
				if parent then -- 121
					return parent[name] -- 121
				end -- 121
			else -- 121
				return val -- 121
			end -- 121
		end, -- 121
		__call = function(cls, ...) -- 121
			local _self_0 = setmetatable({ }, _base_0) -- 121
			cls.__init(_self_0, ...) -- 121
			return _self_0 -- 121
		end -- 121
	}) -- 121
	_base_0.__class = _class_0 -- 121
	if _parent_0.__inherited then -- 121
		_parent_0.__inherited(_parent_0, _class_0) -- 121
	end -- 121
	BottleSmash = _class_0 -- 121
end -- 122
local Bottle -- 124
do -- 124
	local _class_0 -- 124
	local _parent_0 = Trash -- 124
	local _base_0 = { -- 124
		PrintName = "Empty Bottle", -- 127
		Model = Model("models/props_junk/garbage_glassbottle003a.mdl"), -- 129
		Description = "Where's the booze?", -- 131
		SubmitSound = "Trash_Glass", -- 133
		Refinement = { -- 134
			time = 2, -- 134
			rust = 1 -- 135
		}, -- 137
		ImpactThreshold = 256, -- 139
		Initialize = function(self) -- 139
			_class_0.__parent.__base.Initialize(self) -- 140
			if SERVER then -- 141
				return self:PrecacheGibs() -- 141
			end -- 141
		end, -- 143
		OnTakeDamage = function(self, dmg) -- 143
			_class_0.__parent.__base.OnTakeDamage(self, dmg) -- 144
			local types = DMG_CLUB + DMG_SLASH + DMG_BULLET + DMG_CRUSH -- 145
			local attacker = dmg:GetAttacker() -- 146
			if dmg:GetDamage() > 10 and dmg:IsDamageType(types) then -- 147
				self:Shatter(dmg:GetDamageForce(), attacker) -- 147
			end -- 147
			if attacker and IsValid(attacker) and attacker:IsPlayer() then -- 148
				if attacker:HasOddity(ODDITY_DELINQUENCY) then -- 149
					return attacker:AddDespair(-math.random(2, 4)) -- 150
				end -- 149
			end -- 148
		end, -- 152
		PhysicsCollide = function(self, data) -- 152
			_class_0.__parent.__base.PhysicsCollide(self, data) -- 153
			if CLIENT then -- 154
				return -- 154
			end -- 154
			if data.Speed > self.ImpactThreshold then -- 155
				if data.HitEntity and IsValid(data.HitEntity) then -- 156
					local attacker = self:GetNWEntity("evilrp_submitter") -- 157
					local dmg = DamageInfo() -- 158
					dmg:SetDamage(25) -- 159
					if IsValid(attacker) then -- 160
						dmg:SetAttacker(attacker) -- 160
					end -- 160
					dmg:SetInflictor(self) -- 161
					dmg:SetDamageType(DMG_SLASH) -- 162
					dmg:SetDamagePosition(data.HitPos) -- 163
					data.HitEntity:TakeDamageInfo(dmg) -- 164
				end -- 156
				local force = data.OurNewVelocity -- 165
				return self:Shatter(force) -- 166
			end -- 155
		end, -- 168
		Shatter = function(self, force, attacker) -- 168
			if attacker == nil then -- 168
				attacker = self:GetNWEntity("evilrp_submitter") -- 168
			end -- 168
			if self.broken then -- 169
				return -- 169
			end -- 169
			self.broken = true -- 170
			local pos = self:GetPos() -- 171
			local _list_0 = player.GetAll() -- 172
			for _index_0 = 1, #_list_0 do -- 172
				local ply = _list_0[_index_0] -- 172
				local _continue_0 = false -- 173
				repeat -- 173
					if not ply:HasOddity(ODDITY_DELINQUENCY) then -- 173
						_continue_0 = true -- 173
						break -- 173
					end -- 173
					if ply:CanSee(self) and ply:LookingInDirection(pos) then -- 174
						ply:AddDespair(-math.random(2, 4)) -- 175
					end -- 174
					_continue_0 = true -- 173
				until true -- 175
				if not _continue_0 then -- 175
					break -- 175
				end -- 175
			end -- 175
			do -- 176
				local ed = EffectData() -- 176
				ed:SetStart(pos) -- 177
				ed:SetOrigin(pos) -- 178
				ed:SetScale(8) -- 179
				util.Effect("GlassImpact", ed, true, true) -- 180
			end -- 176
			self:EmitSound("BottleSmash") -- 181
			if force then -- 182
				self:GibBreakServer(force) -- 182
			end -- 182
			return self:Remove() -- 183
		end -- 124
	} -- 124
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 184
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 124
			_base_0[_key_0] = _val_0 -- 124
		end -- 124
	end -- 184
	if _base_0.__index == nil then -- 124
		_base_0.__index = _base_0 -- 124
	end -- 184
	setmetatable(_base_0, _parent_0.__base) -- 124
	_class_0 = setmetatable({ -- 124
		__init = function(self, ...) -- 124
			return _class_0.__parent.__init(self, ...) -- 124
		end, -- 124
		__base = _base_0, -- 124
		__name = "Bottle", -- 124
		__parent = _parent_0 -- 124
	}, { -- 124
		__index = function(cls, name) -- 124
			local val = rawget(_base_0, name) -- 124
			if val == nil then -- 124
				local parent = rawget(cls, "__parent") -- 124
				if parent then -- 124
					return parent[name] -- 124
				end -- 124
			else -- 124
				return val -- 124
			end -- 124
		end, -- 124
		__call = function(cls, ...) -- 124
			local _self_0 = setmetatable({ }, _base_0) -- 124
			cls.__init(_self_0, ...) -- 124
			return _self_0 -- 124
		end -- 124
	}) -- 124
	_base_0.__class = _class_0 -- 124
	if _parent_0.__inherited then -- 124
		_parent_0.__inherited(_parent_0, _class_0) -- 124
	end -- 124
	Bottle = _class_0 -- 124
end -- 184
local FearBeer -- 185
do -- 185
	local _class_0 -- 185
	local _parent_0 = Bottle -- 185
	local _base_0 = { -- 185
		Model = Model("models/props_junk/garbage_glassbottle001a.mdl") -- 185
	} -- 185
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 186
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 185
			_base_0[_key_0] = _val_0 -- 185
		end -- 185
	end -- 186
	if _base_0.__index == nil then -- 185
		_base_0.__index = _base_0 -- 185
	end -- 186
	setmetatable(_base_0, _parent_0.__base) -- 185
	_class_0 = setmetatable({ -- 185
		__init = function(self, ...) -- 185
			return _class_0.__parent.__init(self, ...) -- 185
		end, -- 185
		__base = _base_0, -- 185
		__name = "FearBeer", -- 185
		__parent = _parent_0 -- 185
	}, { -- 185
		__index = function(cls, name) -- 185
			local val = rawget(_base_0, name) -- 185
			if val == nil then -- 185
				local parent = rawget(cls, "__parent") -- 185
				if parent then -- 185
					return parent[name] -- 185
				end -- 185
			else -- 185
				return val -- 185
			end -- 185
		end, -- 185
		__call = function(cls, ...) -- 185
			local _self_0 = setmetatable({ }, _base_0) -- 185
			cls.__init(_self_0, ...) -- 185
			return _self_0 -- 185
		end -- 185
	}) -- 185
	_base_0.__class = _class_0 -- 185
	if _parent_0.__inherited then -- 185
		_parent_0.__inherited(_parent_0, _class_0) -- 185
	end -- 185
	FearBeer = _class_0 -- 185
end -- 186
local Plastic -- 188
do -- 188
	local _class_0 -- 188
	local _parent_0 = Trash -- 188
	local _base_0 = { -- 188
		PrintName = "Macroplastics", -- 191
		Model = Model("models/props_junk/garbage_bag001a"), -- 193
		Description = "Plastic waste, dead to the world.\nRecycle in a refinery, or dispose of it properly in a nearby river.", -- 195
		SubmitSound = "Trash_Plastic", -- 197
		Refinement = { -- 198
			time = 2, -- 198
			rust = 1 -- 199
		} -- 188
	} -- 188
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 199
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 188
			_base_0[_key_0] = _val_0 -- 188
		end -- 188
	end -- 199
	if _base_0.__index == nil then -- 188
		_base_0.__index = _base_0 -- 188
	end -- 199
	setmetatable(_base_0, _parent_0.__base) -- 188
	_class_0 = setmetatable({ -- 188
		__init = function(self, ...) -- 188
			return _class_0.__parent.__init(self, ...) -- 188
		end, -- 188
		__base = _base_0, -- 188
		__name = "Plastic", -- 188
		__parent = _parent_0 -- 188
	}, { -- 188
		__index = function(cls, name) -- 188
			local val = rawget(_base_0, name) -- 188
			if val == nil then -- 188
				local parent = rawget(cls, "__parent") -- 188
				if parent then -- 188
					return parent[name] -- 188
				end -- 188
			else -- 188
				return val -- 188
			end -- 188
		end, -- 188
		__call = function(cls, ...) -- 188
			local _self_0 = setmetatable({ }, _base_0) -- 188
			cls.__init(_self_0, ...) -- 188
			return _self_0 -- 188
		end -- 188
	}) -- 188
	_base_0.__class = _class_0 -- 188
	if _parent_0.__inherited then -- 188
		_parent_0.__inherited(_parent_0, _class_0) -- 188
	end -- 188
	Plastic = _class_0 -- 188
end -- 199
local Twitchel -- 201
do -- 201
	local _class_0 -- 201
	local _parent_0 = Plastic -- 201
	local _base_0 = { -- 201
		Model = Model("models/props_junk/garbage_plasticbottle003a.mdl") -- 201
	} -- 201
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 202
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 201
			_base_0[_key_0] = _val_0 -- 201
		end -- 201
	end -- 202
	if _base_0.__index == nil then -- 201
		_base_0.__index = _base_0 -- 201
	end -- 202
	setmetatable(_base_0, _parent_0.__base) -- 201
	_class_0 = setmetatable({ -- 201
		__init = function(self, ...) -- 201
			return _class_0.__parent.__init(self, ...) -- 201
		end, -- 201
		__base = _base_0, -- 201
		__name = "Twitchel", -- 201
		__parent = _parent_0 -- 201
	}, { -- 201
		__index = function(cls, name) -- 201
			local val = rawget(_base_0, name) -- 201
			if val == nil then -- 201
				local parent = rawget(cls, "__parent") -- 201
				if parent then -- 201
					return parent[name] -- 201
				end -- 201
			else -- 201
				return val -- 201
			end -- 201
		end, -- 201
		__call = function(cls, ...) -- 201
			local _self_0 = setmetatable({ }, _base_0) -- 201
			cls.__init(_self_0, ...) -- 201
			return _self_0 -- 201
		end -- 201
	}) -- 201
	_base_0.__class = _class_0 -- 201
	if _parent_0.__inherited then -- 201
		_parent_0.__inherited(_parent_0, _class_0) -- 201
	end -- 201
	Twitchel = _class_0 -- 201
end -- 202
local Shake -- 204
do -- 204
	local _class_0 -- 204
	local _parent_0 = Plastic -- 204
	local _base_0 = { -- 204
		Model = Model("models/props_junk/garbage_milkcarton001a.mdl") -- 204
	} -- 204
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 205
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 204
			_base_0[_key_0] = _val_0 -- 204
		end -- 204
	end -- 205
	if _base_0.__index == nil then -- 204
		_base_0.__index = _base_0 -- 204
	end -- 205
	setmetatable(_base_0, _parent_0.__base) -- 204
	_class_0 = setmetatable({ -- 204
		__init = function(self, ...) -- 204
			return _class_0.__parent.__init(self, ...) -- 204
		end, -- 204
		__base = _base_0, -- 204
		__name = "Shake", -- 204
		__parent = _parent_0 -- 204
	}, { -- 204
		__index = function(cls, name) -- 204
			local val = rawget(_base_0, name) -- 204
			if val == nil then -- 204
				local parent = rawget(cls, "__parent") -- 204
				if parent then -- 204
					return parent[name] -- 204
				end -- 204
			else -- 204
				return val -- 204
			end -- 204
		end, -- 204
		__call = function(cls, ...) -- 204
			local _self_0 = setmetatable({ }, _base_0) -- 204
			cls.__init(_self_0, ...) -- 204
			return _self_0 -- 204
		end -- 204
	}) -- 204
	_base_0.__class = _class_0 -- 204
	if _parent_0.__inherited then -- 204
		_parent_0.__inherited(_parent_0, _class_0) -- 204
	end -- 204
	Shake = _class_0 -- 204
end -- 205
local Pills -- 207
do -- 207
	local _class_0 -- 207
	local _parent_0 = Plastic -- 207
	local _base_0 = { -- 207
		Model = Model("models/props_lab/jar01b.mdl") -- 207
	} -- 207
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 208
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 207
			_base_0[_key_0] = _val_0 -- 207
		end -- 207
	end -- 208
	if _base_0.__index == nil then -- 207
		_base_0.__index = _base_0 -- 207
	end -- 208
	setmetatable(_base_0, _parent_0.__base) -- 207
	_class_0 = setmetatable({ -- 207
		__init = function(self, ...) -- 207
			return _class_0.__parent.__init(self, ...) -- 207
		end, -- 207
		__base = _base_0, -- 207
		__name = "Pills", -- 207
		__parent = _parent_0 -- 207
	}, { -- 207
		__index = function(cls, name) -- 207
			local val = rawget(_base_0, name) -- 207
			if val == nil then -- 207
				local parent = rawget(cls, "__parent") -- 207
				if parent then -- 207
					return parent[name] -- 207
				end -- 207
			else -- 207
				return val -- 207
			end -- 207
		end, -- 207
		__call = function(cls, ...) -- 207
			local _self_0 = setmetatable({ }, _base_0) -- 207
			cls.__init(_self_0, ...) -- 207
			return _self_0 -- 207
		end -- 207
	}) -- 207
	_base_0.__class = _class_0 -- 207
	if _parent_0.__inherited then -- 207
		_parent_0.__inherited(_parent_0, _class_0) -- 207
	end -- 207
	Pills = _class_0 -- 207
end -- 208
local Bleach -- 210
local _class_0 -- 210
local _parent_0 = Plastic -- 210
local _base_0 = { -- 210
	Model = Model("models/props_junk/garbage_plasticbottle001a.mdl") -- 210
} -- 210
for _key_0, _val_0 in pairs(_parent_0.__base) do -- 211
	if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 210
		_base_0[_key_0] = _val_0 -- 210
	end -- 210
end -- 211
if _base_0.__index == nil then -- 210
	_base_0.__index = _base_0 -- 210
end -- 211
setmetatable(_base_0, _parent_0.__base) -- 210
_class_0 = setmetatable({ -- 210
	__init = function(self, ...) -- 210
		return _class_0.__parent.__init(self, ...) -- 210
	end, -- 210
	__base = _base_0, -- 210
	__name = "Bleach", -- 210
	__parent = _parent_0 -- 210
}, { -- 210
	__index = function(cls, name) -- 210
		local val = rawget(_base_0, name) -- 210
		if val == nil then -- 210
			local parent = rawget(cls, "__parent") -- 210
			if parent then -- 210
				return parent[name] -- 210
			end -- 210
		else -- 210
			return val -- 210
		end -- 210
	end, -- 210
	__call = function(cls, ...) -- 210
		local _self_0 = setmetatable({ }, _base_0) -- 210
		cls.__init(_self_0, ...) -- 210
		return _self_0 -- 210
	end -- 210
}) -- 210
_base_0.__class = _class_0 -- 210
if _parent_0.__inherited then -- 210
	_parent_0.__inherited(_parent_0, _class_0) -- 210
end -- 210
Bleach = _class_0 -- 210
return _class_0 -- 211
