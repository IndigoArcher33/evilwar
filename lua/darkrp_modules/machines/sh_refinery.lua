local noise = Material("models/props_lab/eyescanner_disp")
local screen = Material("glass/glasswindow017a")
local Refinery
local _class_0
local _parent_0 = ENTITY
local _base_0 = {
	Base = "base_anim",
	Type = "anim",
	PrintName = "Refinery",
	Interesting = true,
	Spawnable = true,
	AdminSpawnable = true,
	Pocketable = false,
	SetupDataTables = function(self)
		self:NetworkVar("String", "Producing")
		self:NetworkVar("Int", "ProductionStart")
		self:NetworkVar("Int", "ProductionEnd")
		self:NetworkVar("Int", "SoundLoop")
		self:NetworkVar("Int", "Rust")
		self:NetworkVar("Int", "Heat")
		return self:NetworkVar("Entity", "Worker")
	end,
	Initialize = function(self)
		if CLIENT then
			return
		end
		self:SetUseType(SIMPLE_USE)
		self:SetModel("models/props_wasteland/laundry_washer003.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:PhysWake()
		self:SetHeat(0)
		self.NextHeat = 0
	end,
	Think = function(self)
		if CLIENT then
			return
		end
		local pend = self:GetProductionEnd()
		local ct = CurTime()
		local rust = self:GetRust()
		if pend > 0 and ct >= pend then
			local prod = scripted_ents.Get(self:GetProducing()).Refinement
			self:SetRust(math.min(100, rust + (prod.rust or prod.time)))
			self:EmitSound("buttons/lever6.wav")
			self:StopLoopingSound(self:GetSoundLoop())
			local worker = self:GetWorker()
			if worker and IsValid(worker) then
				local start = self:GetPos()
				local endpos = start + (self:GetUp() * 128) + (self:GetForward() * 24)
				local tr = util.TraceLine({
					start = start,
					endpos = endpos,
					filter = self,
					mask = MASK_NPCWORLDSTATIC
				})
				if prod.result then
					local sp = ents.Create(prod.result)
					sp:SetPos(tr.HitPos - (self:GetUp() * 86) - (self:GetForward() * 38) - (self:GetRight() * 8))
					sp:Spawn()
					sp:Activate()
				end
				self:SetWorker(nil)
			end
			self:SetProducing("")
			self:SetProductionStart(0)
			return self:SetProductionEnd(0)
		end
	end,
	Touch = function(self, what)
		if SERVER then
			if self:GetProductionEnd() > 0 then
				return
			end
			if not what.Refinement then
				return
			end
			local prod = what.Refinement
			local submitter = what:GetNWEntity("evilrp_submitter")
			if not (submitter and IsValid(submitter)) then
				return
			end
			if what.Processed then
				return
			end
			what.Processed = true
			if what.Submitted then
				what:Submitted()
			end
			if what.SubmitSound then
				what:EmitSound(what.SubmitSound)
			end
			self:SetProducing(what:GetClass())
			local ct = CurTime()
			self:SetProductionStart(ct)
			local wait = prod.time * (1 + (self:GetRust() / 100))
			self:SetProductionEnd(ct + wait)
			self:SetWorker(submitter)
			self:EmitSound("ambient/machines/machine1_hit1.wav")
			self:SetSoundLoop(self:StartLoopingSound("ambient/machines/machine_whine1.wav"))
			local ed = EffectData()
			ed:SetStart(self:GetPos())
			ed:SetOrigin(self:GetPos())
			ed:SetScale(2)
			util.Effect("StunstickImpact", ed, true, true)
			return what:Remove()
		end
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
	Draw = function(self)
		self:DrawModel()
		return self:Render3D2D()
	end,
	HUDRender = function(self)
		local ct = { }
		ct[#ct + 1] = self.PrintName
		ct[#ct + 1] = {
			text = "Certain items can be processed into more useful things with this.",
			font = "Spleen_Label_Small"
		}
		ct[#ct + 1] = {
			text = "The rustier it is, the longer it will take.",
			font = "Spleen_Label_Small"
		}
		return ct
	end,
	Render3D2D = function(self)
		local dist_sqr = self:GetPos():DistToSqr(lp:GetPos())
		if not (dist_sqr < 128 ^ 2) then
			return
		end
		local font = "Spleen_Label"
		local desp = lp:GetDespair() * 0.01
		local ct = CurTime()
		local pos = self:GetPos() + (self:GetUp() * 15) + (self:GetForward() * 25) + (self:GetRight() * -20)
		local ang = self:GetAngles()
		ang:RotateAroundAxis(ang:Up(), -90)
		ang:RotateAroundAxis(ang:Forward(), 90)
		ang:RotateAroundAxis(ang:Right(), 90)
		cam.Start3D2D(pos, ang, 0.1)
		surface.SetMaterial(noise)
		surface.SetDrawColor(Color(255, 255, 255, 255))
		surface.DrawTexturedRect(0, 0, 152, 38)
		local txt = "Refinery"
		local txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt))
		txt_obj:Draw(8, 6, 1, TEXT_ALIGN_LEFT)
		cam.End3D2D()
		pos = self:GetPos() + (self:GetUp() * 5) + (self:GetForward() * 25) + (self:GetRight() * -22)
		cam.Start3D2D(pos, ang, 0.1)
		local rust = self:GetRust()
		txt = tostring(rust) .. "% rust"
		if rust < 0 then
			txt = "give me purpose"
		elseif rust >= 100 then
			txt = "100% ROTTEN"
		end
		local pend = self:GetProductionEnd()
		local pstart = self:GetProductionStart()
		local prod = self:GetProducing()
		if pend > 0 and prod then
			prod = scripted_ents.Get(prod)
			local text
			if prod then
				text = prod.PrintName
			end
		end
		surface.SetDrawColor(0, 0, 0, 255)
		surface.DrawRect(0, 0, 152, 78)
		if pend > 0 then
			local cur = ct - pstart
			surface.SetDrawColor(0, 150 + (100 * math.cos(ct)), 0, 255)
			surface.DrawRect(0, 0, 152 * (cur / (pend - pstart)), 78)
		elseif rust >= 100 then
			surface.SetDrawColor(150 + (100 * math.cos(ct)), 0, 0, 255)
			surface.DrawRect(0, 0, 152 * (rust / 100), 78)
		else
			surface.SetDrawColor(147, 58 + (2 * math.cos(ct)), 22, 255)
			surface.DrawRect(0, 0, 152 * (rust / 100), 78)
		end
		txt_obj = scribe.Parse("<stutter><rgb=1,1,30><wiggle=" .. tostring(8 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt))
		txt_obj:Draw(76, 24, 1, TEXT_ALIGN_CENTER)
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
	__name = "Refinery",
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
Refinery = _class_0
return _class_0
