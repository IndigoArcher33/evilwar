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
	}, -- 47
	{ -- 52
		inputs = { -- 52
			"polymer/thermoplastic", -- 52
			"polymer/thermoplastic" -- 52
		}, -- 52
		output = "polymer/nylon" -- 53
	} -- 51
} -- 6
local recipeKey -- 57
recipeKey = function(a, b) -- 57
	if a > b then -- 58
		a, b = b, a -- 58
	end -- 58
	return tostring(a) .. "|" .. tostring(b) -- 59
end -- 57
local RecipeOutputs = { } -- 62
local IsInput = { } -- 63
local GetRecipe -- 64
GetRecipe = function(itemA, itemB) -- 64
	return RecipeOutputs[recipeKey(itemA, itemB)] -- 64
end -- 64
for _index_0 = 1, #recipes do -- 66
	local recipe = recipes[_index_0] -- 66
	local a, b = recipe.inputs[1], recipe.inputs[2] -- 67
	local key = recipeKey(a, b) -- 68
	RecipeOutputs[key] = recipe.output -- 69
	IsInput[a] = true -- 70
	IsInput[b] = true -- 71
end -- 66
local Cooker -- 73
local _class_0 -- 73
local _parent_0 = ENTITY -- 73
local _base_0 = { -- 73
	Base = "base_anim", -- 74
	Type = "anim", -- 75
	PrintName = "Cooker", -- 76
	Interesting = true, -- 77
	Category = "EvilRP: Machines", -- 78
	Spawnable = true, -- 80
	AdminSpawnable = true, -- 81
	Pocketable = false, -- 83
	SetupDataTables = function(self) -- 85
		self:NetworkVar("String", "Producing") -- 86
		self:NetworkVar("String", "Input1") -- 87
		self:NetworkVar("String", "Input2") -- 88
		self:NetworkVar("Int", "ProductionStart") -- 89
		self:NetworkVar("Int", "ProductionEnd") -- 90
		self:NetworkVar("Int", "SoundLoop") -- 91
		self:NetworkVar("Int", "Rust") -- 92
		self:NetworkVar("Int", "Heat") -- 93
		return self:NetworkVar("Entity", "Worker") -- 94
	end, -- 85
	Initialize = function(self) -- 96
		if CLIENT then -- 97
			return -- 97
		end -- 97
		self:SetUseType(SIMPLE_USE) -- 98
		self:SetModel("models/props_wasteland/kitchen_stove002a.mdl") -- 99
		self:PhysicsInit(SOLID_VPHYSICS) -- 100
		self:PhysWake() -- 101
		self:SetHeat(0) -- 102
		self.NextHeat = 0 -- 103
	end, -- 96
	Use = function(self, ply) -- 105
		if CLIENT then -- 106
			return -- 106
		end -- 106
		if self:GetInput1() ~= "" and self:GetInput2() == "" and self:GetProducing() == "" then -- 107
			ply:ConCommand("say /me takes something out of the cooker.") -- 108
			ply:Notify("<c=200,0,0>Uh oh..") -- 109
			self:EmitSound("npc/barnacle/barnacle_tongue_pull1.wav") -- 110
			local sp = ents.Create(self:GetInput1()) -- 111
			self:SetInput1("") -- 112
			local start = self:GetPos() -- 113
			local endpos = start + (self:GetUp() * 128) + (self:GetForward() * 24) -- 114
			local tr = util.TraceLine({ -- 116
				start = start, -- 116
				endpos = endpos, -- 117
				filter = self, -- 118
				mask = MASK_NPCWORLDSTATIC -- 119
			}) -- 115
			sp:SetPos(tr.HitPos - (self:GetUp() * 60) + (self:GetForward() * 38) - (self:GetRight() * 2)) -- 122
			sp:Spawn() -- 123
			sp:Activate() -- 124
			return timer.Simple(0.5, function() -- 125
				self:EmitSound("npc/antlion/attack_single1.wav") -- 126
				ply:Notify("<c=200,0,0> OUCH!") -- 127
				local dmg = DamageInfo() -- 128
				dmg:SetDamage(10) -- 130
				dmg:SetDamageType(DMG_SLASH) -- 131
				dmg:SetAttacker(self) -- 132
				dmg:SetInflictor(self) -- 133
				dmg:SetDamagePosition(ply:EyePos()) -- 134
				return ply:TakeDamageInfo(dmg) -- 135
			end) -- 125
		end -- 107
	end, -- 105
	Think = function(self) -- 138
		if CLIENT then -- 139
			return -- 139
		end -- 139
		local pend = self:GetProductionEnd() -- 140
		local ct = CurTime() -- 141
		local rust = self:GetRust() -- 142
		if pend > 0 and ct >= pend then -- 143
			local prod = scripted_ents.Get(self:GetProducing()) -- 144
			self:SetRust(math.min(100, rust + (prod.CookTime))) -- 145
			self:EmitSound("buttons/lever6.wav") -- 146
			self:StopLoopingSound(self:GetSoundLoop()) -- 147
			local worker = self:GetWorker() -- 148
			if worker and IsValid(worker) then -- 149
				local start = self:GetPos() -- 150
				local endpos = start + (self:GetUp() * 128) + (self:GetForward() * 24) -- 151
				local tr = util.TraceLine({ -- 153
					start = start, -- 153
					endpos = endpos, -- 154
					filter = self, -- 155
					mask = MASK_NPCWORLDSTATIC -- 156
				}) -- 152
				if prod then -- 158
					local sp = ents.Create(self:GetProducing()) -- 159
					sp:SetPos(tr.HitPos - (self:GetUp() * 40) + (self:GetForward() * 38) - (self:GetRight() * 2)) -- 161
					sp:Spawn() -- 162
					sp:Activate() -- 163
				end -- 158
				self:SetWorker(nil) -- 166
			end -- 149
			self:SetProducing("") -- 167
			self:SetInput1("") -- 168
			self:SetInput2("") -- 169
			self:SetProductionStart(0) -- 170
			return self:SetProductionEnd(0) -- 171
		end -- 143
	end, -- 138
	Touch = function(self, what) -- 174
		if SERVER then -- 175
			if what.Rust then -- 176
				self:SetRust(math.Clamp(self:GetRust() + what.Rust, 0, 100)) -- 177
				self:EmitSound("ambient/machines/machine1_hit1.wav") -- 178
				local pos = what:GetPos() -- 179
				local ed = EffectData() -- 180
				ed:SetOrigin(pos) -- 182
				ed:SetScale(1) -- 183
				ed:SetMagnitude(1) -- 184
				ed:SetRadius(3) -- 185
				util.Effect("Sparks", ed) -- 186
				what:Trash() -- 187
				return -- 188
			end -- 176
			if self:GetProductionEnd() > 0 then -- 189
				return -- 189
			end -- 189
			if not IsInput[what:GetClass()] then -- 190
				return -- 190
			end -- 190
			if what.Processed then -- 191
				return -- 191
			end -- 191
			local submitter = what:GetNWEntity("evilrp_submitter") -- 192
			if not (submitter and IsValid(submitter)) then -- 193
				return -- 193
			end -- 193
			if self:GetInput1() == "" then -- 195
				self:SetInput1(what:GetClass()) -- 196
				what.Processed = true -- 197
				if what.Submitted then -- 198
					what:Submitted() -- 198
				end -- 198
				if what.SubmitSound then -- 199
					what:EmitSound(what.SubmitSound) -- 199
				end -- 199
				what:Remove() -- 200
				return -- 201
			end -- 195
			local prod = GetRecipe(self:GetInput1(), what:GetClass()) -- 202
			if not prod then -- 203
				return -- 203
			end -- 203
			self:SetInput2(what:GetClass()) -- 205
			what.Processed = true -- 206
			if what.Submitted then -- 207
				what:Submitted() -- 207
			end -- 207
			if what.SubmitSound then -- 208
				what:EmitSound(what.SubmitSound) -- 208
			end -- 208
			self:SetProducing(prod) -- 209
			local item = scripted_ents.Get(prod) -- 211
			local ct = CurTime() -- 212
			self:SetProductionStart(ct) -- 213
			local wait = item.CookTime * (1 + (self:GetRust() / 100)) -- 214
			self:SetProductionEnd(ct + wait) -- 215
			self:SetWorker(submitter) -- 216
			self:EmitSound("ambient/machines/machine1_hit1.wav") -- 217
			self:SetSoundLoop(self:StartLoopingSound("ambient/machines/machine_whine1.wav")) -- 218
			local ed = EffectData() -- 219
			ed:SetStart(self:GetPos()) -- 221
			ed:SetOrigin(self:GetPos()) -- 222
			ed:SetScale(2) -- 223
			util.Effect("StunstickImpact", ed, true, true) -- 224
			return what:Remove() -- 225
		end -- 175
	end, -- 174
	OnTakeDamage = function(self, dmg) -- 227
		local attacker = dmg:GetAttacker() -- 228
		if attacker and IsValid(attacker) then -- 229
			if attacker:IsPlayer() then -- 230
				local _exp_0 = attacker:Team() -- 231
				if TEAM_KORPSMAN == _exp_0 or TEAM_CONSCRIPT == _exp_0 then -- 232
					local rust = self:GetRust() -- 233
					self:SetRust(math.max(0, rust - (dmg:GetDamage() * .2))) -- 234
					local reward = math.floor(math.abs(rust - self:GetRust()) * 1) -- 235
					if reward > 0 then -- 236
						attacker:AddMoney(reward, "The Cleansing") -- 237
						return attacker:SetHealth(attacker:Health() + 6) -- 238
					end -- 236
				end -- 231
			end -- 230
		end -- 229
	end, -- 227
	Draw = function(self) -- 240
		self:DrawModel() -- 241
		return self:Render3D2D() -- 242
	end, -- 240
	HUDRender = function(self) -- 244
		local ct = { } -- 245
		ct[#ct + 1] = self.PrintName -- 246
		ct[#ct + 1] = { -- 248
			text = "In the hands of a good cook, edible things can come out of this.", -- 248
			font = "Spleen_Label_Small" -- 249
		} -- 247
		ct[#ct + 1] = { -- 252
			text = "It can cook much more than just food.", -- 252
			font = "Spleen_Label_Small" -- 253
		} -- 251
		return ct -- 255
	end, -- 244
	Render3D2D = function(self) -- 257
		local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 258
		if not (dist_sqr < 128 ^ 2) then -- 259
			return -- 259
		end -- 259
		local font = "Spleen_Label" -- 260
		local desp = lp:GetDespair() * 0.01 -- 261
		local ct = CurTime() -- 262
		local pos = self:GetPos() + (self:GetUp() * 80) + (self:GetForward() * 20) + (self:GetRight() * 15) -- 263
		local ang = self:GetAngles() -- 264
		ang:RotateAroundAxis(ang:Up(), -90) -- 266
		ang:RotateAroundAxis(ang:Forward(), 90) -- 267
		ang:RotateAroundAxis(ang:Right(), 180) -- 268
		cam.Start3D2D(pos, ang, 0.1) -- 270
		surface.SetMaterial(noise) -- 272
		surface.SetDrawColor(Color(255, 255, 255, 255)) -- 273
		surface.DrawTexturedRect(0, 0, 152, 38) -- 274
		local txt = "Cooker" -- 276
		local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 277
		txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 278
		cam.End3D2D() -- 280
		pos = self:GetPos() + (self:GetUp() * 72) + (self:GetForward() * 16) + (self:GetRight() * 8) -- 282
		cam.Start3D2D(pos, ang, 0.1) -- 283
		surface.SetMaterial(noise2) -- 285
		surface.SetDrawColor(Color(255, 191, 0, 255)) -- 286
		surface.DrawTexturedRect(0, 0, 152, 38) -- 287
		txt = "Feed me" -- 289
		local input -- 290
		if self:GetInput1() ~= "" then -- 290
			input = scripted_ents.Get(self:GetInput1()) -- 290
		end -- 290
		if input then -- 291
			txt = input.PrintName -- 291
		end -- 291
		input = nil -- 292
		txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 293
		txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 294
		cam.End3D2D() -- 296
		pos = self:GetPos() + (self:GetUp() * 37) + (self:GetForward() * 16) + (self:GetRight() * 8) -- 298
		cam.Start3D2D(pos, ang, 0.1) -- 299
		surface.SetMaterial(noise2) -- 301
		surface.SetDrawColor(Color(255, 191, 0, 255)) -- 302
		surface.DrawTexturedRect(0, 0, 152, 38) -- 303
		txt = "Feed me" -- 305
		if self:GetInput2() ~= "" then -- 306
			input = scripted_ents.Get(self:GetInput2()) -- 306
		end -- 306
		if input then -- 307
			txt = input.PrintName -- 307
		end -- 307
		input = nil -- 308
		txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 309
		txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 310
		cam.End3D2D() -- 312
		pos = self:GetPos() + (self:GetUp() * 80) + (self:GetForward() * 20) + (self:GetRight() * -1) -- 314
		cam.Start3D2D(pos, ang, 0.1) -- 315
		local rust = self:GetRust() -- 316
		txt = tostring(rust) .. "% rust" -- 317
		if rust < 0 then -- 318
			txt = "give me purpose" -- 319
		elseif rust >= 100 then -- 320
			txt = "100% ROTTEN" -- 321
		end -- 318
		local pend = self:GetProductionEnd() -- 322
		local pstart = self:GetProductionStart() -- 323
		local prod = self:GetProducing() -- 324
		if pend > 0 and prod then -- 325
			prod = scripted_ents.Get(prod) -- 326
			local text -- 327
			if prod then -- 327
				text = prod.PrintName -- 327
			end -- 327
		end -- 325
		surface.SetDrawColor(0, 0, 0, 255) -- 328
		surface.DrawRect(0, 0, 140, 38) -- 329
		if pend > 0 then -- 330
			local cur = ct - pstart -- 331
			surface.SetDrawColor(0, 150 + (100 * math.cos(ct)), 0, 255) -- 332
			surface.DrawRect(0, 0, 140 * (cur / (pend - pstart)), 38) -- 333
		elseif rust >= 100 then -- 334
			surface.SetDrawColor(150 + (100 * math.cos(ct)), 0, 0, 255) -- 335
			surface.DrawRect(0, 0, 140 * (rust / 100), 38) -- 336
		else -- 338
			surface.SetDrawColor(147, 58 + (2 * math.cos(ct)), 22, 255) -- 338
			surface.DrawRect(0, 0, 140 * (rust / 100), 38) -- 339
		end -- 330
		txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 340
		txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 341
		return cam.End3D2D() -- 342
	end -- 257
} -- 73
for _key_0, _val_0 in pairs(_parent_0.__base) do -- 73
	if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 73
		_base_0[_key_0] = _val_0 -- 73
	end -- 73
end -- 73
if _base_0.__index == nil then -- 73
	_base_0.__index = _base_0 -- 73
end -- 73
setmetatable(_base_0, _parent_0.__base) -- 73
_class_0 = setmetatable({ -- 73
	__init = function(self, ...) -- 73
		return _class_0.__parent.__init(self, ...) -- 73
	end, -- 73
	__base = _base_0, -- 73
	__name = "Cooker", -- 73
	__parent = _parent_0 -- 73
}, { -- 73
	__index = function(cls, name) -- 73
		local val = rawget(_base_0, name) -- 73
		if val == nil then -- 73
			local parent = rawget(cls, "__parent") -- 73
			if parent then -- 73
				return parent[name] -- 73
			end -- 73
		else -- 73
			return val -- 73
		end -- 73
	end, -- 73
	__call = function(cls, ...) -- 73
		local _self_0 = setmetatable({ }, _base_0) -- 73
		cls.__init(_self_0, ...) -- 73
		return _self_0 -- 73
	end -- 73
}) -- 73
_base_0.__class = _class_0 -- 73
if _parent_0.__inherited then -- 73
	_parent_0.__inherited(_parent_0, _class_0) -- 73
end -- 73
Cooker = _class_0 -- 73
return _class_0 -- 73
