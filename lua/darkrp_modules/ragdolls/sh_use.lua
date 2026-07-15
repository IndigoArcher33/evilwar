-- [yue]: darkrp_modules\ragdolls\sh_use.yue
local Cannibalism -- 1
do -- 1
	local _class_0 -- 1
	local _parent_0 = SOUND -- 1
	local _base_0 = { -- 1
		sound = (function() -- 2
			local _accum_0 = { } -- 2
			local _len_0 = 1 -- 2
			for i = 2, 3 do -- 2
				_accum_0[_len_0] = "npc/barnacle/barnacle_crunch" .. tostring(i) .. ".wav" -- 2
				_len_0 = _len_0 + 1 -- 2
			end -- 2
			return _accum_0 -- 2
		end)() -- 1
	} -- 1
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 2
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 1
			_base_0[_key_0] = _val_0 -- 1
		end -- 1
	end -- 2
	if _base_0.__index == nil then -- 1
		_base_0.__index = _base_0 -- 1
	end -- 2
	setmetatable(_base_0, _parent_0.__base) -- 1
	_class_0 = setmetatable({ -- 1
		__init = function(self, ...) -- 1
			return _class_0.__parent.__init(self, ...) -- 1
		end, -- 1
		__base = _base_0, -- 1
		__name = "Cannibalism", -- 1
		__parent = _parent_0 -- 1
	}, { -- 1
		__index = function(cls, name) -- 1
			local val = rawget(_base_0, name) -- 1
			if val == nil then -- 1
				local parent = rawget(cls, "__parent") -- 1
				if parent then -- 1
					return parent[name] -- 1
				end -- 1
			else -- 1
				return val -- 1
			end -- 1
		end, -- 1
		__call = function(cls, ...) -- 1
			local _self_0 = setmetatable({ }, _base_0) -- 1
			cls.__init(_self_0, ...) -- 1
			return _self_0 -- 1
		end -- 1
	}) -- 1
	_base_0.__class = _class_0 -- 1
	if _parent_0.__inherited then -- 1
		_parent_0.__inherited(_parent_0, _class_0) -- 1
	end -- 1
	Cannibalism = _class_0 -- 1
