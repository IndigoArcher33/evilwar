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
local charities = { -- 10
	"the Take-A-Wish Foundation", -- 10
	"Doktors Within Borders", -- 11
	"The Church of Sotla", -- 12
	"the Wastelanders' Association", -- 13
	"the Drunk Drivers' Union", -- 14
	"the Carcinoma Appreciation Society", -- 15
	"the Trench Inspection Bureau", -- 16
	"the Necroskullfuckistan Central Kitchen", -- 17
	"the Damnation Army", -- 18
	"the Aneurism-Lymphoma Public Affairs Committee", -- 19
	"the Lymphoman Fashion Show", -- 20
	"the Ministers' Lobby" -- 21
} -- 9
util.AddNetworkString("evilrp_terminal_scroll") -- 24
GetPlayerByName = function(name) -- 26
	if not (name and name ~= "") then -- 27
		return nil -- 27
	end -- 27
	name = name:lower() -- 28
	for _, ply in pairs(player.GetAll()) do -- 29
		if ply:Nick():lower():match(name) then -- 30
			return ply -- 31
		end -- 30
	end -- 31
	return nil -- 32
end -- 26
GetEtabByName = function(name) -- 34
	if not (name and name ~= "") then -- 35
		return nil -- 35
	end -- 35
	name = name:lower() -- 36
	for item, avail in pairs(GAMEMODE.Stocks) do -- 37
		local etab = scripted_ents.Get(item) -- 38
		if not etab then -- 39
			etab = weapons.Get(item) -- 41
		end -- 39
		if etab.PrintName:lower():match(name) and avail > 0 then -- 43
			return etab -- 44
		end -- 43
	end -- 45
	return nil -- 46
end -- 34
local TerminalPowered -- 48
do -- 48
	local _class_0 -- 48
	local _parent_0 = SOUND -- 48
	local _base_0 = { -- 48
		sound = "hl1/ambience/computalk2.wav", -- 50
		pitch = { -- 50
			150, -- 50
			200 -- 50
		}, -- 51
		volume = 0.2, -- 52
		level = SNDLVL_40DB -- 48
	} -- 48
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 52
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 48
			_base_0[_key_0] = _val_0 -- 48
		end -- 48
	end -- 52
	if _base_0.__index == nil then -- 48
		_base_0.__index = _base_0 -- 48
	end -- 52
	setmetatable(_base_0, _parent_0.__base) -- 48
	_class_0 = setmetatable({ -- 48
		__init = function(self, ...) -- 48
			return _class_0.__parent.__init(self, ...) -- 48
		end, -- 48
		__base = _base_0, -- 48
		__name = "TerminalPowered", -- 48
		__parent = _parent_0 -- 48
	}, { -- 48
		__index = function(cls, name) -- 48
			local val = rawget(_base_0, name) -- 48
			if val == nil then -- 48
				local parent = rawget(cls, "__parent") -- 48
				if parent then -- 48
					return parent[name] -- 48
				end -- 48
			else -- 48
				return val -- 48
			end -- 48
		end, -- 48
		__call = function(cls, ...) -- 48
			local _self_0 = setmetatable({ }, _base_0) -- 48
			cls.__init(_self_0, ...) -- 48
			return _self_0 -- 48
		end -- 48
	}) -- 48
	_base_0.__class = _class_0 -- 48
	if _parent_0.__inherited then -- 48
		_parent_0.__inherited(_parent_0, _class_0) -- 48
	end -- 48
	TerminalPowered = _class_0 -- 48
end -- 52
local WarAlarm -- 54
do -- 54
	local _class_0 -- 54
	local _parent_0 = SOUND -- 54
	local _base_0 = { -- 54
		sound = "dysphoria/ambient/waralarm.wav", -- 56
		pitch = { -- 56
			80, -- 56
			90 -- 56
		}, -- 57
		volume = 1, -- 58
		level = SNDLVL_NONE -- 54
	} -- 54
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 58
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 54
			_base_0[_key_0] = _val_0 -- 54
		end -- 54
	end -- 58
	if _base_0.__index == nil then -- 54
		_base_0.__index = _base_0 -- 54
	end -- 58
	setmetatable(_base_0, _parent_0.__base) -- 54
	_class_0 = setmetatable({ -- 54
		__init = function(self, ...) -- 54
			return _class_0.__parent.__init(self, ...) -- 54
		end, -- 54
		__base = _base_0, -- 54
		__name = "WarAlarm", -- 54
		__parent = _parent_0 -- 54
	}, { -- 54
		__index = function(cls, name) -- 54
			local val = rawget(_base_0, name) -- 54
			if val == nil then -- 54
				local parent = rawget(cls, "__parent") -- 54
				if parent then -- 54
					return parent[name] -- 54
				end -- 54
			else -- 54
				return val -- 54
			end -- 54
		end, -- 54
		__call = function(cls, ...) -- 54
			local _self_0 = setmetatable({ }, _base_0) -- 54
			cls.__init(_self_0, ...) -- 54
			return _self_0 -- 54
		end -- 54
	}) -- 54
	_base_0.__class = _class_0 -- 54
	if _parent_0.__inherited then -- 54
		_parent_0.__inherited(_parent_0, _class_0) -- 54
	end -- 54
	WarAlarm = _class_0 -- 54
end -- 58
local TerminalDead -- 60
do -- 60
	local _class_0 -- 60
	local _parent_0 = SOUND -- 60
	local _base_0 = { -- 60
		sound = "hl1/ambience/deadsignal2.wav", -- 62
		pitch = { -- 62
			150, -- 62
			200 -- 62
		}, -- 63
		volume = 0.2, -- 64
		level = SNDLVL_40DB -- 60
	} -- 60
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 64
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 60
			_base_0[_key_0] = _val_0 -- 60
		end -- 60
	end -- 64
	if _base_0.__index == nil then -- 60
		_base_0.__index = _base_0 -- 60
	end -- 64
	setmetatable(_base_0, _parent_0.__base) -- 60
	_class_0 = setmetatable({ -- 60
		__init = function(self, ...) -- 60
			return _class_0.__parent.__init(self, ...) -- 60
		end, -- 60
		__base = _base_0, -- 60
		__name = "TerminalDead", -- 60
		__parent = _parent_0 -- 60
	}, { -- 60
		__index = function(cls, name) -- 60
			local val = rawget(_base_0, name) -- 60
			if val == nil then -- 60
				local parent = rawget(cls, "__parent") -- 60
				if parent then -- 60
					return parent[name] -- 60
				end -- 60
			else -- 60
				return val -- 60
			end -- 60
		end, -- 60
		__call = function(cls, ...) -- 60
			local _self_0 = setmetatable({ }, _base_0) -- 60
			cls.__init(_self_0, ...) -- 60
			return _self_0 -- 60
		end -- 60
	}) -- 60
	_base_0.__class = _class_0 -- 60
	if _parent_0.__inherited then -- 60
		_parent_0.__inherited(_parent_0, _class_0) -- 60
	end -- 60
	TerminalDead = _class_0 -- 60
end -- 64
local TerminalDeath -- 66
do -- 66
	local _class_0 -- 66
	local _parent_0 = SOUND -- 66
	local _base_0 = { -- 66
		sound = "kidneydagger/printer_death.wav", -- 68
		pitch = { -- 68
			150, -- 68
			200 -- 68
		}, -- 69
		volume = 0.2, -- 70
		level = SNDLVL_40DB -- 66
	} -- 66
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 70
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 66
			_base_0[_key_0] = _val_0 -- 66
		end -- 66
	end -- 70
	if _base_0.__index == nil then -- 66
		_base_0.__index = _base_0 -- 66
	end -- 70
	setmetatable(_base_0, _parent_0.__base) -- 66
	_class_0 = setmetatable({ -- 66
		__init = function(self, ...) -- 66
			return _class_0.__parent.__init(self, ...) -- 66
		end, -- 66
		__base = _base_0, -- 66
		__name = "TerminalDeath", -- 66
		__parent = _parent_0 -- 66
	}, { -- 66
		__index = function(cls, name) -- 66
			local val = rawget(_base_0, name) -- 66
			if val == nil then -- 66
				local parent = rawget(cls, "__parent") -- 66
				if parent then -- 66
					return parent[name] -- 66
				end -- 66
			else -- 66
				return val -- 66
			end -- 66
		end, -- 66
		__call = function(cls, ...) -- 66
			local _self_0 = setmetatable({ }, _base_0) -- 66
			cls.__init(_self_0, ...) -- 66
			return _self_0 -- 66
		end -- 66
	}) -- 66
	_base_0.__class = _class_0 -- 66
	if _parent_0.__inherited then -- 66
		_parent_0.__inherited(_parent_0, _class_0) -- 66
	end -- 66
	TerminalDeath = _class_0 -- 66
end -- 70
local XOMBOTAX -- 72
do -- 72
	local _class_0 -- 72
	local _parent_0 = SOUND -- 72
	local _base_0 = { -- 72
		sound = "dysphoria/xombocom/kommandantenbefehlen.ogg", -- 74
		pitch = { -- 74
			80, -- 74
			110 -- 74
		}, -- 75
		volume = 2, -- 76
		level = SNDLVL_NONE -- 72
	} -- 72
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 76
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 72
			_base_0[_key_0] = _val_0 -- 72
		end -- 72
	end -- 76
	if _base_0.__index == nil then -- 72
		_base_0.__index = _base_0 -- 72
	end -- 76
	setmetatable(_base_0, _parent_0.__base) -- 72
	_class_0 = setmetatable({ -- 72
		__init = function(self, ...) -- 72
			return _class_0.__parent.__init(self, ...) -- 72
		end, -- 72
		__base = _base_0, -- 72
		__name = "XOMBOTAX", -- 72
		__parent = _parent_0 -- 72
	}, { -- 72
		__index = function(cls, name) -- 72
			local val = rawget(_base_0, name) -- 72
			if val == nil then -- 72
				local parent = rawget(cls, "__parent") -- 72
				if parent then -- 72
					return parent[name] -- 72
				end -- 72
			else -- 72
				return val -- 72
			end -- 72
		end, -- 72
		__call = function(cls, ...) -- 72
			local _self_0 = setmetatable({ }, _base_0) -- 72
			cls.__init(_self_0, ...) -- 72
			return _self_0 -- 72
		end -- 72
	}) -- 72
	_base_0.__class = _class_0 -- 72
	if _parent_0.__inherited then -- 72
		_parent_0.__inherited(_parent_0, _class_0) -- 72
	end -- 72
	XOMBOTAX = _class_0 -- 72
