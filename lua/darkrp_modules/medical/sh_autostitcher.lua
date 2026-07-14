local cable = Material("cable/hydra")
local noise = Material("effects/tvscreen_noise001a")
local screen = Material("glass/glasswindow017a")
if SERVER then
	util.AddNetworkString("evilrp_autostitcher")
end
if CLIENT then
	net.Receive("evilrp_autostitcher", function(len)
		print("FUCK")
		AMBIENCE_COOLDOWN = CurTime()
	end)
end
local Autostitcher
local _class_0
local _parent_0 = ENTITY
local _base_0 = {
	Base = "base_anim",
	Type = "anim",
	PrintName = "Autostitcher",
	Interesting = true,
	MaxCharges = 3,
	SetupDataTables = function(self)
		self:NetworkVar("Int", "Charges")
		return self:NetworkVar("Entity", "Patient")
	end,
	Initialize = function(self)
		if CLIENT then
			return
		end
		self:SetUseType(SIMPLE_USE)
		self:SetModel("models/props_combine/health_charger001.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:PhysWake()
		return self:SetCharges(math.random(0, 1))
	end,
	Think = function(self)
		if CLIENT then
			return
		end
		local patient = self:GetPatient()
		if IsValid(patient) then
			if (not patient:CanSee(self)) or patient:Health() >= patient:GetMaxHealth() then
				patient:SendChat("NOTICE", "You feel better but not much.")
				patient:SetNWEntity("evilrp_autostitcher", nil)
				self:SetPatient(nil)
				self:EmitSound("npc/turret_floor/die.wav", 75, 70)
				local ed = EffectData()
				local where = self:GetPos() + (self:GetForward() * 6) + (self:GetRight() * 2.4)
				ed:SetStart(where)
				ed:SetOrigin(where)
				ed:SetScale(2)
				util.Effect("StunstickImpact", ed, true, true)
				return
			end
			if not self.next_beep then
				self.next_beep = CurTime() + 5
			end
			if CurTime() >= self.next_beep then
				self.next_beep = CurTime() + 5
				self:EmitSound("items/medshot4.wav", 50, 50 + (50 * (patient:Health() / 100)))
				local ed = EffectData()
				local where = self:GetPos() + (self:GetForward() * 6) + (self:GetRight() * 2.4) + (self:GetUp() * -1)
				ed:SetStart(where)
				ed:SetOrigin(where)
				ed:SetScale(2)
				util.Effect("GunshipImpact", ed, true, true)
				local nh = math.min(patient:Health() + 3, patient:GetMaxHealth())
				return patient:SetHealth(nh)
			end
		end
	end,
	CostFor = function(self, ply)
		local cost = 100
		if ply:Team() == TEAM_KORPSMAN then
			cost = cost / 2
		end
		return cost
	end,
	Use = function(self, ply)
		local korpsman = ply:Team() == TEAM_KORPSMAN
		local wep = ply:GetActiveWeapon()
		if korpsman then
			if wep and IsValid(wep) and wep.Medkit then
				if self:GetCharges() >= self.MaxCharges then
					self:EmitSound("items/medshotno1.wav")
					ply:Notify("<c=200,0,0>It can't hold any more charges.")
					net.Start("evilrp_frighten")
					net.Send(ply)
					return
				end
				local patient = self:GetPatient()
				if IsValid(patient) and patient == ply then
					local dmg = DamageInfo()
					dmg:SetAttacker(ply)
					dmg:SetDamage(15)
					dmg:SetInflictor(self)
					dmg:SetDamageType(DMG_SLASH)
					ply:TakeDamageInfo(dmg)
					ply:Notify("<c=200,0,0>Nice try, freak.")
					self:EmitSound("items/medshotno1.wav")
					net.Start("evilrp_frighten")
					net.Send(ply)
					return
				end
				ply:EmitSound("items/gift_drop.wav", 75, math.random(70, 90))
				local dmg = DamageInfo()
				dmg:SetAttacker(ply)
				dmg:SetDamage(20)
				dmg:SetInflictor(self)
				dmg:SetDamageType(DMG_SLASH)
				ply:TakeDamageInfo(dmg)
				self:SetCharges(self:GetCharges() + 1)
				local reward = math.random(15, 30)
				ply:AddMoney(reward, compassion)
				return
			end
		end
		if self:GetCharges() <= 0 then
			ply:Notify("<c=200,0,0>No healing charges remain.")
			net.Start("evilrp_frighten")
			net.Send(ply)
			self:EmitSound("items/medshotno1.wav")
			return
		end
		local patient = self:GetPatient()
		local cost = self:CostFor(ply)
		if ply:getDarkRPVar("money") < cost and not IsValid(self:GetPatient()) then
			ply:Notify("<c=200,0,0>It sucks to be poor. A healing trip costs $" .. tostring(cost) .. ".")
			net.Start("evilrp_frighten")
			net.Send(ply)
			self:EmitSound("items/medshotno1.wav")
			return
		end
		if IsValid(patient) and patient ~= ply then
			ply:Notify("<c=200,0,0>Wait your turn.")
			net.Start("evilrp_frighten")
			net.Send(ply)
			self:EmitSound("items/medshotno1.wav")
			return
		end
		self:SetCharges(self:GetCharges() - 1)
		self:SetPatient(ply)
		ply:SetNWEntity("evilrp_autostitcher", self)
		ply:AddMoney(-cost, "Masshiroi mezame")
		self:EmitSound("items/medshot4.wav")
		net.Start("evilrp_autostitcher")
		net.Send(ply)
		net.Start("evilrp_music_start")
		return net.Send(ply)
	end,
	Draw = function(self)
		self:DrawModel()
		local patient = self:GetPatient()
		if patient and IsValid(patient) then
			render.SetMaterial(cable)
			local pos_start = patient:EyePos() + (patient:GetForward() * 2) + (patient:GetUp() * -16) + (self:GetUp() * 1)
			local pos_end = self:GetPos() + (self:GetForward() * 6) + (self:GetRight() * 2.4)
			local ct = CurTime()
			return render.DrawBeam(pos_start, pos_end, 2 + (1 * math.cos(ct)), math.abs(12 * math.sin(ct * .3)), math.abs(10 * math.cos(ct * .2)), Color(255, 255, 255, 255))
		end
	end,
	HUDRender = function(self)
		local ct = { }
		local patient = self:GetPatient()
		if lp == patient then
			ct[#ct + 1] = "Ohh YES!..."
		else
			ct[#ct + 1] = "Autostitcher"
			ct[#ct + 1] = "Charges: " .. tostring(self:GetCharges()) .. "/" .. tostring(self.MaxCharges)
			if lp:Team() == TEAM_KORPSMAN then
				ct[#ct + 1] = {
					text = "Use it with your L.R.D. equipped to recharge it.",
					font = "Spleen_Label_Small"
				}
			else
				ct[#ct + 1] = {
					text = "This will heal you for the low price of $" .. tostring(self:CostFor(lp)) .. ".",
					font = "Spleen_Label_Small"
				}
				if self:GetCharges() >= 0 then
					ct[#ct + 1] = {
						text = "...or rather, it would heal you if it weren't EMPTY.",
						font = "Spleen_Label_Small"
					}
				end
			end
		end
		return ct
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
	__name = "Autostitcher",
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
Autostitcher = _class_0
return _class_0
