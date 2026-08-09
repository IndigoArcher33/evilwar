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
			end -- 143
			local etab = self:GetActiveLuaWeapon() -- 144
			local weapon = etab:GetClass() -- 145
			if weapon and etab then -- 146
				local product = ents.Create("evilrp/spawned/weapon") -- 147
				product:SetModel(etab.WorldModel) -- 149
				product:SetWeaponClass(weapon) -- 150
				product:SetPos(self:GetPos() + Vector(math.random(-10, 10), math.random(-10, 10), 0)) -- 151
				product:Spawn() -- 152
				return product -- 148
			end -- 146
		end, -- 155
		GetActiveLuaWeapon = function(self) -- 155
			return self.m_ActualWeapon or NULL -- 156
		end, -- 158
		WeaponPrimaryAttack = function(self) -- 158
			if self.NextFire > CurTime() then -- 159
				return -- 160
			end -- 159
			if not self:HaveEnemy() then -- 161
				return -- 162
			end -- 161
			local wep = self:GetActiveLuaWeapon() -- 164
			if not IsValid(wep) then -- 165
				return -- 166
			end -- 165
			if wep.CurAmmo <= 0 then -- 168
				self:Reload() -- 169
				return -- 170
			end -- 168
			local myEyePos = self:GetPos() + Vector(0, 0, 50) -- 172
			local enemyChestPos = self:GetEnemy():GetPos() + Vector(0, 0, 45) -- 173
			local trace = { -- 176
				start = myEyePos, -- 176
				endpos = enemyChestPos, -- 177
				filter = { -- 178
					self, -- 178
					wep -- 178
				} -- 178
			} -- 175
			local tr = util.TraceLine(trace) -- 180
			if IsValid(tr.Entity) and tr.Entity:GetClass() == self:GetClass() then -- 181
				return -- 182
			end -- 181
			self:SetPoseParameter("aim_pitch", 0) -- 184
			local delay = (wep.Primary and wep.Primary.Delay) or 0.1 -- 186
			self.NextFire = CurTime() + delay + math.random(-delay / 10, delay / 10) -- 187
			local snd = (wep.Primary and wep.Primary.Sound) or "Weapon_SMG1.Single" -- 189
			if type(snd) == "table" then -- 190
				snd = table.Random(snd) -- 190
			end -- 190
			self:EmitSound(snd, 75, 100, 5) -- 191
			self:RestartGesture(ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2) -- 193
			local acc -- 195
			if wep.GetSpread then -- 195
				acc = wep:GetSpread() -- 195
			else -- 195
				acc = Vector(0.05, 0.05, 0) -- 195
			end -- 195
			local bullet = { -- 197
				Num = (wep.Primary and wep.Primary.NumBullets) or 1, -- 197
				Src = myEyePos, -- 198
				Dir = (enemyChestPos - myEyePos):GetNormalized(), -- 199
				Spread = acc * 3, -- 200
				Tracer = 1, -- 201
				Force = (wep.Primary and wep.Primary.Damage) or 10, -- 202
				Damage = (wep.Primary and wep.Primary.Damage) or 10, -- 203
				AmmoType = (wep.Primary and wep.Primary.Ammo) or "smg1", -- 204
				Attacker = self, -- 205
				Inflictor = wep -- 206
			} -- 196
			self:FireBullets(bullet) -- 208
			wep.CurAmmo = wep.CurAmmo - 1 -- 209
			return wep:MuzzleFlash() -- 210
		end, -- 212
		IsMelee = function(self) -- 212
			local wep = self:GetActiveLuaWeapon() -- 213
			if not IsValid(wep) then -- 214
				return true -- 215
			end -- 214
			local holdType = (wep.GetHoldType and wep:GetHoldType()) or "smg" -- 217
			return holdType == "melee" or holdType == "fist" or holdType == "knife" or holdType == "grenade" -- 218
		end, -- 220
		Reload = function(self) -- 220
			local wep = self:GetActiveLuaWeapon() -- 221
			if not IsValid(wep) or wep.Reloading then -- 222
				return -- 223
			end -- 222
			self:RestartGesture(ACT_HL2MP_GESTURE_RELOAD_AR2) -- 225
			wep.Reloading = true -- 226
			self:EmitSound("weapons/smg1/smg1_reload.wav") -- 227
			return timer.Simple(2.5, function() -- 229
				if IsValid(self) and IsValid(wep) then -- 230
					wep.CurAmmo = wep.MaxClip -- 231
					wep.Reloading = false -- 232
				end -- 230
			end) -- 232
		end, -- 234
		GetAnim = function(self, state) -- 234
			local wep = self:GetActiveLuaWeapon() -- 235
			if not IsValid(wep) then -- 236
				return _G["ACT_HL2MP_" .. state] -- 237
			end -- 236
			local holdType = (wep.GetHoldType and wep:GetHoldType()) or "smg" -- 239
			local translations = { -- 242
				pistol = "PISTOL", -- 242
				revolver = "REVOLVER", -- 243
				smg = "SMG1", -- 244
				ar2 = "AR2", -- 245
				shotgun = "SHOTGUN", -- 246
				crossbow = "CROSSBOW", -- 247
				rpg = "RPG", -- 248
				grenade = "GRENADE", -- 249
				melee = "MELEE" -- 250
			} -- 241
			local suffix = translations[holdType] or "SMG1" -- 252
			return _G["ACT_HL2MP_" .. state .. "_" .. suffix] -- 253
		end, -- 255
		BodyUpdate = function(self) -- 255
			local act = self:GetActivity() -- 256
			if act == self:GetAnim("RUN") or act == self:GetAnim("WALK") then -- 257
				return self:BodyMoveXY() -- 258
			else -- 260
				return self:FrameAdvance() -- 260
			end -- 257
		end, -- 262
		SetEnemy = function(self, ent) -- 262
			self.Enemy = ent -- 262
		end, -- 263
		GetEnemy = function(self) -- 263
			return self.Enemy -- 263
		end, -- 265
		HaveEnemy = function(self) -- 265
			local enemy = self:GetEnemy() -- 266
			if IsValid(enemy) then -- 267
				if self:GetRangeTo(enemy:GetPos()) > self.LoseTargetDist then -- 268
					return self:FindEnemy() -- 269
				elseif enemy:IsPlayer() and not enemy:Alive() then -- 270
					return self:FindEnemy() -- 271
				elseif enemy:GetClass() == self:GetClass() then -- 272
					return self:FindEnemy() -- 273
				elseif enemy:Team() == TEAM_GHOST then -- 274
					return self:FindEnemy() -- 275
				end -- 268
				return true -- 276
			end -- 267
			return self:FindEnemy() -- 277
		end, -- 279
		FindEnemy = function(self) -- 279
			local entsInCone = ents.FindInCone(self:GetPos(), self:GetForward(), self.SearchRadius, 0.707) -- 280
			for _index_0 = 1, #entsInCone do -- 281
				local v = entsInCone[_index_0] -- 281
				local _continue_0 = false -- 282
				repeat -- 282
					if v.Faction and v.Faction == self.Faction then -- 282
						_continue_0 = true -- 283
						break -- 283
					end -- 282
					if (v:IsNPC() or v:IsNextBot() or v:IsPlayer()) and self:Visible(v) then -- 286
						if v:Health() > 0 then -- 287
							self:SetEnemy(v) -- 288
							return true -- 289
						end -- 287
					end -- 286
					_continue_0 = true -- 282
				until true -- 290
				if not _continue_0 then -- 290
					break -- 290
				end -- 290
			end -- 290
			self:SetEnemy(nil) -- 291
			return false -- 292
		end, -- 294
		RunBehaviour = function(self) -- 294
			while true do -- 295
				if self:HaveEnemy() then -- 296
					if self:IsMelee() then -- 297
						self:StartActivity(self:GetAnim("RUN")) -- 298
						self.loco:SetDesiredSpeed(150) -- 299
						self:ChaseEnemy() -- 300
					else -- 302
						self:StartActivity(self:GetAnim("IDLE")) -- 302
						while self:HaveEnemy() and not self:IsMelee() do -- 304
							local target = self:GetEnemy() -- 305
							if not IsValid(target) then -- 306
								break -- 306
							end -- 306
							if not self:Visible(target) then -- 308
								self:StartActivity(self:GetAnim("RUN")) -- 309
								self.loco:SetDesiredSpeed(150) -- 310
								local path = Path("Follow") -- 312
								path:SetMinLookAheadDistance(300) -- 313
								path:SetGoalTolerance(20) -- 314
								path:Compute(self, target:GetPos()) -- 315
								if not path:IsValid() then -- 317
									coroutine.wait(1) -- 318
								else -- 320
									local nextPath = CurTime() + 5 -- 320
									while path:IsValid() and self:HaveEnemy() and CurTime() < nextPath do -- 321
										target = self:GetEnemy() -- 322
										if not IsValid(target) or self:Visible(target) then -- 323
											break -- 323
										end -- 323
										if path:GetAge() > 0.1 then -- 325
											path:Compute(self, target:GetPos()) -- 325
										end -- 325
										path:Update(self) -- 326
										if self.loco:IsStuck() then -- 328
											self:HandleStuck() -- 328
										end -- 328
										coroutine.yield() -- 329
									end -- 330
								end -- 317
							elseif self:GetRangeTo(target:GetPos()) > 800 then -- 331
								self:StartActivity(self:GetAnim("WALK")) -- 332
								self.loco:SetDesiredSpeed(100) -- 333
								local dir = (target:GetPos() - self:GetPos()):GetNormalized() -- 335
								local pos = self:GetPos() + dir * 250 -- 336
								self:MoveToPos(pos) -- 338
								self:StartActivity(self:GetAnim("IDLE")) -- 340
								local stop = CurTime() + math.Rand(1.0, 2.5) -- 342
								while CurTime() < stop do -- 343
									target = self:GetEnemy() -- 344
									if not IsValid(target) or not self:Visible(target) then -- 345
										break -- 345
									end -- 345
									self.loco:FaceTowards(target:GetPos()) -- 347
									self:WeaponPrimaryAttack() -- 348
									coroutine.yield() -- 349
								end -- 350
							else -- 352
								self:StartActivity(self:GetAnim("IDLE")) -- 352
								self.loco:FaceTowards(target:GetPos()) -- 353
								self:WeaponPrimaryAttack() -- 354
								coroutine.yield() -- 355
							end -- 308
						end -- 355
					end -- 297
				else -- 357
					self:StartActivity(self:GetAnim("WALK")) -- 357
					if self.IdleSound then -- 358
						self:EmitSound(self.IdleSound[math.random(1, #self.IdleSound)]) -- 358
					end -- 358
					self.loco:SetDesiredSpeed(100) -- 359
					local wander = self:GetPos() + Vector(math.Rand(-1, 1), math.Rand(-1, 1), 0) * 400 -- 361
					if navmesh.IsLoaded() and navmesh.GetNearestNavArea(wander, false) then -- 362
						self:MoveToPos(wander) -- 363
					else -- 365
						coroutine.wait(1) -- 365
					end -- 362
					self:StartActivity(self:GetAnim("IDLE")) -- 367
				end -- 296
				coroutine.wait(0.5) -- 369
			end -- 369
		end, -- 372
		ChaseEnemy = function(self) -- 372
			local path = Path("Follow") -- 373
			path:SetMinLookAheadDistance(300) -- 374
			path:SetGoalTolerance(20) -- 375
			path:Compute(self, self:GetEnemy():GetPos()) -- 376
			if not path:IsValid() then -- 378
				return "failed" -- 378
			end -- 378
			while path:IsValid() and self:HaveEnemy() do -- 380
				if path:GetAge() > 0.1 then -- 381
					path:Compute(self, self:GetEnemy():GetPos()) -- 382
				end -- 381
				self.loco:FaceTowards(self:GetEnemy():GetPos()) -- 384
				self:WeaponPrimaryAttack() -- 385
				path:Update(self) -- 387
				if self.loco:IsStuck() then -- 389
					self:HandleStuck() -- 390
					return "stuck" -- 391
				end -- 389
				coroutine.yield() -- 393
			end -- 393
			return "ok" -- 395
		end -- 35
	} -- 35
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 395
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 35
			_base_0[_key_0] = _val_0 -- 35
		end -- 35
	end -- 395
	if _base_0.__index == nil then -- 35
		_base_0.__index = _base_0 -- 35
	end -- 395
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
end -- 395
DEFINE_BASECLASS("evil_npc") -- 398
local RoyalConscript -- 399
do -- 399
	local _class_0 -- 399
	local _parent_0 = EvilRP_NPC -- 399
	local _base_0 = { -- 399
		__nextbot = "royalconscript", -- 401
		Base = "evil_npc", -- 402
		Faction = "Royalists", -- 403
		Category = "EvilRP", -- 404
		PrintName = "Conscript", -- 405
		Spawnable = true, -- 406
		Reward = 100, -- 407
		Weapon = { -- 407
			"evilrp_weapon/obrez", -- 407
			"evilrp_weapon/pacifier", -- 407
			"evilrp_weapon/warrant", -- 407
			"evilrp_weapon/viper" -- 407
		}, -- 409
		IdleSound = (function() -- 409
			local _accum_0 = { } -- 409
			local _len_0 = 1 -- 409
			for i = 1, 3 do -- 409
				_accum_0[_len_0] = "placenta/speech/prole" .. tostring(i) .. ".wav" -- 409
				_len_0 = _len_0 + 1 -- 409
			end -- 409
			return _accum_0 -- 409
		end)(), -- 410
		DeathSound = (function() -- 410
			local _accum_0 = { } -- 410
			local _len_0 = 1 -- 410
			for i = 1, 3 do -- 410
				_accum_0[_len_0] = "placenta/death/prole" .. tostring(i) .. ".wav" -- 410
				_len_0 = _len_0 + 1 -- 410
			end -- 410
			return _accum_0 -- 410
		end)(), -- 411
		HurtSound = (function() -- 411
			local _accum_0 = { } -- 411
			local _len_0 = 1 -- 411
			for i = 1, 5 do -- 411
				_accum_0[_len_0] = "placenta/pain/prole" .. tostring(i) .. ".wav" -- 411
				_len_0 = _len_0 + 1 -- 411
			end -- 411
			return _accum_0 -- 411
		end)(), -- 414
		Initialize = function(self) -- 414
			self:SetModel("models/vel/evilwar/royalist.mdl") -- 415
			self:SetHealth(100) -- 416
			self.LoseTargetDist = 1200 -- 417
			self.SearchRadius = 1800 -- 418
			self.NextFire = CurTime() -- 420
			return self:Give(self.Weapon[math.random(1, #self.Weapon)]) -- 422
		end, -- 424
		HaveEnemy = function(self) -- 424
			local enemy = self:GetEnemy() -- 425
			if IsValid(enemy) then -- 426
				if self:GetRangeTo(enemy:GetPos()) > self.LoseTargetDist then -- 427
					return self:FindEnemy() -- 428
				elseif enemy:IsPlayer() then -- 429
					if not enemy:Alive() or enemy:Team() == TEAM_GHOST then -- 430
						return self:FindEnemy() -- 431
					end -- 430
					local job = RPExtraTeams[enemy:Team()] -- 432
					if job and job.category == "Royalists" then -- 433
						return self:FindEnemy() -- 434
					end -- 433
					return true -- 435
				elseif enemy:GetClass() == self:GetClass() then -- 436
					return self:FindEnemy() -- 437
				end -- 427
				return true -- 438
			end -- 426
			return self:FindEnemy() -- 439
		end -- 399
	} -- 399
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 439
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 399
			_base_0[_key_0] = _val_0 -- 399
		end -- 399
	end -- 439
	if _base_0.__index == nil then -- 399
		_base_0.__index = _base_0 -- 399
	end -- 439
	setmetatable(_base_0, _parent_0.__base) -- 399
	_class_0 = setmetatable({ -- 399
		__init = function(self, ...) -- 399
			return _class_0.__parent.__init(self, ...) -- 399
		end, -- 399
		__base = _base_0, -- 399
		__name = "RoyalConscript", -- 399
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
	RoyalConscript = _class_0 -- 399
	return _class_0 -- 439
end -- 439
