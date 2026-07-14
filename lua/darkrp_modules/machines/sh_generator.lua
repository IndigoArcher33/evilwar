local noise = Material("effects/tvscreen_noise001a")
local Generator
do
	local _class_0
	local _parent_0 = ENTITY
	local _base_0 = {
		Base = "base_anim",
		Type = "anim",
		PrintName = "Generator",
		Spawnable = true,
		AdminSpawnable = true,
		Interesting = true,
		Pocketable = false,
		SetupDataTables = function(self)
			self:NetworkVar("Float", "Fuel")
			self:NetworkVar("Float", "Rust")
			self:NetworkVar("Bool", "On")
			self:NetworkVar("Int", "SoundLoop")
			return self:NetworkVar("String", "FactoryIdentifier")
		end,
		Initialize = function(self)
			if CLIENT then
				return
			end
			self:SetUseType(SIMPLE_USE)
			self:SetModel("models/props_vehicles/generatortrailer01.mdl")
			self:PhysicsInit(SOLID_VPHYSICS)
			self:PhysWake()
			self:SetOn(false)
			self:SetFuel(math.random(0, 30))
			self:SetRust(0)
			self.NextUse = 0
			self.Overload = false
			self.precursor_storage = { }
		end,
		OnTakeDamage = function(self, dmg)
			local attacker = dmg:GetAttacker()
			if attacker and IsValid(attacker) then
				if attacker:IsPlayer() then
					local _exp_0 = attacker:Team()
					if TEAM_SANITAR == _exp_0 then
						local rust = self:GetRust()
						self:SetRust(math.max(0, rust - (dmg:GetDamage() * .2)))
						local reward = math.floor(math.abs(rust - self:GetRust()) * 2.3)
						if reward > 0 then
							return attacker:AddMoney(reward, "The Cleansing")
						end
					end
				end
			end
		end,
		AddPrecursor = function(self, p_type, amt)
			if not self.precursor_storage[p_type] then
				self.precursor_storage[p_type] = amt
			else
				local _obj_0 = self.precursor_storage
				_obj_0[p_type] = _obj_0[p_type] + amt
			end
			self.precursor_storage[p_type] = math.Clamp(self.precursor_storage[p_type], 0, 50)
			local _list_0 = ents.FindByClass("machine/*")
			for _index_0 = 1, #_list_0 do
				local machine = _list_0[_index_0]
				if machine.GetGenerator() and machine:GetGenerator() == self then
					machine:RefreshPrecursor()
				end
			end
		end,
		Think = function(self)
			local ct = CurTime()
			if SERVER then
				if not self.next_gen_think then
					self.next_gen_think = ct
				end
				local fuel = self:GetFuel()
				local rust = self:GetRust()
				local running = self:GetOn()
				if (self.next_gen_think <= ct) and (fuel > 0) and running then
					self:SetFuel(math.max(0, fuel - 1))
					self:SetRust(math.min(100, rust + math.random(1, 3)))
					self.next_gen_think = ct + 60
					if self:GetFuel() <= 0 then
						self:StopLoopingSound(self:GetSoundLoop())
						self:EmitSound("ambient/machines/spindown.wav")
						self:SetOn(false)
					end
				end
			end
			if CLIENT and self:GetOn() then
				local pos = self:GetPos() + self:GetUp() * 73 + self:GetForward() * 9 + self:GetRight()
				local ed = EffectData()
				ed:SetOrigin(pos)
				ed:SetScale(2)
				ed:SetNormal(self:GetForward())
				return util.Effect("LFR_GeneratorSmoke", ed)
			end
		end,
		RefuelFailure = function(self, fuel, ply, msg)
			self:SetRust(math.min(100, self:GetRust() + math.random(1, 2)))
			self:SetFuel(math.min(100, self:GetFuel() + math.floor(fuel.FuelAdd / 2)))
			fuel:Explode()
			net.Start("evilrp_machine_fail")
			net.WriteString(msg)
			return net.Send(ply)
		end,
		Touch = function(self, what)
			if SERVER then
				if not (what.FuelAdd and (not what.Processed)) then
					return
				end
				local submitter = what:GetNWEntity("evilrp_submitter", NULL)
				if not (submitter:IsPlayer() and submitter:CanUseMachines()) then
					return
				end
				local rewarded = 10
				local rate = GAMEMODE.taxes.labor / 100
				local taxed = math.floor(rewarded * rate)
				rewarded = rewarded - taxed
				if taxed > 0 then
					local _obj_0 = GAMEMODE.taxes_stored
					_obj_0.labor = _obj_0.labor + taxed
				end
				rewarded = math.ceil(rewarded)
				what.Processed = true
				what:EmitSound("npc/barnacle/barnacle_gulp" .. tostring(math.random(1, 2)) .. ".wav")
				local fuel = self:GetFuel()
				local rust = self:GetRust()
				if self:GetOn() then
					self:RefuelFailure(what, submitter, "Oops; this generator was still powered on.")
					return
				elseif (rust >= 100) then
					self:RefuelFailure(what, submitter, "Oops; this generator is painfully rusted.")
					return
				elseif (fuel + 9) >= 100 then
					self:RefuelFailure(what, submitter, "Oops; this generator is at capacity already.")
					return
				end
				self:SetFuel(math.min(100, fuel + what.FuelAdd))
				local reward = what.FuelAdd
				self:EmitSound("ambient/machines/machine1_hit" .. tostring(math.random(1, 2)) .. ".wav")
				local ed = EffectData()
				ed:SetStart(self:GetPos())
				ed:SetOrigin(self:GetPos())
				ed:SetScale(2)
				util.Effect("StunstickImpact", ed, true, true)
				submitter:AddMoney(reward, "The Operation")
				return what:Trash()
			end
		end,
		Use = function(self, ply)
			local team = ply:Team()
			if team == TEAM_GHOST then
				return
			end
			local ct = CurTime()
			if self.NextUse > ct then
				return
			end
			self.NextUse = ct + 1
			if not self:GetOn() then
				local fuel = self:GetFuel()
				if fuel <= 0 then
					ply:Notify("<c=200,0,0>There's no fuel.")
					self:StopLoopingSound(self:GetSoundLoop())
					return
				end
				self:EmitSound("vehicles/airboat/fan_motor_start1.wav", 75, math.random(90, 110))
				return timer.Simple(1, function()
					self:SetOn(true)
					ply:Notify("It's on.")
					self:SetSoundLoop(self:StartLoopingSound("ambient/machines/diesel_engine_idle1.wav"))
					self.Overload = false
				end)
			else
				self:SetOn(false)
				self:EmitSound("ambient/machines/spindown.wav", 75, math.random(90, 110))
				self:StopLoopingSound(self:GetSoundLoop())
				ply:Notify("It's off!")
				self.Overload = false
			end
		end,
		Draw = function(self)
			self:DrawModel()
			return self:Render3D2D()
		end,
		Render3D2D = function(self)
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos())
			if not (dist_sqr < 128 ^ 2) then
				return
			end
			local font = "Spleen_Label"
			local desp = lp:GetDespair() * 0.01
			local ct = CurTime()
			local pos = self:GetPos() + (self:GetUp() * 64) + (self:GetForward() * -39) + (self:GetRight() * 21.5)
			local ang = self:GetAngles()
			ang:RotateAroundAxis(ang:Up(), -90)
			ang:RotateAroundAxis(ang:Forward(), 90)
			ang:RotateAroundAxis(ang:Right(), -90)
			cam.Start3D2D(pos, ang, 0.1)
			surface.SetMaterial(noise)
			surface.SetDrawColor(Color(255, 255, 255, 255))
			surface.DrawTexturedRect(30, 0, 152, 38)
			local txt = "Generator"
			local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt))
			txt_obj:Draw(108, 6, 1, TEXT_ALIGN_CENTER)
			cam.End3D2D()
			pos = self:GetPos() + (self:GetUp() * 55) + (self:GetForward() * -48) + (self:GetRight() * 21.5)
			cam.Start3D2D(pos, ang, 0.1)
			local fuel = self:GetFuel()
			txt = tostring(fuel) .. "% fuel"
			if self:GetOn() == true then
				txt = "WORKING"
			elseif fuel < 0 then
				txt = "EMPTY"
			elseif fuel >= 100 then
				txt = "FULL"
			end
			surface.SetDrawColor(0, 0, 0, 255)
			surface.DrawRect(0, 0, 190, 78)
			local color = Color(200, 0, 0)
			if self:GetOn() == true then
				color = Color((fuel * -2) + 200, fuel * 2, 0)
			end
			surface.SetDrawColor(color)
			surface.DrawRect(0, 0, (fuel / 100) * 190, 78)
			txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt))
			txt_obj:Draw(92.5, 24, 1, TEXT_ALIGN_CENTER)
			return cam.End3D2D()
		end
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Generator",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Generator = _class_0
	return _class_0
end
