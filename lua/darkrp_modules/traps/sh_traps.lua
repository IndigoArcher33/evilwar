-- [yue]: darkrp_modules\traps\sh_traps.yue
local random = math.random -- 3
local DefuseSound -- 5
do -- 5
	local _class_0 -- 5
	local _parent_0 = SOUND -- 5
	local _base_0 = { -- 5
		sound = { -- 7
			"physics/plastic/plastic_barrel_break1.wav", -- 7
			"physics/plastic/plastic_barrel_break2.wav", -- 8
			"physics/plastic/plastic_box_break1.wav", -- 9
			"physics/plastic/plastic_box_break2.wav", -- 10
			"physics/plaster/ceilingtile_break1.wav", -- 11
			"physics/plaster/ceilingtile_break2.wav", -- 12
			"physics/cardboard/cardboard_box_break1.wav", -- 13
			"physics/cardboard/cardboard_box_break2.wav", -- 14
			"physics/cardboard/cardboard_box_break3.wav" -- 15
		} -- 5
	} -- 5
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 16
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 5
			_base_0[_key_0] = _val_0 -- 5
		end -- 5
	end -- 16
	if _base_0.__index == nil then -- 5
		_base_0.__index = _base_0 -- 5
	end -- 16
	setmetatable(_base_0, _parent_0.__base) -- 5
	_class_0 = setmetatable({ -- 5
		__init = function(self, ...) -- 5
			return _class_0.__parent.__init(self, ...) -- 5
		end, -- 5
		__base = _base_0, -- 5
		__name = "DefuseSound", -- 5
		__parent = _parent_0 -- 5
	}, { -- 5
		__index = function(cls, name) -- 5
			local val = rawget(_base_0, name) -- 5
			if val == nil then -- 5
				local parent = rawget(cls, "__parent") -- 5
				if parent then -- 5
					return parent[name] -- 5
				end -- 5
			else -- 5
				return val -- 5
			end -- 5
		end, -- 5
		__call = function(cls, ...) -- 5
			local _self_0 = setmetatable({ }, _base_0) -- 5
			cls.__init(_self_0, ...) -- 5
			return _self_0 -- 5
		end -- 5
	}) -- 5
	_base_0.__class = _class_0 -- 5
	if _parent_0.__inherited then -- 5
		_parent_0.__inherited(_parent_0, _class_0) -- 5
	end -- 5
	DefuseSound = _class_0 -- 5
