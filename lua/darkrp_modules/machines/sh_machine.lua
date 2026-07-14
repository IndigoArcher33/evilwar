local button0 = Material("icon16/lightbulb_off.png")
local button1 = Material("icon16/exclamation.png")
local button2 = Material("icon16/cancel.png")
local button3 = Material("icon16/delete.png")
local default_button = Material("sprites/glow04_noz_gmod")
local default0 = Material("sprites/glow04_noz")
local colors = {
	Color(150, 150, 150),
	Color(0, 255, 0),
	Color(0, 0, 255)
}
local MachineDing
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = {
			"buttons/blip1.wav",
			"buttons/button1.wav",
			"buttons/button3.wav",
			"buttons/button5.wav",
			"buttons/button9.wav",
			"buttons/button14.wav",
			"buttons/button16.wav",
			"buttons/button17.wav",
			"buttons/button18.wav"
		},
		pitch = {
			75,
			95
		},
		level = SNDLVL_75DB
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
		__name = "MachineDing",
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
	MachineDing = _class_0
end
local MachineBite
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = {
			"npc/headcrab_poison/ph_poisonbite2.wav",
			"npc/headcrab_poison/ph_poisonbite1.wav",
			"npc/headcrab_poison/ph_warning1.wav",
			"npc/headcrab_poison/ph_warning2.wav",
			"npc/headcrab_poison/ph_warning3.wav",
			"npc/headcrab_fast/headbite.wav",
			"npc/barnacle/barnacle_crunch2.wav",
			"npc/barnacle/barnacle_crunch3.wav"
		},
		pitch = {
			75,
			90
		}
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
		__name = "MachineBite",
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
	MachineBite = _class_0
end
local noise = Material("effects/tvscreen_noise001a")
local screen = Material("glass/glasswindow017a")
if CLIENT then
	net.Receive("evilrp_machine_fail", function()
		local text = net.ReadString()
		GAMEMODE:Frighten()
		return chat.AddNonParsedText(Color(200, 0, 0, 255), text)
	end)
else
	util.AddNetworkString("evilrp_machine_fail")
