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
	} -- 15
} -- 6
local recipeKey -- 21
recipeKey = function(a, b) -- 21
	if a > b then -- 22
		a, b = b, a -- 22
	end -- 22
	return tostring(a) .. "|" .. tostring(b) -- 23
end -- 21
local RecipeOutputs = { } -- 26
local IsInput = { } -- 27
local GetRecipe -- 28
GetRecipe = function(itemA, itemB) -- 28
	return RecipeOutputs[recipeKey(itemA, itemB)] -- 28
end -- 28
for _index_0 = 1, #recipes do -- 30
	local recipe = recipes[_index_0] -- 30
	local a, b = recipe.inputs[1], recipe.inputs[2] -- 31
	local key = recipeKey(a, b) -- 32
	RecipeOutputs[key] = recipe.output -- 33
	IsInput[a] = true -- 34
	IsInput[b] = true -- 35
end -- 35
local Cooker -- 37
do -- 37
	local _class_0 -- 37
	local _parent_0 = ENTITY -- 37
	local _base_0 = { -- 37
		Base = "base_anim", -- 39
		Type = "anim", -- 40
		PrintName = "Cooker", -- 41
		Interesting = true, -- 42
		Category = "EvilRP: Machines", -- 44
		Spawnable = true, -- 45
		AdminSpawnable = true, -- 47
		Pocketable = false, -- 49
		SetupDataTables = function(self) -- 49
			self:NetworkVar("String", "Producing") -- 50
			self:NetworkVar("String", "Input1") -- 51
			self:NetworkVar("String", "Input2") -- 52
			self:NetworkVar("Int", "ProductionStart") -- 53
			self:NetworkVar("Int", "ProductionEnd") -- 54
			self:NetworkVar("Int", "SoundLoop") -- 55
			self:NetworkVar("Int", "Rust") -- 56
			self:NetworkVar("Int", "Heat") -- 57
			return self:NetworkVar("Entity", "Worker") -- 58
		end, -- 60
		Initialize = function(self) -- 60
			if CLIENT then -- 61
				return -- 61
			end -- 61
			self:SetUseType(SIMPLE_USE) -- 62
			self:SetModel("models/props_wasteland/kitchen_stove002a.mdl") -- 63
			self:PhysicsInit(SOLID_VPHYSICS) -- 64
			self:PhysWake() -- 65
			self:SetHeat(0) -- 66
			self.NextHeat = 0 -- 67
		end, -- 69
		Think = function(self) -- 69
			if CLIENT then -- 70
				return -- 70
			end -- 70
			local pend = self:GetProductionEnd() -- 71
			local ct = CurTime() -- 72
			local rust = self:GetRust() -- 73
			if pend > 0 and ct >= pend then -- 74
				local prod = scripted_ents.Get(self:GetProducing()) -- 75
				self:SetRust(math.min(100, rust + (prod.CookTime))) -- 76
				self:EmitSound("buttons/lever6.wav") -- 77
				self:StopLoopingSound(self:GetSoundLoop()) -- 78
				local worker = self:GetWorker() -- 79
				if worker and IsValid(worker) then -- 80
					local start = self:GetPos() -- 81
					local endpos = start + (self:GetUp() * 128) + (self:GetForward() * 24) -- 82
					local tr = util.TraceLine({ -- 84
						start = start, -- 84
						endpos = endpos, -- 85
						filter = self, -- 86
						mask = MASK_NPCWORLDSTATIC -- 87
					}) -- 83
					if prod then -- 89
						local sp = ents.Create(self:GetProducing()) -- 90
						sp:SetPos(tr.HitPos - (self:GetUp() * 40) + (self:GetForward() * 38) - (self:GetRight() * 2)) -- 92
						sp:Spawn() -- 93
						sp:Activate() -- 94
					end -- 89
					self:SetWorker(nil) -- 97
				end -- 80
				self:SetProducing("") -- 98
				self:SetInput1("") -- 99
				self:SetInput2("") -- 100
				self:SetProductionStart(0) -- 101
				return self:SetProductionEnd(0) -- 102
			end -- 74
		end, -- 105
		Touch = function(self, what) -- 105
			if SERVER then -- 106
				if self:GetProductionEnd() > 0 then -- 107
					return -- 107
				end -- 107
				if not IsInput[what:GetClass()] then -- 108
					return -- 108
				end -- 108
				if what.Processed then -- 109
					return -- 109
				end -- 109
				local submitter = what:GetNWEntity("evilrp_submitter") -- 110
				if not (submitter and IsValid(submitter)) then -- 111
					return -- 111
				end -- 111
				if self:GetInput1() == "" then -- 113
					self:SetInput1(what:GetClass()) -- 114
					what.Processed = true -- 115
					if what.Submitted then -- 116
						what:Submitted() -- 116
					end -- 116
					if what.SubmitSound then -- 117
						what:EmitSound(what.SubmitSound) -- 117
					end -- 117
					what:Remove() -- 118
					return -- 119
				end -- 113
				local prod = GetRecipe(self:GetInput1(), what:GetClass()) -- 120
				if not prod then -- 121
					return -- 121
				end -- 121
				self:SetInput2(what:GetClass()) -- 123
				what.Processed = true -- 124
				if what.Submitted then -- 125
					what:Submitted() -- 125
				end -- 125
				if what.SubmitSound then -- 126
					what:EmitSound(what.SubmitSound) -- 126
				end -- 126
				self:SetProducing(prod) -- 127
				local item = scripted_ents.Get(prod) -- 129
				local ct = CurTime() -- 130
				self:SetProductionStart(ct) -- 131
				local wait = item.CookTime * (1 + (self:GetRust() / 100)) -- 132
				self:SetProductionEnd(ct + wait) -- 133
				self:SetWorker(submitter) -- 134
				self:EmitSound("ambient/machines/machine1_hit1.wav") -- 135
				self:SetSoundLoop(self:StartLoopingSound("ambient/machines/machine_whine1.wav")) -- 136
				local ed = EffectData() -- 137
				ed:SetStart(self:GetPos()) -- 139
				ed:SetOrigin(self:GetPos()) -- 140
				ed:SetScale(2) -- 141
				util.Effect("StunstickImpact", ed, true, true) -- 142
				return what:Remove() -- 143
			end -- 106
		end, -- 145
		OnTakeDamage = function(self, dmg) -- 145
			local attacker = dmg:GetAttacker() -- 146
			if attacker and IsValid(attacker) then -- 147
				if attacker:IsPlayer() then -- 148
					local _exp_0 = attacker:Team() -- 149
					if TEAM_SANITAR == _exp_0 then -- 150
						local rust = self:GetRust() -- 151
						self:SetRust(math.max(0, rust - (dmg:GetDamage() * .2))) -- 152
						local reward = math.floor(math.abs(rust - self:GetRust()) * 2.3) -- 153
						if reward > 0 then -- 154
							return attacker:AddMoney(reward, "The Cleansing") -- 155
						end -- 154
					end -- 156
				end -- 148
			end -- 147
		end, -- 157
		Draw = function(self) -- 157
			self:DrawModel() -- 158
			return self:Render3D2D() -- 159
		end, -- 161
		HUDRender = function(self) -- 161
			local ct = { } -- 162
			ct[#ct + 1] = self.PrintName -- 163
			ct[#ct + 1] = { -- 165
				text = "Certain items can be processed into more useful things with this.", -- 165
				font = "Spleen_Label_Small" -- 166
			} -- 164
			ct[#ct + 1] = { -- 169
				text = "The rustier it is, the longer it will take.", -- 169
				font = "Spleen_Label_Small" -- 170
			} -- 168
			return ct -- 172
		end, -- 174
		Render3D2D = function(self) -- 174
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 175
			if not (dist_sqr < 128 ^ 2) then -- 176
				return -- 176
			end -- 176
			local font = "Spleen_Label" -- 177
			local desp = lp:GetDespair() * 0.01 -- 178
			local ct = CurTime() -- 179
			local pos = self:GetPos() + (self:GetUp() * 80) + (self:GetForward() * 20) + (self:GetRight() * 15) -- 180
			local ang = self:GetAngles() -- 181
			ang:RotateAroundAxis(ang:Up(), -90) -- 183
			ang:RotateAroundAxis(ang:Forward(), 90) -- 184
			ang:RotateAroundAxis(ang:Right(), 180) -- 185
			cam.Start3D2D(pos, ang, 0.1) -- 187
			surface.SetMaterial(noise) -- 189
			surface.SetDrawColor(Color(255, 255, 255, 255)) -- 190
			surface.DrawTexturedRect(0, 0, 152, 38) -- 191
			local txt = "Cooker" -- 193
			local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 194
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 195
			cam.End3D2D() -- 197
			pos = self:GetPos() + (self:GetUp() * 72) + (self:GetForward() * 16) + (self:GetRight() * 8) -- 199
			cam.Start3D2D(pos, ang, 0.1) -- 200
			surface.SetMaterial(noise2) -- 202
			surface.SetDrawColor(Color(255, 191, 0, 255)) -- 203
			surface.DrawTexturedRect(0, 0, 152, 38) -- 204
			txt = "Feed me" -- 206
			local input -- 207
			if self:GetInput1() ~= "" then -- 207
				input = scripted_ents.Get(self:GetInput1()) -- 207
			end -- 207
			if input then -- 208
				txt = input.PrintName -- 208
			end -- 208
			input = nil -- 209
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 210
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 211
			cam.End3D2D() -- 213
			pos = self:GetPos() + (self:GetUp() * 37) + (self:GetForward() * 16) + (self:GetRight() * 8) -- 215
			cam.Start3D2D(pos, ang, 0.1) -- 216
			surface.SetMaterial(noise2) -- 218
			surface.SetDrawColor(Color(255, 191, 0, 255)) -- 219
			surface.DrawTexturedRect(0, 0, 152, 38) -- 220
			txt = "Feed me" -- 222
			if self:GetInput2() ~= "" then -- 223
				input = scripted_ents.Get(self:GetInput2()) -- 223
			end -- 223
			if input then -- 224
				txt = input.PrintName -- 224
			end -- 224
			input = nil -- 225
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 226
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 227
			cam.End3D2D() -- 229
			pos = self:GetPos() + (self:GetUp() * 80) + (self:GetForward() * 20) + (self:GetRight() * -1) -- 231
			cam.Start3D2D(pos, ang, 0.1) -- 232
			local rust = self:GetRust() -- 233
			txt = tostring(rust) .. "% rust" -- 234
			if rust < 0 then -- 235
				txt = "give me purpose" -- 236
			elseif rust >= 100 then -- 237
				txt = "100% ROTTEN" -- 238
			end -- 235
			local pend = self:GetProductionEnd() -- 239
			local pstart = self:GetProductionStart() -- 240
			local prod = self:GetProducing() -- 241
			if pend > 0 and prod then -- 242
				prod = scripted_ents.Get(prod) -- 243
				local text -- 244
				if prod then -- 244
					text = prod.PrintName -- 244
				end -- 244
			end -- 242
			surface.SetDrawColor(0, 0, 0, 255) -- 245
			surface.DrawRect(0, 0, 140, 38) -- 246
			if pend > 0 then -- 247
				local cur = ct - pstart -- 248
				surface.SetDrawColor(0, 150 + (100 * math.cos(ct)), 0, 255) -- 249
				surface.DrawRect(0, 0, 140 * (cur / (pend - pstart)), 38) -- 250
			elseif rust >= 100 then -- 251
				surface.SetDrawColor(150 + (100 * math.cos(ct)), 0, 0, 255) -- 252
				surface.DrawRect(0, 0, 140 * (rust / 100), 38) -- 253
			else -- 255
				surface.SetDrawColor(147, 58 + (2 * math.cos(ct)), 22, 255) -- 255
				surface.DrawRect(0, 0, 140 * (rust / 100), 38) -- 256
			end -- 247
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 257
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 258
			return cam.End3D2D() -- 259
		end -- 37
	} -- 37
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 260
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 37
			_base_0[_key_0] = _val_0 -- 37
		end -- 37
	end -- 260
	if _base_0.__index == nil then -- 37
		_base_0.__index = _base_0 -- 37
	end -- 260
	setmetatable(_base_0, _parent_0.__base) -- 37
	_class_0 = setmetatable({ -- 37
		__init = function(self, ...) -- 37
			return _class_0.__parent.__init(self, ...) -- 37
		end, -- 37
		__base = _base_0, -- 37
		__name = "Cooker", -- 37
		__parent = _parent_0 -- 37
	}, { -- 37
		__index = function(cls, name) -- 37
			local val = rawget(_base_0, name) -- 37
			if val == nil then -- 37
				local parent = rawget(cls, "__parent") -- 37
				if parent then -- 37
					return parent[name] -- 37
				end -- 37
			else -- 37
				return val -- 37
			end -- 37
		end, -- 37
		__call = function(cls, ...) -- 37
			local _self_0 = setmetatable({ }, _base_0) -- 37
			cls.__init(_self_0, ...) -- 37
			return _self_0 -- 37
		end -- 37
	}) -- 37
	_base_0.__class = _class_0 -- 37
	if _parent_0.__inherited then -- 37
		_parent_0.__inherited(_parent_0, _class_0) -- 37
	end -- 37
	Cooker = _class_0 -- 37
	return _class_0 -- 260
end -- 260
