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
		FactoryIdentifier = "", -- 63
		SetupDataTables = function(self) -- 63
			self:NetworkVar("String", "Producing") -- 64
			self:NetworkVar("String", "Selection") -- 65
			self:NetworkVar("Int", "ProductionStart") -- 66
			self:NetworkVar("Int", "ProductionEnd") -- 67
			self:NetworkVar("Int", "SoundLoop") -- 68
			self:NetworkVar("Int", "Rust") -- 69
			self:NetworkVar("Int", "CorrectLight") -- 70
			self:NetworkVar("Int", "QueuedItems") -- 71
			for i = 1, 8 do -- 73
				self:NetworkVar("Int", 8 + i, "Button" .. i) -- 74
				self["SetButton" .. i](self, math.random(1, 3)) -- 75
			end -- 75
			local _list_0 = self.Precursors -- 77
			for _index_0 = 1, #_list_0 do -- 77
				local p = _list_0[_index_0] -- 77
				local name = p.name -- 78
				name = tostring(name:sub(1, 1):upper()) .. tostring(name:sub(2, -1)) -- 79
				self:NetworkVar("Int", "Precursor" .. tostring(name)) -- 80
			end -- 80
			self:NetworkVar("Entity", "Worker") -- 82
			return self:NetworkVar("Entity", "Generator") -- 83
		end, -- 85
		RefreshPrecursor = function(self) -- 85
			local gen = self:GetGenerator() -- 86
			if gen and IsValid(gen) then -- 87
				local _list_0 = self.Precursors -- 88
				for _index_0 = 1, #_list_0 do -- 88
					local p = _list_0[_index_0] -- 88
					local name = p.name -- 89
					name = tostring(name:sub(1, 1):upper()) .. tostring(name:sub(2, -1)) -- 90
					self["SetPrecursor" .. tostring(name)](self, gen.precursor_storage[name:lower()] or 0) -- 91
				end -- 91
			end -- 87
		end, -- 93
		Initialize = function(self) -- 93
			self:PositionButtons() -- 94
			if CLIENT then -- 95
				return -- 95
			end -- 95
			local _list_0 = ents.FindByClass("generator") -- 99
			for _index_0 = 1, #_list_0 do -- 99
				local gen = _list_0[_index_0] -- 99
				if gen:GetFactoryIdentifier() == self.FactoryIdentifier then -- 100
					self:SetGenerator(gen) -- 101
					MsgC(Color(0, 200, 0), tostring(self) .. " attached to " .. tostring(gen) .. ".\n") -- 102
					break -- 103
				end -- 100
			end -- 103
			local gen = self:GetGenerator() -- 104
			if not (gen and IsValid(gen)) then -- 105
				return -- 105
			end -- 105
			for i = 1, 8 do -- 106
				self["SetButton" .. tostring(i)](self, math.random(1, 3)) -- 106
			end -- 106
			self:SetUseType(SIMPLE_USE) -- 107
			self:SetModel("models/props_lab/reciever_cart.mdl") -- 108
			self:PhysicsInit(SOLID_VPHYSICS) -- 109
			self:PhysWake() -- 110
			return self:NewLight() -- 111
		end, -- 113
		PositionButtons = function(self) -- 113
			local pos = self:GetPos() -- 114
			local f = self:GetForward() -- 115
			local r = self:GetRight() -- 116
			local u = self:GetUp() -- 117
			self.buttons = { -- 119
				{ -- 119
					pos + u * 18 + f * 13 + r * 6 -- 119
				}, -- 119
				{ -- 120
					pos + u * 18 + f * 13 + r * 3 -- 120
				}, -- 120
				{ -- 121
					pos + u * 18 + f * 13 -- 121
				}, -- 121
				{ -- 122
					pos + u * 18 + f * 13 + r * -3 -- 122
				}, -- 122
				{ -- 123
					pos + u * 18 + f * 13 + r * -6 -- 123
				}, -- 123
				{ -- 124
					pos + u * 18 + f * 13 + r * -9 -- 124
				}, -- 124
				{ -- 125
					pos + u * 18 + f * 13 + r * -12 -- 125
				}, -- 125
				{ -- 126
					pos + u * 18 + f * 13 + r * -15 -- 126
				} -- 126
			} -- 118
		end, -- 129
		Think = function(self) -- 129
			if CLIENT then -- 130
				return -- 130
			end -- 130
			if self:GetSelection() ~= "" and self:GetCorrectLight() == 0 then -- 131
				self:NewLight() -- 131
			end -- 131
			local ct = CurTime() -- 132
			if not self.NextMatRefresh then -- 133
				self.NextMatRefresh = ct -- 133
			end -- 133
			if ct >= self.NextMatRefresh then -- 134
				self.NextMatRefresh = ct + 5 -- 135
				self:RefreshPrecursor() -- 136
			end -- 134
			if self:GetProductionEnd() == 0 and self:GetQueuedItems() > 0 then -- 137
				local found = nil -- 138
				local ks = table.GetKeys(self.Products) -- 139
				for i = 1, #ks do -- 140
					local _continue_0 = false -- 141
					repeat -- 141
						do -- 141
							local k = ks[math.random(1, #ks)] -- 141
							if not self.Products[k] then -- 142
								_continue_0 = true -- 142
								break -- 142
							end -- 142
							if table.IsEmpty(self.Products[k]) then -- 143
								_continue_0 = true -- 143
								break -- 143
							end -- 143
							table.RemoveByValue(ks, k) -- 144
							if GAMEMODE.Stocks[k] then -- 145
							end -- 145
							local nope = false -- 148
							for t, amt in pairs(self.Products[k].precursors) do -- 149
								local name = tostring(t:sub(1, 1):upper()) .. tostring(t:sub(2, -1)) -- 150
								if amt > self["GetPrecursor" .. tostring(name)](self) then -- 151
									nope = true -- 152
									break -- 153
								end -- 151
							end -- 153
							if nope then -- 154
								_continue_0 = true -- 154
								break -- 154
							end -- 154
							found = k -- 155
							ks = nil -- 156
							break -- 157
						end -- 141
						_continue_0 = true -- 141
					until true -- 157
					if not _continue_0 then -- 157
						break -- 157
					end -- 157
				end -- 157
				if not found then -- 158
					self:SetQueuedItems(0) -- 159
					util.ScreenShake(self:GetPos(), 25, 150, 1, 750) -- 160
					local explo = ents.Create("env_explosion") -- 161
					explo:SetOwner(self) -- 163
					explo:SetPos(self:GetPos()) -- 164
					explo:SetKeyValue("iMagnitude", 75) -- 165
					explo:SetKeyValue("iRadiusOverride", 150) -- 166
					explo:Spawn() -- 167
					explo:Activate() -- 168
					explo:Fire("Explode") -- 169
					local fire = ents.Create("env_fire") -- 170
					fire:SetPos(self:GetPos()) -- 172
					fire:SetKeyValue("spawnflags", 1) -- 173
					fire:SetKeyValue("attack", tostring(math.random(10, 15))) -- 174
					fire:SetKeyValue("firesize", tostring(math.random(100, 150))) -- 175
					fire:Spawn() -- 176
					fire:Activate() -- 177
					fire:Fire("Enable", "", del) -- 178
					fire:Fire("StartFire", "", del) -- 179
					SafeRemoveEntityDelayed(fire, math.random(60, 70)) -- 180
					self:GetGenerator().Overload = true -- 181
				else -- 183
					self:SetQueuedItems(math.max(0, self:GetQueuedItems() - 1)) -- 183
					self:SetProducing(found) -- 184
					for t, amt in pairs(self.Products[found].precursors) do -- 185
						self:GetGenerator():AddPrecursor(t, -amt) -- 186
					end -- 186
					self:SetProductionStart(CurTime()) -- 187
					self:SetProductionEnd(CurTime() + self.Products[found].time) -- 188
				end -- 158
			end -- 137
			if self:GetProductionEnd() > 0 and CurTime() >= self:GetProductionEnd() then -- 189
				self:SetRust(math.min(100, self:GetRust() + self.Products[self:GetProducing()].time)) -- 190
				self:ProduceItem(self:GetProducing()) -- 191
				self:EmitSound("ambient/machines/machine1_hit" .. tostring(math.random(1, 2)) .. ".wav") -- 192
				self:StopLoopingSound(self:GetSoundLoop()) -- 193
				self:SetProducing("") -- 194
				self:SetProductionStart(0) -- 195
				return self:SetProductionEnd(0) -- 196
			end -- 189
		end, -- 198
		ProduceItem = function(self, item) -- 198
			return GAMEMODE:AddStock(item) -- 200
		end, -- 202
		Touch = function(self, what) -- 202
			if SERVER then -- 203
				if not what.Precursor then -- 204
					return -- 204
				end -- 204
				local pre, amt -- 205
				local _list_0 = self.Precursors -- 206
				for _index_0 = 1, #_list_0 do -- 206
					local p = _list_0[_index_0] -- 206
					for k, v in pairs(what.Precursor) do -- 207
						if p.name == k then -- 208
							pre = k -- 209
							amt = v -- 210
							if isfunction(amt) then -- 211
								amt = amt(self) -- 211
							end -- 211
							break -- 212
						end -- 208
					end -- 212
				end -- 212
				if not (pre and amt) then -- 213
					return -- 213
				end -- 213
				local rewarded = false -- 214
				local submitter = what:GetNWEntity("evilrp_submitter", NULL) -- 215
				if not what.Processed then -- 216
					what.Processed = true -- 217
					if what.SubmitSound then -- 218
						what:EmitSound(what.SubmitSound) -- 218
					end -- 218
					self:GetGenerator():AddPrecursor(pre, amt) -- 219
					if what.Submitted then -- 220
						what.Submitted(what) -- 220
					end -- 220
					local reward = math.random(10, 15) * amt -- 221
					local rate = GAMEMODE.taxes.labor / 100 -- 222
					local taxed = math.floor(reward * rate) -- 223
					reward = reward - taxed -- 224
					if taxed > 0 then -- 225
						local _obj_0 = GAMEMODE.taxes_stored -- 225
						_obj_0.labor = _obj_0.labor + taxed -- 225
					end -- 225
					reward = math.ceil(reward) -- 226
					if submitter and IsValid(submitter) and submitter:IsPlayer() and submitter:Alive() then -- 227
						submitter:AddMoney(reward, "The Operation") -- 228
					else -- 230
						if reward > 0 then -- 230
							local _obj_0 = GAMEMODE.taxes_stored -- 230
							_obj_0.labor = _obj_0.labor + reward -- 230
						end -- 230
					end -- 227
					what:Remove() -- 231
					if submitter and IsValid(submitter) and submitter:IsPlayer() and submitter:Team() == TEAM_PROLETARIAT then -- 232
						submitter.precursor_supplied = submitter.precursor_supplied or 0 -- 233
						submitter.precursor_supplied = submitter.precursor_supplied + amt -- 234
						if submitter.precursor_supplied_difference and (submitter.precursor_supplied % 50) < submitter.precursor_supplied_difference then -- 235
							submitter:Notify("<c=0,200,0>Your work ethic makes Liver Failure proud.") -- 236
							submitter:AddStemCells(1) -- 237
						end -- 235
						submitter.precursor_supplied_difference = submitter.precursor_supplied % 50 -- 238
					end -- 232
				end -- 216
			end -- 203
		end, -- 241
		Draw = function(self) -- 241
			self:DrawModel() -- 242
			local gen = self:GetGenerator() -- 243
			if gen and IsValid(gen) then -- 244
				if not gen:GetOn() then -- 245
					return -- 245
				end -- 245
			end -- 244
			local closest = self:GetNearestButton() -- 246
			local pos = self:GetPos() -- 248
			local f = self:GetForward() -- 249
			local r = self:GetRight() -- 250
			local u = self:GetUp() -- 251
			local light_spots = { -- 254
				{ -- 254
					pos + u * 0.5 + f * 14.5 + r * -1, -- 254
					Color(150, 150, 150), -- 254
					"r", -- 254
					button1 -- 254
				}, -- 254
				{ -- 255
					pos + u * 0.5 + f * 14.5 + r * -6, -- 255
					Color(0, 150, 0), -- 255
					"g", -- 255
					button2 -- 255
				}, -- 255
				{ -- 256
					pos + u * 0.5 + f * 14.5 + r * -11.5, -- 256
					Color(0, 0, 150), -- 256
					"b", -- 256
					button3 -- 256
				} -- 256
			} -- 253
			local idx = 0 -- 258
			local ct = CurTime() -- 259
			for _index_0 = 1, #light_spots do -- 260
				local light = light_spots[_index_0] -- 260
				idx = idx + 1 -- 261
				local g, b -- 262
				do -- 262
					local _obj_0 = light[2] -- 262
					r, g, b = _obj_0.r, _obj_0.g, _obj_0.b -- 262
				end -- 262
				local col = Color(r, g, b, 255) -- 263
				render.SetMaterial(light[4]) -- 264
				if self:GetCorrectLight() == idx then -- 265
					render.DrawSprite(light[1], 4 + math.abs(math.sin(ct) * 4), 4 + math.abs(math.sin(ct) * 4), col) -- 267
				else -- 269
					render.DrawSprite(light[1], 4, 4, col) -- 269
				end -- 265
			end -- 269
			for k, v in ipairs(self.buttons) do -- 270
				idx = self["GetButton" .. tostring(k)](self) -- 271
				local mats = { -- 272
					button1, -- 272
					button2, -- 272
					button3 -- 272
				} -- 272
				local col -- 273
				if idx == 0 then -- 274
					render.SetMaterial(default0) -- 275
					col = Color(100, 100, 100, 255) -- 276
				else -- 278
					render.SetMaterial(mats[idx]) -- 278
					col = colors[idx] -- 279
					if k == closest then -- 280
						r = math.max(0, col.r + (50 * math.sin(ct * 3))) -- 281
						local g = math.max(0, col.g + (50 * math.sin(ct * 3))) -- 282
						local b = math.max(0, col.b + (50 * math.sin(ct * 3))) -- 283
						col = Color(r, g, b) -- 284
					else -- 286
						r = math.max(0, col.r + (100 * math.cos(ct))) -- 286
						local g = math.max(0, col.g + (100 * math.cos(ct))) -- 287
						local b = math.max(0, col.b + (100 * math.cos(ct))) -- 288
						col = Color(r, g, b) -- 289
					end -- 280
				end -- 274
				render.DrawSprite(v[1], 4, 4, col) -- 290
			end -- 290
			return self:Render3D2D() -- 291
		end, -- 293
		OnTakeDamage = function(self, dmg) -- 293
			local attacker = dmg:GetAttacker() -- 294
			if attacker and IsValid(attacker) then -- 295
				if attacker:IsPlayer() then -- 296
					local _exp_0 = attacker:Team() -- 297
					if TEAM_SANITAR == _exp_0 then -- 298
						local rust = self:GetRust() -- 299
						self:SetRust(math.max(0, rust - (dmg:GetDamage() * .2))) -- 300
						local reward = math.floor(math.abs(rust - self:GetRust()) * 3) -- 301
						if reward > 0 then -- 302
							return attacker:AddMoney(reward, "The Cleansing") -- 303
						end -- 302
					end -- 303
				end -- 296
			end -- 295
		end, -- 305
		Use = function(self, ply) -- 305
			local gen = self:GetGenerator() -- 308
			if gen and not gen:GetOn() then -- 309
				net.Start("evilrp_machine_fail") -- 310
				net.WriteString("There's no power.") -- 311
				net.Send(ply) -- 312
				return -- 313
			elseif not ply:CanUseMachines() then -- 315
				net.Start("evilrp_machine_fail") -- 316
				net.WriteString("UNAUTHORIZED PERSONNEL") -- 317
				net.Send(ply) -- 318
				self:EmitSound("ambient/alarms/klaxon1.wav") -- 319
				timer.Simple(1, function() -- 320
					local tr = util.TraceLine({ -- 322
						start = self:GetPos(), -- 322
						endpos = ply:EyePos(), -- 323
						filter = self -- 324
					}) -- 321
					util.ParticleTracerEx("vortigaunt_beam", tr.StartPos, tr.HitPos, false, self:EntIndex(), 3) -- 326
					self:EmitSound("beams/beamstart5.wav") -- 327
					local dmg = DamageInfo() -- 328
					dmg:SetDamage(65) -- 330
					dmg:SetDamageType(DMG_SHOCK) -- 331
					dmg:SetAttacker(self) -- 332
					dmg:SetInflictor(self) -- 333
					dmg:SetDamagePosition(ply:EyePos()) -- 334
					return ply:TakeDamageInfo(dmg) -- 335
				end) -- 320
				return -- 336
			end -- 309
			if self:GetRust() >= 100 and math.random(1, 3) == 1 then -- 339
				self:EmitSound("MachineBite") -- 340
				ply:TakeDamage(math.random(4, 6)) -- 341
				if math.random(1, 4) == 1 then -- 342
					self:Ignite(math.random(3, 6), 510) -- 342
				end -- 342
			end -- 339
			local button = self:GetNearestButton(ply) -- 344
			if button then -- 345
				if button > 0 then -- 346
					local idx = self["GetButton" .. tostring(button)](self) -- 347
					if idx ~= self:GetCorrectLight() and idx > 0 then -- 348
						self:EmitSound("ambient/alarms/klaxon1.wav") -- 349
						return timer.Simple(1, function() -- 350
							local tr = util.TraceLine({ -- 352
								start = self:GetPos(), -- 352
								endpos = ply:EyePos(), -- 353
								filter = self -- 354
							}) -- 351
							util.ParticleTracerEx("vortigaunt_beam", tr.StartPos, tr.HitPos, false, self:EntIndex(), 3) -- 356
							self:EmitSound("beams/beamstart5.wav") -- 357
							local dmg = DamageInfo() -- 358
							dmg:SetDamage(25) -- 360
							dmg:SetDamageType(DMG_SHOCK) -- 361
							dmg:SetAttacker(self) -- 362
							dmg:SetInflictor(self) -- 363
							dmg:SetDamagePosition(ply:EyePos()) -- 364
							return ply:TakeDamageInfo(dmg) -- 365
						end) -- 365
					elseif idx == 0 then -- 366
						return self:EmitSound("buttons/button2.wav", 75, math.random(75, 95)) -- 367
					else -- 369
						self:EmitSound("MachineDing") -- 369
						local left = false -- 370
						self["SetButton" .. tostring(button)](self, 0) -- 371
						for k, v in ipairs(self.buttons) do -- 372
							if self["GetButton" .. tostring(k)](self) == idx then -- 373
								left = true -- 373
							end -- 373
						end -- 373
						local reward = 5 -- 374
						local rate = GAMEMODE.taxes.labor / 100 -- 375
						local taxed = math.floor(reward * rate) -- 376
						reward = reward - taxed -- 377
						if taxed > 0 then -- 378
							local _obj_0 = GAMEMODE.taxes_stored -- 378
							_obj_0.labor = _obj_0.labor + taxed -- 378
						end -- 378
						if gen.Overload then -- 379
							self:EmitSound("ambient/energy/zap" .. tostring(math.random(1, 3)) .. ".wav") -- 380
							local dmg = DamageInfo() -- 381
							dmg:SetDamage(math.random(4, 6)) -- 383
							dmg:SetDamageType(DMG_SHOCK) -- 384
							dmg:SetAttacker(self) -- 385
							dmg:SetInflictor(self) -- 386
							dmg:SetDamagePosition(self:EyePos()) -- 387
							ply:TakeDamageInfo(dmg) -- 388
							local vp = self:GetPos() -- 389
							local ed = EffectData() -- 390
							ed:SetOrigin(vp) -- 392
							ed:SetScale(1) -- 393
							ed:SetMagnitude(1) -- 394
							ed:SetRadius(3) -- 395
							util.Effect("Sparks", ed) -- 396
						end -- 379
						ply:AddMoney(reward, "The Grind") -- 397
						if ply:Team() == TEAM_PROLETARIAT then -- 398
							ply.buttons_pushed = ply.buttons_pushed or 0 -- 399
							ply.buttons_pushed = ply.buttons_pushed + 1 -- 400
							if ply.buttons_pushed % 100 == 0 then -- 401
								ply:Notify("<c=0,200,0>Your work ethic makes Liver Failure proud.") -- 402
								ply:AddStemCells(1) -- 403
							end -- 401
						end -- 398
						if (not left) or math.random(1, 100) <= 50 then -- 404
							return self:NewLight(ply) -- 404
						end -- 404
					end -- 348
				end -- 346
			end -- 345
		end, -- 406
		GetNearestButton = function(self, who) -- 406
			if (not who or not IsValid(who)) then -- 407
				who = LocalPlayer() -- 407
			end -- 407
			if self.buttons then -- 408
				local start = who:GetShootPos() -- 409
				local endpos = start + who:GetAimVector() * 96 -- 410
				local tr = util.TraceLine({ -- 412
					start = start, -- 412
					endpos = endpos, -- 413
					filter = who -- 414
				}) -- 411
				local HitPos = tr.HitPos -- 416
				if HitPos then -- 417
					for k, v in ipairs(self.buttons) do -- 418
						if (v[1]:Distance(HitPos) <= 2) then -- 419
							return k -- 419
						end -- 419
					end -- 419
				end -- 417
			end -- 408
		end, -- 421
		NewLight = function(self, ply) -- 421
			local olight = self:GetCorrectLight() -- 422
			local set = { -- 423
				1, -- 423
				2, -- 423
				3 -- 423
			} -- 423
			local forbidden = { -- 424
				1, -- 424
				2, -- 424
				3 -- 424
			} -- 424
			local finished = true -- 425
			for k, v in ipairs(self.buttons) do -- 426
				local idx = self["GetButton" .. tostring(k)](self) -- 427
				if idx > 0 then -- 428
					finished = false -- 429
					if idx ~= olight then -- 430
						table.RemoveByValue(forbidden, idx) -- 430
					end -- 430
				end -- 428
			end -- 430
			for k, v in ipairs(forbidden) do -- 431
				table.RemoveByValue(set, v) -- 431
			end -- 431
			local nlight = set[math.random(1, #set)] -- 432
			if finished then -- 433
				self:SetQueuedItems(self:GetQueuedItems() + 1) -- 434
				for i = 1, 8 do -- 435
					self["SetButton" .. tostring(i)](self, math.random(1, 3)) -- 435
				end -- 435
				local idx = math.random(1, 8) -- 436
				self:EmitSound("items/suitchargeok1.wav", 75, math.random(75, 95)) -- 437
				return self:SetCorrectLight(self["GetButton" .. tostring(idx)](self)) -- 438
			elseif nlight then -- 439
				self:EmitSound("ambient/tones/elev1.wav", 75, math.random(75, 95)) -- 440
				return self:SetCorrectLight(nlight) -- 441
			end -- 433
		end, -- 443
		Render3D2D = function(self) -- 443
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 444
			if not (dist_sqr < 128 ^ 2) then -- 445
				return -- 445
			end -- 445
			local gen = self:GetGenerator() -- 446
			if gen and IsValid(gen) and (not gen:GetOn()) then -- 447
				return -- 447
			end -- 447
			local ct = CurTime() -- 448
			local lp = LocalPlayer() -- 449
			local pos = self:GetPos() + self:GetUp() * 28 + self:GetForward() * 13 + self:GetRight() * 7.4 -- 450
			local ang = self:GetAngles() -- 451
			ang:RotateAroundAxis(ang:Up(), -90) -- 453
			ang:RotateAroundAxis(ang:Forward(), 90) -- 454
			ang:RotateAroundAxis(ang:Right(), -180) -- 455
			local desp = (lp:GetDespair() * 0.01) -- 456
			local font = "Spleen_Label" -- 458
			cam.Start3D2D(pos, ang, 0.1) -- 459
			local txt = self.PrintName -- 460
			local col = HSVToColor((ct * 23) % 180, 1, 1) -- 461
			surface.SetMaterial(noise) -- 464
			surface.DrawTexturedRect(0, 0, 236, 78) -- 465
			local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 467
			txt_obj:Draw(120, 24, 1, TEXT_ALIGN_CENTER) -- 468
			cam.End3D2D() -- 469
			font = "Spleen_Label_Small" -- 471
			pos = self:GetPos() + self:GetUp() * 14.7 + self:GetForward() * 13 + self:GetRight() * 3 -- 472
			ang = self:GetAngles() -- 473
			ang:RotateAroundAxis(ang:Up(), -90) -- 475
			ang:RotateAroundAxis(ang:Forward(), 90) -- 476
			ang:RotateAroundAxis(ang:Right(), -180) -- 477
			cam.Start3D2D(pos, ang, 0.1) -- 478
			local py = 0 -- 479
			local _list_0 = self.Precursors -- 480
			for _index_0 = 1, #_list_0 do -- 480
				local p = _list_0[_index_0] -- 480
				local name = p.name -- 481
				name = tostring(name:sub(1, 1):upper()) .. tostring(name:sub(2, -1)) -- 482
				local pre_amt = self["GetPrecursor" .. tostring(name)](self) -- 483
				txt = tostring(pre_amt) .. " " .. tostring(p.name) -- 484
				local font -- 485
				font = "Spleen_Autodealer" -- 485
				txt_obj = scribe.Parse("<stutter><rgb=1,1,60><wiggle=" .. tostring(5 * desp) .. "," .. tostring(15 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(3 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 487
				txt_obj:Draw(75, py, 1, TEXT_ALIGN_CENTER) -- 488
				py = py + txt_obj:GetTall() -- 489
			end -- 489
			cam.End3D2D() -- 490
			font = "Spleen_Label_Small" -- 492
			pos = self:GetPos() + self:GetUp() * 10.7 + self:GetForward() * 13 + self:GetRight() * 6.15 -- 493
			cam.Start3D2D(pos, ang, 0.1) -- 494
			local rust = self:GetRust() -- 495
			local empty = true -- 496
			local _list_1 = self.Precursors -- 497
			for _index_0 = 1, #_list_1 do -- 497
				local p = _list_1[_index_0] -- 497
				local name = p.name -- 498
				name = tostring(name:sub(1, 1):upper()) .. tostring(name:sub(2, -1)) -- 499
				local cur_amt = self["GetPrecursor" .. tostring(name)](self) -- 500
				if cur_amt > 0 then -- 501
					empty = false -- 502
					break -- 503
				end -- 501
			end -- 503
			txt = "i'm " .. tostring(rust) .. "% rusted" -- 504
			if rust < 1 then -- 505
				txt = "give me purpose" -- 505
			end -- 505
			if rust >= 100 then -- 506
				txt = "I'M ROTTEN. HELP" -- 506
			end -- 506
			if empty then -- 507
				txt = "FEED ME" -- 507
			end -- 507
			local prod = self:GetProducing() -- 508
			if prod ~= "" then -- 509
				local etab = scripted_ents.Get(prod) or weapons.Get(prod) -- 510
				txt = etab.PrintName -- 511
			end -- 509
			surface.SetDrawColor(0, 0, 0, 255) -- 514
			surface.DrawRect(0, 0, 209, 56) -- 515
			local production_start = self:GetProductionStart() -- 518
			local production_end = self:GetProductionEnd() -- 519
			if production_end > 0 then -- 520
				local cur = ct - production_start -- 521
				local ending = production_end - production_start -- 522
				surface.SetDrawColor(0, 150 + (100 * math.cos(ct)), 0, 255) -- 523
				surface.DrawRect(0, 0, 209 * (cur / ending), 56) -- 524
			elseif rust >= 100 then -- 525
				surface.SetDrawColor(150 + (100 * math.cos(ct)), 0, 0, 255) -- 526
				surface.DrawRect(0, 0, 209 * (rust / 100), 56) -- 527
			else -- 529
				surface.SetDrawColor(147, 58 + (29 * math.cos(ct)), 22, 255) -- 529
				surface.DrawRect(0, 0, 209 * (rust / 100), 56) -- 530
			end -- 520
			txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(2 * desp) .. "," .. tostring(20 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(5 * desp) .. "," .. tostring(0.666 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 532
			txt_obj:Draw(105, 16, 1, TEXT_ALIGN_CENTER) -- 533
			return cam.End3D2D() -- 534
		end -- 49
	} -- 49
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 537
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 49
			_base_0[_key_0] = _val_0 -- 49
		end -- 49
	end -- 537
	if _base_0.__index == nil then -- 49
		_base_0.__index = _base_0 -- 49
	end -- 537
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
end -- 537
local Tools -- 539
do -- 539
	local _class_0 -- 539
	local _parent_0 = Machine -- 539
	local _base_0 = { -- 539
		PrintName = "Tool Machine", -- 541
		Precursors = { -- 542
			{ -- 542
				name = "metal" -- 542
			}, -- 542
			{ -- 543
				name = "wood" -- 543
			} -- 543
		}, -- 544
		Products = { -- 545
			["evilrp_melee/crowbar"] = { -- 546
				precursors = { -- 547
					metal = 3 -- 547
				}, -- 546
				time = 10 -- 548
			}, -- 545
			["evilrp_melee/knife"] = { -- 550
				precursors = { -- 551
					metal = 2 -- 551
				}, -- 550
				time = 15 -- 552
			}, -- 549
			["evilrp_melee/pipe"] = { -- 554
				precursors = { -- 555
					metal = 2 -- 555
				}, -- 554
				time = 10 -- 556
			}, -- 553
			["evilrp_melee/pickaxe"] = { -- 558
				precursors = { -- 559
					metal = 5 -- 559
				}, -- 558
				time = 20 -- 560
			}, -- 557
			["evilrp_melee/shovel"] = { -- 562
				precursors = { -- 563
					metal = 4 -- 563
				}, -- 562
				time = 20 -- 564
			}, -- 561
			["evilrp_melee/pot"] = { -- 566
				precursors = { -- 567
					metal = 1 -- 567
				}, -- 566
				time = 10 -- 568
			} -- 565
		}, -- 569
		FactoryIdentifier = "tools" -- 539
	} -- 539
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 569
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 539
			_base_0[_key_0] = _val_0 -- 539
		end -- 539
	end -- 569
	if _base_0.__index == nil then -- 539
		_base_0.__index = _base_0 -- 539
	end -- 569
	setmetatable(_base_0, _parent_0.__base) -- 539
	_class_0 = setmetatable({ -- 539
		__init = function(self, ...) -- 539
			return _class_0.__parent.__init(self, ...) -- 539
		end, -- 539
		__base = _base_0, -- 539
		__name = "Tools", -- 539
		__parent = _parent_0 -- 539
	}, { -- 539
		__index = function(cls, name) -- 539
			local val = rawget(_base_0, name) -- 539
			if val == nil then -- 539
				local parent = rawget(cls, "__parent") -- 539
				if parent then -- 539
					return parent[name] -- 539
				end -- 539
			else -- 539
				return val -- 539
			end -- 539
		end, -- 539
		__call = function(cls, ...) -- 539
			local _self_0 = setmetatable({ }, _base_0) -- 539
			cls.__init(_self_0, ...) -- 539
			return _self_0 -- 539
		end -- 539
	}) -- 539
	_base_0.__class = _class_0 -- 539
	if _parent_0.__inherited then -- 539
		_parent_0.__inherited(_parent_0, _class_0) -- 539
	end -- 539
	Tools = _class_0 -- 539
end -- 569
local Food -- 570
do -- 570
	local _class_0 -- 570
	local _parent_0 = Machine -- 570
	local _base_0 = { -- 570
		PrintName = "Food Machine", -- 572
		Precursors = { -- 573
			{ -- 573
				name = "biomass" -- 573
			}, -- 573
			{ -- 574
				name = "fluid" -- 574
			} -- 574
		}, -- 575
		Products = { -- 576
			["item/food/soyloaf"] = { -- 577
				precursors = { -- 578
					biomass = 1 -- 578
				}, -- 577
				time = 3 -- 579
			}, -- 576
			["item/food/drink/fearbeer"] = { -- 581
				precursors = { -- 582
					biomass = 3 -- 582
				}, -- 581
				time = 1 -- 583
			}, -- 580
			["item/food/drink/smearbeer"] = { -- 585
				precursors = { -- 586
					biomass = 4 -- 586
				}, -- 585
				time = 2 -- 587
			}, -- 584
			["item/food/drink/shake"] = { -- 589
				precursors = { -- 590
					biomass = 4 -- 590
				}, -- 589
				time = 2 -- 591
			}, -- 588
			["item/food/moldmelon"] = { -- 593
				precursors = { -- 594
					biomass = 2 -- 594
				}, -- 593
				time = 1 -- 595
			}, -- 592
			["item/food/drink/twitchel"] = { -- 597
				precursors = { -- 598
					biomass = 2 -- 598
				}, -- 597
				time = 2 -- 599
			} -- 596
		}, -- 600
		FactoryIdentifier = "food" -- 570
	} -- 570
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 600
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 570
			_base_0[_key_0] = _val_0 -- 570
		end -- 570
	end -- 600
	if _base_0.__index == nil then -- 570
		_base_0.__index = _base_0 -- 570
	end -- 600
	setmetatable(_base_0, _parent_0.__base) -- 570
	_class_0 = setmetatable({ -- 570
		__init = function(self, ...) -- 570
			return _class_0.__parent.__init(self, ...) -- 570
		end, -- 570
		__base = _base_0, -- 570
		__name = "Food", -- 570
		__parent = _parent_0 -- 570
	}, { -- 570
		__index = function(cls, name) -- 570
			local val = rawget(_base_0, name) -- 570
			if val == nil then -- 570
				local parent = rawget(cls, "__parent") -- 570
				if parent then -- 570
					return parent[name] -- 570
				end -- 570
			else -- 570
				return val -- 570
			end -- 570
		end, -- 570
		__call = function(cls, ...) -- 570
			local _self_0 = setmetatable({ }, _base_0) -- 570
			cls.__init(_self_0, ...) -- 570
			return _self_0 -- 570
		end -- 570
	}) -- 570
	_base_0.__class = _class_0 -- 570
	if _parent_0.__inherited then -- 570
		_parent_0.__inherited(_parent_0, _class_0) -- 570
	end -- 570
	Food = _class_0 -- 570
end -- 600
local Weapons -- 601
do -- 601
	local _class_0 -- 601
	local _parent_0 = Machine -- 601
	local _base_0 = { -- 601
		PrintName = "Weapons Machine", -- 603
		Precursors = { -- 604
			{ -- 604
				name = "metal" -- 604
			} -- 604
		}, -- 605
		Products = { -- 606
			["evilrp_weapon/bodyguard"] = { -- 607
				precursors = { -- 608
					metal = 5 -- 608
				}, -- 607
				time = 20 -- 609
			}, -- 606
			["evilrp_weapon/greaser"] = { -- 611
				precursors = { -- 612
					metal = 7 -- 612
				}, -- 611
				time = 25 -- 613
			}, -- 610
			["evilrp_weapon/mark"] = { -- 615
				precursors = { -- 616
					metal = 4 -- 616
				}, -- 615
				time = 20 -- 617
			} -- 614
		}, -- 619
		FactoryIdentifier = "weapons" -- 601
	} -- 601
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 619
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 601
			_base_0[_key_0] = _val_0 -- 601
		end -- 601
	end -- 619
	if _base_0.__index == nil then -- 601
		_base_0.__index = _base_0 -- 601
	end -- 619
	setmetatable(_base_0, _parent_0.__base) -- 601
	_class_0 = setmetatable({ -- 601
		__init = function(self, ...) -- 601
			return _class_0.__parent.__init(self, ...) -- 601
		end, -- 601
		__base = _base_0, -- 601
		__name = "Weapons", -- 601
		__parent = _parent_0 -- 601
	}, { -- 601
		__index = function(cls, name) -- 601
			local val = rawget(_base_0, name) -- 601
			if val == nil then -- 601
				local parent = rawget(cls, "__parent") -- 601
				if parent then -- 601
					return parent[name] -- 601
				end -- 601
			else -- 601
				return val -- 601
			end -- 601
		end, -- 601
		__call = function(cls, ...) -- 601
			local _self_0 = setmetatable({ }, _base_0) -- 601
			cls.__init(_self_0, ...) -- 601
			return _self_0 -- 601
		end -- 601
	}) -- 601
	_base_0.__class = _class_0 -- 601
	if _parent_0.__inherited then -- 601
		_parent_0.__inherited(_parent_0, _class_0) -- 601
	end -- 601
	Weapons = _class_0 -- 601
end -- 619
local Medicine -- 620
do -- 620
	local _class_0 -- 620
	local _parent_0 = Machine -- 620
	local _base_0 = { -- 620
		PrintName = "Medicine Machine", -- 622
		Precursors = { -- 623
			{ -- 623
				name = "biomass" -- 623
			}, -- 623
			{ -- 624
				name = "metal" -- 624
			} -- 624
		}, -- 625
		Products = { -- 626
			["item/food/medicine/pills"] = { -- 627
				precursors = { -- 628
					biomass = 2, -- 628
					metal = 1 -- 629
				}, -- 627
				time = 10 -- 630
			}, -- 626
			["item/food/medicine/timegas"] = { -- 632
				precursors = { -- 633
					metal = 2 -- 633
				}, -- 632
				time = 10 -- 634
			}, -- 631
			["item/food/medicine/bleach"] = { -- 636
				precursors = { -- 637
					biomass = 2, -- 637
					metal = 1 -- 638
				} -- 636
			} -- 635
		}, -- 640
		FactoryIdentifier = "medicine" -- 620
	} -- 620
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 640
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 620
			_base_0[_key_0] = _val_0 -- 620
		end -- 620
	end -- 640
	if _base_0.__index == nil then -- 620
		_base_0.__index = _base_0 -- 620
	end -- 640
	setmetatable(_base_0, _parent_0.__base) -- 620
	_class_0 = setmetatable({ -- 620
		__init = function(self, ...) -- 620
			return _class_0.__parent.__init(self, ...) -- 620
		end, -- 620
		__base = _base_0, -- 620
		__name = "Medicine", -- 620
		__parent = _parent_0 -- 620
	}, { -- 620
		__index = function(cls, name) -- 620
			local val = rawget(_base_0, name) -- 620
			if val == nil then -- 620
				local parent = rawget(cls, "__parent") -- 620
				if parent then -- 620
					return parent[name] -- 620
				end -- 620
			else -- 620
				return val -- 620
			end -- 620
		end, -- 620
		__call = function(cls, ...) -- 620
			local _self_0 = setmetatable({ }, _base_0) -- 620
			cls.__init(_self_0, ...) -- 620
			return _self_0 -- 620
		end -- 620
	}) -- 620
	_base_0.__class = _class_0 -- 620
	if _parent_0.__inherited then -- 620
		_parent_0.__inherited(_parent_0, _class_0) -- 620
	end -- 620
	Medicine = _class_0 -- 620
end -- 640
local Evil_Squeal -- 642
do -- 642
	local _class_0 -- 642
	local _parent_0 = SOUND -- 642
	local _base_0 = { -- 642
		sound = (function() -- 643
			local _accum_0 = { } -- 643
			local _len_0 = 1 -- 643
			for i = 1, 4 do -- 643
				_accum_0[_len_0] = "placenta/coinkeeper" .. tostring(i) .. ".wav" -- 643
				_len_0 = _len_0 + 1 -- 643
			end -- 643
			return _accum_0 -- 643
		end)(), -- 644
		level = SNDLVL_70DB, -- 645
		pitch = { -- 645
			70, -- 645
			85 -- 645
		} -- 642
	} -- 642
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 645
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 642
			_base_0[_key_0] = _val_0 -- 642
		end -- 642
	end -- 645
	if _base_0.__index == nil then -- 642
		_base_0.__index = _base_0 -- 642
	end -- 645
	setmetatable(_base_0, _parent_0.__base) -- 642
	_class_0 = setmetatable({ -- 642
		__init = function(self, ...) -- 642
			return _class_0.__parent.__init(self, ...) -- 642
		end, -- 642
		__base = _base_0, -- 642
		__name = "Evil_Squeal", -- 642
		__parent = _parent_0 -- 642
	}, { -- 642
		__index = function(cls, name) -- 642
			local val = rawget(_base_0, name) -- 642
			if val == nil then -- 642
				local parent = rawget(cls, "__parent") -- 642
				if parent then -- 642
					return parent[name] -- 642
				end -- 642
			else -- 642
				return val -- 642
			end -- 642
		end, -- 642
		__call = function(cls, ...) -- 642
			local _self_0 = setmetatable({ }, _base_0) -- 642
			cls.__init(_self_0, ...) -- 642
			return _self_0 -- 642
		end -- 642
	}) -- 642
	_base_0.__class = _class_0 -- 642
	if _parent_0.__inherited then -- 642
		_parent_0.__inherited(_parent_0, _class_0) -- 642
	end -- 642
	Evil_Squeal = _class_0 -- 642
end -- 645
local Evil -- 647
do -- 647
	local _class_0 -- 647
	local _parent_0 = Machine -- 647
	local _base_0 = { -- 647
		PrintName = "Evil Machine", -- 649
		Precursors = { -- 650
			{ -- 650
				name = "metal" -- 650
			}, -- 650
			{ -- 651
				name = "wood" -- 651
			} -- 651
		}, -- 652
		Products = { -- 653
			["evilrp_weapon/mark"] = { -- 654
				precursors = { -- 655
					metal = 6 -- 655
				}, -- 654
				time = 20 -- 656
			}, -- 653
			["evilrp_weapon/coach"] = { -- 658
				precursors = { -- 659
					metal = 10, -- 659
					wood = 5 -- 660
				}, -- 658
				time = 30 -- 661
			}, -- 657
			["evilrp_weapon/obrez"] = { -- 663
				precursors = { -- 664
					metal = 5, -- 664
					wood = 3 -- 665
				}, -- 663
				time = 30 -- 666
			}, -- 662
			["evilrp_weapon/greaser"] = { -- 668
				precursors = { -- 669
					metal = 14 -- 669
				}, -- 668
				time = 35 -- 670
			}, -- 667
			["evilrp_weapon/owler"] = { -- 672
				precursors = { -- 673
					metal = 7, -- 673
					wood = 3 -- 674
				}, -- 672
				time = 30 -- 675
			}, -- 671
			["evilrp_weapon/prettyboy"] = { -- 677
				precursors = { -- 678
					metal = 7, -- 678
					wood = 2 -- 679
				}, -- 677
				time = 30 -- 680
			} -- 676
		}, -- 682
		ProduceItem = function(self, item) -- 682
			local etab = scripted_ents.Get(item) -- 684
			local weapon -- 685
			if not etab then -- 686
				etab = weapons.Get(item) -- 688
				weapon = true -- 689
			end -- 686
			local product -- 690
			if weapon then -- 691
				product = ents.Create("evilrp/spawned/weapon") -- 692
				product:SetModel(etab.WorldModel) -- 694
				product:SetWeaponClass(item) -- 695
			else -- 697
				product = ents.Create(item) -- 697
			end -- 691
			product:SetPos(self:GetPos() + Vector(0, 0, -12) + (self:GetForward() * 8)) -- 698
			product:Spawn() -- 699
			product:Activate() -- 700
			self:EmitSound("Evil_Squeal") -- 701
			return product -- 702
		end, -- 704
		Shift = function(self) -- 704
			if not SERVER then -- 705
				return -- 705
			end -- 705
			local map = game.GetMap() -- 706
			if not EVIL_MACHINE_POSITIONS_CURSED[map] then -- 707
				return -- 707
			end -- 707
			local positions_all -- 708
			do -- 708
				local _tab_0 = { } -- 708
				local _obj_0 = EVIL_MACHINE_POSITIONS_CURSED[map] -- 708
				local _idx_0 = 1 -- 708
				for _key_0, _value_0 in pairs(_obj_0) do -- 708
					if _idx_0 == _key_0 then -- 708
						_tab_0[#_tab_0 + 1] = _value_0 -- 708
						_idx_0 = _idx_0 + 1 -- 708
					else -- 708
						_tab_0[_key_0] = _value_0 -- 708
					end -- 708
				end -- 708
				positions_all = _tab_0 -- 708
			end -- 708
			local positions = { } -- 709
			local our_pos = self:GetPos() -- 711
			for k, v in pairs(positions_all) do -- 712
				if not (our_pos == v.machine.pos) then -- 713
					positions[#positions + 1] = v -- 714
				end -- 713
			end -- 714
			local where = positions[math.random(#positions)] -- 715
			local where_mach = where.machine -- 716
			local where_gen = where.generator -- 717
			self:EmitSound("Evil_Squeal") -- 718
			self:SetPos(where_mach.pos) -- 719
			self:SetAngles(where_mach.ang) -- 720
			local gen = self:GetGenerator() -- 721
			gen:SetPos(where_gen.pos) -- 723
			gen:SetAngles(where_gen.ang) -- 724
			gen:SetRust(0) -- 725
			gen:SetFuel(0) -- 726
			if gen:GetOn() then -- 727
				gen:SetOn(false) -- 728
				gen:StopLoopingSound(gen:GetSoundLoop()) -- 729
				gen.Overload = false -- 730
			end -- 727
			self:PositionButtons() -- 731
			self:SetRust(0) -- 732
			return MsgC(Color(200, 0, 0), "The evil machine shifted.\n") -- 733
		end, -- 735
		Think = function(self) -- 735
			_class_0.__parent.__base.Think(self) -- 736
			local ct = CurTime() -- 737
			if not self.next_shift then -- 738
				self.next_shift = ct + 5 -- 738
			end -- 738
			if ct >= self.next_shift then -- 739
				if self:GetProducing() == "" then -- 740
					self.next_shift = ct + math.random(300, 900) -- 741
					return self:Shift() -- 742
				end -- 740
			end -- 739
		end, -- 744
		FactoryIdentifier = "evil" -- 647
	} -- 647
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 744
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 647
			_base_0[_key_0] = _val_0 -- 647
		end -- 647
	end -- 744
	if _base_0.__index == nil then -- 647
		_base_0.__index = _base_0 -- 647
	end -- 744
	setmetatable(_base_0, _parent_0.__base) -- 647
	_class_0 = setmetatable({ -- 647
		__init = function(self, ...) -- 647
			return _class_0.__parent.__init(self, ...) -- 647
		end, -- 647
		__base = _base_0, -- 647
		__name = "Evil", -- 647
		__parent = _parent_0 -- 647
	}, { -- 647
		__index = function(cls, name) -- 647
			local val = rawget(_base_0, name) -- 647
			if val == nil then -- 647
				local parent = rawget(cls, "__parent") -- 647
				if parent then -- 647
					return parent[name] -- 647
				end -- 647
			else -- 647
				return val -- 647
			end -- 647
		end, -- 647
		__call = function(cls, ...) -- 647
			local _self_0 = setmetatable({ }, _base_0) -- 647
			cls.__init(_self_0, ...) -- 647
			return _self_0 -- 647
		end -- 647
	}) -- 647
	_base_0.__class = _class_0 -- 647
	if _parent_0.__inherited then -- 647
		_parent_0.__inherited(_parent_0, _class_0) -- 647
	end -- 647
	Evil = _class_0 -- 647
	return _class_0 -- 744
end -- 744
