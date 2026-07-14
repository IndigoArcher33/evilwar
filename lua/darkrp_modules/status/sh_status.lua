local meta = FindMetaTable("Player")
for k, v in pairs({
	ClearStatuses = function(self, silent, instant)
		if instant then
			local _list_0 = ents.FindByClass("status/*")
			for _index_0 = 1, #_list_0 do
				local ent = _list_0[_index_0]
				if not ent.NoRemoveOnDeath and ent:GetOwner() == self then
					ent:Remove()
				end
			end
		else
			local _list_0 = ents.FindByClass("status/*")
			for _index_0 = 1, #_list_0 do
				local ent = _list_0[_index_0]
				if not ent.NoRemoveOnDeath and ent:GetOwner() == self then
					ent.silent_remove = silent
					ent:SetDie()
				end
			end
		end
	end,
	RemoveStatus = function(self, status, silent, instant, exclude)
		local removed
		local _list_0 = ents.FindByClass("status/" .. tostring(status))
		for _index_0 = 1, #_list_0 do
			local ent = _list_0[_index_0]
			if ent:GetOwner() == self and not (exclude and ent:GetClass() == "status/" .. tostring(exclude)) then
				if instant then
					ent:Remove()
				else
					ent.silent_remove = silent
					ent:SetDie()
				end
				removed = true
			end
		end
		return removed
	end,
	GetStatus = function(self, status)
		local ent = self["status/" .. tostring(status)]
		if ent and IsValid(ent) and ent:GetOwner() == self then
			return ent
		end
	end,
	GiveStatus = function(self, status, dietime)
		local cur = self:GetStatus(status)
		if cur then
			if dietime then
				cur:SetDie(dietime)
			end
			cur:SetPlayer(self, true)
			return cur
		else
			local ent = ents.Create("status/" .. tostring(status))
			if IsValid(ent) then
				ent:Spawn()
				if dietime then
					ent:SetDie(dietime)
				end
				ent:SetPlayer(self)
				return ent
			end
		end
	end
}) do
	meta[k] = v
end
do
	local _class_0
	local _parent_0 = ENTITY
	local _base_0 = {
		Type = "anim",
		OnInitialize = function(self) end,
		PhysicsCollide = function(self, data, physobj) end,
		StartTouch = function(self, ent) end,
		Touch = function(self, ent) end,
		EndTouch = function(self, ent) end,
		AcceptInput = function(self, name, activator, caller) end,
		GetPlayer = function(self, ...)
			return self:GetParent(...)
		end,
		Initialize = function(self)
			self:DrawShadow(false)
			if SERVER then
				self.DieTime = self.DieTime or 0
			end
			if CLIENT then
				self:SetRenderBounds(Vector(-40, -40, -18), Vector(40, 40, 80))
				local owner = self:GetOwner()
				if IsValid(owner) then
					owner[self:GetClass()] = self
				end
			end
			return self:OnInitialize()
		end,
		SetPlayer = function(self, ply, exists)
			if exists then
				return self:PlayerSet(ply, exists)
			else
				local valid = ply and IsValid(ply)
				if valid then
					self:SetPos(ply:GetPos() + Vector(0, 0, 16))
				end
				self:SetOwner(ply)
				ply[self:GetClass()] = self
				self:SetOwner(ply)
				self:SetParent(ply)
				if valid then
					return self:PlayerSet(ply)
				end
			end
		end,
		PlayerSet = function(self, ply, exists) end,
		Think = function(self)
			if SERVER then
				if self.DieTime <= CurTime() then
					self:Remove()
				end
			end
			if CLIENT then
				local owner = self:GetOwner()
				if IsValid(owner) then
					return self:SetPos(owner:EyePos())
				end
			end
		end,
		KeyValue = function(self, key, value)
			if key == "dietime" then
				self:SetDie(tonumber(value))
				return true
			end
		end,
		PhysicsCollide = function(self, data, physobj) end,
		OnRemove = function(self)
			if CLIENT then
				local owner = self:GetOwner()
				if IsValid(owner) and owner[self:GetClass()] == self then
					owner[self:GetClass()] = nil
				end
			end
		end,
		SetDie = function(self, time)
			if time == 0 or not time then
				self.DieTime = 0
			elseif time == -1 then
				return self.DieTime == 10
			else
				self.DieTime = CurTime() + time
			end
		end,
		Draw = function(self) end
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
		__name = "STATUS",
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
	STATUS = _class_0
end
local Bleed
do
	local _class_0
	local _parent_0 = STATUS
	local _base_0 = {
		SetupDataTables = function(self)
			return self:NetworkVar("Float", "Damage")
		end,
		AddDamage = function(self, damage)
			return self:SetDamage(self:GetDamage() + damage)
		end,
		Think = function(self)
			if SERVER then
				local owner = self:GetOwner()
				if self:GetDamage() <= 0 or not (owner:IsPlayer() and owner:Alive()) then
					self:Remove()
					return
				end
				self.next_bleed_tick = self.next_bleed_tick or CurTime()
				self.next_stop_bleeding_tick = self.next_stop_bleeding_tick or CurTime()
				if self.next_bleed_tick <= CurTime() then
					local dmg = math.min(self:GetDamage(), math.random(1, 3))
					local damager
					if self.Damager and IsValid(self.Damager) then
						damager = self.Damager
					end
					local dmginfo = DamageInfo()
					dmginfo:SetDamageType(DMG_GENERIC)
					dmginfo:SetDamagePosition(self:GetPos())
					if damager and IsValid(damager) then
						dmginfo:SetAttacker(damager)
					end
					dmginfo:SetInflictor(self)
					dmginfo:SetDamage(dmg)
					owner.dont_scream = true
					owner:TakeDamageInfo(dmginfo)
					self:AddDamage(-dmg)
					local dir = VectorRand()
					dir:Normalize()
					util.Blood(owner:WorldSpaceCenter(), 6, dir, 64)
					self.next_bleed_tick = CurTime() + 3
				end
				if self.next_stop_bleeding_tick <= CurTime() then
					local notmoving = (owner:GetVelocity():Length() <= 32)
					if notmoving then
						self:AddDamage(-2)
					end
					self.next_stop_bleeding_tick = CurTime() + 1
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
		__name = "Bleed",
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
	Bleed = _class_0
	return _class_0
end
