-- [yue]: darkrp_modules\loot\sh_lootable.yue
local random = math.random -- 1
if CLIENT then -- 3
	net.Receive("evilrp_loot_fail", function() -- 4
		GAMEMODE:Frighten() -- 5
		return chat.AddNonParsedText(Color(200, 0, 0, 255), "There is nothing.") -- 6
	end) -- 4
else -- 8
	util.AddNetworkString("evilrp_loot_fail") -- 8
end -- 3
local LootSound -- 10
do -- 10
	local _class_0 -- 10
	local _parent_0 = SOUND -- 10
	local _base_0 = { -- 10
		sound = { -- 12
			"physics/plastic/plastic_barrel_break1.wav", -- 12
			"physics/plastic/plastic_barrel_break2.wav", -- 13
			"physics/plastic/plastic_box_break1.wav", -- 14
			"physics/plastic/plastic_box_break2.wav", -- 15
			"physics/plaster/ceilingtile_break1.wav", -- 16
			"physics/plaster/ceilingtile_break2.wav", -- 17
			"physics/cardboard/cardboard_box_break1.wav", -- 18
			"physics/cardboard/cardboard_box_break2.wav", -- 19
			"physics/cardboard/cardboard_box_break3.wav" -- 20
		} -- 10
	} -- 10
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 21
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 10
			_base_0[_key_0] = _val_0 -- 10
		end -- 10
	end -- 21
	if _base_0.__index == nil then -- 10
		_base_0.__index = _base_0 -- 10
	end -- 21
	setmetatable(_base_0, _parent_0.__base) -- 10
	_class_0 = setmetatable({ -- 10
		__init = function(self, ...) -- 10
			return _class_0.__parent.__init(self, ...) -- 10
		end, -- 10
		__base = _base_0, -- 10
		__name = "LootSound", -- 10
		__parent = _parent_0 -- 10
	}, { -- 10
		__index = function(cls, name) -- 10
			local val = rawget(_base_0, name) -- 10
			if val == nil then -- 10
				local parent = rawget(cls, "__parent") -- 10
				if parent then -- 10
					return parent[name] -- 10
				end -- 10
			else -- 10
				return val -- 10
			end -- 10
		end, -- 10
		__call = function(cls, ...) -- 10
			local _self_0 = setmetatable({ }, _base_0) -- 10
			cls.__init(_self_0, ...) -- 10
			return _self_0 -- 10
		end -- 10
	}) -- 10
	_base_0.__class = _class_0 -- 10
	if _parent_0.__inherited then -- 10
		_parent_0.__inherited(_parent_0, _class_0) -- 10
	end -- 10
	LootSound = _class_0 -- 10
