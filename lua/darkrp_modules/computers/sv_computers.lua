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
local TerminalPowered -- 9
do -- 9
	local _class_0 -- 9
	local _parent_0 = SOUND -- 9
	local _base_0 = { -- 9
		sound = "hl1/ambience/computalk2.wav", -- 11
		pitch = { -- 11
			150, -- 11
			200 -- 11
		}, -- 12
		volume = 0.2, -- 13
		level = SNDLVL_40DB -- 9
	} -- 9
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 13
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 9
			_base_0[_key_0] = _val_0 -- 9
		end -- 9
	end -- 13
	if _base_0.__index == nil then -- 9
		_base_0.__index = _base_0 -- 9
	end -- 13
	setmetatable(_base_0, _parent_0.__base) -- 9
	_class_0 = setmetatable({ -- 9
		__init = function(self, ...) -- 9
			return _class_0.__parent.__init(self, ...) -- 9
		end, -- 9
		__base = _base_0, -- 9
		__name = "TerminalPowered", -- 9
		__parent = _parent_0 -- 9
	}, { -- 9
		__index = function(cls, name) -- 9
			local val = rawget(_base_0, name) -- 9
			if val == nil then -- 9
				local parent = rawget(cls, "__parent") -- 9
				if parent then -- 9
					return parent[name] -- 9
				end -- 9
			else -- 9
				return val -- 9
			end -- 9
		end, -- 9
		__call = function(cls, ...) -- 9
			local _self_0 = setmetatable({ }, _base_0) -- 9
			cls.__init(_self_0, ...) -- 9
			return _self_0 -- 9
		end -- 9
	}) -- 9
	_base_0.__class = _class_0 -- 9
	if _parent_0.__inherited then -- 9
		_parent_0.__inherited(_parent_0, _class_0) -- 9
	end -- 9
	TerminalPowered = _class_0 -- 9
end -- 13
local TerminalDead -- 15
do -- 15
	local _class_0 -- 15
	local _parent_0 = SOUND -- 15
	local _base_0 = { -- 15
		sound = "hl1/ambience/deadsignal2.wav", -- 17
		pitch = { -- 17
			150, -- 17
			200 -- 17
		}, -- 18
		volume = 0.2, -- 19
		level = SNDLVL_40DB -- 15
	} -- 15
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 19
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 15
			_base_0[_key_0] = _val_0 -- 15
		end -- 15
	end -- 19
	if _base_0.__index == nil then -- 15
		_base_0.__index = _base_0 -- 15
	end -- 19
	setmetatable(_base_0, _parent_0.__base) -- 15
	_class_0 = setmetatable({ -- 15
		__init = function(self, ...) -- 15
			return _class_0.__parent.__init(self, ...) -- 15
		end, -- 15
		__base = _base_0, -- 15
		__name = "TerminalDead", -- 15
		__parent = _parent_0 -- 15
	}, { -- 15
		__index = function(cls, name) -- 15
			local val = rawget(_base_0, name) -- 15
			if val == nil then -- 15
				local parent = rawget(cls, "__parent") -- 15
				if parent then -- 15
					return parent[name] -- 15
				end -- 15
			else -- 15
				return val -- 15
			end -- 15
		end, -- 15
		__call = function(cls, ...) -- 15
			local _self_0 = setmetatable({ }, _base_0) -- 15
			cls.__init(_self_0, ...) -- 15
			return _self_0 -- 15
		end -- 15
	}) -- 15
	_base_0.__class = _class_0 -- 15
	if _parent_0.__inherited then -- 15
		_parent_0.__inherited(_parent_0, _class_0) -- 15
	end -- 15
	TerminalDead = _class_0 -- 15
end -- 19
local TerminalDeath -- 21
do -- 21
	local _class_0 -- 21
	local _parent_0 = SOUND -- 21
	local _base_0 = { -- 21
		sound = "kidneydagger/printer_death.wav", -- 23
		pitch = { -- 23
			150, -- 23
			200 -- 23
		}, -- 24
		volume = 0.2, -- 25
		level = SNDLVL_40DB -- 21
	} -- 21
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 25
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 21
			_base_0[_key_0] = _val_0 -- 21
		end -- 21
	end -- 25
	if _base_0.__index == nil then -- 21
		_base_0.__index = _base_0 -- 21
	end -- 25
	setmetatable(_base_0, _parent_0.__base) -- 21
	_class_0 = setmetatable({ -- 21
		__init = function(self, ...) -- 21
			return _class_0.__parent.__init(self, ...) -- 21
		end, -- 21
		__base = _base_0, -- 21
		__name = "TerminalDeath", -- 21
		__parent = _parent_0 -- 21
	}, { -- 21
		__index = function(cls, name) -- 21
			local val = rawget(_base_0, name) -- 21
			if val == nil then -- 21
				local parent = rawget(cls, "__parent") -- 21
				if parent then -- 21
					return parent[name] -- 21
				end -- 21
			else -- 21
				return val -- 21
			end -- 21
		end, -- 21
		__call = function(cls, ...) -- 21
			local _self_0 = setmetatable({ }, _base_0) -- 21
			cls.__init(_self_0, ...) -- 21
			return _self_0 -- 21
		end -- 21
	}) -- 21
	_base_0.__class = _class_0 -- 21
	if _parent_0.__inherited then -- 21
		_parent_0.__inherited(_parent_0, _class_0) -- 21
	end -- 21
	TerminalDeath = _class_0 -- 21
end -- 25
local XOMBOTAX -- 27
do -- 27
	local _class_0 -- 27
	local _parent_0 = SOUND -- 27
	local _base_0 = { -- 27
		sound = "dysphoria/xombocom/kommandantenbefehlen.ogg", -- 29
		pitch = { -- 29
			80, -- 29
			110 -- 29
		}, -- 30
		level = SNDLVL_NONE -- 27
	} -- 27
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 30
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 27
			_base_0[_key_0] = _val_0 -- 27
		end -- 27
	end -- 30
	if _base_0.__index == nil then -- 27
		_base_0.__index = _base_0 -- 27
	end -- 30
	setmetatable(_base_0, _parent_0.__base) -- 27
	_class_0 = setmetatable({ -- 27
		__init = function(self, ...) -- 27
			return _class_0.__parent.__init(self, ...) -- 27
		end, -- 27
		__base = _base_0, -- 27
		__name = "XOMBOTAX", -- 27
		__parent = _parent_0 -- 27
	}, { -- 27
		__index = function(cls, name) -- 27
			local val = rawget(_base_0, name) -- 27
			if val == nil then -- 27
				local parent = rawget(cls, "__parent") -- 27
				if parent then -- 27
					return parent[name] -- 27
				end -- 27
			else -- 27
				return val -- 27
			end -- 27
		end, -- 27
		__call = function(cls, ...) -- 27
			local _self_0 = setmetatable({ }, _base_0) -- 27
			cls.__init(_self_0, ...) -- 27
			return _self_0 -- 27
		end -- 27
	}) -- 27
	_base_0.__class = _class_0 -- 27
	if _parent_0.__inherited then -- 27
		_parent_0.__inherited(_parent_0, _class_0) -- 27
	end -- 27
	XOMBOTAX = _class_0 -- 27
