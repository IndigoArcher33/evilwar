-- [yue]: darkrp_modules\cooker\sh_cooker.yue
local noise = Material("models/props_lab/eyescanner_disp") -- 1
local noise2 = Material("models/props_lab/cornerunit_cloud") -- 2
local screen = Material("glass/glasswindow017a") -- 3
local recipes = { -- 7
	{ -- 8
		inputs = { -- 8
			"item/food/slopskull", -- 8
			"item/food/slopskull" -- 8
		}, -- 8
		output = "item/food/slopbowl" -- 9
	}, -- 7
	{ -- 12
		inputs = { -- 12
			"item/food/soyloaf", -- 12
			"item/food/drink/fearbeer" -- 12
		}, -- 12
		output = "item/food/drink/shake" -- 13
	}, -- 11
	{ -- 16
		inputs = { -- 16
			"item/food/slopskull", -- 16
			"item/food/ribbone" -- 16
		}, -- 16
		output = "item/food/sloppyribs" -- 17
	}, -- 15
	{ -- 20
		inputs = { -- 20
			"item/food/drink/fearbeer", -- 20
			"item/food/paper" -- 20
		}, -- 20
		output = "item/food/papermache" -- 21
	}, -- 19
	{ -- 24
		inputs = { -- 24
			"item/food/slopbowl", -- 24
			"item/food/boot" -- 24
		}, -- 24
		output = "item/food/bootsoup" -- 25
	}, -- 23
	{ -- 28
		inputs = { -- 28
			"item/food/moldmelon", -- 28
			"item/food/medicine/bleach" -- 28
		}, -- 28
		output = "item/food/bleachedmelon" -- 29
	}, -- 27
	{ -- 32
		inputs = { -- 32
			"item/food/abortion", -- 32
			"item/food/soyloaf" -- 32
		}, -- 32
		output = "item/food/meatloaf" -- 33
	}, -- 31
	{ -- 36
		inputs = { -- 36
			"item/food/drink/shake", -- 36
			"item/food/abortion" -- 36
		}, -- 36
		output = "item/food/eyeballnoodles" -- 37
	}, -- 35
	{ -- 40
		inputs = { -- 40
			"item/food/groundribs", -- 40
			"item/food/slopbowl" -- 40
		}, -- 40
		output = "item/food/chow" -- 41
	}, -- 39
	{ -- 44
		inputs = { -- 44
			"item/food/ribbone", -- 44
			"item/food/ribbone" -- 44
		}, -- 44
		output = "item/food/groundribs" -- 45
	}, -- 43
	{ -- 48
		inputs = { -- 48
			"item/food/drink/twitchel", -- 48
			"item/food/boot" -- 48
		}, -- 48
		output = "item/food/drink/bootleg" -- 49
	} -- 47
} -- 6
local recipeKey -- 53
recipeKey = function(a, b) -- 53
	if a > b then -- 54
		a, b = b, a -- 54
	end -- 54
	return tostring(a) .. "|" .. tostring(b) -- 55
end -- 53
local RecipeOutputs = { } -- 58
local IsInput = { } -- 59
local GetRecipe -- 60
GetRecipe = function(itemA, itemB) -- 60
	return RecipeOutputs[recipeKey(itemA, itemB)] -- 60
end -- 60
for _index_0 = 1, #recipes do -- 62
	local recipe = recipes[_index_0] -- 62
	local a, b = recipe.inputs[1], recipe.inputs[2] -- 63
	local key = recipeKey(a, b) -- 64
	RecipeOutputs[key] = recipe.output -- 65
	IsInput[a] = true -- 66
	IsInput[b] = true -- 67
