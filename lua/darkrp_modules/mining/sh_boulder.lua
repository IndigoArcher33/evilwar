local random = math.random
local Boulder
do
	local _class_0
	local _parent_0 = ENTITY
	local _base_0 = {
		Base = "base_anim",
		Type = "anim",
		Spawnable = true,
		AdminSpawnable = true,
		Pocketable = false,
		LootTable = {
			"metal/scrap",
			"metal/slag"
		},
		SetupDataTables = function(self)
			return self:NetworkVar("Int", 0, "Integrity")
		end,
		Initialize = function(self)
			self.MaxIntegrity = 200
			if CLIENT then
				return
			end
			local mdls = {
				"models/props_wasteland/rockgranite03a.mdl",
				"models/props_wasteland/rockgranite03b.mdl",
				"models/props_wasteland/rockgranite03c.mdl"
			}
			local mdl = mdls[math.random(#mdls)]
			self:SetModel(mdl)
			self:PhysicsInit(SOLID_VPHYSICS)
			self:SetIntegrity(self.MaxIntegrity)
			local phys = self:GetPhysicsObject()
			if phys and IsValid(phys) then
				phys:Wake()
			end
			return phys
		end,
		OnTakeDamage = function(self, dmg)
			self:TakePhysicsDamage(dmg)
			local dtype = dmg:GetDamageType()
			if not ((dtype == DMG_CLUB) or (dtype == DMG_BLAST)) then
				return
			end
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
				util.Effect("Sparks", edata)
			end
			self:SetIntegrity(self:GetIntegrity() - dmg_int)
			self.NextSound = self.NextSound or CurTime()
			if CurTime() >= self.NextSound then
				self.NextSound = CurTime() + 0.1
				self:EmitSound("physics/concrete/boulder_impact_hard" .. tostring(math.random(1, 4)) .. ".wav")
				self:EmitSound("weapons/crowbar/crowbar_impact" .. tostring(math.random(1, 2)) .. ".wav", 90, math.random(80, 110))
			end
			if (self:GetIntegrity() <= 0) and not self.Breaking then
				self.Breaking = true
				do
					local edata = EffectData()
					edata:SetOrigin(pos)
					edata:SetScale(1)
					edata:SetMagnitude(0.5)
					edata:SetRadius(2)
					util.Effect("Sparks", edata)
				end
				local who = dmg:GetAttacker()
				if (who and IsValid(who) and who:IsPlayer() and who:Alive()) then
					local reward = 24 + math.random(19)
					who:AddMoney(reward, "The Toil")
				end
				for i = 1, math.random(1, 3) do
					local cls = self.LootTable[random(1, #self.LootTable)]
					local loot = ents.Create(cls)
					loot:Spawn()
					loot:Activate()
					loot:SetPos(pos)
				end
				return self:Remove()
			end
		end,
		PhysicsCollide = function(self, data, physobj)
			if data.Speed >= 512 then
				local ed = EffectData()
				ed:SetOrigin(self:GetPos())
				ed:SetScale(1000)
				util.Effect("ThumperDust", ed, true, true)
				return self:EmitSound("physics/concrete/boulder_impact_hard" .. tostring(math.random(1, 4)) .. ".wav")
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
		__name = "Boulder",
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
	Boulder = _class_0
	return _class_0
end
