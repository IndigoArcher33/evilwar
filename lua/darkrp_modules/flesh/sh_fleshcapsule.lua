local random = math.random
local Submit_Flesh
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 4 do
				_accum_0[_len_0] = "placenta/head_explodie_0" .. tostring(i) .. ".ogg"
				_len_0 = _len_0 + 1
			end
			return _accum_0
		end)(),
		pitch = {
			80,
			90
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
		__name = "Submit_Flesh",
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
	Submit_Flesh = _class_0
end
local gibs = {
	"models/gibs/humans/mgib_01.mdl",
	"models/gibs/humans/mgib_02.mdl",
	"models/gibs/humans/mgib_03.mdl",
	"models/gibs/humans/mgib_04.mdl",
	"models/gibs/humans/mgib_05.mdl",
	"models/gibs/humans/mgib_06.mdl",
	"models/gibs/humans/mgib_07.mdl"
}
local Fleshcapsule
do
	local _class_0
	local _parent_0 = ENTITY
	local _base_0 = {
		PrintName = "Flesh Capsule",
		Description = "Filled with disgusting, recyclable biomass.\nYou could also process it into biofuel at a Refinery.",
		Interesting = true,
		Base = "base_anim",
		Type = "anim",
		Spawnable = true,
		AdminSpawnable = true,
		Pocketable = false,
		Precursor = {
			biomass = (function(self)
				return math.random(5, 9)
			end)
		},
		LootTable = {
			"item/food/slopskull",
			"item/food/ribbone"
		},
		Refinement = {
			result = "fuel",
			time = 5
		},
		SubmitSound = "Submit_Flesh",
		Submitted = function(self)
			local pos = self:GetPos()
			util.Blood(pos, 256, Vector(), 256)
			for i = 1, #gibs do
				local gib = ents.Create("gib")
				gib:SetModel(gibs[i])
				gib:SetPos(pos)
				gib:Spawn()
				SafeRemoveEntityDelayed(gib, math.random(5, 10))
			end
		end,
		PhysicsCollide = function(self, data, physobj)
			if data.Speed >= 384 then
				if not self.can_burst_after then
					self.can_burst_after = CurTime()
				end
				if (not self.Smashed) and (CurTime() > self.can_burst_after) then
					self.Smashed = true
					self:Submitted()
					self:EmitSound(self.SubmitSound)
					return self:Remove()
				end
			end
		end,
		SetupDataTables = function(self)
			return self:NetworkVar("Int", 0, "Integrity")
		end,
		Initialize = function(self)
			self.MaxIntegrity = 200
			if CLIENT then
				return
			end
			local mdls = {
				"models/gibs/antlion_gib_large_3.mdl"
			}
			local mdl = mdls[math.random(#mdls)]
			self:SetModel(mdl)
			self:PhysicsInit(SOLID_VPHYSICS)
			self:SetIntegrity(self.MaxIntegrity)
			self:PhysWake()
			self.can_burst_after = CurTime() + 3
		end,
		OnTakeDamage = function(self, dmg)
			self:TakePhysicsDamage(dmg)
			local dtype = dmg:GetDamageType()
			local dmg_int = dmg:GetDamage()
			local inflictor = dmg:GetInflictor()
			if inflictor.MineBonus then
				dmg_int = dmg_int * inflictor.MineBonus
			end
			local pos = dmg:GetDamagePosition()
			do
				local edata = EffectData()
				edata:SetOrigin(pos)
				edata:SetScale(1)
				edata:SetMagnitude(0.5)
				edata:SetRadius(2)
				util.Effect("BloodImpact", edata)
			end
			self:SetIntegrity(self:GetIntegrity() - dmg_int)
			self.NextSound = self.NextSound or CurTime()
			if CurTime() >= self.NextSound then
				self.NextSound = CurTime() + 0.1
				self:EmitSound("npc/headcrab/pain" .. tostring(math.random(1, 3)) .. ".wav")
			end
			if (self:GetIntegrity() <= 0) and not self.Breaking then
				self.Breaking = true
				self:EmitSound("physics/flesh/flesh_bloody_break.wav")
				do
					local edata = EffectData()
					edata:SetOrigin(pos)
					edata:SetScale(1)
					edata:SetMagnitude(0.5)
					edata:SetRadius(2)
					util.Effect("Bloodstream", edata)
				end
				for i = 1, math.random(1, 4) do
					local cls = self.LootTable[random(1, #self.LootTable)]
					local loot = ents.Create(cls)
					loot:Spawn()
					loot:Activate()
					loot:SetPos(pos)
				end
				return self:Remove()
			end
		end,
		Use = function(self, ply)
			if self:IsPlayerHolding() then
				return
			end
			ply:PickupObject(self)
			ply:EmitSound("physics/body/body_medium_impact_soft" .. tostring(math.random(1, 3)) .. ".wav", 75)
			return self:SetNWEntity("evilrp_submitter", ply)
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
		__name = "Fleshcapsule",
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
	Fleshcapsule = _class_0
	return _class_0
end
