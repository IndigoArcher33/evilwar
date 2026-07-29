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
			if not self.GetRemaining then -- 59
				self:NetworkVar("Int", "Remaining") -- 60
				return self:NetworkVar("String", "LootName") -- 61
			end -- 59
		end, -- 63
		Initialize = function(self) -- 63
			if CLIENT then -- 64
				return -- 64
			end -- 64
			self:SetModel(self.Model) -- 65
			self:SetUseType(SIMPLE_USE) -- 66
			self:PhysicsInit(SOLID_VPHYSICS) -- 67
			local phys = self:GetPhysicsObject() -- 68
			if phys and phys:IsValid() then -- 69
				phys:Wake() -- 69
			end -- 69
			return self:SetRemaining(self.LootMax) -- 70
		end, -- 72
		LootMessages = { -- 73
			success = { -- 74
				"I found something.", -- 74
				"Aha.", -- 75
				"Nice.", -- 76
				"This might be useful.", -- 77
				"What have we here?", -- 78
				"Oh? ...oh!", -- 79
				"Hmm!" -- 80
			}, -- 73
			failure = { -- 82
				"Hmph.", -- 82
				"That's not helpful.", -- 83
				"Moving on...", -- 84
				"Oh? ...oh.", -- 85
				"Mmm.", -- 86
				"C'mon.", -- 87
				"Hmm...", -- 88
				"Ew.", -- 89
				"Filthy...", -- 90
				"Yuck.", -- 91
				"Gra-a." -- 92
			}, -- 81
			damage = { -- 94
				"Ow!", -- 94
				"Ouch!", -- 95
				"Ow, dammit!", -- 96
				"Agh, shit!", -- 97
				"SHARP! Ow.", -- 98
				"Ow, pointy!", -- 99
				"Eww, slimy!", -- 100
				"Uh oh, moving!" -- 101
			}, -- 93
			refusal = { -- 103
				"I don't feel like it.", -- 103
				"I'm not digging through trash while I feel like trash.", -- 104
				"I have better things to do.", -- 105
				"I'm dealing with enough as it is." -- 106
			} -- 102
		}, -- 108
		OnUseStart = function(self, ply) -- 108
			local desp = ply:GetDespair() -- 109
			if desp > 80 then -- 110
				local msgs = self.LootMessages.refusal -- 111
				ply:Notify("<c=200,0,0>" .. tostring(msgs[math.random(#msgs)])) -- 112
				net.Start("evilrp_frighten") -- 113
				net.Send(ply) -- 114
				return false -- 115
			end -- 110
		end, -- 117
		AttemptLoot = function(self, ply) -- 117
			if not SERVER then -- 118
				return -- 118
			end -- 118
			local tags = "" -- 119
			local col -- 120
			local msgs -- 121
			local roll = math.random(4) -- 122
			if self:GetRemaining() <= 0 then -- 123
				roll = roll + 1 -- 123
			end -- 123
			local noticed_empty = false -- 124
			if 1 == roll or 2 == roll then -- 126
				col = "0,200,0" -- 127
				msgs = self.LootMessages.success -- 128
				self:Loot(ply) -- 129
			elseif 3 == roll or 4 == roll then -- 130
				col = "200,200,0" -- 131
				msgs = self.LootMessages.failure -- 132
				local sad = math.random(1, 2) -- 133
				local plyJob = RPExtraTeams[ply:Team()] -- 134
				if plyJob.category == "Wasteland" then -- 135
					sad = sad * 0 -- 135
				end -- 135
				if ply:HasOddity(ODDITY_DEPRESSION) then -- 136
					sad = sad * 2 -- 136
				end -- 136
				ply:AddDespair(sad) -- 137
				if (self:GetRemaining() <= 0) and math.random(3) == 2 then -- 138
					noticed_empty = true -- 138
				end -- 138
			elseif 5 == roll then -- 139
				col = "200,0,0" -- 140
				msgs = self.LootMessages.damage -- 141
				local dmg = DamageInfo() -- 142
				dmg:SetDamageType(DMG_SLASH) -- 144
				dmg:SetDamage(math.random(5, 10)) -- 145
				dmg:SetAttacker(ply) -- 146
				dmg:SetInflictor(self) -- 147
				self:EmitSound("npc/headcrab/headbite.wav") -- 148
				ply:TakeDamageInfo(dmg) -- 149
				self:SetUser(NULL) -- 150
				self:SetEndTime(0) -- 151
				self.PartialUse = 0 -- 152
			end -- 152
			ply:PlaySignal(ACT_GMOD_GESTURE_RANGE_FRENZY, true) -- 153
			self:EmitSound("LootSound") -- 154
			ply:Notify(tostring(tags) .. "<c=" .. tostring(col) .. ">" .. tostring(msgs[math.random(#msgs)])) -- 155
			if noticed_empty then -- 156
				ply:Notify("I don't think anything worth finding is in there.") -- 157
				self:SetUser(NULL) -- 158
				self:SetEndTime(0) -- 159
				self.PartialUse = 0 -- 160
			end -- 156
		end, -- 162
		Loot = function(self, ply) -- 162
			if not SERVER then -- 163
				return -- 163
			end -- 163
			local start = ply:EyePos() -- 164
			local tr = util.TraceLine({ -- 166
				start = start, -- 166
				endpos = start + ply:GetAimVector() * 85, -- 167
				filter = ply -- 168
			}) -- 165
			local cls = self.LootTable[random(1, #self.LootTable)] -- 170
			local wep = weapons.Get(cls) -- 171
			local loot -- 172
			if wep then -- 173
				loot = ents.Create("evilrp/spawned/weapon") -- 174
				print("spawning weapon " .. tostring(cls)) -- 175
				loot:SetModel(wep.WorldModel) -- 177
				loot:SetWeaponClass(cls) -- 178
				loot:Spawn() -- 179
				loot:Activate() -- 180
			else -- 182
				loot = ents.Create(cls) -- 182
				loot:Spawn() -- 184
				loot:Activate() -- 185
			end -- 173
			DarkRP.placeEntity(loot, tr, ply) -- 186
			return self:SetRemaining(self:GetRemaining() - 1) -- 187
		end, -- 189
		PartialUses = { -- 190
			{ -- 190
				prog = 20, -- 190
				func = function(self, ply) -- 191
					return self:AttemptLoot(ply) -- 191
				end -- 191
			}, -- 190
			{ -- 192
				prog = 40, -- 192
				func = function(self, ply) -- 193
					return self:AttemptLoot(ply) -- 193
				end -- 193
			}, -- 192
			{ -- 194
				prog = 60, -- 194
				func = function(self, ply) -- 195
					return self:AttemptLoot(ply) -- 195
				end -- 195
			}, -- 194
			{ -- 196
				prog = 80, -- 196
				func = function(self, ply) -- 197
					return self:AttemptLoot(ply) -- 197
				end -- 197
			}, -- 196
			{ -- 198
				prog = 100, -- 198
				func = function(self, ply) -- 199
					return self:AttemptLoot(ply) -- 199
				end -- 199
			} -- 198
		}, -- 201
		Think = function(self) -- 201
			_class_0.__parent.__base.Think(self) -- 202
			local ct = CurTime() -- 203
			self.next_accumulate = self.next_accumulate or (ct + self.AccumulateInterval) -- 204
			if ct >= self.next_accumulate then -- 205
				self.next_accumulate = ct + self.AccumulateInterval -- 206
				local remaining = self:GetRemaining() -- 207
				if remaining < self.LootMax and math.random(5) == 3 then -- 208
					return self:SetRemaining(remaining + 1) -- 208
				end -- 208
			end -- 205
		end, -- 210
		Draw = function(self) -- 210
			return self:DrawModel() -- 210
		end, -- 212
		HUDRender = function(self) -- 212
			local ct = { } -- 213
			ct[#ct + 1] = self.PrintName -- 214
			if self.Description then -- 215
				ct[#ct + 1] = "" -- 216
				ct[#ct + 1] = { -- 217
					text = self.Description, -- 217
					font = "Spleen_Label_Small" -- 217
				} -- 217
				ct[#ct + 1] = { -- 218
					text = "There might be treasure inside.", -- 218
					font = "Spleen_Label_Small" -- 218
				} -- 218
			end -- 215
			return ct -- 219
		end, -- 221
		Interactions = { -- 222
			{ -- 222
				desc = "Huh?", -- 222
				func = (function() -- 222
					return lp:SendChat("GENERIC", "This is a source of mysterious, replenishing treasure.\n<f=Spleen_Chat_Small>Hold the USE key to search for goodies.\nIt might hurt your hand, though.") -- 224
				end) -- 222
			} -- 222
		} -- 23
	} -- 23
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 224
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 23
			_base_0[_key_0] = _val_0 -- 23
		end -- 23
	end -- 224
	if _base_0.__index == nil then -- 23
		_base_0.__index = _base_0 -- 23
	end -- 224
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
end -- 224
local Dumpster -- 226
do -- 226
	local _class_0 -- 226
	local _parent_0 = Lootable -- 226
	local _base_0 = { -- 226
		PrintName = "Dumpster", -- 229
		Description = "It's metal, it's green, and it reeks.", -- 231
		Model = "models/props_junk/TrashDumpster01a.mdl", -- 233
		LootTable = { -- 234
			"item/food/slopskull", -- 234
			"item/food/slopskull", -- 235
			"item/food/slopskull", -- 236
			"item/food/slopskull", -- 237
			"item/food/slopskull", -- 238
			"item/food/slopskull", -- 239
			"item/food/ribbone", -- 240
			"item/food/ribbone", -- 241
			"item/food/ribbone", -- 242
			"item/food/ribbone", -- 243
			"item/food/paper", -- 244
			"item/food/paper", -- 245
			"item/food/paper", -- 246
			"item/food/paper", -- 247
			"item/food/boot", -- 248
			"item/food/boot", -- 249
			"item/food/boot", -- 250
			"item/food/boot", -- 251
			"item/food/abortion", -- 252
			"item/food/abortion", -- 253
			"item/food/abortion", -- 254
			"item/food/abortion", -- 255
			"item/food/abortion", -- 256
			"item/food/drink/fearbeer", -- 257
			"item/food/drink/smearbeer", -- 258
			"trash/bottle", -- 259
			"trash/bottle", -- 260
			"trash/bottle", -- 261
			"trash/bottle/fearbeer", -- 262
			"trash/bottle/fearbeer", -- 263
			"trash/bottle/fearbeer", -- 264
			"trash/bottle/fearbeer", -- 265
			"trash/plastic/shake", -- 266
			"trash/plastic/shake", -- 267
			"trash/plastic/shake", -- 268
			"trash/plastic/shake", -- 269
			"trash/plastic/pills", -- 270
			"trash/plastic/pills", -- 271
			"trash/plastic/pills", -- 272
			"trash/plastic/bleach", -- 273
			"trash/plastic/bleach", -- 274
			"trash/plastic/bleach", -- 275
			"trash/inhaler", -- 276
			"trash/inhaler", -- 277
			"trash/inhaler" -- 278
		} -- 226
	} -- 226
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 278
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 226
			_base_0[_key_0] = _val_0 -- 226
		end -- 226
	end -- 278
	if _base_0.__index == nil then -- 226
		_base_0.__index = _base_0 -- 226
	end -- 278
	setmetatable(_base_0, _parent_0.__base) -- 226
	_class_0 = setmetatable({ -- 226
		__init = function(self, ...) -- 226
			return _class_0.__parent.__init(self, ...) -- 226
		end, -- 226
		__base = _base_0, -- 226
		__name = "Dumpster", -- 226
		__parent = _parent_0 -- 226
	}, { -- 226
		__index = function(cls, name) -- 226
			local val = rawget(_base_0, name) -- 226
			if val == nil then -- 226
				local parent = rawget(cls, "__parent") -- 226
				if parent then -- 226
					return parent[name] -- 226
				end -- 226
			else -- 226
				return val -- 226
			end -- 226
		end, -- 226
		__call = function(cls, ...) -- 226
			local _self_0 = setmetatable({ }, _base_0) -- 226
			cls.__init(_self_0, ...) -- 226
			return _self_0 -- 226
		end -- 226
	}) -- 226
	_base_0.__class = _class_0 -- 226
	if _parent_0.__inherited then -- 226
		_parent_0.__inherited(_parent_0, _class_0) -- 226
	end -- 226
	Dumpster = _class_0 -- 226
end -- 278
local Crate -- 280
do -- 280
	local _class_0 -- 280
	local _parent_0 = Lootable -- 280
	local _base_0 = { -- 280
		PrintName = "Tools Crate", -- 282
		Model = "models/items/ammocrate_ar2.mdl", -- 284
		Description = "A old crate that was once filled with tools, hopefully some were left behind for you.", -- 286
		LootMax = 2, -- 287
		TimeToUse = 6, -- 289
		AccumulateInterval = 540, -- 291
		LootTable = { -- 292
			"evilrp_melee/pipe", -- 292
			"evilrp_melee/pipe", -- 293
			"evilrp_melee/pipe", -- 294
			"evilrp_melee/pipe", -- 295
			"evilrp_melee/pipe", -- 296
			"evilrp_melee/pot", -- 297
			"evilrp_melee/pot", -- 298
			"evilrp_melee/pot", -- 299
			"evilrp_melee/pan", -- 300
			"item/food/boot", -- 301
			"item/food/boot", -- 302
			"trash/bottle", -- 303
			"trash/bottle", -- 304
			"trash/bottle", -- 305
			"trash/bottle/fearbeer", -- 306
			"item/food/paper", -- 307
			"trash/plastic/bleach", -- 308
			"item/loot/rustkill", -- 309
			"item/loot/rustkill" -- 310
		} -- 280
	} -- 280
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 310
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 280
			_base_0[_key_0] = _val_0 -- 280
		end -- 280
	end -- 310
	if _base_0.__index == nil then -- 280
		_base_0.__index = _base_0 -- 280
	end -- 310
	setmetatable(_base_0, _parent_0.__base) -- 280
	_class_0 = setmetatable({ -- 280
		__init = function(self, ...) -- 280
			return _class_0.__parent.__init(self, ...) -- 280
		end, -- 280
		__base = _base_0, -- 280
		__name = "Crate", -- 280
		__parent = _parent_0 -- 280
	}, { -- 280
		__index = function(cls, name) -- 280
			local val = rawget(_base_0, name) -- 280
			if val == nil then -- 280
				local parent = rawget(cls, "__parent") -- 280
				if parent then -- 280
					return parent[name] -- 280
				end -- 280
			else -- 280
				return val -- 280
			end -- 280
		end, -- 280
		__call = function(cls, ...) -- 280
			local _self_0 = setmetatable({ }, _base_0) -- 280
			cls.__init(_self_0, ...) -- 280
			return _self_0 -- 280
		end -- 280
	}) -- 280
	_base_0.__class = _class_0 -- 280
	if _parent_0.__inherited then -- 280
		_parent_0.__inherited(_parent_0, _class_0) -- 280
	end -- 280
	Crate = _class_0 -- 280
end -- 310
local Locker -- 314
do -- 314
	local _class_0 -- 314
	local _parent_0 = Lootable -- 314
	local _base_0 = { -- 314
		PrintName = "Antique Locker", -- 317
		Description = "A locker, washed up from some ancient, forgotten battle. ", -- 319
		Model = "models/props_c17/lockers001a.mdl", -- 320
		LootMax = 3, -- 321
		TimeToUse = 12, -- 323
		AccumulateInterval = 360, -- 325
		LootTable = { -- 326
			"evilrp_weapon/obrez", -- 326
			"evilrp_weapon/obrez", -- 327
			"item/food/paper", -- 328
			"item/food/boot", -- 329
			"item/drug/rotmelange", -- 330
			"trash/bottle", -- 331
			"trash/bottle", -- 332
			"item/food/drink/fearbeer", -- 333
			"item/food/drink/fearbeer", -- 334
			"trash/plastic/shake", -- 335
			"evilrp_weapon/prettyboy", -- 336
			"evilrp_weapon/prettyboy", -- 337
			"trash/plastic/bleach", -- 338
			"evilrp_weapon/greaser", -- 339
			"item/food/slopskull", -- 340
			"item/food/slopskull", -- 341
			"item/food/slopskull", -- 342
			"item/food/ribbone", -- 343
			"item/food/ribbone", -- 344
			"item/food/ribbone", -- 345
			"item/loot/rustkill", -- 346
			"item/loot/rustkill" -- 347
		} -- 314
	} -- 314
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 347
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 314
			_base_0[_key_0] = _val_0 -- 314
		end -- 314
	end -- 347
	if _base_0.__index == nil then -- 314
		_base_0.__index = _base_0 -- 314
	end -- 347
	setmetatable(_base_0, _parent_0.__base) -- 314
	_class_0 = setmetatable({ -- 314
		__init = function(self, ...) -- 314
			return _class_0.__parent.__init(self, ...) -- 314
		end, -- 314
		__base = _base_0, -- 314
		__name = "Locker", -- 314
		__parent = _parent_0 -- 314
	}, { -- 314
		__index = function(cls, name) -- 314
			local val = rawget(_base_0, name) -- 314
			if val == nil then -- 314
				local parent = rawget(cls, "__parent") -- 314
				if parent then -- 314
					return parent[name] -- 314
				end -- 314
			else -- 314
				return val -- 314
			end -- 314
		end, -- 314
		__call = function(cls, ...) -- 314
			local _self_0 = setmetatable({ }, _base_0) -- 314
			cls.__init(_self_0, ...) -- 314
			return _self_0 -- 314
		end -- 314
	}) -- 314
	_base_0.__class = _class_0 -- 314
	if _parent_0.__inherited then -- 314
		_parent_0.__inherited(_parent_0, _class_0) -- 314
	end -- 314
	Locker = _class_0 -- 314
end -- 347
local Chest -- 350
do -- 350
	local _class_0 -- 350
	local _parent_0 = Lootable -- 350
	local _base_0 = { -- 350
		PrintName = "Rotten Chest", -- 353
		Description = "A wooden chest, the surface is covered with maggots.", -- 355
		Model = "models/props_forest/footlocker01_closed.mdl", -- 356
		LootMax = 2, -- 357
		TimeToUse = 20, -- 359
		LootTable = { -- 360
			"item/food/paper", -- 360
			"item/food/paper", -- 361
			"item/drug/rotmelange", -- 362
			"trash/bottle", -- 363
			"trash/bottle", -- 364
			"trash/bottle", -- 365
			"trash/plastic/shake", -- 366
			"trash/plastic/shake", -- 367
			"trash/plastic/shake", -- 368
			"trash/plastic/pills", -- 369
			"trash/plastic/pills", -- 370
			"trash/plastic/pills", -- 371
			"trash/plastic/bleach", -- 372
			"item/food/abortion", -- 373
			"item/food/abortion", -- 374
			"item/food/abortion", -- 375
			"item/food/slopskull", -- 376
			"item/food/slopskull", -- 377
			"item/food/slopskull", -- 378
			"item/food/slopskull", -- 379
			"item/food/slopskull", -- 380
			"item/food/ribbone", -- 381
			"item/food/ribbone", -- 382
			"item/food/ribbone", -- 383
			"trash/bottle/fearbeer", -- 384
			"trash/bottle/fearbeer", -- 385
			"item/food/drink/fearbeer", -- 386
			"item/food/drink/fearbeer", -- 387
			"item/food/drink/smearbeer", -- 388
			"item/food/drink/smearbeer", -- 389
			"item/food/drink/shake", -- 390
			"item/food/drink/shake", -- 391
			"item/food/loaf", -- 392
			"item/food/loaf", -- 393
			"item/food/loaf", -- 394
			"item/loot/rustkill", -- 395
			"item/loot/rustkill", -- 396
			"item/loot/rustkill" -- 397
		} -- 350
	} -- 350
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 397
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 350
			_base_0[_key_0] = _val_0 -- 350
		end -- 350
	end -- 397
	if _base_0.__index == nil then -- 350
		_base_0.__index = _base_0 -- 350
	end -- 397
	setmetatable(_base_0, _parent_0.__base) -- 350
	_class_0 = setmetatable({ -- 350
		__init = function(self, ...) -- 350
			return _class_0.__parent.__init(self, ...) -- 350
		end, -- 350
		__base = _base_0, -- 350
		__name = "Chest", -- 350
		__parent = _parent_0 -- 350
	}, { -- 350
		__index = function(cls, name) -- 350
			local val = rawget(_base_0, name) -- 350
			if val == nil then -- 350
				local parent = rawget(cls, "__parent") -- 350
				if parent then -- 350
					return parent[name] -- 350
				end -- 350
			else -- 350
				return val -- 350
			end -- 350
		end, -- 350
		__call = function(cls, ...) -- 350
			local _self_0 = setmetatable({ }, _base_0) -- 350
			cls.__init(_self_0, ...) -- 350
			return _self_0 -- 350
		end -- 350
	}) -- 350
	_base_0.__class = _class_0 -- 350
	if _parent_0.__inherited then -- 350
		_parent_0.__inherited(_parent_0, _class_0) -- 350
	end -- 350
	Chest = _class_0 -- 350
end -- 397
local Cache -- 399
do -- 399
	local _class_0 -- 399
	local _parent_0 = Lootable -- 399
	local _base_0 = { -- 399
		PrintName = "Abandoned Cache", -- 402
		Description = "Someone left this in a hurry, it has foreign markings.", -- 404
		Model = "models/props/de_prodigy/ammo_can_01.mdl", -- 405
		LootMax = 2, -- 406
		TimeToUse = 15, -- 407
		AccumulateInterval = 200, -- 409
		LootTable = { -- 410
			"item/food/paper", -- 410
			"item/drug/rotmelange", -- 411
			"trash/bottle", -- 412
			"trash/plastic/shake", -- 413
			"trash/plastic/pills", -- 414
			"trash/plastic/bleach", -- 415
			"trash/bottle/fearbeer", -- 416
			"item/food/drink/fearbeer", -- 417
			"item/food/drink/smearbeer", -- 418
			"item/food/drink/smearbeer", -- 419
			"evilrp_weapon/greaser", -- 420
			"evilrp_weapon/greaser", -- 421
			"evilrp_weapon/prettyboy", -- 422
			"evilrp_weapon/prettyboy", -- 423
			"evilrp_weapon/prettyboy", -- 424
			"evilrp_weapon/prettyboy", -- 425
			"evilrp_melee/shovel", -- 426
			"evilrp_melee/shovel", -- 427
			"evilrp_melee/shovel", -- 428
			"evilrp_melee/shovel", -- 429
			"evilrp_melee/shovel", -- 430
			"evilrp_weapon/hope", -- 431
			"evilrp_weapon/hope", -- 432
			"evilrp_weapon/hope", -- 433
			"evilrp_weapon/hope", -- 434
			"evilrp_weapon/owler", -- 435
			"item/food/eyeballnoodles", -- 436
			"item/food/eyeballnoodles", -- 437
			"item/loot/spareammo", -- 438
			"item/loot/spareammo", -- 439
			"item/loot/spareammo", -- 440
			"item/loot/spareammo", -- 441
			"item/loot/spareammo", -- 442
			"item/loot/spareammo", -- 443
			"item/loot/spareammo", -- 444
			"item/loot/spareammo" -- 445
		} -- 399
	} -- 399
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 445
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 399
			_base_0[_key_0] = _val_0 -- 399
		end -- 399
	end -- 445
	if _base_0.__index == nil then -- 399
		_base_0.__index = _base_0 -- 399
	end -- 445
	setmetatable(_base_0, _parent_0.__base) -- 399
	_class_0 = setmetatable({ -- 399
		__init = function(self, ...) -- 399
			return _class_0.__parent.__init(self, ...) -- 399
		end, -- 399
		__base = _base_0, -- 399
		__name = "Cache", -- 399
		__parent = _parent_0 -- 399
	}, { -- 399
		__index = function(cls, name) -- 399
			local val = rawget(_base_0, name) -- 399
			if val == nil then -- 399
				local parent = rawget(cls, "__parent") -- 399
				if parent then -- 399
					return parent[name] -- 399
				end -- 399
			else -- 399
				return val -- 399
			end -- 399
		end, -- 399
		__call = function(cls, ...) -- 399
			local _self_0 = setmetatable({ }, _base_0) -- 399
			cls.__init(_self_0, ...) -- 399
			return _self_0 -- 399
		end -- 399
	}) -- 399
	_base_0.__class = _class_0 -- 399
	if _parent_0.__inherited then -- 399
		_parent_0.__inherited(_parent_0, _class_0) -- 399
	end -- 399
	Cache = _class_0 -- 399
end -- 445
if ENT then -- 447
	scripted_ents.Register(Dumpster, "evilrp_dumpster") -- 448
	scripted_ents.Register(Crate, "evilrp_crate") -- 449
	scripted_ents.Register(Locker, "evilrp_locker") -- 450
	scripted_ents.Register(Chest, "evilrp_chest") -- 451
	return scripted_ents.Register(Cache, "evilrp_cache") -- 452
end -- 447
