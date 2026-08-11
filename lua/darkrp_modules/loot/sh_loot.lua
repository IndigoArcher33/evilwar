-- [yue]: darkrp_modules\loot\sh_loot.yue
local FoodRot -- 1
do -- 1
	local _class_0 -- 1
	local _parent_0 = SOUND -- 1
	local _base_0 = { -- 1
		sound = (function() -- 2
			local _accum_0 = { } -- 2
			local _len_0 = 1 -- 2
			for i = 1, 3 do -- 2
				_accum_0[_len_0] = "weapons/bugbait/bugbait_squeeze" .. tostring(i) .. ".wav" -- 2
				_len_0 = _len_0 + 1 -- 2
			end -- 2
			return _accum_0 -- 2
		end)(), -- 3
		level = SNDLVL_50dB -- 1
	} -- 1
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 3
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 1
			_base_0[_key_0] = _val_0 -- 1
		end -- 1
	end -- 3
	if _base_0.__index == nil then -- 1
		_base_0.__index = _base_0 -- 1
	end -- 3
	setmetatable(_base_0, _parent_0.__base) -- 1
	_class_0 = setmetatable({ -- 1
		__init = function(self, ...) -- 1
			return _class_0.__parent.__init(self, ...) -- 1
		end, -- 1
		__base = _base_0, -- 1
		__name = "FoodRot", -- 1
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
	FoodRot = _class_0 -- 1
end -- 3
local LootSound -- 5
do -- 5
	local _class_0 -- 5
	local _parent_0 = SOUND -- 5
	local _base_0 = { -- 5
		sound = (function() -- 6
			local _accum_0 = { } -- 6
			local _len_0 = 1 -- 6
			for i = 1, 4 do -- 6
				_accum_0[_len_0] = "npc/barnacle/barnacle_pull" .. tostring(i) .. ".wav" -- 6
				_len_0 = _len_0 + 1 -- 6
			end -- 6
			return _accum_0 -- 6
		end)() -- 5
	} -- 5
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 6
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 5
			_base_0[_key_0] = _val_0 -- 5
		end -- 5
	end -- 6
	if _base_0.__index == nil then -- 5
		_base_0.__index = _base_0 -- 5
	end -- 6
	setmetatable(_base_0, _parent_0.__base) -- 5
	_class_0 = setmetatable({ -- 5
		__init = function(self, ...) -- 5
			return _class_0.__parent.__init(self, ...) -- 5
		end, -- 5
		__base = _base_0, -- 5
		__name = "LootSound", -- 5
		__parent = _parent_0 -- 5
	}, { -- 5
		__index = function(cls, name) -- 5
			local val = rawget(_base_0, name) -- 5
			if val == nil then -- 5
				local parent = rawget(cls, "__parent") -- 5
				if parent then -- 5
					return parent[name] -- 5
				end -- 5
			else -- 5
				return val -- 5
			end -- 5
		end, -- 5
		__call = function(cls, ...) -- 5
			local _self_0 = setmetatable({ }, _base_0) -- 5
			cls.__init(_self_0, ...) -- 5
			return _self_0 -- 5
		end -- 5
	}) -- 5
	_base_0.__class = _class_0 -- 5
	if _parent_0.__inherited then -- 5
		_parent_0.__inherited(_parent_0, _class_0) -- 5
	end -- 5
	LootSound = _class_0 -- 5
end -- 6
local Loot -- 8
do -- 8
	local _class_0 -- 8
	local _parent_0 = ITEM -- 8
	local _base_0 = { -- 8
		SetupDataTables = function(self) -- 9
			_class_0.__parent.__base.SetupDataTables(self) -- 10
			return self:NetworkVar("Bool", "Rotten") -- 11
		end, -- 13
		PrintName = "Loot", -- 14
		Model = Model("models/props_junk/garbage_plasticbottle002a.mdl"), -- 15
		Category = "EvilRP: Loot", -- 16
		Spawnable = true, -- 17
		Interesting = true, -- 18
		CanSell = true, -- 20
		Sound = "LootSound", -- 21
		SubmitSound = "LootSound", -- 23
		Despair = 0, -- 24
		HealthAdd = 0, -- 25
		CookTime = 0, -- 27
		OnUseFinish = function(self, ply) -- 27
			return _class_0.__parent.__base.OnUseFinish(self, ply) -- 28
		end -- 8
	} -- 8
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 28
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 8
			_base_0[_key_0] = _val_0 -- 8
		end -- 8
	end -- 28
	if _base_0.__index == nil then -- 8
		_base_0.__index = _base_0 -- 8
	end -- 28
	setmetatable(_base_0, _parent_0.__base) -- 8
	_class_0 = setmetatable({ -- 8
		__init = function(self, ...) -- 8
			return _class_0.__parent.__init(self, ...) -- 8
		end, -- 8
		__base = _base_0, -- 8
		__name = "Loot", -- 8
		__parent = _parent_0 -- 8
	}, { -- 8
		__index = function(cls, name) -- 8
			local val = rawget(_base_0, name) -- 8
			if val == nil then -- 8
				local parent = rawget(cls, "__parent") -- 8
				if parent then -- 8
					return parent[name] -- 8
				end -- 8
			else -- 8
				return val -- 8
			end -- 8
		end, -- 8
		__call = function(cls, ...) -- 8
			local _self_0 = setmetatable({ }, _base_0) -- 8
			cls.__init(_self_0, ...) -- 8
			return _self_0 -- 8
		end -- 8
	}) -- 8
	_base_0.__class = _class_0 -- 8
	if _parent_0.__inherited then -- 8
		_parent_0.__inherited(_parent_0, _class_0) -- 8
	end -- 8
	Loot = _class_0 -- 8
end -- 28
local SpareAmmo -- 30
do -- 30
	local _class_0 -- 30
	local _parent_0 = Loot -- 30
	local _base_0 = { -- 30
		PrintName = "Spare Ammo", -- 32
		Model = Model("models/Items/BoxSRounds.mdl"), -- 33
		Description = "A half-empty box of unbranded ammunition, should be enough for a mag.", -- 35
		Sound = "AmmoSound", -- 37
		SuccessText = { -- 38
			"loads some ammo.", -- 38
			"puts some bullets into a magazine, dropping a couple.", -- 39
			"puts some lead in their weapon." -- 40
		}, -- 43
		FailText = { -- 44
			"spills the ammo on the ground.", -- 44
			"forgets that bullets go inside the weapon.", -- 45
			"doesn't know how to load a weapon.", -- 46
			"looks stupid, spilling bullets everywhere." -- 47
		}, -- 50
		FailSay = { -- 51
			"Whoops", -- 51
			"MY BULLETS!", -- 52
			"FUCK!", -- 53
			"DUDE!" -- 54
		}, -- 57
		OnUseFinish = function(self, ply) -- 57
			_class_0.__parent.__base.OnUseFinish(self, ply) -- 58
			local wep = ply:GetActiveWeapon() -- 59
			ply:EmitSound("items/ammopickup.wav") -- 60
			if not IsValid(wep) or not wep.Primary or wep.Primary.Ammo == "" or wep.Primary.ClipSize <= 0 then -- 61
				ply:ConCommand("say /me " .. tostring(self.FailText[math.random(1, #self.FailText)])) -- 62
				local fail = self.FailSay[math.random(1, #self.FailSay)] -- 63
				timer.Simple(0.7, function() -- 65
					if IsValid(ply) then -- 66
						return ply:ConCommand("say " .. tostring(fail)) -- 67
					end -- 66
				end) -- 65
				if not self.PersistAfterEat then -- 69
					self:Trash() -- 69
				end -- 69
				return -- 70
			end -- 61
			local ammo = wep:Ammo1() -- 71
			local mag_max = wep.Primary.ClipSize * 4 -- 72
			if ammo >= mag_max then -- 73
				ply:Notify("<c=200,0,0>You're full.") -- 74
				net.Start("evilrp_jumpscare") -- 75
				net.Send(ply) -- 76
				ply:AddDespair(5) -- 77
				return -- 78
			end -- 73
			ply:ConCommand("say /me " .. tostring(self.SuccessText[math.random(1, #self.SuccessText)])) -- 79
			local amt = wep.Primary.ClipSize -- 80
			if ((ammo + amt) > mag_max) then -- 81
				local rem = ammo + amt -- 82
				rem = rem - mag_max -- 83
				amt = amt - rem -- 84
			end -- 81
			ply:GiveAmmo(amt, wep.Primary.Ammo) -- 85
			if not self.PersistAfterEat then -- 86
				return self:Trash() -- 86
			end -- 86
		end -- 30
	} -- 30
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 86
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 30
			_base_0[_key_0] = _val_0 -- 30
		end -- 30
	end -- 86
	if _base_0.__index == nil then -- 30
		_base_0.__index = _base_0 -- 30
	end -- 86
	setmetatable(_base_0, _parent_0.__base) -- 30
	_class_0 = setmetatable({ -- 30
		__init = function(self, ...) -- 30
			return _class_0.__parent.__init(self, ...) -- 30
		end, -- 30
		__base = _base_0, -- 30
		__name = "SpareAmmo", -- 30
		__parent = _parent_0 -- 30
	}, { -- 30
		__index = function(cls, name) -- 30
			local val = rawget(_base_0, name) -- 30
			if val == nil then -- 30
				local parent = rawget(cls, "__parent") -- 30
				if parent then -- 30
					return parent[name] -- 30
				end -- 30
			else -- 30
				return val -- 30
			end -- 30
		end, -- 30
		__call = function(cls, ...) -- 30
			local _self_0 = setmetatable({ }, _base_0) -- 30
			cls.__init(_self_0, ...) -- 30
			return _self_0 -- 30
		end -- 30
	}) -- 30
	_base_0.__class = _class_0 -- 30
	if _parent_0.__inherited then -- 30
		_parent_0.__inherited(_parent_0, _class_0) -- 30
	end -- 30
	SpareAmmo = _class_0 -- 30
end -- 86
local Rustkill -- 88
do -- 88
	local _class_0 -- 88
	local _parent_0 = Loot -- 88
	local _base_0 = { -- 88
		PrintName = "Rustkill", -- 90
		Model = Model("models/props_junk/metalgascan.mdl"), -- 91
		Description = "A metal can filled with a derusting solution.\nIt is still sealed.", -- 92
		Rust = -20, -- 94
		Sound = "LootSound", -- 96
		SuccessText = { -- 97
			"spreads some Rustkill on a machine.", -- 97
			"grabs a can of Rustkill and sprays it over something.", -- 98
			"uses Rustkill to clean some rust off a machine.", -- 99
			"sprays some Rustkill, resisting the urge to drink it." -- 100
		} -- 88
	} -- 88
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 101
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 88
			_base_0[_key_0] = _val_0 -- 88
		end -- 88
	end -- 101
	if _base_0.__index == nil then -- 88
		_base_0.__index = _base_0 -- 88
	end -- 101
	setmetatable(_base_0, _parent_0.__base) -- 88
	_class_0 = setmetatable({ -- 88
		__init = function(self, ...) -- 88
			return _class_0.__parent.__init(self, ...) -- 88
		end, -- 88
		__base = _base_0, -- 88
		__name = "Rustkill", -- 88
		__parent = _parent_0 -- 88
	}, { -- 88
		__index = function(cls, name) -- 88
			local val = rawget(_base_0, name) -- 88
			if val == nil then -- 88
				local parent = rawget(cls, "__parent") -- 88
				if parent then -- 88
					return parent[name] -- 88
				end -- 88
			else -- 88
				return val -- 88
			end -- 88
		end, -- 88
		__call = function(cls, ...) -- 88
			local _self_0 = setmetatable({ }, _base_0) -- 88
			cls.__init(_self_0, ...) -- 88
			return _self_0 -- 88
		end -- 88
	}) -- 88
	_base_0.__class = _class_0 -- 88
	if _parent_0.__inherited then -- 88
		_parent_0.__inherited(_parent_0, _class_0) -- 88
	end -- 88
	Rustkill = _class_0 -- 88
end -- 101
local Intel -- 104
do -- 104
	local _class_0 -- 104
	local _parent_0 = Loot -- 104
	local _base_0 = { -- 104
		PrintName = "Intelligence Folder", -- 106
		Model = Model("models/props_lab/clipboard.mdl"), -- 107
		Description = "A folder that contains classified information from foreign powers.\nIt will be of great value to my leader.", -- 108
		Rust = -20, -- 110
		Sound = "LootSound", -- 112
		UseText = { -- 113
			"reads the folder.", -- 113
			"looks through the folder.", -- 114
			"examines the folder." -- 115
		}, -- 118
		OnUseFinish = function(self, ply) -- 118
			if self.Sound then -- 119
				self:EmitSound(self.Sound) -- 119
			end -- 119
			ply:ConCommand("say /me " .. tostring(self.UseText[math.random(1, #self.UseText)])) -- 120
			if CLIENT then -- 121
				return -- 121
			end -- 121
			if not (ply:Team() == TEAM_EMPEROR) then -- 122
				ply:Notify("<c=200,0,0>You don't know how to interpret this.") -- 123
				return -- 124
			end -- 122
			local op = GAMEMODE.War.active_operation -- 125
			if op then -- 127
				op:AddIntel(op.Attacker) -- 128
				ply:Notify("<c=0,200,0>Our operation might benefit from this knowledge.") -- 129
				if not self.PersistAfterEat then -- 130
					self:Trash() -- 130
				end -- 130
				return -- 131
			else -- 133
				ply:Notify("<c=200,0,0>You must start an operation to exploit this knowledge.") -- 133
				net.Start("evilrp_frighten") -- 134
				net.Send(ply) -- 135
				return -- 136
			end -- 127
		end -- 104
	} -- 104
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 137
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 104
			_base_0[_key_0] = _val_0 -- 104
		end -- 104
	end -- 137
	if _base_0.__index == nil then -- 104
		_base_0.__index = _base_0 -- 104
	end -- 137
	setmetatable(_base_0, _parent_0.__base) -- 104
	_class_0 = setmetatable({ -- 104
		__init = function(self, ...) -- 104
			return _class_0.__parent.__init(self, ...) -- 104
		end, -- 104
		__base = _base_0, -- 104
		__name = "Intel", -- 104
		__parent = _parent_0 -- 104
	}, { -- 104
		__index = function(cls, name) -- 104
			local val = rawget(_base_0, name) -- 104
			if val == nil then -- 104
				local parent = rawget(cls, "__parent") -- 104
				if parent then -- 104
					return parent[name] -- 104
				end -- 104
			else -- 104
				return val -- 104
			end -- 104
		end, -- 104
		__call = function(cls, ...) -- 104
			local _self_0 = setmetatable({ }, _base_0) -- 104
			cls.__init(_self_0, ...) -- 104
			return _self_0 -- 104
		end -- 104
	}) -- 104
	_base_0.__class = _class_0 -- 104
	if _parent_0.__inherited then -- 104
		_parent_0.__inherited(_parent_0, _class_0) -- 104
	end -- 104
	Intel = _class_0 -- 104
	return _class_0 -- 137
end -- 137