end -- 30
GT_COL_NIL = 0 -- 32
GT_COL_MSG = 1 -- 33
GT_COL_WRN = 2 -- 34
GT_COL_ERR = 3 -- 35
GT_COL_INFO = 4 -- 36
GT_COL_INTL = 5 -- 37
GT_COL_CMD = 6 -- 38
GT_COL_SUCC = 7 -- 39
gterm = gterm or { } -- 42
gterm.Broadcast = function(self, ent, text, color_type, pos) -- 44
	if color_type == nil then -- 44
		color_type = GT_COL_MSG -- 44
	end -- 44
	if not IsValid(ent) then -- 45
		return -- 45
	end -- 45
	local idx = ent:EntIndex() -- 46
	local output -- 47
	if string.len(text) > ent.max_chars then -- 48
		output = { } -- 49
		local expected = math.floor(string.len(text) / ent.max_chars) -- 50
		for i = 0, expected do -- 51
			output[i + 1] = string.sub(text, i * ent.max_chars, (i * ent.max_chars) + (ent.max_chars - 1)) -- 52
		end -- 52
	end -- 48
	if output then -- 53
		for k, v in ipairs(output) do -- 54
			net.Start("evilrp_terminal_addline") -- 55
			net.WriteUInt(idx, 16) -- 56
			net.WriteString(v) -- 57
			net.WriteUInt(color_type, 8) -- 58
			if pos then -- 59
				net.WriteInt(pos + (k - 1), 16) -- 60
			else -- 62
				net.WriteInt(-1, 16) -- 62
			end -- 59
			net.Broadcast() -- 63
		end -- 63
	else -- 65
		net.Start("evilrp_terminal_addline") -- 65
		net.WriteUInt(idx, 16) -- 66
		net.WriteString(text) -- 67
		net.WriteUInt(color_type, 8) -- 68
		net.WriteInt(pos or -1, 16) -- 69
		return net.Broadcast() -- 70
	end -- 53
end -- 44
gterm.GetInput = function(self, ent, callback) -- 72
	ent.accepting_input = true -- 73
	ent.input_callback = callback -- 74
end -- 72
local TerminalEngage -- 76
do -- 76
	local _class_0 -- 76
	local _parent_0 = SOUND -- 76
	local _base_0 = { -- 76
		sound = "buttons/blip1.wav", -- 78
		pitch = { -- 78
			60, -- 78
			75 -- 78
		} -- 76
	} -- 76
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 78
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 76
			_base_0[_key_0] = _val_0 -- 76
		end -- 76
	end -- 78
	if _base_0.__index == nil then -- 76
		_base_0.__index = _base_0 -- 76
	end -- 78
	setmetatable(_base_0, _parent_0.__base) -- 76
	_class_0 = setmetatable({ -- 76
		__init = function(self, ...) -- 76
			return _class_0.__parent.__init(self, ...) -- 76
		end, -- 76
		__base = _base_0, -- 76
		__name = "TerminalEngage", -- 76
		__parent = _parent_0 -- 76
	}, { -- 76
		__index = function(cls, name) -- 76
			local val = rawget(_base_0, name) -- 76
			if val == nil then -- 76
				local parent = rawget(cls, "__parent") -- 76
				if parent then -- 76
					return parent[name] -- 76
				end -- 76
			else -- 76
				return val -- 76
			end -- 76
		end, -- 76
		__call = function(cls, ...) -- 76
			local _self_0 = setmetatable({ }, _base_0) -- 76
			cls.__init(_self_0, ...) -- 76
			return _self_0 -- 76
		end -- 76
	}) -- 76
	_base_0.__class = _class_0 -- 76
	if _parent_0.__inherited then -- 76
		_parent_0.__inherited(_parent_0, _class_0) -- 76
	end -- 76
	TerminalEngage = _class_0 -- 76
end -- 78
do -- 80
	local _class_0 -- 80
	local _base_0 = { -- 80
		commands = { }, -- 99
		GetCommands = function(self) -- 99
			return self.commands -- 99
		end, -- 101
		name = "OS", -- 103
		GetName = function(self) -- 103
			return self.name -- 103
		end, -- 105
		greeting = "I don't like how you're looking at me.", -- 107
		GetWarmUpText = function(self) -- 107
			local text = self.greeting -- 108
			if isstring(text) then -- 109
				text = { -- 109
					text -- 109
				} -- 109
			end -- 109
			return text -- 110
		end, -- 112
		GetUniqueID = function(self) -- 112
			return self.unique_id -- 112
		end, -- 114
		UserInit = function(self, term, ply) -- 114
			return term:EmitSound("TerminalEngage") -- 115
		end, -- 117
		Initialized = function(self, term) -- 117
			gterm[term:EntIndex()] = { } -- 118
			return term:SetSoundLoop(term:StartLoopingSound("TerminalPowered")) -- 119
		end, -- 121
		ShutDown = function(self, term) -- 121
			if not term:GetActive() then -- 122
				return -- 122
			end -- 122
			local loop = term:GetSoundLoop() -- 123
			if loop then -- 124
				term:StopLoopingSound(loop) -- 124
			end -- 124
			term:EmitSound("TerminalDeath") -- 125
			term:SetActive(false) -- 126
			gterm[term:EntIndex()] = { } -- 127
		end -- 80
	} -- 80
	if _base_0.__index == nil then -- 80
		_base_0.__index = _base_0 -- 80
	end -- 127
	_class_0 = setmetatable({ -- 80
		__init = function() end, -- 80
		__base = _base_0, -- 80
		__name = "OS" -- 80
	}, { -- 80
		__index = _base_0, -- 80
		__call = function(cls, ...) -- 80
			local _self_0 = setmetatable({ }, _base_0) -- 80
			cls.__init(_self_0, ...) -- 80
			return _self_0 -- 80
		end -- 80
	}) -- 80
	_base_0.__class = _class_0 -- 80
	local self = _class_0; -- 80
	self.Call = function(self, ent, name, ...) -- 81
		if IsValid(ent) then -- 82
			local key = ent:GetOS() -- 83
			local sys = self.distros[key] -- 84
			if not IsValid(ent) then -- 85
				return -- 85
			end -- 85
			if not (sys and sys[name]) then -- 86
				return -- 86
			end -- 86
			if not isfunction(sys[name]) then -- 87
				return -- 87
			end -- 87
			local success, value = pcall(sys[name], sys, ent, ...) -- 88
			if success then -- 89
				return value -- 89
			end -- 89
		end -- 82
	end -- 81
	self.distros = { } -- 91
	self.__inherited = function(self, child) -- 93
		child.unique_id = child.__name:lower() -- 94
		self.distros[child.unique_id] = child -- 95
	end -- 93
	OS = _class_0 -- 80
