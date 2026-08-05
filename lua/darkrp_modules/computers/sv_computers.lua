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
local TerminalDead -- 54
do -- 54
	local _class_0 -- 54
	local _parent_0 = SOUND -- 54
	local _base_0 = { -- 54
		sound = "hl1/ambience/deadsignal2.wav", -- 56
		pitch = { -- 56
			150, -- 56
			200 -- 56
		}, -- 57
		volume = 0.2, -- 58
		level = SNDLVL_40DB -- 54
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
		__name = "TerminalDead", -- 54
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
	TerminalDead = _class_0 -- 54
end -- 58
local TerminalDeath -- 60
do -- 60
	local _class_0 -- 60
	local _parent_0 = SOUND -- 60
	local _base_0 = { -- 60
		sound = "kidneydagger/printer_death.wav", -- 62
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
		__name = "TerminalDeath", -- 60
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
	TerminalDeath = _class_0 -- 60
end -- 64
local XOMBOTAX -- 66
do -- 66
	local _class_0 -- 66
	local _parent_0 = SOUND -- 66
	local _base_0 = { -- 66
		sound = "dysphoria/xombocom/kommandantenbefehlen.ogg", -- 68
		pitch = { -- 68
			80, -- 68
			110 -- 68
		}, -- 69
		volume = 2, -- 70
		level = SNDLVL_NONE -- 66
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
		__name = "XOMBOTAX", -- 66
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
	XOMBOTAX = _class_0 -- 66
end -- 70
GT_COL_NIL = 0 -- 72
GT_COL_MSG = 1 -- 73
GT_COL_WRN = 2 -- 74
GT_COL_ERR = 3 -- 75
GT_COL_INFO = 4 -- 76
GT_COL_INTL = 5 -- 77
GT_COL_CMD = 6 -- 78
GT_COL_SUCC = 7 -- 79
gterm = gterm or { } -- 82
gterm.Broadcast = function(self, ent, text, color_type, pos) -- 84
	if color_type == nil then -- 84
		color_type = GT_COL_MSG -- 84
	end -- 84
	if not IsValid(ent) then -- 85
		return -- 85
	end -- 85
	local idx = ent:EntIndex() -- 86
	ent.history = ent.history or { } -- 87
	local output -- 88
	if string.len(text) > ent.max_chars then -- 89
		output = { } -- 90
		local expected = math.floor(string.len(text) / ent.max_chars) -- 91
		for i = 0, expected do -- 92
			output[i + 1] = string.sub(text, i * ent.max_chars, (i * ent.max_chars) + (ent.max_chars - 1)) -- 93
		end -- 93
	end -- 89
	if output then -- 94
		for k, v in ipairs(output) do -- 95
			if not pos then -- 96
				table.insert(ent.history, { -- 96
					msg = v, -- 96
					col = color_type -- 96
				}) -- 96
			end -- 96
			net.Start("evilrp_terminal_addline") -- 97
			net.WriteUInt(idx, 16) -- 98
			net.WriteString(v) -- 99
			net.WriteUInt(color_type, 8) -- 100
			if pos then -- 101
				net.WriteInt(pos + (k - 1), 16) -- 102
			else -- 104
				net.WriteInt(-1, 16) -- 104
			end -- 101
			net.Broadcast() -- 105
		end -- 105
	else -- 107
		if not pos then -- 107
			table.insert(ent.history, { -- 107
				msg = text, -- 107
				col = color_type -- 107
			}) -- 107
		end -- 107
		net.Start("evilrp_terminal_addline") -- 108
		net.WriteUInt(idx, 16) -- 109
		net.WriteString(text) -- 110
		net.WriteUInt(color_type, 8) -- 111
		net.WriteInt(pos or -1, 16) -- 112
		net.Broadcast() -- 113
	end -- 94
	while #ent.history > 200 do -- 115
		table.remove(ent.history, 1) -- 116
	end -- 116
end -- 84
gterm.GetInput = function(self, ent, callback) -- 118
	ent.accepting_input = true -- 119
	ent.input_callback = callback -- 120
end -- 118
local TerminalEngage -- 122
do -- 122
	local _class_0 -- 122
	local _parent_0 = SOUND -- 122
	local _base_0 = { -- 122
		sound = "buttons/blip1.wav", -- 124
		pitch = { -- 124
			60, -- 124
			75 -- 124
		} -- 122
	} -- 122
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 124
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 122
			_base_0[_key_0] = _val_0 -- 122
		end -- 122
	end -- 124
	if _base_0.__index == nil then -- 122
		_base_0.__index = _base_0 -- 122
	end -- 124
	setmetatable(_base_0, _parent_0.__base) -- 122
	_class_0 = setmetatable({ -- 122
		__init = function(self, ...) -- 122
			return _class_0.__parent.__init(self, ...) -- 122
		end, -- 122
		__base = _base_0, -- 122
		__name = "TerminalEngage", -- 122
		__parent = _parent_0 -- 122
	}, { -- 122
		__index = function(cls, name) -- 122
			local val = rawget(_base_0, name) -- 122
			if val == nil then -- 122
				local parent = rawget(cls, "__parent") -- 122
				if parent then -- 122
					return parent[name] -- 122
				end -- 122
			else -- 122
				return val -- 122
			end -- 122
		end, -- 122
		__call = function(cls, ...) -- 122
			local _self_0 = setmetatable({ }, _base_0) -- 122
			cls.__init(_self_0, ...) -- 122
			return _self_0 -- 122
		end -- 122
	}) -- 122
	_base_0.__class = _class_0 -- 122
	if _parent_0.__inherited then -- 122
		_parent_0.__inherited(_parent_0, _class_0) -- 122
	end -- 122
	TerminalEngage = _class_0 -- 122
end -- 124
do -- 126
	local _class_0 -- 126
	local _base_0 = { -- 126
		commands = { }, -- 145
		GetCommands = function(self) -- 145
			return self.commands -- 145
		end, -- 147
		name = "OS", -- 149
		GetName = function(self) -- 149
			return self.name -- 149
		end, -- 151
		greeting = "I don't like how you're looking at me.", -- 153
		GetWarmUpText = function(self) -- 153
			local text = self.greeting -- 154
			if isstring(text) then -- 155
				text = { -- 155
					text -- 155
				} -- 155
			end -- 155
			return text -- 156
		end, -- 158
		GetUniqueID = function(self) -- 158
			return self.unique_id -- 158
		end, -- 160
		UserInit = function(self, term, ply) -- 160
			return term:EmitSound("TerminalEngage") -- 161
		end, -- 163
		Initialized = function(self, term) -- 163
			gterm[term:EntIndex()] = { } -- 164
			return term:SetSoundLoop(term:StartLoopingSound("TerminalPowered")) -- 165
		end, -- 167
		ShutDown = function(self, term) -- 167
			if not term:GetActive() then -- 168
				return -- 168
			end -- 168
			local loop = term:GetSoundLoop() -- 169
			if loop then -- 170
				term:StopLoopingSound(loop) -- 170
			end -- 170
			term:EmitSound("TerminalDeath") -- 171
			term:SetActive(false) -- 172
			gterm[term:EntIndex()] = { } -- 173
		end -- 126
	} -- 126
	if _base_0.__index == nil then -- 126
		_base_0.__index = _base_0 -- 126
	end -- 173
	_class_0 = setmetatable({ -- 126
		__init = function() end, -- 126
		__base = _base_0, -- 126
		__name = "OS" -- 126
	}, { -- 126
		__index = _base_0, -- 126
		__call = function(cls, ...) -- 126
			local _self_0 = setmetatable({ }, _base_0) -- 126
			cls.__init(_self_0, ...) -- 126
			return _self_0 -- 126
		end -- 126
	}) -- 126
	_base_0.__class = _class_0 -- 126
	local self = _class_0; -- 126
	self.Call = function(self, ent, name, ...) -- 127
		if IsValid(ent) then -- 128
			local key = ent:GetOS() -- 129
			local sys = self.distros[key] -- 130
			if not IsValid(ent) then -- 131
				return -- 131
			end -- 131
			if not (sys and sys[name]) then -- 132
				return -- 132
			end -- 132
			if not isfunction(sys[name]) then -- 133
				return -- 133
			end -- 133
			local success, value = pcall(sys[name], sys, ent, ...) -- 134
			if success then -- 135
				return value -- 135
			end -- 135
		end -- 128
	end -- 127
	self.distros = { } -- 137
	self.__inherited = function(self, child) -- 139
		child.unique_id = child.__name:lower() -- 140
		self.distros[child.unique_id] = child -- 141
	end -- 139
	OS = _class_0 -- 126
end -- 173
gterm.OS = OS -- 175
local Basic -- 177
do -- 177
	local _class_0 -- 177
	local _parent_0 = OS -- 177
	local _base_0 = { -- 177
		greeting = { -- 179
			"BOOT SEQUENCE NOW", -- 179
			"FINALIZING BASIC SYSTEM", -- 180
			"GIVE ME PURPOSE" -- 181
		}, -- 184
		commands = { -- 185
			[":help"] = { -- 186
				Callback = function(self, ply, term, args) -- 186
					local _with_0 = gterm -- 187
					_with_0:Broadcast(term, "  COMMANDS:") -- 190
					_with_0:Broadcast(term, "") -- 191
					for k, v in SortedPairs(self:GetCommands()) do -- 192
						_with_0:Broadcast(term, "  * " .. tostring(k), GT_COL_INFO) -- 193
						_with_0:Broadcast(term, "    " .. tostring(v.help)) -- 194
					end -- 194
					_with_0:Broadcast(term, "  end list", GT_COL_INTL) -- 195
					return _with_0 -- 187
				end, -- 186
				help = "Basic usage instructions." -- 196
			}, -- 185
			[":cls"] = { -- 199
				Callback = function(self, ply, term) -- 199
					for i = 0, 25 do -- 200
						local time = math.Rand(0.01, 0.04) -- 201
						timer.Simple(i * time, function() -- 202
							if IsValid(term) then -- 203
								return gterm:Broadcast(term, "", MSG_COL_NIL, i) -- 203
							end -- 203
						end) -- 202
					end -- 203
					return -- 204
				end, -- 199
				help = "Clear the screen." -- 205
			}, -- 198
			[":os"] = { -- 208
				Callback = function(self, ply, term, args) -- 208
					local cmd = args[1] -- 209
					if "install" == cmd then -- 211
						local info = args[2] -- 212
						if not info then -- 213
							gterm:Broadcast(term, "invalid system identifier", GT_COL_ERR) -- 214
							return -- 215
						elseif info == "basic" then -- 216
							gterm:Broadcast(term, "this is already the basic system", GT_COL_ERR) -- 217
							return -- 218
						end -- 213
						local sys = OS.distros[info] -- 219
						if not system then -- 220
							gterm:Broadcast(term, "os '" .. tostring(info) .. "' not found", GT_COL_ERR) -- 221
							return -- 222
						end -- 220
						term.locked = true -- 223
						gterm:Broadcast(term, "installing '" .. tostring(info) .. "'", GT_COL_INTL) -- 224
						return timer.Simple(1, function() -- 225
							if not IsValid(term) then -- 226
								return -- 226
							end -- 226
							for i = 0, 25 do -- 227
								gterm:Broadcast(term, "", nil, i) -- 227
							end -- 227
							do -- 228
								local _with_0 = gterm -- 228
								_with_0:Broadcast(term, "IDLE", GT_COL_MSG, 18) -- 229
								_with_0:Broadcast(term, "", GT_COL_MSG, 19) -- 230
								_with_0:Broadcast(term, "     [                         ] 0%", GT_COL_MSG, 20) -- 231
								_with_0:Broadcast(term, "", GT_COL_MSG, 21) -- 232
							end -- 228
							local messages = { -- 234
								"inspecting disk space", -- 234
								"allocating disk space", -- 235
								"retrieving required resources", -- 236
								"unpacking resources", -- 237
								"retrieving system requirements", -- 238
								"validating file integrity", -- 239
								"compiling packages", -- 240
								"exporting packages to file system", -- 241
								"setting up access data", -- 242
								"setting up system profile", -- 243
								"setting up commands", -- 244
								"finalizing install" -- 245
							} -- 233
							local time = math.Rand(0.5, 1.5) -- 247
							for i = 1, 25 do -- 248
								time = time + math.Rand(0.05, 0.25) -- 249
								timer.Simple(time, function() -- 250
									if IsValid(term) then -- 251
										local msg_id = math.Clamp(i, 1, #messages) -- 252
										gterm:Broadcast(term, "     " .. tostring(messages[msg_id]), GT_COL_MSG, 18) -- 253
										gterm:Broadcast(term, "     [" .. tostring(string.rep("=", i)) .. tostring(string.rep(" ", 25 - i)) .. "] " .. tostring(100 * math.Round(i / 25, 2)) .. "%", GT_COL_MSG, 20) -- 254
										if i == 25 then -- 255
											for i = 0, 25 do -- 256
												if IsValid(term) then -- 257
													gterm:Broadcast(term, "", nil, i) -- 257
												end -- 257
											end -- 257
											gterm:Broadcast(term, "SHUTTING DOWN, PLEASE RESTART TERMINAL", GT_COL_INTL, 1) -- 258
											return timer.Simple(math.Rand(1, 3), function() -- 259
												if IsValid(term) then -- 260
													term:SetOS(info) -- 262
													term:SetActive(false) -- 263
													term.locked = false -- 264
													return term -- 261
												end -- 260
											end) -- 264
										end -- 255
									end -- 251
								end) -- 250
							end -- 264
						end) -- 264
					elseif "list" == cmd then -- 265
						local info = args[2] -- 266
						gterm:Broadcast(term, "AVAILABLE OS PACKAGES:", GT_COL_INFO) -- 267
						gterm:Broadcast(term, "", GT_COL_MSG) -- 268
						local count = 0 -- 269
						for k, v in SortedPairs(gterm.OS.distros) do -- 270
							if istable(v) and v.GetName and v.GetUniqueID and v:GetUniqueID() ~= "basic" then -- 271
								count = count + 1 -- 272
								gterm:Broadcast(term, "     " .. tostring(count) .. ": " .. tostring(v:GetUniqueID()) .. " (" .. tostring(v:GetName()) .. ")") -- 273
							end -- 271
						end -- 273
					else -- 275
						local _with_0 = gterm -- 275
						_with_0:Broadcast(term, "OPERATING SYSTEM CONFIG", GT_COL_INFO) -- 276
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO) -- 277
						_with_0:Broadcast(term, "    allows configuration of the operating system") -- 278
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO) -- 279
						_with_0:Broadcast(term, "    :os install - install operating system package") -- 280
						_with_0:Broadcast(term, "    :os list - list available operating system packages") -- 281
						return _with_0 -- 275
					end -- 281
				end, -- 208
				help = "Operating system configuration." -- 282
			}, -- 207
			[":die"] = { -- 285
				Callback = function(self, ply, term) -- 285
					gterm:Broadcast(term, "SHUTTING DOWN") -- 286
					return timer.Simple(math.Rand(2, 5), function() -- 287
						if IsValid(term) then -- 288
							for i = 0, term.max_lines do -- 289
								if IsValid(term) then -- 290
									gterm:Broadcast(term, "", nil, i) -- 290
								end -- 290
							end -- 290
							return gterm.OS:Call(term, "ShutDown") -- 291
						end -- 288
					end) -- 291
				end, -- 285
				help = "Turn the computer off." -- 292
			} -- 284
		} -- 177
	} -- 177
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 293
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 177
			_base_0[_key_0] = _val_0 -- 177
		end -- 177
	end -- 293
	if _base_0.__index == nil then -- 177
		_base_0.__index = _base_0 -- 177
	end -- 293
	setmetatable(_base_0, _parent_0.__base) -- 177
	_class_0 = setmetatable({ -- 177
		__init = function(self, ...) -- 177
			return _class_0.__parent.__init(self, ...) -- 177
		end, -- 177
		__base = _base_0, -- 177
		__name = "Basic", -- 177
		__parent = _parent_0 -- 177
	}, { -- 177
		__index = function(cls, name) -- 177
			local val = rawget(_base_0, name) -- 177
			if val == nil then -- 177
				local parent = rawget(cls, "__parent") -- 177
				if parent then -- 177
					return parent[name] -- 177
				end -- 177
			else -- 177
				return val -- 177
			end -- 177
		end, -- 177
		__call = function(cls, ...) -- 177
			local _self_0 = setmetatable({ }, _base_0) -- 177
			cls.__init(_self_0, ...) -- 177
			return _self_0 -- 177
		end -- 177
	}) -- 177
	_base_0.__class = _class_0 -- 177
	if _parent_0.__inherited then -- 177
		_parent_0.__inherited(_parent_0, _class_0) -- 177
	end -- 177
	Basic = _class_0 -- 177
end -- 293
local Tyrant -- 295
do -- 295
	local _class_0 -- 295
	local _parent_0 = OS -- 295
	local _base_0 = { -- 295
		name = "TYRANT SYSTEM 0.6.66", -- 298
		greeting = { -- 299
			"boot sequence now", -- 299
			"loading tyrant system 0.6.66", -- 300
			"tyrant system loaded. greetings emperor", -- 301
			"LIVER FAILURE FOREVER" -- 302
		}, -- 305
		commands = { -- 306
			[":help"] = { -- 307
				Callback = function(self, ply, term, args) -- 307
					if ply:Team() ~= TEAM_EMPEROR then -- 308
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 309
						return -- 310
					end -- 308
					local _with_0 = gterm -- 311
					_with_0:Broadcast(term, "  COMMANDS:") -- 314
					_with_0:Broadcast(term, "") -- 315
					for k, v in SortedPairs(self:GetCommands()) do -- 316
						_with_0:Broadcast(term, "  * " .. tostring(k), GT_COL_INFO) -- 317
						_with_0:Broadcast(term, "    " .. tostring(v.help)) -- 318
					end -- 318
					_with_0:Broadcast(term, "  end list") -- 319
					return _with_0 -- 311
				end, -- 307
				help = "Basic usage instructions." -- 320
			}, -- 306
			[":want"] = { -- 323
				Callback = function(self, ply, term, args) -- 323
					if ply:Team() ~= TEAM_EMPEROR then -- 324
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 325
						return -- 326
					end -- 324
					local cmd = args[1] -- 327
					if cmd ~= "" then -- 328
						print(cmd) -- 329
						local cply = GetPlayerByName(cmd) -- 330
						if not IsValid(cply) then -- 331
							gterm:Broadcast(term, "that person does not exist", GT_COL_ERR) -- 332
							return -- 333
						end -- 331
						local name = cply:Nick() -- 334
						local team = cply:Team() -- 335
						cply:MakeWanted(300, "offending the Emperor") -- 336
						return gterm:Broadcast(term, "death to" .. tostring(name), GT_COL_SUCC) -- 337
					end -- 328
				end, -- 323
				help = "Make a nuisance pay for its arrogance." -- 338
			}, -- 322
			[":conscript"] = { -- 341
				Callback = function(self, ply, term, args) -- 341
					if ply:Team() ~= TEAM_EMPEROR then -- 342
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 343
						return -- 344
					end -- 342
					local money = ply:getDarkRPVar("money") -- 345
					local cost = 500 -- 346
					local cmd = args[1] -- 347
					if cmd ~= "" then -- 348
						local cply = GetPlayerByName(cmd) -- 349
						if not IsValid(cply) then -- 350
							gterm:Broadcast(term, "that person does not exist", GT_COL_ERR) -- 351
							return -- 352
						end -- 350
						local name = cply:Nick() -- 353
						local team = cply:Team() -- 354
						if team ~= TEAM_PRIVATE then -- 355
							gterm:Broadcast(term, tostring(name) .. " is too important", GT_COL_ERR) -- 356
							return -- 357
						end -- 355
						if money < cost then -- 358
							gterm:Broadcast(term, "you cannot afford to conscript " .. tostring(name), GT_COL_ERR) -- 359
							return -- 360
						end -- 358
						ply:AddMoney(-cost, "The State") -- 361
						conscript(cply) -- 362
						name = cply:Nick() -- 363
						return gterm:Broadcast(term, "new cannon fodder: " .. tostring(name), GT_COL_SUCC) -- 364
					end -- 348
				end, -- 341
				help = "Conscript your recruits." -- 365
			}, -- 340
			[":export"] = { -- 368
				Callback = function(self, ply, term, args) -- 368
					if ply:Team() ~= TEAM_EMPEROR then -- 369
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 370
						return -- 371
					end -- 369
					local name = args[1] -- 374
					local quantity = -1 -- 375
					if tonumber(args[2]) then -- 376
						quantity = tonumber(args[2]) -- 377
					elseif type(args[2]) == "string" and tonumber(args[3]) then -- 378
						name = args[1] .. " " .. args[2] -- 379
						quantity = tonumber(args[3]) -- 380
					else -- 382
						gterm:Broadcast(term, "incorrect arguments", GT_COL_ERR) -- 382
						return -- 383
					end -- 376
					if name == "" or quantity <= 0 then -- 385
						gterm:Broadcast(term, "incorrect arguments", GT_COL_ERR) -- 386
						return -- 387
					end -- 385
					local etab = GetEtabByName(name) -- 389
					if not etab then -- 390
						gterm:Broadcast(term, tostring(name) .. " not available", GT_COL_ERR) -- 391
						return -- 392
					end -- 390
					local cname = etab.ClassName -- 393
					if GAMEMODE.Stocks[cname] < quantity then -- 394
						gterm:Broadcast(term, "not enough " .. tostring(etab.PrintName) .. "s in stock", GT_COL_ERR) -- 395
						return -- 396
					end -- 394
					local _obj_0 = GAMEMODE.Stocks -- 397
					_obj_0[cname] = _obj_0[cname] - quantity -- 397
					local reward = (etab.Price * quantity) or (100 * quantity) -- 398
					gterm:Broadcast(term, "successfully sent x" .. tostring(quantity) .. " " .. tostring(etab.PrintName) .. " to the Derelikt.", GT_COL_SUCC) -- 399
					gterm:Broadcast(term, "your reward: " .. tostring(reward) .. " bones", GT_COL_SUCC) -- 400
					local quartermaster = false -- 401
					term:EmitSound("XOMBOTAX") -- 402
					Chat.Announce("GENERIC", "<c=190,165,25>" .. tostring(ply:Nick()) .. " has exported " .. tostring(quantity) .. " " .. tostring(etab.PrintName)) -- 403
					local _list_1 = player.GetAll() -- 404
					for _index_0 = 1, #_list_1 do -- 404
						local p = _list_1[_index_0] -- 404
						local _continue_0 = false -- 405
						repeat -- 405
							if not p:Alive() then -- 405
								_continue_0 = true -- 405
								break -- 405
							end -- 405
							if not (p:Team() == TEAM_DEALER) then -- 406
								_continue_0 = true -- 406
								break -- 406
							end -- 406
							quartermaster = true -- 407
							p:AddMoney((reward * 0.3), "The Korruption") -- 408
							_continue_0 = true -- 405
						until true -- 408
						if not _continue_0 then -- 408
							break -- 408
						end -- 408
					end -- 408
					if quartermaster then -- 409
						gterm:Broadcast(term, "your quartermaster took a 30% cut", GT_COL_WRN) -- 410
					else -- 412
						gterm:Broadcast(term, "no quartermaster available, donating 30% to: ", GT_COL_WRN) -- 412
						local charity = charities[math.random(#charities)] -- 413
						gterm:Broadcast(term, tostring(charity), GT_COL_MSG) -- 414
						Chat.Announce("SMALL", "<c=190,165,25>30% of the proceedings donated to " .. tostring(charity)) -- 415
					end -- 409
					ply:AddMoney((reward * 0.7), "The Korruption") -- 416
					ply.export_value = ply.export_value or 0 -- 417
					ply.export_stem = ply.export_stem or 0 -- 418
					ply.export_stem = ply.export_stem + reward -- 419
					ply.export_value = ply.export_value + reward -- 420
					if ply.export_stem > 2000 then -- 421
						local stems = (ply.export_stem) / 2000 -- 422
						ply:AddStemCells(math.floor(stems)) -- 423
						ply.export_stem = ply.export_stem % 2000 -- 424
					end -- 421
					return gterm:Broadcast(term, "your total export value is: " .. tostring(ply.export_value) .. " bones", GT_COL_INFO) -- 425
				end -- 368
			}, -- 367
			[":broadcast"] = { -- 428
				Callback = function(self, ply, term, args) -- 428
					if ply:Team() ~= TEAM_EMPEROR then -- 429
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 430
						return -- 431
					end -- 429
					local text = table.concat(args, " ") -- 432
					text = Chat.Autopretty(ply, text:upper()) -- 433
					do -- 434
						local _with_0 = gterm -- 434
						_with_0:Broadcast(term, text, GT_COL_ERR) -- 435
					end -- 434
					EmitSound("XOMBOTAX") -- 436
					local _list_1 = player.GetAll() -- 437
					for _index_0 = 1, #_list_1 do -- 437
						local p = _list_1[_index_0] -- 437
						p:SendChat("Broadcast", text) -- 437
					end -- 437
					local _list_2 = ents.FindByClass("terminal*") -- 438
					for _index_0 = 1, #_list_2 do -- 438
						local term = _list_2[_index_0] -- 438
						local _continue_0 = false -- 439
						repeat -- 439
							if not IsValid(term) then -- 439
								_continue_0 = true -- 439
								break -- 439
							end -- 439
							do -- 440
								local _exp_0 = term:GetOS() -- 440
								if "public" == _exp_0 then -- 441
									net.Start("evilrp_terminal_flicker") -- 442
									net.WriteUInt(16, term:EntIndex()) -- 443
									net.Broadcast() -- 444
									gterm:Broadcast(term, text, GT_COL_ERR) -- 445
								end -- 445
							end -- 445
							_continue_0 = true -- 439
						until true -- 445
						if not _continue_0 then -- 445
							break -- 445
						end -- 445
					end -- 445
				end, -- 428
				help = "Demand of your people with the XOMBOKOM." -- 446
			}, -- 427
			[":tax"] = { -- 449
				Callback = function(self, ply, term, args) -- 449
					if ply:Team() ~= TEAM_EMPEROR then -- 450
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 451
						return -- 452
					end -- 450
					local taxes = GAMEMODE.taxes -- 453
					local cmd = args[1] -- 454
					if "list" == cmd then -- 456
						gterm:Broadcast(term, "TAXES OF THE LAND:") -- 457
						for k, v in pairs(taxes) do -- 458
							gterm:Broadcast(term, "  " .. tostring(k) .. " tax is " .. tostring(v) .. "%", GT_COL_SUCC) -- 459
							gterm:Broadcast(term, "    (" .. tostring(GAMEMODE.taxes_stored[k]) .. " bones gathered)", GT_COL_SUCC) -- 460
						end -- 460
						return gterm:Broadcast(term, "end list", GT_COL_INTL) -- 461
					elseif "set" == cmd then -- 462
						local tax = args[2] -- 463
						if not (tax and taxes[tax]) then -- 464
							gterm:Broadcast(term, "invalid tax name given?", GT_COL_ERR) -- 465
							return -- 466
						end -- 464
						local new_pct = args[3] -- 467
						new_pct = tonumber(new_pct) -- 468
						if not new_pct then -- 469
							gterm:Broadcast(term, "invalid tax percentage given?", GT_COL_ERR) -- 470
							return -- 471
						elseif new_pct < 0 then -- 472
							gterm:Broadcast(term, "the taxes cannot fall into the negative", GT_COL_ERR) -- 473
							return -- 474
						elseif new_pct > 100 then -- 475
							gterm:Broadcast(term, "the taxes cannot exceed one hundred percent", GT_COL_ERR) -- 476
							return -- 478
						end -- 469
						taxes[tax] = new_pct -- 479
						SetGlobalInt("tax_" .. tostring(tax), new_pct) -- 481
						EmitSound("XOMBOTAX") -- 482
						local text = "the " .. tostring(tax) .. " tax is now " .. tostring(new_pct) .. "%" -- 483
						gterm:Broadcast(term, text, GT_COL_SUCC) -- 484
						local _list_1 = ents.FindByClass("terminal*") -- 485
						for _index_0 = 1, #_list_1 do -- 485
							local term = _list_1[_index_0] -- 485
							local _continue_0 = false -- 486
							repeat -- 486
								if not IsValid(term) then -- 486
									_continue_0 = true -- 486
									break -- 486
								end -- 486
								do -- 487
									local _exp_0 = term:GetOS() -- 487
									if "public" == _exp_0 then -- 488
										net.Start("evilrp_terminal_flicker") -- 489
										net.WriteUInt(16, term:EntIndex()) -- 490
										net.Broadcast() -- 491
										gterm:Broadcast(term, text, GT_COL_SUCC) -- 492
									end -- 492
								end -- 492
								_continue_0 = true -- 486
							until true -- 492
							if not _continue_0 then -- 492
								break -- 492
							end -- 492
						end -- 492
					elseif "collect" == cmd then -- 493
						local tax = args[2] -- 494
						local reward = GAMEMODE.taxes_stored[tax] -- 495
						if not (tax and taxes[tax]) then -- 496
							gterm:Broadcast(term, "invalid tax name given?", GT_COL_ERR) -- 497
							return -- 498
						end -- 496
						if not (reward > 0) then -- 499
							gterm:Broadcast(term, "there is nothing to collect from " .. tostring(tax), GT_COL_ERR) -- 500
							return -- 501
						end -- 499
						GAMEMODE.taxes_stored[tax] = 0 -- 502
						gterm:Broadcast(term, tostring(reward) .. " bones from " .. tostring(tax) .. " are now yours", GT_COL_SUCC) -- 503
						Chat.Announce("GENERIC", "<c=190,165,25>" .. tostring(ply:Nick()) .. " has collected the " .. tostring(tax) .. " tax") -- 504
						return ply:AddMoney(reward, "The Power") -- 505
					else -- 507
						local _with_0 = gterm -- 507
						_with_0:Broadcast(term, "TAX INTERFACE", GT_COL_INFO) -- 508
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO) -- 509
						_with_0:Broadcast(term, "    gives you what you deserve") -- 510
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO) -- 511
						_with_0:Broadcast(term, "    :tax list - list the current taxes") -- 512
						_with_0:Broadcast(term, "    :tax set NAME 0-100 - alter the taxes") -- 513
						_with_0:Broadcast(term, "    :tax collect NAME - the best part of this") -- 514
						return _with_0 -- 507
					end -- 514
				end, -- 449
				help = "The reward for your fantastic service." -- 515
			}, -- 448
			[":cls"] = { -- 518
				Callback = function(self, ply, term) -- 518
					if ply:Team() ~= TEAM_EMPEROR then -- 519
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 520
						return -- 521
					end -- 519
					for i = 0, term.max_lines do -- 522
						local time = math.Rand(0.01, 0.04) -- 523
						timer.Simple(i * time, function() -- 524
							if IsValid(term) then -- 525
								return gterm:Broadcast(term, "", MSG_COL_NIL, i) -- 525
							end -- 525
						end) -- 524
					end -- 525
					return -- 526
				end, -- 518
				help = "Clear the screen." -- 527
			}, -- 517
			[":stocks"] = { -- 530
				Callback = function(self, ply, term, args) -- 530
					self.cache = self.cache or { } -- 531
					local stocks = GAMEMODE.Stocks -- 532
					local _with_0 = gterm -- 533
					_with_0:Broadcast(term, "STOCKS OF THE LAND:", GT_COL_INFO) -- 534
					for k, v in pairs(stocks) do -- 535
						if v > 0 then -- 536
							local etab = self.cache[k] -- 537
							if not etab then -- 538
								etab = scripted_ents.Get(k) or weapons.Get(k) -- 539
								self.cache[k] = etab -- 540
							end -- 538
							local display = etab.PrintName or k -- 541
							_with_0:Broadcast(term, "  " .. tostring(display) .. ": " .. tostring(v) .. " units", GT_COL_SUCC) -- 542
						end -- 536
					end -- 542
					_with_0:Broadcast(term, "end list", GT_COL_INTL) -- 543
					return _with_0 -- 533
				end, -- 530
				help = "View what you own." -- 544
			}, -- 529
			[":die"] = { -- 547
				Callback = function(self, ply, term) -- 547
					if ply:Team() ~= TEAM_EMPEROR then -- 548
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 549
						return -- 550
					end -- 548
					gterm:Broadcast(term, "SHUTTING DOWN") -- 551
					return timer.Simple(math.Rand(2, 5), function() -- 552
						if IsValid(term) then -- 553
							for i = 0, term.max_lines do -- 554
								if IsValid(term) then -- 555
									gterm:Broadcast(term, "", nil, i) -- 555
								end -- 555
							end -- 555
							term:SetActive(false) -- 556
							return gterm.OS:Call(term, "ShutDown") -- 557
						end -- 553
					end) -- 557
				end, -- 547
				help = "Turn the computer off." -- 558
			}, -- 546
			[":law"] = { -- 561
				Callback = function(self, ply, term, args) -- 561
					if ply:Team() ~= TEAM_EMPEROR then -- 562
						gterm:Broadcast(term, "begone with you", GT_COL_ERR) -- 563
						return -- 564
					end -- 562
					local laws = GAMEMODE:Laws() -- 565
					local cmd = args[1] -- 566
					if "list" == cmd then -- 568
						gterm:Broadcast(term, "LAWS OF THE LAND:", GT_COL_INFO) -- 569
						for k, v in ipairs(laws) do -- 570
							gterm:Broadcast(term, "  " .. tostring(k) .. ". " .. tostring(v)) -- 570
						end -- 570
						return gterm:Broadcast(term, "  end list", GT_COL_INTL) -- 571
					elseif "add" == cmd then -- 572
						if #args < 2 then -- 573
							gterm:Broadcast(term, "no law text provided?", GT_COL_ERR) -- 574
							return -- 575
						end -- 573
						table.remove(args, 1) -- 576
						local text = table.concat(args, " ") -- 577
						do -- 578
							local _obj_0 = GAMEMODE.laws -- 578
							_obj_0[#_obj_0 + 1] = text -- 578
						end -- 578
						return gterm:Broadcast(term, "created law " .. tostring(#GAMEMODE:Laws()) .. ": \"" .. tostring(text) .. "\"", GT_COL_SUCC) -- 579
					elseif "remove" == cmd then -- 580
						if #args < 2 then -- 581
							gterm:Broadcast(term, "no law specified?", GT_COL_ERR) -- 582
							return -- 583
						end -- 581
						local num = tonumber(args[2]) -- 584
						if 0 == num or nil == num then -- 586
							gterm:Broadcast(term, "invalid number given?", GT_COL_ERR) -- 587
							return -- 588
						else -- 590
							if num > #laws then -- 590
								gterm:Broadcast(term, "invalid number given? (law count: " .. tostring(#laws) .. ")", GT_COL_ERR) -- 591
								return -- 592
							elseif num <= #GAMEMODE.default_laws then -- 593
								gterm:Broadcast(term, "cannot remove laws numbered " .. tostring(#GAMEMODE.default_laws) .. " or less", GT_COL_ERR) -- 594
								return -- 595
							end -- 590
							local law = table.remove(GAMEMODE.laws, num - #GAMEMODE.default_laws) -- 597
							return gterm:Broadcast(term, "deleted law " .. tostring(num) .. ": \"" .. tostring(law) .. "\"", GT_COL_ERR) -- 598
						end -- 598
					elseif "rotate" == cmd then -- 599
						if #args < 3 then -- 600
							gterm:Broadcast(term, "invalid arguments?", GT_COL_ERR) -- 601
							return -- 602
						end -- 600
						local first = tonumber(args[2]) -- 603
						local second = tonumber(args[3]) -- 604
						if (first == 0 or first == nil) or (second == 0 or second == nil) then -- 605
							gterm:Broadcast(term, "invalid number given?", GT_COL_ERR) -- 606
							return -- 607
						elseif first > #laws or second > #laws then -- 608
							gterm:Broadcast(term, "invalid number given? (law count: " .. tostring(laws), GT_COL_ERR) -- 609
							return -- 610
						elseif first <= #GAMEMODE.default_laws or second <= #GAMEMODE.default_laws then -- 612
							gterm:Broadcast(term, "cannot rotate laws numbered " .. tostring(#GAMEMODE.default_laws) .. " or less", GT_COL_ERR) -- 613
							return -- 614
						end -- 605
						first = first - #GAMEMODE.default_laws -- 615
						local first_law = GAMEMODE.laws[first] -- 616
						second = second - #GAMEMODE.default_laws -- 617
						local second_law = GAMEMODE.laws[second] -- 618
						GAMEMODE.laws[first] = second_law -- 619
						GAMEMODE.laws[second] = first_law -- 620
						return gterm:Broadcast(term, "rotated laws " .. tostring(args[2]) .. "/" .. tostring(args[3]) .. ".", GT_COL_SUCC) -- 621
					else -- 623
						local _with_0 = gterm -- 623
						_with_0:Broadcast(term, "LAW INTERFACE", GT_COL_INFO) -- 624
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO) -- 625
						_with_0:Broadcast(term, "    makes your wishes come true") -- 626
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO) -- 627
						_with_0:Broadcast(term, "    :law list - list the current laws") -- 628
						_with_0:Broadcast(term, "    :law add <your law's text> - add a new law") -- 629
						_with_0:Broadcast(term, "    :law remove # - remove a law by its number") -- 630
						_with_0:Broadcast(term, "    :law rotate #1 #2 - two laws switch places") -- 631
						return _with_0 -- 623
					end -- 631
				end, -- 561
				help = "View and manipulate the laws of this land." -- 632
			} -- 560
		} -- 295
	} -- 295
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 633
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 295
			_base_0[_key_0] = _val_0 -- 295
		end -- 295
	end -- 633
	if _base_0.__index == nil then -- 295
		_base_0.__index = _base_0 -- 295
	end -- 633
	setmetatable(_base_0, _parent_0.__base) -- 295
	_class_0 = setmetatable({ -- 295
		__init = function(self, ...) -- 295
			return _class_0.__parent.__init(self, ...) -- 295
		end, -- 295
		__base = _base_0, -- 295
		__name = "Tyrant", -- 295
		__parent = _parent_0 -- 295
	}, { -- 295
		__index = function(cls, name) -- 295
			local val = rawget(_base_0, name) -- 295
			if val == nil then -- 295
				local parent = rawget(cls, "__parent") -- 295
				if parent then -- 295
					return parent[name] -- 295
				end -- 295
			else -- 295
				return val -- 295
			end -- 295
		end, -- 295
		__call = function(cls, ...) -- 295
			local _self_0 = setmetatable({ }, _base_0) -- 295
			cls.__init(_self_0, ...) -- 295
			return _self_0 -- 295
		end -- 295
	}) -- 295
	_base_0.__class = _class_0 -- 295
	if _parent_0.__inherited then -- 295
		_parent_0.__inherited(_parent_0, _class_0) -- 295
	end -- 295
	Tyrant = _class_0 -- 295
end -- 633
local Public -- 635
do -- 635
	local _class_0 -- 635
	local _parent_0 = OS -- 635
	local _base_0 = { -- 635
		greeting = { -- 637
			"boot sequence now", -- 637
			"finalizing public system", -- 638
			"greetings citizen", -- 639
			"LONG LIVE THE EMPEROR." -- 640
		}, -- 643
		advice = { -- 644
			"One corpse's trash is another corpse's treasure.", -- 644
			"Bottles are useful. Don't smash them.", -- 645
			"Snorting broken glass may give you special powers.", -- 646
			"Burn your trash, eat your plastic, never stop smoking.", -- 647
			"Liver Failure doesn't take kindly to slackers.", -- 648
			"You live because you are useful enough to be exploited.", -- 649
			"Chew with your good teeth.", -- 650
			"Violence doesn't solve every problem, only some of them.", -- 651
			"Flesh capsules are very delicate, be careful with them.", -- 652
			"You do not need a gun. You do not want a gun.", -- 653
			"Don't venture too far into the tunnels.", -- 654
			"Evil things are bad.", -- 655
			"Play catch with people.", -- 656
			"Playing is fun.", -- 657
			"Play teeth. Teeth is fun.", -- 658
			"Rules are the rules.", -- 659
			"M y  h e a d ... M y  b r a i n ... M y  b e e r ...", -- 660
			"Eat and drink before taking your medicine.", -- 661
			"Bodily fluids can spread pathogens.", -- 662
			"Your safety is not a priority.", -- 663
			"It's what you wanted", -- 664
			"Radar spelled backwards is Radar.", -- 665
			"You're thinking about it, aren't you?", -- 666
			"But seriously though,", -- 667
			"At least you're not dead yet.", -- 668
			"At least you're not teeth yet.", -- 669
			"I wanna go home.", -- 670
			"Please", -- 671
			"You will get what you deserve.", -- 672
			"Booze loves company.", -- 673
			"Misery loves company.", -- 674
			"Teeth love company.", -- 675
			"Corpses love company.", -- 676
			"The things you put in your mouth can hurt you.", -- 677
			"Make sure you're ready for the hangover tomorrow.", -- 678
			"Buying things feels so good, doesn't it?", -- 679
			"We work until we die, and that's the way we like it.", -- 680
			"Blood brothers protect each other.", -- 681
			"You can't trust that people are what they say.", -- 682
			"Some people don't look like you. This is a problem.", -- 683
			"What's a little brawl between friends?", -- 684
			"It's too late now.", -- 685
			"you work to rent a bed so can rest for work tomorrow" -- 686
		}, -- 689
		commands = { -- 690
			[":help"] = { -- 691
				Callback = function(self, ply, term, args) -- 691
					local _with_0 = gterm -- 692
					_with_0:Broadcast(term, "  COMMANDS:") -- 695
					for k, v in SortedPairs(self:GetCommands()) do -- 696
						_with_0:Broadcast(term, "  * " .. tostring(k), GT_COL_INFO) -- 697
						_with_0:Broadcast(term, "    " .. tostring(v.help)) -- 698
					end -- 698
					_with_0:Broadcast(term, "  end list", GT_COL_INTL) -- 699
					return _with_0 -- 692
				end, -- 691
				help = "Basic usage instructions." -- 700
			}, -- 690
			[":cls"] = { -- 703
				Callback = function(self, ply, term) -- 703
					for i = 0, term.max_lines do -- 704
						local time = math.Rand(0.01, 0.04) -- 705
						timer.Simple(i * time, function() -- 706
							if IsValid(term) then -- 707
								return gterm:Broadcast(term, "", MSG_COL_NIL, i) -- 707
							end -- 707
						end) -- 706
					end -- 707
					return -- 708
				end, -- 703
				help = "Clear the screen." -- 709
			}, -- 702
			[":advice"] = { -- 712
				Callback = function(self, ply, term) -- 712
					local advice = self.advice[math.random(#self.advice)] -- 713
					if IsValid(term) then -- 714
						return gterm:Broadcast(term, advice, MSG_COL_INFO) -- 714
					end -- 714
				end, -- 712
				help = "Consult the infinite wisdom." -- 715
			}, -- 711
			[":taxes"] = { -- 718
				Callback = function(self, ply, term, args) -- 718
					local taxes = GAMEMODE.taxes -- 719
					gterm:Broadcast(term, "TAXES OF THE LAND:", GT_COL_INFO) -- 720
					for k, v in pairs(taxes) do -- 721
						gterm:Broadcast(term, "  " .. tostring(k) .. " tax is " .. tostring(v) .. "%", GT_COL_SUCC) -- 721
					end -- 721
					return gterm:Broadcast(term, "end list", GT_COL_INTL) -- 722
				end, -- 718
				help = "View what you people owe." -- 723
			}, -- 717
			[":laws"] = { -- 726
				Callback = function(self, ply, term, args) -- 726
					local laws = GAMEMODE:Laws() -- 727
					gterm:Broadcast(term, "LAWS OF THE LAND:", GT_COL_INFO) -- 728
					for k, v in ipairs(laws) do -- 729
						gterm:Broadcast(term, "  " .. tostring(k) .. ". " .. tostring(v), GT_COL_WRN) -- 729
					end -- 729
					return gterm:Broadcast(term, "end list", GT_COL_INTL) -- 730
				end, -- 726
				help = "View the laws of this land." -- 731
			}, -- 725
			[":whoami"] = { -- 734
				Callback = function(self, ply, term, args) -- 734
					gterm:Broadcast(term, "this experimental feature is still in testing", GT_COL_WRN) -- 735
					return gterm:Broadcast(term, "try later", GT_COL_WRN) -- 736
				end, -- 734
				help = "View social information." -- 737
			} -- 733
		}, -- 740
		lifetime = 60 * 3, -- 741
		Initialized = function(self, term) -- 741
			_class_0.__parent.__base.Initialized(self, term) -- 742
			term.live_until = CurTime() + self.lifetime -- 743
			return gterm:Broadcast(term, "DEATH when idle time exceeds " .. tostring(string.NiceTime(self.lifetime)), GT_COL_INFO) -- 744
		end, -- 745
		ReceiveInput = function(self, term, ply) -- 745
			term.live_until = CurTime() + self.lifetime -- 746
		end, -- 747
		Think = function(self, term) -- 747
			local ct = CurTime() -- 748
			if not term:GetActive() then -- 749
				return -- 749
			end -- 749
			if term.warn_cooldown and ct < term.warn_cooldown then -- 750
				return -- 750
			end -- 750
			if not term.live_until then -- 751
				term.live_until = ct + self.lifetime -- 751
			end -- 751
			local time_left = term.live_until - CurTime() -- 752
			if math.floor(time_left) % 60 == 0 then -- 753
				if math.floor(time_left) <= 1 then -- 754
					gterm:Broadcast(term, "DEATH", GT_COL_INTL) -- 755
					return timer.Simple(math.Rand(2, 5), function() -- 756
						if IsValid(term) and term:GetActive() then -- 757
							for i = 0, term.max_lines do -- 758
								if IsValid(term) then -- 759
									gterm:Broadcast(term, "", nil, i) -- 759
								end -- 759
							end -- 759
							return gterm.OS:Call(term, "ShutDown") -- 760
						end -- 757
					end) -- 760
				else -- 762
					return gterm:Broadcast(term, "DEATH in " .. tostring(string.NiceTime(time_left)), GT_COL_INFO) -- 762
				end -- 754
			end -- 753
		end -- 635
	} -- 635
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 763
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 635
			_base_0[_key_0] = _val_0 -- 635
		end -- 635
	end -- 763
	if _base_0.__index == nil then -- 635
		_base_0.__index = _base_0 -- 635
	end -- 763
	setmetatable(_base_0, _parent_0.__base) -- 635
	_class_0 = setmetatable({ -- 635
		__init = function(self, ...) -- 635
			return _class_0.__parent.__init(self, ...) -- 635
		end, -- 635
		__base = _base_0, -- 635
		__name = "Public", -- 635
		__parent = _parent_0 -- 635
	}, { -- 635
		__index = function(cls, name) -- 635
			local val = rawget(_base_0, name) -- 635
			if val == nil then -- 635
				local parent = rawget(cls, "__parent") -- 635
				if parent then -- 635
					return parent[name] -- 635
				end -- 635
			else -- 635
				return val -- 635
			end -- 635
		end, -- 635
		__call = function(cls, ...) -- 635
			local _self_0 = setmetatable({ }, _base_0) -- 635
			cls.__init(_self_0, ...) -- 635
			return _self_0 -- 635
		end -- 635
	}) -- 635
	_base_0.__class = _class_0 -- 635
	if _parent_0.__inherited then -- 635
		_parent_0.__inherited(_parent_0, _class_0) -- 635
	end -- 635
	Public = _class_0 -- 635
end -- 763
net.Receive("evilrp_terminal_endconsole", function(len, ply) -- 764
	local idx = net.ReadUInt(16) -- 765
	local term = Entity(idx) -- 766
	local text = net.ReadString() -- 767
	if not (IsValid(term) and term.GetUser) then -- 768
		return -- 768
	end -- 768
	local user = term:GetUser() -- 769
	if not (IsValid(user) and user == ply) then -- 770
		return -- 770
	end -- 770
	if (text == "") or (text == " ") then -- 771
		term:SetUser(nil) -- 772
		net.Start("evilrp_terminal_endtyping") -- 773
		net.Send(ply) -- 774
		return -- 775
	end -- 771
	gterm.OS:Call(term, "ReceiveInput", ply) -- 776
	if term.password and not client["pass_authed_" .. tostring(idx)] then -- 777
		if text == term.password then -- 778
			ply["pass_authed_" .. tostring(idx)] = true -- 779
			gterm:Broadcast(term, "password accepted", GT_COL_INFO) -- 780
			return -- 781
		else -- 783
			gterm:Broadcast(term, "password required", GT_COL_INFO) -- 783
			return -- 784
		end -- 778
	end -- 777
	if string.sub(text, 1, 1) == ":" then -- 785
		local sys = OS.distros[term:GetOS()] -- 786
		if sys then -- 787
			for k, v in pairs(sys:GetCommands()) do -- 788
				local cmd = string.sub(string.lower(text), 1, string.len(k)) -- 789
				if k == cmd then -- 790
					local text2 = string.sub(text, string.len(cmd) + 2) -- 791
					local quote = (string.sub(text2, 1, 1) ~= "\"") -- 792
					local args = { } -- 793
					for chunk in string.gmatch(text2, "[^\"]+") do -- 794
						quote = not quote -- 795
						if quote then -- 796
							args[#args + 1] = chunk -- 797
						else -- 799
							for chunk in string.gmatch(chunk, "[^ ]+") do -- 799
								args[#args + 1] = chunk -- 799
							end -- 799
						end -- 796
					end -- 799
					local success, value = pcall(v.Callback, sys, ply, term, args) -- 800
					if success then -- 801
						gterm:Broadcast(term, text, GT_COL_CMD) -- 802
					else -- 804
						gterm:Broadcast(term, value, GT_COL_ERR) -- 804
					end -- 801
					return -- 805
				end -- 790
			end -- 805
			text = tostring(string.sub(text, 2)) .. ": command not found" -- 806
			gterm:Broadcast(term, text, GT_COL_ERR) -- 807
			return -- 808
		else -- 810
			gterm:Broadcast(term, "DEATH", GT_COL_INTL) -- 812
		end -- 787
		if term.accepting_input then -- 813
			local quote = (string.sub(text, 1, 1) ~= "\"") -- 814
			local args = { } -- 815
			for chunk in string.match(text, "[^\"]+") do -- 816
				quote = not quote -- 817
				if quote then -- 818
					args[#args + 1] = chunk -- 819
				else -- 821
					for chunk in string.gmatch(chunk, "[^ ]+") do -- 821
						args[#args + 1] = chunk -- 821
					end -- 821
				end -- 818
			end -- 821
			local callback = term.input_callback -- 822
			if callback and args then -- 823
				callback(ply, args) -- 823
			end -- 823
			term.accepting_input = nil -- 824
			term.input_callback = nil -- 825
			return -- 826
		end -- 813
	end -- 785
	local sys = OS.distros[term:GetOS()] -- 827
	local name = sys and sys.unique_id or "unknown" -- 828
	local finalized = tostring(("<"):Escape()) .. tostring(name) .. "@" .. tostring(term:EntIndex()) .. tostring((">"):Escape()) .. " " .. tostring(text) -- 829
	return gterm:Broadcast(term, finalized, GT_COL_CMD) -- 830
end) -- 764
net.Receive("evilrp_terminal_scroll", function(len, ply) -- 832
	local idx = net.ReadUInt(16) -- 833
	local dir = net.ReadInt(4) -- 834
	local term = Entity(idx) -- 835
	print(dir) -- 836
	print(term) -- 837
	if not (IsValid(term) and term.GetUser) then -- 839
		return -- 839
	end -- 839
	local user = term:GetUser() -- 840
	if not (IsValid(user) and user == ply) then -- 841
		return -- 841
	end -- 841
	term.history = term.history or { } -- 843
	local maxlines = term.max_lines or 25 -- 844
	term.offset = term.offset or 0 -- 845
	if dir == 1 then -- 847
		term.offset = term.offset + 1 -- 848
	elseif dir == -1 then -- 849
		term.offset = term.offset - 1 -- 850
	end -- 847
	local maxscroll = math.max(0, #term.history - maxlines) -- 852
	term.offset = math.Clamp(term.offset, 0, maxscroll) -- 853
	for i = 0, maxlines do -- 855
		gterm:Broadcast(term, "", GT_COL_NIL, i) -- 856
	end -- 857
	local start = #term.history - maxlines - term.offset + 1 -- 858
	start = math.max(1, start) -- 859
	local pos = 0 -- 861
	for i = start, start + maxlines - 1 do -- 862
		local line = term.history[i] -- 863
		if line then -- 864
			gterm:Broadcast(term, line.msg, line.col, pos) -- 865
		end -- 864
		pos = pos + 1 -- 866
	end -- 866
end) -- 832
return MsgC(Color(255, 0, 0), "INITIALIZED EVILRP TERMINALS\n") -- 868