end -- 2
local gibs = { -- 4
	"models/gibs/humans/mgib_01.mdl", -- 4
	"models/gibs/humans/mgib_02.mdl", -- 5
	"models/gibs/humans/mgib_03.mdl", -- 6
	"models/gibs/humans/mgib_04.mdl", -- 7
	"models/gibs/humans/mgib_05.mdl", -- 8
	"models/gibs/humans/mgib_06.mdl", -- 9
	"models/gibs/humans/mgib_07.mdl" -- 10
} -- 4
local create_gibs -- 12
create_gibs = function(pos) -- 12
	local amt = math.random(2, 4) -- 13
	for i = 1, amt do -- 14
		local gib = ents.Create("gib") -- 15
		gib:SetModel(gibs[math.random(#gibs)]) -- 17
		gib:SetPos(pos) -- 18
		gib:SetCollisionGroup(COLLISION_GROUP_NONE) -- 19
		gib:SetMoveType(MOVETYPE_VPHYSICS) -- 20
		gib:Spawn() -- 21
		SafeRemoveEntityDelayed(gib, math.random(5, 10)) -- 22
	end -- 22
	local ed = EffectData() -- 23
	ed:SetOrigin(pos) -- 25
	ed:SetScale(0.4) -- 26
	return util.Effect("evilrp_gored", ed) -- 27
end -- 12
local pick_up -- 29
pick_up = function(ply, key) -- 29
	if not SERVER then -- 30
		return -- 30
	end -- 30
	if not (key == IN_USE) then -- 31
		return -- 31
	end -- 31
	if ply:Crouching() then -- 32
		return -- 32
	end -- 32
	if ply:Team() == TEAM_GHOST then -- 33
		return -- 33
	end -- 33
	local tr = GAMEMODE:GetHandTrace(ply, 80) -- 34
	if not (tr.Entity and IsValid(tr.Entity)) then -- 35
		return -- 35
	end -- 35
	local rag = tr.Entity -- 36
	if rag:GetClass() ~= "prop_ragdoll" then -- 37
		return -- 37
	end -- 37
	return ply:PickupObject(rag) -- 38
end -- 29
hook.Add("KeyPress", "evilrp_pick_up_bodies", pick_up) -- 40
local cannibalism -- 42
cannibalism = function(ply, key) -- 42
	if not (key == IN_USE) then -- 43
		return -- 43
	end -- 43
	if not ply:Crouching() then -- 44
		return -- 44
	end -- 44
	if ply:Team() == TEAM_GHOST then -- 45
		return -- 45
	end -- 45
	if not ply:HasOddity(ODDITY_CANNIBALISM) then -- 46
		return -- 46
	end -- 46
	local ct = CurTime() -- 47
	local tr = GAMEMODE:GetHandTrace(ply, 50) -- 48
	if not (tr.Entity and IsValid(tr.Entity)) then -- 49
		return -- 49
	end -- 49
	local rag = tr.Entity -- 50
	if rag:GetClass() ~= "prop_ragdoll" then -- 51
		return -- 51
	end -- 51
	if not rag:GetNWBool("corpse") then -- 52
		return -- 52
	end -- 52
	if not ply.next_cannibalism then -- 53
		ply.next_cannibalism = ct + .5 -- 53
	end -- 53
	if ct < ply.next_cannibalism then -- 54
		return -- 54
	end -- 54
	ply:DoAnimationEvent(ACT_GMOD_GESTURE_RANGE_FRENZY) -- 55
	if not SERVER then -- 56
		return -- 56
	end -- 56
	local descs = { -- 58
		tostring(rag:GetNWString("body_name")) .. "'s lifeless body", -- 58
		"the maggot infested corpse", -- 59
		"the shriveled carcass", -- 60
		"the cracked pile of bones" -- 61
	} -- 57
	local phrases = { -- 64
		"chews open", -- 64
		"bites into", -- 65
		"munches at", -- 66
		"sinks teeth into" -- 67
	} -- 63
	local decomp = rag:GetNWInt("decomp_stage") -- 69
	local phrase = tostring(phrases[math.random(#phrases)]) .. " " .. tostring(descs[decomp]) .. "!" -- 70
	if DSTAGE_FRESH == decomp or DSTAGE_EARLY == decomp or DSTAGE_BLACK == decomp then -- 72
		ply:ConCommand("say /me " .. tostring(phrase)) -- 73
		rag:EmitSound("Cannibalism") -- 74
		rag:SetNWInt("decomp_finish", rag:GetNWInt("decomp_finish") - 30) -- 75
		ply:AddHunger(math.random(-16, -8)) -- 76
		return create_gibs(tr.HitPos) -- 77
	elseif DSTAGE_BONES == decomp then -- 78
		ply:ConCommand("say /me gnaws on bones and breaks a tooth!") -- 79
		rag:EmitSound("Hand_Break") -- 80
		local dmg = DamageInfo() -- 81
		dmg:SetDamageType(DMG_CLUB) -- 83
		dmg:SetDamagePosition(tr.HitPos) -- 84
		dmg:SetAttacker(ply) -- 85
		dmg:SetInflictor(rag) -- 86
		dmg:SetDamage(10 + math.random(5, 15)) -- 87
		return ply:TakeDamageInfo(dmg) -- 88
	end -- 89
end -- 42
hook.Add("KeyPress", "evilrp_cannibalism", cannibalism) -- 90
local Necromance -- 92
do -- 92
	local _class_0 -- 92
	local _parent_0 = SOUND -- 92
	local _base_0 = { -- 92
		sound = (function() -- 93
			local _accum_0 = { } -- 93
			local _len_0 = 1 -- 93
			for i = 1, 3 do -- 93
				_accum_0[_len_0] = "ambient/voices/citizen_beaten" .. tostring(i) .. ".wav" -- 93
				_len_0 = _len_0 + 1 -- 93
			end -- 93
			return _accum_0 -- 93
		end)() -- 92
	} -- 92
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 93
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 92
			_base_0[_key_0] = _val_0 -- 92
		end -- 92
	end -- 93
	if _base_0.__index == nil then -- 92
		_base_0.__index = _base_0 -- 92
	end -- 93
	setmetatable(_base_0, _parent_0.__base) -- 92
	_class_0 = setmetatable({ -- 92
		__init = function(self, ...) -- 92
			return _class_0.__parent.__init(self, ...) -- 92
		end, -- 92
		__base = _base_0, -- 92
		__name = "Necromance", -- 92
		__parent = _parent_0 -- 92
	}, { -- 92
		__index = function(cls, name) -- 92
			local val = rawget(_base_0, name) -- 92
			if val == nil then -- 92
				local parent = rawget(cls, "__parent") -- 92
				if parent then -- 92
					return parent[name] -- 92
				end -- 92
			else -- 92
				return val -- 92
			end -- 92
		end, -- 92
		__call = function(cls, ...) -- 92
			local _self_0 = setmetatable({ }, _base_0) -- 92
			cls.__init(_self_0, ...) -- 92
			return _self_0 -- 92
		end -- 92
	}) -- 92
	_base_0.__class = _class_0 -- 92
	if _parent_0.__inherited then -- 92
		_parent_0.__inherited(_parent_0, _class_0) -- 92
	end -- 92
	Necromance = _class_0 -- 92
end -- 93
local necrophilia -- 95
necrophilia = function(ply, key) -- 95
	if not (key == IN_USE) then -- 96
		return -- 96
	end -- 96
	if not ply:Crouching() then -- 97
		return -- 97
	end -- 97
	if ply:Team() == TEAM_GHOST then -- 98
		return -- 98
	end -- 98
	if not ply:HasOddity(ODDITY_NECROPHILIA) then -- 99
		return -- 99
	end -- 99
	local ct = CurTime() -- 100
	local tr = GAMEMODE:GetHandTrace(ply, 50) -- 101
	if not (tr.Entity and IsValid(tr.Entity)) then -- 102
		return -- 102
	end -- 102
	local rag = tr.Entity -- 103
	if rag:GetClass() ~= "prop_ragdoll" then -- 104
		return -- 104
	end -- 104
	if not rag:GetNWBool("corpse") then -- 105
		return -- 105
	end -- 105
	if rag:GetNWBool("molested") then -- 106
		return -- 106
	end -- 106
	ply:DoAnimationEvent(ACT_GMOD_GESTURE_RANGE_FRENZY) -- 107
	if not SERVER then -- 108
		return -- 108
	end -- 108
	local descs = { -- 110
		tostring(rag:GetNWString("body_name")) .. "'s lifeless body", -- 110
		"the maggot infested corpse", -- 111
		"the shriveled carcass", -- 112
		"the cracked pile of bones" -- 113
	} -- 109
	local phrases = { -- 116
		"caresses", -- 116
		"kisses", -- 117
		"hugs", -- 118
		"does something bad with" -- 119
	} -- 115
	local moans = { -- 122
		"Ohh YES!", -- 122
		"Sweetheart...", -- 123
		"You feel disgusting and you love it.", -- 124
		"Oh my." -- 125
	} -- 121
	local decomp = rag:GetNWInt("decomp_stage") -- 127
	local phrase = tostring(phrases[math.random(#phrases)]) .. " " .. tostring(descs[decomp]) .. "!" -- 128
	ply:ConCommand("say /me " .. tostring(phrase)) -- 129
	rag:EmitSound("Necromance") -- 130
	local desp = 7 * decomp -- 131
	ply:AddDespair(-desp) -- 132
	rag:SetNWBool("molested", true) -- 133
	if decomp == DSTAGE_BONES then -- 134
		rag:EmitSound("Hand_Break") -- 135
		local dmg = DamageInfo() -- 136
		dmg:SetDamageType(DMG_SLASH) -- 138
		dmg:SetDamagePosition(tr.HitPos) -- 139
		dmg:SetAttacker(ply) -- 140
		dmg:SetInflictor(rag) -- 141
		dmg:SetDamage(20 + math.random(5, 15)) -- 142
		ply:TakeDamageInfo(dmg) -- 143
		ply:SendChat("GENERIC", "<c=200,0,0>OUCH.") -- 144
	end -- 134
	local range = 512 ^ 2 -- 145
	local _list_0 = player.GetAll() -- 146
	for _index_0 = 1, #_list_0 do -- 146
		local p = _list_0[_index_0] -- 146
		local _continue_0 = false -- 147
		repeat -- 147
			if p == ply then -- 147
				_continue_0 = true -- 147
				break -- 147
			end -- 147
			if p:Team() == TEAM_GHOST then -- 148
				_continue_0 = true -- 148
				break -- 148
			end -- 148
			if not (p:CanSee(ply) and p:CanSee(rag)) then -- 149
				_continue_0 = true -- 149
				break -- 149
			end -- 149
			if not (p:GetPos():DistToSqr(ply:GetPos()) <= range) then -- 150
				_continue_0 = true -- 150
				break -- 150
			end -- 150
			local text = "You feel very disturbed." -- 151
			if p:HasOddity(ODDITY_NECROPHILIA) then -- 152
				text = "You feel jealous." -- 152
			end -- 152
			p:SendChat("GENERIC", "<c=200,0,0>" .. tostring(text)) -- 153
			p:AddDespair(desp) -- 154
			_continue_0 = true -- 147
		until true -- 154
		if not _continue_0 then -- 154
			break -- 154
		end -- 154
	end -- 154
end -- 95
return hook.Add("KeyPress", "evilrp_necrophilia", necrophilia) -- 156
