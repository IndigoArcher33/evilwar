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
					local stocks = GAMEMODE.Stocks -- 379
					gterm:Broadcast(term, "STOCKS OF THE LAND:", GT_COL_INFO) -- 380
					for k, v in pairs(stocks) do -- 381
						gterm:Broadcast(term, "  " .. tostring(k) .. "| " .. tostring(v) .. " units", GT_COL_SUCC) -- 381
					end -- 381
					return gterm:Broadcast(term, "end list", GT_COL_INTL) -- 382
				end, -- 378
				help = "View what you own." -- 383
			}, -- 377
			[":die"] = { -- 386
				Callback = function(self, ply, term) -- 386
					if ply:Team() ~= TEAM_KOMMANDANT then -- 387
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 388
						return -- 389
					end -- 387
					gterm:Broadcast(term, "SHUTTING DOWN") -- 390
					return timer.Simple(math.Rand(2, 5), function() -- 391
						if IsValid(term) then -- 392
							for i = 0, term.max_lines do -- 393
								if IsValid(term) then -- 394
									gterm:Broadcast(term, "", nil, i) -- 394
								end -- 394
							end -- 394
							term:SetActive(false) -- 395
							return gterm.OS:Call(term, "ShutDown") -- 396
						end -- 392
					end) -- 396
				end, -- 386
				help = "Turn the computer off." -- 397
			}, -- 385
			[":law"] = { -- 400
				Callback = function(self, ply, term, args) -- 400
					if ply:Team() ~= TEAM_KOMMANDANT then -- 401
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 402
						return -- 403
					end -- 401
					local laws = GAMEMODE:Laws() -- 404
					local cmd = args[1] -- 405
					if "list" == cmd then -- 407
						gterm:Broadcast(term, "LAWS OF THE LAND:", GT_COL_INFO) -- 408
						for k, v in ipairs(laws) do -- 409
							gterm:Broadcast(term, "  " .. tostring(k) .. ". " .. tostring(v)) -- 409
						end -- 409
						return gterm:Broadcast(term, "  end list", GT_COL_INTL) -- 410
					elseif "add" == cmd then -- 411
						if #args < 2 then -- 412
							gterm:Broadcast(term, "no law text provided?", GT_COL_ERR) -- 413
							return -- 414
						end -- 412
						table.remove(args, 1) -- 415
						local text = table.concat(args, " ") -- 416
						do -- 417
							local _obj_0 = GAMEMODE.laws -- 417
							_obj_0[#_obj_0 + 1] = text -- 417
						end -- 417
						return gterm:Broadcast(term, "created law " .. tostring(#GAMEMODE:Laws()) .. ": \"" .. tostring(text) .. "\"", GT_COL_SUCC) -- 418
					elseif "remove" == cmd then -- 419
						if #args < 2 then -- 420
							gterm:Broadcast(term, "no law specified?", GT_COL_ERR) -- 421
							return -- 422
						end -- 420
						local num = tonumber(args[2]) -- 423
						if 0 == num or nil == num then -- 425
							gterm:Broadcast(term, "invalid number given?", GT_COL_ERR) -- 426
							return -- 427
						else -- 429
							if num > #laws then -- 429
								gterm:Broadcast(term, "invalid number given? (law count: " .. tostring(#laws) .. ")", GT_COL_ERR) -- 430
								return -- 431
							elseif num <= #GAMEMODE.default_laws then -- 432
								gterm:Broadcast(term, "cannot remove laws numbered " .. tostring(#GAMEMODE.default_laws) .. " or less", GT_COL_ERR) -- 433
								return -- 434
							end -- 429
							local law = table.remove(GAMEMODE.laws, num - #GAMEMODE.default_laws) -- 436
							return gterm:Broadcast(term, "deleted law " .. tostring(num) .. ": \"" .. tostring(law) .. "\"", GT_COL_ERR) -- 437
						end -- 437
					elseif "rotate" == cmd then -- 438
						if #args < 3 then -- 439
							gterm:Broadcast(term, "invalid arguments?", GT_COL_ERR) -- 440
							return -- 441
						end -- 439
						local first = tonumber(args[2]) -- 442
						local second = tonumber(args[3]) -- 443
						if (first == 0 or first == nil) or (second == 0 or second == nil) then -- 444
							gterm:Broadcast(term, "invalid number given?", GT_COL_ERR) -- 445
							return -- 446
						elseif first > #laws or second > #laws then -- 447
							gterm:Broadcast(term, "invalid number given? (law count: " .. tostring(laws), GT_COL_ERR) -- 448
							return -- 449
						elseif first <= #GAMEMODE.default_laws or second <= #GAMEMODE.default_laws then -- 451
							gterm:Broadcast(term, "cannot rotate laws numbered " .. tostring(#GAMEMODE.default_laws) .. " or less", GT_COL_ERR) -- 452
							return -- 453
						end -- 444
						first = first - #GAMEMODE.default_laws -- 454
						local first_law = GAMEMODE.laws[first] -- 455
						second = second - #GAMEMODE.default_laws -- 456
						local second_law = GAMEMODE.laws[second] -- 457
						GAMEMODE.laws[first] = second_law -- 458
						GAMEMODE.laws[second] = first_law -- 459
						return gterm:Broadcast(term, "rotated laws " .. tostring(args[2]) .. "/" .. tostring(args[3]) .. ".", GT_COL_SUCC) -- 460
					else -- 462
						local _with_0 = gterm -- 462
						_with_0:Broadcast(term, "LAW INTERFACE", GT_COL_INFO) -- 463
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO) -- 464
						_with_0:Broadcast(term, "    makes your wishes come true") -- 465
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO) -- 466
						_with_0:Broadcast(term, "    :law list - list the current laws") -- 467
						_with_0:Broadcast(term, "    :law add <your law's text> - add a new law") -- 468
						_with_0:Broadcast(term, "    :law remove # - remove a law by its number") -- 469
						_with_0:Broadcast(term, "    :law rotate #1 #2 - two laws switch places") -- 470
						return _with_0 -- 462
					end -- 470
				end, -- 400
				help = "View and manipulate the laws of this land." -- 471
			} -- 399
		} -- 249
	} -- 249
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 472
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 249
			_base_0[_key_0] = _val_0 -- 249
		end -- 249
	end -- 472
	if _base_0.__index == nil then -- 249
		_base_0.__index = _base_0 -- 249
	end -- 472
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
end -- 472
local Public -- 474
do -- 474
	local _class_0 -- 474
	local _parent_0 = OS -- 474
	local _base_0 = { -- 474
		greeting = { -- 476
			"boot sequence now", -- 476
			"finalizing public system", -- 477
			"greetings citizen", -- 478
			"LIVER FAILURE FOREVER." -- 479
		}, -- 482
		advice = { -- 483
			"One corpse's trash is another corpse's treasure.", -- 483
			"Bottles are useful. Don't smash them.", -- 484
			"Snorting broken glass may give you special powers.", -- 485
			"Burn your trash, eat your plastic, never stop smoking.", -- 486
			"Liver Failure doesn't take kindly to slackers.", -- 487
			"You live because you are useful enough to be exploited.", -- 488
			"Chew with your good teeth.", -- 489
			"Violence doesn't solve every problem, only some of them.", -- 490
			"Flesh capsules are very delicate, be careful with them.", -- 491
			"You do not need a gun. You do not want a gun.", -- 492
			"Don't venture too far into the tunnels.", -- 493
			"Evil things are bad.", -- 494
			"Play catch with people.", -- 495
			"Playing is fun.", -- 496
			"Play teeth. Teeth is fun.", -- 497
			"Rules are the rules.", -- 498
			"M y  h e a d ... M y  b r a i n ... M y  b e e r ...", -- 499
			"Eat and drink before taking your medicine.", -- 500
			"Bodily fluids can spread pathogens.", -- 501
			"Your safety is not a priority.", -- 502
			"It's what you wanted", -- 503
			"Radar spelled backwards is Radar.", -- 504
			"You're thinking about it, aren't you?", -- 505
			"But seriously though,", -- 506
			"At least you're not dead yet.", -- 507
			"At least you're not teeth yet.", -- 508
			"I wanna go home.", -- 509
			"Please", -- 510
			"You will get what you deserve.", -- 511
			"Booze loves company.", -- 512
			"Misery loves company.", -- 513
			"Teeth love company.", -- 514
			"Corpses love company.", -- 515
			"The things you put in your mouth can hurt you.", -- 516
			"Make sure you're ready for the hangover tomorrow.", -- 517
			"Buying things feels so good, doesn't it?", -- 518
			"We work until we die, and that's the way we like it.", -- 519
			"Blood brothers protect each other.", -- 520
			"You can't trust that people are what they say.", -- 521
			"Some people don't look like you. This is a problem.", -- 522
			"What's a little brawl between friends?", -- 523
			"It's too late now.", -- 524
			"you work to rent a bed so can rest for work tomorrow" -- 525
		}, -- 528
		commands = { -- 529
			[":help"] = { -- 530
				Callback = function(self, ply, term, args) -- 530
					local _with_0 = gterm -- 531
					_with_0:Broadcast(term, "  COMMANDS:") -- 534
					for k, v in SortedPairs(self:GetCommands()) do -- 535
						_with_0:Broadcast(term, "  * " .. tostring(k), GT_COL_INFO) -- 536
						_with_0:Broadcast(term, "    " .. tostring(v.help)) -- 537
					end -- 537
					_with_0:Broadcast(term, "  end list", GT_COL_INTL) -- 538
					return _with_0 -- 531
				end, -- 530
				help = "Basic usage instructions." -- 539
			}, -- 529
			[":cls"] = { -- 542
				Callback = function(self, ply, term) -- 542
					for i = 0, term.max_lines do -- 543
						local time = math.Rand(0.01, 0.04) -- 544
						timer.Simple(i * time, function() -- 545
							if IsValid(term) then -- 546
								return gterm:Broadcast(term, "", MSG_COL_NIL, i) -- 546
							end -- 546
						end) -- 545
					end -- 546
					return -- 547
				end, -- 542
				help = "Clear the screen." -- 548
			}, -- 541
			[":advice"] = { -- 551
				Callback = function(self, ply, term) -- 551
					local advice = self.advice[math.random(#self.advice)] -- 552
					if IsValid(term) then -- 553
						return gterm:Broadcast(term, advice, MSG_COL_INFO) -- 553
					end -- 553
				end, -- 551
				help = "Consult the infinite wisdom." -- 554
			}, -- 550
			[":taxes"] = { -- 557
				Callback = function(self, ply, term, args) -- 557
					local taxes = GAMEMODE.taxes -- 558
					gterm:Broadcast(term, "TAXES OF THE LAND:", GT_COL_INFO) -- 559
					for k, v in pairs(taxes) do -- 560
						gterm:Broadcast(term, "  " .. tostring(k) .. " tax is " .. tostring(v) .. "%", GT_COL_SUCC) -- 560
					end -- 560
					return gterm:Broadcast(term, "end list", GT_COL_INTL) -- 561
				end, -- 557
				help = "View what you people owe." -- 562
			}, -- 556
			[":laws"] = { -- 565
				Callback = function(self, ply, term, args) -- 565
					local laws = GAMEMODE:Laws() -- 566
					gterm:Broadcast(term, "LAWS OF THE LAND:", GT_COL_INFO) -- 567
					for k, v in ipairs(laws) do -- 568
						gterm:Broadcast(term, "  " .. tostring(k) .. ". " .. tostring(v), GT_COL_WRN) -- 568
					end -- 568
					return gterm:Broadcast(term, "end list", GT_COL_INTL) -- 569
				end, -- 565
				help = "View the laws of this land." -- 570
			}, -- 564
			[":whoami"] = { -- 573
				Callback = function(self, ply, term, args) -- 573
					gterm:Broadcast(term, "this experimental feature is still in testing", GT_COL_WRN) -- 574
					return gterm:Broadcast(term, "try later", GT_COL_WRN) -- 575
				end, -- 573
				help = "View social information." -- 576
			} -- 572
		}, -- 579
		lifetime = 60 * 3, -- 580
		Initialized = function(self, term) -- 580
			_class_0.__parent.__base.Initialized(self, term) -- 581
			term.live_until = CurTime() + self.lifetime -- 582
			return gterm:Broadcast(term, "DEATH when idle time exceeds " .. tostring(string.NiceTime(self.lifetime)), GT_COL_INFO) -- 583
		end, -- 584
		ReceiveInput = function(self, term, ply) -- 584
			term.live_until = CurTime() + self.lifetime -- 585
		end, -- 586
		Think = function(self, term) -- 586
			local ct = CurTime() -- 587
			if not term:GetActive() then -- 588
				return -- 588
			end -- 588
			if term.warn_cooldown and ct < term.warn_cooldown then -- 589
				return -- 589
			end -- 589
			if not term.live_until then -- 590
				term.live_until = ct + self.lifetime -- 590
			end -- 590
			local time_left = term.live_until - CurTime() -- 591
			if math.floor(time_left) % 60 == 0 then -- 592
				if math.floor(time_left) <= 1 then -- 593
					gterm:Broadcast(term, "DEATH", GT_COL_INTL) -- 594
					return timer.Simple(math.Rand(2, 5), function() -- 595
						if IsValid(term) and term:GetActive() then -- 596
							for i = 0, term.max_lines do -- 597
								if IsValid(term) then -- 598
									gterm:Broadcast(term, "", nil, i) -- 598
								end -- 598
							end -- 598
							return gterm.OS:Call(term, "ShutDown") -- 599
						end -- 596
					end) -- 599
				else -- 601
					return gterm:Broadcast(term, "DEATH in " .. tostring(string.NiceTime(time_left)), GT_COL_INFO) -- 601
				end -- 593
			end -- 592
		end -- 474
	} -- 474
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 602
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 474
			_base_0[_key_0] = _val_0 -- 474
		end -- 474
	end -- 602
	if _base_0.__index == nil then -- 474
		_base_0.__index = _base_0 -- 474
	end -- 602
	setmetatable(_base_0, _parent_0.__base) -- 474
	_class_0 = setmetatable({ -- 474
		__init = function(self, ...) -- 474
			return _class_0.__parent.__init(self, ...) -- 474
		end, -- 474
		__base = _base_0, -- 474
		__name = "Public", -- 474
		__parent = _parent_0 -- 474
	}, { -- 474
		__index = function(cls, name) -- 474
			local val = rawget(_base_0, name) -- 474
			if val == nil then -- 474
				local parent = rawget(cls, "__parent") -- 474
				if parent then -- 474
					return parent[name] -- 474
				end -- 474
			else -- 474
				return val -- 474
			end -- 474
		end, -- 474
		__call = function(cls, ...) -- 474
			local _self_0 = setmetatable({ }, _base_0) -- 474
			cls.__init(_self_0, ...) -- 474
			return _self_0 -- 474
		end -- 474
	}) -- 474
	_base_0.__class = _class_0 -- 474
	if _parent_0.__inherited then -- 474
		_parent_0.__inherited(_parent_0, _class_0) -- 474
	end -- 474
	Public = _class_0 -- 474
end -- 602
net.Receive("evilrp_terminal_endconsole", function(len, ply) -- 603
	local idx = net.ReadUInt(16) -- 604
	local term = Entity(idx) -- 605
	local text = net.ReadString() -- 606
	if not (IsValid(term) and term.GetUser) then -- 607
		return -- 607
	end -- 607
	local user = term:GetUser() -- 608
	if not (IsValid(user) and user == ply) then -- 609
		return -- 609
	end -- 609
	if (text == "") or (text == " ") then -- 610
		term:SetUser(nil) -- 611
		net.Start("evilrp_terminal_endtyping") -- 612
		net.Send(ply) -- 613
		return -- 614
	end -- 610
	gterm.OS:Call(term, "ReceiveInput", ply) -- 615
	if term.password and not client["pass_authed_" .. tostring(idx)] then -- 616
		if text == term.password then -- 617
			ply["pass_authed_" .. tostring(idx)] = true -- 618
			gterm:Broadcast(term, "password accepted", GT_COL_INFO) -- 619
			return -- 620
		else -- 622
			gterm:Broadcast(term, "password required", GT_COL_INFO) -- 622
			return -- 623
		end -- 617
	end -- 616
	if string.sub(text, 1, 1) == ":" then -- 624
		local sys = OS.distros[term:GetOS()] -- 625
		if sys then -- 626
			for k, v in pairs(sys:GetCommands()) do -- 627
				local cmd = string.sub(string.lower(text), 1, string.len(k)) -- 628
				if k == cmd then -- 629
					local text2 = string.sub(text, string.len(cmd) + 2) -- 630
					local quote = (string.sub(text2, 1, 1) ~= "\"") -- 631
					local args = { } -- 632
					for chunk in string.gmatch(text2, "[^\"]+") do -- 633
						quote = not quote -- 634
						if quote then -- 635
							args[#args + 1] = chunk -- 636
						else -- 638
							for chunk in string.gmatch(chunk, "[^ ]+") do -- 638
								args[#args + 1] = chunk -- 638
							end -- 638
						end -- 635
					end -- 638
					local success, value = pcall(v.Callback, sys, ply, term, args) -- 639
					if success then -- 640
						gterm:Broadcast(term, text, GT_COL_CMD) -- 641
					else -- 643
						gterm:Broadcast(term, value, GT_COL_ERR) -- 643
					end -- 640
					return -- 644
				end -- 629
			end -- 644
			text = tostring(string.sub(text, 2)) .. ": command not found" -- 645
			gterm:Broadcast(term, text, GT_COL_ERR) -- 646
			return -- 647
		else -- 649
			gterm:Broadcast(term, "DEATH", GT_COL_INTL) -- 651
		end -- 626
		if term.accepting_input then -- 652
			local quote = (string.sub(text, 1, 1) ~= "\"") -- 653
			local args = { } -- 654
			for chunk in string.match(text, "[^\"]+") do -- 655
				quote = not quote -- 656
				if quote then -- 657
					args[#args + 1] = chunk -- 658
				else -- 660
					for chunk in string.gmatch(chunk, "[^ ]+") do -- 660
						args[#args + 1] = chunk -- 660
					end -- 660
				end -- 657
			end -- 660
			local callback = term.input_callback -- 661
			if callback and args then -- 662
				callback(ply, args) -- 662
			end -- 662
			term.accepting_input = nil -- 663
			term.input_callback = nil -- 664
			return -- 665
		end -- 652
	end -- 624
	local sys = OS.distros[term:GetOS()] -- 666
	local name = sys and sys.unique_id or "unknown" -- 667
	local finalized = tostring(("<"):Escape()) .. tostring(name) .. "@" .. tostring(term:EntIndex()) .. tostring((">"):Escape()) .. " " .. tostring(text) -- 668
	return gterm:Broadcast(term, finalized, GT_COL_CMD) -- 669
end) -- 603
return MsgC(Color(255, 0, 0), "INITIALIZED EVILRP TERMINALS\n") -- 671
