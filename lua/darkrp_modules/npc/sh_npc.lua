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
		Weapon = { -- 43
			"evilrp_weapon/obrez", -- 43
			"evilrp_weapon/pacifier", -- 43
			"evilrp_weapon/warrant", -- 43
			"evilrp_weapon/viper" -- 43
		}, -- 44
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
			return self:Give(self.Weapon[math.random(1, #self.Weapon)]) -- 59
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
			local operation = GAMEMODE.War.active_operation -- 126
			if operation then -- 127
				operation:Reinforce(operation.Defender, -10) -- 128
			else -- 130
				local _obj_0 = GAMEMODE.War.nations["Wasteland"] -- 130
				_obj_0.Troops = _obj_0.Troops - 10 -- 130
			end -- 127
			self:BecomeRagdoll(dmginfo) -- 131
			self:Drop() -- 132
			return -- 133
		end, -- 135
		Drop = function(self) -- 135
			for i = 1, math.random(1, 2) do -- 136
				local cls = self.LootTable[math.random(1, #self.LootTable)] -- 137
				local loot = ents.Create(cls) -- 138
				loot:Spawn() -- 140
				loot:Activate() -- 141
				loot:SetPos(self:GetPos() + Vector(math.random(-10, 10), math.random(-10, 10), 0)) -- 142
			end -- 142
			local roll = math.random(1, 10) -- 144
			if roll <= 3 then -- 145
				local cls = "item/loot/intel" -- 146
				local loot = ents.Create(cls) -- 147
				loot:Spawn() -- 149
				loot:Activate() -- 150
				loot:SetPos(self:GetPos() + Vector(math.random(-10, 10), math.random(-10, 10), 0)) -- 151
			end -- 145
			local etab = self:GetActiveLuaWeapon() -- 153
			local weapon = etab:GetClass() -- 154
			if weapon and etab then -- 155
				local product = ents.Create("evilrp/spawned/weapon") -- 156
				product:SetModel(etab.WorldModel) -- 158
				product:SetWeaponClass(weapon) -- 159
				product:SetPos(self:GetPos() + Vector(math.random(-10, 10), math.random(-10, 10), 0)) -- 160
				product:Spawn() -- 161
				return product -- 157
			end -- 155
		end, -- 164
		GetActiveLuaWeapon = function(self) -- 164
			return self.m_ActualWeapon or NULL -- 165
		end, -- 167
		WeaponPrimaryAttack = function(self) -- 167
			if self.NextFire > CurTime() then -- 168
				return -- 169
			end -- 168
			if not self:HaveEnemy() then -- 170
				return -- 171
			end -- 170
			local wep = self:GetActiveLuaWeapon() -- 173
			if not IsValid(wep) then -- 174
				return -- 175
			end -- 174
			if wep.CurAmmo <= 0 then -- 177
				self:Reload() -- 178
				return -- 179
			end -- 177
			local myEyePos = self:GetPos() + Vector(0, 0, 50) -- 181
			local enemyChestPos = self:GetEnemy():GetPos() + Vector(0, 0, 45) -- 182
			local trace = { -- 185
				start = myEyePos, -- 185
				endpos = enemyChestPos, -- 186
				filter = { -- 187
					self, -- 187
					wep -- 187
				} -- 187
			} -- 184
			local tr = util.TraceLine(trace) -- 189
			if IsValid(tr.Entity) and tr.Entity:GetClass() == self:GetClass() then -- 190
				return -- 191
			end -- 190
			self:SetPoseParameter("aim_pitch", 0) -- 193
			local delay = (wep.Primary and wep.Primary.Delay) or 0.1 -- 195
			self.NextFire = CurTime() + delay + math.random(-delay / 10, delay / 10) -- 196
			local snd = (wep.Primary and wep.Primary.Sound) or "Weapon_SMG1.Single" -- 198
			if type(snd) == "table" then -- 199
				snd = table.Random(snd) -- 199
			end -- 199
			self:EmitSound(snd, 75, 100, 5) -- 200
			self:RestartGesture(ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2) -- 202
			local acc -- 204
			if wep.GetSpread then -- 204
				acc = wep:GetSpread() -- 204
			else -- 204
				acc = Vector(0.05, 0.05, 0) -- 204
			end -- 204
			local bullet = { -- 206
				Num = (wep.Primary and wep.Primary.NumBullets) or 1, -- 206
				Src = myEyePos, -- 207
				Dir = (enemyChestPos - myEyePos):GetNormalized(), -- 208
				Spread = acc * 3, -- 209
				Tracer = 1, -- 210
				Force = (wep.Primary and wep.Primary.Damage) or 10, -- 211
				Damage = (wep.Primary and wep.Primary.Damage) or 10, -- 212
				AmmoType = (wep.Primary and wep.Primary.Ammo) or "smg1", -- 213
				Attacker = self, -- 214
				Inflictor = wep -- 215
			} -- 205
			self:FireBullets(bullet) -- 217
			wep.CurAmmo = wep.CurAmmo - 1 -- 218
			return wep:MuzzleFlash() -- 219
		end, -- 221
		IsMelee = function(self) -- 221
			local wep = self:GetActiveLuaWeapon() -- 222
			if not IsValid(wep) then -- 223
				return true -- 224
			end -- 223
			local holdType = (wep.GetHoldType and wep:GetHoldType()) or "smg" -- 226
			return holdType == "melee" or holdType == "fist" or holdType == "knife" or holdType == "grenade" -- 227
		end, -- 229
		Reload = function(self) -- 229
			local wep = self:GetActiveLuaWeapon() -- 230
			if not IsValid(wep) or wep.Reloading then -- 231
				return -- 232
			end -- 231
			self:RestartGesture(ACT_HL2MP_GESTURE_RELOAD_AR2) -- 234
			wep.Reloading = true -- 235
			self:EmitSound("weapons/smg1/smg1_reload.wav") -- 236
			return timer.Simple(2.5, function() -- 238
				if IsValid(self) and IsValid(wep) then -- 239
					wep.CurAmmo = wep.MaxClip -- 240
					wep.Reloading = false -- 241
				end -- 239
			end) -- 241
		end, -- 243
		GetAnim = function(self, state) -- 243
			local wep = self:GetActiveLuaWeapon() -- 244
			if not IsValid(wep) then -- 245
				return _G["ACT_HL2MP_" .. state] -- 246
			end -- 245
			local holdType = (wep.GetHoldType and wep:GetHoldType()) or "smg" -- 248
			local translations = { -- 251
				pistol = "PISTOL", -- 251
				revolver = "REVOLVER", -- 252
				smg = "SMG1", -- 253
				ar2 = "AR2", -- 254
				shotgun = "SHOTGUN", -- 255
				crossbow = "CROSSBOW", -- 256
				rpg = "RPG", -- 257
				grenade = "GRENADE", -- 258
				melee = "MELEE" -- 259
			} -- 250
			local suffix = translations[holdType] or "SMG1" -- 261
			return _G["ACT_HL2MP_" .. state .. "_" .. suffix] -- 262
		end, -- 264
		BodyUpdate = function(self) -- 264
			local act = self:GetActivity() -- 265
			if act == self:GetAnim("RUN") or act == self:GetAnim("WALK") then -- 266
				return self:BodyMoveXY() -- 267
			else -- 269
				return self:FrameAdvance() -- 269
			end -- 266
		end, -- 271
		SetEnemy = function(self, ent) -- 271
			self.Enemy = ent -- 271
		end, -- 272
		GetEnemy = function(self) -- 272
			return self.Enemy -- 272
		end, -- 274
		HaveEnemy = function(self) -- 274
			local enemy = self:GetEnemy() -- 275
			if IsValid(enemy) then -- 276
				if self:GetRangeTo(enemy:GetPos()) > self.LoseTargetDist then -- 277
					return self:FindEnemy() -- 278
				elseif enemy:IsPlayer() and not enemy:Alive() then -- 279
					return self:FindEnemy() -- 280
				elseif enemy:GetClass() == self:GetClass() then -- 281
					return self:FindEnemy() -- 282
				elseif enemy:Team() == TEAM_GHOST then -- 283
					return self:FindEnemy() -- 284
				end -- 277
				return true -- 285
			end -- 276
			return self:FindEnemy() -- 286
		end, -- 288
		FindEnemy = function(self) -- 288
			local entsInCone = ents.FindInCone(self:GetPos(), self:GetForward(), self.SearchRadius, 0.707) -- 289
			for _index_0 = 1, #entsInCone do -- 290
				local v = entsInCone[_index_0] -- 290
				local _continue_0 = false -- 291
				repeat -- 291
					if v.Faction and v.Faction == self.Faction then -- 291
						_continue_0 = true -- 292
						break -- 292
					end -- 291
					if (v:IsNPC() or v:IsNextBot() or v:IsPlayer()) and self:Visible(v) then -- 295
						if v:Health() > 0 then -- 296
							self:SetEnemy(v) -- 297
							return true -- 298
						end -- 296
					end -- 295
					_continue_0 = true -- 291
				until true -- 299
				if not _continue_0 then -- 299
					break -- 299
				end -- 299
			end -- 299
			self:SetEnemy(nil) -- 300
			return false -- 301
		end, -- 303
		RunBehaviour = function(self) -- 303
			while true do -- 304
				if self:HaveEnemy() then -- 305
					if self:IsMelee() then -- 306
						self:StartActivity(self:GetAnim("RUN")) -- 307
						self.loco:SetDesiredSpeed(150) -- 308
						self:ChaseEnemy() -- 309
					else -- 311
						self:StartActivity(self:GetAnim("IDLE")) -- 311
						while self:HaveEnemy() and not self:IsMelee() do -- 313
							local target = self:GetEnemy() -- 314
							if not IsValid(target) then -- 315
								break -- 315
							end -- 315
							if not self:Visible(target) then -- 317
								self:StartActivity(self:GetAnim("RUN")) -- 318
								self.loco:SetDesiredSpeed(150) -- 319
								local path = Path("Follow") -- 321
								path:SetMinLookAheadDistance(300) -- 322
								path:SetGoalTolerance(20) -- 323
								path:Compute(self, target:GetPos()) -- 324
								if not path:IsValid() then -- 326
									coroutine.wait(1) -- 327
								else -- 329
									local nextPath = CurTime() + 5 -- 329
									while path:IsValid() and self:HaveEnemy() and CurTime() < nextPath do -- 330
										target = self:GetEnemy() -- 331
										if not IsValid(target) or self:Visible(target) then -- 332
											break -- 332
										end -- 332
										if path:GetAge() > 0.1 then -- 334
											path:Compute(self, target:GetPos()) -- 334
										end -- 334
										path:Update(self) -- 335
										if self.loco:IsStuck() then -- 337
											self:HandleStuck() -- 337
										end -- 337
										coroutine.yield() -- 338
									end -- 339
								end -- 326
							elseif self:GetRangeTo(target:GetPos()) > 800 then -- 340
								self:StartActivity(self:GetAnim("WALK")) -- 341
								self.loco:SetDesiredSpeed(100) -- 342
								local dir = (target:GetPos() - self:GetPos()):GetNormalized() -- 344
								local pos = self:GetPos() + dir * 250 -- 345
								self:MoveToPos(pos) -- 347
								self:StartActivity(self:GetAnim("IDLE")) -- 349
								local stop = CurTime() + math.Rand(1.0, 2.5) -- 351
								while CurTime() < stop do -- 352
									target = self:GetEnemy() -- 353
									if not IsValid(target) or not self:Visible(target) then -- 354
										break -- 354
									end -- 354
									self.loco:FaceTowards(target:GetPos()) -- 356
									self:WeaponPrimaryAttack() -- 357
									coroutine.yield() -- 358
								end -- 359
							else -- 361
								self:StartActivity(self:GetAnim("IDLE")) -- 361
								self.loco:FaceTowards(target:GetPos()) -- 362
								self:WeaponPrimaryAttack() -- 363
								coroutine.yield() -- 364
							end -- 317
						end -- 364
					end -- 306
				else -- 366
					self:StartActivity(self:GetAnim("WALK")) -- 366
					if self.IdleSound then -- 367
						self:EmitSound(self.IdleSound[math.random(1, #self.IdleSound)]) -- 367
					end -- 367
					self.loco:SetDesiredSpeed(100) -- 368
					local wander = self:GetPos() + Vector(math.Rand(-1, 1), math.Rand(-1, 1), 0) * 400 -- 370
					if navmesh.IsLoaded() and navmesh.GetNearestNavArea(wander, false) then -- 371
						self:MoveToPos(wander) -- 372
					else -- 374
						coroutine.wait(1) -- 374
					end -- 371
					self:StartActivity(self:GetAnim("IDLE")) -- 376
				end -- 305
				coroutine.wait(0.5) -- 378
			end -- 378
		end, -- 381
		ChaseEnemy = function(self) -- 381
			local path = Path("Follow") -- 382
			path:SetMinLookAheadDistance(300) -- 383
			path:SetGoalTolerance(20) -- 384
			path:Compute(self, self:GetEnemy():GetPos()) -- 385
			if not path:IsValid() then -- 387
				return "failed" -- 387
			end -- 387
			while path:IsValid() and self:HaveEnemy() do -- 389
				if path:GetAge() > 0.1 then -- 390
					path:Compute(self, self:GetEnemy():GetPos()) -- 391
				end -- 390
				self.loco:FaceTowards(self:GetEnemy():GetPos()) -- 393
				self:WeaponPrimaryAttack() -- 394
				path:Update(self) -- 396
				if self.loco:IsStuck() then -- 398
					self:HandleStuck() -- 399
					return "stuck" -- 400
				end -- 398
				coroutine.yield() -- 402
			end -- 402
			return "ok" -- 404
		end -- 35
	} -- 35
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 404
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 35
			_base_0[_key_0] = _val_0 -- 35
		end -- 35
	end -- 404
	if _base_0.__index == nil then -- 35
		_base_0.__index = _base_0 -- 35
	end -- 404
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
end -- 404
DEFINE_BASECLASS("evil_npc") -- 407
local RoyalConscript -- 408
do -- 408
	local _class_0 -- 408
	local _parent_0 = EvilRP_NPC -- 408
	local _base_0 = { -- 408
		__nextbot = "royalconscript", -- 410
		Base = "evil_npc", -- 411
		Faction = "Royalists", -- 412
		Category = "EvilRP", -- 413
		PrintName = "Conscript", -- 414
		Spawnable = true, -- 415
		Reward = 100, -- 416
		Weapon = { -- 416
			"evilrp_weapon/obrez", -- 416
			"evilrp_weapon/pacifier", -- 416
			"evilrp_weapon/warrant", -- 416
			"evilrp_weapon/viper" -- 416
		}, -- 418
		IdleSound = (function() -- 418
			local _accum_0 = { } -- 418
			local _len_0 = 1 -- 418
			for i = 1, 3 do -- 418
				_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav" -- 418
				_len_0 = _len_0 + 1 -- 418
			end -- 418
			return _accum_0 -- 418
		end)(), -- 419
		DeathSound = (function() -- 419
			local _accum_0 = { } -- 419
			local _len_0 = 1 -- 419
			for i = 1, 3 do -- 419
				_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav" -- 419
				_len_0 = _len_0 + 1 -- 419
			end -- 419
			return _accum_0 -- 419
		end)(), -- 420
		HurtSound = (function() -- 420
			local _accum_0 = { } -- 420
			local _len_0 = 1 -- 420
			for i = 1, 5 do -- 420
				_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav" -- 420
				_len_0 = _len_0 + 1 -- 420
			end -- 420
			return _accum_0 -- 420
		end)(), -- 423
		Initialize = function(self) -- 423
			self:SetModel("models/vel/evilwar/royalist.mdl") -- 424
			self:SetHealth(100) -- 425
			self.LoseTargetDist = 1200 -- 426
			self.SearchRadius = 1800 -- 427
			self.NextFire = CurTime() -- 429
			return self:Give(self.Weapon[math.random(1, #self.Weapon)]) -- 431
		end, -- 433
		HaveEnemy = function(self) -- 433
			local enemy = self:GetEnemy() -- 434
			if IsValid(enemy) then -- 435
				if self:GetRangeTo(enemy:GetPos()) > self.LoseTargetDist then -- 436
					return self:FindEnemy() -- 437
				elseif enemy:IsPlayer() then -- 438
					if not enemy:Alive() or enemy:Team() == TEAM_GHOST then -- 439
						return self:FindEnemy() -- 440
					end -- 439
					local job = RPExtraTeams[enemy:Team()] -- 441
					if job and job.category == "Royalists" then -- 442
						return self:FindEnemy() -- 443
					end -- 442
					return true -- 444
				elseif enemy:GetClass() == self:GetClass() then -- 445
					return self:FindEnemy() -- 446
				end -- 436
				return true -- 447
			end -- 435
			return self:FindEnemy() -- 448
		end -- 408
	} -- 408
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 448
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 408
			_base_0[_key_0] = _val_0 -- 408
		end -- 408
	end -- 448
	if _base_0.__index == nil then -- 408
		_base_0.__index = _base_0 -- 408
	end -- 448
	setmetatable(_base_0, _parent_0.__base) -- 408
	_class_0 = setmetatable({ -- 408
		__init = function(self, ...) -- 408
			return _class_0.__parent.__init(self, ...) -- 408
		end, -- 408
		__base = _base_0, -- 408
		__name = "RoyalConscript", -- 408
		__parent = _parent_0 -- 408
	}, { -- 408
		__index = function(cls, name) -- 408
			local val = rawget(_base_0, name) -- 408
			if val == nil then -- 408
				local parent = rawget(cls, "__parent") -- 408
				if parent then -- 408
					return parent[name] -- 408
				end -- 408
			else -- 408
				return val -- 408
			end -- 408
		end, -- 408
		__call = function(cls, ...) -- 408
			local _self_0 = setmetatable({ }, _base_0) -- 408
			cls.__init(_self_0, ...) -- 408
			return _self_0 -- 408
		end -- 408
	}) -- 408
	_base_0.__class = _class_0 -- 408
	if _parent_0.__inherited then -- 408
		_parent_0.__inherited(_parent_0, _class_0) -- 408
	end -- 408
	RoyalConscript = _class_0 -- 408
	return _class_0 -- 448
end -- 448
