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
			self:SetBodygroup(1, 1) -- 53
			self:SetBodygroup(2, 6) -- 54
			self:SetSkin(1) -- 55
			self:SetHealth(60) -- 56
			self.LoseTargetDist = 1200 -- 57
			self.SearchRadius = 1800 -- 58
			self.NextFire = CurTime() -- 60
			return self:Give(self.Weapon[math.random(1, #self.Weapon)]) -- 62
		end, -- 66
		Give = function(self, wepname) -- 66
			if CLIENT then -- 67
				return -- 67
			end -- 67
			if IsValid(self:GetActiveLuaWeapon()) then -- 68
				self:GetActiveLuaWeapon():Remove() -- 69
			end -- 68
			local wep = ents.Create(wepname) -- 71
			if IsValid(wep) then -- 72
				wep:SetPos(self:GetPos()) -- 73
				wep:SetOwner(self) -- 74
				wep:Spawn() -- 75
				wep:Activate() -- 76
				return self:SetupWeapon(wep) -- 77
			end -- 72
		end, -- 79
		SetupWeapon = function(self, wep) -- 79
			if not IsValid(wep) then -- 80
				return -- 80
			end -- 80
			self.m_ActualWeapon = wep -- 81
			wep:SetVelocity(vector_origin) -- 83
			wep:RemoveSolidFlags(FSOLID_TRIGGER) -- 84
			wep:SetOwner(self) -- 85
			wep:RemoveEffects(EF_ITEM_BLINK) -- 86
			wep:PhysicsDestroy() -- 87
			wep:SetParent(self) -- 89
			wep:SetMoveType(MOVETYPE_NONE) -- 90
			wep:AddEffects(EF_BONEMERGE) -- 91
			wep:AddSolidFlags(FSOLID_NOT_SOLID) -- 92
			wep:SetLocalPos(vector_origin) -- 93
			wep:SetLocalAngles(angle_zero) -- 94
			wep:SetTransmitWithParent(true) -- 95
			local clipSize = (wep.Primary and wep.Primary.ClipSize) or 30 -- 97
			wep.CurAmmo = clipSize -- 98
			wep.MaxClip = clipSize -- 99
			wep.Reloading = false -- 100
		end, -- 102
		OnInjured = function(self, dmginfo) -- 102
			if self.HurtSound then -- 103
				self:EmitSound(self.HurtSound[math.random(1, #self.HurtSound)]) -- 103
			end -- 103
			return -- 104
		end, -- 106
		OnTakeDamage = function(self, dmginfo) -- 106
			local attacker = dmginfo:GetAttacker() -- 107
			if IsValid(attacker) and attacker ~= self then -- 108
				self:SetEnemy(attacker) -- 108
			end -- 108
			return -- 109
		end, -- 111
		OnTraceAttack = function(self, dmginfo, dir, trace) -- 111
			if trace.HitGroup == HITGROUP_HEAD then -- 112
				return dmginfo:ScaleDamage(3.0) -- 113
			elseif trace.HitGroup == HITGROUP_LEFTARM or trace.HitGroup == HITGROUP_RIGHTARM then -- 115
				return dmginfo:ScaleDamage(0.7) -- 116
			end -- 112
		end, -- 118
		OnKilled = function(self, dmginfo) -- 118
			if self.DeathSound then -- 119
				self:EmitSound(self.DeathSound[math.random(1, #self.DeathSound)]) -- 119
			end -- 119
			local attacker = dmginfo:GetAttacker() -- 120
			if IsValid(attacker) and attacker:IsPlayer() then -- 121
				local job = RPExtraTeams[attacker:Team()] -- 122
				if job and job.category == self.Faction then -- 123
					attacker:Notify("<color=255,0,0> My own brother!") -- 124
					net.Start("evilrp_jumpscare") -- 125
					net.Send(attacker) -- 126
				end -- 123
				attacker:AddMoney(self.Reward) -- 127
			end -- 121
			local operation = GAMEMODE.War.active_operation -- 129
			if operation then -- 130
				operation:Reinforce(operation.Defender, -10) -- 131
			else -- 133
				local _obj_0 = GAMEMODE.War.nations["Wasteland"] -- 133
				_obj_0.Troops = _obj_0.Troops - 10 -- 133
			end -- 130
			self:BecomeRagdoll(dmginfo) -- 134
			self:Drop() -- 135
			self:Remove() -- 136
			return -- 137
		end, -- 139
		Drop = function(self) -- 139
			for i = 1, math.random(1, 2) do -- 140
				local cls = self.LootTable[math.random(1, #self.LootTable)] -- 141
				local loot = ents.Create(cls) -- 142
				loot:Spawn() -- 144
				loot:Activate() -- 145
				loot:SetPos(self:GetPos() + Vector(math.random(-10, 10), math.random(-10, 10), 0)) -- 146
			end -- 146
			local roll = math.random(1, 10) -- 148
			if roll <= 3 then -- 149
				local cls = "item/loot/intel" -- 150
				local loot = ents.Create(cls) -- 151
				loot:Spawn() -- 153
				loot:Activate() -- 154
				loot:SetPos(self:GetPos() + Vector(math.random(-10, 10), math.random(-10, 10), 0)) -- 155
			end -- 149
			local etab = self:GetActiveLuaWeapon() -- 157
			local weapon = etab:GetClass() -- 158
			if weapon and etab then -- 159
				local product = ents.Create("evilrp/spawned/weapon") -- 160
				product:SetModel(etab.WorldModel) -- 162
				product:SetWeaponClass(weapon) -- 163
				product:SetPos(self:GetPos() + Vector(math.random(-10, 10), math.random(-10, 10), 0)) -- 164
				product:Spawn() -- 165
				return product -- 161
			end -- 159
		end, -- 168
		GetActiveLuaWeapon = function(self) -- 168
			return self.m_ActualWeapon or NULL -- 169
		end, -- 171
		WeaponPrimaryAttack = function(self) -- 171
			if self.NextFire > CurTime() then -- 172
				return -- 173
			end -- 172
			if not self:HaveEnemy() then -- 174
				return -- 175
			end -- 174
			local wep = self:GetActiveLuaWeapon() -- 177
			if not IsValid(wep) then -- 178
				return -- 179
			end -- 178
			if wep.CurAmmo <= 0 then -- 181
				self:Reload() -- 182
				return -- 183
			end -- 181
			local myEyePos = self:GetPos() + Vector(0, 0, 50) -- 185
			local enemyChestPos = self:GetEnemy():GetPos() + Vector(0, 0, 45) -- 186
			local trace = { -- 189
				start = myEyePos, -- 189
				endpos = enemyChestPos, -- 190
				filter = { -- 191
					self, -- 191
					wep -- 191
				} -- 191
			} -- 188
			local tr = util.TraceLine(trace) -- 193
			if IsValid(tr.Entity) and tr.Entity:GetClass() == self:GetClass() then -- 194
				return -- 195
			end -- 194
			self:SetPoseParameter("aim_pitch", 0) -- 197
			local delay = (wep.Primary and wep.Primary.Delay) or 0.1 -- 199
			self.NextFire = CurTime() + delay + math.random(-delay / 10, delay / 10) -- 200
			local snd = (wep.Primary and wep.Primary.Sound) or "Weapon_SMG1.Single" -- 202
			if type(snd) == "table" then -- 203
				snd = table.Random(snd) -- 203
			end -- 203
			self:EmitSound(snd, 75, 100, 5) -- 204
			self:RestartGesture(ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2) -- 206
			local acc -- 208
			if wep.GetSpread then -- 208
				acc = wep:GetSpread() -- 208
			else -- 208
				acc = Vector(0.05, 0.05, 0) -- 208
			end -- 208
			local bullet = { -- 210
				Num = (wep.Primary and wep.Primary.NumBullets) or 1, -- 210
				Src = myEyePos, -- 211
				Dir = (enemyChestPos - myEyePos):GetNormalized(), -- 212
				Spread = acc * 5, -- 213
				Tracer = 1, -- 214
				Force = (wep.Primary and wep.Primary.Damage) or 10, -- 215
				Damage = (wep.Primary and wep.Primary.Damage) or 10, -- 216
				AmmoType = (wep.Primary and wep.Primary.Ammo) or "smg1", -- 217
				Attacker = self, -- 218
				Inflictor = wep -- 219
			} -- 209
			self:FireBullets(bullet) -- 221
			wep.CurAmmo = wep.CurAmmo - 1 -- 222
			return wep:MuzzleFlash() -- 223
		end, -- 225
		IsMelee = function(self) -- 225
			local wep = self:GetActiveLuaWeapon() -- 226
			if not IsValid(wep) then -- 227
				return true -- 228
			end -- 227
			local holdType = (wep.GetHoldType and wep:GetHoldType()) or "smg" -- 230
			return holdType == "melee" or holdType == "fist" or holdType == "knife" or holdType == "grenade" -- 231
		end, -- 233
		Reload = function(self) -- 233
			local wep = self:GetActiveLuaWeapon() -- 234
			if not IsValid(wep) or wep.Reloading then -- 235
				return -- 236
			end -- 235
			self:RestartGesture(ACT_HL2MP_GESTURE_RELOAD_AR2) -- 238
			wep.Reloading = true -- 239
			self:EmitSound("weapons/smg1/smg1_reload.wav") -- 240
			return timer.Simple(2.5, function() -- 242
				if IsValid(self) and IsValid(wep) then -- 243
					wep.CurAmmo = wep.MaxClip -- 244
					wep.Reloading = false -- 245
				end -- 243
			end) -- 245
		end, -- 247
		GetAnim = function(self, state) -- 247
			local wep = self:GetActiveLuaWeapon() -- 248
			if not IsValid(wep) then -- 249
				return _G["ACT_HL2MP_" .. state] -- 250
			end -- 249
			local holdType = (wep.GetHoldType and wep:GetHoldType()) or "smg" -- 252
			local translations = { -- 255
				pistol = "PISTOL", -- 255
				revolver = "REVOLVER", -- 256
				smg = "SMG1", -- 257
				ar2 = "AR2", -- 258
				shotgun = "SHOTGUN", -- 259
				crossbow = "CROSSBOW", -- 260
				rpg = "RPG", -- 261
				grenade = "GRENADE", -- 262
				melee = "MELEE" -- 263
			} -- 254
			local suffix = translations[holdType] or "SMG1" -- 265
			return _G["ACT_HL2MP_" .. state .. "_" .. suffix] -- 266
		end, -- 268
		BodyUpdate = function(self) -- 268
			local act = self:GetActivity() -- 269
			if act == self:GetAnim("RUN") or act == self:GetAnim("WALK") then -- 270
				return self:BodyMoveXY() -- 271
			else -- 273
				return self:FrameAdvance() -- 273
			end -- 270
		end, -- 275
		SetEnemy = function(self, ent) -- 275
			self.Enemy = ent -- 275
		end, -- 276
		GetEnemy = function(self) -- 276
			return self.Enemy -- 276
		end, -- 278
		HaveEnemy = function(self) -- 278
			local enemy = self:GetEnemy() -- 279
			if IsValid(enemy) then -- 280
				if self:GetRangeTo(enemy:GetPos()) > self.LoseTargetDist then -- 281
					return self:FindEnemy() -- 282
				elseif enemy:IsPlayer() and not enemy:Alive() then -- 283
					return self:FindEnemy() -- 284
				elseif enemy:GetClass() == self:GetClass() then -- 285
					return self:FindEnemy() -- 286
				elseif enemy:Team() == TEAM_GHOST then -- 287
					return self:FindEnemy() -- 288
				end -- 281
				return true -- 289
			end -- 280
			return self:FindEnemy() -- 290
		end, -- 292
		FindEnemy = function(self) -- 292
			local entsInCone = ents.FindInCone(self:GetPos(), self:GetForward(), self.SearchRadius, 0.707) -- 293
			for _index_0 = 1, #entsInCone do -- 294
				local v = entsInCone[_index_0] -- 294
				local _continue_0 = false -- 295
				repeat -- 295
					if v.Faction and v.Faction == self.Faction then -- 295
						_continue_0 = true -- 296
						break -- 296
					end -- 295
					if (v:IsNPC() or v:IsNextBot() or v:IsPlayer()) and self:Visible(v) then -- 299
						if v:Health() > 0 then -- 300
							self:SetEnemy(v) -- 301
							return true -- 302
						end -- 300
					end -- 299
					_continue_0 = true -- 295
				until true -- 303
				if not _continue_0 then -- 303
					break -- 303
				end -- 303
			end -- 303
			self:SetEnemy(nil) -- 304
			return false -- 305
		end, -- 307
		RunBehaviour = function(self) -- 307
			while true do -- 308
				if self:HaveEnemy() then -- 309
					if self:IsMelee() then -- 310
						self:StartActivity(self:GetAnim("RUN")) -- 311
						self.loco:SetDesiredSpeed(150) -- 312
						self:ChaseEnemy() -- 313
					else -- 315
						self:StartActivity(self:GetAnim("IDLE")) -- 315
						while self:HaveEnemy() and not self:IsMelee() do -- 317
							local target = self:GetEnemy() -- 318
							if not IsValid(target) then -- 319
								break -- 319
							end -- 319
							if not self:Visible(target) then -- 321
								self:StartActivity(self:GetAnim("RUN")) -- 322
								self.loco:SetDesiredSpeed(150) -- 323
								local path = Path("Follow") -- 325
								path:SetMinLookAheadDistance(300) -- 326
								path:SetGoalTolerance(20) -- 327
								path:Compute(self, target:GetPos()) -- 328
								if not path:IsValid() then -- 330
									coroutine.wait(1) -- 331
								else -- 333
									local nextPath = CurTime() + 5 -- 333
									while path:IsValid() and self:HaveEnemy() and CurTime() < nextPath do -- 334
										target = self:GetEnemy() -- 335
										if not IsValid(target) or self:Visible(target) then -- 336
											break -- 336
										end -- 336
										if path:GetAge() > 0.1 then -- 338
											path:Compute(self, target:GetPos()) -- 338
										end -- 338
										path:Update(self) -- 339
										if self.loco:IsStuck() then -- 341
											self:HandleStuck() -- 341
										end -- 341
										coroutine.yield() -- 342
									end -- 343
								end -- 330
							elseif self:GetRangeTo(target:GetPos()) > 800 then -- 344
								self:StartActivity(self:GetAnim("WALK")) -- 345
								self.loco:SetDesiredSpeed(100) -- 346
								local dir = (target:GetPos() - self:GetPos()):GetNormalized() -- 348
								local pos = self:GetPos() + dir * 250 -- 349
								self:MoveToPos(pos) -- 351
								self:StartActivity(self:GetAnim("IDLE")) -- 353
								local stop = CurTime() + math.Rand(1.0, 2.5) -- 355
								while CurTime() < stop do -- 356
									target = self:GetEnemy() -- 357
									if not IsValid(target) or not self:Visible(target) then -- 358
										break -- 358
									end -- 358
									self.loco:FaceTowards(target:GetPos()) -- 360
									self:WeaponPrimaryAttack() -- 361
									coroutine.yield() -- 362
								end -- 363
							else -- 365
								self:StartActivity(self:GetAnim("IDLE")) -- 365
								self.loco:FaceTowards(target:GetPos()) -- 366
								self:WeaponPrimaryAttack() -- 367
								coroutine.yield() -- 368
							end -- 321
						end -- 368
					end -- 310
				else -- 370
					self:StartActivity(self:GetAnim("WALK")) -- 370
					if self.IdleSound then -- 371
						self:EmitSound(self.IdleSound[math.random(1, #self.IdleSound)]) -- 371
					end -- 371
					self.loco:SetDesiredSpeed(100) -- 372
					local wander = self:GetPos() + Vector(math.Rand(-1, 1), math.Rand(-1, 1), 0) * 400 -- 374
					if navmesh.IsLoaded() and navmesh.GetNearestNavArea(wander, false) then -- 375
						self:MoveToPos(wander) -- 376
					else -- 378
						coroutine.wait(1) -- 378
					end -- 375
					self:StartActivity(self:GetAnim("IDLE")) -- 380
				end -- 309
				coroutine.wait(0.5) -- 382
			end -- 382
		end, -- 385
		ChaseEnemy = function(self) -- 385
			local path = Path("Follow") -- 386
			path:SetMinLookAheadDistance(300) -- 387
			path:SetGoalTolerance(20) -- 388
			path:Compute(self, self:GetEnemy():GetPos()) -- 389
			if not path:IsValid() then -- 391
				return "failed" -- 391
			end -- 391
			while path:IsValid() and self:HaveEnemy() do -- 393
				if path:GetAge() > 0.1 then -- 394
					path:Compute(self, self:GetEnemy():GetPos()) -- 395
				end -- 394
				self.loco:FaceTowards(self:GetEnemy():GetPos()) -- 397
				self:WeaponPrimaryAttack() -- 398
				path:Update(self) -- 400
				if self.loco:IsStuck() then -- 402
					self:HandleStuck() -- 403
					return "stuck" -- 404
				end -- 402
				coroutine.yield() -- 406
			end -- 406
			return "ok" -- 408
		end -- 35
	} -- 35
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 408
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 35
			_base_0[_key_0] = _val_0 -- 35
		end -- 35
	end -- 408
	if _base_0.__index == nil then -- 35
		_base_0.__index = _base_0 -- 35
	end -- 408
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
end -- 408
DEFINE_BASECLASS("evil_npc") -- 411
local RoyalConscript -- 412
do -- 412
	local _class_0 -- 412
	local _parent_0 = EvilRP_NPC -- 412
	local _base_0 = { -- 412
		__nextbot = "royalconscript", -- 414
		Base = "evil_npc", -- 415
		Faction = "Royalists", -- 416
		Category = "EvilRP", -- 417
		PrintName = "Conscript", -- 418
		Spawnable = true, -- 419
		Reward = 100, -- 420
		Weapon = { -- 420
			"evilrp_weapon/obrez", -- 420
			"evilrp_weapon/pacifier", -- 420
			"evilrp_weapon/warrant", -- 420
			"evilrp_weapon/viper" -- 420
		}, -- 422
		IdleSound = (function() -- 422
			local _accum_0 = { } -- 422
			local _len_0 = 1 -- 422
			for i = 1, 3 do -- 422
				_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav" -- 422
				_len_0 = _len_0 + 1 -- 422
			end -- 422
			return _accum_0 -- 422
		end)(), -- 423
		DeathSound = (function() -- 423
			local _accum_0 = { } -- 423
			local _len_0 = 1 -- 423
			for i = 1, 3 do -- 423
				_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav" -- 423
				_len_0 = _len_0 + 1 -- 423
			end -- 423
			return _accum_0 -- 423
		end)(), -- 424
		HurtSound = (function() -- 424
			local _accum_0 = { } -- 424
			local _len_0 = 1 -- 424
			for i = 1, 5 do -- 424
				_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav" -- 424
				_len_0 = _len_0 + 1 -- 424
			end -- 424
			return _accum_0 -- 424
		end)(), -- 427
		Initialize = function(self) -- 427
			self:SetModel("models/vel/evilwar/royalist.mdl") -- 428
			self:SetHealth(100) -- 429
			self.LoseTargetDist = 1200 -- 430
			self.SearchRadius = 1800 -- 431
			self.NextFire = CurTime() -- 433
			return self:Give(self.Weapon[math.random(1, #self.Weapon)]) -- 435
		end, -- 437
		HaveEnemy = function(self) -- 437
			local enemy = self:GetEnemy() -- 438
			if IsValid(enemy) then -- 439
				if self:GetRangeTo(enemy:GetPos()) > self.LoseTargetDist then -- 440
					return self:FindEnemy() -- 441
				elseif enemy:IsPlayer() then -- 442
					if not enemy:Alive() or enemy:Team() == TEAM_GHOST then -- 443
						return self:FindEnemy() -- 444
					end -- 443
					local job = RPExtraTeams[enemy:Team()] -- 445
					if job and job.category == "Royalists" then -- 446
						return self:FindEnemy() -- 447
					end -- 446
					return true -- 448
				elseif enemy:GetClass() == self:GetClass() then -- 449
					return self:FindEnemy() -- 450
				end -- 440
				return true -- 451
			end -- 439
			return self:FindEnemy() -- 452
		end -- 412
	} -- 412
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 452
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 412
			_base_0[_key_0] = _val_0 -- 412
		end -- 412
	end -- 452
	if _base_0.__index == nil then -- 412
		_base_0.__index = _base_0 -- 412
	end -- 452
	setmetatable(_base_0, _parent_0.__base) -- 412
	_class_0 = setmetatable({ -- 412
		__init = function(self, ...) -- 412
			return _class_0.__parent.__init(self, ...) -- 412
		end, -- 412
		__base = _base_0, -- 412
		__name = "RoyalConscript", -- 412
		__parent = _parent_0 -- 412
	}, { -- 412
		__index = function(cls, name) -- 412
			local val = rawget(_base_0, name) -- 412
			if val == nil then -- 412
				local parent = rawget(cls, "__parent") -- 412
				if parent then -- 412
					return parent[name] -- 412
				end -- 412
			else -- 412
				return val -- 412
			end -- 412
		end, -- 412
		__call = function(cls, ...) -- 412
			local _self_0 = setmetatable({ }, _base_0) -- 412
			cls.__init(_self_0, ...) -- 412
			return _self_0 -- 412
		end -- 412
	}) -- 412
	_base_0.__class = _class_0 -- 412
	if _parent_0.__inherited then -- 412
		_parent_0.__inherited(_parent_0, _class_0) -- 412
	end -- 412
	RoyalConscript = _class_0 -- 412
	return _class_0 -- 452
end -- 452
