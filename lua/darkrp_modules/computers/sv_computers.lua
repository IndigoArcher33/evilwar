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
			[":conscript"] = { -- 285
				Callback = function(self, ply, term, args) -- 285
					if ply:Team() ~= TEAM_EMPEROR then -- 286
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 287
						return -- 288
					end -- 286
					local money = ply:getDarkRPVar("money") -- 289
					local cost = 500 -- 290
					local cmd = args[1] -- 291
					if cmd ~= "" then -- 292
						print(cmd) -- 293
						local cply = util.GetPlayerByName(cmd) -- 294
						if not IsValid(cply) then -- 295
							gterm:Broadcast(term, "that person does not exist", GT_COL_ERR) -- 296
							return -- 297
						end -- 295
						local name = cply:Nick() -- 298
						local team = cply:Team() -- 299
						print("conscript: " .. tostring(name) .. " (" .. tostring(team) .. ")") -- 300
						if team ~= TEAM_PRIVATE then -- 301
							gterm:Broadcast(term, tostring(name) .. " is too important", GT_COL_ERR) -- 302
							return -- 303
						end -- 301
						if money < cost then -- 304
							gterm:Broadcast(term, "you cannot afford to conscript " .. tostring(name), GT_COL_ERR) -- 305
							return -- 306
						end -- 304
						ply:AddMoney(-cost, "The State") -- 307
						conscript(cply) -- 308
						name = cply:Nick() -- 309
						return gterm:Broadcast(term, "new cannon fodder: " .. tostring(name), GT_COL_SUCC) -- 310
					end -- 292
				end, -- 285
				help = "Conscript your recruits." -- 311
			}, -- 284
			[":broadcast"] = { -- 314
				Callback = function(self, ply, term, args) -- 314
					if ply:Team() ~= TEAM_EMPEROR then -- 315
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 316
						return -- 317
					end -- 315
					local text = table.concat(args, " ") -- 318
					text = Chat.Autopretty(ply, text:upper()) -- 319
					do -- 320
						local _with_0 = gterm -- 320
						_with_0:Broadcast(term, text, GT_COL_ERR) -- 321
					end -- 320
					PlaySoundGlobal("XOMBOKOM") -- 322
					local _list_1 = player.GetAll() -- 323
					for _index_0 = 1, #_list_1 do -- 323
						local p = _list_1[_index_0] -- 323
						p:SendChat("Broadcast", text) -- 323
					end -- 323
					local _list_2 = ents.FindByClass("terminal*") -- 324
					for _index_0 = 1, #_list_2 do -- 324
						local term = _list_2[_index_0] -- 324
						local _continue_0 = false -- 325
						repeat -- 325
							if not IsValid(term) then -- 325
								_continue_0 = true -- 325
								break -- 325
							end -- 325
							do -- 326
								local _exp_0 = term:GetOS() -- 326
								if "public" == _exp_0 then -- 327
									net.Start("evilrp_terminal_flicker") -- 328
									net.WriteUInt(16, term:EntIndex()) -- 329
									net.Broadcast() -- 330
									gterm:Broadcast(term, text, GT_COL_ERR) -- 331
								end -- 331
							end -- 331
							_continue_0 = true -- 325
						until true -- 331
						if not _continue_0 then -- 331
							break -- 331
						end -- 331
					end -- 331
				end, -- 314
				help = "Demand of your people with the XOMBOKOM." -- 332
			}, -- 313
			[":tax"] = { -- 335
				Callback = function(self, ply, term, args) -- 335
					if ply:Team() ~= TEAM_EMPEROR then -- 336
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 337
						return -- 338
					end -- 336
					local taxes = GAMEMODE.taxes -- 339
					local cmd = args[1] -- 340
					if "list" == cmd then -- 342
						gterm:Broadcast(term, "TAXES OF THE LAND:") -- 343
						for k, v in pairs(taxes) do -- 344
							gterm:Broadcast(term, "  " .. tostring(k) .. " tax is " .. tostring(v) .. "%", GT_COL_SUCC) -- 345
							gterm:Broadcast(term, "    (" .. tostring(GAMEMODE.taxes_stored[k]) .. " bones gathered)", GT_COL_SUCC) -- 346
						end -- 346
						return gterm:Broadcast(term, "end list", GT_COL_INTL) -- 347
					elseif "set" == cmd then -- 348
						local tax = args[2] -- 349
						if not (tax and taxes[tax]) then -- 350
							gterm:Broadcast(term, "invalid tax name given?", GT_COL_ERR) -- 351
							return -- 352
						end -- 350
						local new_pct = args[3] -- 353
						new_pct = tonumber(new_pct) -- 354
						if not new_pct then -- 355
							gterm:Broadcast(term, "invalid tax percentage given?", GT_COL_ERR) -- 356
							return -- 357
						elseif new_pct < 0 then -- 358
							gterm:Broadcast(term, "the taxes cannot fall into the negative", GT_COL_ERR) -- 359
							return -- 360
						elseif new_pct > 100 then -- 361
							gterm:Broadcast(term, "the taxes cannot exceed one hundred percent", GT_COL_ERR) -- 362
							return -- 364
						end -- 355
						taxes[tax] = new_pct -- 365
						SetGlobalInt("tax_" .. tostring(tax), new_pct) -- 367
						PlaySoundGlobal("XOMBOTAX") -- 368
						local text = "the " .. tostring(tax) .. " tax is now " .. tostring(new_pct) .. "%" -- 369
						gterm:Broadcast(term, text, GT_COL_SUCC) -- 370
						local _list_1 = ents.FindByClass("terminal*") -- 371
						for _index_0 = 1, #_list_1 do -- 371
							local term = _list_1[_index_0] -- 371
							local _continue_0 = false -- 372
							repeat -- 372
								if not IsValid(term) then -- 372
									_continue_0 = true -- 372
									break -- 372
								end -- 372
								do -- 373
									local _exp_0 = term:GetOS() -- 373
									if "public" == _exp_0 then -- 374
										net.Start("evilrp_terminal_flicker") -- 375
										net.WriteUInt(16, term:EntIndex()) -- 376
										net.Broadcast() -- 377
										gterm:Broadcast(term, text, GT_COL_SUCC) -- 378
									end -- 378
								end -- 378
								_continue_0 = true -- 372
							until true -- 378
							if not _continue_0 then -- 378
								break -- 378
							end -- 378
						end -- 378
					elseif "collect" == cmd then -- 379
						local tax = args[2] -- 380
						local reward = GAMEMODE.taxes_stored[tax] -- 381
						if not (tax and taxes[tax]) then -- 382
							gterm:Broadcast(term, "invalid tax name given?", GT_COL_ERR) -- 383
							return -- 384
						end -- 382
						if not (reward > 0) then -- 385
							gterm:Broadcast(term, "there is nothing to collect from " .. tostring(tax), GT_COL_ERR) -- 386
							return -- 387
						end -- 385
						GAMEMODE.taxes_stored[tax] = 0 -- 388
						gterm:Broadcast(term, tostring(reward) .. " bones from " .. tostring(tax) .. " are now yours", GT_COL_SUCC) -- 389
						return ply:AddMoney(reward, "The Power") -- 390
					else -- 392
						local _with_0 = gterm -- 392
						_with_0:Broadcast(term, "TAX INTERFACE", GT_COL_INFO) -- 393
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO) -- 394
						_with_0:Broadcast(term, "    gives you what you deserve") -- 395
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO) -- 396
						_with_0:Broadcast(term, "    :tax list - list the current taxes") -- 397
						_with_0:Broadcast(term, "    :tax set NAME 0-100 - alter the taxes") -- 398
						_with_0:Broadcast(term, "    :tax collect NAME - the best part of this") -- 399
						return _with_0 -- 392
					end -- 399
				end, -- 335
				help = "The reward for your fantastic service." -- 400
			}, -- 334
			[":cls"] = { -- 403
				Callback = function(self, ply, term) -- 403
					if ply:Team() ~= TEAM_EMPEROR then -- 404
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 405
						return -- 406
					end -- 404
					for i = 0, term.max_lines do -- 407
						local time = math.Rand(0.01, 0.04) -- 408
						timer.Simple(i * time, function() -- 409
							if IsValid(term) then -- 410
								return gterm:Broadcast(term, "", MSG_COL_NIL, i) -- 410
							end -- 410
						end) -- 409
					end -- 410
					return -- 411
				end, -- 403
				help = "Clear the screen." -- 412
			}, -- 402
			[":stocks"] = { -- 415
				Callback = function(self, ply, term, args) -- 415
					self.cache = self.cache or { } -- 416
					local stocks = GAMEMODE.Stocks -- 417
					local _with_0 = gterm -- 418
					_with_0:Broadcast(term, "STOCKS OF THE LAND:", GT_COL_INFO) -- 419
					for k, v in pairs(stocks) do -- 420
						if v > 0 then -- 421
							local etab = self.cache[k] -- 422
							if not etab then -- 423
								etab = scripted_ents.Get(k) or weapons.Get(k) -- 424
								self.cache[k] = etab -- 425
							end -- 423
							local display = etab.PrintName or k -- 426
							_with_0:Broadcast(term, "  " .. tostring(display) .. ": " .. tostring(v) .. " units", GT_COL_SUCC) -- 427
						end -- 421
					end -- 427
					_with_0:Broadcast(term, "end list", GT_COL_INTL) -- 428
					return _with_0 -- 418
				end, -- 415
				help = "View what you own." -- 429
			}, -- 414
			[":die"] = { -- 432
				Callback = function(self, ply, term) -- 432
					if ply:Team() ~= TEAM_EMPEROR then -- 433
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 434
						return -- 435
					end -- 433
					gterm:Broadcast(term, "SHUTTING DOWN") -- 436
					return timer.Simple(math.Rand(2, 5), function() -- 437
						if IsValid(term) then -- 438
							for i = 0, term.max_lines do -- 439
								if IsValid(term) then -- 440
									gterm:Broadcast(term, "", nil, i) -- 440
								end -- 440
							end -- 440
							term:SetActive(false) -- 441
							return gterm.OS:Call(term, "ShutDown") -- 442
						end -- 438
					end) -- 442
				end, -- 432
				help = "Turn the computer off." -- 443
			}, -- 431
			[":law"] = { -- 446
				Callback = function(self, ply, term, args) -- 446
					if ply:Team() ~= TEAM_EMPEROR then -- 447
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 448
						return -- 449
					end -- 447
					local laws = GAMEMODE:Laws() -- 450
					local cmd = args[1] -- 451
					if "list" == cmd then -- 453
						gterm:Broadcast(term, "LAWS OF THE LAND:", GT_COL_INFO) -- 454
						for k, v in ipairs(laws) do -- 455
							gterm:Broadcast(term, "  " .. tostring(k) .. ". " .. tostring(v)) -- 455
						end -- 455
						return gterm:Broadcast(term, "  end list", GT_COL_INTL) -- 456
					elseif "add" == cmd then -- 457
						if #args < 2 then -- 458
							gterm:Broadcast(term, "no law text provided?", GT_COL_ERR) -- 459
							return -- 460
						end -- 458
						table.remove(args, 1) -- 461
						local text = table.concat(args, " ") -- 462
						do -- 463
							local _obj_0 = GAMEMODE.laws -- 463
							_obj_0[#_obj_0 + 1] = text -- 463
						end -- 463
						return gterm:Broadcast(term, "created law " .. tostring(#GAMEMODE:Laws()) .. ": \"" .. tostring(text) .. "\"", GT_COL_SUCC) -- 464
					elseif "remove" == cmd then -- 465
						if #args < 2 then -- 466
							gterm:Broadcast(term, "no law specified?", GT_COL_ERR) -- 467
							return -- 468
						end -- 466
						local num = tonumber(args[2]) -- 469
						if 0 == num or nil == num then -- 471
							gterm:Broadcast(term, "invalid number given?", GT_COL_ERR) -- 472
							return -- 473
						else -- 475
							if num > #laws then -- 475
								gterm:Broadcast(term, "invalid number given? (law count: " .. tostring(#laws) .. ")", GT_COL_ERR) -- 476
								return -- 477
							elseif num <= #GAMEMODE.default_laws then -- 478
								gterm:Broadcast(term, "cannot remove laws numbered " .. tostring(#GAMEMODE.default_laws) .. " or less", GT_COL_ERR) -- 479
								return -- 480
							end -- 475
							local law = table.remove(GAMEMODE.laws, num - #GAMEMODE.default_laws) -- 482
							return gterm:Broadcast(term, "deleted law " .. tostring(num) .. ": \"" .. tostring(law) .. "\"", GT_COL_ERR) -- 483
						end -- 483
					elseif "rotate" == cmd then -- 484
						if #args < 3 then -- 485
							gterm:Broadcast(term, "invalid arguments?", GT_COL_ERR) -- 486
							return -- 487
						end -- 485
						local first = tonumber(args[2]) -- 488
						local second = tonumber(args[3]) -- 489
						if (first == 0 or first == nil) or (second == 0 or second == nil) then -- 490
							gterm:Broadcast(term, "invalid number given?", GT_COL_ERR) -- 491
							return -- 492
						elseif first > #laws or second > #laws then -- 493
							gterm:Broadcast(term, "invalid number given? (law count: " .. tostring(laws), GT_COL_ERR) -- 494
							return -- 495
						elseif first <= #GAMEMODE.default_laws or second <= #GAMEMODE.default_laws then -- 497
							gterm:Broadcast(term, "cannot rotate laws numbered " .. tostring(#GAMEMODE.default_laws) .. " or less", GT_COL_ERR) -- 498
							return -- 499
						end -- 490
						first = first - #GAMEMODE.default_laws -- 500
						local first_law = GAMEMODE.laws[first] -- 501
						second = second - #GAMEMODE.default_laws -- 502
						local second_law = GAMEMODE.laws[second] -- 503
						GAMEMODE.laws[first] = second_law -- 504
						GAMEMODE.laws[second] = first_law -- 505
						return gterm:Broadcast(term, "rotated laws " .. tostring(args[2]) .. "/" .. tostring(args[3]) .. ".", GT_COL_SUCC) -- 506
					else -- 508
						local _with_0 = gterm -- 508
						_with_0:Broadcast(term, "LAW INTERFACE", GT_COL_INFO) -- 509
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO) -- 510
						_with_0:Broadcast(term, "    makes your wishes come true") -- 511
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO) -- 512
						_with_0:Broadcast(term, "    :law list - list the current laws") -- 513
						_with_0:Broadcast(term, "    :law add <your law's text> - add a new law") -- 514
						_with_0:Broadcast(term, "    :law remove # - remove a law by its number") -- 515
						_with_0:Broadcast(term, "    :law rotate #1 #2 - two laws switch places") -- 516
						return _with_0 -- 508
					end -- 516
				end, -- 446
				help = "View and manipulate the laws of this land." -- 517
			} -- 445
		} -- 257
	} -- 257
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 518
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 257
			_base_0[_key_0] = _val_0 -- 257
		end -- 257
	end -- 518
	if _base_0.__index == nil then -- 257
		_base_0.__index = _base_0 -- 257
	end -- 518
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
end -- 518
local Public -- 520
do -- 520
	local _class_0 -- 520
	local _parent_0 = OS -- 520
	local _base_0 = { -- 520
		greeting = { -- 522
			"boot sequence now", -- 522
			"finalizing public system", -- 523
			"greetings citizen", -- 524
			"LONG LIVE THE EMPEROR." -- 525
		}, -- 528
		advice = { -- 529
			"One corpse's trash is another corpse's treasure.", -- 529
			"Bottles are useful. Don't smash them.", -- 530
			"Snorting broken glass may give you special powers.", -- 531
			"Burn your trash, eat your plastic, never stop smoking.", -- 532
			"Liver Failure doesn't take kindly to slackers.", -- 533
			"You live because you are useful enough to be exploited.", -- 534
			"Chew with your good teeth.", -- 535
			"Violence doesn't solve every problem, only some of them.", -- 536
			"Flesh capsules are very delicate, be careful with them.", -- 537
			"You do not need a gun. You do not want a gun.", -- 538
			"Don't venture too far into the tunnels.", -- 539
			"Evil things are bad.", -- 540
			"Play catch with people.", -- 541
			"Playing is fun.", -- 542
			"Play teeth. Teeth is fun.", -- 543
			"Rules are the rules.", -- 544
			"M y  h e a d ... M y  b r a i n ... M y  b e e r ...", -- 545
			"Eat and drink before taking your medicine.", -- 546
			"Bodily fluids can spread pathogens.", -- 547
			"Your safety is not a priority.", -- 548
			"It's what you wanted", -- 549
			"Radar spelled backwards is Radar.", -- 550
			"You're thinking about it, aren't you?", -- 551
			"But seriously though,", -- 552
			"At least you're not dead yet.", -- 553
			"At least you're not teeth yet.", -- 554
			"I wanna go home.", -- 555
			"Please", -- 556
			"You will get what you deserve.", -- 557
			"Booze loves company.", -- 558
			"Misery loves company.", -- 559
			"Teeth love company.", -- 560
			"Corpses love company.", -- 561
			"The things you put in your mouth can hurt you.", -- 562
			"Make sure you're ready for the hangover tomorrow.", -- 563
			"Buying things feels so good, doesn't it?", -- 564
			"We work until we die, and that's the way we like it.", -- 565
			"Blood brothers protect each other.", -- 566
			"You can't trust that people are what they say.", -- 567
			"Some people don't look like you. This is a problem.", -- 568
			"What's a little brawl between friends?", -- 569
			"It's too late now.", -- 570
			"you work to rent a bed so can rest for work tomorrow" -- 571
		}, -- 574
		commands = { -- 575
			[":help"] = { -- 576
				Callback = function(self, ply, term, args) -- 576
					local _with_0 = gterm -- 577
					_with_0:Broadcast(term, "  COMMANDS:") -- 580
					for k, v in SortedPairs(self:GetCommands()) do -- 581
						_with_0:Broadcast(term, "  * " .. tostring(k), GT_COL_INFO) -- 582
						_with_0:Broadcast(term, "    " .. tostring(v.help)) -- 583
					end -- 583
					_with_0:Broadcast(term, "  end list", GT_COL_INTL) -- 584
					return _with_0 -- 577
				end, -- 576
				help = "Basic usage instructions." -- 585
			}, -- 575
			[":cls"] = { -- 588
				Callback = function(self, ply, term) -- 588
					for i = 0, term.max_lines do -- 589
						local time = math.Rand(0.01, 0.04) -- 590
						timer.Simple(i * time, function() -- 591
							if IsValid(term) then -- 592
								return gterm:Broadcast(term, "", MSG_COL_NIL, i) -- 592
							end -- 592
						end) -- 591
					end -- 592
					return -- 593
				end, -- 588
				help = "Clear the screen." -- 594
			}, -- 587
			[":advice"] = { -- 597
				Callback = function(self, ply, term) -- 597
					local advice = self.advice[math.random(#self.advice)] -- 598
					if IsValid(term) then -- 599
						return gterm:Broadcast(term, advice, MSG_COL_INFO) -- 599
					end -- 599
				end, -- 597
				help = "Consult the infinite wisdom." -- 600
			}, -- 596
			[":taxes"] = { -- 603
				Callback = function(self, ply, term, args) -- 603
					local taxes = GAMEMODE.taxes -- 604
					gterm:Broadcast(term, "TAXES OF THE LAND:", GT_COL_INFO) -- 605
					for k, v in pairs(taxes) do -- 606
						gterm:Broadcast(term, "  " .. tostring(k) .. " tax is " .. tostring(v) .. "%", GT_COL_SUCC) -- 606
					end -- 606
					return gterm:Broadcast(term, "end list", GT_COL_INTL) -- 607
				end, -- 603
				help = "View what you people owe." -- 608
			}, -- 602
			[":laws"] = { -- 611
				Callback = function(self, ply, term, args) -- 611
					local laws = GAMEMODE:Laws() -- 612
					gterm:Broadcast(term, "LAWS OF THE LAND:", GT_COL_INFO) -- 613
					for k, v in ipairs(laws) do -- 614
						gterm:Broadcast(term, "  " .. tostring(k) .. ". " .. tostring(v), GT_COL_WRN) -- 614
					end -- 614
					return gterm:Broadcast(term, "end list", GT_COL_INTL) -- 615
				end, -- 611
				help = "View the laws of this land." -- 616
			}, -- 610
			[":whoami"] = { -- 619
				Callback = function(self, ply, term, args) -- 619
					gterm:Broadcast(term, "this experimental feature is still in testing", GT_COL_WRN) -- 620
					return gterm:Broadcast(term, "try later", GT_COL_WRN) -- 621
				end, -- 619
				help = "View social information." -- 622
			} -- 618
		}, -- 625
		lifetime = 60 * 3, -- 626
		Initialized = function(self, term) -- 626
			_class_0.__parent.__base.Initialized(self, term) -- 627
			term.live_until = CurTime() + self.lifetime -- 628
			return gterm:Broadcast(term, "DEATH when idle time exceeds " .. tostring(string.NiceTime(self.lifetime)), GT_COL_INFO) -- 629
		end, -- 630
		ReceiveInput = function(self, term, ply) -- 630
			term.live_until = CurTime() + self.lifetime -- 631
		end, -- 632
		Think = function(self, term) -- 632
			local ct = CurTime() -- 633
			if not term:GetActive() then -- 634
				return -- 634
			end -- 634
			if term.warn_cooldown and ct < term.warn_cooldown then -- 635
				return -- 635
			end -- 635
			if not term.live_until then -- 636
				term.live_until = ct + self.lifetime -- 636
			end -- 636
			local time_left = term.live_until - CurTime() -- 637
			if math.floor(time_left) % 60 == 0 then -- 638
				if math.floor(time_left) <= 1 then -- 639
					gterm:Broadcast(term, "DEATH", GT_COL_INTL) -- 640
					return timer.Simple(math.Rand(2, 5), function() -- 641
						if IsValid(term) and term:GetActive() then -- 642
							for i = 0, term.max_lines do -- 643
								if IsValid(term) then -- 644
									gterm:Broadcast(term, "", nil, i) -- 644
								end -- 644
							end -- 644
							return gterm.OS:Call(term, "ShutDown") -- 645
						end -- 642
					end) -- 645
				else -- 647
					return gterm:Broadcast(term, "DEATH in " .. tostring(string.NiceTime(time_left)), GT_COL_INFO) -- 647
				end -- 639
			end -- 638
		end -- 520
	} -- 520
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 648
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 520
			_base_0[_key_0] = _val_0 -- 520
		end -- 520
	end -- 648
	if _base_0.__index == nil then -- 520
		_base_0.__index = _base_0 -- 520
	end -- 648
	setmetatable(_base_0, _parent_0.__base) -- 520
	_class_0 = setmetatable({ -- 520
		__init = function(self, ...) -- 520
			return _class_0.__parent.__init(self, ...) -- 520
		end, -- 520
		__base = _base_0, -- 520
		__name = "Public", -- 520
		__parent = _parent_0 -- 520
	}, { -- 520
		__index = function(cls, name) -- 520
			local val = rawget(_base_0, name) -- 520
			if val == nil then -- 520
				local parent = rawget(cls, "__parent") -- 520
				if parent then -- 520
					return parent[name] -- 520
				end -- 520
			else -- 520
				return val -- 520
			end -- 520
		end, -- 520
		__call = function(cls, ...) -- 520
			local _self_0 = setmetatable({ }, _base_0) -- 520
			cls.__init(_self_0, ...) -- 520
			return _self_0 -- 520
		end -- 520
	}) -- 520
	_base_0.__class = _class_0 -- 520
	if _parent_0.__inherited then -- 520
		_parent_0.__inherited(_parent_0, _class_0) -- 520
	end -- 520
	Public = _class_0 -- 520
end -- 648
net.Receive("evilrp_terminal_endconsole", function(len, ply) -- 649
	local idx = net.ReadUInt(16) -- 650
	local term = Entity(idx) -- 651
	local text = net.ReadString() -- 652
	if not (IsValid(term) and term.GetUser) then -- 653
		return -- 653
	end -- 653
	local user = term:GetUser() -- 654
	if not (IsValid(user) and user == ply) then -- 655
		return -- 655
	end -- 655
	if (text == "") or (text == " ") then -- 656
		term:SetUser(nil) -- 657
		net.Start("evilrp_terminal_endtyping") -- 658
		net.Send(ply) -- 659
		return -- 660
	end -- 656
	gterm.OS:Call(term, "ReceiveInput", ply) -- 661
	if term.password and not client["pass_authed_" .. tostring(idx)] then -- 662
		if text == term.password then -- 663
			ply["pass_authed_" .. tostring(idx)] = true -- 664
			gterm:Broadcast(term, "password accepted", GT_COL_INFO) -- 665
			return -- 666
		else -- 668
			gterm:Broadcast(term, "password required", GT_COL_INFO) -- 668
			return -- 669
		end -- 663
	end -- 662
	if string.sub(text, 1, 1) == ":" then -- 670
		local sys = OS.distros[term:GetOS()] -- 671
		if sys then -- 672
			for k, v in pairs(sys:GetCommands()) do -- 673
				local cmd = string.sub(string.lower(text), 1, string.len(k)) -- 674
				if k == cmd then -- 675
					local text2 = string.sub(text, string.len(cmd) + 2) -- 676
					local quote = (string.sub(text2, 1, 1) ~= "\"") -- 677
					local args = { } -- 678
					for chunk in string.gmatch(text2, "[^\"]+") do -- 679
						quote = not quote -- 680
						if quote then -- 681
							args[#args + 1] = chunk -- 682
						else -- 684
							for chunk in string.gmatch(chunk, "[^ ]+") do -- 684
								args[#args + 1] = chunk -- 684
							end -- 684
						end -- 681
					end -- 684
					local success, value = pcall(v.Callback, sys, ply, term, args) -- 685
					if success then -- 686
						gterm:Broadcast(term, text, GT_COL_CMD) -- 687
					else -- 689
						gterm:Broadcast(term, value, GT_COL_ERR) -- 689
					end -- 686
					return -- 690
				end -- 675
			end -- 690
			text = tostring(string.sub(text, 2)) .. ": command not found" -- 691
			gterm:Broadcast(term, text, GT_COL_ERR) -- 692
			return -- 693
		else -- 695
			gterm:Broadcast(term, "DEATH", GT_COL_INTL) -- 697
		end -- 672
		if term.accepting_input then -- 698
			local quote = (string.sub(text, 1, 1) ~= "\"") -- 699
			local args = { } -- 700
			for chunk in string.match(text, "[^\"]+") do -- 701
				quote = not quote -- 702
				if quote then -- 703
					args[#args + 1] = chunk -- 704
				else -- 706
					for chunk in string.gmatch(chunk, "[^ ]+") do -- 706
						args[#args + 1] = chunk -- 706
					end -- 706
				end -- 703
			end -- 706
			local callback = term.input_callback -- 707
			if callback and args then -- 708
				callback(ply, args) -- 708
			end -- 708
			term.accepting_input = nil -- 709
			term.input_callback = nil -- 710
			return -- 711
		end -- 698
	end -- 670
	local sys = OS.distros[term:GetOS()] -- 712
	local name = sys and sys.unique_id or "unknown" -- 713
	local finalized = tostring(("<"):Escape()) .. tostring(name) .. "@" .. tostring(term:EntIndex()) .. tostring((">"):Escape()) .. " " .. tostring(text) -- 714
	return gterm:Broadcast(term, finalized, GT_COL_CMD) -- 715
end) -- 649
return MsgC(Color(255, 0, 0), "INITIALIZED EVILRP TERMINALS\n") -- 717
