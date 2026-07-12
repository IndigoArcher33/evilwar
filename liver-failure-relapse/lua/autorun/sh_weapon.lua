-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/autorun/sh_weapon.yue
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
			self:NetworkVar("Bool", "NeedPump") -- 223
			self:NetworkVar("Bool", "FirstReload") -- 224
			self:NetworkVar("Bool", "AbortReload") -- 225
			self:NetworkVar("Int", "Firemode") -- 227
			self:NetworkVar("Int", "BurstFired") -- 228
			self:NetworkVar("Float", "LowerTime") -- 230
			self:NetworkVar("Float", "NextIdle") -- 231
			self:NetworkVar("Float", "FinishReload") -- 232
			self:NetworkVar("Float", "NextFire") -- 234
			return self:NetworkVar("Float", "NextAltFire") -- 235
		end, -- 237
		OwnerChanged = function(self) -- 237
			local old = self:GetLastOwner() -- 238
			if IsValid(old) and old:IsPlayer() then -- 239
				old:SetFOV(0, 0.1, self) -- 239
			end -- 239
			local ply = self:GetOwner() -- 240
			if IsValid(ply) and ply:IsNPC() then -- 241
				self:SetHoldType(self.HoldType) -- 241
			end -- 241
			return self:SetLastOwner(ply) -- 242
		end, -- 244
		Deploy = function(self) -- 244
			self:SetLowerTime(0) -- 245
			self:SetLowered(true) -- 246
			self:SetHoldType(self.LowerHoldType) -- 247
			self:SetNextIdle(CurTime() + self:SequenceDuration()) -- 248
			return true -- 249
		end, -- 251
		Holster = function(self) -- 251
			self:SetFirstReload(false) -- 252
			self:SetAbortReload(false) -- 253
			self:SetFinishReload(0) -- 254
			local ply = self:GetOwner() -- 255
			if IsValid(ply) and ply:IsPlayer() then -- 256
				ply:SetFOV(0, 0.1, self) -- 256
			end -- 256
			return true -- 257
		end, -- 259
		CanLower = function(self) -- 259
			if not self:IsReady() then -- 260
				return false -- 260
			end -- 260
			if self:IsReloading() then -- 261
				return false -- 261
			end -- 261
			return true -- 262
		end, -- 264
		SetLower = function(self, lower) -- 264
			if self:GetLowered() ~= lower then -- 265
				self:SetLowered(lower) -- 266
				self:SetLowerTime(CurTime()) -- 267
				self:SetHoldType(lower and self.LowerHoldType or self.HoldType) -- 268
				local vm = self.Owner:GetViewModel() -- 269
				if lower then -- 270
					if self.HolsterAnim then -- 271
						vm:SendViewModelMatchingSequence(vm:LookupSequence(self.HolsterAnim)) -- 272
					end -- 271
				else -- 274
					if self.DrawAnim then -- 274
						vm:SendViewModelMatchingSequence(vm:LookupSequence(self.DrawAnim)) -- 275
					end -- 274
				end -- 270
				self:UpdateFOV(0.4) -- 276
			end -- 265
			self.Primary.Automatic = true -- 277
			return true -- 278
		end, -- 280
		PrimaryAttack = function(self) -- 280
			local ply = self:GetOwner() -- 281
			if (self:GetNextFire() > CurTime()) or (not self:CanPrimaryFire()) then -- 282
				return -- 282
			end -- 282
			return self:PrimaryFire() -- 283
		end, -- 285
		SecondaryAttack = function(self) -- 285
			return self:TryAltFire() -- 285
		end, -- 287
		HandleIdle = function(self) -- 287
			local idle = self:GetNextIdle() -- 288
			if idle > 0 and idle <= CurTime() then -- 289
				self:SendTranslatedWeaponAnim(ACT_VM_IDLE) -- 290
				return self:SetNextIdle(0) -- 291
			end -- 289
		end, -- 293
		HandlePump = function(self) -- 293
			if self:GetNeedPump() and (not self:IsReloading()) and ((self:GetNextFire() <= CurTime())) then -- 294
				if (not self.Primary.PumpOnEmpty) and (self:Clip1() == 0) then -- 295
					return -- 295
				end -- 295
				self:SendTranslatedWeaponAnim(ACT_SHOTGUN_PUMP) -- 296
				local snd = self.Primary.PumpSound -- 297
				if snd ~= "" and IsFirstTimePredicted() then -- 298
					self:EmitSound(snd) -- 298
				end -- 298
				local duration = self:SequenceDuration() -- 299
				self:SetNextFire(CurTime() + duration) -- 300
				self:SetNextIdle(CurTime() + duration) -- 301
				return self:SetNeedPump(false) -- 302
			end -- 294
		end, -- 304
		HandleBurst = function(self) -- 304
			if (self:GetBurstFired() > 0) and (CurTime() > self:GetNextFire() + engine.TickInterval()) then -- 305
				self:SetBurstFired(0) -- 306
				return self:SetNextFire(CurTime() + self:GetDelay()) -- 307
			end -- 305
		end, -- 309
		Think = function(self) -- 309
			self:HandleReload() -- 310
			self:HandleIdle() -- 311
			self:HandlePump() -- 312
			self:HandleBurst() -- 313
			return self:HandleViewModel() -- 314
		end, -- 316
		OnReloaded = function(self) -- 316
			if self:GetHoldType() ~= "" then -- 316
				return self:SetWeaponHoldType(self:GetHoldType()) -- 316
			end -- 316
		end, -- 318
		OnRemove = function(self) -- 318
			local ply = self:GetOwner() -- 319
			if IsValid(ply) and ply:IsPlayer() then -- 320
				return ply:SetFOV(0, 0, self) -- 320
			end -- 320
		end, -- 322
		SetupMove = function(self, ply, mv) -- 322
			local fraction = self:GetLowerFraction() -- 323
			if fraction == 1 then -- 324
				return -- 324
			end -- 324
			local min = 200 -- 325
			if ply:Crouching() then -- 326
				min = math.min(min, ply:GetWalkSpeed() * ply:GetCrouchedWalkSpeed()) -- 326
			end -- 326
			local speed = math.Remap(fraction, 0, 1, min, ply:GetRunSpeed()) -- 327
			mv:SetMaxSpeed(speed) -- 328
			return mv:SetMaxClientSpeed(speed) -- 329
		end, -- 331
		OnRestore = function(self) -- 331
			self:SetFirstReload(false) -- 332
			self:SetAbortReload(false) -- 333
			self:SetBurstFired(0) -- 334
			self:SetLowerTime(0) -- 335
			self:SetNextIdle(CurTime()) -- 336
			self:SetFinishReload(0) -- 337
			self:SetNextFire(CurTime()) -- 338
			return self:SetNextAltFire(CurTime()) -- 339
		end, -- 341
		TranslateWeaponAnim = function(self, act) -- 341
			return act -- 341
		end, -- 343
		SendTranslatedWeaponAnim = function(self, act) -- 343
			act = self:TranslateWeaponAnim(act) -- 344
			if not act then -- 345
				return -- 345
			end -- 345
			return self:SendWeaponAnim(act) -- 346
		end, -- 348
		TranslateActivity = function(self, act) -- 348
			local translated -- 349
			if self:GetLowered() and (act == ACT_MP_RELOAD_STAND or ACT == ACT_MP_RELOAD_CROUCH) and index[self.HoldType] then -- 350
				translated = index[self.HoldType] + 6 -- 351
			end -- 350
			local custom = self:GetLowered() and self.CustomLowerHoldType or self.CustomHoldType -- 352
			if custom[act] then -- 353
				return custom[act] -- 353
			end -- 353
			if not translated then -- 354
				translated = BaseClass.TranslateActivity(self, act) -- 354
			end -- 354
			return replacements[translated] and replacements[translated] or translated -- 355
		end, -- 359
		CanPrimaryFire = function(self) -- 359
			if self:HandleAutoRaise() or self:HandleReloadAbort() then -- 360
				return false -- 360
			end -- 360
			if self:IsEmpty() then -- 361
				if not self:IsReloading() then -- 362
					self:EmitEmptySound() -- 362
				end -- 362
				self:SetNextFire(CurTime() + 0.2) -- 363
				self:ForceStopFire() -- 364
				return false -- 365
			end -- 361
			return true -- 366
		end, -- 368
		PrimaryFire = function(self) -- 368
			self:UpdateAutomatic() -- 369
			self:ConsumeAmmo() -- 370
			self:FireWeapon() -- 371
			local delay = self:GetDelay() -- 372
			self:ApplyRecoil() -- 373
			local pump_action = self:ShouldPump() -- 374
			if pump_action then -- 375
				self:SetNeedPump(true) -- 375
			end -- 375
			self:SetNextIdle(CurTime() + self:SequenceDuration()) -- 376
			return self:SetNextFire(CurTime() + delay) -- 377
		end, -- 381
		TryAltFire = function(self) -- 381
			if (self:GetNextAltFire() > CurTime()) or (not self:CanAltFire()) then -- 382
				return -- 382
			end -- 382
			return self:AltFire() -- 383
		end, -- 385
		CanAltFire = function(self) -- 385
			return true -- 385
		end, -- 387
		AltFire = function(self) end, -- 389
		UpdateAutomatic = function(self) -- 389
			local firemode = self:GetFiremode() -- 390
			if firemode == 0 then -- 391
				self.Primary.Automatic = false -- 392
			else -- 394
				self.Primary.Automatic = true -- 394
			end -- 391
			if firemode > 0 then -- 396
				local count = self:GetBurstFired() -- 397
				if count + 1 >= firemode then -- 398
					self:ForceStopFire() -- 399
					return self:SetBurstFired(0) -- 400
				else -- 402
					return self:SetBurstFired(count + 1) -- 402
				end -- 398
			end -- 396
		end, -- 404
		FireWeapon = function(self) -- 404
			local ply = self:GetOwner() -- 405
			self:EmitFireSound() -- 406
			self:SendTranslatedWeaponAnim(ACT_VM_PRIMARYATTACK) -- 407
			ply:SetAnimation(PLAYER_ATTACK1) -- 408
			local damage = self:GetDamage() -- 409
			local bullet = { -- 411
				Num = self.Primary.Count, -- 411
				Src = ply:GetShootPos(), -- 412
				Dir = self:GetShootDir(), -- 413
				Spread = self:GetSpread(), -- 414
				TracerName = self.Primary.TracerName, -- 415
				Tracer = self.Primary.TracerName == "" and 0 or self.Primary.TracerFrequency, -- 416
				Force = damage * 0.25, -- 417
				Damage = damage, -- 418
				Callback = function(attacker, tr, dmginfo) -- 419
					return dmginfo:ScaleDamage(self:GetDamageFalloff(tr.StartPos:Distance(tr.HitPos))) -- 420
				end -- 419
			} -- 410
			self:ModifyBulletTable(bullet) -- 422
			return ply:FireBullets(bullet) -- 423
		end, -- 425
		ModifyBulletTable = function(self, bullet) end, -- 427
		ShouldPump = function(self) -- 427
			return self.Primary.PumpAction -- 427
		end, -- 429
		GetDelay = function(self) -- 429
			local firemode = self:GetFiremode() -- 430
			if firemode > 0 then -- 432
				if (self:GetBurstFired() == 0) and (self.Primary.BurstEndDelay ~= 0) then -- 433
					return self.Primary.BurstEndDelay -- 434
				elseif self.Primary.BurstDelay ~= 0 then -- 435
					return self.Primary.BurstDelay -- 436
				end -- 433
			end -- 432
			local delay = self.Primary.Delay -- 438
			if delay == -1 then -- 439
				delay = self:SequenceDuration() -- 439
			end -- 439
			return delay -- 440
		end, -- 442
		GetDamage = function(self) -- 442
			return self.Primary.Damage -- 442
		end, -- 444
		GetDamageFalloff = function(self, distance) -- 444
			local falloff = 1 -- 445
			local min_damage = 0.2 -- 446
			local dist_mod = 1000 * falloff -- 447
			return math.max(self.Primary.RangeModifier ^ (distance / dist_mod), min_damage) -- 448
		end, -- 450
		GetRange = function(self) -- 450
			return self.Primary.Range, self.Primary.Accuracy -- 450
		end, -- 452
		GetSpread = function(self, range, accuracy) -- 452
			local range2, accuracy2 = self:GetRange() -- 453
			range = range or range2 -- 454
			accuracy = accuracy or accuracy2 -- 455
			local inches = accuracy / .75 -- 457
			local yards = (range / .75) / 36 -- 458
			local moa = (inches * 100) / yards -- 459
			local spread = math.rad(moa / 60) -- 461
			return Vector(spread, spread, 0) -- 462
		end, -- 464
		GetRecoilMultiplier = function(self) -- 464
			return math.tan(self:GetFOV() * (math.pi / 360)) * self:GetZoom() -- 464
		end, -- 466
		GetReloadTime = function(self) -- 466
			return self.Primary.Reload.Time > 0 and self.Primary.Reload.Time or self:SequenceDuration() -- 466
		end, -- 468
		GetZoom = function(self) -- 468
			if self:GetLowered() then -- 469
				return 1 -- 469
			end -- 469
			return 1.25 -- 470
		end, -- 472
		IsReady = function(self) -- 472
			return CurTime() - self:GetLowerTime() >= 0.4 -- 472
		end, -- 474
		GetLowerFraction = function(self) -- 474
			local frac = math.Clamp(math.Remap(CurTime() - self:GetLowerTime(), 0, 0.4, 0, 1), 0, 1) -- 475
			if self:GetLowered() then -- 476
				return ease_out(frac) -- 476
			end -- 476
			return ease_in(1 - frac) -- 477
		end, -- 479
		HasCameraControl = function(self) -- 479
			local ply = self:GetOwner() -- 480
			if CLIENT and not ply:ShouldDrawLocalPlayer() then -- 481
				return true -- 481
			end -- 481
			return ply:GetViewEntity() == ply -- 482
		end, -- 484
		GetOwnerDefaultFOV = function(self) -- 484
			return self:GetOwner():GetInfoNum("fov_desired", 75) -- 484
		end, -- 486
		GetTargetFOV = function(self) -- 486
			local zoom = self:GetZoom() -- 487
			if zoom == 1 then -- 488
				return 0 -- 488
			end -- 488
			return self:GetOwnerDefaultFOV() / self:GetZoom() -- 489
		end, -- 491
		UpdateFOV = function(self, time) -- 491
			return self:GetOwner():SetFOV(self:GetTargetFOV(), time, self) -- 491
		end, -- 493
		GetFOV = function(self) -- 493
			return self:GetOwner():GetFOV() -- 493
		end, -- 495
		GetViewModel = function(self, index) -- 495
			return self:GetOwner():GetViewModel() -- 495
		end, -- 497
		IsEmpty = function(self) -- 497
			do -- 498
				local _exp_0 = self.AmmoType -- 498
				if AMMO_NORMAL == _exp_0 then -- 499
					return self:Clip1() < self.Primary.Cost -- 500
				elseif AMMO_NOMAG == _exp_0 then -- 501
					return self:GetOwner():GetAmmoCount(self.Primary.Ammo) < self.Primary.Cost -- 502
				elseif AMMO_INTERNAL == _exp_0 then -- 503
					return self:Clip1() < self.Primary.Cost -- 504
				end -- 504
			end -- 504
			return false -- 505
		end, -- 507
		GetShootDir = function(self) -- 507
			local ply = self:GetOwner() -- 508
			if ply:IsNPC() then -- 509
				return ply:GetAimVector() -- 509
			end -- 509
			return (ply:GetAimVector():Angle() + ply:GetViewPunchAngles()):Forward() -- 510
		end, -- 512
		HandleAutoRaise = function(self) -- 512
			if (self:GetLowered() or not self:IsReady()) and not self:IsReloading() then -- 513
				return true -- 515
			end -- 513
			return false -- 516
		end, -- 518
		IsAltFireHeld = function(self) -- 518
			local ply = self:GetOwner() -- 519
			if not IsValid(ply) or ply:IsNPC() then -- 520
				return false -- 520
			end -- 520
			return ply:KeyDown(IN_USE) and ply:KeyDown(IN_ATTACK) -- 521
		end, -- 523
		ForceStopFire = function(self) -- 523
			local ply = self:GetOwner() -- 524
			if not IsValid(ply) or not ply:IsPlayer() then -- 525
				return -- 525
			end -- 525
			return ply:ConCommand("-attack") -- 526
		end, -- 528
		DoAR2Impact = function(self, tr) -- 528
			if tr.HitSky then -- 529
				return -- 529
			end -- 529
			if not game.SinglePlayer() and not IsFirstTimePredicted() then -- 530
				return -- 530
			end -- 530
			local effect = EffectData() -- 531
			effect:SetOrigin(tr.HitPos + tr.HitNormal) -- 532
			effect:SetNormal(tr.HitNormal) -- 533
			return util.Effect("AR2Impact", effect) -- 534
		end, -- 536
		ApplyRecoil = function(self, recoil) -- 536
			local ply = self:GetOwner() -- 537
			if not ply:IsPlayer() then -- 538
				return -- 538
			end -- 538
			recoil = recoil or self.Primary.Recoil -- 539
			local seed = ply:GetCurrentCommand():CommandNumber() -- 540
			local mult = self:GetRecoilMultiplier() -- 541
			local pitch = -util.SharedRandom(tostring(self:EntIndex()) .. tostring(seed) .. "1", recoil.MinAng.p, recoil.MaxAng.p) * mult -- 542
			local yaw = -util.SharedRandom(tostring(self:EntIndex()) .. tostring(seed) .. "2", recoil.MinAng.y, recoil.MaxAng.y) * mult -- 543
			if game.SinglePlayer() or (CLIENT and IsFirstTimePredicted()) then -- 544
				ply:SetEyeAngles(ply:EyeAngles() + Angle(pitch, yaw, 0) * recoil.Punch) -- 545
			end -- 544
			return ply:ViewPunch(Angle(pitch, yaw, 0)) -- 546
		end, -- 548
		ApplyStaticRecoil = function(self, ang, recoil) -- 548
			local ply = self:GetOwner() -- 549
			if not ply:IsPlayer() then -- 550
				return -- 550
			end -- 550
			recoil = recoil or self.Primary.Recoil -- 551
			local seed = ply:GetCurrentCommand():CommandNumber() -- 552
			local mult = self:GetRecoilMultiplier() -- 553
			local pitch = ang.p * mult -- 554
			local yaw = ang.y * mult -- 555
			if game.SinglePlayer() or (CLIENT and IsFirstTimePredicted()) then -- 556
				ply:SetEyeAngles(ply:EyeAngles() + Angle(pitch, yaw, 0) * recoil.Punch) -- 557
			end -- 556
			return ply:ViewPunch(Angle(pitch, yaw, 0)) -- 558
		end, -- 560
		HandleReloadAbort = function(self) -- 560
			if self:IsReloading() then -- 561
				if self.Primary.Reload.Shotgun then -- 562
					self:SetAbortReload(true) -- 562
				end -- 562
				return true -- 563
			end -- 561
			return false -- 564
		end, -- 566
		IsReloading = function(self) -- 566
			return self:GetFinishReload() ~= 0 -- 566
		end, -- 568
		CanReload = function(self) -- 568
			if self.AmmoType ~= AMMO_NORMAL then -- 569
				return false -- 569
			end -- 569
			if self:GetNextFire() > CurTime() then -- 570
				return false -- 570
			end -- 570
			if self:IsReloading() or (self:Clip1() >= self.Primary.ClipSize) then -- 571
				return false -- 571
			end -- 571
			if self:GetOwner():GetAmmoCount(self.Primary.Ammo) <= 0 then -- 572
				return false -- 572
			end -- 572
			return true -- 573
		end, -- 575
		Reload = function(self) -- 575
			if not self:CanReload() then -- 576
				return -- 576
			end -- 576
			return self:StartReload() -- 577
		end, -- 579
		StartReload = function(self) -- 579
			local reload = self.Primary.Reload -- 580
			self:GetOwner():SetAnimation(PLAYER_RELOAD) -- 581
			if reload.Shotgun then -- 582
				self:SendTranslatedWeaponAnim(ACT_SHOTGUN_RELOAD_START) -- 583
				self:SetFirstReload(true) -- 584
			else -- 586
				self:SendTranslatedWeaponAnim(ACT_VM_RELOAD) -- 586
				self:EmitReloadSound() -- 587
			end -- 582
			local duration = self:GetReloadTime() -- 588
			local f = CurTime() + duration -- 589
			self:SetFinishReload(f) -- 590
			return self:SetNextIdle(f) -- 591
		end, -- 593
		HandleReload = function(self) -- 593
			local reload = self:GetFinishReload() -- 594
			if reload > 0 and reload <= CurTime() then -- 595
				return self:FinishReload() -- 595
			end -- 595
		end, -- 597
		FinishReload = function(self) -- 597
			local primary = self.Primary -- 598
			local reload = primary.Reload -- 599
			local ply = self:GetOwner() -- 600
			local amount = math.min(primary.ClipSize - self:Clip1(), reload.Amount) -- 601
			local first = self:GetFirstReload() -- 602
			if not first then -- 603
				local acount = ply:GetAmmoCount(primary.Ammo) -- 604
				self:SetAbortReload(true) -- 605
				amount = math.min(amount, acount) -- 606
				ply:RemoveAmmo(amount, primary.Ammo) -- 607
			end -- 603
			if reload.Shotgun then -- 608
				if not first then -- 609
					self:SetClip1(self:Clip1() + amount) -- 609
				end -- 609
				local pump = self:Clip1() == amount -- 610
				if self:Clip1() >= primary.ClipSize or amount <= 0 or self:GetAbortReload() then -- 611
					if pump and (not reload.DontFinishPump) then -- 612
						self:SendTranslatedWeaponAnim(primary.Reload.Act or ACT_SHOTGUN_RELOAD_FINISH) -- 613
						local duration = self:SequenceDuration() -- 614
						local d = CurTime() + duration -- 615
						self:SetNextFire(d) -- 616
						self:SetNextIdle(d) -- 617
					end -- 612
					self:SetAbortReload(false) -- 618
					self:SetFinishReload(0) -- 619
				else -- 621
					self:SendTranslatedWeaponAnim(ACT_VM_RELOAD) -- 621
					if self.GetFirstReload then -- 622
						self:SetFirstReload(false) -- 622
					end -- 622
					if (reload.Sound ~= "") and IsFirstTimePredicted() then -- 623
						self:EmitSound(reload.Sound) -- 623
					end -- 623
					local duration = self:SequenceDuration() -- 624
					local d = CurTime() + duration -- 625
					self:SetNextFire(d) -- 626
					self:SetNextIdle(d) -- 627
					self:SetFinishReload(CurTime() + duration) -- 628
				end -- 611
			else -- 630
				self:SetClip1(self:Clip1() + amount) -- 630
				self:SetFinishReload(0) -- 631
			end -- 608
			self.Primary.Automatic = true -- 632
		end, -- 634
		EmitEmptySound = function(self) -- 634
			return self:EmitSound(")weapons/pistol/pistol_empty.wav", 75, 100, 0.7, CHAN_STATIC) -- 634
		end, -- 636
		EmitFireSound = function(self) -- 636
			self:EmitSound(self.Primary.Sound) -- 637
			local pump = self.Primary.Pump -- 638
			if pump then -- 638
				return timer.Simple(pump.Delay or 0.4, function() -- 639
					if IsValid(self) then -- 640
						return self:EmitSound(pump.Sound) -- 641
					end -- 640
				end) -- 642
			end -- 638
		end, -- 643
		EmitReloadSound = function(self) -- 643
			local reload = self.Primary.Reload -- 644
			if reload.Sound ~= "" then -- 645
				return self:EmitSound(reload.Sound) -- 645
			end -- 645
		end, -- 647
		TranslateFOV = function(self, fov) -- 647
			if not IsValid(self:GetOwner()) then -- 648
				return fov -- 648
			end -- 648
			local desired = self:GetOwnerDefaultFOV() -- 649
			self.ViewModelFOV = self.ViewModelTargetFOV + (desired - fov) * 0.6 -- 650
			return fov -- 651
		end, -- 653
		HandleViewModel = function(self) -- 653
			if CLIENT then -- 654
				self.SwayScale = 1 -- 655
				self.BobScale = 1 -- 656
			end -- 654
		end, -- 658
		CalcView = function(self, ply, pos, ang, fov) -- 658
			if not self:HasCameraControl() then -- 659
				return -- 659
			end -- 659
			return pos, ang - ply:GetViewPunchAngles() * self.Primary.Recoil.Ratio, fov -- 660
		end, -- 662
		GetBobScale = function(self) -- 662
			return 1 -- 662
		end, -- 664
		GetSwayScale = function(self) -- 664
			return 2 -- 664
		end, -- 666
		AddViewmodelBob = function(self, pos, ang) -- 666
			local ply = self:GetOwner() -- 667
			local max_speed = ply:IsOnGround() and 160 or 500 -- 668
			local scale = self:GetBobScale() -- 669
			local speed = math.min(ply:GetVelocity():Length2D(), ply:GetRunSpeed()) -- 671
			local offset = math.Remap(speed, 0, max_speed, 0, 1) -- 672
			local ct = CurTime() -- 673
			bob_time = bob_time + ((ct - last_bob_time) * offset) -- 675
			last_bob_time = ct -- 676
			local cycle = bob_time - math.floor((bob_time / HL2_BOB_VERTICAL) * HL2_BOB_VERTICAL) -- 678
			cycle = cycle / HL2_BOB_VERTICAL -- 679
			if cycle < HL2_BOB then -- 681
				cycle = math.pi * (cycle / HL2_BOB) -- 682
			else -- 684
				cycle = math.pi + math.pi * (cycle - HL2_BOB) / (1 - HL2_BOB) -- 684
			end -- 681
			local vertical = speed * .005 * scale -- 686
			vertical = math.Clamp(vertical * .3 + vertical * .7 * math.sin(cycle), -7, 4) -- 687
			cycle = bob_time - math.floor((bob_time / HL2_BOB_LATERAL) * HL2_BOB_LATERAL) -- 689
			cycle = cycle / HL2_BOB_LATERAL -- 690
			if cycle < HL2_BOB then -- 692
				cycle = math.pi * (cycle / HL2_BOB) -- 693
			else -- 695
				cycle = math.pi + math.pi * (cycle - HL2_BOB) / (1 - HL2_BOB) -- 695
			end -- 692
			local lateral = speed * .005 * scale -- 697
			lateral = math.Clamp(lateral * .3 + lateral * .7 * math.sin(cycle), -7, 4) -- 698
			pos:Add(ang:Forward() * vertical * .1) -- 701
			pos:Add(ang:Right() * lateral * .8) -- 702
			pos:AddZ(vertical * .1 * scale) -- 703
			ang:SubPitch(vertical * .4) -- 705
			ang:SubYaw(lateral * .3) -- 706
			ang:AddRoll(vertical * .5) -- 707
			return ang -- 704
		end, -- 709
		GetViewModelPosition = function(self, pos, ang) -- 709
			local fraction = self:GetLowerFraction() -- 710
			local offset = self.ViewOffset -- 711
			pos, ang = LocalToWorld(offset, Angle(fraction * 15, 0, 0), pos, ang) -- 712
			local ply = self:GetOwner() -- 713
			if IsValid(ply) then -- 714
				local const = math.pi / 360 -- 715
				local fov, vmfov = ply:GetFOV(), self.ViewModelFOV -- 716
				local ratio = math.tan(math.min(fov, vmfov) * const) / math.tan(math.max(fov, vmfov) * const) -- 717
				ang = ang + ply:GetViewPunchAngles() * ratio * self.Primary.Recoil.Ratio -- 718
			end -- 714
			self:AddViewmodelBob(pos, ang) -- 719
			return pos, ang -- 720
		end, -- 722
		AdjustMouseSensitivity = function(self) -- 722
			if not self:HasCameraControl() then -- 723
				return 1 -- 723
			end -- 723
			local desired = self:GetOwnerDefaultFOV() -- 724
			local fov = self:GetFOV() -- 725
			return fov / desired -- 726
		end, -- 728
		DrawWorldModelTranslucent = function(self, flags) -- 728
			return self:DrawWorldModel(flags) -- 728
		end -- 96
	} -- 96
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 728
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 96
			_base_0[_key_0] = _val_0 -- 96
		end -- 96
	end -- 728
	if _base_0.__index == nil then -- 96
		_base_0.__index = _base_0 -- 96
	end -- 728
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
end -- 728
local _anon_func_0 = function(self) -- 1028
	local _obj_0 = self.ViewOffset -- 1028
	if _obj_0 ~= nil then -- 1028
		return _obj_0.Pos -- 1028
	end -- 1028
	return nil -- 1028
