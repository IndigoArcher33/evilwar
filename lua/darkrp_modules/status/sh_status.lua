-- [yue]: darkrp_modules\status\sh_status.yue
local meta = FindMetaTable("Player") -- 5
for k, v in pairs({ -- 7
	ClearStatuses = function(self, silent, instant) -- 7
		if instant then -- 8
			local _list_0 = ents.FindByClass("status/*") -- 9
			for _index_0 = 1, #_list_0 do -- 9
				local ent = _list_0[_index_0] -- 9
				if not ent.NoRemoveOnDeath and ent:GetOwner() == self then -- 10
					ent:Remove() -- 10
				end -- 10
			end -- 10
		else -- 12
			local _list_0 = ents.FindByClass("status/*") -- 12
			for _index_0 = 1, #_list_0 do -- 12
				local ent = _list_0[_index_0] -- 12
				if not ent.NoRemoveOnDeath and ent:GetOwner() == self then -- 13
					ent.silent_remove = silent -- 14
					ent:SetDie() -- 15
				end -- 13
			end -- 15
		end -- 8
	end, -- 7
	RemoveStatus = function(self, status, silent, instant, exclude) -- 16
		local removed -- 17
		local _list_0 = ents.FindByClass("status/" .. tostring(status)) -- 18
		for _index_0 = 1, #_list_0 do -- 18
			local ent = _list_0[_index_0] -- 18
			if ent:GetOwner() == self and not (exclude and ent:GetClass() == "status/" .. tostring(exclude)) then -- 19
				if instant then -- 20
					ent:Remove() -- 21
				else -- 23
					ent.silent_remove = silent -- 23
					ent:SetDie() -- 24
				end -- 20
				removed = true -- 25
			end -- 19
		end -- 25
		return removed -- 26
	end, -- 16
	GetStatus = function(self, status) -- 27
		local ent = self["status/" .. tostring(status)] -- 28
		if ent and IsValid(ent) and ent:GetOwner() == self then -- 29
			return ent -- 29
		end -- 29
	end, -- 27
	GiveStatus = function(self, status, dietime) -- 30
		local cur = self:GetStatus(status) -- 31
		if cur then -- 32
			if dietime then -- 33
				cur:SetDie(dietime) -- 33
			end -- 33
			cur:SetPlayer(self, true) -- 34
			return cur -- 35
		else -- 37
			local ent = ents.Create("status/" .. tostring(status)) -- 37
			if IsValid(ent) then -- 38
				ent:Spawn() -- 39
				if dietime then -- 40
					ent:SetDie(dietime) -- 40
				end -- 40
				ent:SetPlayer(self) -- 41
				return ent -- 42
			end -- 38
		end -- 32
	end -- 30
}) do -- 43
	meta[k] = v -- 6
end -- 6
do -- 45
	local _class_0 -- 45
	local _parent_0 = ENTITY -- 45
	local _base_0 = { -- 45
		Type = "anim", -- 48
		OnInitialize = function(self) end, -- 50
		PhysicsCollide = function(self, data, physobj) end, -- 52
		StartTouch = function(self, ent) end, -- 54
		Touch = function(self, ent) end, -- 56
		EndTouch = function(self, ent) end, -- 58
		AcceptInput = function(self, name, activator, caller) end, -- 60
		GetPlayer = function(self, ...) -- 60
			return self:GetParent(...) -- 60
		end, -- 62
		Initialize = function(self) -- 62
			self:DrawShadow(false) -- 63
			if SERVER then -- 64
				self.DieTime = self.DieTime or 0 -- 65
			end -- 64
			if CLIENT then -- 66
				self:SetRenderBounds(Vector(-40, -40, -18), Vector(40, 40, 80)) -- 67
				local owner = self:GetOwner() -- 68
				if IsValid(owner) then -- 69
					owner[self:GetClass()] = self -- 69
				end -- 69
			end -- 66
			return self:OnInitialize() -- 70
		end, -- 72
		SetPlayer = function(self, ply, exists) -- 72
			if exists then -- 73
				return self:PlayerSet(ply, exists) -- 74
			else -- 76
				local valid = ply and IsValid(ply) -- 76
				if valid then -- 77
					self:SetPos(ply:GetPos() + Vector(0, 0, 16)) -- 77
				end -- 77
				self:SetOwner(ply) -- 78
				ply[self:GetClass()] = self -- 79
				self:SetOwner(ply) -- 80
				self:SetParent(ply) -- 81
				if valid then -- 82
					return self:PlayerSet(ply) -- 82
				end -- 82
			end -- 73
		end, -- 84
		PlayerSet = function(self, ply, exists) end, -- 86
		Think = function(self) -- 86
			if SERVER then -- 87
				if self.DieTime <= CurTime() then -- 88
					self:Remove() -- 88
				end -- 88
			end -- 87
			if CLIENT then -- 89
				local owner = self:GetOwner() -- 90
				if IsValid(owner) then -- 91
					return self:SetPos(owner:EyePos()) -- 91
				end -- 91
			end -- 89
		end, -- 93
		KeyValue = function(self, key, value) -- 93
			if key == "dietime" then -- 94
				self:SetDie(tonumber(value)) -- 95
				return true -- 96
			end -- 94
		end, -- 98
		PhysicsCollide = function(self, data, physobj) end, -- 100
		OnRemove = function(self) -- 100
			if CLIENT then -- 101
				local owner = self:GetOwner() -- 102
				if IsValid(owner) and owner[self:GetClass()] == self then -- 103
					owner[self:GetClass()] = nil -- 103
				end -- 103
			end -- 101
		end, -- 105
		SetDie = function(self, time) -- 105
			if time == 0 or not time then -- 106
				self.DieTime = 0 -- 107
			elseif time == -1 then -- 108
				return self.DieTime == 10 -- 109
			else -- 111
				self.DieTime = CurTime() + time -- 111
			end -- 106
		end, -- 113
		Draw = function(self) end -- 45
	} -- 45
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 113
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 45
			_base_0[_key_0] = _val_0 -- 45
		end -- 45
	end -- 113
	if _base_0.__index == nil then -- 45
		_base_0.__index = _base_0 -- 45
	end -- 113
	setmetatable(_base_0, _parent_0.__base) -- 45
	_class_0 = setmetatable({ -- 45
		__init = function(self, ...) -- 45
			return _class_0.__parent.__init(self, ...) -- 45
		end, -- 45
		__base = _base_0, -- 45
		__name = "STATUS", -- 45
		__parent = _parent_0 -- 45
	}, { -- 45
		__index = function(cls, name) -- 45
			local val = rawget(_base_0, name) -- 45
			if val == nil then -- 45
				local parent = rawget(cls, "__parent") -- 45
				if parent then -- 45
					return parent[name] -- 45
				end -- 45
			else -- 45
				return val -- 45
			end -- 45
		end, -- 45
		__call = function(cls, ...) -- 45
			local _self_0 = setmetatable({ }, _base_0) -- 45
			cls.__init(_self_0, ...) -- 45
			return _self_0 -- 45
		end -- 45
	}) -- 45
	_base_0.__class = _class_0 -- 45
	if _parent_0.__inherited then -- 45
		_parent_0.__inherited(_parent_0, _class_0) -- 45
	end -- 45
	STATUS = _class_0 -- 45
