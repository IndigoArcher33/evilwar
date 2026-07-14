local _list_0 = {
	"evilrp_terminal_flicker",
	"evilrp_terminal_activeconsole",
	"evilrp_terminal_endconsole",
	"evilrp_terminal_addline",
	"evilrp_terminal_endtyping"
}
for _index_0 = 1, #_list_0 do
	local msg = _list_0[_index_0]
	util.AddNetworkString(msg)
end
local TerminalPowered
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = "hl1/ambience/computalk2.wav",
		pitch = {
			150,
			200
		},
		volume = 0.2,
		level = SNDLVL_40DB
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "TerminalPowered",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	TerminalPowered = _class_0
end
local TerminalDead
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = "hl1/ambience/deadsignal2.wav",
		pitch = {
			150,
			200
		},
		volume = 0.2,
		level = SNDLVL_40DB
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "TerminalDead",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	TerminalDead = _class_0
end
local TerminalDeath
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = "kidneydagger/printer_death.wav",
		pitch = {
			150,
			200
		},
		volume = 0.2,
		level = SNDLVL_40DB
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "TerminalDeath",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	TerminalDeath = _class_0
end
local XOMBOTAX
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = "dysphoria/xombocom/kommandantenbefehlen.ogg",
		pitch = {
			80,
			110
		},
		level = SNDLVL_NONE
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "XOMBOTAX",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	XOMBOTAX = _class_0
end
GT_COL_NIL = 0
GT_COL_MSG = 1
GT_COL_WRN = 2
GT_COL_ERR = 3
GT_COL_INFO = 4
GT_COL_INTL = 5
GT_COL_CMD = 6
GT_COL_SUCC = 7
gterm = gterm or { }
gterm.Broadcast = function(self, ent, text, color_type, pos)
	if color_type == nil then
		color_type = GT_COL_MSG
	end
	if not IsValid(ent) then
		return
	end
	local idx = ent:EntIndex()
	local output
	if string.len(text) > ent.max_chars then
		output = { }
		local expected = math.floor(string.len(text) / ent.max_chars)
		for i = 0, expected do
			output[i + 1] = string.sub(text, i * ent.max_chars, (i * ent.max_chars) + (ent.max_chars - 1))
		end
	end
	if output then
		for k, v in ipairs(output) do
			net.Start("evilrp_terminal_addline")
			net.WriteUInt(idx, 16)
			net.WriteString(v)
			net.WriteUInt(color_type, 8)
			if pos then
				net.WriteInt(pos + (k - 1), 16)
			else
				net.WriteInt(-1, 16)
			end
			net.Broadcast()
		end
	else
		net.Start("evilrp_terminal_addline")
		net.WriteUInt(idx, 16)
		net.WriteString(text)
		net.WriteUInt(color_type, 8)
		net.WriteInt(pos or -1, 16)
		return net.Broadcast()
	end
end
gterm.GetInput = function(self, ent, callback)
	ent.accepting_input = true
	ent.input_callback = callback
