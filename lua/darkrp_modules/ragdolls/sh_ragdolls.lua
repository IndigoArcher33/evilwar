DSTAGE_FRESH = 1
DSTAGE_EARLY = 2
DSTAGE_BLACK = 3
DSTAGE_BONES = 4
local pmeta = FindMetaTable("Player")
local racism
racism = function(who)
	local text = "Not like me."
	if who:GetModel() == lp:GetModel() then
		text = "Brother in blood."
	end
	return {
		text = text,
		font = "Spleen_Label_Small"
	}
end
hud_render_ragdoll = function(self)
	if (not lp:Alive()) and self == lp:Ragdoll() then
		return
	end
	local ct = { }
	local name = self:GetNWString("body_name")
	if name then
		ct[#ct + 1] = {
			text = name
		}
	end
	local decomp = self:GetNWInt("decomp_stage", DSTAGE_FRESH)
	if self:GetNWBool("corpse", false) == true then
		ct[#ct + 1] = {
			text = "Living no longer.",
			font = "Spleen_Label_Small"
		}
	end
	if DSTAGE_FRESH == decomp then
		ct[#ct + 1] = racism(self)
	elseif DSTAGE_EARLY == decomp then
		ct[#ct + 1] = {
			text = "<wiggle=1>Decomposition has begun.",
			font = "Spleen_Label_Small"
		}
	elseif DSTAGE_BLACK == decomp then
		ct[#ct + 1] = {
			text = "<wiggle=1>Consumed by rot...",
			font = "Spleen_Label_Small"
		}
	elseif DSTAGE_BONES == decomp then
		ct[#ct + 1] = {
			text = "<wiggle=1>Nothing remains of this one.",
			font = "Spleen_Label_Small"
		}
	end
	if self:GetNWBool("headless", false) == true then
		ct[#ct + 1] = {
			text = "What happened to its head?",
			font = "Spleen_Label_Small"
		}
	end
	if self:GetNWBool("molested", false) == true then
		ct[#ct + 1] = {
			text = "Someone did something terrible with it.",
			font = "Spleen_Label_Small"
		}
	end
	return ct
end
local get_player_color
get_player_color = function(self)
	local ply = self:GetNWEntity("player")
	if not (ply and IsValid(ply)) then
		return Vector(1, 1, 1)
	end
	return ply:GetPlayerColor()
end
local refresh_body
refresh_body = function(self)
	local ply = self:GetNWEntity("player")
	if ply and IsValid(ply) then
		for i = 1, 20 do
			self:SetBodygroup(i, ply:GetBodygroup(i))
		end
	else
		for i = 1, 20 do
			self:SetBodygroup(i, 0)
		end
	end
end
local gibs = {
	"models/gibs/humans/mgib_01.mdl",
	"models/gibs/humans/mgib_02.mdl",
	"models/gibs/humans/mgib_03.mdl",
	"models/gibs/humans/mgib_04.mdl",
	"models/gibs/humans/mgib_05.mdl",
	"models/gibs/humans/mgib_06.mdl",
	"models/gibs/humans/mgib_07.mdl"
}
for k, v in pairs({
	GetBodyEntity = function(self)
		if not self.Ragdoll then
			return self
		end
		local rag = self:Ragdoll()
		if rag and IsValid(rag) and not (rag:GetNWBool("corpse") and self:Alive()) then
			return rag
		end
		return self
	end,
	GetHeadPos = function(self)
		local head = self:LookupBone("ValveBiped.Bip01_Head1")
		if head then
			return self:GetBonePosition(head)
		else
			return self:EyePos()
		end
	end,
	Ragdoll = function(self)
		return self:GetNWEntity("ragdoll")
	end,
	MakeRagdollClone = function(self, force)
		local rag = self:Ragdoll()
		if rag and IsValid(rag) then
			rag:Remove()
		end
		local vel = self:GetVelocity() + (self:GetAimVector() * 128)
		rag = ents.Create("prop_ragdoll")
		do
			rag:SetPos(self:GetPos())
			rag:SetAngles(self:GetAngles())
			rag:SetModel(self:GetModel())
			rag:SetSkin(self:GetSkin())
			for i = 1, 20 do
				rag:SetBodygroup(i, self:GetBodygroup(i))
			end
			rag:Spawn()
			rag:Activate()
			rag:SetCollisionGroup(COLLISION_GROUP_WEAPON)
			rag.GetPlayerColor = get_player_color
			rag:SetNWEntity("player", self)
			rag:SetNWString("body_name", self:Name())
			rag.Submitted = function(self)
				local ply = self:GetNWEntity("player")
				if ply and IsValid(ply) and not ply:Alive() then
					ply:changeTeam(TEAM_GHOST)
					ply:Spawn()
				end
				self:EmitSound("Submit_Flesh")
				local pos = self:GetPos()
				for i = 1, #gibs do
					local gib = ents.Create("gib")
					gib:SetModel(gibs[i])
					gib:SetPos(pos)
					gib:SetCollisionGroup(COLLISION_GROUP_NONE)
					gib:SetMoveType(MOVETYPE_VPHYSICS)
					gib:Spawn()
					SafeRemoveEntityDelayed(gib, math.random(5, 10))
				end
			end
			rag.Precursor = {
				biomass = math.random(4, 7)
			}
			rag.GetManager = function(self)
				if not (SERVER and AR_Manager) then
					return
				end
				local controller = AR_Manager.ActiveRagdolls[self]
				return controller
			end
			local hidx = rag:LookupBone("ValveBiped.Bip01_Head1")
			for i = 1, rag:GetPhysicsObjectCount() do
				local phys_obj = rag:GetPhysicsObjectNum(i)
				local bidx = rag:TranslatePhysBoneToBone(i)
				local pos, ang = self:GetBonePosition(bidx)
				if IsValid(phys_obj) then
					phys_obj:SetPos(pos)
					phys_obj:SetAngles(ang)
					if force then
						if bidx == hidx then
							phys_obj:ApplyForceCenter(force * 1.5)
						else
							phys_obj:ApplyForceCenter(force)
						end
					else
						if bidx == hidx then
							phys_obj:SetVelocity(vel * 1.5)
						else
							phys_obj:SetVelocity(vel)
						end
					end
				end
			end
		end
		self:SetNWEntity("ragdoll", rag)
		netstream.Broadcast("RagdollAppearanceAltered", rag)
		return rag
	end,
	SnapFromRagdollClone = function(self)
		local rag = self:Ragdoll()
		if rag and IsValid(rag) then
			self:SetPos(rag:GetPos())
			return rag:Remove()
		end
	end,
	DeathRagdoll = function(self, dmg)
		local force = dmg:GetDamageForce()
		if dmg:IsDamageType(DMG_BULLET + DMG_CLUB + DMG_CRUSH) then
			force = force / 20
		end
		local rag = self:MakeRagdollClone(force)
		if rag and IsValid(rag) then
			rag:SetNWBool("corpse", true)
			rag:SetNWInt("decomp_start", CurTime())
			rag:SetNWInt("decomp_finish", CurTime() + 120)
			rag:SetNWInt("decomp_stage", 1)
			local jt = self:getJobTable()
			local _obj_0 = jt.HandleRagdoll
			if _obj_0 ~= nil then
				_obj_0(rag, self)
			end
		end
		if self:LastHitGroup() == HITGROUP_HEAD then
			local bidx = self:LookupBone("ValveBiped.Bip01_Head1")
			if bidx then
				return GAMEMODE:ExplodeHead(rag, bidx)
			end
		end
	end
}) do
	pmeta[k] = v
end
if CLIENT then
	local ragdoll_created
	ragdoll_created = function(ent)
		if not (ent:GetClass() == "prop_ragdoll") then
			return
		end
		return timer.Create("attempt_appearance_" .. tostring(ent:EntIndex()), 0.005, 16, function()
			local ply = ent:GetNWEntity("player")
			if ply and IsValid(ply) then
				part.Copy(ply, ent)
				return timer.Remove("attempt_appearance_" .. tostring(ent:EntIndex()))
			end
		end)
	end
	hook.Add("OnEntityCreated", "evilrp_ragdoll_created", ragdoll_created)
	netstream.Hook("RagdollAppearanceAltered", function(rag, payload)
		if not (rag and IsValid(rag)) then
			return
		end
		return part.Add(rag, "appearance", payload)
	end)
end
for k, v in pairs({
	ExplodeHead = function(self, rag, bidx)
		if (rag:GetClass() == "prop_ragdoll") and (not rag:GetNWBool("headless")) then
			rag:SetNWBool("headless", true)
			rag:SetNWBool("alive", false)
			if string.find(rag:GetModel(), "models/liver_failure") then
				rag:SetBodygroup(0, 3)
				local _list_0 = {
					8,
					7,
					6,
					5,
					4,
					3
				}
				for _index_0 = 1, #_list_0 do
					local slot = _list_0[_index_0]
					rag:SetBodygroup(slot, 0)
				end
			else
				rag:ManipulateBoneScale(bidx, Vector(0, 0, 0))
			end
			timer.Simple((FrameTime() * 3), function()
				if IsValid(rag) then
					rag:EmitSound("placenta/head_explodie_0" .. tostring(math.random(1, 4)) .. ".ogg", 100, 100, 1)
					return rag:EmitSound("physics/flesh/flesh_squishy_impact_hard" .. tostring(math.random(1, 4)) .. ".wav", 100, 100, 1)
				end
			end)
			util.Blood(rag:GetBonePosition(bidx), math.random(12, 16), Vector(0, 0, 1 + math.random(2)), 128)
			for i = 1, 6 do
				local gib = ents.Create("gib")
				gib:SetModel("models/mosi/fnv/props/gore/gorehead0" .. tostring(i) .. ".mdl")
				gib:SetPos(rag:GetBonePosition(bidx))
				gib:SetCollisionGroup(COLLISION_GROUP_WEAPON)
				gib:SetMoveType(MOVETYPE_VPHYSICS)
				gib:Spawn()
				local phys = gib:GetPhysicsObject()
				if IsValid(phys) then
					phys:SetVelocity(Vector(math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(-1, 1)) * math.random(100, 200))
				end
				SafeRemoveEntityDelayed(gib, math.random(55, 65))
			end
		end
	end
}) do
	GAMEMODE[k] = v
end
local do_player_death
do_player_death = function(ply, attacker, dmg)
	local rag = ply:DeathRagdoll(dmg)
	local wep = ply:GetActiveWeapon()
	local can_drop = hook.Call("canDropWeapon", self, ply, weapon)
	if (GAMEMODE.Config.dropweapondeath or ply.dropWeaponOnDeath) and wep:IsValid() and can_drop then
		ply:dropDRPWeapon(wep)
	end
	if dmg:IsDamageType(DMG_BLAST) and dmg:GetDamage() > 30 then
		timer.Simple(0.02, function()
			rag = ply:Ragdoll()
			local pos = rag:GetPos()
			local vel = rag:GetVelocity()
			local where = rag:GetPos()
			rag:Remove()
			for i = 1, #gibs do
				local gib = ents.Create("gib")
				gib:SetModel(gibs[i])
				gib:SetPos(pos)
				gib:SetCollisionGroup(COLLISION_GROUP_NONE)
				gib:SetMoveType(MOVETYPE_VPHYSICS)
				gib:PhysicsInit(SOLID_VPHYSICS)
				gib:Spawn()
				local phys = gib:GetPhysicsObject()
				if IsValid(phys) then
					phys:SetVelocity(vel)
				end
				SafeRemoveEntityDelayed(gib, math.random(55, 65))
			end
			ply:changeTeam(TEAM_GHOST)
			ply:Spawn()
			return ply:SetPos(where)
		end)
	end
	return
end
hook.Add("DoPlayerDeath", "evilrp_ragdolls", do_player_death)
local Skin_Corpse
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 3 do
				_accum_0[_len_0] = "physics/flesh/flesh_bloody_impact_hard" .. tostring(i) .. ".wav"
				_len_0 = _len_0 + 1
			end
			return _accum_0
		end)()
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
		__name = "Skin_Corpse",
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
	Skin_Corpse = _class_0
