-- [yue]: darkrp_modules\fungus\sh_fungus.yue
local fungus_max = 666 -- 4
local fungus_breed_delay = { -- 6
	min = 2, -- 6
	max = 8 -- 6
} -- 6
local fungus_breed_distance = { -- 7
	min = 25, -- 7
	max = 100 -- 7
} -- 7
local fungus_balloon_size_increase = { -- 9
	min = 5.0, -- 9
	max = 10.0 -- 9
} -- 9
local fungus_lightning_zap_delay = { -- 11
	min = 0.05, -- 11
	max = 0.15 -- 11
} -- 11
local fungus_lifespan = { -- 13
	min = 25, -- 13
	max = 35 -- 13
} -- 13
local fungus_think_rate = 0.15 -- 14
fungus_currentpop = fungus_currentpop or 0 -- 17
local fungus_float_power = { -- 19
	min = -100, -- 19
	max = 100 -- 19
} -- 19
local fungus_evolve_mutation = { -- 20
	rate = 0.10, -- 20
	chance = 25.0 -- 20
} -- 20
local fungus_next_think = CurTime() -- 24
if SERVER then -- 25
	fungus_all = fungus_all or { } -- 27
end -- 25
if SERVER then -- 29
	local on_fungus_think -- 30
	on_fungus_think = function() -- 30
		local ct = CurTime() -- 32
		if ct >= fungus_next_think then -- 33
			fungus_next_think = ct + fungus_think_rate -- 34
			local clean_list = { } -- 36
			for k, v in pairs(fungus_all) do -- 37
				if v ~= nil and IsValid(v) then -- 38
					clean_list[#clean_list + 1] = v -- 38
				end -- 38
			end -- 38
			fungus_all = clean_list -- 39
			fungus_currentpop = #fungus_all -- 40
			for k, v in pairs(fungus_all) do -- 42
				if IsValid(v) then -- 43
					v:OnFungusThink() -- 43
				end -- 43
			end -- 43
		end -- 33
	end -- 30
	hook.Add("Think", "evilrp_fungus", on_fungus_think) -- 44
end -- 29
local FungusBreed -- 46
do -- 46
	local _class_0 -- 46
	local _parent_0 = SOUND -- 46
	local _base_0 = { -- 46
		sound = (function() -- 47
			local _accum_0 = { } -- 47
			local _len_0 = 1 -- 47
			for i = 1, 3 do -- 47
				_accum_0[_len_0] = "weapons/bugbait/bugbait_squeeze" .. tostring(i) .. ".wav" -- 47
				_len_0 = _len_0 + 1 -- 47
			end -- 47
			return _accum_0 -- 47
		end)(), -- 48
		level = SNDLVL_50DB, -- 49
		volume = 0.2 -- 46
	} -- 46
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 49
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 46
			_base_0[_key_0] = _val_0 -- 46
		end -- 46
	end -- 49
	if _base_0.__index == nil then -- 46
		_base_0.__index = _base_0 -- 46
	end -- 49
	setmetatable(_base_0, _parent_0.__base) -- 46
	_class_0 = setmetatable({ -- 46
		__init = function(self, ...) -- 46
			return _class_0.__parent.__init(self, ...) -- 46
		end, -- 46
		__base = _base_0, -- 46
		__name = "FungusBreed", -- 46
		__parent = _parent_0 -- 46
	}, { -- 46
		__index = function(cls, name) -- 46
			local val = rawget(_base_0, name) -- 46
			if val == nil then -- 46
				local parent = rawget(cls, "__parent") -- 46
				if parent then -- 46
					return parent[name] -- 46
				end -- 46
			else -- 46
				return val -- 46
			end -- 46
		end, -- 46
		__call = function(cls, ...) -- 46
			local _self_0 = setmetatable({ }, _base_0) -- 46
			cls.__init(_self_0, ...) -- 46
			return _self_0 -- 46
		end -- 46
	}) -- 46
	_base_0.__class = _class_0 -- 46
	if _parent_0.__inherited then -- 46
		_parent_0.__inherited(_parent_0, _class_0) -- 46
	end -- 46
	FungusBreed = _class_0 -- 46
end -- 49
local FungusPop -- 51
do -- 51
	local _class_0 -- 51
	local _parent_0 = SOUND -- 51
	local _base_0 = { -- 51
		sound = "phx/eggcrack.wav", -- 53
		level = SNDLVL_40DB, -- 54
		pitch = { -- 54
			85, -- 54
			115 -- 54
		} -- 51
	} -- 51
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 54
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 51
			_base_0[_key_0] = _val_0 -- 51
		end -- 51
	end -- 54
	if _base_0.__index == nil then -- 51
		_base_0.__index = _base_0 -- 51
	end -- 54
	setmetatable(_base_0, _parent_0.__base) -- 51
	_class_0 = setmetatable({ -- 51
		__init = function(self, ...) -- 51
			return _class_0.__parent.__init(self, ...) -- 51
		end, -- 51
		__base = _base_0, -- 51
		__name = "FungusPop", -- 51
		__parent = _parent_0 -- 51
	}, { -- 51
		__index = function(cls, name) -- 51
			local val = rawget(_base_0, name) -- 51
			if val == nil then -- 51
				local parent = rawget(cls, "__parent") -- 51
				if parent then -- 51
					return parent[name] -- 51
				end -- 51
			else -- 51
				return val -- 51
			end -- 51
		end, -- 51
		__call = function(cls, ...) -- 51
			local _self_0 = setmetatable({ }, _base_0) -- 51
			cls.__init(_self_0, ...) -- 51
			return _self_0 -- 51
		end -- 51
	}) -- 51
	_base_0.__class = _class_0 -- 51
	if _parent_0.__inherited then -- 51
		_parent_0.__inherited(_parent_0, _class_0) -- 51
	end -- 51
	FungusPop = _class_0 -- 51
end -- 54
local LFR_FungalSpores -- 56
do -- 56
	local _class_0 -- 56
	local _parent_0 = FX -- 56
	local _base_0 = { -- 56
		Init = function(self, data) -- 57
			local pos, speed, ang, scale -- 58
			do -- 59
				pos = data:GetOrigin() -- 60
				speed = data:GetStart() -- 61
				ang = data:GetNormal() -- 62
				scale = data:GetScale() -- 63
			end -- 59
			for i = 1, 3 do -- 64
				local chance = math.Round(math.Rand(1, 3)) -- 65
				local particle_mat = "decals/bloodyflesh/blood" .. tostring(math.random(1, 4)) -- 66
				if GAMEMODE.Emitter2D then -- 67
					local particle = GAMEMODE.Emitter2D:Add(particle_mat, pos) -- 68
					local vel = ((ang * 2) * i) * 1 -- 69
					vel = vel + Vector(math.random(-4, -14), math.random(-4, 4), math.random(-4, 4)) -- 70
					do -- 71
						particle:SetVelocity(vel) -- 72
						particle:SetDieTime(math.Rand(1, 4)) -- 73
						particle:SetEndAlpha(0) -- 74
						particle:SetDieTime(math.Rand(1, 4)) -- 75
						particle:SetEndAlpha(0) -- 76
						particle:SetStartSize(1 * scale) -- 77
						particle:SetEndSize(math.random(2, 4) * scale) -- 78
						particle:SetRoll(math.Rand(-10, 10)) -- 79
						particle:SetRollDelta(math.Rand(-0.2, 0.2)) -- 80
						local color_num = math.Rand(20, 75) -- 81
						particle:SetColor(color_num, color_num, color_num) -- 82
						particle:SetStartAlpha(color_num) -- 83
						particle:SetGravity(Vector(0, 0, math.random(60, 120))) -- 84
						particle:SetCollide(true) -- 85
						particle:SetAirResistance(300) -- 86
						particle:SetBounce(2) -- 87
					end -- 71
				end -- 67
			end -- 87
		end, -- 88
		Render = function(self) end, -- 89
		Think = function(self) -- 89
			return false -- 89
		end -- 56
	} -- 56
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 89
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 56
			_base_0[_key_0] = _val_0 -- 56
		end -- 56
	end -- 89
	if _base_0.__index == nil then -- 56
		_base_0.__index = _base_0 -- 56
	end -- 89
	setmetatable(_base_0, _parent_0.__base) -- 56
	_class_0 = setmetatable({ -- 56
		__init = function(self, ...) -- 56
			return _class_0.__parent.__init(self, ...) -- 56
		end, -- 56
		__base = _base_0, -- 56
		__name = "LFR_FungalSpores", -- 56
		__parent = _parent_0 -- 56
	}, { -- 56
		__index = function(cls, name) -- 56
			local val = rawget(_base_0, name) -- 56
			if val == nil then -- 56
				local parent = rawget(cls, "__parent") -- 56
				if parent then -- 56
					return parent[name] -- 56
				end -- 56
			else -- 56
				return val -- 56
			end -- 56
		end, -- 56
		__call = function(cls, ...) -- 56
			local _self_0 = setmetatable({ }, _base_0) -- 56
			cls.__init(_self_0, ...) -- 56
			return _self_0 -- 56
		end -- 56
	}) -- 56
	_base_0.__class = _class_0 -- 56
	if _parent_0.__inherited then -- 56
		_parent_0.__inherited(_parent_0, _class_0) -- 56
	end -- 56
	LFR_FungalSpores = _class_0 -- 56
end -- 89
local Fungus -- 91
do -- 91
	local _class_0 -- 91
	local _parent_0 = ENTITY -- 91
	local _base_0 = { -- 91
		Type = "anim", -- 93
		Base = "base_gmodentity", -- 95
		PrintName = "Fungus", -- 97
		Category = "EvilRP: Fungus", -- 99
		Spawnable = true, -- 100
		AdminSpawnable = true, -- 105
		model = Model("models/weapons/w_bugbait.mdl"), -- 106
		radius = 100, -- 107
		damage = 30, -- 108
		exploded = false, -- 110
		Initialize = function(self) -- 110
			if CLIENT then -- 111
				self:SetRenderMode(RENDERMODE_TRANSALPHA) -- 112
				self.RenderGroup = RENDERGROUP_TRANSLUCENT -- 113
			elseif SERVER then -- 114
				do -- 115
					local _obj_0 = fungus_all -- 115
					_obj_0[#_obj_0 + 1] = self -- 115
				end -- 115
				local ct = CurTime() -- 116
				self.death_time = (ct + math.Rand(fungus_lifespan.min, fungus_lifespan.max)) -- 118
				self.next_spawn_time = (ct + math.Rand(fungus_breed_delay.min, fungus_breed_delay.max)) -- 120
				self:SetModel(self.model) -- 122
				self:PhysicsInitSphere(3) -- 123
				self:SetMoveType(MOVETYPE_VPHYSICS) -- 124
				self:SetSolid(SOLID_VPHYSICS) -- 125
				self:SetRenderMode(RENDERMODE_TRANSALPHA) -- 126
				self.RenderGroup = RENDERGROUP_TRANSLUCENT -- 127
				self:SetColor(Color(0, 0, 0, 230)) -- 128
				fungus_currentpop = fungus_currentpop + 1 -- 130
				for i = 1, 3 do -- 132
					util.PrecacheSound("weapons/bugbait/bugbait_squeeze" .. tostring(i) .. ".wav") -- 132
				end -- 132
			end -- 111
		end, -- 134
		OnTakeDamage = function(self, dmg) -- 134
			local attacker = dmg:GetAttacker() -- 135
			if not attacker:GetClass():find("fungus") then -- 136
				return self:FungusAction() -- 136
			end -- 136
		end, -- 138
		Touch = function(self, activator) -- 138
			if IsValid(activator) and not activator:GetClass():find("fungus") then -- 139
				return self:FungusAction(activator) -- 139
			end -- 139
		end, -- 141
		OnFungusThink = function(self) -- 141
			local ct = CurTime() -- 142
			if ct >= self.death_time then -- 143
				self:FungusDeath() -- 144
			elseif ct >= self.next_spawn_time then -- 145
				self:FungusBreed() -- 146
			end -- 143
			return true -- 147
		end, -- 149
		OnRemove = function(self) -- 149
			fungus_currentpop = fungus_currentpop - 1 -- 149
		end, -- 151
		FungusAction = function(self, activator) -- 151
			if not self.exploded then -- 152
				local puff = ents.Create("env_smoketrail") -- 153
				local kvs = { -- 155
					startsize = "10", -- 155
					endsize = "20", -- 156
					minspeed = "1", -- 157
					maxspeed = "2", -- 158
					startcolor = "40 40 40", -- 159
					endcolor = "0 40 0", -- 160
					opacity = ".8", -- 161
					spawnrate = "5", -- 162
					lifetime = "1" -- 163
				} -- 154
				for k, v in pairs(kvs) do -- 166
					puff:SetKeyValue(k, v) -- 166
				end -- 166
				puff:SetPos(self:GetPos()) -- 167
				puff:Spawn() -- 168
				puff:Fire("kill", "", 0.7) -- 169
				local pos = self:GetPos() -- 170
				if activator and IsValid(activator) and activator:IsPlayer() then -- 171
					activator:AddDespair(math.random(2, 4)) -- 172
				end -- 171
				self:EmitSound("FungusPop") -- 182
				local edata = EffectData() -- 183
				edata:SetOrigin(pos) -- 185
				edata:SetScale(2) -- 186
				edata:SetNormal(self:GetUp()) -- 187
				util.Effect("LFR_FungalSpores", edata) -- 188
			end -- 152
			self.exploded = true -- 189
			return self:Remove() -- 190
		end, -- 192
		FungusDeath = function(self) -- 192
			local puff = ents.Create("env_smoketrail") -- 193
			local kvs = { -- 195
				startsize = "10", -- 195
				endsize = "20", -- 196
				minspeed = "1", -- 197
				maxspeed = "2", -- 198
				startcolor = "40 40 40", -- 199
				endcolor = "0 40 0", -- 200
				opacity = ".8", -- 201
				spawnrate = "5", -- 202
				lifetime = "1" -- 203
			} -- 194
			for k, v in pairs(kvs) do -- 206
				puff:SetKeyValue(k, v) -- 206
			end -- 206
			puff:SetPos(self:GetPos()) -- 207
			puff:Spawn() -- 208
			puff:Fire("kill", "", 0.7) -- 209
			return self:Remove() -- 210
		end, -- 212
		FungusBreed = function(self) -- 212
			local breed_success = false -- 213
			local ct = CurTime() -- 214
			if fungus_currentpop >= fungus_max then -- 215
				return -- 215
			end -- 215
			local trace_pos = self:GetPos() + (self:GetForward() * 16) -- 217
			local x, y, z -- 218
			do -- 219
				x = trace_pos.x + math.Rand(-fungus_breed_distance.min, fungus_breed_distance.max) -- 220
				y = trace_pos.y + math.Rand(-fungus_breed_distance.min, fungus_breed_distance.max) -- 221
				z = trace_pos.z + math.Rand(-fungus_breed_distance.min, fungus_breed_distance.max) -- 222
			end -- 219
			local trace = { -- 224
				start = trace_pos, -- 224
				endpos = Vector(x, y, z) -- 225
			} -- 223
			local tr = util.TraceLine(trace) -- 227
			if tr.Hit and not tr.HitSky then -- 229
				if tr.HitNonWorld then -- 231
					local hitentity = tr.Entity:GetClass() -- 233
					if hitentity == "player" then -- 234
						return -- 234
					end -- 234
					if hitentity:find("fungus") then -- 235
						return -- 235
					end -- 235
					if hitentity:find("npc") then -- 236
						return -- 236
					end -- 236
				end -- 231
				local dist = self:GetPos():Distance(tr.HitPos) -- 238
				if dist >= fungus_breed_distance.min and dist <= fungus_breed_distance.max then -- 239
					local spawn_pos = tr.HitPos + tr.HitNormal * 2 -- 241
					local spawn_angle = tr.HitNormal:Angle() -- 242
					local ent = ents.Create(self:GetClass()) -- 243
					ent:SetPos(spawn_pos) -- 245
					ent:SetAngles(spawn_angle) -- 246
					ent:Spawn() -- 247
					ent:Activate() -- 248
					ent:Initialize() -- 249
					ent:SetOwner(tr.Entity) -- 250
					ent:EmitSound("FungusBreed") -- 252
					if tr.Entity:IsWorld() then -- 255
						ent:GetPhysicsObject():EnableMotion(false) -- 256
					else -- 258
						local weld = constraint.Weld(ent, tr.Entity, 0, tr.PhysicsBone, 0) -- 258
					end -- 255
					breed_success = true -- 260
				end -- 239
			end -- 229
			if breed_success then -- 261
				local min, max = fungus_breed_delay.min, fungus_breed_delay.max -- 262
				self.next_spawn_time = (ct + math.Rand(min, max)) -- 263
			end -- 261
		end -- 91
	} -- 91
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 263
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 91
			_base_0[_key_0] = _val_0 -- 91
		end -- 91
	end -- 263
	if _base_0.__index == nil then -- 91
		_base_0.__index = _base_0 -- 91
	end -- 263
	setmetatable(_base_0, _parent_0.__base) -- 91
	_class_0 = setmetatable({ -- 91
		__init = function(self, ...) -- 91
			return _class_0.__parent.__init(self, ...) -- 91
		end, -- 91
		__base = _base_0, -- 91
		__name = "Fungus", -- 91
		__parent = _parent_0 -- 91
	}, { -- 91
		__index = function(cls, name) -- 91
			local val = rawget(_base_0, name) -- 91
			if val == nil then -- 91
				local parent = rawget(cls, "__parent") -- 91
				if parent then -- 91
					return parent[name] -- 91
				end -- 91
			else -- 91
				return val -- 91
			end -- 91
		end, -- 91
		__call = function(cls, ...) -- 91
			local _self_0 = setmetatable({ }, _base_0) -- 91
			cls.__init(_self_0, ...) -- 91
			return _self_0 -- 91
		end -- 91
	}) -- 91
	_base_0.__class = _class_0 -- 91
	if _parent_0.__inherited then -- 91
		_parent_0.__inherited(_parent_0, _class_0) -- 91
	end -- 91
	Fungus = _class_0 -- 91
	return _class_0 -- 263
end -- 263
