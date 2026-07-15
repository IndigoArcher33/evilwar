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
						local sp = ents.Create(prod.result) -- 54
						sp:SetPos(tr.HitPos - (self:GetUp() * 86) - (self:GetForward() * 38) - (self:GetRight() * 8)) -- 56
						sp:Spawn() -- 57
						sp:Activate() -- 58
					end -- 53
					self:SetWorker(nil) -- 61
				end -- 44
				self:SetProducing("") -- 62
				self:SetProductionStart(0) -- 63
				return self:SetProductionEnd(0) -- 64
			end -- 38
		end, -- 67
		Touch = function(self, what) -- 67
			if SERVER then -- 68
				if self:GetProductionEnd() > 0 then -- 69
					return -- 69
				end -- 69
				if not what.Refinement then -- 70
					return -- 70
				end -- 70
				local prod = what.Refinement -- 71
				local submitter = what:GetNWEntity("evilrp_submitter") -- 72
				if not (submitter and IsValid(submitter)) then -- 73
					return -- 73
				end -- 73
				if what.Processed then -- 74
					return -- 74
				end -- 74
				what.Processed = true -- 75
				if what.Submitted then -- 76
					what:Submitted() -- 76
				end -- 76
				if what.SubmitSound then -- 77
					what:EmitSound(what.SubmitSound) -- 77
				end -- 77
				self:SetProducing(what:GetClass()) -- 78
				local ct = CurTime() -- 79
				self:SetProductionStart(ct) -- 80
				local wait = prod.time * (1 + (self:GetRust() / 100)) -- 81
				self:SetProductionEnd(ct + wait) -- 82
				self:SetWorker(submitter) -- 83
				self:EmitSound("ambient/machines/machine1_hit1.wav") -- 84
				self:SetSoundLoop(self:StartLoopingSound("ambient/machines/machine_whine1.wav")) -- 85
				local ed = EffectData() -- 86
				ed:SetStart(self:GetPos()) -- 88
				ed:SetOrigin(self:GetPos()) -- 89
				ed:SetScale(2) -- 90
				util.Effect("StunstickImpact", ed, true, true) -- 91
				return what:Remove() -- 92
			end -- 68
		end, -- 94
		OnTakeDamage = function(self, dmg) -- 94
			local attacker = dmg:GetAttacker() -- 95
			if attacker and IsValid(attacker) then -- 96
				if attacker:IsPlayer() then -- 97
					local _exp_0 = attacker:Team() -- 98
					if TEAM_SANITAR == _exp_0 then -- 99
						local rust = self:GetRust() -- 100
						self:SetRust(math.max(0, rust - (dmg:GetDamage() * .2))) -- 101
						local reward = math.floor(math.abs(rust - self:GetRust()) * 2.3) -- 102
						if reward > 0 then -- 103
							return attacker:AddMoney(reward, "The Cleansing") -- 104
						end -- 103
					end -- 105
				end -- 97
			end -- 96
		end, -- 106
		Draw = function(self) -- 106
			self:DrawModel() -- 107
			return self:Render3D2D() -- 108
		end, -- 110
		HUDRender = function(self) -- 110
			local ct = { } -- 111
			ct[#ct + 1] = self.PrintName -- 112
			ct[#ct + 1] = { -- 114
				text = "Certain items can be processed into more useful things with this.", -- 114
				font = "Spleen_Label_Small" -- 115
			} -- 113
			ct[#ct + 1] = { -- 118
				text = "The rustier it is, the longer it will take.", -- 118
				font = "Spleen_Label_Small" -- 119
			} -- 117
			return ct -- 121
		end, -- 123
		Render3D2D = function(self) -- 123
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 124
			if not (dist_sqr < 128 ^ 2) then -- 125
				return -- 125
			end -- 125
			local font = "Spleen_Label" -- 126
			local desp = lp:GetDespair() * 0.01 -- 127
			local ct = CurTime() -- 128
			local pos = self:GetPos() + (self:GetUp() * 15) + (self:GetForward() * 25) + (self:GetRight() * -20) -- 129
			local ang = self:GetAngles() -- 130
			ang:RotateAroundAxis(ang:Up(), -90) -- 132
			ang:RotateAroundAxis(ang:Forward(), 90) -- 133
			ang:RotateAroundAxis(ang:Right(), 90) -- 134
			cam.Start3D2D(pos, ang, 0.1) -- 136
			surface.SetMaterial(noise) -- 138
			surface.SetDrawColor(Color(255, 255, 255, 255)) -- 139
			surface.DrawTexturedRect(0, 0, 152, 38) -- 140
			local txt = "Refinery" -- 142
			local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 143
			txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT) -- 144
			cam.End3D2D() -- 146
			pos = self:GetPos() + (self:GetUp() * 5) + (self:GetForward() * 25) + (self:GetRight() * -22) -- 148
			cam.Start3D2D(pos, ang, 0.1) -- 149
			local rust = self:GetRust() -- 150
			txt = tostring(rust) .. "% rust" -- 151
			if rust < 0 then -- 152
				txt = "give me purpose" -- 153
			elseif rust >= 100 then -- 154
				txt = "100% ROTTEN" -- 155
			end -- 152
			local pend = self:GetProductionEnd() -- 156
			local pstart = self:GetProductionStart() -- 157
			local prod = self:GetProducing() -- 158
			if pend > 0 and prod then -- 159
				prod = scripted_ents.Get(prod) -- 160
				local text -- 161
				if prod then -- 161
					text = prod.PrintName -- 161
				end -- 161
			end -- 159
			surface.SetDrawColor(0, 0, 0, 255) -- 162
			surface.DrawRect(0, 0, 152, 78) -- 163
			if pend > 0 then -- 164
				local cur = ct - pstart -- 165
				surface.SetDrawColor(0, 150 + (100 * math.cos(ct)), 0, 255) -- 166
				surface.DrawRect(0, 0, 152 * (cur / (pend - pstart)), 78) -- 167
			elseif rust >= 100 then -- 168
				surface.SetDrawColor(150 + (100 * math.cos(ct)), 0, 0, 255) -- 169
				surface.DrawRect(0, 0, 152 * (rust / 100), 78) -- 170
			else -- 172
				surface.SetDrawColor(147, 58 + (2 * math.cos(ct)), 22, 255) -- 172
				surface.DrawRect(0, 0, 152 * (rust / 100), 78) -- 173
			end -- 164
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 174
			txt_obj:Draw(76, 24, 1, TEXT_ALIGN_CENTER) -- 175
			return cam.End3D2D() -- 176
		end -- 4
	} -- 4
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 177
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 4
			_base_0[_key_0] = _val_0 -- 4
		end -- 4
	end -- 177
	if _base_0.__index == nil then -- 4
		_base_0.__index = _base_0 -- 4
	end -- 177
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
	return _class_0 -- 177
end -- 177
