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
	} -- 11
} -- 6
local recipeKey -- 17
recipeKey = function(a, b) -- 17
	if a > b then -- 18
		a, b = b, a -- 18
	end -- 18
	return tostring(a) .. "|" .. tostring(b) -- 19
end -- 17
local RecipeOutputs = { } -- 22
local IsInput = { } -- 23
local GetRecipe -- 24
GetRecipe = function(itemA, itemB) -- 24
	return RecipeOutputs[recipeKey(itemA, itemB)] -- 24
end -- 24
for _index_0 = 1, #recipes do -- 26
	local recipe = recipes[_index_0] -- 26
	local a, b = recipe.inputs[1], recipe.inputs[2] -- 27
	local key = recipeKey(a, b) -- 28
	RecipeOutputs[key] = recipe.output -- 29
	IsInput[a] = true -- 30
	IsInput[b] = true -- 31
end -- 31
local Cooker -- 33
do -- 33
	local _class_0 -- 33
	local _parent_0 = ENTITY -- 33
	local _base_0 = { -- 33
		Base = "base_anim", -- 35
		Type = "anim", -- 36
		PrintName = "Cooker", -- 37
		Interesting = true, -- 38
		Category = "EvilRP: Machines", -- 40
		Spawnable = true, -- 41
		AdminSpawnable = true, -- 43
		Pocketable = false, -- 45
		SetupDataTables = function(self) -- 45
			self:NetworkVar("String", "Producing") -- 46
			self:NetworkVar("String", "Input1") -- 47
			self:NetworkVar("String", "Input2") -- 48
			self:NetworkVar("Int", "ProductionStart") -- 49
			self:NetworkVar("Int", "ProductionEnd") -- 50
			self:NetworkVar("Int", "SoundLoop") -- 51
			self:NetworkVar("Int", "Rust") -- 52
			self:NetworkVar("Int", "Heat") -- 53
			return self:NetworkVar("Entity", "Worker") -- 54
		end, -- 56
		Initialize = function(self) -- 56
			if CLIENT then -- 57
				return -- 57
			end -- 57
			self:SetUseType(SIMPLE_USE) -- 58
			self:SetModel("models/props_wasteland/kitchen_stove002a.mdl") -- 59
			self:PhysicsInit(SOLID_VPHYSICS) -- 60
			self:PhysWake() -- 61
			self:SetHeat(0) -- 62
			self.NextHeat = 0 -- 63
		end, -- 65
		Think = function(self) -- 65
			if CLIENT then -- 66
				return -- 66
			end -- 66
			local pend = self:GetProductionEnd() -- 67
			local ct = CurTime() -- 68
			local rust = self:GetRust() -- 69
			if pend > 0 and ct >= pend then -- 70
				local prod = scripted_ents.Get(self:GetProducing()) -- 71
				self:SetRust(math.min(100, rust + (prod.CookTime))) -- 72
				self:EmitSound("buttons/lever6.wav") -- 73
				self:StopLoopingSound(self:GetSoundLoop()) -- 74
				local worker = self:GetWorker() -- 75
				if worker and IsValid(worker) then -- 76
					local start = self:GetPos() -- 77
					local endpos = start + (self:GetUp() * 128) + (self:GetForward() * 24) -- 78
					local tr = util.TraceLine({ -- 80
						start = start, -- 80
						endpos = endpos, -- 81
						filter = self, -- 82
						mask = MASK_NPCWORLDSTATIC -- 83
					}) -- 79
					if prod then -- 85
						local sp = ents.Create(self:GetProducing()) -- 86
						sp:SetPos(tr.HitPos - (self:GetUp() * 40) + (self:GetForward() * 38) - (self:GetRight() * 2)) -- 88
						sp:Spawn() -- 89
						sp:Activate() -- 90
					end -- 85
					self:SetWorker(nil) -- 93
				end -- 76
				self:SetProducing("") -- 94
				self:SetInput1("") -- 95
				self:SetInput2("") -- 96
				self:SetProductionStart(0) -- 97
				return self:SetProductionEnd(0) -- 98
			end -- 70
		end, -- 101
		Touch = function(self, what) -- 101
			if SERVER then -- 102
				if self:GetProductionEnd() > 0 then -- 103
					return -- 103
				end -- 103
				if not IsInput[what:GetClass()] then -- 104
					return -- 104
				end -- 104
				if what.Processed then -- 105
					return -- 105
				end -- 105
				local submitter = what:GetNWEntity("evilrp_submitter") -- 106
				if not (submitter and IsValid(submitter)) then -- 107
					return -- 107
				end -- 107
				if self:GetInput1() == "" then -- 109
					self:SetInput1(what:GetClass()) -- 110
					what.Processed = true -- 111
					if what.Submitted then -- 112
						what:Submitted() -- 112
					end -- 112
					if what.SubmitSound then -- 113
						what:EmitSound(what.SubmitSound) -- 113
					end -- 113
					what:Remove() -- 114
					return -- 115
				end -- 109
				local prod = GetRecipe(self:GetInput1(), what:GetClass()) -- 116
				if not prod then -- 117
					return -- 117
				end -- 117
				self:SetInput2(what:GetClass()) -- 119
				what.Processed = true -- 120
				if what.Submitted then -- 121
					what:Submitted() -- 121
				end -- 121
				if what.SubmitSound then -- 122
					what:EmitSound(what.SubmitSound) -- 122
				end -- 122
				self:SetProducing(prod) -- 123
				local item = scripted_ents.Get(prod) -- 125
				local ct = CurTime() -- 126
				self:SetProductionStart(ct) -- 127
				local wait = item.CookTime * (1 + (self:GetRust() / 100)) -- 128
				self:SetProductionEnd(ct + wait) -- 129
				self:SetWorker(submitter) -- 130
				self:EmitSound("ambient/machines/machine1_hit1.wav") -- 131
				self:SetSoundLoop(self:StartLoopingSound("ambient/machines/machine_whine1.wav")) -- 132
				local ed = EffectData() -- 133
				ed:SetStart(self:GetPos()) -- 135
				ed:SetOrigin(self:GetPos()) -- 136
				ed:SetScale(2) -- 137
				util.Effect("StunstickImpact", ed, true, true) -- 138
				return what:Remove() -- 139
			end -- 102
		end, -- 141
		OnTakeDamage = function(self, dmg) -- 141
			local attacker = dmg:GetAttacker() -- 142
			if attacker and IsValid(attacker) then -- 143
				if attacker:IsPlayer() then -- 144
					local _exp_0 = attacker:Team() -- 145
					if TEAM_SANITAR == _exp_0 then -- 146
						local rust = self:GetRust() -- 147
						self:SetRust(math.max(0, rust - (dmg:GetDamage() * .2))) -- 148
						local reward = math.floor(math.abs(rust - self:GetRust()) * 2.3) -- 149
						if reward > 0 then -- 150
							return attacker:AddMoney(reward, "The Cleansing") -- 151
						end -- 150
					end -- 152
				end -- 144
			end -- 143
		end, -- 153
		Draw = function(self) -- 153
			self:DrawModel() -- 154
			return self:Render3D2D() -- 155
		end, -- 157
		HUDRender = function(self) -- 157
			local ct = { } -- 158
			ct[#ct + 1] = self.PrintName -- 159
			ct[#ct + 1] = { -- 161
				text = "Certain items can be processed into more useful things with this.", -- 161
				font = "Spleen_Label_Small" -- 162
			} -- 160
			ct[#ct + 1] = { -- 165
				text = "The rustier it is, the longer it will take.", -- 165
				font = "Spleen_Label_Small" -- 166
			} -- 164
			return ct -- 168
		end, -- 170
		Render3D2D = function(self) -- 170
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 171
			if not (dist_sqr < 128 ^ 2) then -- 172
				return -- 172
			end -- 172
			local font = "Spleen_Label" -- 173
			local desp = lp:GetDespair() * 0.01 -- 174
			local ct = CurTime() -- 175
			local pos = self:GetPos() + (self:GetUp() * 80) + (self:GetForward() * 20) + (self:GetRight() * 15) -- 176
			local ang = self:GetAngles() -- 177
			ang:RotateAroundAxis(ang:Up(), -90) -- 179
			ang:RotateAroundAxis(ang:Forward(), 90) -- 180
			ang:RotateAroundAxis(ang:Right(), 180) -- 181
			cam.Start3D2D(pos, ang, 0.1) -- 183
			surface.SetMaterial(noise) -- 185
			surface.SetDrawColor(Color(255, 255, 255, 255)) -- 186
			surface.DrawTexturedRect(0, 0, 152, 38) -- 187
			local txt = "Cooker" -- 189
			local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 190
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 191
			cam.End3D2D() -- 193
			pos = self:GetPos() + (self:GetUp() * 72) + (self:GetForward() * 16) + (self:GetRight() * 8) -- 195
			cam.Start3D2D(pos, ang, 0.1) -- 196
			surface.SetMaterial(noise2) -- 198
			surface.SetDrawColor(Color(255, 191, 0, 255)) -- 199
			surface.DrawTexturedRect(0, 0, 152, 38) -- 200
			txt = "Feed me" -- 202
			local input -- 203
			if self:GetInput1() ~= "" then -- 203
				input = scripted_ents.Get(self:GetInput1()) -- 203
			end -- 203
			if input then -- 204
				txt = input.PrintName -- 204
			end -- 204
			input = nil -- 205
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 206
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 207
			cam.End3D2D() -- 209
			pos = self:GetPos() + (self:GetUp() * 37) + (self:GetForward() * 16) + (self:GetRight() * 8) -- 211
			cam.Start3D2D(pos, ang, 0.1) -- 212
			surface.SetMaterial(noise2) -- 214
			surface.SetDrawColor(Color(255, 191, 0, 255)) -- 215
			surface.DrawTexturedRect(0, 0, 152, 38) -- 216
			txt = "Feed me" -- 218
			if self:GetInput2() ~= "" then -- 219
				input = scripted_ents.Get(self:GetInput2()) -- 219
			end -- 219
			if input then -- 220
				txt = input.PrintName -- 220
			end -- 220
			input = nil -- 221
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 222
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 223
			cam.End3D2D() -- 225
			pos = self:GetPos() + (self:GetUp() * 80) + (self:GetForward() * 20) + (self:GetRight() * -1) -- 227
			cam.Start3D2D(pos, ang, 0.1) -- 228
			local rust = self:GetRust() -- 229
			txt = tostring(rust) .. "% rust" -- 230
			if rust < 0 then -- 231
				txt = "give me purpose" -- 232
			elseif rust >= 100 then -- 233
				txt = "100% ROTTEN" -- 234
			end -- 231
			local pend = self:GetProductionEnd() -- 235
			local pstart = self:GetProductionStart() -- 236
			local prod = self:GetProducing() -- 237
			if pend > 0 and prod then -- 238
				prod = scripted_ents.Get(prod) -- 239
				local text -- 240
				if prod then -- 240
					text = prod.PrintName -- 240
				end -- 240
			end -- 238
			surface.SetDrawColor(0, 0, 0, 255) -- 241
			surface.DrawRect(0, 0, 140, 38) -- 242
			if pend > 0 then -- 243
				local cur = ct - pstart -- 244
				surface.SetDrawColor(0, 150 + (100 * math.cos(ct)), 0, 255) -- 245
				surface.DrawRect(0, 0, 140 * (cur / (pend - pstart)), 38) -- 246
			elseif rust >= 100 then -- 247
				surface.SetDrawColor(150 + (100 * math.cos(ct)), 0, 0, 255) -- 248
				surface.DrawRect(0, 0, 140 * (rust / 100), 38) -- 249
			else -- 251
				surface.SetDrawColor(147, 58 + (2 * math.cos(ct)), 22, 255) -- 251
				surface.DrawRect(0, 0, 140 * (rust / 100), 38) -- 252
			end -- 243
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 253
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 254
			return cam.End3D2D() -- 255
		end -- 33
	} -- 33
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 256
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 33
			_base_0[_key_0] = _val_0 -- 33
		end -- 33
	end -- 256
	if _base_0.__index == nil then -- 33
		_base_0.__index = _base_0 -- 33
	end -- 256
	setmetatable(_base_0, _parent_0.__base) -- 33
	_class_0 = setmetatable({ -- 33
		__init = function(self, ...) -- 33
			return _class_0.__parent.__init(self, ...) -- 33
		end, -- 33
		__base = _base_0, -- 33
		__name = "Cooker", -- 33
		__parent = _parent_0 -- 33
	}, { -- 33
		__index = function(cls, name) -- 33
			local val = rawget(_base_0, name) -- 33
			if val == nil then -- 33
				local parent = rawget(cls, "__parent") -- 33
				if parent then -- 33
					return parent[name] -- 33
				end -- 33
			else -- 33
				return val -- 33
			end -- 33
		end, -- 33
		__call = function(cls, ...) -- 33
			local _self_0 = setmetatable({ }, _base_0) -- 33
			cls.__init(_self_0, ...) -- 33
			return _self_0 -- 33
		end -- 33
	}) -- 33
	_base_0.__class = _class_0 -- 33
	if _parent_0.__inherited then -- 33
		_parent_0.__inherited(_parent_0, _class_0) -- 33
	end -- 33
	Cooker = _class_0 -- 33
	return _class_0 -- 256
end -- 256
