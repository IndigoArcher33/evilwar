-- [yue]: darkrp_modules\autodealer\sh_autodealer.yue
local pos = Vector(13.5, -9, 19) -- 1
local ang = Angle(0, 90, 90) -- 2
local noise = Material("effects/tvscreen_noise001a") -- 3
local page = 0 -- 4
if CLIENT then -- 6
	net.Receive("evilrp_receive_stocks", function() -- 7
		local stocks = net.ReadTable() -- 8
		GAMEMODE.Stocks = stocks -- 9
	end) -- 7
elseif SERVER then -- 10
	util.AddNetworkString("evilrp_receive_stocks") -- 11
	util.AddNetworkString("evilrp_purchase_stock") -- 12
	util.AddNetworkString("evilrp_purchase_ammo") -- 13
	net.Receive("evilrp_purchase_ammo", function(len, ply) -- 15
		local mach = net.ReadEntity() -- 16
		if not (mach and IsValid(mach) and mach:GetKits() > 0) then -- 17
			return -- 17
		end -- 17
		local wep = ply:GetActiveWeapon() -- 18
		if not IsValid(wep) then -- 19
			return -- 19
		end -- 19
		if not string.find(wep:GetClass(), "evilrp_weapon/") then -- 20
			return -- 20
		end -- 20
		local mag_max = wep.Primary.ClipSize * 4 -- 21
		local ammo = wep:Ammo1() -- 22
		if ammo >= mag_max then -- 23
			ply:Notify("<c=200,0,0>You're full.") -- 24
			ply:EmitSound("buttons/weapon_cant_buy.wav") -- 25
			return -- 26
		end -- 23
		local ct = CurTime() -- 27
		if ct < mach:GetCantPurchaseUntil() then -- 28
			return -- 28
		end -- 28
		mach:SetCantPurchaseUntil(ct + 3) -- 29
		local avail = mach:GetKits() -- 30
		local cost = mach:GetAmmoCost() -- 31
		local taxed = math.floor(cost - mach.AmmoCost) -- 32
		local money = ply:getDarkRPVar("money") -- 33
		if not avail then -- 34
			return -- 34
		end -- 34
		if avail < 1 then -- 35
			return -- 35
		end -- 35
		if money < cost then -- 36
			net.Start("evilrp_machine_fail") -- 37
			net.WriteString("You don't have enough money. Ha!") -- 38
			net.Send(ply) -- 39
			mach:EmitSound("Autodealer_Squeal_Bad") -- 40
			mach:SetThanksText(mach.HateTexts[math.random(1, #mach.HateTexts)]) -- 41
			ply:ConCommand("say /me grimaces.") -- 42
			ply:AddDespair(10) -- 43
			return -- 44
		end -- 36
		ply:ConCommand("say /me " .. tostring(mach.UseText[math.random(1, #mach.UseText)])) -- 45
		mach:SetThanksText(mach.ThanksTexts[math.random(1, #mach.ThanksTexts)]) -- 46
		mach:EmitSound("Autodealer_Squeal") -- 47
		ply:AddMoney(-cost, "Autocommerce") -- 48
		local _obj_0 = GAMEMODE.taxes_stored -- 49
		_obj_0.sales = _obj_0.sales + taxed -- 49
		mach:SetKits(math.max(0, avail - 1)) -- 50
		ply:EmitSound("buttons/weapon_confirm.wav") -- 51
		local amt = wep.Primary.ClipSize -- 52
		if ((ammo + amt) > mag_max) then -- 53
			local rem = ammo + amt -- 54
			rem = rem - mag_max -- 55
			amt = amt - rem -- 56
		end -- 53
		return ply:GiveAmmo(amt, wep.Primary.Ammo) -- 57
	end) -- 15
	net.Receive("evilrp_purchase_stock", function(len, ply) -- 59
		local ct = CurTime() -- 60
		local mach = net.ReadEntity() -- 61
		local item = net.ReadString() -- 62
		local category = RPExtraTeams[ply:Team()].category -- 63
		if (category ~= "Royalists") then -- 64
			net.Start("evilrp_machine_fail") -- 65
			net.WriteString("WHO THE FUCK ARE YOU?!") -- 66
			net.Send(ply) -- 67
			mach:EmitSound("ambient/alarms/klaxon1.wav") -- 68
			timer.Simple(1, function() -- 69
				local tr = util.TraceLine({ -- 71
					start = mach:GetPos(), -- 71
					endpos = ply:EyePos(), -- 72
					filter = mach -- 73
				}) -- 70
				util.ParticleTracerEx("vortigaunt_beam", tr.StartPos, tr.HitPos, false, mach:EntIndex(), 3) -- 75
				mach:EmitSound("beams/beamstart5.wav") -- 76
				local dmg = DamageInfo() -- 77
				dmg:SetDamage(35) -- 79
				dmg:SetDamageType(DMG_SHOCK) -- 80
				dmg:SetAttacker(mach) -- 81
				dmg:SetInflictor(mach) -- 82
				dmg:SetDamagePosition(ply:EyePos()) -- 83
				return ply:TakeDamageInfo(dmg) -- 84
			end) -- 69
			return -- 85
		end -- 64
		if ct < mach:GetCantPurchaseUntil() then -- 86
			return -- 86
		end -- 86
		mach:SetCantPurchaseUntil(ct + 3) -- 87
		local avail = GAMEMODE.Stocks[item] -- 88
		local weapon = false -- 89
		local etab = scripted_ents.Get(item) -- 90
		if not etab then -- 91
			etab = weapons.Get(item) -- 93
			weapon = true -- 94
		end -- 91
		local cost = (etab.Price * 2) or 100 -- 95
		if ply:Team() == TEAM_DEALER then -- 96
			cost = math.floor(cost * 0.2) -- 97
		end -- 96
		local taxed = math.floor(cost * (GetGlobalInt("tax_sales") / 100)) -- 98
		local money = ply:getDarkRPVar("money") -- 99
		if not avail then -- 100
			return -- 100
		end -- 100
		if avail < 1 then -- 101
			return -- 101
		end -- 101
		if money < cost then -- 102
			net.Start("evilrp_machine_fail") -- 103
			net.WriteString("You don't have enough money. Ha!") -- 104
			net.Send(ply) -- 105
			mach:EmitSound("Autodealer_Squeal_Bad") -- 106
			mach:SetThanksText(mach.HateTexts[math.random(1, #mach.HateTexts)]) -- 107
			ply:ConCommand("say /me grimaces.") -- 108
			ply:AddDespair(10) -- 109
			return -- 110
		end -- 102
		ply:ConCommand("say /me " .. tostring(mach.UseText[math.random(1, #mach.UseText)])) -- 111
		mach:SetThanksText(mach.ThanksTexts[math.random(1, #mach.ThanksTexts)]) -- 112
		mach:EmitSound("Autodealer_Squeal") -- 113
		ply:AddMoney(-(cost + taxed), "Autocommerce") -- 114
		local _obj_0 = GAMEMODE.taxes_stored -- 115
		_obj_0.sales = _obj_0.sales + taxed -- 115
		local _obj_1 = GAMEMODE.Stocks -- 116
		_obj_1[item] = _obj_1[item] - 1 -- 116
		local product -- 117
		if weapon then -- 118
			product = ents.Create("evilrp/spawned/weapon") -- 119
			product:SetModel(etab.WorldModel) -- 121
			product:SetWeaponClass(item) -- 122
		else -- 124
			product = ents.Create(item) -- 124
		end -- 118
		local ent_pos = mach:GetPos() -- 125
		local tr = util.TraceLine({ -- 127
			endpos = ent_pos + (mach:GetForward() * 32) + (mach:GetUp() * 16) + (mach:GetRight() * 8), -- 127
			filter = ply, -- 128
			start = ply:EyePos(), -- 129
			mask = MASK_NPCWORLDSTATIC -- 130
		}) -- 126
		product:Spawn() -- 132
		product:Activate() -- 133
		product:SetAngles(Angle(90, 90, 90)) -- 134
		DarkRP.placeEntity(product, tr, ply) -- 135
		net.Start("evilrp_receive_stocks") -- 136
		net.WriteTable(GAMEMODE.Stocks) -- 137
		return net.Broadcast() -- 138
	end) -- 59
end -- 6
local Autodealer_Squeal -- 140
do -- 140
	local _class_0 -- 140
	local _parent_0 = SOUND -- 140
	local _base_0 = { -- 140
		sound = (function() -- 141
			local _accum_0 = { } -- 141
			local _len_0 = 1 -- 141
			for i = 1, 4 do -- 141
				_accum_0[_len_0] = "placenta/coinkeeper" .. tostring(i) .. ".wav" -- 141
				_len_0 = _len_0 + 1 -- 141
			end -- 141
			return _accum_0 -- 141
		end)(), -- 142
		level = SNDLVL_70DB -- 140
	} -- 140
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 142
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 140
			_base_0[_key_0] = _val_0 -- 140
		end -- 140
	end -- 142
	if _base_0.__index == nil then -- 140
		_base_0.__index = _base_0 -- 140
	end -- 142
	setmetatable(_base_0, _parent_0.__base) -- 140
	_class_0 = setmetatable({ -- 140
		__init = function(self, ...) -- 140
			return _class_0.__parent.__init(self, ...) -- 140
		end, -- 140
		__base = _base_0, -- 140
		__name = "Autodealer_Squeal", -- 140
		__parent = _parent_0 -- 140
	}, { -- 140
		__index = function(cls, name) -- 140
			local val = rawget(_base_0, name) -- 140
			if val == nil then -- 140
				local parent = rawget(cls, "__parent") -- 140
				if parent then -- 140
					return parent[name] -- 140
				end -- 140
			else -- 140
				return val -- 140
			end -- 140
		end, -- 140
		__call = function(cls, ...) -- 140
			local _self_0 = setmetatable({ }, _base_0) -- 140
			cls.__init(_self_0, ...) -- 140
			return _self_0 -- 140
		end -- 140
	}) -- 140
	_base_0.__class = _class_0 -- 140
	if _parent_0.__inherited then -- 140
		_parent_0.__inherited(_parent_0, _class_0) -- 140
	end -- 140
	Autodealer_Squeal = _class_0 -- 140
end -- 142
local Autodealer_Squeal_Bad -- 144
do -- 144
	local _class_0 -- 144
	local _parent_0 = Autodealer_Squeal -- 144
	local _base_0 = { -- 144
		pitch = { -- 145
			80, -- 145
			95 -- 145
		} -- 144
	} -- 144
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 145
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 144
			_base_0[_key_0] = _val_0 -- 144
		end -- 144
	end -- 145
	if _base_0.__index == nil then -- 144
		_base_0.__index = _base_0 -- 144
	end -- 145
	setmetatable(_base_0, _parent_0.__base) -- 144
	_class_0 = setmetatable({ -- 144
		__init = function(self, ...) -- 144
			return _class_0.__parent.__init(self, ...) -- 144
		end, -- 144
		__base = _base_0, -- 144
		__name = "Autodealer_Squeal_Bad", -- 144
		__parent = _parent_0 -- 144
	}, { -- 144
		__index = function(cls, name) -- 144
			local val = rawget(_base_0, name) -- 144
			if val == nil then -- 144
				local parent = rawget(cls, "__parent") -- 144
				if parent then -- 144
					return parent[name] -- 144
				end -- 144
			else -- 144
				return val -- 144
			end -- 144
		end, -- 144
		__call = function(cls, ...) -- 144
			local _self_0 = setmetatable({ }, _base_0) -- 144
			cls.__init(_self_0, ...) -- 144
			return _self_0 -- 144
		end -- 144
	}) -- 144
	_base_0.__class = _class_0 -- 144
	if _parent_0.__inherited then -- 144
		_parent_0.__inherited(_parent_0, _class_0) -- 144
	end -- 144
	Autodealer_Squeal_Bad = _class_0 -- 144
end -- 145
if CLIENT then -- 147
	local Spleen_Autodealer -- 148
	do -- 148
		local _class_0 -- 148
		local _parent_0 = FONT -- 148
		local _base_0 = { -- 148
			font = "Spleen 6x12", -- 150
			size = 14 -- 148
		} -- 148
		for _key_0, _val_0 in pairs(_parent_0.__base) do -- 150
			if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 148
				_base_0[_key_0] = _val_0 -- 148
			end -- 148
		end -- 150
		if _base_0.__index == nil then -- 148
			_base_0.__index = _base_0 -- 148
		end -- 150
		setmetatable(_base_0, _parent_0.__base) -- 148
		_class_0 = setmetatable({ -- 148
			__init = function(self, ...) -- 148
				return _class_0.__parent.__init(self, ...) -- 148
			end, -- 148
			__base = _base_0, -- 148
			__name = "Spleen_Autodealer", -- 148
			__parent = _parent_0 -- 148
		}, { -- 148
			__index = function(cls, name) -- 148
				local val = rawget(_base_0, name) -- 148
				if val == nil then -- 148
					local parent = rawget(cls, "__parent") -- 148
					if parent then -- 148
						return parent[name] -- 148
					end -- 148
				else -- 148
					return val -- 148
				end -- 148
			end, -- 148
			__call = function(cls, ...) -- 148
				local _self_0 = setmetatable({ }, _base_0) -- 148
				cls.__init(_self_0, ...) -- 148
				return _self_0 -- 148
			end -- 148
		}) -- 148
		_base_0.__class = _class_0 -- 148
		if _parent_0.__inherited then -- 148
			_parent_0.__inherited(_parent_0, _class_0) -- 148
		end -- 148
		Spleen_Autodealer = _class_0 -- 148
	end -- 150
end -- 147
local pressed = false -- 152
local Autodealer -- 154
do -- 154
	local _class_0 -- 154
	local _parent_0 = ENTITY -- 154
	local _base_0 = { -- 154
		Base = "base_anim", -- 156
		Type = "anim", -- 157
		PrintName = "Autodealer", -- 158
		Spawnable = true, -- 159
		AdminSpawnable = true, -- 160
		Interesting = true, -- 162
		Pocketable = false, -- 164
		UseText = { -- 165
			"purchases something.", -- 165
			"exchanges money for goods and/or services.", -- 166
			"wastes bones on a capitalist device.", -- 167
			"buys something from a kapitalist kiosk.", -- 168
			"purchases a product.", -- 169
			"feeds money to a capitalist machine.", -- 170
			"performs a monetary exchange." -- 171
		}, -- 173
		SetupDataTables = function(self) -- 173
			self:NetworkVar("Float", "CantPurchaseUntil") -- 174
			self:NetworkVar("String", "ThanksText") -- 175
			return self:NetworkVar("Int", "Kits") -- 176
		end, -- 178
		ThanksTexts = { -- 179
			"Thanks", -- 179
			"Buy more stuff", -- 180
			"I love you", -- 181
			"Keep spending", -- 182
			"More bones now", -- 183
			"Give more bones", -- 184
			"Stay obedient", -- 185
			"Again please", -- 186
			"Please buy stuff", -- 187
			"It feels good", -- 188
			"Buy another" -- 189
		}, -- 191
		HateTexts = { -- 192
			"I hope you die", -- 192
			"How dare you?", -- 193
			"You are nothing", -- 194
			"I hate you", -- 195
			"You're a bad person", -- 196
			"Don't touch me", -- 197
			"Kill yourself", -- 198
			"Get a job", -- 199
			"Deadbeat", -- 200
			"Get away from me", -- 201
			"Go away freak" -- 202
		}, -- 204
		AmmoCost = 50, -- 205
		AmmoMax = 10, -- 207
		Initialize = function(self) -- 207
			if CLIENT then -- 208
				return -- 208
			end -- 208
			self:SetModel("models/props_combine/combine_smallmonitor001.mdl") -- 209
			self:PhysicsInit(SOLID_VPHYSICS) -- 210
			self:PhysWake() -- 211
			return self:GetPhysicsObject():EnableMotion(false) -- 212
		end, -- 214
		GetAmmoCost = function(self) -- 214
			return math.ceil(self.AmmoCost + (self.AmmoCost * (GetGlobalInt("tax_sales") / 100))) -- 214
		end, -- 216
		Think = function(self) -- 216
			if SERVER then -- 217
				local ct = CurTime() -- 218
				if not self.next_regen then -- 219
					self.next_regen = ct + 15 -- 219
				end -- 219
				if ct >= self.next_regen then -- 220
					self.next_regen = ct + 15 -- 221
					local kits = self:GetKits() -- 222
					if kits < self.AmmoMax then -- 223
						kits = kits + 1 -- 224
						self:SetKits(kits) -- 225
						return self:EmitSound("buttons/weapon_confirm.wav") -- 226
					end -- 223
				end -- 220
			end -- 217
		end, -- 228
		Draw = function(self) -- 228
			local team = lp:Team() -- 229
			self:DrawModel() -- 230
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 231
			if not (dist_sqr < 128 ^ 2) then -- 232
				return -- 232
			end -- 232
			self.cache = self.cache or { } -- 233
			if not ui3d2d.startDraw(self:LocalToWorld(pos), self:LocalToWorldAngles(ang), .1, self) then -- 234
				return -- 234
			end -- 234
			surface.SetMaterial(noise) -- 235
			surface.SetDrawColor(255, 255, 255, 255) -- 236
			surface.DrawTexturedRect(0, 0, 212, 150) -- 237
			local desp = (lp:GetDespair() * 0.01) -- 238
			local font = "Spleen_Autodealer" -- 239
			surface.SetFont(font) -- 240
			local _, txt_h = surface.GetTextSize("[!]") -- 241
			local y = 0 -- 242
			if GAMEMODE.Stocks then -- 243
				local keys = table.GetKeys(GAMEMODE.Stocks) -- 244
				local pages = math.floor(#keys / 3) -- 245
				page = math.min(page, pages) -- 246
				local start = 1 + (page * 3) -- 248
				for i = start, start + 2 do -- 249
					local _continue_0 = false -- 250
					repeat -- 250
						local item = keys[i] -- 250
						if not item then -- 251
							_continue_0 = true -- 251
							break -- 251
						end -- 251
						local amount = GAMEMODE.Stocks[item] -- 252
						local etab = self.cache[item] -- 253
						if not etab then -- 254
							etab = scripted_ents.Get(item) or weapons.Get(item) -- 255
							self.cache[item] = etab -- 256
						end -- 254
						local name = etab.PrintName -- 257
						local price = (etab.Price * 2) or 100 -- 258
						if lp:Team() == TEAM_DEALER then -- 259
							price = math.floor(price * 0.2) -- 260
						end -- 259
						local taxed = math.floor(price * (GetGlobalInt("tax_sales") / 100)) -- 261
						price = price + taxed -- 262
						local cost = tostring(price) .. " bones" -- 263
						if amount <= 0 then -- 264
							cost = "OUT OF STOCK" -- 265
						elseif CurTime() < self:GetCantPurchaseUntil() then -- 266
							cost = self:GetThanksText() -- 267
						end -- 264
						local txt = tostring(name) .. "<col=0,200,0> <col=0,200,200>(x" .. tostring(amount) .. ")\n<col=0,200,0>" .. tostring(cost) -- 268
						local txt_obj = scribe.Parse("<f=" .. tostring(font) .. "><ol=2>" .. tostring(txt)) -- 269
						txt_obj:Draw(24, y, 1, TEXT_ALIGN_LEFT) -- 270
						local txt_h -- 271
						txt_h = txt_obj:GetTall() -- 271
						local button_txt = "[ ]" -- 272
						if ui3d2d.isHovering(0, y, 24, txt_h) then -- 273
							if ui3d2d.isPressing() and team ~= TEAM_GHOST then -- 274
								button_txt = "[!]" -- 275
								if not pressed and amount > 0 then -- 276
									pressed = true -- 277
									net.Start("evilrp_purchase_stock") -- 278
									net.WriteEntity(self) -- 279
									net.WriteString(item) -- 280
									net.SendToServer() -- 281
								end -- 276
							else -- 283
								button_txt = "[X]" -- 283
							end -- 274
						end -- 273
						local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt)) -- 284
						button_txt_obj:Draw(0, y + 2, 1, TEXT_ALIGN_LEFT) -- 285
						y = y + txt_h -- 286
						_continue_0 = true -- 250
					until true -- 286
					if not _continue_0 then -- 286
						break -- 286
					end -- 286
				end -- 286
				local x = 0 -- 287
				if not (page < 1) then -- 289
					local button_txt = "[p]" -- 290
					if ui3d2d.isHovering(x, y, 24, txt_h) then -- 291
						button_txt = "[P]" -- 292
						if ui3d2d.isPressing() and team ~= TEAM_GHOST then -- 293
							if not pressed then -- 294
								pressed = true -- 295
								page = page - 1 -- 296
							end -- 294
						end -- 293
					end -- 291
					local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt)) -- 297
					button_txt_obj:Draw(x, y + 2, 1, TEXT_ALIGN_LEFT) -- 298
					local txt_w = button_txt_obj:GetWide() -- 299
					x = x + txt_w -- 300
				end -- 289
				if not (page >= pages) then -- 301
					local button_txt = "[n]" -- 302
					if ui3d2d.isHovering(x, y, 24, txt_h) then -- 303
						button_txt = "[N]" -- 304
						if ui3d2d.isPressing() and team ~= TEAM_GHOST then -- 305
							if not pressed then -- 306
								pressed = true -- 307
								page = page + 1 -- 308
							end -- 306
						end -- 305
					end -- 303
					local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt)) -- 309
					button_txt_obj:Draw(x, y + 2, 1, TEXT_ALIGN_LEFT) -- 310
				end -- 301
				x = 0 -- 311
				local wep = lp:GetActiveWeapon() -- 313
				if IsValid(wep) and string.find(wep:GetClass(), "evilrp_weapon/") then -- 314
					local button_txt = "[ammo:" .. tostring(self:GetKits()) .. "/<c=0,200,0>$" .. tostring(self:GetAmmoCost()) .. "</c>]" -- 315
					local txt_w = surface.GetTextSize(button_txt) -- 316
					y = y + txt_h -- 317
					if ui3d2d.isHovering(x, y, txt_w, txt_h) then -- 318
						button_txt = "[AMMO:" .. tostring(self:GetKits()) .. "/<c=0,200,0>$" .. tostring(self:GetAmmoCost()) .. "</c>]" -- 319
						if ui3d2d.isPressing() and team ~= TEAM_GHOST then -- 320
							if not pressed then -- 321
								pressed = true -- 322
								net.Start("evilrp_purchase_ammo") -- 323
								net.WriteEntity(self) -- 324
								net.SendToServer() -- 325
							end -- 321
						end -- 320
					end -- 318
					local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt)) -- 326
					button_txt_obj:Draw(x, y + 2, 1, TEXT_ALIGN_LEFT) -- 327
				end -- 314
			end -- 243
			if pressed and not ui3d2d.isPressing() then -- 328
				pressed = false -- 328
			end -- 328
			return ui3d2d.endDraw() -- 329
		end -- 154
	} -- 154
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 330
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 154
			_base_0[_key_0] = _val_0 -- 154
		end -- 154
	end -- 330
	if _base_0.__index == nil then -- 154
		_base_0.__index = _base_0 -- 154
	end -- 330
	setmetatable(_base_0, _parent_0.__base) -- 154
	_class_0 = setmetatable({ -- 154
		__init = function(self, ...) -- 154
			return _class_0.__parent.__init(self, ...) -- 154
		end, -- 154
		__base = _base_0, -- 154
		__name = "Autodealer", -- 154
		__parent = _parent_0 -- 154
	}, { -- 154
		__index = function(cls, name) -- 154
			local val = rawget(_base_0, name) -- 154
			if val == nil then -- 154
				local parent = rawget(cls, "__parent") -- 154
				if parent then -- 154
					return parent[name] -- 154
				end -- 154
			else -- 154
				return val -- 154
			end -- 154
		end, -- 154
		__call = function(cls, ...) -- 154
			local _self_0 = setmetatable({ }, _base_0) -- 154
			cls.__init(_self_0, ...) -- 154
			return _self_0 -- 154
		end -- 154
	}) -- 154
	_base_0.__class = _class_0 -- 154
	if _parent_0.__inherited then -- 154
		_parent_0.__inherited(_parent_0, _class_0) -- 154
	end -- 154
	Autodealer = _class_0 -- 154
	return _class_0 -- 330
end -- 330
