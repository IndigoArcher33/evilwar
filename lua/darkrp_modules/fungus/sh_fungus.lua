local fungus_max = 666
local fungus_breed_delay = {
	min = 2,
	max = 8
}
local fungus_breed_distance = {
	min = 25,
	max = 100
}
local fungus_balloon_size_increase = {
	min = 5.0,
	max = 10.0
}
local fungus_lightning_zap_delay = {
	min = 0.05,
	max = 0.15
}
local fungus_lifespan = {
	min = 25,
	max = 35
}
local fungus_think_rate = 0.15
fungus_currentpop = fungus_currentpop or 0
local fungus_float_power = {
	min = -100,
	max = 100
}
local fungus_evolve_mutation = {
	rate = 0.10,
	chance = 25.0
}
local fungus_next_think = CurTime()
if SERVER then
	fungus_all = fungus_all or { }
end
if SERVER then
	local on_fungus_think
	on_fungus_think = function()
		local ct = CurTime()
		if ct >= fungus_next_think then
			fungus_next_think = ct + fungus_think_rate
			local clean_list = { }
			for k, v in pairs(fungus_all) do
				if v ~= nil and IsValid(v) then
					clean_list[#clean_list + 1] = v
				end
			end
			fungus_all = clean_list
			fungus_currentpop = #fungus_all
			for k, v in pairs(fungus_all) do
				if IsValid(v) then
					v:OnFungusThink()
				end
			end
		end
	end
	hook.Add("Think", "evilrp_fungus", on_fungus_think)
end
local FungusBreed
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 3 do
				_accum_0[_len_0] = "weapons/bugbait/bugbait_squeeze" .. tostring(i) .. ".wav"
				_len_0 = _len_0 + 1
			end
			return _accum_0
		end)(),
		level = SNDLVL_50DB,
		volume = 0.2
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
		__name = "FungusBreed",
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
	FungusBreed = _class_0
