-- [yue]: darkrp_modules\business\sh_sellable.yue
local Purchase -- 1
do -- 1
	local _class_0 -- 1
	local _parent_0 = SOUND -- 1
	local _base_0 = { -- 1
		sound = (function() -- 2
			local _accum_0 = { } -- 2
			local _len_0 = 1 -- 2
			for i = 1, 3 do -- 2
				_accum_0[_len_0] = "dysphoria/weapons/wield_gun" .. tostring(i) .. ".ogg" -- 2
				_len_0 = _len_0 + 1 -- 2
			end -- 2
			return _accum_0 -- 2
		end)() -- 1
	} -- 1
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 2
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 1
			_base_0[_key_0] = _val_0 -- 1
		end -- 1
	end -- 2
	if _base_0.__index == nil then -- 1
		_base_0.__index = _base_0 -- 1
	end -- 2
	setmetatable(_base_0, _parent_0.__base) -- 1
	_class_0 = setmetatable({ -- 1
		__init = function(self, ...) -- 1
			return _class_0.__parent.__init(self, ...) -- 1
		end, -- 1
		__base = _base_0, -- 1
		__name = "Purchase", -- 1
		__parent = _parent_0 -- 1
	}, { -- 1
		__index = function(cls, name) -- 1
			local val = rawget(_base_0, name) -- 1
			if val == nil then -- 1
				local parent = rawget(cls, "__parent") -- 1
				if parent then -- 1
					return parent[name] -- 1
				end -- 1
			else -- 1
				return val -- 1
			end -- 1
		end, -- 1
		__call = function(cls, ...) -- 1
			local _self_0 = setmetatable({ }, _base_0) -- 1
			cls.__init(_self_0, ...) -- 1
			return _self_0 -- 1
		end -- 1
	}) -- 1
	_base_0.__class = _class_0 -- 1
	if _parent_0.__inherited then -- 1
		_parent_0.__inherited(_parent_0, _class_0) -- 1
	end -- 1
	Purchase = _class_0 -- 1