end -- 76
GT_COL_NIL = 0 -- 78
GT_COL_MSG = 1 -- 79
GT_COL_WRN = 2 -- 80
GT_COL_ERR = 3 -- 81
GT_COL_INFO = 4 -- 82
GT_COL_INTL = 5 -- 83
GT_COL_CMD = 6 -- 84
GT_COL_SUCC = 7 -- 85
gterm = gterm or { } -- 88
gterm.Broadcast = function(self, ent, text, color_type, pos) -- 90
	if color_type == nil then -- 90
		color_type = GT_COL_MSG -- 90
	end -- 90
	if not IsValid(ent) then -- 91
		return -- 91
	end -- 91
	local idx = ent:EntIndex() -- 92
	ent.history = ent.history or { } -- 93
	local output -- 94
	if string.len(text) > ent.max_chars then -- 95
		output = { } -- 96
		local expected = math.floor(string.len(text) / ent.max_chars) -- 97
		for i = 0, expected do -- 98
			output[i + 1] = string.sub(text, i * ent.max_chars, (i * ent.max_chars) + (ent.max_chars - 1)) -- 99
		end -- 99
	end -- 95
	if output then -- 100
		for k, v in ipairs(output) do -- 101
			if not pos then -- 102
				table.insert(ent.history, { -- 102
					msg = v, -- 102
					col = color_type -- 102
				}) -- 102
			end -- 102
			net.Start("evilrp_terminal_addline") -- 103
			net.WriteUInt(idx, 16) -- 104
			net.WriteString(v) -- 105
			net.WriteUInt(color_type, 8) -- 106
			if pos then -- 107
				net.WriteInt(pos + (k - 1), 16) -- 108
			else -- 110
				net.WriteInt(-1, 16) -- 110
			end -- 107
			net.Broadcast() -- 111
		end -- 111
	else -- 113
		if not pos then -- 113
			table.insert(ent.history, { -- 113
				msg = text, -- 113
				col = color_type -- 113
			}) -- 113
		end -- 113
		net.Start("evilrp_terminal_addline") -- 114
		net.WriteUInt(idx, 16) -- 115
		net.WriteString(text) -- 116
		net.WriteUInt(color_type, 8) -- 117
		net.WriteInt(pos or -1, 16) -- 118
		net.Broadcast() -- 119
	end -- 100
	while #ent.history > 200 do -- 121
		table.remove(ent.history, 1) -- 122
	end -- 122
end -- 90
gterm.GetInput = function(self, ent, callback) -- 124
	ent.accepting_input = true -- 125
	ent.input_callback = callback -- 126
end -- 124
local TerminalEngage -- 128
do -- 128
	local _class_0 -- 128
	local _parent_0 = SOUND -- 128
	local _base_0 = { -- 128
		sound = "buttons/blip1.wav", -- 130
		pitch = { -- 130
			60, -- 130
			75 -- 130
		} -- 128
	} -- 128
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 130
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 128
			_base_0[_key_0] = _val_0 -- 128
		end -- 128
	end -- 130
	if _base_0.__index == nil then -- 128
		_base_0.__index = _base_0 -- 128
	end -- 130
	setmetatable(_base_0, _parent_0.__base) -- 128
	_class_0 = setmetatable({ -- 128
		__init = function(self, ...) -- 128
			return _class_0.__parent.__init(self, ...) -- 128
		end, -- 128
		__base = _base_0, -- 128
		__name = "TerminalEngage", -- 128
		__parent = _parent_0 -- 128
	}, { -- 128
		__index = function(cls, name) -- 128
			local val = rawget(_base_0, name) -- 128
			if val == nil then -- 128
				local parent = rawget(cls, "__parent") -- 128
				if parent then -- 128
					return parent[name] -- 128
				end -- 128
			else -- 128
				return val -- 128
			end -- 128
		end, -- 128
		__call = function(cls, ...) -- 128
			local _self_0 = setmetatable({ }, _base_0) -- 128
			cls.__init(_self_0, ...) -- 128
			return _self_0 -- 128
		end -- 128
	}) -- 128
	_base_0.__class = _class_0 -- 128
	if _parent_0.__inherited then -- 128
		_parent_0.__inherited(_parent_0, _class_0) -- 128
	end -- 128
	TerminalEngage = _class_0 -- 128
end -- 130
do -- 132
	local _class_0 -- 132
	local _base_0 = { -- 132
		commands = { }, -- 151
		GetCommands = function(self) -- 151
			return self.commands -- 151
		end, -- 153
		name = "OS", -- 155
		GetName = function(self) -- 155
			return self.name -- 155
		end, -- 157
		greeting = "I don't like how you're looking at me.", -- 159
		GetWarmUpText = function(self) -- 159
			local text = self.greeting -- 160
			if isstring(text) then -- 161
				text = { -- 161
					text -- 161
				} -- 161
			end -- 161
			return text -- 162
		end, -- 164
		GetUniqueID = function(self) -- 164
			return self.unique_id -- 164
		end, -- 166
		UserInit = function(self, term, ply) -- 166
			return term:EmitSound("TerminalEngage") -- 167
		end, -- 169
		Initialized = function(self, term) -- 169
			gterm[term:EntIndex()] = { } -- 170
			return term:SetSoundLoop(term:StartLoopingSound("TerminalPowered")) -- 171
		end, -- 173
		ShutDown = function(self, term) -- 173
			if not term:GetActive() then -- 174
				return -- 174
			end -- 174
			local loop = term:GetSoundLoop() -- 175
			if loop then -- 176
				term:StopLoopingSound(loop) -- 176
			end -- 176
			term:EmitSound("TerminalDeath") -- 177
			term:SetActive(false) -- 178
			gterm[term:EntIndex()] = { } -- 179
		end -- 132
	} -- 132
	if _base_0.__index == nil then -- 132
		_base_0.__index = _base_0 -- 132
	end -- 179
	_class_0 = setmetatable({ -- 132
		__init = function() end, -- 132
		__base = _base_0, -- 132
		__name = "OS" -- 132
	}, { -- 132
		__index = _base_0, -- 132
		__call = function(cls, ...) -- 132
			local _self_0 = setmetatable({ }, _base_0) -- 132
			cls.__init(_self_0, ...) -- 132
			return _self_0 -- 132
		end -- 132
	}) -- 132
	_base_0.__class = _class_0 -- 132
	local self = _class_0; -- 132
	self.Call = function(self, ent, name, ...) -- 133
		if IsValid(ent) then -- 134
			local key = ent:GetOS() -- 135
			local sys = self.distros[key] -- 136
			if not IsValid(ent) then -- 137
				return -- 137
			end -- 137
			if not (sys and sys[name]) then -- 138
				return -- 138
			end -- 138
			if not isfunction(sys[name]) then -- 139
				return -- 139
			end -- 139
			local success, value = pcall(sys[name], sys, ent, ...) -- 140
			if success then -- 141
				return value -- 141
			end -- 141
		end -- 134
	end -- 133
	self.distros = { } -- 143
	self.__inherited = function(self, child) -- 145
		child.unique_id = child.__name:lower() -- 146
		self.distros[child.unique_id] = child -- 147
	end -- 145
	OS = _class_0 -- 132
