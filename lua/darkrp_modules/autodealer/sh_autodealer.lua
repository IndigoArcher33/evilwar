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
		if ply:Team() ~= TEAM_DEALER then -- 63
			ply:AddDespair(10) -- 64
			local dmg = DamageInfo() -- 65
			dmg:SetAttacker(ply) -- 67
			dmg:SetDamage(15) -- 68
			dmg:SetInflictor(mach) -- 69
			dmg:SetDamageType(DMG_SLASH) -- 70
			ply:TakeDamageInfo(dmg) -- 71
			net.Start("evilrp_machine_fail") -- 72
			net.WriteString("WHO THE FUCK ARE YOU?!") -- 73
			net.Send(ply) -- 74
			mach:EmitSound("Autodealer_Squeal_Bad") -- 75
			mach:SetThanksText(mach.HateTexts[math.random(1, #mach.HateTexts)]) -- 76
			return -- 77
		end -- 63
		if ct < mach:GetCantPurchaseUntil() then -- 78
			return -- 78
		end -- 78
		mach:SetCantPurchaseUntil(ct + 3) -- 79
		local avail = GAMEMODE.Stocks[item] -- 80
		local weapon = false -- 81
		local etab = scripted_ents.Get(item) -- 82
		if not etab then -- 83
			etab = weapons.Get(item) -- 85
			weapon = true -- 86
		end -- 83
		local cost = etab.Price or 10 -- 87
		local taxed = math.floor(cost * (GetGlobalInt("tax_sales") / 100)) -- 88
		local money = ply:getDarkRPVar("money") -- 89
		if not avail then -- 90
			return -- 90
		end -- 90
		if avail < 1 then -- 91
			return -- 91
		end -- 91
		if money < cost then -- 92
			net.Start("evilrp_machine_fail") -- 93
			net.WriteString("You don't have enough money. Ha!") -- 94
			net.Send(ply) -- 95
			mach:EmitSound("Autodealer_Squeal_Bad") -- 96
			mach:SetThanksText(mach.HateTexts[math.random(1, #mach.HateTexts)]) -- 97
			ply:ConCommand("say /me grimaces.") -- 98
			ply:AddDespair(10) -- 99
			return -- 100
		end -- 92
		ply:ConCommand("say /me " .. tostring(mach.UseText[math.random(1, #mach.UseText)])) -- 101
		mach:SetThanksText(mach.ThanksTexts[math.random(1, #mach.ThanksTexts)]) -- 102
		mach:EmitSound("Autodealer_Squeal") -- 103
		ply:AddMoney(-(cost + taxed), "Autocommerce") -- 104
		local _obj_0 = GAMEMODE.taxes_stored -- 105
		_obj_0.sales = _obj_0.sales + taxed -- 105
		local _obj_1 = GAMEMODE.Stocks -- 106
		_obj_1[item] = _obj_1[item] - 1 -- 106
		local product -- 107
		if weapon then -- 108
			product = ents.Create("evilrp/spawned/weapon") -- 109
			product:SetModel(etab.WorldModel) -- 111
			product:SetWeaponClass(item) -- 112
		else -- 114
			product = ents.Create(item) -- 114
		end -- 108
		local ent_pos = mach:GetPos() -- 115
		local tr = util.TraceLine({ -- 117
			endpos = ent_pos + (mach:GetForward() * 32) + (mach:GetUp() * 16) + (mach:GetRight() * 8), -- 117
			filter = ply, -- 118
			start = ply:EyePos(), -- 119
			mask = MASK_NPCWORLDSTATIC -- 120
		}) -- 116
		product:Spawn() -- 122
		product:Activate() -- 123
		product:SetAngles(Angle(90, 90, 90)) -- 124
		DarkRP.placeEntity(product, tr, ply) -- 125
		net.Start("evilrp_receive_stocks") -- 126
		net.WriteTable(GAMEMODE.Stocks) -- 127
		return net.Broadcast() -- 128
	end) -- 59
end -- 6
local Autodealer_Squeal -- 130
do -- 130
	local _class_0 -- 130
	local _parent_0 = SOUND -- 130
	local _base_0 = { -- 130
		sound = (function() -- 131
			local _accum_0 = { } -- 131
			local _len_0 = 1 -- 131
			for i = 1, 4 do -- 131
				_accum_0[_len_0] = "placenta/coinkeeper" .. tostring(i) .. ".wav" -- 131
				_len_0 = _len_0 + 1 -- 131
			end -- 131
			return _accum_0 -- 131
		end)(), -- 132
		level = SNDLVL_70DB -- 130
	} -- 130
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 132
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 130
			_base_0[_key_0] = _val_0 -- 130
		end -- 130
	end -- 132
	if _base_0.__index == nil then -- 130
		_base_0.__index = _base_0 -- 130
	end -- 132
	setmetatable(_base_0, _parent_0.__base) -- 130
	_class_0 = setmetatable({ -- 130
		__init = function(self, ...) -- 130
			return _class_0.__parent.__init(self, ...) -- 130
		end, -- 130
		__base = _base_0, -- 130
		__name = "Autodealer_Squeal", -- 130
		__parent = _parent_0 -- 130
	}, { -- 130
		__index = function(cls, name) -- 130
			local val = rawget(_base_0, name) -- 130
			if val == nil then -- 130
				local parent = rawget(cls, "__parent") -- 130
				if parent then -- 130
					return parent[name] -- 130
				end -- 130
			else -- 130
				return val -- 130
			end -- 130
		end, -- 130
		__call = function(cls, ...) -- 130
			local _self_0 = setmetatable({ }, _base_0) -- 130
			cls.__init(_self_0, ...) -- 130
			return _self_0 -- 130
		end -- 130
	}) -- 130
	_base_0.__class = _class_0 -- 130
	if _parent_0.__inherited then -- 130
		_parent_0.__inherited(_parent_0, _class_0) -- 130
	end -- 130
	Autodealer_Squeal = _class_0 -- 130
end -- 132
local Autodealer_Squeal_Bad -- 134
do -- 134
	local _class_0 -- 134
	local _parent_0 = Autodealer_Squeal -- 134
	local _base_0 = { -- 134
		pitch = { -- 135
			80, -- 135
			95 -- 135
		} -- 134
	} -- 134
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 135
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 134
			_base_0[_key_0] = _val_0 -- 134
		end -- 134
	end -- 135
	if _base_0.__index == nil then -- 134
		_base_0.__index = _base_0 -- 134
	end -- 135
	setmetatable(_base_0, _parent_0.__base) -- 134
	_class_0 = setmetatable({ -- 134
		__init = function(self, ...) -- 134
			return _class_0.__parent.__init(self, ...) -- 134
		end, -- 134
		__base = _base_0, -- 134
		__name = "Autodealer_Squeal_Bad", -- 134
		__parent = _parent_0 -- 134
	}, { -- 134
		__index = function(cls, name) -- 134
			local val = rawget(_base_0, name) -- 134
			if val == nil then -- 134
				local parent = rawget(cls, "__parent") -- 134
				if parent then -- 134
					return parent[name] -- 134
				end -- 134
			else -- 134
				return val -- 134
			end -- 134
		end, -- 134
		__call = function(cls, ...) -- 134
			local _self_0 = setmetatable({ }, _base_0) -- 134
			cls.__init(_self_0, ...) -- 134
			return _self_0 -- 134
		end -- 134
	}) -- 134
	_base_0.__class = _class_0 -- 134
	if _parent_0.__inherited then -- 134
		_parent_0.__inherited(_parent_0, _class_0) -- 134
	end -- 134
	Autodealer_Squeal_Bad = _class_0 -- 134
end -- 135
if CLIENT then -- 137
	local Spleen_Autodealer -- 138
	do -- 138
		local _class_0 -- 138
		local _parent_0 = FONT -- 138
		local _base_0 = { -- 138
			font = "Spleen 6x12", -- 140
			size = 14 -- 138
		} -- 138
		for _key_0, _val_0 in pairs(_parent_0.__base) do -- 140
			if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 138
				_base_0[_key_0] = _val_0 -- 138
			end -- 138
		end -- 140
		if _base_0.__index == nil then -- 138
			_base_0.__index = _base_0 -- 138
		end -- 140
		setmetatable(_base_0, _parent_0.__base) -- 138
		_class_0 = setmetatable({ -- 138
			__init = function(self, ...) -- 138
				return _class_0.__parent.__init(self, ...) -- 138
			end, -- 138
			__base = _base_0, -- 138
			__name = "Spleen_Autodealer", -- 138
			__parent = _parent_0 -- 138
		}, { -- 138
			__index = function(cls, name) -- 138
				local val = rawget(_base_0, name) -- 138
				if val == nil then -- 138
					local parent = rawget(cls, "__parent") -- 138
					if parent then -- 138
						return parent[name] -- 138
					end -- 138
				else -- 138
					return val -- 138
				end -- 138
			end, -- 138
			__call = function(cls, ...) -- 138
				local _self_0 = setmetatable({ }, _base_0) -- 138
				cls.__init(_self_0, ...) -- 138
				return _self_0 -- 138
			end -- 138
		}) -- 138
		_base_0.__class = _class_0 -- 138
		if _parent_0.__inherited then -- 138
			_parent_0.__inherited(_parent_0, _class_0) -- 138
		end -- 138
		Spleen_Autodealer = _class_0 -- 138
	end -- 140
end -- 137
local pressed = false -- 142
local Autodealer -- 144
do -- 144
	local _class_0 -- 144
	local _parent_0 = ENTITY -- 144
	local _base_0 = { -- 144
		Base = "base_anim", -- 146
		Type = "anim", -- 147
		PrintName = "Autodealer", -- 148
		Spawnable = true, -- 149
		AdminSpawnable = true, -- 150
		Interesting = true, -- 152
		Pocketable = false, -- 154
		UseText = { -- 155
			"purchases something.", -- 155
			"exchanges money for goods and/or services.", -- 156
			"wastes bones on a capitalist device.", -- 157
			"buys something from a kapitalist kiosk.", -- 158
			"purchases a product.", -- 159
			"feeds money to a capitalist machine.", -- 160
			"performs a monetary exchange." -- 161
		}, -- 163
		SetupDataTables = function(self) -- 163
			self:NetworkVar("Float", "CantPurchaseUntil") -- 164
			self:NetworkVar("String", "ThanksText") -- 165
			return self:NetworkVar("Int", "Kits") -- 166
		end, -- 168
		ThanksTexts = { -- 169
			"Thanks", -- 169
			"Buy more stuff", -- 170
			"I love you", -- 171
			"Keep spending", -- 172
			"More bones now", -- 173
			"Give more bones", -- 174
			"Stay obedient", -- 175
			"Again please", -- 176
			"Please buy stuff", -- 177
			"It feels good", -- 178
			"Buy another" -- 179
		}, -- 181
		HateTexts = { -- 182
			"I hope you die", -- 182
			"How dare you?", -- 183
			"You are nothing", -- 184
			"I hate you", -- 185
			"You're a bad person", -- 186
			"Don't touch me", -- 187
			"Kill yourself", -- 188
			"Get a job", -- 189
			"Deadbeat", -- 190
			"Get away from me", -- 191
			"Go away freak" -- 192
		}, -- 194
		AmmoCost = 50, -- 195
		AmmoMax = 10, -- 197
		Initialize = function(self) -- 197
			if CLIENT then -- 198
				return -- 198
			end -- 198
			self:SetModel("models/props_combine/combine_smallmonitor001.mdl") -- 199
			self:PhysicsInit(SOLID_VPHYSICS) -- 200
			self:PhysWake() -- 201
			return self:GetPhysicsObject():EnableMotion(false) -- 202
		end, -- 204
		GetAmmoCost = function(self) -- 204
			return math.ceil(self.AmmoCost + (self.AmmoCost * (GetGlobalInt("tax_sales") / 100))) -- 204
		end, -- 206
		Think = function(self) -- 206
			if SERVER then -- 207
				local ct = CurTime() -- 208
				if not self.next_regen then -- 209
					self.next_regen = ct + 15 -- 209
				end -- 209
				if ct >= self.next_regen then -- 210
					self.next_regen = ct + 15 -- 211
					local kits = self:GetKits() -- 212
					if kits < self.AmmoMax then -- 213
						kits = kits + 1 -- 214
						self:SetKits(kits) -- 215
						return self:EmitSound("buttons/weapon_confirm.wav") -- 216
					end -- 213
				end -- 210
			end -- 207
		end, -- 218
		Draw = function(self) -- 218
			local team = lp:Team() -- 219
			self:DrawModel() -- 220
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 221
			if not (dist_sqr < 128 ^ 2) then -- 222
				return -- 222
			end -- 222
			self.cache = self.cache or { } -- 223
			if not ui3d2d.startDraw(self:LocalToWorld(pos), self:LocalToWorldAngles(ang), .1, self) then -- 224
				return -- 224
			end -- 224
			surface.SetMaterial(noise) -- 225
			surface.SetDrawColor(255, 255, 255, 255) -- 226
			surface.DrawTexturedRect(0, 0, 212, 150) -- 227
			local desp = (lp:GetDespair() * 0.01) -- 228
			local font = "Spleen_Autodealer" -- 229
			surface.SetFont(font) -- 230
			local _, txt_h = surface.GetTextSize("[!]") -- 231
			local y = 0 -- 232
			if GAMEMODE.Stocks then -- 233
				local keys = table.GetKeys(GAMEMODE.Stocks) -- 234
				local pages = math.floor(#keys / 3) -- 235
				page = math.min(page, pages) -- 236
				local start = 1 + (page * 3) -- 238
				for i = start, start + 2 do -- 239
					local _continue_0 = false -- 240
					repeat -- 240
						local item = keys[i] -- 240
						if not item then -- 241
							_continue_0 = true -- 241
							break -- 241
						end -- 241
						local amount = GAMEMODE.Stocks[item] -- 242
						local etab = self.cache[item] -- 243
						if not etab then -- 244
							etab = scripted_ents.Get(item) or weapons.Get(item) -- 245
							self.cache[item] = etab -- 246
						end -- 244
						local name = etab.PrintName -- 247
						local price = etab.Price or 10 -- 248
						local taxed = math.floor(price * (GetGlobalInt("tax_sales") / 100)) -- 249
						price = price + taxed -- 250
						local cost = tostring(price) .. " bones" -- 251
						if amount <= 0 then -- 252
							cost = "OUT OF STOCK" -- 253
						elseif CurTime() < self:GetCantPurchaseUntil() then -- 254
							cost = self:GetThanksText() -- 255
						end -- 252
						local txt = tostring(name) .. "<col=0,200,0> <col=0,200,200>(x" .. tostring(amount) .. ")\n<col=0,200,0>" .. tostring(cost) -- 256
						local txt_obj = scribe.Parse("<f=" .. tostring(font) .. "><ol=2>" .. tostring(txt)) -- 257
						txt_obj:Draw(24, y, 1, TEXT_ALIGN_LEFT) -- 258
						local txt_h -- 259
						txt_h = txt_obj:GetTall() -- 259
						local button_txt = "[ ]" -- 260
						if ui3d2d.isHovering(0, y, 24, txt_h) then -- 261
							if ui3d2d.isPressing() and team ~= TEAM_GHOST then -- 262
								button_txt = "[!]" -- 263
								if not pressed and amount > 0 then -- 264
									pressed = true -- 265
									net.Start("evilrp_purchase_stock") -- 266
									net.WriteEntity(self) -- 267
									net.WriteString(item) -- 268
									net.SendToServer() -- 269
								end -- 264
							else -- 271
								button_txt = "[X]" -- 271
							end -- 262
						end -- 261
						local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt)) -- 272
						button_txt_obj:Draw(0, y + 2, 1, TEXT_ALIGN_LEFT) -- 273
						y = y + txt_h -- 274
						_continue_0 = true -- 240
					until true -- 274
					if not _continue_0 then -- 274
						break -- 274
					end -- 274
				end -- 274
				local x = 0 -- 275
				if not (page < 1) then -- 277
					local button_txt = "[p]" -- 278
					if ui3d2d.isHovering(x, y, 24, txt_h) then -- 279
						button_txt = "[P]" -- 280
						if ui3d2d.isPressing() and team ~= TEAM_GHOST then -- 281
							if not pressed then -- 282
								pressed = true -- 283
								page = page - 1 -- 284
							end -- 282
						end -- 281
					end -- 279
					local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt)) -- 285
					button_txt_obj:Draw(x, y + 2, 1, TEXT_ALIGN_LEFT) -- 286
					local txt_w = button_txt_obj:GetWide() -- 287
					x = x + txt_w -- 288
				end -- 277
				if not (page >= pages) then -- 289
					local button_txt = "[n]" -- 290
					if ui3d2d.isHovering(x, y, 24, txt_h) then -- 291
						button_txt = "[N]" -- 292
						if ui3d2d.isPressing() and team ~= TEAM_GHOST then -- 293
							if not pressed then -- 294
								pressed = true -- 295
								page = page + 1 -- 296
							end -- 294
						end -- 293
					end -- 291
					local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt)) -- 297
					button_txt_obj:Draw(x, y + 2, 1, TEXT_ALIGN_LEFT) -- 298
				end -- 289
				x = 0 -- 299
				local wep = lp:GetActiveWeapon() -- 301
				if IsValid(wep) and string.find(wep:GetClass(), "evilrp_weapon/") then -- 302
					local button_txt = "[ammo:" .. tostring(self:GetKits()) .. "/<c=0,200,0>$" .. tostring(self:GetAmmoCost()) .. "</c>]" -- 303
					local txt_w = surface.GetTextSize(button_txt) -- 304
					y = y + txt_h -- 305
					if ui3d2d.isHovering(x, y, txt_w, txt_h) then -- 306
						button_txt = "[AMMO:" .. tostring(self:GetKits()) .. "/<c=0,200,0>$" .. tostring(self:GetAmmoCost()) .. "</c>]" -- 307
						if ui3d2d.isPressing() and team ~= TEAM_GHOST then -- 308
							if not pressed then -- 309
								pressed = true -- 310
								net.Start("evilrp_purchase_ammo") -- 311
								net.WriteEntity(self) -- 312
								net.SendToServer() -- 313
							end -- 309
						end -- 308
					end -- 306
					local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt)) -- 314
					button_txt_obj:Draw(x, y + 2, 1, TEXT_ALIGN_LEFT) -- 315
				end -- 302
			end -- 233
			if pressed and not ui3d2d.isPressing() then -- 316
				pressed = false -- 316
			end -- 316
			return ui3d2d.endDraw() -- 317
		end -- 144
	} -- 144
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 318
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 144
			_base_0[_key_0] = _val_0 -- 144
		end -- 144
	end -- 318
	if _base_0.__index == nil then -- 144
		_base_0.__index = _base_0 -- 144
	end -- 318
	setmetatable(_base_0, _parent_0.__base) -- 144
	_class_0 = setmetatable({ -- 144
		__init = function(self, ...) -- 144
			return _class_0.__parent.__init(self, ...) -- 144
		end, -- 144
		__base = _base_0, -- 144
		__name = "Autodealer", -- 144
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
	Autodealer = _class_0 -- 144
	return _class_0 -- 318
end -- 318