end
local FungusPop
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = "phx/eggcrack.wav",
		level = SNDLVL_40DB,
		pitch = {
			85,
			115
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
		__name = "FungusPop",
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
	FungusPop = _class_0
end
local LFR_FungalSpores
do
	local _class_0
	local _parent_0 = FX
	local _base_0 = {
		Init = function(self, data)
			local pos, speed, ang, scale
			do
				pos = data:GetOrigin()
				speed = data:GetStart()
				ang = data:GetNormal()
				scale = data:GetScale()
			end
			for i = 1, 3 do
				local chance = math.Round(math.Rand(1, 3))
				local particle_mat = "decals/bloodyflesh/blood" .. tostring(math.random(1, 4))
				if GAMEMODE.Emitter2D then
					local particle = GAMEMODE.Emitter2D:Add(particle_mat, pos)
					local vel = ((ang * 2) * i) * 1
					vel = vel + Vector(math.random(-4, -14), math.random(-4, 4), math.random(-4, 4))
					do
						particle:SetVelocity(vel)
						particle:SetDieTime(math.Rand(1, 4))
						particle:SetEndAlpha(0)
						particle:SetDieTime(math.Rand(1, 4))
						particle:SetEndAlpha(0)
						particle:SetStartSize(1 * scale)
						particle:SetEndSize(math.random(2, 4) * scale)
						particle:SetRoll(math.Rand(-10, 10))
						particle:SetRollDelta(math.Rand(-0.2, 0.2))
						local color_num = math.Rand(20, 75)
						particle:SetColor(color_num, color_num, color_num)
						particle:SetStartAlpha(color_num)
						particle:SetGravity(Vector(0, 0, math.random(60, 120)))
						particle:SetCollide(true)
						particle:SetAirResistance(300)
						particle:SetBounce(2)
					end
				end
			end
		end,
		Render = function(self) end,
		Think = function(self)
			return false
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
		__name = "LFR_FungalSpores",
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
	LFR_FungalSpores = _class_0
end
local Fungus
do
	local _class_0
	local _parent_0 = ENTITY
	local _base_0 = {
		Type = "anim",
		Base = "base_gmodentity",
		PrintName = "Fungus",
		Category = "EvilRP: Fungus",
		Spawnable = true,
		AdminSpawnable = true,
		model = Model("models/weapons/w_bugbait.mdl"),
		radius = 100,
		damage = 30,
		exploded = false,
		Initialize = function(self)
			if CLIENT then
				self:SetRenderMode(RENDERMODE_TRANSALPHA)
				self.RenderGroup = RENDERGROUP_TRANSLUCENT
			elseif SERVER then
				do
					local _obj_0 = fungus_all
					_obj_0[#_obj_0 + 1] = self
				end
				local ct = CurTime()
				self.death_time = (ct + math.Rand(fungus_lifespan.min, fungus_lifespan.max))
				self.next_spawn_time = (ct + math.Rand(fungus_breed_delay.min, fungus_breed_delay.max))
				self:SetModel(self.model)
				self:PhysicsInitSphere(3)
				self:SetMoveType(MOVETYPE_VPHYSICS)
				self:SetSolid(SOLID_VPHYSICS)
				self:SetRenderMode(RENDERMODE_TRANSALPHA)
				self.RenderGroup = RENDERGROUP_TRANSLUCENT
				self:SetColor(Color(0, 0, 0, 230))
				fungus_currentpop = fungus_currentpop + 1
				for i = 1, 3 do
					util.PrecacheSound("weapons/bugbait/bugbait_squeeze" .. tostring(i) .. ".wav")
				end
			end
		end,
		OnTakeDamage = function(self, dmg)
			local attacker = dmg:GetAttacker()
			if not attacker:GetClass():find("fungus") then
				return self:FungusAction()
			end
		end,
		Touch = function(self, activator)
			if IsValid(activator) and not activator:GetClass():find("fungus") then
				return self:FungusAction(activator)
			end
		end,
		OnFungusThink = function(self)
			local ct = CurTime()
			if ct >= self.death_time then
				self:FungusDeath()
			elseif ct >= self.next_spawn_time then
				self:FungusBreed()
			end
			return true
		end,
		OnRemove = function(self)
			fungus_currentpop = fungus_currentpop - 1
		end,
		FungusAction = function(self, activator)
			if not self.exploded then
				local puff = ents.Create("env_smoketrail")
				local kvs = {
					startsize = "10",
					endsize = "20",
					minspeed = "1",
					maxspeed = "2",
					startcolor = "40 40 40",
					endcolor = "0 40 0",
					opacity = ".8",
					spawnrate = "5",
					lifetime = "1"
				}
				for k, v in pairs(kvs) do
					puff:SetKeyValue(k, v)
				end
				puff:SetPos(self:GetPos())
				puff:Spawn()
				puff:Fire("kill", "", 0.7)
				local pos = self:GetPos()
				if activator and IsValid(activator) and activator:IsPlayer() then
					activator:AddDespair(math.random(2, 4))
				end
				self:EmitSound("FungusPop")
				local edata = EffectData()
				edata:SetOrigin(pos)
				edata:SetScale(2)
				edata:SetNormal(self:GetUp())
				util.Effect("LFR_FungalSpores", edata)
			end
			self.exploded = true
			return self:Remove()
		end,
		FungusDeath = function(self)
			local puff = ents.Create("env_smoketrail")
			local kvs = {
				startsize = "10",
				endsize = "20",
				minspeed = "1",
				maxspeed = "2",
				startcolor = "40 40 40",
				endcolor = "0 40 0",
				opacity = ".8",
				spawnrate = "5",
				lifetime = "1"
			}
			for k, v in pairs(kvs) do
				puff:SetKeyValue(k, v)
			end
			puff:SetPos(self:GetPos())
			puff:Spawn()
			puff:Fire("kill", "", 0.7)
			return self:Remove()
		end,
		FungusBreed = function(self)
			local breed_success = false
			local ct = CurTime()
			if fungus_currentpop >= fungus_max then
				return
			end
			local trace_pos = self:GetPos() + (self:GetForward() * 16)
			local x, y, z
			do
				x = trace_pos.x + math.Rand(-fungus_breed_distance.min, fungus_breed_distance.max)
				y = trace_pos.y + math.Rand(-fungus_breed_distance.min, fungus_breed_distance.max)
				z = trace_pos.z + math.Rand(-fungus_breed_distance.min, fungus_breed_distance.max)
			end
			local trace = {
				start = trace_pos,
				endpos = Vector(x, y, z)
			}
			local tr = util.TraceLine(trace)
			if tr.Hit and not tr.HitSky then
				if tr.HitNonWorld then
					local hitentity = tr.Entity:GetClass()
					if hitentity == "player" then
						return
					end
					if hitentity:find("fungus") then
						return
					end
					if hitentity:find("npc") then
						return
					end
				end
				local dist = self:GetPos():Distance(tr.HitPos)
				if dist >= fungus_breed_distance.min and dist <= fungus_breed_distance.max then
					local spawn_pos = tr.HitPos + tr.HitNormal * 2
					local spawn_angle = tr.HitNormal:Angle()
					local ent = ents.Create(self:GetClass())
					ent:SetPos(spawn_pos)
					ent:SetAngles(spawn_angle)
					ent:Spawn()
					ent:Activate()
					ent:Initialize()
					ent:SetOwner(tr.Entity)
					ent:EmitSound("FungusBreed")
					if tr.Entity:IsWorld() then
						ent:GetPhysicsObject():EnableMotion(false)
					else
						local weld = constraint.Weld(ent, tr.Entity, 0, tr.PhysicsBone, 0)
					end
					breed_success = true
				end
			end
			if breed_success then
				local min, max = fungus_breed_delay.min, fungus_breed_delay.max
				self.next_spawn_time = (ct + math.Rand(min, max))
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
		__name = "Fungus",
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
	Fungus = _class_0
	return _class_0
end
