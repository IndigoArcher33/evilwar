-- [yue]: darkrp_modules\flesh\sh_fleshcapsule.yue
local random = math.random -- 1
local Submit_Flesh -- 3
do -- 3
	local _class_0 -- 3
	local _parent_0 = SOUND -- 3
	local _base_0 = { -- 3
		sound = (function() -- 4
			local _accum_0 = { } -- 4
			local _len_0 = 1 -- 4
			for i = 1, 4 do -- 4
				_accum_0[_len_0] = "placenta/head_explodie_0" .. tostring(i) .. ".ogg" -- 4
				_len_0 = _len_0 + 1 -- 4
			end -- 4
			return _accum_0 -- 4
		end)(), -- 5
		pitch = { -- 5
			80, -- 5
			90 -- 5
		} -- 3
	} -- 3
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 5
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 3
			_base_0[_key_0] = _val_0 -- 3
		end -- 3
	end -- 5
	if _base_0.__index == nil then -- 3
		_base_0.__index = _base_0 -- 3
	end -- 5
	setmetatable(_base_0, _parent_0.__base) -- 3
	_class_0 = setmetatable({ -- 3
		__init = function(self, ...) -- 3
			return _class_0.__parent.__init(self, ...) -- 3
		end, -- 3
		__base = _base_0, -- 3
		__name = "Submit_Flesh", -- 3
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
	Submit_Flesh = _class_0 -- 3
end -- 5
local gibs = { -- 7
	"models/gibs/humans/mgib_01.mdl", -- 7
	"models/gibs/humans/mgib_02.mdl", -- 8
	"models/gibs/humans/mgib_03.mdl", -- 9
	"models/gibs/humans/mgib_04.mdl", -- 10
	"models/gibs/humans/mgib_05.mdl", -- 11
	"models/gibs/humans/mgib_06.mdl", -- 12
	"models/gibs/humans/mgib_07.mdl" -- 13
} -- 7
local Fleshcapsule -- 15
do -- 15
	local _class_0 -- 15
	local _parent_0 = ENTITY -- 15
	local _base_0 = { -- 15
		PrintName = "Flesh Capsule", -- 17
		Description = "Filled with disgusting, recyclable biomass.\nYou could also process it into biofuel at a Refinery.", -- 18
		Interesting = true, -- 20
		Base = "base_anim", -- 21
		Type = "anim", -- 22
		Spawnable = true, -- 23
		AdminSpawnable = true, -- 25
		Pocketable = false, -- 27
		Precursor = { -- 28
			biomass = (function(self) -- 28
				return math.random(5, 9) -- 28
			end) -- 28
		}, -- 30
		LootTable = { -- 31
			"item/food/slopskull", -- 31
			"item/food/ribbone" -- 32
		}, -- 34
		Refinement = { -- 35
			result = "fuel", -- 35
			time = 5 -- 36
		}, -- 38
		SubmitSound = "Submit_Flesh", -- 40
		Submitted = function(self) -- 40
			local pos = self:GetPos() -- 41
			util.Blood(pos, 256, Vector(), 256) -- 42
			for i = 1, #gibs do -- 43
				local gib = ents.Create("gib") -- 44
				gib:SetModel(gibs[i]) -- 46
				gib:SetPos(pos) -- 47
				gib:Spawn() -- 49
				SafeRemoveEntityDelayed(gib, math.random(5, 10)) -- 50
			end -- 50
		end, -- 52
		PhysicsCollide = function(self, data, physobj) -- 52
			if data.Speed >= 384 then -- 53
				if not self.can_burst_after then -- 54
					self.can_burst_after = CurTime() -- 54
				end -- 54
				if (not self.Smashed) and (CurTime() > self.can_burst_after) then -- 55
					self.Smashed = true -- 56
					self:Submitted() -- 57
					self:EmitSound(self.SubmitSound) -- 58
					return self:Remove() -- 59
				end -- 55
			end -- 53
		end, -- 61
		SetupDataTables = function(self) -- 61
			return self:NetworkVar("Int", 0, "Integrity") -- 62
		end, -- 64
		Initialize = function(self) -- 64
			self.MaxIntegrity = 200 -- 65
			if CLIENT then -- 66
				return -- 66
			end -- 66
			local mdls = { -- 67
				"models/gibs/antlion_gib_large_3.mdl" -- 67
			} -- 67
			local mdl = mdls[math.random(#mdls)] -- 68
			self:SetModel(mdl) -- 69
			self:PhysicsInit(SOLID_VPHYSICS) -- 70
			self:SetIntegrity(self.MaxIntegrity) -- 71
			self:PhysWake() -- 72
			self.can_burst_after = CurTime() + 3 -- 73
		end, -- 75
		OnTakeDamage = function(self, dmg) -- 75
			self:TakePhysicsDamage(dmg) -- 76
			local dtype = dmg:GetDamageType() -- 77
			local dmg_int = dmg:GetDamage() -- 78
			local inflictor = dmg:GetInflictor() -- 79
			if inflictor.MineBonus then -- 80
				dmg_int = dmg_int * inflictor.MineBonus -- 80
			end -- 80
			local pos = dmg:GetDamagePosition() -- 81
			do -- 82
				local edata = EffectData() -- 82
				edata:SetOrigin(pos) -- 83
				edata:SetScale(1) -- 84
				edata:SetMagnitude(0.5) -- 85
				edata:SetRadius(2) -- 86
				util.Effect("BloodImpact", edata) -- 87
			end -- 82
			self:SetIntegrity(self:GetIntegrity() - dmg_int) -- 88
			self.NextSound = self.NextSound or CurTime() -- 89
			if CurTime() >= self.NextSound then -- 90
				self.NextSound = CurTime() + 0.1 -- 91
				self:EmitSound("npc/headcrab/pain" .. tostring(math.random(1, 3)) .. ".wav") -- 92
			end -- 90
			if (self:GetIntegrity() <= 0) and not self.Breaking then -- 93
				self.Breaking = true -- 94
				self:EmitSound("physics/flesh/flesh_bloody_break.wav") -- 95
				do -- 96
					local edata = EffectData() -- 96
					edata:SetOrigin(pos) -- 97
					edata:SetScale(1) -- 98
					edata:SetMagnitude(0.5) -- 99
					edata:SetRadius(2) -- 100
					util.Effect("Bloodstream", edata) -- 101
				end -- 96
				for i = 1, math.random(1, 4) do -- 102
					local cls = self.LootTable[random(1, #self.LootTable)] -- 103
					local loot = ents.Create(cls) -- 104
					loot:Spawn() -- 106
					loot:Activate() -- 107
					loot:SetPos(pos) -- 108
				end -- 108
				return self:Remove() -- 109
			end -- 93
		end, -- 111
		Use = function(self, ply) -- 111
			if self:IsPlayerHolding() then -- 112
				return -- 112
			end -- 112
			ply:PickupObject(self) -- 113
			ply:EmitSound("physics/body/body_medium_impact_soft" .. tostring(math.random(1, 3)) .. ".wav", 75) -- 114
			return self:SetNWEntity("evilrp_submitter", ply) -- 115
		end, -- 117
		HUDRender = function(self) -- 117
			local ct = { } -- 118
			ct[#ct + 1] = self.PrintName -- 119
			if self.Description then -- 120
				ct[#ct + 1] = "" -- 121
				ct[#ct + 1] = { -- 122
					text = self.Description, -- 122
					font = "Spleen_Label_Small" -- 122
				} -- 122
			end -- 120
			return ct -- 123
		end -- 15
	} -- 15
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 123
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 15
			_base_0[_key_0] = _val_0 -- 15
		end -- 15
	end -- 123
	if _base_0.__index == nil then -- 15
		_base_0.__index = _base_0 -- 15
	end -- 123
	setmetatable(_base_0, _parent_0.__base) -- 15
	_class_0 = setmetatable({ -- 15
		__init = function(self, ...) -- 15
			return _class_0.__parent.__init(self, ...) -- 15
		end, -- 15
		__base = _base_0, -- 15
		__name = "Fleshcapsule", -- 15
		__parent = _parent_0 -- 15
	}, { -- 15
		__index = function(cls, name) -- 15
			local val = rawget(_base_0, name) -- 15
			if val == nil then -- 15
				local parent = rawget(cls, "__parent") -- 15
				if parent then -- 15
					return parent[name] -- 15
				end -- 15
			else -- 15
				return val -- 15
			end -- 15
		end, -- 15
		__call = function(cls, ...) -- 15
			local _self_0 = setmetatable({ }, _base_0) -- 15
			cls.__init(_self_0, ...) -- 15
			return _self_0 -- 15
		end -- 15
	}) -- 15
	_base_0.__class = _class_0 -- 15
	if _parent_0.__inherited then -- 15
		_parent_0.__inherited(_parent_0, _class_0) -- 15
	end -- 15
	Fleshcapsule = _class_0 -- 15
	return _class_0 -- 123
end -- 123
