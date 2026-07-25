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
	} -- 35
} -- 6
local recipeKey -- 41
recipeKey = function(a, b) -- 41
	if a > b then -- 42
		a, b = b, a -- 42
	end -- 42
	return tostring(a) .. "|" .. tostring(b) -- 43
end -- 41
local RecipeOutputs = { } -- 46
local IsInput = { } -- 47
local GetRecipe -- 48
GetRecipe = function(itemA, itemB) -- 48
	return RecipeOutputs[recipeKey(itemA, itemB)] -- 48
end -- 48
for _index_0 = 1, #recipes do -- 50
	local recipe = recipes[_index_0] -- 50
	local a, b = recipe.inputs[1], recipe.inputs[2] -- 51
	local key = recipeKey(a, b) -- 52
	RecipeOutputs[key] = recipe.output -- 53
	IsInput[a] = true -- 54
	IsInput[b] = true -- 55
end -- 55
local Cooker -- 57
do -- 57
	local _class_0 -- 57
	local _parent_0 = ENTITY -- 57
	local _base_0 = { -- 57
		Base = "base_anim", -- 59
		Type = "anim", -- 60
		PrintName = "Cooker", -- 61
		Interesting = true, -- 62
		Category = "EvilRP: Machines", -- 64
		Spawnable = true, -- 65
		AdminSpawnable = true, -- 67
		Pocketable = false, -- 69
		SetupDataTables = function(self) -- 69
			self:NetworkVar("String", "Producing") -- 70
			self:NetworkVar("String", "Input1") -- 71
			self:NetworkVar("String", "Input2") -- 72
			self:NetworkVar("Int", "ProductionStart") -- 73
			self:NetworkVar("Int", "ProductionEnd") -- 74
			self:NetworkVar("Int", "SoundLoop") -- 75
			self:NetworkVar("Int", "Rust") -- 76
			self:NetworkVar("Int", "Heat") -- 77
			return self:NetworkVar("Entity", "Worker") -- 78
		end, -- 80
		Initialize = function(self) -- 80
			if CLIENT then -- 81
				return -- 81
			end -- 81
			self:SetUseType(SIMPLE_USE) -- 82
			self:SetModel("models/props_wasteland/kitchen_stove002a.mdl") -- 83
			self:PhysicsInit(SOLID_VPHYSICS) -- 84
			self:PhysWake() -- 85
			self:SetHeat(0) -- 86
			self.NextHeat = 0 -- 87
		end, -- 89
		Think = function(self) -- 89
			if CLIENT then -- 90
				return -- 90
			end -- 90
			local pend = self:GetProductionEnd() -- 91
			local ct = CurTime() -- 92
			local rust = self:GetRust() -- 93
			if pend > 0 and ct >= pend then -- 94
				local prod = scripted_ents.Get(self:GetProducing()) -- 95
				self:SetRust(math.min(100, rust + (prod.CookTime))) -- 96
				self:EmitSound("buttons/lever6.wav") -- 97
				self:StopLoopingSound(self:GetSoundLoop()) -- 98
				local worker = self:GetWorker() -- 99
				if worker and IsValid(worker) then -- 100
					local start = self:GetPos() -- 101
					local endpos = start + (self:GetUp() * 128) + (self:GetForward() * 24) -- 102
					local tr = util.TraceLine({ -- 104
						start = start, -- 104
						endpos = endpos, -- 105
						filter = self, -- 106
						mask = MASK_NPCWORLDSTATIC -- 107
					}) -- 103
					if prod then -- 109
						local sp = ents.Create(self:GetProducing()) -- 110
						sp:SetPos(tr.HitPos - (self:GetUp() * 40) + (self:GetForward() * 38) - (self:GetRight() * 2)) -- 112
						sp:Spawn() -- 113
						sp:Activate() -- 114
					end -- 109
					self:SetWorker(nil) -- 117
				end -- 100
				self:SetProducing("") -- 118
				self:SetInput1("") -- 119
				self:SetInput2("") -- 120
				self:SetProductionStart(0) -- 121
				return self:SetProductionEnd(0) -- 122
			end -- 94
		end, -- 125
		Touch = function(self, what) -- 125
			if SERVER then -- 126
				if self:GetProductionEnd() > 0 then -- 127
					return -- 127
				end -- 127
				if not IsInput[what:GetClass()] then -- 128
					return -- 128
				end -- 128
				if what.Processed then -- 129
					return -- 129
				end -- 129
				local submitter = what:GetNWEntity("evilrp_submitter") -- 130
				if not (submitter and IsValid(submitter)) then -- 131
					return -- 131
				end -- 131
				if self:GetInput1() == "" then -- 133
					self:SetInput1(what:GetClass()) -- 134
					what.Processed = true -- 135
					if what.Submitted then -- 136
						what:Submitted() -- 136
					end -- 136
					if what.SubmitSound then -- 137
						what:EmitSound(what.SubmitSound) -- 137
					end -- 137
					what:Remove() -- 138
					return -- 139
				end -- 133
				local prod = GetRecipe(self:GetInput1(), what:GetClass()) -- 140
				if not prod then -- 141
					return -- 141
				end -- 141
				self:SetInput2(what:GetClass()) -- 143
				what.Processed = true -- 144
				if what.Submitted then -- 145
					what:Submitted() -- 145
				end -- 145
				if what.SubmitSound then -- 146
					what:EmitSound(what.SubmitSound) -- 146
				end -- 146
				self:SetProducing(prod) -- 147
				local item = scripted_ents.Get(prod) -- 149
				local ct = CurTime() -- 150
				self:SetProductionStart(ct) -- 151
				local wait = item.CookTime * (1 + (self:GetRust() / 100)) -- 152
				self:SetProductionEnd(ct + wait) -- 153
				self:SetWorker(submitter) -- 154
				self:EmitSound("ambient/machines/machine1_hit1.wav") -- 155
				self:SetSoundLoop(self:StartLoopingSound("ambient/machines/machine_whine1.wav")) -- 156
				local ed = EffectData() -- 157
				ed:SetStart(self:GetPos()) -- 159
				ed:SetOrigin(self:GetPos()) -- 160
				ed:SetScale(2) -- 161
				util.Effect("StunstickImpact", ed, true, true) -- 162
				return what:Remove() -- 163
			end -- 126
		end, -- 165
		OnTakeDamage = function(self, dmg) -- 165
			local attacker = dmg:GetAttacker() -- 166
			if attacker and IsValid(attacker) then -- 167
				if attacker:IsPlayer() then -- 168
					local _exp_0 = attacker:Team() -- 169
					if TEAM_SANITAR == _exp_0 then -- 170
						local rust = self:GetRust() -- 171
						self:SetRust(math.max(0, rust - (dmg:GetDamage() * .2))) -- 172
						local reward = math.floor(math.abs(rust - self:GetRust()) * 2.3) -- 173
						if reward > 0 then -- 174
							return attacker:AddMoney(reward, "The Cleansing") -- 175
						end -- 174
					end -- 176
				end -- 168
			end -- 167
		end, -- 177
		Draw = function(self) -- 177
			self:DrawModel() -- 178
			return self:Render3D2D() -- 179
		end, -- 181
		HUDRender = function(self) -- 181
			local ct = { } -- 182
			ct[#ct + 1] = self.PrintName -- 183
			ct[#ct + 1] = { -- 185
				text = "In the hands of a good cook, edible things can come out of this.", -- 185
				font = "Spleen_Label_Small" -- 186
			} -- 184
			ct[#ct + 1] = { -- 189
				text = "It can cook much more than just food.", -- 189
				font = "Spleen_Label_Small" -- 190
			} -- 188
			return ct -- 192
		end, -- 194
		Render3D2D = function(self) -- 194
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 195
			if not (dist_sqr < 128 ^ 2) then -- 196
				return -- 196
			end -- 196
			local font = "Spleen_Label" -- 197
			local desp = lp:GetDespair() * 0.01 -- 198
			local ct = CurTime() -- 199
			local pos = self:GetPos() + (self:GetUp() * 80) + (self:GetForward() * 20) + (self:GetRight() * 15) -- 200
			local ang = self:GetAngles() -- 201
			ang:RotateAroundAxis(ang:Up(), -90) -- 203
			ang:RotateAroundAxis(ang:Forward(), 90) -- 204
			ang:RotateAroundAxis(ang:Right(), 180) -- 205
			cam.Start3D2D(pos, ang, 0.1) -- 207
			surface.SetMaterial(noise) -- 209
			surface.SetDrawColor(Color(255, 255, 255, 255)) -- 210
			surface.DrawTexturedRect(0, 0, 152, 38) -- 211
			local txt = "Cooker" -- 213
			local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 214
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 215
			cam.End3D2D() -- 217
			pos = self:GetPos() + (self:GetUp() * 72) + (self:GetForward() * 16) + (self:GetRight() * 8) -- 219
			cam.Start3D2D(pos, ang, 0.1) -- 220
			surface.SetMaterial(noise2) -- 222
			surface.SetDrawColor(Color(255, 191, 0, 255)) -- 223
			surface.DrawTexturedRect(0, 0, 152, 38) -- 224
			txt = "Feed me" -- 226
			local input -- 227
			if self:GetInput1() ~= "" then -- 227
				input = scripted_ents.Get(self:GetInput1()) -- 227
			end -- 227
			if input then -- 228
				txt = input.PrintName -- 228
			end -- 228
			input = nil -- 229
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 230
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 231
			cam.End3D2D() -- 233
			pos = self:GetPos() + (self:GetUp() * 37) + (self:GetForward() * 16) + (self:GetRight() * 8) -- 235
			cam.Start3D2D(pos, ang, 0.1) -- 236
			surface.SetMaterial(noise2) -- 238
			surface.SetDrawColor(Color(255, 191, 0, 255)) -- 239
			surface.DrawTexturedRect(0, 0, 152, 38) -- 240
			txt = "Feed me" -- 242
			if self:GetInput2() ~= "" then -- 243
				input = scripted_ents.Get(self:GetInput2()) -- 243
			end -- 243
			if input then -- 244
				txt = input.PrintName -- 244
			end -- 244
			input = nil -- 245
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 246
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 247
			cam.End3D2D() -- 249
			pos = self:GetPos() + (self:GetUp() * 80) + (self:GetForward() * 20) + (self:GetRight() * -1) -- 251
			cam.Start3D2D(pos, ang, 0.1) -- 252
			local rust = self:GetRust() -- 253
			txt = tostring(rust) .. "% rust" -- 254
			if rust < 0 then -- 255
				txt = "give me purpose" -- 256
			elseif rust >= 100 then -- 257
				txt = "100% ROTTEN" -- 258
			end -- 255
			local pend = self:GetProductionEnd() -- 259
			local pstart = self:GetProductionStart() -- 260
			local prod = self:GetProducing() -- 261
			if pend > 0 and prod then -- 262
				prod = scripted_ents.Get(prod) -- 263
				local text -- 264
				if prod then -- 264
					text = prod.PrintName -- 264
				end -- 264
			end -- 262
			surface.SetDrawColor(0, 0, 0, 255) -- 265
			surface.DrawRect(0, 0, 140, 38) -- 266
			if pend > 0 then -- 267
				local cur = ct - pstart -- 268
				surface.SetDrawColor(0, 150 + (100 * math.cos(ct)), 0, 255) -- 269
				surface.DrawRect(0, 0, 140 * (cur / (pend - pstart)), 38) -- 270
			elseif rust >= 100 then -- 271
				surface.SetDrawColor(150 + (100 * math.cos(ct)), 0, 0, 255) -- 272
				surface.DrawRect(0, 0, 140 * (rust / 100), 38) -- 273
			else -- 275
				surface.SetDrawColor(147, 58 + (2 * math.cos(ct)), 22, 255) -- 275
				surface.DrawRect(0, 0, 140 * (rust / 100), 38) -- 276
			end -- 267
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 277
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 278
			return cam.End3D2D() -- 279
		end -- 57
	} -- 57
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 280
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 57
			_base_0[_key_0] = _val_0 -- 57
		end -- 57
	end -- 280
	if _base_0.__index == nil then -- 57
		_base_0.__index = _base_0 -- 57
	end -- 280
	setmetatable(_base_0, _parent_0.__base) -- 57
	_class_0 = setmetatable({ -- 57
		__init = function(self, ...) -- 57
			return _class_0.__parent.__init(self, ...) -- 57
		end, -- 57
		__base = _base_0, -- 57
		__name = "Cooker", -- 57
		__parent = _parent_0 -- 57
	}, { -- 57
		__index = function(cls, name) -- 57
			local val = rawget(_base_0, name) -- 57
			if val == nil then -- 57
				local parent = rawget(cls, "__parent") -- 57
				if parent then -- 57
					return parent[name] -- 57
				end -- 57
			else -- 57
				return val -- 57
			end -- 57
		end, -- 57
		__call = function(cls, ...) -- 57
			local _self_0 = setmetatable({ }, _base_0) -- 57
			cls.__init(_self_0, ...) -- 57
			return _self_0 -- 57
		end -- 57
	}) -- 57
	_base_0.__class = _class_0 -- 57
	if _parent_0.__inherited then -- 57
		_parent_0.__inherited(_parent_0, _class_0) -- 57
	end -- 57
	Cooker = _class_0 -- 57
	return _class_0 -- 280
end -- 280
