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
		if (ply:Team() ~= TEAM_DEALER) and (ply:Team() ~= TEAM_EMPEROR) then -- 63
			net.Start("evilrp_machine_fail") -- 64
			net.WriteString("WHO THE FUCK ARE YOU?!") -- 65
			net.Send(ply) -- 66
			mach:EmitSound("ambient/alarms/klaxon1.wav") -- 67
			timer.Simple(1, function() -- 68
				local tr = util.TraceLine({ -- 70
					start = mach:GetPos(), -- 70
					endpos = ply:EyePos(), -- 71
					filter = mach -- 72
				}) -- 69
				util.ParticleTracerEx("vortigaunt_beam", tr.StartPos, tr.HitPos, false, mach:EntIndex(), 3) -- 74
				mach:EmitSound("beams/beamstart5.wav") -- 75
				local dmg = DamageInfo() -- 76
				dmg:SetDamage(35) -- 78
				dmg:SetDamageType(DMG_SHOCK) -- 79
				dmg:SetAttacker(mach) -- 80
				dmg:SetInflictor(mach) -- 81
				dmg:SetDamagePosition(ply:EyePos()) -- 82
				return ply:TakeDamageInfo(dmg) -- 83
			end) -- 68
			return -- 84
		end -- 63
		if ct < mach:GetCantPurchaseUntil() then -- 85
			return -- 85
		end -- 85
		mach:SetCantPurchaseUntil(ct + 3) -- 86
		local avail = GAMEMODE.Stocks[item] -- 87
		local weapon = false -- 88
		local etab = scripted_ents.Get(item) -- 89
		if not etab then -- 90
			etab = weapons.Get(item) -- 92
			weapon = true -- 93
		end -- 90
		local cost = etab.Price or 10 -- 94
		local taxed = math.floor(cost * (GetGlobalInt("tax_sales") / 100)) -- 95
		local money = ply:getDarkRPVar("money") -- 96
		if not avail then -- 97
			return -- 97
		end -- 97
		if avail < 1 then -- 98
			return -- 98
		end -- 98
		if money < cost then -- 99
			net.Start("evilrp_machine_fail") -- 100
			net.WriteString("You don't have enough money. Ha!") -- 101
			net.Send(ply) -- 102
			mach:EmitSound("Autodealer_Squeal_Bad") -- 103
			mach:SetThanksText(mach.HateTexts[math.random(1, #mach.HateTexts)]) -- 104
			ply:ConCommand("say /me grimaces.") -- 105
			ply:AddDespair(10) -- 106
			return -- 107
		end -- 99
		ply:ConCommand("say /me " .. tostring(mach.UseText[math.random(1, #mach.UseText)])) -- 108
		mach:SetThanksText(mach.ThanksTexts[math.random(1, #mach.ThanksTexts)]) -- 109
		mach:EmitSound("Autodealer_Squeal") -- 110
		ply:AddMoney(-(cost + taxed), "Autocommerce") -- 111
		local _obj_0 = GAMEMODE.taxes_stored -- 112
		_obj_0.sales = _obj_0.sales + taxed -- 112
		local _obj_1 = GAMEMODE.Stocks -- 113
		_obj_1[item] = _obj_1[item] - 1 -- 113
		local product -- 114
		if weapon then -- 115
			product = ents.Create("evilrp/spawned/weapon") -- 116
			product:SetModel(etab.WorldModel) -- 118
			product:SetWeaponClass(item) -- 119
		else -- 121
			product = ents.Create(item) -- 121
		end -- 115
		local ent_pos = mach:GetPos() -- 122
		local tr = util.TraceLine({ -- 124
			endpos = ent_pos + (mach:GetForward() * 32) + (mach:GetUp() * 16) + (mach:GetRight() * 8), -- 124
			filter = ply, -- 125
			start = ply:EyePos(), -- 126
			mask = MASK_NPCWORLDSTATIC -- 127
		}) -- 123
		product:Spawn() -- 129
		product:Activate() -- 130
		product:SetAngles(Angle(90, 90, 90)) -- 131
		DarkRP.placeEntity(product, tr, ply) -- 132
		net.Start("evilrp_receive_stocks") -- 133
		net.WriteTable(GAMEMODE.Stocks) -- 134
		return net.Broadcast() -- 135
	end) -- 59
end -- 6
local Autodealer_Squeal -- 137
do -- 137
	local _class_0 -- 137
	local _parent_0 = SOUND -- 137
	local _base_0 = { -- 137
		sound = (function() -- 138
			local _accum_0 = { } -- 138
			local _len_0 = 1 -- 138
			for i = 1, 4 do -- 138
				_accum_0[_len_0] = "placenta/coinkeeper" .. tostring(i) .. ".wav" -- 138
				_len_0 = _len_0 + 1 -- 138
			end -- 138
			return _accum_0 -- 138
		end)(), -- 139
		level = SNDLVL_70DB -- 137
	} -- 137
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 139
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 137
			_base_0[_key_0] = _val_0 -- 137
		end -- 137
	end -- 139
	if _base_0.__index == nil then -- 137
		_base_0.__index = _base_0 -- 137
	end -- 139
	setmetatable(_base_0, _parent_0.__base) -- 137
	_class_0 = setmetatable({ -- 137
		__init = function(self, ...) -- 137
			return _class_0.__parent.__init(self, ...) -- 137
		end, -- 137
		__base = _base_0, -- 137
		__name = "Autodealer_Squeal", -- 137
		__parent = _parent_0 -- 137
	}, { -- 137
		__index = function(cls, name) -- 137
			local val = rawget(_base_0, name) -- 137
			if val == nil then -- 137
				local parent = rawget(cls, "__parent") -- 137
				if parent then -- 137
					return parent[name] -- 137
				end -- 137
			else -- 137
				return val -- 137
			end -- 137
		end, -- 137
		__call = function(cls, ...) -- 137
			local _self_0 = setmetatable({ }, _base_0) -- 137
			cls.__init(_self_0, ...) -- 137
			return _self_0 -- 137
		end -- 137
	}) -- 137
	_base_0.__class = _class_0 -- 137
	if _parent_0.__inherited then -- 137
		_parent_0.__inherited(_parent_0, _class_0) -- 137
	end -- 137
	Autodealer_Squeal = _class_0 -- 137
end -- 139
local Autodealer_Squeal_Bad -- 141
do -- 141
	local _class_0 -- 141
	local _parent_0 = Autodealer_Squeal -- 141
	local _base_0 = { -- 141
		pitch = { -- 142
			80, -- 142
			95 -- 142
		} -- 141
	} -- 141
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 142
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 141
			_base_0[_key_0] = _val_0 -- 141
		end -- 141
	end -- 142
	if _base_0.__index == nil then -- 141
		_base_0.__index = _base_0 -- 141
	end -- 142
	setmetatable(_base_0, _parent_0.__base) -- 141
	_class_0 = setmetatable({ -- 141
		__init = function(self, ...) -- 141
			return _class_0.__parent.__init(self, ...) -- 141
		end, -- 141
		__base = _base_0, -- 141
		__name = "Autodealer_Squeal_Bad", -- 141
		__parent = _parent_0 -- 141
	}, { -- 141
		__index = function(cls, name) -- 141
			local val = rawget(_base_0, name) -- 141
			if val == nil then -- 141
				local parent = rawget(cls, "__parent") -- 141
				if parent then -- 141
					return parent[name] -- 141
				end -- 141
			else -- 141
				return val -- 141
			end -- 141
		end, -- 141
		__call = function(cls, ...) -- 141
			local _self_0 = setmetatable({ }, _base_0) -- 141
			cls.__init(_self_0, ...) -- 141
			return _self_0 -- 141
		end -- 141
	}) -- 141
	_base_0.__class = _class_0 -- 141
	if _parent_0.__inherited then -- 141
		_parent_0.__inherited(_parent_0, _class_0) -- 141
	end -- 141
	Autodealer_Squeal_Bad = _class_0 -- 141
end -- 142
if CLIENT then -- 144
	local Spleen_Autodealer -- 145
	do -- 145
		local _class_0 -- 145
		local _parent_0 = FONT -- 145
		local _base_0 = { -- 145
			font = "Spleen 6x12", -- 147
			size = 14 -- 145
		} -- 145
		for _key_0, _val_0 in pairs(_parent_0.__base) do -- 147
			if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 145
				_base_0[_key_0] = _val_0 -- 145
			end -- 145
		end -- 147
		if _base_0.__index == nil then -- 145
			_base_0.__index = _base_0 -- 145
		end -- 147
		setmetatable(_base_0, _parent_0.__base) -- 145
		_class_0 = setmetatable({ -- 145
			__init = function(self, ...) -- 145
				return _class_0.__parent.__init(self, ...) -- 145
			end, -- 145
			__base = _base_0, -- 145
			__name = "Spleen_Autodealer", -- 145
			__parent = _parent_0 -- 145
		}, { -- 145
			__index = function(cls, name) -- 145
				local val = rawget(_base_0, name) -- 145
				if val == nil then -- 145
					local parent = rawget(cls, "__parent") -- 145
					if parent then -- 145
						return parent[name] -- 145
					end -- 145
				else -- 145
					return val -- 145
				end -- 145
			end, -- 145
			__call = function(cls, ...) -- 145
				local _self_0 = setmetatable({ }, _base_0) -- 145
				cls.__init(_self_0, ...) -- 145
				return _self_0 -- 145
			end -- 145
		}) -- 145
		_base_0.__class = _class_0 -- 145
		if _parent_0.__inherited then -- 145
			_parent_0.__inherited(_parent_0, _class_0) -- 145
		end -- 145
		Spleen_Autodealer = _class_0 -- 145
	end -- 147
end -- 144
local pressed = false -- 149
local Autodealer -- 151
do -- 151
	local _class_0 -- 151
	local _parent_0 = ENTITY -- 151
	local _base_0 = { -- 151
		Base = "base_anim", -- 153
		Type = "anim", -- 154
		PrintName = "Autodealer", -- 155
		Spawnable = true, -- 156
		AdminSpawnable = true, -- 157
		Interesting = true, -- 159
		Pocketable = false, -- 161
		UseText = { -- 162
			"purchases something.", -- 162
			"exchanges money for goods and/or services.", -- 163
			"wastes bones on a capitalist device.", -- 164
			"buys something from a kapitalist kiosk.", -- 165
			"purchases a product.", -- 166
			"feeds money to a capitalist machine.", -- 167
			"performs a monetary exchange." -- 168
		}, -- 170
		SetupDataTables = function(self) -- 170
			self:NetworkVar("Float", "CantPurchaseUntil") -- 171
			self:NetworkVar("String", "ThanksText") -- 172
			return self:NetworkVar("Int", "Kits") -- 173
		end, -- 175
		ThanksTexts = { -- 176
			"Thanks", -- 176
			"Buy more stuff", -- 177
			"I love you", -- 178
			"Keep spending", -- 179
			"More bones now", -- 180
			"Give more bones", -- 181
			"Stay obedient", -- 182
			"Again please", -- 183
			"Please buy stuff", -- 184
			"It feels good", -- 185
			"Buy another" -- 186
		}, -- 188
		HateTexts = { -- 189
			"I hope you die", -- 189
			"How dare you?", -- 190
			"You are nothing", -- 191
			"I hate you", -- 192
			"You're a bad person", -- 193
			"Don't touch me", -- 194
			"Kill yourself", -- 195
			"Get a job", -- 196
			"Deadbeat", -- 197
			"Get away from me", -- 198
			"Go away freak" -- 199
		}, -- 201
		AmmoCost = 50, -- 202
		AmmoMax = 10, -- 204
		Initialize = function(self) -- 204
			if CLIENT then -- 205
				return -- 205
			end -- 205
			self:SetModel("models/props_combine/combine_smallmonitor001.mdl") -- 206
			self:PhysicsInit(SOLID_VPHYSICS) -- 207
			self:PhysWake() -- 208
			return self:GetPhysicsObject():EnableMotion(false) -- 209
		end, -- 211
		GetAmmoCost = function(self) -- 211
			return math.ceil(self.AmmoCost + (self.AmmoCost * (GetGlobalInt("tax_sales") / 100))) -- 211
		end, -- 213
		Think = function(self) -- 213
			if SERVER then -- 214
				local ct = CurTime() -- 215
				if not self.next_regen then -- 216
					self.next_regen = ct + 15 -- 216
				end -- 216
				if ct >= self.next_regen then -- 217
					self.next_regen = ct + 15 -- 218
					local kits = self:GetKits() -- 219
					if kits < self.AmmoMax then -- 220
						kits = kits + 1 -- 221
						self:SetKits(kits) -- 222
						return self:EmitSound("buttons/weapon_confirm.wav") -- 223
					end -- 220
				end -- 217
			end -- 214
		end, -- 225
		Draw = function(self) -- 225
			local team = lp:Team() -- 226
			self:DrawModel() -- 227
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 228
			if not (dist_sqr < 128 ^ 2) then -- 229
				return -- 229
			end -- 229
			self.cache = self.cache or { } -- 230
			if not ui3d2d.startDraw(self:LocalToWorld(pos), self:LocalToWorldAngles(ang), .1, self) then -- 231
				return -- 231
			end -- 231
			surface.SetMaterial(noise) -- 232
			surface.SetDrawColor(255, 255, 255, 255) -- 233
			surface.DrawTexturedRect(0, 0, 212, 150) -- 234
			local desp = (lp:GetDespair() * 0.01) -- 235
			local font = "Spleen_Autodealer" -- 236
			surface.SetFont(font) -- 237
			local _, txt_h = surface.GetTextSize("[!]") -- 238
			local y = 0 -- 239
			if GAMEMODE.Stocks then -- 240
				local keys = table.GetKeys(GAMEMODE.Stocks) -- 241
				local pages = math.floor(#keys / 3) -- 242
				page = math.min(page, pages) -- 243
				local start = 1 + (page * 3) -- 245
				for i = start, start + 2 do -- 246
					local _continue_0 = false -- 247
					repeat -- 247
						local item = keys[i] -- 247
						if not item then -- 248
							_continue_0 = true -- 248
							break -- 248
						end -- 248
						local amount = GAMEMODE.Stocks[item] -- 249
						local etab = self.cache[item] -- 250
						if not etab then -- 251
							etab = scripted_ents.Get(item) or weapons.Get(item) -- 252
							self.cache[item] = etab -- 253
						end -- 251
						local name = etab.PrintName -- 254
						local price = etab.Price or 10 -- 255
						local taxed = math.floor(price * (GetGlobalInt("tax_sales") / 100)) -- 256
						price = price + taxed -- 257
						local cost = tostring(price) .. " bones" -- 258
						if amount <= 0 then -- 259
							cost = "OUT OF STOCK" -- 260
						elseif CurTime() < self:GetCantPurchaseUntil() then -- 261
							cost = self:GetThanksText() -- 262
						end -- 259
						local txt = tostring(name) .. "<col=0,200,0> <col=0,200,200>(x" .. tostring(amount) .. ")\n<col=0,200,0>" .. tostring(cost) -- 263
						local txt_obj = scribe.Parse("<f=" .. tostring(font) .. "><ol=2>" .. tostring(txt)) -- 264
						txt_obj:Draw(24, y, 1, TEXT_ALIGN_LEFT) -- 265
						local txt_h -- 266
						txt_h = txt_obj:GetTall() -- 266
						local button_txt = "[ ]" -- 267
						if ui3d2d.isHovering(0, y, 24, txt_h) then -- 268
							if ui3d2d.isPressing() and team ~= TEAM_GHOST then -- 269
								button_txt = "[!]" -- 270
								if not pressed and amount > 0 then -- 271
									pressed = true -- 272
									net.Start("evilrp_purchase_stock") -- 273
									net.WriteEntity(self) -- 274
									net.WriteString(item) -- 275
									net.SendToServer() -- 276
								end -- 271
							else -- 278
								button_txt = "[X]" -- 278
							end -- 269
						end -- 268
						local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt)) -- 279
						button_txt_obj:Draw(0, y + 2, 1, TEXT_ALIGN_LEFT) -- 280
						y = y + txt_h -- 281
						_continue_0 = true -- 247
					until true -- 281
					if not _continue_0 then -- 281
						break -- 281
					end -- 281
				end -- 281
				local x = 0 -- 282
				if not (page < 1) then -- 284
					local button_txt = "[p]" -- 285
					if ui3d2d.isHovering(x, y, 24, txt_h) then -- 286
						button_txt = "[P]" -- 287
						if ui3d2d.isPressing() and team ~= TEAM_GHOST then -- 288
							if not pressed then -- 289
								pressed = true -- 290
								page = page - 1 -- 291
							end -- 289
						end -- 288
					end -- 286
					local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt)) -- 292
					button_txt_obj:Draw(x, y + 2, 1, TEXT_ALIGN_LEFT) -- 293
					local txt_w = button_txt_obj:GetWide() -- 294
					x = x + txt_w -- 295
				end -- 284
				if not (page >= pages) then -- 296
					local button_txt = "[n]" -- 297
					if ui3d2d.isHovering(x, y, 24, txt_h) then -- 298
						button_txt = "[N]" -- 299
						if ui3d2d.isPressing() and team ~= TEAM_GHOST then -- 300
							if not pressed then -- 301
								pressed = true -- 302
								page = page + 1 -- 303
							end -- 301
						end -- 300
					end -- 298
					local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt)) -- 304
					button_txt_obj:Draw(x, y + 2, 1, TEXT_ALIGN_LEFT) -- 305
				end -- 296
				x = 0 -- 306
				local wep = lp:GetActiveWeapon() -- 308
				if IsValid(wep) and string.find(wep:GetClass(), "evilrp_weapon/") then -- 309
					local button_txt = "[ammo:" .. tostring(self:GetKits()) .. "/<c=0,200,0>$" .. tostring(self:GetAmmoCost()) .. "</c>]" -- 310
					local txt_w = surface.GetTextSize(button_txt) -- 311
					y = y + txt_h -- 312
					if ui3d2d.isHovering(x, y, txt_w, txt_h) then -- 313
						button_txt = "[AMMO:" .. tostring(self:GetKits()) .. "/<c=0,200,0>$" .. tostring(self:GetAmmoCost()) .. "</c>]" -- 314
						if ui3d2d.isPressing() and team ~= TEAM_GHOST then -- 315
							if not pressed then -- 316
								pressed = true -- 317
								net.Start("evilrp_purchase_ammo") -- 318
								net.WriteEntity(self) -- 319
								net.SendToServer() -- 320
							end -- 316
						end -- 315
					end -- 313
					local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt)) -- 321
					button_txt_obj:Draw(x, y + 2, 1, TEXT_ALIGN_LEFT) -- 322
				end -- 309
			end -- 240
			if pressed and not ui3d2d.isPressing() then -- 323
				pressed = false -- 323
			end -- 323
			return ui3d2d.endDraw() -- 324
		end -- 151
	} -- 151
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 325
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 151
			_base_0[_key_0] = _val_0 -- 151
		end -- 151
	end -- 325
	if _base_0.__index == nil then -- 151
		_base_0.__index = _base_0 -- 151
	end -- 325
	setmetatable(_base_0, _parent_0.__base) -- 151
	_class_0 = setmetatable({ -- 151
		__init = function(self, ...) -- 151
			return _class_0.__parent.__init(self, ...) -- 151
		end, -- 151
		__base = _base_0, -- 151
		__name = "Autodealer", -- 151
		__parent = _parent_0 -- 151
	}, { -- 151
		__index = function(cls, name) -- 151
			local val = rawget(_base_0, name) -- 151
			if val == nil then -- 151
				local parent = rawget(cls, "__parent") -- 151
				if parent then -- 151
					return parent[name] -- 151
				end -- 151
			else -- 151
				return val -- 151
			end -- 151
		end, -- 151
		__call = function(cls, ...) -- 151
			local _self_0 = setmetatable({ }, _base_0) -- 151
			cls.__init(_self_0, ...) -- 151
			return _self_0 -- 151
		end -- 151
	}) -- 151
	_base_0.__class = _class_0 -- 151
	if _parent_0.__inherited then -- 151
		_parent_0.__inherited(_parent_0, _class_0) -- 151
	end -- 151
	Autodealer = _class_0 -- 151
	return _class_0 -- 325
end -- 325
