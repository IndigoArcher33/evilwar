-- [yue]: darkrp_modules\computers\sv_computers.yue
local _list_0 = { -- 2
	"evilrp_terminal_flicker", -- 2
	"evilrp_terminal_activeconsole", -- 3
	"evilrp_terminal_endconsole", -- 4
	"evilrp_terminal_addline", -- 5
	"evilrp_terminal_endtyping" -- 6
} -- 1
for _index_0 = 1, #_list_0 do -- 7
	local msg = _list_0[_index_0] -- 1
	util.AddNetworkString(msg) -- 1
end -- 1
util.GetPlayerByName = function(name) -- 9
	if not (name and name ~= "") then -- 10
		return nil -- 10
	end -- 10
	name = name:lower() -- 11
	for _, ply in pairs(player.GetAll()) do -- 12
		if ply:Nick():lower():match(name) then -- 13
			return ply -- 14
		end -- 13
	end -- 14
	return nil -- 15
end -- 9
local TerminalPowered -- 17
do -- 17
	local _class_0 -- 17
	local _parent_0 = SOUND -- 17
	local _base_0 = { -- 17
		sound = "hl1/ambience/computalk2.wav", -- 19
		pitch = { -- 19
			150, -- 19
			200 -- 19
		}, -- 20
		volume = 0.2, -- 21
		level = SNDLVL_40DB -- 17
	} -- 17
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 21
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 17
			_base_0[_key_0] = _val_0 -- 17
		end -- 17
	end -- 21
	if _base_0.__index == nil then -- 17
		_base_0.__index = _base_0 -- 17
	end -- 21
	setmetatable(_base_0, _parent_0.__base) -- 17
	_class_0 = setmetatable({ -- 17
		__init = function(self, ...) -- 17
			return _class_0.__parent.__init(self, ...) -- 17
		end, -- 17
		__base = _base_0, -- 17
		__name = "TerminalPowered", -- 17
		__parent = _parent_0 -- 17
	}, { -- 17
		__index = function(cls, name) -- 17
			local val = rawget(_base_0, name) -- 17
			if val == nil then -- 17
				local parent = rawget(cls, "__parent") -- 17
				if parent then -- 17
					return parent[name] -- 17
				end -- 17
			else -- 17
				return val -- 17
			end -- 17
		end, -- 17
		__call = function(cls, ...) -- 17
			local _self_0 = setmetatable({ }, _base_0) -- 17
			cls.__init(_self_0, ...) -- 17
			return _self_0 -- 17
		end -- 17
	}) -- 17
	_base_0.__class = _class_0 -- 17
	if _parent_0.__inherited then -- 17
		_parent_0.__inherited(_parent_0, _class_0) -- 17
	end -- 17
	TerminalPowered = _class_0 -- 17
end -- 21
local TerminalDead -- 23
do -- 23
	local _class_0 -- 23
	local _parent_0 = SOUND -- 23
	local _base_0 = { -- 23
		sound = "hl1/ambience/deadsignal2.wav", -- 25
		pitch = { -- 25
			150, -- 25
			200 -- 25
		}, -- 26
		volume = 0.2, -- 27
		level = SNDLVL_40DB -- 23
	} -- 23
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 27
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 23
			_base_0[_key_0] = _val_0 -- 23
		end -- 23
	end -- 27
	if _base_0.__index == nil then -- 23
		_base_0.__index = _base_0 -- 23
	end -- 27
	setmetatable(_base_0, _parent_0.__base) -- 23
	_class_0 = setmetatable({ -- 23
		__init = function(self, ...) -- 23
			return _class_0.__parent.__init(self, ...) -- 23
		end, -- 23
		__base = _base_0, -- 23
		__name = "TerminalDead", -- 23
		__parent = _parent_0 -- 23
	}, { -- 23
		__index = function(cls, name) -- 23
			local val = rawget(_base_0, name) -- 23
			if val == nil then -- 23
				local parent = rawget(cls, "__parent") -- 23
				if parent then -- 23
					return parent[name] -- 23
				end -- 23
			else -- 23
				return val -- 23
			end -- 23
		end, -- 23
		__call = function(cls, ...) -- 23
			local _self_0 = setmetatable({ }, _base_0) -- 23
			cls.__init(_self_0, ...) -- 23
			return _self_0 -- 23
		end -- 23
	}) -- 23
	_base_0.__class = _class_0 -- 23
	if _parent_0.__inherited then -- 23
		_parent_0.__inherited(_parent_0, _class_0) -- 23
	end -- 23
	TerminalDead = _class_0 -- 23
end -- 27
local TerminalDeath -- 29
do -- 29
	local _class_0 -- 29
	local _parent_0 = SOUND -- 29
	local _base_0 = { -- 29
		sound = "kidneydagger/printer_death.wav", -- 31
		pitch = { -- 31
			150, -- 31
			200 -- 31
		}, -- 32
		volume = 0.2, -- 33
		level = SNDLVL_40DB -- 29
	} -- 29
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 33
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 29
			_base_0[_key_0] = _val_0 -- 29
		end -- 29
	end -- 33
	if _base_0.__index == nil then -- 29
		_base_0.__index = _base_0 -- 29
	end -- 33
	setmetatable(_base_0, _parent_0.__base) -- 29
	_class_0 = setmetatable({ -- 29
		__init = function(self, ...) -- 29
			return _class_0.__parent.__init(self, ...) -- 29
		end, -- 29
		__base = _base_0, -- 29
		__name = "TerminalDeath", -- 29
		__parent = _parent_0 -- 29
	}, { -- 29
		__index = function(cls, name) -- 29
			local val = rawget(_base_0, name) -- 29
			if val == nil then -- 29
				local parent = rawget(cls, "__parent") -- 29
				if parent then -- 29
					return parent[name] -- 29
				end -- 29
			else -- 29
				return val -- 29
			end -- 29
		end, -- 29
		__call = function(cls, ...) -- 29
			local _self_0 = setmetatable({ }, _base_0) -- 29
			cls.__init(_self_0, ...) -- 29
			return _self_0 -- 29
		end -- 29
	}) -- 29
	_base_0.__class = _class_0 -- 29
	if _parent_0.__inherited then -- 29
		_parent_0.__inherited(_parent_0, _class_0) -- 29
	end -- 29
	TerminalDeath = _class_0 -- 29
