-- [yue]: darkrp_modules\npc\sh_npc.yue
local Register = scripted_ents.Register -- 1
local lower, Left = string.lower, string.Left -- 2
do -- 4
	local _class_0 -- 4
	local _base_0 = { } -- 4
	if _base_0.__index == nil then -- 4
		_base_0.__index = _base_0 -- 4
	end -- 31
	_class_0 = setmetatable({ -- 4
		__init = function() end, -- 4
		__base = _base_0, -- 4
		__name = "NEXTBOT" -- 4
	}, { -- 4
		__index = _base_0, -- 4
		__call = function(cls, ...) -- 4
			local _self_0 = setmetatable({ }, _base_0) -- 4
			cls.__init(_self_0, ...) -- 4
			return _self_0 -- 4
		end -- 4
	}) -- 4
	_base_0.__class = _class_0 -- 4
	local self = _class_0; -- 4
	self.__inherited = function(self, child) -- 5
		child.__barcode = lower(rawget(child, '__nextbot') or child.__name) -- 6
		local fields -- 8
		do -- 8
			local _tbl_0 = { } -- 8
			for k, v in pairs(child.__base) do -- 8
				if Left(k, 2) ~= "__" then -- 8
					_tbl_0[k] = v -- 8
				end -- 8
			end -- 8
			fields = _tbl_0 -- 8
		end -- 8
		fields.Base = rawget(child.__base, 'Base') or self.__barcode or "base_nextbot" -- 10
		fields.Type = "nextbot" -- 11
		do -- 13
			local _with_0 = getmetatable(child) -- 13
			_with_0.__call = function(self, where, ...) -- 14
				local ent -- 15
				if isvector(where) then -- 16
					ent = ents.Create(child.__barcode) -- 17
					if IsValid(ent) then -- 18
						ent:SetPos(where) -- 19
						ent:Spawn() -- 20
					end -- 18
				end -- 16
				return ent -- 21
			end -- 14
		end -- 13
		Register(fields, child.__barcode) -- 23
		MsgC(Color(0, 200, 200), "+NEXTBOT: " .. tostring(child.__barcode) .. " (Base: " .. tostring(fields.Base) .. ")\n") -- 24
		if fields.Spawnable then -- 26
			return list.Set("NPC", child.__barcode, { -- 28
				Name = fields.PrintName or child.__name, -- 28
				Class = child.__barcode, -- 29
				Category = fields.Category or "Nextbots" -- 30
			}) -- 31
		end -- 26
	end -- 5
	NEXTBOT = _class_0 -- 4
