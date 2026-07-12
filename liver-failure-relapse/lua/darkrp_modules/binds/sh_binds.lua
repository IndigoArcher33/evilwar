-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/binds/sh_binds.yue
local default_keysens = 0.4 -- 5
if CLIENT then -- 7
	CreateClientConVar("lfr_key_sensitivity", default_keysens, true, true, "The time window for double-tapping or short presses.") -- 8
	CreateClientConVar("lfr_autowalk", 0, true, true, "Toggle whether double-tapping a movement key will keep moving you in that direction.") -- 9
	hook.Remove("ScoreboardShow", "FAdmin_scoreboard") -- 11
	hook.Remove("ScoreboardHide", "FAdmin_scoreboard") -- 12
	hook.Add("ScoreboardShow", "evilrp_scoreboard", function() -- 14
		return GUI.Open("Scoreboard") -- 15
	end) -- 14
	hook.Add("ScoreboardHide", "evilrp_scoreboard", function() -- 16
		return GUI.Close("Scoreboard") -- 17
	end) -- 16
end -- 7
local respect_binds -- 19
respect_binds = function(ply, button) -- 19
	for _, data in pairs(Binds.list) do -- 20
		if button == data.default then -- 21
			data.callback(ply) -- 22
			return -- 23
		end -- 21
	end -- 23
	if SERVER then -- 24
		return numpad.Activate(ply, button) -- 24
	end -- 24
end -- 19
hook.Add("PlayerButtonDown", "evilrp_implement_binds", respect_binds) -- 25
if CLIENT then -- 27
	local bind_press -- 28
	bind_press = function(ply, bind, down) -- 28
		if Chat.Bind(bind, down) then -- 29
			return true -- 29
		end -- 29
		if Select.Bind(bind, down) then -- 30
			return true -- 30
		end -- 30
	end -- 28
	local states = { } -- 31
	local init_mode -- 32
	init_mode = function(mode) -- 32
		if KEYMODE_HOLD == mode then -- 34
			return { } -- 35
		elseif KEYMODE_TOGGLE == mode then -- 36
			return { -- 37
				toggle = false, -- 37
				last = false -- 37
			} -- 37
		elseif KEYMODE_SMART == mode then -- 38
			return { -- 39
				toggle = false, -- 39
				start = 0, -- 39
				last = false -- 39
			} -- 39
		end -- 39
	end -- 32
	local update_keymode -- 40
	update_keymode = function(key, cmd, mode) -- 40
		local state = states[key] -- 41
		if (not state) or state.mode ~= mode then -- 42
			states[key] = init_mode(mode) -- 43
			state = states[key] -- 44
			state.mode = mode -- 45
		end -- 42
		if KEYMODE_HOLD == mode then -- 47
			return -- 48
		elseif KEYMODE_TOGGLE == mode then -- 49
			local down = cmd:KeyDown(key) -- 50
			if not down and state.last then -- 51
				state.toggle = not state.toggle -- 52
				state.last = down -- 53
			end -- 51
		elseif KEYMODE_SMART == mode then -- 54
			local down = cmd:KeyDown(key) -- 55
			local last = state.last -- 56
			local ct = CurTime() -- 57
			if down and not last then -- 59
				state.start = ct -- 60
				state.toggle = not state.toggle -- 61
			end -- 59
			if (not down and last) and (ct - state.start >= lp:GetInfoNum("lfr_key_sensitivity", default_keysens) or not system.HasFocus()) then -- 63
				state.toggle = false -- 64
			end -- 63
			state.last = down -- 65
		end -- 65
		if state.toggle then -- 66
			return cmd:AddKey(key) -- 66
		end -- 66
	end -- 40
	local dir = Vector() -- 68
	local last = { -- 69
		0, -- 69
		0, -- 69
		0, -- 69
		0 -- 69
	} -- 69
	local movement_binds -- 70
	movement_binds = function(cmd) -- 70
		update_keymode(IN_DUCK, cmd, KEYMODE_SMART) -- 71
		update_keymode(IN_SPEED, cmd, KEYMODE_SMART) -- 72
		update_keymode(IN_WALK, cmd, KEYMODE_SMART) -- 73
		local should_autowalk = lp:GetInfoNum("lfr_autowalk", 0) == 1 -- 74
		if should_autowalk then -- 75
			local sens = lp:GetInfoNum("lfr_key_sensitivity", default_keysens) -- 76
			local ct = CurTime() -- 77
			local move = Vector(cmd:GetForwardMove(), cmd:GetSideMove()) -- 78
			if cmd:CommandNumber() ~= 0 then -- 79
				for k, v in ipairs({ -- 80
					IN_MOVELEFT, -- 80
					IN_FORWARD, -- 80
					IN_MOVERIGHT, -- 80
					IN_BACK -- 80
				}) do -- 80
					local _continue_0 = false -- 81
					repeat -- 81
						if not lp:KeyPressed(v) then -- 81
							_continue_0 = true -- 81
							break -- 81
						end -- 81
						local axis = (k % 2) + 1 -- 82
						local time_since = ct - last[k] -- 83
						local last_move = dir[axis] -- 84
						if dir[axis] == 0 and time_since < sens then -- 85
							dir[axis] = move[axis] -- 86
							last[k] = 0 -- 87
						else -- 89
							dir[axis] = 0 -- 89
						end -- 85
						if last_move == 0 and dir[axis] == 0 then -- 90
							last[k] = ct -- 91
						end -- 90
						_continue_0 = true -- 81
					until true -- 91
					if not _continue_0 then -- 91
						break -- 91
					end -- 91
				end -- 91
			end -- 79
			if dir.x ~= 0 then -- 92
				cmd:SetForwardMove(dir.x) -- 92
			end -- 92
			if dir.y ~= 0 then -- 93
				cmd:SetSideMove(dir.y) -- 93
			end -- 93
		end -- 75
		return -- 94
	end -- 70
	hook.Add("CreateMove", "evilrp_movement_binds", movement_binds) -- 95
	local meta = FindMetaTable("Player") -- 97
	meta.AutomovingForward = function(self) -- 98
		return dir.x > 0 -- 98
	end -- 98
	meta.AutomovingBackward = function(self) -- 99
		return dir.x < 0 -- 99
	end -- 99
	meta.AutomovingLeft = function(self) -- 100
		return dir.y < 0 -- 100
	end -- 100
	meta.AutomovingRight = function(self) -- 101
		return dir.y > 0 -- 101
	end -- 101
end -- 27
