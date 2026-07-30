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
GetPlayerByName = function(name) -- 9
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
			[":want"] = { -- 285
				Callback = function(self, ply, term, args) -- 285
					if ply:Team() ~= TEAM_EMPEROR then -- 286
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 287
						return -- 288
					end -- 286
					local cmd = args[1] -- 289
					if cmd ~= "" then -- 290
						print(cmd) -- 291
						local cply = GetPlayerByName(cmd) -- 292
						if not IsValid(cply) then -- 293
							gterm:Broadcast(term, "that person does not exist", GT_COL_ERR) -- 294
							return -- 295
						end -- 293
						local name = cply:Nick() -- 296
						local team = cply:Team() -- 297
						cply:MakeWanted(300, "offending the Emperor") -- 298
						return gterm:Broadcast(term, "death to" .. tostring(name), GT_COL_SUCC) -- 299
					end -- 290
				end, -- 285
				help = "Make a nuisance pay for its arrogance." -- 300
			}, -- 284
			[":conscript"] = { -- 303
				Callback = function(self, ply, term, args) -- 303
					if ply:Team() ~= TEAM_EMPEROR then -- 304
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 305
						return -- 306
					end -- 304
					local money = ply:getDarkRPVar("money") -- 307
					local cost = 500 -- 308
					local cmd = args[1] -- 309
					if cmd ~= "" then -- 310
						print(cmd) -- 311
						local cply = GetPlayerByName(cmd) -- 312
						if not IsValid(cply) then -- 313
							gterm:Broadcast(term, "that person does not exist", GT_COL_ERR) -- 314
							return -- 315
						end -- 313
						local name = cply:Nick() -- 316
						local team = cply:Team() -- 317
						if team ~= TEAM_PRIVATE then -- 318
							gterm:Broadcast(term, tostring(name) .. " is too important", GT_COL_ERR) -- 319
							return -- 320
						end -- 318
						if money < cost then -- 321
							gterm:Broadcast(term, "you cannot afford to conscript " .. tostring(name), GT_COL_ERR) -- 322
							return -- 323
						end -- 321
						ply:AddMoney(-cost, "The State") -- 324
						conscript(cply) -- 325
						name = cply:Nick() -- 326
						return gterm:Broadcast(term, "new cannon fodder: " .. tostring(name), GT_COL_SUCC) -- 327
					end -- 310
				end, -- 303
				help = "Conscript your recruits." -- 328
			}, -- 302
			[":broadcast"] = { -- 331
				Callback = function(self, ply, term, args) -- 331
					if ply:Team() ~= TEAM_EMPEROR then -- 332
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 333
						return -- 334
					end -- 332
					local text = table.concat(args, " ") -- 335
					text = Chat.Autopretty(ply, text:upper()) -- 336
					do -- 337
						local _with_0 = gterm -- 337
						_with_0:Broadcast(term, text, GT_COL_ERR) -- 338
					end -- 337
					PlaySoundGlobal("XOMBOKOM") -- 339
					local _list_1 = player.GetAll() -- 340
					for _index_0 = 1, #_list_1 do -- 340
						local p = _list_1[_index_0] -- 340
						p:SendChat("Broadcast", text) -- 340
					end -- 340
					local _list_2 = ents.FindByClass("terminal*") -- 341
					for _index_0 = 1, #_list_2 do -- 341
						local term = _list_2[_index_0] -- 341
						local _continue_0 = false -- 342
						repeat -- 342
							if not IsValid(term) then -- 342
								_continue_0 = true -- 342
								break -- 342
							end -- 342
							do -- 343
								local _exp_0 = term:GetOS() -- 343
								if "public" == _exp_0 then -- 344
									net.Start("evilrp_terminal_flicker") -- 345
									net.WriteUInt(16, term:EntIndex()) -- 346
									net.Broadcast() -- 347
									gterm:Broadcast(term, text, GT_COL_ERR) -- 348
								end -- 348
							end -- 348
							_continue_0 = true -- 342
						until true -- 348
						if not _continue_0 then -- 348
							break -- 348
						end -- 348
					end -- 348
				end, -- 331
				help = "Demand of your people with the XOMBOKOM." -- 349
			}, -- 330
			[":tax"] = { -- 352
				Callback = function(self, ply, term, args) -- 352
					if ply:Team() ~= TEAM_EMPEROR then -- 353
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 354
						return -- 355
					end -- 353
					local taxes = GAMEMODE.taxes -- 356
					local cmd = args[1] -- 357
					if "list" == cmd then -- 359
						gterm:Broadcast(term, "TAXES OF THE LAND:") -- 360
						for k, v in pairs(taxes) do -- 361
							gterm:Broadcast(term, "  " .. tostring(k) .. " tax is " .. tostring(v) .. "%", GT_COL_SUCC) -- 362
							gterm:Broadcast(term, "    (" .. tostring(GAMEMODE.taxes_stored[k]) .. " bones gathered)", GT_COL_SUCC) -- 363
						end -- 363
						return gterm:Broadcast(term, "end list", GT_COL_INTL) -- 364
					elseif "set" == cmd then -- 365
						local tax = args[2] -- 366
						if not (tax and taxes[tax]) then -- 367
							gterm:Broadcast(term, "invalid tax name given?", GT_COL_ERR) -- 368
							return -- 369
						end -- 367
						local new_pct = args[3] -- 370
						new_pct = tonumber(new_pct) -- 371
						if not new_pct then -- 372
							gterm:Broadcast(term, "invalid tax percentage given?", GT_COL_ERR) -- 373
							return -- 374
						elseif new_pct < 0 then -- 375
							gterm:Broadcast(term, "the taxes cannot fall into the negative", GT_COL_ERR) -- 376
							return -- 377
						elseif new_pct > 100 then -- 378
							gterm:Broadcast(term, "the taxes cannot exceed one hundred percent", GT_COL_ERR) -- 379
							return -- 381
						end -- 372
						taxes[tax] = new_pct -- 382
						SetGlobalInt("tax_" .. tostring(tax), new_pct) -- 384
						PlaySoundGlobal("XOMBOTAX") -- 385
						local text = "the " .. tostring(tax) .. " tax is now " .. tostring(new_pct) .. "%" -- 386
						gterm:Broadcast(term, text, GT_COL_SUCC) -- 387
						local _list_1 = ents.FindByClass("terminal*") -- 388
						for _index_0 = 1, #_list_1 do -- 388
							local term = _list_1[_index_0] -- 388
							local _continue_0 = false -- 389
							repeat -- 389
								if not IsValid(term) then -- 389
									_continue_0 = true -- 389
									break -- 389
								end -- 389
								do -- 390
									local _exp_0 = term:GetOS() -- 390
									if "public" == _exp_0 then -- 391
										net.Start("evilrp_terminal_flicker") -- 392
										net.WriteUInt(16, term:EntIndex()) -- 393
										net.Broadcast() -- 394
										gterm:Broadcast(term, text, GT_COL_SUCC) -- 395
									end -- 395
								end -- 395
								_continue_0 = true -- 389
							until true -- 395
							if not _continue_0 then -- 395
								break -- 395
							end -- 395
						end -- 395
					elseif "collect" == cmd then -- 396
						local tax = args[2] -- 397
						local reward = GAMEMODE.taxes_stored[tax] -- 398
						if not (tax and taxes[tax]) then -- 399
							gterm:Broadcast(term, "invalid tax name given?", GT_COL_ERR) -- 400
							return -- 401
						end -- 399
						if not (reward > 0) then -- 402
							gterm:Broadcast(term, "there is nothing to collect from " .. tostring(tax), GT_COL_ERR) -- 403
							return -- 404
						end -- 402
						GAMEMODE.taxes_stored[tax] = 0 -- 405
						gterm:Broadcast(term, tostring(reward) .. " bones from " .. tostring(tax) .. " are now yours", GT_COL_SUCC) -- 406
						return ply:AddMoney(reward, "The Power") -- 407
					else -- 409
						local _with_0 = gterm -- 409
						_with_0:Broadcast(term, "TAX INTERFACE", GT_COL_INFO) -- 410
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO) -- 411
						_with_0:Broadcast(term, "    gives you what you deserve") -- 412
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO) -- 413
						_with_0:Broadcast(term, "    :tax list - list the current taxes") -- 414
						_with_0:Broadcast(term, "    :tax set NAME 0-100 - alter the taxes") -- 415
						_with_0:Broadcast(term, "    :tax collect NAME - the best part of this") -- 416
						return _with_0 -- 409
					end -- 416
				end, -- 352
				help = "The reward for your fantastic service." -- 417
			}, -- 351
			[":cls"] = { -- 420
				Callback = function(self, ply, term) -- 420
					if ply:Team() ~= TEAM_EMPEROR then -- 421
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 422
						return -- 423
					end -- 421
					for i = 0, term.max_lines do -- 424
						local time = math.Rand(0.01, 0.04) -- 425
						timer.Simple(i * time, function() -- 426
							if IsValid(term) then -- 427
								return gterm:Broadcast(term, "", MSG_COL_NIL, i) -- 427
							end -- 427
						end) -- 426
					end -- 427
					return -- 428
				end, -- 420
				help = "Clear the screen." -- 429
			}, -- 419
			[":stocks"] = { -- 432
				Callback = function(self, ply, term, args) -- 432
					self.cache = self.cache or { } -- 433
					local stocks = GAMEMODE.Stocks -- 434
					local _with_0 = gterm -- 435
					_with_0:Broadcast(term, "STOCKS OF THE LAND:", GT_COL_INFO) -- 436
					for k, v in pairs(stocks) do -- 437
						if v > 0 then -- 438
							local etab = self.cache[k] -- 439
							if not etab then -- 440
								etab = scripted_ents.Get(k) or weapons.Get(k) -- 441
								self.cache[k] = etab -- 442
							end -- 440
							local display = etab.PrintName or k -- 443
							_with_0:Broadcast(term, "  " .. tostring(display) .. ": " .. tostring(v) .. " units", GT_COL_SUCC) -- 444
						end -- 438
					end -- 444
					_with_0:Broadcast(term, "end list", GT_COL_INTL) -- 445
					return _with_0 -- 435
				end, -- 432
				help = "View what you own." -- 446
			}, -- 431
			[":die"] = { -- 449
				Callback = function(self, ply, term) -- 449
					if ply:Team() ~= TEAM_EMPEROR then -- 450
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 451
						return -- 452
					end -- 450
					gterm:Broadcast(term, "SHUTTING DOWN") -- 453
					return timer.Simple(math.Rand(2, 5), function() -- 454
						if IsValid(term) then -- 455
							for i = 0, term.max_lines do -- 456
								if IsValid(term) then -- 457
									gterm:Broadcast(term, "", nil, i) -- 457
								end -- 457
							end -- 457
							term:SetActive(false) -- 458
							return gterm.OS:Call(term, "ShutDown") -- 459
						end -- 455
					end) -- 459
				end, -- 449
				help = "Turn the computer off." -- 460
			}, -- 448
			[":law"] = { -- 463
				Callback = function(self, ply, term, args) -- 463
					if ply:Team() ~= TEAM_EMPEROR then -- 464
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 465
						return -- 466
					end -- 464
					local laws = GAMEMODE:Laws() -- 467
					local cmd = args[1] -- 468
					if "list" == cmd then -- 470
						gterm:Broadcast(term, "LAWS OF THE LAND:", GT_COL_INFO) -- 471
						for k, v in ipairs(laws) do -- 472
							gterm:Broadcast(term, "  " .. tostring(k) .. ". " .. tostring(v)) -- 472
						end -- 472
						return gterm:Broadcast(term, "  end list", GT_COL_INTL) -- 473
					elseif "add" == cmd then -- 474
						if #args < 2 then -- 475
							gterm:Broadcast(term, "no law text provided?", GT_COL_ERR) -- 476
							return -- 477
						end -- 475
						table.remove(args, 1) -- 478
						local text = table.concat(args, " ") -- 479
						do -- 480
							local _obj_0 = GAMEMODE.laws -- 480
							_obj_0[#_obj_0 + 1] = text -- 480
						end -- 480
						return gterm:Broadcast(term, "created law " .. tostring(#GAMEMODE:Laws()) .. ": \"" .. tostring(text) .. "\"", GT_COL_SUCC) -- 481
					elseif "remove" == cmd then -- 482
						if #args < 2 then -- 483
							gterm:Broadcast(term, "no law specified?", GT_COL_ERR) -- 484
							return -- 485
						end -- 483
						local num = tonumber(args[2]) -- 486
						if 0 == num or nil == num then -- 488
							gterm:Broadcast(term, "invalid number given?", GT_COL_ERR) -- 489
							return -- 490
						else -- 492
							if num > #laws then -- 492
								gterm:Broadcast(term, "invalid number given? (law count: " .. tostring(#laws) .. ")", GT_COL_ERR) -- 493
								return -- 494
							elseif num <= #GAMEMODE.default_laws then -- 495
								gterm:Broadcast(term, "cannot remove laws numbered " .. tostring(#GAMEMODE.default_laws) .. " or less", GT_COL_ERR) -- 496
								return -- 497
							end -- 492
							local law = table.remove(GAMEMODE.laws, num - #GAMEMODE.default_laws) -- 499
							return gterm:Broadcast(term, "deleted law " .. tostring(num) .. ": \"" .. tostring(law) .. "\"", GT_COL_ERR) -- 500
						end -- 500
					elseif "rotate" == cmd then -- 501
						if #args < 3 then -- 502
							gterm:Broadcast(term, "invalid arguments?", GT_COL_ERR) -- 503
							return -- 504
						end -- 502
						local first = tonumber(args[2]) -- 505
						local second = tonumber(args[3]) -- 506
						if (first == 0 or first == nil) or (second == 0 or second == nil) then -- 507
							gterm:Broadcast(term, "invalid number given?", GT_COL_ERR) -- 508
							return -- 509
						elseif first > #laws or second > #laws then -- 510
							gterm:Broadcast(term, "invalid number given? (law count: " .. tostring(laws), GT_COL_ERR) -- 511
							return -- 512
						elseif first <= #GAMEMODE.default_laws or second <= #GAMEMODE.default_laws then -- 514
							gterm:Broadcast(term, "cannot rotate laws numbered " .. tostring(#GAMEMODE.default_laws) .. " or less", GT_COL_ERR) -- 515
							return -- 516
						end -- 507
						first = first - #GAMEMODE.default_laws -- 517
						local first_law = GAMEMODE.laws[first] -- 518
						second = second - #GAMEMODE.default_laws -- 519
						local second_law = GAMEMODE.laws[second] -- 520
						GAMEMODE.laws[first] = second_law -- 521
						GAMEMODE.laws[second] = first_law -- 522
						return gterm:Broadcast(term, "rotated laws " .. tostring(args[2]) .. "/" .. tostring(args[3]) .. ".", GT_COL_SUCC) -- 523
					else -- 525
						local _with_0 = gterm -- 525
						_with_0:Broadcast(term, "LAW INTERFACE", GT_COL_INFO) -- 526
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO) -- 527
						_with_0:Broadcast(term, "    makes your wishes come true") -- 528
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO) -- 529
						_with_0:Broadcast(term, "    :law list - list the current laws") -- 530
						_with_0:Broadcast(term, "    :law add <your law's text> - add a new law") -- 531
						_with_0:Broadcast(term, "    :law remove # - remove a law by its number") -- 532
						_with_0:Broadcast(term, "    :law rotate #1 #2 - two laws switch places") -- 533
						return _with_0 -- 525
					end -- 533
				end, -- 463
				help = "View and manipulate the laws of this land." -- 534
			} -- 462
		} -- 257
	} -- 257
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 535
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 257
			_base_0[_key_0] = _val_0 -- 257
		end -- 257
	end -- 535
	if _base_0.__index == nil then -- 257
		_base_0.__index = _base_0 -- 257
	end -- 535
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
end -- 535
local Public -- 537
do -- 537
	local _class_0 -- 537
	local _parent_0 = OS -- 537
	local _base_0 = { -- 537
		greeting = { -- 539
			"boot sequence now", -- 539
			"finalizing public system", -- 540
			"greetings citizen", -- 541
			"LONG LIVE THE EMPEROR." -- 542
		}, -- 545
		advice = { -- 546
			"One corpse's trash is another corpse's treasure.", -- 546
			"Bottles are useful. Don't smash them.", -- 547
			"Snorting broken glass may give you special powers.", -- 548
			"Burn your trash, eat your plastic, never stop smoking.", -- 549
			"Liver Failure doesn't take kindly to slackers.", -- 550
			"You live because you are useful enough to be exploited.", -- 551
			"Chew with your good teeth.", -- 552
			"Violence doesn't solve every problem, only some of them.", -- 553
			"Flesh capsules are very delicate, be careful with them.", -- 554
			"You do not need a gun. You do not want a gun.", -- 555
			"Don't venture too far into the tunnels.", -- 556
			"Evil things are bad.", -- 557
			"Play catch with people.", -- 558
			"Playing is fun.", -- 559
			"Play teeth. Teeth is fun.", -- 560
			"Rules are the rules.", -- 561
			"M y  h e a d ... M y  b r a i n ... M y  b e e r ...", -- 562
			"Eat and drink before taking your medicine.", -- 563
			"Bodily fluids can spread pathogens.", -- 564
			"Your safety is not a priority.", -- 565
			"It's what you wanted", -- 566
			"Radar spelled backwards is Radar.", -- 567
			"You're thinking about it, aren't you?", -- 568
			"But seriously though,", -- 569
			"At least you're not dead yet.", -- 570
			"At least you're not teeth yet.", -- 571
			"I wanna go home.", -- 572
			"Please", -- 573
			"You will get what you deserve.", -- 574
			"Booze loves company.", -- 575
			"Misery loves company.", -- 576
			"Teeth love company.", -- 577
			"Corpses love company.", -- 578
			"The things you put in your mouth can hurt you.", -- 579
			"Make sure you're ready for the hangover tomorrow.", -- 580
			"Buying things feels so good, doesn't it?", -- 581
			"We work until we die, and that's the way we like it.", -- 582
			"Blood brothers protect each other.", -- 583
			"You can't trust that people are what they say.", -- 584
			"Some people don't look like you. This is a problem.", -- 585
			"What's a little brawl between friends?", -- 586
			"It's too late now.", -- 587
			"you work to rent a bed so can rest for work tomorrow" -- 588
		}, -- 591
		commands = { -- 592
			[":help"] = { -- 593
				Callback = function(self, ply, term, args) -- 593
					local _with_0 = gterm -- 594
					_with_0:Broadcast(term, "  COMMANDS:") -- 597
					for k, v in SortedPairs(self:GetCommands()) do -- 598
						_with_0:Broadcast(term, "  * " .. tostring(k), GT_COL_INFO) -- 599
						_with_0:Broadcast(term, "    " .. tostring(v.help)) -- 600
					end -- 600
					_with_0:Broadcast(term, "  end list", GT_COL_INTL) -- 601
					return _with_0 -- 594
				end, -- 593
				help = "Basic usage instructions." -- 602
			}, -- 592
			[":cls"] = { -- 605
				Callback = function(self, ply, term) -- 605
					for i = 0, term.max_lines do -- 606
						local time = math.Rand(0.01, 0.04) -- 607
						timer.Simple(i * time, function() -- 608
							if IsValid(term) then -- 609
								return gterm:Broadcast(term, "", MSG_COL_NIL, i) -- 609
							end -- 609
						end) -- 608
					end -- 609
					return -- 610
				end, -- 605
				help = "Clear the screen." -- 611
			}, -- 604
			[":advice"] = { -- 614
				Callback = function(self, ply, term) -- 614
					local advice = self.advice[math.random(#self.advice)] -- 615
					if IsValid(term) then -- 616
						return gterm:Broadcast(term, advice, MSG_COL_INFO) -- 616
					end -- 616
				end, -- 614
				help = "Consult the infinite wisdom." -- 617
			}, -- 613
			[":taxes"] = { -- 620
				Callback = function(self, ply, term, args) -- 620
					local taxes = GAMEMODE.taxes -- 621
					gterm:Broadcast(term, "TAXES OF THE LAND:", GT_COL_INFO) -- 622
					for k, v in pairs(taxes) do -- 623
						gterm:Broadcast(term, "  " .. tostring(k) .. " tax is " .. tostring(v) .. "%", GT_COL_SUCC) -- 623
					end -- 623
					return gterm:Broadcast(term, "end list", GT_COL_INTL) -- 624
				end, -- 620
				help = "View what you people owe." -- 625
			}, -- 619
			[":laws"] = { -- 628
				Callback = function(self, ply, term, args) -- 628
					local laws = GAMEMODE:Laws() -- 629
					gterm:Broadcast(term, "LAWS OF THE LAND:", GT_COL_INFO) -- 630
					for k, v in ipairs(laws) do -- 631
						gterm:Broadcast(term, "  " .. tostring(k) .. ". " .. tostring(v), GT_COL_WRN) -- 631
					end -- 631
					return gterm:Broadcast(term, "end list", GT_COL_INTL) -- 632
				end, -- 628
				help = "View the laws of this land." -- 633
			}, -- 627
			[":whoami"] = { -- 636
				Callback = function(self, ply, term, args) -- 636
					gterm:Broadcast(term, "this experimental feature is still in testing", GT_COL_WRN) -- 637
					return gterm:Broadcast(term, "try later", GT_COL_WRN) -- 638
				end, -- 636
				help = "View social information." -- 639
			} -- 635
		}, -- 642
		lifetime = 60 * 3, -- 643
		Initialized = function(self, term) -- 643
			_class_0.__parent.__base.Initialized(self, term) -- 644
			term.live_until = CurTime() + self.lifetime -- 645
			return gterm:Broadcast(term, "DEATH when idle time exceeds " .. tostring(string.NiceTime(self.lifetime)), GT_COL_INFO) -- 646
		end, -- 647
		ReceiveInput = function(self, term, ply) -- 647
			term.live_until = CurTime() + self.lifetime -- 648
		end, -- 649
		Think = function(self, term) -- 649
			local ct = CurTime() -- 650
			if not term:GetActive() then -- 651
				return -- 651
			end -- 651
			if term.warn_cooldown and ct < term.warn_cooldown then -- 652
				return -- 652
			end -- 652
			if not term.live_until then -- 653
				term.live_until = ct + self.lifetime -- 653
			end -- 653
			local time_left = term.live_until - CurTime() -- 654
			if math.floor(time_left) % 60 == 0 then -- 655
				if math.floor(time_left) <= 1 then -- 656
					gterm:Broadcast(term, "DEATH", GT_COL_INTL) -- 657
					return timer.Simple(math.Rand(2, 5), function() -- 658
						if IsValid(term) and term:GetActive() then -- 659
							for i = 0, term.max_lines do -- 660
								if IsValid(term) then -- 661
									gterm:Broadcast(term, "", nil, i) -- 661
								end -- 661
							end -- 661
							return gterm.OS:Call(term, "ShutDown") -- 662
						end -- 659
					end) -- 662
				else -- 664
					return gterm:Broadcast(term, "DEATH in " .. tostring(string.NiceTime(time_left)), GT_COL_INFO) -- 664
				end -- 656
			end -- 655
		end -- 537
	} -- 537
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 665
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 537
			_base_0[_key_0] = _val_0 -- 537
		end -- 537
	end -- 665
	if _base_0.__index == nil then -- 537
		_base_0.__index = _base_0 -- 537
	end -- 665
	setmetatable(_base_0, _parent_0.__base) -- 537
	_class_0 = setmetatable({ -- 537
		__init = function(self, ...) -- 537
			return _class_0.__parent.__init(self, ...) -- 537
		end, -- 537
		__base = _base_0, -- 537
		__name = "Public", -- 537
		__parent = _parent_0 -- 537
	}, { -- 537
		__index = function(cls, name) -- 537
			local val = rawget(_base_0, name) -- 537
			if val == nil then -- 537
				local parent = rawget(cls, "__parent") -- 537
				if parent then -- 537
					return parent[name] -- 537
				end -- 537
			else -- 537
				return val -- 537
			end -- 537
		end, -- 537
		__call = function(cls, ...) -- 537
			local _self_0 = setmetatable({ }, _base_0) -- 537
			cls.__init(_self_0, ...) -- 537
			return _self_0 -- 537
		end -- 537
	}) -- 537
	_base_0.__class = _class_0 -- 537
	if _parent_0.__inherited then -- 537
		_parent_0.__inherited(_parent_0, _class_0) -- 537
	end -- 537
	Public = _class_0 -- 537
end -- 665
net.Receive("evilrp_terminal_endconsole", function(len, ply) -- 666
	local idx = net.ReadUInt(16) -- 667
	local term = Entity(idx) -- 668
	local text = net.ReadString() -- 669
	if not (IsValid(term) and term.GetUser) then -- 670
		return -- 670
	end -- 670
	local user = term:GetUser() -- 671
	if not (IsValid(user) and user == ply) then -- 672
		return -- 672
	end -- 672
	if (text == "") or (text == " ") then -- 673
		term:SetUser(nil) -- 674
		net.Start("evilrp_terminal_endtyping") -- 675
		net.Send(ply) -- 676
		return -- 677
	end -- 673
	gterm.OS:Call(term, "ReceiveInput", ply) -- 678
	if term.password and not client["pass_authed_" .. tostring(idx)] then -- 679
		if text == term.password then -- 680
			ply["pass_authed_" .. tostring(idx)] = true -- 681
			gterm:Broadcast(term, "password accepted", GT_COL_INFO) -- 682
			return -- 683
		else -- 685
			gterm:Broadcast(term, "password required", GT_COL_INFO) -- 685
			return -- 686
		end -- 680
	end -- 679
	if string.sub(text, 1, 1) == ":" then -- 687
		local sys = OS.distros[term:GetOS()] -- 688
		if sys then -- 689
			for k, v in pairs(sys:GetCommands()) do -- 690
				local cmd = string.sub(string.lower(text), 1, string.len(k)) -- 691
				if k == cmd then -- 692
					local text2 = string.sub(text, string.len(cmd) + 2) -- 693
					local quote = (string.sub(text2, 1, 1) ~= "\"") -- 694
					local args = { } -- 695
					for chunk in string.gmatch(text2, "[^\"]+") do -- 696
						quote = not quote -- 697
						if quote then -- 698
							args[#args + 1] = chunk -- 699
						else -- 701
							for chunk in string.gmatch(chunk, "[^ ]+") do -- 701
								args[#args + 1] = chunk -- 701
							end -- 701
						end -- 698
					end -- 701
					local success, value = pcall(v.Callback, sys, ply, term, args) -- 702
					if success then -- 703
						gterm:Broadcast(term, text, GT_COL_CMD) -- 704
					else -- 706
						gterm:Broadcast(term, value, GT_COL_ERR) -- 706
					end -- 703
					return -- 707
				end -- 692
			end -- 707
			text = tostring(string.sub(text, 2)) .. ": command not found" -- 708
			gterm:Broadcast(term, text, GT_COL_ERR) -- 709
			return -- 710
		else -- 712
			gterm:Broadcast(term, "DEATH", GT_COL_INTL) -- 714
		end -- 689
		if term.accepting_input then -- 715
			local quote = (string.sub(text, 1, 1) ~= "\"") -- 716
			local args = { } -- 717
			for chunk in string.match(text, "[^\"]+") do -- 718
				quote = not quote -- 719
				if quote then -- 720
					args[#args + 1] = chunk -- 721
				else -- 723
					for chunk in string.gmatch(chunk, "[^ ]+") do -- 723
						args[#args + 1] = chunk -- 723
					end -- 723
				end -- 720
			end -- 723
			local callback = term.input_callback -- 724
			if callback and args then -- 725
				callback(ply, args) -- 725
			end -- 725
			term.accepting_input = nil -- 726
			term.input_callback = nil -- 727
			return -- 728
		end -- 715
	end -- 687
	local sys = OS.distros[term:GetOS()] -- 729
	local name = sys and sys.unique_id or "unknown" -- 730
	local finalized = tostring(("<"):Escape()) .. tostring(name) .. "@" .. tostring(term:EntIndex()) .. tostring((">"):Escape()) .. " " .. tostring(text) -- 731
	return gterm:Broadcast(term, finalized, GT_COL_CMD) -- 732
end) -- 666
return MsgC(Color(255, 0, 0), "INITIALIZED EVILRP TERMINALS\n") -- 734
