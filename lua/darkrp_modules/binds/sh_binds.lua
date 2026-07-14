local default_keysens = 0.4
if CLIENT then
	CreateClientConVar("lfr_key_sensitivity", default_keysens, true, true, "The time window for double-tapping or short presses.")
	CreateClientConVar("lfr_autowalk", 0, true, true, "Toggle whether double-tapping a movement key will keep moving you in that direction.")
	hook.Remove("ScoreboardShow", "FAdmin_scoreboard")
	hook.Remove("ScoreboardHide", "FAdmin_scoreboard")
	hook.Add("ScoreboardShow", "evilrp_scoreboard", function()
		return GUI.Open("Scoreboard")
	end)
	hook.Add("ScoreboardHide", "evilrp_scoreboard", function()
		return GUI.Close("Scoreboard")
	end)
end
local respect_binds
respect_binds = function(ply, button)
	for _, data in pairs(Binds.list) do
		if button == data.default then
			data.callback(ply)
			return
		end
	end
	if SERVER then
		return numpad.Activate(ply, button)
	end
end
hook.Add("PlayerButtonDown", "evilrp_implement_binds", respect_binds)
if CLIENT then
	local bind_press
	bind_press = function(ply, bind, down)
		if Chat.Bind(bind, down) then
			return true
		end
		if Select.Bind(bind, down) then
			return true
		end
	end
	local states = { }
	local init_mode
	init_mode = function(mode)
		if KEYMODE_HOLD == mode then
			return { }
		elseif KEYMODE_TOGGLE == mode then
			return {
				toggle = false,
				last = false
			}
		elseif KEYMODE_SMART == mode then
			return {
				toggle = false,
				start = 0,
				last = false
			}
		end
	end
	local update_keymode
	update_keymode = function(key, cmd, mode)
		local state = states[key]
		if (not state) or state.mode ~= mode then
			states[key] = init_mode(mode)
			state = states[key]
			state.mode = mode
		end
		if KEYMODE_HOLD == mode then
			return
		elseif KEYMODE_TOGGLE == mode then
			local down = cmd:KeyDown(key)
			if not down and state.last then
				state.toggle = not state.toggle
				state.last = down
			end
		elseif KEYMODE_SMART == mode then
			local down = cmd:KeyDown(key)
			local last = state.last
			local ct = CurTime()
			if down and not last then
				state.start = ct
				state.toggle = not state.toggle
			end
			if (not down and last) and (ct - state.start >= lp:GetInfoNum("lfr_key_sensitivity", default_keysens) or not system.HasFocus()) then
				state.toggle = false
			end
			state.last = down
		end
		if state.toggle then
			return cmd:AddKey(key)
		end
	end
	local dir = Vector()
	local last = {
		0,
		0,
		0,
		0
	}
	local movement_binds
	movement_binds = function(cmd)
		update_keymode(IN_DUCK, cmd, KEYMODE_SMART)
		update_keymode(IN_SPEED, cmd, KEYMODE_SMART)
		update_keymode(IN_WALK, cmd, KEYMODE_SMART)
		local should_autowalk = lp:GetInfoNum("lfr_autowalk", 0) == 1
		if should_autowalk then
			local sens = lp:GetInfoNum("lfr_key_sensitivity", default_keysens)
			local ct = CurTime()
			local move = Vector(cmd:GetForwardMove(), cmd:GetSideMove())
			if cmd:CommandNumber() ~= 0 then
				for k, v in ipairs({
					IN_MOVELEFT,
					IN_FORWARD,
					IN_MOVERIGHT,
					IN_BACK
				}) do
					if not lp:KeyPressed(v) then
						goto _continue_0
					end
					local axis = (k % 2) + 1
					local time_since = ct - last[k]
					local last_move = dir[axis]
					if dir[axis] == 0 and time_since < sens then
						dir[axis] = move[axis]
						last[k] = 0
					else
						dir[axis] = 0
					end
					if last_move == 0 and dir[axis] == 0 then
						last[k] = ct
					end
					::_continue_0::
				end
			end
			if dir.x ~= 0 then
				cmd:SetForwardMove(dir.x)
			end
			if dir.y ~= 0 then
				cmd:SetSideMove(dir.y)
			end
		end
		return
	end
	hook.Add("CreateMove", "evilrp_movement_binds", movement_binds)
	local meta = FindMetaTable("Player")
	meta.AutomovingForward = function(self)
		return dir.x > 0
	end
	meta.AutomovingBackward = function(self)
		return dir.x < 0
	end
	meta.AutomovingLeft = function(self)
		return dir.y < 0
	end
	meta.AutomovingRight = function(self)
		return dir.y > 0
	end
end
