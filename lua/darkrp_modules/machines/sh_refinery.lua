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
				if self:GetProductionEnd() > 0 then -- 80
					return -- 80
				end -- 80
				if not what.Refinement then -- 81
					return -- 81
				end -- 81
				local prod = what.Refinement -- 82
				local submitter = what:GetNWEntity("evilrp_submitter") -- 83
				if not (submitter and IsValid(submitter)) then -- 84
					return -- 84
				end -- 84
				if what.Processed then -- 85
					return -- 85
				end -- 85
				what.Processed = true -- 86
				if what.Submitted then -- 87
					what:Submitted() -- 87
				end -- 87
				if what.SubmitSound then -- 88
					what:EmitSound(what.SubmitSound) -- 88
				end -- 88
				self:SetProducing(what:GetClass()) -- 89
				local ct = CurTime() -- 90
				self:SetProductionStart(ct) -- 91
				local wait = prod.time * (1 + (self:GetRust() / 100)) -- 92
				self:SetProductionEnd(ct + wait) -- 93
				self:SetWorker(submitter) -- 94
				self:EmitSound("ambient/machines/machine1_hit1.wav") -- 95
				self:SetSoundLoop(self:StartLoopingSound("ambient/machines/machine_whine1.wav")) -- 96
				local ed = EffectData() -- 97
				ed:SetStart(self:GetPos()) -- 99
				ed:SetOrigin(self:GetPos()) -- 100
				ed:SetScale(2) -- 101
				util.Effect("StunstickImpact", ed, true, true) -- 102
				return what:Remove() -- 103
			end -- 79
		end, -- 105
		OnTakeDamage = function(self, dmg) -- 105
			local attacker = dmg:GetAttacker() -- 106
			if attacker and IsValid(attacker) then -- 107
				if attacker:IsPlayer() then -- 108
					local _exp_0 = attacker:Team() -- 109
					if TEAM_SANITAR == _exp_0 or TEAM_CONSCRIPT == _exp_0 then -- 110
						local rust = self:GetRust() -- 111
						self:SetRust(math.max(0, rust - (dmg:GetDamage() * .2))) -- 112
						local reward = math.floor(math.abs(rust - self:GetRust()) * 2.3) -- 113
						if reward > 0 then -- 114
							return attacker:AddMoney(reward, "The Cleansing") -- 115
						end -- 114
					end -- 116
				end -- 108
			end -- 107
		end, -- 117
		Draw = function(self) -- 117
			self:DrawModel() -- 118
			return self:Render3D2D() -- 119
		end, -- 121
		HUDRender = function(self) -- 121
			local ct = { } -- 122
			ct[#ct + 1] = self.PrintName -- 123
			ct[#ct + 1] = { -- 125
				text = "Certain items can be processed into more useful things with this.", -- 125
				font = "Spleen_Label_Small" -- 126
			} -- 124
			ct[#ct + 1] = { -- 129
				text = "The rustier it is, the longer it will take.", -- 129
				font = "Spleen_Label_Small" -- 130
			} -- 128
			return ct -- 132
		end, -- 134
		Render3D2D = function(self) -- 134
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 135
			if not (dist_sqr < 128 ^ 2) then -- 136
				return -- 136
			end -- 136
			local font = "Spleen_Label" -- 137
			local desp = lp:GetDespair() * 0.01 -- 138
			local ct = CurTime() -- 139
			local pos = self:GetPos() + (self:GetUp() * 15) + (self:GetForward() * 25) + (self:GetRight() * -20) -- 140
			local ang = self:GetAngles() -- 141
			ang:RotateAroundAxis(ang:Up(), -90) -- 143
			ang:RotateAroundAxis(ang:Forward(), 90) -- 144
			ang:RotateAroundAxis(ang:Right(), 90) -- 145
			cam.Start3D2D(pos, ang, 0.1) -- 147
			surface.SetMaterial(noise) -- 149
			surface.SetDrawColor(Color(255, 255, 255, 255)) -- 150
			surface.DrawTexturedRect(0, 0, 152, 38) -- 151
			local txt = "Refinery" -- 153
			local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 154
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 155
			cam.End3D2D() -- 157
			pos = self:GetPos() + (self:GetUp() * 5) + (self:GetForward() * 25) + (self:GetRight() * -22) -- 159
			cam.Start3D2D(pos, ang, 0.1) -- 160
			local rust = self:GetRust() -- 161
			txt = tostring(rust) .. "% rust" -- 162
			if rust < 0 then -- 163
				txt = "give me purpose" -- 164
			elseif rust >= 100 then -- 165
				txt = "100% ROTTEN" -- 166
			end -- 163
			local pend = self:GetProductionEnd() -- 167
			local pstart = self:GetProductionStart() -- 168
			local prod = self:GetProducing() -- 169
			if pend > 0 and prod then -- 170
				prod = scripted_ents.Get(prod) -- 171
				local text -- 172
				if prod then -- 172
					text = prod.PrintName -- 172
				end -- 172
			end -- 170
			surface.SetDrawColor(0, 0, 0, 255) -- 173
			surface.DrawRect(0, 0, 152, 78) -- 174
			if pend > 0 then -- 175
				local cur = ct - pstart -- 176
				surface.SetDrawColor(0, 150 + (100 * math.cos(ct)), 0, 255) -- 177
				surface.DrawRect(0, 0, 152 * (cur / (pend - pstart)), 78) -- 178
			elseif rust >= 100 then -- 179
				surface.SetDrawColor(150 + (100 * math.cos(ct)), 0, 0, 255) -- 180
				surface.DrawRect(0, 0, 152 * (rust / 100), 78) -- 181
			else -- 183
				surface.SetDrawColor(147, 58 + (2 * math.cos(ct)), 22, 255) -- 183
				surface.DrawRect(0, 0, 152 * (rust / 100), 78) -- 184
			end -- 175
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 185
			txt_obj:Draw(76, 24, 1, TEXT_ALIGN_CENTER) -- 186
			return cam.End3D2D() -- 187
		end -- 4
	} -- 4
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 188
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 4
			_base_0[_key_0] = _val_0 -- 4
		end -- 4
	end -- 188
	if _base_0.__index == nil then -- 4
		_base_0.__index = _base_0 -- 4
	end -- 188
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
	return _class_0 -- 188
end -- 188
