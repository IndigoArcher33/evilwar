-- [yue]: darkrp_modules\mining\sh_boulder.yue
local random = math.random -- 1
local Boulder -- 3
do -- 3
	local _class_0 -- 3
	local _parent_0 = ENTITY -- 3
	local _base_0 = { -- 3
		Base = "base_anim", -- 5
		Type = "anim", -- 6
		Spawnable = true, -- 7
		AdminSpawnable = true, -- 9
		Pocketable = false, -- 11
		LootTable = { -- 12
			"metal/scrap", -- 12
			"metal/slag" -- 13
		}, -- 15
		SetupDataTables = function(self) -- 15
			return self:NetworkVar("Int", 0, "Integrity") -- 16
		end, -- 18
		Initialize = function(self) -- 18
			self.MaxIntegrity = 200 -- 19
			if CLIENT then -- 20
				return -- 20
			end -- 20
			local mdls = { -- 21
				"models/props_wasteland/rockgranite03a.mdl", -- 21
				"models/props_wasteland/rockgranite03b.mdl", -- 22
				"models/props_wasteland/rockgranite03c.mdl" -- 23
			} -- 21
			local mdl = mdls[math.random(#mdls)] -- 24
			self:SetModel(mdl) -- 25
			self:PhysicsInit(SOLID_VPHYSICS) -- 26
			self:SetIntegrity(self.MaxIntegrity) -- 27
			local phys = self:GetPhysicsObject() -- 28
			if phys and IsValid(phys) then -- 29
				phys:Wake() -- 29
			end -- 29
			return phys -- 28
		end, -- 31
		OnTakeDamage = function(self, dmg) -- 31
			self:TakePhysicsDamage(dmg) -- 32
			local dtype = dmg:GetDamageType() -- 33
			if not ((dtype == DMG_CLUB) or (dtype == DMG_BLAST)) then -- 34
				return -- 34
			end -- 34
			local dmg_int = dmg:GetDamage() -- 35
			local inflictor = dmg:GetInflictor() -- 36
			if inflictor.MineBonus then -- 37
				dmg_int = dmg_int * inflictor.MineBonus -- 37
			end -- 37
			local pos = dmg:GetDamagePosition() -- 38
			do -- 39
				local edata = EffectData() -- 39
				edata:SetOrigin(pos) -- 40
				edata:SetScale(1) -- 41
				edata:SetMagnitude(0.5) -- 42
				edata:SetRadius(2) -- 43
				util.Effect("Sparks", edata) -- 44
			end -- 39
			self:SetIntegrity(self:GetIntegrity() - dmg_int) -- 46
			self.NextSound = self.NextSound or CurTime() -- 47
			if CurTime() >= self.NextSound then -- 48
				self.NextSound = CurTime() + 0.1 -- 49
				self:EmitSound("physics/concrete/boulder_impact_hard" .. tostring(math.random(1, 4)) .. ".wav") -- 50
				self:EmitSound("weapons/crowbar/crowbar_impact" .. tostring(math.random(1, 2)) .. ".wav", 90, math.random(80, 110)) -- 51
			end -- 48
			if (self:GetIntegrity() <= 0) and not self.Breaking then -- 54
				self.Breaking = true -- 55
				do -- 56
					local edata = EffectData() -- 56
					edata:SetOrigin(pos) -- 57
					edata:SetScale(1) -- 58
					edata:SetMagnitude(0.5) -- 59
					edata:SetRadius(2) -- 60
					util.Effect("Sparks", edata) -- 61
				end -- 56
				local who = dmg:GetAttacker() -- 62
				if (who and IsValid(who) and who:IsPlayer() and who:Alive()) then -- 63
					local reward = 24 + math.random(19) -- 64
					who:AddMoney(reward, "The Toil") -- 65
				end -- 63
				for i = 1, math.random(1, 3) do -- 66
					local cls = self.LootTable[random(1, #self.LootTable)] -- 67
					local loot = ents.Create(cls) -- 68
					loot:Spawn() -- 70
					loot:Activate() -- 71
					loot:SetPos(pos) -- 72
				end -- 72
				return self:Remove() -- 73
			end -- 54
		end, -- 75
		PhysicsCollide = function(self, data, physobj) -- 75
			if data.Speed >= 512 then -- 76
				local ed = EffectData() -- 77
				ed:SetOrigin(self:GetPos()) -- 79
				ed:SetScale(1000) -- 80
				util.Effect("ThumperDust", ed, true, true) -- 81
				return self:EmitSound("physics/concrete/boulder_impact_hard" .. tostring(math.random(1, 4)) .. ".wav") -- 82
			end -- 76
		end -- 3
	} -- 3
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 82
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 3
			_base_0[_key_0] = _val_0 -- 3
		end -- 3
	end -- 82
	if _base_0.__index == nil then -- 3
		_base_0.__index = _base_0 -- 3
	end -- 82
	setmetatable(_base_0, _parent_0.__base) -- 3
	_class_0 = setmetatable({ -- 3
		__init = function(self, ...) -- 3
			return _class_0.__parent.__init(self, ...) -- 3
		end, -- 3
		__base = _base_0, -- 3
		__name = "Boulder", -- 3
		__parent = _parent_0 -- 3
	}, { -- 3
		__index = function(cls, name) -- 3
			local val = rawget(_base_0, name) -- 3
			if val == nil then -- 3
				local parent = rawget(cls, "__parent") -- 3
				if parent then -- 3
					return parent[name] -- 3
				end -- 3
			else -- 3
				return val -- 3
			end -- 3
		end, -- 3
		__call = function(cls, ...) -- 3
			local _self_0 = setmetatable({ }, _base_0) -- 3
			cls.__init(_self_0, ...) -- 3
			return _self_0 -- 3
		end -- 3
	}) -- 3
	_base_0.__class = _class_0 -- 3
	if _parent_0.__inherited then -- 3
		_parent_0.__inherited(_parent_0, _class_0) -- 3
	end -- 3
	Boulder = _class_0 -- 3
end -- 82
local Scrap -- 84
do -- 84
	local _class_0 -- 84
	local _parent_0 = ENTITY -- 84
	local _base_0 = { -- 84
		Base = "base_anim", -- 86
		Type = "anim", -- 87
		Spawnable = true, -- 88
		AdminSpawnable = true, -- 90
		PrintName = "Scrap", -- 91
		Pocketable = false, -- 92
		LootTable = { -- 93
			"metal/scrap" -- 93
		}, -- 95
		SetupDataTables = function(self) -- 95
			return self:NetworkVar("Int", 0, "Integrity") -- 96
		end, -- 98
		Initialize = function(self) -- 98
			self.MaxIntegrity = 500 -- 99
			if CLIENT then -- 100
				return -- 100
			end -- 100
			local mdls = { -- 101
				"models/gibs/helicopter_brokenpiece_01.mdl", -- 101
				"models/gibs/helicopter_brokenpiece_03.mdl", -- 102
				"models/container_chunk03.mdl", -- 103
				"models/props_combine/combine_explosivepanel_cover02a.mdl" -- 104
			} -- 101
			local mdl = mdls[math.random(#mdls)] -- 105
			self:SetModel(mdl) -- 106
			self:PhysicsInit(SOLID_VPHYSICS) -- 107
			self:SetIntegrity(self.MaxIntegrity) -- 108
			local phys = self:GetPhysicsObject() -- 109
			if phys and IsValid(phys) then -- 110
				phys:Wake() -- 110
			end -- 110
			return phys -- 109
		end, -- 112
		Jump = function(self) -- 112
			local rollx = math.random(-50, 50) -- 113
			local rolly = math.random(-50, 50) -- 114
			local phys = self:GetPhysicsObject() -- 115
			if phys and IsValid(phys) then -- 116
				phys:ApplyForceCenter(Vector(rollx * phys:GetMass(), rolly * phys:GetMass(), 400 * phys:GetMass())) -- 116
			end -- 116
			return phys -- 115
		end, -- 118
		OnTakeDamage = function(self, dmg) -- 118
			self:TakePhysicsDamage(dmg) -- 119
			local dtype = dmg:GetDamageType() -- 120
			if not ((dtype == DMG_CLUB) or (dtype == DMG_BLAST)) then -- 121
				return -- 121
			end -- 121
			local dmg_int = dmg:GetDamage() -- 122
			local inflictor = dmg:GetInflictor() -- 123
			if inflictor.MineBonus then -- 124
				dmg_int = dmg_int * inflictor.MineBonus -- 124
			end -- 124
			local pos = dmg:GetDamagePosition() -- 125
			do -- 126
				local edata = EffectData() -- 126
				edata:SetOrigin(pos) -- 127
				edata:SetScale(1) -- 128
				edata:SetMagnitude(0.5) -- 129
				edata:SetRadius(2) -- 130
				util.Effect("Sparks", edata) -- 131
			end -- 126
			local roll = math.random(1, 3) -- 133
			if roll <= 2 then -- 134
				self:Jump() -- 135
			end -- 134
			self:SetIntegrity(self:GetIntegrity() - dmg_int) -- 137
			self.NextSound = self.NextSound or CurTime() -- 138
			if CurTime() >= self.NextSound then -- 139
				self.NextSound = CurTime() + 0.1 -- 140
				self:EmitSound("physics/concrete/boulder_impact_hard" .. tostring(math.random(1, 4)) .. ".wav") -- 141
				self:EmitSound("weapons/crowbar/crowbar_impact" .. tostring(math.random(1, 2)) .. ".wav", 90, math.random(80, 110)) -- 142
			end -- 139
			if (self:GetIntegrity() <= 0) and not self.Breaking then -- 145
				self.Breaking = true -- 146
				do -- 147
					local edata = EffectData() -- 147
					edata:SetOrigin(pos) -- 148
					edata:SetScale(1) -- 149
					edata:SetMagnitude(0.5) -- 150
					edata:SetRadius(2) -- 151
					util.Effect("Sparks", edata) -- 152
				end -- 147
				local who = dmg:GetAttacker() -- 153
				if (who and IsValid(who) and who:IsPlayer() and who:Alive()) then -- 154
					local reward = 24 + math.random(19) -- 155
					who:AddMoney(reward, "The Toil") -- 156
				end -- 154
				for i = 1, math.random(2, 5) do -- 157
					local cls = self.LootTable[random(1, #self.LootTable)] -- 158
					local loot = ents.Create(cls) -- 159
					loot:Spawn() -- 161
					loot:Activate() -- 162
					loot:SetPos(pos) -- 163
				end -- 163
				return self:Remove() -- 164
			end -- 145
		end, -- 166
		PhysicsCollide = function(self, data, physobj) -- 166
			if data.Speed >= 512 then -- 167
				local ed = EffectData() -- 168
				ed:SetOrigin(self:GetPos()) -- 170
				ed:SetScale(1000) -- 171
				util.Effect("ThumperDust", ed, true, true) -- 172
				self:EmitSound("physics/concrete/boulder_impact_hard" .. tostring(math.random(1, 4)) .. ".wav") -- 173
			end -- 167
			if data.HitEntity and data.HitEntity:IsPlayer() and data.HitEntity:Alive() then -- 175
				local ply = data.HitEntity -- 176
				local dmg = DamageInfo() -- 177
				dmg:SetDamage(30) -- 179
				dmg:SetDamageType(DMG_CRUSH) -- 180
				dmg:SetAttacker(self) -- 181
				dmg:SetInflictor(self) -- 182
				self:EmitSound("npc/barnacle/barnacle_bark" .. tostring(math.random(1, 2)) .. ".wav") -- 183
				self:EmitSound("phx/eggcrack.wav") -- 184
				self:EmitSound("physics/flesh/flesh_squishy_impact_hard" .. tostring(math.random(2, 4)) .. ".wav") -- 185
				return ply:TakeDamageInfo(dmg) -- 186
			end -- 175
		end -- 84
	} -- 84
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 187
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 84
			_base_0[_key_0] = _val_0 -- 84
		end -- 84
	end -- 187
	if _base_0.__index == nil then -- 84
		_base_0.__index = _base_0 -- 84
	end -- 187
	setmetatable(_base_0, _parent_0.__base) -- 84
	_class_0 = setmetatable({ -- 84
		__init = function(self, ...) -- 84
			return _class_0.__parent.__init(self, ...) -- 84
		end, -- 84
		__base = _base_0, -- 84
		__name = "Scrap", -- 84
		__parent = _parent_0 -- 84
	}, { -- 84
		__index = function(cls, name) -- 84
			local val = rawget(_base_0, name) -- 84
			if val == nil then -- 84
				local parent = rawget(cls, "__parent") -- 84
				if parent then -- 84
					return parent[name] -- 84
				end -- 84
			else -- 84
				return val -- 84
			end -- 84
		end, -- 84
		__call = function(cls, ...) -- 84
			local _self_0 = setmetatable({ }, _base_0) -- 84
			cls.__init(_self_0, ...) -- 84
			return _self_0 -- 84
		end -- 84
	}) -- 84
	_base_0.__class = _class_0 -- 84
	if _parent_0.__inherited then -- 84
		_parent_0.__inherited(_parent_0, _class_0) -- 84
	end -- 84
	Scrap = _class_0 -- 84
	return _class_0 -- 187
end -- 187