end -- 33
local XOMBOTAX -- 35
do -- 35
	local _class_0 -- 35
	local _parent_0 = SOUND -- 35
	local _base_0 = { -- 35
		sound = "dysphoria/xombocom/kommandantenbefehlen.ogg", -- 37
		pitch = { -- 37
			80, -- 37
			110 -- 37
		}, -- 38
		level = SNDLVL_NONE -- 35
	} -- 35
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 38
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 35
			_base_0[_key_0] = _val_0 -- 35
		end -- 35
	end -- 38
	if _base_0.__index == nil then -- 35
		_base_0.__index = _base_0 -- 35
	end -- 38
	setmetatable(_base_0, _parent_0.__base) -- 35
	_class_0 = setmetatable({ -- 35
		__init = function(self, ...) -- 35
			return _class_0.__parent.__init(self, ...) -- 35
		end, -- 35
		__base = _base_0, -- 35
		__name = "XOMBOTAX", -- 35
		__parent = _parent_0 -- 35
	}, { -- 35
		__index = function(cls, name) -- 35
			local val = rawget(_base_0, name) -- 35
			if val == nil then -- 35
				local parent = rawget(cls, "__parent") -- 35
				if parent then -- 35
					return parent[name] -- 35
				end -- 35
			else -- 35
				return val -- 35
			end -- 35
		end, -- 35
		__call = function(cls, ...) -- 35
			local _self_0 = setmetatable({ }, _base_0) -- 35
			cls.__init(_self_0, ...) -- 35
			return _self_0 -- 35
		end -- 35
	}) -- 35
	_base_0.__class = _class_0 -- 35
	if _parent_0.__inherited then -- 35
		_parent_0.__inherited(_parent_0, _class_0) -- 35
	end -- 35
	XOMBOTAX = _class_0 -- 35
end -- 38
GT_COL_NIL = 0 -- 40
GT_COL_MSG = 1 -- 41
GT_COL_WRN = 2 -- 42
GT_COL_ERR = 3 -- 43
GT_COL_INFO = 4 -- 44
GT_COL_INTL = 5 -- 45
GT_COL_CMD = 6 -- 46
GT_COL_SUCC = 7 -- 47
gterm = gterm or { } -- 50
gterm.Broadcast = function(self, ent, text, color_type, pos) -- 52
	if color_type == nil then -- 52
		color_type = GT_COL_MSG -- 52
	end -- 52
	if not IsValid(ent) then -- 53
		return -- 53
	end -- 53
	local idx = ent:EntIndex() -- 54
	local output -- 55
	if string.len(text) > ent.max_chars then -- 56
		output = { } -- 57
		local expected = math.floor(string.len(text) / ent.max_chars) -- 58
		for i = 0, expected do -- 59
			output[i + 1] = string.sub(text, i * ent.max_chars, (i * ent.max_chars) + (ent.max_chars - 1)) -- 60
		end -- 60
	end -- 56
	if output then -- 61
		for k, v in ipairs(output) do -- 62
			net.Start("evilrp_terminal_addline") -- 63
			net.WriteUInt(idx, 16) -- 64
			net.WriteString(v) -- 65
			net.WriteUInt(color_type, 8) -- 66
			if pos then -- 67
				net.WriteInt(pos + (k - 1), 16) -- 68
			else -- 70
				net.WriteInt(-1, 16) -- 70
			end -- 67
			net.Broadcast() -- 71
		end -- 71
	else -- 73
		net.Start("evilrp_terminal_addline") -- 73
		net.WriteUInt(idx, 16) -- 74
		net.WriteString(text) -- 75
		net.WriteUInt(color_type, 8) -- 76
		net.WriteInt(pos or -1, 16) -- 77
		return net.Broadcast() -- 78
	end -- 61
end -- 52
gterm.GetInput = function(self, ent, callback) -- 80
	ent.accepting_input = true -- 81
	ent.input_callback = callback -- 82
end -- 80
local TerminalEngage -- 84
do -- 84
	local _class_0 -- 84
	local _parent_0 = SOUND -- 84
	local _base_0 = { -- 84
		sound = "buttons/blip1.wav", -- 86
		pitch = { -- 86
			60, -- 86
			75 -- 86
		} -- 84
	} -- 84
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 86
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 84
			_base_0[_key_0] = _val_0 -- 84
		end -- 84
	end -- 86
	if _base_0.__index == nil then -- 84
		_base_0.__index = _base_0 -- 84
	end -- 86
	setmetatable(_base_0, _parent_0.__base) -- 84
	_class_0 = setmetatable({ -- 84
		__init = function(self, ...) -- 84
			return _class_0.__parent.__init(self, ...) -- 84
		end, -- 84
		__base = _base_0, -- 84
		__name = "TerminalEngage", -- 84
		__parent = _parent_0 -- 84
	}, { -- 84
		__index = function(cls, name) -- 84
			local val = rawget(_base_0, name) -- 84
			if val == nil then -- 84
				local parent = rawget(cls, "__parent") -- 84
				if parent then -- 84
					return parent[name] -- 84
				end -- 84
			else -- 84
				return val -- 84
			end -- 84
		end, -- 84
		__call = function(cls, ...) -- 84
			local _self_0 = setmetatable({ }, _base_0) -- 84
			cls.__init(_self_0, ...) -- 84
			return _self_0 -- 84
		end -- 84
	}) -- 84
	_base_0.__class = _class_0 -- 84
	if _parent_0.__inherited then -- 84
		_parent_0.__inherited(_parent_0, _class_0) -- 84
	end -- 84
	TerminalEngage = _class_0 -- 84
