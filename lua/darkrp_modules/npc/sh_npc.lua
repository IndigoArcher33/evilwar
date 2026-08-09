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
			self:SetHealth(100) -- 56
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
			return -- 136
		end, -- 138
		Drop = function(self) -- 138
			for i = 1, math.random(1, 2) do -- 139
				local cls = self.LootTable[math.random(1, #self.LootTable)] -- 140
				local loot = ents.Create(cls) -- 141
				loot:Spawn() -- 143
				loot:Activate() -- 144
				loot:SetPos(self:GetPos() + Vector(math.random(-10, 10), math.random(-10, 10), 0)) -- 145
			end -- 145
			local roll = math.random(1, 10) -- 147
			if roll <= 3 then -- 148
				local cls = "item/loot/intel" -- 149
				local loot = ents.Create(cls) -- 150
				loot:Spawn() -- 152
				loot:Activate() -- 153
				loot:SetPos(self:GetPos() + Vector(math.random(-10, 10), math.random(-10, 10), 0)) -- 154
			end -- 148
			local etab = self:GetActiveLuaWeapon() -- 156
			local weapon = etab:GetClass() -- 157
			if weapon and etab then -- 158
				local product = ents.Create("evilrp/spawned/weapon") -- 159
				product:SetModel(etab.WorldModel) -- 161
				product:SetWeaponClass(weapon) -- 162
				product:SetPos(self:GetPos() + Vector(math.random(-10, 10), math.random(-10, 10), 0)) -- 163
				product:Spawn() -- 164
				return product -- 160
			end -- 158
		end, -- 167
		GetActiveLuaWeapon = function(self) -- 167
			return self.m_ActualWeapon or NULL -- 168
		end, -- 170
		WeaponPrimaryAttack = function(self) -- 170
			if self.NextFire > CurTime() then -- 171
				return -- 172
			end -- 171
			if not self:HaveEnemy() then -- 173
				return -- 174
			end -- 173
			local wep = self:GetActiveLuaWeapon() -- 176
			if not IsValid(wep) then -- 177
				return -- 178
			end -- 177
			if wep.CurAmmo <= 0 then -- 180
				self:Reload() -- 181
				return -- 182
			end -- 180
			local myEyePos = self:GetPos() + Vector(0, 0, 50) -- 184
			local enemyChestPos = self:GetEnemy():GetPos() + Vector(0, 0, 45) -- 185
			local trace = { -- 188
				start = myEyePos, -- 188
				endpos = enemyChestPos, -- 189
				filter = { -- 190
					self, -- 190
					wep -- 190
				} -- 190
			} -- 187
			local tr = util.TraceLine(trace) -- 192
			if IsValid(tr.Entity) and tr.Entity:GetClass() == self:GetClass() then -- 193
				return -- 194
			end -- 193
			self:SetPoseParameter("aim_pitch", 0) -- 196
			local delay = (wep.Primary and wep.Primary.Delay) or 0.1 -- 198
			self.NextFire = CurTime() + delay + math.random(-delay / 10, delay / 10) -- 199
			local snd = (wep.Primary and wep.Primary.Sound) or "Weapon_SMG1.Single" -- 201
			if type(snd) == "table" then -- 202
				snd = table.Random(snd) -- 202
			end -- 202
			self:EmitSound(snd, 75, 100, 5) -- 203
			self:RestartGesture(ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2) -- 205
			local acc -- 207
			if wep.GetSpread then -- 207
				acc = wep:GetSpread() -- 207
			else -- 207
				acc = Vector(0.05, 0.05, 0) -- 207
			end -- 207
			local bullet = { -- 209
				Num = (wep.Primary and wep.Primary.NumBullets) or 1, -- 209
				Src = myEyePos, -- 210
				Dir = (enemyChestPos - myEyePos):GetNormalized(), -- 211
				Spread = acc * 3, -- 212
				Tracer = 1, -- 213
				Force = (wep.Primary and wep.Primary.Damage) or 10, -- 214
				Damage = (wep.Primary and wep.Primary.Damage) or 10, -- 215
				AmmoType = (wep.Primary and wep.Primary.Ammo) or "smg1", -- 216
				Attacker = self, -- 217
				Inflictor = wep -- 218
			} -- 208
			self:FireBullets(bullet) -- 220
			wep.CurAmmo = wep.CurAmmo - 1 -- 221
			return wep:MuzzleFlash() -- 222
		end, -- 224
		IsMelee = function(self) -- 224
			local wep = self:GetActiveLuaWeapon() -- 225
			if not IsValid(wep) then -- 226
				return true -- 227
			end -- 226
			local holdType = (wep.GetHoldType and wep:GetHoldType()) or "smg" -- 229
			return holdType == "melee" or holdType == "fist" or holdType == "knife" or holdType == "grenade" -- 230
		end, -- 232
		Reload = function(self) -- 232
			local wep = self:GetActiveLuaWeapon() -- 233
			if not IsValid(wep) or wep.Reloading then -- 234
				return -- 235
			end -- 234
			self:RestartGesture(ACT_HL2MP_GESTURE_RELOAD_AR2) -- 237
			wep.Reloading = true -- 238
			self:EmitSound("weapons/smg1/smg1_reload.wav") -- 239
			return timer.Simple(2.5, function() -- 241
				if IsValid(self) and IsValid(wep) then -- 242
					wep.CurAmmo = wep.MaxClip -- 243
					wep.Reloading = false -- 244
				end -- 242
			end) -- 244
		end, -- 246
		GetAnim = function(self, state) -- 246
			local wep = self:GetActiveLuaWeapon() -- 247
			if not IsValid(wep) then -- 248
				return _G["ACT_HL2MP_" .. state] -- 249
			end -- 248
			local holdType = (wep.GetHoldType and wep:GetHoldType()) or "smg" -- 251
			local translations = { -- 254
				pistol = "PISTOL", -- 254
				revolver = "REVOLVER", -- 255
				smg = "SMG1", -- 256
				ar2 = "AR2", -- 257
				shotgun = "SHOTGUN", -- 258
				crossbow = "CROSSBOW", -- 259
				rpg = "RPG", -- 260
				grenade = "GRENADE", -- 261
				melee = "MELEE" -- 262
			} -- 253
			local suffix = translations[holdType] or "SMG1" -- 264
			return _G["ACT_HL2MP_" .. state .. "_" .. suffix] -- 265
		end, -- 267
		BodyUpdate = function(self) -- 267
			local act = self:GetActivity() -- 268
			if act == self:GetAnim("RUN") or act == self:GetAnim("WALK") then -- 269
				return self:BodyMoveXY() -- 270
			else -- 272
				return self:FrameAdvance() -- 272
			end -- 269
		end, -- 274
		SetEnemy = function(self, ent) -- 274
			self.Enemy = ent -- 274
		end, -- 275
		GetEnemy = function(self) -- 275
			return self.Enemy -- 275
		end, -- 277
		HaveEnemy = function(self) -- 277
			local enemy = self:GetEnemy() -- 278
			if IsValid(enemy) then -- 279
				if self:GetRangeTo(enemy:GetPos()) > self.LoseTargetDist then -- 280
					return self:FindEnemy() -- 281
				elseif enemy:IsPlayer() and not enemy:Alive() then -- 282
					return self:FindEnemy() -- 283
				elseif enemy:GetClass() == self:GetClass() then -- 284
					return self:FindEnemy() -- 285
				elseif enemy:Team() == TEAM_GHOST then -- 286
					return self:FindEnemy() -- 287
				end -- 280
				return true -- 288
			end -- 279
			return self:FindEnemy() -- 289
		end, -- 291
		FindEnemy = function(self) -- 291
			local entsInCone = ents.FindInCone(self:GetPos(), self:GetForward(), self.SearchRadius, 0.707) -- 292
			for _index_0 = 1, #entsInCone do -- 293
				local v = entsInCone[_index_0] -- 293
				local _continue_0 = false -- 294
				repeat -- 294
					if v.Faction and v.Faction == self.Faction then -- 294
						_continue_0 = true -- 295
						break -- 295
					end -- 294
					if (v:IsNPC() or v:IsNextBot() or v:IsPlayer()) and self:Visible(v) then -- 298
						if v:Health() > 0 then -- 299
							self:SetEnemy(v) -- 300
							return true -- 301
						end -- 299
					end -- 298
					_continue_0 = true -- 294
				until true -- 302
				if not _continue_0 then -- 302
					break -- 302
				end -- 302
			end -- 302
			self:SetEnemy(nil) -- 303
			return false -- 304
		end, -- 306
		RunBehaviour = function(self) -- 306
			while true do -- 307
				if self:HaveEnemy() then -- 308
					if self:IsMelee() then -- 309
						self:StartActivity(self:GetAnim("RUN")) -- 310
						self.loco:SetDesiredSpeed(150) -- 311
						self:ChaseEnemy() -- 312
					else -- 314
						self:StartActivity(self:GetAnim("IDLE")) -- 314
						while self:HaveEnemy() and not self:IsMelee() do -- 316
							local target = self:GetEnemy() -- 317
							if not IsValid(target) then -- 318
								break -- 318
							end -- 318
							if not self:Visible(target) then -- 320
								self:StartActivity(self:GetAnim("RUN")) -- 321
								self.loco:SetDesiredSpeed(150) -- 322
								local path = Path("Follow") -- 324
								path:SetMinLookAheadDistance(300) -- 325
								path:SetGoalTolerance(20) -- 326
								path:Compute(self, target:GetPos()) -- 327
								if not path:IsValid() then -- 329
									coroutine.wait(1) -- 330
								else -- 332
									local nextPath = CurTime() + 5 -- 332
									while path:IsValid() and self:HaveEnemy() and CurTime() < nextPath do -- 333
										target = self:GetEnemy() -- 334
										if not IsValid(target) or self:Visible(target) then -- 335
											break -- 335
										end -- 335
										if path:GetAge() > 0.1 then -- 337
											path:Compute(self, target:GetPos()) -- 337
										end -- 337
										path:Update(self) -- 338
										if self.loco:IsStuck() then -- 340
											self:HandleStuck() -- 340
										end -- 340
										coroutine.yield() -- 341
									end -- 342
								end -- 329
							elseif self:GetRangeTo(target:GetPos()) > 800 then -- 343
								self:StartActivity(self:GetAnim("WALK")) -- 344
								self.loco:SetDesiredSpeed(100) -- 345
								local dir = (target:GetPos() - self:GetPos()):GetNormalized() -- 347
								local pos = self:GetPos() + dir * 250 -- 348
								self:MoveToPos(pos) -- 350
								self:StartActivity(self:GetAnim("IDLE")) -- 352
								local stop = CurTime() + math.Rand(1.0, 2.5) -- 354
								while CurTime() < stop do -- 355
									target = self:GetEnemy() -- 356
									if not IsValid(target) or not self:Visible(target) then -- 357
										break -- 357
									end -- 357
									self.loco:FaceTowards(target:GetPos()) -- 359
									self:WeaponPrimaryAttack() -- 360
									coroutine.yield() -- 361
								end -- 362
							else -- 364
								self:StartActivity(self:GetAnim("IDLE")) -- 364
								self.loco:FaceTowards(target:GetPos()) -- 365
								self:WeaponPrimaryAttack() -- 366
								coroutine.yield() -- 367
							end -- 320
						end -- 367
					end -- 309
				else -- 369
					self:StartActivity(self:GetAnim("WALK")) -- 369
					if self.IdleSound then -- 370
						self:EmitSound(self.IdleSound[math.random(1, #self.IdleSound)]) -- 370
					end -- 370
					self.loco:SetDesiredSpeed(100) -- 371
					local wander = self:GetPos() + Vector(math.Rand(-1, 1), math.Rand(-1, 1), 0) * 400 -- 373
					if navmesh.IsLoaded() and navmesh.GetNearestNavArea(wander, false) then -- 374
						self:MoveToPos(wander) -- 375
					else -- 377
						coroutine.wait(1) -- 377
					end -- 374
					self:StartActivity(self:GetAnim("IDLE")) -- 379
				end -- 308
				coroutine.wait(0.5) -- 381
			end -- 381
		end, -- 384
		ChaseEnemy = function(self) -- 384
			local path = Path("Follow") -- 385
			path:SetMinLookAheadDistance(300) -- 386
			path:SetGoalTolerance(20) -- 387
			path:Compute(self, self:GetEnemy():GetPos()) -- 388
			if not path:IsValid() then -- 390
				return "failed" -- 390
			end -- 390
			while path:IsValid() and self:HaveEnemy() do -- 392
				if path:GetAge() > 0.1 then -- 393
					path:Compute(self, self:GetEnemy():GetPos()) -- 394
				end -- 393
				self.loco:FaceTowards(self:GetEnemy():GetPos()) -- 396
				self:WeaponPrimaryAttack() -- 397
				path:Update(self) -- 399
				if self.loco:IsStuck() then -- 401
					self:HandleStuck() -- 402
					return "stuck" -- 403
				end -- 401
				coroutine.yield() -- 405
			end -- 405
			return "ok" -- 407
		end -- 35
	} -- 35
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 407
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 35
			_base_0[_key_0] = _val_0 -- 35
		end -- 35
	end -- 407
	if _base_0.__index == nil then -- 35
		_base_0.__index = _base_0 -- 35
	end -- 407
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
end -- 407
DEFINE_BASECLASS("evil_npc") -- 410
local RoyalConscript -- 411
do -- 411
	local _class_0 -- 411
	local _parent_0 = EvilRP_NPC -- 411
	local _base_0 = { -- 411
		__nextbot = "royalconscript", -- 413
		Base = "evil_npc", -- 414
		Faction = "Royalists", -- 415
		Category = "EvilRP", -- 416
		PrintName = "Conscript", -- 417
		Spawnable = true, -- 418
		Reward = 100, -- 419
		Weapon = { -- 419
			"evilrp_weapon/obrez", -- 419
			"evilrp_weapon/pacifier", -- 419
			"evilrp_weapon/warrant", -- 419
			"evilrp_weapon/viper" -- 419
		}, -- 421
		IdleSound = (function() -- 421
			local _accum_0 = { } -- 421
			local _len_0 = 1 -- 421
			for i = 1, 3 do -- 421
				_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav" -- 421
				_len_0 = _len_0 + 1 -- 421
			end -- 421
			return _accum_0 -- 421
		end)(), -- 422
		DeathSound = (function() -- 422
			local _accum_0 = { } -- 422
			local _len_0 = 1 -- 422
			for i = 1, 3 do -- 422
				_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav" -- 422
				_len_0 = _len_0 + 1 -- 422
			end -- 422
			return _accum_0 -- 422
		end)(), -- 423
		HurtSound = (function() -- 423
			local _accum_0 = { } -- 423
			local _len_0 = 1 -- 423
			for i = 1, 5 do -- 423
				_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav" -- 423
				_len_0 = _len_0 + 1 -- 423
			end -- 423
			return _accum_0 -- 423
		end)(), -- 426
		Initialize = function(self) -- 426
			self:SetModel("models/vel/evilwar/royalist.mdl") -- 427
			self:SetHealth(100) -- 428
			self.LoseTargetDist = 1200 -- 429
			self.SearchRadius = 1800 -- 430
			self.NextFire = CurTime() -- 432
			return self:Give(self.Weapon[math.random(1, #self.Weapon)]) -- 434
		end, -- 436
		HaveEnemy = function(self) -- 436
			local enemy = self:GetEnemy() -- 437
			if IsValid(enemy) then -- 438
				if self:GetRangeTo(enemy:GetPos()) > self.LoseTargetDist then -- 439
					return self:FindEnemy() -- 440
				elseif enemy:IsPlayer() then -- 441
					if not enemy:Alive() or enemy:Team() == TEAM_GHOST then -- 442
						return self:FindEnemy() -- 443
					end -- 442
					local job = RPExtraTeams[enemy:Team()] -- 444
					if job and job.category == "Royalists" then -- 445
						return self:FindEnemy() -- 446
					end -- 445
					return true -- 447
				elseif enemy:GetClass() == self:GetClass() then -- 448
					return self:FindEnemy() -- 449
				end -- 439
				return true -- 450
			end -- 438
			return self:FindEnemy() -- 451
		end -- 411
	} -- 411
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 451
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 411
			_base_0[_key_0] = _val_0 -- 411
		end -- 411
	end -- 451
	if _base_0.__index == nil then -- 411
		_base_0.__index = _base_0 -- 411
	end -- 451
	setmetatable(_base_0, _parent_0.__base) -- 411
	_class_0 = setmetatable({ -- 411
		__init = function(self, ...) -- 411
			return _class_0.__parent.__init(self, ...) -- 411
		end, -- 411
		__base = _base_0, -- 411
		__name = "RoyalConscript", -- 411
		__parent = _parent_0 -- 411
	}, { -- 411
		__index = function(cls, name) -- 411
			local val = rawget(_base_0, name) -- 411
			if val == nil then -- 411
				local parent = rawget(cls, "__parent") -- 411
				if parent then -- 411
					return parent[name] -- 411
				end -- 411
			else -- 411
				return val -- 411
			end -- 411
		end, -- 411
		__call = function(cls, ...) -- 411
			local _self_0 = setmetatable({ }, _base_0) -- 411
			cls.__init(_self_0, ...) -- 411
			return _self_0 -- 411
		end -- 411
	}) -- 411
	_base_0.__class = _class_0 -- 411
	if _parent_0.__inherited then -- 411
		_parent_0.__inherited(_parent_0, _class_0) -- 411
	end -- 411
	RoyalConscript = _class_0 -- 411
	return _class_0 -- 451
end -- 451
