local Cannibalism
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 2, 3 do
				_accum_0[_len_0] = "npc/barnacle/barnacle_crunch" .. tostring(i) .. ".wav"
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
		__name = "Cannibalism",
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
	Cannibalism = _class_0
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
local create_gibs
create_gibs = function(pos)
	local amt = math.random(2, 4)
	for i = 1, amt do
		local gib = ents.Create("gib")
		gib:SetModel(gibs[math.random(#gibs)])
		gib:SetPos(pos)
		gib:SetCollisionGroup(COLLISION_GROUP_NONE)
		gib:SetMoveType(MOVETYPE_VPHYSICS)
		gib:Spawn()
		SafeRemoveEntityDelayed(gib, math.random(5, 10))
	end
	local ed = EffectData()
	ed:SetOrigin(pos)
	ed:SetScale(0.4)
	return util.Effect("evilrp_gored", ed)
end
local pick_up
pick_up = function(ply, key)
	if not SERVER then
		return
	end
	if not (key == IN_USE) then
		return
	end
	if ply:Crouching() then
		return
	end
	if ply:Team() == TEAM_GHOST then
		return
	end
	local tr = GAMEMODE:GetHandTrace(ply, 80)
	if not (tr.Entity and IsValid(tr.Entity)) then
		return
	end
	local rag = tr.Entity
	if rag:GetClass() ~= "prop_ragdoll" then
		return
	end
	return ply:PickupObject(rag)
end
hook.Add("KeyPress", "evilrp_pick_up_bodies", pick_up)
local cannibalism
cannibalism = function(ply, key)
	if not (key == IN_USE) then
		return
	end
	if not ply:Crouching() then
		return
	end
	if ply:Team() == TEAM_GHOST then
		return
	end
	if not ply:HasOddity(ODDITY_CANNIBALISM) then
		return
	end
	local ct = CurTime()
	local tr = GAMEMODE:GetHandTrace(ply, 50)
	if not (tr.Entity and IsValid(tr.Entity)) then
		return
	end
	local rag = tr.Entity
	if rag:GetClass() ~= "prop_ragdoll" then
		return
	end
	if not rag:GetNWBool("corpse") then
		return
	end
	if not ply.next_cannibalism then
		ply.next_cannibalism = ct + .5
	end
	if ct < ply.next_cannibalism then
		return
	end
	ply:DoAnimationEvent(ACT_GMOD_GESTURE_RANGE_FRENZY)
	if not SERVER then
		return
	end
	local descs = {
		tostring(rag:GetNWString("body_name")) .. "'s lifeless body",
		"the maggot infested corpse",
		"the shriveled carcass",
		"the cracked pile of bones"
	}
	local phrases = {
		"chews open",
		"bites into",
		"munches at",
		"sinks teeth into"
	}
	local decomp = rag:GetNWInt("decomp_stage")
	local phrase = tostring(phrases[math.random(#phrases)]) .. " " .. tostring(descs[decomp]) .. "!"
	if DSTAGE_FRESH == decomp or DSTAGE_EARLY == decomp or DSTAGE_BLACK == decomp then
		ply:ConCommand("say /me " .. tostring(phrase))
		rag:EmitSound("Cannibalism")
		rag:SetNWInt("decomp_finish", rag:GetNWInt("decomp_finish") - 30)
		ply:AddHunger(math.random(-16, -8))
		return create_gibs(tr.HitPos)
	elseif DSTAGE_BONES == decomp then
		ply:ConCommand("say /me gnaws on bones and breaks a tooth!")
		rag:EmitSound("Hand_Break")
		local dmg = DamageInfo()
		dmg:SetDamageType(DMG_CLUB)
		dmg:SetDamagePosition(tr.HitPos)
		dmg:SetAttacker(ply)
		dmg:SetInflictor(rag)
		dmg:SetDamage(10 + math.random(5, 15))
		return ply:TakeDamageInfo(dmg)
	end
end
hook.Add("KeyPress", "evilrp_cannibalism", cannibalism)
local Necromance
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 3 do
				_accum_0[_len_0] = "ambient/voices/citizen_beaten" .. tostring(i) .. ".wav"
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
		__name = "Necromance",
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
	Necromance = _class_0
end
local necrophilia
necrophilia = function(ply, key)
	if not (key == IN_USE) then
		return
	end
	if not ply:Crouching() then
		return
	end
	if ply:Team() == TEAM_GHOST then
		return
	end
	if not ply:HasOddity(ODDITY_NECROPHILIA) then
		return
	end
	local ct = CurTime()
	local tr = GAMEMODE:GetHandTrace(ply, 50)
	if not (tr.Entity and IsValid(tr.Entity)) then
		return
	end
	local rag = tr.Entity
	if rag:GetClass() ~= "prop_ragdoll" then
		return
	end
	if not rag:GetNWBool("corpse") then
		return
	end
	if rag:GetNWBool("molested") then
		return
	end
	ply:DoAnimationEvent(ACT_GMOD_GESTURE_RANGE_FRENZY)
	if not SERVER then
		return
	end
	local descs = {
		tostring(rag:GetNWString("body_name")) .. "'s lifeless body",
		"the maggot infested corpse",
		"the shriveled carcass",
		"the cracked pile of bones"
	}
	local phrases = {
		"caresses",
		"kisses",
		"hugs",
		"does something bad with"
	}
	local moans = {
		"Ohh YES!",
		"Sweetheart...",
		"You feel disgusting and you love it.",
		"Oh my."
	}
	local decomp = rag:GetNWInt("decomp_stage")
	local phrase = tostring(phrases[math.random(#phrases)]) .. " " .. tostring(descs[decomp]) .. "!"
	ply:ConCommand("say /me " .. tostring(phrase))
	rag:EmitSound("Necromance")
	local desp = 7 * decomp
	ply:AddDespair(-desp)
	rag:SetNWBool("molested", true)
	if decomp == DSTAGE_BONES then
		rag:EmitSound("Hand_Break")
		local dmg = DamageInfo()
		dmg:SetDamageType(DMG_SLASH)
		dmg:SetDamagePosition(tr.HitPos)
		dmg:SetAttacker(ply)
		dmg:SetInflictor(rag)
		dmg:SetDamage(20 + math.random(5, 15))
		ply:TakeDamageInfo(dmg)
		ply:SendChat("GENERIC", "<c=200,0,0>OUCH.")
	end
	local range = 512 ^ 2
	local _list_0 = player.GetAll()
	for _index_0 = 1, #_list_0 do
		local p = _list_0[_index_0]
		if p == ply then
			goto _continue_0
		end
		if p:Team() == TEAM_GHOST then
			goto _continue_0
		end
		if not (p:CanSee(ply) and p:CanSee(rag)) then
			goto _continue_0
		end
		if not (p:GetPos():DistToSqr(ply:GetPos()) <= range) then
			goto _continue_0
		end
		local text = "You feel very disturbed."
		if p:HasOddity(ODDITY_NECROPHILIA) then
			text = "You feel jealous."
		end
		p:SendChat("GENERIC", "<c=200,0,0>" .. tostring(text))
		p:AddDespair(desp)
		::_continue_0::
	end
end
return hook.Add("KeyPress", "evilrp_necrophilia", necrophilia)
