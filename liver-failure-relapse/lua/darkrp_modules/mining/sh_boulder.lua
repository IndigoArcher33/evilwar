-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/mining/sh_boulder.yue
local random = math.random -- 1
local Boulder -- 3
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
return _class_0 -- 82
