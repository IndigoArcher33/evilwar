local random = math.random
if CLIENT then
	net.Receive("evilrp_loot_fail", function()
		GAMEMODE:Frighten()
		return chat.AddNonParsedText(Color(200, 0, 0, 255), "There is nothing.")
	end)
else
	util.AddNetworkString("evilrp_loot_fail")
end
local LootSound
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = {
			"physics/plastic/plastic_barrel_break1.wav",
			"physics/plastic/plastic_barrel_break2.wav",
			"physics/plastic/plastic_box_break1.wav",
			"physics/plastic/plastic_box_break2.wav",
			"physics/plaster/ceilingtile_break1.wav",
			"physics/plaster/ceilingtile_break2.wav",
			"physics/cardboard/cardboard_box_break1.wav",
			"physics/cardboard/cardboard_box_break2.wav",
			"physics/cardboard/cardboard_box_break3.wav"
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
		__name = "LootSound",
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
	LootSound = _class_0
end
local Lootable
do
	local _class_0
	local _parent_0 = ENTITY_LONGUSE
	local _base_0 = {
		PrintName = "Lootable",
		Spawnable = true,
		AdminSpawnable = true,
		Interesting = true,
		Category = "EvilRP: Lootables",
		UseText = {
			"goes dumpster diving.",
			"scrapes the trash.",
			"digs for treasure.",
			"sifts through the garbage.",
			"looks for valuables.",
			"scavenges, like a rat.",
			"hunts for treasure.",
			"makes a mess.",
			"sticks both hands in the junk."
		},
		LootTable = {
			"item/food/slopskull",
			"item/food/ribbone",
			"item/food/paper"
		},
		LootMax = 8,
		AccumulateInterval = 60,
		TimeToUse = 5,
		SetupDataTables = function(self)
			_class_0.__parent.__base.SetupDataTables(self)
			self:NetworkVar("Int", "Remaining")
			return self:NetworkVar("String", "LootName")
		end,
		Initialize = function(self)
			if CLIENT then
				return
			end
			self:SetModel(self.Model)
			self:SetUseType(SIMPLE_USE)
			self:PhysicsInit(SOLID_VPHYSICS)
			local phys = self:GetPhysicsObject()
			if phys and phys:IsValid() then
				phys:Wake()
			end
			return self:SetRemaining(self.LootMax)
		end,
		LootMessages = {
			success = {
				"I found something.",
				"Aha.",
				"Nice.",
				"This might be useful.",
				"What have we here?",
				"Oh? ...oh!",
				"Hmm!"
			},
			failure = {
				"Hmph.",
				"That's not helpful.",
				"Moving on...",
				"Oh? ...oh.",
				"Mmm.",
				"C'mon.",
				"Hmm...",
				"Ew.",
				"Filthy...",
				"Yuck.",
				"Gra-a."
			},
			damage = {
				"Ow!",
				"Ouch!",
				"Ow, dammit!",
				"Agh, shit!",
				"SHARP! Ow.",
				"Ow, pointy!",
				"Eww, slimy!",
				"Uh oh, moving!"
			},
			refusal = {
				"I don't feel like it.",
				"I'm not digging through trash while I feel like trash.",
				"I have better things to do.",
				"I'm dealing with enough as it is."
			}
		},
		OnUseStart = function(self, ply)
			local desp = ply:GetDespair()
			if desp > 80 then
				local msgs = self.LootMessages.refusal
				ply:Notify("<c=200,0,0>" .. tostring(msgs[math.random(#msgs)]))
				net.Start("evilrp_frighten")
				net.Send(ply)
				return false
			end
		end,
		AttemptLoot = function(self, ply)
			if not SERVER then
				return
			end
			local tags = ""
			local col
			local msgs
			local roll = math.random(5)
			if self:GetRemaining() <= 0 then
				roll = roll + 1
			end
			local noticed_empty = false
			if 1 == roll then
				col = "0,200,0"
				msgs = self.LootMessages.success
				self:Loot(ply)
			elseif 2 == roll or 3 == roll or 4 == roll then
				col = "200,200,0"
				msgs = self.LootMessages.failure
				local sad = math.random(1, 3)
				if ply:HasOddity(ODDITY_DEPRESSION) then
					sad = sad * 2
				end
				ply:AddDespair(sad)
				if (self:GetRemaining() <= 0) and math.random(3) == 2 then
					noticed_empty = true
				end
			elseif 5 == roll or 6 == roll then
				col = "200,0,0"
				msgs = self.LootMessages.damage
				local dmg = DamageInfo()
				dmg:SetDamageType(DMG_SLASH)
				dmg:SetDamage(math.random(5, 10))
				dmg:SetAttacker(ply)
				dmg:SetInflictor(self)
				self:EmitSound("npc/headcrab/headbite.wav")
				ply:TakeDamageInfo(dmg)
				self:SetUser(NULL)
				self:SetEndTime(0)
				self.PartialUse = 0
			end
			ply:PlaySignal(ACT_GMOD_GESTURE_RANGE_FRENZY, true)
			self:EmitSound("LootSound")
			ply:Notify(tostring(tags) .. "<c=" .. tostring(col) .. ">" .. tostring(msgs[math.random(#msgs)]))
			if noticed_empty then
				ply:Notify("I don't think anything worth finding is in there.")
				self:SetUser(NULL)
				self:SetEndTime(0)
				self.PartialUse = 0
			end
		end,
		Loot = function(self, ply)
			if not SERVER then
				return
			end
			local start = ply:EyePos()
			local tr = util.TraceLine({
				start = start,
				endpos = start + ply:GetAimVector() * 85,
				filter = ply
			})
			local cls = self.LootTable[random(1, #self.LootTable)]
			local loot = ents.Create(cls)
			loot:Spawn()
			loot:Activate()
			DarkRP.placeEntity(loot, tr, ply)
			return self:SetRemaining(self:GetRemaining() - 1)
		end,
		PartialUses = {
			{
				prog = 20,
				func = function(self, ply)
					return self:AttemptLoot(ply)
				end
			},
			{
				prog = 40,
				func = function(self, ply)
					return self:AttemptLoot(ply)
				end
			},
			{
				prog = 60,
				func = function(self, ply)
					return self:AttemptLoot(ply)
				end
			},
			{
				prog = 80,
				func = function(self, ply)
					return self:AttemptLoot(ply)
				end
			},
			{
				prog = 100,
				func = function(self, ply)
					return self:AttemptLoot(ply)
				end
			}
		},
		Think = function(self)
			_class_0.__parent.__base.Think(self)
			local ct = CurTime()
			self.next_accumulate = self.next_accumulate or (ct + self.AccumulateInterval)
			if ct >= self.next_accumulate then
				self.next_accumulate = ct + self.AccumulateInterval
				local remaining = self:GetRemaining()
				if remaining < self.LootMax and math.random(5) == 3 then
					return self:SetRemaining(remaining + 1)
				end
			end
		end,
		Draw = function(self)
			return self:DrawModel()
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
				ct[#ct + 1] = {
					text = "There might be treasure inside.",
					font = "Spleen_Label_Small"
				}
			end
			return ct
		end,
		Interactions = {
			{
				desc = "Huh?",
				func = (function()
					return lp:SendChat("GENERIC", "This is a source of mysterious, replenishing treasure.\n<f=Spleen_Chat_Small>Hold the USE key to search for goodies.\nIt might hurt your hand, though.")
				end)
			}
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
		__name = "Lootable",
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
	local self = _class_0;
	self.__entity = "lootable"
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Lootable = _class_0
end
local Dumpster
do
	local _class_0
	local _parent_0 = Lootable
	local _base_0 = {
		PrintName = "Dumpster",
		Description = "It's metal, it's green, and it reeks.",
		Model = "models/props_junk/TrashDumpster01a.mdl",
		LootTable = {
			"item/food/slopskull",
			"item/food/slopskull",
			"item/food/slopskull",
			"item/food/slopskull",
			"item/food/slopskull",
			"item/food/slopskull",
			"item/food/ribbone",
			"item/food/ribbone",
			"item/food/ribbone",
			"item/food/ribbone",
			"item/food/paper",
			"item/food/paper",
			"item/food/paper",
			"item/food/paper",
			"item/food/boot",
			"item/food/boot",
			"item/food/boot",
			"item/food/boot",
			"item/food/abortion",
			"item/food/abortion",
			"item/food/abortion",
			"item/food/abortion",
			"item/food/abortion",
			"item/food/drink/fearbeer",
			"item/food/drink/smearbeer",
			"trash/bottle",
			"trash/bottle",
			"trash/bottle",
			"trash/bottle/fearbeer",
			"trash/bottle/fearbeer",
			"trash/bottle/fearbeer",
			"trash/bottle/fearbeer",
			"trash/plastic/shake",
			"trash/plastic/shake",
			"trash/plastic/shake",
			"trash/plastic/shake",
			"trash/plastic/pills",
			"trash/plastic/pills",
			"trash/plastic/pills",
			"trash/plastic/bleach",
			"trash/plastic/bleach",
			"trash/plastic/bleach",
			"trash/inhaler",
			"trash/inhaler",
			"trash/inhaler"
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
		__name = "Dumpster",
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
	Dumpster = _class_0
	return _class_0
end