end -- 67
local Cooker -- 69
do -- 69
	local _class_0 -- 69
	local _parent_0 = ENTITY -- 69
	local _base_0 = { -- 69
		Base = "base_anim", -- 71
		Type = "anim", -- 72
		PrintName = "Cooker", -- 73
		Interesting = true, -- 74
		Category = "EvilRP: Machines", -- 76
		Spawnable = true, -- 77
		AdminSpawnable = true, -- 79
		Pocketable = false, -- 81
		SetupDataTables = function(self) -- 81
			self:NetworkVar("String", "Producing") -- 82
			self:NetworkVar("String", "Input1") -- 83
			self:NetworkVar("String", "Input2") -- 84
			self:NetworkVar("Int", "ProductionStart") -- 85
			self:NetworkVar("Int", "ProductionEnd") -- 86
			self:NetworkVar("Int", "SoundLoop") -- 87
			self:NetworkVar("Int", "Rust") -- 88
			self:NetworkVar("Int", "Heat") -- 89
			return self:NetworkVar("Entity", "Worker") -- 90
		end, -- 92
		Initialize = function(self) -- 92
			if CLIENT then -- 93
				return -- 93
			end -- 93
			self:SetUseType(SIMPLE_USE) -- 94
			self:SetModel("models/props_wasteland/kitchen_stove002a.mdl") -- 95
			self:PhysicsInit(SOLID_VPHYSICS) -- 96
			self:PhysWake() -- 97
			self:SetHeat(0) -- 98
			self.NextHeat = 0 -- 99
		end, -- 101
		Use = function(self, ply) -- 101
			if CLIENT then -- 102
				return -- 102
			end -- 102
			if self:GetInput1() ~= "" and self:GetInput2() == "" and self:GetProducing() == "" then -- 103
				ply:ConCommand("say /me takes something out of the cooker.") -- 104
				ply:Notify("<c=200,0,0>Uh oh..") -- 105
				self:EmitSound("npc/barnacle/barnacle_tongue_pull1.wav") -- 106
				local sp = ents.Create(self:GetInput1()) -- 107
				self:SetInput1("") -- 108
				local start = self:GetPos() -- 109
				local endpos = start + (self:GetUp() * 128) + (self:GetForward() * 24) -- 110
				local tr = util.TraceLine({ -- 112
					start = start, -- 112
					endpos = endpos, -- 113
					filter = self, -- 114
					mask = MASK_NPCWORLDSTATIC -- 115
				}) -- 111
				sp:SetPos(tr.HitPos - (self:GetUp() * 60) + (self:GetForward() * 38) - (self:GetRight() * 2)) -- 118
				sp:Spawn() -- 119
				sp:Activate() -- 120
				return timer.Simple(0.5, function() -- 121
					self:EmitSound("npc/antlion/attack_single1.wav") -- 122
					ply:Notify("<c=200,0,0> OUCH!") -- 123
					local dmg = DamageInfo() -- 124
					dmg:SetDamage(10) -- 126
					dmg:SetDamageType(DMG_SLASH) -- 127
					dmg:SetAttacker(self) -- 128
					dmg:SetInflictor(self) -- 129
					dmg:SetDamagePosition(ply:EyePos()) -- 130
					return ply:TakeDamageInfo(dmg) -- 131
				end) -- 131
			end -- 103
		end, -- 134
		Think = function(self) -- 134
			if CLIENT then -- 135
				return -- 135
			end -- 135
			local pend = self:GetProductionEnd() -- 136
			local ct = CurTime() -- 137
			local rust = self:GetRust() -- 138
			if pend > 0 and ct >= pend then -- 139
				local prod = scripted_ents.Get(self:GetProducing()) -- 140
				self:SetRust(math.min(100, rust + (prod.CookTime))) -- 141
				self:EmitSound("buttons/lever6.wav") -- 142
				self:StopLoopingSound(self:GetSoundLoop()) -- 143
				local worker = self:GetWorker() -- 144
				if worker and IsValid(worker) then -- 145
					local start = self:GetPos() -- 146
					local endpos = start + (self:GetUp() * 128) + (self:GetForward() * 24) -- 147
					local tr = util.TraceLine({ -- 149
						start = start, -- 149
						endpos = endpos, -- 150
						filter = self, -- 151
						mask = MASK_NPCWORLDSTATIC -- 152
					}) -- 148
					if prod then -- 154
						local sp = ents.Create(self:GetProducing()) -- 155
						sp:SetPos(tr.HitPos - (self:GetUp() * 40) + (self:GetForward() * 38) - (self:GetRight() * 2)) -- 157
						sp:Spawn() -- 158
						sp:Activate() -- 159
					end -- 154
					self:SetWorker(nil) -- 162
				end -- 145
				self:SetProducing("") -- 163
				self:SetInput1("") -- 164
				self:SetInput2("") -- 165
				self:SetProductionStart(0) -- 166
				return self:SetProductionEnd(0) -- 167
			end -- 139
		end, -- 170
		Touch = function(self, what) -- 170
			if SERVER then -- 171
				if what.Rust then -- 172
					self:SetRust(math.Clamp(self:GetRust() + what.Rust, 0, 100)) -- 173
					self:EmitSound("ambient/machines/machine1_hit1.wav") -- 174
					local pos = what:GetPos() -- 175
					local ed = EffectData() -- 176
					ed:SetOrigin(pos) -- 178
					ed:SetScale(1) -- 179
					ed:SetMagnitude(1) -- 180
					ed:SetRadius(3) -- 181
					util.Effect("Sparks", ed) -- 182
					what:Trash() -- 183
					return -- 184
				end -- 172
				if self:GetProductionEnd() > 0 then -- 185
					return -- 185
				end -- 185
				if not IsInput[what:GetClass()] then -- 186
					return -- 186
				end -- 186
				if what.Processed then -- 187
					return -- 187
				end -- 187
				local submitter = what:GetNWEntity("evilrp_submitter") -- 188
				if not (submitter and IsValid(submitter)) then -- 189
					return -- 189
				end -- 189
				if self:GetInput1() == "" then -- 191
					self:SetInput1(what:GetClass()) -- 192
					what.Processed = true -- 193
					if what.Submitted then -- 194
						what:Submitted() -- 194
					end -- 194
					if what.SubmitSound then -- 195
						what:EmitSound(what.SubmitSound) -- 195
					end -- 195
					what:Remove() -- 196
					return -- 197
				end -- 191
				local prod = GetRecipe(self:GetInput1(), what:GetClass()) -- 198
				if not prod then -- 199
					return -- 199
				end -- 199
				self:SetInput2(what:GetClass()) -- 201
				what.Processed = true -- 202
				if what.Submitted then -- 203
					what:Submitted() -- 203
				end -- 203
				if what.SubmitSound then -- 204
					what:EmitSound(what.SubmitSound) -- 204
				end -- 204
				self:SetProducing(prod) -- 205
				local item = scripted_ents.Get(prod) -- 207
				local ct = CurTime() -- 208
				self:SetProductionStart(ct) -- 209
				local wait = item.CookTime * (1 + (self:GetRust() / 100)) -- 210
				self:SetProductionEnd(ct + wait) -- 211
				self:SetWorker(submitter) -- 212
				self:EmitSound("ambient/machines/machine1_hit1.wav") -- 213
				self:SetSoundLoop(self:StartLoopingSound("ambient/machines/machine_whine1.wav")) -- 214
				local ed = EffectData() -- 215
				ed:SetStart(self:GetPos()) -- 217
				ed:SetOrigin(self:GetPos()) -- 218
				ed:SetScale(2) -- 219
				util.Effect("StunstickImpact", ed, true, true) -- 220
				return what:Remove() -- 221
			end -- 171
		end, -- 223
		OnTakeDamage = function(self, dmg) -- 223
			local attacker = dmg:GetAttacker() -- 224
			if attacker and IsValid(attacker) then -- 225
				if attacker:IsPlayer() then -- 226
					local _exp_0 = attacker:Team() -- 227
					if TEAM_SANITAR == _exp_0 then -- 228
						local rust = self:GetRust() -- 229
						self:SetRust(math.max(0, rust - (dmg:GetDamage() * .2))) -- 230
						local reward = math.floor(math.abs(rust - self:GetRust()) * 2.3) -- 231
						if reward > 0 then -- 232
							return attacker:AddMoney(reward, "The Cleansing") -- 233
						end -- 232
					end -- 234
				end -- 226
			end -- 225
		end, -- 235
		Draw = function(self) -- 235
			self:DrawModel() -- 236
			return self:Render3D2D() -- 237
		end, -- 239
		HUDRender = function(self) -- 239
			local ct = { } -- 240
			ct[#ct + 1] = self.PrintName -- 241
			ct[#ct + 1] = { -- 243
				text = "In the hands of a good cook, edible things can come out of this.", -- 243
				font = "Spleen_Label_Small" -- 244
			} -- 242
			ct[#ct + 1] = { -- 247
				text = "It can cook much more than just food.", -- 247
				font = "Spleen_Label_Small" -- 248
			} -- 246
			return ct -- 250
		end, -- 252
		Render3D2D = function(self) -- 252
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 253
			if not (dist_sqr < 128 ^ 2) then -- 254
				return -- 254
			end -- 254
			local font = "Spleen_Label" -- 255
			local desp = lp:GetDespair() * 0.01 -- 256
			local ct = CurTime() -- 257
			local pos = self:GetPos() + (self:GetUp() * 80) + (self:GetForward() * 20) + (self:GetRight() * 15) -- 258
			local ang = self:GetAngles() -- 259
			ang:RotateAroundAxis(ang:Up(), -90) -- 261
			ang:RotateAroundAxis(ang:Forward(), 90) -- 262
			ang:RotateAroundAxis(ang:Right(), 180) -- 263
			cam.Start3D2D(pos, ang, 0.1) -- 265
			surface.SetMaterial(noise) -- 267
			surface.SetDrawColor(Color(255, 255, 255, 255)) -- 268
			surface.DrawTexturedRect(0, 0, 152, 38) -- 269
			local txt = "Cooker" -- 271
			local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 272
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 273
			cam.End3D2D() -- 275
			pos = self:GetPos() + (self:GetUp() * 72) + (self:GetForward() * 16) + (self:GetRight() * 8) -- 277
			cam.Start3D2D(pos, ang, 0.1) -- 278
			surface.SetMaterial(noise2) -- 280
			surface.SetDrawColor(Color(255, 191, 0, 255)) -- 281
			surface.DrawTexturedRect(0, 0, 152, 38) -- 282
			txt = "Feed me" -- 284
			local input -- 285
			if self:GetInput1() ~= "" then -- 285
				input = scripted_ents.Get(self:GetInput1()) -- 285
			end -- 285
			if input then -- 286
				txt = input.PrintName -- 286
			end -- 286
			input = nil -- 287
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 288
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 289
			cam.End3D2D() -- 291
			pos = self:GetPos() + (self:GetUp() * 37) + (self:GetForward() * 16) + (self:GetRight() * 8) -- 293
			cam.Start3D2D(pos, ang, 0.1) -- 294
			surface.SetMaterial(noise2) -- 296
			surface.SetDrawColor(Color(255, 191, 0, 255)) -- 297
			surface.DrawTexturedRect(0, 0, 152, 38) -- 298
			txt = "Feed me" -- 300
			if self:GetInput2() ~= "" then -- 301
				input = scripted_ents.Get(self:GetInput2()) -- 301
			end -- 301
			if input then -- 302
				txt = input.PrintName -- 302
			end -- 302
			input = nil -- 303
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 304
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 305
			cam.End3D2D() -- 307
			pos = self:GetPos() + (self:GetUp() * 80) + (self:GetForward() * 20) + (self:GetRight() * -1) -- 309
			cam.Start3D2D(pos, ang, 0.1) -- 310
			local rust = self:GetRust() -- 311
			txt = tostring(rust) .. "% rust" -- 312
			if rust < 0 then -- 313
				txt = "give me purpose" -- 314
			elseif rust >= 100 then -- 315
				txt = "100% ROTTEN" -- 316
			end -- 313
			local pend = self:GetProductionEnd() -- 317
			local pstart = self:GetProductionStart() -- 318
			local prod = self:GetProducing() -- 319
			if pend > 0 and prod then -- 320
				prod = scripted_ents.Get(prod) -- 321
				local text -- 322
				if prod then -- 322
					text = prod.PrintName -- 322
				end -- 322
			end -- 320
			surface.SetDrawColor(0, 0, 0, 255) -- 323
			surface.DrawRect(0, 0, 140, 38) -- 324
			if pend > 0 then -- 325
				local cur = ct - pstart -- 326
				surface.SetDrawColor(0, 150 + (100 * math.cos(ct)), 0, 255) -- 327
				surface.DrawRect(0, 0, 140 * (cur / (pend - pstart)), 38) -- 328
			elseif rust >= 100 then -- 329
				surface.SetDrawColor(150 + (100 * math.cos(ct)), 0, 0, 255) -- 330
				surface.DrawRect(0, 0, 140 * (rust / 100), 38) -- 331
			else -- 333
				surface.SetDrawColor(147, 58 + (2 * math.cos(ct)), 22, 255) -- 333
				surface.DrawRect(0, 0, 140 * (rust / 100), 38) -- 334
			end -- 325
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 335
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 336
			return cam.End3D2D() -- 337
		end -- 69
	} -- 69
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 338
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 69
			_base_0[_key_0] = _val_0 -- 69
		end -- 69
	end -- 338
	if _base_0.__index == nil then -- 69
		_base_0.__index = _base_0 -- 69
	end -- 338
	setmetatable(_base_0, _parent_0.__base) -- 69
	_class_0 = setmetatable({ -- 69
		__init = function(self, ...) -- 69
			return _class_0.__parent.__init(self, ...) -- 69
		end, -- 69
		__base = _base_0, -- 69
		__name = "Cooker", -- 69
		__parent = _parent_0 -- 69
	}, { -- 69
		__index = function(cls, name) -- 69
			local val = rawget(_base_0, name) -- 69
			if val == nil then -- 69
				local parent = rawget(cls, "__parent") -- 69
				if parent then -- 69
					return parent[name] -- 69
				end -- 69
			else -- 69
				return val -- 69
			end -- 69
		end, -- 69
		__call = function(cls, ...) -- 69
			local _self_0 = setmetatable({ }, _base_0) -- 69
			cls.__init(_self_0, ...) -- 69
			return _self_0 -- 69
		end -- 69
	}) -- 69
	_base_0.__class = _class_0 -- 69
	if _parent_0.__inherited then -- 69
		_parent_0.__inherited(_parent_0, _class_0) -- 69
	end -- 69
	Cooker = _class_0 -- 69
	return _class_0 -- 338
end -- 338
