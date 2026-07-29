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
				if what.Rust then -- 205
					self:SetRust(math.Clamp(self:GetRust() + what.Rust, 0, 100)) -- 206
					self:EmitSound("ambient/machines/machine1_hit1.wav") -- 207
					local pos = what:GetPos() -- 208
					local ed = EffectData() -- 209
					ed:SetOrigin(pos) -- 211
					ed:SetScale(1) -- 212
					ed:SetMagnitude(1) -- 213
					ed:SetRadius(3) -- 214
					util.Effect("Sparks", ed) -- 215
					what:Trash() -- 216
					return -- 217
				end -- 205
				if not what.Precursor then -- 218
					return -- 218
				end -- 218
				local pre, amt -- 219
				local _list_0 = self.Precursors -- 220
				for _index_0 = 1, #_list_0 do -- 220
					local p = _list_0[_index_0] -- 220
					for k, v in pairs(what.Precursor) do -- 221
						if p.name == k then -- 222
							pre = k -- 223
							amt = v -- 224
							if isfunction(amt) then -- 225
								amt = amt(self) -- 225
							end -- 225
							break -- 226
						end -- 222
					end -- 226
				end -- 226
				if not (pre and amt) then -- 227
					return -- 227
				end -- 227
				local rewarded = false -- 228
				local submitter = what:GetNWEntity("evilrp_submitter", NULL) -- 229
				if not what.Processed then -- 230
					what.Processed = true -- 231
					if what.SubmitSound then -- 232
						what:EmitSound(what.SubmitSound) -- 232
					end -- 232
					self:GetGenerator():AddPrecursor(pre, amt) -- 233
					if what.Submitted then -- 234
						what.Submitted(what) -- 234
					end -- 234
					local reward = math.random(10, 15) * amt -- 235
					local rate = GAMEMODE.taxes.labor / 100 -- 236
					local taxed = math.floor(reward * rate) -- 237
					reward = reward - taxed -- 238
					if taxed > 0 then -- 239
						local _obj_0 = GAMEMODE.taxes_stored -- 239
						_obj_0.labor = _obj_0.labor + taxed -- 239
					end -- 239
					reward = math.ceil(reward) -- 240
					if submitter and IsValid(submitter) and submitter:IsPlayer() and submitter:Alive() then -- 241
						submitter:AddMoney(reward, "The Operation") -- 242
					else -- 244
						if reward > 0 then -- 244
							local _obj_0 = GAMEMODE.taxes_stored -- 244
							_obj_0.labor = _obj_0.labor + reward -- 244
						end -- 244
					end -- 241
					what:Remove() -- 245
					if submitter and IsValid(submitter) and submitter:IsPlayer() and submitter:Team() == TEAM_PRIVATE then -- 246
						submitter.precursor_supplied = submitter.precursor_supplied or 0 -- 247
						submitter.precursor_supplied = submitter.precursor_supplied + amt -- 248
						if submitter.precursor_supplied_difference and (submitter.precursor_supplied % 50) < submitter.precursor_supplied_difference then -- 249
							submitter:Notify("<c=0,200,0>Your work ethic makes Liver Failure proud.") -- 250
							submitter:AddStemCells(1) -- 251
						end -- 249
						submitter.precursor_supplied_difference = submitter.precursor_supplied % 50 -- 252
					end -- 246
				end -- 230
			end -- 204
		end, -- 255
		Draw = function(self) -- 255
			self:DrawModel() -- 256
			local gen = self:GetGenerator() -- 257
			if gen and IsValid(gen) then -- 258
				if not gen:GetOn() then -- 259
					return -- 259
				end -- 259
			end -- 258
			local closest = self:GetNearestButton() -- 260
			local pos = self:GetPos() -- 262
			local f = self:GetForward() -- 263
			local r = self:GetRight() -- 264
			local u = self:GetUp() -- 265
			local light_spots = { -- 268
				{ -- 268
					pos + u * 0.5 + f * 14.5 + r * -1, -- 268
					Color(150, 150, 150), -- 268
					"r", -- 268
					button1 -- 268
				}, -- 268
				{ -- 269
					pos + u * 0.5 + f * 14.5 + r * -6, -- 269
					Color(0, 150, 0), -- 269
					"g", -- 269
					button2 -- 269
				}, -- 269
				{ -- 270
					pos + u * 0.5 + f * 14.5 + r * -11.5, -- 270
					Color(0, 0, 150), -- 270
					"b", -- 270
					button3 -- 270
				} -- 270
			} -- 267
			local idx = 0 -- 272
			local ct = CurTime() -- 273
			for _index_0 = 1, #light_spots do -- 274
				local light = light_spots[_index_0] -- 274
				idx = idx + 1 -- 275
				local g, b -- 276
				do -- 276
					local _obj_0 = light[2] -- 276
					r, g, b = _obj_0.r, _obj_0.g, _obj_0.b -- 276
				end -- 276
				local col = Color(r, g, b, 255) -- 277
				render.SetMaterial(light[4]) -- 278
				if self:GetCorrectLight() == idx then -- 279
					render.DrawSprite(light[1], 4 + math.abs(math.sin(ct) * 4), 4 + math.abs(math.sin(ct) * 4), col) -- 281
				else -- 283
					render.DrawSprite(light[1], 4, 4, col) -- 283
				end -- 279
			end -- 283
			for k, v in ipairs(self.buttons) do -- 284
				idx = self["GetButton" .. tostring(k)](self) -- 285
				local mats = { -- 286
					button1, -- 286
					button2, -- 286
					button3 -- 286
				} -- 286
				local col -- 287
				if idx == 0 then -- 288
					render.SetMaterial(default0) -- 289
					col = Color(100, 100, 100, 255) -- 290
				else -- 292
					render.SetMaterial(mats[idx]) -- 292
					col = colors[idx] -- 293
					if k == closest then -- 294
						r = math.max(0, col.r + (50 * math.sin(ct * 3))) -- 295
						local g = math.max(0, col.g + (50 * math.sin(ct * 3))) -- 296
						local b = math.max(0, col.b + (50 * math.sin(ct * 3))) -- 297
						col = Color(r, g, b) -- 298
					else -- 300
						r = math.max(0, col.r + (100 * math.cos(ct))) -- 300
						local g = math.max(0, col.g + (100 * math.cos(ct))) -- 301
						local b = math.max(0, col.b + (100 * math.cos(ct))) -- 302
						col = Color(r, g, b) -- 303
					end -- 294
				end -- 288
				render.DrawSprite(v[1], 4, 4, col) -- 304
			end -- 304
			return self:Render3D2D() -- 305
		end, -- 307
		OnTakeDamage = function(self, dmg) -- 307
			local attacker = dmg:GetAttacker() -- 308
			if attacker and IsValid(attacker) then -- 309
				if attacker:IsPlayer() then -- 310
					local _exp_0 = attacker:Team() -- 311
					if TEAM_SANITAR == _exp_0 or TEAM_CONSCRIPT == _exp_0 then -- 312
						local rust = self:GetRust() -- 313
						self:SetRust(math.max(0, rust - (dmg:GetDamage() * .2))) -- 314
						local reward = math.floor(math.abs(rust - self:GetRust()) * 3) -- 315
						if reward > 0 then -- 316
							return attacker:AddMoney(reward, "The Cleansing") -- 317
						end -- 316
					end -- 317
				end -- 310
			end -- 309
		end, -- 319
		Use = function(self, ply) -- 319
			local gen = self:GetGenerator() -- 322
			if gen and not gen:GetOn() then -- 323
				net.Start("evilrp_machine_fail") -- 324
				net.WriteString("There's no power.") -- 325
				net.Send(ply) -- 326
				return -- 327
			elseif not ply:CanUseMachines() then -- 329
				net.Start("evilrp_machine_fail") -- 330
				net.WriteString("UNAUTHORIZED PERSONNEL") -- 331
				net.Send(ply) -- 332
				self:EmitSound("ambient/alarms/klaxon1.wav") -- 333
				timer.Simple(1, function() -- 334
					local tr = util.TraceLine({ -- 336
						start = self:GetPos(), -- 336
						endpos = ply:EyePos(), -- 337
						filter = self -- 338
					}) -- 335
					util.ParticleTracerEx("vortigaunt_beam", tr.StartPos, tr.HitPos, false, self:EntIndex(), 3) -- 340
					self:EmitSound("beams/beamstart5.wav") -- 341
					local dmg = DamageInfo() -- 342
					dmg:SetDamage(65) -- 344
					dmg:SetDamageType(DMG_SHOCK) -- 345
					dmg:SetAttacker(self) -- 346
					dmg:SetInflictor(self) -- 347
					dmg:SetDamagePosition(ply:EyePos()) -- 348
					return ply:TakeDamageInfo(dmg) -- 349
				end) -- 334
				return -- 350
			end -- 323
			if self:GetRust() >= 100 and math.random(1, 3) == 1 then -- 353
				self:EmitSound("MachineBite") -- 354
				ply:TakeDamage(math.random(4, 6)) -- 355
				if math.random(1, 4) == 1 then -- 356
					self:Ignite(math.random(3, 6), 510) -- 356
				end -- 356
			end -- 353
			local button = self:GetNearestButton(ply) -- 358
			if button then -- 359
				if button > 0 then -- 360
					local idx = self["GetButton" .. tostring(button)](self) -- 361
					if idx ~= self:GetCorrectLight() and idx > 0 then -- 362
						self:EmitSound("ambient/alarms/klaxon1.wav") -- 363
						return timer.Simple(1, function() -- 364
							local tr = util.TraceLine({ -- 366
								start = self:GetPos(), -- 366
								endpos = ply:EyePos(), -- 367
								filter = self -- 368
							}) -- 365
							util.ParticleTracerEx("vortigaunt_beam", tr.StartPos, tr.HitPos, false, self:EntIndex(), 3) -- 370
							self:EmitSound("beams/beamstart5.wav") -- 371
							local dmg = DamageInfo() -- 372
							dmg:SetDamage(25) -- 374
							dmg:SetDamageType(DMG_SHOCK) -- 375
							dmg:SetAttacker(self) -- 376
							dmg:SetInflictor(self) -- 377
							dmg:SetDamagePosition(ply:EyePos()) -- 378
							return ply:TakeDamageInfo(dmg) -- 379
						end) -- 379
					elseif idx == 0 then -- 380
						return self:EmitSound("buttons/button2.wav", 75, math.random(75, 95)) -- 381
					else -- 383
						self:EmitSound("MachineDing") -- 383
						local left = false -- 384
						self["SetButton" .. tostring(button)](self, 0) -- 385
						for k, v in ipairs(self.buttons) do -- 386
							if self["GetButton" .. tostring(k)](self) == idx then -- 387
								left = true -- 387
							end -- 387
						end -- 387
						local reward = self.BasePay -- 388
						local rate = GAMEMODE.taxes.labor / 100 -- 389
						local taxed = math.floor(reward * rate) -- 390
						reward = reward - taxed -- 391
						if taxed > 0 then -- 392
							local _obj_0 = GAMEMODE.taxes_stored -- 392
							_obj_0.labor = _obj_0.labor + taxed -- 392
						end -- 392
						if gen.Overload then -- 393
							self:EmitSound("ambient/energy/zap" .. tostring(math.random(1, 3)) .. ".wav") -- 394
							local dmg = DamageInfo() -- 395
							dmg:SetDamage(math.random(4, 6)) -- 397
							dmg:SetDamageType(DMG_SHOCK) -- 398
							dmg:SetAttacker(self) -- 399
							dmg:SetInflictor(self) -- 400
							dmg:SetDamagePosition(self:EyePos()) -- 401
							ply:TakeDamageInfo(dmg) -- 402
							local vp = self:GetPos() -- 403
							local ed = EffectData() -- 404
							ed:SetOrigin(vp) -- 406
							ed:SetScale(1) -- 407
							ed:SetMagnitude(1) -- 408
							ed:SetRadius(3) -- 409
							util.Effect("Sparks", ed) -- 410
						end -- 393
						ply:AddMoney(reward, "The Grind") -- 411
						self:Reward(ply) -- 412
						if (not left) or math.random(1, 100) <= 50 then -- 413
							return self:NewLight(ply) -- 413
						end -- 413
					end -- 362
				end -- 360
			end -- 359
		end, -- 415
		Reward = function(self, ply) -- 415
			if not (ply:Team() == TEAM_PRIVATE) then -- 416
				return -- 416
			end -- 416
			ply.buttons_pushed = ply.buttons_pushed or 0 -- 417
			ply.buttons_pushed = ply.buttons_pushed + 1 -- 418
			if ply.buttons_pushed % 50 == 0 then -- 419
				ply:Notify("<c=0,200,0>Your work ethic makes your leader proud.") -- 420
				return ply:AddStemCells(1) -- 421
			end -- 419
		end, -- 423
		GetNearestButton = function(self, who) -- 423
			if (not who or not IsValid(who)) then -- 424
				who = LocalPlayer() -- 424
			end -- 424
			if self.buttons then -- 425
				local start = who:GetShootPos() -- 426
				local endpos = start + who:GetAimVector() * 96 -- 427
				local tr = util.TraceLine({ -- 429
					start = start, -- 429
					endpos = endpos, -- 430
					filter = who -- 431
				}) -- 428
				local HitPos = tr.HitPos -- 433
				if HitPos then -- 434
					for k, v in ipairs(self.buttons) do -- 435
						if (v[1]:Distance(HitPos) <= 2) then -- 436
							return k -- 436
						end -- 436
					end -- 436
				end -- 434
			end -- 425
		end, -- 438
		NewLight = function(self, ply) -- 438
			local olight = self:GetCorrectLight() -- 439
			local set = { -- 440
				1, -- 440
				2, -- 440
				3 -- 440
			} -- 440
			local forbidden = { -- 441
				1, -- 441
				2, -- 441
				3 -- 441
			} -- 441
			local finished = true -- 442
			for k, v in ipairs(self.buttons) do -- 443
				local idx = self["GetButton" .. tostring(k)](self) -- 444
				if idx > 0 then -- 445
					finished = false -- 446
					if idx ~= olight then -- 447
						table.RemoveByValue(forbidden, idx) -- 447
					end -- 447
				end -- 445
			end -- 447
			for k, v in ipairs(forbidden) do -- 448
				table.RemoveByValue(set, v) -- 448
			end -- 448
			local nlight = set[math.random(1, #set)] -- 449
			if finished then -- 450
				self:SetQueuedItems(self:GetQueuedItems() + 1) -- 451
				for i = 1, 8 do -- 452
					self["SetButton" .. tostring(i)](self, math.random(1, 3)) -- 452
				end -- 452
				local idx = math.random(1, 8) -- 453
				self:EmitSound("items/suitchargeok1.wav", 75, math.random(75, 95)) -- 454
				return self:SetCorrectLight(self["GetButton" .. tostring(idx)](self)) -- 455
			elseif nlight then -- 456
				self:EmitSound("ambient/tones/elev1.wav", 75, math.random(75, 95)) -- 457
				return self:SetCorrectLight(nlight) -- 458
			end -- 450
		end, -- 460
		Render3D2D = function(self) -- 460
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 461
			if not (dist_sqr < 128 ^ 2) then -- 462
				return -- 462
			end -- 462
			local gen = self:GetGenerator() -- 463
			if gen and IsValid(gen) and (not gen:GetOn()) then -- 464
				return -- 464
			end -- 464
			local ct = CurTime() -- 465
			local lp = LocalPlayer() -- 466
			local pos = self:GetPos() + self:GetUp() * 28 + self:GetForward() * 13 + self:GetRight() * 7.4 -- 467
			local ang = self:GetAngles() -- 468
			ang:RotateAroundAxis(ang:Up(), -90) -- 470
			ang:RotateAroundAxis(ang:Forward(), 90) -- 471
			ang:RotateAroundAxis(ang:Right(), -180) -- 472
			local desp = (lp:GetDespair() * 0.01) -- 473
			local font = "Spleen_Label" -- 475
			cam.Start3D2D(pos, ang, 0.1) -- 476
			local txt = self.PrintName -- 477
			local col = HSVToColor((ct * 23) % 180, 1, 1) -- 478
			surface.SetMaterial(noise) -- 481
			surface.DrawTexturedRect(0, 0, 236, 78) -- 482
			local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 484
			txt_obj:Draw(120, 24, 1, TEXT_ALIGN_CENTER) -- 485
			cam.End3D2D() -- 486
			font = "Spleen_Label_Small" -- 488
			pos = self:GetPos() + self:GetUp() * 14.7 + self:GetForward() * 13 + self:GetRight() * 3 -- 489
			ang = self:GetAngles() -- 490
			ang:RotateAroundAxis(ang:Up(), -90) -- 492
			ang:RotateAroundAxis(ang:Forward(), 90) -- 493
			ang:RotateAroundAxis(ang:Right(), -180) -- 494
			cam.Start3D2D(pos, ang, 0.1) -- 495
			local py = 0 -- 496
			local _list_0 = self.Precursors -- 497
			for _index_0 = 1, #_list_0 do -- 497
				local p = _list_0[_index_0] -- 497
				local name = p.name -- 498
				name = tostring(name:sub(1, 1):upper()) .. tostring(name:sub(2, -1)) -- 499
				local pre_amt = self["GetPrecursor" .. tostring(name)](self) -- 500
				txt = tostring(pre_amt) .. " " .. tostring(p.name) -- 501
				local font -- 502
				font = "Spleen_Autodealer" -- 502
				txt_obj = scribe.Parse("<stutter><rgb=1,1,60><wiggle=" .. tostring(5 * desp) .. "," .. tostring(15 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(3 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 504
				txt_obj:Draw(75, py, 1, TEXT_ALIGN_CENTER) -- 505
				py = py + txt_obj:GetTall() -- 506
			end -- 506
			cam.End3D2D() -- 507
			font = "Spleen_Label_Small" -- 509
			pos = self:GetPos() + self:GetUp() * 10.7 + self:GetForward() * 13 + self:GetRight() * 6.15 -- 510
			cam.Start3D2D(pos, ang, 0.1) -- 511
			local rust = self:GetRust() -- 512
			local empty = true -- 513
			local _list_1 = self.Precursors -- 514
			for _index_0 = 1, #_list_1 do -- 514
				local p = _list_1[_index_0] -- 514
				local name = p.name -- 515
				name = tostring(name:sub(1, 1):upper()) .. tostring(name:sub(2, -1)) -- 516
				local cur_amt = self["GetPrecursor" .. tostring(name)](self) -- 517
				if cur_amt > 0 then -- 518
					empty = false -- 519
					break -- 520
				end -- 518
			end -- 520
			txt = "i'm " .. tostring(rust) .. "% rusted" -- 521
			if rust < 1 then -- 522
				txt = "give me purpose" -- 522
			end -- 522
			if rust >= 100 then -- 523
				txt = "I'M ROTTEN. HELP" -- 523
			end -- 523
			if empty then -- 524
				txt = "FEED ME" -- 524
			end -- 524
			local prod = self:GetProducing() -- 525
			if prod ~= "" then -- 526
				local etab = scripted_ents.Get(prod) or weapons.Get(prod) -- 527
				txt = etab.PrintName -- 528
			end -- 526
			surface.SetDrawColor(0, 0, 0, 255) -- 531
			surface.DrawRect(0, 0, 209, 56) -- 532
			local production_start = self:GetProductionStart() -- 535
			local production_end = self:GetProductionEnd() -- 536
			if production_end > 0 then -- 537
				local cur = ct - production_start -- 538
				local ending = production_end - production_start -- 539
				surface.SetDrawColor(0, 150 + (100 * math.cos(ct)), 0, 255) -- 540
				surface.DrawRect(0, 0, 209 * (cur / ending), 56) -- 541
			elseif rust >= 100 then -- 542
				surface.SetDrawColor(150 + (100 * math.cos(ct)), 0, 0, 255) -- 543
				surface.DrawRect(0, 0, 209 * (rust / 100), 56) -- 544
			else -- 546
				surface.SetDrawColor(147, 58 + (29 * math.cos(ct)), 22, 255) -- 546
				surface.DrawRect(0, 0, 209 * (rust / 100), 56) -- 547
			end -- 537
			txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(2 * desp) .. "," .. tostring(20 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(5 * desp) .. "," .. tostring(0.666 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 549
			txt_obj:Draw(105, 16, 1, TEXT_ALIGN_CENTER) -- 550
			return cam.End3D2D() -- 551
		end -- 49
	} -- 49
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 554
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 49
			_base_0[_key_0] = _val_0 -- 49
		end -- 49
	end -- 554
	if _base_0.__index == nil then -- 49
		_base_0.__index = _base_0 -- 49
	end -- 554
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
end -- 554
local Tools -- 556
do -- 556
	local _class_0 -- 556
	local _parent_0 = Machine -- 556
	local _base_0 = { -- 556
		PrintName = "Tool Machine", -- 558
		BasePay = 7, -- 559
		Precursors = { -- 560
			{ -- 560
				name = "metal" -- 560
			}, -- 560
			{ -- 561
				name = "wood" -- 561
			} -- 561
		}, -- 562
		Reward = function(self, ply) -- 562
			if not (ply:Team() == TEAM_PRIVATE) then -- 563
				return -- 563
			end -- 563
			ply.buttons_pushed = ply.buttons_pushed or 0 -- 564
			ply.buttons_pushed = ply.buttons_pushed + 2 -- 565
			if ply.buttons_pushed % 50 == 0 then -- 566
				ply:Notify("<c=0,200,0>Your work ethic makes your leader proud.") -- 567
				return ply:AddStemCells(1) -- 568
			end -- 566
		end, -- 569
		Products = { -- 570
			["evilrp_melee/crowbar"] = { -- 571
				precursors = { -- 572
					metal = 3 -- 572
				}, -- 571
				time = 10 -- 573
			}, -- 570
			["evilrp_melee/knife"] = { -- 575
				precursors = { -- 576
					metal = 2 -- 576
				}, -- 575
				time = 15 -- 577
			}, -- 574
			["evilrp_melee/pipe"] = { -- 579
				precursors = { -- 580
					metal = 2 -- 580
				}, -- 579
				time = 10 -- 581
			}, -- 578
			["evilrp_melee/pickaxe"] = { -- 583
				precursors = { -- 584
					metal = 5, -- 584
					wood = 2 -- 585
				}, -- 583
				time = 20 -- 586
			}, -- 582
			["evilrp_melee/shovel"] = { -- 588
				precursors = { -- 589
					metal = 4, -- 589
					wood = 3 -- 590
				}, -- 588
				time = 20 -- 591
			}, -- 587
			["evilrp_melee/pot"] = { -- 593
				precursors = { -- 594
					metal = 1 -- 594
				}, -- 593
				time = 10 -- 595
			} -- 592
		}, -- 596
		FactoryIdentifier = "tools" -- 556
	} -- 556
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 596
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 556
			_base_0[_key_0] = _val_0 -- 556
		end -- 556
	end -- 596
	if _base_0.__index == nil then -- 556
		_base_0.__index = _base_0 -- 556
	end -- 596
	setmetatable(_base_0, _parent_0.__base) -- 556
	_class_0 = setmetatable({ -- 556
		__init = function(self, ...) -- 556
			return _class_0.__parent.__init(self, ...) -- 556
		end, -- 556
		__base = _base_0, -- 556
		__name = "Tools", -- 556
		__parent = _parent_0 -- 556
	}, { -- 556
		__index = function(cls, name) -- 556
			local val = rawget(_base_0, name) -- 556
			if val == nil then -- 556
				local parent = rawget(cls, "__parent") -- 556
				if parent then -- 556
					return parent[name] -- 556
				end -- 556
			else -- 556
				return val -- 556
			end -- 556
		end, -- 556
		__call = function(cls, ...) -- 556
			local _self_0 = setmetatable({ }, _base_0) -- 556
			cls.__init(_self_0, ...) -- 556
			return _self_0 -- 556
		end -- 556
	}) -- 556
	_base_0.__class = _class_0 -- 556
	if _parent_0.__inherited then -- 556
		_parent_0.__inherited(_parent_0, _class_0) -- 556
	end -- 556
	Tools = _class_0 -- 556
end -- 596
local Food -- 597
do -- 597
	local _class_0 -- 597
	local _parent_0 = Machine -- 597
	local _base_0 = { -- 597
		PrintName = "Food Machine", -- 599
		BasePay = 3, -- 600
		Precursors = { -- 601
			{ -- 601
				name = "biomass" -- 601
			}, -- 601
			{ -- 602
				name = "fluid" -- 602
			} -- 602
		}, -- 603
		Products = { -- 604
			["item/food/soyloaf"] = { -- 605
				precursors = { -- 606
					biomass = 1 -- 606
				}, -- 605
				time = 6 -- 607
			}, -- 604
			["item/food/drink/fearbeer"] = { -- 609
				precursors = { -- 610
					biomass = 3 -- 610
				}, -- 609
				time = 7 -- 611
			}, -- 608
			["item/food/drink/smearbeer"] = { -- 613
				precursors = { -- 614
					biomass = 4 -- 614
				}, -- 613
				time = 8 -- 615
			}, -- 612
			["item/food/drink/shake"] = { -- 617
				precursors = { -- 618
					biomass = 4 -- 618
				}, -- 617
				time = 6 -- 619
			}, -- 616
			["item/food/moldmelon"] = { -- 621
				precursors = { -- 622
					biomass = 2 -- 622
				}, -- 621
				time = 9 -- 623
			}, -- 620
			["item/food/drink/twitchel"] = { -- 625
				precursors = { -- 626
					biomass = 2 -- 626
				}, -- 625
				time = 5 -- 627
			} -- 624
		}, -- 628
		FactoryIdentifier = "food" -- 597
	} -- 597
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 628
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 597
			_base_0[_key_0] = _val_0 -- 597
		end -- 597
	end -- 628
	if _base_0.__index == nil then -- 597
		_base_0.__index = _base_0 -- 597
	end -- 628
	setmetatable(_base_0, _parent_0.__base) -- 597
	_class_0 = setmetatable({ -- 597
		__init = function(self, ...) -- 597
			return _class_0.__parent.__init(self, ...) -- 597
		end, -- 597
		__base = _base_0, -- 597
		__name = "Food", -- 597
		__parent = _parent_0 -- 597
	}, { -- 597
		__index = function(cls, name) -- 597
			local val = rawget(_base_0, name) -- 597
			if val == nil then -- 597
				local parent = rawget(cls, "__parent") -- 597
				if parent then -- 597
					return parent[name] -- 597
				end -- 597
			else -- 597
				return val -- 597
			end -- 597
		end, -- 597
		__call = function(cls, ...) -- 597
			local _self_0 = setmetatable({ }, _base_0) -- 597
			cls.__init(_self_0, ...) -- 597
			return _self_0 -- 597
		end -- 597
	}) -- 597
	_base_0.__class = _class_0 -- 597
	if _parent_0.__inherited then -- 597
		_parent_0.__inherited(_parent_0, _class_0) -- 597
	end -- 597
	Food = _class_0 -- 597
end -- 628
local Weapons -- 629
do -- 629
	local _class_0 -- 629
	local _parent_0 = Machine -- 629
	local _base_0 = { -- 629
		PrintName = "Weapons Machine", -- 631
		BasePay = 10, -- 632
		Precursors = { -- 633
			{ -- 633
				name = "metal" -- 633
			}, -- 633
			{ -- 634
				name = "polymer" -- 634
			} -- 634
		}, -- 636
		Reward = function(self, ply) -- 636
			if not (ply:Team() == TEAM_PRIVATE) then -- 637
				return -- 637
			end -- 637
			ply.buttons_pushed = ply.buttons_pushed or 0 -- 638
			ply.buttons_pushed = ply.buttons_pushed + 3 -- 639
			if ply.buttons_pushed % 50 == 0 then -- 640
				ply:Notify("<c=0,200,0>Your work ethic makes your leader proud.") -- 641
				return ply:AddStemCells(1) -- 642
			end -- 640
		end, -- 643
		Products = { -- 644
			["evilrp_weapon/bodyguard"] = { -- 645
				precursors = { -- 646
					metal = 5 -- 646
				}, -- 645
				time = 20 -- 647
			}, -- 644
			["evilrp_weapon/warrant"] = { -- 649
				precursors = { -- 650
					metal = 5 -- 650
				}, -- 649
				time = 20 -- 651
			}, -- 648
			["evilrp_weapon/hope"] = { -- 653
				precursors = { -- 654
					metal = 4 -- 654
				}, -- 653
				time = 20 -- 655
			}, -- 652
			["evilrp_weapon/enforcer"] = { -- 657
				precursors = { -- 658
					metal = 7 -- 658
				}, -- 657
				time = 25 -- 659
			}, -- 656
			["evilrp_weapon/viper"] = { -- 661
				precursors = { -- 662
					metal = 6 -- 662
				}, -- 661
				time = 25 -- 663
			}, -- 660
			["evilrp_weapon/brainpaster"] = { -- 665
				precursors = { -- 666
					metal = 5, -- 666
					polymer = 1 -- 667
				}, -- 665
				time = 20 -- 668
			}, -- 664
			["evilrp_weapon/subjugator"] = { -- 670
				precursors = { -- 671
					metal = 7, -- 671
					polymer = 3 -- 672
				}, -- 670
				time = 25 -- 673
			}, -- 669
			["evilrp_weapon/painkiller"] = { -- 675
				precursors = { -- 676
					metal = 4, -- 676
					polymer = 2 -- 677
				}, -- 675
				time = 20 -- 678
			}, -- 674
			["evilrp_weapon/candlewood"] = { -- 680
				precursors = { -- 681
					metal = 4, -- 681
					polymer = 4 -- 682
				}, -- 680
				time = 25 -- 683
			}, -- 679
			["evilrp_weapon/obliterator"] = { -- 685
				precursors = { -- 686
					metal = 8, -- 686
					polymer = 5 -- 687
				}, -- 685
				time = 30 -- 688
			}, -- 684
			["evilrp_weapon/trooper"] = { -- 690
				precursors = { -- 691
					metal = 11, -- 691
					polymer = 7 -- 692
				}, -- 690
				time = 30 -- 693
			} -- 689
		}, -- 694
		FactoryIdentifier = "weapons" -- 629
	} -- 629
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 694
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 629
			_base_0[_key_0] = _val_0 -- 629
		end -- 629
	end -- 694
	if _base_0.__index == nil then -- 629
		_base_0.__index = _base_0 -- 629
	end -- 694
	setmetatable(_base_0, _parent_0.__base) -- 629
	_class_0 = setmetatable({ -- 629
		__init = function(self, ...) -- 629
			return _class_0.__parent.__init(self, ...) -- 629
		end, -- 629
		__base = _base_0, -- 629
		__name = "Weapons", -- 629
		__parent = _parent_0 -- 629
	}, { -- 629
		__index = function(cls, name) -- 629
			local val = rawget(_base_0, name) -- 629
			if val == nil then -- 629
				local parent = rawget(cls, "__parent") -- 629
				if parent then -- 629
					return parent[name] -- 629
				end -- 629
			else -- 629
				return val -- 629
			end -- 629
		end, -- 629
		__call = function(cls, ...) -- 629
			local _self_0 = setmetatable({ }, _base_0) -- 629
			cls.__init(_self_0, ...) -- 629
			return _self_0 -- 629
		end -- 629
	}) -- 629
	_base_0.__class = _class_0 -- 629
	if _parent_0.__inherited then -- 629
		_parent_0.__inherited(_parent_0, _class_0) -- 629
	end -- 629
	Weapons = _class_0 -- 629
end -- 694
local Medicine -- 695
do -- 695
	local _class_0 -- 695
	local _parent_0 = Machine -- 695
	local _base_0 = { -- 695
		PrintName = "Medicine Machine", -- 697
		BasePay = 7, -- 698
		Reward = function(self, ply) -- 698
			if not (ply:Team() == TEAM_PRIVATE) then -- 699
				return -- 699
			end -- 699
			ply.buttons_pushed = ply.buttons_pushed or 0 -- 700
			ply.buttons_pushed = ply.buttons_pushed + 2 -- 701
			if ply.buttons_pushed % 50 == 0 then -- 702
				ply:Notify("<c=0,200,0>Your work ethic makes your leader proud.") -- 703
				return ply:AddStemCells(1) -- 704
			end -- 702
		end, -- 705
		Precursors = { -- 706
			{ -- 706
				name = "biomass" -- 706
			}, -- 706
			{ -- 707
				name = "metal" -- 707
			} -- 707
		}, -- 708
		Products = { -- 709
			["item/food/medicine/pills"] = { -- 710
				precursors = { -- 711
					biomass = 2, -- 711
					metal = 1 -- 712
				}, -- 710
				time = 10 -- 713
			}, -- 709
			["item/food/medicine/ablativepaste"] = { -- 715
				precursors = { -- 716
					biomass = 3, -- 716
					metal = 1 -- 717
				}, -- 715
				time = 10 -- 718
			}, -- 714
			["item/food/medicine/bleach"] = { -- 720
				precursors = { -- 721
					biomass = 2, -- 721
					metal = 1 -- 722
				}, -- 720
				time = 10 -- 723
			} -- 719
		}, -- 725
		FactoryIdentifier = "medicine" -- 695
	} -- 695
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 725
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 695
			_base_0[_key_0] = _val_0 -- 695
		end -- 695
	end -- 725
	if _base_0.__index == nil then -- 695
		_base_0.__index = _base_0 -- 695
	end -- 725
	setmetatable(_base_0, _parent_0.__base) -- 695
	_class_0 = setmetatable({ -- 695
		__init = function(self, ...) -- 695
			return _class_0.__parent.__init(self, ...) -- 695
		end, -- 695
		__base = _base_0, -- 695
		__name = "Medicine", -- 695
		__parent = _parent_0 -- 695
	}, { -- 695
		__index = function(cls, name) -- 695
			local val = rawget(_base_0, name) -- 695
			if val == nil then -- 695
				local parent = rawget(cls, "__parent") -- 695
				if parent then -- 695
					return parent[name] -- 695
				end -- 695
			else -- 695
				return val -- 695
			end -- 695
		end, -- 695
		__call = function(cls, ...) -- 695
			local _self_0 = setmetatable({ }, _base_0) -- 695
			cls.__init(_self_0, ...) -- 695
			return _self_0 -- 695
		end -- 695
	}) -- 695
	_base_0.__class = _class_0 -- 695
	if _parent_0.__inherited then -- 695
		_parent_0.__inherited(_parent_0, _class_0) -- 695
	end -- 695
	Medicine = _class_0 -- 695
end -- 725
local Evil_Squeal -- 727
do -- 727
	local _class_0 -- 727
	local _parent_0 = SOUND -- 727
	local _base_0 = { -- 727
		sound = (function() -- 728
			local _accum_0 = { } -- 728
			local _len_0 = 1 -- 728
			for i = 1, 4 do -- 728
				_accum_0[_len_0] = "placenta/coinkeeper" .. tostring(i) .. ".wav" -- 728
				_len_0 = _len_0 + 1 -- 728
			end -- 728
			return _accum_0 -- 728
		end)(), -- 729
		level = SNDLVL_70DB, -- 730
		pitch = { -- 730
			70, -- 730
			85 -- 730
		} -- 727
	} -- 727
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 730
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 727
			_base_0[_key_0] = _val_0 -- 727
		end -- 727
	end -- 730
	if _base_0.__index == nil then -- 727
		_base_0.__index = _base_0 -- 727
	end -- 730
	setmetatable(_base_0, _parent_0.__base) -- 727
	_class_0 = setmetatable({ -- 727
		__init = function(self, ...) -- 727
			return _class_0.__parent.__init(self, ...) -- 727
		end, -- 727
		__base = _base_0, -- 727
		__name = "Evil_Squeal", -- 727
		__parent = _parent_0 -- 727
	}, { -- 727
		__index = function(cls, name) -- 727
			local val = rawget(_base_0, name) -- 727
			if val == nil then -- 727
				local parent = rawget(cls, "__parent") -- 727
				if parent then -- 727
					return parent[name] -- 727
				end -- 727
			else -- 727
				return val -- 727
			end -- 727
		end, -- 727
		__call = function(cls, ...) -- 727
			local _self_0 = setmetatable({ }, _base_0) -- 727
			cls.__init(_self_0, ...) -- 727
			return _self_0 -- 727
		end -- 727
	}) -- 727
	_base_0.__class = _class_0 -- 727
	if _parent_0.__inherited then -- 727
		_parent_0.__inherited(_parent_0, _class_0) -- 727
	end -- 727
	Evil_Squeal = _class_0 -- 727
end -- 730
local Evil -- 732
do -- 732
	local _class_0 -- 732
	local _parent_0 = Machine -- 732
	local _base_0 = { -- 732
		PrintName = "Evil Machine", -- 734
		Precursors = { -- 735
			{ -- 735
				name = "metal" -- 735
			}, -- 735
			{ -- 736
				name = "wood" -- 736
			} -- 736
		}, -- 737
		Products = { -- 738
			["evilrp_weapon/mark"] = { -- 739
				precursors = { -- 740
					metal = 6 -- 740
				}, -- 739
				time = 20 -- 741
			}, -- 738
			["evilrp_weapon/coach"] = { -- 743
				precursors = { -- 744
					metal = 10, -- 744
					wood = 5 -- 745
				}, -- 743
				time = 30 -- 746
			}, -- 742
			["evilrp_weapon/obrez"] = { -- 748
				precursors = { -- 749
					metal = 5, -- 749
					wood = 3 -- 750
				}, -- 748
				time = 30 -- 751
			}, -- 747
			["evilrp_weapon/greaser"] = { -- 753
				precursors = { -- 754
					metal = 14 -- 754
				}, -- 753
				time = 35 -- 755
			}, -- 752
			["evilrp_weapon/owler"] = { -- 757
				precursors = { -- 758
					metal = 7, -- 758
					wood = 3 -- 759
				}, -- 757
				time = 30 -- 760
			}, -- 756
			["evilrp_weapon/prettyboy"] = { -- 762
				precursors = { -- 763
					metal = 7, -- 763
					wood = 2 -- 764
				}, -- 762
				time = 30 -- 765
			}, -- 761
			["evilrp_weapon/viper"] = { -- 767
				precursors = { -- 768
					metal = 4, -- 768
					wood = 2 -- 769
				}, -- 767
				time = 30 -- 770
			} -- 766
		}, -- 772
		ProduceItem = function(self, item) -- 772
			local etab = scripted_ents.Get(item) -- 774
			local weapon -- 775
			if not etab then -- 776
				etab = weapons.Get(item) -- 778
				weapon = true -- 779
			end -- 776
			local product -- 780
			if weapon then -- 781
				product = ents.Create("evilrp/spawned/weapon") -- 782
				product:SetModel(etab.WorldModel) -- 784
				product:SetWeaponClass(item) -- 785
			else -- 787
				product = ents.Create(item) -- 787
			end -- 781
			product:SetPos(self:GetPos() + Vector(0, 0, -12) + (self:GetForward() * 8)) -- 788
			product:Spawn() -- 789
			product:Activate() -- 790
			self:EmitSound("Evil_Squeal") -- 791
			return product -- 792
		end, -- 794
		Shift = function(self) -- 794
			if not SERVER then -- 795
				return -- 795
			end -- 795
			local map = game.GetMap() -- 796
			if not EVIL_MACHINE_POSITIONS_CURSED[map] then -- 797
				return -- 797
			end -- 797
			local positions_all -- 798
			do -- 798
				local _tab_0 = { } -- 798
				local _obj_0 = EVIL_MACHINE_POSITIONS_CURSED[map] -- 798
				local _idx_0 = 1 -- 798
				for _key_0, _value_0 in pairs(_obj_0) do -- 798
					if _idx_0 == _key_0 then -- 798
						_tab_0[#_tab_0 + 1] = _value_0 -- 798
						_idx_0 = _idx_0 + 1 -- 798
					else -- 798
						_tab_0[_key_0] = _value_0 -- 798
					end -- 798
				end -- 798
				positions_all = _tab_0 -- 798
			end -- 798
			local positions = { } -- 799
			local our_pos = self:GetPos() -- 801
			for k, v in pairs(positions_all) do -- 802
				if not (our_pos == v.machine.pos) then -- 803
					positions[#positions + 1] = v -- 804
				end -- 803
			end -- 804
			local where = positions[math.random(#positions)] -- 805
			local where_mach = where.machine -- 806
			local where_gen = where.generator -- 807
			self:EmitSound("Evil_Squeal") -- 808
			self:SetPos(where_mach.pos) -- 809
			self:SetAngles(where_mach.ang) -- 810
			local gen = self:GetGenerator() -- 811
			gen:SetPos(where_gen.pos) -- 813
			gen:SetAngles(where_gen.ang) -- 814
			gen:SetRust(0) -- 815
			gen:SetFuel(0) -- 816
			if gen:GetOn() then -- 817
				gen:SetOn(false) -- 818
				gen:StopLoopingSound(gen:GetSoundLoop()) -- 819
				gen.Overload = false -- 820
			end -- 817
			self:PositionButtons() -- 821
			self:SetRust(0) -- 822
			return MsgC(Color(200, 0, 0), "The evil machine shifted.\n") -- 823
		end, -- 825
		Think = function(self) -- 825
			_class_0.__parent.__base.Think(self) -- 826
			local ct = CurTime() -- 827
			if not self.next_shift then -- 828
				self.next_shift = ct + 5 -- 828
			end -- 828
			if ct >= self.next_shift then -- 829
				if self:GetProducing() == "" then -- 830
					self.next_shift = ct + math.random(300, 900) -- 831
					return self:Shift() -- 832
				end -- 830
			end -- 829
		end, -- 834
		FactoryIdentifier = "evil" -- 732
	} -- 732
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 834
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 732
			_base_0[_key_0] = _val_0 -- 732
		end -- 732
	end -- 834
	if _base_0.__index == nil then -- 732
		_base_0.__index = _base_0 -- 732
	end -- 834
	setmetatable(_base_0, _parent_0.__base) -- 732
	_class_0 = setmetatable({ -- 732
		__init = function(self, ...) -- 732
			return _class_0.__parent.__init(self, ...) -- 732
		end, -- 732
		__base = _base_0, -- 732
		__name = "Evil", -- 732
		__parent = _parent_0 -- 732
	}, { -- 732
		__index = function(cls, name) -- 732
			local val = rawget(_base_0, name) -- 732
			if val == nil then -- 732
				local parent = rawget(cls, "__parent") -- 732
				if parent then -- 732
					return parent[name] -- 732
				end -- 732
			else -- 732
				return val -- 732
			end -- 732
		end, -- 732
		__call = function(cls, ...) -- 732
			local _self_0 = setmetatable({ }, _base_0) -- 732
			cls.__init(_self_0, ...) -- 732
			return _self_0 -- 732
		end -- 732
	}) -- 732
	_base_0.__class = _class_0 -- 732
	if _parent_0.__inherited then -- 732
		_parent_0.__inherited(_parent_0, _class_0) -- 732
	end -- 732
	Evil = _class_0 -- 732
	return _class_0 -- 834
end -- 834