end -- 86
do -- 88
	local _class_0 -- 88
	local _base_0 = { -- 88
		commands = { }, -- 107
		GetCommands = function(self) -- 107
			return self.commands -- 107
		end, -- 109
		name = "OS", -- 111
		GetName = function(self) -- 111
			return self.name -- 111
		end, -- 113
		greeting = "I don't like how you're looking at me.", -- 115
		GetWarmUpText = function(self) -- 115
			local text = self.greeting -- 116
			if isstring(text) then -- 117
				text = { -- 117
					text -- 117
				} -- 117
			end -- 117
			return text -- 118
		end, -- 120
		GetUniqueID = function(self) -- 120
			return self.unique_id -- 120
		end, -- 122
		UserInit = function(self, term, ply) -- 122
			return term:EmitSound("TerminalEngage") -- 123
		end, -- 125
		Initialized = function(self, term) -- 125
			gterm[term:EntIndex()] = { } -- 126
			return term:SetSoundLoop(term:StartLoopingSound("TerminalPowered")) -- 127
		end, -- 129
		ShutDown = function(self, term) -- 129
			if not term:GetActive() then -- 130
				return -- 130
			end -- 130
			local loop = term:GetSoundLoop() -- 131
			if loop then -- 132
				term:StopLoopingSound(loop) -- 132
			end -- 132
			term:EmitSound("TerminalDeath") -- 133
			term:SetActive(false) -- 134
			gterm[term:EntIndex()] = { } -- 135
		end -- 88
	} -- 88
	if _base_0.__index == nil then -- 88
		_base_0.__index = _base_0 -- 88
	end -- 135
	_class_0 = setmetatable({ -- 88
		__init = function() end, -- 88
		__base = _base_0, -- 88
		__name = "OS" -- 88
	}, { -- 88
		__index = _base_0, -- 88
		__call = function(cls, ...) -- 88
			local _self_0 = setmetatable({ }, _base_0) -- 88
			cls.__init(_self_0, ...) -- 88
			return _self_0 -- 88
		end -- 88
	}) -- 88
	_base_0.__class = _class_0 -- 88
	local self = _class_0; -- 88
	self.Call = function(self, ent, name, ...) -- 89
		if IsValid(ent) then -- 90
			local key = ent:GetOS() -- 91
			local sys = self.distros[key] -- 92
			if not IsValid(ent) then -- 93
				return -- 93
			end -- 93
			if not (sys and sys[name]) then -- 94
				return -- 94
			end -- 94
			if not isfunction(sys[name]) then -- 95
				return -- 95
			end -- 95
			local success, value = pcall(sys[name], sys, ent, ...) -- 96
			if success then -- 97
				return value -- 97
			end -- 97
		end -- 90
	end -- 89
	self.distros = { } -- 99
	self.__inherited = function(self, child) -- 101
		child.unique_id = child.__name:lower() -- 102
		self.distros[child.unique_id] = child -- 103
	end -- 101
	OS = _class_0 -- 88
end -- 135
gterm.OS = OS -- 137
local Basic -- 139
do -- 139
	local _class_0 -- 139
	local _parent_0 = OS -- 139
	local _base_0 = { -- 139
		greeting = { -- 141
			"BOOT SEQUENCE NOW", -- 141
			"FINALIZING BASIC SYSTEM", -- 142
			"GIVE ME PURPOSE" -- 143
		}, -- 146
		commands = { -- 147
			[":help"] = { -- 148
				Callback = function(self, ply, term, args) -- 148
					local _with_0 = gterm -- 149
					_with_0:Broadcast(term, "  COMMANDS:") -- 152
					_with_0:Broadcast(term, "") -- 153
					for k, v in SortedPairs(self:GetCommands()) do -- 154
						_with_0:Broadcast(term, "  * " .. tostring(k), GT_COL_INFO) -- 155
						_with_0:Broadcast(term, "    " .. tostring(v.help)) -- 156
					end -- 156
					_with_0:Broadcast(term, "  end list", GT_COL_INTL) -- 157
					return _with_0 -- 149
				end, -- 148
				help = "Basic usage instructions." -- 158
			}, -- 147
			[":cls"] = { -- 161
				Callback = function(self, ply, term) -- 161
					for i = 0, 25 do -- 162
						local time = math.Rand(0.01, 0.04) -- 163
						timer.Simple(i * time, function() -- 164
							if IsValid(term) then -- 165
								return gterm:Broadcast(term, "", MSG_COL_NIL, i) -- 165
							end -- 165
						end) -- 164
					end -- 165
					return -- 166
				end, -- 161
				help = "Clear the screen." -- 167
			}, -- 160
			[":os"] = { -- 170
				Callback = function(self, ply, term, args) -- 170
					local cmd = args[1] -- 171
					if "install" == cmd then -- 173
						local info = args[2] -- 174
						if not info then -- 175
							gterm:Broadcast(term, "invalid system identifier", GT_COL_ERR) -- 176
							return -- 177
						elseif info == "basic" then -- 178
							gterm:Broadcast(term, "this is already the basic system", GT_COL_ERR) -- 179
							return -- 180
						end -- 175
						local sys = OS.distros[info] -- 181
						if not system then -- 182
							gterm:Broadcast(term, "os '" .. tostring(info) .. "' not found", GT_COL_ERR) -- 183
							return -- 184
						end -- 182
						term.locked = true -- 185
						gterm:Broadcast(term, "installing '" .. tostring(info) .. "'", GT_COL_INTL) -- 186
						return timer.Simple(1, function() -- 187
							if not IsValid(term) then -- 188
								return -- 188
							end -- 188
							for i = 0, 25 do -- 189
								gterm:Broadcast(term, "", nil, i) -- 189
							end -- 189
							do -- 190
								local _with_0 = gterm -- 190
								_with_0:Broadcast(term, "IDLE", GT_COL_MSG, 18) -- 191
								_with_0:Broadcast(term, "", GT_COL_MSG, 19) -- 192
								_with_0:Broadcast(term, "     [                         ] 0%", GT_COL_MSG, 20) -- 193
								_with_0:Broadcast(term, "", GT_COL_MSG, 21) -- 194
							end -- 190
							local messages = { -- 196
								"inspecting disk space", -- 196
								"allocating disk space", -- 197
								"retrieving required resources", -- 198
								"unpacking resources", -- 199
								"retrieving system requirements", -- 200
								"validating file integrity", -- 201
								"compiling packages", -- 202
								"exporting packages to file system", -- 203
								"setting up access data", -- 204
								"setting up system profile", -- 205
								"setting up commands", -- 206
								"finalizing install" -- 207
							} -- 195
							local time = math.Rand(0.5, 1.5) -- 209
							for i = 1, 25 do -- 210
								time = time + math.Rand(0.05, 0.25) -- 211
								timer.Simple(time, function() -- 212
									if IsValid(term) then -- 213
										local msg_id = math.Clamp(i, 1, #messages) -- 214
										gterm:Broadcast(term, "     " .. tostring(messages[msg_id]), GT_COL_MSG, 18) -- 215
										gterm:Broadcast(term, "     [" .. tostring(string.rep("=", i)) .. tostring(string.rep(" ", 25 - i)) .. "] " .. tostring(100 * math.Round(i / 25, 2)) .. "%", GT_COL_MSG, 20) -- 216
										if i == 25 then -- 217
											for i = 0, 25 do -- 218
												if IsValid(term) then -- 219
													gterm:Broadcast(term, "", nil, i) -- 219
												end -- 219
											end -- 219
											gterm:Broadcast(term, "SHUTTING DOWN, PLEASE RESTART TERMINAL", GT_COL_INTL, 1) -- 220
											return timer.Simple(math.Rand(1, 3), function() -- 221
												if IsValid(term) then -- 222
													term:SetOS(info) -- 224
													term:SetActive(false) -- 225
													term.locked = false -- 226
													return term -- 223
												end -- 222
											end) -- 226
										end -- 217
									end -- 213
								end) -- 212
							end -- 226
						end) -- 226
					elseif "list" == cmd then -- 227
						local info = args[2] -- 228
						gterm:Broadcast(term, "AVAILABLE OS PACKAGES:", GT_COL_INFO) -- 229
						gterm:Broadcast(term, "", GT_COL_MSG) -- 230
						local count = 0 -- 231
						for k, v in SortedPairs(gterm.OS.distros) do -- 232
							if istable(v) and v.GetName and v.GetUniqueID and v:GetUniqueID() ~= "basic" then -- 233
								count = count + 1 -- 234
								gterm:Broadcast(term, "     " .. tostring(count) .. ": " .. tostring(v:GetUniqueID()) .. " (" .. tostring(v:GetName()) .. ")") -- 235
							end -- 233
						end -- 235
					else -- 237
						local _with_0 = gterm -- 237
						_with_0:Broadcast(term, "OPERATING SYSTEM CONFIG", GT_COL_INFO) -- 238
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO) -- 239
						_with_0:Broadcast(term, "    allows configuration of the operating system") -- 240
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO) -- 241
						_with_0:Broadcast(term, "    :os install - install operating system package") -- 242
						_with_0:Broadcast(term, "    :os list - list available operating system packages") -- 243
						return _with_0 -- 237
					end -- 243
				end, -- 170
				help = "Operating system configuration." -- 244
			}, -- 169
			[":die"] = { -- 247
				Callback = function(self, ply, term) -- 247
					gterm:Broadcast(term, "SHUTTING DOWN") -- 248
					return timer.Simple(math.Rand(2, 5), function() -- 249
						if IsValid(term) then -- 250
							for i = 0, term.max_lines do -- 251
								if IsValid(term) then -- 252
									gterm:Broadcast(term, "", nil, i) -- 252
								end -- 252
							end -- 252
							return gterm.OS:Call(term, "ShutDown") -- 253
						end -- 250
					end) -- 253
				end, -- 247
				help = "Turn the computer off." -- 254
			} -- 246
		} -- 139
	} -- 139
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 255
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 139
			_base_0[_key_0] = _val_0 -- 139
		end -- 139
	end -- 255
	if _base_0.__index == nil then -- 139
		_base_0.__index = _base_0 -- 139
	end -- 255
	setmetatable(_base_0, _parent_0.__base) -- 139
	_class_0 = setmetatable({ -- 139
		__init = function(self, ...) -- 139
			return _class_0.__parent.__init(self, ...) -- 139
		end, -- 139
		__base = _base_0, -- 139
		__name = "Basic", -- 139
		__parent = _parent_0 -- 139
	}, { -- 139
		__index = function(cls, name) -- 139
			local val = rawget(_base_0, name) -- 139
			if val == nil then -- 139
				local parent = rawget(cls, "__parent") -- 139
				if parent then -- 139
					return parent[name] -- 139
				end -- 139
			else -- 139
				return val -- 139
			end -- 139
		end, -- 139
		__call = function(cls, ...) -- 139
			local _self_0 = setmetatable({ }, _base_0) -- 139
			cls.__init(_self_0, ...) -- 139
			return _self_0 -- 139
		end -- 139
	}) -- 139
	_base_0.__class = _class_0 -- 139
	if _parent_0.__inherited then -- 139
		_parent_0.__inherited(_parent_0, _class_0) -- 139
	end -- 139
	Basic = _class_0 -- 139
