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
	} -- 43
} -- 6
local recipeKey -- 49
recipeKey = function(a, b) -- 49
	if a > b then -- 50
		a, b = b, a -- 50
	end -- 50
	return tostring(a) .. "|" .. tostring(b) -- 51
end -- 49
local RecipeOutputs = { } -- 54
local IsInput = { } -- 55
local GetRecipe -- 56
GetRecipe = function(itemA, itemB) -- 56
	return RecipeOutputs[recipeKey(itemA, itemB)] -- 56
end -- 56
for _index_0 = 1, #recipes do -- 58
	local recipe = recipes[_index_0] -- 58
	local a, b = recipe.inputs[1], recipe.inputs[2] -- 59
	local key = recipeKey(a, b) -- 60
	RecipeOutputs[key] = recipe.output -- 61
	IsInput[a] = true -- 62
	IsInput[b] = true -- 63
end -- 63
local Cooker -- 65
do -- 65
	local _class_0 -- 65
	local _parent_0 = ENTITY -- 65
	local _base_0 = { -- 65
		Base = "base_anim", -- 67
		Type = "anim", -- 68
		PrintName = "Cooker", -- 69
		Interesting = true, -- 70
		Category = "EvilRP: Machines", -- 72
		Spawnable = true, -- 73
		AdminSpawnable = true, -- 75
		Pocketable = false, -- 77
		SetupDataTables = function(self) -- 77
			self:NetworkVar("String", "Producing") -- 78
			self:NetworkVar("String", "Input1") -- 79
			self:NetworkVar("String", "Input2") -- 80
			self:NetworkVar("Int", "ProductionStart") -- 81
			self:NetworkVar("Int", "ProductionEnd") -- 82
			self:NetworkVar("Int", "SoundLoop") -- 83
			self:NetworkVar("Int", "Rust") -- 84
			self:NetworkVar("Int", "Heat") -- 85
			return self:NetworkVar("Entity", "Worker") -- 86
		end, -- 88
		Initialize = function(self) -- 88
			if CLIENT then -- 89
				return -- 89
			end -- 89
			self:SetUseType(SIMPLE_USE) -- 90
			self:SetModel("models/props_wasteland/kitchen_stove002a.mdl") -- 91
			self:PhysicsInit(SOLID_VPHYSICS) -- 92
			self:PhysWake() -- 93
			self:SetHeat(0) -- 94
			self.NextHeat = 0 -- 95
		end, -- 97
		Use = function(self, ply) -- 97
			if CLIENT then -- 98
				return -- 98
			end -- 98
			if self:GetInput1() ~= "" and self:GetInput2() == "" and self:GetProducing() == "" then -- 99
				ply:ConCommand("say /me takes something out of the cooker.") -- 100
				ply:Notify("<c=200,0,0>Uh oh..") -- 101
				self:EmitSound("npc/barnacle/barnacle_tongue_pull1.wav") -- 102
				local sp = ents.Create(self:GetInput1()) -- 103
				self:SetInput1("") -- 104
				local start = self:GetPos() -- 105
				local endpos = start + (self:GetUp() * 128) + (self:GetForward() * 24) -- 106
				local tr = util.TraceLine({ -- 108
					start = start, -- 108
					endpos = endpos, -- 109
					filter = self, -- 110
					mask = MASK_NPCWORLDSTATIC -- 111
				}) -- 107
				sp:SetPos(tr.HitPos - (self:GetUp() * 60) + (self:GetForward() * 38) - (self:GetRight() * 2)) -- 114
				sp:Spawn() -- 115
				sp:Activate() -- 116
				return timer.Simple(0.5, function() -- 117
					self:EmitSound("npc/antlion/attack_single1.wav") -- 118
					ply:Notify("<c=200,0,0> OUCH!") -- 119
					local dmg = DamageInfo() -- 120
					dmg:SetDamage(10) -- 122
					dmg:SetDamageType(DMG_SLASH) -- 123
					dmg:SetAttacker(self) -- 124
					dmg:SetInflictor(self) -- 125
					dmg:SetDamagePosition(ply:EyePos()) -- 126
					return ply:TakeDamageInfo(dmg) -- 127
				end) -- 127
			end -- 99
		end, -- 130
		Think = function(self) -- 130
			if CLIENT then -- 131
				return -- 131
			end -- 131
			local pend = self:GetProductionEnd() -- 132
			local ct = CurTime() -- 133
			local rust = self:GetRust() -- 134
			if pend > 0 and ct >= pend then -- 135
				local prod = scripted_ents.Get(self:GetProducing()) -- 136
				self:SetRust(math.min(100, rust + (prod.CookTime))) -- 137
				self:EmitSound("buttons/lever6.wav") -- 138
				self:StopLoopingSound(self:GetSoundLoop()) -- 139
				local worker = self:GetWorker() -- 140
				if worker and IsValid(worker) then -- 141
					local start = self:GetPos() -- 142
					local endpos = start + (self:GetUp() * 128) + (self:GetForward() * 24) -- 143
					local tr = util.TraceLine({ -- 145
						start = start, -- 145
						endpos = endpos, -- 146
						filter = self, -- 147
						mask = MASK_NPCWORLDSTATIC -- 148
					}) -- 144
					if prod then -- 150
						local sp = ents.Create(self:GetProducing()) -- 151
						sp:SetPos(tr.HitPos - (self:GetUp() * 40) + (self:GetForward() * 38) - (self:GetRight() * 2)) -- 153
						sp:Spawn() -- 154
						sp:Activate() -- 155
					end -- 150
					self:SetWorker(nil) -- 158
				end -- 141
				self:SetProducing("") -- 159
				self:SetInput1("") -- 160
				self:SetInput2("") -- 161
				self:SetProductionStart(0) -- 162
				return self:SetProductionEnd(0) -- 163
			end -- 135
		end, -- 166
		Touch = function(self, what) -- 166
			if SERVER then -- 167
				if what.Rust then -- 168
					self:SetRust(math.Clamp(self:GetRust() + what.Rust, 0, 100)) -- 169
					self:EmitSound("ambient/machines/machine1_hit1.wav") -- 170
					local pos = what:GetPos() -- 171
					local ed = EffectData() -- 172
					ed:SetOrigin(pos) -- 174
					ed:SetScale(1) -- 175
					ed:SetMagnitude(1) -- 176
					ed:SetRadius(3) -- 177
					util.Effect("Sparks", ed) -- 178
					what:Trash() -- 179
					return -- 180
				end -- 168
				if self:GetProductionEnd() > 0 then -- 181
					return -- 181
				end -- 181
				if not IsInput[what:GetClass()] then -- 182
					return -- 182
				end -- 182
				if what.Processed then -- 183
					return -- 183
				end -- 183
				local submitter = what:GetNWEntity("evilrp_submitter") -- 184
				if not (submitter and IsValid(submitter)) then -- 185
					return -- 185
				end -- 185
				if self:GetInput1() == "" then -- 187
					self:SetInput1(what:GetClass()) -- 188
					what.Processed = true -- 189
					if what.Submitted then -- 190
						what:Submitted() -- 190
					end -- 190
					if what.SubmitSound then -- 191
						what:EmitSound(what.SubmitSound) -- 191
					end -- 191
					what:Remove() -- 192
					return -- 193
				end -- 187
				local prod = GetRecipe(self:GetInput1(), what:GetClass()) -- 194
				if not prod then -- 195
					return -- 195
				end -- 195
				self:SetInput2(what:GetClass()) -- 197
				what.Processed = true -- 198
				if what.Submitted then -- 199
					what:Submitted() -- 199
				end -- 199
				if what.SubmitSound then -- 200
					what:EmitSound(what.SubmitSound) -- 200
				end -- 200
				self:SetProducing(prod) -- 201
				local item = scripted_ents.Get(prod) -- 203
				local ct = CurTime() -- 204
				self:SetProductionStart(ct) -- 205
				local wait = item.CookTime * (1 + (self:GetRust() / 100)) -- 206
				self:SetProductionEnd(ct + wait) -- 207
				self:SetWorker(submitter) -- 208
				self:EmitSound("ambient/machines/machine1_hit1.wav") -- 209
				self:SetSoundLoop(self:StartLoopingSound("ambient/machines/machine_whine1.wav")) -- 210
				local ed = EffectData() -- 211
				ed:SetStart(self:GetPos()) -- 213
				ed:SetOrigin(self:GetPos()) -- 214
				ed:SetScale(2) -- 215
				util.Effect("StunstickImpact", ed, true, true) -- 216
				return what:Remove() -- 217
			end -- 167
		end, -- 219
		OnTakeDamage = function(self, dmg) -- 219
			local attacker = dmg:GetAttacker() -- 220
			if attacker and IsValid(attacker) then -- 221
				if attacker:IsPlayer() then -- 222
					local _exp_0 = attacker:Team() -- 223
					if TEAM_SANITAR == _exp_0 then -- 224
						local rust = self:GetRust() -- 225
						self:SetRust(math.max(0, rust - (dmg:GetDamage() * .2))) -- 226
						local reward = math.floor(math.abs(rust - self:GetRust()) * 2.3) -- 227
						if reward > 0 then -- 228
							return attacker:AddMoney(reward, "The Cleansing") -- 229
						end -- 228
					end -- 230
				end -- 222
			end -- 221
		end, -- 231
		Draw = function(self) -- 231
			self:DrawModel() -- 232
			return self:Render3D2D() -- 233
		end, -- 235
		HUDRender = function(self) -- 235
			local ct = { } -- 236
			ct[#ct + 1] = self.PrintName -- 237
			ct[#ct + 1] = { -- 239
				text = "In the hands of a good cook, edible things can come out of this.", -- 239
				font = "Spleen_Label_Small" -- 240
			} -- 238
			ct[#ct + 1] = { -- 243
				text = "It can cook much more than just food.", -- 243
				font = "Spleen_Label_Small" -- 244
			} -- 242
			return ct -- 246
		end, -- 248
		Render3D2D = function(self) -- 248
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 249
			if not (dist_sqr < 128 ^ 2) then -- 250
				return -- 250
			end -- 250
			local font = "Spleen_Label" -- 251
			local desp = lp:GetDespair() * 0.01 -- 252
			local ct = CurTime() -- 253
			local pos = self:GetPos() + (self:GetUp() * 80) + (self:GetForward() * 20) + (self:GetRight() * 15) -- 254
			local ang = self:GetAngles() -- 255
			ang:RotateAroundAxis(ang:Up(), -90) -- 257
			ang:RotateAroundAxis(ang:Forward(), 90) -- 258
			ang:RotateAroundAxis(ang:Right(), 180) -- 259
			cam.Start3D2D(pos, ang, 0.1) -- 261
			surface.SetMaterial(noise) -- 263
			surface.SetDrawColor(Color(255, 255, 255, 255)) -- 264
			surface.DrawTexturedRect(0, 0, 152, 38) -- 265
			local txt = "Cooker" -- 267
			local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 268
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 269
			cam.End3D2D() -- 271
			pos = self:GetPos() + (self:GetUp() * 72) + (self:GetForward() * 16) + (self:GetRight() * 8) -- 273
			cam.Start3D2D(pos, ang, 0.1) -- 274
			surface.SetMaterial(noise2) -- 276
			surface.SetDrawColor(Color(255, 191, 0, 255)) -- 277
			surface.DrawTexturedRect(0, 0, 152, 38) -- 278
			txt = "Feed me" -- 280
			local input -- 281
			if self:GetInput1() ~= "" then -- 281
				input = scripted_ents.Get(self:GetInput1()) -- 281
			end -- 281
			if input then -- 282
				txt = input.PrintName -- 282
			end -- 282
			input = nil -- 283
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 284
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 285
			cam.End3D2D() -- 287
			pos = self:GetPos() + (self:GetUp() * 37) + (self:GetForward() * 16) + (self:GetRight() * 8) -- 289
			cam.Start3D2D(pos, ang, 0.1) -- 290
			surface.SetMaterial(noise2) -- 292
			surface.SetDrawColor(Color(255, 191, 0, 255)) -- 293
			surface.DrawTexturedRect(0, 0, 152, 38) -- 294
			txt = "Feed me" -- 296
			if self:GetInput2() ~= "" then -- 297
				input = scripted_ents.Get(self:GetInput2()) -- 297
			end -- 297
			if input then -- 298
				txt = input.PrintName -- 298
			end -- 298
			input = nil -- 299
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 300
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 301
			cam.End3D2D() -- 303
			pos = self:GetPos() + (self:GetUp() * 80) + (self:GetForward() * 20) + (self:GetRight() * -1) -- 305
			cam.Start3D2D(pos, ang, 0.1) -- 306
			local rust = self:GetRust() -- 307
			txt = tostring(rust) .. "% rust" -- 308
			if rust < 0 then -- 309
				txt = "give me purpose" -- 310
			elseif rust >= 100 then -- 311
				txt = "100% ROTTEN" -- 312
			end -- 309
			local pend = self:GetProductionEnd() -- 313
			local pstart = self:GetProductionStart() -- 314
			local prod = self:GetProducing() -- 315
			if pend > 0 and prod then -- 316
				prod = scripted_ents.Get(prod) -- 317
				local text -- 318
				if prod then -- 318
					text = prod.PrintName -- 318
				end -- 318
			end -- 316
			surface.SetDrawColor(0, 0, 0, 255) -- 319
			surface.DrawRect(0, 0, 140, 38) -- 320
			if pend > 0 then -- 321
				local cur = ct - pstart -- 322
				surface.SetDrawColor(0, 150 + (100 * math.cos(ct)), 0, 255) -- 323
				surface.DrawRect(0, 0, 140 * (cur / (pend - pstart)), 38) -- 324
			elseif rust >= 100 then -- 325
				surface.SetDrawColor(150 + (100 * math.cos(ct)), 0, 0, 255) -- 326
				surface.DrawRect(0, 0, 140 * (rust / 100), 38) -- 327
			else -- 329
				surface.SetDrawColor(147, 58 + (2 * math.cos(ct)), 22, 255) -- 329
				surface.DrawRect(0, 0, 140 * (rust / 100), 38) -- 330
			end -- 321
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 331
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 332
			return cam.End3D2D() -- 333
		end -- 65
	} -- 65
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 334
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 65
			_base_0[_key_0] = _val_0 -- 65
		end -- 65
	end -- 334
	if _base_0.__index == nil then -- 65
		_base_0.__index = _base_0 -- 65
	end -- 334
	setmetatable(_base_0, _parent_0.__base) -- 65
	_class_0 = setmetatable({ -- 65
		__init = function(self, ...) -- 65
			return _class_0.__parent.__init(self, ...) -- 65
		end, -- 65
		__base = _base_0, -- 65
		__name = "Cooker", -- 65
		__parent = _parent_0 -- 65
	}, { -- 65
		__index = function(cls, name) -- 65
			local val = rawget(_base_0, name) -- 65
			if val == nil then -- 65
				local parent = rawget(cls, "__parent") -- 65
				if parent then -- 65
					return parent[name] -- 65
				end -- 65
			else -- 65
				return val -- 65
			end -- 65
		end, -- 65
		__call = function(cls, ...) -- 65
			local _self_0 = setmetatable({ }, _base_0) -- 65
			cls.__init(_self_0, ...) -- 65
			return _self_0 -- 65
		end -- 65
	}) -- 65
	_base_0.__class = _class_0 -- 65
	if _parent_0.__inherited then -- 65
		_parent_0.__inherited(_parent_0, _class_0) -- 65
	end -- 65
	Cooker = _class_0 -- 65
	return _class_0 -- 334
end -- 334
