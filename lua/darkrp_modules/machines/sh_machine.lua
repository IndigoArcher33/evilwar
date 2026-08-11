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
		}, -- 15
		pitch = { -- 24
			75, -- 24
			95 -- 24
		}, -- 24
		level = SNDLVL_75DB -- 25
	} -- 14
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 14
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 14
			_base_0[_key_0] = _val_0 -- 14
		end -- 14
	end -- 14
	if _base_0.__index == nil then -- 14
		_base_0.__index = _base_0 -- 14
	end -- 14
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
end -- 14
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
		}, -- 28
		pitch = { -- 36
			75, -- 36
			90 -- 36
		} -- 36
	} -- 27
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 27
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 27
			_base_0[_key_0] = _val_0 -- 27
		end -- 27
	end -- 27
	if _base_0.__index == nil then -- 27
		_base_0.__index = _base_0 -- 27
	end -- 27
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
end -- 27
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
		Base = "base_anim", -- 50
		Type = "anim", -- 51
		PrintName = "Machine", -- 52
		Category = "EvilRP: Machines", -- 53
		Spawnable = true, -- 54
		AdminSpawnable = true, -- 55
		Interesting = true, -- 56
		Pocketable = false, -- 58
		Precursors = { }, -- 60
		FactoryIdentifier = "", -- 61
		BasePay = 5, -- 62
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
			end -- 74
			local _list_0 = self.Precursors -- 78
			for _index_0 = 1, #_list_0 do -- 78
				local p = _list_0[_index_0] -- 78
				local name = p.name -- 79
				name = tostring(name:sub(1, 1):upper()) .. tostring(name:sub(2, -1)) -- 80
				self:NetworkVar("Int", "Precursor" .. tostring(name)) -- 81
			end -- 78
			self:NetworkVar("Entity", "Worker") -- 83
			return self:NetworkVar("Entity", "Generator") -- 84
		end, -- 64
		RefreshPrecursor = function(self) -- 86
			local gen = self:GetGenerator() -- 87
			if gen and IsValid(gen) then -- 88
				local _list_0 = self.Precursors -- 89
				for _index_0 = 1, #_list_0 do -- 89
					local p = _list_0[_index_0] -- 89
					local name = p.name -- 90
					name = tostring(name:sub(1, 1):upper()) .. tostring(name:sub(2, -1)) -- 91
					self["SetPrecursor" .. tostring(name)](self, gen.precursor_storage[name:lower()] or 0) -- 92
				end -- 89
			end -- 88
		end, -- 86
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
			end -- 100
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
		end, -- 94
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
		end, -- 114
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
							end -- 150
							if nope then -- 155
								_continue_0 = true -- 155
								break -- 155
							end -- 155
							found = k -- 156
							ks = nil -- 157
							break -- 158
						end -- 142
						_continue_0 = true -- 142
					until true -- 142
					if not _continue_0 then -- 142
						break -- 142
					end -- 142
				end -- 141
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
					end -- 186
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
		end, -- 130
		ProduceItem = function(self, item) -- 199
			return GAMEMODE:AddStock(item) -- 201
		end, -- 199
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
					end -- 221
				end -- 220
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
		end, -- 203
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
			end -- 274
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
			end -- 284
			return self:Render3D2D() -- 305
		end, -- 255
		OnTakeDamage = function(self, dmg) -- 307
			local attacker = dmg:GetAttacker() -- 308
			if attacker and IsValid(attacker) then -- 309
				if attacker:IsPlayer() then -- 310
					local _exp_0 = attacker:Team() -- 311
					if TEAM_KORPSMAN == _exp_0 or TEAM_CONSCRIPT == _exp_0 then -- 312
						local rust = self:GetRust() -- 313
						self:SetRust(math.max(0, rust - (dmg:GetDamage() * .2))) -- 314
						local reward = math.floor(math.abs(rust - self:GetRust()) * 1.5) -- 315
						if reward > 0 then -- 316
							attacker:AddMoney(reward, "The Cleansing") -- 317
							return attacker:SetHealth(attacker:Health() + 6) -- 318
						end -- 316
					end -- 311
				end -- 310
			end -- 309
		end, -- 307
		Use = function(self, ply) -- 320
			local gen = self:GetGenerator() -- 323
			if gen and not gen:GetOn() then -- 324
				net.Start("evilrp_machine_fail") -- 325
				net.WriteString("There's no power.") -- 326
				net.Send(ply) -- 327
				return -- 328
			elseif not ply:CanUseMachines() then -- 330
				net.Start("evilrp_machine_fail") -- 331
				net.WriteString("UNAUTHORIZED PERSONNEL") -- 332
				net.Send(ply) -- 333
				self:EmitSound("ambient/alarms/klaxon1.wav") -- 334
				timer.Simple(1, function() -- 335
					local tr = util.TraceLine({ -- 337
						start = self:GetPos(), -- 337
						endpos = ply:EyePos(), -- 338
						filter = self -- 339
					}) -- 336
					util.ParticleTracerEx("vortigaunt_beam", tr.StartPos, tr.HitPos, false, self:EntIndex(), 3) -- 341
					self:EmitSound("beams/beamstart5.wav") -- 342
					local dmg = DamageInfo() -- 343
					dmg:SetDamage(65) -- 345
					dmg:SetDamageType(DMG_SHOCK) -- 346
					dmg:SetAttacker(self) -- 347
					dmg:SetInflictor(self) -- 348
					dmg:SetDamagePosition(ply:EyePos()) -- 349
					return ply:TakeDamageInfo(dmg) -- 350
				end) -- 335
				return -- 351
			end -- 324
			if self:GetRust() >= 100 and math.random(1, 3) == 1 then -- 354
				self:EmitSound("MachineBite") -- 355
				ply:TakeDamage(math.random(4, 6)) -- 356
				if math.random(1, 4) == 1 then -- 357
					self:Ignite(math.random(3, 6), 510) -- 357
				end -- 357
			end -- 354
			local button = self:GetNearestButton(ply) -- 359
			if button then -- 360
				if button > 0 then -- 361
					local idx = self["GetButton" .. tostring(button)](self) -- 362
					if idx ~= self:GetCorrectLight() and idx > 0 then -- 363
						self:EmitSound("ambient/alarms/klaxon1.wav") -- 364
						return timer.Simple(1, function() -- 365
							local tr = util.TraceLine({ -- 367
								start = self:GetPos(), -- 367
								endpos = ply:EyePos(), -- 368
								filter = self -- 369
							}) -- 366
							util.ParticleTracerEx("vortigaunt_beam", tr.StartPos, tr.HitPos, false, self:EntIndex(), 3) -- 371
							self:EmitSound("beams/beamstart5.wav") -- 372
							local dmg = DamageInfo() -- 373
							dmg:SetDamage(25) -- 375
							dmg:SetDamageType(DMG_SHOCK) -- 376
							dmg:SetAttacker(self) -- 377
							dmg:SetInflictor(self) -- 378
							dmg:SetDamagePosition(ply:EyePos()) -- 379
							return ply:TakeDamageInfo(dmg) -- 380
						end) -- 365
					elseif idx == 0 then -- 381
						return self:EmitSound("buttons/button2.wav", 75, math.random(75, 95)) -- 382
					else -- 384
						self:EmitSound("MachineDing") -- 384
						local left = false -- 385
						self["SetButton" .. tostring(button)](self, 0) -- 386
						for k, v in ipairs(self.buttons) do -- 387
							if self["GetButton" .. tostring(k)](self) == idx then -- 388
								left = true -- 388
							end -- 388
						end -- 387
						local reward = self.BasePay -- 389
						local rate = GAMEMODE.taxes.labor / 100 -- 390
						local taxed = math.floor(reward * rate) -- 391
						reward = reward - taxed -- 392
						if taxed > 0 then -- 393
							local _obj_0 = GAMEMODE.taxes_stored -- 393
							_obj_0.labor = _obj_0.labor + taxed -- 393
						end -- 393
						if gen.Overload then -- 394
							self:EmitSound("ambient/energy/zap" .. tostring(math.random(1, 3)) .. ".wav") -- 395
							local dmg = DamageInfo() -- 396
							dmg:SetDamage(math.random(4, 6)) -- 398
							dmg:SetDamageType(DMG_SHOCK) -- 399
							dmg:SetAttacker(self) -- 400
							dmg:SetInflictor(self) -- 401
							dmg:SetDamagePosition(self:EyePos()) -- 402
							ply:TakeDamageInfo(dmg) -- 403
							local vp = self:GetPos() -- 404
							local ed = EffectData() -- 405
							ed:SetOrigin(vp) -- 407
							ed:SetScale(1) -- 408
							ed:SetMagnitude(1) -- 409
							ed:SetRadius(3) -- 410
							util.Effect("Sparks", ed) -- 411
						end -- 394
						ply:AddMoney(reward, "The Grind") -- 412
						self:Reward(ply) -- 413
						if (not left) or math.random(1, 100) <= 50 then -- 414
							return self:NewLight(ply) -- 414
						end -- 414
					end -- 363
				end -- 361
			end -- 360
		end, -- 320
		Reward = function(self, ply) -- 416
			if not (ply:Team() == TEAM_PRIVATE) then -- 417
				return -- 417
			end -- 417
			ply.buttons_pushed = ply.buttons_pushed or 0 -- 418
			ply.buttons_pushed = ply.buttons_pushed + 1 -- 419
			if ply.buttons_pushed % 50 == 0 then -- 420
				ply:Notify("<c=0,200,0>Your work ethic makes your leader proud.") -- 421
				return ply:AddStemCells(1) -- 422
			end -- 420
		end, -- 416
		GetNearestButton = function(self, who) -- 424
			if (not who or not IsValid(who)) then -- 425
				who = LocalPlayer() -- 425
			end -- 425
			if self.buttons then -- 426
				local start = who:GetShootPos() -- 427
				local endpos = start + who:GetAimVector() * 96 -- 428
				local tr = util.TraceLine({ -- 430
					start = start, -- 430
					endpos = endpos, -- 431
					filter = who -- 432
				}) -- 429
				local HitPos = tr.HitPos -- 434
				if HitPos then -- 435
					for k, v in ipairs(self.buttons) do -- 436
						if (v[1]:Distance(HitPos) <= 2) then -- 437
							return k -- 437
						end -- 437
					end -- 436
				end -- 435
			end -- 426
		end, -- 424
		NewLight = function(self, ply) -- 439
			local olight = self:GetCorrectLight() -- 440
			local set = { -- 441
				1, -- 441
				2, -- 441
				3 -- 441
			} -- 441
			local forbidden = { -- 442
				1, -- 442
				2, -- 442
				3 -- 442
			} -- 442
			local finished = true -- 443
			for k, v in ipairs(self.buttons) do -- 444
				local idx = self["GetButton" .. tostring(k)](self) -- 445
				if idx > 0 then -- 446
					finished = false -- 447
					if idx ~= olight then -- 448
						table.RemoveByValue(forbidden, idx) -- 448
					end -- 448
				end -- 446
			end -- 444
			for k, v in ipairs(forbidden) do -- 449
				table.RemoveByValue(set, v) -- 449
			end -- 449
			local nlight = set[math.random(1, #set)] -- 450
			if finished then -- 451
				self:SetQueuedItems(self:GetQueuedItems() + 1) -- 452
				for i = 1, 8 do -- 453
					self["SetButton" .. tostring(i)](self, math.random(1, 3)) -- 453
				end -- 453
				local idx = math.random(1, 8) -- 454
				self:EmitSound("items/suitchargeok1.wav", 75, math.random(75, 95)) -- 455
				return self:SetCorrectLight(self["GetButton" .. tostring(idx)](self)) -- 456
			elseif nlight then -- 457
				self:EmitSound("ambient/tones/elev1.wav", 75, math.random(75, 95)) -- 458
				return self:SetCorrectLight(nlight) -- 459
			end -- 451
		end, -- 439
		Render3D2D = function(self) -- 461
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 462
			if not (dist_sqr < 128 ^ 2) then -- 463
				return -- 463
			end -- 463
			local gen = self:GetGenerator() -- 464
			if gen and IsValid(gen) and (not gen:GetOn()) then -- 465
				return -- 465
			end -- 465
			local ct = CurTime() -- 466
			local lp = LocalPlayer() -- 467
			local pos = self:GetPos() + self:GetUp() * 28 + self:GetForward() * 13 + self:GetRight() * 7.4 -- 468
			local ang = self:GetAngles() -- 469
			ang:RotateAroundAxis(ang:Up(), -90) -- 471
			ang:RotateAroundAxis(ang:Forward(), 90) -- 472
			ang:RotateAroundAxis(ang:Right(), -180) -- 473
			local desp = (lp:GetDespair() * 0.01) -- 474
			local font = "Spleen_Label" -- 476
			cam.Start3D2D(pos, ang, 0.1) -- 477
			local txt = self.PrintName -- 478
			local col = HSVToColor((ct * 23) % 180, 1, 1) -- 479
			surface.SetMaterial(noise) -- 482
			surface.DrawTexturedRect(0, 0, 236, 78) -- 483
			local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 485
			txt_obj:Draw(120, 24, 1, TEXT_ALIGN_CENTER) -- 486
			cam.End3D2D() -- 487
			font = "Spleen_Label_Small" -- 489
			pos = self:GetPos() + self:GetUp() * 14.7 + self:GetForward() * 13 + self:GetRight() * 3 -- 490
			ang = self:GetAngles() -- 491
			ang:RotateAroundAxis(ang:Up(), -90) -- 493
			ang:RotateAroundAxis(ang:Forward(), 90) -- 494
			ang:RotateAroundAxis(ang:Right(), -180) -- 495
			cam.Start3D2D(pos, ang, 0.1) -- 496
			local py = 0 -- 497
			local _list_0 = self.Precursors -- 498
			for _index_0 = 1, #_list_0 do -- 498
				local p = _list_0[_index_0] -- 498
				local name = p.name -- 499
				name = tostring(name:sub(1, 1):upper()) .. tostring(name:sub(2, -1)) -- 500
				local pre_amt = self["GetPrecursor" .. tostring(name)](self) -- 501
				txt = tostring(pre_amt) .. " " .. tostring(p.name) -- 502
				local font = "Spleen_Autodealer" -- 503
				txt_obj = scribe.Parse("<stutter><rgb=1,1,60><wiggle=" .. tostring(5 * desp) .. "," .. tostring(15 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(3 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 505
				txt_obj:Draw(75, py, 1, TEXT_ALIGN_CENTER) -- 506
				py = py + txt_obj:GetTall() -- 507
			end -- 498
			cam.End3D2D() -- 508
			font = "Spleen_Label_Small" -- 510
			pos = self:GetPos() + self:GetUp() * 10.7 + self:GetForward() * 13 + self:GetRight() * 6.15 -- 511
			cam.Start3D2D(pos, ang, 0.1) -- 512
			local rust = self:GetRust() -- 513
			local empty = true -- 514
			local _list_1 = self.Precursors -- 515
			for _index_0 = 1, #_list_1 do -- 515
				local p = _list_1[_index_0] -- 515
				local name = p.name -- 516
				name = tostring(name:sub(1, 1):upper()) .. tostring(name:sub(2, -1)) -- 517
				local cur_amt = self["GetPrecursor" .. tostring(name)](self) -- 518
				if cur_amt > 0 then -- 519
					empty = false -- 520
					break -- 521
				end -- 519
			end -- 515
			txt = "i'm " .. tostring(rust) .. "% rusted" -- 522
			if rust < 1 then -- 523
				txt = "give me purpose" -- 523
			end -- 523
			if rust >= 100 then -- 524
				txt = "I'M ROTTEN. HELP" -- 524
			end -- 524
			if empty then -- 525
				txt = "FEED ME" -- 525
			end -- 525
			local prod = self:GetProducing() -- 526
			if prod ~= "" then -- 527
				local etab = scripted_ents.Get(prod) or weapons.Get(prod) -- 528
				txt = etab.PrintName -- 529
			end -- 527
			surface.SetDrawColor(0, 0, 0, 255) -- 532
			surface.DrawRect(0, 0, 209, 56) -- 533
			local production_start = self:GetProductionStart() -- 536
			local production_end = self:GetProductionEnd() -- 537
			if production_end > 0 then -- 538
				local cur = ct - production_start -- 539
				local ending = production_end - production_start -- 540
				surface.SetDrawColor(0, 150 + (100 * math.cos(ct)), 0, 255) -- 541
				surface.DrawRect(0, 0, 209 * (cur / ending), 56) -- 542
			elseif rust >= 100 then -- 543
				surface.SetDrawColor(150 + (100 * math.cos(ct)), 0, 0, 255) -- 544
				surface.DrawRect(0, 0, 209 * (rust / 100), 56) -- 545
			else -- 547
				surface.SetDrawColor(147, 58 + (29 * math.cos(ct)), 22, 255) -- 547
				surface.DrawRect(0, 0, 209 * (rust / 100), 56) -- 548
			end -- 538
			txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(2 * desp) .. "," .. tostring(20 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(5 * desp) .. "," .. tostring(0.666 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 550
			txt_obj:Draw(105, 16, 1, TEXT_ALIGN_CENTER) -- 551
			return cam.End3D2D() -- 552
		end -- 461
	} -- 49
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 49
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 49
			_base_0[_key_0] = _val_0 -- 49
		end -- 49
	end -- 49
	if _base_0.__index == nil then -- 49
		_base_0.__index = _base_0 -- 49
	end -- 49
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
end -- 49
local Tools -- 557
do -- 557
	local _class_0 -- 557
	local _parent_0 = Machine -- 557
	local _base_0 = { -- 557
		PrintName = "Tool Machine", -- 558
		BasePay = 7, -- 559
		Precursors = { -- 561
			{ -- 561
				name = "metal" -- 561
			}, -- 561
			{ -- 562
				name = "wood" -- 562
			} -- 562
		}, -- 560
		Reward = function(self, ply) -- 563
			if not (ply:Team() == TEAM_PRIVATE) then -- 564
				return -- 564
			end -- 564
			ply.buttons_pushed = ply.buttons_pushed or 0 -- 565
			ply.buttons_pushed = ply.buttons_pushed + 2 -- 566
			if ply.buttons_pushed % 50 == 0 then -- 567
				ply:Notify("<c=0,200,0>Your work ethic makes your leader proud.") -- 568
				return ply:AddStemCells(1) -- 569
			end -- 567
		end, -- 563
		Products = { -- 571
			["evilrp_melee/crowbar"] = { -- 572
				precursors = { -- 573
					metal = 3 -- 573
				}, -- 572
				time = 10 -- 574
			}, -- 571
			["evilrp_melee/knife"] = { -- 576
				precursors = { -- 577
					metal = 2 -- 577
				}, -- 576
				time = 15 -- 578
			}, -- 575
			["evilrp_melee/pipe"] = { -- 580
				precursors = { -- 581
					metal = 2 -- 581
				}, -- 580
				time = 10 -- 582
			}, -- 579
			["evilrp_melee/pickaxe"] = { -- 584
				precursors = { -- 585
					metal = 5, -- 585
					wood = 2 -- 586
				}, -- 584
				time = 20 -- 587
			}, -- 583
			["evilrp_melee/shovel"] = { -- 589
				precursors = { -- 590
					metal = 4, -- 590
					wood = 3 -- 591
				}, -- 589
				time = 20 -- 592
			}, -- 588
			["evilrp_melee/pot"] = { -- 594
				precursors = { -- 595
					metal = 1 -- 595
				}, -- 594
				time = 10 -- 596
			} -- 593
		}, -- 570
		FactoryIdentifier = "tools" -- 597
	} -- 557
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 557
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 557
			_base_0[_key_0] = _val_0 -- 557
		end -- 557
	end -- 557
	if _base_0.__index == nil then -- 557
		_base_0.__index = _base_0 -- 557
	end -- 557
	setmetatable(_base_0, _parent_0.__base) -- 557
	_class_0 = setmetatable({ -- 557
		__init = function(self, ...) -- 557
			return _class_0.__parent.__init(self, ...) -- 557
		end, -- 557
		__base = _base_0, -- 557
		__name = "Tools", -- 557
		__parent = _parent_0 -- 557
	}, { -- 557
		__index = function(cls, name) -- 557
			local val = rawget(_base_0, name) -- 557
			if val == nil then -- 557
				local parent = rawget(cls, "__parent") -- 557
				if parent then -- 557
					return parent[name] -- 557
				end -- 557
			else -- 557
				return val -- 557
			end -- 557
		end, -- 557
		__call = function(cls, ...) -- 557
			local _self_0 = setmetatable({ }, _base_0) -- 557
			cls.__init(_self_0, ...) -- 557
			return _self_0 -- 557
		end -- 557
	}) -- 557
	_base_0.__class = _class_0 -- 557
	if _parent_0.__inherited then -- 557
		_parent_0.__inherited(_parent_0, _class_0) -- 557
	end -- 557
	Tools = _class_0 -- 557
end -- 557
local Food -- 598
do -- 598
	local _class_0 -- 598
	local _parent_0 = Machine -- 598
	local _base_0 = { -- 598
		PrintName = "Food Machine", -- 599
		BasePay = 3, -- 600
		Precursors = { -- 602
			{ -- 602
				name = "biomass" -- 602
			}, -- 602
			{ -- 603
				name = "fluid" -- 603
			} -- 603
		}, -- 601
		Products = { -- 605
			["item/food/soyloaf"] = { -- 606
				precursors = { -- 607
					biomass = 1 -- 607
				}, -- 606
				time = 6 -- 608
			}, -- 605
			["item/food/abortion"] = { -- 610
				precursors = { -- 611
					biomass = 3 -- 611
				}, -- 610
				time = 6 -- 612
			}, -- 609
			["item/food/drink/fearbeer"] = { -- 614
				precursors = { -- 615
					biomass = 3 -- 615
				}, -- 614
				time = 7 -- 616
			}, -- 613
			["item/food/drink/smearbeer"] = { -- 618
				precursors = { -- 619
					biomass = 4 -- 619
				}, -- 618
				time = 8 -- 620
			}, -- 617
			["item/food/drink/shake"] = { -- 622
				precursors = { -- 623
					biomass = 4 -- 623
				}, -- 622
				time = 6 -- 624
			}, -- 621
			["item/food/moldmelon"] = { -- 626
				precursors = { -- 627
					biomass = 2 -- 627
				}, -- 626
				time = 9 -- 628
			}, -- 625
			["item/food/drink/twitchel"] = { -- 630
				precursors = { -- 631
					biomass = 2 -- 631
				}, -- 630
				time = 5 -- 632
			} -- 629
		}, -- 604
		FactoryIdentifier = "food" -- 633
	} -- 598
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 598
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 598
			_base_0[_key_0] = _val_0 -- 598
		end -- 598
	end -- 598
	if _base_0.__index == nil then -- 598
		_base_0.__index = _base_0 -- 598
	end -- 598
	setmetatable(_base_0, _parent_0.__base) -- 598
	_class_0 = setmetatable({ -- 598
		__init = function(self, ...) -- 598
			return _class_0.__parent.__init(self, ...) -- 598
		end, -- 598
		__base = _base_0, -- 598
		__name = "Food", -- 598
		__parent = _parent_0 -- 598
	}, { -- 598
		__index = function(cls, name) -- 598
			local val = rawget(_base_0, name) -- 598
			if val == nil then -- 598
				local parent = rawget(cls, "__parent") -- 598
				if parent then -- 598
					return parent[name] -- 598
				end -- 598
			else -- 598
				return val -- 598
			end -- 598
		end, -- 598
		__call = function(cls, ...) -- 598
			local _self_0 = setmetatable({ }, _base_0) -- 598
			cls.__init(_self_0, ...) -- 598
			return _self_0 -- 598
		end -- 598
	}) -- 598
	_base_0.__class = _class_0 -- 598
	if _parent_0.__inherited then -- 598
		_parent_0.__inherited(_parent_0, _class_0) -- 598
	end -- 598
	Food = _class_0 -- 598
end -- 598
local Weapons -- 634
do -- 634
	local _class_0 -- 634
	local _parent_0 = Machine -- 634
	local _base_0 = { -- 634
		PrintName = "Weapons Machine", -- 635
		BasePay = 10, -- 636
		Precursors = { -- 638
			{ -- 638
				name = "metal" -- 638
			}, -- 638
			{ -- 639
				name = "polymer" -- 639
			} -- 639
		}, -- 637
		Reward = function(self, ply) -- 641
			if not (ply:Team() == TEAM_PRIVATE) then -- 642
				return -- 642
			end -- 642
			ply.buttons_pushed = ply.buttons_pushed or 0 -- 643
			ply.buttons_pushed = ply.buttons_pushed + 3 -- 644
			if ply.buttons_pushed % 50 == 0 then -- 645
				ply:Notify("<c=0,200,0>Your work ethic makes your leader proud.") -- 646
				return ply:AddStemCells(1) -- 647
			end -- 645
		end, -- 641
		Products = { -- 649
			["evilrp_weapon/bodyguard"] = { -- 650
				precursors = { -- 651
					metal = 5 -- 651
				}, -- 650
				time = 20 -- 652
			}, -- 649
			["evilrp_weapon/warrant"] = { -- 654
				precursors = { -- 655
					metal = 5 -- 655
				}, -- 654
				time = 20 -- 656
			}, -- 653
			["evilrp_weapon/hope"] = { -- 658
				precursors = { -- 659
					metal = 4 -- 659
				}, -- 658
				time = 20 -- 660
			}, -- 657
			["evilrp_weapon/enforcer"] = { -- 662
				precursors = { -- 663
					metal = 7 -- 663
				}, -- 662
				time = 25 -- 664
			}, -- 661
			["evilrp_weapon/viper"] = { -- 666
				precursors = { -- 667
					metal = 6 -- 667
				}, -- 666
				time = 25 -- 668
			}, -- 665
			["evilrp_weapon/brainpaster"] = { -- 670
				precursors = { -- 671
					metal = 5, -- 671
					polymer = 1 -- 672
				}, -- 670
				time = 20 -- 673
			}, -- 669
			["evilrp_weapon/subjugator"] = { -- 675
				precursors = { -- 676
					metal = 7, -- 676
					polymer = 3 -- 677
				}, -- 675
				time = 25 -- 678
			}, -- 674
			["evilrp_weapon/painkiller"] = { -- 680
				precursors = { -- 681
					metal = 4, -- 681
					polymer = 2 -- 682
				}, -- 680
				time = 20 -- 683
			}, -- 679
			["evilrp_weapon/candlewood"] = { -- 685
				precursors = { -- 686
					metal = 4, -- 686
					polymer = 4 -- 687
				}, -- 685
				time = 25 -- 688
			}, -- 684
			["evilrp_weapon/obliterator"] = { -- 690
				precursors = { -- 691
					metal = 8, -- 691
					polymer = 5 -- 692
				}, -- 690
				time = 30 -- 693
			}, -- 689
			["evilrp_weapon/trooper"] = { -- 695
				precursors = { -- 696
					metal = 11, -- 696
					polymer = 7 -- 697
				}, -- 695
				time = 30 -- 698
			} -- 694
		}, -- 648
		FactoryIdentifier = "weapons" -- 699
	} -- 634
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 634
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 634
			_base_0[_key_0] = _val_0 -- 634
		end -- 634
	end -- 634
	if _base_0.__index == nil then -- 634
		_base_0.__index = _base_0 -- 634
	end -- 634
	setmetatable(_base_0, _parent_0.__base) -- 634
	_class_0 = setmetatable({ -- 634
		__init = function(self, ...) -- 634
			return _class_0.__parent.__init(self, ...) -- 634
		end, -- 634
		__base = _base_0, -- 634
		__name = "Weapons", -- 634
		__parent = _parent_0 -- 634
	}, { -- 634
		__index = function(cls, name) -- 634
			local val = rawget(_base_0, name) -- 634
			if val == nil then -- 634
				local parent = rawget(cls, "__parent") -- 634
				if parent then -- 634
					return parent[name] -- 634
				end -- 634
			else -- 634
				return val -- 634
			end -- 634
		end, -- 634
		__call = function(cls, ...) -- 634
			local _self_0 = setmetatable({ }, _base_0) -- 634
			cls.__init(_self_0, ...) -- 634
			return _self_0 -- 634
		end -- 634
	}) -- 634
	_base_0.__class = _class_0 -- 634
	if _parent_0.__inherited then -- 634
		_parent_0.__inherited(_parent_0, _class_0) -- 634
	end -- 634
	Weapons = _class_0 -- 634
end -- 634
local Medicine -- 700
do -- 700
	local _class_0 -- 700
	local _parent_0 = Machine -- 700
	local _base_0 = { -- 700
		PrintName = "Medicine Machine", -- 701
		BasePay = 7, -- 702
		Reward = function(self, ply) -- 703
			if not (ply:Team() == TEAM_PRIVATE) then -- 704
				return -- 704
			end -- 704
			ply.buttons_pushed = ply.buttons_pushed or 0 -- 705
			ply.buttons_pushed = ply.buttons_pushed + 2 -- 706
			if ply.buttons_pushed % 50 == 0 then -- 707
				ply:Notify("<c=0,200,0>Your work ethic makes your leader proud.") -- 708
				return ply:AddStemCells(1) -- 709
			end -- 707
		end, -- 703
		Precursors = { -- 711
			{ -- 711
				name = "biomass" -- 711
			}, -- 711
			{ -- 712
				name = "metal" -- 712
			} -- 712
		}, -- 710
		Products = { -- 714
			["item/food/medicine/pills"] = { -- 715
				precursors = { -- 716
					biomass = 2, -- 716
					metal = 1 -- 717
				}, -- 715
				time = 10 -- 718
			}, -- 714
			["item/food/medicine/ablativepaste"] = { -- 720
				precursors = { -- 721
					biomass = 3, -- 721
					metal = 1 -- 722
				}, -- 720
				time = 10 -- 723
			}, -- 719
			["item/food/medicine/bleach"] = { -- 725
				precursors = { -- 726
					biomass = 2, -- 726
					metal = 1 -- 727
				}, -- 725
				time = 10 -- 728
			} -- 724
		}, -- 713
		FactoryIdentifier = "medicine" -- 730
	} -- 700
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 700
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 700
			_base_0[_key_0] = _val_0 -- 700
		end -- 700
	end -- 700
	if _base_0.__index == nil then -- 700
		_base_0.__index = _base_0 -- 700
	end -- 700
	setmetatable(_base_0, _parent_0.__base) -- 700
	_class_0 = setmetatable({ -- 700
		__init = function(self, ...) -- 700
			return _class_0.__parent.__init(self, ...) -- 700
		end, -- 700
		__base = _base_0, -- 700
		__name = "Medicine", -- 700
		__parent = _parent_0 -- 700
	}, { -- 700
		__index = function(cls, name) -- 700
			local val = rawget(_base_0, name) -- 700
			if val == nil then -- 700
				local parent = rawget(cls, "__parent") -- 700
				if parent then -- 700
					return parent[name] -- 700
				end -- 700
			else -- 700
				return val -- 700
			end -- 700
		end, -- 700
		__call = function(cls, ...) -- 700
			local _self_0 = setmetatable({ }, _base_0) -- 700
			cls.__init(_self_0, ...) -- 700
			return _self_0 -- 700
		end -- 700
	}) -- 700
	_base_0.__class = _class_0 -- 700
	if _parent_0.__inherited then -- 700
		_parent_0.__inherited(_parent_0, _class_0) -- 700
	end -- 700
	Medicine = _class_0 -- 700
end -- 700
local Evil_Squeal -- 732
do -- 732
	local _class_0 -- 732
	local _parent_0 = SOUND -- 732
	local _base_0 = { -- 732
		sound = (function() -- 733
			local _accum_0 = { } -- 733
			local _len_0 = 1 -- 733
			for i = 1, 4 do -- 733
				_accum_0[_len_0] = "placenta/coinkeeper" .. tostring(i) .. ".wav" -- 733
				_len_0 = _len_0 + 1 -- 733
			end -- 733
			return _accum_0 -- 733
		end)(), -- 733
		level = SNDLVL_70DB, -- 734
		pitch = { -- 735
			70, -- 735
			85 -- 735
		} -- 735
	} -- 732
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 732
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 732
			_base_0[_key_0] = _val_0 -- 732
		end -- 732
	end -- 732
	if _base_0.__index == nil then -- 732
		_base_0.__index = _base_0 -- 732
	end -- 732
	setmetatable(_base_0, _parent_0.__base) -- 732
	_class_0 = setmetatable({ -- 732
		__init = function(self, ...) -- 732
			return _class_0.__parent.__init(self, ...) -- 732
		end, -- 732
		__base = _base_0, -- 732
		__name = "Evil_Squeal", -- 732
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
	Evil_Squeal = _class_0 -- 732
end -- 732
local Evil -- 737
local _class_0 -- 737
local _parent_0 = Machine -- 737
local _base_0 = { -- 737
	PrintName = "Evil Machine", -- 738
	Precursors = { -- 740
		{ -- 740
			name = "metal" -- 740
		}, -- 740
		{ -- 741
			name = "wood" -- 741
		} -- 741
	}, -- 739
	Products = { -- 743
		["evilrp_weapon/mark"] = { -- 744
			precursors = { -- 745
				metal = 6 -- 745
			}, -- 744
			time = 20 -- 746
		}, -- 743
		["evilrp_weapon/coach"] = { -- 748
			precursors = { -- 749
				metal = 10, -- 749
				wood = 5 -- 750
			}, -- 748
			time = 30 -- 751
		}, -- 747
		["evilrp_weapon/obrez"] = { -- 753
			precursors = { -- 754
				metal = 5, -- 754
				wood = 3 -- 755
			}, -- 753
			time = 30 -- 756
		}, -- 752
		["evilrp_weapon/greaser"] = { -- 758
			precursors = { -- 759
				metal = 14 -- 759
			}, -- 758
			time = 35 -- 760
		}, -- 757
		["evilrp_weapon/owler"] = { -- 762
			precursors = { -- 763
				metal = 7, -- 763
				wood = 3 -- 764
			}, -- 762
			time = 30 -- 765
		}, -- 761
		["evilrp_weapon/prettyboy"] = { -- 767
			precursors = { -- 768
				metal = 7, -- 768
				wood = 2 -- 769
			}, -- 767
			time = 30 -- 770
		}, -- 766
		["evilrp_weapon/viper"] = { -- 772
			precursors = { -- 773
				metal = 4, -- 773
				wood = 2 -- 774
			}, -- 772
			time = 30 -- 775
		} -- 771
	}, -- 742
	ProduceItem = function(self, item) -- 777
		local etab = scripted_ents.Get(item) -- 779
		local weapon -- 780
		if not etab then -- 781
			etab = weapons.Get(item) -- 783
			weapon = true -- 784
		end -- 781
		local product -- 785
		if weapon then -- 786
			product = ents.Create("evilrp/spawned/weapon") -- 787
			product:SetModel(etab.WorldModel) -- 789
			product:SetWeaponClass(item) -- 790
		else -- 792
			product = ents.Create(item) -- 792
		end -- 786
		product:SetPos(self:GetPos() + Vector(0, 0, -12) + (self:GetForward() * 8)) -- 793
		product:Spawn() -- 794
		product:Activate() -- 795
		self:EmitSound("Evil_Squeal") -- 796
		return product -- 797
	end, -- 777
	Shift = function(self) -- 799
		if not SERVER then -- 800
			return -- 800
		end -- 800
		local map = game.GetMap() -- 801
		if not EVIL_MACHINE_POSITIONS_CURSED[map] then -- 802
			return -- 802
		end -- 802
		local positions_all -- 803
		do -- 803
			local _tab_0 = { } -- 803
			local _obj_0 = EVIL_MACHINE_POSITIONS_CURSED[map] -- 803
			local _idx_0 = 1 -- 803
			for _key_0, _value_0 in pairs(_obj_0) do -- 803
				if _idx_0 == _key_0 then -- 803
					_tab_0[#_tab_0 + 1] = _value_0 -- 803
					_idx_0 = _idx_0 + 1 -- 803
				else -- 803
					_tab_0[_key_0] = _value_0 -- 803
				end -- 803
			end -- 803
			positions_all = _tab_0 -- 803
		end -- 803
		local positions = { } -- 804
		local our_pos = self:GetPos() -- 806
		for k, v in pairs(positions_all) do -- 807
			if not (our_pos == v.machine.pos) then -- 808
				positions[#positions + 1] = v -- 809
			end -- 808
		end -- 807
		local where = positions[math.random(#positions)] -- 810
		local where_mach = where.machine -- 811
		local where_gen = where.generator -- 812
		self:EmitSound("Evil_Squeal") -- 813
		self:SetPos(where_mach.pos) -- 814
		self:SetAngles(where_mach.ang) -- 815
		local gen = self:GetGenerator() -- 816
		gen:SetPos(where_gen.pos) -- 818
		gen:SetAngles(where_gen.ang) -- 819
		gen:SetRust(0) -- 820
		gen:SetFuel(0) -- 821
		if gen:GetOn() then -- 822
			gen:SetOn(false) -- 823
			gen:StopLoopingSound(gen:GetSoundLoop()) -- 824
			gen.Overload = false -- 825
		end -- 822
		self:PositionButtons() -- 826
		self:SetRust(0) -- 827
		return MsgC(Color(200, 0, 0), "The evil machine shifted.\n") -- 828
	end, -- 799
	Think = function(self) -- 830
		_class_0.__parent.__base.Think(self) -- 831
		local ct = CurTime() -- 832
		if not self.next_shift then -- 833
			self.next_shift = ct + 5 -- 833
		end -- 833
		if ct >= self.next_shift then -- 834
			if self:GetProducing() == "" then -- 835
				self.next_shift = ct + math.random(300, 900) -- 836
				return self:Shift() -- 837
			end -- 835
		end -- 834
	end, -- 830
	FactoryIdentifier = "evil" -- 839
} -- 737
for _key_0, _val_0 in pairs(_parent_0.__base) do -- 737
	if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 737
		_base_0[_key_0] = _val_0 -- 737
	end -- 737
end -- 737
if _base_0.__index == nil then -- 737
	_base_0.__index = _base_0 -- 737
end -- 737
setmetatable(_base_0, _parent_0.__base) -- 737
_class_0 = setmetatable({ -- 737
	__init = function(self, ...) -- 737
		return _class_0.__parent.__init(self, ...) -- 737
	end, -- 737
	__base = _base_0, -- 737
	__name = "Evil", -- 737
	__parent = _parent_0 -- 737
}, { -- 737
	__index = function(cls, name) -- 737
		local val = rawget(_base_0, name) -- 737
		if val == nil then -- 737
			local parent = rawget(cls, "__parent") -- 737
			if parent then -- 737
				return parent[name] -- 737
			end -- 737
		else -- 737
			return val -- 737
		end -- 737
	end, -- 737
	__call = function(cls, ...) -- 737
		local _self_0 = setmetatable({ }, _base_0) -- 737
		cls.__init(_self_0, ...) -- 737
		return _self_0 -- 737
	end -- 737
}) -- 737
_base_0.__class = _class_0 -- 737
if _parent_0.__inherited then -- 737
	_parent_0.__inherited(_parent_0, _class_0) -- 737
end -- 737
Evil = _class_0 -- 737
return _class_0 -- 737
