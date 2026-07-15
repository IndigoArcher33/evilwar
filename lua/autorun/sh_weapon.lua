-- [yue]: sh_weapon.yue
local Register = weapons.Register -- 1
local lower, Left = string.lower, string.Left -- 2
local TraceLine = util.TraceLine -- 3
do -- 4
	local _class_0 -- 4
	local _base_0 = { } -- 4
	if _base_0.__index == nil then -- 4
		_base_0.__index = _base_0 -- 4
	end -- 25
	_class_0 = setmetatable({ -- 4
		__init = function(self) -- 25
			return self:SetHoldType("normal") -- 25
		end, -- 4
		__base = _base_0, -- 4
		__name = "WEAPON" -- 4
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
		do -- 6
			local _with_0 = getmetatable(child) -- 6
			_with_0.__call = function(self, where, ...) -- 7
				local ent -- 8
				if isvector(where) then -- 9
					ent = Create(self.__barcode) -- 10
					ent:SetPos(where) -- 11
					ent:Spawn() -- 12
				elseif isentity(where) and where:IsPlayer() then -- 13
					ent = where:Give(self.__barcode) -- 14
				end -- 9
				ent.__class = ent.BaseClass -- 15
				self.__init(ent, ...) -- 16
				return ent -- 17
			end -- 7
		end -- 6
		local fields -- 18
		do -- 18
			local _tbl_0 = { } -- 18
			for k, v in pairs(child.__base) do -- 18
				if Left(k, 2) ~= "__" then -- 18
					_tbl_0[k] = v -- 18
				end -- 18
			end -- 18
			fields = _tbl_0 -- 18
		end -- 18
		fields.Base = fields.Base or self.__barcode -- 19
		fields.Spawnable = fields.Spawnable or self.Spawnable -- 20
		fields.Category = fields.Category or self.Category -- 21
		child.__barcode = tostring(self.__barcode and self.__barcode .. '/' or '') .. tostring(lower(rawget(child, '__weapon') or child.__name)) -- 22
		Register(fields, child.__barcode) -- 23
		return MsgC(Color(0, 200, 0), "+WEAPON: " .. tostring(child.__barcode) .. "\n") -- 24
	end -- 5
	WEAPON = _class_0 -- 4
end -- 25
local AMMO_NONE = 0 -- 27
local AMMO_NORMAL = 1 -- 28
local AMMO_NOMAG = 2 -- 29
local AMMO_INTERNAL = 3 -- 30
DEFINE_BASECLASS("weapon_base") -- 32
local index -- 34
index = { -- 35
	["pistol"] = ACT_HL2MP_IDLE_PISTOL, -- 35
	["smg"] = ACT_HL2MP_IDLE_SMG1, -- 36
	["grenade"] = ACT_HL2MP_IDLE_GRENADE, -- 37
	["ar2"] = ACT_HL2MP_IDLE_AR2, -- 38
	["shotgun"] = ACT_HL2MP_IDLE_SHOTGUN, -- 39
	["rpg"] = ACT_HL2MP_IDLE_RPG, -- 40
	["physgun"] = ACT_HL2MP_IDLE_PHYSGUN, -- 41
	["crossbow"] = ACT_HL2MP_IDLE_CROSSBOW, -- 42
	["melee"] = ACT_HL2MP_IDLE_MELEE, -- 43
	["slam"] = ACT_HL2MP_IDLE_SLAM, -- 44
	["normal"] = ACT_HL2MP_IDLE, -- 45
	["fist"] = ACT_HL2MP_IDLE_FIST, -- 46
	["melee2"] = ACT_HL2MP_IDLE_MELEE2, -- 47
	["passive"] = ACT_HL2MP_IDLE_PASSIVE, -- 48
	["knife"] = ACT_HL2MP_IDLE_KNIFE, -- 49
	["duel"] = ACT_HL2MP_IDLE_DUEL, -- 50
	["camera"] = ACT_HL2MP_IDLE_CAMERA, -- 51
	["magic"] = ACT_HL2MP_IDLE_MAGIC, -- 52
	["revolver"] = ACT_HL2MP_IDLE_REVOLVER -- 53
} -- 34
local replacements -- 56
replacements = { -- 57
	[ACT_HL2MP_IDLE_PISTOL] = ACT_HL2MP_IDLE_REVOLVER, -- 57
	[ACT_HL2MP_WALK_PISTOL] = ACT_HL2MP_WALK_REVOLVER, -- 58
	[ACT_HL2MP_RUN_PISTOL] = ACT_HL2MP_RUN_REVOLVER, -- 59
	[ACT_HL2MP_IDLE_SHOTGUN] = ACT_HL2MP_IDLE_AR2, -- 60
	[ACT_HL2MP_IDLE_CROUCH_SHOTGUN] = ACT_HL2MP_IDLE_CROUCH_AR2, -- 61
	[ACT_HL2MP_WALK_SHOTGUN] = ACT_HL2MP_WALK_AR2, -- 62
	[ACT_HL2MP_WALK_CROUCH_SHOTGUN] = ACT_HL2MP_WALK_CROUCH_AR2, -- 63
	[ACT_HL2MP_RUN_SHOTGUN] = ACT_HL2MP_RUN_AR2, -- 64
	[ACT_HL2MP_WALK_CROUCH_PASSIVE] = ACT_HL2MP_WALK_CROUCH, -- 65
	[ACT_HL2MP_IDLE_CROUCH_PASSIVE] = ACT_HL2MP_IDLE_CROUCH -- 66
} -- 56
local ease_in = math.ease.InQuad -- 69
local ease_out = math.ease.OutQuad -- 70
local ease = math.ease.OutBack -- 71
local HL2_BOB_VERTICAL = 0.5 -- 73
local HL2_BOB_LATERAL = HL2_BOB_VERTICAL * 2 -- 74
local HL2_BOB = 0.5 -- 75
local bob_time = 0 -- 77
local last_bob_time = 0 -- 78
if SERVER then -- 80
	util.AddNetworkString("evilrp_toggle_holster") -- 81
	local toggle_holster -- 82
	toggle_holster = function(len, ply) -- 82
		if ply:Team() == TEAM_GHOST then -- 83
			return -- 83
		end -- 83
		if not ply:Alive() then -- 84
			return -- 84
		end -- 84
		if ply:Fallen() then -- 85
			return -- 85
		end -- 85
		local wep = ply:GetActiveWeapon() -- 86
		if wep == NULL then -- 87
			return -- 87
		end -- 87
		if not wep.SetLower then -- 88
			return -- 88
		end -- 88
		wep:SetNextPrimaryFire(CurTime() + .6) -- 89
		if wep:CanLower() then -- 90
			return wep:SetLower(not wep:GetLowered()) -- 91
		else -- 93
			return wep:SetLower(false) -- 93
		end -- 90
	end -- 82
	net.Receive("evilrp_toggle_holster", toggle_holster) -- 94
end -- 80
do -- 96
	local _class_0 -- 96
	local _parent_0 = WEAPON -- 96
	local _base_0 = { -- 96
		__weapon = "evil_weapon", -- 98
		Base = "weapon_base", -- 99
		Category = "EvilRP", -- 101
		m_WeaponDeploySpeed = 1, -- 103
		DrawWeaponInfoBox = false, -- 105
		ViewModelTargetFOV = 54, -- 106
		ViewModelFOV = 54, -- 108
		HoldType = "ar2", -- 109
		LowerHoldType = "passive", -- 111
		CustomHoldType = { }, -- 112
		CustomLowerHoldType = { }, -- 114
		Firearm = true, -- 115
		ShowAmmoCheck = false, -- 117
		Firemode = -1, -- 119
		Primary = { -- 120
			Ammo = "", -- 120
			Cost = 1, -- 121
			ClipSize = -1, -- 123
			DefaultClip = 0, -- 124
			PumpAction = false, -- 126
			PumpSound = "", -- 127
			Damage = 0, -- 129
			Count = 1, -- 130
			Spread = Vector(0, 0, 0), -- 132
			Range = 1000, -- 134
			Accuracy = 12, -- 135
			RangeModifier = 0.9, -- 137
			Delay = 0.1, -- 139
			BurstDelay = 0, -- 141
			BurstEndDelay = 0, -- 142
			Recoil = { -- 145
				MinAng = angle_zero, -- 145
				MaxAng = angle_zero, -- 146
				Punch = 0, -- 147
				Ratio = 0 -- 148
			}, -- 144
			Reload = { -- 152
				Time = 0, -- 152
				Amount = math.huge, -- 153
				Shotgun = false, -- 154
				Sound = "" -- 155
			}, -- 151
			Sound = "", -- 158
			TracerName = "", -- 159
			TracerFrequency = 2 -- 160
		}, -- 163
		Secondary = { -- 164
			Ammo = "", -- 164
			ClipSize = -1, -- 165
			DefaultClip = 0, -- 166
			Automatic = false -- 167
		}, -- 170
		ViewOffset = Vector(), -- 172
		GetAmmoType = function(self) -- 172
			local Ammo, ClipSize -- 173
			do -- 173
				local _obj_0 = self.Primary -- 173
				Ammo, ClipSize = _obj_0.Ammo, _obj_0.ClipSize -- 173
			end -- 173
			if Ammo == "" and ClipSize == -1 then -- 174
				return AMMO_NONE -- 175
			elseif Ammo == "" then -- 176
				return AMMO_INTERNAL -- 177
			elseif ClipSize == -1 then -- 178
				return AMMO_NOMAG -- 179
			else -- 181
				return AMMO_NORMAL -- 181
			end -- 174
		end, -- 183
		ConsumeAmmo = function(self) -- 183
			if self.AmmoType == AMMO_NONE then -- 184
				return -- 184
			end -- 184
			local Cost -- 186
			do -- 186
				local _obj_0 = self.Primary -- 186
				Cost = _obj_0.Cost -- 186
			end -- 186
			local ply = self:GetOwner() -- 187
			if self.AmmoType == AMMO_NOMAG then -- 188
				local cost = math.min(Cost, ply:GetAmmoCount(self.Primary.Ammo)) -- 189
				return ply:RemoveAmmo(cost, self.Primary.Ammo) -- 190
			else -- 192
				return self:TakePrimaryAmmo(math.min(Cost, self:Clip1())) -- 192
			end -- 188
		end, -- 194
		GetAmmo = function(self) -- 194
			do -- 195
				local _exp_0 = self.AmmoType -- 195
				if AMMO_NORMAL == _exp_0 or AMMO_INTERNAL == _exp_0 then -- 196
					return self:Clip1() -- 197
				elseif AMMO_NOMAG == _exp_0 then -- 198
					return self:GetOwner():GetAmmoCount(self.Primary.Ammo) -- 199
				end -- 199
			end -- 199
			return 1 -- 200
		end, -- 202
		CheckAmmo = function(self) -- 202
			if (self.ShowAmmoCheck == false) then -- 203
				self.ShowAmmoCheck = true -- 204
				return timer.Create("ShowAmmoCheck", 2, 1, function() -- 206
					self.ShowAmmoCheck = false -- 207
				end) -- 207
			elseif (timer.Exists("ShowAmmoCheck")) then -- 209
				timer.Remove("ShowAmmoCheck") -- 210
				return timer.Create("ShowAmmoCheck", 2, 1, function() -- 212
					self.ShowAmmoCheck = false -- 213
				end) -- 213
			end -- 203
		end, -- 215
		Initialize = function(self) -- 215
			self:SetFiremode(self.Firemode) -- 216
			self.AmmoType = self:GetAmmoType() -- 217
		end, -- 219
		SetupDataTables = function(self) -- 219
			self:NetworkVar("Entity", "LastOwner") -- 220
			self:NetworkVar("Bool", "Lowered") -- 222
			self:NetworkVar("Bool", "Aiming") -- 223
			self:NetworkVar("Bool", "NeedPump") -- 224
			self:NetworkVar("Bool", "FirstReload") -- 225
			self:NetworkVar("Bool", "AbortReload") -- 226
			self:NetworkVar("Int", "Firemode") -- 228
			self:NetworkVar("Int", "BurstFired") -- 229
			self:NetworkVar("Float", "LowerTime") -- 231
			self:NetworkVar("Float", "NextIdle") -- 232
			self:NetworkVar("Float", "FinishReload") -- 233
			self:NetworkVar("Float", "NextFire") -- 235
			return self:NetworkVar("Float", "NextAltFire") -- 236
		end, -- 238
		OwnerChanged = function(self) -- 238
			local old = self:GetLastOwner() -- 239
			if IsValid(old) and old:IsPlayer() then -- 240
				old:SetFOV(0, 0.1, self) -- 240
			end -- 240
			local ply = self:GetOwner() -- 241
			if IsValid(ply) and ply:IsNPC() then -- 242
				self:SetHoldType(self.HoldType) -- 242
			end -- 242
			return self:SetLastOwner(ply) -- 243
		end, -- 245
		Deploy = function(self) -- 245
			self:SetLowerTime(0) -- 246
			self:SetLowered(true) -- 247
			self:SetHoldType(self.LowerHoldType) -- 248
			self:SetNextIdle(CurTime() + self:SequenceDuration()) -- 249
			return true -- 250
		end, -- 252
		Holster = function(self) -- 252
			self:SetFirstReload(false) -- 253
			self:SetAbortReload(false) -- 254
			self:SetFinishReload(0) -- 255
			local ply = self:GetOwner() -- 256
			if IsValid(ply) and ply:IsPlayer() then -- 257
				ply:SetFOV(0, 0.1, self) -- 257
			end -- 257
			return true -- 258
		end, -- 260
		CanLower = function(self) -- 260
			if not self:IsReady() then -- 261
				return false -- 261
			end -- 261
			if self:IsReloading() then -- 262
				return false -- 262
			end -- 262
			return true -- 263
		end, -- 265
		SetLower = function(self, lower) -- 265
			if self:GetLowered() ~= lower then -- 266
				self:SetLowered(lower) -- 267
				self:SetLowerTime(CurTime()) -- 268
				self:SetHoldType(lower and self.LowerHoldType or self.HoldType) -- 269
				local vm = self.Owner:GetViewModel() -- 270
				if lower then -- 271
					if self.HolsterAnim then -- 272
						vm:SendViewModelMatchingSequence(vm:LookupSequence(self.HolsterAnim)) -- 273
					end -- 272
				else -- 275
					if self.DrawAnim then -- 275
						vm:SendViewModelMatchingSequence(vm:LookupSequence(self.DrawAnim)) -- 276
					end -- 275
				end -- 271
				self:UpdateFOV(0.4) -- 277
			end -- 266
			self.Primary.Automatic = true -- 278
			return true -- 279
		end, -- 281
		PrimaryAttack = function(self) -- 281
			local ply = self:GetOwner() -- 282
			if (self:GetNextFire() > CurTime()) or (not self:CanPrimaryFire()) then -- 283
				return -- 283
			end -- 283
			return self:PrimaryFire() -- 284
		end, -- 286
		SecondaryAttack = function(self) -- 286
			return self:TryAltFire() -- 286
		end, -- 288
		HandleIdle = function(self) -- 288
			local idle = self:GetNextIdle() -- 289
			if idle > 0 and idle <= CurTime() then -- 290
				self:SendTranslatedWeaponAnim(ACT_VM_IDLE) -- 291
				return self:SetNextIdle(0) -- 292
			end -- 290
		end, -- 294
		HandlePump = function(self) -- 294
			if self:GetNeedPump() and (not self:IsReloading()) and ((self:GetNextFire() <= CurTime())) then -- 295
				if (not self.Primary.PumpOnEmpty) and (self:Clip1() == 0) then -- 296
					return -- 296
				end -- 296
				self:SendTranslatedWeaponAnim(ACT_SHOTGUN_PUMP) -- 297
				local snd = self.Primary.PumpSound -- 298
				if snd ~= "" and IsFirstTimePredicted() then -- 299
					self:EmitSound(snd) -- 299
				end -- 299
				local duration = self:SequenceDuration() -- 300
				self:SetNextFire(CurTime() + duration) -- 301
				self:SetNextIdle(CurTime() + duration) -- 302
				return self:SetNeedPump(false) -- 303
			end -- 295
		end, -- 305
		HandleBurst = function(self) -- 305
			if (self:GetBurstFired() > 0) and (CurTime() > self:GetNextFire() + engine.TickInterval()) then -- 306
				self:SetBurstFired(0) -- 307
				return self:SetNextFire(CurTime() + self:GetDelay()) -- 308
			end -- 306
		end, -- 310
		Think = function(self) -- 310
			self:HandleReload() -- 311
			self:HandleIdle() -- 312
			self:HandlePump() -- 313
			self:HandleBurst() -- 314
			self:HandleViewModel() -- 315
			return self:HandleAiming() -- 316
		end, -- 318
		OnReloaded = function(self) -- 318
			if self:GetHoldType() ~= "" then -- 318
				return self:SetWeaponHoldType(self:GetHoldType()) -- 318
			end -- 318
		end, -- 320
		OnRemove = function(self) -- 320
			local ply = self:GetOwner() -- 321
			if IsValid(ply) and ply:IsPlayer() then -- 322
				return ply:SetFOV(0, 0, self) -- 322
			end -- 322
		end, -- 324
		SetupMove = function(self, ply, mv) -- 324
			local fraction = self:GetLowerFraction() -- 325
			if not (fraction == 1) then -- 326
				local min = 200 -- 327
				if ply:Crouching() then -- 328
					min = math.min(min, ply:GetWalkSpeed() * ply:GetCrouchedWalkSpeed()) -- 328
				end -- 328
				local speed = math.Remap(fraction, 0, 1, min, ply:GetRunSpeed()) -- 329
				mv:SetMaxSpeed(speed) -- 330
				mv:SetMaxClientSpeed(speed) -- 331
			end -- 326
			if self:GetAiming() then -- 332
				local aim_speed = ply:GetWalkSpeed() * 0.3 -- 333
				mv:SetMaxSpeed(math.min(mv:GetMaxSpeed(), aim_speed)) -- 334
				return mv:SetMaxClientSpeed(math.min(mv:GetMaxClientSpeed(), aim_speed)) -- 335
			end -- 332
		end, -- 337
		OnRestore = function(self) -- 337
			self:SetFirstReload(false) -- 338
			self:SetAbortReload(false) -- 339
			self:SetBurstFired(0) -- 340
			self:SetLowerTime(0) -- 341
			self:SetNextIdle(CurTime()) -- 342
			self:SetFinishReload(0) -- 343
			self:SetNextFire(CurTime()) -- 344
			return self:SetNextAltFire(CurTime()) -- 345
		end, -- 347
		TranslateWeaponAnim = function(self, act) -- 347
			return act -- 347
		end, -- 349
		SendTranslatedWeaponAnim = function(self, act) -- 349
			act = self:TranslateWeaponAnim(act) -- 350
			if not act then -- 351
				return -- 351
			end -- 351
			return self:SendWeaponAnim(act) -- 352
		end, -- 354
		TranslateActivity = function(self, act) -- 354
			local translated -- 355
			if self:GetLowered() and (act == ACT_MP_RELOAD_STAND or ACT == ACT_MP_RELOAD_CROUCH) and index[self.HoldType] then -- 356
				translated = index[self.HoldType] + 6 -- 357
			end -- 356
			local custom = self:GetLowered() and self.CustomLowerHoldType or self.CustomHoldType -- 358
			if custom[act] then -- 359
				return custom[act] -- 359
			end -- 359
			if not translated then -- 360
				translated = BaseClass.TranslateActivity(self, act) -- 360
			end -- 360
			return replacements[translated] and replacements[translated] or translated -- 361
		end, -- 365
		CanPrimaryFire = function(self) -- 365
			if self:HandleAutoRaise() or self:HandleReloadAbort() then -- 366
				return false -- 366
			end -- 366
			if self:IsEmpty() then -- 367
				if not self:IsReloading() then -- 368
					self:EmitEmptySound() -- 368
				end -- 368
				self:SetNextFire(CurTime() + 0.2) -- 369
				self:ForceStopFire() -- 370
				return false -- 371
			end -- 367
			return true -- 372
		end, -- 374
		PrimaryFire = function(self) -- 374
			self:UpdateAutomatic() -- 375
			self:ConsumeAmmo() -- 376
			self:FireWeapon() -- 377
			local delay = self:GetDelay() -- 378
			self:ApplyRecoil() -- 379
			local pump_action = self:ShouldPump() -- 380
			if pump_action then -- 381
				self:SetNeedPump(true) -- 381
			end -- 381
			self:SetNextIdle(CurTime() + self:SequenceDuration()) -- 382
			return self:SetNextFire(CurTime() + delay) -- 383
		end, -- 387
		TryAltFire = function(self) -- 387
			if (self:GetNextAltFire() > CurTime()) or (not self:CanAltFire()) then -- 388
				return -- 388
			end -- 388
			return self:AltFire() -- 389
		end, -- 391
		CanAltFire = function(self) -- 391
			return true -- 391
		end, -- 393
		AltFire = function(self) end, -- 395
		UpdateAutomatic = function(self) -- 395
			local firemode = self:GetFiremode() -- 396
			if firemode == 0 then -- 397
				self.Primary.Automatic = false -- 398
			else -- 400
				self.Primary.Automatic = true -- 400
			end -- 397
			if firemode > 0 then -- 402
				local count = self:GetBurstFired() -- 403
				if count + 1 >= firemode then -- 404
					self:ForceStopFire() -- 405
					return self:SetBurstFired(0) -- 406
				else -- 408
					return self:SetBurstFired(count + 1) -- 408
				end -- 404
			end -- 402
		end, -- 410
		FireWeapon = function(self) -- 410
			local ply = self:GetOwner() -- 411
			self:EmitFireSound() -- 412
			self:SendTranslatedWeaponAnim(ACT_VM_PRIMARYATTACK) -- 413
			ply:SetAnimation(PLAYER_ATTACK1) -- 414
			local damage = self:GetDamage() -- 415
			local bullet = { -- 417
				Num = self.Primary.Count, -- 417
				Src = ply:GetShootPos(), -- 418
				Dir = self:GetShootDir(), -- 419
				Spread = self:GetSpread(), -- 420
				TracerName = self.Primary.TracerName, -- 421
				Tracer = self.Primary.TracerName == "" and 0 or self.Primary.TracerFrequency, -- 422
				Force = damage * 0.25, -- 423
				Damage = damage, -- 424
				Callback = function(attacker, tr, dmginfo) -- 425
					return dmginfo:ScaleDamage(self:GetDamageFalloff(tr.StartPos:Distance(tr.HitPos))) -- 426
				end -- 425
			} -- 416
			self:ModifyBulletTable(bullet) -- 428
			return ply:FireBullets(bullet) -- 429
		end, -- 431
		ModifyBulletTable = function(self, bullet) end, -- 433
		ShouldPump = function(self) -- 433
			return self.Primary.PumpAction -- 433
		end, -- 435
		GetDelay = function(self) -- 435
			local firemode = self:GetFiremode() -- 436
			if firemode > 0 then -- 438
				if (self:GetBurstFired() == 0) and (self.Primary.BurstEndDelay ~= 0) then -- 439
					return self.Primary.BurstEndDelay -- 440
				elseif self.Primary.BurstDelay ~= 0 then -- 441
					return self.Primary.BurstDelay -- 442
				end -- 439
			end -- 438
			local delay = self.Primary.Delay -- 444
			if delay == -1 then -- 445
				delay = self:SequenceDuration() -- 445
			end -- 445
			return delay -- 446
		end, -- 448
		GetDamage = function(self) -- 448
			return self.Primary.Damage -- 448
		end, -- 450
		GetDamageFalloff = function(self, distance) -- 450
			local falloff = 1 -- 451
			local min_damage = 0.2 -- 452
			local dist_mod = 1000 * falloff -- 453
			return math.max(self.Primary.RangeModifier ^ (distance / dist_mod), min_damage) -- 454
		end, -- 456
		GetRange = function(self) -- 456
			return self.Primary.Range, self.Primary.Accuracy -- 456
		end, -- 458
		GetSpread = function(self, range, accuracy) -- 458
			local range2, accuracy2 = self:GetRange() -- 459
			range = range or range2 -- 460
			accuracy = accuracy or accuracy2 -- 461
			local inches = accuracy / .75 -- 463
			local yards = (range / .75) / 36 -- 464
			local moa = (inches * 100) / yards -- 465
			local spread = math.rad(moa / 60) -- 467
			return Vector(spread, spread, 0) -- 468
		end, -- 470
		GetRecoilMultiplier = function(self) -- 470
			return math.tan(self:GetFOV() * (math.pi / 360)) * self:GetZoom() -- 470
		end, -- 472
		GetReloadTime = function(self) -- 472
			return self.Primary.Reload.Time > 0 and self.Primary.Reload.Time or self:SequenceDuration() -- 472
		end, -- 474
		GetZoom = function(self) -- 474
			if self:GetLowered() then -- 475
				return 1 -- 475
			end -- 475
			if self:GetAiming() then -- 476
				return 2 -- 476
			end -- 476
			return 1.25 -- 477
		end, -- 479
		IsReady = function(self) -- 479
			return CurTime() - self:GetLowerTime() >= 0.4 -- 479
		end, -- 481
		GetLowerFraction = function(self) -- 481
			local frac = math.Clamp(math.Remap(CurTime() - self:GetLowerTime(), 0, 0.4, 0, 1), 0, 1) -- 482
			if self:GetLowered() then -- 483
				return ease_out(frac) -- 483
			end -- 483
			return ease_in(1 - frac) -- 484
		end, -- 486
		HasCameraControl = function(self) -- 486
			local ply = self:GetOwner() -- 487
			if CLIENT and not ply:ShouldDrawLocalPlayer() then -- 488
				return true -- 488
			end -- 488
			return ply:GetViewEntity() == ply -- 489
		end, -- 491
		GetOwnerDefaultFOV = function(self) -- 491
			return self:GetOwner():GetInfoNum("fov_desired", 75) -- 491
		end, -- 493
		GetTargetFOV = function(self) -- 493
			local zoom = self:GetZoom() -- 494
			if zoom == 1 then -- 495
				return 0 -- 495
			end -- 495
			return self:GetOwnerDefaultFOV() / self:GetZoom() -- 496
		end, -- 498
		UpdateFOV = function(self, time) -- 498
			return self:GetOwner():SetFOV(self:GetTargetFOV(), time, self) -- 498
		end, -- 500
		GetFOV = function(self) -- 500
			return self:GetOwner():GetFOV() -- 500
		end, -- 502
		GetViewModel = function(self, index) -- 502
			return self:GetOwner():GetViewModel() -- 502
		end, -- 504
		IsEmpty = function(self) -- 504
			do -- 505
				local _exp_0 = self.AmmoType -- 505
				if AMMO_NORMAL == _exp_0 then -- 506
					return self:Clip1() < self.Primary.Cost -- 507
				elseif AMMO_NOMAG == _exp_0 then -- 508
					return self:GetOwner():GetAmmoCount(self.Primary.Ammo) < self.Primary.Cost -- 509
				elseif AMMO_INTERNAL == _exp_0 then -- 510
					return self:Clip1() < self.Primary.Cost -- 511
				end -- 511
			end -- 511
			return false -- 512
		end, -- 514
		GetShootDir = function(self) -- 514
			local ply = self:GetOwner() -- 515
			if ply:IsNPC() then -- 516
				return ply:GetAimVector() -- 516
			end -- 516
			return (ply:GetAimVector():Angle() + ply:GetViewPunchAngles()):Forward() -- 517
		end, -- 519
		HandleAutoRaise = function(self) -- 519
			if (self:GetLowered() or not self:IsReady()) and not self:IsReloading() then -- 520
				return true -- 522
			end -- 520
			return false -- 523
		end, -- 525
		IsAltFireHeld = function(self) -- 525
			local ply = self:GetOwner() -- 526
			if not IsValid(ply) or ply:IsNPC() then -- 527
				return false -- 527
			end -- 527
			return ply:KeyDown(IN_USE) and ply:KeyDown(IN_ATTACK) -- 528
		end, -- 530
		ForceStopFire = function(self) -- 530
			local ply = self:GetOwner() -- 531
			if not IsValid(ply) or not ply:IsPlayer() then -- 532
				return -- 532
			end -- 532
			return ply:ConCommand("-attack") -- 533
		end, -- 535
		DoAR2Impact = function(self, tr) -- 535
			if tr.HitSky then -- 536
				return -- 536
			end -- 536
			if not game.SinglePlayer() and not IsFirstTimePredicted() then -- 537
				return -- 537
			end -- 537
			local effect = EffectData() -- 538
			effect:SetOrigin(tr.HitPos + tr.HitNormal) -- 539
			effect:SetNormal(tr.HitNormal) -- 540
			return util.Effect("AR2Impact", effect) -- 541
		end, -- 543
		ApplyRecoil = function(self, recoil) -- 543
			local ply = self:GetOwner() -- 544
			if not ply:IsPlayer() then -- 545
				return -- 545
			end -- 545
			recoil = recoil or self.Primary.Recoil -- 546
			local seed = ply:GetCurrentCommand():CommandNumber() -- 547
			local mult = self:GetRecoilMultiplier() -- 548
			local pitch = -util.SharedRandom(tostring(self:EntIndex()) .. tostring(seed) .. "1", recoil.MinAng.p, recoil.MaxAng.p) * mult -- 549
			local yaw = -util.SharedRandom(tostring(self:EntIndex()) .. tostring(seed) .. "2", recoil.MinAng.y, recoil.MaxAng.y) * mult -- 550
			if game.SinglePlayer() or (CLIENT and IsFirstTimePredicted()) then -- 551
				ply:SetEyeAngles(ply:EyeAngles() + Angle(pitch, yaw, 0) * recoil.Punch) -- 552
			end -- 551
			return ply:ViewPunch(Angle(pitch, yaw, 0)) -- 553
		end, -- 555
		ApplyStaticRecoil = function(self, ang, recoil) -- 555
			local ply = self:GetOwner() -- 556
			if not ply:IsPlayer() then -- 557
				return -- 557
			end -- 557
			recoil = recoil or self.Primary.Recoil -- 558
			local seed = ply:GetCurrentCommand():CommandNumber() -- 559
			local mult = self:GetRecoilMultiplier() -- 560
			local pitch = ang.p * mult -- 561
			local yaw = ang.y * mult -- 562
			if game.SinglePlayer() or (CLIENT and IsFirstTimePredicted()) then -- 563
				ply:SetEyeAngles(ply:EyeAngles() + Angle(pitch, yaw, 0) * recoil.Punch) -- 564
			end -- 563
			return ply:ViewPunch(Angle(pitch, yaw, 0)) -- 565
		end, -- 567
		HandleReloadAbort = function(self) -- 567
			if self:IsReloading() then -- 568
				if self.Primary.Reload.Shotgun then -- 569
					self:SetAbortReload(true) -- 569
				end -- 569
				return true -- 570
			end -- 568
			return false -- 571
		end, -- 573
		IsReloading = function(self) -- 573
			return self:GetFinishReload() ~= 0 -- 573
		end, -- 575
		CanReload = function(self) -- 575
			if self.AmmoType ~= AMMO_NORMAL then -- 576
				return false -- 576
			end -- 576
			if self:GetNextFire() > CurTime() then -- 577
				return false -- 577
			end -- 577
			if self:IsReloading() or (self:Clip1() >= self.Primary.ClipSize) then -- 578
				return false -- 578
			end -- 578
			if self:GetOwner():GetAmmoCount(self.Primary.Ammo) <= 0 then -- 579
				return false -- 579
			end -- 579
			return true -- 580
		end, -- 582
		Reload = function(self) -- 582
			if not self:CanReload() then -- 583
				return -- 583
			end -- 583
			return self:StartReload() -- 584
		end, -- 586
		StartReload = function(self) -- 586
			local reload = self.Primary.Reload -- 587
			self:GetOwner():SetAnimation(PLAYER_RELOAD) -- 588
			if reload.Shotgun then -- 589
				self:SendTranslatedWeaponAnim(ACT_SHOTGUN_RELOAD_START) -- 590
				self:SetFirstReload(true) -- 591
			else -- 593
				self:SendTranslatedWeaponAnim(ACT_VM_RELOAD) -- 593
				self:EmitReloadSound() -- 594
			end -- 589
			local duration = self:GetReloadTime() -- 595
			local f = CurTime() + duration -- 596
			self:SetFinishReload(f) -- 597
			return self:SetNextIdle(f) -- 598
		end, -- 600
		HandleReload = function(self) -- 600
			local reload = self:GetFinishReload() -- 601
			if reload > 0 and reload <= CurTime() then -- 602
				return self:FinishReload() -- 602
			end -- 602
		end, -- 604
		HandleAiming = function(self) -- 604
			local ply = self:GetOwner() -- 605
			local aim = ply:KeyDown(IN_ATTACK2) and self:IsReady() and not self:IsReloading() -- 606
			if aim ~= self:GetAiming() then -- 607
				self:SetAiming(aim) -- 608
				return self:UpdateFOV(0.2) -- 609
			end -- 607
		end, -- 611
		FinishReload = function(self) -- 611
			local primary = self.Primary -- 612
			local reload = primary.Reload -- 613
			local ply = self:GetOwner() -- 614
			local amount = math.min(primary.ClipSize - self:Clip1(), reload.Amount) -- 615
			local first = self:GetFirstReload() -- 616
			if not first then -- 617
				local acount = ply:GetAmmoCount(primary.Ammo) -- 618
				self:SetAbortReload(true) -- 619
				amount = math.min(amount, acount) -- 620
				ply:RemoveAmmo(amount, primary.Ammo) -- 621
			end -- 617
			if reload.Shotgun then -- 622
				if not first then -- 623
					self:SetClip1(self:Clip1() + amount) -- 623
				end -- 623
				local pump = self:Clip1() == amount -- 624
				if self:Clip1() >= primary.ClipSize or amount <= 0 or self:GetAbortReload() then -- 625
					if pump and (not reload.DontFinishPump) then -- 626
						self:SendTranslatedWeaponAnim(primary.Reload.Act or ACT_SHOTGUN_RELOAD_FINISH) -- 627
						local duration = self:SequenceDuration() -- 628
						local d = CurTime() + duration -- 629
						self:SetNextFire(d) -- 630
						self:SetNextIdle(d) -- 631
					end -- 626
					self:SetAbortReload(false) -- 632
					self:SetFinishReload(0) -- 633
				else -- 635
					self:SendTranslatedWeaponAnim(ACT_VM_RELOAD) -- 635
					if self.GetFirstReload then -- 636
						self:SetFirstReload(false) -- 636
					end -- 636
					if (reload.Sound ~= "") and IsFirstTimePredicted() then -- 637
						self:EmitSound(reload.Sound) -- 637
					end -- 637
					local duration = self:SequenceDuration() -- 638
					local d = CurTime() + duration -- 639
					self:SetNextFire(d) -- 640
					self:SetNextIdle(d) -- 641
					self:SetFinishReload(CurTime() + duration) -- 642
				end -- 625
			else -- 644
				self:SetClip1(self:Clip1() + amount) -- 644
				self:SetFinishReload(0) -- 645
			end -- 622
			self.Primary.Automatic = true -- 646
		end, -- 648
		EmitEmptySound = function(self) -- 648
			return self:EmitSound(")weapons/pistol/pistol_empty.wav", 75, 100, 0.7, CHAN_STATIC) -- 648
		end, -- 650
		EmitFireSound = function(self) -- 650
			self:EmitSound(self.Primary.Sound) -- 651
			local pump = self.Primary.Pump -- 652
			if pump then -- 653
				return timer.Simple(pump.Delay or 0.4, function() -- 654
					if IsValid(self) then -- 655
						return self:EmitSound(pump.Sound) -- 656
					end -- 655
				end) -- 657
			end -- 653
		end, -- 658
		EmitReloadSound = function(self) -- 658
			local reload = self.Primary.Reload -- 659
			if reload.Sound ~= "" then -- 660
				return self:EmitSound(reload.Sound) -- 660
			end -- 660
		end, -- 662
		TranslateFOV = function(self, fov) -- 662
			if not IsValid(self:GetOwner()) then -- 663
				return fov -- 663
			end -- 663
			local desired = self:GetOwnerDefaultFOV() -- 664
			self.ViewModelFOV = self.ViewModelTargetFOV + (desired - fov) * 0.6 -- 665
			return fov -- 666
		end, -- 668
		HandleViewModel = function(self) -- 668
			if CLIENT then -- 669
				self.SwayScale = 1 -- 670
				self.BobScale = 1 -- 671
			end -- 669
		end, -- 673
		CalcView = function(self, ply, pos, ang, fov) -- 673
			if not self:HasCameraControl() then -- 674
				return -- 674
			end -- 674
			return pos, ang - ply:GetViewPunchAngles() * self.Primary.Recoil.Ratio, fov -- 675
		end, -- 677
		GetBobScale = function(self) -- 677
			return 1 -- 677
		end, -- 679
		GetSwayScale = function(self) -- 679
			return 2 -- 679
		end, -- 681
		AddViewmodelBob = function(self, pos, ang) -- 681
			local ply = self:GetOwner() -- 682
			local max_speed = ply:IsOnGround() and 160 or 500 -- 683
			local scale = self:GetBobScale() -- 684
			local speed = math.min(ply:GetVelocity():Length2D(), ply:GetRunSpeed()) -- 686
			local offset = math.Remap(speed, 0, max_speed, 0, 1) -- 687
			local ct = CurTime() -- 688
			bob_time = bob_time + ((ct - last_bob_time) * offset) -- 690
			last_bob_time = ct -- 691
			local cycle = bob_time - math.floor((bob_time / HL2_BOB_VERTICAL) * HL2_BOB_VERTICAL) -- 693
			cycle = cycle / HL2_BOB_VERTICAL -- 694
			if cycle < HL2_BOB then -- 696
				cycle = math.pi * (cycle / HL2_BOB) -- 697
			else -- 699
				cycle = math.pi + math.pi * (cycle - HL2_BOB) / (1 - HL2_BOB) -- 699
			end -- 696
			local vertical = speed * .005 * scale -- 701
			vertical = math.Clamp(vertical * .3 + vertical * .7 * math.sin(cycle), -7, 4) -- 702
			cycle = bob_time - math.floor((bob_time / HL2_BOB_LATERAL) * HL2_BOB_LATERAL) -- 704
			cycle = cycle / HL2_BOB_LATERAL -- 705
			if cycle < HL2_BOB then -- 707
				cycle = math.pi * (cycle / HL2_BOB) -- 708
			else -- 710
				cycle = math.pi + math.pi * (cycle - HL2_BOB) / (1 - HL2_BOB) -- 710
			end -- 707
			local lateral = speed * .005 * scale -- 712
			lateral = math.Clamp(lateral * .3 + lateral * .7 * math.sin(cycle), -7, 4) -- 713
			pos:Add(ang:Forward() * vertical * .1) -- 716
			pos:Add(ang:Right() * lateral * .8) -- 717
			pos:AddZ(vertical * .1 * scale) -- 718
			ang:SubPitch(vertical * .4) -- 720
			ang:SubYaw(lateral * .3) -- 721
			ang:AddRoll(vertical * .5) -- 722
			return ang -- 719
		end, -- 724
		GetViewModelPosition = function(self, pos, ang) -- 724
			local fraction = self:GetLowerFraction() -- 725
			local offset = self.ViewOffset -- 726
			pos, ang = LocalToWorld(offset, Angle(fraction * 15, 0, 0), pos, ang) -- 727
			local ply = self:GetOwner() -- 728
			if IsValid(ply) then -- 729
				local const = math.pi / 360 -- 730
				local fov, vmfov = ply:GetFOV(), self.ViewModelFOV -- 731
				local ratio = math.tan(math.min(fov, vmfov) * const) / math.tan(math.max(fov, vmfov) * const) -- 732
				ang = ang + ply:GetViewPunchAngles() * ratio * self.Primary.Recoil.Ratio -- 733
			end -- 729
			self:AddViewmodelBob(pos, ang) -- 734
			return pos, ang -- 735
		end, -- 737
		AdjustMouseSensitivity = function(self) -- 737
			if not self:HasCameraControl() then -- 738
				return 1 -- 738
			end -- 738
			local desired = self:GetOwnerDefaultFOV() -- 739
			local fov = self:GetFOV() -- 740
			return fov / desired -- 741
		end, -- 743
		DrawWorldModelTranslucent = function(self, flags) -- 743
			return self:DrawWorldModel(flags) -- 743
		end -- 96
	} -- 96
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 743
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 96
			_base_0[_key_0] = _val_0 -- 96
		end -- 96
	end -- 743
	if _base_0.__index == nil then -- 96
		_base_0.__index = _base_0 -- 96
	end -- 743
	setmetatable(_base_0, _parent_0.__base) -- 96
	_class_0 = setmetatable({ -- 96
		__init = function(self, ...) -- 96
			return _class_0.__parent.__init(self, ...) -- 96
		end, -- 96
		__base = _base_0, -- 96
		__name = "EvilRP_Weapon", -- 96
		__parent = _parent_0 -- 96
	}, { -- 96
		__index = function(cls, name) -- 96
			local val = rawget(_base_0, name) -- 96
			if val == nil then -- 96
				local parent = rawget(cls, "__parent") -- 96
				if parent then -- 96
					return parent[name] -- 96
				end -- 96
			else -- 96
				return val -- 96
			end -- 96
		end, -- 96
		__call = function(cls, ...) -- 96
			local _self_0 = setmetatable({ }, _base_0) -- 96
			cls.__init(_self_0, ...) -- 96
			return _self_0 -- 96
		end -- 96
	}) -- 96
	_base_0.__class = _class_0 -- 96
	if _parent_0.__inherited then -- 96
		_parent_0.__inherited(_parent_0, _class_0) -- 96
	end -- 96
	EvilRP_Weapon = _class_0 -- 96
end -- 743
do -- 745
	local _class_0 -- 745
	local _parent_0 = WEAPON -- 745
	local _base_0 = { -- 745
		Base = "weapon_base", -- 748
		Category = "EvilRP", -- 750
		m_WeaponDeploySpeed = 1, -- 752
		DrawWeaponInfoBox = false, -- 754
		ViewModelFOV = 54, -- 756
		HoldType = "melee", -- 757
		LowerHoldType = "normal", -- 759
		Primary = { -- 760
			Ammo = "", -- 760
			ClipSize = -1, -- 761
			DefaultClip = 0, -- 762
			Automatic = false, -- 763
			ChargeTime = 1, -- 765
			AutoSwing = true, -- 766
			Light = { -- 769
				Damage = 1, -- 769
				DamageType = DMG_CLUB, -- 770
				Range = 75, -- 772
				Delay = 0.1, -- 773
				Act = ACT_VM_HITCENTER, -- 775
				Sound = "" -- 777
			}, -- 768
			Heavy = { -- 780
				Damage = 1, -- 780
				DamageType = DMG_CLUB, -- 781
				Range = 75, -- 783
				Delay = 0.1, -- 784
				Act = ACT_VM_HITCENTER, -- 786
				Sound = "" -- 788
			} -- 779
		}, -- 790
		Secondary = { -- 791
			Ammo = "", -- 791
			ClipSize = -1, -- 792
			DefaultClip = 0, -- 793
			Automatic = false -- 794
		}, -- 796
		ChargeOffset = { -- 797
			Pos = Vector(), -- 797
			Ang = Angle() -- 798
		}, -- 800
		SetupDataTables = function(self) -- 800
			self:NetworkVar("Bool", "Lowered") -- 801
			self:NetworkVar("Float", "LowerTime") -- 802
			self:NetworkVar("Float", "NextIdle") -- 803
			self:NetworkVar("Float", "ChargeTime") -- 804
			return self:NetworkVar("Float", "NextAltFire") -- 805
		end, -- 807
		Deploy = function(self) -- 807
			self:SetLowerTime(0) -- 808
			self:SetLowered(self:CanLower()) -- 809
			self:SetHoldType(self.LowerHoldType) -- 810
			self:SendTranslatedWeaponAnim(ACT_VM_DRAW) -- 811
			self:SetNextIdle(CurTime() + self:SequenceDuration()) -- 812
			return true -- 813
		end, -- 815
		Holster = function(self) -- 815
			self:SetChargeTime(0) -- 816
			return true -- 817
		end, -- 819
		IsReady = function(self) -- 819
			return CurTime() - self:GetLowerTime() >= 0.4 -- 819
		end, -- 820
		CanLower = function(self) -- 820
			return self:IsReady() and self:GetChargeTime() == 0 -- 820
		end, -- 821
		SetLower = function(self, lower) -- 821
			if self:GetLowered() ~= lower then -- 822
				self:SetLowered(lower) -- 823
				self:SetLowerTime(CurTime()) -- 824
				self:SetHoldType(lower and self.LowerHoldType or self.HoldType) -- 825
				local vm = self.Owner:GetViewModel() -- 826
				if lower then -- 827
					if self.HolsterAnim then -- 828
						vm:SendViewModelMatchingSequence(vm:LookupSequence(self.HolsterAnim)) -- 829
					end -- 828
				else -- 831
					if self.DrawAnim then -- 831
						vm:SendViewModelMatchingSequence(vm:LookupSequence(self.DrawAnim)) -- 832
					end -- 831
				end -- 827
			end -- 822
			self.Primary.Automatic = true -- 833
			return true -- 834
		end, -- 836
		PrimaryAttack = function(self) -- 836
			if self:GetLowered() then -- 837
				return -- 837
			end -- 837
			local ply = self:GetOwner() -- 838
			if self.Primary.ChargeTime == 0 then -- 839
				self.Primary.Automatic = self.Primary.AutoSwing -- 840
				self:LightAttack() -- 841
				return -- 842
			end -- 839
			if self:GetChargeTime() ~= 0 then -- 843
				return -- 843
			end -- 843
			self:SetChargeTime(CurTime()) -- 844
			self.Primary.Automatic = false -- 845
		end, -- 847
		SecondaryAttack = function(self) -- 847
			return self:TryAltFire() -- 847
		end, -- 851
		TryAltFire = function(self) -- 851
			if (self:GetNextAltFire() > CurTime()) or (not self:CanAltFire()) then -- 852
				return -- 852
			end -- 852
			return self:AltFire() -- 853
		end, -- 855
		CanAltFire = function(self) -- 855
			return true -- 855
		end, -- 857
		AltFire = function(self) end, -- 859
		HandleIdle = function(self) -- 859
			local idle = self:GetNextIdle() -- 860
			if idle > 0 and idle <= CurTime() then -- 861
				self:SendTranslatedWeaponAnim(ACT_VM_IDLE) -- 862
				return self:SetNextIdle(0) -- 863
			end -- 861
		end, -- 865
		Think = function(self) -- 865
			self:HandleIdle() -- 866
			if not self:GetLowered() then -- 867
				return self:HandleCharge() -- 868
			end -- 867
		end, -- 870
		OnReloaded = function(self) -- 870
			return self:SetWeaponHoldType(self:GetHoldType()) -- 870
		end, -- 872
		GetLowerFraction = function(self) -- 872
			local frac = math.Clamp(math.Remap(CurTime() - self:GetLowerTime(), 0, 0.4, 0, 1), 0, 1) -- 873
			if self:GetLowered() then -- 874
				return ease_out(frac) -- 875
			else -- 877
				return ease_in(1 - frac) -- 877
			end -- 874
		end, -- 879
		SetupMove = function(self, ply, mv) -- 879
			local fraction = self:GetLowerFraction() -- 880
			if fraction == 1 then -- 881
				return -- 881
			end -- 881
			local speed = math.Remap(fraction, 0, 1, ply:GetWalkSpeed(), ply:GetRunSpeed()) -- 882
			if mv:GetForwardSpeed() <= 0 then -- 883
				return mv:SetMaxClientSpeed(speed) -- 883
			end -- 883
		end, -- 885
		OnRestore = function(self) -- 885
			self:SetLowerTime(0) -- 886
			self:SetNextIdle(CurTime()) -- 887
			return self:SetNextAltFire(CurTime()) -- 888
		end, -- 890
		TranslateWeaponAnim = function(self, act) -- 890
			return act -- 890
		end, -- 891
		SendTranslatedWeaponAnim = function(self, act) -- 891
			act = self:TranslateWeaponAnim(act) -- 892
			if not act then -- 893
				return -- 893
			end -- 893
			return self:SendWeaponAnim(act) -- 894
		end, -- 896
		GetDelay = function(self, heavy, hit, trace) -- 896
			local tab = heavy and self.Primary.Heavy or self.Primary.Light -- 897
			if istable(tab.Delay) then -- 898
				return hit and tab.Delay[1] or tab.Delay[2] -- 898
			end -- 898
			return tab.Delay -- 899
		end, -- 901
		GetAttackAct = function(self, heavy, hit, trace) -- 901
			local tab = heavy and self.Primary.Heavy or self.Primary.Light -- 902
			if istable(tab.Act) then -- 903
				return hit and tab.Act[1] or tab.Act[2] -- 903
			end -- 903
			return tab.Act -- 904
		end, -- 906
		PlayAttackSound = function(self, heavy, hit, trace) -- 906
			local tab = heavy and self.Primary.Heavy or self.Primary.Light -- 907
			local snd = tab.Sound -- 908
			if istable(snd) then -- 909
				if snd[3] and trace.HitWorld then -- 910
					snd = snd[3] -- 911
				else -- 913
					snd = hit and snd[1] or snd[2] -- 913
				end -- 910
			end -- 909
			if snd ~= "" then -- 914
				return self:EmitSound(snd) -- 914
			end -- 914
		end, -- 916
		GetDamage = function(self, heavy, trace) -- 916
			local tab = heavy and self.Primary.Heavy or self.Primary.Light -- 917
			return tab.Damage, tab.DamageType -- 918
		end, -- 920
		HandleCharge = function(self) -- 920
			if game.SinglePlayer() and CLIENT then -- 921
				return -- 921
			end -- 921
			if self:GetLowered() then -- 922
				return -- 922
			end -- 922
			local charge = self:GetChargeTime() -- 923
			if charge > 0 and not self:GetOwner():KeyDown(IN_ATTACK) then -- 924
				local primary = self.Primary -- 925
				local time = CurTime() - charge -- 926
				if time < engine.TickInterval() then -- 927
					return -- 927
				end -- 927
				if primary.ChargeTime > 0 and time > primary.ChargeTime then -- 928
					self:HeavyAttack() -- 929
				else -- 931
					self:LightAttack() -- 931
				end -- 928
				self:SetChargeTime(0) -- 932
				self.Primary.Automatic = self.Primary.AutoSwing -- 933
			end -- 924
		end, -- 935
		RefineHullTrace = function(self, trace, result) -- 935
			local distance = math.huge -- 936
			local endpos = result.StartPos + (result.HitPos - result.StartPos) * 2 -- 937
			trace.start = result.StartPos -- 939
			trace.endpos = endpos -- 940
			local tr = result -- 942
			local temp = util.TraceLine(trace) -- 943
			if temp.Hit then -- 944
				return temp -- 944
			end -- 944
			for i = -1, 1, 2 do -- 946
				for j = -1, 1, 2 do -- 947
					for k = -1, 1, 2 do -- 948
						local vec = Vector(endpos.x + (16 * i), endpos.y + (16 * j), endpos.z + (16 * k)) -- 949
						trace.endpos = vec -- 950
						temp = util.TraceLine(trace) -- 951
						if temp.Hit then -- 952
							local dist = (tr.HitPos - tr.StartPos):Length() -- 953
							if dist < distance then -- 954
								tr = temp -- 955
								distance = dist -- 956
							end -- 954
						end -- 952
					end -- 956
				end -- 956
			end -- 956
			return tr -- 957
		end, -- 960
		GetAttackTrace = function(self, range) -- 960
			local ply = self:GetOwner() -- 961
			local start = ply:GetShootPos() -- 962
			local forward = ply:GetAimVector() -- 963
			local endpos = start + forward * range -- 964
			local trace = { -- 966
				start = start, -- 966
				endpos = endpos, -- 967
				mins = Vector(-16, -16, -16), -- 968
				maxs = Vector(16, 16, 16), -- 969
				mask = MASK_SHOT_HULL, -- 970
				filter = ply, -- 971
				collisiongroup = COLLISION_GROUP_NONE -- 972
			} -- 965
			local tr = util.TraceLine(trace) -- 974
			if tr.Hit then -- 975
				return true, tr -- 975
			end -- 975
			trace.endpos = trace.endpos - (forward * 1.732 * 16) -- 976
			tr = util.TraceHull(trace) -- 977
			if tr.Hit and IsValid(tr.Entity) then -- 978
				local vec = (tr.Entity:GetPos() - start):GetNormalized() -- 979
				if vec:Dot(forward) < math.rad(0.70721) then -- 980
					return false, tr -- 980
				end -- 980
				return true, self:RefineHullTrace(table.Copy(trace), tr) -- 981
			end -- 978
			return false, tr -- 982
		end, -- 984
		LightAttack = function(self) -- 984
			return self:GenericAttack(false) -- 984
		end, -- 985
		HeavyAttack = function(self) -- 985
			return self:GenericAttack(true) -- 985
		end, -- 986
		GenericAttack = function(self, heavy) -- 986
			local tab = heavy and self.Primary.Heavy or self.Primary.Light -- 987
			local ply = self:GetOwner() -- 988
			ply:LagCompensation(true) -- 989
			local hit, trace = self:GetAttackTrace(tab.Range) -- 990
			ply:LagCompensation(false) -- 991
			ply:SetAnimation(PLAYER_ATTACK1) -- 992
			if hit and SERVER then -- 993
				local dmg = DamageInfo() -- 994
				local damage, damage_type = self:GetDamage(heavy, trace) -- 995
				dmg:SetDamage(damage) -- 997
				dmg:SetDamageType(damage_type) -- 998
				dmg:SetInflictor(self) -- 999
				dmg:SetAttacker(self:GetOwner()) -- 1000
				dmg:SetDamagePosition(trace.HitPos) -- 1001
				dmg:SetDamageForce(trace.Normal * (tab.Damage * 300)) -- 1002
				if bit.band(util.PointContents(trace.HitPos), CONTENTS_WATER) == 0 then -- 1003
					local ed = EffectData() -- 1004
					ed:SetEntity(trace.Entity) -- 1006
					ed:SetOrigin(trace.HitPos) -- 1007
					ed:SetStart(trace.StartPos) -- 1008
					ed:SetSurfaceProp(trace.SurfaceProps) -- 1009
					ed:SetDamageType(damage_type) -- 1010
					ed:SetHitBox(trace.HitBox) -- 1011
					util.Effect("Impact", ed, false, true) -- 1012
				end -- 1003
				if IsValid(trace.Entity) then -- 1013
					trace.Entity:DispatchTraceAttack(dmg, trace) -- 1013
				end -- 1013
			end -- 993
			self:WaterImpact(trace.StartPos, trace.HitPos) -- 1014
			self:SendTranslatedWeaponAnim(self:GetAttackAct(heavy, hit)) -- 1015
			self:SetNextIdle(CurTime() + self:SequenceDuration()) -- 1016
			self:PlayAttackSound(heavy, hit, trace) -- 1017
			local delay = self:GetDelay(heavy, hit) -- 1018
			if delay == -1 then -- 1019
				delay = self:SequenceDuration() -- 1019
			end -- 1019
			self:SetNextPrimaryFire(CurTime() + delay) -- 1020
			return hit, trace -- 1021
		end, -- 1022
		WaterImpact = function(self, start, endpos) -- 1022
			local flags = bit.bor(CONTENTS_WATER, CONTENTS_SLIME) -- 1023
			if bit.band(util.PointContents(start), flags) ~= 0 then -- 1024
				return -- 1024
			end -- 1024
			if bit.band(util.PointContents(endpos), flags) == 0 then -- 1025
				return -- 1025
			end -- 1025
			local tr = util.TraceLine({ -- 1027
				start = start, -- 1027
				endpos = endpos, -- 1028
				mask = flags, -- 1029
				filter = self:GetOwner(), -- 1030
				collisiongroup = COLLISION_GROUP_NONE -- 1031
			}) -- 1026
			if tr.Hit then -- 1033
				local ed = EffectData() -- 1034
				ed:SetFlags(bit.band(tr.Contents, CONTENTS_SLIME) == 0 and 0 or 1) -- 1036
				ed:SetOrigin(tr.HitPos) -- 1037
				ed:SetNormal(tr.HitNormal) -- 1038
				ed:SetScale(8) -- 1039
				return util.Effect("watersplash", ed, false, true) -- 1040
			end -- 1033
		end, -- 1041
		GetViewModelPosition = function(self, pos, ang) -- 1041
			local fraction = self:GetLowerFraction() -- 1042
			local offset = (function() -- 1043
				local _obj_0 = self.ViewOffset -- 1043
				if _obj_0 ~= nil then -- 1043
					return _obj_0.Pos -- 1043
				end -- 1043
				return nil -- 1043
			end)() or Vector() -- 1043
			pos, ang = LocalToWorld(offset, Angle(fraction * 15, 0, 0), pos, ang) -- 1044
			local charge = self:GetChargeTime() -- 1045
			if self.Primary.ChargeTime > 0 and charge ~= 0 then -- 1046
				local frac = ease(math.Clamp(math.Remap(CurTime() - charge, 0, self.Primary.ChargeTime * 2, 0, 1), 0, 1)) -- 1047
				local charge_pos = LerpVector(frac, vector_origin, self.ChargeOffset.Pos) -- 1048
				local charge_ang = LerpAngle(frac, angle_zero, self.ChargeOffset.Ang) -- 1049
				pos, ang = LocalToWorld(charge_pos, charge_ang, pos, ang) -- 1050
			end -- 1046
			return pos, ang -- 1051
		end -- 745
	} -- 745
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 1052
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 745
			_base_0[_key_0] = _val_0 -- 745
		end -- 745
	end -- 1052
	if _base_0.__index == nil then -- 745
		_base_0.__index = _base_0 -- 745
	end -- 1052
	setmetatable(_base_0, _parent_0.__base) -- 745
	_class_0 = setmetatable({ -- 745
		__init = function(self, ...) -- 745
			return _class_0.__parent.__init(self, ...) -- 745
		end, -- 745
		__base = _base_0, -- 745
		__name = "EvilRP_Melee", -- 745
		__parent = _parent_0 -- 745
	}, { -- 745
		__index = function(cls, name) -- 745
			local val = rawget(_base_0, name) -- 745
			if val == nil then -- 745
				local parent = rawget(cls, "__parent") -- 745
				if parent then -- 745
					return parent[name] -- 745
				end -- 745
			else -- 745
				return val -- 745
			end -- 745
		end, -- 745
		__call = function(cls, ...) -- 745
			local _self_0 = setmetatable({ }, _base_0) -- 745
			cls.__init(_self_0, ...) -- 745
			return _self_0 -- 745
		end -- 745
	}) -- 745
	_base_0.__class = _class_0 -- 745
	local self = _class_0; -- 745
	self.__weapon = "evilrp_melee" -- 746
	if _parent_0.__inherited then -- 745
		_parent_0.__inherited(_parent_0, _class_0) -- 745
	end -- 745
	EvilRP_Melee = _class_0 -- 745
end -- 1052
hook.Add("SetupMove", "evilrp_weapon_movement", function(ply, mv) -- 1053
	local weapon = ply:GetActiveWeapon() -- 1054
	if not IsValid(weapon) then -- 1055
		return -- 1055
	end -- 1055
	if not string.find(weapon:GetClass(), "evilrp_") then -- 1056
		return -- 1056
	end -- 1056
	if not weapon.SetupMove then -- 1057
		return -- 1057
	end -- 1057
	weapon:SetupMove(ply, mv) -- 1058
	return -- 1059
end) -- 1053
if CLIENT then -- 1061
	hook.Add("PostDrawTranslucentRenderables", "evilrp_weapon_render", function(depth, skybox, skybox3d) -- 1062
		if skybox then -- 1063
			return -- 1063
		end -- 1063
		if skybox3d then -- 1064
			return -- 1064
		end -- 1064
		local _list_0 = player.GetAll() -- 1065
		for _index_0 = 1, #_list_0 do -- 1065
			local ply = _list_0[_index_0] -- 1065
			local _continue_0 = false -- 1066
			repeat -- 1066
				if (not IsValid(ply) or ply:IsDormant() or ply:InVehicle()) then -- 1066
					_continue_0 = true -- 1066
					break -- 1066
				end -- 1066
				local weapon = ply:GetActiveWeapon() -- 1067
				if (not IsValid(weapon) or weapon:IsDormant() or not string.find(weapon:GetClass(), "evilrp_")) then -- 1068
					_continue_0 = true -- 1068
					break -- 1068
				end -- 1068
				if not weapon.PostDrawTranslucentRenderables then -- 1069
					_continue_0 = true -- 1069
					break -- 1069
				end -- 1069
				weapon:PostDrawTranslucentRenderables() -- 1070
				_continue_0 = true -- 1066
			until true -- 1070
			if not _continue_0 then -- 1070
				break -- 1070
			end -- 1070
		end -- 1070
		return -- 1071
	end) -- 1062
	return hook.Add("HUDPaint", "evilrp_weapon_crosshair", function() -- 1072
		local ply = LocalPlayer() -- 1073
		if not (IsValid(ply) and ply:Alive()) then -- 1074
			return -- 1074
		end -- 1074
		local weapon = ply:GetActiveWeapon() -- 1075
		if not IsValid(weapon) then -- 1076
			return -- 1076
		end -- 1076
		if not (weapon.GetAiming and weapon:GetAiming()) then -- 1077
			return -- 1077
		end -- 1077
		local width, height = ScrW(), ScrH() -- 1079
		local x = width / 2 -- 1080
		local y = height / 2 -- 1081
		local color = Color(255, 255, 255, 200) -- 1083
		local angle = CurTime() * 2 -- 1085
		local cos_a = math.cos(angle) -- 1086
		local sin_a = math.sin(angle) -- 1087
		local points = { -- 1090
			{ -- 1090
				0, -- 1090
				-8 -- 1090
			}, -- 1090
			{ -- 1091
				-5, -- 1091
				0 -- 1091
			}, -- 1091
			{ -- 1092
				5, -- 1092
				0 -- 1092
			} -- 1092
		} -- 1089
		surface.SetDrawColor(color) -- 1095
		for _index_0 = 1, #points do -- 1096
			local p = points[_index_0] -- 1096
			local ox, oy = p[1], p[2] -- 1097
			local rx = ox * cos_a - oy * sin_a -- 1098
			local ry = ox * sin_a + oy * cos_a -- 1099
			surface.DrawRect((x + rx - 1), (y + ry - 1), 3, 3) -- 1100
		end -- 1100
	end) -- 1100
end -- 1061
