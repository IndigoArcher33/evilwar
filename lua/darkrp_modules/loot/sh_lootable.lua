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
				local sad = math.random(1, 2) -- 132
				local plyJob = RPExtraTeams[ply:Team()] -- 133
				if plyJob.category == "Wasteland" then -- 134
					sad = sad * 0 -- 134
				end -- 134
				if ply:HasOddity(ODDITY_DEPRESSION) then -- 135
					sad = sad * 2 -- 135
				end -- 135
				ply:AddDespair(sad) -- 136
				if (self:GetRemaining() <= 0) and math.random(3) == 2 then -- 137
					noticed_empty = true -- 137
				end -- 137
			elseif 5 == roll then -- 138
				col = "200,0,0" -- 139
				msgs = self.LootMessages.damage -- 140
				local dmg = DamageInfo() -- 141
				dmg:SetDamageType(DMG_SLASH) -- 143
				dmg:SetDamage(math.random(5, 10)) -- 144
				dmg:SetAttacker(ply) -- 145
				dmg:SetInflictor(self) -- 146
				self:EmitSound("npc/headcrab/headbite.wav") -- 147
				ply:TakeDamageInfo(dmg) -- 148
				self:SetUser(NULL) -- 149
				self:SetEndTime(0) -- 150
				self.PartialUse = 0 -- 151
			end -- 151
			ply:PlaySignal(ACT_GMOD_GESTURE_RANGE_FRENZY, true) -- 152
			self:EmitSound("LootSound") -- 153
			ply:Notify(tostring(tags) .. "<c=" .. tostring(col) .. ">" .. tostring(msgs[math.random(#msgs)])) -- 154
			if noticed_empty then -- 155
				ply:Notify("I don't think anything worth finding is in there.") -- 156
				self:SetUser(NULL) -- 157
				self:SetEndTime(0) -- 158
				self.PartialUse = 0 -- 159
			end -- 155
		end, -- 161
		Loot = function(self, ply) -- 161
			if not SERVER then -- 162
				return -- 162
			end -- 162
			local start = ply:EyePos() -- 163
			local tr = util.TraceLine({ -- 165
				start = start, -- 165
				endpos = start + ply:GetAimVector() * 85, -- 166
				filter = ply -- 167
			}) -- 164
			local cls = self.LootTable[random(1, #self.LootTable)] -- 169
			local wep = weapons.Get(cls) -- 170
			local loot -- 171
			if wep then -- 172
				loot = ents.Create("evilrp/spawned/weapon") -- 173
				print("spawning weapon " .. tostring(cls)) -- 174
				loot:SetModel(wep.WorldModel) -- 176
				loot:SetWeaponClass(cls) -- 177
				loot:Spawn() -- 178
				loot:Activate() -- 179
			else -- 181
				loot = ents.Create(cls) -- 181
				loot:Spawn() -- 183
				loot:Activate() -- 184
			end -- 172
			DarkRP.placeEntity(loot, tr, ply) -- 185
			return self:SetRemaining(self:GetRemaining() - 1) -- 186
		end, -- 188
		PartialUses = { -- 189
			{ -- 189
				prog = 20, -- 189
				func = function(self, ply) -- 190
					return self:AttemptLoot(ply) -- 190
				end -- 190
			}, -- 189
			{ -- 191
				prog = 40, -- 191
				func = function(self, ply) -- 192
					return self:AttemptLoot(ply) -- 192
				end -- 192
			}, -- 191
			{ -- 193
				prog = 60, -- 193
				func = function(self, ply) -- 194
					return self:AttemptLoot(ply) -- 194
				end -- 194
			}, -- 193
			{ -- 195
				prog = 80, -- 195
				func = function(self, ply) -- 196
					return self:AttemptLoot(ply) -- 196
				end -- 196
			}, -- 195
			{ -- 197
				prog = 100, -- 197
				func = function(self, ply) -- 198
					return self:AttemptLoot(ply) -- 198
				end -- 198
			} -- 197
		}, -- 200
		Think = function(self) -- 200
			_class_0.__parent.__base.Think(self) -- 201
			local ct = CurTime() -- 202
			self.next_accumulate = self.next_accumulate or (ct + self.AccumulateInterval) -- 203
			if ct >= self.next_accumulate then -- 204
				self.next_accumulate = ct + self.AccumulateInterval -- 205
				local remaining = self:GetRemaining() -- 206
				if remaining < self.LootMax and math.random(5) == 3 then -- 207
					return self:SetRemaining(remaining + 1) -- 207
				end -- 207
			end -- 204
		end, -- 209
		Draw = function(self) -- 209
			return self:DrawModel() -- 209
		end, -- 211
		HUDRender = function(self) -- 211
			local ct = { } -- 212
			ct[#ct + 1] = self.PrintName -- 213
			if self.Description then -- 214
				ct[#ct + 1] = "" -- 215
				ct[#ct + 1] = { -- 216
					text = self.Description, -- 216
					font = "Spleen_Label_Small" -- 216
				} -- 216
				ct[#ct + 1] = { -- 217
					text = "There might be treasure inside.", -- 217
					font = "Spleen_Label_Small" -- 217
				} -- 217
			end -- 214
			return ct -- 218
		end, -- 220
		Interactions = { -- 221
			{ -- 221
				desc = "Huh?", -- 221
				func = (function() -- 221
					return lp:SendChat("GENERIC", "This is a source of mysterious, replenishing treasure.\n<f=Spleen_Chat_Small>Hold the USE key to search for goodies.\nIt might hurt your hand, though.") -- 223
				end) -- 221
			} -- 221
		} -- 23
	} -- 23
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 223
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 23
			_base_0[_key_0] = _val_0 -- 23
		end -- 23
	end -- 223
	if _base_0.__index == nil then -- 23
		_base_0.__index = _base_0 -- 23
	end -- 223
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
end -- 223
local Dumpster -- 225
do -- 225
	local _class_0 -- 225
	local _parent_0 = Lootable -- 225
	local _base_0 = { -- 225
		PrintName = "Dumpster", -- 228
		Description = "It's metal, it's green, and it reeks.", -- 230
		Model = "models/props_junk/TrashDumpster01a.mdl", -- 232
		LootTable = { -- 233
			"item/food/slopskull", -- 233
			"item/food/slopskull", -- 234
			"item/food/slopskull", -- 235
			"item/food/slopskull", -- 236
			"item/food/slopskull", -- 237
			"item/food/slopskull", -- 238
			"item/food/ribbone", -- 239
			"item/food/ribbone", -- 240
			"item/food/ribbone", -- 241
			"item/food/ribbone", -- 242
			"item/food/paper", -- 243
			"item/food/paper", -- 244
			"item/food/paper", -- 245
			"item/food/paper", -- 246
			"item/food/boot", -- 247
			"item/food/boot", -- 248
			"item/food/boot", -- 249
			"item/food/boot", -- 250
			"item/food/abortion", -- 251
			"item/food/abortion", -- 252
			"item/food/abortion", -- 253
			"item/food/abortion", -- 254
			"item/food/abortion", -- 255
			"item/food/drink/fearbeer", -- 256
			"item/food/drink/smearbeer", -- 257
			"trash/bottle", -- 258
			"trash/bottle", -- 259
			"trash/bottle", -- 260
			"trash/bottle/fearbeer", -- 261
			"trash/bottle/fearbeer", -- 262
			"trash/bottle/fearbeer", -- 263
			"trash/bottle/fearbeer", -- 264
			"trash/plastic/shake", -- 265
			"trash/plastic/shake", -- 266
			"trash/plastic/shake", -- 267
			"trash/plastic/shake", -- 268
			"trash/plastic/pills", -- 269
			"trash/plastic/pills", -- 270
			"trash/plastic/pills", -- 271
			"trash/plastic/bleach", -- 272
			"trash/plastic/bleach", -- 273
			"trash/plastic/bleach", -- 274
			"trash/inhaler", -- 275
			"trash/inhaler", -- 276
			"trash/inhaler" -- 277
		} -- 225
	} -- 225
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 277
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 225
			_base_0[_key_0] = _val_0 -- 225
		end -- 225
	end -- 277
	if _base_0.__index == nil then -- 225
		_base_0.__index = _base_0 -- 225
	end -- 277
	setmetatable(_base_0, _parent_0.__base) -- 225
	_class_0 = setmetatable({ -- 225
		__init = function(self, ...) -- 225
			return _class_0.__parent.__init(self, ...) -- 225
		end, -- 225
		__base = _base_0, -- 225
		__name = "Dumpster", -- 225
		__parent = _parent_0 -- 225
	}, { -- 225
		__index = function(cls, name) -- 225
			local val = rawget(_base_0, name) -- 225
			if val == nil then -- 225
				local parent = rawget(cls, "__parent") -- 225
				if parent then -- 225
					return parent[name] -- 225
				end -- 225
			else -- 225
				return val -- 225
			end -- 225
		end, -- 225
		__call = function(cls, ...) -- 225
			local _self_0 = setmetatable({ }, _base_0) -- 225
			cls.__init(_self_0, ...) -- 225
			return _self_0 -- 225
		end -- 225
	}) -- 225
	_base_0.__class = _class_0 -- 225
	if _parent_0.__inherited then -- 225
		_parent_0.__inherited(_parent_0, _class_0) -- 225
	end -- 225
	Dumpster = _class_0 -- 225
end -- 277
local Crate -- 279
do -- 279
	local _class_0 -- 279
	local _parent_0 = Lootable -- 279
	local _base_0 = { -- 279
		PrintName = "Tools Crate", -- 281
		Model = "models/items/ammocrate_ar2.mdl", -- 283
		Description = "A old crate that was once filled with tools, hopefully some were left behind for you.", -- 285
		LootMax = 2, -- 286
		TimeToUse = 6, -- 288
		AccumulateInterval = 540, -- 290
		LootTable = { -- 291
			"evilrp_melee/pipe", -- 291
			"evilrp_melee/pipe", -- 292
			"evilrp_melee/pipe", -- 293
			"evilrp_melee/pipe", -- 294
			"evilrp_melee/pipe", -- 295
			"evilrp_melee/pot", -- 296
			"evilrp_melee/pot", -- 297
			"evilrp_melee/pot", -- 298
			"evilrp_melee/pan", -- 299
			"item/food/boot", -- 300
			"item/food/boot", -- 301
			"trash/bottle", -- 302
			"trash/bottle", -- 303
			"trash/bottle", -- 304
			"trash/bottle/fearbeer", -- 305
			"item/food/paper", -- 306
			"trash/plastic/bleach", -- 307
			"item/loot/rustkill", -- 308
			"item/loot/rustkill" -- 309
		} -- 279
	} -- 279
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 309
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 279
			_base_0[_key_0] = _val_0 -- 279
		end -- 279
	end -- 309
	if _base_0.__index == nil then -- 279
		_base_0.__index = _base_0 -- 279
	end -- 309
	setmetatable(_base_0, _parent_0.__base) -- 279
	_class_0 = setmetatable({ -- 279
		__init = function(self, ...) -- 279
			return _class_0.__parent.__init(self, ...) -- 279
		end, -- 279
		__base = _base_0, -- 279
		__name = "Crate", -- 279
		__parent = _parent_0 -- 279
	}, { -- 279
		__index = function(cls, name) -- 279
			local val = rawget(_base_0, name) -- 279
			if val == nil then -- 279
				local parent = rawget(cls, "__parent") -- 279
				if parent then -- 279
					return parent[name] -- 279
				end -- 279
			else -- 279
				return val -- 279
			end -- 279
		end, -- 279
		__call = function(cls, ...) -- 279
			local _self_0 = setmetatable({ }, _base_0) -- 279
			cls.__init(_self_0, ...) -- 279
			return _self_0 -- 279
		end -- 279
	}) -- 279
	_base_0.__class = _class_0 -- 279
	if _parent_0.__inherited then -- 279
		_parent_0.__inherited(_parent_0, _class_0) -- 279
	end -- 279
	Crate = _class_0 -- 279
end -- 309
local Locker -- 313
do -- 313
	local _class_0 -- 313
	local _parent_0 = Lootable -- 313
	local _base_0 = { -- 313
		PrintName = "Antique Locker", -- 316
		Description = "A locker, washed up from some ancient, forgotten battle. ", -- 318
		Model = "models/props_c17/lockers001a.mdl", -- 319
		LootMax = 3, -- 320
		TimeToUse = 12, -- 322
		AccumulateInterval = 360, -- 324
		LootTable = { -- 325
			"evilrp_weapon/obrez", -- 325
			"evilrp_weapon/obrez", -- 326
			"item/food/paper", -- 327
			"item/food/boot", -- 328
			"item/drug/rotmelange", -- 329
			"trash/bottle", -- 330
			"trash/bottle", -- 331
			"item/food/drink/fearbeer", -- 332
			"item/food/drink/fearbeer", -- 333
			"trash/plastic/shake", -- 334
			"evilrp_weapon/prettyboy", -- 335
			"evilrp_weapon/prettyboy", -- 336
			"trash/plastic/bleach", -- 337
			"evilrp_weapon/greaser", -- 338
			"item/food/slopskull", -- 339
			"item/food/slopskull", -- 340
			"item/food/slopskull", -- 341
			"item/food/ribbone", -- 342
			"item/food/ribbone", -- 343
			"item/food/ribbone", -- 344
			"item/loot/rustkill", -- 345
			"item/loot/rustkill" -- 346
		} -- 313
	} -- 313
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 346
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 313
			_base_0[_key_0] = _val_0 -- 313
		end -- 313
	end -- 346
	if _base_0.__index == nil then -- 313
		_base_0.__index = _base_0 -- 313
	end -- 346
	setmetatable(_base_0, _parent_0.__base) -- 313
	_class_0 = setmetatable({ -- 313
		__init = function(self, ...) -- 313
			return _class_0.__parent.__init(self, ...) -- 313
		end, -- 313
		__base = _base_0, -- 313
		__name = "Locker", -- 313
		__parent = _parent_0 -- 313
	}, { -- 313
		__index = function(cls, name) -- 313
			local val = rawget(_base_0, name) -- 313
			if val == nil then -- 313
				local parent = rawget(cls, "__parent") -- 313
				if parent then -- 313
					return parent[name] -- 313
				end -- 313
			else -- 313
				return val -- 313
			end -- 313
		end, -- 313
		__call = function(cls, ...) -- 313
			local _self_0 = setmetatable({ }, _base_0) -- 313
			cls.__init(_self_0, ...) -- 313
			return _self_0 -- 313
		end -- 313
	}) -- 313
	_base_0.__class = _class_0 -- 313
	if _parent_0.__inherited then -- 313
		_parent_0.__inherited(_parent_0, _class_0) -- 313
	end -- 313
	Locker = _class_0 -- 313
end -- 346
local Chest -- 349
do -- 349
	local _class_0 -- 349
	local _parent_0 = Lootable -- 349
	local _base_0 = { -- 349
		PrintName = "Rotten Chest", -- 352
		Description = "A wooden chest, the surface is covered with maggots.", -- 354
		Model = "models/props_forest/footlocker01_closed.mdl", -- 355
		LootMax = 2, -- 356
		TimeToUse = 20, -- 358
		LootTable = { -- 359
			"item/food/paper", -- 359
			"item/food/paper", -- 360
			"item/drug/rotmelange", -- 361
			"trash/bottle", -- 362
			"trash/bottle", -- 363
			"trash/bottle", -- 364
			"trash/plastic/shake", -- 365
			"trash/plastic/shake", -- 366
			"trash/plastic/shake", -- 367
			"trash/plastic/pills", -- 368
			"trash/plastic/pills", -- 369
			"trash/plastic/pills", -- 370
			"trash/plastic/bleach", -- 371
			"item/food/abortion", -- 372
			"item/food/abortion", -- 373
			"item/food/abortion", -- 374
			"item/food/slopskull", -- 375
			"item/food/slopskull", -- 376
			"item/food/slopskull", -- 377
			"item/food/slopskull", -- 378
			"item/food/slopskull", -- 379
			"item/food/ribbone", -- 380
			"item/food/ribbone", -- 381
			"item/food/ribbone", -- 382
			"trash/bottle/fearbeer", -- 383
			"trash/bottle/fearbeer", -- 384
			"item/food/drink/fearbeer", -- 385
			"item/food/drink/fearbeer", -- 386
			"item/food/drink/smearbeer", -- 387
			"item/food/drink/smearbeer", -- 388
			"item/food/drink/shake", -- 389
			"item/food/drink/shake", -- 390
			"item/food/loaf", -- 391
			"item/food/loaf", -- 392
			"item/food/loaf", -- 393
			"item/loot/rustkill", -- 394
			"item/loot/rustkill", -- 395
			"item/loot/rustkill" -- 396
		} -- 349
	} -- 349
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 396
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 349
			_base_0[_key_0] = _val_0 -- 349
		end -- 349
	end -- 396
	if _base_0.__index == nil then -- 349
		_base_0.__index = _base_0 -- 349
	end -- 396
	setmetatable(_base_0, _parent_0.__base) -- 349
	_class_0 = setmetatable({ -- 349
		__init = function(self, ...) -- 349
			return _class_0.__parent.__init(self, ...) -- 349
		end, -- 349
		__base = _base_0, -- 349
		__name = "Chest", -- 349
		__parent = _parent_0 -- 349
	}, { -- 349
		__index = function(cls, name) -- 349
			local val = rawget(_base_0, name) -- 349
			if val == nil then -- 349
				local parent = rawget(cls, "__parent") -- 349
				if parent then -- 349
					return parent[name] -- 349
				end -- 349
			else -- 349
				return val -- 349
			end -- 349
		end, -- 349
		__call = function(cls, ...) -- 349
			local _self_0 = setmetatable({ }, _base_0) -- 349
			cls.__init(_self_0, ...) -- 349
			return _self_0 -- 349
		end -- 349
	}) -- 349
	_base_0.__class = _class_0 -- 349
	if _parent_0.__inherited then -- 349
		_parent_0.__inherited(_parent_0, _class_0) -- 349
	end -- 349
	Chest = _class_0 -- 349
end -- 396
local Cache -- 398
do -- 398
	local _class_0 -- 398
	local _parent_0 = Lootable -- 398
	local _base_0 = { -- 398
		PrintName = "Abandoned Cache", -- 401
		Description = "Someone left this in a hurry, it has foreign markings.", -- 403
		Model = "models/props/de_prodigy/ammo_can_01.mdl", -- 404
		LootMax = 2, -- 405
		TimeToUse = 15, -- 406
		AccumulateInterval = 200, -- 408
		LootTable = { -- 409
			"item/food/paper", -- 409
			"item/drug/rotmelange", -- 410
			"trash/bottle", -- 411
			"trash/plastic/shake", -- 412
			"trash/plastic/pills", -- 413
			"trash/plastic/bleach", -- 414
			"trash/bottle/fearbeer", -- 415
			"item/food/drink/fearbeer", -- 416
			"item/food/drink/smearbeer", -- 417
			"item/food/drink/smearbeer", -- 418
			"evilrp_weapon/greaser", -- 419
			"evilrp_weapon/greaser", -- 420
			"evilrp_weapon/prettyboy", -- 421
			"evilrp_weapon/prettyboy", -- 422
			"evilrp_weapon/prettyboy", -- 423
			"evilrp_weapon/prettyboy", -- 424
			"evilrp_melee/shovel", -- 425
			"evilrp_melee/shovel", -- 426
			"evilrp_melee/shovel", -- 427
			"evilrp_melee/shovel", -- 428
			"evilrp_melee/shovel", -- 429
			"evilrp_weapon/hope", -- 430
			"evilrp_weapon/hope", -- 431
			"evilrp_weapon/hope", -- 432
			"evilrp_weapon/hope", -- 433
			"evilrp_weapon/owler", -- 434
			"item/food/eyeballnoodles", -- 435
			"item/food/eyeballnoodles", -- 436
			"item/loot/spareammo", -- 437
			"item/loot/spareammo", -- 438
			"item/loot/spareammo", -- 439
			"item/loot/spareammo", -- 440
			"item/loot/spareammo", -- 441
			"item/loot/spareammo", -- 442
			"item/loot/spareammo", -- 443
			"item/loot/spareammo" -- 444
		} -- 398
	} -- 398
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 444
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 398
			_base_0[_key_0] = _val_0 -- 398
		end -- 398
	end -- 444
	if _base_0.__index == nil then -- 398
		_base_0.__index = _base_0 -- 398
	end -- 444
	setmetatable(_base_0, _parent_0.__base) -- 398
	_class_0 = setmetatable({ -- 398
		__init = function(self, ...) -- 398
			return _class_0.__parent.__init(self, ...) -- 398
		end, -- 398
		__base = _base_0, -- 398
		__name = "Cache", -- 398
		__parent = _parent_0 -- 398
	}, { -- 398
		__index = function(cls, name) -- 398
			local val = rawget(_base_0, name) -- 398
			if val == nil then -- 398
				local parent = rawget(cls, "__parent") -- 398
				if parent then -- 398
					return parent[name] -- 398
				end -- 398
			else -- 398
				return val -- 398
			end -- 398
		end, -- 398
		__call = function(cls, ...) -- 398
			local _self_0 = setmetatable({ }, _base_0) -- 398
			cls.__init(_self_0, ...) -- 398
			return _self_0 -- 398
		end -- 398
	}) -- 398
	_base_0.__class = _class_0 -- 398
	if _parent_0.__inherited then -- 398
		_parent_0.__inherited(_parent_0, _class_0) -- 398
	end -- 398
	Cache = _class_0 -- 398
	return _class_0 -- 444
end -- 444
