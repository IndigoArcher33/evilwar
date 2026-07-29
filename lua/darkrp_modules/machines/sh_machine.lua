-- [yue]: darkrp_modules\machines\sh_machine.yue
local button0 = Material("icon16/lightbulb_off.png") -- 1
local button1 = Material("icon16/exclamation.png") -- 2
local button2 = Material("icon16/cancel.png") -- 3
local button3 = Material("icon16/delete.png") -- 4
local default_button = Material("sprites/glow04_noz_gmod") -- 5
local default0 = Material("sprites/glow04_noz") -- 6
local colors = { -- 9
	Color(150, 150, 150), -- 9
	Color(0, 255, 0), -- 10
	Color(0, 0, 255) -- 11
} -- 8
local MachineDing -- 14
do -- 14
	local _class_0 -- 14
	local _parent_0 = SOUND -- 14
	local _base_0 = { -- 14
		sound = { -- 15
			"buttons/blip1.wav", -- 15
			"buttons/button1.wav", -- 16
			"buttons/button3.wav", -- 17
			"buttons/button5.wav", -- 18
			"buttons/button9.wav", -- 19
			"buttons/button14.wav", -- 20
			"buttons/button16.wav", -- 21
			"buttons/button17.wav", -- 22
			"buttons/button18.wav" -- 23
		}, -- 24
		pitch = { -- 24
			75, -- 24
			95 -- 24
		}, -- 25
		level = SNDLVL_75DB -- 14
	} -- 14
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 25
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 14
			_base_0[_key_0] = _val_0 -- 14
		end -- 14
	end -- 25
	if _base_0.__index == nil then -- 14
		_base_0.__index = _base_0 -- 14
	end -- 25
	setmetatable(_base_0, _parent_0.__base) -- 14
	_class_0 = setmetatable({ -- 14
		__init = function(self, ...) -- 14
			return _class_0.__parent.__init(self, ...) -- 14
		end, -- 14
		__base = _base_0, -- 14
		__name = "MachineDing", -- 14
		__parent = _parent_0 -- 14
	}, { -- 14
		__index = function(cls, name) -- 14
			local val = rawget(_base_0, name) -- 14
			if val == nil then -- 14
				local parent = rawget(cls, "__parent") -- 14
				if parent then -- 14
					return parent[name] -- 14
				end -- 14
			else -- 14
				return val -- 14
			end -- 14
		end, -- 14
		__call = function(cls, ...) -- 14
			local _self_0 = setmetatable({ }, _base_0) -- 14
			cls.__init(_self_0, ...) -- 14
			return _self_0 -- 14
		end -- 14
	}) -- 14
	_base_0.__class = _class_0 -- 14
	if _parent_0.__inherited then -- 14
		_parent_0.__inherited(_parent_0, _class_0) -- 14
	end -- 14
	MachineDing = _class_0 -- 14
end -- 25
local MachineBite -- 27
do -- 27
	local _class_0 -- 27
	local _parent_0 = SOUND -- 27
	local _base_0 = { -- 27
		sound = { -- 28
			"npc/headcrab_poison/ph_poisonbite2.wav", -- 28
			"npc/headcrab_poison/ph_poisonbite1.wav", -- 29
			"npc/headcrab_poison/ph_warning1.wav", -- 30
			"npc/headcrab_poison/ph_warning2.wav", -- 31
			"npc/headcrab_poison/ph_warning3.wav", -- 32
			"npc/headcrab_fast/headbite.wav", -- 33
			"npc/barnacle/barnacle_crunch2.wav", -- 34
			"npc/barnacle/barnacle_crunch3.wav" -- 35
		}, -- 36
		pitch = { -- 36
			75, -- 36
			90 -- 36
		} -- 27
	} -- 27
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 36
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 27
			_base_0[_key_0] = _val_0 -- 27
		end -- 27
	end -- 36
	if _base_0.__index == nil then -- 27
		_base_0.__index = _base_0 -- 27
	end -- 36
	setmetatable(_base_0, _parent_0.__base) -- 27
	_class_0 = setmetatable({ -- 27
		__init = function(self, ...) -- 27
			return _class_0.__parent.__init(self, ...) -- 27
		end, -- 27
		__base = _base_0, -- 27
		__name = "MachineBite", -- 27
		__parent = _parent_0 -- 27
	}, { -- 27
		__index = function(cls, name) -- 27
			local val = rawget(_base_0, name) -- 27
			if val == nil then -- 27
				local parent = rawget(cls, "__parent") -- 27
				if parent then -- 27
					return parent[name] -- 27
				end -- 27
			else -- 27
				return val -- 27
			end -- 27
		end, -- 27
		__call = function(cls, ...) -- 27
			local _self_0 = setmetatable({ }, _base_0) -- 27
			cls.__init(_self_0, ...) -- 27
			return _self_0 -- 27
		end -- 27
	}) -- 27
	_base_0.__class = _class_0 -- 27
	if _parent_0.__inherited then -- 27
		_parent_0.__inherited(_parent_0, _class_0) -- 27
	end -- 27
	MachineBite = _class_0 -- 27
end -- 36
local noise = Material("effects/tvscreen_noise001a") -- 38
local screen = Material("glass/glasswindow017a") -- 39
if CLIENT then -- 41
	net.Receive("evilrp_machine_fail", function() -- 42
		local text = net.ReadString() -- 43
		GAMEMODE:Frighten() -- 44
		return chat.AddNonParsedText(Color(200, 0, 0, 255), text) -- 45
	end) -- 42
else -- 47
	util.AddNetworkString("evilrp_machine_fail") -- 47
