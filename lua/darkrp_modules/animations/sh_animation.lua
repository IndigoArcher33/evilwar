if SERVER then
	util.AddNetworkString("evilrp_playsignal")
	util.AddNetworkString("evilrp_playvcd")
end
net.Receive("evilrp_playsignal", function(len, ply)
	local mode = net.ReadBit()
	local act = nil
	if mode == 0 then
		act = net.ReadUInt(16)
	else
		act = net.ReadString()
	end
	if SERVER then
		if mode == 0 then
			local rf = { }
			local _list_0 = player.GetAll()
			for _index_0 = 1, #_list_0 do
				local p = _list_0[_index_0]
				if not (v == ply) then
					rf[#rf + 1] = p
				end
			end
			net.Start("evilrp_playsignal")
			net.WriteBit(false)
			net.WriteUInt(act, 16)
			net.WriteEntity(ply)
			return net.Send(rf)
		else
			return ply:PlayVCD(act)
		end
	else
		ply = net.ReadEntity()
		if ply and IsValid(ply) then
			if mode == 0 then
				return ply:AnimRestartGesture(GESTURE_SLOT_CUSTOM, act, true)
			else
				return ply:PlayVCD(act)
			end
		end
	end
end)
net.Receive("evilrp_playvcd", function(len)
	if SERVER then
		return
	end
	local ent = net.ReadEntity()
	local seq = net.ReadString()
	if ent and IsValid(ent) then
		return ent:AddVCDSequenceToGestureSlot(GESTURE_SLOT_CUSTOM, ent:LookupSequence(seq), 0, true)
	end
end)
local pmeta = FindMetaTable("Player")
for k, v in pairs({
	PlaySignal = function(self, act, sendtoself)
		local mode = nil
		if type(act) == "number" then
			mode = 0
		else
			mode = 1
		end
		if CLIENT then
			if mode == 0 then
				self:AnimRestartGesture(GESTURE_SLOT_CUSTOM, act, true)
			else
				self:PlayVCD(act)
			end
			net.Start("evilrp_playsignal")
			net.WriteBit(mode == 1)
			if mode == 0 then
				net.WriteUInt(act, 16)
			else
				net.WriteString(act)
			end
			return net.SendToServer()
		else
			local rf = { }
			local _list_0 = player.GetAll()
			for _index_0 = 1, #_list_0 do
				local p = _list_0[_index_0]
				if (p ~= self) or sendtoself then
					rf[#rf + 1] = p
				end
			end
			net.Start("evilrp_playsignal")
			net.WriteBit(mode == 1)
			if mode == 0 then
				net.WriteUInt(act, 16)
			else
				net.WriteString(act)
			end
			net.WriteEntity(self)
			return net.Send(rf)
		end
	end,
	PlayVCD = function(self, seq, send_to_self)
		if CLIENT then
			return self:AddVCDSequenceToGestureSlot(GESTURE_SLOT_CUSTOM, self:LookupSequence(seq), 0, true)
		else
			local rf = { }
			local _list_0 = player.GetAll()
			for _index_0 = 1, #_list_0 do
				local p = _list_0[_index_0]
				if (v ~= self or send_to_self) then
					rf[#rf + 1] = v
				end
			end
			net.Start("evilrp_playvcd")
			net.WriteEntity(self)
			net.WriteString(seq)
			return net.Send(rf)
		end
	end
}) do
	pmeta[k] = v
end
local handle_player_jumping
handle_player_jumping = function(ply, vel)
	local sprinting = ply:KeyDown(IN_SPEED)
	local jumping = ply:KeyDown(IN_JUMP)
	local ct = CurTime()
	local team = ply:Team()
	if ply:Alive() and not ply:IsOnGround() and sprinting and jumping then
		ply.CalcIdeal = ACT_MP_SWIM
		return true
	end
	if ply:GetMoveType() == MOVETYPE_NOCLIP then
		ply.m_bJumping = false
		return
	end
	if (not ply.m_bJumping) and (not ply:OnGround()) and ply:WaterLevel() <= 0 then
		if (not ply.m_fGroundTime) then
			ply.m_fGroundTime = ct
		elseif (ct - ply.m_fGroundTime > 0) and vel:Length2DSqr() < 0.25 then
			ply.m_bJumping = true
			ply.m_bFirstJumpFrame = false
			ply.m_flJumpStartTime = 0
		end
	end
	if ply.m_bJumping then
		if ply.m_bFirstJumpFrame then
			if SERVER and team ~= TEAM_GHOST then
				ply:EmitSound("placenta/speech/jump.wav", 75, math.random(80, 90))
			end
			ply.m_bFirstJumpFrame = false
			ply:AnimRestartMainSequence()
		end
		if (ply:WaterLevel() >= 2) or ((ct - ply.m_flJumpStartTime) > 0.2 and ply:OnGround()) then
			ply.m_bJumping = false
			ply.m_fGroundTime = nil
			if SERVER and team ~= TEAM_GHOST then
				ply:EmitSound("placenta/speech/land.wav", 75, math.random(80, 90))
			end
			ply:AnimRestartMainSequence()
		end
		if ply.m_bJumping then
			ply.CalcIdeal = ACT_MP_JUMP
			return true
		end
	end
	return false
end
local should_zombie
should_zombie = function(ply)
	local team = ply:Team()
	local hp = ply:Health()
	local hpm = ply:GetMaxHealth()
	return hp <= (hpm / 2) or team == TEAM_GHOST or team == TEAM_BONEHEAD or ply:IsOnFire()
end
local calc_main_activity
calc_main_activity = function(ply, vel)
	if ply.GetSitting and ply:GetSitting() then
		return
	end
	local team = ply:Team()
	local crouching = ply:Crouching()
	if should_zombie(ply) then
		ply.CalcIdeal = crouching and ACT_MP_CROUCH_IDLE or ACT_HL2MP_IDLE_ZOMBIE
	else
		ply.CalcIdeal = crouching and ACT_MP_CROUCH_IDLE or ACT_MP_STAND_IDLE
	end
	ply.CalcSeqOverride = -1
	if not handle_player_jumping(ply, vel) then
		local run = ply:GetRunSpeed()
		local len = vel:Length2D()
		if (len > run / math.sqrt(2) - 8) then
			if should_zombie(ply) then
				ply.CalcIdeal = ACT_HL2MP_RUN_ZOMBIE
			else
				ply.CalcIdeal = ACT_MP_RUN
			end
		elseif (len > 0.5) then
			if should_zombie(ply) then
				ply.CalcIdeal = crouching and ACT_MP_CROUCHWALK or ACT_HL2MP_WALK_ZOMBIE_01
			else
				ply.CalcIdeal = crouching and ACT_MP_CROUCHWALK or ACT_MP_WALK
			end
		end
	end
	return ply.CalcIdeal, ply.CalcSeqOverride
end
return hook.Add("CalcMainActivity", "evilrp_animations", calc_main_activity)