end -- 21
local Lootable -- 23
do -- 23
	local _class_0 -- 23
	local _parent_0 = ENTITY_LONGUSE -- 23
	local _base_0 = { -- 23
		PrintName = "Lootable", -- 28
		Spawnable = true, -- 29
		AdminSpawnable = true, -- 31
		Interesting = true, -- 33
		Category = "EvilRP: Lootables", -- 35
		UseText = { -- 36
			"goes dumpster diving.", -- 36
			"scrapes the trash.", -- 37
			"digs for treasure.", -- 38
			"sifts through the garbage.", -- 39
			"looks for valuables.", -- 40
			"scavenges, like a rat.", -- 41
			"hunts for treasure.", -- 42
			"makes a mess.", -- 43
			"sticks both hands in the junk." -- 44
		}, -- 46
		LootTable = { -- 47
			"item/food/slopskull", -- 47
			"item/food/ribbone", -- 48
			"item/food/paper" -- 49
		}, -- 51
		LootMax = 8, -- 53
		AccumulateInterval = 60, -- 55
		TimeToUse = 5, -- 57
		SetupDataTables = function(self) -- 57
			_class_0.__parent.__base.SetupDataTables(self) -- 58
			self:NetworkVar("Int", "Remaining") -- 59
			return self:NetworkVar("String", "LootName") -- 60
		end, -- 62
		Initialize = function(self) -- 62
			if CLIENT then -- 63
				return -- 63
			end -- 63
			self:SetModel(self.Model) -- 64
			self:SetUseType(SIMPLE_USE) -- 65
			self:PhysicsInit(SOLID_VPHYSICS) -- 66
			local phys = self:GetPhysicsObject() -- 67
			if phys and phys:IsValid() then -- 68
				phys:Wake() -- 68
			end -- 68
			return self:SetRemaining(self.LootMax) -- 69
		end, -- 71
		LootMessages = { -- 72
			success = { -- 73
				"I found something.", -- 73
				"Aha.", -- 74
				"Nice.", -- 75
				"This might be useful.", -- 76
				"What have we here?", -- 77
				"Oh? ...oh!", -- 78
				"Hmm!" -- 79
			}, -- 72
			failure = { -- 81
				"Hmph.", -- 81
				"That's not helpful.", -- 82
				"Moving on...", -- 83
				"Oh? ...oh.", -- 84
				"Mmm.", -- 85
				"C'mon.", -- 86
				"Hmm...", -- 87
				"Ew.", -- 88
				"Filthy...", -- 89
				"Yuck.", -- 90
				"Gra-a." -- 91
			}, -- 80
			damage = { -- 93
				"Ow!", -- 93
				"Ouch!", -- 94
				"Ow, dammit!", -- 95
				"Agh, shit!", -- 96
				"SHARP! Ow.", -- 97
				"Ow, pointy!", -- 98
				"Eww, slimy!", -- 99
				"Uh oh, moving!" -- 100
			}, -- 92
			refusal = { -- 102
				"I don't feel like it.", -- 102
				"I'm not digging through trash while I feel like trash.", -- 103
				"I have better things to do.", -- 104
				"I'm dealing with enough as it is." -- 105
			} -- 101
		}, -- 107
		OnUseStart = function(self, ply) -- 107
			local desp = ply:GetDespair() -- 108
			if desp > 80 then -- 109
				local msgs = self.LootMessages.refusal -- 110
				ply:Notify("<c=200,0,0>" .. tostring(msgs[math.random(#msgs)])) -- 111
				net.Start("evilrp_frighten") -- 112
				net.Send(ply) -- 113
				return false -- 114
			end -- 109
		end, -- 116
		AttemptLoot = function(self, ply) -- 116
			if not SERVER then -- 117
				return -- 117
			end -- 117
			local tags = "" -- 118
			local col -- 119
			local msgs -- 120
			local roll = math.random(5) -- 121
			if self:GetRemaining() <= 0 then -- 122
				roll = roll + 1 -- 122
			end -- 122
			local noticed_empty = false -- 123
			if 1 == roll then -- 125
				col = "0,200,0" -- 126
				msgs = self.LootMessages.success -- 127
				self:Loot(ply) -- 128
			elseif 2 == roll or 3 == roll or 4 == roll then -- 129
				col = "200,200,0" -- 130
				msgs = self.LootMessages.failure -- 131
				local sad = math.random(0) -- 132
				if ply:HasOddity(ODDITY_DEPRESSION) then -- 133
					sad = sad * 2 -- 133
				end -- 133
				ply:AddDespair(sad) -- 134
				if (self:GetRemaining() <= 0) and math.random(3) == 2 then -- 135
					noticed_empty = true -- 135
				end -- 135
			elseif 5 == roll or 6 == roll then -- 136
				col = "200,0,0" -- 137
				msgs = self.LootMessages.damage -- 138
				local dmg = DamageInfo() -- 139
				dmg:SetDamageType(DMG_SLASH) -- 141
				dmg:SetDamage(math.random(5, 10)) -- 142
				dmg:SetAttacker(ply) -- 143
				dmg:SetInflictor(self) -- 144
				self:EmitSound("npc/headcrab/headbite.wav") -- 145
				ply:TakeDamageInfo(dmg) -- 146
				self:SetUser(NULL) -- 147
				self:SetEndTime(0) -- 148
				self.PartialUse = 0 -- 149
			end -- 149
			ply:PlaySignal(ACT_GMOD_GESTURE_RANGE_FRENZY, true) -- 150
			self:EmitSound("LootSound") -- 151
			ply:Notify(tostring(tags) .. "<c=" .. tostring(col) .. ">" .. tostring(msgs[math.random(#msgs)])) -- 152
			if noticed_empty then -- 153
				ply:Notify("I don't think anything worth finding is in there.") -- 154
				self:SetUser(NULL) -- 155
				self:SetEndTime(0) -- 156
				self.PartialUse = 0 -- 157
			end -- 153
		end, -- 159
		Loot = function(self, ply) -- 159
			if not SERVER then -- 160
				return -- 160
			end -- 160
			local start = ply:EyePos() -- 161
			local tr = util.TraceLine({ -- 163
				start = start, -- 163
				endpos = start + ply:GetAimVector() * 85, -- 164
				filter = ply -- 165
			}) -- 162
			local cls = self.LootTable[random(1, #self.LootTable)] -- 167
			local loot = ents.Create(cls) -- 168
			loot:Spawn() -- 170
			loot:Activate() -- 171
			DarkRP.placeEntity(loot, tr, ply) -- 172
			return self:SetRemaining(self:GetRemaining() - 1) -- 173
		end, -- 175
		PartialUses = { -- 176
			{ -- 176
				prog = 20, -- 176
				func = function(self, ply) -- 177
					return self:AttemptLoot(ply) -- 177
				end -- 177
			}, -- 176
			{ -- 178
				prog = 40, -- 178
				func = function(self, ply) -- 179
					return self:AttemptLoot(ply) -- 179
				end -- 179
			}, -- 178
			{ -- 180
				prog = 60, -- 180
				func = function(self, ply) -- 181
					return self:AttemptLoot(ply) -- 181
				end -- 181
			}, -- 180
			{ -- 182
				prog = 80, -- 182
				func = function(self, ply) -- 183
					return self:AttemptLoot(ply) -- 183
				end -- 183
			}, -- 182
			{ -- 184
				prog = 100, -- 184
				func = function(self, ply) -- 185
					return self:AttemptLoot(ply) -- 185
				end -- 185
			} -- 184
		}, -- 187
		Think = function(self) -- 187
			_class_0.__parent.__base.Think(self) -- 188
			local ct = CurTime() -- 189
			self.next_accumulate = self.next_accumulate or (ct + self.AccumulateInterval) -- 190
			if ct >= self.next_accumulate then -- 191
				self.next_accumulate = ct + self.AccumulateInterval -- 192
				local remaining = self:GetRemaining() -- 193
				if remaining < self.LootMax and math.random(5) == 3 then -- 194
					return self:SetRemaining(remaining + 1) -- 194
				end -- 194
			end -- 191
		end, -- 196
		Draw = function(self) -- 196
			return self:DrawModel() -- 196
		end, -- 198
		HUDRender = function(self) -- 198
			local ct = { } -- 199
			ct[#ct + 1] = self.PrintName -- 200
			if self.Description then -- 201
				ct[#ct + 1] = "" -- 202
				ct[#ct + 1] = { -- 203
					text = self.Description, -- 203
					font = "Spleen_Label_Small" -- 203
				} -- 203
				ct[#ct + 1] = { -- 204
					text = "There might be treasure inside.", -- 204
					font = "Spleen_Label_Small" -- 204
				} -- 204
			end -- 201
			return ct -- 205
		end, -- 207
		Interactions = { -- 208
			{ -- 208
				desc = "Huh?", -- 208
				func = (function() -- 208
					return lp:SendChat("GENERIC", "This is a source of mysterious, replenishing treasure.\n<f=Spleen_Chat_Small>Hold the USE key to search for goodies.\nIt might hurt your hand, though.") -- 210
				end) -- 208
			} -- 208
		} -- 23
	} -- 23
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 210
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 23
			_base_0[_key_0] = _val_0 -- 23
		end -- 23
	end -- 210
	if _base_0.__index == nil then -- 23
		_base_0.__index = _base_0 -- 23
	end -- 210
	setmetatable(_base_0, _parent_0.__base) -- 23
	_class_0 = setmetatable({ -- 23
		__init = function(self, ...) -- 23
			return _class_0.__parent.__init(self, ...) -- 23
		end, -- 23
		__base = _base_0, -- 23
		__name = "Lootable", -- 23
		__parent = _parent_0 -- 23
	}, { -- 23
		__index = function(cls, name) -- 23
			local val = rawget(_base_0, name) -- 23
			if val == nil then -- 23
				local parent = rawget(cls, "__parent") -- 23
				if parent then -- 23
					return parent[name] -- 23
				end -- 23
			else -- 23
				return val -- 23
			end -- 23
		end, -- 23
		__call = function(cls, ...) -- 23
			local _self_0 = setmetatable({ }, _base_0) -- 23
			cls.__init(_self_0, ...) -- 23
			return _self_0 -- 23
		end -- 23
	}) -- 23
	_base_0.__class = _class_0 -- 23
	local self = _class_0; -- 23
	self.__entity = "lootable" -- 24
	if _parent_0.__inherited then -- 23
		_parent_0.__inherited(_parent_0, _class_0) -- 23
	end -- 23
	Lootable = _class_0 -- 23
end -- 210
local Dumpster -- 212
do -- 212
	local _class_0 -- 212
	local _parent_0 = Lootable -- 212
	local _base_0 = { -- 212
		PrintName = "Dumpster", -- 215
		Description = "It's metal, it's green, and it reeks.", -- 217
		Model = "models/props_junk/TrashDumpster01a.mdl", -- 219
		LootTable = { -- 220
			"item/food/slopskull", -- 220
			"item/food/slopskull", -- 221
			"item/food/slopskull", -- 222
			"item/food/slopskull", -- 223
			"item/food/slopskull", -- 224
			"item/food/slopskull", -- 225
			"item/food/ribbone", -- 226
			"item/food/ribbone", -- 227
			"item/food/ribbone", -- 228
			"item/food/ribbone", -- 229
			"item/food/paper", -- 230
			"item/food/paper", -- 231
			"item/food/paper", -- 232
			"item/food/paper", -- 233
			"item/food/boot", -- 234
			"item/food/boot", -- 235
			"item/food/boot", -- 236
			"item/food/boot", -- 237
			"item/food/abortion", -- 238
			"item/food/abortion", -- 239
			"item/food/abortion", -- 240
			"item/food/abortion", -- 241
			"item/food/abortion", -- 242
			"item/food/drink/fearbeer", -- 243
			"item/food/drink/smearbeer", -- 244
			"trash/bottle", -- 245
			"trash/bottle", -- 246
			"trash/bottle", -- 247
			"trash/bottle/fearbeer", -- 248
			"trash/bottle/fearbeer", -- 249
			"trash/bottle/fearbeer", -- 250
			"trash/bottle/fearbeer", -- 251
			"trash/plastic/shake", -- 252
			"trash/plastic/shake", -- 253
			"trash/plastic/shake", -- 254
			"trash/plastic/shake", -- 255
			"trash/plastic/pills", -- 256
			"trash/plastic/pills", -- 257
			"trash/plastic/pills", -- 258
			"trash/plastic/bleach", -- 259
			"trash/plastic/bleach", -- 260
			"trash/plastic/bleach", -- 261
			"trash/inhaler", -- 262
			"trash/inhaler", -- 263
			"trash/inhaler" -- 264
		} -- 212
	} -- 212
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 264
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 212
			_base_0[_key_0] = _val_0 -- 212
		end -- 212
	end -- 264
	if _base_0.__index == nil then -- 212
		_base_0.__index = _base_0 -- 212
	end -- 264
	setmetatable(_base_0, _parent_0.__base) -- 212
	_class_0 = setmetatable({ -- 212
		__init = function(self, ...) -- 212
			return _class_0.__parent.__init(self, ...) -- 212
		end, -- 212
		__base = _base_0, -- 212
		__name = "Dumpster", -- 212
		__parent = _parent_0 -- 212
	}, { -- 212
		__index = function(cls, name) -- 212
			local val = rawget(_base_0, name) -- 212
			if val == nil then -- 212
				local parent = rawget(cls, "__parent") -- 212
				if parent then -- 212
					return parent[name] -- 212
				end -- 212
			else -- 212
				return val -- 212
			end -- 212
		end, -- 212
		__call = function(cls, ...) -- 212
			local _self_0 = setmetatable({ }, _base_0) -- 212
			cls.__init(_self_0, ...) -- 212
			return _self_0 -- 212
		end -- 212
	}) -- 212
	_base_0.__class = _class_0 -- 212
	if _parent_0.__inherited then -- 212
		_parent_0.__inherited(_parent_0, _class_0) -- 212
	end -- 212
	Dumpster = _class_0 -- 212
end -- 264
local Locker -- 267
do -- 267
	local _class_0 -- 267
	local _parent_0 = Lootable -- 267
	local _base_0 = { -- 267
		PrintName = "Ancient locker", -- 270
		Description = "A locker that seems to have washed up from whatever ancient battlefront it came from. ", -- 272
		Model = "models/props_c17/lockers001a.mdl", -- 273
		LootMax = 8, -- 274
		TimeToUse = 12, -- 276
		LootTable = { -- 277
			"evilrp_weapon/obrez", -- 277
			"item/food/paper", -- 278
			"item/food/paper", -- 279
			"evilrp_weapon/enforcer", -- 280
			"evilrp_weapon/enforcer", -- 281
			"item/food/boot", -- 282
			"item/food/boot", -- 283
			"item/food/boot", -- 284
			"item/drug/rotmelange", -- 285
			"trash/bottle", -- 286
			"trash/bottle", -- 287
			"trash/bottle", -- 288
			"evilrp_weapon/greaser" -- 289
		} -- 267
	} -- 267
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 289
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 267
			_base_0[_key_0] = _val_0 -- 267
		end -- 267
	end -- 289
	if _base_0.__index == nil then -- 267
		_base_0.__index = _base_0 -- 267
	end -- 289
	setmetatable(_base_0, _parent_0.__base) -- 267
	_class_0 = setmetatable({ -- 267
		__init = function(self, ...) -- 267
			return _class_0.__parent.__init(self, ...) -- 267
		end, -- 267
		__base = _base_0, -- 267
		__name = "Locker", -- 267
		__parent = _parent_0 -- 267
	}, { -- 267
		__index = function(cls, name) -- 267
			local val = rawget(_base_0, name) -- 267
			if val == nil then -- 267
				local parent = rawget(cls, "__parent") -- 267
				if parent then -- 267
					return parent[name] -- 267
				end -- 267
			else -- 267
				return val -- 267
			end -- 267
		end, -- 267
		__call = function(cls, ...) -- 267
			local _self_0 = setmetatable({ }, _base_0) -- 267
			cls.__init(_self_0, ...) -- 267
			return _self_0 -- 267
		end -- 267
	}) -- 267
	_base_0.__class = _class_0 -- 267
	if _parent_0.__inherited then -- 267
		_parent_0.__inherited(_parent_0, _class_0) -- 267
	end -- 267
	Locker = _class_0 -- 267
	return _class_0 -- 289
end -- 289