end -- 113
local Bleed -- 115
do -- 115
	local _class_0 -- 115
	local _parent_0 = STATUS -- 115
	local _base_0 = { -- 115
		SetupDataTables = function(self) -- 116
			return self:NetworkVar("Float", "Damage") -- 117
		end, -- 119
		AddDamage = function(self, damage) -- 119
			return self:SetDamage(self:GetDamage() + damage) -- 120
		end, -- 122
		Think = function(self) -- 122
			if SERVER then -- 123
				local owner = self:GetOwner() -- 124
				if self:GetDamage() <= 0 or not (owner:IsPlayer() and owner:Alive()) then -- 125
					self:Remove() -- 126
					return -- 127
				end -- 125
				self.next_bleed_tick = self.next_bleed_tick or CurTime() -- 128
				self.next_stop_bleeding_tick = self.next_stop_bleeding_tick or CurTime() -- 129
				if self.next_bleed_tick <= CurTime() then -- 130
					local dmg = math.min(self:GetDamage(), math.random(1, 3)) -- 131
					local damager -- 132
					if self.Damager and IsValid(self.Damager) then -- 132
						damager = self.Damager -- 132
					end -- 132
					local dmginfo = DamageInfo() -- 133
					dmginfo:SetDamageType(DMG_GENERIC) -- 135
					dmginfo:SetDamagePosition(self:GetPos()) -- 136
					if damager and IsValid(damager) then -- 137
						dmginfo:SetAttacker(damager) -- 137
					end -- 137
					dmginfo:SetInflictor(self) -- 138
					dmginfo:SetDamage(dmg) -- 139
					owner.dont_scream = true -- 140
					owner:TakeDamageInfo(dmginfo) -- 141
					self:AddDamage(-dmg) -- 142
					local dir = VectorRand() -- 143
					dir:Normalize() -- 144
					util.Blood(owner:WorldSpaceCenter(), 6, dir, 64) -- 145
					self.next_bleed_tick = CurTime() + 3 -- 146
				end -- 130
				if self.next_stop_bleeding_tick <= CurTime() then -- 147
					local notmoving = (owner:GetVelocity():Length() <= 32) -- 148
					if notmoving then -- 149
						self:AddDamage(-2) -- 149
					end -- 149
					self.next_stop_bleeding_tick = CurTime() + 1 -- 150
				end -- 147
			end -- 123
		end -- 115
	} -- 115
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 150
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 115
			_base_0[_key_0] = _val_0 -- 115
		end -- 115
	end -- 150
	if _base_0.__index == nil then -- 115
		_base_0.__index = _base_0 -- 115
	end -- 150
	setmetatable(_base_0, _parent_0.__base) -- 115
	_class_0 = setmetatable({ -- 115
		__init = function(self, ...) -- 115
			return _class_0.__parent.__init(self, ...) -- 115
		end, -- 115
		__base = _base_0, -- 115
		__name = "Bleed", -- 115
		__parent = _parent_0 -- 115
	}, { -- 115
		__index = function(cls, name) -- 115
			local val = rawget(_base_0, name) -- 115
			if val == nil then -- 115
				local parent = rawget(cls, "__parent") -- 115
				if parent then -- 115
					return parent[name] -- 115
				end -- 115
			else -- 115
				return val -- 115
			end -- 115
		end, -- 115
		__call = function(cls, ...) -- 115
			local _self_0 = setmetatable({ }, _base_0) -- 115
			cls.__init(_self_0, ...) -- 115
			return _self_0 -- 115
		end -- 115
	}) -- 115
	_base_0.__class = _class_0 -- 115
	if _parent_0.__inherited then -- 115
		_parent_0.__inherited(_parent_0, _class_0) -- 115
	end -- 115
	Bleed = _class_0 -- 115
	return _class_0 -- 150
end -- 150