end -- 1028
do -- 730
	local _class_0 -- 730
	local _parent_0 = WEAPON -- 730
	local _base_0 = { -- 730
		Base = "weapon_base", -- 733
		Category = "EvilRP", -- 735
		m_WeaponDeploySpeed = 1, -- 737
		DrawWeaponInfoBox = false, -- 739
		ViewModelFOV = 54, -- 741
		HoldType = "melee", -- 742
		LowerHoldType = "normal", -- 744
		Primary = { -- 745
			Ammo = "", -- 745
			ClipSize = -1, -- 746
			DefaultClip = 0, -- 747
			Automatic = false, -- 748
			ChargeTime = 1, -- 750
			AutoSwing = true, -- 751
			Light = { -- 754
				Damage = 1, -- 754
				DamageType = DMG_CLUB, -- 755
				Range = 75, -- 757
				Delay = 0.1, -- 758
				Act = ACT_VM_HITCENTER, -- 760
				Sound = "" -- 762
			}, -- 753
			Heavy = { -- 765
				Damage = 1, -- 765
				DamageType = DMG_CLUB, -- 766
				Range = 75, -- 768
				Delay = 0.1, -- 769
				Act = ACT_VM_HITCENTER, -- 771
				Sound = "" -- 773
			} -- 764
		}, -- 775
		Secondary = { -- 776
			Ammo = "", -- 776
			ClipSize = -1, -- 777
			DefaultClip = 0, -- 778
			Automatic = false -- 779
		}, -- 781
		ChargeOffset = { -- 782
			Pos = Vector(), -- 782
			Ang = Angle() -- 783
		}, -- 785
		SetupDataTables = function(self) -- 785
			self:NetworkVar("Bool", "Lowered") -- 786
			self:NetworkVar("Float", "LowerTime") -- 787
			self:NetworkVar("Float", "NextIdle") -- 788
			self:NetworkVar("Float", "ChargeTime") -- 789
			return self:NetworkVar("Float", "NextAltFire") -- 790
		end, -- 792
		Deploy = function(self) -- 792
			self:SetLowerTime(0) -- 793
			self:SetLowered(self:CanLower()) -- 794
			self:SetHoldType(self.LowerHoldType) -- 795
			self:SendTranslatedWeaponAnim(ACT_VM_DRAW) -- 796
			self:SetNextIdle(CurTime() + self:SequenceDuration()) -- 797
			return true -- 798
		end, -- 800
		Holster = function(self) -- 800
			self:SetChargeTime(0) -- 801
			return true -- 802
		end, -- 804
		IsReady = function(self) -- 804
			return CurTime() - self:GetLowerTime() >= 0.4 -- 804
		end, -- 805
		CanLower = function(self) -- 805
			return self:IsReady() and self:GetChargeTime() == 0 -- 805
		end, -- 806
		SetLower = function(self, lower) -- 806
			if self:GetLowered() ~= lower then -- 807
				self:SetLowered(lower) -- 808
				self:SetLowerTime(CurTime()) -- 809
				self:SetHoldType(lower and self.LowerHoldType or self.HoldType) -- 810
				local vm = self.Owner:GetViewModel() -- 811
				if lower then -- 812
					if self.HolsterAnim then -- 813
						vm:SendViewModelMatchingSequence(vm:LookupSequence(self.HolsterAnim)) -- 814
					end -- 813
				else -- 816
					if self.DrawAnim then -- 816
						vm:SendViewModelMatchingSequence(vm:LookupSequence(self.DrawAnim)) -- 817
					end -- 816
				end -- 812
			end -- 807
			self.Primary.Automatic = true -- 818
			return true -- 819
		end, -- 821
		PrimaryAttack = function(self) -- 821
			if self:GetLowered() then -- 822
				return -- 822
			end -- 822
			local ply = self:GetOwner() -- 823
			if self.Primary.ChargeTime == 0 then -- 824
				self.Primary.Automatic = self.Primary.AutoSwing -- 825
				self:LightAttack() -- 826
				return -- 827
			end -- 824
			if self:GetChargeTime() ~= 0 then -- 828
				return -- 828
			end -- 828
			self:SetChargeTime(CurTime()) -- 829
			self.Primary.Automatic = false -- 830
		end, -- 832
		SecondaryAttack = function(self) -- 832
			return self:TryAltFire() -- 832
		end, -- 836
		TryAltFire = function(self) -- 836
			if (self:GetNextAltFire() > CurTime()) or (not self:CanAltFire()) then -- 837
				return -- 837
			end -- 837
			return self:AltFire() -- 838
		end, -- 840
		CanAltFire = function(self) -- 840
			return true -- 840
		end, -- 842
		AltFire = function(self) end, -- 844
		HandleIdle = function(self) -- 844
			local idle = self:GetNextIdle() -- 845
			if idle > 0 and idle <= CurTime() then -- 846
				self:SendTranslatedWeaponAnim(ACT_VM_IDLE) -- 847
				return self:SetNextIdle(0) -- 848
			end -- 846
		end, -- 850
		Think = function(self) -- 850
			self:HandleIdle() -- 851
			if not self:GetLowered() then -- 852
				return self:HandleCharge() -- 853
			end -- 852
		end, -- 855
		OnReloaded = function(self) -- 855
			return self:SetWeaponHoldType(self:GetHoldType()) -- 855
		end, -- 857
		GetLowerFraction = function(self) -- 857
			local frac = math.Clamp(math.Remap(CurTime() - self:GetLowerTime(), 0, 0.4, 0, 1), 0, 1) -- 858
			if self:GetLowered() then -- 859
				return ease_out(frac) -- 860
			else -- 862
				return ease_in(1 - frac) -- 862
			end -- 859
		end, -- 864
		SetupMove = function(self, ply, mv) -- 864
			local fraction = self:GetLowerFraction() -- 865
			if fraction == 1 then -- 866
				return -- 866
			end -- 866
			local speed = math.Remap(fraction, 0, 1, ply:GetWalkSpeed(), ply:GetRunSpeed()) -- 867
			if mv:GetForwardSpeed() <= 0 then -- 868
				return mv:SetMaxClientSpeed(speed) -- 868
			end -- 868
		end, -- 870
		OnRestore = function(self) -- 870
			self:SetLowerTime(0) -- 871
			self:SetNextIdle(CurTime()) -- 872
			return self:SetNextAltFire(CurTime()) -- 873
		end, -- 875
		TranslateWeaponAnim = function(self, act) -- 875
			return act -- 875
		end, -- 876
		SendTranslatedWeaponAnim = function(self, act) -- 876
			act = self:TranslateWeaponAnim(act) -- 877
			if not act then -- 878
				return -- 878
			end -- 878
			return self:SendWeaponAnim(act) -- 879
		end, -- 881
		GetDelay = function(self, heavy, hit, trace) -- 881
			local tab = heavy and self.Primary.Heavy or self.Primary.Light -- 882
			if istable(tab.Delay) then -- 883
				return hit and tab.Delay[1] or tab.Delay[2] -- 883
			end -- 883
			return tab.Delay -- 884
		end, -- 886
		GetAttackAct = function(self, heavy, hit, trace) -- 886
			local tab = heavy and self.Primary.Heavy or self.Primary.Light -- 887
			if istable(tab.Act) then -- 888
				return hit and tab.Act[1] or tab.Act[2] -- 888
			end -- 888
			return tab.Act -- 889
		end, -- 891
		PlayAttackSound = function(self, heavy, hit, trace) -- 891
			local tab = heavy and self.Primary.Heavy or self.Primary.Light -- 892
			local snd = tab.Sound -- 893
			if istable(snd) then -- 894
				if snd[3] and trace.HitWorld then -- 895
					snd = snd[3] -- 896
				else -- 898
					snd = hit and snd[1] or snd[2] -- 898
				end -- 895
			end -- 894
			if snd ~= "" then -- 899
				return self:EmitSound(snd) -- 899
			end -- 899
		end, -- 901
		GetDamage = function(self, heavy, trace) -- 901
			local tab = heavy and self.Primary.Heavy or self.Primary.Light -- 902
			return tab.Damage, tab.DamageType -- 903
		end, -- 905
		HandleCharge = function(self) -- 905
			if game.SinglePlayer() and CLIENT then -- 906
				return -- 906
			end -- 906
			if self:GetLowered() then -- 907
				return -- 907
			end -- 907
			local charge = self:GetChargeTime() -- 908
			if charge > 0 and not self:GetOwner():KeyDown(IN_ATTACK) then -- 909
				local primary = self.Primary -- 910
				local time = CurTime() - charge -- 911
				if time < engine.TickInterval() then -- 912
					return -- 912
				end -- 912
				if primary.ChargeTime > 0 and time > primary.ChargeTime then -- 913
					self:HeavyAttack() -- 914
				else -- 916
					self:LightAttack() -- 916
				end -- 913
				self:SetChargeTime(0) -- 917
				self.Primary.Automatic = self.Primary.AutoSwing -- 918
			end -- 909
		end, -- 920
		RefineHullTrace = function(self, trace, result) -- 920
			local distance = math.huge -- 921
			local endpos = result.StartPos + (result.HitPos - result.StartPos) * 2 -- 922
			trace.start = result.StartPos -- 924
			trace.endpos = endpos -- 925
			local tr = result -- 927
			local temp = util.TraceLine(trace) -- 928
			if temp.Hit then -- 929
				return temp -- 929
			end -- 929
			for i = -1, 1, 2 do -- 931
				for j = -1, 1, 2 do -- 932
					for k = -1, 1, 2 do -- 933
						local vec = Vector(endpos.x + (16 * i), endpos.y + (16 * j), endpos.z + (16 * k)) -- 934
						trace.endpos = vec -- 935
						temp = util.TraceLine(trace) -- 936
						if temp.Hit then -- 937
							local dist = (tr.HitPos - tr.StartPos):Length() -- 938
							if dist < distance then -- 939
								tr = temp -- 940
								distance = dist -- 941
							end -- 939
						end -- 937
					end -- 941
				end -- 941
			end -- 941
			return tr -- 942
		end, -- 945
		GetAttackTrace = function(self, range) -- 945
			local ply = self:GetOwner() -- 946
			local start = ply:GetShootPos() -- 947
			local forward = ply:GetAimVector() -- 948
			local endpos = start + forward * range -- 949
			local trace = { -- 951
				start = start, -- 951
				endpos = endpos, -- 952
				mins = Vector(-16, -16, -16), -- 953
				maxs = Vector(16, 16, 16), -- 954
				mask = MASK_SHOT_HULL, -- 955
				filter = ply, -- 956
				collisiongroup = COLLISION_GROUP_NONE -- 957
			} -- 950
			local tr = util.TraceLine(trace) -- 959
			if tr.Hit then -- 960
				return true, tr -- 960
			end -- 960
			trace.endpos = trace.endpos - (forward * 1.732 * 16) -- 961
			tr = util.TraceHull(trace) -- 962
			if tr.Hit and IsValid(tr.Entity) then -- 963
				local vec = (tr.Entity:GetPos() - start):GetNormalized() -- 964
				if vec:Dot(forward) < math.rad(0.70721) then -- 965
					return false, tr -- 965
				end -- 965
				return true, self:RefineHullTrace(table.Copy(trace), tr) -- 966
			end -- 963
			return false, tr -- 967
		end, -- 969
		LightAttack = function(self) -- 969
			return self:GenericAttack(false) -- 969
		end, -- 970
		HeavyAttack = function(self) -- 970
			return self:GenericAttack(true) -- 970
		end, -- 971
		GenericAttack = function(self, heavy) -- 971
			local tab = heavy and self.Primary.Heavy or self.Primary.Light -- 972
			local ply = self:GetOwner() -- 973
			ply:LagCompensation(true) -- 974
			local hit, trace = self:GetAttackTrace(tab.Range) -- 975
			ply:LagCompensation(false) -- 976
			ply:SetAnimation(PLAYER_ATTACK1) -- 977
			if hit and SERVER then -- 978
				local dmg = DamageInfo() -- 979
				local damage, damage_type = self:GetDamage(heavy, trace) -- 980
				dmg:SetDamage(damage) -- 982
				dmg:SetDamageType(damage_type) -- 983
				dmg:SetInflictor(self) -- 984
				dmg:SetAttacker(self:GetOwner()) -- 985
				dmg:SetDamagePosition(trace.HitPos) -- 986
				dmg:SetDamageForce(trace.Normal * (tab.Damage * 300)) -- 987
				if bit.band(util.PointContents(trace.HitPos), CONTENTS_WATER) == 0 then -- 988
					local ed = EffectData() -- 989
					ed:SetEntity(trace.Entity) -- 991
					ed:SetOrigin(trace.HitPos) -- 992
					ed:SetStart(trace.StartPos) -- 993
					ed:SetSurfaceProp(trace.SurfaceProps) -- 994
					ed:SetDamageType(damage_type) -- 995
					ed:SetHitBox(trace.HitBox) -- 996
					util.Effect("Impact", ed, false, true) -- 997
				end -- 988
				if IsValid(trace.Entity) then -- 998
					trace.Entity:DispatchTraceAttack(dmg, trace) -- 998
				end -- 998
			end -- 978
			self:WaterImpact(trace.StartPos, trace.HitPos) -- 999
			self:SendTranslatedWeaponAnim(self:GetAttackAct(heavy, hit)) -- 1000
			self:SetNextIdle(CurTime() + self:SequenceDuration()) -- 1001
			self:PlayAttackSound(heavy, hit, trace) -- 1002
			local delay = self:GetDelay(heavy, hit) -- 1003
			if delay == -1 then -- 1004
				delay = self:SequenceDuration() -- 1004
			end -- 1004
			self:SetNextPrimaryFire(CurTime() + delay) -- 1005
			return hit, trace -- 1006
		end, -- 1007
		WaterImpact = function(self, start, endpos) -- 1007
			local flags = bit.bor(CONTENTS_WATER, CONTENTS_SLIME) -- 1008
			if bit.band(util.PointContents(start), flags) ~= 0 then -- 1009
				return -- 1009
			end -- 1009
			if bit.band(util.PointContents(endpos), flags) == 0 then -- 1010
				return -- 1010
			end -- 1010
			local tr = util.TraceLine({ -- 1012
				start = start, -- 1012
				endpos = endpos, -- 1013
				mask = flags, -- 1014
				filter = self:GetOwner(), -- 1015
				collisiongroup = COLLISION_GROUP_NONE -- 1016
			}) -- 1011
			if tr.Hit then -- 1018
				local ed = EffectData() -- 1019
				ed:SetFlags(bit.band(tr.Contents, CONTENTS_SLIME) == 0 and 0 or 1) -- 1021
				ed:SetOrigin(tr.HitPos) -- 1022
				ed:SetNormal(tr.HitNormal) -- 1023
				ed:SetScale(8) -- 1024
				return util.Effect("watersplash", ed, false, true) -- 1025
			end -- 1018
		end, -- 1026
		GetViewModelPosition = function(self, pos, ang) -- 1026
			local fraction = self:GetLowerFraction() -- 1027
			local offset = _anon_func_0(self) or Vector() -- 1028
			pos, ang = LocalToWorld(offset, Angle(fraction * 15, 0, 0), pos, ang) -- 1029
			local charge = self:GetChargeTime() -- 1030
			if self.Primary.ChargeTime > 0 and charge ~= 0 then -- 1031
				local frac = ease(math.Clamp(math.Remap(CurTime() - charge, 0, self.Primary.ChargeTime * 2, 0, 1), 0, 1)) -- 1032
				local charge_pos = LerpVector(frac, vector_origin, self.ChargeOffset.Pos) -- 1033
				local charge_ang = LerpAngle(frac, angle_zero, self.ChargeOffset.Ang) -- 1034
				pos, ang = LocalToWorld(charge_pos, charge_ang, pos, ang) -- 1035
			end -- 1031
			return pos, ang -- 1036
		end -- 730
	} -- 730
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 1037
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 730
			_base_0[_key_0] = _val_0 -- 730
		end -- 730
	end -- 1037
	if _base_0.__index == nil then -- 730
		_base_0.__index = _base_0 -- 730
	end -- 1037
	setmetatable(_base_0, _parent_0.__base) -- 730
	_class_0 = setmetatable({ -- 730
		__init = function(self, ...) -- 730
			return _class_0.__parent.__init(self, ...) -- 730
		end, -- 730
		__base = _base_0, -- 730
		__name = "EvilRP_Melee", -- 730
		__parent = _parent_0 -- 730
	}, { -- 730
		__index = function(cls, name) -- 730
			local val = rawget(_base_0, name) -- 730
			if val == nil then -- 730
				local parent = rawget(cls, "__parent") -- 730
				if parent then -- 730
					return parent[name] -- 730
				end -- 730
			else -- 730
				return val -- 730
			end -- 730
		end, -- 730
		__call = function(cls, ...) -- 730
			local _self_0 = setmetatable({ }, _base_0) -- 730
			cls.__init(_self_0, ...) -- 730
			return _self_0 -- 730
		end -- 730
	}) -- 730
	_base_0.__class = _class_0 -- 730
	local self = _class_0; -- 730
	self.__weapon = "evilrp_melee" -- 731
	if _parent_0.__inherited then -- 730
		_parent_0.__inherited(_parent_0, _class_0) -- 730
	end -- 730
	EvilRP_Melee = _class_0 -- 730
