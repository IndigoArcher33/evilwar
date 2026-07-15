-- [yue]: darkrp_modules\ragdolls\sh_ragdolls.yue
DSTAGE_FRESH = 1 -- 1
DSTAGE_EARLY = 2 -- 2
DSTAGE_BLACK = 3 -- 3
DSTAGE_BONES = 4 -- 4
local pmeta = FindMetaTable("Player") -- 6
local racism -- 8
racism = function(who) -- 8
	local text = "Not like me." -- 9
	if who:GetModel() == lp:GetModel() then -- 10
		text = "Brother in blood." -- 10
	end -- 10
	return { -- 11
		text = text, -- 11
		font = "Spleen_Label_Small" -- 11
	} -- 11
end -- 8
hud_render_ragdoll = function(self) -- 15
	if (not lp:Alive()) and self == lp:Ragdoll() then -- 16
		return -- 16
	end -- 16
	local ct = { } -- 17
	local name = self:GetNWString("body_name") -- 18
	if name then -- 19
		ct[#ct + 1] = { -- 20
			text = name -- 20
		} -- 20
	end -- 19
	local decomp = self:GetNWInt("decomp_stage", DSTAGE_FRESH) -- 21
	if self:GetNWBool("corpse", false) == true then -- 22
		ct[#ct + 1] = { -- 23
			text = "Living no longer.", -- 23
			font = "Spleen_Label_Small" -- 23
		} -- 23
	end -- 22
	if DSTAGE_FRESH == decomp then -- 25
		ct[#ct + 1] = racism(self) -- 26
	elseif DSTAGE_EARLY == decomp then -- 27
		ct[#ct + 1] = { -- 28
			text = "<wiggle=1>Decomposition has begun.", -- 28
			font = "Spleen_Label_Small" -- 29
		} -- 28
	elseif DSTAGE_BLACK == decomp then -- 30
		ct[#ct + 1] = { -- 31
			text = "<wiggle=1>Consumed by rot...", -- 31
			font = "Spleen_Label_Small" -- 32
		} -- 31
	elseif DSTAGE_BONES == decomp then -- 33
		ct[#ct + 1] = { -- 34
			text = "<wiggle=1>Nothing remains of this one.", -- 34
			font = "Spleen_Label_Small" -- 35
		} -- 34
	end -- 35
	if self:GetNWBool("headless", false) == true then -- 37
		ct[#ct + 1] = { -- 38
			text = "What happened to its head?", -- 38
			font = "Spleen_Label_Small" -- 38
		} -- 38
	end -- 37
	if self:GetNWBool("molested", false) == true then -- 39
		ct[#ct + 1] = { -- 40
			text = "Someone did something terrible with it.", -- 40
			font = "Spleen_Label_Small" -- 40
		} -- 40
	end -- 39
	return ct -- 41
end -- 15
local get_player_color -- 44
get_player_color = function(self) -- 44
	local ply = self:GetNWEntity("player") -- 45
	if not (ply and IsValid(ply)) then -- 46
		return Vector(1, 1, 1) -- 46
	end -- 46
	return ply:GetPlayerColor() -- 47
end -- 44
local refresh_body -- 49
refresh_body = function(self) -- 49
	local ply = self:GetNWEntity("player") -- 50
	if ply and IsValid(ply) then -- 51
		for i = 1, 20 do -- 52
			self:SetBodygroup(i, ply:GetBodygroup(i)) -- 52
		end -- 52
	else -- 54
		for i = 1, 20 do -- 54
			self:SetBodygroup(i, 0) -- 54
		end -- 54
	end -- 51
end -- 49
local gibs = { -- 56
	"models/gibs/humans/mgib_01.mdl", -- 56
	"models/gibs/humans/mgib_02.mdl", -- 57
	"models/gibs/humans/mgib_03.mdl", -- 58
	"models/gibs/humans/mgib_04.mdl", -- 59
	"models/gibs/humans/mgib_05.mdl", -- 60
	"models/gibs/humans/mgib_06.mdl", -- 61
	"models/gibs/humans/mgib_07.mdl" -- 62
} -- 56
for k, v in pairs({ -- 65
	GetBodyEntity = function(self) -- 65
		if not self.Ragdoll then -- 66
			return self -- 66
		end -- 66
		local rag = self:Ragdoll() -- 67
		if rag and IsValid(rag) and not (rag:GetNWBool("corpse") and self:Alive()) then -- 68
			return rag -- 68
		end -- 68
		return self -- 69
	end, -- 65
	GetHeadPos = function(self) -- 70
		local head = self:LookupBone("ValveBiped.Bip01_Head1") -- 71
		if head then -- 72
			return self:GetBonePosition(head) -- 73
		else -- 75
			return self:EyePos() -- 75
		end -- 72
	end, -- 70
	Ragdoll = function(self) -- 76
		return self:GetNWEntity("ragdoll") -- 76
	end, -- 76
	MakeRagdollClone = function(self, force) -- 77
		local rag = self:Ragdoll() -- 78
		if rag and IsValid(rag) then -- 79
			rag:Remove() -- 79
		end -- 79
		local vel = self:GetVelocity() + (self:GetAimVector() * 128) -- 80
		rag = ents.Create("prop_ragdoll") -- 81
		do -- 82
			rag:SetPos(self:GetPos()) -- 83
			rag:SetAngles(self:GetAngles()) -- 84
			rag:SetModel(self:GetModel()) -- 85
			rag:SetSkin(self:GetSkin()) -- 86
			for i = 1, 20 do -- 87
				rag:SetBodygroup(i, self:GetBodygroup(i)) -- 87
			end -- 87
			rag:Spawn() -- 88
			rag:Activate() -- 89
			rag:SetCollisionGroup(COLLISION_GROUP_WEAPON) -- 90
			rag.GetPlayerColor = get_player_color -- 91
			rag:SetNWEntity("player", self) -- 92
			rag:SetNWString("body_name", self:Name()) -- 93
			rag.Submitted = function(self) -- 94
				local ply = self:GetNWEntity("player") -- 95
				if ply and IsValid(ply) and not ply:Alive() then -- 96
					ply:changeTeam(TEAM_GHOST) -- 97
					ply:Spawn() -- 98
				end -- 96
				self:EmitSound("Submit_Flesh") -- 99
				local pos = self:GetPos() -- 100
				for i = 1, #gibs do -- 101
					local gib = ents.Create("gib") -- 102
					gib:SetModel(gibs[i]) -- 104
					gib:SetPos(pos) -- 105
					gib:SetCollisionGroup(COLLISION_GROUP_NONE) -- 106
					gib:SetMoveType(MOVETYPE_VPHYSICS) -- 107
					gib:Spawn() -- 108
					SafeRemoveEntityDelayed(gib, math.random(5, 10)) -- 109
				end -- 109
			end -- 94
			rag.Precursor = { -- 111
				biomass = math.random(4, 7) -- 111
			} -- 110
			rag.GetManager = function(self) -- 112
				if not (SERVER and AR_Manager) then -- 113
					return -- 113
				end -- 113
				local controller = AR_Manager.ActiveRagdolls[self] -- 114
				return controller -- 115
			end -- 112
			local hidx = rag:LookupBone("ValveBiped.Bip01_Head1") -- 116
			for i = 1, rag:GetPhysicsObjectCount() do -- 117
				local phys_obj = rag:GetPhysicsObjectNum(i) -- 118
				local bidx = rag:TranslatePhysBoneToBone(i) -- 119
				local pos, ang = self:GetBonePosition(bidx) -- 120
				if IsValid(phys_obj) then -- 121
					phys_obj:SetPos(pos) -- 122
					phys_obj:SetAngles(ang) -- 123
					if force then -- 124
						if bidx == hidx then -- 125
							phys_obj:ApplyForceCenter(force * 1.5) -- 126
						else -- 128
							phys_obj:ApplyForceCenter(force) -- 128
						end -- 125
					else -- 130
						if bidx == hidx then -- 130
							phys_obj:SetVelocity(vel * 1.5) -- 131
						else -- 133
							phys_obj:SetVelocity(vel) -- 133
						end -- 130
					end -- 124
				end -- 121
			end -- 133
		end -- 82
		self:SetNWEntity("ragdoll", rag) -- 134
		netstream.Broadcast("RagdollAppearanceAltered", rag) -- 135
		return rag -- 136
	end, -- 77
	SnapFromRagdollClone = function(self) -- 137
		local rag = self:Ragdoll() -- 138
		if rag and IsValid(rag) then -- 139
			self:SetPos(rag:GetPos()) -- 140
			return rag:Remove() -- 141
		end -- 139
	end, -- 137
	DeathRagdoll = function(self, dmg) -- 142
		local force = dmg:GetDamageForce() -- 143
		if dmg:IsDamageType(DMG_BULLET + DMG_CLUB + DMG_CRUSH) then -- 144
			force = force / 20 -- 144
		end -- 144
		local rag = self:MakeRagdollClone(force) -- 145
		if rag and IsValid(rag) then -- 146
			rag:SetNWBool("corpse", true) -- 148
			rag:SetNWInt("decomp_start", CurTime()) -- 149
			rag:SetNWInt("decomp_finish", CurTime() + 120) -- 150
			rag:SetNWInt("decomp_stage", 1) -- 151
			local jt = self:getJobTable() -- 152
			do -- 153
				local _obj_0 = jt.HandleRagdoll -- 153
				if _obj_0 ~= nil then -- 153
					_obj_0(rag, self) -- 153
				end -- 153
			end -- 153
		end -- 146
		if self:LastHitGroup() == HITGROUP_HEAD then -- 154
			local bidx = self:LookupBone("ValveBiped.Bip01_Head1") -- 155
			if bidx then -- 156
				return GAMEMODE:ExplodeHead(rag, bidx) -- 157
			end -- 156
		end -- 154
	end -- 142
}) do -- 158
	pmeta[k] = v -- 64
end -- 64
if CLIENT then -- 160
	local ragdoll_created -- 161
	ragdoll_created = function(ent) -- 161
		if not (ent:GetClass() == "prop_ragdoll") then -- 162
			return -- 162
		end -- 162
		return timer.Create("attempt_appearance_" .. tostring(ent:EntIndex()), 0.005, 16, function() -- 163
			local ply = ent:GetNWEntity("player") -- 164
			if ply and IsValid(ply) then -- 165
				part.Copy(ply, ent) -- 166
				return timer.Remove("attempt_appearance_" .. tostring(ent:EntIndex())) -- 167
			end -- 165
		end) -- 167
	end -- 161
	hook.Add("OnEntityCreated", "evilrp_ragdoll_created", ragdoll_created) -- 168
	netstream.Hook("RagdollAppearanceAltered", function(rag, payload) -- 169
		if not (rag and IsValid(rag)) then -- 170
			return -- 170
		end -- 170
		return part.Add(rag, "appearance", payload) -- 171
	end) -- 169
end -- 160
for k, v in pairs({ -- 174
	ExplodeHead = function(self, rag, bidx) -- 174
		if (rag:GetClass() == "prop_ragdoll") and (not rag:GetNWBool("headless")) then -- 175
			rag:SetNWBool("headless", true) -- 177
			rag:SetNWBool("alive", false) -- 178
			if string.find(rag:GetModel(), "models/liver_failure") then -- 179
				rag:SetBodygroup(0, 3) -- 180
				local _list_0 = { -- 181
					8, -- 181
					7, -- 181
					6, -- 181
					5, -- 181
					4, -- 181
					3 -- 181
				} -- 181
				for _index_0 = 1, #_list_0 do -- 181
					local slot = _list_0[_index_0] -- 181
					rag:SetBodygroup(slot, 0) -- 182
				end -- 182
			else -- 184
				rag:ManipulateBoneScale(bidx, Vector(0, 0, 0)) -- 184
			end -- 179
			timer.Simple((FrameTime() * 3), function() -- 186
				if IsValid(rag) then -- 187
					rag:EmitSound("placenta/head_explodie_0" .. tostring(math.random(1, 4)) .. ".ogg", 100, 100, 1) -- 188
					return rag:EmitSound("physics/flesh/flesh_squishy_impact_hard" .. tostring(math.random(1, 4)) .. ".wav", 100, 100, 1) -- 189
				end -- 187
			end) -- 186
			util.Blood(rag:GetBonePosition(bidx), math.random(12, 16), Vector(0, 0, 1 + math.random(2)), 128) -- 191
			for i = 1, 6 do -- 193
				local gib = ents.Create("gib") -- 194
				gib:SetModel("models/mosi/fnv/props/gore/gorehead0" .. tostring(i) .. ".mdl") -- 196
				gib:SetPos(rag:GetBonePosition(bidx)) -- 197
				gib:SetCollisionGroup(COLLISION_GROUP_WEAPON) -- 198
				gib:SetMoveType(MOVETYPE_VPHYSICS) -- 199
				gib:Spawn() -- 200
				local phys = gib:GetPhysicsObject() -- 202
				if IsValid(phys) then -- 203
					phys:SetVelocity(Vector(math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(-1, 1)) * math.random(100, 200)) -- 204
				end -- 203
				SafeRemoveEntityDelayed(gib, math.random(55, 65)) -- 206
			end -- 206
		end -- 175
	end -- 174
}) do -- 208
	GAMEMODE[k] = v -- 173
end -- 173
local do_player_death -- 210
do_player_death = function(ply, attacker, dmg) -- 210
	local rag = ply:DeathRagdoll(dmg) -- 211
	local wep = ply:GetActiveWeapon() -- 212
	local can_drop = hook.Call("canDropWeapon", self, ply, weapon) -- 213
	if (GAMEMODE.Config.dropweapondeath or ply.dropWeaponOnDeath) and wep:IsValid() and can_drop then -- 214
		ply:dropDRPWeapon(wep) -- 215
	end -- 214
	if dmg:IsDamageType(DMG_BLAST) and dmg:GetDamage() > 30 then -- 217
		timer.Simple(0.02, function() -- 218
			rag = ply:Ragdoll() -- 219
			local pos = rag:GetPos() -- 220
			local vel = rag:GetVelocity() -- 221
			local where = rag:GetPos() -- 222
			rag:Remove() -- 223
			for i = 1, #gibs do -- 224
				local gib = ents.Create("gib") -- 225
				gib:SetModel(gibs[i]) -- 227
				gib:SetPos(pos) -- 228
				gib:SetCollisionGroup(COLLISION_GROUP_NONE) -- 229
				gib:SetMoveType(MOVETYPE_VPHYSICS) -- 230
				gib:PhysicsInit(SOLID_VPHYSICS) -- 231
				gib:Spawn() -- 232
				local phys = gib:GetPhysicsObject() -- 233
				if IsValid(phys) then -- 234
					phys:SetVelocity(vel) -- 234
				end -- 234
				SafeRemoveEntityDelayed(gib, math.random(55, 65)) -- 235
			end -- 235
			ply:changeTeam(TEAM_GHOST) -- 236
			ply:Spawn() -- 237
			return ply:SetPos(where) -- 238
		end) -- 218
	end -- 217
	return -- 239
end -- 210
hook.Add("DoPlayerDeath", "evilrp_ragdolls", do_player_death) -- 240
local Skin_Corpse -- 242
do -- 242
	local _class_0 -- 242
	local _parent_0 = SOUND -- 242
	local _base_0 = { -- 242
		sound = (function() -- 243
			local _accum_0 = { } -- 243
			local _len_0 = 1 -- 243
			for i = 1, 3 do -- 243
				_accum_0[_len_0] = "physics/flesh/flesh_bloody_impact_hard" .. tostring(i) .. ".wav" -- 243
				_len_0 = _len_0 + 1 -- 243
			end -- 243
			return _accum_0 -- 243
		end)() -- 242
	} -- 242
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 243
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 242
			_base_0[_key_0] = _val_0 -- 242
		end -- 242
	end -- 243
	if _base_0.__index == nil then -- 242
		_base_0.__index = _base_0 -- 242
	end -- 243
	setmetatable(_base_0, _parent_0.__base) -- 242
	_class_0 = setmetatable({ -- 242
		__init = function(self, ...) -- 242
			return _class_0.__parent.__init(self, ...) -- 242
		end, -- 242
		__base = _base_0, -- 242
		__name = "Skin_Corpse", -- 242
		__parent = _parent_0 -- 242
	}, { -- 242
		__index = function(cls, name) -- 242
			local val = rawget(_base_0, name) -- 242
			if val == nil then -- 242
				local parent = rawget(cls, "__parent") -- 242
				if parent then -- 242
					return parent[name] -- 242
				end -- 242
			else -- 242
				return val -- 242
			end -- 242
		end, -- 242
		__call = function(cls, ...) -- 242
			local _self_0 = setmetatable({ }, _base_0) -- 242
			cls.__init(_self_0, ...) -- 242
			return _self_0 -- 242
		end -- 242
	}) -- 242
	_base_0.__class = _class_0 -- 242
	if _parent_0.__inherited then -- 242
		_parent_0.__inherited(_parent_0, _class_0) -- 242
	end -- 242
	Skin_Corpse = _class_0 -- 242
end -- 243
local entity_take_damage -- 245
entity_take_damage = function(rag, dmg) -- 245
	if not (rag:GetClass() == "prop_ragdoll") then -- 246
		return -- 246
	end -- 246
	if not rag:GetNWBool("corpse") then -- 247
		return -- 247
	end -- 247
	local ct = CurTime() -- 248
	local bidx = rag:LookupBone("ValveBiped.Bip01_Head1") -- 250
	local dpos = dmg:GetDamagePosition() -- 251
	local fdir = dmg:GetDamageForce() -- 252
	if not fdir then -- 253
		fdir = VectorRand() * 80 -- 253
	end -- 253
	util.Blood(dpos, (dmg:GetDamage() / 4), fdir, dmg:GetDamage() * 2) -- 254
	if bidx and (not rag:GetNWBool("headless")) and dpos:DistToSqr(rag:GetBonePosition(bidx)) < 40 then -- 255
		if math.random(100) <= dmg:GetDamage() then -- 256
			GAMEMODE:ExplodeHead(rag, bidx) -- 256
		end -- 256
	end -- 255
	local attacker = dmg:GetAttacker() -- 258
	if IsValid(attacker) and attacker:IsPlayer() then -- 259
		local decomp = rag:GetNWInt("decomp_stage") -- 260
		local wep = attacker:GetActiveWeapon() -- 261
		if decomp == 1 and wep.SkinHarvest then -- 262
			local amt = math.random(1, 2) -- 263
			for i = 1, amt do -- 264
				rag:EmitSound("Skin_Corpse") -- 265
				util.Effect("evilrp_blood", ed) -- 266
				local skin = ents.Create("item/food/skin") -- 267
				skin:SetPos(dpos) -- 269
				skin:Spawn() -- 270
				skin:Activate() -- 271
			end -- 271
			rag:SetNWInt("decomp_finish", ct) -- 272
		end -- 262
	end -- 259
	if dmg:IsDamageType(DMG_BURN) and rag:GetNWInt("corpse") and math.random(1, 5) == 3 and rag:GetNWInt("decomp_stage") < 3 then -- 274
		rag:SetNWInt("decomp_finish", ct) -- 275
	end -- 274
	return -- 276
end -- 245
hook.Add("EntityTakeDamage", "evilrp_ragdolls", entity_take_damage) -- 277
local ghost_on_ragdoll_remove -- 279
ghost_on_ragdoll_remove = function(ent) -- 279
	if not SERVER then -- 280
		return -- 280
	end -- 280
	if true then -- 281
		return -- 281
	end -- 281
	if ent:GetClass() == "prop_ragdoll" then -- 282
		local ply = ent:GetNWEntity("player", NULL) -- 283
		if not (ply and IsValid(ply)) then -- 284
			return -- 284
		end -- 284
		if not ply:Alive() then -- 285
			ply:changeTeam(TEAM_GHOST) -- 286
			local where = ent:GetPos() + Vector(0, 0, 8) -- 287
			ply:SetPos(where) -- 288
			ply:Spawn() -- 289
			MsgC(Color(200, 0, 0), "OOPS: " .. tostring(ply) .. "\n") -- 290
		end -- 285
	end -- 282
	return -- 291
end -- 279
hook.Add("EntityRemoved", "evilrp_ragdolls", ghost_on_ragdoll_remove) -- 292
local prevent_fallen_movement -- 294
prevent_fallen_movement = function(ply, mv) -- 294
	local rag = ply:Ragdoll() -- 295
	if ply:Fallen() and (rag and IsValid(rag)) then -- 296
		ply:SetNetworkOrigin(rag:GetNetworkOrigin()) -- 297
		return true -- 298
	end -- 296
	return -- 299
end -- 294
return hook.Add("FinishMove", "evilrp_ragdolls", prevent_fallen_movement) -- 300
