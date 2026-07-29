-- [yue]: darkrp_modules\medical\sh_autostitcher.yue
local cable = Material("cable/hydra") -- 1
local noise = Material("effects/tvscreen_noise001a") -- 2
local screen = Material("glass/glasswindow017a") -- 3
if SERVER then -- 7
	util.AddNetworkString("evilrp_autostitcher") -- 8
end -- 7
if CLIENT then -- 9
	net.Receive("evilrp_autostitcher", function(len) -- 10
		print("FUCK") -- 11
		AMBIENCE_COOLDOWN = CurTime() -- 12
	end) -- 10
end -- 9
local Autostitcher -- 14
do -- 14
	local _class_0 -- 14
	local _parent_0 = ENTITY -- 14
	local _base_0 = { -- 14
		Base = "base_anim", -- 16
		Type = "anim", -- 18
		PrintName = "Autostitcher", -- 19
		Interesting = true, -- 21
		MaxCharges = 3, -- 23
		SetupDataTables = function(self) -- 23
			self:NetworkVar("Int", "Charges") -- 24
			return self:NetworkVar("Entity", "Patient") -- 25
		end, -- 27
		Initialize = function(self) -- 27
			if CLIENT then -- 28
				return -- 28
			end -- 28
			self:SetUseType(SIMPLE_USE) -- 29
			self:SetModel("models/props_combine/health_charger001.mdl") -- 30
			self:PhysicsInit(SOLID_VPHYSICS) -- 31
			self:PhysWake() -- 32
			return self:SetCharges(math.random(0, 1)) -- 33
		end, -- 35
		Think = function(self) -- 35
			if CLIENT then -- 36
				return -- 36
			end -- 36
			local patient = self:GetPatient() -- 38
			if IsValid(patient) then -- 39
				if (not patient:CanSee(self)) or patient:Health() >= patient:GetMaxHealth() then -- 40
					patient:SendChat("NOTICE", "You feel better but not much.") -- 41
					patient:SetNWEntity("evilrp_autostitcher", nil) -- 42
					self:SetPatient(nil) -- 43
					self:EmitSound("npc/turret_floor/die.wav", 75, 70) -- 44
					local ed = EffectData() -- 45
					local where = self:GetPos() + (self:GetForward() * 6) + (self:GetRight() * 2.4) -- 46
					ed:SetStart(where) -- 48
					ed:SetOrigin(where) -- 49
					ed:SetScale(2) -- 50
					util.Effect("StunstickImpact", ed, true, true) -- 51
					return -- 52
				end -- 40
				if not self.next_beep then -- 53
					self.next_beep = CurTime() + 5 -- 53
				end -- 53
				if CurTime() >= self.next_beep then -- 54
					self.next_beep = CurTime() + 5 -- 55
					self:EmitSound("items/medshot4.wav", 50, 50 + (50 * (patient:Health() / 100))) -- 56
					local ed = EffectData() -- 57
					local where = self:GetPos() + (self:GetForward() * 6) + (self:GetRight() * 2.4) + (self:GetUp() * -1) -- 58
					ed:SetStart(where) -- 60
					ed:SetOrigin(where) -- 61
					ed:SetScale(2) -- 62
					util.Effect("GunshipImpact", ed, true, true) -- 63
					local nh = math.min(patient:Health() + 3, patient:GetMaxHealth()) -- 64
					return patient:SetHealth(nh) -- 65
				end -- 54
			end -- 39
		end, -- 67
		CostFor = function(self, ply) -- 67
			local cost = 100 -- 68
			if ply:Team() == TEAM_KORPSMAN then -- 69
				cost = cost / 2 -- 69
			end -- 69
			return cost -- 70
		end, -- 72
		Use = function(self, ply) -- 72
			local korpsman = ply:Team() == TEAM_KORPSMAN -- 73
			local wep = ply:GetActiveWeapon() -- 74
			if korpsman then -- 75
				if wep and IsValid(wep) and wep.Medkit then -- 76
					if self:GetCharges() >= self.MaxCharges then -- 77
						self:EmitSound("items/medshotno1.wav") -- 78
						ply:Notify("<c=200,0,0>It can't hold any more charges.") -- 79
						net.Start("evilrp_frighten") -- 80
						net.Send(ply) -- 81
						return -- 82
					end -- 77
					local patient = self:GetPatient() -- 83
					if IsValid(patient) and patient == ply then -- 84
						local dmg = DamageInfo() -- 85
						dmg:SetAttacker(ply) -- 87
						dmg:SetDamage(15) -- 88
						dmg:SetInflictor(self) -- 89
						dmg:SetDamageType(DMG_FALL) -- 90
						ply:TakeDamageInfo(dmg) -- 91
						ply:Notify("<c=200,0,0>Nice try, freak.") -- 92
						self:EmitSound("items/medshotno1.wav") -- 93
						net.Start("evilrp_frighten") -- 94
						net.Send(ply) -- 95
						return -- 96
					end -- 84
					ply:EmitSound("items/gift_drop.wav", 75, math.random(70, 90)) -- 98
					local dmg = DamageInfo() -- 99
					dmg:SetAttacker(ply) -- 101
					dmg:SetDamage(20) -- 102
					dmg:SetInflictor(self) -- 103
					dmg:SetDamageType(DMG_FALL) -- 104
					ply:TakeDamageInfo(dmg) -- 105
					self:SetCharges(self:GetCharges() + 1) -- 106
					local reward = math.random(15, 30) -- 107
					ply:AddMoney(reward, compassion) -- 108
					return -- 109
				end -- 76
			end -- 75
			if self:GetCharges() <= 0 then -- 111
				ply:Notify("<c=200,0,0>No healing charges remain.") -- 113
				net.Start("evilrp_frighten") -- 114
				net.Send(ply) -- 115
				self:EmitSound("items/medshotno1.wav") -- 116
				return -- 117
			end -- 111
			local patient = self:GetPatient() -- 118
			local cost = self:CostFor(ply) -- 119
			if ply:getDarkRPVar("money") < cost and not IsValid(self:GetPatient()) then -- 120
				ply:Notify("<c=200,0,0>It sucks to be poor. A healing trip costs $" .. tostring(cost) .. ".") -- 122
				net.Start("evilrp_frighten") -- 123
				net.Send(ply) -- 124
				self:EmitSound("items/medshotno1.wav") -- 125
				return -- 126
			end -- 120
			if IsValid(patient) and patient ~= ply then -- 127
				ply:Notify("<c=200,0,0>Wait your turn.") -- 129
				net.Start("evilrp_frighten") -- 130
				net.Send(ply) -- 131
				self:EmitSound("items/medshotno1.wav") -- 132
				return -- 133
			end -- 127
			self:SetCharges(self:GetCharges() - 1) -- 136
			self:SetPatient(ply) -- 137
			ply:SetNWEntity("evilrp_autostitcher", self) -- 138
			ply:AddMoney(-cost, "Masshiroi mezame") -- 139
			self:EmitSound("items/medshot4.wav") -- 140
			net.Start("evilrp_autostitcher") -- 141
			net.Send(ply) -- 142
			net.Start("evilrp_music_start") -- 143
			return net.Send(ply) -- 144
		end, -- 146
		Draw = function(self) -- 146
			self:DrawModel() -- 147
			local patient = self:GetPatient() -- 148
			if patient and IsValid(patient) then -- 149
				render.SetMaterial(cable) -- 150
				local pos_start = patient:EyePos() + (patient:GetForward() * 2) + (patient:GetUp() * -16) + (self:GetUp() * 1) -- 151
				local pos_end = self:GetPos() + (self:GetForward() * 6) + (self:GetRight() * 2.4) -- 152
				local ct = CurTime() -- 153
				return render.DrawBeam(pos_start, pos_end, 2 + (1 * math.cos(ct)), math.abs(12 * math.sin(ct * .3)), math.abs(10 * math.cos(ct * .2)), Color(255, 255, 255, 255)) -- 159
			end -- 149
		end, -- 161
		HUDRender = function(self) -- 161
			local ct = { } -- 162
			local patient = self:GetPatient() -- 163
			if lp == patient then -- 164
				ct[#ct + 1] = "Ohh YES!..." -- 165
			else -- 167
				ct[#ct + 1] = "Autostitcher" -- 167
				ct[#ct + 1] = "Charges: " .. tostring(self:GetCharges()) .. "/" .. tostring(self.MaxCharges) -- 168
				if lp:Team() == TEAM_KORPSMAN then -- 169
					ct[#ct + 1] = { -- 170
						text = "Use it with your L.R.D. equipped to recharge it.", -- 170
						font = "Spleen_Label_Small" -- 171
					} -- 170
				else -- 173
					ct[#ct + 1] = { -- 173
						text = "This will heal you for the low price of $" .. tostring(self:CostFor(lp)) .. ".", -- 173
						font = "Spleen_Label_Small" -- 174
					} -- 173
					if self:GetCharges() >= 0 then -- 175
						ct[#ct + 1] = { -- 176
							text = "...or rather, it would heal you if it weren't EMPTY.", -- 176
							font = "Spleen_Label_Small" -- 177
						} -- 176
					end -- 175
				end -- 169
			end -- 164
			return ct -- 178
		end -- 14
	} -- 14
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 178
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 14
			_base_0[_key_0] = _val_0 -- 14
		end -- 14
	end -- 178
	if _base_0.__index == nil then -- 14
		_base_0.__index = _base_0 -- 14
	end -- 178
	setmetatable(_base_0, _parent_0.__base) -- 14
	_class_0 = setmetatable({ -- 14
		__init = function(self, ...) -- 14
			return _class_0.__parent.__init(self, ...) -- 14
		end, -- 14
		__base = _base_0, -- 14
		__name = "Autostitcher", -- 14
		__parent = _parent_0 -- 14
	}, { -- 14
		__index = function(cls, name) -- 14
			local val = rawget(_base_0, name) -- 14
			if val == nil then -- 14
				local parent = rawget(cls, "__parent") -- 14
				if parent then -- 14
					return parent[name] -- 14
				end -- 14
			else -- 14
				return val -- 14
			end -- 14
		end, -- 14
		__call = function(cls, ...) -- 14
			local _self_0 = setmetatable({ }, _base_0) -- 14
			cls.__init(_self_0, ...) -- 14
			return _self_0 -- 14
		end -- 14
	}) -- 14
	_base_0.__class = _class_0 -- 14
	if _parent_0.__inherited then -- 14
		_parent_0.__inherited(_parent_0, _class_0) -- 14
	end -- 14
	Autostitcher = _class_0 -- 14
	return _class_0 -- 178
end -- 178
