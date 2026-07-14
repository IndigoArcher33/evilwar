-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/autodealer/sh_autodealer.yue
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
		if ct < mach:GetCantPurchaseUntil() then -- 63
			return -- 63
		end -- 63
		mach:SetCantPurchaseUntil(ct + 3) -- 64
		local avail = GAMEMODE.Stocks[item] -- 65
		local weapon = false -- 66
		local etab = scripted_ents.Get(item) -- 67
		if not etab then -- 68
			etab = weapons.Get(item) -- 70
			weapon = true -- 71
		end -- 68
		local cost = etab.Price or 10 -- 72
		local taxed = math.floor(cost * (GetGlobalInt("tax_sales") / 100)) -- 73
		local money = ply:getDarkRPVar("money") -- 74
		if not avail then -- 75
			return -- 75
		end -- 75
		if avail < 1 then -- 76
			return -- 76
		end -- 76
		if money < cost then -- 77
			net.Start("evilrp_machine_fail") -- 78
			net.WriteString("You don't have enough money. Ha!") -- 79
			net.Send(ply) -- 80
			mach:EmitSound("Autodealer_Squeal_Bad") -- 81
			mach:SetThanksText(mach.HateTexts[math.random(1, #mach.HateTexts)]) -- 82
			ply:ConCommand("say /me grimaces.") -- 83
			ply:AddDespair(10) -- 84
			return -- 85
		end -- 77
		ply:ConCommand("say /me " .. tostring(mach.UseText[math.random(1, #mach.UseText)])) -- 86
		mach:SetThanksText(mach.ThanksTexts[math.random(1, #mach.ThanksTexts)]) -- 87
		mach:EmitSound("Autodealer_Squeal") -- 88
		ply:AddMoney(-cost, "Autocommerce") -- 89
		local _obj_0 = GAMEMODE.taxes_stored -- 90
		_obj_0.sales = _obj_0.sales + taxed -- 90
		local _obj_1 = GAMEMODE.Stocks -- 91
		_obj_1[item] = _obj_1[item] - 1 -- 91
		local product -- 92
		if weapon then -- 93
			product = ents.Create("evilrp/spawned/weapon") -- 94
			product:SetModel(etab.WorldModel) -- 96
			product:SetWeaponClass(item) -- 97
		else -- 99
			product = ents.Create(item) -- 99
		end -- 93
		local ent_pos = mach:GetPos() -- 100
		local tr = util.TraceLine({ -- 102
			endpos = ent_pos + (mach:GetForward() * 32) + (mach:GetUp() * 16) + (mach:GetRight() * 8), -- 102
			filter = ply, -- 103
			start = ply:EyePos(), -- 104
			mask = MASK_NPCWORLDSTATIC -- 105
		}) -- 101
		product:Spawn() -- 107
		product:Activate() -- 108
		product:SetAngles(Angle(90, 90, 90)) -- 109
		DarkRP.placeEntity(product, tr, ply) -- 110
		net.Start("evilrp_receive_stocks") -- 111
		net.WriteTable(GAMEMODE.Stocks) -- 112
		return net.Broadcast() -- 113
	end) -- 59
end -- 6
local Autodealer_Squeal -- 115
do -- 115
	local _class_0 -- 115
	local _parent_0 = SOUND -- 115
	local _base_0 = { -- 115
		sound = (function() -- 116
			local _accum_0 = { } -- 116
			local _len_0 = 1 -- 116
			for i = 1, 4 do -- 116
				_accum_0[_len_0] = "placenta/coinkeeper" .. tostring(i) .. ".wav" -- 116
				_len_0 = _len_0 + 1 -- 116
			end -- 116
			return _accum_0 -- 116
		end)(), -- 117
		level = SNDLVL_70DB -- 115
	} -- 115
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 117
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 115
			_base_0[_key_0] = _val_0 -- 115
		end -- 115
	end -- 117
	if _base_0.__index == nil then -- 115
		_base_0.__index = _base_0 -- 115
	end -- 117
	setmetatable(_base_0, _parent_0.__base) -- 115
	_class_0 = setmetatable({ -- 115
		__init = function(self, ...) -- 115
			return _class_0.__parent.__init(self, ...) -- 115
		end, -- 115
		__base = _base_0, -- 115
		__name = "Autodealer_Squeal", -- 115
		__parent = _parent_0 -- 115
	}, { -- 115
		__index = function(cls, name) -- 115
			local val = rawget(_base_0, name) -- 115
			if val == nil then -- 115
				local parent = rawget(cls, "__parent") -- 115
				if parent then -- 115
					return parent[name] -- 115
				end -- 115
			else -- 115
				return val -- 115
			end -- 115
		end, -- 115
		__call = function(cls, ...) -- 115
			local _self_0 = setmetatable({ }, _base_0) -- 115
			cls.__init(_self_0, ...) -- 115
			return _self_0 -- 115
		end -- 115
	}) -- 115
	_base_0.__class = _class_0 -- 115
	if _parent_0.__inherited then -- 115
		_parent_0.__inherited(_parent_0, _class_0) -- 115
	end -- 115
	Autodealer_Squeal = _class_0 -- 115
end -- 117
local Autodealer_Squeal_Bad -- 119
do -- 119
	local _class_0 -- 119
	local _parent_0 = Autodealer_Squeal -- 119
	local _base_0 = { -- 119
		pitch = { -- 120
			80, -- 120
			95 -- 120
		} -- 119
	} -- 119
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 120
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 119
			_base_0[_key_0] = _val_0 -- 119
		end -- 119
	end -- 120
	if _base_0.__index == nil then -- 119
		_base_0.__index = _base_0 -- 119
	end -- 120
	setmetatable(_base_0, _parent_0.__base) -- 119
	_class_0 = setmetatable({ -- 119
		__init = function(self, ...) -- 119
			return _class_0.__parent.__init(self, ...) -- 119
		end, -- 119
		__base = _base_0, -- 119
		__name = "Autodealer_Squeal_Bad", -- 119
		__parent = _parent_0 -- 119
	}, { -- 119
		__index = function(cls, name) -- 119
			local val = rawget(_base_0, name) -- 119
			if val == nil then -- 119
				local parent = rawget(cls, "__parent") -- 119
				if parent then -- 119
					return parent[name] -- 119
				end -- 119
			else -- 119
				return val -- 119
			end -- 119
		end, -- 119
		__call = function(cls, ...) -- 119
			local _self_0 = setmetatable({ }, _base_0) -- 119
			cls.__init(_self_0, ...) -- 119
			return _self_0 -- 119
		end -- 119
	}) -- 119
	_base_0.__class = _class_0 -- 119
	if _parent_0.__inherited then -- 119
		_parent_0.__inherited(_parent_0, _class_0) -- 119
	end -- 119
	Autodealer_Squeal_Bad = _class_0 -- 119
end -- 120
if CLIENT then -- 122
	local Spleen_Autodealer -- 123
	local _class_0 -- 123
	local _parent_0 = FONT -- 123
	local _base_0 = { -- 123
		font = "Spleen 6x12", -- 125
		size = 14 -- 123
	} -- 123
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 125
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 123
			_base_0[_key_0] = _val_0 -- 123
		end -- 123
	end -- 125
	if _base_0.__index == nil then -- 123
		_base_0.__index = _base_0 -- 123
	end -- 125
	setmetatable(_base_0, _parent_0.__base) -- 123
	_class_0 = setmetatable({ -- 123
		__init = function(self, ...) -- 123
			return _class_0.__parent.__init(self, ...) -- 123
		end, -- 123
		__base = _base_0, -- 123
		__name = "Spleen_Autodealer", -- 123
		__parent = _parent_0 -- 123
	}, { -- 123
		__index = function(cls, name) -- 123
			local val = rawget(_base_0, name) -- 123
			if val == nil then -- 123
				local parent = rawget(cls, "__parent") -- 123
				if parent then -- 123
					return parent[name] -- 123
				end -- 123
			else -- 123
				return val -- 123
			end -- 123
		end, -- 123
		__call = function(cls, ...) -- 123
			local _self_0 = setmetatable({ }, _base_0) -- 123
			cls.__init(_self_0, ...) -- 123
			return _self_0 -- 123
		end -- 123
	}) -- 123
	_base_0.__class = _class_0 -- 123
	if _parent_0.__inherited then -- 123
		_parent_0.__inherited(_parent_0, _class_0) -- 123
	end -- 123
	Spleen_Autodealer = _class_0 -- 123
end -- 122
local pressed = false -- 127
local Autodealer -- 129
local _class_0 -- 129
local _parent_0 = ENTITY -- 129
local _base_0 = { -- 129
	Base = "base_anim", -- 131
	Type = "anim", -- 132
	PrintName = "Autodealer", -- 133
	Spawnable = true, -- 134
	AdminSpawnable = true, -- 135
	Interesting = true, -- 137
	Pocketable = false, -- 139
	UseText = { -- 140
		"purchases something.", -- 140
		"exchanges money for goods and/or services.", -- 141
		"wastes bones on a capitalist device.", -- 142
		"buys something from a kapitalist kiosk.", -- 143
		"purchases a product.", -- 144
		"feeds money to a capitalist machine.", -- 145
		"performs a monetary exchange." -- 146
	}, -- 148
	SetupDataTables = function(self) -- 148
		self:NetworkVar("Float", "CantPurchaseUntil") -- 149
		self:NetworkVar("String", "ThanksText") -- 150
		return self:NetworkVar("Int", "Kits") -- 151
	end, -- 153
	ThanksTexts = { -- 154
		"Thanks", -- 154
		"Buy more stuff", -- 155
		"I love you", -- 156
		"Keep spending", -- 157
		"More bones now", -- 158
		"Give more bones", -- 159
		"Stay obedient", -- 160
		"Again please", -- 161
		"Please buy stuff", -- 162
		"It feels good", -- 163
		"Buy another" -- 164
	}, -- 166
	HateTexts = { -- 167
		"I hope you die", -- 167
		"How dare you?", -- 168
		"You are nothing", -- 169
		"I hate you", -- 170
		"You're a bad person", -- 171
		"Don't touch me", -- 172
		"Kill yourself", -- 173
		"Get a job", -- 174
		"Deadbeat", -- 175
		"Get away from me", -- 176
		"Go away freak" -- 177
	}, -- 179
	AmmoCost = 50, -- 180
	AmmoMax = 10, -- 182
	Initialize = function(self) -- 182
		if CLIENT then -- 183
			return -- 183
		end -- 183
		self:SetModel("models/props_combine/combine_smallmonitor001.mdl") -- 184
		self:PhysicsInit(SOLID_VPHYSICS) -- 185
		self:PhysWake() -- 186
		return self:GetPhysicsObject():EnableMotion(false) -- 187
	end, -- 189
	GetAmmoCost = function(self) -- 189
		return math.ceil(self.AmmoCost + (self.AmmoCost * (GetGlobalInt("tax_sales") / 100))) -- 189
	end, -- 191
	Think = function(self) -- 191
		if SERVER then -- 192
			local ct = CurTime() -- 193
			if not self.next_regen then -- 194
				self.next_regen = ct + 15 -- 194
			end -- 194
			if ct >= self.next_regen then -- 195
				self.next_regen = ct + 15 -- 196
				local kits = self:GetKits() -- 197
				if kits < self.AmmoMax then -- 198
					kits = kits + 1 -- 199
					self:SetKits(kits) -- 200
					return self:EmitSound("buttons/weapon_confirm.wav") -- 201
				end -- 198
			end -- 195
		end -- 192
	end, -- 203
	Draw = function(self) -- 203
		local team = lp:Team() -- 204
		self:DrawModel() -- 205
		local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 206
		if not (dist_sqr < 128 ^ 2) then -- 207
			return -- 207
		end -- 207
		self.cache = self.cache or { } -- 208
		if not ui3d2d.startDraw(self:LocalToWorld(pos), self:LocalToWorldAngles(ang), .1, self) then -- 209
			return -- 209
		end -- 209
		surface.SetMaterial(noise) -- 210
		surface.SetDrawColor(255, 255, 255, 255) -- 211
		surface.DrawTexturedRect(0, 0, 212, 150) -- 212
		local desp = (lp:GetDespair() * 0.01) -- 213
		local font = "Spleen_Autodealer" -- 214
		surface.SetFont(font) -- 215
		local _, txt_h = surface.GetTextSize("[!]") -- 216
		local y = 0 -- 217
		if GAMEMODE.Stocks then -- 218
			local keys = table.GetKeys(GAMEMODE.Stocks) -- 219
			local pages = math.floor(#keys / 3) -- 220
			page = math.min(page, pages) -- 221
			local start = 1 + (page * 3) -- 223
			for i = start, start + 2 do -- 224
				local _continue_0 = false -- 225
				repeat -- 225
					local item = keys[i] -- 225
					if not item then -- 226
						_continue_0 = true -- 226
						break -- 226
					end -- 226
					local amount = GAMEMODE.Stocks[item] -- 227
					local etab = self.cache[item] -- 228
					if not etab then -- 229
						etab = scripted_ents.Get(item) or weapons.Get(item) -- 230
						self.cache[item] = etab -- 231
					end -- 229
					local name = etab.PrintName -- 232
					local price = etab.Price or 10 -- 233
					local taxed = math.floor(price * (GetGlobalInt("tax_sales") / 100)) -- 234
					price = price + taxed -- 235
					local cost = tostring(price) .. " bones" -- 236
					if amount <= 0 then -- 237
						cost = "OUT OF STOCK" -- 238
					elseif CurTime() < self:GetCantPurchaseUntil() then -- 239
						cost = self:GetThanksText() -- 240
					end -- 237
					local txt = tostring(name) .. "<col=0,200,0> <col=0,200,200>(x" .. tostring(amount) .. ")\n<col=0,200,0>" .. tostring(cost) -- 241
					local txt_obj = scribe.Parse("<f=" .. tostring(font) .. "><ol=2>" .. tostring(txt)) -- 242
					txt_obj:Draw(24, y, 1, TEXT_ALIGN_LEFT) -- 243
					local txt_h -- 244
					txt_h = txt_obj:GetTall() -- 244
					local button_txt = "[ ]" -- 245
					if ui3d2d.isHovering(0, y, 24, txt_h) then -- 246
						if ui3d2d.isPressing() and team ~= TEAM_GHOST then -- 247
							button_txt = "[!]" -- 248
							if not pressed and amount > 0 then -- 249
								pressed = true -- 250
								net.Start("evilrp_purchase_stock") -- 251
								net.WriteEntity(self) -- 252
								net.WriteString(item) -- 253
								net.SendToServer() -- 254
							end -- 249
						else -- 256
							button_txt = "[X]" -- 256
						end -- 247
					end -- 246
					local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt)) -- 257
					button_txt_obj:Draw(0, y + 2, 1, TEXT_ALIGN_LEFT) -- 258
					y = y + txt_h -- 259
					_continue_0 = true -- 225
				until true -- 259
				if not _continue_0 then -- 259
					break -- 259
				end -- 259
			end -- 259
			local x = 0 -- 260
			if not (page < 1) then -- 262
				local button_txt = "[p]" -- 263
				if ui3d2d.isHovering(x, y, 24, txt_h) then -- 264
					button_txt = "[P]" -- 265
					if ui3d2d.isPressing() and team ~= TEAM_GHOST then -- 266
						if not pressed then -- 267
							pressed = true -- 268
							page = page - 1 -- 269
						end -- 267
					end -- 266
				end -- 264
				local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt)) -- 270
				button_txt_obj:Draw(x, y + 2, 1, TEXT_ALIGN_LEFT) -- 271
				local txt_w = button_txt_obj:GetWide() -- 272
				x = x + txt_w -- 273
			end -- 262
			if not (page >= pages) then -- 274
				local button_txt = "[n]" -- 275
				if ui3d2d.isHovering(x, y, 24, txt_h) then -- 276
					button_txt = "[N]" -- 277
					if ui3d2d.isPressing() and team ~= TEAM_GHOST then -- 278
						if not pressed then -- 279
							pressed = true -- 280
							page = page + 1 -- 281
						end -- 279
					end -- 278
				end -- 276
				local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt)) -- 282
				button_txt_obj:Draw(x, y + 2, 1, TEXT_ALIGN_LEFT) -- 283
			end -- 274
			x = 0 -- 284
			local wep = lp:GetActiveWeapon() -- 286
			if IsValid(wep) and string.find(wep:GetClass(), "evilrp_weapon/") then -- 287
				local button_txt = "[ammo:" .. tostring(self:GetKits()) .. "/<c=0,200,0>$" .. tostring(self:GetAmmoCost()) .. "</c>]" -- 288
				local txt_w = surface.GetTextSize(button_txt) -- 289
				y = y + txt_h -- 290
				if ui3d2d.isHovering(x, y, txt_w, txt_h) then -- 291
					button_txt = "[AMMO:" .. tostring(self:GetKits()) .. "/<c=0,200,0>$" .. tostring(self:GetAmmoCost()) .. "</c>]" -- 292
					if ui3d2d.isPressing() and team ~= TEAM_GHOST then -- 293
						if not pressed then -- 294
							pressed = true -- 295
							net.Start("evilrp_purchase_ammo") -- 296
							net.WriteEntity(self) -- 297
							net.SendToServer() -- 298
						end -- 294
					end -- 293
				end -- 291
				local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt)) -- 299
				button_txt_obj:Draw(x, y + 2, 1, TEXT_ALIGN_LEFT) -- 300
			end -- 287
		end -- 218
		if pressed and not ui3d2d.isPressing() then -- 301
			pressed = false -- 301
		end -- 301
		return ui3d2d.endDraw() -- 302
	end -- 129
} -- 129
for _key_0, _val_0 in pairs(_parent_0.__base) do -- 303
	if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 129
		_base_0[_key_0] = _val_0 -- 129
	end -- 129
end -- 303
if _base_0.__index == nil then -- 129
	_base_0.__index = _base_0 -- 129
end -- 303
setmetatable(_base_0, _parent_0.__base) -- 129
_class_0 = setmetatable({ -- 129
	__init = function(self, ...) -- 129
		return _class_0.__parent.__init(self, ...) -- 129
	end, -- 129
	__base = _base_0, -- 129
	__name = "Autodealer", -- 129
	__parent = _parent_0 -- 129
}, { -- 129
	__index = function(cls, name) -- 129
		local val = rawget(_base_0, name) -- 129
		if val == nil then -- 129
			local parent = rawget(cls, "__parent") -- 129
			if parent then -- 129
				return parent[name] -- 129
			end -- 129
		else -- 129
			return val -- 129
		end -- 129
	end, -- 129
	__call = function(cls, ...) -- 129
		local _self_0 = setmetatable({ }, _base_0) -- 129
		cls.__init(_self_0, ...) -- 129
		return _self_0 -- 129
	end -- 129
}) -- 129
_base_0.__class = _class_0 -- 129
if _parent_0.__inherited then -- 129
	_parent_0.__inherited(_parent_0, _class_0) -- 129
end -- 129
Autodealer = _class_0 -- 129
return _class_0 -- 303