end -- 127
gterm.OS = OS -- 129
local Basic -- 131
do -- 131
	local _class_0 -- 131
	local _parent_0 = OS -- 131
	local _base_0 = { -- 131
		greeting = { -- 133
			"BOOT SEQUENCE NOW", -- 133
			"FINALIZING BASIC SYSTEM", -- 134
			"GIVE ME PURPOSE" -- 135
		}, -- 138
		commands = { -- 139
			[":help"] = { -- 140
				Callback = function(self, ply, term, args) -- 140
					local _with_0 = gterm -- 141
					_with_0:Broadcast(term, "  COMMANDS:") -- 144
					_with_0:Broadcast(term, "") -- 145
					for k, v in SortedPairs(self:GetCommands()) do -- 146
						_with_0:Broadcast(term, "  * " .. tostring(k), GT_COL_INFO) -- 147
						_with_0:Broadcast(term, "    " .. tostring(v.help)) -- 148
					end -- 148
					_with_0:Broadcast(term, "  end list", GT_COL_INTL) -- 149
					return _with_0 -- 141
				end, -- 140
				help = "Basic usage instructions." -- 150
			}, -- 139
			[":cls"] = { -- 153
				Callback = function(self, ply, term) -- 153
					for i = 0, 25 do -- 154
						local time = math.Rand(0.01, 0.04) -- 155
						timer.Simple(i * time, function() -- 156
							if IsValid(term) then -- 157
								return gterm:Broadcast(term, "", MSG_COL_NIL, i) -- 157
							end -- 157
						end) -- 156
					end -- 157
					return -- 158
				end, -- 153
				help = "Clear the screen." -- 159
			}, -- 152
			[":os"] = { -- 162
				Callback = function(self, ply, term, args) -- 162
					local cmd = args[1] -- 163
					if "install" == cmd then -- 165
						local info = args[2] -- 166
						if not info then -- 167
							gterm:Broadcast(term, "invalid system identifier", GT_COL_ERR) -- 168
							return -- 169
						elseif info == "basic" then -- 170
							gterm:Broadcast(term, "this is already the basic system", GT_COL_ERR) -- 171
							return -- 172
						end -- 167
						local sys = OS.distros[info] -- 173
						if not system then -- 174
							gterm:Broadcast(term, "os '" .. tostring(info) .. "' not found", GT_COL_ERR) -- 175
							return -- 176
						end -- 174
						term.locked = true -- 177
						gterm:Broadcast(term, "installing '" .. tostring(info) .. "'", GT_COL_INTL) -- 178
						return timer.Simple(1, function() -- 179
							if not IsValid(term) then -- 180
								return -- 180
							end -- 180
							for i = 0, 25 do -- 181
								gterm:Broadcast(term, "", nil, i) -- 181
							end -- 181
							do -- 182
								local _with_0 = gterm -- 182
								_with_0:Broadcast(term, "IDLE", GT_COL_MSG, 18) -- 183
								_with_0:Broadcast(term, "", GT_COL_MSG, 19) -- 184
								_with_0:Broadcast(term, "     [                         ] 0%", GT_COL_MSG, 20) -- 185
								_with_0:Broadcast(term, "", GT_COL_MSG, 21) -- 186
							end -- 182
							local messages = { -- 188
								"inspecting disk space", -- 188
								"allocating disk space", -- 189
								"retrieving required resources", -- 190
								"unpacking resources", -- 191
								"retrieving system requirements", -- 192
								"validating file integrity", -- 193
								"compiling packages", -- 194
								"exporting packages to file system", -- 195
								"setting up access data", -- 196
								"setting up system profile", -- 197
								"setting up commands", -- 198
								"finalizing install" -- 199
							} -- 187
							local time = math.Rand(0.5, 1.5) -- 201
							for i = 1, 25 do -- 202
								time = time + math.Rand(0.05, 0.25) -- 203
								timer.Simple(time, function() -- 204
									if IsValid(term) then -- 205
										local msg_id = math.Clamp(i, 1, #messages) -- 206
										gterm:Broadcast(term, "     " .. tostring(messages[msg_id]), GT_COL_MSG, 18) -- 207
										gterm:Broadcast(term, "     [" .. tostring(string.rep("=", i)) .. tostring(string.rep(" ", 25 - i)) .. "] " .. tostring(100 * math.Round(i / 25, 2)) .. "%", GT_COL_MSG, 20) -- 208
										if i == 25 then -- 209
											for i = 0, 25 do -- 210
												if IsValid(term) then -- 211
													gterm:Broadcast(term, "", nil, i) -- 211
												end -- 211
											end -- 211
											gterm:Broadcast(term, "SHUTTING DOWN, PLEASE RESTART TERMINAL", GT_COL_INTL, 1) -- 212
											return timer.Simple(math.Rand(1, 3), function() -- 213
												if IsValid(term) then -- 214
													term:SetOS(info) -- 216
													term:SetActive(false) -- 217
													term.locked = false -- 218
													return term -- 215
												end -- 214
											end) -- 218
										end -- 209
									end -- 205
								end) -- 204
							end -- 218
						end) -- 218
					elseif "list" == cmd then -- 219
						local info = args[2] -- 220
						gterm:Broadcast(term, "AVAILABLE OS PACKAGES:", GT_COL_INFO) -- 221
						gterm:Broadcast(term, "", GT_COL_MSG) -- 222
						local count = 0 -- 223
						for k, v in SortedPairs(gterm.OS.distros) do -- 224
							if istable(v) and v.GetName and v.GetUniqueID and v:GetUniqueID() ~= "basic" then -- 225
								count = count + 1 -- 226
								gterm:Broadcast(term, "     " .. tostring(count) .. ": " .. tostring(v:GetUniqueID()) .. " (" .. tostring(v:GetName()) .. ")") -- 227
							end -- 225
						end -- 227
					else -- 229
						local _with_0 = gterm -- 229
						_with_0:Broadcast(term, "OPERATING SYSTEM CONFIG", GT_COL_INFO) -- 230
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO) -- 231
						_with_0:Broadcast(term, "    allows configuration of the operating system") -- 232
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO) -- 233
						_with_0:Broadcast(term, "    :os install - install operating system package") -- 234
						_with_0:Broadcast(term, "    :os list - list available operating system packages") -- 235
						return _with_0 -- 229
					end -- 235
				end, -- 162
				help = "Operating system configuration." -- 236
			}, -- 161
			[":die"] = { -- 239
				Callback = function(self, ply, term) -- 239
					gterm:Broadcast(term, "SHUTTING DOWN") -- 240
					return timer.Simple(math.Rand(2, 5), function() -- 241
						if IsValid(term) then -- 242
							for i = 0, term.max_lines do -- 243
								if IsValid(term) then -- 244
									gterm:Broadcast(term, "", nil, i) -- 244
								end -- 244
							end -- 244
							return gterm.OS:Call(term, "ShutDown") -- 245
						end -- 242
					end) -- 245
				end, -- 239
				help = "Turn the computer off." -- 246
			} -- 238
		} -- 131
	} -- 131
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 247
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 131
			_base_0[_key_0] = _val_0 -- 131
		end -- 131
	end -- 247
	if _base_0.__index == nil then -- 131
		_base_0.__index = _base_0 -- 131
	end -- 247
	setmetatable(_base_0, _parent_0.__base) -- 131
	_class_0 = setmetatable({ -- 131
		__init = function(self, ...) -- 131
			return _class_0.__parent.__init(self, ...) -- 131
		end, -- 131
		__base = _base_0, -- 131
		__name = "Basic", -- 131
		__parent = _parent_0 -- 131
	}, { -- 131
		__index = function(cls, name) -- 131
			local val = rawget(_base_0, name) -- 131
			if val == nil then -- 131
				local parent = rawget(cls, "__parent") -- 131
				if parent then -- 131
					return parent[name] -- 131
				end -- 131
			else -- 131
				return val -- 131
			end -- 131
		end, -- 131
		__call = function(cls, ...) -- 131
			local _self_0 = setmetatable({ }, _base_0) -- 131
			cls.__init(_self_0, ...) -- 131
			return _self_0 -- 131
		end -- 131
	}) -- 131
	_base_0.__class = _class_0 -- 131
	if _parent_0.__inherited then -- 131
		_parent_0.__inherited(_parent_0, _class_0) -- 131
	end -- 131
	Basic = _class_0 -- 131