end
local TerminalEngage
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = "buttons/blip1.wav",
		pitch = {
			60,
			75
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "TerminalEngage",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	TerminalEngage = _class_0
end
do
	local _class_0
	local _base_0 = {
		commands = { },
		GetCommands = function(self)
			return self.commands
		end,
		name = "OS",
		GetName = function(self)
			return self.name
		end,
		greeting = "I don't like how you're looking at me.",
		GetWarmUpText = function(self)
			local text = self.greeting
			if isstring(text) then
				text = {
					text
				}
			end
			return text
		end,
		GetUniqueID = function(self)
			return self.unique_id
		end,
		UserInit = function(self, term, ply)
			return term:EmitSound("TerminalEngage")
		end,
		Initialized = function(self, term)
			gterm[term:EntIndex()] = { }
			return term:SetSoundLoop(term:StartLoopingSound("TerminalPowered"))
		end,
		ShutDown = function(self, term)
			if not term:GetActive() then
				return
			end
			local loop = term:GetSoundLoop()
			if loop then
				term:StopLoopingSound(loop)
			end
			term:EmitSound("TerminalDeath")
			term:SetActive(false)
			gterm[term:EntIndex()] = { }
		end
	}
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	_class_0 = setmetatable({
		__init = function() end,
		__base = _base_0,
		__name = "OS"
	}, {
		__index = _base_0,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	local self = _class_0;
	self.Call = function(self, ent, name, ...)
		if IsValid(ent) then
			local key = ent:GetOS()
			local sys = self.distros[key]
			if not IsValid(ent) then
				return
			end
			if not (sys and sys[name]) then
				return
			end
			if not isfunction(sys[name]) then
				return
			end
			local success, value = pcall(sys[name], sys, ent, ...)
			if success then
				return value
			end
		end
	end
	self.distros = { }
	self.__inherited = function(self, child)
		child.unique_id = child.__name:lower()
		self.distros[child.unique_id] = child
	end
	OS = _class_0
end
gterm.OS = OS
local Basic
do
	local _class_0
	local _parent_0 = OS
	local _base_0 = {
		greeting = {
			"BOOT SEQUENCE NOW",
			"FINALIZING BASIC SYSTEM",
			"GIVE ME PURPOSE"
		},
		commands = {
			[":help"] = {
				Callback = function(self, ply, term, args)
					local _with_0 = gterm
					_with_0:Broadcast(term, "  COMMANDS:")
					_with_0:Broadcast(term, "")
					for k, v in SortedPairs(self:GetCommands()) do
						_with_0:Broadcast(term, "  * " .. tostring(k), GT_COL_INFO)
						_with_0:Broadcast(term, "    " .. tostring(v.help))
					end
					_with_0:Broadcast(term, "  end list", GT_COL_INTL)
					return _with_0
				end,
				help = "Basic usage instructions."
			},
			[":cls"] = {
				Callback = function(self, ply, term)
					for i = 0, 25 do
						local time = math.Rand(0.01, 0.04)
						timer.Simple(i * time, function()
							if IsValid(term) then
								return gterm:Broadcast(term, "", MSG_COL_NIL, i)
							end
						end)
					end
					return
				end,
				help = "Clear the screen."
			},
			[":os"] = {
				Callback = function(self, ply, term, args)
					local cmd = args[1]
					if "install" == cmd then
						local info = args[2]
						if not info then
							gterm:Broadcast(term, "invalid system identifier", GT_COL_ERR)
							return
						elseif info == "basic" then
							gterm:Broadcast(term, "this is already the basic system", GT_COL_ERR)
							return
						end
						local sys = OS.distros[info]
						if not system then
							gterm:Broadcast(term, "os '" .. tostring(info) .. "' not found", GT_COL_ERR)
							return
						end
						term.locked = true
						gterm:Broadcast(term, "installing '" .. tostring(info) .. "'", GT_COL_INTL)
						return timer.Simple(1, function()
							if not IsValid(term) then
								return
							end
							for i = 0, 25 do
								gterm:Broadcast(term, "", nil, i)
							end
							do
								local _with_0 = gterm
								_with_0:Broadcast(term, "IDLE", GT_COL_MSG, 18)
								_with_0:Broadcast(term, "", GT_COL_MSG, 19)
								_with_0:Broadcast(term, "     [                         ] 0%", GT_COL_MSG, 20)
								_with_0:Broadcast(term, "", GT_COL_MSG, 21)
							end
							local messages = {
								"inspecting disk space",
								"allocating disk space",
								"retrieving required resources",
								"unpacking resources",
								"retrieving system requirements",
								"validating file integrity",
								"compiling packages",
								"exporting packages to file system",
								"setting up access data",
								"setting up system profile",
								"setting up commands",
								"finalizing install"
							}
							local time = math.Rand(0.5, 1.5)
							for i = 1, 25 do
								time = time + math.Rand(0.05, 0.25)
								timer.Simple(time, function()
									if IsValid(term) then
										local msg_id = math.Clamp(i, 1, #messages)
										gterm:Broadcast(term, "     " .. tostring(messages[msg_id]), GT_COL_MSG, 18)
										gterm:Broadcast(term, "     [" .. tostring(string.rep("=", i)) .. tostring(string.rep(" ", 25 - i)) .. "] " .. tostring(100 * math.Round(i / 25, 2)) .. "%", GT_COL_MSG, 20)
										if i == 25 then
											for i = 0, 25 do
												if IsValid(term) then
													gterm:Broadcast(term, "", nil, i)
												end
											end
											gterm:Broadcast(term, "SHUTTING DOWN, PLEASE RESTART TERMINAL", GT_COL_INTL, 1)
											return timer.Simple(math.Rand(1, 3), function()
												if IsValid(term) then
													term:SetOS(info)
													term:SetActive(false)
													term.locked = false
													return term
												end
											end)
										end
									end
								end)
							end
						end)
					elseif "list" == cmd then
						local info = args[2]
						gterm:Broadcast(term, "AVAILABLE OS PACKAGES:", GT_COL_INFO)
						gterm:Broadcast(term, "", GT_COL_MSG)
						local count = 0
						for k, v in SortedPairs(gterm.OS.distros) do
							if istable(v) and v.GetName and v.GetUniqueID and v:GetUniqueID() ~= "basic" then
								count = count + 1
								gterm:Broadcast(term, "     " .. tostring(count) .. ": " .. tostring(v:GetUniqueID()) .. " (" .. tostring(v:GetName()) .. ")")
							end
						end
					else
						local _with_0 = gterm
						_with_0:Broadcast(term, "OPERATING SYSTEM CONFIG", GT_COL_INFO)
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO)
						_with_0:Broadcast(term, "    allows configuration of the operating system")
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO)
						_with_0:Broadcast(term, "    :os install - install operating system package")
						_with_0:Broadcast(term, "    :os list - list available operating system packages")
						return _with_0
					end
				end,
				help = "Operating system configuration."
			},
			[":die"] = {
				Callback = function(self, ply, term)
					gterm:Broadcast(term, "SHUTTING DOWN")
					return timer.Simple(math.Rand(2, 5), function()
						if IsValid(term) then
							for i = 0, term.max_lines do
								if IsValid(term) then
									gterm:Broadcast(term, "", nil, i)
								end
							end
							return gterm.OS:Call(term, "ShutDown")
						end
					end)
				end,
				help = "Turn the computer off."
			}
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Basic",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Basic = _class_0
end
local Tyrant
do
	local _class_0
	local _parent_0 = OS
	local _base_0 = {
		name = "TYRANT SYSTEM 0.6.66",
		greeting = {
			"boot sequence now",
			"loading tyrant system 0.6.66",
			"tyrant system loaded. greetings kommandant",
			"LIVER FAILURE FOREVER"
		},
		commands = {
			[":help"] = {
				Callback = function(self, ply, term, args)
					if ply:Team() ~= TEAM_KOMMANDANT then
						gterm:Broadcast(term, "begone with you", GT_COL_ERR)
						return
					end
					local _with_0 = gterm
					_with_0:Broadcast(term, "  COMMANDS:")
					_with_0:Broadcast(term, "")
					for k, v in SortedPairs(self:GetCommands()) do
						_with_0:Broadcast(term, "  * " .. tostring(k), GT_COL_INFO)
						_with_0:Broadcast(term, "    " .. tostring(v.help))
					end
					_with_0:Broadcast(term, "  end list")
					return _with_0
				end,
				help = "Basic usage instructions."
			},
			[":broadcast"] = {
				Callback = function(self, ply, term, args)
					if ply:Team() ~= TEAM_KOMMANDANT then
						gterm:Broadcast(term, "begone with you", GT_COL_ERR)
						return
					end
					local text = table.concat(args, " ")
					text = Chat.Autopretty(ply, text:upper())
					do
						local _with_0 = gterm
						_with_0:Broadcast(term, text, GT_COL_ERR)
					end
					PlaySoundGlobal("XOMBOKOM")
					local _list_1 = player.GetAll()
					for _index_0 = 1, #_list_1 do
						local p = _list_1[_index_0]
						p:SendChat("Broadcast", text)
					end
					local _list_2 = ents.FindByClass("terminal*")
					for _index_0 = 1, #_list_2 do
						local term = _list_2[_index_0]
						if not IsValid(term) then
							goto _continue_0
						end
						do
							local _exp_0 = term:GetOS()
							if "public" == _exp_0 then
								net.Start("evilrp_terminal_flicker")
								net.WriteUInt(16, term:EntIndex())
								net.Broadcast()
								gterm:Broadcast(term, text, GT_COL_ERR)
							end
						end
						::_continue_0::
					end
				end,
				help = "Demand of your people with the XOMBOKOM."
			},
			[":tax"] = {
				Callback = function(self, ply, term, args)
					if ply:Team() ~= TEAM_KOMMANDANT then
						gterm:Broadcast(term, "begone with you", GT_COL_ERR)
						return
					end
					local taxes = GAMEMODE.taxes
					local cmd = args[1]
					if "list" == cmd then
						gterm:Broadcast(term, "TAXES OF THE LAND:")
						for k, v in pairs(taxes) do
							gterm:Broadcast(term, "  " .. tostring(k) .. " tax is " .. tostring(v) .. "%", GT_COL_SUCC)
							gterm:Broadcast(term, "    (" .. tostring(GAMEMODE.taxes_stored[k]) .. " bones gathered)", GT_COL_SUCC)
						end
						return gterm:Broadcast(term, "end list", GT_COL_INTL)
					elseif "set" == cmd then
						local tax = args[2]
						if not (tax and taxes[tax]) then
							gterm:Broadcast(term, "invalid tax name given?", GT_COL_ERR)
							return
						end
						local new_pct = args[3]
						new_pct = tonumber(new_pct)
						if not new_pct then
							gterm:Broadcast(term, "invalid tax percentage given?", GT_COL_ERR)
							return
						elseif new_pct < 0 then
							gterm:Broadcast(term, "the taxes cannot fall into the negative", GT_COL_ERR)
							return
						elseif new_pct > 100 then
							gterm:Broadcast(term, "the taxes cannot exceed one hundred percent", GT_COL_ERR)
							return
						end
						taxes[tax] = new_pct
						SetGlobalInt("tax_" .. tostring(tax), new_pct)
						PlaySoundGlobal("XOMBOTAX")
						local text = "the " .. tostring(tax) .. " tax is now " .. tostring(new_pct) .. "%"
						gterm:Broadcast(term, text, GT_COL_SUCC)
						local _list_1 = ents.FindByClass("terminal*")
						for _index_0 = 1, #_list_1 do
							local term = _list_1[_index_0]
							if not IsValid(term) then
								goto _continue_0
							end
							do
								local _exp_0 = term:GetOS()
								if "public" == _exp_0 then
									net.Start("evilrp_terminal_flicker")
									net.WriteUInt(16, term:EntIndex())
									net.Broadcast()
									gterm:Broadcast(term, text, GT_COL_SUCC)
								end
							end
							::_continue_0::
						end
					elseif "collect" == cmd then
						local tax = args[2]
						local reward = GAMEMODE.taxes_stored[tax]
						if not (tax and taxes[tax]) then
							gterm:Broadcast(term, "invalid tax name given?", GT_COL_ERR)
							return
						end
						if not (reward > 0) then
							gterm:Broadcast(term, "there is nothing to collect from " .. tostring(tax), GT_COL_ERR)
							return
						end
						GAMEMODE.taxes_stored[tax] = 0
						gterm:Broadcast(term, tostring(reward) .. " bones from " .. tostring(tax) .. " are now yours", GT_COL_SUCC)
						return ply:AddMoney(reward, "The Power")
					else
						local _with_0 = gterm
						_with_0:Broadcast(term, "TAX INTERFACE", GT_COL_INFO)
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO)
						_with_0:Broadcast(term, "    gives you what you deserve")
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO)
						_with_0:Broadcast(term, "    :tax list - list the current taxes")
						_with_0:Broadcast(term, "    :tax set NAME 0-100 - alter the taxes")
						_with_0:Broadcast(term, "    :tax collect NAME - the best part of this")
						return _with_0
					end
				end,
				help = "The reward for your fantastic service."
			},
			[":cls"] = {
				Callback = function(self, ply, term)
					if ply:Team() ~= TEAM_KOMMANDANT then
						gterm:Broadcast(term, "begone with you", GT_COL_ERR)
						return
					end
					for i = 0, term.max_lines do
						local time = math.Rand(0.01, 0.04)
						timer.Simple(i * time, function()
							if IsValid(term) then
								return gterm:Broadcast(term, "", MSG_COL_NIL, i)
							end
						end)
					end
					return
				end,
				help = "Clear the screen."
			},
			[":stocks"] = {
				Callback = function(self, ply, term, args)
					local stocks = GAMEMODE.Stocks
					gterm:Broadcast(term, "STOCKS OF THE LAND:", GT_COL_INFO)
					for k, v in pairs(stocks) do
						gterm:Broadcast(term, "  " .. tostring(k) .. "| " .. tostring(v) .. " units", GT_COL_SUCC)
					end
					return gterm:Broadcast(term, "end list", GT_COL_INTL)
				end,
				help = "View what you own."
			},
			[":die"] = {
				Callback = function(self, ply, term)
					if ply:Team() ~= TEAM_KOMMANDANT then
						gterm:Broadcast(term, "begone with you", GT_COL_ERR)
						return
					end
					gterm:Broadcast(term, "SHUTTING DOWN")
					return timer.Simple(math.Rand(2, 5), function()
						if IsValid(term) then
							for i = 0, term.max_lines do
								if IsValid(term) then
									gterm:Broadcast(term, "", nil, i)
								end
							end
							term:SetActive(false)
							return gterm.OS:Call(term, "ShutDown")
						end
					end)
				end,
				help = "Turn the computer off."
			},
			[":law"] = {
				Callback = function(self, ply, term, args)
					if ply:Team() ~= TEAM_KOMMANDANT then
						gterm:Broadcast(term, "begone with you", GT_COL_ERR)
						return
					end
					local laws = GAMEMODE:Laws()
					local cmd = args[1]
					if "list" == cmd then
						gterm:Broadcast(term, "LAWS OF THE LAND:", GT_COL_INFO)
						for k, v in ipairs(laws) do
							gterm:Broadcast(term, "  " .. tostring(k) .. ". " .. tostring(v))
						end
						return gterm:Broadcast(term, "  end list", GT_COL_INTL)
					elseif "add" == cmd then
						if #args < 2 then
							gterm:Broadcast(term, "no law text provided?", GT_COL_ERR)
							return
						end
						table.remove(args, 1)
						local text = table.concat(args, " ")
						do
							local _obj_0 = GAMEMODE.laws
							_obj_0[#_obj_0 + 1] = text
						end
						return gterm:Broadcast(term, "created law " .. tostring(#GAMEMODE:Laws()) .. ": \"" .. tostring(text) .. "\"", GT_COL_SUCC)
					elseif "remove" == cmd then
						if #args < 2 then
							gterm:Broadcast(term, "no law specified?", GT_COL_ERR)
							return
						end
						local num = tonumber(args[2])
						if 0 == num or nil == num then
							gterm:Broadcast(term, "invalid number given?", GT_COL_ERR)
							return
						else
							if num > #laws then
								gterm:Broadcast(term, "invalid number given? (law count: " .. tostring(#laws) .. ")", GT_COL_ERR)
								return
							elseif num <= #GAMEMODE.default_laws then
								gterm:Broadcast(term, "cannot remove laws numbered " .. tostring(#GAMEMODE.default_laws) .. " or less", GT_COL_ERR)
								return
							end
							local law = table.remove(GAMEMODE.laws, num - #GAMEMODE.default_laws)
							return gterm:Broadcast(term, "deleted law " .. tostring(num) .. ": \"" .. tostring(law) .. "\"", GT_COL_ERR)
						end
					elseif "rotate" == cmd then
						if #args < 3 then
							gterm:Broadcast(term, "invalid arguments?", GT_COL_ERR)
							return
						end
						local first = tonumber(args[2])
						local second = tonumber(args[3])
						if (first == 0 or first == nil) or (second == 0 or second == nil) then
							gterm:Broadcast(term, "invalid number given?", GT_COL_ERR)
							return
						elseif first > #laws or second > #laws then
							gterm:Broadcast(term, "invalid number given? (law count: " .. tostring(laws), GT_COL_ERR)
							return
						elseif first <= #GAMEMODE.default_laws or second <= #GAMEMODE.default_laws then
							gterm:Broadcast(term, "cannot rotate laws numbered " .. tostring(#GAMEMODE.default_laws) .. " or less", GT_COL_ERR)
							return
						end
						first = first - #GAMEMODE.default_laws
						local first_law = GAMEMODE.laws[first]
						second = second - #GAMEMODE.default_laws
						local second_law = GAMEMODE.laws[second]
						GAMEMODE.laws[first] = second_law
						GAMEMODE.laws[second] = first_law
						return gterm:Broadcast(term, "rotated laws " .. tostring(args[2]) .. "/" .. tostring(args[3]) .. ".", GT_COL_SUCC)
					else
						local _with_0 = gterm
						_with_0:Broadcast(term, "LAW INTERFACE", GT_COL_INFO)
						_with_0:Broadcast(term, "  INFO:", GT_COL_INFO)
						_with_0:Broadcast(term, "    makes your wishes come true")
						_with_0:Broadcast(term, "  HELP:", GT_COL_INFO)
						_with_0:Broadcast(term, "    :law list - list the current laws")
						_with_0:Broadcast(term, "    :law add <your law's text> - add a new law")
						_with_0:Broadcast(term, "    :law remove # - remove a law by its number")
						_with_0:Broadcast(term, "    :law rotate #1 #2 - two laws switch places")
						return _with_0
					end
				end,
				help = "View and manipulate the laws of this land."
			}
		}
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Tyrant",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Tyrant = _class_0
end
local Public
do
	local _class_0
	local _parent_0 = OS
	local _base_0 = {
		greeting = {
			"boot sequence now",
			"finalizing public system",
			"greetings citizen",
			"LIVER FAILURE FOREVER."
		},
		advice = {
			"One corpse's trash is another corpse's treasure.",
			"Bottles are useful. Don't smash them.",
			"Snorting broken glass may give you special powers.",
			"Burn your trash, eat your plastic, never stop smoking.",
			"Liver Failure doesn't take kindly to slackers.",
			"You live because you are useful enough to be exploited.",
			"Chew with your good teeth.",
			"Violence doesn't solve every problem, only some of them.",
			"Flesh capsules are very delicate, be careful with them.",
			"You do not need a gun. You do not want a gun.",
			"Don't venture too far into the tunnels.",
			"Evil things are bad.",
			"Play catch with people.",
			"Playing is fun.",
			"Play teeth. Teeth is fun.",
			"Rules are the rules.",
			"M y  h e a d ... M y  b r a i n ... M y  b e e r ...",
			"Eat and drink before taking your medicine.",
			"Bodily fluids can spread pathogens.",
			"Your safety is not a priority.",
			"It's what you wanted",
			"Radar spelled backwards is Radar.",
			"You're thinking about it, aren't you?",
			"But seriously though,",
			"At least you're not dead yet.",
			"At least you're not teeth yet.",
			"I wanna go home.",
			"Please",
			"You will get what you deserve.",
			"Booze loves company.",
			"Misery loves company.",
			"Teeth love company.",
			"Corpses love company.",
			"The things you put in your mouth can hurt you.",
			"Make sure you're ready for the hangover tomorrow.",
			"Buying things feels so good, doesn't it?",
			"We work until we die, and that's the way we like it.",
			"Blood brothers protect each other.",
			"You can't trust that people are what they say.",
			"Some people don't look like you. This is a problem.",
			"What's a little brawl between friends?",
			"It's too late now.",
			"you work to rent a bed so can rest for work tomorrow"
		},
		commands = {
			[":help"] = {
				Callback = function(self, ply, term, args)
					local _with_0 = gterm
					_with_0:Broadcast(term, "  COMMANDS:")
					for k, v in SortedPairs(self:GetCommands()) do
						_with_0:Broadcast(term, "  * " .. tostring(k), GT_COL_INFO)
						_with_0:Broadcast(term, "    " .. tostring(v.help))
					end
					_with_0:Broadcast(term, "  end list", GT_COL_INTL)
					return _with_0
				end,
				help = "Basic usage instructions."
			},
			[":cls"] = {
				Callback = function(self, ply, term)
					for i = 0, term.max_lines do
						local time = math.Rand(0.01, 0.04)
						timer.Simple(i * time, function()
							if IsValid(term) then
								return gterm:Broadcast(term, "", MSG_COL_NIL, i)
							end
						end)
					end
					return
				end,
				help = "Clear the screen."
			},
			[":advice"] = {
				Callback = function(self, ply, term)
					local advice = self.advice[math.random(#self.advice)]
					if IsValid(term) then
						return gterm:Broadcast(term, advice, MSG_COL_INFO)
					end
				end,
				help = "Consult the infinite wisdom."
			},
			[":taxes"] = {
				Callback = function(self, ply, term, args)
					local taxes = GAMEMODE.taxes
					gterm:Broadcast(term, "TAXES OF THE LAND:", GT_COL_INFO)
					for k, v in pairs(taxes) do
						gterm:Broadcast(term, "  " .. tostring(k) .. " tax is " .. tostring(v) .. "%", GT_COL_SUCC)
					end
					return gterm:Broadcast(term, "end list", GT_COL_INTL)
				end,
				help = "View what you people owe."
			},
			[":laws"] = {
				Callback = function(self, ply, term, args)
					local laws = GAMEMODE:Laws()
					gterm:Broadcast(term, "LAWS OF THE LAND:", GT_COL_INFO)
					for k, v in ipairs(laws) do
						gterm:Broadcast(term, "  " .. tostring(k) .. ". " .. tostring(v), GT_COL_WRN)
					end
					return gterm:Broadcast(term, "end list", GT_COL_INTL)
				end,
				help = "View the laws of this land."
			},
			[":whoami"] = {
				Callback = function(self, ply, term, args)
					gterm:Broadcast(term, "this experimental feature is still in testing", GT_COL_WRN)
					return gterm:Broadcast(term, "try later", GT_COL_WRN)
				end,
				help = "View social information."
			}
		},
		lifetime = 60 * 3,
		Initialized = function(self, term)
			_class_0.__parent.__base.Initialized(self, term)
			term.live_until = CurTime() + self.lifetime
			return gterm:Broadcast(term, "DEATH when idle time exceeds " .. tostring(string.NiceTime(self.lifetime)), GT_COL_INFO)
		end,
		ReceiveInput = function(self, term, ply)
			term.live_until = CurTime() + self.lifetime
		end,
		Think = function(self, term)
			local ct = CurTime()
			if not term:GetActive() then
				return
			end
			if term.warn_cooldown and ct < term.warn_cooldown then
				return
			end
			if not term.live_until then
				term.live_until = ct + self.lifetime
			end
			local time_left = term.live_until - CurTime()
			if math.floor(time_left) % 60 == 0 then
				if math.floor(time_left) <= 1 then
					gterm:Broadcast(term, "DEATH", GT_COL_INTL)
					return timer.Simple(math.Rand(2, 5), function()
						if IsValid(term) and term:GetActive() then
							for i = 0, term.max_lines do
								if IsValid(term) then
									gterm:Broadcast(term, "", nil, i)
								end
							end
							return gterm.OS:Call(term, "ShutDown")
						end
					end)
				else
					return gterm:Broadcast(term, "DEATH in " .. tostring(string.NiceTime(time_left)), GT_COL_INFO)
				end
			end
		end
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "Public",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	Public = _class_0
end
net.Receive("evilrp_terminal_endconsole", function(len, ply)
	local idx = net.ReadUInt(16)
	local term = Entity(idx)
	local text = net.ReadString()
	if not (IsValid(term) and term.GetUser) then
		return
	end
	local user = term:GetUser()
	if not (IsValid(user) and user == ply) then
		return
	end
	if (text == "") or (text == " ") then
		term:SetUser(nil)
		net.Start("evilrp_terminal_endtyping")
		net.Send(ply)
		return
	end
	gterm.OS:Call(term, "ReceiveInput", ply)
	if term.password and not client["pass_authed_" .. tostring(idx)] then
		if text == term.password then
			ply["pass_authed_" .. tostring(idx)] = true
			gterm:Broadcast(term, "password accepted", GT_COL_INFO)
			return
		else
			gterm:Broadcast(term, "password required", GT_COL_INFO)
			return
		end
	end
	if string.sub(text, 1, 1) == ":" then
		local sys = OS.distros[term:GetOS()]
		if sys then
			for k, v in pairs(sys:GetCommands()) do
				local cmd = string.sub(string.lower(text), 1, string.len(k))
				if k == cmd then
					local text2 = string.sub(text, string.len(cmd) + 2)
					local quote = (string.sub(text2, 1, 1) ~= "\"")
					local args = { }
					for chunk in string.gmatch(text2, "[^\"]+") do
						quote = not quote
						if quote then
							args[#args + 1] = chunk
						else
							for chunk in string.gmatch(chunk, "[^ ]+") do
								args[#args + 1] = chunk
							end
						end
					end
					local success, value = pcall(v.Callback, sys, ply, term, args)
					if success then
						gterm:Broadcast(term, text, GT_COL_CMD)
					else
						gterm:Broadcast(term, value, GT_COL_ERR)
					end
					return
				end
			end
			text = tostring(string.sub(text, 2)) .. ": command not found"
			gterm:Broadcast(term, text, GT_COL_ERR)
			return
		else
			gterm:Broadcast(term, "DEATH", GT_COL_INTL)
		end
		if term.accepting_input then
			local quote = (string.sub(text, 1, 1) ~= "\"")
			local args = { }
			for chunk in string.match(text, "[^\"]+") do
				quote = not quote
				if quote then
					args[#args + 1] = chunk
				else
					for chunk in string.gmatch(chunk, "[^ ]+") do
						args[#args + 1] = chunk
					end
				end
			end
			local callback = term.input_callback
			if callback and args then
				callback(ply, args)
			end
			term.accepting_input = nil
			term.input_callback = nil
			return
		end
	end
	local sys = OS.distros[term:GetOS()]
	local name = sys and sys.unique_id or "unknown"
	local finalized = tostring(("<"):Escape()) .. tostring(name) .. "@" .. tostring(term:EntIndex()) .. tostring((">"):Escape()) .. " " .. tostring(text)
	return gterm:Broadcast(term, finalized, GT_COL_CMD)
end)
return MsgC(Color(255, 0, 0), "INITIALIZED EVILRP TERMINALS\n")
