local pos = Vector(13.5, -9, 19)
local ang = Angle(0, 90, 90)
local noise = Material("effects/tvscreen_noise001a")
local page = 0
if CLIENT then
	net.Receive("evilrp_receive_stocks", function()
		local stocks = net.ReadTable()
		GAMEMODE.Stocks = stocks
	end)
elseif SERVER then
	util.AddNetworkString("evilrp_receive_stocks")
	util.AddNetworkString("evilrp_purchase_stock")
	util.AddNetworkString("evilrp_purchase_ammo")
	net.Receive("evilrp_purchase_ammo", function(len, ply)
		local mach = net.ReadEntity()
		if not (mach and IsValid(mach) and mach:GetKits() > 0) then
			return
		end
		local wep = ply:GetActiveWeapon()
		if not IsValid(wep) then
			return
		end
		if not string.find(wep:GetClass(), "evilrp_weapon/") then
			return
		end
		local mag_max = wep.Primary.ClipSize * 4
		local ammo = wep:Ammo1()
		if ammo >= mag_max then
			ply:Notify("<c=200,0,0>You're full.")
			ply:EmitSound("buttons/weapon_cant_buy.wav")
			return
		end
		local ct = CurTime()
		if ct < mach:GetCantPurchaseUntil() then
			return
		end
		mach:SetCantPurchaseUntil(ct + 3)
		local avail = mach:GetKits()
		local cost = mach:GetAmmoCost()
		local taxed = math.floor(cost - mach.AmmoCost)
		local money = ply:getDarkRPVar("money")
		if not avail then
			return
		end
		if avail < 1 then
			return
		end
		if money < cost then
			net.Start("evilrp_machine_fail")
			net.WriteString("You don't have enough money. Ha!")
			net.Send(ply)
			mach:EmitSound("Autodealer_Squeal_Bad")
			mach:SetThanksText(mach.HateTexts[math.random(1, #mach.HateTexts)])
			ply:ConCommand("say /me grimaces.")
			ply:AddDespair(10)
			return
		end
		ply:ConCommand("say /me " .. tostring(mach.UseText[math.random(1, #mach.UseText)]))
		mach:SetThanksText(mach.ThanksTexts[math.random(1, #mach.ThanksTexts)])
		mach:EmitSound("Autodealer_Squeal")
		ply:AddMoney(-cost, "Autocommerce")
		local _obj_0 = GAMEMODE.taxes_stored
		_obj_0.sales = _obj_0.sales + taxed
		mach:SetKits(math.max(0, avail - 1))
		ply:EmitSound("buttons/weapon_confirm.wav")
		local amt = wep.Primary.ClipSize
		if ((ammo + amt) > mag_max) then
			local rem = ammo + amt
			rem = rem - mag_max
			amt = amt - rem
		end
		return ply:GiveAmmo(amt, wep.Primary.Ammo)
	end)
	net.Receive("evilrp_purchase_stock", function(len, ply)
		local ct = CurTime()
		local mach = net.ReadEntity()
		local item = net.ReadString()
		if ct < mach:GetCantPurchaseUntil() then
			return
		end
		mach:SetCantPurchaseUntil(ct + 3)
		local avail = GAMEMODE.Stocks[item]
		local weapon = false
		local etab = scripted_ents.Get(item)
		if not etab then
			etab = weapons.Get(item)
			weapon = true
		end
		local cost = etab.Price or 10
		local taxed = math.floor(cost * (GetGlobalInt("tax_sales") / 100))
		local money = ply:getDarkRPVar("money")
		if not avail then
			return
		end
		if avail < 1 then
			return
		end
		if money < cost then
			net.Start("evilrp_machine_fail")
			net.WriteString("You don't have enough money. Ha!")
			net.Send(ply)
			mach:EmitSound("Autodealer_Squeal_Bad")
			mach:SetThanksText(mach.HateTexts[math.random(1, #mach.HateTexts)])
			ply:ConCommand("say /me grimaces.")
			ply:AddDespair(10)
			return
		end
		ply:ConCommand("say /me " .. tostring(mach.UseText[math.random(1, #mach.UseText)]))
		mach:SetThanksText(mach.ThanksTexts[math.random(1, #mach.ThanksTexts)])
		mach:EmitSound("Autodealer_Squeal")
		ply:AddMoney(-cost, "Autocommerce")
		local _obj_0 = GAMEMODE.taxes_stored
		_obj_0.sales = _obj_0.sales + taxed
		local _obj_1 = GAMEMODE.Stocks
		_obj_1[item] = _obj_1[item] - 1
		local product
		if weapon then
			product = ents.Create("evilrp/spawned/weapon")
			product:SetModel(etab.WorldModel)
			product:SetWeaponClass(item)
		else
			product = ents.Create(item)
		end
		local ent_pos = mach:GetPos()
		local tr = util.TraceLine({
			endpos = ent_pos + (mach:GetForward() * 32) + (mach:GetUp() * 16) + (mach:GetRight() * 8),
			filter = ply,
			start = ply:EyePos(),
			mask = MASK_NPCWORLDSTATIC
		})
		product:Spawn()
		product:Activate()
		product:SetAngles(Angle(90, 90, 90))
		DarkRP.placeEntity(product, tr, ply)
		net.Start("evilrp_receive_stocks")
		net.WriteTable(GAMEMODE.Stocks)
		return net.Broadcast()
	end)
end
local Autodealer_Squeal
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 4 do
				_accum_0[_len_0] = "placenta/coinkeeper" .. tostring(i) .. ".wav"
				_len_0 = _len_0 + 1
			end
			return _accum_0
		end)(),
		level = SNDLVL_70DB
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Autodealer_Squeal",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Autodealer_Squeal = _class_0
end
local Autodealer_Squeal_Bad
do
	local _class_0
	local _parent_0 = Autodealer_Squeal
	local _base_0 = {
		pitch = {
			80,
			95
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Autodealer_Squeal_Bad",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Autodealer_Squeal_Bad = _class_0
end
if CLIENT then
	local Spleen_Autodealer
	do
		local _class_0
		local _parent_0 = FONT
		local _base_0 = {
			font = "Spleen 6x12",
			size = 14
		}
		for _key_0, _val_0 in pairs(_parent_0.__base) do
			if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
				_base_0[_key_0] = _val_0
			end
		end
		if _base_0.__index == nil then
			_base_0.__index = _base_0
		end
		setmetatable(_base_0, _parent_0.__base)
		_class_0 = setmetatable({
			__init = function(self, ...)
				return _class_0.__parent.__init(self, ...)
			end,
			__base = _base_0,
			__name = "Spleen_Autodealer",
			__parent = _parent_0
		}, {
			__index = function(cls, name)
				local val = rawget(_base_0, name)
				if val == nil then
					local parent = rawget(cls, "__parent")
					if parent then
						return parent[name]
					end
				else
					return val
				end
			end,
			__call = function(cls, ...)
				local _self_0 = setmetatable({ }, _base_0)
				cls.__init(_self_0, ...)
				return _self_0
			end
		})
		_base_0.__class = _class_0
		if _parent_0.__inherited then
			_parent_0.__inherited(_parent_0, _class_0)
		end
		Spleen_Autodealer = _class_0
	end
end
local pressed = false
local Autodealer
do
	local _class_0
	local _parent_0 = ENTITY
	local _base_0 = {
		Base = "base_anim",
		Type = "anim",
		PrintName = "Autodealer",
		Spawnable = true,
		AdminSpawnable = true,
		Interesting = true,
		Pocketable = false,
		UseText = {
			"purchases something.",
			"exchanges money for goods and/or services.",
			"wastes bones on a capitalist device.",
			"buys something from a kapitalist kiosk.",
			"purchases a product.",
			"feeds money to a capitalist machine.",
			"performs a monetary exchange."
		},
		SetupDataTables = function(self)
			self:NetworkVar("Float", "CantPurchaseUntil")
			self:NetworkVar("String", "ThanksText")
			return self:NetworkVar("Int", "Kits")
		end,
		ThanksTexts = {
			"Thanks",
			"Buy more stuff",
			"I love you",
			"Keep spending",
			"More bones now",
			"Give more bones",
			"Stay obedient",
			"Again please",
			"Please buy stuff",
			"It feels good",
			"Buy another"
		},
		HateTexts = {
			"I hope you die",
			"How dare you?",
			"You are nothing",
			"I hate you",
			"You're a bad person",
			"Don't touch me",
			"Kill yourself",
			"Get a job",
			"Deadbeat",
			"Get away from me",
			"Go away freak"
		},
		AmmoCost = 50,
		AmmoMax = 10,
		Initialize = function(self)
			if CLIENT then
				return
			end
			self:SetModel("models/props_combine/combine_smallmonitor001.mdl")
			self:PhysicsInit(SOLID_VPHYSICS)
			self:PhysWake()
			return self:GetPhysicsObject():EnableMotion(false)
		end,
		GetAmmoCost = function(self)
			return math.ceil(self.AmmoCost + (self.AmmoCost * (GetGlobalInt("tax_sales") / 100)))
		end,
		Think = function(self)
			if SERVER then
				local ct = CurTime()
				if not self.next_regen then
					self.next_regen = ct + 15
				end
				if ct >= self.next_regen then
					self.next_regen = ct + 15
					local kits = self:GetKits()
					if kits < self.AmmoMax then
						kits = kits + 1
						self:SetKits(kits)
						return self:EmitSound("buttons/weapon_confirm.wav")
					end
				end
			end
		end,
		Draw = function(self)
			local team = lp:Team()
			self:DrawModel()
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos())
			if not (dist_sqr < 128 ^ 2) then
				return
			end
			self.cache = self.cache or { }
			if not ui3d2d.startDraw(self:LocalToWorld(pos), self:LocalToWorldAngles(ang), .1, self) then
				return
			end
			surface.SetMaterial(noise)
			surface.SetDrawColor(255, 255, 255, 255)
			surface.DrawTexturedRect(0, 0, 212, 150)
			local desp = (lp:GetDespair() * 0.01)
			local font = "Spleen_Autodealer"
			surface.SetFont(font)
			local _, txt_h = surface.GetTextSize("[!]")
			local y = 0
			if GAMEMODE.Stocks then
				local keys = table.GetKeys(GAMEMODE.Stocks)
				local pages = math.floor(#keys / 3)
				page = math.min(page, pages)
				local start = 1 + (page * 3)
				for i = start, start + 2 do
					local item = keys[i]
					if not item then
						goto _continue_0
					end
					local amount = GAMEMODE.Stocks[item]
					local etab = self.cache[item]
					if not etab then
						etab = scripted_ents.Get(item) or weapons.Get(item)
						self.cache[item] = etab
					end
					local name = etab.PrintName
					local price = etab.Price or 10
					local taxed = math.floor(price * (GetGlobalInt("tax_sales") / 100))
					price = price + taxed
					local cost = tostring(price) .. " bones"
					if amount <= 0 then
						cost = "OUT OF STOCK"
					elseif CurTime() < self:GetCantPurchaseUntil() then
						cost = self:GetThanksText()
					end
					local txt = tostring(name) .. "<col=0,200,0> <col=0,200,200>(x" .. tostring(amount) .. ")\n<col=0,200,0>" .. tostring(cost)
					local txt_obj = scribe.Parse("<f=" .. tostring(font) .. "><ol=2>" .. tostring(txt))
					txt_obj:Draw(24, y, 1, TEXT_ALIGN_LEFT)
					local txt_h
					txt_h = txt_obj:GetTall()
					local button_txt = "[ ]"
					if ui3d2d.isHovering(0, y, 24, txt_h) then
						if ui3d2d.isPressing() and team ~= TEAM_GHOST then
							button_txt = "[!]"
							if not pressed and amount > 0 then
								pressed = true
								net.Start("evilrp_purchase_stock")
								net.WriteEntity(self)
								net.WriteString(item)
								net.SendToServer()
							end
						else
							button_txt = "[X]"
						end
					end
					local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt))
					button_txt_obj:Draw(0, y + 2, 1, TEXT_ALIGN_LEFT)
					y = y + txt_h
					::_continue_0::
				end
				local x = 0
				if not (page < 1) then
					local button_txt = "[p]"
					if ui3d2d.isHovering(x, y, 24, txt_h) then
						button_txt = "[P]"
						if ui3d2d.isPressing() and team ~= TEAM_GHOST then
							if not pressed then
								pressed = true
								page = page - 1
							end
						end
					end
					local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt))
					button_txt_obj:Draw(x, y + 2, 1, TEXT_ALIGN_LEFT)
					local txt_w = button_txt_obj:GetWide()
					x = x + txt_w
				end
				if not (page >= pages) then
					local button_txt = "[n]"
					if ui3d2d.isHovering(x, y, 24, txt_h) then
						button_txt = "[N]"
						if ui3d2d.isPressing() and team ~= TEAM_GHOST then
							if not pressed then
								pressed = true
								page = page + 1
							end
						end
					end
					local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt))
					button_txt_obj:Draw(x, y + 2, 1, TEXT_ALIGN_LEFT)
				end
				x = 0
				local wep = lp:GetActiveWeapon()
				if IsValid(wep) and string.find(wep:GetClass(), "evilrp_weapon/") then
					local button_txt = "[ammo:" .. tostring(self:GetKits()) .. "/<c=0,200,0>$" .. tostring(self:GetAmmoCost()) .. "</c>]"
					local txt_w = surface.GetTextSize(button_txt)
					y = y + txt_h
					if ui3d2d.isHovering(x, y, txt_w, txt_h) then
						button_txt = "[AMMO:" .. tostring(self:GetKits()) .. "/<c=0,200,0>$" .. tostring(self:GetAmmoCost()) .. "</c>]"
						if ui3d2d.isPressing() and team ~= TEAM_GHOST then
							if not pressed then
								pressed = true
								net.Start("evilrp_purchase_ammo")
								net.WriteEntity(self)
								net.SendToServer()
							end
						end
					end
					local button_txt_obj = scribe.Parse("<f=" .. tostring(font) .. ">" .. tostring(button_txt))
					button_txt_obj:Draw(x, y + 2, 1, TEXT_ALIGN_LEFT)
				end
			end
			if pressed and not ui3d2d.isPressing() then
				pressed = false
			end
			return ui3d2d.endDraw()
		end
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Autodealer",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Autodealer = _class_0
	return _class_0
end