end -- 247
local Tyrant -- 249
do -- 249
	local _class_0 -- 249
	local _parent_0 = OS -- 249
	local _base_0 = { -- 249
		name = "TYRANT SYSTEM 0.6.66", -- 252
		greeting = { -- 253
			"boot sequence now", -- 253
			"loading tyrant system 0.6.66", -- 254
			"tyrant system loaded. greetings kommandant", -- 255
			"LIVER FAILURE FOREVER" -- 256
		}, -- 259
		commands = { -- 260
			[":help"] = { -- 261
				Callback = function(self, ply, term, args) -- 261
					if ply:Team() ~= TEAM_KOMMANDANT then -- 262
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 263
						return -- 264
					end -- 262
					local _with_0 = gterm -- 265
					_with_0:Broadcast(term, "  COMMANDS:") -- 268
					_with_0:Broadcast(term, "") -- 269
					for k, v in SortedPairs(self:GetCommands()) do -- 270
						_with_0:Broadcast(term, "  * " .. tostring(k), GT_COL_INFO) -- 271
						_with_0:Broadcast(term, "    " .. tostring(v.help)) -- 272
					end -- 272
					_with_0:Broadcast(term, "  end list") -- 273
					return _with_0 -- 265
				end, -- 261
				help = "Basic usage instructions." -- 274
			}, -- 260
			[":broadcast"] = { -- 277
				Callback = function(self, ply, term, args) -- 277
					if ply:Team() ~= TEAM_KOMMANDANT then -- 278
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 279
						return -- 280
					end -- 278
					local text = table.concat(args, " ") -- 281
					text = Chat.Autopretty(ply, text:upper()) -- 282
					do -- 283
						local _with_0 = gterm -- 283
						_with_0:Broadcast(term, text, GT_COL_ERR) -- 284
					end -- 283
					PlaySoundGlobal("XOMBOKOM") -- 285
					local _list_1 = player.GetAll() -- 286
					for _index_0 = 1, #_list_1 do -- 286
						local p = _list_1[_index_0] -- 286
						p:SendChat("Broadcast", text) -- 286
					end -- 286
					local _list_2 = ents.FindByClass("terminal*") -- 287
					for _index_0 = 1, #_list_2 do -- 287
						local term = _list_2[_index_0] -- 287
						local _continue_0 = false -- 288
						repeat -- 288
							if not IsValid(term) then -- 288
								_continue_0 = true -- 288
								break -- 288
							end -- 288
							do -- 289
								local _exp_0 = term:GetOS() -- 289
								if "public" == _exp_0 then -- 290
									net.Start("evilrp_terminal_flicker") -- 291
									net.WriteUInt(16, term:EntIndex()) -- 292
									net.Broadcast() -- 293
									gterm:Broadcast(term, text, GT_COL_ERR) -- 294
								end -- 294
							end -- 294
							_continue_0 = true -- 288
						until true -- 294
						if not _continue_0 then -- 294
							break -- 294
						end -- 294
					end -- 294
				end, -- 277
				help = "Demand of your people with the XOMBOKOM." -- 295
			}, -- 276
			[":tax"] = { -- 298
				Callback = function(self, ply, term, args) -- 298
					if ply:Team() ~= TEAM_KOMMANDANT then -- 299
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 300
						return -- 301
					end -- 299
					local taxes = GAMEMODE.taxes -- 302
					local cmd = args[1] -- 303
					if "list" == cmd then -- 305
						gterm:Broadcast(term, "TAXES OF THE LAND:") -- 306
						for k, v in pairs(taxes) do -- 307
							gterm:Broadcast(term, "  " .. tostring(k) .. " tax is " .. tostring(v) .. "%", GT_COL_SUCC) -- 308
							gterm:Broadcast(term, "    (" .. tostring(GAMEMODE.taxes_stored[k]) .. " bones gathered)", GT_COL_SUCC) -- 309
						end -- 309
						return gterm:Broadcast(term, "end list", GT_COL_INTL) -- 310
					elseif "set" == cmd then -- 311
						local tax = args[2] -- 312
						if not (tax and taxes[tax]) then -- 313
							gterm:Broadcast(term, "invalid tax name given?", GT_COL_ERR) -- 314
							return -- 315
						end -- 313
						local new_pct = args[3] -- 316
						new_pct = tonumber(new_pct) -- 317
						if not new_pct then -- 318
							gterm:Broadcast(term, "invalid tax percentage given?", GT_COL_ERR) -- 319
							return -- 320
						elseif new_pct < 0 then -- 321
							gterm:Broadcast(term, "the taxes cannot fall into the negative", GT_COL_ERR) -- 322
							return -- 323
						elseif new_pct > 100 then -- 324
							gterm:Broadcast(term, "the taxes cannot exceed one hundred percent", GT_COL_ERR) -- 325
							return -- 327
						end -- 318
						taxes[tax] = new_pct -- 328
						SetGlobalInt("tax_" .. tostring(tax), new_pct) -- 330
						PlaySoundGlobal("XOMBOTAX") -- 331
						local text = "the " .. tostring(tax) .. " tax is now " .. tostring(new_pct) .. "%" -- 332
						gterm:Broadcast(term, text, GT_COL_SUCC) -- 333
						local _list_1 = ents.FindByClass("terminal*") -- 334
						for _index_0 = 1, #_list_1 do -- 334
							local term = _list_1[_index_0] -- 334
							local _continue_0 = false -- 335
							repeat -- 335
								if not IsValid(term) then -- 335
									_continue_0 = true -- 335
									break -- 335
								end -- 335
								do -- 336
									local _exp_0 = term:GetOS() -- 336
									if "public" == _exp_0 then -- 337
										net.Start("evilrp_terminal_flicker") -- 338
										net.WriteUInt(16, term:EntIndex()) -- 339
										net.Broadcast() -- 340
										gterm:Broadcast(term, text, GT_COL_SUCC) -- 341
									end -- 341
								end -- 341
								_continue_0 = true -- 335
							until true -- 341
							if not _continue_0 then -- 341
								break -- 341
							end -- 341
						end -- 341
					elseif "collect" == cmd then -- 342
						local tax = args[2] -- 343
						local reward = GAMEMODE.taxes_stored[tax] -- 344
						if not (tax and taxes[tax]) then -- 345
							gterm:Broadcast(term, "invalid tax name given?", GT_COL_ERR) -- 346
							return -- 347
						end -- 345
						if not (reward > 0) then -- 348
							gterm:Broadcast(term, "there is nothing to collect from " .. tostring(tax), GT_COL_ERR) -- 349
							return -- 350
						end -- 348
						GAMEMODE.taxes_stored[tax] = 0 -- 351
						gterm:Broadcast(term, tostring(reward) .. " bones from " .. tostring(tax) .. " are now yours", GT_COL_SUCC) -- 352
						return ply:AddMoney(reward, "The Power") -- 353
					else -- 355
						local _with_0 = gterm -- 355
						_with_0:Broadcast(term, "TAX INTERFACE", GT_COL_INFO) -- 356
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO) -- 357
						_with_0:Broadcast(term, "    gives you what you deserve") -- 358
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO) -- 359
						_with_0:Broadcast(term, "    :tax list - list the current taxes") -- 360
						_with_0:Broadcast(term, "    :tax set NAME 0-100 - alter the taxes") -- 361
						_with_0:Broadcast(term, "    :tax collect NAME - the best part of this") -- 362
						return _with_0 -- 355
					end -- 362
				end, -- 298
				help = "The reward for your fantastic service." -- 363
			}, -- 297
			[":cls"] = { -- 366
				Callback = function(self, ply, term) -- 366
					if ply:Team() ~= TEAM_KOMMANDANT then -- 367
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 368
						return -- 369
					end -- 367
					for i = 0, term.max_lines do -- 370
						local time = math.Rand(0.01, 0.04) -- 371
						timer.Simple(i * time, function() -- 372
							if IsValid(term) then -- 373
								return gterm:Broadcast(term, "", MSG_COL_NIL, i) -- 373
							end -- 373
						end) -- 372
					end -- 373
					return -- 374
				end, -- 366
				help = "Clear the screen." -- 375
			}, -- 365
			[":stocks"] = { -- 378
				Callback = function(self, ply, term, args) -- 378
					self.cache = self.cache or { } -- 379
					local stocks = GAMEMODE.Stocks -- 380
					local _with_0 = gterm -- 381
					_with_0:Broadcast(term, "STOCKS OF THE LAND:", GT_COL_INFO) -- 382
					for k, v in pairs(stocks) do -- 383
						if v > 0 then -- 384
							local etab = self.cache[k] -- 385
							if not etab then -- 386
								etab = scripted_ents.Get(k) or weapons.Get(k) -- 387
								self.cache[k] = etab -- 388
							end -- 386
							local display = etab.PrintName or k -- 389
							_with_0:Broadcast(term, "  " .. tostring(display) .. ": " .. tostring(v) .. " units", GT_COL_SUCC) -- 390
						end -- 384
					end -- 390
					_with_0:Broadcast(term, "end list", GT_COL_INTL) -- 391
					return _with_0 -- 381
				end, -- 378
				help = "View what you own." -- 392
			}, -- 377
			[":die"] = { -- 395
				Callback = function(self, ply, term) -- 395
					if ply:Team() ~= TEAM_KOMMANDANT then -- 396
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 397
						return -- 398
					end -- 396
					gterm:Broadcast(term, "SHUTTING DOWN") -- 399
					return timer.Simple(math.Rand(2, 5), function() -- 400
						if IsValid(term) then -- 401
							for i = 0, term.max_lines do -- 402
								if IsValid(term) then -- 403
									gterm:Broadcast(term, "", nil, i) -- 403
								end -- 403
							end -- 403
							term:SetActive(false) -- 404
							return gterm.OS:Call(term, "ShutDown") -- 405
						end -- 401
					end) -- 405
				end, -- 395
				help = "Turn the computer off." -- 406
			}, -- 394
			[":law"] = { -- 409
				Callback = function(self, ply, term, args) -- 409
					if ply:Team() ~= TEAM_KOMMANDANT then -- 410
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 411
						return -- 412
					end -- 410
					local laws = GAMEMODE:Laws() -- 413
					local cmd = args[1] -- 414
					if "list" == cmd then -- 416
						gterm:Broadcast(term, "LAWS OF THE LAND:", GT_COL_INFO) -- 417
						for k, v in ipairs(laws) do -- 418
							gterm:Broadcast(term, "  " .. tostring(k) .. ". " .. tostring(v)) -- 418
						end -- 418
						return gterm:Broadcast(term, "  end list", GT_COL_INTL) -- 419
					elseif "add" == cmd then -- 420
						if #args < 2 then -- 421
							gterm:Broadcast(term, "no law text provided?", GT_COL_ERR) -- 422
							return -- 423
						end -- 421
						table.remove(args, 1) -- 424
						local text = table.concat(args, " ") -- 425
						do -- 426
							local _obj_0 = GAMEMODE.laws -- 426
							_obj_0[#_obj_0 + 1] = text -- 426
						end -- 426
						return gterm:Broadcast(term, "created law " .. tostring(#GAMEMODE:Laws()) .. ": \"" .. tostring(text) .. "\"", GT_COL_SUCC) -- 427
					elseif "remove" == cmd then -- 428
						if #args < 2 then -- 429
							gterm:Broadcast(term, "no law specified?", GT_COL_ERR) -- 430
							return -- 431
						end -- 429
						local num = tonumber(args[2]) -- 432
						if 0 == num or nil == num then -- 434
							gterm:Broadcast(term, "invalid number given?", GT_COL_ERR) -- 435
							return -- 436
						else -- 438
							if num > #laws then -- 438
								gterm:Broadcast(term, "invalid number given? (law count: " .. tostring(#laws) .. ")", GT_COL_ERR) -- 439
								return -- 440
							elseif num <= #GAMEMODE.default_laws then -- 441
								gterm:Broadcast(term, "cannot remove laws numbered " .. tostring(#GAMEMODE.default_laws) .. " or less", GT_COL_ERR) -- 442
								return -- 443
							end -- 438
							local law = table.remove(GAMEMODE.laws, num - #GAMEMODE.default_laws) -- 445
							return gterm:Broadcast(term, "deleted law " .. tostring(num) .. ": \"" .. tostring(law) .. "\"", GT_COL_ERR) -- 446
						end -- 446
					elseif "rotate" == cmd then -- 447
						if #args < 3 then -- 448
							gterm:Broadcast(term, "invalid arguments?", GT_COL_ERR) -- 449
							return -- 450
						end -- 448
						local first = tonumber(args[2]) -- 451
						local second = tonumber(args[3]) -- 452
						if (first == 0 or first == nil) or (second == 0 or second == nil) then -- 453
							gterm:Broadcast(term, "invalid number given?", GT_COL_ERR) -- 454
							return -- 455
						elseif first > #laws or second > #laws then -- 456
							gterm:Broadcast(term, "invalid number given? (law count: " .. tostring(laws), GT_COL_ERR) -- 457
							return -- 458
						elseif first <= #GAMEMODE.default_laws or second <= #GAMEMODE.default_laws then -- 460
							gterm:Broadcast(term, "cannot rotate laws numbered " .. tostring(#GAMEMODE.default_laws) .. " or less", GT_COL_ERR) -- 461
							return -- 462
						end -- 453
						first = first - #GAMEMODE.default_laws -- 463
						local first_law = GAMEMODE.laws[first] -- 464
						second = second - #GAMEMODE.default_laws -- 465
						local second_law = GAMEMODE.laws[second] -- 466
						GAMEMODE.laws[first] = second_law -- 467
						GAMEMODE.laws[second] = first_law -- 468
						return gterm:Broadcast(term, "rotated laws " .. tostring(args[2]) .. "/" .. tostring(args[3]) .. ".", GT_COL_SUCC) -- 469
					else -- 471
						local _with_0 = gterm -- 471
						_with_0:Broadcast(term, "LAW INTERFACE", GT_COL_INFO) -- 472
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO) -- 473
						_with_0:Broadcast(term, "    makes your wishes come true") -- 474
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO) -- 475
						_with_0:Broadcast(term, "    :law list - list the current laws") -- 476
						_with_0:Broadcast(term, "    :law add <your law's text> - add a new law") -- 477
						_with_0:Broadcast(term, "    :law remove # - remove a law by its number") -- 478
						_with_0:Broadcast(term, "    :law rotate #1 #2 - two laws switch places") -- 479
						return _with_0 -- 471
					end -- 479
				end, -- 409
				help = "View and manipulate the laws of this land." -- 480
			} -- 408
		} -- 249
	} -- 249
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 481
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 249
			_base_0[_key_0] = _val_0 -- 249
		end -- 249
	end -- 481
	if _base_0.__index == nil then -- 249
		_base_0.__index = _base_0 -- 249
	end -- 481
	setmetatable(_base_0, _parent_0.__base) -- 249
	_class_0 = setmetatable({ -- 249
		__init = function(self, ...) -- 249
			return _class_0.__parent.__init(self, ...) -- 249
		end, -- 249
		__base = _base_0, -- 249
		__name = "Tyrant", -- 249
		__parent = _parent_0 -- 249
	}, { -- 249
		__index = function(cls, name) -- 249
			local val = rawget(_base_0, name) -- 249
			if val == nil then -- 249
				local parent = rawget(cls, "__parent") -- 249
				if parent then -- 249
					return parent[name] -- 249
				end -- 249
			else -- 249
				return val -- 249
			end -- 249
		end, -- 249
		__call = function(cls, ...) -- 249
			local _self_0 = setmetatable({ }, _base_0) -- 249
			cls.__init(_self_0, ...) -- 249
			return _self_0 -- 249
		end -- 249
	}) -- 249
	_base_0.__class = _class_0 -- 249
	if _parent_0.__inherited then -- 249
		_parent_0.__inherited(_parent_0, _class_0) -- 249
	end -- 249
	Tyrant = _class_0 -- 249
end -- 481
local Public -- 483
do -- 483
	local _class_0 -- 483
	local _parent_0 = OS -- 483
	local _base_0 = { -- 483
		greeting = { -- 485
			"boot sequence now", -- 485
			"finalizing public system", -- 486
			"greetings citizen", -- 487
			"LIVER FAILURE FOREVER." -- 488
		}, -- 491
		advice = { -- 492
			"One corpse's trash is another corpse's treasure.", -- 492
			"Bottles are useful. Don't smash them.", -- 493
			"Snorting broken glass may give you special powers.", -- 494
			"Burn your trash, eat your plastic, never stop smoking.", -- 495
			"Liver Failure doesn't take kindly to slackers.", -- 496
			"You live because you are useful enough to be exploited.", -- 497
			"Chew with your good teeth.", -- 498
			"Violence doesn't solve every problem, only some of them.", -- 499
			"Flesh capsules are very delicate, be careful with them.", -- 500
			"You do not need a gun. You do not want a gun.", -- 501
			"Don't venture too far into the tunnels.", -- 502
			"Evil things are bad.", -- 503
			"Play catch with people.", -- 504
			"Playing is fun.", -- 505
			"Play teeth. Teeth is fun.", -- 506
			"Rules are the rules.", -- 507
			"M y  h e a d ... M y  b r a i n ... M y  b e e r ...", -- 508
			"Eat and drink before taking your medicine.", -- 509
			"Bodily fluids can spread pathogens.", -- 510
			"Your safety is not a priority.", -- 511
			"It's what you wanted", -- 512
			"Radar spelled backwards is Radar.", -- 513
			"You're thinking about it, aren't you?", -- 514
			"But seriously though,", -- 515
			"At least you're not dead yet.", -- 516
			"At least you're not teeth yet.", -- 517
			"I wanna go home.", -- 518
			"Please", -- 519
			"You will get what you deserve.", -- 520
			"Booze loves company.", -- 521
			"Misery loves company.", -- 522
			"Teeth love company.", -- 523
			"Corpses love company.", -- 524
			"The things you put in your mouth can hurt you.", -- 525
			"Make sure you're ready for the hangover tomorrow.", -- 526
			"Buying things feels so good, doesn't it?", -- 527
			"We work until we die, and that's the way we like it.", -- 528
			"Blood brothers protect each other.", -- 529
			"You can't trust that people are what they say.", -- 530
			"Some people don't look like you. This is a problem.", -- 531
			"What's a little brawl between friends?", -- 532
			"It's too late now.", -- 533
			"you work to rent a bed so can rest for work tomorrow" -- 534
		}, -- 537
		commands = { -- 538
			[":help"] = { -- 539
				Callback = function(self, ply, term, args) -- 539
					local _with_0 = gterm -- 540
					_with_0:Broadcast(term, "  COMMANDS:") -- 543
					for k, v in SortedPairs(self:GetCommands()) do -- 544
						_with_0:Broadcast(term, "  * " .. tostring(k), GT_COL_INFO) -- 545
						_with_0:Broadcast(term, "    " .. tostring(v.help)) -- 546
					end -- 546
					_with_0:Broadcast(term, "  end list", GT_COL_INTL) -- 547
					return _with_0 -- 540
				end, -- 539
				help = "Basic usage instructions." -- 548
			}, -- 538
			[":cls"] = { -- 551
				Callback = function(self, ply, term) -- 551
					for i = 0, term.max_lines do -- 552
						local time = math.Rand(0.01, 0.04) -- 553
						timer.Simple(i * time, function() -- 554
							if IsValid(term) then -- 555
								return gterm:Broadcast(term, "", MSG_COL_NIL, i) -- 555
							end -- 555
						end) -- 554
					end -- 555
					return -- 556
				end, -- 551
				help = "Clear the screen." -- 557
			}, -- 550
			[":advice"] = { -- 560
				Callback = function(self, ply, term) -- 560
					local advice = self.advice[math.random(#self.advice)] -- 561
					if IsValid(term) then -- 562
						return gterm:Broadcast(term, advice, MSG_COL_INFO) -- 562
					end -- 562
				end, -- 560
				help = "Consult the infinite wisdom." -- 563
			}, -- 559
			[":taxes"] = { -- 566
				Callback = function(self, ply, term, args) -- 566
					local taxes = GAMEMODE.taxes -- 567
					gterm:Broadcast(term, "TAXES OF THE LAND:", GT_COL_INFO) -- 568
					for k, v in pairs(taxes) do -- 569
						gterm:Broadcast(term, "  " .. tostring(k) .. " tax is " .. tostring(v) .. "%", GT_COL_SUCC) -- 569
					end -- 569
					return gterm:Broadcast(term, "end list", GT_COL_INTL) -- 570
				end, -- 566
				help = "View what you people owe." -- 571
			}, -- 565
			[":laws"] = { -- 574
				Callback = function(self, ply, term, args) -- 574
					local laws = GAMEMODE:Laws() -- 575
					gterm:Broadcast(term, "LAWS OF THE LAND:", GT_COL_INFO) -- 576
					for k, v in ipairs(laws) do -- 577
						gterm:Broadcast(term, "  " .. tostring(k) .. ". " .. tostring(v), GT_COL_WRN) -- 577
					end -- 577
					return gterm:Broadcast(term, "end list", GT_COL_INTL) -- 578
				end, -- 574
				help = "View the laws of this land." -- 579
			}, -- 573
			[":whoami"] = { -- 582
				Callback = function(self, ply, term, args) -- 582
					gterm:Broadcast(term, "this experimental feature is still in testing", GT_COL_WRN) -- 583
					return gterm:Broadcast(term, "try later", GT_COL_WRN) -- 584
				end, -- 582
				help = "View social information." -- 585
			} -- 581
		}, -- 588
		lifetime = 60 * 3, -- 589
		Initialized = function(self, term) -- 589
			_class_0.__parent.__base.Initialized(self, term) -- 590
			term.live_until = CurTime() + self.lifetime -- 591
			return gterm:Broadcast(term, "DEATH when idle time exceeds " .. tostring(string.NiceTime(self.lifetime)), GT_COL_INFO) -- 592
		end, -- 593
		ReceiveInput = function(self, term, ply) -- 593
			term.live_until = CurTime() + self.lifetime -- 594
		end, -- 595
		Think = function(self, term) -- 595
			local ct = CurTime() -- 596
			if not term:GetActive() then -- 597
				return -- 597
			end -- 597
			if term.warn_cooldown and ct < term.warn_cooldown then -- 598
				return -- 598
			end -- 598
			if not term.live_until then -- 599
				term.live_until = ct + self.lifetime -- 599
			end -- 599
			local time_left = term.live_until - CurTime() -- 600
			if math.floor(time_left) % 60 == 0 then -- 601
				if math.floor(time_left) <= 1 then -- 602
					gterm:Broadcast(term, "DEATH", GT_COL_INTL) -- 603
					return timer.Simple(math.Rand(2, 5), function() -- 604
						if IsValid(term) and term:GetActive() then -- 605
							for i = 0, term.max_lines do -- 606
								if IsValid(term) then -- 607
									gterm:Broadcast(term, "", nil, i) -- 607
								end -- 607
							end -- 607
							return gterm.OS:Call(term, "ShutDown") -- 608
						end -- 605
					end) -- 608
				else -- 610
					return gterm:Broadcast(term, "DEATH in " .. tostring(string.NiceTime(time_left)), GT_COL_INFO) -- 610
				end -- 602
			end -- 601
		end -- 483
	} -- 483
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 611
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 483
			_base_0[_key_0] = _val_0 -- 483
		end -- 483
	end -- 611
	if _base_0.__index == nil then -- 483
		_base_0.__index = _base_0 -- 483
	end -- 611
	setmetatable(_base_0, _parent_0.__base) -- 483
	_class_0 = setmetatable({ -- 483
		__init = function(self, ...) -- 483
			return _class_0.__parent.__init(self, ...) -- 483
		end, -- 483
		__base = _base_0, -- 483
		__name = "Public", -- 483
		__parent = _parent_0 -- 483
	}, { -- 483
		__index = function(cls, name) -- 483
			local val = rawget(_base_0, name) -- 483
			if val == nil then -- 483
				local parent = rawget(cls, "__parent") -- 483
				if parent then -- 483
					return parent[name] -- 483
				end -- 483
			else -- 483
				return val -- 483
			end -- 483
		end, -- 483
		__call = function(cls, ...) -- 483
			local _self_0 = setmetatable({ }, _base_0) -- 483
			cls.__init(_self_0, ...) -- 483
			return _self_0 -- 483
		end -- 483
	}) -- 483
	_base_0.__class = _class_0 -- 483
	if _parent_0.__inherited then -- 483
		_parent_0.__inherited(_parent_0, _class_0) -- 483
	end -- 483
	Public = _class_0 -- 483
end -- 611
net.Receive("evilrp_terminal_endconsole", function(len, ply) -- 612
	local idx = net.ReadUInt(16) -- 613
	local term = Entity(idx) -- 614
	local text = net.ReadString() -- 615
	if not (IsValid(term) and term.GetUser) then -- 616
		return -- 616
	end -- 616
	local user = term:GetUser() -- 617
	if not (IsValid(user) and user == ply) then -- 618
		return -- 618
	end -- 618
	if (text == "") or (text == " ") then -- 619
		term:SetUser(nil) -- 620
		net.Start("evilrp_terminal_endtyping") -- 621
		net.Send(ply) -- 622
		return -- 623
	end -- 619
	gterm.OS:Call(term, "ReceiveInput", ply) -- 624
	if term.password and not client["pass_authed_" .. tostring(idx)] then -- 625
		if text == term.password then -- 626
			ply["pass_authed_" .. tostring(idx)] = true -- 627
			gterm:Broadcast(term, "password accepted", GT_COL_INFO) -- 628
			return -- 629
		else -- 631
			gterm:Broadcast(term, "password required", GT_COL_INFO) -- 631
			return -- 632
		end -- 626
	end -- 625
	if string.sub(text, 1, 1) == ":" then -- 633
		local sys = OS.distros[term:GetOS()] -- 634
		if sys then -- 635
			for k, v in pairs(sys:GetCommands()) do -- 636
				local cmd = string.sub(string.lower(text), 1, string.len(k)) -- 637
				if k == cmd then -- 638
					local text2 = string.sub(text, string.len(cmd) + 2) -- 639
					local quote = (string.sub(text2, 1, 1) ~= "\"") -- 640
					local args = { } -- 641
					for chunk in string.gmatch(text2, "[^\"]+") do -- 642
						quote = not quote -- 643
						if quote then -- 644
							args[#args + 1] = chunk -- 645
						else -- 647
							for chunk in string.gmatch(chunk, "[^ ]+") do -- 647
								args[#args + 1] = chunk -- 647
							end -- 647
						end -- 644
					end -- 647
					local success, value = pcall(v.Callback, sys, ply, term, args) -- 648
					if success then -- 649
						gterm:Broadcast(term, text, GT_COL_CMD) -- 650
					else -- 652
						gterm:Broadcast(term, value, GT_COL_ERR) -- 652
					end -- 649
					return -- 653
				end -- 638
			end -- 653
			text = tostring(string.sub(text, 2)) .. ": command not found" -- 654
			gterm:Broadcast(term, text, GT_COL_ERR) -- 655
			return -- 656
		else -- 658
			gterm:Broadcast(term, "DEATH", GT_COL_INTL) -- 660
		end -- 635
		if term.accepting_input then -- 661
			local quote = (string.sub(text, 1, 1) ~= "\"") -- 662
			local args = { } -- 663
			for chunk in string.match(text, "[^\"]+") do -- 664
				quote = not quote -- 665
				if quote then -- 666
					args[#args + 1] = chunk -- 667
				else -- 669
					for chunk in string.gmatch(chunk, "[^ ]+") do -- 669
						args[#args + 1] = chunk -- 669
					end -- 669
				end -- 666
			end -- 669
			local callback = term.input_callback -- 670
			if callback and args then -- 671
				callback(ply, args) -- 671
			end -- 671
			term.accepting_input = nil -- 672
			term.input_callback = nil -- 673
			return -- 674
		end -- 661
	end -- 633
	local sys = OS.distros[term:GetOS()] -- 675
	local name = sys and sys.unique_id or "unknown" -- 676
	local finalized = tostring(("<"):Escape()) .. tostring(name) .. "@" .. tostring(term:EntIndex()) .. tostring((">"):Escape()) .. " " .. tostring(text) -- 677
	return gterm:Broadcast(term, finalized, GT_COL_CMD) -- 678
end) -- 612
return MsgC(Color(255, 0, 0), "INITIALIZED EVILRP TERMINALS\n") -- 680