end
local entity_take_damage
entity_take_damage = function(rag, dmg)
	if not (rag:GetClass() == "prop_ragdoll") then
		return
	end
	if not rag:GetNWBool("corpse") then
		return
	end
	local ct = CurTime()
	local bidx = rag:LookupBone("ValveBiped.Bip01_Head1")
	local dpos = dmg:GetDamagePosition()
	local fdir = dmg:GetDamageForce()
	if not fdir then
		fdir = VectorRand() * 80
	end
	util.Blood(dpos, (dmg:GetDamage() / 4), fdir, dmg:GetDamage() * 2)
	if bidx and (not rag:GetNWBool("headless")) and dpos:DistToSqr(rag:GetBonePosition(bidx)) < 40 then
		if math.random(100) <= dmg:GetDamage() then
			GAMEMODE:ExplodeHead(rag, bidx)
		end
	end
	local attacker = dmg:GetAttacker()
	if IsValid(attacker) and attacker:IsPlayer() then
		local decomp = rag:GetNWInt("decomp_stage")
		local wep = attacker:GetActiveWeapon()
		if decomp == 1 and wep.SkinHarvest then
			local amt = math.random(1, 2)
			for i = 1, amt do
				rag:EmitSound("Skin_Corpse")
				util.Effect("evilrp_blood", ed)
				local skin = ents.Create("item/food/skin")
				skin:SetPos(dpos)
				skin:Spawn()
				skin:Activate()
			end
			rag:SetNWInt("decomp_finish", ct)
		end
	end
	if dmg:IsDamageType(DMG_BURN) and rag:GetNWInt("corpse") and math.random(1, 5) == 3 and rag:GetNWInt("decomp_stage") < 3 then
		rag:SetNWInt("decomp_finish", ct)
	end
	return
end
hook.Add("EntityTakeDamage", "evilrp_ragdolls", entity_take_damage)
local ghost_on_ragdoll_remove
ghost_on_ragdoll_remove = function(ent)
	if not SERVER then
		return
	end
	if true then
		return
	end
	if ent:GetClass() == "prop_ragdoll" then
		local ply = ent:GetNWEntity("player", NULL)
		if not (ply and IsValid(ply)) then
			return
		end
		if not ply:Alive() then
			ply:changeTeam(TEAM_GHOST)
			local where = ent:GetPos() + Vector(0, 0, 8)
			ply:SetPos(where)
			ply:Spawn()
			MsgC(Color(200, 0, 0), "OOPS: " .. tostring(ply) .. "\n")
		end
	end
	return
end
hook.Add("EntityRemoved", "evilrp_ragdolls", ghost_on_ragdoll_remove)
local prevent_fallen_movement
prevent_fallen_movement = function(ply, mv)
	local rag = ply:Ragdoll()
	if ply:Fallen() and (rag and IsValid(rag)) then
		ply:SetNetworkOrigin(rag:GetNetworkOrigin())
		return true
	end
	return
end
return hook.Add("FinishMove", "evilrp_ragdolls", prevent_fallen_movement)
