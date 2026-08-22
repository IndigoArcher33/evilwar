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
local intelligence_facts = { -- 15
	"The intelligence contained information about the enemy's supply lines. A partisan operation has been launched.", -- 15
	"The folder contained our enemies' troop movements, a surprise counterattack is being planned.", -- 16
	"The intelligence contained information about the enemy commander's movements, a strike team has been deployed.", -- 17
	"The folder contained plans of an enemy stronghold, a saboteur team has been dispatched." -- 18
} -- 14
local operation_names = { -- 22
	"Caesar", -- 22
	"Augustus", -- 23
	"Napoleon", -- 24
	"Flamingo", -- 25
	"Strike", -- 26
	"Rot", -- 27
	"Rust", -- 28
	"Flesh", -- 29
	"Stahl", -- 30
	"Wind", -- 31
	"Steel", -- 32
	"Hannibal", -- 33
	"Eisen", -- 34
	"Lymphocyte" -- 35
} -- 21
local operation_adjectives = { -- 39
	"Screaming", -- 39
	"Burning", -- 40
	"Furious", -- 41
	"Northern", -- 42
	"Western", -- 43
	"Scorched", -- 44
	"Eastern", -- 45
	"Rising", -- 46
	"Fallen" -- 47
} -- 38
local GetOperationName -- 51
GetOperationName = function() -- 51
	local prefix = operation_prefix[math.random(#operation_prefix)] -- 52
	if "Operation" == prefix then -- 55
		local roll = math.random(100) -- 56
		if roll <= 50 then -- 57
			return prefix .. " " .. operation_names[math.random(#operation_names)] -- 58
		else -- 60
			return prefix .. " " .. operation_adjectives[math.random(#operation_adjectives)] .. " " .. operation_names[math.random(#operation_names)] -- 60
		end -- 57
	elseif "Plan" == prefix then -- 61
		return prefix .. " " .. plan_names[math.random(#plan_names)] -- 62
	end -- 62
end -- 51
local Nation -- 64
do -- 64
	local _class_0 -- 64
	local _base_0 = { -- 64
		Name = "Nation", -- 66
		Description = "A nation", -- 67
		Troops = 1000, -- 68
		Fuel = 100, -- 69
		Supplies = 100, -- 70
		Missiles = 0, -- 72
		RemoveCity = function(self, city) -- 72
			for i, c in pairs(self.Cities) do -- 73
				if c == city then -- 74
					table.remove(self.Cities, i) -- 75
					break -- 76
				end -- 74
			end -- 77
		end, -- 78
		AnnexCity = function(self, city) -- 78
			city.Owner = self -- 79
			return table.insert(self.Cities, city) -- 80
		end -- 64
	} -- 64
	if _base_0.__index == nil then -- 64
		_base_0.__index = _base_0 -- 64
	end -- 80
	_class_0 = setmetatable({ -- 64
		__init = function() end, -- 64
		__base = _base_0, -- 64
		__name = "Nation" -- 64
	}, { -- 64
		__index = _base_0, -- 64
		__call = function(cls, ...) -- 64
			local _self_0 = setmetatable({ }, _base_0) -- 64
			cls.__init(_self_0, ...) -- 64
			return _self_0 -- 64
		end -- 64
	}) -- 64
	_base_0.__class = _class_0 -- 64
	Nation = _class_0 -- 64
end -- 80
local City -- 82
do -- 82
	local _class_0 -- 82
	local _base_0 = { -- 82
		Print = function(self) -- 88
			local output = self.Name .. " | Distance: " .. self.Distance .. " km" -- 89
			return output -- 90
		end -- 82
	} -- 82
	if _base_0.__index == nil then -- 82
		_base_0.__index = _base_0 -- 82
	end -- 90
	_class_0 = setmetatable({ -- 82
		__init = function(self, name, owner, distance) -- 83
			self.Name = name -- 84
			self.Owner = owner -- 85
			self.Distance = distance -- 86
		end, -- 82
		__base = _base_0, -- 82
		__name = "City" -- 82
	}, { -- 82
		__index = _base_0, -- 82
		__call = function(cls, ...) -- 82
			local _self_0 = setmetatable({ }, _base_0) -- 82
			cls.__init(_self_0, ...) -- 82
			return _self_0 -- 82
		end -- 82
	}) -- 82
	_base_0.__class = _class_0 -- 82
	City = _class_0 -- 82
end -- 90
local Carcinoma -- 92
do -- 92
	local _class_0 -- 92
	local _parent_0 = Nation -- 92
	local _base_0 = { -- 92
		Name = "Carcinoman Empire", -- 94
		Description = "Like a malignant growth, the Carcinomans spread with ruthless efficiency and have proven an existential threat to all.", -- 95
		Troops = 50000 -- 92
	} -- 92
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 102
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 92
			_base_0[_key_0] = _val_0 -- 92
		end -- 92
	end -- 102
	if _base_0.__index == nil then -- 92
		_base_0.__index = _base_0 -- 92
	end -- 102
	setmetatable(_base_0, _parent_0.__base) -- 92
	_class_0 = setmetatable({ -- 92
		__init = function(self) -- 96
			self.Cities = { -- 98
				City("Carcinoma", self, 10), -- 98
				City("Metastasis", self, 12), -- 99
				City("Oncogenesis", self, 21), -- 100
				City("Melanoma", self, 24) -- 101
			} -- 97
		end, -- 92
		__base = _base_0, -- 92
		__name = "Carcinoma", -- 92
		__parent = _parent_0 -- 92
	}, { -- 92
		__index = function(cls, name) -- 92
			local val = rawget(_base_0, name) -- 92
			if val == nil then -- 92
				local parent = rawget(cls, "__parent") -- 92
				if parent then -- 92
					return parent[name] -- 92
				end -- 92
			else -- 92
				return val -- 92
			end -- 92
		end, -- 92
		__call = function(cls, ...) -- 92
			local _self_0 = setmetatable({ }, _base_0) -- 92
			cls.__init(_self_0, ...) -- 92
			return _self_0 -- 92
		end -- 92
	}) -- 92
	_base_0.__class = _class_0 -- 92
	if _parent_0.__inherited then -- 92
		_parent_0.__inherited(_parent_0, _class_0) -- 92
	end -- 92
	Carcinoma = _class_0 -- 92
end -- 102
local Wasteland -- 104
do -- 104
	local _class_0 -- 104
	local _parent_0 = Nation -- 104
	local _base_0 = { -- 104
		Name = "Central Wasteland", -- 106
		Description = "A desolate region that has returned to natural order. Decay, rust, and ruin define the people of the harsh wasteland. They inhabited this city in the distant past.", -- 107
		Troops = 1000 -- 104
	} -- 104
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 113
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 104
			_base_0[_key_0] = _val_0 -- 104
		end -- 104
	end -- 113
	if _base_0.__index == nil then -- 104
		_base_0.__index = _base_0 -- 104
	end -- 113
	setmetatable(_base_0, _parent_0.__base) -- 104
	_class_0 = setmetatable({ -- 104
		__init = function(self) -- 108
			self.Cities = { -- 110
				City("Rotburg", self, 3), -- 110
				City("Spleenville", self, 4), -- 111
				City("Skullfuckistan", self, 7) -- 112
			} -- 109
		end, -- 104
		__base = _base_0, -- 104
		__name = "Wasteland", -- 104
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
	Wasteland = _class_0 -- 104
end -- 113
local Lymphoma -- 115
do -- 115
	local _class_0 -- 115
	local _parent_0 = Nation -- 115
	local _base_0 = { -- 115
		Name = "Lymphatic Coalition", -- 117
		Description = "An alliance of subjects loyal to the Emperor. For centuries, our great city had been occupied by the people of the Wasteland until our righteous Monarch pushed them back at the Sixth Battle of Lymphoma.", -- 118
		Troops = 5000 -- 115
	} -- 115
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 122
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 115
			_base_0[_key_0] = _val_0 -- 115
		end -- 115
	end -- 122
	if _base_0.__index == nil then -- 115
		_base_0.__index = _base_0 -- 115
	end -- 122
	setmetatable(_base_0, _parent_0.__base) -- 115
	_class_0 = setmetatable({ -- 115
		__init = function(self) -- 119
			self.Cities = { -- 121
				City("Lymphoma", self, 0) -- 121
			} -- 120
		end, -- 115
		__base = _base_0, -- 115
		__name = "Lymphoma", -- 115
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
	Lymphoma = _class_0 -- 115
end -- 122
local Myocardia -- 124
do -- 124
	local _class_0 -- 124
	local _parent_0 = Nation -- 124
	local _base_0 = { -- 124
		Name = "Republik of Myocardia", -- 126
		Description = "A foreign power with the ambition to conquer our continent. The Myocardians want to turn us into a buffer state.", -- 127
		Troops = 5000 -- 124
	} -- 124
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 134
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 124
			_base_0[_key_0] = _val_0 -- 124
		end -- 124
	end -- 134
	if _base_0.__index == nil then -- 124
		_base_0.__index = _base_0 -- 124
	end -- 134
	setmetatable(_base_0, _parent_0.__base) -- 124
	_class_0 = setmetatable({ -- 124
		__init = function(self) -- 128
			self.Cities = { -- 130
				City("Myopathy", self, 7), -- 130
				City("Myocardia", self, 17), -- 131
				City("Arteria", self, 25), -- 132
				City("New Cholesterol", self, 32) -- 133
			} -- 129
		end, -- 124
		__base = _base_0, -- 124
		__name = "Myocardia", -- 124
		__parent = _parent_0 -- 124
	}, { -- 124
		__index = function(cls, name) -- 124
			local val = rawget(_base_0, name) -- 124
			if val == nil then -- 124
				local parent = rawget(cls, "__parent") -- 124
				if parent then -- 124
					return parent[name] -- 124
				end -- 124
			else -- 124
				return val -- 124
			end -- 124
		end, -- 124
		__call = function(cls, ...) -- 124
			local _self_0 = setmetatable({ }, _base_0) -- 124
			cls.__init(_self_0, ...) -- 124
			return _self_0 -- 124
		end -- 124
	}) -- 124
	_base_0.__class = _class_0 -- 124
	if _parent_0.__inherited then -- 124
		_parent_0.__inherited(_parent_0, _class_0) -- 124
	end -- 124
	Myocardia = _class_0 -- 124
end -- 134
if not GAMEMODE.War then -- 142
	GAMEMODE.War = { -- 137
		nations = { -- 138
			["Carcinoma"] = Carcinoma(), -- 138
			["Lymphoma"] = Lymphoma(), -- 139
			["Myocardia"] = Myocardia(), -- 140
			["Wasteland"] = Wasteland() -- 141
		} -- 137
	} -- 136
end -- 142
OP_ONGOING = 0 -- 145
OP_SUCC = 1 -- 146
OP_FAIL = 2 -- 147
do -- 150
	local _class_0 -- 150
	local _base_0 = { -- 150
		AttackerCasualties = 0, -- 152
		DefenderCasualties = 0, -- 174
		Reinforce = function(self, who, amount) -- 174
			if who == self.Attacker then -- 175
				if self.Attacker.Troops >= amount then -- 176
					self.AttackingTroops = self.AttackingTroops + amount -- 177
					local _obj_0 = self.Attacker -- 178
					_obj_0.Troops = _obj_0.Troops - amount -- 178
				end -- 176
			elseif who == self.Defender then -- 179
				if self.Defender.Troops >= amount then -- 180
					self.DefendingTroops = self.DefendingTroops + amount -- 181
					local _obj_0 = self.Defender -- 182
					_obj_0.Troops = _obj_0.Troops - amount -- 182
				end -- 180
			end -- 175
		end, -- 183
		AddIntel = function(self, side) -- 183
			local fact = intelligence_facts[math.random(1, #intelligence_facts)] -- 184
			local emperor -- 185
			emperor = nil -- 185
			local _list_0 = player.GetAll() -- 186
			for _index_0 = 1, #_list_0 do -- 186
				local ply = _list_0[_index_0] -- 186
				if ply:Team() == TEAM_EMPEROR then -- 187
					emperor = ply -- 188
				end -- 187
			end -- 188
			if not IsValid(emperor) then -- 189
				return -- 190
			end -- 189
			emperor:SendChat("NOTICE", "[WAR] " .. tostring(fact) .. ".") -- 192
			return timer.Simple(math.random(20, 60), function() -- 193
				local points = math.random(3, 6) -- 194
				local roll = math.random(1, 6) -- 195
				if side == self.Attacker then -- 196
					if roll == 1 then -- 197
						emperor:SendChat("NOTICE", "[WAR] The intelligence was outdated, our teams found nothing of value.") -- 198
					elseif roll == 2 then -- 199
						emperor:SendChat("NOTICE", "[WAR] The intelligence was only partially useful, the balance shifts " .. tostring(points) .. " points in our favor") -- 200
						emperor:AddStemCells(1) -- 201
						self.Balance = self.Balance + math.floor(points / 2) -- 202
					elseif roll == 3 then -- 203
						local lost = math.random(20, 60) -- 204
						emperor:SendChat("NOTICE", "[WAR] The folder was a trap, our teams were compromised. We have lost " .. tostring(lost) .. " troops.") -- 205
						emperor:AddStemCells(-1) -- 206
						self.AttackingTroops = self.AttackingTroops - lost -- 207
						self.AttackerCasualties = self.AttackerCasualties + lost -- 208
					else -- 210
						emperor:SendChat("SUCCESS", "[WAR] We have successfuly acted on our intelligence, the balance shifts " .. tostring(points) .. " points in our favor.") -- 210
						emperor:AddStemCells(2) -- 211
					end -- 197
					self.Balance = self.Balance + points -- 212
				elseif side == self.Defender then -- 213
					emperor:SendChat("NOTICE", "[WAR] Enemy intelligence shifts the balance " .. tostring(points) .. " points against us.") -- 214
					self.Balance = self.Balance - points -- 215
				end -- 196
			end) -- 215
		end, -- 217
		Status = function(self) -- 217
			if self.Balance >= 100 then -- 218
				return OP_SUCC -- 219
			elseif self.Balance <= 0 then -- 220
				return OP_FAIL -- 221
			else -- 223
				return OP_ONGOING -- 223
			end -- 218
		end, -- 225
		Tick = function(self) -- 225
			local emperor -- 226
			emperor = nil -- 226
			local _list_0 = player.GetAll() -- 227
			for _index_0 = 1, #_list_0 do -- 227
				local ply = _list_0[_index_0] -- 227
				if ply:Team() == TEAM_EMPEROR then -- 228
					emperor = ply -- 229
				end -- 228
			end -- 230
			local _exp_0 = self:Status() -- 231
			if OP_ONGOING == _exp_0 then -- 232
				local adv_def = math.Clamp(math.Round(-2 * (self.DefendingTroops / self.AttackingTroops)), -7, 0) -- 233
				local adv_atk = math.Clamp(math.Round(2 * (self.AttackingTroops / self.DefendingTroops)), 0, 7) -- 234
				if emperor then -- 235
					adv_atk = adv_atk + 1 -- 235
				end -- 235
				print("Advantage Def: " .. tostring(adv_def) .. " | Advantage Atk: " .. tostring(adv_atk)) -- 237
				local push = math.random(adv_def, adv_atk) -- 239
				self.Balance = math.Clamp(self.Balance + push * 2, 0, 100) -- 240
				local atk_min, atk_max, def_min, def_max -- 242
				if math.abs(push) <= 1 then -- 244
					if emperor then -- 245
						emperor:SendChat("NOTICE", "[WAR] " .. tostring(self.Name) .. " remains a stalemate.") -- 246
					end -- 245
					atk_min, atk_max = 10, 5 -- 247
					def_min, def_max = 12, 7 -- 248
				elseif push > 1 then -- 250
					if emperor then -- 251
						emperor:SendChat("SUCCESS", "[WAR] The offensive at " .. tostring(self.Target.Name) .. " experienced a successful push.") -- 252
						emperor:AddStemCells(1) -- 253
					end -- 251
					atk_min, atk_max = 20, 10 -- 254
					def_min, def_max = 8, 4 -- 255
				else -- 258
					if emperor then -- 258
						emperor:SendChat("NOTICE", "[WAR] We have been driven back at " .. tostring(self.Target.Name) .. ".") -- 259
						emperor:AddStemCells(-1) -- 260
					end -- 258
					atk_min, atk_max = 8, 4 -- 261
					def_min, def_max = 20, 10 -- 262
				end -- 244
				local atkloss = math.random(math.floor(self.AttackingTroops / atk_min), math.floor(self.AttackingTroops / atk_max)) -- 264
				local defloss = math.random(math.floor(self.DefendingTroops / def_min), math.floor(self.DefendingTroops / def_max)) -- 265
				self.AttackingTroops = self.AttackingTroops - atkloss -- 267
				self.AttackerCasualties = self.AttackerCasualties + atkloss -- 268
				self.DefendingTroops = self.DefendingTroops - defloss -- 269
				self.DefenderCasualties = self.DefenderCasualties + defloss -- 270
			elseif OP_FAIL == _exp_0 then -- 272
				if emperor then -- 273
					emperor:SendChat("NOTICE", "[WAR] We have failed to annex " .. tostring(self.Target.Name) .. ".") -- 274
					emperor:AddStemCells(-3) -- 275
				end -- 273
				local atkloss = math.random(200, 500) -- 276
				local defloss = math.random(50, 300) -- 277
				local _obj_0 = self.Defender -- 278
				_obj_0.Troops = _obj_0.Troops - atkloss -- 278
				self.Defender.Troops = math.max(self.Defender.Troops, 0) -- 279
				self.DefenderCasualties = self.DefenderCasualties + defloss -- 280
				local _obj_1 = self.Attacker -- 281
				_obj_1.Troops = _obj_1.Troops - defloss -- 281
				self.Attacker.Troops = math.max(self.Attacker.Troops, 0) -- 282
				self.AttackerCasualties = self.AttackerCasualties + atkloss -- 283
				GAMEMODE.War.active_operation = nil -- 284
				local INTERVAL_REINFORCE = 3 -- 285
			elseif OP_SUCC == _exp_0 then -- 286
				if emperor then -- 287
					emperor:SendChat("SUCCESS", "[WAR] " .. tostring(self.Target.Name) .. " has been brought in to the fold.") -- 288
					Chat.Announce("GENERIC", "<c=0,200,0>[POLEMOKOM] " .. tostring(self.Target.Name) .. " has been annexed by the " .. tostring(self.Attacker.Name) .. ".") -- 289
					emperor:AddStemCells(3) -- 290
				end -- 287
				self.Attacker:AnnexCity(self.Target) -- 292
				self.Defender:RemoveCity(self.Target) -- 293
				local atkloss = math.random(100, 300) -- 295
				local defloss = math.random(300, 500) -- 296
				local _obj_0 = self.Defender -- 297
				_obj_0.Troops = _obj_0.Troops - atkloss -- 297
				self.Defender.Troops = math.max(self.Defender.Troops, 0) -- 298
				self.DefenderCasualties = self.DefenderCasualties + defloss -- 299
				local _obj_1 = self.Attacker -- 300
				_obj_1.Troops = _obj_1.Troops - defloss -- 300
				self.Attacker.Troops = math.max(self.Attacker.Troops, 0) -- 301
				self.AttackerCasualties = self.AttackerCasualties + atkloss -- 302
				GAMEMODE.War.active_operation = nil -- 303
				local INTERVAL_REINFORCE = 3 -- 304
			end -- 304
		end -- 150
	} -- 150
	if _base_0.__index == nil then -- 150
		_base_0.__index = _base_0 -- 150
	end -- 304
	_class_0 = setmetatable({ -- 150
		__init = function(self, target, attacker) -- 153
			if attacker.Troops <= 500 then -- 154
				return -- 155
			end -- 154
			if GAMEMODE.War.active_operation then -- 156
				return -- 157
			end -- 156
			self.Name = GetOperationName() -- 158
			self.Target = target -- 159
			self.Attacker = attacker -- 160
			self.Defender = target.Owner -- 161
			self.Balance = 50 -- 162
			self.AttackingTroops = 500 -- 164
			local _obj_0 = self.Attacker -- 165
			_obj_0.Troops = _obj_0.Troops - 500 -- 165
			if self.Defender.Troops <= 500 then -- 167
				self.DefendingTroops = self.Defender.Troops -- 168
				self.Defender.Troops = 0 -- 169
			else -- 171
				self.DefendingTroops = 500 -- 171
				local _obj_1 = self.Defender -- 172
				_obj_1.Troops = _obj_1.Troops - 500 -- 172
			end -- 167
			GAMEMODE.War.active_operation = self -- 173
		end, -- 150
		__base = _base_0, -- 150
		__name = "Operation" -- 150
	}, { -- 150
		__index = _base_0, -- 150
		__call = function(cls, ...) -- 150
			local _self_0 = setmetatable({ }, _base_0) -- 150
			cls.__init(_self_0, ...) -- 150
			return _self_0 -- 150
		end -- 150
	}) -- 150
	_base_0.__class = _class_0 -- 150
	Operation = _class_0 -- 150
end -- 304
NEXT_PUSH = NEXT_PUSH or 0 -- 307
local INTERVAL_PUSH -- 308
INTERVAL_PUSH = 120 -- 308
local REINFORCE -- 309
REINFORCE = 0 -- 309
local INTERVAL_REINFORCE -- 310
INTERVAL_REINFORCE = 3 -- 310
return hook.Add("Think", "evilrp_war", function() -- 312
	if CurTime() >= NEXT_PUSH then -- 313
		NEXT_PUSH = CurTime() + INTERVAL_PUSH + math.random(INTERVAL_PUSH) -- 314
		for _, n in pairs(GAMEMODE.War.nations) do -- 315
			n.Troops = n.Troops + 100 -- 316
		end -- 316
		if GAMEMODE.War.active_operation then -- 317
			REINFORCE = REINFORCE + 1 -- 318
			if REINFORCE >= INTERVAL_REINFORCE then -- 319
				REINFORCE = 0 -- 320
				INTERVAL_REINFORCE = INTERVAL_REINFORCE + math.random(-1, 1) -- 321
				local op = GAMEMODE.War.active_operation -- 322
				if op.Defender.Troops > 0 then -- 323
					local reinforce = math.floor(math.random(0.02, 0.06) * op.Defender.Troops) -- 324
					op:Reinforce(op.Defender, reinforce) -- 325
				end -- 323
				local emperor -- 326
				emperor = nil -- 326
				local _list_0 = player.GetAll() -- 327
				for _index_0 = 1, #_list_0 do -- 327
					local ply = _list_0[_index_0] -- 327
					if ply:Team() == TEAM_EMPEROR then -- 328
						emperor = ply -- 329
					end -- 328
				end -- 329
				if emperor then -- 330
					emperor:SendChat("NOTICE", "[WAR] " .. tostring(op.Target.Name) .. " has received enemy reinforcements.") -- 331
				end -- 330
			end -- 319
			local op = GAMEMODE.War.active_operation -- 332
			op:Tick() -- 333
		else -- 335
			local emperor -- 335
			emperor = nil -- 335
			local _list_0 = player.GetAll() -- 336
			for _index_0 = 1, #_list_0 do -- 336
				local ply = _list_0[_index_0] -- 336
				if ply:Team() == TEAM_EMPEROR then -- 337
					emperor = ply -- 338
				end -- 337
			end -- 338
			local roll = math.random(1, 3) -- 339
			if emperor and roll == 1 then -- 340
				emperor:SendChat("NOTICE", "[WAR] The troops are mutinying, they have nothing to do.") -- 341
				emperor:AddStemCells(-1) -- 342
				emperor:Notify("<c=200,0,0>Lymphoma must wage war.") -- 343
			end -- 340
		end -- 317
	end -- 313
	return -- 344
end) -- 344