end -- 255
local Tyrant -- 257
do -- 257
	local _class_0 -- 257
	local _parent_0 = OS -- 257
	local _base_0 = { -- 257
		name = "TYRANT SYSTEM 0.6.66", -- 260
		greeting = { -- 261
			"boot sequence now", -- 261
			"loading tyrant system 0.6.66", -- 262
			"tyrant system loaded. greetings emperor", -- 263
			"LIVER FAILURE FOREVER" -- 264
		}, -- 267
		commands = { -- 268
			[":help"] = { -- 269
				Callback = function(self, ply, term, args) -- 269
					if ply:Team() ~= TEAM_EMPEROR then -- 270
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 271
						return -- 272
					end -- 270
					local _with_0 = gterm -- 273
					_with_0:Broadcast(term, "  COMMANDS:") -- 276
					_with_0:Broadcast(term, "") -- 277
					for k, v in SortedPairs(self:GetCommands()) do -- 278
						_with_0:Broadcast(term, "  * " .. tostring(k), GT_COL_INFO) -- 279
						_with_0:Broadcast(term, "    " .. tostring(v.help)) -- 280
					end -- 280
					_with_0:Broadcast(term, "  end list") -- 281
					return _with_0 -- 273
				end, -- 269
				help = "Basic usage instructions." -- 282
			}, -- 268
			[":conscript"] = { -- 285
				Callback = function(self, ply, term, args) -- 285
					if ply:Team() ~= TEAM_EMPEROR then -- 286
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 287
						return -- 288
					end -- 286
					local cmd = args[1] -- 289
					if cmd ~= "" then -- 290
						print(cmd) -- 291
						local cply = util.GetPlayerByName(cmd) -- 292
						if not IsValid(cply) then -- 293
							gterm:Broadcast(term, "that person does not exist", GT_COL_ERR) -- 294
							return -- 295
						end -- 293
						local name = cply:Nick() -- 296
						local team = cply:Team() -- 297
						print("conscript: " .. tostring(name) .. " (" .. tostring(team) .. ")") -- 298
						if team ~= TEAM_PRIVATE then -- 299
							gterm:Broadcast(term, tostring(name) .. " is too important", GT_COL_ERR) -- 300
							return -- 301
						end -- 299
						gterm:Broadcast(term, "new cannon fodder: " .. tostring(name), GT_COL_SUCC) -- 302
						return conscript(cply) -- 303
					end -- 290
				end, -- 285
				help = "Conscript your recruits." -- 304
			}, -- 284
			[":broadcast"] = { -- 307
				Callback = function(self, ply, term, args) -- 307
					if ply:Team() ~= TEAM_EMPEROR then -- 308
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 309
						return -- 310
					end -- 308
					local text = table.concat(args, " ") -- 311
					text = Chat.Autopretty(ply, text:upper()) -- 312
					do -- 313
						local _with_0 = gterm -- 313
						_with_0:Broadcast(term, text, GT_COL_ERR) -- 314
					end -- 313
					PlaySoundGlobal("XOMBOKOM") -- 315
					local _list_1 = player.GetAll() -- 316
					for _index_0 = 1, #_list_1 do -- 316
						local p = _list_1[_index_0] -- 316
						p:SendChat("Broadcast", text) -- 316
					end -- 316
					local _list_2 = ents.FindByClass("terminal*") -- 317
					for _index_0 = 1, #_list_2 do -- 317
						local term = _list_2[_index_0] -- 317
						local _continue_0 = false -- 318
						repeat -- 318
							if not IsValid(term) then -- 318
								_continue_0 = true -- 318
								break -- 318
							end -- 318
							do -- 319
								local _exp_0 = term:GetOS() -- 319
								if "public" == _exp_0 then -- 320
									net.Start("evilrp_terminal_flicker") -- 321
									net.WriteUInt(16, term:EntIndex()) -- 322
									net.Broadcast() -- 323
									gterm:Broadcast(term, text, GT_COL_ERR) -- 324
								end -- 324
							end -- 324
							_continue_0 = true -- 318
						until true -- 324
						if not _continue_0 then -- 324
							break -- 324
						end -- 324
					end -- 324
				end, -- 307
				help = "Demand of your people with the XOMBOKOM." -- 325
			}, -- 306
			[":tax"] = { -- 328
				Callback = function(self, ply, term, args) -- 328
					if ply:Team() ~= TEAM_EMPEROR then -- 329
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 330
						return -- 331
					end -- 329
					local taxes = GAMEMODE.taxes -- 332
					local cmd = args[1] -- 333
					if "list" == cmd then -- 335
						gterm:Broadcast(term, "TAXES OF THE LAND:") -- 336
						for k, v in pairs(taxes) do -- 337
							gterm:Broadcast(term, "  " .. tostring(k) .. " tax is " .. tostring(v) .. "%", GT_COL_SUCC) -- 338
							gterm:Broadcast(term, "    (" .. tostring(GAMEMODE.taxes_stored[k]) .. " bones gathered)", GT_COL_SUCC) -- 339
						end -- 339
						return gterm:Broadcast(term, "end list", GT_COL_INTL) -- 340
					elseif "set" == cmd then -- 341
						local tax = args[2] -- 342
						if not (tax and taxes[tax]) then -- 343
							gterm:Broadcast(term, "invalid tax name given?", GT_COL_ERR) -- 344
							return -- 345
						end -- 343
						local new_pct = args[3] -- 346
						new_pct = tonumber(new_pct) -- 347
						if not new_pct then -- 348
							gterm:Broadcast(term, "invalid tax percentage given?", GT_COL_ERR) -- 349
							return -- 350
						elseif new_pct < 0 then -- 351
							gterm:Broadcast(term, "the taxes cannot fall into the negative", GT_COL_ERR) -- 352
							return -- 353
						elseif new_pct > 100 then -- 354
							gterm:Broadcast(term, "the taxes cannot exceed one hundred percent", GT_COL_ERR) -- 355
							return -- 357
						end -- 348
						taxes[tax] = new_pct -- 358
						SetGlobalInt("tax_" .. tostring(tax), new_pct) -- 360
						PlaySoundGlobal("XOMBOTAX") -- 361
						local text = "the " .. tostring(tax) .. " tax is now " .. tostring(new_pct) .. "%" -- 362
						gterm:Broadcast(term, text, GT_COL_SUCC) -- 363
						local _list_1 = ents.FindByClass("terminal*") -- 364
						for _index_0 = 1, #_list_1 do -- 364
							local term = _list_1[_index_0] -- 364
							local _continue_0 = false -- 365
							repeat -- 365
								if not IsValid(term) then -- 365
									_continue_0 = true -- 365
									break -- 365
								end -- 365
								do -- 366
									local _exp_0 = term:GetOS() -- 366
									if "public" == _exp_0 then -- 367
										net.Start("evilrp_terminal_flicker") -- 368
										net.WriteUInt(16, term:EntIndex()) -- 369
										net.Broadcast() -- 370
										gterm:Broadcast(term, text, GT_COL_SUCC) -- 371
									end -- 371
								end -- 371
								_continue_0 = true -- 365
							until true -- 371
							if not _continue_0 then -- 371
								break -- 371
							end -- 371
						end -- 371
					elseif "collect" == cmd then -- 372
						local tax = args[2] -- 373
						local reward = GAMEMODE.taxes_stored[tax] -- 374
						if not (tax and taxes[tax]) then -- 375
							gterm:Broadcast(term, "invalid tax name given?", GT_COL_ERR) -- 376
							return -- 377
						end -- 375
						if not (reward > 0) then -- 378
							gterm:Broadcast(term, "there is nothing to collect from " .. tostring(tax), GT_COL_ERR) -- 379
							return -- 380
						end -- 378
						GAMEMODE.taxes_stored[tax] = 0 -- 381
						gterm:Broadcast(term, tostring(reward) .. " bones from " .. tostring(tax) .. " are now yours", GT_COL_SUCC) -- 382
						return ply:AddMoney(reward, "The Power") -- 383
					else -- 385
						local _with_0 = gterm -- 385
						_with_0:Broadcast(term, "TAX INTERFACE", GT_COL_INFO) -- 386
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO) -- 387
						_with_0:Broadcast(term, "    gives you what you deserve") -- 388
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO) -- 389
						_with_0:Broadcast(term, "    :tax list - list the current taxes") -- 390
						_with_0:Broadcast(term, "    :tax set NAME 0-100 - alter the taxes") -- 391
						_with_0:Broadcast(term, "    :tax collect NAME - the best part of this") -- 392
						return _with_0 -- 385
					end -- 392
				end, -- 328
				help = "The reward for your fantastic service." -- 393
			}, -- 327
			[":cls"] = { -- 396
				Callback = function(self, ply, term) -- 396
					if ply:Team() ~= TEAM_EMPEROR then -- 397
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 398
						return -- 399
					end -- 397
					for i = 0, term.max_lines do -- 400
						local time = math.Rand(0.01, 0.04) -- 401
						timer.Simple(i * time, function() -- 402
							if IsValid(term) then -- 403
								return gterm:Broadcast(term, "", MSG_COL_NIL, i) -- 403
							end -- 403
						end) -- 402
					end -- 403
					return -- 404
				end, -- 396
				help = "Clear the screen." -- 405
			}, -- 395
			[":stocks"] = { -- 408
				Callback = function(self, ply, term, args) -- 408
					self.cache = self.cache or { } -- 409
					local stocks = GAMEMODE.Stocks -- 410
					local _with_0 = gterm -- 411
					_with_0:Broadcast(term, "STOCKS OF THE LAND:", GT_COL_INFO) -- 412
					for k, v in pairs(stocks) do -- 413
						if v > 0 then -- 414
							local etab = self.cache[k] -- 415
							if not etab then -- 416
								etab = scripted_ents.Get(k) or weapons.Get(k) -- 417
								self.cache[k] = etab -- 418
							end -- 416
							local display = etab.PrintName or k -- 419
							_with_0:Broadcast(term, "  " .. tostring(display) .. ": " .. tostring(v) .. " units", GT_COL_SUCC) -- 420
						end -- 414
					end -- 420
					_with_0:Broadcast(term, "end list", GT_COL_INTL) -- 421
					return _with_0 -- 411
				end, -- 408
				help = "View what you own." -- 422
			}, -- 407
			[":die"] = { -- 425
				Callback = function(self, ply, term) -- 425
					if ply:Team() ~= TEAM_EMPEROR then -- 426
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 427
						return -- 428
					end -- 426
					gterm:Broadcast(term, "SHUTTING DOWN") -- 429
					return timer.Simple(math.Rand(2, 5), function() -- 430
						if IsValid(term) then -- 431
							for i = 0, term.max_lines do -- 432
								if IsValid(term) then -- 433
									gterm:Broadcast(term, "", nil, i) -- 433
								end -- 433
							end -- 433
							term:SetActive(false) -- 434
							return gterm.OS:Call(term, "ShutDown") -- 435
						end -- 431
					end) -- 435
				end, -- 425
				help = "Turn the computer off." -- 436
			}, -- 424
			[":law"] = { -- 439
				Callback = function(self, ply, term, args) -- 439
					if ply:Team() ~= TEAM_EMPEROR then -- 440
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 441
						return -- 442
					end -- 440
					local laws = GAMEMODE:Laws() -- 443
					local cmd = args[1] -- 444
					if "list" == cmd then -- 446
						gterm:Broadcast(term, "LAWS OF THE LAND:", GT_COL_INFO) -- 447
						for k, v in ipairs(laws) do -- 448
							gterm:Broadcast(term, "  " .. tostring(k) .. ". " .. tostring(v)) -- 448
						end -- 448
						return gterm:Broadcast(term, "  end list", GT_COL_INTL) -- 449
					elseif "add" == cmd then -- 450
						if #args < 2 then -- 451
							gterm:Broadcast(term, "no law text provided?", GT_COL_ERR) -- 452
							return -- 453
						end -- 451
						table.remove(args, 1) -- 454
						local text = table.concat(args, " ") -- 455
						do -- 456
							local _obj_0 = GAMEMODE.laws -- 456
							_obj_0[#_obj_0 + 1] = text -- 456
						end -- 456
						return gterm:Broadcast(term, "created law " .. tostring(#GAMEMODE:Laws()) .. ": \"" .. tostring(text) .. "\"", GT_COL_SUCC) -- 457
					elseif "remove" == cmd then -- 458
						if #args < 2 then -- 459
							gterm:Broadcast(term, "no law specified?", GT_COL_ERR) -- 460
							return -- 461
						end -- 459
						local num = tonumber(args[2]) -- 462
						if 0 == num or nil == num then -- 464
							gterm:Broadcast(term, "invalid number given?", GT_COL_ERR) -- 465
							return -- 466
						else -- 468
							if num > #laws then -- 468
								gterm:Broadcast(term, "invalid number given? (law count: " .. tostring(#laws) .. ")", GT_COL_ERR) -- 469
								return -- 470
							elseif num <= #GAMEMODE.default_laws then -- 471
								gterm:Broadcast(term, "cannot remove laws numbered " .. tostring(#GAMEMODE.default_laws) .. " or less", GT_COL_ERR) -- 472
								return -- 473
							end -- 468
							local law = table.remove(GAMEMODE.laws, num - #GAMEMODE.default_laws) -- 475
							return gterm:Broadcast(term, "deleted law " .. tostring(num) .. ": \"" .. tostring(law) .. "\"", GT_COL_ERR) -- 476
						end -- 476
					elseif "rotate" == cmd then -- 477
						if #args < 3 then -- 478
							gterm:Broadcast(term, "invalid arguments?", GT_COL_ERR) -- 479
							return -- 480
						end -- 478
						local first = tonumber(args[2]) -- 481
						local second = tonumber(args[3]) -- 482
						if (first == 0 or first == nil) or (second == 0 or second == nil) then -- 483
							gterm:Broadcast(term, "invalid number given?", GT_COL_ERR) -- 484
							return -- 485
						elseif first > #laws or second > #laws then -- 486
							gterm:Broadcast(term, "invalid number given? (law count: " .. tostring(laws), GT_COL_ERR) -- 487
							return -- 488
						elseif first <= #GAMEMODE.default_laws or second <= #GAMEMODE.default_laws then -- 490
							gterm:Broadcast(term, "cannot rotate laws numbered " .. tostring(#GAMEMODE.default_laws) .. " or less", GT_COL_ERR) -- 491
							return -- 492
						end -- 483
						first = first - #GAMEMODE.default_laws -- 493
						local first_law = GAMEMODE.laws[first] -- 494
						second = second - #GAMEMODE.default_laws -- 495
						local second_law = GAMEMODE.laws[second] -- 496
						GAMEMODE.laws[first] = second_law -- 497
						GAMEMODE.laws[second] = first_law -- 498
						return gterm:Broadcast(term, "rotated laws " .. tostring(args[2]) .. "/" .. tostring(args[3]) .. ".", GT_COL_SUCC) -- 499
					else -- 501
						local _with_0 = gterm -- 501
						_with_0:Broadcast(term, "LAW INTERFACE", GT_COL_INFO) -- 502
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO) -- 503
						_with_0:Broadcast(term, "    makes your wishes come true") -- 504
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO) -- 505
						_with_0:Broadcast(term, "    :law list - list the current laws") -- 506
						_with_0:Broadcast(term, "    :law add <your law's text> - add a new law") -- 507
						_with_0:Broadcast(term, "    :law remove # - remove a law by its number") -- 508
						_with_0:Broadcast(term, "    :law rotate #1 #2 - two laws switch places") -- 509
						return _with_0 -- 501
					end -- 509
				end, -- 439
				help = "View and manipulate the laws of this land." -- 510
			} -- 438
		} -- 257
	} -- 257
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 511
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 257
			_base_0[_key_0] = _val_0 -- 257
		end -- 257
	end -- 511
	if _base_0.__index == nil then -- 257
		_base_0.__index = _base_0 -- 257
	end -- 511
	setmetatable(_base_0, _parent_0.__base) -- 257
	_class_0 = setmetatable({ -- 257
		__init = function(self, ...) -- 257
			return _class_0.__parent.__init(self, ...) -- 257
		end, -- 257
		__base = _base_0, -- 257
		__name = "Tyrant", -- 257
		__parent = _parent_0 -- 257
	}, { -- 257
		__index = function(cls, name) -- 257
			local val = rawget(_base_0, name) -- 257
			if val == nil then -- 257
				local parent = rawget(cls, "__parent") -- 257
				if parent then -- 257
					return parent[name] -- 257
				end -- 257
			else -- 257
				return val -- 257
			end -- 257
		end, -- 257
		__call = function(cls, ...) -- 257
			local _self_0 = setmetatable({ }, _base_0) -- 257
			cls.__init(_self_0, ...) -- 257
			return _self_0 -- 257
		end -- 257
	}) -- 257
	_base_0.__class = _class_0 -- 257
	if _parent_0.__inherited then -- 257
		_parent_0.__inherited(_parent_0, _class_0) -- 257
	end -- 257
	Tyrant = _class_0 -- 257
end -- 511
local Public -- 513
do -- 513
	local _class_0 -- 513
	local _parent_0 = OS -- 513
	local _base_0 = { -- 513
		greeting = { -- 515
			"boot sequence now", -- 515
			"finalizing public system", -- 516
			"greetings citizen", -- 517
			"LONG LIVE THE EMPEROR." -- 518
		}, -- 521
		advice = { -- 522
			"One corpse's trash is another corpse's treasure.", -- 522
			"Bottles are useful. Don't smash them.", -- 523
			"Snorting broken glass may give you special powers.", -- 524
			"Burn your trash, eat your plastic, never stop smoking.", -- 525
			"Liver Failure doesn't take kindly to slackers.", -- 526
			"You live because you are useful enough to be exploited.", -- 527
			"Chew with your good teeth.", -- 528
			"Violence doesn't solve every problem, only some of them.", -- 529
			"Flesh capsules are very delicate, be careful with them.", -- 530
			"You do not need a gun. You do not want a gun.", -- 531
			"Don't venture too far into the tunnels.", -- 532
			"Evil things are bad.", -- 533
			"Play catch with people.", -- 534
			"Playing is fun.", -- 535
			"Play teeth. Teeth is fun.", -- 536
			"Rules are the rules.", -- 537
			"M y  h e a d ... M y  b r a i n ... M y  b e e r ...", -- 538
			"Eat and drink before taking your medicine.", -- 539
			"Bodily fluids can spread pathogens.", -- 540
			"Your safety is not a priority.", -- 541
			"It's what you wanted", -- 542
			"Radar spelled backwards is Radar.", -- 543
			"You're thinking about it, aren't you?", -- 544
			"But seriously though,", -- 545
			"At least you're not dead yet.", -- 546
			"At least you're not teeth yet.", -- 547
			"I wanna go home.", -- 548
			"Please", -- 549
			"You will get what you deserve.", -- 550
			"Booze loves company.", -- 551
			"Misery loves company.", -- 552
			"Teeth love company.", -- 553
			"Corpses love company.", -- 554
			"The things you put in your mouth can hurt you.", -- 555
			"Make sure you're ready for the hangover tomorrow.", -- 556
			"Buying things feels so good, doesn't it?", -- 557
			"We work until we die, and that's the way we like it.", -- 558
			"Blood brothers protect each other.", -- 559
			"You can't trust that people are what they say.", -- 560
			"Some people don't look like you. This is a problem.", -- 561
			"What's a little brawl between friends?", -- 562
			"It's too late now.", -- 563
			"you work to rent a bed so can rest for work tomorrow" -- 564
		}, -- 567
		commands = { -- 568
			[":help"] = { -- 569
				Callback = function(self, ply, term, args) -- 569
					local _with_0 = gterm -- 570
					_with_0:Broadcast(term, "  COMMANDS:") -- 573
					for k, v in SortedPairs(self:GetCommands()) do -- 574
						_with_0:Broadcast(term, "  * " .. tostring(k), GT_COL_INFO) -- 575
						_with_0:Broadcast(term, "    " .. tostring(v.help)) -- 576
					end -- 576
					_with_0:Broadcast(term, "  end list", GT_COL_INTL) -- 577
					return _with_0 -- 570
				end, -- 569
				help = "Basic usage instructions." -- 578
			}, -- 568
			[":cls"] = { -- 581
				Callback = function(self, ply, term) -- 581
					for i = 0, term.max_lines do -- 582
						local time = math.Rand(0.01, 0.04) -- 583
						timer.Simple(i * time, function() -- 584
							if IsValid(term) then -- 585
								return gterm:Broadcast(term, "", MSG_COL_NIL, i) -- 585
							end -- 585
						end) -- 584
					end -- 585
					return -- 586
				end, -- 581
				help = "Clear the screen." -- 587
			}, -- 580
			[":advice"] = { -- 590
				Callback = function(self, ply, term) -- 590
					local advice = self.advice[math.random(#self.advice)] -- 591
					if IsValid(term) then -- 592
						return gterm:Broadcast(term, advice, MSG_COL_INFO) -- 592
					end -- 592
				end, -- 590
				help = "Consult the infinite wisdom." -- 593
			}, -- 589
			[":taxes"] = { -- 596
				Callback = function(self, ply, term, args) -- 596
					local taxes = GAMEMODE.taxes -- 597
					gterm:Broadcast(term, "TAXES OF THE LAND:", GT_COL_INFO) -- 598
					for k, v in pairs(taxes) do -- 599
						gterm:Broadcast(term, "  " .. tostring(k) .. " tax is " .. tostring(v) .. "%", GT_COL_SUCC) -- 599
					end -- 599
					return gterm:Broadcast(term, "end list", GT_COL_INTL) -- 600
				end, -- 596
				help = "View what you people owe." -- 601
			}, -- 595
			[":laws"] = { -- 604
				Callback = function(self, ply, term, args) -- 604
					local laws = GAMEMODE:Laws() -- 605
					gterm:Broadcast(term, "LAWS OF THE LAND:", GT_COL_INFO) -- 606
					for k, v in ipairs(laws) do -- 607
						gterm:Broadcast(term, "  " .. tostring(k) .. ". " .. tostring(v), GT_COL_WRN) -- 607
					end -- 607
					return gterm:Broadcast(term, "end list", GT_COL_INTL) -- 608
				end, -- 604
				help = "View the laws of this land." -- 609
			}, -- 603
			[":whoami"] = { -- 612
				Callback = function(self, ply, term, args) -- 612
					gterm:Broadcast(term, "this experimental feature is still in testing", GT_COL_WRN) -- 613
					return gterm:Broadcast(term, "try later", GT_COL_WRN) -- 614
				end, -- 612
				help = "View social information." -- 615
			} -- 611
		}, -- 618
		lifetime = 60 * 3, -- 619
		Initialized = function(self, term) -- 619
			_class_0.__parent.__base.Initialized(self, term) -- 620
			term.live_until = CurTime() + self.lifetime -- 621
			return gterm:Broadcast(term, "DEATH when idle time exceeds " .. tostring(string.NiceTime(self.lifetime)), GT_COL_INFO) -- 622
		end, -- 623
		ReceiveInput = function(self, term, ply) -- 623
			term.live_until = CurTime() + self.lifetime -- 624
		end, -- 625
		Think = function(self, term) -- 625
			local ct = CurTime() -- 626
			if not term:GetActive() then -- 627
				return -- 627
			end -- 627
			if term.warn_cooldown and ct < term.warn_cooldown then -- 628
				return -- 628
			end -- 628
			if not term.live_until then -- 629
				term.live_until = ct + self.lifetime -- 629
			end -- 629
			local time_left = term.live_until - CurTime() -- 630
			if math.floor(time_left) % 60 == 0 then -- 631
				if math.floor(time_left) <= 1 then -- 632
					gterm:Broadcast(term, "DEATH", GT_COL_INTL) -- 633
					return timer.Simple(math.Rand(2, 5), function() -- 634
						if IsValid(term) and term:GetActive() then -- 635
							for i = 0, term.max_lines do -- 636
								if IsValid(term) then -- 637
									gterm:Broadcast(term, "", nil, i) -- 637
								end -- 637
							end -- 637
							return gterm.OS:Call(term, "ShutDown") -- 638
						end -- 635
					end) -- 638
				else -- 640
					return gterm:Broadcast(term, "DEATH in " .. tostring(string.NiceTime(time_left)), GT_COL_INFO) -- 640
				end -- 632
			end -- 631
		end -- 513
	} -- 513
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 641
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 513
			_base_0[_key_0] = _val_0 -- 513
		end -- 513
	end -- 641
	if _base_0.__index == nil then -- 513
		_base_0.__index = _base_0 -- 513
	end -- 641
	setmetatable(_base_0, _parent_0.__base) -- 513
	_class_0 = setmetatable({ -- 513
		__init = function(self, ...) -- 513
			return _class_0.__parent.__init(self, ...) -- 513
		end, -- 513
		__base = _base_0, -- 513
		__name = "Public", -- 513
		__parent = _parent_0 -- 513
	}, { -- 513
		__index = function(cls, name) -- 513
			local val = rawget(_base_0, name) -- 513
			if val == nil then -- 513
				local parent = rawget(cls, "__parent") -- 513
				if parent then -- 513
					return parent[name] -- 513
				end -- 513
			else -- 513
				return val -- 513
			end -- 513
		end, -- 513
		__call = function(cls, ...) -- 513
			local _self_0 = setmetatable({ }, _base_0) -- 513
			cls.__init(_self_0, ...) -- 513
			return _self_0 -- 513
		end -- 513
	}) -- 513
	_base_0.__class = _class_0 -- 513
	if _parent_0.__inherited then -- 513
		_parent_0.__inherited(_parent_0, _class_0) -- 513
	end -- 513
	Public = _class_0 -- 513
end -- 641
net.Receive("evilrp_terminal_endconsole", function(len, ply) -- 642
	local idx = net.ReadUInt(16) -- 643
	local term = Entity(idx) -- 644
	local text = net.ReadString() -- 645
	if not (IsValid(term) and term.GetUser) then -- 646
		return -- 646
	end -- 646
	local user = term:GetUser() -- 647
	if not (IsValid(user) and user == ply) then -- 648
		return -- 648
	end -- 648
	if (text == "") or (text == " ") then -- 649
		term:SetUser(nil) -- 650
		net.Start("evilrp_terminal_endtyping") -- 651
		net.Send(ply) -- 652
		return -- 653
	end -- 649
	gterm.OS:Call(term, "ReceiveInput", ply) -- 654
	if term.password and not client["pass_authed_" .. tostring(idx)] then -- 655
		if text == term.password then -- 656
			ply["pass_authed_" .. tostring(idx)] = true -- 657
			gterm:Broadcast(term, "password accepted", GT_COL_INFO) -- 658
			return -- 659
		else -- 661
			gterm:Broadcast(term, "password required", GT_COL_INFO) -- 661
			return -- 662
		end -- 656
	end -- 655
	if string.sub(text, 1, 1) == ":" then -- 663
		local sys = OS.distros[term:GetOS()] -- 664
		if sys then -- 665
			for k, v in pairs(sys:GetCommands()) do -- 666
				local cmd = string.sub(string.lower(text), 1, string.len(k)) -- 667
				if k == cmd then -- 668
					local text2 = string.sub(text, string.len(cmd) + 2) -- 669
					local quote = (string.sub(text2, 1, 1) ~= "\"") -- 670
					local args = { } -- 671
					for chunk in string.gmatch(text2, "[^\"]+") do -- 672
						quote = not quote -- 673
						if quote then -- 674
							args[#args + 1] = chunk -- 675
						else -- 677
							for chunk in string.gmatch(chunk, "[^ ]+") do -- 677
								args[#args + 1] = chunk -- 677
							end -- 677
						end -- 674
					end -- 677
					local success, value = pcall(v.Callback, sys, ply, term, args) -- 678
					if success then -- 679
						gterm:Broadcast(term, text, GT_COL_CMD) -- 680
					else -- 682
						gterm:Broadcast(term, value, GT_COL_ERR) -- 682
					end -- 679
					return -- 683
				end -- 668
			end -- 683
			text = tostring(string.sub(text, 2)) .. ": command not found" -- 684
			gterm:Broadcast(term, text, GT_COL_ERR) -- 685
			return -- 686
		else -- 688
			gterm:Broadcast(term, "DEATH", GT_COL_INTL) -- 690
		end -- 665
		if term.accepting_input then -- 691
			local quote = (string.sub(text, 1, 1) ~= "\"") -- 692
			local args = { } -- 693
			for chunk in string.match(text, "[^\"]+") do -- 694
				quote = not quote -- 695
				if quote then -- 696
					args[#args + 1] = chunk -- 697
				else -- 699
					for chunk in string.gmatch(chunk, "[^ ]+") do -- 699
						args[#args + 1] = chunk -- 699
					end -- 699
				end -- 696
			end -- 699
			local callback = term.input_callback -- 700
			if callback and args then -- 701
				callback(ply, args) -- 701
			end -- 701
			term.accepting_input = nil -- 702
			term.input_callback = nil -- 703
			return -- 704
		end -- 691
	end -- 663
	local sys = OS.distros[term:GetOS()] -- 705
	local name = sys and sys.unique_id or "unknown" -- 706
	local finalized = tostring(("<"):Escape()) .. tostring(name) .. "@" .. tostring(term:EntIndex()) .. tostring((">"):Escape()) .. " " .. tostring(text) -- 707
	return gterm:Broadcast(term, finalized, GT_COL_CMD) -- 708
end) -- 642
return MsgC(Color(255, 0, 0), "INITIALIZED EVILRP TERMINALS\n") -- 710
