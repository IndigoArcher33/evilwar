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
	} -- 23
} -- 6
local recipeKey -- 29
recipeKey = function(a, b) -- 29
	if a > b then -- 30
		a, b = b, a -- 30
	end -- 30
	return tostring(a) .. "|" .. tostring(b) -- 31
end -- 29
local RecipeOutputs = { } -- 34
local IsInput = { } -- 35
local GetRecipe -- 36
GetRecipe = function(itemA, itemB) -- 36
	return RecipeOutputs[recipeKey(itemA, itemB)] -- 36
end -- 36
for _index_0 = 1, #recipes do -- 38
	local recipe = recipes[_index_0] -- 38
	local a, b = recipe.inputs[1], recipe.inputs[2] -- 39
	local key = recipeKey(a, b) -- 40
	RecipeOutputs[key] = recipe.output -- 41
	IsInput[a] = true -- 42
	IsInput[b] = true -- 43
end -- 43
local Cooker -- 45
do -- 45
	local _class_0 -- 45
	local _parent_0 = ENTITY -- 45
	local _base_0 = { -- 45
		Base = "base_anim", -- 47
		Type = "anim", -- 48
		PrintName = "Cooker", -- 49
		Interesting = true, -- 50
		Category = "EvilRP: Machines", -- 52
		Spawnable = true, -- 53
		AdminSpawnable = true, -- 55
		Pocketable = false, -- 57
		SetupDataTables = function(self) -- 57
			self:NetworkVar("String", "Producing") -- 58
			self:NetworkVar("String", "Input1") -- 59
			self:NetworkVar("String", "Input2") -- 60
			self:NetworkVar("Int", "ProductionStart") -- 61
			self:NetworkVar("Int", "ProductionEnd") -- 62
			self:NetworkVar("Int", "SoundLoop") -- 63
			self:NetworkVar("Int", "Rust") -- 64
			self:NetworkVar("Int", "Heat") -- 65
			return self:NetworkVar("Entity", "Worker") -- 66
		end, -- 68
		Initialize = function(self) -- 68
			if CLIENT then -- 69
				return -- 69
			end -- 69
			self:SetUseType(SIMPLE_USE) -- 70
			self:SetModel("models/props_wasteland/kitchen_stove002a.mdl") -- 71
			self:PhysicsInit(SOLID_VPHYSICS) -- 72
			self:PhysWake() -- 73
			self:SetHeat(0) -- 74
			self.NextHeat = 0 -- 75
		end, -- 77
		Think = function(self) -- 77
			if CLIENT then -- 78
				return -- 78
			end -- 78
			local pend = self:GetProductionEnd() -- 79
			local ct = CurTime() -- 80
			local rust = self:GetRust() -- 81
			if pend > 0 and ct >= pend then -- 82
				local prod = scripted_ents.Get(self:GetProducing()) -- 83
				self:SetRust(math.min(100, rust + (prod.CookTime))) -- 84
				self:EmitSound("buttons/lever6.wav") -- 85
				self:StopLoopingSound(self:GetSoundLoop()) -- 86
				local worker = self:GetWorker() -- 87
				if worker and IsValid(worker) then -- 88
					local start = self:GetPos() -- 89
					local endpos = start + (self:GetUp() * 128) + (self:GetForward() * 24) -- 90
					local tr = util.TraceLine({ -- 92
						start = start, -- 92
						endpos = endpos, -- 93
						filter = self, -- 94
						mask = MASK_NPCWORLDSTATIC -- 95
					}) -- 91
					if prod then -- 97
						local sp = ents.Create(self:GetProducing()) -- 98
						sp:SetPos(tr.HitPos - (self:GetUp() * 40) + (self:GetForward() * 38) - (self:GetRight() * 2)) -- 100
						sp:Spawn() -- 101
						sp:Activate() -- 102
					end -- 97
					self:SetWorker(nil) -- 105
				end -- 88
				self:SetProducing("") -- 106
				self:SetInput1("") -- 107
				self:SetInput2("") -- 108
				self:SetProductionStart(0) -- 109
				return self:SetProductionEnd(0) -- 110
			end -- 82
		end, -- 113
		Touch = function(self, what) -- 113
			if SERVER then -- 114
				if self:GetProductionEnd() > 0 then -- 115
					return -- 115
				end -- 115
				if not IsInput[what:GetClass()] then -- 116
					return -- 116
				end -- 116
				if what.Processed then -- 117
					return -- 117
				end -- 117
				local submitter = what:GetNWEntity("evilrp_submitter") -- 118
				if not (submitter and IsValid(submitter)) then -- 119
					return -- 119
				end -- 119
				if self:GetInput1() == "" then -- 121
					self:SetInput1(what:GetClass()) -- 122
					what.Processed = true -- 123
					if what.Submitted then -- 124
						what:Submitted() -- 124
					end -- 124
					if what.SubmitSound then -- 125
						what:EmitSound(what.SubmitSound) -- 125
					end -- 125
					what:Remove() -- 126
					return -- 127
				end -- 121
				local prod = GetRecipe(self:GetInput1(), what:GetClass()) -- 128
				if not prod then -- 129
					return -- 129
				end -- 129
				self:SetInput2(what:GetClass()) -- 131
				what.Processed = true -- 132
				if what.Submitted then -- 133
					what:Submitted() -- 133
				end -- 133
				if what.SubmitSound then -- 134
					what:EmitSound(what.SubmitSound) -- 134
				end -- 134
				self:SetProducing(prod) -- 135
				local item = scripted_ents.Get(prod) -- 137
				local ct = CurTime() -- 138
				self:SetProductionStart(ct) -- 139
				local wait = item.CookTime * (1 + (self:GetRust() / 100)) -- 140
				self:SetProductionEnd(ct + wait) -- 141
				self:SetWorker(submitter) -- 142
				self:EmitSound("ambient/machines/machine1_hit1.wav") -- 143
				self:SetSoundLoop(self:StartLoopingSound("ambient/machines/machine_whine1.wav")) -- 144
				local ed = EffectData() -- 145
				ed:SetStart(self:GetPos()) -- 147
				ed:SetOrigin(self:GetPos()) -- 148
				ed:SetScale(2) -- 149
				util.Effect("StunstickImpact", ed, true, true) -- 150
				return what:Remove() -- 151
			end -- 114
		end, -- 153
		OnTakeDamage = function(self, dmg) -- 153
			local attacker = dmg:GetAttacker() -- 154
			if attacker and IsValid(attacker) then -- 155
				if attacker:IsPlayer() then -- 156
					local _exp_0 = attacker:Team() -- 157
					if TEAM_SANITAR == _exp_0 then -- 158
						local rust = self:GetRust() -- 159
						self:SetRust(math.max(0, rust - (dmg:GetDamage() * .2))) -- 160
						local reward = math.floor(math.abs(rust - self:GetRust()) * 2.3) -- 161
						if reward > 0 then -- 162
							return attacker:AddMoney(reward, "The Cleansing") -- 163
						end -- 162
					end -- 164
				end -- 156
			end -- 155
		end, -- 165
		Draw = function(self) -- 165
			self:DrawModel() -- 166
			return self:Render3D2D() -- 167
		end, -- 169
		HUDRender = function(self) -- 169
			local ct = { } -- 170
			ct[#ct + 1] = self.PrintName -- 171
			ct[#ct + 1] = { -- 173
				text = "In the hands of a good cook, edible things can come out of this.", -- 173
				font = "Spleen_Label_Small" -- 174
			} -- 172
			ct[#ct + 1] = { -- 177
				text = "It can cook much more than just food.", -- 177
				font = "Spleen_Label_Small" -- 178
			} -- 176
			return ct -- 180
		end, -- 182
		Render3D2D = function(self) -- 182
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 183
			if not (dist_sqr < 128 ^ 2) then -- 184
				return -- 184
			end -- 184
			local font = "Spleen_Label" -- 185
			local desp = lp:GetDespair() * 0.01 -- 186
			local ct = CurTime() -- 187
			local pos = self:GetPos() + (self:GetUp() * 80) + (self:GetForward() * 20) + (self:GetRight() * 15) -- 188
			local ang = self:GetAngles() -- 189
			ang:RotateAroundAxis(ang:Up(), -90) -- 191
			ang:RotateAroundAxis(ang:Forward(), 90) -- 192
			ang:RotateAroundAxis(ang:Right(), 180) -- 193
			cam.Start3D2D(pos, ang, 0.1) -- 195
			surface.SetMaterial(noise) -- 197
			surface.SetDrawColor(Color(255, 255, 255, 255)) -- 198
			surface.DrawTexturedRect(0, 0, 152, 38) -- 199
			local txt = "Cooker" -- 201
			local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 202
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 203
			cam.End3D2D() -- 205
			pos = self:GetPos() + (self:GetUp() * 72) + (self:GetForward() * 16) + (self:GetRight() * 8) -- 207
			cam.Start3D2D(pos, ang, 0.1) -- 208
			surface.SetMaterial(noise2) -- 210
			surface.SetDrawColor(Color(255, 191, 0, 255)) -- 211
			surface.DrawTexturedRect(0, 0, 152, 38) -- 212
			txt = "Feed me" -- 214
			local input -- 215
			if self:GetInput1() ~= "" then -- 215
				input = scripted_ents.Get(self:GetInput1()) -- 215
			end -- 215
			if input then -- 216
				txt = input.PrintName -- 216
			end -- 216
			input = nil -- 217
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 218
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 219
			cam.End3D2D() -- 221
			pos = self:GetPos() + (self:GetUp() * 37) + (self:GetForward() * 16) + (self:GetRight() * 8) -- 223
			cam.Start3D2D(pos, ang, 0.1) -- 224
			surface.SetMaterial(noise2) -- 226
			surface.SetDrawColor(Color(255, 191, 0, 255)) -- 227
			surface.DrawTexturedRect(0, 0, 152, 38) -- 228
			txt = "Feed me" -- 230
			if self:GetInput2() ~= "" then -- 231
				input = scripted_ents.Get(self:GetInput2()) -- 231
			end -- 231
			if input then -- 232
				txt = input.PrintName -- 232
			end -- 232
			input = nil -- 233
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 234
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 235
			cam.End3D2D() -- 237
			pos = self:GetPos() + (self:GetUp() * 80) + (self:GetForward() * 20) + (self:GetRight() * -1) -- 239
			cam.Start3D2D(pos, ang, 0.1) -- 240
			local rust = self:GetRust() -- 241
			txt = tostring(rust) .. "% rust" -- 242
			if rust < 0 then -- 243
				txt = "give me purpose" -- 244
			elseif rust >= 100 then -- 245
				txt = "100% ROTTEN" -- 246
			end -- 243
			local pend = self:GetProductionEnd() -- 247
			local pstart = self:GetProductionStart() -- 248
			local prod = self:GetProducing() -- 249
			if pend > 0 and prod then -- 250
				prod = scripted_ents.Get(prod) -- 251
				local text -- 252
				if prod then -- 252
					text = prod.PrintName -- 252
				end -- 252
			end -- 250
			surface.SetDrawColor(0, 0, 0, 255) -- 253
			surface.DrawRect(0, 0, 140, 38) -- 254
			if pend > 0 then -- 255
				local cur = ct - pstart -- 256
				surface.SetDrawColor(0, 150 + (100 * math.cos(ct)), 0, 255) -- 257
				surface.DrawRect(0, 0, 140 * (cur / (pend - pstart)), 38) -- 258
			elseif rust >= 100 then -- 259
				surface.SetDrawColor(150 + (100 * math.cos(ct)), 0, 0, 255) -- 260
				surface.DrawRect(0, 0, 140 * (rust / 100), 38) -- 261
			else -- 263
				surface.SetDrawColor(147, 58 + (2 * math.cos(ct)), 22, 255) -- 263
				surface.DrawRect(0, 0, 140 * (rust / 100), 38) -- 264
			end -- 255
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 265
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 266
			return cam.End3D2D() -- 267
		end -- 45
	} -- 45
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 268
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 45
			_base_0[_key_0] = _val_0 -- 45
		end -- 45
	end -- 268
	if _base_0.__index == nil then -- 45
		_base_0.__index = _base_0 -- 45
	end -- 268
	setmetatable(_base_0, _parent_0.__base) -- 45
	_class_0 = setmetatable({ -- 45
		__init = function(self, ...) -- 45
			return _class_0.__parent.__init(self, ...) -- 45
		end, -- 45
		__base = _base_0, -- 45
		__name = "Cooker", -- 45
		__parent = _parent_0 -- 45
	}, { -- 45
		__index = function(cls, name) -- 45
			local val = rawget(_base_0, name) -- 45
			if val == nil then -- 45
				local parent = rawget(cls, "__parent") -- 45
				if parent then -- 45
					return parent[name] -- 45
				end -- 45
			else -- 45
				return val -- 45
			end -- 45
		end, -- 45
		__call = function(cls, ...) -- 45
			local _self_0 = setmetatable({ }, _base_0) -- 45
			cls.__init(_self_0, ...) -- 45
			return _self_0 -- 45
		end -- 45
	}) -- 45
	_base_0.__class = _class_0 -- 45
	if _parent_0.__inherited then -- 45
		_parent_0.__inherited(_parent_0, _class_0) -- 45
	end -- 45
	Cooker = _class_0 -- 45
	return _class_0 -- 268
end -- 268
