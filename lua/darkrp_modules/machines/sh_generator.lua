-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/machines/sh_generator.yue
local noise = Material("effects/tvscreen_noise001a") -- 1
local Generator -- 3
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
				if TEAM_SANITAR == _exp_0 then -- 39
					local rust = self:GetRust() -- 40
					self:SetRust(math.max(0, rust - (dmg:GetDamage() * .2))) -- 41
					local reward = math.floor(math.abs(rust - self:GetRust()) * 2.3) -- 42
					if reward > 0 then -- 43
						return attacker:AddMoney(reward, "The Cleansing") -- 44
					end -- 43
				end -- 45
			end -- 37
		end -- 36
	end, -- 46
	AddPrecursor = function(self, p_type, amt) -- 46
		if not self.precursor_storage[p_type] then -- 47
			self.precursor_storage[p_type] = amt -- 48
		else -- 50
			local _obj_0 = self.precursor_storage -- 50
			_obj_0[p_type] = _obj_0[p_type] + amt -- 50
		end -- 47
		self.precursor_storage[p_type] = math.Clamp(self.precursor_storage[p_type], 0, 50) -- 51
		local _list_0 = ents.FindByClass("machine/*") -- 52
		for _index_0 = 1, #_list_0 do -- 52
			local machine = _list_0[_index_0] -- 52
			if machine.GetGenerator() and machine:GetGenerator() == self then -- 53
				machine:RefreshPrecursor() -- 53
			end -- 53
		end -- 53
	end, -- 55
	Think = function(self) -- 55
		local ct = CurTime() -- 56
		if SERVER then -- 57
			if not self.next_gen_think then -- 58
				self.next_gen_think = ct -- 58
			end -- 58
			local fuel = self:GetFuel() -- 59
			local rust = self:GetRust() -- 60
			local running = self:GetOn() -- 61
			if (self.next_gen_think <= ct) and (fuel > 0) and running then -- 62
				self:SetFuel(math.max(0, fuel - 1)) -- 63
				self:SetRust(math.min(100, rust + math.random(1, 3))) -- 64
				self.next_gen_think = ct + 60 -- 65
				if self:GetFuel() <= 0 then -- 68
					self:StopLoopingSound(self:GetSoundLoop()) -- 69
					self:EmitSound("ambient/machines/spindown.wav") -- 70
					self:SetOn(false) -- 71
				end -- 68
			end -- 62
		end -- 57
		if CLIENT and self:GetOn() then -- 72
			local pos = self:GetPos() + self:GetUp() * 73 + self:GetForward() * 9 + self:GetRight() -- 73
			local ed = EffectData() -- 74
			ed:SetOrigin(pos) -- 76
			ed:SetScale(2) -- 77
			ed:SetNormal(self:GetForward()) -- 78
			return util.Effect("LFR_GeneratorSmoke", ed) -- 79
		end -- 72
	end, -- 81
	RefuelFailure = function(self, fuel, ply, msg) -- 81
		self:SetRust(math.min(100, self:GetRust() + math.random(1, 2))) -- 82
		self:SetFuel(math.min(100, self:GetFuel() + math.floor(fuel.FuelAdd / 2))) -- 83
		fuel:Explode() -- 84
		net.Start("evilrp_machine_fail") -- 85
		net.WriteString(msg) -- 86
		return net.Send(ply) -- 87
	end, -- 89
	Touch = function(self, what) -- 89
		if SERVER then -- 90
			if not (what.FuelAdd and (not what.Processed)) then -- 91
				return -- 91
			end -- 91
			local submitter = what:GetNWEntity("evilrp_submitter", NULL) -- 92
			if not (submitter:IsPlayer() and submitter:CanUseMachines()) then -- 93
				return -- 93
			end -- 93
			local rewarded = 10 -- 94
			local rate = GAMEMODE.taxes.labor / 100 -- 95
			local taxed = math.floor(rewarded * rate) -- 96
			rewarded = rewarded - taxed -- 97
			if taxed > 0 then -- 98
				local _obj_0 = GAMEMODE.taxes_stored -- 98
				_obj_0.labor = _obj_0.labor + taxed -- 98
			end -- 98
			rewarded = math.ceil(rewarded) -- 99
			what.Processed = true -- 100
			what:EmitSound("npc/barnacle/barnacle_gulp" .. tostring(math.random(1, 2)) .. ".wav") -- 101
			local fuel = self:GetFuel() -- 102
			local rust = self:GetRust() -- 103
			if self:GetOn() then -- 104
				self:RefuelFailure(what, submitter, "Oops; this generator was still powered on.") -- 105
				return -- 106
			elseif (rust >= 100) then -- 107
				self:RefuelFailure(what, submitter, "Oops; this generator is painfully rusted.") -- 108
				return -- 109
			elseif (fuel + 9) >= 100 then -- 110
				self:RefuelFailure(what, submitter, "Oops; this generator is at capacity already.") -- 111
				return -- 112
			end -- 104
			self:SetFuel(math.min(100, fuel + what.FuelAdd)) -- 113
			local reward = what.FuelAdd -- 114
			self:EmitSound("ambient/machines/machine1_hit" .. tostring(math.random(1, 2)) .. ".wav") -- 115
			local ed = EffectData() -- 116
			ed:SetStart(self:GetPos()) -- 118
			ed:SetOrigin(self:GetPos()) -- 119
			ed:SetScale(2) -- 120
			util.Effect("StunstickImpact", ed, true, true) -- 121
			submitter:AddMoney(reward, "The Operation") -- 122
			return what:Trash() -- 123
		end -- 90
	end, -- 125
	Use = function(self, ply) -- 125
		local team = ply:Team() -- 126
		if team == TEAM_GHOST then -- 128
			return -- 128
		end -- 128
		local ct = CurTime() -- 129
		if self.NextUse > ct then -- 130
			return -- 130
		end -- 130
		self.NextUse = ct + 1 -- 131
		if not self:GetOn() then -- 132
			local fuel = self:GetFuel() -- 133
			if fuel <= 0 then -- 134
				ply:Notify("<c=200,0,0>There's no fuel.") -- 135
				self:StopLoopingSound(self:GetSoundLoop()) -- 136
				return -- 137
			end -- 134
			self:EmitSound("vehicles/airboat/fan_motor_start1.wav", 75, math.random(90, 110)) -- 138
			return timer.Simple(1, function() -- 139
				self:SetOn(true) -- 140
				ply:Notify("It's on.") -- 141
				self:SetSoundLoop(self:StartLoopingSound("ambient/machines/diesel_engine_idle1.wav")) -- 142
				self.Overload = false -- 143
			end) -- 143
		else -- 145
			self:SetOn(false) -- 145
			self:EmitSound("ambient/machines/spindown.wav", 75, math.random(90, 110)) -- 146
			self:StopLoopingSound(self:GetSoundLoop()) -- 147
			ply:Notify("It's off!") -- 148
			self.Overload = false -- 149
		end -- 132
	end, -- 151
	Draw = function(self) -- 151
		self:DrawModel() -- 152
		return self:Render3D2D() -- 153
	end, -- 155
	Render3D2D = function(self) -- 155
		local dist_sqr = self:GetPos():DistToSqr(lp:GetPos()) -- 156
		if not (dist_sqr < 128 ^ 2) then -- 157
			return -- 157
		end -- 157
		local font = "Spleen_Label" -- 158
		local desp = lp:GetDespair() * 0.01 -- 159
		local ct = CurTime() -- 160
		local pos = self:GetPos() + (self:GetUp() * 64) + (self:GetForward() * -39) + (self:GetRight() * 21.5) -- 161
		local ang = self:GetAngles() -- 162
		ang:RotateAroundAxis(ang:Up(), -90) -- 164
		ang:RotateAroundAxis(ang:Forward(), 90) -- 165
		ang:RotateAroundAxis(ang:Right(), -90) -- 166
		cam.Start3D2D(pos, ang, 0.1) -- 168
		surface.SetMaterial(noise) -- 170
		surface.SetDrawColor(Color(255, 255, 255, 255)) -- 171
		surface.DrawTexturedRect(30, 0, 152, 38) -- 172
		local txt = "Generator" -- 174
		local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 175
		txt_obj:Draw(108, 6, 1, TEXT_ALIGN_CENTER) -- 176
		cam.End3D2D() -- 178
		pos = self:GetPos() + (self:GetUp() * 55) + (self:GetForward() * -48) + (self:GetRight() * 21.5) -- 180
		cam.Start3D2D(pos, ang, 0.1) -- 181
		local fuel = self:GetFuel() -- 182
		txt = tostring(fuel) .. "% fuel" -- 183
		if self:GetOn() == true then -- 184
			txt = "WORKING" -- 185
		elseif fuel < 0 then -- 186
			txt = "EMPTY" -- 187
		elseif fuel >= 100 then -- 188
			txt = "FULL" -- 189
		end -- 184
		surface.SetDrawColor(0, 0, 0, 255) -- 190
		surface.DrawRect(0, 0, 190, 78) -- 191
		local color = Color(200, 0, 0) -- 192
		if self:GetOn() == true then -- 193
			color = Color((fuel * -2) + 200, fuel * 2, 0) -- 195
		end -- 193
		surface.SetDrawColor(color) -- 196
		surface.DrawRect(0, 0, (fuel / 100) * 190, 78) -- 197
		txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt)) -- 198
		txt_obj:Draw(92.5, 24, 1, TEXT_ALIGN_CENTER) -- 199
		return cam.End3D2D() -- 200
	end -- 3
} -- 3
for _key_0, _val_0 in pairs(_parent_0.__base) do -- 200
	if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 3
		_base_0[_key_0] = _val_0 -- 3
	end -- 3
end -- 200
if _base_0.__index == nil then -- 3
	_base_0.__index = _base_0 -- 3
end -- 200
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
return _class_0 -- 200
