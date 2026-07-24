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
	} -- 19
} -- 6
local recipeKey -- 25
recipeKey = function(a, b) -- 25
	if a > b then -- 26
		a, b = b, a -- 26
	end -- 26
	return tostring(a) .. "|" .. tostring(b) -- 27
end -- 25
local RecipeOutputs = { } -- 30
local IsInput = { } -- 31
local GetRecipe -- 32
GetRecipe = function(itemA, itemB) -- 32
	return RecipeOutputs[recipeKey(itemA, itemB)] -- 32
end -- 32
for _index_0 = 1, #recipes do -- 34
	local recipe = recipes[_index_0] -- 34
	local a, b = recipe.inputs[1], recipe.inputs[2] -- 35
	local key = recipeKey(a, b) -- 36
	RecipeOutputs[key] = recipe.output -- 37
	IsInput[a] = true -- 38
	IsInput[b] = true -- 39
end -- 39
local Cooker -- 41
do -- 41
	local _class_0 -- 41
	local _parent_0 = ENTITY -- 41
	local _base_0 = { -- 41
		Base = "base_anim", -- 43
		Type = "anim", -- 44
		PrintName = "Cooker", -- 45
		Interesting = true, -- 46
		Category = "EvilRP: Machines", -- 48
		Spawnable = true, -- 49
		AdminSpawnable = true, -- 51
		Pocketable = false, -- 53
		SetupDataTables = function(self) -- 53
			self:NetworkVar("String", "Producing") -- 54
			self:NetworkVar("String", "Input1") -- 55
			self:NetworkVar("String", "Input2") -- 56
			self:NetworkVar("Int", "ProductionStart") -- 57
			self:NetworkVar("Int", "ProductionEnd") -- 58
			self:NetworkVar("Int", "SoundLoop") -- 59
			self:NetworkVar("Int", "Rust") -- 60
			self:NetworkVar("Int", "Heat") -- 61
			return self:NetworkVar("Entity", "Worker") -- 62
		end, -- 64
		Initialize = function(self) -- 64
			if CLIENT then -- 65
				return -- 65
			end -- 65
			self:SetUseType(SIMPLE_USE) -- 66
			self:SetModel("models/props_wasteland/kitchen_stove002a.mdl") -- 67
			self:PhysicsInit(SOLID_VPHYSICS) -- 68
			self:PhysWake() -- 69
			self:SetHeat(0) -- 70
			self.NextHeat = 0 -- 71
		end, -- 73
		Think = function(self) -- 73
			if CLIENT then -- 74
				return -- 74
			end -- 74
			local pend = self:GetProductionEnd() -- 75
			local ct = CurTime() -- 76
			local rust = self:GetRust() -- 77
			if pend > 0 and ct >= pend then -- 78
				local prod = scripted_ents.Get(self:GetProducing()) -- 79
				self:SetRust(math.min(100, rust + (prod.CookTime))) -- 80
				self:EmitSound("buttons/lever6.wav") -- 81
				self:StopLoopingSound(self:GetSoundLoop()) -- 82
				local worker = self:GetWorker() -- 83
				if worker and IsValid(worker) then -- 84
					local start = self:GetPos() -- 85
					local endpos = start + (self:GetUp() * 128) + (self:GetForward() * 24) -- 86
					local tr = util.TraceLine({ -- 88
						start = start, -- 88
						endpos = endpos, -- 89
						filter = self, -- 90
						mask = MASK_NPCWORLDSTATIC -- 91
					}) -- 87
					if prod then -- 93
						local sp = ents.Create(self:GetProducing()) -- 94
						sp:SetPos(tr.HitPos - (self:GetUp() * 40) + (self:GetForward() * 38) - (self:GetRight() * 2)) -- 96
						sp:Spawn() -- 97
						sp:Activate() -- 98
					end -- 93
					self:SetWorker(nil) -- 101
				end -- 84
				self:SetProducing("") -- 102
				self:SetInput1("") -- 103
				self:SetInput2("") -- 104
				self:SetProductionStart(0) -- 105
				return self:SetProductionEnd(0) -- 106
			end -- 78
		end, -- 109
		Touch = function(self, what) -- 109
			if SERVER then -- 110
				if self:GetProductionEnd() > 0 then -- 111
					return -- 111
				end -- 111
				if not IsInput[what:GetClass()] then -- 112
					return -- 112
				end -- 112
				if what.Processed then -- 113
					return -- 113
				end -- 113
				local submitter = what:GetNWEntity("evilrp_submitter") -- 114
				if not (submitter and IsValid(submitter)) then -- 115
					return -- 115
				end -- 115
				if self:GetInput1() == "" then -- 117
					self:SetInput1(what:GetClass()) -- 118
					what.Processed = true -- 119
					if what.Submitted then -- 120
						what:Submitted() -- 120
					end -- 120
					if what.SubmitSound then -- 121
						what:EmitSound(what.SubmitSound) -- 121
					end -- 121
					what:Remove() -- 122
					return -- 123
				end -- 117
				local prod = GetRecipe(self:GetInput1(), what:GetClass()) -- 124
				if not prod then -- 125
					return -- 125
				end -- 125
				self:SetInput2(what:GetClass()) -- 127
				what.Processed = true -- 128
				if what.Submitted then -- 129
					what:Submitted() -- 129
				end -- 129
				if what.SubmitSound then -- 130
					what:EmitSound(what.SubmitSound) -- 130
				end -- 130
				self:SetProducing(prod) -- 131
				local item = scripted_ents.Get(prod) -- 133
				local ct = CurTime() -- 134
				self:SetProductionStart(ct) -- 135
				local wait = item.CookTime * (1 + (self:GetRust() / 100)) -- 136
				self:SetProductionEnd(ct + wait) -- 137
				self:SetWorker(submitter) -- 138
				self:EmitSound("ambient/machines/machine1_hit1.wav") -- 139
				self:SetSoundLoop(self:StartLoopingSound("ambient/machines/machine_whine1.wav")) -- 140
				local ed = EffectData() -- 141
				ed:SetStart(self:GetPos()) -- 143
				ed:SetOrigin(self:GetPos()) -- 144
				ed:SetScale(2) -- 145
				util.Effect("StunstickImpact", ed, true, true) -- 146
				return what:Remove() -- 147
			end -- 110
		end, -- 149
		OnTakeDamage = function(self, dmg) -- 149
			local attacker = dmg:GetAttacker() -- 150
			if attacker and IsValid(attacker) then -- 151
				if attacker:IsPlayer() then -- 152
					local _exp_0 = attacker:Team() -- 153
					if TEAM_SANITAR == _exp_0 then -- 154
						local rust = self:GetRust() -- 155
						self:SetRust(math.max(0, rust - (dmg:GetDamage() * .2))) -- 156
						local reward = math.floor(math.abs(rust - self:GetRust()) * 2.3) -- 157
						if reward > 0 then -- 158
							return attacker:AddMoney(reward, "The Cleansing") -- 159
						end -- 158
					end -- 160
				end -- 152
			end -- 151
		end, -- 161
		Draw = function(self) -- 161
			self:DrawModel() -- 162
			return self:Render3D2D() -- 163
		end, -- 165
		HUDRender = function(self) -- 165
			local ct = { } -- 166
			ct[#ct + 1] = self.PrintName -- 167
			ct[#ct + 1] = { -- 169
				text = "In the hands of a good cook, edible things can come out of this.", -- 169
				font = "Spleen_Label_Small" -- 170
			} -- 168
			ct[#ct + 1] = { -- 173
				text = "It can cook much more than just food.", -- 173
				font = "Spleen_Label_Small" -- 174
			} -- 172
			return ct -- 176
		end, -- 178
		Render3D2D = function(self) -- 178
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 179
			if not (dist_sqr < 128 ^ 2) then -- 180
				return -- 180
			end -- 180
			local font = "Spleen_Label" -- 181
			local desp = lp:GetDespair() * 0.01 -- 182
			local ct = CurTime() -- 183
			local pos = self:GetPos() + (self:GetUp() * 80) + (self:GetForward() * 20) + (self:GetRight() * 15) -- 184
			local ang = self:GetAngles() -- 185
			ang:RotateAroundAxis(ang:Up(), -90) -- 187
			ang:RotateAroundAxis(ang:Forward(), 90) -- 188
			ang:RotateAroundAxis(ang:Right(), 180) -- 189
			cam.Start3D2D(pos, ang, 0.1) -- 191
			surface.SetMaterial(noise) -- 193
			surface.SetDrawColor(Color(255, 255, 255, 255)) -- 194
			surface.DrawTexturedRect(0, 0, 152, 38) -- 195
			local txt = "Cooker" -- 197
			local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 198
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 199
			cam.End3D2D() -- 201
			pos = self:GetPos() + (self:GetUp() * 72) + (self:GetForward() * 16) + (self:GetRight() * 8) -- 203
			cam.Start3D2D(pos, ang, 0.1) -- 204
			surface.SetMaterial(noise2) -- 206
			surface.SetDrawColor(Color(255, 191, 0, 255)) -- 207
			surface.DrawTexturedRect(0, 0, 152, 38) -- 208
			txt = "Feed me" -- 210
			local input -- 211
			if self:GetInput1() ~= "" then -- 211
				input = scripted_ents.Get(self:GetInput1()) -- 211
			end -- 211
			if input then -- 212
				txt = input.PrintName -- 212
			end -- 212
			input = nil -- 213
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 214
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 215
			cam.End3D2D() -- 217
			pos = self:GetPos() + (self:GetUp() * 37) + (self:GetForward() * 16) + (self:GetRight() * 8) -- 219
			cam.Start3D2D(pos, ang, 0.1) -- 220
			surface.SetMaterial(noise2) -- 222
			surface.SetDrawColor(Color(255, 191, 0, 255)) -- 223
			surface.DrawTexturedRect(0, 0, 152, 38) -- 224
			txt = "Feed me" -- 226
			if self:GetInput2() ~= "" then -- 227
				input = scripted_ents.Get(self:GetInput2()) -- 227
			end -- 227
			if input then -- 228
				txt = input.PrintName -- 228
			end -- 228
			input = nil -- 229
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 230
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 231
			cam.End3D2D() -- 233
			pos = self:GetPos() + (self:GetUp() * 80) + (self:GetForward() * 20) + (self:GetRight() * -1) -- 235
			cam.Start3D2D(pos, ang, 0.1) -- 236
			local rust = self:GetRust() -- 237
			txt = tostring(rust) .. "% rust" -- 238
			if rust < 0 then -- 239
				txt = "give me purpose" -- 240
			elseif rust >= 100 then -- 241
				txt = "100% ROTTEN" -- 242
			end -- 239
			local pend = self:GetProductionEnd() -- 243
			local pstart = self:GetProductionStart() -- 244
			local prod = self:GetProducing() -- 245
			if pend > 0 and prod then -- 246
				prod = scripted_ents.Get(prod) -- 247
				local text -- 248
				if prod then -- 248
					text = prod.PrintName -- 248
				end -- 248
			end -- 246
			surface.SetDrawColor(0, 0, 0, 255) -- 249
			surface.DrawRect(0, 0, 140, 38) -- 250
			if pend > 0 then -- 251
				local cur = ct - pstart -- 252
				surface.SetDrawColor(0, 150 + (100 * math.cos(ct)), 0, 255) -- 253
				surface.DrawRect(0, 0, 140 * (cur / (pend - pstart)), 38) -- 254
			elseif rust >= 100 then -- 255
				surface.SetDrawColor(150 + (100 * math.cos(ct)), 0, 0, 255) -- 256
				surface.DrawRect(0, 0, 140 * (rust / 100), 38) -- 257
			else -- 259
				surface.SetDrawColor(147, 58 + (2 * math.cos(ct)), 22, 255) -- 259
				surface.DrawRect(0, 0, 140 * (rust / 100), 38) -- 260
			end -- 251
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 261
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 262
			return cam.End3D2D() -- 263
		end -- 41
	} -- 41
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 264
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 41
			_base_0[_key_0] = _val_0 -- 41
		end -- 41
	end -- 264
	if _base_0.__index == nil then -- 41
		_base_0.__index = _base_0 -- 41
	end -- 264
	setmetatable(_base_0, _parent_0.__base) -- 41
	_class_0 = setmetatable({ -- 41
		__init = function(self, ...) -- 41
			return _class_0.__parent.__init(self, ...) -- 41
		end, -- 41
		__base = _base_0, -- 41
		__name = "Cooker", -- 41
		__parent = _parent_0 -- 41
	}, { -- 41
		__index = function(cls, name) -- 41
			local val = rawget(_base_0, name) -- 41
			if val == nil then -- 41
				local parent = rawget(cls, "__parent") -- 41
				if parent then -- 41
					return parent[name] -- 41
				end -- 41
			else -- 41
				return val -- 41
			end -- 41
		end, -- 41
		__call = function(cls, ...) -- 41
			local _self_0 = setmetatable({ }, _base_0) -- 41
			cls.__init(_self_0, ...) -- 41
			return _self_0 -- 41
		end -- 41
	}) -- 41
	_base_0.__class = _class_0 -- 41
	if _parent_0.__inherited then -- 41
		_parent_0.__inherited(_parent_0, _class_0) -- 41
	end -- 41
	Cooker = _class_0 -- 41
	return _class_0 -- 264
end -- 264