end -- 16
local Trap -- 18
do -- 18
	local _class_0 -- 18
	local _parent_0 = ENTITY_LONGUSE -- 18
	local _base_0 = { -- 18
		PrintName = "Trap", -- 20
		Description = "Neither friend nor foe, it's a trap!", -- 21
		Spawnable = true, -- 22
		AdminSpawnable = true, -- 23
		Model = "models/props_c17/tv_monitor01.mdl", -- 24
		Interesting = true, -- 26
		Category = "EvilWar: Traps", -- 27
		TimeToUse = 5, -- 29
		Power = 15, -- 31
		FuseMessages = { -- 32
			fused = { -- 33
				"Ready.", -- 33
				"Armed.", -- 34
				"Primed." -- 35
			}, -- 32
			defuse = { -- 37
				"Disarmed.", -- 37
				"Fuse removed.", -- 38
				"Safe.", -- 39
				"Phew" -- 40
			}, -- 36
			success = { -- 42
				"Got it?.", -- 42
				"C'mon.", -- 43
				"Fuck, c'mon.", -- 44
				"Sharp!.", -- 45
				"Careful." -- 46
			}, -- 41
			failure = { -- 48
				"FUCK.", -- 48
				"OH NO", -- 49
				"SHIT", -- 50
				"HUH?", -- 51
				"CAREFUL", -- 52
				"IT'S GONNA BLOW" -- 53
			}, -- 47
			refusal = { -- 55
				"Fuck that!.", -- 55
				"My life's worth more than this.", -- 56
				"I'm not touching that.", -- 57
				"There are better ways to die." -- 58
			} -- 54
		}, -- 60
		SetupDataTables = function(self) -- 60
			_class_0.__parent.__base.SetupDataTables(self) -- 61
			return self:NetworkVar("Bool", "Primed") -- 62
		end, -- 64
		Initialize = function(self) -- 64
			if CLIENT then -- 65
				return -- 65
			end -- 65
			self:SetModel(self.Model) -- 66
			self:SetUseType(SIMPLE_USE) -- 67
			self:PhysicsInit(SOLID_VPHYSICS) -- 68
			self:SetMoveType(MOVETYPE_VPHYSICS) -- 69
			self:SetSolid(SOLID_VPHYSICS) -- 70
			local phys = self:GetPhysicsObject() -- 71
			if phys and phys:IsValid() then -- 72
				phys:Wake() -- 72
			end -- 72
			self:SetPrimed(false) -- 73
			return self:SetupTrap() -- 74
		end, -- 76
		OnUseStart = function(self, ply) -- 76
			local desp = ply:GetDespair() -- 77
			local plyJob = RPExtraTeams[ply:Team()] -- 78
			if desp < 50 and self:GetPrimed() then -- 79
				if plyJob.category == "Wasteland" then -- 80
					return true -- 80
				end -- 80
				local msgs = self.FuseMessages.refusal -- 81
				ply:Notify("<c=200,0,0>" .. tostring(msgs[math.random(#msgs)])) -- 82
				net.Start("evilrp_frighten") -- 83
				net.Send(ply) -- 84
				return false -- 85
			end -- 79
		end, -- 87
		AttemptFuse = function(self, ply) -- 87
			if not SERVER then -- 88
				return -- 88
			end -- 88
			local tags = "" -- 89
			local col -- 90
			local msgs -- 91
			local roll = math.random(4) -- 92
			if not self:GetPrimed() then -- 93
				roll = 0 -- 93
			end -- 93
			if 0 == roll then -- 95
				col = "0,200,0" -- 96
				msgs = self.FuseMessages.fused -- 97
				self:SetPrimed(true) -- 98
				self:SetUser(NULL) -- 99
				self:SetEndTime(0) -- 100
				self.PartialUse = 0 -- 101
			elseif 1 == roll or 2 == roll or 3 == roll then -- 102
				local rolldefuse = math.random(3) -- 103
				local happy = math.random(5, 10) -- 104
				if rolldefuse == 1 then -- 105
					col = "0,200,0" -- 106
					msgs = self.FuseMessages.defuse -- 107
					self:SetPrimed(false) -- 108
					self:SetUser(NULL) -- 109
					self:SetEndTime(0) -- 110
					self.PartialUse = 0 -- 111
				else -- 113
					col = "200,200,0" -- 113
					msgs = self.FuseMessages.success -- 114
					happy = math.random(2, 6) -- 115
				end -- 105
				ply:AddDespair(-happy) -- 116
			elseif 4 == roll or 5 == roll then -- 117
				col = "200,0,0" -- 118
				msgs = self.FuseMessages.failure -- 119
				local sad = math.random(3, 8) -- 120
				local plyJob = RPExtraTeams[ply:Team()] -- 121
				if plyJob.category == "Wasteland" then -- 122
					sad = sad * 0 -- 122
				end -- 122
				if ply:HasOddity(ODDITY_DEPRESSION) then -- 123
					sad = sad * 2 -- 123
				end -- 123
				ply:AddDespair(sad) -- 124
				local rollexplode = math.random(3) -- 125
				if plyJob.category == "Wasteland" then -- 126
					rollexplode = 0 -- 126
				end -- 126
				if rollexplode == 1 then -- 127
					self:SetUser(NULL) -- 128
					self:SetEndTime(0) -- 129
					self.PartialUse = 0 -- 130
					self:Explode() -- 131
				end -- 127
			end -- 131
			ply:PlaySignal(ACT_GMOD_GESTURE_RANGE_FRENZY, true) -- 132
			self:EmitSound("DefuseSound") -- 133
			return ply:Notify(tostring(tags) .. "<c=" .. tostring(col) .. ">" .. tostring(msgs[math.random(#msgs)])) -- 134
		end, -- 136
		PartialUses = { -- 137
			{ -- 137
				prog = 20, -- 137
				func = function(self, ply) -- 138
					return self:AttemptFuse(ply) -- 138
				end -- 138
			}, -- 137
			{ -- 139
				prog = 40, -- 139
				func = function(self, ply) -- 140
					return self:AttemptFuse(ply) -- 140
				end -- 140
			}, -- 139
			{ -- 141
				prog = 60, -- 141
				func = function(self, ply) -- 142
					return self:AttemptFuse(ply) -- 142
				end -- 142
			}, -- 141
			{ -- 143
				prog = 80, -- 143
				func = function(self, ply) -- 144
					return self:AttemptFuse(ply) -- 144
				end -- 144
			}, -- 143
			{ -- 145
				prog = 100, -- 145
				func = function(self, ply) -- 146
					return self:AttemptFuse(ply) -- 146
				end -- 146
			} -- 145
		}, -- 148
		SetupTrap = function(self) -- 148
			if CLIENT then -- 149
				return -- 149
			end -- 149
		end, -- 153
		OnUseFinish = function(self, ply) -- 153
			if ply:IsPlayer() then -- 154
				if not self:GetPrimed() then -- 155
					ply:Notify("UH OH, IT'S PRIMED.") -- 156
					return self:SetPrimed(true) -- 157
				end -- 155
			end -- 154
		end, -- 159
		Think = function(self) -- 159
			_class_0.__parent.__base.Think(self) -- 160
			local ct = CurTime() -- 161
			if self:GetPrimed() then -- 162
			end -- 162
		end, -- 165
		Explode = function(self) -- 165
			if self.exploding then -- 166
				return -- 166
			end -- 166
			self.exploding = true -- 167
			util.ScreenShake(self:GetPos(), 25, 150, 1, 750) -- 168
			local explo = ents.Create("env_explosion") -- 169
			explo:SetOwner(self) -- 171
			explo:SetPos(self:GetPos()) -- 172
			explo:SetKeyValue("iMagnitude", self.Power * 2.5) -- 173
			explo:SetKeyValue("iRadiusOverride", math.min(400, self.Power * 1.5)) -- 174
			explo:Spawn() -- 175
			explo:Activate() -- 176
			explo:Fire("Explode") -- 177
			local fire_ent = ents.Create("env_fire") -- 178
			fire_ent:SetPos(self:GetPos()) -- 180
			fire_ent:SetKeyValue("spawnflags", "1") -- 181
			fire_ent:SetKeyValue("attack", tostring(math.random(20, 40))) -- 182
			fire_ent:SetKeyValue("firesize", tostring(math.random(100, 150))) -- 183
			fire_ent:Spawn() -- 184
			fire_ent:Activate() -- 185
			fire_ent:Fire("Enable", "", del) -- 186
			fire_ent:Fire("StartFire", "", del) -- 187
			SafeRemoveEntityDelayed(fire_ent, math.random(60, 70)) -- 188
			local victims = ents.FindInSphere(self:GetPos(), self.Power * 6) -- 189
			for _index_0 = 1, #victims do -- 190
				local victim = victims[_index_0] -- 190
				local ignition = false -- 191
				if victim:IsPlayer() and victim:Alive() then -- 192
					ignition = true -- 192
				end -- 192
				if victim:GetClass() == "prop_physics" then -- 193
					ignition = true -- 193
				end -- 193
				if ignition then -- 194
					victim:Ignite(math.random(5, 10)) -- 194
				end -- 194
			end -- 194
			self:Remove() -- 195
			return -- 196
		end, -- 198
		Draw = function(self) -- 198
			return self:DrawModel() -- 198
		end, -- 200
		HUDRender = function(self) -- 200
			local ct = { } -- 201
			ct[#ct + 1] = self.PrintName -- 202
			if self.Description then -- 203
				ct[#ct + 1] = "" -- 204
				ct[#ct + 1] = { -- 205
					text = self.Description, -- 205
					font = "Spleen_Label_Small" -- 205
				} -- 205
				if self:GetPrimed() then -- 206
					ct[#ct + 1] = { -- 207
						text = "IT'S ARMED.", -- 207
						font = "Spleen_Label_Small" -- 207
					} -- 207
				else -- 209
					ct[#ct + 1] = { -- 209
						text = "Seems like a dud.", -- 209
						font = "Spleen_Label_Small" -- 209
					} -- 209
				end -- 206
			end -- 203
			return ct -- 210
		end, -- 212
		Interactions = { -- 213
			{ -- 213
				desc = "Huh?", -- 213
				func = (function() -- 213
					return lp:SendChat("GENERIC", "This is a trap, watch out or you'll blow your head smooth off.") -- 213
				end) -- 213
			} -- 213
		} -- 18
	} -- 18
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 213
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 18
			_base_0[_key_0] = _val_0 -- 18
		end -- 18
	end -- 213
	if _base_0.__index == nil then -- 18
		_base_0.__index = _base_0 -- 18
	end -- 213
	setmetatable(_base_0, _parent_0.__base) -- 18
	_class_0 = setmetatable({ -- 18
		__init = function(self, ...) -- 18
			return _class_0.__parent.__init(self, ...) -- 18
		end, -- 18
		__base = _base_0, -- 18
		__name = "Trap", -- 18
		__parent = _parent_0 -- 18
	}, { -- 18
		__index = function(cls, name) -- 18
			local val = rawget(_base_0, name) -- 18
			if val == nil then -- 18
				local parent = rawget(cls, "__parent") -- 18
				if parent then -- 18
					return parent[name] -- 18
				end -- 18
			else -- 18
				return val -- 18
			end -- 18
		end, -- 18
		__call = function(cls, ...) -- 18
			local _self_0 = setmetatable({ }, _base_0) -- 18
			cls.__init(_self_0, ...) -- 18
			return _self_0 -- 18
		end -- 18
	}) -- 18
	_base_0.__class = _class_0 -- 18
	if _parent_0.__inherited then -- 18
		_parent_0.__inherited(_parent_0, _class_0) -- 18
	end -- 18
	Trap = _class_0 -- 18
end -- 213
local WireTrap -- 215
do -- 215
	local _class_0 -- 215
	local _parent_0 = Trap -- 215
	local _base_0 = { -- 215
		PrintName = "Wire Trap", -- 217
		Description = "A trap hooked up to a tripwire.", -- 218
		Model = "models/Items/grenadeAmmo.mdl", -- 219
		Power = 10, -- 221
		Initialize = function(self) -- 221
			_class_0.__parent.__base.Initialize(self) -- 222
			if CLIENT then -- 223
				return -- 223
			end -- 223
			return self:SetWired(false) -- 224
		end, -- 226
		SetupDataTables = function(self) -- 226
			_class_0.__parent.__base.SetupDataTables(self) -- 227
			return self:NetworkVar("Bool", "Wired") -- 228
		end, -- 230
		AttemptFuse = function(self, ply) -- 230
			if not SERVER then -- 231
				return -- 231
			end -- 231
			local tags = "" -- 232
			local col -- 233
			local msgs -- 234
			local roll = math.random(4) -- 235
			if not self:GetWired() then -- 236
				roll = -1 -- 237
			elseif not self:GetPrimed() then -- 238
				roll = 0 -- 239
			end -- 236
			if (-1) == roll then -- 241
				col = "0,200,0" -- 242
				msgs = { -- 243
					"Wired." -- 243
				} -- 243
				self:Wire() -- 244
				self:SetUser(NULL) -- 245
				self:SetEndTime(0) -- 246
				self.PartialUse = 0 -- 247
			elseif 0 == roll then -- 248
				col = "0,200,0" -- 249
				msgs = self.FuseMessages.fused -- 250
				self:SetPrimed(true) -- 251
				self:SetUser(NULL) -- 252
				self:SetEndTime(0) -- 253
				self.PartialUse = 0 -- 254
			elseif 1 == roll or 2 == roll or 3 == roll then -- 255
				local rolldefuse = math.random(3) -- 256
				local happy = math.random(5, 10) -- 257
				if rolldefuse == 1 then -- 258
					col = "0,200,0" -- 259
					msgs = self.FuseMessages.defuse -- 260
					self:SetPrimed(false) -- 261
					self:SetUser(NULL) -- 262
					self:SetEndTime(0) -- 263
					self.PartialUse = 0 -- 264
				else -- 266
					col = "200,200,0" -- 266
					msgs = self.FuseMessages.success -- 267
					happy = math.random(1, 2) -- 268
				end -- 258
				ply:AddDespair(-happy) -- 269
			elseif 4 == roll or 5 == roll then -- 270
				col = "200,0,0" -- 271
				msgs = self.FuseMessages.failure -- 272
				local sad = math.random(3, 8) -- 273
				local plyJob = RPExtraTeams[ply:Team()] -- 274
				if plyJob.category == "Wasteland" then -- 275
					sad = sad * 0 -- 275
				end -- 275
				if ply:HasOddity(ODDITY_DEPRESSION) then -- 276
					sad = sad * 2 -- 276
				end -- 276
				ply:AddDespair(sad) -- 277
				local rollexplode = math.random(3) -- 278
				if plyJob.category == "Wasteland" then -- 279
					rollexplode = 0 -- 279
				end -- 279
				if rollexplode == 1 then -- 280
					self:SetUser(NULL) -- 281
					self:SetEndTime(0) -- 282
					self.PartialUse = 0 -- 283
					self:Explode() -- 284
				end -- 280
			end -- 284
			ply:PlaySignal(ACT_GMOD_GESTURE_RANGE_FRENZY, true) -- 285
			self:EmitSound("DefuseSound") -- 286
			return ply:Notify(tostring(tags) .. "<c=" .. tostring(col) .. ">" .. tostring(msgs[math.random(#msgs)])) -- 287
		end, -- 289
		Touch = function(self, what) -- 289
			if CLIENT then -- 290
				return -- 290
			end -- 290
			if not what:IsPlayer() then -- 291
				return -- 291
			end -- 291
			if not self:GetPrimed() then -- 292
				return -- 292
			end -- 292
			return self:Explode() -- 293
		end, -- 295
		Wire = function(self) -- 295
			local ropelength = (self:LocalToWorld(self.wire.LPos1) - self.stick:LocalToWorld(self.wire.LPos2)):Length() -- 296
			if ropelength then -- 297
				self.wire:Remove() -- 298
				self.wire = constraint.Rope(self, self.stick, 0, 0, Vector(0, 0, 0), Vector(1.5, 0, -2.8), ropelength, 5, 10, 0.05, "cable/cable2", false) -- 299
				return self:SetWired(true) -- 300
			end -- 297
		end, -- 302
		Think = function(self) -- 302
			_class_0.__parent.__base.Think(self) -- 303
			if CLIENT then -- 304
				return -- 304
			end -- 304
			self:NextThink(CurTime() + 0.05) -- 305
			if not IsValid(self.wire) and not self.broken and self:GetPrimed() then -- 307
				self.broken = true -- 308
				self:EmitSound("Padlock.Break") -- 309
				if IsValid(self) then -- 310
					self:Explode() -- 310
				end -- 310
				return -- 311
			end -- 307
			if IsValid(self.wire) and not self.broken and self:GetPrimed() and self:GetWired() then -- 313
				local trace = { -- 315
					start = self:LocalToWorld(self.wire.LPos1), -- 315
					endpos = self.stick:GetPos() + Vector(0, 0, 2), -- 316
					filter = { -- 317
						self, -- 317
						self.stick -- 317
					} -- 317
				} -- 314
				local tr = util.TraceLine(trace) -- 319
				if tr.Hit then -- 320
					local ply -- 321
					if tr.Entity and tr.Entity:IsPlayer() then -- 321
						ply = tr.Entity -- 321
					end -- 321
					if ply and ply:Team() == TEAM_STALKER then -- 322
						return true -- 322
					end -- 322
					self.wire:Remove() -- 323
				end -- 320
			end -- 313
			return true -- 324
		end, -- 326
		SetupTrap = function(self) -- 326
			_class_0.__parent.__base.SetupTrap(self) -- 327
			self.stick = ents.Create("prop_physics") -- 328
			do -- 329
				local _with_0 = self.stick -- 329
				_with_0:SetPos(self:GetPos() + Vector(0, 0, 30)) -- 330
				_with_0:SetModel("models/props_wasteland/prison_throwswitchbase001.mdl") -- 331
				_with_0:Spawn() -- 332
			end -- 329
			self:DeleteOnRemove(self.stick) -- 334
			self.wire = constraint.Rope(self, self.stick, 0, 0, Vector(0, 0, 0), Vector(1.5, 0, -2.8), 200, 0, 10, 0.05, "cable/cable2", false) -- 336
		end -- 215
	} -- 215
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 336
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 215
			_base_0[_key_0] = _val_0 -- 215
		end -- 215
	end -- 336
	if _base_0.__index == nil then -- 215
		_base_0.__index = _base_0 -- 215
	end -- 336
	setmetatable(_base_0, _parent_0.__base) -- 215
	_class_0 = setmetatable({ -- 215
		__init = function(self, ...) -- 215
			return _class_0.__parent.__init(self, ...) -- 215
		end, -- 215
		__base = _base_0, -- 215
		__name = "WireTrap", -- 215
		__parent = _parent_0 -- 215
	}, { -- 215
		__index = function(cls, name) -- 215
			local val = rawget(_base_0, name) -- 215
			if val == nil then -- 215
				local parent = rawget(cls, "__parent") -- 215
				if parent then -- 215
					return parent[name] -- 215
				end -- 215
			else -- 215
				return val -- 215
			end -- 215
		end, -- 215
		__call = function(cls, ...) -- 215
			local _self_0 = setmetatable({ }, _base_0) -- 215
			cls.__init(_self_0, ...) -- 215
			return _self_0 -- 215
		end -- 215
	}) -- 215
	_base_0.__class = _class_0 -- 215
	if _parent_0.__inherited then -- 215
		_parent_0.__inherited(_parent_0, _class_0) -- 215
	end -- 215
	WireTrap = _class_0 -- 215
end -- 336
local ShotgunWire -- 338
do -- 338
	local _class_0 -- 338
	local _parent_0 = WireTrap -- 338
	local _base_0 = { -- 338
		PrintName = "Shotgun Wiretrap", -- 340
		Description = "It will get the job done.", -- 341
		Model = "models/tnb/weapons/w_sawnoff.mdl", -- 342
		Pellets = 16, -- 343
		Damage = 10, -- 345
		Explode = function(self) -- 345
			if self.exploding then -- 346
				return -- 346
			end -- 346
			self.exploding = true -- 347
			self:EmitSound("Weapon_FlareGun.Single") -- 348
			local bullet -- 349
			bullet = { } -- 349
			bullet.Num = self.Pellets -- 351
			bullet.Src = self:GetPos() -- 352
			bullet.Dir = self:GetForward() -- 353
			bullet.Spread = Vector(0.1, 0.1, 0) -- 354
			bullet.TracerName = "Tracer" -- 355
			bullet.Force = 20 * 0.5 -- 356
			bullet.Damage = self.Damage -- 357
			self:FireBullets(bullet) -- 358
			local ed = EffectData() -- 359
			ed:SetOrigin(self:GetPos()) -- 361
			ed:SetAngles(self:GetForward():Angle()) -- 362
			util.Effect("MuzzleEffect", ed) -- 363
			return SafeRemoveEntityDelayed(self, 2.5) -- 364
		end -- 338
	} -- 338
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 364
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 338
			_base_0[_key_0] = _val_0 -- 338
		end -- 338
	end -- 364
	if _base_0.__index == nil then -- 338
		_base_0.__index = _base_0 -- 338
	end -- 364
	setmetatable(_base_0, _parent_0.__base) -- 338
	_class_0 = setmetatable({ -- 338
		__init = function(self, ...) -- 338
			return _class_0.__parent.__init(self, ...) -- 338
		end, -- 338
		__base = _base_0, -- 338
		__name = "ShotgunWire", -- 338
		__parent = _parent_0 -- 338
	}, { -- 338
		__index = function(cls, name) -- 338
			local val = rawget(_base_0, name) -- 338
			if val == nil then -- 338
				local parent = rawget(cls, "__parent") -- 338
				if parent then -- 338
					return parent[name] -- 338
				end -- 338
			else -- 338
				return val -- 338
			end -- 338
		end, -- 338
		__call = function(cls, ...) -- 338
			local _self_0 = setmetatable({ }, _base_0) -- 338
			cls.__init(_self_0, ...) -- 338
			return _self_0 -- 338
		end -- 338
	}) -- 338
	_base_0.__class = _class_0 -- 338
	if _parent_0.__inherited then -- 338
		_parent_0.__inherited(_parent_0, _class_0) -- 338
	end -- 338
	ShotgunWire = _class_0 -- 338
end -- 364
local IED -- 368
do -- 368
	local _class_0 -- 368
	local _parent_0 = Trap -- 368
	local _base_0 = { -- 368
		PrintName = "IED", -- 370
		Description = "An explosive device, disguised as a pile of trash.", -- 371
		Model = "models/props_junk/garbage128_composite001b.mdl", -- 372
		Power = 40, -- 374
		Touch = function(self, what) -- 374
			if CLIENT then -- 375
				return -- 375
			end -- 375
			if not what:IsPlayer() then -- 376
				return -- 376
			end -- 376
			if not self:GetPrimed() then -- 377
				return -- 377
			end -- 377
			return self:Explode() -- 378
		end, -- 380
		HUDRender = function(self) -- 380
			if self:GetPrimed() then -- 381
				return -- 381
			end -- 381
			local ct = { } -- 382
			ct[#ct + 1] = self.PrintName -- 383
			if self.Description then -- 384
				ct[#ct + 1] = "" -- 385
				ct[#ct + 1] = { -- 386
					text = self.Description, -- 386
					font = "Spleen_Label_Small" -- 386
				} -- 386
				ct[#ct + 1] = { -- 387
					text = "Seems like a dud.", -- 387
					font = "Spleen_Label_Small" -- 387
				} -- 387
			end -- 384
			return ct -- 388
		end -- 368
	} -- 368
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 388
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 368
			_base_0[_key_0] = _val_0 -- 368
		end -- 368
	end -- 388
	if _base_0.__index == nil then -- 368
		_base_0.__index = _base_0 -- 368
	end -- 388
	setmetatable(_base_0, _parent_0.__base) -- 368
	_class_0 = setmetatable({ -- 368
		__init = function(self, ...) -- 368
			return _class_0.__parent.__init(self, ...) -- 368
		end, -- 368
		__base = _base_0, -- 368
		__name = "IED", -- 368
		__parent = _parent_0 -- 368
	}, { -- 368
		__index = function(cls, name) -- 368
			local val = rawget(_base_0, name) -- 368
			if val == nil then -- 368
				local parent = rawget(cls, "__parent") -- 368
				if parent then -- 368
					return parent[name] -- 368
				end -- 368
			else -- 368
				return val -- 368
			end -- 368
		end, -- 368
		__call = function(cls, ...) -- 368
			local _self_0 = setmetatable({ }, _base_0) -- 368
			cls.__init(_self_0, ...) -- 368
			return _self_0 -- 368
		end -- 368
	}) -- 368
	_base_0.__class = _class_0 -- 368
	if _parent_0.__inherited then -- 368
		_parent_0.__inherited(_parent_0, _class_0) -- 368
	end -- 368
	IED = _class_0 -- 368
	return _class_0 -- 388
end -- 388
