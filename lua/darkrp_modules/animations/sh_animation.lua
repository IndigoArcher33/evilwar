-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/animations/sh_animation.yue
if SERVER then -- 1
	util.AddNetworkString("evilrp_playsignal") -- 2
	util.AddNetworkString("evilrp_playvcd") -- 3
end -- 1
net.Receive("evilrp_playsignal", function(len, ply) -- 5
	local mode = net.ReadBit() -- 6
	local act = nil -- 7
	if mode == 0 then -- 8
		act = net.ReadUInt(16) -- 9
	else -- 11
		act = net.ReadString() -- 11
	end -- 8
	if SERVER then -- 13
		if mode == 0 then -- 14
			local rf = { } -- 15
			local _list_0 = player.GetAll() -- 16
			for _index_0 = 1, #_list_0 do -- 16
				local p = _list_0[_index_0] -- 16
				if not (v == ply) then -- 17
					rf[#rf + 1] = p -- 17
				end -- 17
			end -- 17
			net.Start("evilrp_playsignal") -- 18
			net.WriteBit(false) -- 19
			net.WriteUInt(act, 16) -- 20
			net.WriteEntity(ply) -- 21
			return net.Send(rf) -- 22
		else -- 24
			return ply:PlayVCD(act) -- 24
		end -- 14
	else -- 26
		ply = net.ReadEntity() -- 26
		if ply and IsValid(ply) then -- 27
			if mode == 0 then -- 28
				return ply:AnimRestartGesture(GESTURE_SLOT_CUSTOM, act, true) -- 29
			else -- 31
				return ply:PlayVCD(act) -- 31
			end -- 28
		end -- 27
	end -- 13
end) -- 5
net.Receive("evilrp_playvcd", function(len) -- 33
	if SERVER then -- 34
		return -- 34
	end -- 34
	local ent = net.ReadEntity() -- 35
	local seq = net.ReadString() -- 36
	if ent and IsValid(ent) then -- 37
		return ent:AddVCDSequenceToGestureSlot(GESTURE_SLOT_CUSTOM, ent:LookupSequence(seq), 0, true) -- 38
	end -- 37
end) -- 33
local pmeta = FindMetaTable("Player") -- 40
for k, v in pairs({ -- 42
	PlaySignal = function(self, act, sendtoself) -- 42
		local mode = nil -- 43
		if type(act) == "number" then -- 44
			mode = 0 -- 45
		else -- 47
			mode = 1 -- 47
		end -- 44
		if CLIENT then -- 48
			if mode == 0 then -- 49
				self:AnimRestartGesture(GESTURE_SLOT_CUSTOM, act, true) -- 50
			else -- 52
				self:PlayVCD(act) -- 52
			end -- 49
			net.Start("evilrp_playsignal") -- 53
			net.WriteBit(mode == 1) -- 54
			if mode == 0 then -- 55
				net.WriteUInt(act, 16) -- 56
			else -- 58
				net.WriteString(act) -- 58
			end -- 55
			return net.SendToServer() -- 59
		else -- 61
			local rf = { } -- 61
			local _list_0 = player.GetAll() -- 62
			for _index_0 = 1, #_list_0 do -- 62
				local p = _list_0[_index_0] -- 62
				if (p ~= self) or sendtoself then -- 63
					rf[#rf + 1] = p -- 63
				end -- 63
			end -- 63
			net.Start("evilrp_playsignal") -- 64
			net.WriteBit(mode == 1) -- 65
			if mode == 0 then -- 66
				net.WriteUInt(act, 16) -- 67
			else -- 69
				net.WriteString(act) -- 69
			end -- 66
			net.WriteEntity(self) -- 70
			return net.Send(rf) -- 71
		end -- 48
	end, -- 42
	PlayVCD = function(self, seq, send_to_self) -- 72
		if CLIENT then -- 73
			return self:AddVCDSequenceToGestureSlot(GESTURE_SLOT_CUSTOM, self:LookupSequence(seq), 0, true) -- 74
		else -- 76
			local rf = { } -- 76
			local _list_0 = player.GetAll() -- 77
			for _index_0 = 1, #_list_0 do -- 77
				local p = _list_0[_index_0] -- 77
				if (v ~= self or send_to_self) then -- 78
					rf[#rf + 1] = v -- 78
				end -- 78
			end -- 78
			net.Start("evilrp_playvcd") -- 79
			net.WriteEntity(self) -- 80
			net.WriteString(seq) -- 81
			return net.Send(rf) -- 82
		end -- 73
	end -- 72
}) do -- 83
	pmeta[k] = v -- 41
end -- 41
local handle_player_jumping -- 85
handle_player_jumping = function(ply, vel) -- 85
	local sprinting = ply:KeyDown(IN_SPEED) -- 86
	local jumping = ply:KeyDown(IN_JUMP) -- 87
	local ct = CurTime() -- 88
	local team = ply:Team() -- 89
	if ply:Alive() and not ply:IsOnGround() and sprinting and jumping then -- 90
		ply.CalcIdeal = ACT_MP_SWIM -- 91
		return true -- 92
	end -- 90
	if ply:GetMoveType() == MOVETYPE_NOCLIP then -- 93
		ply.m_bJumping = false -- 94
		return -- 95
	end -- 93
	if (not ply.m_bJumping) and (not ply:OnGround()) and ply:WaterLevel() <= 0 then -- 99
		if (not ply.m_fGroundTime) then -- 100
			ply.m_fGroundTime = ct -- 101
		elseif (ct - ply.m_fGroundTime > 0) and vel:Length2DSqr() < 0.25 then -- 102
			ply.m_bJumping = true -- 103
			ply.m_bFirstJumpFrame = false -- 104
			ply.m_flJumpStartTime = 0 -- 105
		end -- 100
	end -- 99
	if ply.m_bJumping then -- 106
		if ply.m_bFirstJumpFrame then -- 108
			if SERVER and team ~= TEAM_GHOST then -- 109
				ply:EmitSound("placenta/speech/jump.wav", 75, math.random(80, 90)) -- 110
			end -- 109
			ply.m_bFirstJumpFrame = false -- 112
			ply:AnimRestartMainSequence() -- 113
		end -- 108
		if (ply:WaterLevel() >= 2) or ((ct - ply.m_flJumpStartTime) > 0.2 and ply:OnGround()) then -- 115
			ply.m_bJumping = false -- 116
			ply.m_fGroundTime = nil -- 117
			if SERVER and team ~= TEAM_GHOST then -- 118
				ply:EmitSound("placenta/speech/land.wav", 75, math.random(80, 90)) -- 119
			end -- 118
			ply:AnimRestartMainSequence() -- 120
		end -- 115
		if ply.m_bJumping then -- 121
			ply.CalcIdeal = ACT_MP_JUMP -- 122
			return true -- 123
		end -- 121
	end -- 106
	return false -- 124
end -- 85
local should_zombie -- 126
should_zombie = function(ply) -- 126
	local team = ply:Team() -- 127
	local hp = ply:Health() -- 128
	local hpm = ply:GetMaxHealth() -- 129
	return hp <= (hpm / 2) or team == TEAM_GHOST or team == TEAM_BONEHEAD or ply:IsOnFire() -- 130
end -- 126
local calc_main_activity -- 132
calc_main_activity = function(ply, vel) -- 132
	if ply.GetSitting and ply:GetSitting() then -- 133
		return -- 133
	end -- 133
	local team = ply:Team() -- 134
	local crouching = ply:Crouching() -- 135
	if should_zombie(ply) then -- 136
		ply.CalcIdeal = crouching and ACT_MP_CROUCH_IDLE or ACT_HL2MP_IDLE_ZOMBIE -- 137
	else -- 139
		ply.CalcIdeal = crouching and ACT_MP_CROUCH_IDLE or ACT_MP_STAND_IDLE -- 139
	end -- 136
	ply.CalcSeqOverride = -1 -- 140
	if not handle_player_jumping(ply, vel) then -- 141
		local run = ply:GetRunSpeed() -- 142
		local len = vel:Length2D() -- 143
		if (len > run / math.sqrt(2) - 8) then -- 144
			if should_zombie(ply) then -- 145
				ply.CalcIdeal = ACT_HL2MP_RUN_ZOMBIE -- 146
			else -- 148
				ply.CalcIdeal = ACT_MP_RUN -- 148
			end -- 145
		elseif (len > 0.5) then -- 149
			if should_zombie(ply) then -- 150
				ply.CalcIdeal = crouching and ACT_MP_CROUCHWALK or ACT_HL2MP_WALK_ZOMBIE_01 -- 151
			else -- 153
				ply.CalcIdeal = crouching and ACT_MP_CROUCHWALK or ACT_MP_WALK -- 153
			end -- 150
		end -- 144
	end -- 141
	return ply.CalcIdeal, ply.CalcSeqOverride -- 154
end -- 132
return hook.Add("CalcMainActivity", "evilrp_animations", calc_main_activity) -- 156