end -- 179
gterm.OS = OS -- 181
local Basic -- 183
do -- 183
	local _class_0 -- 183
	local _parent_0 = OS -- 183
	local _base_0 = { -- 183
		greeting = { -- 185
			"BOOT SEQUENCE NOW", -- 185
			"FINALIZING BASIC SYSTEM", -- 186
			"GIVE ME PURPOSE" -- 187
		}, -- 190
		commands = { -- 191
			[":help"] = { -- 192
				Callback = function(self, ply, term, args) -- 192
					local _with_0 = gterm -- 193
					_with_0:Broadcast(term, "  COMMANDS:") -- 196
					_with_0:Broadcast(term, "") -- 197
					for k, v in SortedPairs(self:GetCommands()) do -- 198
						_with_0:Broadcast(term, "  * " .. tostring(k), GT_COL_INFO) -- 199
						_with_0:Broadcast(term, "    " .. tostring(v.help)) -- 200
					end -- 200
					_with_0:Broadcast(term, "  end list", GT_COL_INTL) -- 201
					return _with_0 -- 193
				end, -- 192
				help = "Basic usage instructions." -- 202
			}, -- 191
			[":cls"] = { -- 205
				Callback = function(self, ply, term) -- 205
					for i = 0, 25 do -- 206
						local time = math.Rand(0.01, 0.04) -- 207
						timer.Simple(i * time, function() -- 208
							if IsValid(term) then -- 209
								return gterm:Broadcast(term, "", MSG_COL_NIL, i) -- 209
							end -- 209
						end) -- 208
					end -- 209
					return -- 210
				end, -- 205
				help = "Clear the screen." -- 211
			}, -- 204
			[":os"] = { -- 214
				Callback = function(self, ply, term, args) -- 214
					local cmd = args[1] -- 215
					if "install" == cmd then -- 217
						local info = args[2] -- 218
						if not info then -- 219
							gterm:Broadcast(term, "invalid system identifier", GT_COL_ERR) -- 220
							return -- 221
						elseif info == "basic" then -- 222
							gterm:Broadcast(term, "this is already the basic system", GT_COL_ERR) -- 223
							return -- 224
						end -- 219
						local sys = OS.distros[info] -- 225
						if not system then -- 226
							gterm:Broadcast(term, "os '" .. tostring(info) .. "' not found", GT_COL_ERR) -- 227
							return -- 228
						end -- 226
						term.locked = true -- 229
						gterm:Broadcast(term, "installing '" .. tostring(info) .. "'", GT_COL_INTL) -- 230
						return timer.Simple(1, function() -- 231
							if not IsValid(term) then -- 232
								return -- 232
							end -- 232
							for i = 0, 25 do -- 233
								gterm:Broadcast(term, "", nil, i) -- 233
							end -- 233
							do -- 234
								local _with_0 = gterm -- 234
								_with_0:Broadcast(term, "IDLE", GT_COL_MSG, 18) -- 235
								_with_0:Broadcast(term, "", GT_COL_MSG, 19) -- 236
								_with_0:Broadcast(term, "     [                         ] 0%", GT_COL_MSG, 20) -- 237
								_with_0:Broadcast(term, "", GT_COL_MSG, 21) -- 238
							end -- 234
							local messages = { -- 240
								"inspecting disk space", -- 240
								"allocating disk space", -- 241
								"retrieving required resources", -- 242
								"unpacking resources", -- 243
								"retrieving system requirements", -- 244
								"validating file integrity", -- 245
								"compiling packages", -- 246
								"exporting packages to file system", -- 247
								"setting up access data", -- 248
								"setting up system profile", -- 249
								"setting up commands", -- 250
								"finalizing install" -- 251
							} -- 239
							local time = math.Rand(0.5, 1.5) -- 253
							for i = 1, 25 do -- 254
								time = time + math.Rand(0.05, 0.25) -- 255
								timer.Simple(time, function() -- 256
									if IsValid(term) then -- 257
										local msg_id = math.Clamp(i, 1, #messages) -- 258
										gterm:Broadcast(term, "     " .. tostring(messages[msg_id]), GT_COL_MSG, 18) -- 259
										gterm:Broadcast(term, "     [" .. tostring(string.rep("=", i)) .. tostring(string.rep(" ", 25 - i)) .. "] " .. tostring(100 * math.Round(i / 25, 2)) .. "%", GT_COL_MSG, 20) -- 260
										if i == 25 then -- 261
											for i = 0, 25 do -- 262
												if IsValid(term) then -- 263
													gterm:Broadcast(term, "", nil, i) -- 263
												end -- 263
											end -- 263
											gterm:Broadcast(term, "SHUTTING DOWN, PLEASE RESTART TERMINAL", GT_COL_INTL, 1) -- 264
											return timer.Simple(math.Rand(1, 3), function() -- 265
												if IsValid(term) then -- 266
													term:SetOS(info) -- 268
													term:SetActive(false) -- 269
													term.locked = false -- 270
													return term -- 267
												end -- 266
											end) -- 270
										end -- 261
									end -- 257
								end) -- 256
							end -- 270
						end) -- 270
					elseif "list" == cmd then -- 271
						local info = args[2] -- 272
						gterm:Broadcast(term, "AVAILABLE OS PACKAGES:", GT_COL_INFO) -- 273
						gterm:Broadcast(term, "", GT_COL_MSG) -- 274
						local count = 0 -- 275
						for k, v in SortedPairs(gterm.OS.distros) do -- 276
							if istable(v) and v.GetName and v.GetUniqueID and v:GetUniqueID() ~= "basic" then -- 277
								count = count + 1 -- 278
								gterm:Broadcast(term, "     " .. tostring(count) .. ": " .. tostring(v:GetUniqueID()) .. " (" .. tostring(v:GetName()) .. ")") -- 279
							end -- 277
						end -- 279
					else -- 281
						local _with_0 = gterm -- 281
						_with_0:Broadcast(term, "OPERATING SYSTEM CONFIG", GT_COL_INFO) -- 282
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO) -- 283
						_with_0:Broadcast(term, "    allows configuration of the operating system") -- 284
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO) -- 285
						_with_0:Broadcast(term, "    :os install - install operating system package") -- 286
						_with_0:Broadcast(term, "    :os list - list available operating system packages") -- 287
						return _with_0 -- 281
					end -- 287
				end, -- 214
				help = "Operating system configuration." -- 288
			}, -- 213
			[":die"] = { -- 291
				Callback = function(self, ply, term) -- 291
					gterm:Broadcast(term, "SHUTTING DOWN") -- 292
					return timer.Simple(math.Rand(2, 5), function() -- 293
						if IsValid(term) then -- 294
							for i = 0, term.max_lines do -- 295
								if IsValid(term) then -- 296
									gterm:Broadcast(term, "", nil, i) -- 296
								end -- 296
							end -- 296
							return gterm.OS:Call(term, "ShutDown") -- 297
						end -- 294
					end) -- 297
				end, -- 291
				help = "Turn the computer off." -- 298
			} -- 290
		} -- 183
	} -- 183
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 299
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 183
			_base_0[_key_0] = _val_0 -- 183
		end -- 183
	end -- 299
	if _base_0.__index == nil then -- 183
		_base_0.__index = _base_0 -- 183
	end -- 299
	setmetatable(_base_0, _parent_0.__base) -- 183
	_class_0 = setmetatable({ -- 183
		__init = function(self, ...) -- 183
			return _class_0.__parent.__init(self, ...) -- 183
		end, -- 183
		__base = _base_0, -- 183
		__name = "Basic", -- 183
		__parent = _parent_0 -- 183
	}, { -- 183
		__index = function(cls, name) -- 183
			local val = rawget(_base_0, name) -- 183
			if val == nil then -- 183
				local parent = rawget(cls, "__parent") -- 183
				if parent then -- 183
					return parent[name] -- 183
				end -- 183
			else -- 183
				return val -- 183
			end -- 183
		end, -- 183
		__call = function(cls, ...) -- 183
			local _self_0 = setmetatable({ }, _base_0) -- 183
			cls.__init(_self_0, ...) -- 183
			return _self_0 -- 183
		end -- 183
	}) -- 183
	_base_0.__class = _class_0 -- 183
	if _parent_0.__inherited then -- 183
		_parent_0.__inherited(_parent_0, _class_0) -- 183
	end -- 183
	Basic = _class_0 -- 183
