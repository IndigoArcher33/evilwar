-- [yue]: darkrp_modules\machines\sh_generator.yue
local noise = Material("effects/tvscreen_noise001a") -- 1
local Generator -- 3
do -- 3
	local _class_0 -- 3
	local _parent_0 = ENTITY -- 3
	local _base_0 = { -- 3
		Base = "base_anim", -- 5
		Type = "anim", -- 6
		PrintName = "Generator", -- 7
		Spawnable = true, -- 8
		AdminSpawnable = true, -- 9
		Interesting = true, -- 11
		Pocketable = false, -- 13
		SetupDataTables = function(self) -- 13
			self:NetworkVar("Float", "Fuel") -- 14
			self:NetworkVar("Float", "Rust") -- 15
			self:NetworkVar("Bool", "On") -- 16
			self:NetworkVar("Int", "SoundLoop") -- 17
			return self:NetworkVar("String", "FactoryIdentifier") -- 18
		end, -- 20
		Initialize = function(self) -- 20
			if CLIENT then -- 21
				return -- 21
			end -- 21
			self:SetUseType(SIMPLE_USE) -- 22
			self:SetModel("models/props_vehicles/generatortrailer01.mdl") -- 23
			self:PhysicsInit(SOLID_VPHYSICS) -- 24
			self:PhysWake() -- 25
			self:SetOn(false) -- 27
			self:SetFuel(math.random(0, 30)) -- 28
			self:SetRust(0) -- 29
			self.NextUse = 0 -- 30
			self.Overload = false -- 31
			self.precursor_storage = { } -- 32
		end, -- 34
		OnTakeDamage = function(self, dmg) -- 34
			local attacker = dmg:GetAttacker() -- 35
			if attacker and IsValid(attacker) then -- 36
				if attacker:IsPlayer() then -- 37
					local _exp_0 = attacker:Team() -- 38
					if TEAM_KORPSMAN == _exp_0 or TEAM_CONSCRIPT == _exp_0 then -- 39
						local rust = self:GetRust() -- 40
						self:SetRust(math.max(0, rust - (dmg:GetDamage() * .2))) -- 41
						local reward = math.floor(math.abs(rust - self:GetRust()) * 1) -- 42
						if reward > 0 then -- 43
							attacker:AddMoney(reward, "The Cleansing") -- 44
							return attacker:SetHealth(attacker:Health() + 6) -- 45
						end -- 43
					end -- 46
				end -- 37
			end -- 36
		end, -- 47
		AddPrecursor = function(self, p_type, amt) -- 47
			if not self.precursor_storage[p_type] then -- 48
				self.precursor_storage[p_type] = amt -- 49
			else -- 51
				local _obj_0 = self.precursor_storage -- 51
				_obj_0[p_type] = _obj_0[p_type] + amt -- 51
			end -- 48
			self.precursor_storage[p_type] = math.Clamp(self.precursor_storage[p_type], 0, 50) -- 52
			local _list_0 = ents.FindByClass("machine/*") -- 53
			for _index_0 = 1, #_list_0 do -- 53
				local machine = _list_0[_index_0] -- 53
				if machine.GetGenerator() and machine:GetGenerator() == self then -- 54
					machine:RefreshPrecursor() -- 54
				end -- 54
			end -- 54
		end, -- 56
		Think = function(self) -- 56
			local ct = CurTime() -- 57
			if SERVER then -- 58
				if not self.next_gen_think then -- 59
					self.next_gen_think = ct -- 59
				end -- 59
				local fuel = self:GetFuel() -- 60
				local rust = self:GetRust() -- 61
				local running = self:GetOn() -- 62
				if (self.next_gen_think <= ct) and (fuel > 0) and running then -- 63
					self:SetFuel(math.max(0, fuel - 1)) -- 64
					self:SetRust(math.min(100, rust + math.random(1, 3))) -- 65
					self.next_gen_think = ct + 60 -- 66
					if self:GetFuel() <= 0 then -- 69
						self:StopLoopingSound(self:GetSoundLoop()) -- 70
						self:EmitSound("ambient/machines/spindown.wav") -- 71
						self:SetOn(false) -- 72
					end -- 69
				end -- 63
			end -- 58
			if CLIENT and self:GetOn() then -- 73
				local pos = self:GetPos() + self:GetUp() * 73 + self:GetForward() * 9 + self:GetRight() -- 74
				local ed = EffectData() -- 75
				ed:SetOrigin(pos) -- 77
				ed:SetScale(2) -- 78
				ed:SetNormal(self:GetForward()) -- 79
				return util.Effect("LFR_GeneratorSmoke", ed) -- 80
			end -- 73
		end, -- 82
		RefuelFailure = function(self, fuel, ply, msg) -- 82
			self:SetRust(math.min(100, self:GetRust() + math.random(1, 2))) -- 83
			self:SetFuel(math.min(100, self:GetFuel() + math.floor(fuel.FuelAdd / 2))) -- 84
			fuel:Explode() -- 85
			net.Start("evilrp_machine_fail") -- 86
			net.WriteString(msg) -- 87
			return net.Send(ply) -- 88
		end, -- 90
		Touch = function(self, what) -- 90
			if SERVER then -- 91
				if not (what.FuelAdd and (not what.Processed)) then -- 92
					return -- 92
				end -- 92
				local submitter = what:GetNWEntity("evilrp_submitter", NULL) -- 93
				if not (submitter:IsPlayer() and submitter:CanUseMachines()) then -- 94
					return -- 94
				end -- 94
				local rewarded = 10 -- 95
				local rate = GAMEMODE.taxes.labor / 100 -- 96
				local taxed = math.floor(rewarded * rate) -- 97
				rewarded = rewarded - taxed -- 98
				if taxed > 0 then -- 99
					local _obj_0 = GAMEMODE.taxes_stored -- 99
					_obj_0.labor = _obj_0.labor + taxed -- 99
				end -- 99
				rewarded = math.ceil(rewarded) -- 100
				what.Processed = true -- 101
				what:EmitSound("npc/barnacle/barnacle_gulp" .. tostring(math.random(1, 2)) .. ".wav") -- 102
				local fuel = self:GetFuel() -- 103
				local rust = self:GetRust() -- 104
				if self:GetOn() then -- 105
					self:RefuelFailure(what, submitter, "Oops; this generator was still powered on.") -- 106
					return -- 107
				elseif (rust >= 100) then -- 108
					self:RefuelFailure(what, submitter, "Oops; this generator is painfully rusted.") -- 109
					return -- 110
				elseif (fuel + 9) >= 100 then -- 111
					self:RefuelFailure(what, submitter, "Oops; this generator is at capacity already.") -- 112
					return -- 113
				end -- 105
				self:SetFuel(math.min(100, fuel + what.FuelAdd)) -- 114
				local reward = what.FuelAdd -- 115
				self:EmitSound("ambient/machines/machine1_hit" .. tostring(math.random(1, 2)) .. ".wav") -- 116
				local ed = EffectData() -- 117
				ed:SetStart(self:GetPos()) -- 119
				ed:SetOrigin(self:GetPos()) -- 120
				ed:SetScale(2) -- 121
				util.Effect("StunstickImpact", ed, true, true) -- 122
				submitter:AddMoney(reward, "The Operation") -- 123
				return what:Trash() -- 124
			end -- 91
		end, -- 126
		Use = function(self, ply) -- 126
			local team = ply:Team() -- 127
			if team == TEAM_GHOST then -- 129
				return -- 129
			end -- 129
			local ct = CurTime() -- 130
			if self.NextUse > ct then -- 131
				return -- 131
			end -- 131
			self.NextUse = ct + 1 -- 132
			if not self:GetOn() then -- 133
				local fuel = self:GetFuel() -- 134
				if fuel <= 0 then -- 135
					ply:Notify("<c=200,0,0>There's no fuel.") -- 136
					self:StopLoopingSound(self:GetSoundLoop()) -- 137
					return -- 138
				end -- 135
				self:EmitSound("vehicles/airboat/fan_motor_start1.wav", 75, math.random(90, 110)) -- 139
				return timer.Simple(1, function() -- 140
					self:SetOn(true) -- 141
					ply:Notify("It's on.") -- 142
					self:SetSoundLoop(self:StartLoopingSound("ambient/machines/diesel_engine_idle1.wav")) -- 143
					self.Overload = false -- 144
				end) -- 144
			else -- 146
				self:SetOn(false) -- 146
				self:EmitSound("ambient/machines/spindown.wav", 75, math.random(90, 110)) -- 147
				self:StopLoopingSound(self:GetSoundLoop()) -- 148
				ply:Notify("It's off!") -- 149
				self.Overload = false -- 150
			end -- 133
		end, -- 152
		Draw = function(self) -- 152
			self:DrawModel() -- 153
			return self:Render3D2D() -- 154
		end, -- 156
		Render3D2D = function(self) -- 156
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 157
			if not (dist_sqr < 128 ^ 2) then -- 158
				return -- 158
			end -- 158
			local font = "Spleen_Label" -- 159
			local desp = lp:GetDespair() * 0.01 -- 160
			local ct = CurTime() -- 161
			local pos = self:GetPos() + (self:GetUp() * 64) + (self:GetForward() * -39) + (self:GetRight() * 21.5) -- 162
			local ang = self:GetAngles() -- 163
			ang:RotateAroundAxis(ang:Up(), -90) -- 165
			ang:RotateAroundAxis(ang:Forward(), 90) -- 166
			ang:RotateAroundAxis(ang:Right(), -90) -- 167
			cam.Start3D2D(pos, ang, 0.1) -- 169
			surface.SetMaterial(noise) -- 171
			surface.SetDrawColor(Color(255, 255, 255, 255)) -- 172
			surface.DrawTexturedRect(30, 0, 152, 38) -- 173
			local txt = "Generator" -- 175
			local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 176
			txt_obj:Draw(108, 6, 1, TEXT_ALIGN_CENTER) -- 177
			cam.End3D2D() -- 179
			pos = self:GetPos() + (self:GetUp() * 55) + (self:GetForward() * -48) + (self:GetRight() * 21.5) -- 181
			cam.Start3D2D(pos, ang, 0.1) -- 182
			local fuel = self:GetFuel() -- 183
			txt = tostring(fuel) .. "% fuel" -- 184
			if self:GetOn() == true then -- 185
				txt = "WORKING" -- 186
			elseif fuel < 0 then -- 187
				txt = "EMPTY" -- 188
			elseif fuel >= 100 then -- 189
				txt = "FULL" -- 190
			end -- 185
			surface.SetDrawColor(0, 0, 0, 255) -- 191
			surface.DrawRect(0, 0, 190, 78) -- 192
			local color = Color(200, 0, 0) -- 193
			if self:GetOn() == true then -- 194
				color = Color((fuel * -2) + 200, fuel * 2, 0) -- 196
			end -- 194
			surface.SetDrawColor(color) -- 197
			surface.DrawRect(0, 0, (fuel / 100) * 190, 78) -- 198
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 199
			txt_obj:Draw(92.5, 24, 1, TEXT_ALIGN_CENTER) -- 200
			return cam.End3D2D() -- 201
		end -- 3
	} -- 3
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 201
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 3
			_base_0[_key_0] = _val_0 -- 3
		end -- 3
	end -- 201
	if _base_0.__index == nil then -- 3
		_base_0.__index = _base_0 -- 3
	end -- 201
	setmetatable(_base_0, _parent_0.__base) -- 3
	_class_0 = setmetatable({ -- 3
		__init = function(self, ...) -- 3
			return _class_0.__parent.__init(self, ...) -- 3
		end, -- 3
		__base = _base_0, -- 3
		__name = "Generator", -- 3
		__parent = _parent_0 -- 3
	}, { -- 3
		__index = function(cls, name) -- 3
			local val = rawget(_base_0, name) -- 3
			if val == nil then -- 3
				local parent = rawget(cls, "__parent") -- 3
				if parent then -- 3
					return parent[name] -- 3
				end -- 3
			else -- 3
				return val -- 3
			end -- 3
		end, -- 3
		__call = function(cls, ...) -- 3
			local _self_0 = setmetatable({ }, _base_0) -- 3
			cls.__init(_self_0, ...) -- 3
			return _self_0 -- 3
		end -- 3
	}) -- 3
	_base_0.__class = _class_0 -- 3
	if _parent_0.__inherited then -- 3
		_parent_0.__inherited(_parent_0, _class_0) -- 3
	end -- 3
	Generator = _class_0 -- 3
	return _class_0 -- 201
end -- 201
