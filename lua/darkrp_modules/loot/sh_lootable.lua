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
			local roll = math.random(4) -- 121
			if self:GetRemaining() <= 0 then -- 122
				roll = roll + 1 -- 122
			end -- 122
			local noticed_empty = false -- 123
			if 1 == roll or 2 == roll then -- 125
				col = "0,200,0" -- 126
				msgs = self.LootMessages.success -- 127
				self:Loot(ply) -- 128
			elseif 3 == roll or 4 == roll then -- 129
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
			elseif 5 == roll then -- 136
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
			local wep = weapons.Get(cls) -- 168
			local loot -- 169
			if wep then -- 170
				loot = ents.Create("evilrp/spawned/weapon") -- 171
				print("spawning weapon " .. tostring(cls)) -- 172
				loot:SetModel(wep.WorldModel) -- 174
				loot:SetWeaponClass(cls) -- 175
				loot:Spawn() -- 176
				loot:Activate() -- 177
			else -- 179
				loot = ents.Create(cls) -- 179
				loot:Spawn() -- 181
				loot:Activate() -- 182
			end -- 170
			DarkRP.placeEntity(loot, tr, ply) -- 183
			return self:SetRemaining(self:GetRemaining() - 1) -- 184
		end, -- 186
		PartialUses = { -- 187
			{ -- 187
				prog = 20, -- 187
				func = function(self, ply) -- 188
					return self:AttemptLoot(ply) -- 188
				end -- 188
			}, -- 187
			{ -- 189
				prog = 40, -- 189
				func = function(self, ply) -- 190
					return self:AttemptLoot(ply) -- 190
				end -- 190
			}, -- 189
			{ -- 191
				prog = 60, -- 191
				func = function(self, ply) -- 192
					return self:AttemptLoot(ply) -- 192
				end -- 192
			}, -- 191
			{ -- 193
				prog = 80, -- 193
				func = function(self, ply) -- 194
					return self:AttemptLoot(ply) -- 194
				end -- 194
			}, -- 193
			{ -- 195
				prog = 100, -- 195
				func = function(self, ply) -- 196
					return self:AttemptLoot(ply) -- 196
				end -- 196
			} -- 195
		}, -- 198
		Think = function(self) -- 198
			_class_0.__parent.__base.Think(self) -- 199
			local ct = CurTime() -- 200
			self.next_accumulate = self.next_accumulate or (ct + self.AccumulateInterval) -- 201
			if ct >= self.next_accumulate then -- 202
				self.next_accumulate = ct + self.AccumulateInterval -- 203
				local remaining = self:GetRemaining() -- 204
				if remaining < self.LootMax and math.random(5) == 3 then -- 205
					return self:SetRemaining(remaining + 1) -- 205
				end -- 205
			end -- 202
		end, -- 207
		Draw = function(self) -- 207
			return self:DrawModel() -- 207
		end, -- 209
		HUDRender = function(self) -- 209
			local ct = { } -- 210
			ct[#ct + 1] = self.PrintName -- 211
			if self.Description then -- 212
				ct[#ct + 1] = "" -- 213
				ct[#ct + 1] = { -- 214
					text = self.Description, -- 214
					font = "Spleen_Label_Small" -- 214
				} -- 214
				ct[#ct + 1] = { -- 215
					text = "There might be treasure inside.", -- 215
					font = "Spleen_Label_Small" -- 215
				} -- 215
			end -- 212
			return ct -- 216
		end, -- 218
		Interactions = { -- 219
			{ -- 219
				desc = "Huh?", -- 219
				func = (function() -- 219
					return lp:SendChat("GENERIC", "This is a source of mysterious, replenishing treasure.\n<f=Spleen_Chat_Small>Hold the USE key to search for goodies.\nIt might hurt your hand, though.") -- 221
				end) -- 219
			} -- 219
		} -- 23
	} -- 23
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 221
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 23
			_base_0[_key_0] = _val_0 -- 23
		end -- 23
	end -- 221
	if _base_0.__index == nil then -- 23
		_base_0.__index = _base_0 -- 23
	end -- 221
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
end -- 221
local Dumpster -- 223
do -- 223
	local _class_0 -- 223
	local _parent_0 = Lootable -- 223
	local _base_0 = { -- 223
		PrintName = "Dumpster", -- 226
		Description = "It's metal, it's green, and it reeks.", -- 228
		Model = "models/props_junk/TrashDumpster01a.mdl", -- 230
		LootTable = { -- 231
			"item/food/slopskull", -- 231
			"item/food/slopskull", -- 232
			"item/food/slopskull", -- 233
			"item/food/slopskull", -- 234
			"item/food/slopskull", -- 235
			"item/food/slopskull", -- 236
			"item/food/ribbone", -- 237
			"item/food/ribbone", -- 238
			"item/food/ribbone", -- 239
			"item/food/ribbone", -- 240
			"item/food/paper", -- 241
			"item/food/paper", -- 242
			"item/food/paper", -- 243
			"item/food/paper", -- 244
			"item/food/boot", -- 245
			"item/food/boot", -- 246
			"item/food/boot", -- 247
			"item/food/boot", -- 248
			"item/food/abortion", -- 249
			"item/food/abortion", -- 250
			"item/food/abortion", -- 251
			"item/food/abortion", -- 252
			"item/food/abortion", -- 253
			"item/food/drink/fearbeer", -- 254
			"item/food/drink/smearbeer", -- 255
			"trash/bottle", -- 256
			"trash/bottle", -- 257
			"trash/bottle", -- 258
			"trash/bottle/fearbeer", -- 259
			"trash/bottle/fearbeer", -- 260
			"trash/bottle/fearbeer", -- 261
			"trash/bottle/fearbeer", -- 262
			"trash/plastic/shake", -- 263
			"trash/plastic/shake", -- 264
			"trash/plastic/shake", -- 265
			"trash/plastic/shake", -- 266
			"trash/plastic/pills", -- 267
			"trash/plastic/pills", -- 268
			"trash/plastic/pills", -- 269
			"trash/plastic/bleach", -- 270
			"trash/plastic/bleach", -- 271
			"trash/plastic/bleach", -- 272
			"trash/inhaler", -- 273
			"trash/inhaler", -- 274
			"trash/inhaler" -- 275
		} -- 223
	} -- 223
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 275
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 223
			_base_0[_key_0] = _val_0 -- 223
		end -- 223
	end -- 275
	if _base_0.__index == nil then -- 223
		_base_0.__index = _base_0 -- 223
	end -- 275
	setmetatable(_base_0, _parent_0.__base) -- 223
	_class_0 = setmetatable({ -- 223
		__init = function(self, ...) -- 223
			return _class_0.__parent.__init(self, ...) -- 223
		end, -- 223
		__base = _base_0, -- 223
		__name = "Dumpster", -- 223
		__parent = _parent_0 -- 223
	}, { -- 223
		__index = function(cls, name) -- 223
			local val = rawget(_base_0, name) -- 223
			if val == nil then -- 223
				local parent = rawget(cls, "__parent") -- 223
				if parent then -- 223
					return parent[name] -- 223
				end -- 223
			else -- 223
				return val -- 223
			end -- 223
		end, -- 223
		__call = function(cls, ...) -- 223
			local _self_0 = setmetatable({ }, _base_0) -- 223
			cls.__init(_self_0, ...) -- 223
			return _self_0 -- 223
		end -- 223
	}) -- 223
	_base_0.__class = _class_0 -- 223
	if _parent_0.__inherited then -- 223
		_parent_0.__inherited(_parent_0, _class_0) -- 223
	end -- 223
	Dumpster = _class_0 -- 223
end -- 275
local Crate -- 277
do -- 277
	local _class_0 -- 277
	local _parent_0 = Lootable -- 277
	local _base_0 = { -- 277
		PrintName = "Tools Crate", -- 279
		Model = "models/items/ammocrate_ar2.mdl", -- 281
		Description = "A old crate that was once filled with tools, hopefully some were left behind for you.", -- 283
		LootMax = 1, -- 284
		TimeToUse = 6, -- 286
		AccumulateInterval = 540, -- 288
		LootTable = { -- 289
			"evilrp_melee/pipe", -- 289
			"evilrp_melee/pipe", -- 290
			"evilrp_melee/pipe", -- 291
			"evilrp_melee/pipe", -- 292
			"evilrp_melee/pipe", -- 293
			"evilrp_melee/pot", -- 294
			"evilrp_melee/pot", -- 295
			"evilrp_melee/pot", -- 296
			"evilrp_melee/pan", -- 297
			"evilrp_melee/axe", -- 298
			"item/food/boot", -- 299
			"item/food/boot", -- 300
			"item/food/boot", -- 301
			"trash/bottle", -- 302
			"trash/bottle", -- 303
			"trash/bottle", -- 304
			"trash/bottle/fearbeer", -- 305
			"item/food/paper", -- 306
			"item/food/paper", -- 307
			"item/food/paper", -- 308
			"trash/plastic/bleach", -- 309
			"item/loot/rustkill", -- 310
			"item/loot/rustkill", -- 311
			"item/loot/rustkill", -- 312
			"item/loot/rustkill", -- 313
			"item/loot/rustkill", -- 314
			"item/loot/rustkill" -- 315
		} -- 277
	} -- 277
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 315
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 277
			_base_0[_key_0] = _val_0 -- 277
		end -- 277
	end -- 315
	if _base_0.__index == nil then -- 277
		_base_0.__index = _base_0 -- 277
	end -- 315
	setmetatable(_base_0, _parent_0.__base) -- 277
	_class_0 = setmetatable({ -- 277
		__init = function(self, ...) -- 277
			return _class_0.__parent.__init(self, ...) -- 277
		end, -- 277
		__base = _base_0, -- 277
		__name = "Crate", -- 277
		__parent = _parent_0 -- 277
	}, { -- 277
		__index = function(cls, name) -- 277
			local val = rawget(_base_0, name) -- 277
			if val == nil then -- 277
				local parent = rawget(cls, "__parent") -- 277
				if parent then -- 277
					return parent[name] -- 277
				end -- 277
			else -- 277
				return val -- 277
			end -- 277
		end, -- 277
		__call = function(cls, ...) -- 277
			local _self_0 = setmetatable({ }, _base_0) -- 277
			cls.__init(_self_0, ...) -- 277
			return _self_0 -- 277
		end -- 277
	}) -- 277
	_base_0.__class = _class_0 -- 277
	if _parent_0.__inherited then -- 277
		_parent_0.__inherited(_parent_0, _class_0) -- 277
	end -- 277
	Crate = _class_0 -- 277
end -- 315
local Locker -- 318
do -- 318
	local _class_0 -- 318
	local _parent_0 = Lootable -- 318
	local _base_0 = { -- 318
		PrintName = "Antique Locker", -- 321
		Description = "A locker, washed up from some ancient, forgotten battle. ", -- 323
		Model = "models/props_c17/lockers001a.mdl", -- 324
		LootMax = 3, -- 325
		TimeToUse = 12, -- 327
		AccumulateInterval = 360, -- 329
		LootTable = { -- 330
			"evilrp_weapon/obrez", -- 330
			"item/food/paper", -- 331
			"item/food/paper", -- 332
			"item/food/boot", -- 333
			"item/food/boot", -- 334
			"item/food/boot", -- 335
			"item/drug/rotmelange", -- 336
			"trash/bottle", -- 337
			"trash/bottle", -- 338
			"item/food/drink/fearbeer", -- 339
			"item/food/drink/fearbeer", -- 340
			"trash/plastic/shake", -- 341
			"trash/plastic/shake", -- 342
			"trash/plastic/pills", -- 343
			"trash/plastic/bleach", -- 344
			"evilrp_weapon/greaser", -- 345
			"item/food/slopskull", -- 346
			"item/food/slopskull", -- 347
			"item/food/slopskull", -- 348
			"item/food/ribbone", -- 349
			"item/food/ribbone", -- 350
			"item/food/ribbone", -- 351
			"item/loot/rustkill", -- 352
			"item/loot/rustkill" -- 353
		} -- 318
	} -- 318
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 353
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 318
			_base_0[_key_0] = _val_0 -- 318
		end -- 318
	end -- 353
	if _base_0.__index == nil then -- 318
		_base_0.__index = _base_0 -- 318
	end -- 353
	setmetatable(_base_0, _parent_0.__base) -- 318
	_class_0 = setmetatable({ -- 318
		__init = function(self, ...) -- 318
			return _class_0.__parent.__init(self, ...) -- 318
		end, -- 318
		__base = _base_0, -- 318
		__name = "Locker", -- 318
		__parent = _parent_0 -- 318
	}, { -- 318
		__index = function(cls, name) -- 318
			local val = rawget(_base_0, name) -- 318
			if val == nil then -- 318
				local parent = rawget(cls, "__parent") -- 318
				if parent then -- 318
					return parent[name] -- 318
				end -- 318
			else -- 318
				return val -- 318
			end -- 318
		end, -- 318
		__call = function(cls, ...) -- 318
			local _self_0 = setmetatable({ }, _base_0) -- 318
			cls.__init(_self_0, ...) -- 318
			return _self_0 -- 318
		end -- 318
	}) -- 318
	_base_0.__class = _class_0 -- 318
	if _parent_0.__inherited then -- 318
		_parent_0.__inherited(_parent_0, _class_0) -- 318
	end -- 318
	Locker = _class_0 -- 318
end -- 353
local Chest -- 356
do -- 356
	local _class_0 -- 356
	local _parent_0 = Lootable -- 356
	local _base_0 = { -- 356
		PrintName = "Rotten Chest", -- 359
		Description = "A wooden chest, the surface is covered with maggots.", -- 361
		Model = "models/props_forest/footlocker01_closed.mdl", -- 362
		LootMax = 2, -- 363
		TimeToUse = 20, -- 365
		LootTable = { -- 366
			"item/food/paper", -- 366
			"item/food/paper", -- 367
			"item/drug/rotmelange", -- 368
			"trash/bottle", -- 369
			"trash/bottle", -- 370
			"trash/bottle", -- 371
			"trash/plastic/shake", -- 372
			"trash/plastic/shake", -- 373
			"trash/plastic/shake", -- 374
			"trash/plastic/pills", -- 375
			"trash/plastic/pills", -- 376
			"trash/plastic/pills", -- 377
			"trash/plastic/bleach", -- 378
			"item/food/abortion", -- 379
			"item/food/abortion", -- 380
			"item/food/abortion", -- 381
			"item/food/slopskull", -- 382
			"item/food/slopskull", -- 383
			"item/food/slopskull", -- 384
			"item/food/slopskull", -- 385
			"item/food/slopskull", -- 386
			"item/food/ribbone", -- 387
			"item/food/ribbone", -- 388
			"item/food/ribbone", -- 389
			"trash/bottle/fearbeer", -- 390
			"trash/bottle/fearbeer", -- 391
			"item/food/drink/fearbeer", -- 392
			"item/food/drink/fearbeer", -- 393
			"item/food/drink/smearbeer", -- 394
			"item/food/drink/smearbeer", -- 395
			"item/food/drink/shake", -- 396
			"item/food/drink/shake", -- 397
			"item/food/loaf", -- 398
			"item/food/loaf", -- 399
			"item/food/loaf", -- 400
			"item/loot/rustkill", -- 401
			"item/loot/rustkill", -- 402
			"item/loot/rustkill" -- 403
		} -- 356
	} -- 356
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 403
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 356
			_base_0[_key_0] = _val_0 -- 356
		end -- 356
	end -- 403
	if _base_0.__index == nil then -- 356
		_base_0.__index = _base_0 -- 356
	end -- 403
	setmetatable(_base_0, _parent_0.__base) -- 356
	_class_0 = setmetatable({ -- 356
		__init = function(self, ...) -- 356
			return _class_0.__parent.__init(self, ...) -- 356
		end, -- 356
		__base = _base_0, -- 356
		__name = "Chest", -- 356
		__parent = _parent_0 -- 356
	}, { -- 356
		__index = function(cls, name) -- 356
			local val = rawget(_base_0, name) -- 356
			if val == nil then -- 356
				local parent = rawget(cls, "__parent") -- 356
				if parent then -- 356
					return parent[name] -- 356
				end -- 356
			else -- 356
				return val -- 356
			end -- 356
		end, -- 356
		__call = function(cls, ...) -- 356
			local _self_0 = setmetatable({ }, _base_0) -- 356
			cls.__init(_self_0, ...) -- 356
			return _self_0 -- 356
		end -- 356
	}) -- 356
	_base_0.__class = _class_0 -- 356
	if _parent_0.__inherited then -- 356
		_parent_0.__inherited(_parent_0, _class_0) -- 356
	end -- 356
	Chest = _class_0 -- 356
end -- 403
local Cache -- 405
do -- 405
	local _class_0 -- 405
	local _parent_0 = Lootable -- 405
	local _base_0 = { -- 405
		PrintName = "Abandoned Cache", -- 408
		Description = "Someone left this in a hurry, it has foreign markings.", -- 410
		Model = "models/props/de_prodigy/ammo_can_01.mdl", -- 411
		LootMax = 2, -- 412
		TimeToUse = 15, -- 413
		AccumulateInterval = 200, -- 415
		LootTable = { -- 416
			"item/food/paper", -- 416
			"item/drug/rotmelange", -- 417
			"trash/bottle", -- 418
			"trash/plastic/shake", -- 419
			"trash/plastic/pills", -- 420
			"trash/plastic/bleach", -- 421
			"trash/bottle/fearbeer", -- 422
			"item/food/drink/fearbeer", -- 423
			"item/food/drink/smearbeer", -- 424
			"item/food/drink/smearbeer", -- 425
			"evilrp_weapon/greaser", -- 426
			"evilrp_weapon/greaser", -- 427
			"evilrp_weapon/prettyboy", -- 428
			"evilrp_weapon/prettyboy", -- 429
			"evilrp_weapon/prettyboy", -- 430
			"evilrp_weapon/prettyboy", -- 431
			"evilrp_melee/shovel", -- 432
			"evilrp_melee/shovel", -- 433
			"evilrp_melee/shovel", -- 434
			"evilrp_melee/shovel", -- 435
			"evilrp_melee/shovel", -- 436
			"evilrp_weapon/hope", -- 437
			"evilrp_weapon/hope", -- 438
			"evilrp_weapon/hope", -- 439
			"evilrp_weapon/hope", -- 440
			"evilrp_weapon/owler", -- 441
			"item/food/eyeballnoodles", -- 442
			"item/food/eyeballnoodles", -- 443
			"item/loot/spareammo", -- 444
			"item/loot/spareammo", -- 445
			"item/loot/spareammo", -- 446
			"item/loot/spareammo", -- 447
			"item/loot/spareammo", -- 448
			"item/loot/spareammo", -- 449
			"item/loot/spareammo", -- 450
			"item/loot/spareammo" -- 451
		} -- 405
	} -- 405
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 451
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 405
			_base_0[_key_0] = _val_0 -- 405
		end -- 405
	end -- 451
	if _base_0.__index == nil then -- 405
		_base_0.__index = _base_0 -- 405
	end -- 451
	setmetatable(_base_0, _parent_0.__base) -- 405
	_class_0 = setmetatable({ -- 405
		__init = function(self, ...) -- 405
			return _class_0.__parent.__init(self, ...) -- 405
		end, -- 405
		__base = _base_0, -- 405
		__name = "Cache", -- 405
		__parent = _parent_0 -- 405
	}, { -- 405
		__index = function(cls, name) -- 405
			local val = rawget(_base_0, name) -- 405
			if val == nil then -- 405
				local parent = rawget(cls, "__parent") -- 405
				if parent then -- 405
					return parent[name] -- 405
				end -- 405
			else -- 405
				return val -- 405
			end -- 405
		end, -- 405
		__call = function(cls, ...) -- 405
			local _self_0 = setmetatable({ }, _base_0) -- 405
			cls.__init(_self_0, ...) -- 405
			return _self_0 -- 405
		end -- 405
	}) -- 405
	_base_0.__class = _class_0 -- 405
	if _parent_0.__inherited then -- 405
		_parent_0.__inherited(_parent_0, _class_0) -- 405
	end -- 405
	Cache = _class_0 -- 405
	return _class_0 -- 451
end -- 451
