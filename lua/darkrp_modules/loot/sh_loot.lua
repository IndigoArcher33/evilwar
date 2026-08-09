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
		Interesting = true, -- 19
		Sound = "LootSound", -- 20
		SubmitSound = "LootSound", -- 22
		Despair = 0, -- 23
		HealthAdd = 0, -- 24
		CookTime = 0, -- 26
		OnUseFinish = function(self, ply) -- 26
			return _class_0.__parent.__base.OnUseFinish(self, ply) -- 27
		end -- 8
	} -- 8
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 27
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 8
			_base_0[_key_0] = _val_0 -- 8
		end -- 8
	end -- 27
	if _base_0.__index == nil then -- 8
		_base_0.__index = _base_0 -- 8
	end -- 27
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
end -- 27
local SpareAmmo -- 29
do -- 29
	local _class_0 -- 29
	local _parent_0 = Loot -- 29
	local _base_0 = { -- 29
		PrintName = "Spare Ammo", -- 31
		Model = Model("models/Items/BoxSRounds.mdl"), -- 32
		Description = "A half-empty box of unbranded ammunition, should be enough for a mag.", -- 34
		Sound = "AmmoSound", -- 36
		SuccessText = { -- 37
			"loads some ammo.", -- 37
			"puts some bullets into a magazine, dropping a couple.", -- 38
			"puts some lead in their weapon." -- 39
		}, -- 42
		FailText = { -- 43
			"spills the ammo on the ground.", -- 43
			"forgets that bullets go inside the weapon.", -- 44
			"doesn't know how to load a weapon.", -- 45
			"looks stupid, spilling bullets everywhere." -- 46
		}, -- 49
		FailSay = { -- 50
			"Whoops", -- 50
			"MY BULLETS!", -- 51
			"FUCK!", -- 52
			"DUDE!" -- 53
		}, -- 56
		OnUseFinish = function(self, ply) -- 56
			_class_0.__parent.__base.OnUseFinish(self, ply) -- 57
			local wep = ply:GetActiveWeapon() -- 58
			ply:EmitSound("items/ammopickup.wav") -- 59
			if not IsValid(wep) or not wep.Primary or wep.Primary.Ammo == "" or wep.Primary.ClipSize <= 0 then -- 60
				ply:ConCommand("say /me " .. tostring(self.FailText[math.random(1, #self.FailText)])) -- 61
				local fail = self.FailSay[math.random(1, #self.FailSay)] -- 62
				timer.Simple(0.7, function() -- 64
					if IsValid(ply) then -- 65
						return ply:ConCommand("say " .. tostring(fail)) -- 66
					end -- 65
				end) -- 64
				if not self.PersistAfterEat then -- 68
					self:Trash() -- 68
				end -- 68
				return -- 69
			end -- 60
			local ammo = wep:Ammo1() -- 70
			local mag_max = wep.Primary.ClipSize * 4 -- 71
			if ammo >= mag_max then -- 72
				ply:Notify("<c=200,0,0>You're full.") -- 73
				net.Start("evilrp_jumpscare") -- 74
				net.Send(ply) -- 75
				ply:AddDespair(5) -- 76
				return -- 77
			end -- 72
			ply:ConCommand("say /me " .. tostring(self.SuccessText[math.random(1, #self.SuccessText)])) -- 78
			local amt = wep.Primary.ClipSize -- 79
			if ((ammo + amt) > mag_max) then -- 80
				local rem = ammo + amt -- 81
				rem = rem - mag_max -- 82
				amt = amt - rem -- 83
			end -- 80
			ply:GiveAmmo(amt, wep.Primary.Ammo) -- 84
			if not self.PersistAfterEat then -- 85
				return self:Trash() -- 85
			end -- 85
		end -- 29
	} -- 29
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 85
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 29
			_base_0[_key_0] = _val_0 -- 29
		end -- 29
	end -- 85
	if _base_0.__index == nil then -- 29
		_base_0.__index = _base_0 -- 29
	end -- 85
	setmetatable(_base_0, _parent_0.__base) -- 29
	_class_0 = setmetatable({ -- 29
		__init = function(self, ...) -- 29
			return _class_0.__parent.__init(self, ...) -- 29
		end, -- 29
		__base = _base_0, -- 29
		__name = "SpareAmmo", -- 29
		__parent = _parent_0 -- 29
	}, { -- 29
		__index = function(cls, name) -- 29
			local val = rawget(_base_0, name) -- 29
			if val == nil then -- 29
				local parent = rawget(cls, "__parent") -- 29
				if parent then -- 29
					return parent[name] -- 29
				end -- 29
			else -- 29
				return val -- 29
			end -- 29
		end, -- 29
		__call = function(cls, ...) -- 29
			local _self_0 = setmetatable({ }, _base_0) -- 29
			cls.__init(_self_0, ...) -- 29
			return _self_0 -- 29
		end -- 29
	}) -- 29
	_base_0.__class = _class_0 -- 29
	if _parent_0.__inherited then -- 29
		_parent_0.__inherited(_parent_0, _class_0) -- 29
	end -- 29
	SpareAmmo = _class_0 -- 29
end -- 85
local Rustkill -- 87
do -- 87
	local _class_0 -- 87
	local _parent_0 = Loot -- 87
	local _base_0 = { -- 87
		PrintName = "Rustkill", -- 89
		Model = Model("models/props_junk/metalgascan.mdl"), -- 90
		Description = "A metal can filled with a derusting solution.\nIt is still sealed.", -- 91
		Rust = -20, -- 93
		Sound = "LootSound", -- 95
		SuccessText = { -- 96
			"spreads some Rustkill on a machine.", -- 96
			"grabs a can of Rustkill and sprays it over something.", -- 97
			"uses Rustkill to clean some rust off a machine.", -- 98
			"sprays some Rustkill, resisting the urge to drink it." -- 99
		} -- 87
	} -- 87
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 100
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 87
			_base_0[_key_0] = _val_0 -- 87
		end -- 87
	end -- 100
	if _base_0.__index == nil then -- 87
		_base_0.__index = _base_0 -- 87
	end -- 100
	setmetatable(_base_0, _parent_0.__base) -- 87
	_class_0 = setmetatable({ -- 87
		__init = function(self, ...) -- 87
			return _class_0.__parent.__init(self, ...) -- 87
		end, -- 87
		__base = _base_0, -- 87
		__name = "Rustkill", -- 87
		__parent = _parent_0 -- 87
	}, { -- 87
		__index = function(cls, name) -- 87
			local val = rawget(_base_0, name) -- 87
			if val == nil then -- 87
				local parent = rawget(cls, "__parent") -- 87
				if parent then -- 87
					return parent[name] -- 87
				end -- 87
			else -- 87
				return val -- 87
			end -- 87
		end, -- 87
		__call = function(cls, ...) -- 87
			local _self_0 = setmetatable({ }, _base_0) -- 87
			cls.__init(_self_0, ...) -- 87
			return _self_0 -- 87
		end -- 87
	}) -- 87
	_base_0.__class = _class_0 -- 87
	if _parent_0.__inherited then -- 87
		_parent_0.__inherited(_parent_0, _class_0) -- 87
	end -- 87
	Rustkill = _class_0 -- 87
end -- 100
local Intel -- 103
do -- 103
	local _class_0 -- 103
	local _parent_0 = Loot -- 103
	local _base_0 = { -- 103
		PrintName = "Intelligence Folder", -- 105
		Model = Model("models/props_lab/clipboard.mdl"), -- 106
		Description = "A folder that contains classified information from foreign powers.\nIt will be of great value to my leader.", -- 107
		Rust = -20, -- 109
		Sound = "LootSound", -- 111
		UseText = { -- 112
			"reads the folder.", -- 112
			"looks through the folder.", -- 113
			"examines the folder." -- 114
		}, -- 117
		OnUseFinish = function(self, ply) -- 117
			if self.Sound then -- 118
				self:EmitSound(self.Sound) -- 118
			end -- 118
			ply:ConCommand("say /me " .. tostring(self.UseText[math.random(1, #self.UseText)])) -- 119
			if CLIENT then -- 120
				return -- 120
			end -- 120
			if not (ply:Team() == TEAM_EMPEROR) then -- 121
				ply:Notify("<c=200,0,0>You don't know how to interpret this.") -- 122
				return -- 123
			end -- 121
			local op = GAMEMODE.War.active_operation -- 124
			if op then -- 126
				op:AddIntel(op.Attacker) -- 127
				ply:Notify("<c=0,200,0>Our operation might benefit from this knowledge.") -- 128
				if not self.PersistAfterEat then -- 129
					self:Trash() -- 129
				end -- 129
				return -- 130
			else -- 132
				ply:Notify("<c=200,0,0>You must start an operation to exploit this knowledge.") -- 132
				net.Start("evilrp_frighten") -- 133
				net.Send(ply) -- 134
				return -- 135
			end -- 126
		end -- 103
	} -- 103
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 136
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 103
			_base_0[_key_0] = _val_0 -- 103
		end -- 103
	end -- 136
	if _base_0.__index == nil then -- 103
		_base_0.__index = _base_0 -- 103
	end -- 136
	setmetatable(_base_0, _parent_0.__base) -- 103
	_class_0 = setmetatable({ -- 103
		__init = function(self, ...) -- 103
			return _class_0.__parent.__init(self, ...) -- 103
		end, -- 103
		__base = _base_0, -- 103
		__name = "Intel", -- 103
		__parent = _parent_0 -- 103
	}, { -- 103
		__index = function(cls, name) -- 103
			local val = rawget(_base_0, name) -- 103
			if val == nil then -- 103
				local parent = rawget(cls, "__parent") -- 103
				if parent then -- 103
					return parent[name] -- 103
				end -- 103
			else -- 103
				return val -- 103
			end -- 103
		end, -- 103
		__call = function(cls, ...) -- 103
			local _self_0 = setmetatable({ }, _base_0) -- 103
			cls.__init(_self_0, ...) -- 103
			return _self_0 -- 103
		end -- 103
	}) -- 103
	_base_0.__class = _class_0 -- 103
	if _parent_0.__inherited then -- 103
		_parent_0.__inherited(_parent_0, _class_0) -- 103
	end -- 103
	Intel = _class_0 -- 103
	return _class_0 -- 136
end -- 136
