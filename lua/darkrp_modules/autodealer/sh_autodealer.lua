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
			ply:Notify("<c=200,0,0>Nice try, freak.") -- 72
			mach:EmitSound("Autodealer_Squeal_Bad") -- 73
			mach:SetThanksText(mach.HateTexts[math.random(1, #mach.HateTexts)]) -- 74
			return -- 75
		end -- 63
		if ct < mach:GetCantPurchaseUntil() then -- 76
			return -- 76
		end -- 76
		mach:SetCantPurchaseUntil(ct + 3) -- 77
		local avail = GAMEMODE.Stocks[item] -- 78
		local weapon = false -- 79
		local etab = scripted_ents.Get(item) -- 80
		if not etab then -- 81
			etab = weapons.Get(item) -- 83
			weapon = true -- 84
		end -- 81
		local cost = etab.Price or 10 -- 85
		local taxed = math.floor(cost * (GetGlobalInt("tax_sales") / 100)) -- 86
		local money = ply:getDarkRPVar("money") -- 87
		if not avail then -- 88
			return -- 88
		end -- 88
		if avail < 1 then -- 89
			return -- 89
		end -- 89
		if money < cost then -- 90
			net.Start("evilrp_machine_fail") -- 91
			net.WriteString("You don't have enough money. Ha!") -- 92
			net.Send(ply) -- 93
			mach:EmitSound("Autodealer_Squeal_Bad") -- 94
			mach:SetThanksText(mach.HateTexts[math.random(1, #mach.HateTexts)]) -- 95
			ply:ConCommand("say /me grimaces.") -- 96
			ply:AddDespair(10) -- 97
			return -- 98
		end -- 90
		ply:ConCommand("say /me " .. tostring(mach.UseText[math.random(1, #mach.UseText)])) -- 99
		mach:SetThanksText(mach.ThanksTexts[math.random(1, #mach.ThanksTexts)]) -- 100
		mach:EmitSound("Autodealer_Squeal") -- 101
		ply:AddMoney(-(cost + taxed), "Autocommerce") -- 102
		local _obj_0 = GAMEMODE.taxes_stored -- 103
		_obj_0.sales = _obj_0.sales + taxed -- 103
		local _obj_1 = GAMEMODE.Stocks -- 104
		_obj_1[item] = _obj_1[item] - 1 -- 104
		local product -- 105
		if weapon then -- 106
			product = ents.Create("evilrp/spawned/weapon") -- 107
			product:SetModel(etab.WorldModel) -- 109
			product:SetWeaponClass(item) -- 110
		else -- 112
			product = ents.Create(item) -- 112
		end -- 106
		local ent_pos = mach:GetPos() -- 113
		local tr = util.TraceLine({ -- 115
			endpos = ent_pos + (mach:GetForward() * 32) + (mach:GetUp() * 16) + (mach:GetRight() * 8), -- 115
			filter = ply, -- 116
			start = ply:EyePos(), -- 117
			mask = MASK_NPCWORLDSTATIC -- 118
		}) -- 114
		product:Spawn() -- 120
		product:Activate() -- 121
		product:SetAngles(Angle(90, 90, 90)) -- 122
		DarkRP.placeEntity(product, tr, ply) -- 123
		net.Start("evilrp_receive_stocks") -- 124
		net.WriteTable(GAMEMODE.Stocks) -- 125
		return net.Broadcast() -- 126
	end) -- 59
end -- 6
local Autodealer_Squeal -- 128
do -- 128
	local _class_0 -- 128
	local _parent_0 = SOUND -- 128
	local _base_0 = { -- 128
		sound = (function() -- 129
			local _accum_0 = { } -- 129
			local _len_0 = 1 -- 129
			for i = 1, 4 do -- 129
				_accum_0[_len_0] = "placenta/coinkeeper" .. tostring(i) .. ".wav" -- 129
				_len_0 = _len_0 + 1 -- 129
			end -- 129
			return _accum_0 -- 129
		end)(), -- 130
		level = SNDLVL_70DB -- 128
	} -- 128
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 130
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 128
			_base_0[_key_0] = _val_0 -- 128
		end -- 128
	end -- 130
	if _base_0.__index == nil then -- 128
		_base_0.__index = _base_0 -- 128
	end -- 130
	setmetatable(_base_0, _parent_0.__base) -- 128
	_class_0 = setmetatable({ -- 128
		__init = function(self, ...) -- 128
			return _class_0.__parent.__init(self, ...) -- 128
		end, -- 128
		__base = _base_0, -- 128
		__name = "Autodealer_Squeal", -- 128
		__parent = _parent_0 -- 128
	}, { -- 128
		__index = function(cls, name) -- 128
			local val = rawget(_base_0, name) -- 128
			if val == nil then -- 128
				local parent = rawget(cls, "__parent") -- 128
				if parent then -- 128
					return parent[name] -- 128
				end -- 128
			else -- 128
				return val -- 128
			end -- 128
		end, -- 128
		__call = function(cls, ...) -- 128
			local _self_0 = setmetatable({ }, _base_0) -- 128
			cls.__init(_self_0, ...) -- 128
			return _self_0 -- 128
		end -- 128
	}) -- 128
	_base_0.__class = _class_0 -- 128
	if _parent_0.__inherited then -- 128
		_parent_0.__inherited(_parent_0, _class_0) -- 128
	end -- 128
	Autodealer_Squeal = _class_0 -- 128
end -- 130
local Autodealer_Squeal_Bad -- 132
do -- 132
	local _class_0 -- 132
	local _parent_0 = Autodealer_Squeal -- 132
	local _base_0 = { -- 132
		pitch = { -- 133
			80, -- 133
			95 -- 133
		} -- 132
	} -- 132
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 133
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 132
			_base_0[_key_0] = _val_0 -- 132
		end -- 132
	end -- 133
	if _base_0.__index == nil then -- 132
		_base_0.__index = _base_0 -- 132
	end -- 133
	setmetatable(_base_0, _parent_0.__base) -- 132
	_class_0 = setmetatable({ -- 132
		__init = function(self, ...) -- 132
			return _class_0.__parent.__init(self, ...) -- 132
		end, -- 132
		__base = _base_0, -- 132
		__name = "Autodealer_Squeal_Bad", -- 132
		__parent = _parent_0 -- 132
	}, { -- 132
		__index = function(cls, name) -- 132
			local val = rawget(_base_0, name) -- 132
			if val == nil then -- 132
				local parent = rawget(cls, "__parent") -- 132
				if parent then -- 132
					return parent[name] -- 132
				end -- 132
			else -- 132
				return val -- 132
			end -- 132
		end, -- 132
		__call = function(cls, ...) -- 132
			local _self_0 = setmetatable({ }, _base_0) -- 132
			cls.__init(_self_0, ...) -- 132
			return _self_0 -- 132
		end -- 132
	}) -- 132
	_base_0.__class = _class_0 -- 132
	if _parent_0.__inherited then -- 132
		_parent_0.__inherited(_parent_0, _class_0) -- 132
	end -- 132
	Autodealer_Squeal_Bad = _class_0 -- 132
end -- 133
if CLIENT then -- 135
	local Spleen_Autodealer -- 136
	do -- 136
		local _class_0 -- 136
		local _parent_0 = FONT -- 136
		local _base_0 = { -- 136
			font = "Spleen 6x12", -- 138
			size = 14 -- 136
		} -- 136
		for _key_0, _val_0 in pairs(_parent_0.__base) do -- 138
			if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 136
				_base_0[_key_0] = _val_0 -- 136
			end -- 136
		end -- 138
		if _base_0.__index == nil then -- 136
			_base_0.__index = _base_0 -- 136
		end -- 138
		setmetatable(_base_0, _parent_0.__base) -- 136
		_class_0 = setmetatable({ -- 136
			__init = function(self, ...) -- 136
				return _class_0.__parent.__init(self, ...) -- 136
			end, -- 136
			__base = _base_0, -- 136
			__name = "Spleen_Autodealer", -- 136
			__parent = _parent_0 -- 136
		}, { -- 136
			__index = function(cls, name) -- 136
				local val = rawget(_base_0, name) -- 136
				if val == nil then -- 136
					local parent = rawget(cls, "__parent") -- 136
					if parent then -- 136
						return parent[name] -- 136
					end -- 136
				else -- 136
					return val -- 136
				end -- 136
			end, -- 136
			__call = function(cls, ...) -- 136
				local _self_0 = setmetatable({ }, _base_0) -- 136
				cls.__init(_self_0, ...) -- 136
				return _self_0 -- 136
			end -- 136
		}) -- 136
		_base_0.__class = _class_0 -- 136
		if _parent_0.__inherited then -- 136
			_parent_0.__inherited(_parent_0, _class_0) -- 136
		end -- 136
		Spleen_Autodealer = _class_0 -- 136
	end -- 138
end -- 135
local pressed = false -- 140
local Autodealer -- 142
do -- 142
	local _class_0 -- 142
	local _parent_0 = ENTITY -- 142
	local _base_0 = { -- 142
		Base = "base_anim", -- 144
		Type = "anim", -- 145
		PrintName = "Autodealer", -- 146
		Spawnable = true, -- 147
		AdminSpawnable = true, -- 148
		Interesting = true, -- 150
		Pocketable = false, -- 152
		UseText = { -- 153
			"purchases something.", -- 153
			"exchanges money for goods and/or services.", -- 154
			"wastes bones on a capitalist device.", -- 155
			"buys something from a kapitalist kiosk.", -- 156
			"purchases a product.", -- 157
			"feeds money to a capitalist machine.", -- 158
			"performs a monetary exchange." -- 159
		}, -- 161
		SetupDataTables = function(self) -- 161
			self:NetworkVar("Float", "CantPurchaseUntil") -- 162
			self:NetworkVar("String", "ThanksText") -- 163
			return self:NetworkVar("Int", "Kits") -- 164
		end, -- 166
		ThanksTexts = { -- 167
			"Thanks", -- 167
			"Buy more stuff", -- 168
			"I love you", -- 169
			"Keep spending", -- 170
			"More bones now", -- 171
			"Give more bones", -- 172
			"Stay obedient", -- 173
			"Again please", -- 174
			"Please buy stuff", -- 175
			"It feels good", -- 176
			"Buy another" -- 177
		}, -- 179
		HateTexts = { -- 180
			"I hope you die", -- 180
			"How dare you?", -- 181
			"You are nothing", -- 182
			"I hate you", -- 183
			"You're a bad person", -- 184
			"Don't touch me", -- 185
			"Kill yourself", -- 186
			"Get a job", -- 187
			"Deadbeat", -- 188
			"Get away from me", -- 189
			"Go away freak" -- 190
		}, -- 192
		AmmoCost = 50, -- 193
		AmmoMax = 10, -- 195
		Initialize = function(self) -- 195
			if CLIENT then -- 196
				return -- 196
			end -- 196
			self:SetModel("models/props_combine/combine_smallmonitor001.mdl") -- 197
			self:PhysicsInit(SOLID_VPHYSICS) -- 198
			self:PhysWake() -- 199
			return self:GetPhysicsObject():EnableMotion(false) -- 200
		end, -- 202
		GetAmmoCost = function(self) -- 202
			return math.ceil(self.AmmoCost + (self.AmmoCost * (GetGlobalInt("tax_sales") / 100))) -- 202
		end, -- 204
		Think = function(self) -- 204
			if SERVER then -- 205
				local ct = CurTime() -- 206
				if not self.next_regen then -- 207
					self.next_regen = ct + 15 -- 207
				end -- 207
				if ct >= self.next_regen then -- 208
					self.next_regen = ct + 15 -- 209
					local kits = self:GetKits() -- 210
					if kits < self.AmmoMax then -- 211
						kits = kits + 1 -- 212
						self:SetKits(kits) -- 213
						return self:EmitSound("buttons/weapon_confirm.wav") -- 214
					end -- 211
				end -- 208
			end -- 205
		end, -- 216
		Draw = function(self) -- 216
			local team = lp:Team() -- 217
			self:DrawModel() -- 218
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 219
			if not (dist_sqr < 128 ^ 2) then -- 220
				return -- 220
			end -- 220
			self.cache = self.cache or { } -- 221
			if not ui3d2d.startDraw(self:LocalToWorld(pos), self:LocalToWorldAngles(ang), .1, self) then -- 222
				return -- 222
			end -- 222
			surface.SetMaterial(noise) -- 223
			surface.SetDrawColor(255, 255, 255, 255) -- 224
			surface.DrawTexturedRect(0, 0, 212, 150) -- 225
			local desp = (lp:GetDespair() * 0.01) -- 226
			local font = "Spleen_Autodealer" -- 227
			surface.SetFont(font) -- 228
			local _, txt_h = surface.GetTextSize("[!]") -- 229
			local y = 0 -- 230
			if GAMEMODE.Stocks then -- 231
				local keys = table.GetKeys(GAMEMODE.Stocks) -- 232
				local pages = math.floor(#keys / 3) -- 233
				page = math.min(page, pages) -- 234
				local start = 1 + (page * 3) -- 236
				for i = start, start + 2 do -- 237
					local _continue_0 = false -- 238
					repeat -- 238
						local item = keys[i] -- 238
						if not item then -- 239
							_continue_0 = true -- 239
							break -- 239
						end -- 239
						local amount = GAMEMODE.Stocks[item] -- 240
						local etab = self.cache[item] -- 241
						if not etab then -- 242
							etab = scripted_ents.Get(item) or weapons.Get(item) -- 243
							self.cache[item] = etab -- 244
						end -- 242
						local name = etab.PrintName -- 245
						local price = etab.Price or 10 -- 246
						local taxed = math.floor(price * (GetGlobalInt("tax_sales") / 100)) -- 247
						price = price + taxed -- 248
						local cost = tostring(price) .. " bones" -- 249
						if amount <= 0 then -- 250
							cost = "OUT OF STOCK" -- 251
						elseif CurTime() < self:GetCantPurchaseUntil() then -- 252
							cost = self:GetThanksText() -- 253
						end -- 250
						local txt = tostring(name) .. "<col=0,200,0> <col=0,200,200>(x" .. tostring(amount) .. ")\n<col=0,200,0>" .. tostring(cost) -- 254
						local txt_obj = scribe.Parse("<f=" .. tostring(font) .. "><ol=2>" .. tostring(txt)) -- 255
						txt_obj:Draw(24, y, 1, TEXT_ALIGN_LEFT) -- 256
						local txt_h -- 257
						txt_h = txt_obj:GetTall() -- 257
						local button_txt = "[ ]" -- 258
						if ui3d2d.isHovering(0, y, 24, txt_h) then -- 259
							if ui3d2d.isPressing() and team ~= TEAM_GHOST then -- 260
								button_txt = "[!]" -- 261
								if not pressed and amount > 0 then -- 262
									pressed = true -- 263
									net.Start("evilrp_purchase_stock") -- 264
									net.WriteEntity(self) -- 265
									net.WriteString(item) -- 266
									net.SendToServer() -- 267
								end -- 262
							else -- 269
								button_txt = "[X]" -- 269
							end -- 260
						end -- 259
						local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt)) -- 270
						button_txt_obj:Draw(0, y + 2, 1, TEXT_ALIGN_LEFT) -- 271
						y = y + txt_h -- 272
						_continue_0 = true -- 238
					until true -- 272
					if not _continue_0 then -- 272
						break -- 272
					end -- 272
				end -- 272
				local x = 0 -- 273
				if not (page < 1) then -- 275
					local button_txt = "[p]" -- 276
					if ui3d2d.isHovering(x, y, 24, txt_h) then -- 277
						button_txt = "[P]" -- 278
						if ui3d2d.isPressing() and team ~= TEAM_GHOST then -- 279
							if not pressed then -- 280
								pressed = true -- 281
								page = page - 1 -- 282
							end -- 280
						end -- 279
					end -- 277
					local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt)) -- 283
					button_txt_obj:Draw(x, y + 2, 1, TEXT_ALIGN_LEFT) -- 284
					local txt_w = button_txt_obj:GetWide() -- 285
					x = x + txt_w -- 286
				end -- 275
				if not (page >= pages) then -- 287
					local button_txt = "[n]" -- 288
					if ui3d2d.isHovering(x, y, 24, txt_h) then -- 289
						button_txt = "[N]" -- 290
						if ui3d2d.isPressing() and team ~= TEAM_GHOST then -- 291
							if not pressed then -- 292
								pressed = true -- 293
								page = page + 1 -- 294
							end -- 292
						end -- 291
					end -- 289
					local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt)) -- 295
					button_txt_obj:Draw(x, y + 2, 1, TEXT_ALIGN_LEFT) -- 296
				end -- 287
				x = 0 -- 297
				local wep = lp:GetActiveWeapon() -- 299
				if IsValid(wep) and string.find(wep:GetClass(), "evilrp_weapon/") then -- 300
					local button_txt = "[ammo:" .. tostring(self:GetKits()) .. "/<c=0,200,0>$" .. tostring(self:GetAmmoCost()) .. "</c>]" -- 301
					local txt_w = surface.GetTextSize(button_txt) -- 302
					y = y + txt_h -- 303
					if ui3d2d.isHovering(x, y, txt_w, txt_h) then -- 304
						button_txt = "[AMMO:" .. tostring(self:GetKits()) .. "/<c=0,200,0>$" .. tostring(self:GetAmmoCost()) .. "</c>]" -- 305
						if ui3d2d.isPressing() and team ~= TEAM_GHOST then -- 306
							if not pressed then -- 307
								pressed = true -- 308
								net.Start("evilrp_purchase_ammo") -- 309
								net.WriteEntity(self) -- 310
								net.SendToServer() -- 311
							end -- 307
						end -- 306
					end -- 304
					local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt)) -- 312
					button_txt_obj:Draw(x, y + 2, 1, TEXT_ALIGN_LEFT) -- 313
				end -- 300
			end -- 231
			if pressed and not ui3d2d.isPressing() then -- 314
				pressed = false -- 314
			end -- 314
			return ui3d2d.endDraw() -- 315
		end -- 142
	} -- 142
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 316
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 142
			_base_0[_key_0] = _val_0 -- 142
		end -- 142
	end -- 316
	if _base_0.__index == nil then -- 142
		_base_0.__index = _base_0 -- 142
	end -- 316
	setmetatable(_base_0, _parent_0.__base) -- 142
	_class_0 = setmetatable({ -- 142
		__init = function(self, ...) -- 142
			return _class_0.__parent.__init(self, ...) -- 142
		end, -- 142
		__base = _base_0, -- 142
		__name = "Autodealer", -- 142
		__parent = _parent_0 -- 142
	}, { -- 142
		__index = function(cls, name) -- 142
			local val = rawget(_base_0, name) -- 142
			if val == nil then -- 142
				local parent = rawget(cls, "__parent") -- 142
				if parent then -- 142
					return parent[name] -- 142
				end -- 142
			else -- 142
				return val -- 142
			end -- 142
		end, -- 142
		__call = function(cls, ...) -- 142
			local _self_0 = setmetatable({ }, _base_0) -- 142
			cls.__init(_self_0, ...) -- 142
			return _self_0 -- 142
		end -- 142
	}) -- 142
	_base_0.__class = _class_0 -- 142
	if _parent_0.__inherited then -- 142
		_parent_0.__inherited(_parent_0, _class_0) -- 142
	end -- 142
	Autodealer = _class_0 -- 142
	return _class_0 -- 316
end -- 316
