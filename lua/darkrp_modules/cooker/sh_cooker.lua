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
	} -- 7
} -- 6
local recipeKey -- 13
recipeKey = function(a, b) -- 13
	if a > b then -- 14
		a, b = b, a -- 14
	end -- 14
	return tostring(a) .. "|" .. tostring(b) -- 15
end -- 13
local RecipeOutputs = { } -- 18
local IsInput = { } -- 19
local GetRecipe -- 20
GetRecipe = function(itemA, itemB) -- 20
	return RecipeOutputs[recipeKey(itemA, itemB)] -- 20
end -- 20
for _index_0 = 1, #recipes do -- 22
	local recipe = recipes[_index_0] -- 22
	local a, b = recipe.inputs[1], recipe.inputs[2] -- 23
	local key = recipeKey(a, b) -- 24
	RecipeOutputs[key] = recipe.output -- 25
	IsInput[a] = true -- 26
	IsInput[b] = true -- 27
end -- 27
local Cooker -- 29
do -- 29
	local _class_0 -- 29
	local _parent_0 = ENTITY -- 29
	local _base_0 = { -- 29
		Base = "base_anim", -- 31
		Type = "anim", -- 32
		PrintName = "Cooker", -- 33
		Interesting = true, -- 34
		Category = "EvilRP: Machines", -- 36
		Spawnable = true, -- 37
		AdminSpawnable = true, -- 39
		Pocketable = false, -- 41
		SetupDataTables = function(self) -- 41
			self:NetworkVar("String", "Producing") -- 42
			self:NetworkVar("String", "Input1") -- 43
			self:NetworkVar("String", "Input2") -- 44
			self:NetworkVar("Int", "ProductionStart") -- 45
			self:NetworkVar("Int", "ProductionEnd") -- 46
			self:NetworkVar("Int", "SoundLoop") -- 47
			self:NetworkVar("Int", "Rust") -- 48
			self:NetworkVar("Int", "Heat") -- 49
			return self:NetworkVar("Entity", "Worker") -- 50
		end, -- 52
		Initialize = function(self) -- 52
			if CLIENT then -- 53
				return -- 53
			end -- 53
			self:SetUseType(SIMPLE_USE) -- 54
			self:SetModel("models/props_wasteland/kitchen_stove002a.mdl") -- 55
			self:PhysicsInit(SOLID_VPHYSICS) -- 56
			self:PhysWake() -- 57
			self:SetHeat(0) -- 58
			self.NextHeat = 0 -- 59
		end, -- 61
		Think = function(self) -- 61
			if CLIENT then -- 62
				return -- 62
			end -- 62
			local pend = self:GetProductionEnd() -- 63
			local ct = CurTime() -- 64
			local rust = self:GetRust() -- 65
			if pend > 0 and ct >= pend then -- 66
				local prod = scripted_ents.Get(self:GetProducing()) -- 67
				self:SetRust(math.min(100, rust + (prod.CookTime))) -- 68
				self:EmitSound("buttons/lever6.wav") -- 69
				self:StopLoopingSound(self:GetSoundLoop()) -- 70
				local worker = self:GetWorker() -- 71
				if worker and IsValid(worker) then -- 72
					local start = self:GetPos() -- 73
					local endpos = start + (self:GetUp() * 128) + (self:GetForward() * 24) -- 74
					local tr = util.TraceLine({ -- 76
						start = start, -- 76
						endpos = endpos, -- 77
						filter = self, -- 78
						mask = MASK_NPCWORLDSTATIC -- 79
					}) -- 75
					if prod then -- 81
						local sp = ents.Create(self:GetProducing()) -- 82
						sp:SetPos(tr.HitPos - (self:GetUp() * 40) + (self:GetForward() * 38) - (self:GetRight() * 2)) -- 84
						sp:Spawn() -- 85
						sp:Activate() -- 86
					end -- 81
					self:SetWorker(nil) -- 89
				end -- 72
				self:SetProducing("") -- 90
				self:SetInput1("") -- 91
				self:SetInput2("") -- 92
				self:SetProductionStart(0) -- 93
				return self:SetProductionEnd(0) -- 94
			end -- 66
		end, -- 97
		Touch = function(self, what) -- 97
			if SERVER then -- 98
				if self:GetProductionEnd() > 0 then -- 99
					return -- 99
				end -- 99
				if not IsInput[what:GetClass()] then -- 100
					return -- 100
				end -- 100
				if what.Processed then -- 101
					return -- 101
				end -- 101
				local submitter = what:GetNWEntity("evilrp_submitter") -- 102
				if not (submitter and IsValid(submitter)) then -- 103
					return -- 103
				end -- 103
				if self:GetInput1() == "" then -- 105
					self:SetInput1(what:GetClass()) -- 106
					what.Processed = true -- 107
					if what.Submitted then -- 108
						what:Submitted() -- 108
					end -- 108
					if what.SubmitSound then -- 109
						what:EmitSound(what.SubmitSound) -- 109
					end -- 109
					what:Remove() -- 110
					return -- 111
				end -- 105
				local prod = GetRecipe(self:GetInput1(), what:GetClass()) -- 112
				if not prod then -- 113
					return -- 113
				end -- 113
				self:SetInput2(what:GetClass()) -- 115
				what.Processed = true -- 116
				if what.Submitted then -- 117
					what:Submitted() -- 117
				end -- 117
				if what.SubmitSound then -- 118
					what:EmitSound(what.SubmitSound) -- 118
				end -- 118
				self:SetProducing(prod) -- 119
				local item = scripted_ents.Get(prod) -- 121
				local ct = CurTime() -- 122
				self:SetProductionStart(ct) -- 123
				local wait = item.CookTime * (1 + (self:GetRust() / 100)) -- 124
				self:SetProductionEnd(ct + wait) -- 125
				self:SetWorker(submitter) -- 126
				self:EmitSound("ambient/machines/machine1_hit1.wav") -- 127
				self:SetSoundLoop(self:StartLoopingSound("ambient/machines/machine_whine1.wav")) -- 128
				local ed = EffectData() -- 129
				ed:SetStart(self:GetPos()) -- 131
				ed:SetOrigin(self:GetPos()) -- 132
				ed:SetScale(2) -- 133
				util.Effect("StunstickImpact", ed, true, true) -- 134
				return what:Remove() -- 135
			end -- 98
		end, -- 137
		OnTakeDamage = function(self, dmg) -- 137
			local attacker = dmg:GetAttacker() -- 138
			if attacker and IsValid(attacker) then -- 139
				if attacker:IsPlayer() then -- 140
					local _exp_0 = attacker:Team() -- 141
					if TEAM_SANITAR == _exp_0 then -- 142
						local rust = self:GetRust() -- 143
						self:SetRust(math.max(0, rust - (dmg:GetDamage() * .2))) -- 144
						local reward = math.floor(math.abs(rust - self:GetRust()) * 2.3) -- 145
						if reward > 0 then -- 146
							return attacker:AddMoney(reward, "The Cleansing") -- 147
						end -- 146
					end -- 148
				end -- 140
			end -- 139
		end, -- 149
		Draw = function(self) -- 149
			self:DrawModel() -- 150
			return self:Render3D2D() -- 151
		end, -- 153
		HUDRender = function(self) -- 153
			local ct = { } -- 154
			ct[#ct + 1] = self.PrintName -- 155
			ct[#ct + 1] = { -- 157
				text = "Certain items can be processed into more useful things with this.", -- 157
				font = "Spleen_Label_Small" -- 158
			} -- 156
			ct[#ct + 1] = { -- 161
				text = "The rustier it is, the longer it will take.", -- 161
				font = "Spleen_Label_Small" -- 162
			} -- 160
			return ct -- 164
		end, -- 166
		Render3D2D = function(self) -- 166
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 167
			if not (dist_sqr < 128 ^ 2) then -- 168
				return -- 168
			end -- 168
			local font = "Spleen_Label" -- 169
			local desp = lp:GetDespair() * 0.01 -- 170
			local ct = CurTime() -- 171
			local pos = self:GetPos() + (self:GetUp() * 80) + (self:GetForward() * 20) + (self:GetRight() * 15) -- 172
			local ang = self:GetAngles() -- 173
			ang:RotateAroundAxis(ang:Up(), -90) -- 175
			ang:RotateAroundAxis(ang:Forward(), 90) -- 176
			ang:RotateAroundAxis(ang:Right(), 180) -- 177
			cam.Start3D2D(pos, ang, 0.1) -- 179
			surface.SetMaterial(noise) -- 181
			surface.SetDrawColor(Color(255, 255, 255, 255)) -- 182
			surface.DrawTexturedRect(0, 0, 152, 38) -- 183
			local txt = "Cooker" -- 185
			local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 186
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 187
			cam.End3D2D() -- 189
			pos = self:GetPos() + (self:GetUp() * 72) + (self:GetForward() * 16) + (self:GetRight() * 8) -- 191
			cam.Start3D2D(pos, ang, 0.1) -- 192
			surface.SetMaterial(noise2) -- 194
			surface.SetDrawColor(Color(255, 191, 0, 255)) -- 195
			surface.DrawTexturedRect(0, 0, 152, 38) -- 196
			txt = "Feed me" -- 198
			local input -- 199
			if self:GetInput1() ~= "" then -- 199
				input = scripted_ents.Get(self:GetInput1()) -- 199
			end -- 199
			if input then -- 200
				txt = input.PrintName -- 200
			end -- 200
			input = nil -- 201
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 202
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 203
			cam.End3D2D() -- 205
			pos = self:GetPos() + (self:GetUp() * 37) + (self:GetForward() * 16) + (self:GetRight() * 8) -- 207
			cam.Start3D2D(pos, ang, 0.1) -- 208
			surface.SetMaterial(noise2) -- 210
			surface.SetDrawColor(Color(255, 191, 0, 255)) -- 211
			surface.DrawTexturedRect(0, 0, 152, 38) -- 212
			txt = "Feed me" -- 214
			if self:GetInput2() ~= "" then -- 215
				input = scripted_ents.Get(self:GetInput2()) -- 215
			end -- 215
			if input then -- 216
				txt = input.PrintName -- 216
			end -- 216
			input = nil -- 217
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 218
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 219
			cam.End3D2D() -- 221
			pos = self:GetPos() + (self:GetUp() * 80) + (self:GetForward() * 20) + (self:GetRight() * -1) -- 223
			cam.Start3D2D(pos, ang, 0.1) -- 224
			local rust = self:GetRust() -- 225
			txt = tostring(rust) .. "% rust" -- 226
			if rust < 0 then -- 227
				txt = "give me purpose" -- 228
			elseif rust >= 100 then -- 229
				txt = "100% ROTTEN" -- 230
			end -- 227
			local pend = self:GetProductionEnd() -- 231
			local pstart = self:GetProductionStart() -- 232
			local prod = self:GetProducing() -- 233
			if pend > 0 and prod then -- 234
				prod = scripted_ents.Get(prod) -- 235
				local text -- 236
				if prod then -- 236
					text = prod.PrintName -- 236
				end -- 236
			end -- 234
			surface.SetDrawColor(0, 0, 0, 255) -- 237
			surface.DrawRect(0, 0, 140, 38) -- 238
			if pend > 0 then -- 239
				local cur = ct - pstart -- 240
				surface.SetDrawColor(0, 150 + (100 * math.cos(ct)), 0, 255) -- 241
				surface.DrawRect(0, 0, 140 * (cur / (pend - pstart)), 38) -- 242
			elseif rust >= 100 then -- 243
				surface.SetDrawColor(150 + (100 * math.cos(ct)), 0, 0, 255) -- 244
				surface.DrawRect(0, 0, 140 * (rust / 100), 38) -- 245
			else -- 247
				surface.SetDrawColor(147, 58 + (2 * math.cos(ct)), 22, 255) -- 247
				surface.DrawRect(0, 0, 140 * (rust / 100), 38) -- 248
			end -- 239
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 249
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 250
			return cam.End3D2D() -- 251
		end -- 29
	} -- 29
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 252
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 29
			_base_0[_key_0] = _val_0 -- 29
		end -- 29
	end -- 252
	if _base_0.__index == nil then -- 29
		_base_0.__index = _base_0 -- 29
	end -- 252
	setmetatable(_base_0, _parent_0.__base) -- 29
	_class_0 = setmetatable({ -- 29
		__init = function(self, ...) -- 29
			return _class_0.__parent.__init(self, ...) -- 29
		end, -- 29
		__base = _base_0, -- 29
		__name = "Cooker", -- 29
		__parent = _parent_0 -- 29
	}, { -- 29
		__index = function(cls, name) -- 29
			local val = rawget(_base_0, name) -- 29
			if val == nil then -- 29
				local parent = rawget(cls, "__parent") -- 29
				if parent then -- 29
					return parent[name] -- 29
				end -- 29
			else -- 29
				return val -- 29
			end -- 29
		end, -- 29
		__call = function(cls, ...) -- 29
			local _self_0 = setmetatable({ }, _base_0) -- 29
			cls.__init(_self_0, ...) -- 29
			return _self_0 -- 29
		end -- 29
	}) -- 29
	_base_0.__class = _class_0 -- 29
	if _parent_0.__inherited then -- 29
		_parent_0.__inherited(_parent_0, _class_0) -- 29
	end -- 29
	Cooker = _class_0 -- 29
	return _class_0 -- 252
end -- 252