end -- 41
local Machine -- 49
do -- 49
	local _class_0 -- 49
	local _parent_0 = ENTITY -- 49
	local _base_0 = { -- 49
		Base = "base_anim", -- 51
		Type = "anim", -- 52
		PrintName = "Machine", -- 53
		Category = "EvilRP: Machines", -- 54
		Spawnable = true, -- 55
		AdminSpawnable = true, -- 56
		Interesting = true, -- 58
		Pocketable = false, -- 60
		Precursors = { }, -- 61
		FactoryIdentifier = "", -- 62
		BasePay = 5, -- 64
		SetupDataTables = function(self) -- 64
			self:NetworkVar("String", "Producing") -- 65
			self:NetworkVar("String", "Selection") -- 66
			self:NetworkVar("Int", "ProductionStart") -- 67
			self:NetworkVar("Int", "ProductionEnd") -- 68
			self:NetworkVar("Int", "SoundLoop") -- 69
			self:NetworkVar("Int", "Rust") -- 70
			self:NetworkVar("Int", "CorrectLight") -- 71
			self:NetworkVar("Int", "QueuedItems") -- 72
			for i = 1, 8 do -- 74
				self:NetworkVar("Int", 8 + i, "Button" .. i) -- 75
				self["SetButton" .. i](self, math.random(1, 3)) -- 76
			end -- 76
			local _list_0 = self.Precursors -- 78
			for _index_0 = 1, #_list_0 do -- 78
				local p = _list_0[_index_0] -- 78
				local name = p.name -- 79
				name = tostring(name:sub(1, 1):upper()) .. tostring(name:sub(2, -1)) -- 80
				self:NetworkVar("Int", "Precursor" .. tostring(name)) -- 81
			end -- 81
			self:NetworkVar("Entity", "Worker") -- 83
			return self:NetworkVar("Entity", "Generator") -- 84
		end, -- 86
		RefreshPrecursor = function(self) -- 86
			local gen = self:GetGenerator() -- 87
			if gen and IsValid(gen) then -- 88
				local _list_0 = self.Precursors -- 89
				for _index_0 = 1, #_list_0 do -- 89
					local p = _list_0[_index_0] -- 89
					local name = p.name -- 90
					name = tostring(name:sub(1, 1):upper()) .. tostring(name:sub(2, -1)) -- 91
					self["SetPrecursor" .. tostring(name)](self, gen.precursor_storage[name:lower()] or 0) -- 92
				end -- 92
			end -- 88
		end, -- 94
		Initialize = function(self) -- 94
			self:PositionButtons() -- 95
			if CLIENT then -- 96
				return -- 96
			end -- 96
			local _list_0 = ents.FindByClass("generator") -- 100
			for _index_0 = 1, #_list_0 do -- 100
				local gen = _list_0[_index_0] -- 100
				if gen:GetFactoryIdentifier() == self.FactoryIdentifier then -- 101
					self:SetGenerator(gen) -- 102
					MsgC(Color(0, 200, 0), tostring(self) .. " attached to " .. tostring(gen) .. ".\n") -- 103
					break -- 104
				end -- 101
			end -- 104
			local gen = self:GetGenerator() -- 105
			if not (gen and IsValid(gen)) then -- 106
				return -- 106
			end -- 106
			for i = 1, 8 do -- 107
				self["SetButton" .. tostring(i)](self, math.random(1, 3)) -- 107
			end -- 107
			self:SetUseType(SIMPLE_USE) -- 108
			self:SetModel("models/props_lab/reciever_cart.mdl") -- 109
			self:PhysicsInit(SOLID_VPHYSICS) -- 110
			self:PhysWake() -- 111
			return self:NewLight() -- 112
		end, -- 114
		PositionButtons = function(self) -- 114
			local pos = self:GetPos() -- 115
			local f = self:GetForward() -- 116
			local r = self:GetRight() -- 117
			local u = self:GetUp() -- 118
			self.buttons = { -- 120
				{ -- 120
					pos + u * 18 + f * 13 + r * 6 -- 120
				}, -- 120
				{ -- 121
					pos + u * 18 + f * 13 + r * 3 -- 121
				}, -- 121
				{ -- 122
					pos + u * 18 + f * 13 -- 122
				}, -- 122
				{ -- 123
					pos + u * 18 + f * 13 + r * -3 -- 123
				}, -- 123
				{ -- 124
					pos + u * 18 + f * 13 + r * -6 -- 124
				}, -- 124
				{ -- 125
					pos + u * 18 + f * 13 + r * -9 -- 125
				}, -- 125
				{ -- 126
					pos + u * 18 + f * 13 + r * -12 -- 126
				}, -- 126
				{ -- 127
					pos + u * 18 + f * 13 + r * -15 -- 127
				} -- 127
			} -- 119
		end, -- 130
		Think = function(self) -- 130
			if CLIENT then -- 131
				return -- 131
			end -- 131
			if self:GetSelection() ~= "" and self:GetCorrectLight() == 0 then -- 132
				self:NewLight() -- 132
			end -- 132
			local ct = CurTime() -- 133
			if not self.NextMatRefresh then -- 134
				self.NextMatRefresh = ct -- 134
			end -- 134
			if ct >= self.NextMatRefresh then -- 135
				self.NextMatRefresh = ct + 5 -- 136
				self:RefreshPrecursor() -- 137
			end -- 135
			if self:GetProductionEnd() == 0 and self:GetQueuedItems() > 0 then -- 138
				local found = nil -- 139
				local ks = table.GetKeys(self.Products) -- 140
				for i = 1, #ks do -- 141
					local _continue_0 = false -- 142
					repeat -- 142
						do -- 142
							local k = ks[math.random(1, #ks)] -- 142
							if not self.Products[k] then -- 143
								_continue_0 = true -- 143
								break -- 143
							end -- 143
							if table.IsEmpty(self.Products[k]) then -- 144
								_continue_0 = true -- 144
								break -- 144
							end -- 144
							table.RemoveByValue(ks, k) -- 145
							if GAMEMODE.Stocks[k] then -- 146
							end -- 146
							local nope = false -- 149
							for t, amt in pairs(self.Products[k].precursors) do -- 150
								local name = tostring(t:sub(1, 1):upper()) .. tostring(t:sub(2, -1)) -- 151
								if amt > self["GetPrecursor" .. tostring(name)](self) then -- 152
									nope = true -- 153
									break -- 154
								end -- 152
							end -- 154
							if nope then -- 155
								_continue_0 = true -- 155
								break -- 155
							end -- 155
							found = k -- 156
							ks = nil -- 157
							break -- 158
						end -- 142
						_continue_0 = true -- 142
					until true -- 158
					if not _continue_0 then -- 158
						break -- 158
					end -- 158
				end -- 158
				if not found then -- 159
					self:SetQueuedItems(0) -- 160
					util.ScreenShake(self:GetPos(), 25, 150, 1, 750) -- 161
					local explo = ents.Create("env_explosion") -- 162
					explo:SetOwner(self) -- 164
					explo:SetPos(self:GetPos()) -- 165
					explo:SetKeyValue("iMagnitude", 75) -- 166
					explo:SetKeyValue("iRadiusOverride", 150) -- 167
					explo:Spawn() -- 168
					explo:Activate() -- 169
					explo:Fire("Explode") -- 170
					local fire = ents.Create("env_fire") -- 171
					fire:SetPos(self:GetPos()) -- 173
					fire:SetKeyValue("spawnflags", 1) -- 174
					fire:SetKeyValue("attack", tostring(math.random(10, 15))) -- 175
					fire:SetKeyValue("firesize", tostring(math.random(100, 150))) -- 176
					fire:Spawn() -- 177
					fire:Activate() -- 178
					fire:Fire("Enable", "", del) -- 179
					fire:Fire("StartFire", "", del) -- 180
					SafeRemoveEntityDelayed(fire, math.random(60, 70)) -- 181
					self:GetGenerator().Overload = true -- 182
				else -- 184
					self:SetQueuedItems(math.max(0, self:GetQueuedItems() - 1)) -- 184
					self:SetProducing(found) -- 185
					for t, amt in pairs(self.Products[found].precursors) do -- 186
						self:GetGenerator():AddPrecursor(t, -amt) -- 187
					end -- 187
					self:SetProductionStart(CurTime()) -- 188
					self:SetProductionEnd(CurTime() + self.Products[found].time) -- 189
				end -- 159
			end -- 138
			if self:GetProductionEnd() > 0 and CurTime() >= self:GetProductionEnd() then -- 190
				self:SetRust(math.min(100, self:GetRust() + self.Products[self:GetProducing()].time)) -- 191
				self:ProduceItem(self:GetProducing()) -- 192
				self:EmitSound("ambient/machines/machine1_hit" .. tostring(math.random(1, 2)) .. ".wav") -- 193
				self:StopLoopingSound(self:GetSoundLoop()) -- 194
				self:SetProducing("") -- 195
				self:SetProductionStart(0) -- 196
				return self:SetProductionEnd(0) -- 197
			end -- 190
		end, -- 199
		ProduceItem = function(self, item) -- 199
			return GAMEMODE:AddStock(item) -- 201
		end, -- 203
		Touch = function(self, what) -- 203
			if SERVER then -- 204
				if not what.Precursor then -- 205
					return -- 205
				end -- 205
				local pre, amt -- 206
				local _list_0 = self.Precursors -- 207
				for _index_0 = 1, #_list_0 do -- 207
					local p = _list_0[_index_0] -- 207
					for k, v in pairs(what.Precursor) do -- 208
						if p.name == k then -- 209
							pre = k -- 210
							amt = v -- 211
							if isfunction(amt) then -- 212
								amt = amt(self) -- 212
							end -- 212
							break -- 213
						end -- 209
					end -- 213
				end -- 213
				if not (pre and amt) then -- 214
					return -- 214
				end -- 214
				local rewarded = false -- 215
				local submitter = what:GetNWEntity("evilrp_submitter", NULL) -- 216
				if not what.Processed then -- 217
					what.Processed = true -- 218
					if what.SubmitSound then -- 219
						what:EmitSound(what.SubmitSound) -- 219
					end -- 219
					self:GetGenerator():AddPrecursor(pre, amt) -- 220
					if what.Submitted then -- 221
						what.Submitted(what) -- 221
					end -- 221
					local reward = math.random(10, 15) * amt -- 222
					local rate = GAMEMODE.taxes.labor / 100 -- 223
					local taxed = math.floor(reward * rate) -- 224
					reward = reward - taxed -- 225
					if taxed > 0 then -- 226
						local _obj_0 = GAMEMODE.taxes_stored -- 226
						_obj_0.labor = _obj_0.labor + taxed -- 226
					end -- 226
					reward = math.ceil(reward) -- 227
					if submitter and IsValid(submitter) and submitter:IsPlayer() and submitter:Alive() then -- 228
						submitter:AddMoney(reward, "The Operation") -- 229
					else -- 231
						if reward > 0 then -- 231
							local _obj_0 = GAMEMODE.taxes_stored -- 231
							_obj_0.labor = _obj_0.labor + reward -- 231
						end -- 231
					end -- 228
					what:Remove() -- 232
					if submitter and IsValid(submitter) and submitter:IsPlayer() and submitter:Team() == TEAM_PRIVATE then -- 233
						submitter.precursor_supplied = submitter.precursor_supplied or 0 -- 234
						submitter.precursor_supplied = submitter.precursor_supplied + amt -- 235
						if submitter.precursor_supplied_difference and (submitter.precursor_supplied % 50) < submitter.precursor_supplied_difference then -- 236
							submitter:Notify("<c=0,200,0>Your work ethic makes Liver Failure proud.") -- 237
							submitter:AddStemCells(1) -- 238
						end -- 236
						submitter.precursor_supplied_difference = submitter.precursor_supplied % 50 -- 239
					end -- 233
				end -- 217
			end -- 204
		end, -- 242
		Draw = function(self) -- 242
			self:DrawModel() -- 243
			local gen = self:GetGenerator() -- 244
			if gen and IsValid(gen) then -- 245
				if not gen:GetOn() then -- 246
					return -- 246
				end -- 246
			end -- 245
			local closest = self:GetNearestButton() -- 247
			local pos = self:GetPos() -- 249
			local f = self:GetForward() -- 250
			local r = self:GetRight() -- 251
			local u = self:GetUp() -- 252
			local light_spots = { -- 255
				{ -- 255
					pos + u * 0.5 + f * 14.5 + r * -1, -- 255
					Color(150, 150, 150), -- 255
					"r", -- 255
					button1 -- 255
				}, -- 255
				{ -- 256
					pos + u * 0.5 + f * 14.5 + r * -6, -- 256
					Color(0, 150, 0), -- 256
					"g", -- 256
					button2 -- 256
				}, -- 256
				{ -- 257
					pos + u * 0.5 + f * 14.5 + r * -11.5, -- 257
					Color(0, 0, 150), -- 257
					"b", -- 257
					button3 -- 257
				} -- 257
			} -- 254
			local idx = 0 -- 259
			local ct = CurTime() -- 260
			for _index_0 = 1, #light_spots do -- 261
				local light = light_spots[_index_0] -- 261
				idx = idx + 1 -- 262
				local g, b -- 263
				do -- 263
					local _obj_0 = light[2] -- 263
					r, g, b = _obj_0.r, _obj_0.g, _obj_0.b -- 263
				end -- 263
				local col = Color(r, g, b, 255) -- 264
				render.SetMaterial(light[4]) -- 265
				if self:GetCorrectLight() == idx then -- 266
					render.DrawSprite(light[1], 4 + math.abs(math.sin(ct) * 4), 4 + math.abs(math.sin(ct) * 4), col) -- 268
				else -- 270
					render.DrawSprite(light[1], 4, 4, col) -- 270
				end -- 266
			end -- 270
			for k, v in ipairs(self.buttons) do -- 271
				idx = self["GetButton" .. tostring(k)](self) -- 272
				local mats = { -- 273
					button1, -- 273
					button2, -- 273
					button3 -- 273
				} -- 273
				local col -- 274
				if idx == 0 then -- 275
					render.SetMaterial(default0) -- 276
					col = Color(100, 100, 100, 255) -- 277
				else -- 279
					render.SetMaterial(mats[idx]) -- 279
					col = colors[idx] -- 280
					if k == closest then -- 281
						r = math.max(0, col.r + (50 * math.sin(ct * 3))) -- 282
						local g = math.max(0, col.g + (50 * math.sin(ct * 3))) -- 283
						local b = math.max(0, col.b + (50 * math.sin(ct * 3))) -- 284
						col = Color(r, g, b) -- 285
					else -- 287
						r = math.max(0, col.r + (100 * math.cos(ct))) -- 287
						local g = math.max(0, col.g + (100 * math.cos(ct))) -- 288
						local b = math.max(0, col.b + (100 * math.cos(ct))) -- 289
						col = Color(r, g, b) -- 290
					end -- 281
				end -- 275
				render.DrawSprite(v[1], 4, 4, col) -- 291
			end -- 291
			return self:Render3D2D() -- 292
		end, -- 294
		OnTakeDamage = function(self, dmg) -- 294
			local attacker = dmg:GetAttacker() -- 295
			if attacker and IsValid(attacker) then -- 296
				if attacker:IsPlayer() then -- 297
					local _exp_0 = attacker:Team() -- 298
					if TEAM_SANITAR == _exp_0 then -- 299
						local rust = self:GetRust() -- 300
						self:SetRust(math.max(0, rust - (dmg:GetDamage() * .2))) -- 301
						local reward = math.floor(math.abs(rust - self:GetRust()) * 3) -- 302
						if reward > 0 then -- 303
							return attacker:AddMoney(reward, "The Cleansing") -- 304
						end -- 303
					end -- 304
				end -- 297
			end -- 296
		end, -- 306
		Use = function(self, ply) -- 306
			local gen = self:GetGenerator() -- 309
			if gen and not gen:GetOn() then -- 310
				net.Start("evilrp_machine_fail") -- 311
				net.WriteString("There's no power.") -- 312
				net.Send(ply) -- 313
				return -- 314
			elseif not ply:CanUseMachines() then -- 316
				net.Start("evilrp_machine_fail") -- 317
				net.WriteString("UNAUTHORIZED PERSONNEL") -- 318
				net.Send(ply) -- 319
				self:EmitSound("ambient/alarms/klaxon1.wav") -- 320
				timer.Simple(1, function() -- 321
					local tr = util.TraceLine({ -- 323
						start = self:GetPos(), -- 323
						endpos = ply:EyePos(), -- 324
						filter = self -- 325
					}) -- 322
					util.ParticleTracerEx("vortigaunt_beam", tr.StartPos, tr.HitPos, false, self:EntIndex(), 3) -- 327
					self:EmitSound("beams/beamstart5.wav") -- 328
					local dmg = DamageInfo() -- 329
					dmg:SetDamage(65) -- 331
					dmg:SetDamageType(DMG_SHOCK) -- 332
					dmg:SetAttacker(self) -- 333
					dmg:SetInflictor(self) -- 334
					dmg:SetDamagePosition(ply:EyePos()) -- 335
					return ply:TakeDamageInfo(dmg) -- 336
				end) -- 321
				return -- 337
			end -- 310
			if self:GetRust() >= 100 and math.random(1, 3) == 1 then -- 340
				self:EmitSound("MachineBite") -- 341
				ply:TakeDamage(math.random(4, 6)) -- 342
				if math.random(1, 4) == 1 then -- 343
					self:Ignite(math.random(3, 6), 510) -- 343
				end -- 343
			end -- 340
			local button = self:GetNearestButton(ply) -- 345
			if button then -- 346
				if button > 0 then -- 347
					local idx = self["GetButton" .. tostring(button)](self) -- 348
					if idx ~= self:GetCorrectLight() and idx > 0 then -- 349
						self:EmitSound("ambient/alarms/klaxon1.wav") -- 350
						return timer.Simple(1, function() -- 351
							local tr = util.TraceLine({ -- 353
								start = self:GetPos(), -- 353
								endpos = ply:EyePos(), -- 354
								filter = self -- 355
							}) -- 352
							util.ParticleTracerEx("vortigaunt_beam", tr.StartPos, tr.HitPos, false, self:EntIndex(), 3) -- 357
							self:EmitSound("beams/beamstart5.wav") -- 358
							local dmg = DamageInfo() -- 359
							dmg:SetDamage(25) -- 361
							dmg:SetDamageType(DMG_SHOCK) -- 362
							dmg:SetAttacker(self) -- 363
							dmg:SetInflictor(self) -- 364
							dmg:SetDamagePosition(ply:EyePos()) -- 365
							return ply:TakeDamageInfo(dmg) -- 366
						end) -- 366
					elseif idx == 0 then -- 367
						return self:EmitSound("buttons/button2.wav", 75, math.random(75, 95)) -- 368
					else -- 370
						self:EmitSound("MachineDing") -- 370
						local left = false -- 371
						self["SetButton" .. tostring(button)](self, 0) -- 372
						for k, v in ipairs(self.buttons) do -- 373
							if self["GetButton" .. tostring(k)](self) == idx then -- 374
								left = true -- 374
							end -- 374
						end -- 374
						local reward = self.BasePay -- 375
						local rate = GAMEMODE.taxes.labor / 100 -- 376
						local taxed = math.floor(reward * rate) -- 377
						reward = reward - taxed -- 378
						if taxed > 0 then -- 379
							local _obj_0 = GAMEMODE.taxes_stored -- 379
							_obj_0.labor = _obj_0.labor + taxed -- 379
						end -- 379
						if gen.Overload then -- 380
							self:EmitSound("ambient/energy/zap" .. tostring(math.random(1, 3)) .. ".wav") -- 381
							local dmg = DamageInfo() -- 382
							dmg:SetDamage(math.random(4, 6)) -- 384
							dmg:SetDamageType(DMG_SHOCK) -- 385
							dmg:SetAttacker(self) -- 386
							dmg:SetInflictor(self) -- 387
							dmg:SetDamagePosition(self:EyePos()) -- 388
							ply:TakeDamageInfo(dmg) -- 389
							local vp = self:GetPos() -- 390
							local ed = EffectData() -- 391
							ed:SetOrigin(vp) -- 393
							ed:SetScale(1) -- 394
							ed:SetMagnitude(1) -- 395
							ed:SetRadius(3) -- 396
							util.Effect("Sparks", ed) -- 397
						end -- 380
						ply:AddMoney(reward, "The Grind") -- 398
						self:Reward(ply) -- 399
						if (not left) or math.random(1, 100) <= 50 then -- 400
							return self:NewLight(ply) -- 400
						end -- 400
					end -- 349
				end -- 347
			end -- 346
		end, -- 402
		Reward = function(self, ply) -- 402
			if not (ply:Team() == TEAM_PRIVATE) then -- 403
				return -- 403
			end -- 403
			ply.buttons_pushed = ply.buttons_pushed or 0 -- 404
			ply.buttons_pushed = ply.buttons_pushed + 1 -- 405
			if ply.buttons_pushed % 50 == 0 then -- 406
				ply:Notify("<c=0,200,0>Your work ethic makes your leader proud.") -- 407
				return ply:AddStemCells(1) -- 408
			end -- 406
		end, -- 410
		GetNearestButton = function(self, who) -- 410
			if (not who or not IsValid(who)) then -- 411
				who = LocalPlayer() -- 411
			end -- 411
			if self.buttons then -- 412
				local start = who:GetShootPos() -- 413
				local endpos = start + who:GetAimVector() * 96 -- 414
				local tr = util.TraceLine({ -- 416
					start = start, -- 416
					endpos = endpos, -- 417
					filter = who -- 418
				}) -- 415
				local HitPos = tr.HitPos -- 420
				if HitPos then -- 421
					for k, v in ipairs(self.buttons) do -- 422
						if (v[1]:Distance(HitPos) <= 2) then -- 423
							return k -- 423
						end -- 423
					end -- 423
				end -- 421
			end -- 412
		end, -- 425
		NewLight = function(self, ply) -- 425
			local olight = self:GetCorrectLight() -- 426
			local set = { -- 427
				1, -- 427
				2, -- 427
				3 -- 427
			} -- 427
			local forbidden = { -- 428
				1, -- 428
				2, -- 428
				3 -- 428
			} -- 428
			local finished = true -- 429
			for k, v in ipairs(self.buttons) do -- 430
				local idx = self["GetButton" .. tostring(k)](self) -- 431
				if idx > 0 then -- 432
					finished = false -- 433
					if idx ~= olight then -- 434
						table.RemoveByValue(forbidden, idx) -- 434
					end -- 434
				end -- 432
			end -- 434
			for k, v in ipairs(forbidden) do -- 435
				table.RemoveByValue(set, v) -- 435
			end -- 435
			local nlight = set[math.random(1, #set)] -- 436
			if finished then -- 437
				self:SetQueuedItems(self:GetQueuedItems() + 1) -- 438
				for i = 1, 8 do -- 439
					self["SetButton" .. tostring(i)](self, math.random(1, 3)) -- 439
				end -- 439
				local idx = math.random(1, 8) -- 440
				self:EmitSound("items/suitchargeok1.wav", 75, math.random(75, 95)) -- 441
				return self:SetCorrectLight(self["GetButton" .. tostring(idx)](self)) -- 442
			elseif nlight then -- 443
				self:EmitSound("ambient/tones/elev1.wav", 75, math.random(75, 95)) -- 444
				return self:SetCorrectLight(nlight) -- 445
			end -- 437
		end, -- 447
		Render3D2D = function(self) -- 447
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 448
			if not (dist_sqr < 128 ^ 2) then -- 449
				return -- 449
			end -- 449
			local gen = self:GetGenerator() -- 450
			if gen and IsValid(gen) and (not gen:GetOn()) then -- 451
				return -- 451
			end -- 451
			local ct = CurTime() -- 452
			local lp = LocalPlayer() -- 453
			local pos = self:GetPos() + self:GetUp() * 28 + self:GetForward() * 13 + self:GetRight() * 7.4 -- 454
			local ang = self:GetAngles() -- 455
			ang:RotateAroundAxis(ang:Up(), -90) -- 457
			ang:RotateAroundAxis(ang:Forward(), 90) -- 458
			ang:RotateAroundAxis(ang:Right(), -180) -- 459
			local desp = (lp:GetDespair() * 0.01) -- 460
			local font = "Spleen_Label" -- 462
			cam.Start3D2D(pos, ang, 0.1) -- 463
			local txt = self.PrintName -- 464
			local col = HSVToColor((ct * 23) % 180, 1, 1) -- 465
			surface.SetMaterial(noise) -- 468
			surface.DrawTexturedRect(0, 0, 236, 78) -- 469
			local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 471
			txt_obj:Draw(120, 24, 1, TEXT_ALIGN_CENTER) -- 472
			cam.End3D2D() -- 473
			font = "Spleen_Label_Small" -- 475
			pos = self:GetPos() + self:GetUp() * 14.7 + self:GetForward() * 13 + self:GetRight() * 3 -- 476
			ang = self:GetAngles() -- 477
			ang:RotateAroundAxis(ang:Up(), -90) -- 479
			ang:RotateAroundAxis(ang:Forward(), 90) -- 480
			ang:RotateAroundAxis(ang:Right(), -180) -- 481
			cam.Start3D2D(pos, ang, 0.1) -- 482
			local py = 0 -- 483
			local _list_0 = self.Precursors -- 484
			for _index_0 = 1, #_list_0 do -- 484
				local p = _list_0[_index_0] -- 484
				local name = p.name -- 485
				name = tostring(name:sub(1, 1):upper()) .. tostring(name:sub(2, -1)) -- 486
				local pre_amt = self["GetPrecursor" .. tostring(name)](self) -- 487
				txt = tostring(pre_amt) .. " " .. tostring(p.name) -- 488
				local font -- 489
				font = "Spleen_Autodealer" -- 489
				txt_obj = scribe.Parse("<stutter><rgb=1,1,60><wiggle=" .. tostring(5 * desp) .. "," .. tostring(15 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(3 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 491
				txt_obj:Draw(75, py, 1, TEXT_ALIGN_CENTER) -- 492
				py = py + txt_obj:GetTall() -- 493
			end -- 493
			cam.End3D2D() -- 494
			font = "Spleen_Label_Small" -- 496
			pos = self:GetPos() + self:GetUp() * 10.7 + self:GetForward() * 13 + self:GetRight() * 6.15 -- 497
			cam.Start3D2D(pos, ang, 0.1) -- 498
			local rust = self:GetRust() -- 499
			local empty = true -- 500
			local _list_1 = self.Precursors -- 501
			for _index_0 = 1, #_list_1 do -- 501
				local p = _list_1[_index_0] -- 501
				local name = p.name -- 502
				name = tostring(name:sub(1, 1):upper()) .. tostring(name:sub(2, -1)) -- 503
				local cur_amt = self["GetPrecursor" .. tostring(name)](self) -- 504
				if cur_amt > 0 then -- 505
					empty = false -- 506
					break -- 507
				end -- 505
			end -- 507
			txt = "i'm " .. tostring(rust) .. "% rusted" -- 508
			if rust < 1 then -- 509
				txt = "give me purpose" -- 509
			end -- 509
			if rust >= 100 then -- 510
				txt = "I'M ROTTEN. HELP" -- 510
			end -- 510
			if empty then -- 511
				txt = "FEED ME" -- 511
			end -- 511
			local prod = self:GetProducing() -- 512
			if prod ~= "" then -- 513
				local etab = scripted_ents.Get(prod) or weapons.Get(prod) -- 514
				txt = etab.PrintName -- 515
			end -- 513
			surface.SetDrawColor(0, 0, 0, 255) -- 518
			surface.DrawRect(0, 0, 209, 56) -- 519
			local production_start = self:GetProductionStart() -- 522
			local production_end = self:GetProductionEnd() -- 523
			if production_end > 0 then -- 524
				local cur = ct - production_start -- 525
				local ending = production_end - production_start -- 526
				surface.SetDrawColor(0, 150 + (100 * math.cos(ct)), 0, 255) -- 527
				surface.DrawRect(0, 0, 209 * (cur / ending), 56) -- 528
			elseif rust >= 100 then -- 529
				surface.SetDrawColor(150 + (100 * math.cos(ct)), 0, 0, 255) -- 530
				surface.DrawRect(0, 0, 209 * (rust / 100), 56) -- 531
			else -- 533
				surface.SetDrawColor(147, 58 + (29 * math.cos(ct)), 22, 255) -- 533
				surface.DrawRect(0, 0, 209 * (rust / 100), 56) -- 534
			end -- 524
			txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(2 * desp) .. "," .. tostring(20 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(5 * desp) .. "," .. tostring(0.666 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 536
			txt_obj:Draw(105, 16, 1, TEXT_ALIGN_CENTER) -- 537
			return cam.End3D2D() -- 538
		end -- 49
	} -- 49
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 541
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 49
			_base_0[_key_0] = _val_0 -- 49
		end -- 49
	end -- 541
	if _base_0.__index == nil then -- 49
		_base_0.__index = _base_0 -- 49
	end -- 541
	setmetatable(_base_0, _parent_0.__base) -- 49
	_class_0 = setmetatable({ -- 49
		__init = function(self, ...) -- 49
			return _class_0.__parent.__init(self, ...) -- 49
		end, -- 49
		__base = _base_0, -- 49
		__name = "Machine", -- 49
		__parent = _parent_0 -- 49
	}, { -- 49
		__index = function(cls, name) -- 49
			local val = rawget(_base_0, name) -- 49
			if val == nil then -- 49
				local parent = rawget(cls, "__parent") -- 49
				if parent then -- 49
					return parent[name] -- 49
				end -- 49
			else -- 49
				return val -- 49
			end -- 49
		end, -- 49
		__call = function(cls, ...) -- 49
			local _self_0 = setmetatable({ }, _base_0) -- 49
			cls.__init(_self_0, ...) -- 49
			return _self_0 -- 49
		end -- 49
	}) -- 49
	_base_0.__class = _class_0 -- 49
	if _parent_0.__inherited then -- 49
		_parent_0.__inherited(_parent_0, _class_0) -- 49
	end -- 49
	Machine = _class_0 -- 49
end -- 541
local Tools -- 543
do -- 543
	local _class_0 -- 543
	local _parent_0 = Machine -- 543
	local _base_0 = { -- 543
		PrintName = "Tool Machine", -- 545
		BasePay = 7, -- 546
		Precursors = { -- 547
			{ -- 547
				name = "metal" -- 547
			}, -- 547
			{ -- 548
				name = "wood" -- 548
			} -- 548
		}, -- 549
		Reward = function(self, ply) -- 549
			if not (ply:Team() == TEAM_PRIVATE) then -- 550
				return -- 550
			end -- 550
			ply.buttons_pushed = ply.buttons_pushed or 0 -- 551
			ply.buttons_pushed = ply.buttons_pushed + 2 -- 552
			if ply.buttons_pushed % 50 == 0 then -- 553
				ply:Notify("<c=0,200,0>Your work ethic makes your leader proud.") -- 554
				return ply:AddStemCells(1) -- 555
			end -- 553
		end, -- 556
		Products = { -- 557
			["evilrp_melee/crowbar"] = { -- 558
				precursors = { -- 559
					metal = 3 -- 559
				}, -- 558
				time = 10 -- 560
			}, -- 557
			["evilrp_melee/knife"] = { -- 562
				precursors = { -- 563
					metal = 2 -- 563
				}, -- 562
				time = 15 -- 564
			}, -- 561
			["evilrp_melee/pipe"] = { -- 566
				precursors = { -- 567
					metal = 2 -- 567
				}, -- 566
				time = 10 -- 568
			}, -- 565
			["evilrp_melee/pickaxe"] = { -- 570
				precursors = { -- 571
					metal = 5, -- 571
					wood = 2 -- 572
				}, -- 570
				time = 20 -- 573
			}, -- 569
			["evilrp_melee/shovel"] = { -- 575
				precursors = { -- 576
					metal = 4, -- 576
					wood = 3 -- 577
				}, -- 575
				time = 20 -- 578
			}, -- 574
			["evilrp_melee/pot"] = { -- 580
				precursors = { -- 581
					metal = 1 -- 581
				}, -- 580
				time = 10 -- 582
			} -- 579
		}, -- 583
		FactoryIdentifier = "tools" -- 543
	} -- 543
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 583
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 543
			_base_0[_key_0] = _val_0 -- 543
		end -- 543
	end -- 583
	if _base_0.__index == nil then -- 543
		_base_0.__index = _base_0 -- 543
	end -- 583
	setmetatable(_base_0, _parent_0.__base) -- 543
	_class_0 = setmetatable({ -- 543
		__init = function(self, ...) -- 543
			return _class_0.__parent.__init(self, ...) -- 543
		end, -- 543
		__base = _base_0, -- 543
		__name = "Tools", -- 543
		__parent = _parent_0 -- 543
	}, { -- 543
		__index = function(cls, name) -- 543
			local val = rawget(_base_0, name) -- 543
			if val == nil then -- 543
				local parent = rawget(cls, "__parent") -- 543
				if parent then -- 543
					return parent[name] -- 543
				end -- 543
			else -- 543
				return val -- 543
			end -- 543
		end, -- 543
		__call = function(cls, ...) -- 543
			local _self_0 = setmetatable({ }, _base_0) -- 543
			cls.__init(_self_0, ...) -- 543
			return _self_0 -- 543
		end -- 543
	}) -- 543
	_base_0.__class = _class_0 -- 543
	if _parent_0.__inherited then -- 543
		_parent_0.__inherited(_parent_0, _class_0) -- 543
	end -- 543
	Tools = _class_0 -- 543
end -- 583
local Food -- 584
do -- 584
	local _class_0 -- 584
	local _parent_0 = Machine -- 584
	local _base_0 = { -- 584
		PrintName = "Food Machine", -- 586
		BasePay = 3, -- 587
		Precursors = { -- 588
			{ -- 588
				name = "biomass" -- 588
			}, -- 588
			{ -- 589
				name = "fluid" -- 589
			} -- 589
		}, -- 590
		Products = { -- 591
			["item/food/soyloaf"] = { -- 592
				precursors = { -- 593
					biomass = 1 -- 593
				}, -- 592
				time = 6 -- 594
			}, -- 591
			["item/food/drink/fearbeer"] = { -- 596
				precursors = { -- 597
					biomass = 3 -- 597
				}, -- 596
				time = 7 -- 598
			}, -- 595
			["item/food/drink/smearbeer"] = { -- 600
				precursors = { -- 601
					biomass = 4 -- 601
				}, -- 600
				time = 8 -- 602
			}, -- 599
			["item/food/drink/shake"] = { -- 604
				precursors = { -- 605
					biomass = 4 -- 605
				}, -- 604
				time = 6 -- 606
			}, -- 603
			["item/food/moldmelon"] = { -- 608
				precursors = { -- 609
					biomass = 2 -- 609
				}, -- 608
				time = 9 -- 610
			}, -- 607
			["item/food/drink/twitchel"] = { -- 612
				precursors = { -- 613
					biomass = 2 -- 613
				}, -- 612
				time = 5 -- 614
			} -- 611
		}, -- 615
		FactoryIdentifier = "food" -- 584
	} -- 584
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 615
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 584
			_base_0[_key_0] = _val_0 -- 584
		end -- 584
	end -- 615
	if _base_0.__index == nil then -- 584
		_base_0.__index = _base_0 -- 584
	end -- 615
	setmetatable(_base_0, _parent_0.__base) -- 584
	_class_0 = setmetatable({ -- 584
		__init = function(self, ...) -- 584
			return _class_0.__parent.__init(self, ...) -- 584
		end, -- 584
		__base = _base_0, -- 584
		__name = "Food", -- 584
		__parent = _parent_0 -- 584
	}, { -- 584
		__index = function(cls, name) -- 584
			local val = rawget(_base_0, name) -- 584
			if val == nil then -- 584
				local parent = rawget(cls, "__parent") -- 584
				if parent then -- 584
					return parent[name] -- 584
				end -- 584
			else -- 584
				return val -- 584
			end -- 584
		end, -- 584
		__call = function(cls, ...) -- 584
			local _self_0 = setmetatable({ }, _base_0) -- 584
			cls.__init(_self_0, ...) -- 584
			return _self_0 -- 584
		end -- 584
	}) -- 584
	_base_0.__class = _class_0 -- 584
	if _parent_0.__inherited then -- 584
		_parent_0.__inherited(_parent_0, _class_0) -- 584
	end -- 584
	Food = _class_0 -- 584
end -- 615
local Weapons -- 616
do -- 616
	local _class_0 -- 616
	local _parent_0 = Machine -- 616
	local _base_0 = { -- 616
		PrintName = "Weapons Machine", -- 618
		BasePay = 10, -- 619
		Precursors = { -- 620
			{ -- 620
				name = "metal" -- 620
			}, -- 620
			{ -- 621
				name = "polymer" -- 621
			} -- 621
		}, -- 623
		Reward = function(self, ply) -- 623
			if not (ply:Team() == TEAM_PRIVATE) then -- 624
				return -- 624
			end -- 624
			ply.buttons_pushed = ply.buttons_pushed or 0 -- 625
			ply.buttons_pushed = ply.buttons_pushed + 3 -- 626
			if ply.buttons_pushed % 50 == 0 then -- 627
				ply:Notify("<c=0,200,0>Your work ethic makes your leader proud.") -- 628
				return ply:AddStemCells(1) -- 629
			end -- 627
		end, -- 630
		Products = { -- 631
			["evilrp_weapon/bodyguard"] = { -- 632
				precursors = { -- 633
					metal = 5 -- 633
				}, -- 632
				time = 20 -- 634
			}, -- 631
			["evilrp_weapon/warrant"] = { -- 636
				precursors = { -- 637
					metal = 5 -- 637
				}, -- 636
				time = 20 -- 638
			}, -- 635
			["evilrp_weapon/hope"] = { -- 640
				precursors = { -- 641
					metal = 4 -- 641
				}, -- 640
				time = 20 -- 642
			}, -- 639
			["evilrp_weapon/enforcer"] = { -- 644
				precursors = { -- 645
					metal = 7 -- 645
				}, -- 644
				time = 25 -- 646
			}, -- 643
			["evilrp_weapon/viper"] = { -- 648
				precursors = { -- 649
					metal = 6 -- 649
				}, -- 648
				time = 25 -- 650
			}, -- 647
			["evilrp_weapon/brainpaster"] = { -- 652
				precursors = { -- 653
					metal = 5, -- 653
					polymer = 1 -- 654
				}, -- 652
				time = 20 -- 655
			}, -- 651
			["evilrp_weapon/subjugator"] = { -- 657
				precursors = { -- 658
					metal = 7, -- 658
					polymer = 3 -- 659
				}, -- 657
				time = 25 -- 660
			}, -- 656
			["evilrp_weapon/painkiller"] = { -- 662
				precursors = { -- 663
					metal = 4, -- 663
					polymer = 2 -- 664
				}, -- 662
				time = 20 -- 665
			}, -- 661
			["evilrp_weapon/candlewood"] = { -- 667
				precursors = { -- 668
					metal = 4, -- 668
					polymer = 4 -- 669
				}, -- 667
				time = 25 -- 670
			}, -- 666
			["evilrp_weapon/obliterator"] = { -- 672
				precursors = { -- 673
					metal = 8, -- 673
					polymer = 5 -- 674
				}, -- 672
				time = 30 -- 675
			}, -- 671
			["evilrp_weapon/trooper"] = { -- 677
				precursors = { -- 678
					metal = 11, -- 678
					polymer = 7 -- 679
				}, -- 677
				time = 30 -- 680
			} -- 676
		}, -- 681
		FactoryIdentifier = "weapons" -- 616
	} -- 616
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 681
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 616
			_base_0[_key_0] = _val_0 -- 616
		end -- 616
	end -- 681
	if _base_0.__index == nil then -- 616
		_base_0.__index = _base_0 -- 616
	end -- 681
	setmetatable(_base_0, _parent_0.__base) -- 616
	_class_0 = setmetatable({ -- 616
		__init = function(self, ...) -- 616
			return _class_0.__parent.__init(self, ...) -- 616
		end, -- 616
		__base = _base_0, -- 616
		__name = "Weapons", -- 616
		__parent = _parent_0 -- 616
	}, { -- 616
		__index = function(cls, name) -- 616
			local val = rawget(_base_0, name) -- 616
			if val == nil then -- 616
				local parent = rawget(cls, "__parent") -- 616
				if parent then -- 616
					return parent[name] -- 616
				end -- 616
			else -- 616
				return val -- 616
			end -- 616
		end, -- 616
		__call = function(cls, ...) -- 616
			local _self_0 = setmetatable({ }, _base_0) -- 616
			cls.__init(_self_0, ...) -- 616
			return _self_0 -- 616
		end -- 616
	}) -- 616
	_base_0.__class = _class_0 -- 616
	if _parent_0.__inherited then -- 616
		_parent_0.__inherited(_parent_0, _class_0) -- 616
	end -- 616
	Weapons = _class_0 -- 616
end -- 681
local Medicine -- 682
do -- 682
	local _class_0 -- 682
	local _parent_0 = Machine -- 682
	local _base_0 = { -- 682
		PrintName = "Medicine Machine", -- 684
		BasePay = 7, -- 685
		Reward = function(self, ply) -- 685
			if not (ply:Team() == TEAM_PRIVATE) then -- 686
				return -- 686
			end -- 686
			ply.buttons_pushed = ply.buttons_pushed or 0 -- 687
			ply.buttons_pushed = ply.buttons_pushed + 2 -- 688
			if ply.buttons_pushed % 50 == 0 then -- 689
				ply:Notify("<c=0,200,0>Your work ethic makes your leader proud.") -- 690
				return ply:AddStemCells(1) -- 691
			end -- 689
		end, -- 692
		Precursors = { -- 693
			{ -- 693
				name = "biomass" -- 693
			}, -- 693
			{ -- 694
				name = "metal" -- 694
			} -- 694
		}, -- 695
		Products = { -- 696
			["item/food/medicine/pills"] = { -- 697
				precursors = { -- 698
					biomass = 2, -- 698
					metal = 1 -- 699
				}, -- 697
				time = 10 -- 700
			}, -- 696
			["item/food/medicine/ablativepaste"] = { -- 702
				precursors = { -- 703
					biomass = 3, -- 703
					metal = 1 -- 704
				}, -- 702
				time = 10 -- 705
			}, -- 701
			["item/food/medicine/bleach"] = { -- 707
				precursors = { -- 708
					biomass = 2, -- 708
					metal = 1 -- 709
				}, -- 707
				time = 10 -- 710
			} -- 706
		}, -- 712
		FactoryIdentifier = "medicine" -- 682
	} -- 682
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 712
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 682
			_base_0[_key_0] = _val_0 -- 682
		end -- 682
	end -- 712
	if _base_0.__index == nil then -- 682
		_base_0.__index = _base_0 -- 682
	end -- 712
	setmetatable(_base_0, _parent_0.__base) -- 682
	_class_0 = setmetatable({ -- 682
		__init = function(self, ...) -- 682
			return _class_0.__parent.__init(self, ...) -- 682
		end, -- 682
		__base = _base_0, -- 682
		__name = "Medicine", -- 682
		__parent = _parent_0 -- 682
	}, { -- 682
		__index = function(cls, name) -- 682
			local val = rawget(_base_0, name) -- 682
			if val == nil then -- 682
				local parent = rawget(cls, "__parent") -- 682
				if parent then -- 682
					return parent[name] -- 682
				end -- 682
			else -- 682
				return val -- 682
			end -- 682
		end, -- 682
		__call = function(cls, ...) -- 682
			local _self_0 = setmetatable({ }, _base_0) -- 682
			cls.__init(_self_0, ...) -- 682
			return _self_0 -- 682
		end -- 682
	}) -- 682
	_base_0.__class = _class_0 -- 682
	if _parent_0.__inherited then -- 682
		_parent_0.__inherited(_parent_0, _class_0) -- 682
	end -- 682
	Medicine = _class_0 -- 682
end -- 712
local Evil_Squeal -- 714
do -- 714
	local _class_0 -- 714
	local _parent_0 = SOUND -- 714
	local _base_0 = { -- 714
		sound = (function() -- 715
			local _accum_0 = { } -- 715
			local _len_0 = 1 -- 715
			for i = 1, 4 do -- 715
				_accum_0[_len_0] = "placenta/coinkeeper" .. tostring(i) .. ".wav" -- 715
				_len_0 = _len_0 + 1 -- 715
			end -- 715
			return _accum_0 -- 715
		end)(), -- 716
		level = SNDLVL_70DB, -- 717
		pitch = { -- 717
			70, -- 717
			85 -- 717
		} -- 714
	} -- 714
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 717
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 714
			_base_0[_key_0] = _val_0 -- 714
		end -- 714
	end -- 717
	if _base_0.__index == nil then -- 714
		_base_0.__index = _base_0 -- 714
	end -- 717
	setmetatable(_base_0, _parent_0.__base) -- 714
	_class_0 = setmetatable({ -- 714
		__init = function(self, ...) -- 714
			return _class_0.__parent.__init(self, ...) -- 714
		end, -- 714
		__base = _base_0, -- 714
		__name = "Evil_Squeal", -- 714
		__parent = _parent_0 -- 714
	}, { -- 714
		__index = function(cls, name) -- 714
			local val = rawget(_base_0, name) -- 714
			if val == nil then -- 714
				local parent = rawget(cls, "__parent") -- 714
				if parent then -- 714
					return parent[name] -- 714
				end -- 714
			else -- 714
				return val -- 714
			end -- 714
		end, -- 714
		__call = function(cls, ...) -- 714
			local _self_0 = setmetatable({ }, _base_0) -- 714
			cls.__init(_self_0, ...) -- 714
			return _self_0 -- 714
		end -- 714
	}) -- 714
	_base_0.__class = _class_0 -- 714
	if _parent_0.__inherited then -- 714
		_parent_0.__inherited(_parent_0, _class_0) -- 714
	end -- 714
	Evil_Squeal = _class_0 -- 714
end -- 717
local Evil -- 719
do -- 719
	local _class_0 -- 719
	local _parent_0 = Machine -- 719
	local _base_0 = { -- 719
		PrintName = "Evil Machine", -- 721
		Precursors = { -- 722
			{ -- 722
				name = "metal" -- 722
			}, -- 722
			{ -- 723
				name = "wood" -- 723
			} -- 723
		}, -- 724
		Products = { -- 725
			["evilrp_weapon/mark"] = { -- 726
				precursors = { -- 727
					metal = 6 -- 727
				}, -- 726
				time = 20 -- 728
			}, -- 725
			["evilrp_weapon/coach"] = { -- 730
				precursors = { -- 731
					metal = 10, -- 731
					wood = 5 -- 732
				}, -- 730
				time = 30 -- 733
			}, -- 729
			["evilrp_weapon/obrez"] = { -- 735
				precursors = { -- 736
					metal = 5, -- 736
					wood = 3 -- 737
				}, -- 735
				time = 30 -- 738
			}, -- 734
			["evilrp_weapon/greaser"] = { -- 740
				precursors = { -- 741
					metal = 14 -- 741
				}, -- 740
				time = 35 -- 742
			}, -- 739
			["evilrp_weapon/owler"] = { -- 744
				precursors = { -- 745
					metal = 7, -- 745
					wood = 3 -- 746
				}, -- 744
				time = 30 -- 747
			}, -- 743
			["evilrp_weapon/prettyboy"] = { -- 749
				precursors = { -- 750
					metal = 7, -- 750
					wood = 2 -- 751
				}, -- 749
				time = 30 -- 752
			}, -- 748
			["evilrp_weapon/viper"] = { -- 754
				precursors = { -- 755
					metal = 4, -- 755
					wood = 2 -- 756
				}, -- 754
				time = 30 -- 757
			} -- 753
		}, -- 759
		ProduceItem = function(self, item) -- 759
			local etab = scripted_ents.Get(item) -- 761
			local weapon -- 762
			if not etab then -- 763
				etab = weapons.Get(item) -- 765
				weapon = true -- 766
			end -- 763
			local product -- 767
			if weapon then -- 768
				product = ents.Create("evilrp/spawned/weapon") -- 769
				product:SetModel(etab.WorldModel) -- 771
				product:SetWeaponClass(item) -- 772
			else -- 774
				product = ents.Create(item) -- 774
			end -- 768
			product:SetPos(self:GetPos() + Vector(0, 0, -12) + (self:GetForward() * 8)) -- 775
			product:Spawn() -- 776
			product:Activate() -- 777
			self:EmitSound("Evil_Squeal") -- 778
			return product -- 779
		end, -- 781
		Shift = function(self) -- 781
			if not SERVER then -- 782
				return -- 782
			end -- 782
			local map = game.GetMap() -- 783
			if not EVIL_MACHINE_POSITIONS_CURSED[map] then -- 784
				return -- 784
			end -- 784
			local positions_all -- 785
			do -- 785
				local _tab_0 = { } -- 785
				local _obj_0 = EVIL_MACHINE_POSITIONS_CURSED[map] -- 785
				local _idx_0 = 1 -- 785
				for _key_0, _value_0 in pairs(_obj_0) do -- 785
					if _idx_0 == _key_0 then -- 785
						_tab_0[#_tab_0 + 1] = _value_0 -- 785
						_idx_0 = _idx_0 + 1 -- 785
					else -- 785
						_tab_0[_key_0] = _value_0 -- 785
					end -- 785
				end -- 785
				positions_all = _tab_0 -- 785
			end -- 785
			local positions = { } -- 786
			local our_pos = self:GetPos() -- 788
			for k, v in pairs(positions_all) do -- 789
				if not (our_pos == v.machine.pos) then -- 790
					positions[#positions + 1] = v -- 791
				end -- 790
			end -- 791
			local where = positions[math.random(#positions)] -- 792
			local where_mach = where.machine -- 793
			local where_gen = where.generator -- 794
			self:EmitSound("Evil_Squeal") -- 795
			self:SetPos(where_mach.pos) -- 796
			self:SetAngles(where_mach.ang) -- 797
			local gen = self:GetGenerator() -- 798
			gen:SetPos(where_gen.pos) -- 800
			gen:SetAngles(where_gen.ang) -- 801
			gen:SetRust(0) -- 802
			gen:SetFuel(0) -- 803
			if gen:GetOn() then -- 804
				gen:SetOn(false) -- 805
				gen:StopLoopingSound(gen:GetSoundLoop()) -- 806
				gen.Overload = false -- 807
			end -- 804
			self:PositionButtons() -- 808
			self:SetRust(0) -- 809
			return MsgC(Color(200, 0, 0), "The evil machine shifted.\n") -- 810
		end, -- 812
		Think = function(self) -- 812
			_class_0.__parent.__base.Think(self) -- 813
			local ct = CurTime() -- 814
			if not self.next_shift then -- 815
				self.next_shift = ct + 5 -- 815
			end -- 815
			if ct >= self.next_shift then -- 816
				if self:GetProducing() == "" then -- 817
					self.next_shift = ct + math.random(300, 900) -- 818
					return self:Shift() -- 819
				end -- 817
			end -- 816
		end, -- 821
		FactoryIdentifier = "evil" -- 719
	} -- 719
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 821
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 719
			_base_0[_key_0] = _val_0 -- 719
		end -- 719
	end -- 821
	if _base_0.__index == nil then -- 719
		_base_0.__index = _base_0 -- 719
	end -- 821
	setmetatable(_base_0, _parent_0.__base) -- 719
	_class_0 = setmetatable({ -- 719
		__init = function(self, ...) -- 719
			return _class_0.__parent.__init(self, ...) -- 719
		end, -- 719
		__base = _base_0, -- 719
		__name = "Evil", -- 719
		__parent = _parent_0 -- 719
	}, { -- 719
		__index = function(cls, name) -- 719
			local val = rawget(_base_0, name) -- 719
			if val == nil then -- 719
				local parent = rawget(cls, "__parent") -- 719
				if parent then -- 719
					return parent[name] -- 719
				end -- 719
			else -- 719
				return val -- 719
			end -- 719
		end, -- 719
		__call = function(cls, ...) -- 719
			local _self_0 = setmetatable({ }, _base_0) -- 719
			cls.__init(_self_0, ...) -- 719
			return _self_0 -- 719
		end -- 719
	}) -- 719
	_base_0.__class = _class_0 -- 719
	if _parent_0.__inherited then -- 719
		_parent_0.__inherited(_parent_0, _class_0) -- 719
	end -- 719
	Evil = _class_0 -- 719
	return _class_0 -- 821
end -- 821