end -- 2
local Sellable -- 4
do -- 4
	local _class_0 -- 4
	local _parent_0 = ITEM -- 4
	local _base_0 = { -- 4
		PrintName = "Sellable", -- 7
		IsSellable = true, -- 8
		Spawnable = false, -- 9
		Interesting = true, -- 10
		Pocketable = false, -- 12
		ImpactSound = { -- 13
			soft = "weapon.ImpactSoft", -- 13
			hard = "weapon.ImpactHard" -- 14
		}, -- 16
		SetupDataTables = function(self) -- 16
			_class_0.__parent.__base.SetupDataTables(self) -- 17
			self:NetworkVar("String", "ItemClass") -- 18
			self:NetworkVar("Int", "Price") -- 19
			return self:NetworkVar("Entity", "Seller") -- 20
		end, -- 21
		Draw = function(self) -- 21
			local ret = hook.Call("onDrawSpawnedWeapon", nil, self) -- 22
			if ret ~= nil then -- 23
				return -- 23
			end -- 23
			return self:DrawModel() -- 24
		end, -- 29
		PMRender = function(item) -- 29
			local ct = { } -- 30
			if item.itemcls then -- 31
				local etab = scripted_ents.Get(item.itemcls) -- 32
				ct[#ct + 1] = etab.PrintName -- 33
				if etab.Description then -- 34
					ct[#ct + 1] = "" -- 35
				end -- 34
				ct[#ct + 1] = { -- 36
					text = etab.Description, -- 36
					font = "Spleen_Label_Small" -- 36
				} -- 36
				return ct -- 37
			end -- 31
		end, -- 39
		HUDRender = function(self) -- 39
			local ct = { } -- 40
			local etab = scripted_ents.Get(self:GetItemClass()) -- 41
			ct[#ct + 1] = etab.PrintName -- 42
			if etab.Description then -- 43
				ct[#ct + 1] = "" -- 44
				ct[#ct + 1] = { -- 45
					text = etab.Description, -- 45
					font = "Spleen_Label_Small" -- 45
				} -- 45
				ct[#ct + 1] = { -- 46
					text = "You can buy this from " .. tostring(self:GetSeller():Name()) .. " for " .. self:GetPrice() .. " bones", -- 46
					font = "Spleen_Label_Small" -- 46
				} -- 46
			end -- 43
			return ct -- 47
		end, -- 49
		Sound = "Equip_Weapon", -- 51
		Initialize = function(self) -- 51
			if SERVER then -- 52
				DarkRP.ValidatedPhysicsInit(self, SOLID_VPHYSICS, "The issue lies with item \"" .. tostring(self:GetItemClass() or 'unknown') .. "\"") -- 53
				self:SetMoveType(MOVETYPE_VPHYSICS) -- 54
				self:SetSolid(SOLID_VPHYSICS) -- 55
				return self:PhysWake() -- 56
			end -- 52
		end, -- 58
		OnTakeDamage = function(self, dmg) -- 58
			return self:TakePhysicsDamage(dmg) -- 58
		end, -- 62
		OnUseFinish = function(self, ply) -- 62
			_class_0.__parent.__base.OnUseFinish(self, ply) -- 63
			local cls = self:GetItemClass() -- 64
			local item = scripted_ents.Get(cls) -- 65
			if not item then -- 66
				return -- 67
			end -- 66
			local seller = self:GetSeller() -- 69
			if not (IsValid(seller) and seller:IsPlayer()) then -- 70
				return -- 71
			end -- 70
			local money = ply:getDarkRPVar("money") -- 73
			local price = self:GetPrice() -- 74
			if ply == seller then -- 75
				ply:Notify("<c=200,0,0>Did you just.. buy your own item?") -- 76
			else -- 78
				if money < price then -- 78
					ply:Notify("<c=200,0,0>Hah, you can't afford it!") -- 79
					ply:ConCommand("say /me grimaces.") -- 80
					ply:AddDespair(10) -- 81
					return -- 82
				end -- 78
				seller:AddMoney(price, "Commerce") -- 83
				ply:AddMoney(-price, "Commerce") -- 84
			end -- 75
			item = ents.Create(cls) -- 87
			item:SetPos(self:GetPos()) -- 89
			item:SetAngles(self:GetAngles()) -- 90
			item:Spawn() -- 91
			item:Activate() -- 92
			if not item then -- 93
				return -- 94
			end -- 93
			ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_GIVE) -- 99
			if SERVER then -- 100
				ply:EmitSound("Pocket_Item") -- 101
				ply:addPocketItem(item) -- 102
			end -- 100
			return self:Remove() -- 103
		end -- 4
	} -- 4
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 104
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 4
			_base_0[_key_0] = _val_0 -- 4
		end -- 4
	end -- 104
	if _base_0.__index == nil then -- 4
		_base_0.__index = _base_0 -- 4
	end -- 104
	setmetatable(_base_0, _parent_0.__base) -- 4
	_class_0 = setmetatable({ -- 4
		__init = function(self, ...) -- 4
			return _class_0.__parent.__init(self, ...) -- 4
		end, -- 4
		__base = _base_0, -- 4
		__name = "Sellable", -- 4
		__parent = _parent_0 -- 4
	}, { -- 4
		__index = function(cls, name) -- 4
			local val = rawget(_base_0, name) -- 4
			if val == nil then -- 4
				local parent = rawget(cls, "__parent") -- 4
				if parent then -- 4
					return parent[name] -- 4
				end -- 4
			else -- 4
				return val -- 4
			end -- 4
		end, -- 4
		__call = function(cls, ...) -- 4
			local _self_0 = setmetatable({ }, _base_0) -- 4
			cls.__init(_self_0, ...) -- 4
			return _self_0 -- 4
		end -- 4
	}) -- 4
	_base_0.__class = _class_0 -- 4
	local self = _class_0; -- 4
	self.__entity = "evilrp/spawned/sellable" -- 5
	if _parent_0.__inherited then -- 4
		_parent_0.__inherited(_parent_0, _class_0) -- 4
	end -- 4
	Sellable = _class_0 -- 4
end -- 104
if SERVER then -- 105
	local block_types = { -- 106
		"Physgun1", -- 106
		"Spawning1", -- 106
		"Toolgun1" -- 106
	} -- 106
	FPP.AddDefaultBlocked(block_types, "evilrp/spawned/weapon") -- 107
end -- 105
local GiveMoney -- 109
do -- 109
	local _class_0 -- 109
	local _parent_0 = SOUND -- 109
	local _base_0 = { -- 109
		sound = "ambient/levels/labs/coinslot1.wav" -- 109
	} -- 109
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 110
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 109
			_base_0[_key_0] = _val_0 -- 109
		end -- 109
	end -- 110
	if _base_0.__index == nil then -- 109
		_base_0.__index = _base_0 -- 109
	end -- 110
	setmetatable(_base_0, _parent_0.__base) -- 109
	_class_0 = setmetatable({ -- 109
		__init = function(self, ...) -- 109
			return _class_0.__parent.__init(self, ...) -- 109
		end, -- 109
		__base = _base_0, -- 109
		__name = "GiveMoney", -- 109
		__parent = _parent_0 -- 109
	}, { -- 109
		__index = function(cls, name) -- 109
			local val = rawget(_base_0, name) -- 109
			if val == nil then -- 109
				local parent = rawget(cls, "__parent") -- 109
				if parent then -- 109
					return parent[name] -- 109
				end -- 109
			else -- 109
				return val -- 109
			end -- 109
		end, -- 109
		__call = function(cls, ...) -- 109
			local _self_0 = setmetatable({ }, _base_0) -- 109
			cls.__init(_self_0, ...) -- 109
			return _self_0 -- 109
		end -- 109
	}) -- 109
	_base_0.__class = _class_0 -- 109
	if _parent_0.__inherited then -- 109
		_parent_0.__inherited(_parent_0, _class_0) -- 109
	end -- 109
	GiveMoney = _class_0 -- 109
end -- 110
if SERVER then -- 112
	netstream.Hook("BeginSelling", function(ply) -- 113
		local paying = ply:GetNWBool("evilrp_selling") -- 114
		if not (paying or ply.cant_pay) then -- 115
			ply:Notify("Scroll to the desired price.") -- 116
			ply:Notify("Left click an item to set its price.") -- 117
			return ply:SetNWBool("evilrp_selling", true) -- 118
		end -- 115
	end) -- 113
	return netstream.Hook("SpawnSellable", function(ply, amount) -- 119
		if not amount then -- 120
			ply:Notify("Nevermind.") -- 121
			return -- 122
		end -- 120
		if not ply:GetNWBool("evilrp_selling") then -- 123
			return -- 123
		end -- 123
		if ply:Team() == TEAM_GHOST then -- 124
			return -- 124
		end -- 124
		if not ply:Alive() then -- 125
			return -- 125
		end -- 125
		if amount < 1 then -- 126
			return -- 126
		end -- 126
		local wep = ply:GetActiveWeapon() -- 127
		ply:SetNWBool("evilrp_selling", false) -- 128
		local tr = GAMEMODE:GetHandTrace(ply, 80) -- 129
		if tr.Entity and IsValid(tr.Entity) and not tr.Entity.IsSellable and tr.Entity.CanSell then -- 130
			local item = tr.Entity -- 131
			ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_GIVE) -- 132
			ply:EmitSound("GiveMoney") -- 133
			ply:SendChat("GENERIC", "<c=0,200,0>Put " .. tostring(item.PrintName) .. " for sale.") -- 134
			local ent = ents.Create("evilrp/spawned/sellable") -- 135
			ent:SetPos(item:GetPos()) -- 137
			ent:SetAngles(item:GetAngles()) -- 138
			ent:SetItemClass(item:GetClass()) -- 139
			ent:SetModel(item:GetModel()) -- 140
			ent:SetPrice(amount) -- 141
			ent:SetSeller(ply) -- 142
			ent:CPPISetOwner(ply) -- 143
			ent:Spawn() -- 144
			item:Remove() -- 145
		else -- 147
			ply:Notify("<c=200,0,0>Choose a valid item to sell.") -- 147
		end -- 130
		ply.cant_pay = true -- 148
		return timer.Simple(1, function() -- 149
			if not IsValid(ply) then -- 150
				return -- 150
			end -- 150
			ply.cant_pay = false -- 151
		end) -- 151
	end) -- 151
else -- 153
	local sell_item -- 153
	sell_item = function(ply, bind, pressed) -- 153
		bind = bind:lower() -- 154
		if not pressed then -- 155
			return -- 155
		end -- 155
		if not ply:GetNWBool("evilrp_selling") then -- 156
			return -- 156
		end -- 156
		if not bind:find("+attack") then -- 157
			return -- 157
		end -- 157
		return netstream.Send("SpawnSellable", ply.sellable_price) -- 158
	end -- 153
	return hook.Add("PlayerBindPress", "evilrp_selling", sell_item) -- 159
end -- 112
