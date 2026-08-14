-- [yue]: darkrp_modules\machines\sh_refinery.yue
local noise = Material("models/props_lab/eyescanner_disp") -- 1
local screen = Material("glass/glasswindow017a") -- 2
local Refinery -- 4
do -- 4
	local _class_0 -- 4
	local _parent_0 = ENTITY -- 4
	local _base_0 = { -- 4
		Base = "base_anim", -- 6
		Type = "anim", -- 7
		PrintName = "Refinery", -- 8
		Interesting = true, -- 10
		Spawnable = true, -- 11
		AdminSpawnable = true, -- 13
		Pocketable = false, -- 15
		SetupDataTables = function(self) -- 15
			self:NetworkVar("String", "Producing") -- 16
			self:NetworkVar("Int", "ProductionStart") -- 17
			self:NetworkVar("Int", "ProductionEnd") -- 18
			self:NetworkVar("Int", "SoundLoop") -- 19
			self:NetworkVar("Int", "Rust") -- 20
			self:NetworkVar("Int", "Heat") -- 21
			return self:NetworkVar("Entity", "Worker") -- 22
		end, -- 24
		Initialize = function(self) -- 24
			if CLIENT then -- 25
				return -- 25
			end -- 25
			self:SetUseType(SIMPLE_USE) -- 26
			self:SetModel("models/props_wasteland/laundry_washer003.mdl") -- 27
			self:PhysicsInit(SOLID_VPHYSICS) -- 28
			self:PhysWake() -- 29
			self:SetHeat(0) -- 30
			self.NextHeat = 0 -- 31
		end, -- 33
		Think = function(self) -- 33
			if CLIENT then -- 34
				return -- 34
			end -- 34
			local pend = self:GetProductionEnd() -- 35
			local ct = CurTime() -- 36
			local rust = self:GetRust() -- 37
			if pend > 0 and ct >= pend then -- 38
				local prod = scripted_ents.Get(self:GetProducing()).Refinement -- 39
				self:SetRust(math.min(100, rust + (prod.rust or prod.time))) -- 40
				self:EmitSound("buttons/lever6.wav") -- 41
				self:StopLoopingSound(self:GetSoundLoop()) -- 42
				local worker = self:GetWorker() -- 43
				if worker and IsValid(worker) then -- 44
					local start = self:GetPos() -- 45
					local endpos = start + (self:GetUp() * 128) + (self:GetForward() * 24) -- 46
					local tr = util.TraceLine({ -- 48
						start = start, -- 48
						endpos = endpos, -- 49
						filter = self, -- 50
						mask = MASK_NPCWORLDSTATIC -- 51
					}) -- 47
					if prod.result then -- 53
						local wep = weapons.Get(prod.result) -- 54
						if wep then -- 55
							local sp = ents.Create("evilrp/spawned/weapon") -- 56
							sp:SetPos(tr.HitPos - (self:GetUp() * 86) - (self:GetForward() * 38) - (self:GetRight() * 8)) -- 58
							sp:SetModel(wep.WorldModel) -- 59
							sp:SetWeaponClass(prod.result) -- 60
							sp:Spawn() -- 61
							sp:Activate() -- 62
						else -- 64
							local sp = ents.Create(prod.result) -- 64
							sp:SetPos(tr.HitPos - (self:GetUp() * 86) - (self:GetForward() * 38) - (self:GetRight() * 8)) -- 67
							sp:Spawn() -- 68
							sp:Activate() -- 69
						end -- 55
					end -- 53
					self:SetWorker(nil) -- 72
				end -- 44
				self:SetProducing("") -- 73
				self:SetProductionStart(0) -- 74
				return self:SetProductionEnd(0) -- 75
			end -- 38
		end, -- 78
		Touch = function(self, what) -- 78
			if SERVER then -- 79
				if what.Rust then -- 80
					self:SetRust(math.Clamp(self:GetRust() + what.Rust, 0, 100)) -- 81
					self:EmitSound("ambient/machines/machine1_hit1.wav") -- 82
					local pos = what:GetPos() -- 83
					local ed = EffectData() -- 84
					ed:SetOrigin(pos) -- 86
					ed:SetScale(1) -- 87
					ed:SetMagnitude(1) -- 88
					ed:SetRadius(3) -- 89
					util.Effect("Sparks", ed) -- 90
					what:Trash() -- 91
					return -- 92
				end -- 80
				if self:GetProductionEnd() > 0 then -- 93
					return -- 93
				end -- 93
				if not what.Refinement then -- 94
					return -- 94
				end -- 94
				local prod = what.Refinement -- 95
				local submitter = what:GetNWEntity("evilrp_submitter") -- 96
				if not (submitter and IsValid(submitter)) then -- 97
					return -- 97
				end -- 97
				if what.Processed then -- 98
					return -- 98
				end -- 98
				what.Processed = true -- 99
				if what.Submitted then -- 100
					what:Submitted() -- 100
				end -- 100
				if what.SubmitSound then -- 101
					what:EmitSound(what.SubmitSound) -- 101
				end -- 101
				self:SetProducing(what:GetClass()) -- 102
				local ct = CurTime() -- 103
				self:SetProductionStart(ct) -- 104
				local wait = prod.time * (1 + (self:GetRust() / 100)) -- 105
				self:SetProductionEnd(ct + wait) -- 106
				self:SetWorker(submitter) -- 107
				self:EmitSound("ambient/machines/machine1_hit1.wav") -- 108
				self:SetSoundLoop(self:StartLoopingSound("ambient/machines/machine_whine1.wav")) -- 109
				local ed = EffectData() -- 110
				ed:SetStart(self:GetPos()) -- 112
				ed:SetOrigin(self:GetPos()) -- 113
				ed:SetScale(2) -- 114
				util.Effect("StunstickImpact", ed, true, true) -- 115
				return what:Remove() -- 116
			end -- 79
		end, -- 118
		OnTakeDamage = function(self, dmg) -- 118
			local attacker = dmg:GetAttacker() -- 119
			if attacker and IsValid(attacker) then -- 120
				if attacker:IsPlayer() then -- 121
					local _exp_0 = attacker:Team() -- 122
					if TEAM_KORPSMAN == _exp_0 or TEAM_CONSCRIPT == _exp_0 then -- 123
						local rust = self:GetRust() -- 124
						self:SetRust(math.max(0, rust - (dmg:GetDamage() * .2))) -- 125
						local reward = math.floor(math.abs(rust - self:GetRust()) * 1) -- 126
						if reward > 0 then -- 127
							attacker:AddMoney(reward, "The Cleansing") -- 128
							return attacker:SetHealth(attacker:Health() + 6) -- 129
						end -- 127
					end -- 130
				end -- 121
			end -- 120
		end, -- 131
		Draw = function(self) -- 131
			self:DrawModel() -- 132
			return self:Render3D2D() -- 133
		end, -- 135
		HUDRender = function(self) -- 135
			local ct = { } -- 136
			ct[#ct + 1] = self.PrintName -- 137
			ct[#ct + 1] = { -- 139
				text = "Certain items can be processed into more useful things with this.", -- 139
				font = "Spleen_Label_Small" -- 140
			} -- 138
			ct[#ct + 1] = { -- 143
				text = "The rustier it is, the longer it will take.", -- 143
				font = "Spleen_Label_Small" -- 144
			} -- 142
			return ct -- 146
		end, -- 148
		Render3D2D = function(self) -- 148
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 149
			if not (dist_sqr < 128 ^ 2) then -- 150
				return -- 150
			end -- 150
			local font = "Spleen_Label" -- 151
			local desp = lp:GetDespair() * 0.01 -- 152
			local ct = CurTime() -- 153
			local pos = self:GetPos() + (self:GetUp() * 15) + (self:GetForward() * 25) + (self:GetRight() * -20) -- 154
			local ang = self:GetAngles() -- 155
			ang:RotateAroundAxis(ang:Up(), -90) -- 157
			ang:RotateAroundAxis(ang:Forward(), 90) -- 158
			ang:RotateAroundAxis(ang:Right(), 90) -- 159
			cam.Start3D2D(pos, ang, 0.1) -- 161
			surface.SetMaterial(noise) -- 163
			surface.SetDrawColor(Color(255, 255, 255, 255)) -- 164
			surface.DrawTexturedRect(0, 0, 152, 38) -- 165
			local txt = "Refinery" -- 167
			local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 168
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 169
			cam.End3D2D() -- 171
			pos = self:GetPos() + (self:GetUp() * 5) + (self:GetForward() * 25) + (self:GetRight() * -22) -- 173
			cam.Start3D2D(pos, ang, 0.1) -- 174
			local rust = self:GetRust() -- 175
			txt = tostring(rust) .. "% rust" -- 176
			if rust < 0 then -- 177
				txt = "give me purpose" -- 178
			elseif rust >= 100 then -- 179
				txt = "100% ROTTEN" -- 180
			end -- 177
			local pend = self:GetProductionEnd() -- 181
			local pstart = self:GetProductionStart() -- 182
			local prod = self:GetProducing() -- 183
			if pend > 0 and prod then -- 184
				prod = scripted_ents.Get(prod) -- 185
				local text -- 186
				if prod then -- 186
					text = prod.PrintName -- 186
				end -- 186
			end -- 184
			surface.SetDrawColor(0, 0, 0, 255) -- 187
			surface.DrawRect(0, 0, 152, 78) -- 188
			if pend > 0 then -- 189
				local cur = ct - pstart -- 190
				surface.SetDrawColor(0, 150 + (100 * math.cos(ct)), 0, 255) -- 191
				surface.DrawRect(0, 0, 152 * (cur / (pend - pstart)), 78) -- 192
			elseif rust >= 100 then -- 193
				surface.SetDrawColor(150 + (100 * math.cos(ct)), 0, 0, 255) -- 194
				surface.DrawRect(0, 0, 152 * (rust / 100), 78) -- 195
			else -- 197
				surface.SetDrawColor(147, 58 + (2 * math.cos(ct)), 22, 255) -- 197
				surface.DrawRect(0, 0, 152 * (rust / 100), 78) -- 198
			end -- 189
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 199
			txt_obj:Draw(76, 24, 1, TEXT_ALIGN_CENTER) -- 200
			return cam.End3D2D() -- 201
		end -- 4
	} -- 4
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 202
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 4
			_base_0[_key_0] = _val_0 -- 4
		end -- 4
	end -- 202
	if _base_0.__index == nil then -- 4
		_base_0.__index = _base_0 -- 4
	end -- 202
	setmetatable(_base_0, _parent_0.__base) -- 4
	_class_0 = setmetatable({ -- 4
		__init = function(self, ...) -- 4
			return _class_0.__parent.__init(self, ...) -- 4
		end, -- 4
		__base = _base_0, -- 4
		__name = "Refinery", -- 4
		__parent = _parent_0 -- 4
	}, { -- 4
		__index = function(cls, name) -- 4
			local val = rawget(_base_0, name) -- 4
			if val == nil then -- 4
				local parent = rawget(cls, "__parent") -- 4
				if parent then -- 4
					return parent[name] -- 4
				end -- 4
			else -- 4
				return val -- 4
			end -- 4
		end, -- 4
		__call = function(cls, ...) -- 4
			local _self_0 = setmetatable({ }, _base_0) -- 4
			cls.__init(_self_0, ...) -- 4
			return _self_0 -- 4
		end -- 4
	}) -- 4
	_base_0.__class = _class_0 -- 4
	if _parent_0.__inherited then -- 4
		_parent_0.__inherited(_parent_0, _class_0) -- 4
	end -- 4
	Refinery = _class_0 -- 4
	return _class_0 -- 202
end -- 202