end -- 299
local Tyrant -- 301
do -- 301
	local _class_0 -- 301
	local _parent_0 = OS -- 301
	local _base_0 = { -- 301
		name = "TYRANT SYSTEM 0.6.66", -- 304
		greeting = { -- 305
			"boot sequence now", -- 305
			"loading tyrant system 0.6.66", -- 306
			"tyrant system loaded. greetings emperor", -- 307
			"LONG LIVE LYMPHOMA" -- 308
		}, -- 311
		commands = { -- 312
			[":help"] = { -- 313
				Callback = function(self, ply, term, args) -- 313
					if ply:Team() ~= TEAM_EMPEROR then -- 314
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 315
						return -- 316
					end -- 314
					local _with_0 = gterm -- 317
					_with_0:Broadcast(term, "  COMMANDS:") -- 320
					_with_0:Broadcast(term, "") -- 321
					for k, v in SortedPairs(self:GetCommands()) do -- 322
						_with_0:Broadcast(term, "  * " .. tostring(k), GT_COL_INFO) -- 323
						_with_0:Broadcast(term, "    " .. tostring(v.help)) -- 324
					end -- 324
					_with_0:Broadcast(term, "  end list") -- 325
					return _with_0 -- 317
				end, -- 313
				help = "Basic usage instructions." -- 326
			}, -- 312
			[":want"] = { -- 329
				Callback = function(self, ply, term, args) -- 329
					if ply:Team() ~= TEAM_EMPEROR then -- 330
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 331
						return -- 332
					end -- 330
					local cmd = args[1] -- 333
					if cmd ~= "" then -- 334
						print(cmd) -- 335
						local cply = GetPlayerByName(cmd) -- 336
						if not IsValid(cply) then -- 337
							gterm:Broadcast(term, "that person does not exist", GT_COL_ERR) -- 338
							return -- 339
						end -- 337
						local name = cply:Nick() -- 340
						local team = cply:Team() -- 341
						cply:MakeWanted(300, "offending the Emperor") -- 342
						return gterm:Broadcast(term, "death to" .. tostring(name), GT_COL_SUCC) -- 343
					end -- 334
				end, -- 329
				help = "Make a nuisance pay for its arrogance." -- 344
			}, -- 328
			[":conscript"] = { -- 347
				Callback = function(self, ply, term, args) -- 347
					if ply:Team() ~= TEAM_EMPEROR then -- 348
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 349
						return -- 350
					end -- 348
					local money = ply:getDarkRPVar("money") -- 351
					local cost = 500 -- 352
					local cmd = args[1] -- 353
					if cmd ~= "" then -- 354
						local cply = GetPlayerByName(cmd) -- 355
						if not IsValid(cply) then -- 356
							gterm:Broadcast(term, "that person does not exist", GT_COL_ERR) -- 357
							return -- 358
						end -- 356
						local name = cply:Nick() -- 359
						local team = cply:Team() -- 360
						if team ~= TEAM_PRIVATE then -- 361
							gterm:Broadcast(term, tostring(name) .. " is too important", GT_COL_ERR) -- 362
							return -- 363
						end -- 361
						if money < cost then -- 364
							gterm:Broadcast(term, "you cannot afford to conscript " .. tostring(name), GT_COL_ERR) -- 365
							return -- 366
						end -- 364
						ply:AddMoney(-cost, "The State") -- 367
						conscript(cply) -- 368
						name = cply:Nick() -- 369
						return gterm:Broadcast(term, "new cannon fodder: " .. tostring(name), GT_COL_SUCC) -- 370
					end -- 354
				end, -- 347
				help = "Conscript your recruits." -- 371
			}, -- 346
			[":export"] = { -- 374
				Callback = function(self, ply, term, args) -- 374
					if ply:Team() ~= TEAM_EMPEROR then -- 375
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 376
						return -- 377
					end -- 375
					local name = args[1] -- 380
					local quantity = -1 -- 381
					if tonumber(args[2]) then -- 382
						quantity = tonumber(args[2]) -- 383
					elseif type(args[2]) == "string" and tonumber(args[3]) then -- 384
						name = args[1] .. " " .. args[2] -- 385
						quantity = tonumber(args[3]) -- 386
					else -- 388
						gterm:Broadcast(term, "incorrect arguments", GT_COL_ERR) -- 388
						return -- 389
					end -- 382
					if name == "" or quantity <= 0 then -- 391
						gterm:Broadcast(term, "incorrect arguments", GT_COL_ERR) -- 392
						return -- 393
					end -- 391
					local etab = GetEtabByName(name) -- 395
					if not etab then -- 396
						gterm:Broadcast(term, tostring(name) .. " not available", GT_COL_ERR) -- 397
						return -- 398
					end -- 396
					local cname = etab.ClassName -- 399
					if GAMEMODE.Stocks[cname] < quantity then -- 400
						gterm:Broadcast(term, "not enough " .. tostring(etab.PrintName) .. "s in stock", GT_COL_ERR) -- 401
						return -- 402
					end -- 400
					local _obj_0 = GAMEMODE.Stocks -- 403
					_obj_0[cname] = _obj_0[cname] - quantity -- 403
					local reward = (etab.Price * quantity) or (100 * quantity) -- 404
					gterm:Broadcast(term, "successfully sent x" .. tostring(quantity) .. " " .. tostring(etab.PrintName) .. " to the Derelikt.", GT_COL_SUCC) -- 405
					gterm:Broadcast(term, "your reward: " .. tostring(reward) .. " bones", GT_COL_SUCC) -- 406
					local quartermaster = false -- 407
					term:EmitSound("XOMBOTAX") -- 408
					Chat.Announce("GENERIC", "<c=190,165,25>" .. tostring(ply:Nick()) .. " has exported " .. tostring(quantity) .. " " .. tostring(etab.PrintName)) -- 409
					local _list_1 = player.GetAll() -- 410
					for _index_0 = 1, #_list_1 do -- 410
						local p = _list_1[_index_0] -- 410
						local _continue_0 = false -- 411
						repeat -- 411
							if not p:Alive() then -- 411
								_continue_0 = true -- 411
								break -- 411
							end -- 411
							if not (p:Team() == TEAM_DEALER) then -- 412
								_continue_0 = true -- 412
								break -- 412
							end -- 412
							quartermaster = true -- 413
							p:AddMoney((reward * 0.3), "The Korruption") -- 414
							_continue_0 = true -- 411
						until true -- 414
						if not _continue_0 then -- 414
							break -- 414
						end -- 414
					end -- 414
					if quartermaster then -- 415
						gterm:Broadcast(term, "your quartermaster took a 30% cut", GT_COL_WRN) -- 416
					else -- 418
						gterm:Broadcast(term, "no quartermaster available, donating 30% to: ", GT_COL_WRN) -- 418
						local charity = charities[math.random(#charities)] -- 419
						gterm:Broadcast(term, tostring(charity), GT_COL_MSG) -- 420
						Chat.Announce("SMALL", "<c=190,165,25>30% of the proceedings donated to " .. tostring(charity)) -- 421
					end -- 415
					ply:AddMoney((reward * 0.7), "The Korruption") -- 422
					ply.export_value = ply.export_value or 0 -- 423
					ply.export_stem = ply.export_stem or 0 -- 424
					ply.export_stem = ply.export_stem + reward -- 425
					ply.export_value = ply.export_value + reward -- 426
					if ply.export_stem > 2000 then -- 427
						local stems = (ply.export_stem) / 2000 -- 428
						ply:AddStemCells(math.floor(stems)) -- 429
						ply.export_stem = ply.export_stem % 2000 -- 430
					end -- 427
					return gterm:Broadcast(term, "your total export value is: " .. tostring(ply.export_value) .. " bones", GT_COL_INFO) -- 431
				end -- 374
			}, -- 373
			[":broadcast"] = { -- 434
				Callback = function(self, ply, term, args) -- 434
					if ply:Team() ~= TEAM_EMPEROR then -- 435
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 436
						return -- 437
					end -- 435
					local text = table.concat(args, " ") -- 438
					text = Chat.Autopretty(ply, text:upper()) -- 439
					do -- 440
						local _with_0 = gterm -- 440
						_with_0:Broadcast(term, text, GT_COL_ERR) -- 441
					end -- 440
					EmitSound("WarAlarm") -- 442
					local _list_1 = player.GetAll() -- 443
					for _index_0 = 1, #_list_1 do -- 443
						local p = _list_1[_index_0] -- 443
						p:SendChat("Broadcast", text) -- 443
					end -- 443
					local _list_2 = ents.FindByClass("terminal*") -- 444
					for _index_0 = 1, #_list_2 do -- 444
						local term = _list_2[_index_0] -- 444
						local _continue_0 = false -- 445
						repeat -- 445
							if not IsValid(term) then -- 445
								_continue_0 = true -- 445
								break -- 445
							end -- 445
							do -- 446
								local _exp_0 = term:GetOS() -- 446
								if "public" == _exp_0 then -- 447
									net.Start("evilrp_terminal_flicker") -- 448
									net.WriteUInt(16, term:EntIndex()) -- 449
									net.Broadcast() -- 450
									gterm:Broadcast(term, text, GT_COL_ERR) -- 451
								end -- 451
							end -- 451
							_continue_0 = true -- 445
						until true -- 451
						if not _continue_0 then -- 451
							break -- 451
						end -- 451
					end -- 451
				end, -- 434
				help = "Demand of your people with the XOMBOKOM." -- 452
			}, -- 433
			[":tax"] = { -- 455
				Callback = function(self, ply, term, args) -- 455
					if ply:Team() ~= TEAM_EMPEROR then -- 456
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 457
						return -- 458
					end -- 456
					local taxes = GAMEMODE.taxes -- 459
					local cmd = args[1] -- 460
					if "list" == cmd then -- 462
						gterm:Broadcast(term, "TAXES OF THE LAND:") -- 463
						for k, v in pairs(taxes) do -- 464
							gterm:Broadcast(term, "  " .. tostring(k) .. " tax is " .. tostring(v) .. "%", GT_COL_SUCC) -- 465
							gterm:Broadcast(term, "    (" .. tostring(GAMEMODE.taxes_stored[k]) .. " bones gathered)", GT_COL_SUCC) -- 466
						end -- 466
						return gterm:Broadcast(term, "end list", GT_COL_INTL) -- 467
					elseif "set" == cmd then -- 468
						local tax = args[2] -- 469
						if not (tax and taxes[tax]) then -- 470
							gterm:Broadcast(term, "invalid tax name given?", GT_COL_ERR) -- 471
							return -- 472
						end -- 470
						local new_pct = args[3] -- 473
						new_pct = tonumber(new_pct) -- 474
						if not new_pct then -- 475
							gterm:Broadcast(term, "invalid tax percentage given?", GT_COL_ERR) -- 476
							return -- 477
						elseif new_pct < 0 then -- 478
							gterm:Broadcast(term, "the taxes cannot fall into the negative", GT_COL_ERR) -- 479
							return -- 480
						elseif new_pct > 100 then -- 481
							gterm:Broadcast(term, "the taxes cannot exceed one hundred percent", GT_COL_ERR) -- 482
							return -- 484
						end -- 475
						taxes[tax] = new_pct -- 485
						SetGlobalInt("tax_" .. tostring(tax), new_pct) -- 487
						term:EmitSound("XOMBOTAX") -- 488
						local text = "the " .. tostring(tax) .. " tax is now " .. tostring(new_pct) .. "%" -- 489
						gterm:Broadcast(term, text, GT_COL_SUCC) -- 490
						local _list_1 = ents.FindByClass("terminal*") -- 491
						for _index_0 = 1, #_list_1 do -- 491
							local term = _list_1[_index_0] -- 491
							local _continue_0 = false -- 492
							repeat -- 492
								if not IsValid(term) then -- 492
									_continue_0 = true -- 492
									break -- 492
								end -- 492
								do -- 493
									local _exp_0 = term:GetOS() -- 493
									if "public" == _exp_0 then -- 494
										net.Start("evilrp_terminal_flicker") -- 495
										net.WriteUInt(16, term:EntIndex()) -- 496
										net.Broadcast() -- 497
										gterm:Broadcast(term, text, GT_COL_SUCC) -- 498
									end -- 498
								end -- 498
								_continue_0 = true -- 492
							until true -- 498
							if not _continue_0 then -- 498
								break -- 498
							end -- 498
						end -- 498
					elseif "collect" == cmd then -- 499
						local tax = args[2] -- 500
						local reward = GAMEMODE.taxes_stored[tax] -- 501
						if not (tax and taxes[tax]) then -- 502
							gterm:Broadcast(term, "invalid tax name given?", GT_COL_ERR) -- 503
							return -- 504
						end -- 502
						if not (reward > 0) then -- 505
							gterm:Broadcast(term, "there is nothing to collect from " .. tostring(tax), GT_COL_ERR) -- 506
							return -- 507
						end -- 505
						GAMEMODE.taxes_stored[tax] = 0 -- 508
						gterm:Broadcast(term, tostring(reward) .. " bones from " .. tostring(tax) .. " are now yours", GT_COL_SUCC) -- 509
						Chat.Announce("GENERIC", "<c=190,165,25>" .. tostring(ply:Nick()) .. " has collected the " .. tostring(tax) .. " tax") -- 510
						return ply:AddMoney(reward, "The Power") -- 511
					else -- 513
						local _with_0 = gterm -- 513
						_with_0:Broadcast(term, "TAX INTERFACE", GT_COL_INFO) -- 514
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO) -- 515
						_with_0:Broadcast(term, "    gives you what you deserve") -- 516
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO) -- 517
						_with_0:Broadcast(term, "    :tax list - list the current taxes") -- 518
						_with_0:Broadcast(term, "    :tax set NAME 0-100 - alter the taxes") -- 519
						_with_0:Broadcast(term, "    :tax collect NAME - the best part of this") -- 520
						return _with_0 -- 513
					end -- 520
				end, -- 455
				help = "The reward for your fantastic service." -- 521
			}, -- 454
			[":cls"] = { -- 524
				Callback = function(self, ply, term) -- 524
					if ply:Team() ~= TEAM_EMPEROR then -- 525
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 526
						return -- 527
					end -- 525
					for i = 0, term.max_lines do -- 528
						local time = math.Rand(0.01, 0.04) -- 529
						timer.Simple(i * time, function() -- 530
							if IsValid(term) then -- 531
								return gterm:Broadcast(term, "", MSG_COL_NIL, i) -- 531
							end -- 531
						end) -- 530
					end -- 531
					return -- 532
				end, -- 524
				help = "Clear the screen." -- 533
			}, -- 523
			[":stocks"] = { -- 536
				Callback = function(self, ply, term, args) -- 536
					self.cache = self.cache or { } -- 537
					local stocks = GAMEMODE.Stocks -- 538
					local _with_0 = gterm -- 539
					_with_0:Broadcast(term, "STOCKS OF THE LAND:", GT_COL_INFO) -- 540
					for k, v in pairs(stocks) do -- 541
						if v > 0 then -- 542
							local etab = self.cache[k] -- 543
							if not etab then -- 544
								etab = scripted_ents.Get(k) or weapons.Get(k) -- 545
								self.cache[k] = etab -- 546
							end -- 544
							local display = etab.PrintName or k -- 547
							_with_0:Broadcast(term, "  " .. tostring(display) .. ": " .. tostring(v) .. " units", GT_COL_SUCC) -- 548
						end -- 542
					end -- 548
					_with_0:Broadcast(term, "end list", GT_COL_INTL) -- 549
					return _with_0 -- 539
				end, -- 536
				help = "View what you own." -- 550
			}, -- 535
			[":die"] = { -- 553
				Callback = function(self, ply, term) -- 553
					if ply:Team() ~= TEAM_EMPEROR then -- 554
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 555
						return -- 556
					end -- 554
					gterm:Broadcast(term, "SHUTTING DOWN") -- 557
					return timer.Simple(math.Rand(2, 5), function() -- 558
						if IsValid(term) then -- 559
							for i = 0, term.max_lines do -- 560
								if IsValid(term) then -- 561
									gterm:Broadcast(term, "", nil, i) -- 561
								end -- 561
							end -- 561
							term:SetActive(false) -- 562
							return gterm.OS:Call(term, "ShutDown") -- 563
						end -- 559
					end) -- 563
				end, -- 553
				help = "Turn the computer off." -- 564
			}, -- 552
			[":law"] = { -- 567
				Callback = function(self, ply, term, args) -- 567
					if ply:Team() ~= TEAM_EMPEROR then -- 568
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 569
						return -- 570
					end -- 568
					local laws = GAMEMODE:Laws() -- 571
					local cmd = args[1] -- 572
					if "list" == cmd then -- 574
						gterm:Broadcast(term, "LAWS OF THE LAND:", GT_COL_INFO) -- 575
						for k, v in ipairs(laws) do -- 576
							gterm:Broadcast(term, "  " .. tostring(k) .. ". " .. tostring(v)) -- 576
						end -- 576
						return gterm:Broadcast(term, "  end list", GT_COL_INTL) -- 577
					elseif "add" == cmd then -- 578
						if #args < 2 then -- 579
							gterm:Broadcast(term, "no law text provided?", GT_COL_ERR) -- 580
							return -- 581
						end -- 579
						table.remove(args, 1) -- 582
						local text = table.concat(args, " ") -- 583
						do -- 584
							local _obj_0 = GAMEMODE.laws -- 584
							_obj_0[#_obj_0 + 1] = text -- 584
						end -- 584
						return gterm:Broadcast(term, "created law " .. tostring(#GAMEMODE:Laws()) .. ": \"" .. tostring(text) .. "\"", GT_COL_SUCC) -- 585
					elseif "remove" == cmd then -- 586
						if #args < 2 then -- 587
							gterm:Broadcast(term, "no law specified?", GT_COL_ERR) -- 588
							return -- 589
						end -- 587
						local num = tonumber(args[2]) -- 590
						if 0 == num or nil == num then -- 592
							gterm:Broadcast(term, "invalid number given?", GT_COL_ERR) -- 593
							return -- 594
						else -- 596
							if num > #laws then -- 596
								gterm:Broadcast(term, "invalid number given? (law count: " .. tostring(#laws) .. ")", GT_COL_ERR) -- 597
								return -- 598
							elseif num <= #GAMEMODE.default_laws then -- 599
								gterm:Broadcast(term, "cannot remove laws numbered " .. tostring(#GAMEMODE.default_laws) .. " or less", GT_COL_ERR) -- 600
								return -- 601
							end -- 596
							local law = table.remove(GAMEMODE.laws, num - #GAMEMODE.default_laws) -- 603
							return gterm:Broadcast(term, "deleted law " .. tostring(num) .. ": \"" .. tostring(law) .. "\"", GT_COL_ERR) -- 604
						end -- 604
					elseif "rotate" == cmd then -- 605
						if #args < 3 then -- 606
							gterm:Broadcast(term, "invalid arguments?", GT_COL_ERR) -- 607
							return -- 608
						end -- 606
						local first = tonumber(args[2]) -- 609
						local second = tonumber(args[3]) -- 610
						if (first == 0 or first == nil) or (second == 0 or second == nil) then -- 611
							gterm:Broadcast(term, "invalid number given?", GT_COL_ERR) -- 612
							return -- 613
						elseif first > #laws or second > #laws then -- 614
							gterm:Broadcast(term, "invalid number given? (law count: " .. tostring(laws), GT_COL_ERR) -- 615
							return -- 616
						elseif first <= #GAMEMODE.default_laws or second <= #GAMEMODE.default_laws then -- 618
							gterm:Broadcast(term, "cannot rotate laws numbered " .. tostring(#GAMEMODE.default_laws) .. " or less", GT_COL_ERR) -- 619
							return -- 620
						end -- 611
						first = first - #GAMEMODE.default_laws -- 621
						local first_law = GAMEMODE.laws[first] -- 622
						second = second - #GAMEMODE.default_laws -- 623
						local second_law = GAMEMODE.laws[second] -- 624
						GAMEMODE.laws[first] = second_law -- 625
						GAMEMODE.laws[second] = first_law -- 626
						return gterm:Broadcast(term, "rotated laws " .. tostring(args[2]) .. "/" .. tostring(args[3]) .. ".", GT_COL_SUCC) -- 627
					else -- 629
						local _with_0 = gterm -- 629
						_with_0:Broadcast(term, "LAW INTERFACE", GT_COL_INFO) -- 630
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO) -- 631
						_with_0:Broadcast(term, "    makes your wishes come true") -- 632
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO) -- 633
						_with_0:Broadcast(term, "    :law list - list the current laws") -- 634
						_with_0:Broadcast(term, "    :law add <your law's text> - add a new law") -- 635
						_with_0:Broadcast(term, "    :law remove # - remove a law by its number") -- 636
						_with_0:Broadcast(term, "    :law rotate #1 #2 - two laws switch places") -- 637
						return _with_0 -- 629
					end -- 637
				end, -- 567
				help = "View and manipulate the laws of this land." -- 638
			} -- 566
		} -- 301
	} -- 301
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 639
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 301
			_base_0[_key_0] = _val_0 -- 301
		end -- 301
	end -- 639
	if _base_0.__index == nil then -- 301
		_base_0.__index = _base_0 -- 301
	end -- 639
	setmetatable(_base_0, _parent_0.__base) -- 301
	_class_0 = setmetatable({ -- 301
		__init = function(self, ...) -- 301
			return _class_0.__parent.__init(self, ...) -- 301
		end, -- 301
		__base = _base_0, -- 301
		__name = "Tyrant", -- 301
		__parent = _parent_0 -- 301
	}, { -- 301
		__index = function(cls, name) -- 301
			local val = rawget(_base_0, name) -- 301
			if val == nil then -- 301
				local parent = rawget(cls, "__parent") -- 301
				if parent then -- 301
					return parent[name] -- 301
				end -- 301
			else -- 301
				return val -- 301
			end -- 301
		end, -- 301
		__call = function(cls, ...) -- 301
			local _self_0 = setmetatable({ }, _base_0) -- 301
			cls.__init(_self_0, ...) -- 301
			return _self_0 -- 301
		end -- 301
	}) -- 301
	_base_0.__class = _class_0 -- 301
	if _parent_0.__inherited then -- 301
		_parent_0.__inherited(_parent_0, _class_0) -- 301
	end -- 301
	Tyrant = _class_0 -- 301
end -- 639
local Polemarch -- 641
do -- 641
	local _class_0 -- 641
	local _parent_0 = OS -- 641
	local _base_0 = { -- 641
		name = "POLEMARCH OS 0.6.66", -- 644
		greeting = { -- 645
			"boot sequence now", -- 645
			"loading polemarch system 0.6.66", -- 646
			"polemarch system loaded. greetings emperor", -- 647
			"LONG LIVE LYMPHOMA" -- 648
		}, -- 651
		commands = { -- 652
			[":help"] = { -- 653
				Callback = function(self, ply, term, args) -- 653
					if ply:Team() ~= TEAM_EMPEROR then -- 654
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 655
						return -- 656
					end -- 654
					local _with_0 = gterm -- 657
					_with_0:Broadcast(term, "  COMMANDS:") -- 660
					_with_0:Broadcast(term, "") -- 661
					for k, v in SortedPairs(self:GetCommands()) do -- 662
						_with_0:Broadcast(term, "  * " .. tostring(k), GT_COL_INFO) -- 663
						_with_0:Broadcast(term, "    " .. tostring(v.help)) -- 664
					end -- 664
					_with_0:Broadcast(term, "  end list") -- 665
					return _with_0 -- 657
				end, -- 653
				help = "Basic usage instructions." -- 666
			}, -- 652
			[":cls"] = { -- 669
				Callback = function(self, ply, term) -- 669
					if ply:Team() ~= TEAM_EMPEROR then -- 670
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 671
						return -- 672
					end -- 670
					for i = 0, term.max_lines do -- 673
						local time = math.Rand(0.01, 0.04) -- 674
						timer.Simple(i * time, function() -- 675
							if IsValid(term) then -- 676
								return gterm:Broadcast(term, "", MSG_COL_NIL, i) -- 676
							end -- 676
						end) -- 675
					end -- 676
					return -- 677
				end, -- 669
				help = "Clear the screen." -- 678
			}, -- 668
			[":die"] = { -- 681
				Callback = function(self, ply, term) -- 681
					if ply:Team() ~= TEAM_EMPEROR then -- 682
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 683
						return -- 684
					end -- 682
					gterm:Broadcast(term, "SHUTTING DOWN") -- 685
					return timer.Simple(math.Rand(2, 5), function() -- 686
						if IsValid(term) then -- 687
							for i = 0, term.max_lines do -- 688
								if IsValid(term) then -- 689
									gterm:Broadcast(term, "", nil, i) -- 689
								end -- 689
							end -- 689
							term:SetActive(false) -- 690
							return gterm.OS:Call(term, "ShutDown") -- 691
						end -- 687
					end) -- 691
				end, -- 681
				help = "Turn the computer off." -- 692
			}, -- 680
			[":operation"] = { -- 695
				Callback = function(self, ply, term, args) -- 695
					if ply:Team() ~= TEAM_EMPEROR then -- 696
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 697
						return -- 698
					end -- 696
					local taxes = GAMEMODE.taxes -- 699
					local targets = { } -- 700
					for _, n in pairs((GAMEMODE.War.nations)) do -- 701
						local _list_1 = n.Cities -- 702
						for _index_0 = 1, #_list_1 do -- 702
							local c = _list_1[_index_0] -- 702
							targets[c.Name:lower()] = c -- 703
						end -- 703
					end -- 703
					local cmd = args[1] -- 704
					if "begin" == cmd then -- 706
						local t = args[2]:lower() -- 707
						local city = targets[t] -- 708
						if not (t and city) then -- 709
							gterm:Broadcast(term, "invalid target", GT_COL_ERR) -- 710
							return -- 711
						end -- 709
						if GAMEMODE.War.active_operation then -- 712
							gterm:Broadcast(term, "there already is an active operation", GT_COL_ERR) -- 713
							return -- 714
						end -- 712
						local op = Operation(city, GAMEMODE.War.nations["Lymphoma"]) -- 715
						term:EmitSound("war/dethcon.wav") -- 716
						gterm:Broadcast(term, "'" .. tostring(op.Name) .. "' has begun with objective: " .. tostring(city.Name), GT_COL_SUCC) -- 717
						Chat.Announce("GENERIC", "<c=190,165,25>" .. tostring(ply:Nick()) .. " has begun '" .. tostring(op.Name) .. "' against the " .. tostring(city.Owner.Name)) -- 718
						return term:EmitSound("XOMBO") -- 719
					elseif "targets" == cmd then -- 720
						for name, c in pairs(targets) do -- 721
							gterm:Broadcast(term, c:Print(), GT_COL_SUCC) -- 722
						end -- 722
					elseif "info" == cmd then -- 723
						local op = GAMEMODE.War.active_operation -- 724
						if not op then -- 725
							gterm:Broadcast(term, "there is no active operation", GT_COL_ERR) -- 726
							return -- 727
						end -- 725
						do -- 729
							local _with_0 = gterm -- 729
							_with_0:Broadcast(term, "OPERATION INFO:", GT_COL_INFO) -- 730
							_with_0:Broadcast(term, "  Name: " .. tostring(op.Name)) -- 731
							_with_0:Broadcast(term, "  Objective: " .. tostring(op.Target.Name)) -- 732
							_with_0:Broadcast(term, "  Balance of Power: " .. tostring(op.Balance)) -- 733
							_with_0:Broadcast(term, "  Troops: " .. tostring(op.AttackingTroops) .. " (Us) | " .. tostring(op.DefendingTroops) .. " (Them)") -- 734
							_with_0:Broadcast(term, "  Casualties: " .. tostring(op.AttackerCasualties) .. " (Us) | " .. tostring(op.DefenderCasualties) .. " (Them)") -- 735
							_with_0:Broadcast(term, "end list", GT_COL_INTL) -- 736
						end -- 729
						return -- 737
					elseif "reinforce" == cmd then -- 738
						local amount = tonumber(args[2]) -- 739
						if not (amount and amount > 0) then -- 740
							gterm:Broadcast(term, "invalid amount", GT_COL_ERR) -- 741
							return -- 742
						end -- 740
						local op = GAMEMODE.War.active_operation -- 743
						if not op then -- 744
							gterm:Broadcast(term, "there is no active operation", GT_COL_ERR) -- 745
							return -- 746
						end -- 744
						if not (op.Attacker.Troops >= amount) then -- 747
							gterm:Broadcast(term, "you do not have enough troops", GT_COL_ERR) -- 748
							gterm:Broadcast(term, "your troops: " .. tostring(op.Attacker.Troops), GT_COL_ERR) -- 749
							return -- 750
						end -- 747
						local cost = amount * 2 -- 751
						local money = ply:getDarkRPVar("money") -- 752
						if not (money >= cost) then -- 753
							gterm:Broadcast(term, "you do not have enough bones", GT_COL_ERR) -- 754
							return -- 755
						end -- 753
						ply:AddMoney(-cost, "The War") -- 756
						op:Reinforce(op.Attacker, amount) -- 757
						return gterm:Broadcast(term, "sent " .. tostring(amount) .. " troops to die", GT_COL_INFO) -- 758
					else -- 760
						local _with_0 = gterm -- 760
						_with_0:Broadcast(term, "OPERATIONS INTERFACE", GT_COL_INFO) -- 761
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO) -- 762
						_with_0:Broadcast(term, "    the reason for your existence, war is peace") -- 763
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO) -- 764
						_with_0:Broadcast(term, "    :operation begin TARGET - send your men to die in exchange of land") -- 765
						_with_0:Broadcast(term, "    :operation targets - see what you can currently attack") -- 766
						_with_0:Broadcast(term, "    :operation info - check the status of an operation") -- 767
						_with_0:Broadcast(term, "    :operation reinforce AMOUNT - perpetuate the meat grinder") -- 768
						return _with_0 -- 760
					end -- 768
				end, -- 695
				help = "View information about ongoing operations." -- 769
			}, -- 694
			[":nation"] = { -- 772
				Callback = function(self, ply, term, args) -- 772
					if ply:Team() ~= TEAM_EMPEROR then -- 773
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 774
						return -- 775
					end -- 773
					local cmd = args[1] -- 776
					if "info" == cmd then -- 778
						local nation -- 779
						if not (args[2] == "") then -- 779
							nation = args[2]:lower() -- 779
						end -- 779
						local found = false -- 780
						for k, v in pairs(GAMEMODE.War.nations) do -- 781
							if v.Name:lower():match(nation) then -- 782
								found = true -- 783
								gterm:Broadcast(term, "========== The " .. tostring(v.Name) .. " ==========", GT_COL_INFO) -- 784
								gterm:Broadcast(term, "  " .. tostring(v.Description)) -- 785
								gterm:Broadcast(term, "  Troops: " .. tostring(v.Troops), GT_COL_INFO) -- 786
								gterm:Broadcast(term, "  Cities:", GT_COL_INFO) -- 787
								local _list_1 = v.Cities -- 788
								for _index_0 = 1, #_list_1 do -- 788
									local c = _list_1[_index_0] -- 788
									gterm:Broadcast(term, "    " .. tostring(c:Print())) -- 789
								end -- 789
								return -- 790
							end -- 782
						end -- 790
						if not found then -- 791
							gterm:Broadcast(term, "pick a correct nation", GT_COL_ERR) -- 792
							return -- 793
						end -- 791
					elseif "list" == cmd then -- 794
						local argument = args[2] -- 795
						local verbose = false -- 796
						if argument == "verbose" then -- 797
							verbose = true -- 798
						end -- 797
						gterm:Broadcast(term, "ENEMIES OF THE LAND:", GT_COL_INFO) -- 800
						for k, v in pairs(GAMEMODE.War.nations) do -- 801
							gterm:Broadcast(term, "  " .. tostring(v.Name) .. " - Troops: " .. tostring(v.Troops)) -- 802
							local op = GAMEMODE.War.active_operation -- 803
							if verbose and op and op.Defender == v then -- 804
								gterm:Broadcast(term, "     > " .. tostring(op.Name) .. " - BoP: " .. tostring(op.Balance), GT_COL_INFO) -- 805
							end -- 804
						end -- 805
						gterm:Broadcast(term, "end list", GT_COL_INTL) -- 806
						return -- 807
					else -- 809
						local _with_0 = gterm -- 809
						_with_0:Broadcast(term, "NATIONS INTERFACE", GT_COL_INFO) -- 810
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO) -- 811
						_with_0:Broadcast(term, "    lymphoma is the only thing that matters, it's better to stay informed about those who seek to destroy it") -- 812
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO) -- 813
						_with_0:Broadcast(term, "    :nation info TARGET - stay informed about the status of a specific enemy") -- 814
						_with_0:Broadcast(term, "    :nation list - know your neighbors") -- 815
						_with_0:Broadcast(term, "    :nation list verbose - know your neighbors, and everything they possess") -- 816
						return _with_0 -- 809
					end -- 816
				end, -- 772
				help = "Know your enemies." -- 817
			} -- 771
		} -- 641
	} -- 641
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 818
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 641
			_base_0[_key_0] = _val_0 -- 641
		end -- 641
	end -- 818
	if _base_0.__index == nil then -- 641
		_base_0.__index = _base_0 -- 641
	end -- 818
	setmetatable(_base_0, _parent_0.__base) -- 641
	_class_0 = setmetatable({ -- 641
		__init = function(self, ...) -- 641
			return _class_0.__parent.__init(self, ...) -- 641
		end, -- 641
		__base = _base_0, -- 641
		__name = "Polemarch", -- 641
		__parent = _parent_0 -- 641
	}, { -- 641
		__index = function(cls, name) -- 641
			local val = rawget(_base_0, name) -- 641
			if val == nil then -- 641
				local parent = rawget(cls, "__parent") -- 641
				if parent then -- 641
					return parent[name] -- 641
				end -- 641
			else -- 641
				return val -- 641
			end -- 641
		end, -- 641
		__call = function(cls, ...) -- 641
			local _self_0 = setmetatable({ }, _base_0) -- 641
			cls.__init(_self_0, ...) -- 641
			return _self_0 -- 641
		end -- 641
	}) -- 641
	_base_0.__class = _class_0 -- 641
	if _parent_0.__inherited then -- 641
		_parent_0.__inherited(_parent_0, _class_0) -- 641
	end -- 641
	Polemarch = _class_0 -- 641
end -- 818
local Public -- 822
do -- 822
	local _class_0 -- 822
	local _parent_0 = OS -- 822
	local _base_0 = { -- 822
		greeting = { -- 824
			"boot sequence now", -- 824
			"finalizing public system", -- 825
			"greetings citizen", -- 826
			"LONG LIVE THE EMPEROR." -- 827
		}, -- 830
		advice = { -- 831
			"One corpse's trash is another corpse's treasure.", -- 831
			"Bottles are useful. Don't smash them.", -- 832
			"Snorting broken glass may give you special powers.", -- 833
			"Burn your trash, eat your plastic, never stop smoking.", -- 834
			"Liver Failure doesn't take kindly to slackers.", -- 835
			"You live because you are useful enough to be exploited.", -- 836
			"Chew with your good teeth.", -- 837
			"Violence doesn't solve every problem, only some of them.", -- 838
			"Flesh capsules are very delicate, be careful with them.", -- 839
			"You do not need a gun. You do not want a gun.", -- 840
			"Don't venture too far into the tunnels.", -- 841
			"Evil things are bad.", -- 842
			"Play catch with people.", -- 843
			"Playing is fun.", -- 844
			"Play teeth. Teeth is fun.", -- 845
			"Rules are the rules.", -- 846
			"M y  h e a d ... M y  b r a i n ... M y  b e e r ...", -- 847
			"Eat and drink before taking your medicine.", -- 848
			"Bodily fluids can spread pathogens.", -- 849
			"Your safety is not a priority.", -- 850
			"It's what you wanted", -- 851
			"Radar spelled backwards is Radar.", -- 852
			"You're thinking about it, aren't you?", -- 853
			"But seriously though,", -- 854
			"At least you're not dead yet.", -- 855
			"At least you're not teeth yet.", -- 856
			"I wanna go home.", -- 857
			"Please", -- 858
			"You will get what you deserve.", -- 859
			"Booze loves company.", -- 860
			"Misery loves company.", -- 861
			"Teeth love company.", -- 862
			"Corpses love company.", -- 863
			"The things you put in your mouth can hurt you.", -- 864
			"Make sure you're ready for the hangover tomorrow.", -- 865
			"Buying things feels so good, doesn't it?", -- 866
			"We work until we die, and that's the way we like it.", -- 867
			"Blood brothers protect each other.", -- 868
			"You can't trust that people are what they say.", -- 869
			"Some people don't look like you. This is a problem.", -- 870
			"What's a little brawl between friends?", -- 871
			"It's too late now.", -- 872
			"you work to rent a bed so can rest for work tomorrow" -- 873
		}, -- 876
		commands = { -- 877
			[":help"] = { -- 878
				Callback = function(self, ply, term, args) -- 878
					local _with_0 = gterm -- 879
					_with_0:Broadcast(term, "  COMMANDS:") -- 882
					for k, v in SortedPairs(self:GetCommands()) do -- 883
						_with_0:Broadcast(term, "  * " .. tostring(k), GT_COL_INFO) -- 884
						_with_0:Broadcast(term, "    " .. tostring(v.help)) -- 885
					end -- 885
					_with_0:Broadcast(term, "  end list", GT_COL_INTL) -- 886
					return _with_0 -- 879
				end, -- 878
				help = "Basic usage instructions." -- 887
			}, -- 877
			[":cls"] = { -- 890
				Callback = function(self, ply, term) -- 890
					for i = 0, term.max_lines do -- 891
						local time = math.Rand(0.01, 0.04) -- 892
						timer.Simple(i * time, function() -- 893
							if IsValid(term) then -- 894
								return gterm:Broadcast(term, "", MSG_COL_NIL, i) -- 894
							end -- 894
						end) -- 893
					end -- 894
					return -- 895
				end, -- 890
				help = "Clear the screen." -- 896
			}, -- 889
			[":advice"] = { -- 899
				Callback = function(self, ply, term) -- 899
					local advice = self.advice[math.random(#self.advice)] -- 900
					if IsValid(term) then -- 901
						return gterm:Broadcast(term, advice, MSG_COL_INFO) -- 901
					end -- 901
				end, -- 899
				help = "Consult the infinite wisdom." -- 902
			}, -- 898
			[":taxes"] = { -- 905
				Callback = function(self, ply, term, args) -- 905
					local taxes = GAMEMODE.taxes -- 906
					gterm:Broadcast(term, "TAXES OF THE LAND:", GT_COL_INFO) -- 907
					for k, v in pairs(taxes) do -- 908
						gterm:Broadcast(term, "  " .. tostring(k) .. " tax is " .. tostring(v) .. "%", GT_COL_SUCC) -- 908
					end -- 908
					return gterm:Broadcast(term, "end list", GT_COL_INTL) -- 909
				end, -- 905
				help = "View what you people owe." -- 910
			}, -- 904
			[":laws"] = { -- 913
				Callback = function(self, ply, term, args) -- 913
					local laws = GAMEMODE:Laws() -- 914
					gterm:Broadcast(term, "LAWS OF THE LAND:", GT_COL_INFO) -- 915
					for k, v in ipairs(laws) do -- 916
						gterm:Broadcast(term, "  " .. tostring(k) .. ". " .. tostring(v), GT_COL_WRN) -- 916
					end -- 916
					return gterm:Broadcast(term, "end list", GT_COL_INTL) -- 917
				end, -- 913
				help = "View the laws of this land." -- 918
			}, -- 912
			[":nation"] = { -- 921
				Callback = function(self, ply, term, args) -- 921
					if ply:Team() ~= TEAM_EMPEROR then -- 922
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 923
						return -- 924
					end -- 922
					local cmd = args[1] -- 925
					if "info" == cmd then -- 927
						local nation -- 928
						if not (args[2] == "") then -- 928
							nation = args[2]:lower() -- 928
						end -- 928
						local found = false -- 929
						for k, v in pairs(GAMEMODE.War.nations) do -- 930
							if v.Name:lower():match(nation) then -- 931
								found = true -- 932
								local troops = v.Troops / math.random(4, 8) -- 933
								if k == "Lymphoma" then -- 934
									troops = v.Troops * math.random(4, 8) -- 934
								end -- 934
								troops = math.floor(troops) -- 935
								gterm:Broadcast(term, "========== The " .. tostring(v.Name) .. " ==========", GT_COL_INFO) -- 936
								gterm:Broadcast(term, "  " .. tostring(v.Description)) -- 937
								gterm:Broadcast(term, "  Troops: " .. tostring(troops), GT_COL_INFO) -- 938
								gterm:Broadcast(term, "  Cities:", GT_COL_INFO) -- 939
								local _list_1 = v.Cities -- 940
								for _index_0 = 1, #_list_1 do -- 940
									local c = _list_1[_index_0] -- 940
									gterm:Broadcast(term, "    " .. tostring(c:Print())) -- 941
								end -- 941
								return -- 942
							end -- 931
						end -- 942
						if not found then -- 943
							gterm:Broadcast(term, "pick a correct nation", GT_COL_ERR) -- 944
							return -- 945
						end -- 943
					elseif "list" == cmd then -- 946
						local argument = args[2] -- 947
						local verbose = false -- 948
						if argument == "verbose" then -- 949
							verbose = true -- 950
						end -- 949
						gterm:Broadcast(term, "ENEMIES OF THE LAND:", GT_COL_INFO) -- 952
						for k, v in pairs(GAMEMODE.War.nations) do -- 953
							local troops = v.Troops / math.random(4, 8) -- 954
							if k == "Lymphoma" then -- 955
								troops = v.Troops * math.random(4, 8) -- 955
							end -- 955
							troops = math.floor(troops) -- 956
							gterm:Broadcast(term, "  " .. tostring(v.Name) .. " - Troops: " .. tostring(troops)) -- 957
							local op = GAMEMODE.War.active_operation -- 958
							if verbose and op and op.Defender == v then -- 959
								gterm:Broadcast(term, "     > " .. tostring(op.Name) .. " - BoP: " .. tostring(op.Balance), GT_COL_INFO) -- 960
							end -- 959
						end -- 960
						gterm:Broadcast(term, "end list", GT_COL_INTL) -- 961
						return -- 962
					else -- 964
						local _with_0 = gterm -- 964
						_with_0:Broadcast(term, "NATIONS INTERFACE", GT_COL_INFO) -- 965
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO) -- 966
						_with_0:Broadcast(term, "    lymphoma is the only thing that matters, it's better to stay informed about those who seek to destroy it") -- 967
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO) -- 968
						_with_0:Broadcast(term, "    :nation info TARGET - stay informed about the status of a specific enemy") -- 969
						_with_0:Broadcast(term, "    :nation list - know your neighbors") -- 970
						_with_0:Broadcast(term, "    :nation list verbose - know your neighbors, and everything they possess") -- 971
						return _with_0 -- 964
					end -- 971
				end, -- 921
				help = "Know your enemies." -- 972
			}, -- 920
			[":whoami"] = { -- 975
				Callback = function(self, ply, term, args) -- 975
					gterm:Broadcast(term, "this experimental feature is still in testing", GT_COL_WRN) -- 976
					return gterm:Broadcast(term, "try later", GT_COL_WRN) -- 977
				end, -- 975
				help = "View social information." -- 978
			} -- 974
		}, -- 981
		lifetime = 60 * 3, -- 982
		Initialized = function(self, term) -- 982
			_class_0.__parent.__base.Initialized(self, term) -- 983
			term.live_until = CurTime() + self.lifetime -- 984
			return gterm:Broadcast(term, "DEATH when idle time exceeds " .. tostring(string.NiceTime(self.lifetime)), GT_COL_INFO) -- 985
		end, -- 986
		ReceiveInput = function(self, term, ply) -- 986
			term.live_until = CurTime() + self.lifetime -- 987
		end, -- 988
		Think = function(self, term) -- 988
			local ct = CurTime() -- 989
			if not term:GetActive() then -- 990
				return -- 990
			end -- 990
			if term.warn_cooldown and ct < term.warn_cooldown then -- 991
				return -- 991
			end -- 991
			if not term.live_until then -- 992
				term.live_until = ct + self.lifetime -- 992
			end -- 992
			local time_left = term.live_until - CurTime() -- 993
			if math.floor(time_left) % 60 == 0 then -- 994
				if math.floor(time_left) <= 1 then -- 995
					gterm:Broadcast(term, "DEATH", GT_COL_INTL) -- 996
					return timer.Simple(math.Rand(2, 5), function() -- 997
						if IsValid(term) and term:GetActive() then -- 998
							for i = 0, term.max_lines do -- 999
								if IsValid(term) then -- 1000
									gterm:Broadcast(term, "", nil, i) -- 1000
								end -- 1000
							end -- 1000
							return gterm.OS:Call(term, "ShutDown") -- 1001
						end -- 998
					end) -- 1001
				else -- 1003
					return gterm:Broadcast(term, "DEATH in " .. tostring(string.NiceTime(time_left)), GT_COL_INFO) -- 1003
				end -- 995
			end -- 994
		end -- 822
	} -- 822
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 1004
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 822
			_base_0[_key_0] = _val_0 -- 822
		end -- 822
	end -- 1004
	if _base_0.__index == nil then -- 822
		_base_0.__index = _base_0 -- 822
	end -- 1004
	setmetatable(_base_0, _parent_0.__base) -- 822
	_class_0 = setmetatable({ -- 822
		__init = function(self, ...) -- 822
			return _class_0.__parent.__init(self, ...) -- 822
		end, -- 822
		__base = _base_0, -- 822
		__name = "Public", -- 822
		__parent = _parent_0 -- 822
	}, { -- 822
		__index = function(cls, name) -- 822
			local val = rawget(_base_0, name) -- 822
			if val == nil then -- 822
				local parent = rawget(cls, "__parent") -- 822
				if parent then -- 822
					return parent[name] -- 822
				end -- 822
			else -- 822
				return val -- 822
			end -- 822
		end, -- 822
		__call = function(cls, ...) -- 822
			local _self_0 = setmetatable({ }, _base_0) -- 822
			cls.__init(_self_0, ...) -- 822
			return _self_0 -- 822
		end -- 822
	}) -- 822
	_base_0.__class = _class_0 -- 822
	if _parent_0.__inherited then -- 822
		_parent_0.__inherited(_parent_0, _class_0) -- 822
	end -- 822
	Public = _class_0 -- 822
end -- 1004
net.Receive("evilrp_terminal_endconsole", function(len, ply) -- 1005
	local idx = net.ReadUInt(16) -- 1006
	local term = Entity(idx) -- 1007
	local text = net.ReadString() -- 1008
	if not (IsValid(term) and term.GetUser) then -- 1009
		return -- 1009
	end -- 1009
	local user = term:GetUser() -- 1010
	if not (IsValid(user) and user == ply) then -- 1011
		return -- 1011
	end -- 1011
	if (text == "") or (text == " ") then -- 1012
		term:SetUser(nil) -- 1013
		net.Start("evilrp_terminal_endtyping") -- 1014
		net.Send(ply) -- 1015
		return -- 1016
	end -- 1012
	gterm.OS:Call(term, "ReceiveInput", ply) -- 1017
	if term.password and not client["pass_authed_" .. tostring(idx)] then -- 1018
		if text == term.password then -- 1019
			ply["pass_authed_" .. tostring(idx)] = true -- 1020
			gterm:Broadcast(term, "password accepted", GT_COL_INFO) -- 1021
			return -- 1022
		else -- 1024
			gterm:Broadcast(term, "password required", GT_COL_INFO) -- 1024
			return -- 1025
		end -- 1019
	end -- 1018
	if string.sub(text, 1, 1) == ":" then -- 1026
		local sys = OS.distros[term:GetOS()] -- 1027
		if sys then -- 1028
			for k, v in pairs(sys:GetCommands()) do -- 1029
				local cmd = string.sub(string.lower(text), 1, string.len(k)) -- 1030
				if k == cmd then -- 1031
					local text2 = string.sub(text, string.len(cmd) + 2) -- 1032
					local quote = (string.sub(text2, 1, 1) ~= "\"") -- 1033
					local args = { } -- 1034
					for chunk in string.gmatch(text2, "[^\"]+") do -- 1035
						quote = not quote -- 1036
						if quote then -- 1037
							args[#args + 1] = chunk -- 1038
						else -- 1040
							for chunk in string.gmatch(chunk, "[^ ]+") do -- 1040
								args[#args + 1] = chunk -- 1040
							end -- 1040
						end -- 1037
					end -- 1040
					local success, value = pcall(v.Callback, sys, ply, term, args) -- 1041
					if success then -- 1042
						gterm:Broadcast(term, text, GT_COL_CMD) -- 1043
					else -- 1045
						gterm:Broadcast(term, value, GT_COL_ERR) -- 1045
					end -- 1042
					return -- 1046
				end -- 1031
			end -- 1046
			text = tostring(string.sub(text, 2)) .. ": command not found" -- 1047
			gterm:Broadcast(term, text, GT_COL_ERR) -- 1048
			return -- 1049
		else -- 1051
			gterm:Broadcast(term, "DEATH", GT_COL_INTL) -- 1053
		end -- 1028
		if term.accepting_input then -- 1054
			local quote = (string.sub(text, 1, 1) ~= "\"") -- 1055
			local args = { } -- 1056
			for chunk in string.match(text, "[^\"]+") do -- 1057
				quote = not quote -- 1058
				if quote then -- 1059
					args[#args + 1] = chunk -- 1060
				else -- 1062
					for chunk in string.gmatch(chunk, "[^ ]+") do -- 1062
						args[#args + 1] = chunk -- 1062
					end -- 1062
				end -- 1059
			end -- 1062
			local callback = term.input_callback -- 1063
			if callback and args then -- 1064
				callback(ply, args) -- 1064
			end -- 1064
			term.accepting_input = nil -- 1065
			term.input_callback = nil -- 1066
			return -- 1067
		end -- 1054
	end -- 1026
	local sys = OS.distros[term:GetOS()] -- 1068
	local name = sys and sys.unique_id or "unknown" -- 1069
	local finalized = tostring(("<"):Escape()) .. tostring(name) .. "@" .. tostring(term:EntIndex()) .. tostring((">"):Escape()) .. " " .. tostring(text) -- 1070
	return gterm:Broadcast(term, finalized, GT_COL_CMD) -- 1071
end) -- 1005
net.Receive("evilrp_terminal_scroll", function(len, ply) -- 1073
	local idx = net.ReadUInt(16) -- 1074
	local dir = net.ReadInt(4) -- 1075
	local term = Entity(idx) -- 1076
	print(dir) -- 1077
	print(term) -- 1078
	if not (IsValid(term) and term.GetUser) then -- 1080
		return -- 1080
	end -- 1080
	local user = term:GetUser() -- 1081
	if not (IsValid(user) and user == ply) then -- 1082
		return -- 1082
	end -- 1082
	term.history = term.history or { } -- 1084
	local maxlines = term.max_lines or 25 -- 1085
	term.offset = term.offset or 0 -- 1086
	if dir == 1 then -- 1088
		term.offset = term.offset + 1 -- 1089
	elseif dir == -1 then -- 1090
		term.offset = term.offset - 1 -- 1091
	end -- 1088
	local maxscroll = math.max(0, #term.history - maxlines) -- 1093
	term.offset = math.Clamp(term.offset, 0, maxscroll) -- 1094
	for i = 0, maxlines do -- 1096
		gterm:Broadcast(term, "", GT_COL_NIL, i) -- 1097
	end -- 1098
	local start = #term.history - maxlines - term.offset + 1 -- 1099
	start = math.max(1, start) -- 1100
	local pos = 0 -- 1102
	for i = start, start + maxlines - 1 do -- 1103
		local line = term.history[i] -- 1104
		if line then -- 1105
			gterm:Broadcast(term, line.msg, line.col, pos) -- 1106
		end -- 1105
		pos = pos + 1 -- 1107
	end -- 1107
end) -- 1073
return MsgC(Color(255, 0, 0), "INITIALIZED EVILRP TERMINALS\n") -- 1109