end -- 31
DEFINE_BASECLASS("base_nextbot") -- 33
local EvilRP_NPC -- 35
do -- 35
	local _class_0 -- 35
	local _parent_0 = NEXTBOT -- 35
	local _base_0 = { -- 35
		__nextbot = "evil_npc", -- 37
		Base = "base_nextbot", -- 38
		Faction = "evil", -- 39
		Category = "EvilRP", -- 40
		PrintName = "Evil NPC", -- 41
		Spawnable = true, -- 42
		Reward = 100, -- 43
		Weapon = "evilrp_weapon/obrez", -- 44
		LootTable = { -- 44
			"item/loot/spareammo", -- 44
			"item_healthvial" -- 44
		}, -- 46
		IdleSound = (function() -- 46
			local _accum_0 = { } -- 46
			local _len_0 = 1 -- 46
			for i = 1, 3 do -- 46
				_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav" -- 46
				_len_0 = _len_0 + 1 -- 46
			end -- 46
			return _accum_0 -- 46
		end)(), -- 47
		DeathSound = (function() -- 47
			local _accum_0 = { } -- 47
			local _len_0 = 1 -- 47
			for i = 1, 3 do -- 47
				_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav" -- 47
				_len_0 = _len_0 + 1 -- 47
			end -- 47
			return _accum_0 -- 47
		end)(), -- 48
		HurtSound = (function() -- 48
			local _accum_0 = { } -- 48
			local _len_0 = 1 -- 48
			for i = 1, 5 do -- 48
				_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav" -- 48
				_len_0 = _len_0 + 1 -- 48
			end -- 48
			return _accum_0 -- 48
		end)(), -- 51
		Initialize = function(self) -- 51
			self:SetModel("models/vel/evilwar/royalist.mdl") -- 52
			self:SetHealth(100) -- 53
			self.LoseTargetDist = 1200 -- 54
			self.SearchRadius = 1800 -- 55
			self.NextFire = CurTime() -- 57
			return self:Give(self.Weapon) -- 59
		end, -- 63
		Give = function(self, wepname) -- 63
			if CLIENT then -- 64
				return -- 64
			end -- 64
			if IsValid(self:GetActiveLuaWeapon()) then -- 65
				self:GetActiveLuaWeapon():Remove() -- 66
			end -- 65
			local wep = ents.Create(wepname) -- 68
			if IsValid(wep) then -- 69
				wep:SetPos(self:GetPos()) -- 70
				wep:SetOwner(self) -- 71
				wep:Spawn() -- 72
				wep:Activate() -- 73
				return self:SetupWeapon(wep) -- 74
			end -- 69
		end, -- 76
		SetupWeapon = function(self, wep) -- 76
			if not IsValid(wep) then -- 77
				return -- 77
			end -- 77
			self.m_ActualWeapon = wep -- 78
			wep:SetVelocity(vector_origin) -- 80
			wep:RemoveSolidFlags(FSOLID_TRIGGER) -- 81
			wep:SetOwner(self) -- 82
			wep:RemoveEffects(EF_ITEM_BLINK) -- 83
			wep:PhysicsDestroy() -- 84
			wep:SetParent(self) -- 86
			wep:SetMoveType(MOVETYPE_NONE) -- 87
			wep:AddEffects(EF_BONEMERGE) -- 88
			wep:AddSolidFlags(FSOLID_NOT_SOLID) -- 89
			wep:SetLocalPos(vector_origin) -- 90
			wep:SetLocalAngles(angle_zero) -- 91
			wep:SetTransmitWithParent(true) -- 92
			local clipSize = (wep.Primary and wep.Primary.ClipSize) or 30 -- 94
			wep.CurAmmo = clipSize -- 95
			wep.MaxClip = clipSize -- 96
			wep.Reloading = false -- 97
		end, -- 99
		OnInjured = function(self, dmginfo) -- 99
			if self.HurtSound then -- 100
				self:EmitSound(self.HurtSound[math.random(1, #self.HurtSound)]) -- 100
			end -- 100
			return -- 101
		end, -- 103
		OnTakeDamage = function(self, dmginfo) -- 103
			local attacker = dmginfo:GetAttacker() -- 104
			if IsValid(attacker) and attacker ~= self then -- 105
				self:SetEnemy(attacker) -- 105
			end -- 105
			return -- 106
		end, -- 108
		OnTraceAttack = function(self, dmginfo, dir, trace) -- 108
			if trace.HitGroup == HITGROUP_HEAD then -- 109
				return dmginfo:ScaleDamage(3.0) -- 110
			elseif trace.HitGroup == HITGROUP_LEFTARM or trace.HitGroup == HITGROUP_RIGHTARM then -- 112
				return dmginfo:ScaleDamage(0.7) -- 113
			end -- 109
		end, -- 115
		OnKilled = function(self, dmginfo) -- 115
			if self.DeathSound then -- 116
				self:EmitSound(self.DeathSound[math.random(1, #self.DeathSound)]) -- 116
			end -- 116
			local attacker = dmginfo:GetAttacker() -- 117
			if IsValid(attacker) and attacker:IsPlayer() then -- 118
				local job = RPExtraTeams[attacker:Team()] -- 119
				if job and job.category == self.Faction then -- 120
					attacker:Notify("<color=255,0,0> My own brother!") -- 121
					net.Start("evilrp_jumpscare") -- 122
					net.Send(attacker) -- 123
				end -- 120
				attacker:AddMoney(self.Reward) -- 124
			end -- 118
			self:BecomeRagdoll(dmginfo) -- 126
			self:Drop() -- 127
			return -- 128
		end, -- 130
		Drop = function(self) -- 130
			for i = 1, math.random(1, 2) do -- 131
				local cls = self.LootTable[math.random(1, #self.LootTable)] -- 132
				local loot = ents.Create(cls) -- 133
				loot:Spawn() -- 135
				loot:Activate() -- 136
				loot:SetPos(self:GetPos() + Vector(math.random(-10, 10), math.random(-10, 10), 0)) -- 137
			end -- 138
			local weapon = self:GetActiveLuaWeapon() -- 139
			local etab = weapons.Get(weapon) -- 140
			if weapon and etab then -- 141
				local product = ents.Create("evilrp/spawned/weapon") -- 142
				product:SetModel(etab.WorldModel) -- 144
				product:SetWeaponClass(weapon) -- 145
				product:SetPos(self:GetPos() + Vector(math.random(-10, 10), math.random(-10, 10), 0)) -- 146
				product:Spawn() -- 147
				return product -- 143
			end -- 141
		end, -- 150
		GetActiveLuaWeapon = function(self) -- 150
			return self.m_ActualWeapon or NULL -- 151
		end, -- 153
		WeaponPrimaryAttack = function(self) -- 153
			if self.NextFire > CurTime() then -- 154
				return -- 155
			end -- 154
			if not self:HaveEnemy() then -- 156
				return -- 157
			end -- 156
			local wep = self:GetActiveLuaWeapon() -- 159
			if not IsValid(wep) then -- 160
				return -- 161
			end -- 160
			if wep.CurAmmo <= 0 then -- 163
				self:Reload() -- 164
				return -- 165
			end -- 163
			local myEyePos = self:GetPos() + Vector(0, 0, 50) -- 167
			local enemyChestPos = self:GetEnemy():GetPos() + Vector(0, 0, 45) -- 168
			local trace = { -- 171
				start = myEyePos, -- 171
				endpos = enemyChestPos, -- 172
				filter = { -- 173
					self, -- 173
					wep -- 173
				} -- 173
			} -- 170
			local tr = util.TraceLine(trace) -- 175
			if IsValid(tr.Entity) and tr.Entity:GetClass() == self:GetClass() then -- 176
				return -- 177
			end -- 176
			self:SetPoseParameter("aim_pitch", 0) -- 179
			local delay = (wep.Primary and wep.Primary.Delay) or 0.1 -- 181
			self.NextFire = CurTime() + delay + math.random(-delay / 10, delay / 10) -- 182
			local snd = (wep.Primary and wep.Primary.Sound) or "Weapon_SMG1.Single" -- 184
			if type(snd) == "table" then -- 185
				snd = table.Random(snd) -- 185
			end -- 185
			self:EmitSound(snd, 75, 100, 5) -- 186
			self:RestartGesture(ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2) -- 188
			local acc -- 190
			if wep.GetSpread then -- 190
				acc = wep:GetSpread() -- 190
			else -- 190
				acc = Vector(0.05, 0.05, 0) -- 190
			end -- 190
			local bullet = { -- 192
				Num = (wep.Primary and wep.Primary.NumBullets) or 1, -- 192
				Src = myEyePos, -- 193
				Dir = (enemyChestPos - myEyePos):GetNormalized(), -- 194
				Spread = acc * 3, -- 195
				Tracer = 1, -- 196
				Force = (wep.Primary and wep.Primary.Damage) or 10, -- 197
				Damage = (wep.Primary and wep.Primary.Damage) or 10, -- 198
				AmmoType = (wep.Primary and wep.Primary.Ammo) or "smg1", -- 199
				Attacker = self, -- 200
				Inflictor = wep -- 201
			} -- 191
			self:FireBullets(bullet) -- 203
			wep.CurAmmo = wep.CurAmmo - 1 -- 204
			return wep:MuzzleFlash() -- 205
		end, -- 207
		IsMelee = function(self) -- 207
			local wep = self:GetActiveLuaWeapon() -- 208
			if not IsValid(wep) then -- 209
				return true -- 210
			end -- 209
			local holdType = (wep.GetHoldType and wep:GetHoldType()) or "smg" -- 212
			return holdType == "melee" or holdType == "fist" or holdType == "knife" or holdType == "grenade" -- 213
		end, -- 215
		Reload = function(self) -- 215
			local wep = self:GetActiveLuaWeapon() -- 216
			if not IsValid(wep) or wep.Reloading then -- 217
				return -- 218
			end -- 217
			self:RestartGesture(ACT_HL2MP_GESTURE_RELOAD_AR2) -- 220
			wep.Reloading = true -- 221
			self:EmitSound("weapons/smg1/smg1_reload.wav") -- 222
			return timer.Simple(2.5, function() -- 224
				if IsValid(self) and IsValid(wep) then -- 225
					wep.CurAmmo = wep.MaxClip -- 226
					wep.Reloading = false -- 227
				end -- 225
			end) -- 227
		end, -- 229
		GetAnim = function(self, state) -- 229
			local wep = self:GetActiveLuaWeapon() -- 230
			if not IsValid(wep) then -- 231
				return _G["ACT_HL2MP_" .. state] -- 232
			end -- 231
			local holdType = (wep.GetHoldType and wep:GetHoldType()) or "smg" -- 234
			local translations = { -- 237
				pistol = "PISTOL", -- 237
				revolver = "REVOLVER", -- 238
				smg = "SMG1", -- 239
				ar2 = "AR2", -- 240
				shotgun = "SHOTGUN", -- 241
				crossbow = "CROSSBOW", -- 242
				rpg = "RPG", -- 243
				grenade = "GRENADE", -- 244
				melee = "MELEE" -- 245
			} -- 236
			local suffix = translations[holdType] or "SMG1" -- 247
			return _G["ACT_HL2MP_" .. state .. "_" .. suffix] -- 248
		end, -- 250
		BodyUpdate = function(self) -- 250
			local act = self:GetActivity() -- 251
			if act == self:GetAnim("RUN") or act == self:GetAnim("WALK") then -- 252
				return self:BodyMoveXY() -- 253
			else -- 255
				return self:FrameAdvance() -- 255
			end -- 252
		end, -- 257
		SetEnemy = function(self, ent) -- 257
			self.Enemy = ent -- 257
		end, -- 258
		GetEnemy = function(self) -- 258
			return self.Enemy -- 258
		end, -- 260
		HaveEnemy = function(self) -- 260
			local enemy = self:GetEnemy() -- 261
			if IsValid(enemy) then -- 262
				if self:GetRangeTo(enemy:GetPos()) > self.LoseTargetDist then -- 263
					return self:FindEnemy() -- 264
				elseif enemy:IsPlayer() and not enemy:Alive() then -- 265
					return self:FindEnemy() -- 266
				elseif enemy:GetClass() == self:GetClass() then -- 267
					return self:FindEnemy() -- 268
				elseif enemy:Team() == TEAM_GHOST then -- 269
					return self:FindEnemy() -- 270
				end -- 263
				return true -- 271
			end -- 262
			return self:FindEnemy() -- 272
		end, -- 274
		FindEnemy = function(self) -- 274
			local entsInCone = ents.FindInCone(self:GetPos(), self:GetForward(), self.SearchRadius, 0.707) -- 275
			for _index_0 = 1, #entsInCone do -- 276
				local v = entsInCone[_index_0] -- 276
				local _continue_0 = false -- 277
				repeat -- 277
					if v.Faction and v.Faction == self.Faction then -- 277
						_continue_0 = true -- 278
						break -- 278
					end -- 277
					if (v:IsNPC() or v:IsNextBot() or v:IsPlayer()) and self:Visible(v) then -- 281
						if v:Health() > 0 then -- 282
							self:SetEnemy(v) -- 283
							return true -- 284
						end -- 282
					end -- 281
					_continue_0 = true -- 277
				until true -- 285
				if not _continue_0 then -- 285
					break -- 285
				end -- 285
			end -- 285
			self:SetEnemy(nil) -- 286
			return false -- 287
		end, -- 289
		RunBehaviour = function(self) -- 289
			while true do -- 290
				if self:HaveEnemy() then -- 291
					if self:IsMelee() then -- 292
						self:StartActivity(self:GetAnim("RUN")) -- 293
						self.loco:SetDesiredSpeed(150) -- 294
						self:ChaseEnemy() -- 295
					else -- 297
						self:StartActivity(self:GetAnim("IDLE")) -- 297
						while self:HaveEnemy() and not self:IsMelee() do -- 299
							local target = self:GetEnemy() -- 300
							if not IsValid(target) then -- 301
								break -- 301
							end -- 301
							if not self:Visible(target) then -- 303
								self:StartActivity(self:GetAnim("RUN")) -- 304
								self.loco:SetDesiredSpeed(150) -- 305
								local path = Path("Follow") -- 307
								path:SetMinLookAheadDistance(300) -- 308
								path:SetGoalTolerance(20) -- 309
								path:Compute(self, target:GetPos()) -- 310
								if not path:IsValid() then -- 312
									coroutine.wait(1) -- 313
								else -- 315
									local nextPath = CurTime() + 5 -- 315
									while path:IsValid() and self:HaveEnemy() and CurTime() < nextPath do -- 316
										target = self:GetEnemy() -- 317
										if not IsValid(target) or self:Visible(target) then -- 318
											break -- 318
										end -- 318
										if path:GetAge() > 0.1 then -- 320
											path:Compute(self, target:GetPos()) -- 320
										end -- 320
										path:Update(self) -- 321
										if self.loco:IsStuck() then -- 323
											self:HandleStuck() -- 323
										end -- 323
										coroutine.yield() -- 324
									end -- 325
								end -- 312
							elseif self:GetRangeTo(target:GetPos()) > 800 then -- 326
								self:StartActivity(self:GetAnim("WALK")) -- 327
								self.loco:SetDesiredSpeed(100) -- 328
								local dir = (target:GetPos() - self:GetPos()):GetNormalized() -- 330
								local pos = self:GetPos() + dir * 250 -- 331
								self:MoveToPos(pos) -- 333
								self:StartActivity(self:GetAnim("IDLE")) -- 335
								local stop = CurTime() + math.Rand(1.0, 2.5) -- 337
								while CurTime() < stop do -- 338
									target = self:GetEnemy() -- 339
									if not IsValid(target) or not self:Visible(target) then -- 340
										break -- 340
									end -- 340
									self.loco:FaceTowards(target:GetPos()) -- 342
									self:WeaponPrimaryAttack() -- 343
									coroutine.yield() -- 344
								end -- 345
							else -- 347
								self:StartActivity(self:GetAnim("IDLE")) -- 347
								self.loco:FaceTowards(target:GetPos()) -- 348
								self:WeaponPrimaryAttack() -- 349
								coroutine.yield() -- 350
							end -- 303
						end -- 350
					end -- 292
				else -- 352
					self:StartActivity(self:GetAnim("WALK")) -- 352
					if self.IdleSound then -- 353
						self:EmitSound(self.IdleSound[math.random(1, #self.IdleSound)]) -- 353
					end -- 353
					self.loco:SetDesiredSpeed(100) -- 354
					local wander = self:GetPos() + Vector(math.Rand(-1, 1), math.Rand(-1, 1), 0) * 400 -- 356
					if navmesh.IsLoaded() and navmesh.GetNearestNavArea(wander, false) then -- 357
						self:MoveToPos(wander) -- 358
					else -- 360
						coroutine.wait(1) -- 360
					end -- 357
					self:StartActivity(self:GetAnim("IDLE")) -- 362
				end -- 291
				coroutine.wait(0.5) -- 364
			end -- 364
		end, -- 367
		ChaseEnemy = function(self) -- 367
			local path = Path("Follow") -- 368
			path:SetMinLookAheadDistance(300) -- 369
			path:SetGoalTolerance(20) -- 370
			path:Compute(self, self:GetEnemy():GetPos()) -- 371
			if not path:IsValid() then -- 373
				return "failed" -- 373
			end -- 373
			while path:IsValid() and self:HaveEnemy() do -- 375
				if path:GetAge() > 0.1 then -- 376
					path:Compute(self, self:GetEnemy():GetPos()) -- 377
				end -- 376
				self.loco:FaceTowards(self:GetEnemy():GetPos()) -- 379
				self:WeaponPrimaryAttack() -- 380
				path:Update(self) -- 382
				if self.loco:IsStuck() then -- 384
					self:HandleStuck() -- 385
					return "stuck" -- 386
				end -- 384
				coroutine.yield() -- 388
			end -- 388
			return "ok" -- 390
		end -- 35
	} -- 35
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 390
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 35
			_base_0[_key_0] = _val_0 -- 35
		end -- 35
	end -- 390
	if _base_0.__index == nil then -- 35
		_base_0.__index = _base_0 -- 35
	end -- 390
	setmetatable(_base_0, _parent_0.__base) -- 35
	_class_0 = setmetatable({ -- 35
		__init = function(self, ...) -- 35
			return _class_0.__parent.__init(self, ...) -- 35
		end, -- 35
		__base = _base_0, -- 35
		__name = "EvilRP_NPC", -- 35
		__parent = _parent_0 -- 35
	}, { -- 35
		__index = function(cls, name) -- 35
			local val = rawget(_base_0, name) -- 35
			if val == nil then -- 35
				local parent = rawget(cls, "__parent") -- 35
				if parent then -- 35
					return parent[name] -- 35
				end -- 35
			else -- 35
				return val -- 35
			end -- 35
		end, -- 35
		__call = function(cls, ...) -- 35
			local _self_0 = setmetatable({ }, _base_0) -- 35
			cls.__init(_self_0, ...) -- 35
			return _self_0 -- 35
		end -- 35
	}) -- 35
	_base_0.__class = _class_0 -- 35
	if _parent_0.__inherited then -- 35
		_parent_0.__inherited(_parent_0, _class_0) -- 35
	end -- 35
	EvilRP_NPC = _class_0 -- 35
end -- 390
DEFINE_BASECLASS("evil_npc") -- 393
local RoyalConscript -- 394
do -- 394
	local _class_0 -- 394
	local _parent_0 = EvilRP_NPC -- 394
	local _base_0 = { -- 394
		__nextbot = "royalconscript", -- 396
		Base = "evil_npc", -- 397
		Faction = "Royalists", -- 398
		Category = "EvilRP", -- 399
		PrintName = "Conscript", -- 400
		Spawnable = true, -- 401
		Reward = 100, -- 402
		Weapon = { -- 402
			"evilrp_weapon/obrez", -- 402
			"evilrp_weapon/pacifier", -- 402
			"evilrp_weapon/warrant", -- 402
			"evilrp_weapon/viper" -- 402
		}, -- 404
		IdleSound = (function() -- 404
			local _accum_0 = { } -- 404
			local _len_0 = 1 -- 404
			for i = 1, 3 do -- 404
				_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav" -- 404
				_len_0 = _len_0 + 1 -- 404
			end -- 404
			return _accum_0 -- 404
		end)(), -- 405
		DeathSound = (function() -- 405
			local _accum_0 = { } -- 405
			local _len_0 = 1 -- 405
			for i = 1, 3 do -- 405
				_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav" -- 405
				_len_0 = _len_0 + 1 -- 405
			end -- 405
			return _accum_0 -- 405
		end)(), -- 406
		HurtSound = (function() -- 406
			local _accum_0 = { } -- 406
			local _len_0 = 1 -- 406
			for i = 1, 5 do -- 406
				_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav" -- 406
				_len_0 = _len_0 + 1 -- 406
			end -- 406
			return _accum_0 -- 406
		end)(), -- 409
		Initialize = function(self) -- 409
			self:SetModel("models/vel/evilwar/royalist.mdl") -- 410
			self:SetHealth(100) -- 411
			self.LoseTargetDist = 1200 -- 412
			self.SearchRadius = 1800 -- 413
			self.NextFire = CurTime() -- 415
			return self:Give(self.Weapon[math.random(1, #self.Weapon)]) -- 417
		end, -- 419
		HaveEnemy = function(self) -- 419
			local enemy = self:GetEnemy() -- 420
			if IsValid(enemy) then -- 421
				if self:GetRangeTo(enemy:GetPos()) > self.LoseTargetDist then -- 422
					return self:FindEnemy() -- 423
				elseif enemy:IsPlayer() then -- 424
					if not enemy:Alive() or enemy:Team() == TEAM_GHOST then -- 425
						return self:FindEnemy() -- 426
					end -- 425
					local job = RPExtraTeams[enemy:Team()] -- 427
					if job and job.category == "Royalists" then -- 428
						return self:FindEnemy() -- 429
					end -- 428
					return true -- 430
				elseif enemy:GetClass() == self:GetClass() then -- 431
					return self:FindEnemy() -- 432
				end -- 422
				return true -- 433
			end -- 421
			return self:FindEnemy() -- 434
		end -- 394
	} -- 394
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 434
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 394
			_base_0[_key_0] = _val_0 -- 394
		end -- 394
	end -- 434
	if _base_0.__index == nil then -- 394
		_base_0.__index = _base_0 -- 394
	end -- 434
	setmetatable(_base_0, _parent_0.__base) -- 394
	_class_0 = setmetatable({ -- 394
		__init = function(self, ...) -- 394
			return _class_0.__parent.__init(self, ...) -- 394
		end, -- 394
		__base = _base_0, -- 394
		__name = "RoyalConscript", -- 394
		__parent = _parent_0 -- 394
	}, { -- 394
		__index = function(cls, name) -- 394
			local val = rawget(_base_0, name) -- 394
			if val == nil then -- 394
				local parent = rawget(cls, "__parent") -- 394
				if parent then -- 394
					return parent[name] -- 394
				end -- 394
			else -- 394
				return val -- 394
			end -- 394
		end, -- 394
		__call = function(cls, ...) -- 394
			local _self_0 = setmetatable({ }, _base_0) -- 394
			cls.__init(_self_0, ...) -- 394
			return _self_0 -- 394
		end -- 394
	}) -- 394
	_base_0.__class = _class_0 -- 394
	if _parent_0.__inherited then -- 394
		_parent_0.__inherited(_parent_0, _class_0) -- 394
	end -- 394
	RoyalConscript = _class_0 -- 394
	return _class_0 -- 434
end -- 434