end
local Machine
do
	local _class_0
	local _parent_0 = ENTITY
	local _base_0 = {
		Base = "base_anim",
		Type = "anim",
		PrintName = "Machine",
		Category = "EvilRP: Machines",
		Spawnable = true,
		AdminSpawnable = true,
		Interesting = true,
		Pocketable = false,
		Precursors = { },
		FactoryIdentifier = "",
		SetupDataTables = function(self)
			self:NetworkVar("String", "Producing")
			self:NetworkVar("String", "Selection")
			self:NetworkVar("Int", "ProductionStart")
			self:NetworkVar("Int", "ProductionEnd")
			self:NetworkVar("Int", "SoundLoop")
			self:NetworkVar("Int", "Rust")
			self:NetworkVar("Int", "CorrectLight")
			self:NetworkVar("Int", "QueuedItems")
			for i = 1, 8 do
				self:NetworkVar("Int", 8 + i, "Button" .. i)
				self["SetButton" .. i](self, math.random(1, 3))
			end
			local _list_0 = self.Precursors
			for _index_0 = 1, #_list_0 do
				local p = _list_0[_index_0]
				local name = p.name
				name = tostring(name:sub(1, 1):upper()) .. tostring(name:sub(2, -1))
				self:NetworkVar("Int", "Precursor" .. tostring(name))
			end
			self:NetworkVar("Entity", "Worker")
			return self:NetworkVar("Entity", "Generator")
		end,
		RefreshPrecursor = function(self)
			local gen = self:GetGenerator()
			if gen and IsValid(gen) then
				local _list_0 = self.Precursors
				for _index_0 = 1, #_list_0 do
					local p = _list_0[_index_0]
					local name = p.name
					name = tostring(name:sub(1, 1):upper()) .. tostring(name:sub(2, -1))
					self["SetPrecursor" .. tostring(name)](self, gen.precursor_storage[name:lower()] or 0)
				end
			end
		end,
		Initialize = function(self)
			self:PositionButtons()
			if CLIENT then
				return
			end
			local _list_0 = ents.FindByClass("generator")
			for _index_0 = 1, #_list_0 do
				local gen = _list_0[_index_0]
				if gen:GetFactoryIdentifier() == self.FactoryIdentifier then
					self:SetGenerator(gen)
					MsgC(Color(0, 200, 0), tostring(self) .. " attached to " .. tostring(gen) .. ".\n")
					break
				end
			end
			local gen = self:GetGenerator()
			if not (gen and IsValid(gen)) then
				return
			end
			for i = 1, 8 do
				self["SetButton" .. tostring(i)](self, math.random(1, 3))
			end
			self:SetUseType(SIMPLE_USE)
			self:SetModel("models/props_lab/reciever_cart.mdl")
			self:PhysicsInit(SOLID_VPHYSICS)
			self:PhysWake()
			return self:NewLight()
		end,
		PositionButtons = function(self)
			local pos = self:GetPos()
			local f = self:GetForward()
			local r = self:GetRight()
			local u = self:GetUp()
			self.buttons = {
				{
					pos + u * 18 + f * 13 + r * 6
				},
				{
					pos + u * 18 + f * 13 + r * 3
				},
				{
					pos + u * 18 + f * 13
				},
				{
					pos + u * 18 + f * 13 + r * -3
				},
				{
					pos + u * 18 + f * 13 + r * -6
				},
				{
					pos + u * 18 + f * 13 + r * -9
				},
				{
					pos + u * 18 + f * 13 + r * -12
				},
				{
					pos + u * 18 + f * 13 + r * -15
				}
			}
		end,
		Think = function(self)
			if CLIENT then
				return
			end
			if self:GetSelection() ~= "" and self:GetCorrectLight() == 0 then
				self:NewLight()
			end
			local ct = CurTime()
			if not self.NextMatRefresh then
				self.NextMatRefresh = ct
			end
			if ct >= self.NextMatRefresh then
				self.NextMatRefresh = ct + 5
				self:RefreshPrecursor()
			end
			if self:GetProductionEnd() == 0 and self:GetQueuedItems() > 0 then
				local found = nil
				local ks = table.GetKeys(self.Products)
				for i = 1, #ks do
					local k = ks[math.random(1, #ks)]
					if not self.Products[k] then
						goto _continue_0
					end
					if table.IsEmpty(self.Products[k]) then
						goto _continue_0
					end
					table.RemoveByValue(ks, k)
					if GAMEMODE.Stocks[k] then
					end
					local nope = false
					for t, amt in pairs(self.Products[k].precursors) do
						local name = tostring(t:sub(1, 1):upper()) .. tostring(t:sub(2, -1))
						if amt > self["GetPrecursor" .. tostring(name)](self) then
							nope = true
							break
						end
					end
					if nope then
						goto _continue_0
					end
					found = k
					ks = nil
					break
					::_continue_0::
				end
				if not found then
					self:SetQueuedItems(0)
					util.ScreenShake(self:GetPos(), 25, 150, 1, 750)
					local explo = ents.Create("env_explosion")
					explo:SetOwner(self)
					explo:SetPos(self:GetPos())
					explo:SetKeyValue("iMagnitude", 75)
					explo:SetKeyValue("iRadiusOverride", 150)
					explo:Spawn()
					explo:Activate()
					explo:Fire("Explode")
					local fire = ents.Create("env_fire")
					fire:SetPos(self:GetPos())
					fire:SetKeyValue("spawnflags", 1)
					fire:SetKeyValue("attack", tostring(math.random(10, 15)))
					fire:SetKeyValue("firesize", tostring(math.random(100, 150)))
					fire:Spawn()
					fire:Activate()
					fire:Fire("Enable", "", del)
					fire:Fire("StartFire", "", del)
					SafeRemoveEntityDelayed(fire, math.random(60, 70))
					self:GetGenerator().Overload = true
				else
					self:SetQueuedItems(math.max(0, self:GetQueuedItems() - 1))
					self:SetProducing(found)
					for t, amt in pairs(self.Products[found].precursors) do
						self:GetGenerator():AddPrecursor(t, -amt)
					end
					self:SetProductionStart(CurTime())
					self:SetProductionEnd(CurTime() + self.Products[found].time)
				end
			end
			if self:GetProductionEnd() > 0 and CurTime() >= self:GetProductionEnd() then
				self:SetRust(math.min(100, self:GetRust() + self.Products[self:GetProducing()].time))
				self:ProduceItem(self:GetProducing())
				self:EmitSound("ambient/machines/machine1_hit" .. tostring(math.random(1, 2)) .. ".wav")
				self:StopLoopingSound(self:GetSoundLoop())
				self:SetProducing("")
				self:SetProductionStart(0)
				return self:SetProductionEnd(0)
			end
		end,
		ProduceItem = function(self, item)
			return GAMEMODE:AddStock(item)
		end,
		Touch = function(self, what)
			if SERVER then
				if not what.Precursor then
					return
				end
				local pre, amt
				local _list_0 = self.Precursors
				for _index_0 = 1, #_list_0 do
					local p = _list_0[_index_0]
					for k, v in pairs(what.Precursor) do
						if p.name == k then
							pre = k
							amt = v
							if isfunction(amt) then
								amt = amt(self)
							end
							break
						end
					end
				end
				if not (pre and amt) then
					return
				end
				local rewarded = false
				local submitter = what:GetNWEntity("evilrp_submitter", NULL)
				if not what.Processed then
					what.Processed = true
					if what.SubmitSound then
						what:EmitSound(what.SubmitSound)
					end
					self:GetGenerator():AddPrecursor(pre, amt)
					if what.Submitted then
						what.Submitted(what)
					end
					local reward = math.random(10, 15) * amt
					local rate = GAMEMODE.taxes.labor / 100
					local taxed = math.floor(reward * rate)
					reward = reward - taxed
					if taxed > 0 then
						local _obj_0 = GAMEMODE.taxes_stored
						_obj_0.labor = _obj_0.labor + taxed
					end
					reward = math.ceil(reward)
					if submitter and IsValid(submitter) and submitter:IsPlayer() and submitter:Alive() then
						submitter:AddMoney(reward, "The Operation")
					else
						if reward > 0 then
							local _obj_0 = GAMEMODE.taxes_stored
							_obj_0.labor = _obj_0.labor + reward
						end
					end
					what:Remove()
					if submitter and IsValid(submitter) and submitter:IsPlayer() and submitter:Team() == TEAM_PROLETARIAT then
						submitter.precursor_supplied = submitter.precursor_supplied or 0
						submitter.precursor_supplied = submitter.precursor_supplied + amt
						if submitter.precursor_supplied_difference and (submitter.precursor_supplied % 50) < submitter.precursor_supplied_difference then
							submitter:Notify("<c=0,200,0>Your work ethic makes Liver Failure proud.")
							submitter:AddStemCells(1)
						end
						submitter.precursor_supplied_difference = submitter.precursor_supplied % 50
					end
				end
			end
		end,
		Draw = function(self)
			self:DrawModel()
			local gen = self:GetGenerator()
			if gen and IsValid(gen) then
				if not gen:GetOn() then
					return
				end
			end
			local closest = self:GetNearestButton()
			local pos = self:GetPos()
			local f = self:GetForward()
			local r = self:GetRight()
			local u = self:GetUp()
			local light_spots = {
				{
					pos + u * 0.5 + f * 14.5 + r * -1,
					Color(150, 150, 150),
					"r",
					button1
				},
				{
					pos + u * 0.5 + f * 14.5 + r * -6,
					Color(0, 150, 0),
					"g",
					button2
				},
				{
					pos + u * 0.5 + f * 14.5 + r * -11.5,
					Color(0, 0, 150),
					"b",
					button3
				}
			}
			local idx = 0
			local ct = CurTime()
			for _index_0 = 1, #light_spots do
				local light = light_spots[_index_0]
				idx = idx + 1
				local g, b
				do
					local _obj_0 = light[2]
					r, g, b = _obj_0.r, _obj_0.g, _obj_0.b
				end
				local col = Color(r, g, b, 255)
				render.SetMaterial(light[4])
				if self:GetCorrectLight() == idx then
					render.DrawSprite(light[1], 4 + math.abs(math.sin(ct) * 4), 4 + math.abs(math.sin(ct) * 4), col)
				else
					render.DrawSprite(light[1], 4, 4, col)
				end
			end
			for k, v in ipairs(self.buttons) do
				idx = self["GetButton" .. tostring(k)](self)
				local mats = {
					button1,
					button2,
					button3
				}
				local col
				if idx == 0 then
					render.SetMaterial(default0)
					col = Color(100, 100, 100, 255)
				else
					render.SetMaterial(mats[idx])
					col = colors[idx]
					if k == closest then
						r = math.max(0, col.r + (50 * math.sin(ct * 3)))
						local g = math.max(0, col.g + (50 * math.sin(ct * 3)))
						local b = math.max(0, col.b + (50 * math.sin(ct * 3)))
						col = Color(r, g, b)
					else
						r = math.max(0, col.r + (100 * math.cos(ct)))
						local g = math.max(0, col.g + (100 * math.cos(ct)))
						local b = math.max(0, col.b + (100 * math.cos(ct)))
						col = Color(r, g, b)
					end
				end
				render.DrawSprite(v[1], 4, 4, col)
			end
			return self:Render3D2D()
		end,
		OnTakeDamage = function(self, dmg)
			local attacker = dmg:GetAttacker()
			if attacker and IsValid(attacker) then
				if attacker:IsPlayer() then
					local _exp_0 = attacker:Team()
					if TEAM_SANITAR == _exp_0 then
						local rust = self:GetRust()
						self:SetRust(math.max(0, rust - (dmg:GetDamage() * .2)))
						local reward = math.floor(math.abs(rust - self:GetRust()) * 3)
						if reward > 0 then
							return attacker:AddMoney(reward, "The Cleansing")
						end
					end
				end
			end
		end,
		Use = function(self, ply)
			local gen = self:GetGenerator()
			if gen and not gen:GetOn() then
				net.Start("evilrp_machine_fail")
				net.WriteString("There's no power.")
				net.Send(ply)
				return
			elseif not ply:CanUseMachines() then
				net.Start("evilrp_machine_fail")
				net.WriteString("UNAUTHORIZED PERSONNEL")
				net.Send(ply)
				self:EmitSound("ambient/alarms/klaxon1.wav")
				timer.Simple(1, function()
					local tr = util.TraceLine({
						start = self:GetPos(),
						endpos = ply:EyePos(),
						filter = self
					})
					util.ParticleTracerEx("vortigaunt_beam", tr.StartPos, tr.HitPos, false, self:EntIndex(), 3)
					self:EmitSound("beams/beamstart5.wav")
					local dmg = DamageInfo()
					dmg:SetDamage(65)
					dmg:SetDamageType(DMG_SHOCK)
					dmg:SetAttacker(self)
					dmg:SetInflictor(self)
					dmg:SetDamagePosition(ply:EyePos())
					return ply:TakeDamageInfo(dmg)
				end)
				return
			end
			if self:GetRust() >= 100 and math.random(1, 3) == 1 then
				self:EmitSound("MachineBite")
				ply:TakeDamage(math.random(4, 6))
				if math.random(1, 4) == 1 then
					self:Ignite(math.random(3, 6), 510)
				end
			end
			local button = self:GetNearestButton(ply)
			if button then
				if button > 0 then
					local idx = self["GetButton" .. tostring(button)](self)
					if idx ~= self:GetCorrectLight() and idx > 0 then
						self:EmitSound("ambient/alarms/klaxon1.wav")
						return timer.Simple(1, function()
							local tr = util.TraceLine({
								start = self:GetPos(),
								endpos = ply:EyePos(),
								filter = self
							})
							util.ParticleTracerEx("vortigaunt_beam", tr.StartPos, tr.HitPos, false, self:EntIndex(), 3)
							self:EmitSound("beams/beamstart5.wav")
							local dmg = DamageInfo()
							dmg:SetDamage(25)
							dmg:SetDamageType(DMG_SHOCK)
							dmg:SetAttacker(self)
							dmg:SetInflictor(self)
							dmg:SetDamagePosition(ply:EyePos())
							return ply:TakeDamageInfo(dmg)
						end)
					elseif idx == 0 then
						return self:EmitSound("buttons/button2.wav", 75, math.random(75, 95))
					else
						self:EmitSound("MachineDing")
						local left = false
						self["SetButton" .. tostring(button)](self, 0)
						for k, v in ipairs(self.buttons) do
							if self["GetButton" .. tostring(k)](self) == idx then
								left = true
							end
						end
						local reward = 5
						local rate = GAMEMODE.taxes.labor / 100
						local taxed = math.floor(reward * rate)
						reward = reward - taxed
						if taxed > 0 then
							local _obj_0 = GAMEMODE.taxes_stored
							_obj_0.labor = _obj_0.labor + taxed
						end
						if gen.Overload then
							self:EmitSound("ambient/energy/zap" .. tostring(math.random(1, 3)) .. ".wav")
							local dmg = DamageInfo()
							dmg:SetDamage(math.random(4, 6))
							dmg:SetDamageType(DMG_SHOCK)
							dmg:SetAttacker(self)
							dmg:SetInflictor(self)
							dmg:SetDamagePosition(self:EyePos())
							ply:TakeDamageInfo(dmg)
							local vp = self:GetPos()
							local ed = EffectData()
							ed:SetOrigin(vp)
							ed:SetScale(1)
							ed:SetMagnitude(1)
							ed:SetRadius(3)
							util.Effect("Sparks", ed)
						end
						ply:AddMoney(reward, "The Grind")
						if ply:Team() == TEAM_PROLETARIAT then
							ply.buttons_pushed = ply.buttons_pushed or 0
							ply.buttons_pushed = ply.buttons_pushed + 1
							if ply.buttons_pushed % 100 == 0 then
								ply:Notify("<c=0,200,0>Your work ethic makes Liver Failure proud.")
								ply:AddStemCells(1)
							end
						end
						if (not left) or math.random(1, 100) <= 50 then
							return self:NewLight(ply)
						end
					end
				end
			end
		end,
		GetNearestButton = function(self, who)
			if (not who or not IsValid(who)) then
				who = LocalPlayer()
			end
			if self.buttons then
				local start = who:GetShootPos()
				local endpos = start + who:GetAimVector() * 96
				local tr = util.TraceLine({
					start = start,
					endpos = endpos,
					filter = who
				})
				local HitPos = tr.HitPos
				if HitPos then
					for k, v in ipairs(self.buttons) do
						if (v[1]:Distance(HitPos) <= 2) then
							return k
						end
					end
				end
			end
		end,
		NewLight = function(self, ply)
			local olight = self:GetCorrectLight()
			local set = {
				1,
				2,
				3
			}
			local forbidden = {
				1,
				2,
				3
			}
			local finished = true
			for k, v in ipairs(self.buttons) do
				local idx = self["GetButton" .. tostring(k)](self)
				if idx > 0 then
					finished = false
					if idx ~= olight then
						table.RemoveByValue(forbidden, idx)
					end
				end
			end
			for k, v in ipairs(forbidden) do
				table.RemoveByValue(set, v)
			end
			local nlight = set[math.random(1, #set)]
			if finished then
				self:SetQueuedItems(self:GetQueuedItems() + 1)
				for i = 1, 8 do
					self["SetButton" .. tostring(i)](self, math.random(1, 3))
				end
				local idx = math.random(1, 8)
				self:EmitSound("items/suitchargeok1.wav", 75, math.random(75, 95))
				return self:SetCorrectLight(self["GetButton" .. tostring(idx)](self))
			elseif nlight then
				self:EmitSound("ambient/tones/elev1.wav", 75, math.random(75, 95))
				return self:SetCorrectLight(nlight)
			end
		end,
		Render3D2D = function(self)
			local dist_sqr = self:GetPos():DistToSqr(lp:GetPos())
			if not (dist_sqr < 128 ^ 2) then
				return
			end
			local gen = self:GetGenerator()
			if gen and IsValid(gen) and (not gen:GetOn()) then
				return
			end
			local ct = CurTime()
			local lp = LocalPlayer()
			local pos = self:GetPos() + self:GetUp() * 28 + self:GetForward() * 13 + self:GetRight() * 7.4
			local ang = self:GetAngles()
			ang:RotateAroundAxis(ang:Up(), -90)
			ang:RotateAroundAxis(ang:Forward(), 90)
			ang:RotateAroundAxis(ang:Right(), -180)
			local desp = (lp:GetDespair() * 0.01)
			local font = "Spleen_Label"
			cam.Start3D2D(pos, ang, 0.1)
			local txt = self.PrintName
			local col = HSVToColor((ct * 23) % 180, 1, 1)
			surface.SetMaterial(noise)
			surface.DrawTexturedRect(0, 0, 236, 78)
			local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt))
			txt_obj:Draw(120, 24, 1, TEXT_ALIGN_CENTER)
			cam.End3D2D()
			font = "Spleen_Label_Small"
			pos = self:GetPos() + self:GetUp() * 14.7 + self:GetForward() * 13 + self:GetRight() * 3
			ang = self:GetAngles()
			ang:RotateAroundAxis(ang:Up(), -90)
			ang:RotateAroundAxis(ang:Forward(), 90)
			ang:RotateAroundAxis(ang:Right(), -180)
			cam.Start3D2D(pos, ang, 0.1)
			local py = 0
			local _list_0 = self.Precursors
			for _index_0 = 1, #_list_0 do
				local p = _list_0[_index_0]
				local name = p.name
				name = tostring(name:sub(1, 1):upper()) .. tostring(name:sub(2, -1))
				local pre_amt = self["GetPrecursor" .. tostring(name)](self)
				txt = tostring(pre_amt) .. " " .. tostring(p.name)
				local font
				font = "Spleen_Autodealer"
				txt_obj = scribe.Parse("<stutter><rgb=1,1,60><wiggle=" .. tostring(5 * desp) .. "," .. tostring(15 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(3 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt))
				txt_obj:Draw(75, py, 1, TEXT_ALIGN_CENTER)
				py = py + txt_obj:GetTall()
			end
			cam.End3D2D()
			font = "Spleen_Label_Small"
			pos = self:GetPos() + self:GetUp() * 10.7 + self:GetForward() * 13 + self:GetRight() * 6.15
			cam.Start3D2D(pos, ang, 0.1)
			local rust = self:GetRust()
			local empty = true
			local _list_1 = self.Precursors
			for _index_0 = 1, #_list_1 do
				local p = _list_1[_index_0]
				local name = p.name
				name = tostring(name:sub(1, 1):upper()) .. tostring(name:sub(2, -1))
				local cur_amt = self["GetPrecursor" .. tostring(name)](self)
				if cur_amt > 0 then
					empty = false
					break
				end
			end
			txt = "i'm " .. tostring(rust) .. "% rusted"
			if rust < 1 then
				txt = "give me purpose"
			end
			if rust >= 100 then
				txt = "I'M ROTTEN. HELP"
			end
			if empty then
				txt = "FEED ME"
			end
			local prod = self:GetProducing()
			if prod ~= "" then
				local etab = scripted_ents.Get(prod) or weapons.Get(prod)
				txt = etab.PrintName
			end
			surface.SetDrawColor(0, 0, 0, 255)
			surface.DrawRect(0, 0, 209, 56)
			local production_start = self:GetProductionStart()
			local production_end = self:GetProductionEnd()
			if production_end > 0 then
				local cur = ct - production_start
				local ending = production_end - production_start
				surface.SetDrawColor(0, 150 + (100 * math.cos(ct)), 0, 255)
				surface.DrawRect(0, 0, 209 * (cur / ending), 56)
			elseif rust >= 100 then
				surface.SetDrawColor(150 + (100 * math.cos(ct)), 0, 0, 255)
				surface.DrawRect(0, 0, 209 * (rust / 100), 56)
			else
				surface.SetDrawColor(147, 58 + (29 * math.cos(ct)), 22, 255)
				surface.DrawRect(0, 0, 209 * (rust / 100), 56)
			end
			txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(2 * desp) .. "," .. tostring(20 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(5 * desp) .. "," .. tostring(0.666 * desp) .. ",2><ol=2>" .. tostring(txt))
			txt_obj:Draw(105, 16, 1, TEXT_ALIGN_CENTER)
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
		__name = "Machine",
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
	Machine = _class_0
end
local Tools
do
	local _class_0
	local _parent_0 = Machine
	local _base_0 = {
		PrintName = "Tool Machine",
		Precursors = {
			{
				name = "metal"
			},
			{
				name = "wood"
			}
		},
		Products = {
			["evilrp_melee/crowbar"] = {
				precursors = {
					metal = 3
				},
				time = 10
			},
			["evilrp_melee/knife"] = {
				precursors = {
					metal = 2
				},
				time = 15
			},
			["evilrp_melee/pipe"] = {
				precursors = {
					metal = 2
				},
				time = 10
			},
			["evilrp_melee/pickaxe"] = {
				precursors = {
					metal = 5
				},
				time = 20
			},
			["evilrp_melee/shovel"] = {
				precursors = {
					metal = 4
				},
				time = 20
			},
			["evilrp_melee/pot"] = {
				precursors = {
					metal = 1
				},
				time = 10
			}
		},
		FactoryIdentifier = "tools"
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
		__name = "Tools",
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
	Tools = _class_0
end
local Food
do
	local _class_0
	local _parent_0 = Machine
	local _base_0 = {
		PrintName = "Food Machine",
		Precursors = {
			{
				name = "biomass"
			},
			{
				name = "fluid"
			}
		},
		Products = {
			["item/food/soyloaf"] = {
				precursors = {
					biomass = 1
				},
				time = 3
			},
			["item/food/drink/fearbeer"] = {
				precursors = {
					biomass = 3
				},
				time = 1
			},
			["item/food/drink/smearbeer"] = {
				precursors = {
					biomass = 4
				},
				time = 2
			},
			["item/food/drink/shake"] = {
				precursors = {
					biomass = 4
				},
				time = 2
			},
			["item/food/moldmelon"] = {
				precursors = {
					biomass = 2
				},
				time = 1
			},
			["item/food/drink/twitchel"] = {
				precursors = {
					biomass = 2
				},
				time = 2
			}
		},
		FactoryIdentifier = "food"
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
		__name = "Food",
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
	Food = _class_0
end
local Weapons
do
	local _class_0
	local _parent_0 = Machine
	local _base_0 = {
		PrintName = "Weapons Machine",
		Precursors = {
			{
				name = "metal"
			}
		},
		Products = {
			["evilrp_weapon/bodyguard"] = {
				precursors = {
					metal = 5
				},
				time = 20
			},
			["evilrp_weapon/greaser"] = {
				precursors = {
					metal = 7
				},
				time = 25
			},
			["evilrp_weapon/mark"] = {
				precursors = {
					metal = 4
				},
				time = 20
			}
		},
		FactoryIdentifier = "weapons"
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
		__name = "Weapons",
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
	Weapons = _class_0
end
local Medicine
do
	local _class_0
	local _parent_0 = Machine
	local _base_0 = {
		PrintName = "Medicine Machine",
		Precursors = {
			{
				name = "biomass"
			},
			{
				name = "metal"
			}
		},
		Products = {
			["item/food/medicine/pills"] = {
				precursors = {
					biomass = 2,
					metal = 1
				},
				time = 10
			},
			["item/food/medicine/timegas"] = {
				precursors = {
					metal = 2
				},
				time = 10
			},
			["item/food/medicine/bleach"] = {
				precursors = {
					biomass = 2,
					metal = 1
				}
			}
		},
		FactoryIdentifier = "medicine"
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
		__name = "Medicine",
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
	Medicine = _class_0
end
local Evil_Squeal
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 4 do
				_accum_0[_len_0] = "placenta/coinkeeper" .. tostring(i) .. ".wav"
				_len_0 = _len_0 + 1
			end
			return _accum_0
		end)(),
		level = SNDLVL_70DB,
		pitch = {
			70,
			85
		}
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
		__name = "Evil_Squeal",
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
	Evil_Squeal = _class_0
end
local Evil
do
	local _class_0
	local _parent_0 = Machine
	local _base_0 = {
		PrintName = "Evil Machine",
		Precursors = {
			{
				name = "metal"
			},
			{
				name = "wood"
			}
		},
		Products = {
			["evilrp_weapon/mark"] = {
				precursors = {
					metal = 6
				},
				time = 20
			},
			["evilrp_weapon/coach"] = {
				precursors = {
					metal = 10,
					wood = 5
				},
				time = 30
			},
			["evilrp_weapon/obrez"] = {
				precursors = {
					metal = 5,
					wood = 3
				},
				time = 30
			},
			["evilrp_weapon/greaser"] = {
				precursors = {
					metal = 14
				},
				time = 35
			},
			["evilrp_weapon/owler"] = {
				precursors = {
					metal = 7,
					wood = 3
				},
				time = 30
			},
			["evilrp_weapon/prettyboy"] = {
				precursors = {
					metal = 7,
					wood = 2
				},
				time = 30
			}
		},
		ProduceItem = function(self, item)
			local etab = scripted_ents.Get(item)
			local weapon
			if not etab then
				etab = weapons.Get(item)
				weapon = true
			end
			local product
			if weapon then
				product = ents.Create("evilrp/spawned/weapon")
				product:SetModel(etab.WorldModel)
				product:SetWeaponClass(item)
			else
				product = ents.Create(item)
			end
			product:SetPos(self:GetPos() + Vector(0, 0, -12) + (self:GetForward() * 8))
			product:Spawn()
			product:Activate()
			self:EmitSound("Evil_Squeal")
			return product
		end,
		Shift = function(self)
			if not SERVER then
				return
			end
			local map = game.GetMap()
			if not EVIL_MACHINE_POSITIONS_CURSED[map] then
				return
			end
			local positions_all
			do
				local _tab_0 = { }
				local _obj_0 = EVIL_MACHINE_POSITIONS_CURSED[map]
				local _idx_0 = 1
				for _key_0, _value_0 in pairs(_obj_0) do
					if _idx_0 == _key_0 then
						_tab_0[#_tab_0 + 1] = _value_0
						_idx_0 = _idx_0 + 1
					else
						_tab_0[_key_0] = _value_0
					end
				end
				positions_all = _tab_0
			end
			local positions = { }
			local our_pos = self:GetPos()
			for k, v in pairs(positions_all) do
				if not (our_pos == v.machine.pos) then
					positions[#positions + 1] = v
				end
			end
			local where = positions[math.random(#positions)]
			local where_mach = where.machine
			local where_gen = where.generator
			self:EmitSound("Evil_Squeal")
			self:SetPos(where_mach.pos)
			self:SetAngles(where_mach.ang)
			local gen = self:GetGenerator()
			gen:SetPos(where_gen.pos)
			gen:SetAngles(where_gen.ang)
			gen:SetRust(0)
			gen:SetFuel(0)
			if gen:GetOn() then
				gen:SetOn(false)
				gen:StopLoopingSound(gen:GetSoundLoop())
				gen.Overload = false
			end
			self:PositionButtons()
			self:SetRust(0)
			return MsgC(Color(200, 0, 0), "The evil machine shifted.\n")
		end,
		Think = function(self)
			_class_0.__parent.__base.Think(self)
			local ct = CurTime()
			if not self.next_shift then
				self.next_shift = ct + 5
			end
			if ct >= self.next_shift then
				if self:GetProducing() == "" then
					self.next_shift = ct + math.random(300, 900)
					return self:Shift()
				end
			end
		end,
		FactoryIdentifier = "evil"
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
		__name = "Evil",
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
	Evil = _class_0
	return _class_0
end