end -- 1037
hook.Add("SetupMove", "evilrp_weapon_movement", function(ply, mv) -- 1038
	local weapon = ply:GetActiveWeapon() -- 1039
	if not IsValid(weapon) then -- 1040
		return -- 1040
	end -- 1040
	if not string.find(weapon:GetClass(), "evilrp_") then -- 1041
		return -- 1041
	end -- 1041
	if not weapon.SetupMove then -- 1042
		return -- 1042
	end -- 1042
	weapon:SetupMove(ply, mv) -- 1043
	return -- 1044
end) -- 1038
if CLIENT then -- 1046
	return hook.Add("PostDrawTranslucentRenderables", "evilrp_weapon_render", function(depth, skybox, skybox3d) -- 1047
		if skybox then -- 1048
			return -- 1048
		end -- 1048
		if skybox3d then -- 1049
			return -- 1049
		end -- 1049
		local _list_0 = player.GetAll() -- 1050
		for _index_0 = 1, #_list_0 do -- 1050
			local ply = _list_0[_index_0] -- 1050
			local _continue_0 = false -- 1051
			repeat -- 1051
				if (not IsValid(ply) or ply:IsDormant() or ply:InVehicle()) then -- 1051
					_continue_0 = true -- 1051
					break -- 1051
				end -- 1051
				local weapon = ply:GetActiveWeapon() -- 1052
				if (not IsValid(weapon) or weapon:IsDormant() or not string.find(weapon:GetClass(), "evilrp_")) then -- 1053
					_continue_0 = true -- 1053
					break -- 1053
				end -- 1053
				if not weapon.PostDrawTranslucentRenderables then -- 1054
					_continue_0 = true -- 1054
					break -- 1054
				end -- 1054
				weapon:PostDrawTranslucentRenderables() -- 1055
				_continue_0 = true -- 1051
			until true -- 1055
			if not _continue_0 then -- 1055
				break -- 1055
			end -- 1055
		end -- 1055
		return -- 1056
	end) -- 1056
end -- 1046
