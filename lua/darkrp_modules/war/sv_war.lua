-- [yue]: darkrp_modules\war\sv_war.yue
local operation_prefix = { -- 3
	"Operation", -- 3
	"Plan" -- 4
} -- 2
local plan_names = { -- 8
	"Red", -- 8
	"Blue", -- 9
	"Green", -- 10
	"Yellow" -- 11
} -- 7
local operation_names = { -- 15
	"Caesar", -- 15
	"Augustus", -- 16
	"Napoleon", -- 17
	"Flamingo", -- 18
	"Strike", -- 19
	"Rot", -- 20
	"Rust", -- 21
	"Flesh", -- 22
	"Stahl", -- 23
	"Wind", -- 24
	"Steel", -- 25
	"Hannibal", -- 26
	"Eisen", -- 27
	"Lymphocyte" -- 28
} -- 14
local operation_adjectives = { -- 32
	"Screaming", -- 32
	"Burning", -- 33
	"Furious", -- 34
	"Northern", -- 35
	"Western", -- 36
	"Scorched", -- 37
	"Eastern", -- 38
	"Rising", -- 39
	"Fallen" -- 40
} -- 31
local GetOperationName -- 44
GetOperationName = function() -- 44
	local prefix = operation_prefix[math.random(#operation_prefix)] -- 45
	if "Operation" == prefix then -- 48
		local roll = math.random(100) -- 49
		if roll <= 50 then -- 50
			return prefix .. " " .. operation_names[math.random(#operation_names)] -- 51
		else -- 53
			return prefix .. " " .. operation_adjectives[math.random(#operation_adjectives)] .. " " .. operation_names[math.random(#operation_names)] -- 53
		end -- 50
	elseif "Plan" == prefix then -- 54
		return prefix .. " " .. plan_names[math.random(#plan_names)] -- 55
	end -- 55
end -- 44
local Nation -- 57
do -- 57
	local _class_0 -- 57
	local _base_0 = { -- 57
		Name = "Nation", -- 59
		Description = "A nation", -- 60
		Troops = 1000, -- 61
		Fuel = 100, -- 62
		Supplies = 100, -- 63
		Missiles = 0, -- 65
		RemoveCity = function(self, city) -- 65
			for i, c in pairs(self.Cities) do -- 66
				if c == city then -- 67
					table.remove(self.Cities, i) -- 68
					break -- 69
				end -- 67
			end -- 70
		end, -- 71
		AnnexCity = function(self, city) -- 71
			city.Owner = self -- 72
			return table.insert(self.Cities, city) -- 73
		end -- 57
	} -- 57
	if _base_0.__index == nil then -- 57
		_base_0.__index = _base_0 -- 57
	end -- 73
	_class_0 = setmetatable({ -- 57
		__init = function() end, -- 57
		__base = _base_0, -- 57
		__name = "Nation" -- 57
	}, { -- 57
		__index = _base_0, -- 57
		__call = function(cls, ...) -- 57
			local _self_0 = setmetatable({ }, _base_0) -- 57
			cls.__init(_self_0, ...) -- 57
			return _self_0 -- 57
		end -- 57
	}) -- 57
	_base_0.__class = _class_0 -- 57
	Nation = _class_0 -- 57
end -- 73
local City -- 75
do -- 75
	local _class_0 -- 75
	local _base_0 = { -- 75
		Print = function(self) -- 81
			local output = self.Name .. " | Distance: " .. self.Distance .. " km" -- 82
			return output -- 83
		end -- 75
	} -- 75
	if _base_0.__index == nil then -- 75
		_base_0.__index = _base_0 -- 75
	end -- 83
	_class_0 = setmetatable({ -- 75
		__init = function(self, name, owner, distance) -- 76
			self.Name = name -- 77
			self.Owner = owner -- 78
			self.Distance = distance -- 79
		end, -- 75
		__base = _base_0, -- 75
		__name = "City" -- 75
	}, { -- 75
		__index = _base_0, -- 75
		__call = function(cls, ...) -- 75
			local _self_0 = setmetatable({ }, _base_0) -- 75
			cls.__init(_self_0, ...) -- 75
			return _self_0 -- 75
		end -- 75
	}) -- 75
	_base_0.__class = _class_0 -- 75
	City = _class_0 -- 75
end -- 83
local Carcinoma -- 85
do -- 85
	local _class_0 -- 85
	local _parent_0 = Nation -- 85
	local _base_0 = { -- 85
		Name = "Carcinoman Empire", -- 87
		Description = "Like a malignant growth, the Carcinomans spread with ruthless efficiency and have proven an existential threat to all.", -- 88
		Troops = 50000 -- 85
	} -- 85
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 95
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 85
			_base_0[_key_0] = _val_0 -- 85
		end -- 85
	end -- 95
	if _base_0.__index == nil then -- 85
		_base_0.__index = _base_0 -- 85
	end -- 95
	setmetatable(_base_0, _parent_0.__base) -- 85
	_class_0 = setmetatable({ -- 85
		__init = function(self) -- 89
			self.Cities = { -- 91
				City("Carcinoma", self, 10), -- 91
				City("Metastasis", self, 12), -- 92
				City("Oncogenesis", self, 21), -- 93
				City("Melanoma", self, 24) -- 94
			} -- 90
		end, -- 85
		__base = _base_0, -- 85
		__name = "Carcinoma", -- 85
		__parent = _parent_0 -- 85
	}, { -- 85
		__index = function(cls, name) -- 85
			local val = rawget(_base_0, name) -- 85
			if val == nil then -- 85
				local parent = rawget(cls, "__parent") -- 85
				if parent then -- 85
					return parent[name] -- 85
				end -- 85
			else -- 85
				return val -- 85
			end -- 85
		end, -- 85
		__call = function(cls, ...) -- 85
			local _self_0 = setmetatable({ }, _base_0) -- 85
			cls.__init(_self_0, ...) -- 85
			return _self_0 -- 85
		end -- 85
	}) -- 85
	_base_0.__class = _class_0 -- 85
	if _parent_0.__inherited then -- 85
		_parent_0.__inherited(_parent_0, _class_0) -- 85
	end -- 85
	Carcinoma = _class_0 -- 85
end -- 95
local Wasteland -- 97
do -- 97
	local _class_0 -- 97
	local _parent_0 = Nation -- 97
	local _base_0 = { -- 97
		Name = "Central Wasteland", -- 99
		Description = "A desolate region that has returned to natural order. Decay, rust, and ruin define the people of the harsh wasteland. They inhabited this city in the distant past.", -- 100
		Troops = 1000 -- 97
	} -- 97
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 106
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 97
			_base_0[_key_0] = _val_0 -- 97
		end -- 97
	end -- 106
	if _base_0.__index == nil then -- 97
		_base_0.__index = _base_0 -- 97
	end -- 106
	setmetatable(_base_0, _parent_0.__base) -- 97
	_class_0 = setmetatable({ -- 97
		__init = function(self) -- 101
			self.Cities = { -- 103
				City("Rotburg", self, 3), -- 103
				City("Spleenville", self, 4), -- 104
				City("Skullfuckistan", self, 7) -- 105
			} -- 102
		end, -- 97
		__base = _base_0, -- 97
		__name = "Wasteland", -- 97
		__parent = _parent_0 -- 97
	}, { -- 97
		__index = function(cls, name) -- 97
			local val = rawget(_base_0, name) -- 97
			if val == nil then -- 97
				local parent = rawget(cls, "__parent") -- 97
				if parent then -- 97
					return parent[name] -- 97
				end -- 97
			else -- 97
				return val -- 97
			end -- 97
		end, -- 97
		__call = function(cls, ...) -- 97
			local _self_0 = setmetatable({ }, _base_0) -- 97
			cls.__init(_self_0, ...) -- 97
			return _self_0 -- 97
		end -- 97
	}) -- 97
	_base_0.__class = _class_0 -- 97
	if _parent_0.__inherited then -- 97
		_parent_0.__inherited(_parent_0, _class_0) -- 97
	end -- 97
	Wasteland = _class_0 -- 97
end -- 106
local Lymphoma -- 108
do -- 108
	local _class_0 -- 108
	local _parent_0 = Nation -- 108
	local _base_0 = { -- 108
		Name = "Lymphatic Coalition", -- 110
		Description = "An alliance of subjects loyal to the Emperor. For centuries, our great city had been occupied by the people of the Wasteland until our righteous Monarch pushed them back at the Sixth Battle of Lymphoma.", -- 111
		Troops = 5000 -- 108
	} -- 108
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 115
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 108
			_base_0[_key_0] = _val_0 -- 108
		end -- 108
	end -- 115
	if _base_0.__index == nil then -- 108
		_base_0.__index = _base_0 -- 108
	end -- 115
	setmetatable(_base_0, _parent_0.__base) -- 108
	_class_0 = setmetatable({ -- 108
		__init = function(self) -- 112
			self.Cities = { -- 114
				City("Lymphoma", self, 0) -- 114
			} -- 113
		end, -- 108
		__base = _base_0, -- 108
		__name = "Lymphoma", -- 108
		__parent = _parent_0 -- 108
	}, { -- 108
		__index = function(cls, name) -- 108
			local val = rawget(_base_0, name) -- 108
			if val == nil then -- 108
				local parent = rawget(cls, "__parent") -- 108
				if parent then -- 108
					return parent[name] -- 108
				end -- 108
			else -- 108
				return val -- 108
			end -- 108
		end, -- 108
		__call = function(cls, ...) -- 108
			local _self_0 = setmetatable({ }, _base_0) -- 108
			cls.__init(_self_0, ...) -- 108
			return _self_0 -- 108
		end -- 108
	}) -- 108
	_base_0.__class = _class_0 -- 108
	if _parent_0.__inherited then -- 108
		_parent_0.__inherited(_parent_0, _class_0) -- 108
	end -- 108
	Lymphoma = _class_0 -- 108
end -- 115
local Myocardia -- 117
do -- 117
	local _class_0 -- 117
	local _parent_0 = Nation -- 117
	local _base_0 = { -- 117
		Name = "Republik of Myocardia", -- 119
		Description = "A foreign power with the ambition to conquer our continent. The Myocardians want to turn us into a buffer state.", -- 120
		Troops = 5000 -- 117
	} -- 117
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 127
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 117
			_base_0[_key_0] = _val_0 -- 117
		end -- 117
	end -- 127
	if _base_0.__index == nil then -- 117
		_base_0.__index = _base_0 -- 117
	end -- 127
	setmetatable(_base_0, _parent_0.__base) -- 117
	_class_0 = setmetatable({ -- 117
		__init = function(self) -- 121
			self.Cities = { -- 123
				City("Myopathy", self, 7), -- 123
				City("Myocardia", self, 17), -- 124
				City("Arteria", self, 25), -- 125
				City("New Cholesterol", self, 32) -- 126
			} -- 122
		end, -- 117
		__base = _base_0, -- 117
		__name = "Myocardia", -- 117
		__parent = _parent_0 -- 117
	}, { -- 117
		__index = function(cls, name) -- 117
			local val = rawget(_base_0, name) -- 117
			if val == nil then -- 117
				local parent = rawget(cls, "__parent") -- 117
				if parent then -- 117
					return parent[name] -- 117
				end -- 117
			else -- 117
				return val -- 117
			end -- 117
		end, -- 117
		__call = function(cls, ...) -- 117
			local _self_0 = setmetatable({ }, _base_0) -- 117
			cls.__init(_self_0, ...) -- 117
			return _self_0 -- 117
		end -- 117
	}) -- 117
	_base_0.__class = _class_0 -- 117
	if _parent_0.__inherited then -- 117
		_parent_0.__inherited(_parent_0, _class_0) -- 117
	end -- 117
	Myocardia = _class_0 -- 117
end -- 127
if not GAMEMODE.War then -- 135
	GAMEMODE.War = { -- 130
		nations = { -- 131
			["Carcinoma"] = Carcinoma(), -- 131
			["Lymphoma"] = Lymphoma(), -- 132
			["Myocardia"] = Myocardia(), -- 133
			["Wasteland"] = Wasteland() -- 134
		} -- 130
	} -- 129
end -- 135
OP_ONGOING = 0 -- 138
OP_SUCC = 1 -- 139
OP_FAIL = 2 -- 140
do -- 143
	local _class_0 -- 143
	local _base_0 = { -- 143
		AttackerCasualties = 0, -- 145
		DefenderCasualties = 0, -- 167
		Reinforce = function(self, who, amount) -- 167
			if who == self.Attacker then -- 168
				if self.Attacker.Troops >= amount then -- 169
					self.AttackingTroops = self.AttackingTroops + amount -- 170
					local _obj_0 = self.Attacker -- 171
					_obj_0.Troops = _obj_0.Troops - amount -- 171
				end -- 169
			elseif who == self.Defender then -- 172
				if self.Defender.Troops >= amount then -- 173
					self.DefendingTroops = self.DefendingTroops + amount -- 174
					local _obj_0 = self.Defender -- 175
					_obj_0.Troops = _obj_0.Troops - amount -- 175
				end -- 173
			end -- 168
		end, -- 177
		Status = function(self) -- 177
			if self.Balance >= 100 then -- 178
				return OP_SUCC -- 179
			elseif self.Balance <= 0 then -- 180
				return OP_FAIL -- 181
			else -- 183
				return OP_ONGOING -- 183
			end -- 178
		end, -- 185
		Tick = function(self) -- 185
			local emperor -- 186
			emperor = nil -- 186
			local _list_0 = player.GetAll() -- 187
			for _index_0 = 1, #_list_0 do -- 187
				local ply = _list_0[_index_0] -- 187
				if ply:Team() == TEAM_EMPEROR then -- 188
					emperor = ply -- 189
				end -- 188
			end -- 190
			local _exp_0 = self:Status() -- 191
			if OP_ONGOING == _exp_0 then -- 192
				local adv_def = math.Clamp(math.Round(-2 * (self.DefendingTroops / self.AttackingTroops)), -7, 0) -- 193
				local adv_atk = math.Clamp(math.Round(2 * (self.AttackingTroops / self.DefendingTroops)), 0, 7) -- 194
				if emperor then -- 195
					adv_atk = adv_atk + 1 -- 195
				end -- 195
				print("Advantage Def: " .. tostring(adv_def) .. " | Advantage Atk: " .. tostring(adv_atk)) -- 197
				local push = math.random(adv_def, adv_atk) -- 199
				self.Balance = math.Clamp(self.Balance + push * 3, 0, 100) -- 200
				local atk_min, atk_max, def_min, def_max -- 202
				if math.abs(push) <= 1 then -- 204
					if emperor then -- 205
						emperor:SendChat("NOTICE", "[WAR] " .. tostring(self.Name) .. " remains a stalemate.") -- 206
					end -- 205
					atk_min, atk_max = 10, 5 -- 207
					def_min, def_max = 12, 7 -- 208
				elseif push > 1 then -- 210
					if emperor then -- 211
						emperor:SendChat("SUCCESS", "[WAR] The offensive at " .. tostring(self.Target.Name) .. " experienced a successful push.") -- 212
						emperor:AddStemCells(1) -- 213
					end -- 211
					atk_min, atk_max = 20, 10 -- 214
					def_min, def_max = 8, 4 -- 215
				else -- 218
					if emperor then -- 218
						emperor:SendChat("NOTICE", "[WAR] We have been driven back at " .. tostring(self.Target.Name) .. ".") -- 219
						emperor:AddStemCells(-1) -- 220
					end -- 218
					atk_min, atk_max = 8, 4 -- 221
					def_min, def_max = 20, 10 -- 222
				end -- 204
				local atkloss = math.random(math.floor(self.AttackingTroops / atk_min), math.floor(self.AttackingTroops / atk_max)) -- 224
				local defloss = math.random(math.floor(self.DefendingTroops / def_min), math.floor(self.DefendingTroops / def_max)) -- 225
				self.AttackingTroops = self.AttackingTroops - atkloss -- 227
				self.AttackerCasualties = self.AttackerCasualties + atkloss -- 228
				self.DefendingTroops = self.DefendingTroops - defloss -- 229
				self.DefenderCasualties = self.DefenderCasualties + defloss -- 230
			elseif OP_FAIL == _exp_0 then -- 232
				if emperor then -- 233
					emperor:SendChat("NOTICE", "[WAR] We have failed to annex " .. tostring(self.Target.Name) .. ".") -- 234
					emperor:AddStemCells(-3) -- 235
				end -- 233
				local atkloss = math.random(200, 500) -- 236
				local defloss = math.random(50, 300) -- 237
				local _obj_0 = self.Defender -- 238
				_obj_0.Troops = _obj_0.Troops - atkloss -- 238
				self.Defender.Troops = math.max(self.Defender.Troops, 0) -- 239
				self.DefenderCasualties = self.DefenderCasualties + defloss -- 240
				local _obj_1 = self.Attacker -- 241
				_obj_1.Troops = _obj_1.Troops - defloss -- 241
				self.Attacker.Troops = math.max(self.Attacker.Troops, 0) -- 242
				self.AttackerCasualties = self.AttackerCasualties + atkloss -- 243
				GAMEMODE.War.active_operation = nil -- 244
			elseif OP_SUCC == _exp_0 then -- 245
				if emperor then -- 246
					emperor:SendChat("SUCCESS", "[WAR] " .. tostring(self.Target.Name) .. " has been brought in to the fold.") -- 247
					emperor:AddStemCells(3) -- 248
				end -- 246
				self.Attacker:AnnexCity(self.Target) -- 250
				self.Defender:RemoveCity(self.Target) -- 251
				local atkloss = math.random(100, 300) -- 253
				local defloss = math.random(300, 500) -- 254
				local _obj_0 = self.Defender -- 255
				_obj_0.Troops = _obj_0.Troops - atkloss -- 255
				self.Defender.Troops = math.max(self.Defender.Troops, 0) -- 256
				self.DefenderCasualties = self.DefenderCasualties + defloss -- 257
				local _obj_1 = self.Attacker -- 258
				_obj_1.Troops = _obj_1.Troops - defloss -- 258
				self.Attacker.Troops = math.max(self.Attacker.Troops, 0) -- 259
				self.AttackerCasualties = self.AttackerCasualties + atkloss -- 260
				GAMEMODE.War.active_operation = nil -- 261
			end -- 261
		end -- 143
	} -- 143
	if _base_0.__index == nil then -- 143
		_base_0.__index = _base_0 -- 143
	end -- 261
	_class_0 = setmetatable({ -- 143
		__init = function(self, target, attacker) -- 146
			if attacker.Troops <= 500 then -- 147
				return -- 148
			end -- 147
			if GAMEMODE.War.active_operation then -- 149
				return -- 150
			end -- 149
			self.Name = GetOperationName() -- 151
			self.Target = target -- 152
			self.Attacker = attacker -- 153
			self.Defender = target.Owner -- 154
			self.Balance = 50 -- 155
			self.AttackingTroops = 500 -- 157
			local _obj_0 = self.Attacker -- 158
			_obj_0.Troops = _obj_0.Troops - 500 -- 158
			if self.Defender.Troops <= 500 then -- 160
				self.DefendingTroops = self.Defender.Troops -- 161
				self.Defender.Troops = 0 -- 162
			else -- 164
				self.DefendingTroops = 500 -- 164
				local _obj_1 = self.Defender -- 165
				_obj_1.Troops = _obj_1.Troops - 500 -- 165
			end -- 160
			GAMEMODE.War.active_operation = self -- 166
		end, -- 143
		__base = _base_0, -- 143
		__name = "Operation" -- 143
	}, { -- 143
		__index = _base_0, -- 143
		__call = function(cls, ...) -- 143
			local _self_0 = setmetatable({ }, _base_0) -- 143
			cls.__init(_self_0, ...) -- 143
			return _self_0 -- 143
		end -- 143
	}) -- 143
	_base_0.__class = _class_0 -- 143
	Operation = _class_0 -- 143
end -- 261
NEXT_PUSH = NEXT_PUSH or 0 -- 264
local INTERVAL_PUSH -- 265
INTERVAL_PUSH = 120 -- 265
local REINFORCE -- 266
REINFORCE = 0 -- 266
local INTERVAL_REINFORCE -- 267
INTERVAL_REINFORCE = 4 -- 267
return hook.Add("Think", "evilrp_war", function() -- 269
	if CurTime() >= NEXT_PUSH then -- 270
		NEXT_PUSH = CurTime() + INTERVAL_PUSH + math.random(INTERVAL_PUSH) -- 271
		for _, n in pairs(GAMEMODE.War.nations) do -- 272
			n.Troops = n.Troops + 100 -- 273
		end -- 273
		if GAMEMODE.War.active_operation then -- 274
			REINFORCE = REINFORCE + 1 -- 275
			if REINFORCE >= INTERVAL_REINFORCE then -- 276
				REINFORCE = 0 -- 277
				INTERVAL_REINFORCE = INTERVAL_REINFORCE + 1 -- 278
				local op = GAMEMODE.War.active_operation -- 279
				if op.Defender.Troops > 0 then -- 280
					local reinforce = math.floor(math.random(0.02, 0.06) * op.Defender.Troops) -- 281
					op:Reinforce(op.Defender, reinforce) -- 282
				end -- 280
				local emperor -- 283
				emperor = nil -- 283
				local _list_0 = player.GetAll() -- 284
				for _index_0 = 1, #_list_0 do -- 284
					local ply = _list_0[_index_0] -- 284
					if ply:Team() == TEAM_EMPEROR then -- 285
						emperor = ply -- 286
					end -- 285
				end -- 286
				if emperor then -- 287
					emperor:SendChat("NOTICE", "[WAR] " .. tostring(op.Target.Name) .. " has received enemy reinforcements.") -- 288
				end -- 287
			end -- 276
			local op = GAMEMODE.War.active_operation -- 289
			op:Tick() -- 290
		end -- 274
	end -- 270
	return -- 291
end) -- 291
