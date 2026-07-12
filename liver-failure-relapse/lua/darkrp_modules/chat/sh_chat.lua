-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/chat/sh_chat.yue
if not Chat then -- 2
	Chat = { } -- 2
end -- 2
local _obj_0 = Chat -- 3
_obj_0.list = _obj_0.list or { } -- 3
local _obj_1 = Chat -- 4
_obj_1.commands = _obj_1.commands or { } -- 4
local _obj_2 = Chat -- 5
_obj_2.aliases = _obj_2.aliases or { } -- 5
local _obj_3 = Chat -- 6
_obj_3.console_commands = _obj_3.console_commands or { } -- 6
local meta = FindMetaTable("Player") -- 8
local emeta = FindMetaTable("Entity") -- 9
meta.Typing = function(self) -- 11
	return self:GetNWString("evilrp_typing", nil) -- 11
end -- 11
meta.SetTyping = function(self, str) -- 12
	return self:SetNWString("evilrp_typing", str) -- 12
end -- 12
Chat.Process = function(ply, str) -- 14
	for alias, command in pairs(Chat.aliases) do -- 15
		if string.Left(str, #alias) == alias then -- 16
			str = string.format("/%s %s", command, string.sub(str, #alias + 1)) -- 17
			break -- 18
		end -- 16
	end -- 18
	local lang, command, args = string.match(str, "^[/!](%w+)%.(%w+)%s*(.-)%s*$") -- 19
	if true or not Language.Lookup[lang] then -- 20
		lang = nil -- 23
		command, args = string.match(str, "^[/!](%w+)%s*(.-)%s*$") -- 24
		if not command then -- 25
			command, args = "say", string.Trim(str) -- 26
		end -- 25
	else -- 28
		lang = string.lower(lang) -- 28
	end -- 20
	return lang, string.lower(command), args -- 29
end -- 14
Chat.GetTargets = function(pos, range, range_muffled, with_entities) -- 31
	local range_max = math.max(range, range_muffled) -- 32
	local targets = { } -- 33
	for _, ent in pairs(ents.FindInSphere(pos, range_max)) do -- 34
		local _continue_0 = false -- 35
		repeat -- 35
			if not ent:IsPlayer() and (not with_entities or not ent.OnHear) then -- 35
				_continue_0 = true -- 35
				break -- 35
			end -- 35
			local dist = ent:GetPos():DistToSqr(pos) -- 36
			if ent:CanHear(pos) then -- 37
				if dist < range_max ^ 2 then -- 38
					targets[#targets + 1] = ent -- 38
				end -- 38
			elseif dist <= range_muffled then -- 39
				if dist <= range_muffled ^ 2 then -- 40
					targets[#targets + 1] = ent -- 40
				end -- 40
			end -- 37
			_continue_0 = true -- 35
		until true -- 40
		if not _continue_0 then -- 40
			break -- 40
		end -- 40
	end -- 40
	return targets -- 41
end -- 31
Chat.Parse = function(ply, str) -- 43
	local lang, cmd, args = Chat.Process(ply, str) -- 44
	if CLIENT then -- 45
		if Chat.console_commands[cmd] then -- 46
			return console.Parse(lp, Chat.console_commands[cmd], args) -- 47
		else -- 49
			return netstream.Send("ParseChat", str) -- 49
		end -- 46
	else -- 51
		if Chat.ThoughtPolice(ply, str) then -- 51
			return -- 51
		end -- 51
		local command = Chat.commands[cmd] -- 52
		if not command then -- 53
			ply:SendChat("ERROR", "Unknown command: " .. tostring(cmd)) -- 54
			return -- 55
		end -- 53
		return command:Handle(ply, lang, cmd, args) -- 56
	end -- 45
end -- 43
Chat.Autopretty = function(ply, text) -- 58
	for k, v in pairs(Chat.StupidMistakes) do -- 59
		local st_start, st_end = string.find(string.lower(text), " " .. tostring(k) .. " ") -- 60
		if st_start then -- 61
			text = tostring(string.sub(text, 1, st_start - 1)) .. " " .. tostring(v) .. " " .. tostring(string.sub(text, st_end + 1)) -- 62
		end -- 61
		local st_start_comma, st_end_comma = string.find(text, " " .. tostring(k) .. ",") -- 63
		if st_start_comma then -- 64
			text = tostring(string.sub(text, 1, st_end_comma - 1)) .. " " .. tostring(v) .. "," .. tostring(string.sub(text, st_end_comma + 1)) -- 65
		end -- 64
		local st_beginning = string.sub(text, 1, string.len(k) + 1) -- 66
		if st_beginning == (tostring(k) .. " ") or string.lower(text) == k then -- 67
			text = tostring(v) .. tostring(string.sub(text, string.len(k) + 1)) -- 68
		end -- 67
		local st_ending = string.sub(text, string.len(text) - string.len(" " .. tostring(k)) + 1) -- 69
		if st_ending == (" " .. tostring(k)) then -- 70
			text = string.sub(text, 1, string.len(text) - string.len(" " .. tostring(k))) .. " " .. tostring(v) -- 71
		end -- 70
	end -- 71
	local fix_illiterate = string.sub(text, 1, 1) -- 72
	text = string.upper(fix_illiterate) .. string.sub(text, 2, string.len(text)) -- 73
	local fix_illiterate_2 = string.sub(text, -1) -- 74
	if "." == fix_illiterate_2 or "!" == fix_illiterate_2 or "?" == fix_illiterate_2 or ":" == fix_illiterate_2 or ";" == fix_illiterate_2 or "," == fix_illiterate_2 then -- 76
	else -- 79
		text = text .. "." -- 80
	end -- 80
	return text -- 81
end -- 58
Chat.ThoughtPolice = function(ply, text) -- 83
	local _list_0 = Chat.BadWords -- 84
	for _index_0 = 1, #_list_0 do -- 84
		local bad = _list_0[_index_0] -- 84
		if string.find(text:lower(), bad) then -- 85
			net.Start("evilrp_jumpscare") -- 86
			net.Send(ply) -- 87
			ply:SendChat("ERROR", "'" .. tostring(bad) .. "'") -- 88
			CRIMES.thought:CommittedBy(ply) -- 89
			return true -- 90
		end -- 85
	end -- 90
	return false -- 91
end -- 83
if CLIENT then -- 93
	Chat.Create = function() -- 94
		local panel = GUI.Get("Chat") -- 95
		if IsValid(panel) then -- 96
			local buffer = panel:ExportBuffer() -- 97
			return GUI.Open("Chat"):ImportBuffer(buffer) -- 98
		else -- 100
			return GUI.Open("Chat") -- 100
		end -- 96
	end -- 94
	Chat.Bind = function(bind, down) -- 102
		if down and bind:find("messagemode") then -- 103
			Chat.Show() -- 104
			return true -- 105
		end -- 103
	end -- 102
	Chat.Show = function() -- 107
		return GUI.Get("Chat"):Show() -- 107
	end -- 107
	Chat.Hide = function() -- 109
		GUI.Get("Chat"):Hide() -- 110
		if lp:Typing() ~= nil then -- 111
			lp:SetTyping(nil) -- 112
			return netstream.Send("Typing", nil) -- 113
		end -- 111
	end -- 109
	Chat.Receive = function(name, data) -- 115
		if isstring(data) then -- 116
			data = { -- 116
				text = data -- 116
			} -- 116
		end -- 116
		local command = Chat.list[name] -- 117
		local message, console_message = command:OnReceive(data) -- 118
		if isstring(message) then -- 119
			return GUI.Get("Chat"):AddMessage(message, console_message, command.tabs) -- 121
		end -- 119
	end -- 115
	netstream.Hook("SendChat", function(payload) -- 123
		return Chat.Receive(payload.__type, payload) -- 124
	end) -- 123
end -- 93
if SERVER then -- 126
	netstream.Hook("ParseChat", Chat.Parse) -- 127
	netstream.Hook("Typing", function(ply, cmd) -- 129
		if cmd and Chat.commands[cmd] then -- 130
			return ply:SetTyping(cmd) -- 131
		else -- 133
			return ply:SetTyping(nil) -- 133
		end -- 130
	end) -- 129
	Chat.Send = function(name, data, targets) -- 135
		if isstring(data) then -- 136
			data = { -- 136
				text = data -- 136
			} -- 136
		end -- 136
		data.__type = name -- 137
		if not istable(targets) then -- 138
			targets = { -- 138
				targets -- 138
			} -- 138
		end -- 138
		return netstream.Send(targets, "SendChat", data) -- 139
	end -- 135
	GM.PlayerSay = function(self, ply, text, t) -- 141
		Chat.Parse(ply, text) -- 142
		return "" -- 143
	end -- 141
end -- 126
meta.SendChat = function(self, name, data) -- 145
	if CLIENT then -- 146
		assert(self == lp, "Attempt to SendChat to a non-local player") -- 147
		return Chat.Receive(name, data) -- 148
	else -- 150
		return Chat.Send(name, data, self) -- 150
	end -- 146
end -- 145
Chat.StupidMistakes = { -- 153
	["i"] = "I", -- 153
	["u"] = "you", -- 154
	["r"] = "are", -- 155
	["dont"] = "don't", -- 156
	["cant"] = "can't", -- 157
	["wont"] = "won't", -- 158
	["doesnt"] = "doesn't", -- 159
	["didnt"] = "didn't", -- 160
	["youve"] = "you've", -- 161
	["i'll"] = "I'll", -- 162
	["itll"] = "it'll", -- 163
	["wouldnt"] = "wouldn't", -- 164
	["shouldnt"] = "shouldn't", -- 165
	["couldnt"] = "couldn't", -- 166
	["whos"] = "who's", -- 167
	["weve"] = "we've", -- 168
	["arent"] = "aren't", -- 169
	["ive"] = "I've", -- 170
	["i've"] = "I've", -- 171
	["hes"] = "he's", -- 172
	["shes"] = "she's", -- 173
	["her's"] = "hers", -- 174
	["whatre"] = "what're", -- 175
	["wheres"] = "where's", -- 176
	["youre"] = "you're", -- 177
	["theres"] = "there's", -- 178
	["theyre"] = "they're", -- 179
	["theyve"] = "they've", -- 180
	["im"] = "I'm", -- 181
	["i'm"] = "I'm", -- 182
	["youll"] = "you'll", -- 183
	["ol"] = "ol'", -- 184
	["k"] = "okay", -- 185
	["ok"] = "okay", -- 186
	["ye"] = "yeah", -- 187
	["yea"] = "yeah", -- 188
	["idk"] = "I don't know", -- 189
	["wtf"] = "what the fuck", -- 190
	["rn"] = "right now", -- 191
	["gtg"] = "gotta go", -- 192
	["brb"] = "be right back", -- 193
	["cmon"] = "c'mon", -- 194
	["lol"] = "heh", -- 195
	["lel"] = "*gag*", -- 196
	["kek"] = "hrk", -- 197
	["lmao"] = "haha", -- 198
	["lmfao"] = "HAHA", -- 199
	["rofl"] = "pfftaha", -- 200
	["roflmao"] = "PFFFTHAH", -- 201
	["nvm"] = "never mind", -- 202
	["aint"] = "ain't", -- 203
	["killin"] = "killin'", -- 204
	["yknow"] = "y'know", -- 205
	["n"] = "n'", -- 206
	["fuckin"] = "fuckin'", -- 207
	["eatin"] = "eatin'", -- 208
	["drinkin"] = "drinkin'", -- 209
	["huntin"] = "huntin'", -- 210
	["lookin"] = "lookin'", -- 211
	["searchin"] = "searchin'", -- 212
	["shittin"] = "shittin'", -- 213
	["jokin"] = "jokin'", -- 214
	["gettin"] = "gettin'", -- 215
	["lettin"] = "lettin'", -- 216
	["fightin"] = "fightin'", -- 217
	["gettin"] = "gettin'", -- 218
	["motherfuckin"] = "motherfuckin'", -- 219
	["ballin"] = "ballin'", -- 220
	["rockin"] = "rockin'", -- 221
	["bangin"] = "bangin'", -- 222
	["rollin"] = "rollin'", -- 223
	["movin"] = "movin'", -- 224
	["somethin"] = "somethin'", -- 225
	["doin"] = "doin'", -- 226
	["th"] = "th'", -- 227
	["tha"] = "tha'", -- 228
	["tho"] = "though", -- 229
	["frick"] = "fuck", -- 230
	["pls"] = "please", -- 231
	["plz"] = "please", -- 232
	["pwned"] = "ruined", -- 233
	["pwn"] = "ruin", -- 234
	["rekt"] = "ruined", -- 235
	["cuz"] = "because", -- 236
	["dw"] = "don't worry", -- 237
	["ty"] = "thank you", -- 238
	["np"] = "no problem", -- 239
	["omw"] = "on my way", -- 240
	["thx"] = "thanks", -- 241
	["gg"] = "gluh", -- 242
	["money"] = "bone", -- 243
	["would of"] = "would've", -- 244
	["should of"] = "should've", -- 245
	["could of"] = "could've", -- 246
	["alot"] = "a lot", -- 247
	["mb"] = "my bad", -- 248
	["turkey"] = "yurkey", -- 249
	["holy shit"] = "holy heart failure", -- 250
	["jesus christ"] = "Sotla eternal", -- 251
	["jesus fucking christ"] = "Sotla's fucking eye", -- 252
	["jesus"] = "Sotla", -- 253
	["mother of god"] = "mother of Sotla", -- 254
	["brother in christ"] = "brother in Sotla", -- 255
	["mfer"] = "friend of mine" -- 256
} -- 152
Chat.BadWords = { -- 259
	"nigger", -- 259
	"tranny", -- 259
	"nigga", -- 259
	"kike", -- 259
	"autism", -- 259
	"autistic", -- 259
	"autist", -- 259
	"trannies", -- 259
	"faggot", -- 259
	"fag", -- 259
	"fgt", -- 259
	"libtard", -- 259
	"retard", -- 259
	"gmyza", -- 259
	"poggers", -- 259
	"pogchamp", -- 259
	"prole gaming", -- 259
	"omegalol", -- 259
	"kekw", -- 259
	"trihard7", -- 259
	"ur mom", -- 259
	"ur mum", -- 259
	"bri-ish", -- 259
	"bri'ish", -- 259
	"nword", -- 259
	"rdm", -- 259
	"nlr", -- 259
	"failrp", -- 259
	"chad", -- 259
	"hoes mad", -- 259
	"yeet", -- 259
	"corpsed", -- 259
	"kek", -- 259
	"chungus", -- 259
	"pog", -- 259
	"fortnite", -- 259
	"skinwalk", -- 259
	"skinshift", -- 259
	"skin walk", -- 259
	"skin shift", -- 259
	"unbindall", -- 259
	"white walking", -- 259
	"weeb", -- 259
	"weeaboo", -- 259
	"amogus", -- 259
	"amog us", -- 259
	"pretty cringe", -- 259
	"that's cringe", -- 259
	"redpilled", -- 259
	"tradcath", -- 259
	"zoomer", -- 259
	"boomer", -- 259
	"doomer", -- 259
	"groyper", -- 259
	"bluepill", -- 259
	"redpill", -- 259
	"tradwife", -- 259
	"blackpill", -- 259
	"big chungus", -- 259
	"spongebob", -- 259
	"impostor among us", -- 259
	"imposter among us", -- 259
	"ligma", -- 259
	"trolled", -- 259
	"deez", -- 259
	"swag", -- 259
	"font", -- 259
	"bussin", -- 259
	"sussy", -- 259
	"bussy", -- 259
	"meme", -- 259
	"koom", -- 259
	"niglet", -- 259
	"stem cell meat", -- 259
	"make me butcher", -- 259
	"nlgger", -- 259
	"nlgga", -- 259
	"nlg", -- 259
	"bruh", -- 259
	"allah", -- 259
	"akbar", -- 259
	"alahu", -- 259
	"ackbar", -- 259
	"lifeweb", -- 259
	"cuck", -- 259
	"coom", -- 259
	"tryhard", -- 259
	"morbius", -- 259
	"morbin", -- 259
	"/advert", -- 259
	"skibidi", -- 259
	"rizz", -- 259
	"gyatt", -- 259
	"solta" -- 259
} -- 259
do -- 261
	local _class_0 -- 261
	local _parent_0 = CHAT_CMD -- 261
	local _base_0 = { -- 261
		name = "GENERIC", -- 263
		color = Color(200, 200, 200), -- 264
		font = "Spleen_Label", -- 265
		OnReceive = function(self, data) -- 265
			return string.format("<font=%s><c=%s>%s", self.font, self.color, data.text) -- 265
		end -- 261
	} -- 261
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 265
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 261
			_base_0[_key_0] = _val_0 -- 261
		end -- 261
	end -- 265
	if _base_0.__index == nil then -- 261
		_base_0.__index = _base_0 -- 261
	end -- 265
	setmetatable(_base_0, _parent_0.__base) -- 261
	_class_0 = setmetatable({ -- 261
		__init = function(self, ...) -- 261
			return _class_0.__parent.__init(self, ...) -- 261
		end, -- 261
		__base = _base_0, -- 261
		__parent = _parent_0 -- 261
	}, { -- 261
		__index = function(cls, name) -- 261
			local val = rawget(_base_0, name) -- 261
			if val == nil then -- 261
				local parent = rawget(cls, "__parent") -- 261
				if parent then -- 261
					return parent[name] -- 261
				end -- 261
			else -- 261
				return val -- 261
			end -- 261
		end, -- 261
		__call = function(cls, ...) -- 261
			local _self_0 = setmetatable({ }, _base_0) -- 261
			cls.__init(_self_0, ...) -- 261
			return _self_0 -- 261
		end -- 261
	}) -- 261
	_base_0.__class = _class_0 -- 261
	if _parent_0.__inherited then -- 261
		_parent_0.__inherited(_parent_0, _class_0) -- 261
	end -- 261
end -- 265
do -- 267
	local _class_0 -- 267
	local _parent_0 = CHAT_CMD -- 267
	local _base_0 = { -- 267
		name = "NOTICE", -- 269
		color = Color(229, 201, 98), -- 270
		font = "Spleen_Chat", -- 271
		OnReceive = function(self, data) -- 271
			return string.format("<font=%s><c=%s>%s", self.font, self.color, data.text) -- 271
		end -- 267
	} -- 267
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 271
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 267
			_base_0[_key_0] = _val_0 -- 267
		end -- 267
	end -- 271
	if _base_0.__index == nil then -- 267
		_base_0.__index = _base_0 -- 267
	end -- 271
	setmetatable(_base_0, _parent_0.__base) -- 267
	_class_0 = setmetatable({ -- 267
		__init = function(self, ...) -- 267
			return _class_0.__parent.__init(self, ...) -- 267
		end, -- 267
		__base = _base_0, -- 267
		__parent = _parent_0 -- 267
	}, { -- 267
		__index = function(cls, name) -- 267
			local val = rawget(_base_0, name) -- 267
			if val == nil then -- 267
				local parent = rawget(cls, "__parent") -- 267
				if parent then -- 267
					return parent[name] -- 267
				end -- 267
			else -- 267
				return val -- 267
			end -- 267
		end, -- 267
		__call = function(cls, ...) -- 267
			local _self_0 = setmetatable({ }, _base_0) -- 267
			cls.__init(_self_0, ...) -- 267
			return _self_0 -- 267
		end -- 267
	}) -- 267
	_base_0.__class = _class_0 -- 267
	if _parent_0.__inherited then -- 267
		_parent_0.__inherited(_parent_0, _class_0) -- 267
	end -- 267
end -- 271
do -- 273
	local _class_0 -- 273
	local _parent_0 = CHAT_CMD -- 273
	local _base_0 = { -- 273
		name = "ERROR", -- 275
		color = Color(200, 0, 0), -- 276
		color_console = Color(255, 90, 90), -- 277
		font = "Spleen_Chat", -- 278
		OnReceive = function(self, data) -- 278
			return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">ERROR: " .. tostring(data.text), "<c=" .. tostring(self.color_console) .. ">ERROR: " .. tostring(data.text) -- 278
		end -- 273
	} -- 273
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 278
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 273
			_base_0[_key_0] = _val_0 -- 273
		end -- 273
	end -- 278
	if _base_0.__index == nil then -- 273
		_base_0.__index = _base_0 -- 273
	end -- 278
	setmetatable(_base_0, _parent_0.__base) -- 273
	_class_0 = setmetatable({ -- 273
		__init = function(self, ...) -- 273
			return _class_0.__parent.__init(self, ...) -- 273
		end, -- 273
		__base = _base_0, -- 273
		__parent = _parent_0 -- 273
	}, { -- 273
		__index = function(cls, name) -- 273
			local val = rawget(_base_0, name) -- 273
			if val == nil then -- 273
				local parent = rawget(cls, "__parent") -- 273
				if parent then -- 273
					return parent[name] -- 273
				end -- 273
			else -- 273
				return val -- 273
			end -- 273
		end, -- 273
		__call = function(cls, ...) -- 273
			local _self_0 = setmetatable({ }, _base_0) -- 273
			cls.__init(_self_0, ...) -- 273
			return _self_0 -- 273
		end -- 273
	}) -- 273
	_base_0.__class = _class_0 -- 273
	if _parent_0.__inherited then -- 273
		_parent_0.__inherited(_parent_0, _class_0) -- 273
	end -- 273
end -- 278
do -- 280
	local _class_0 -- 280
	local _parent_0 = CHAT_CMD -- 280
	local _base_0 = { -- 280
		tabs = TAB_IC, -- 282
		log_category = "ic", -- 284
		Handle = function(self, ply, lang, cmd, text) -- 284
			if not ply:Alive() then -- 285
				ply:SendChat("ERROR", "You're DEAD.") -- 286
				return -- 287
			end -- 285
			return _class_0.__parent.__base.Handle(self, ply, lang, cmd, text) -- 288
		end -- 280
	} -- 280
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 288
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 280
			_base_0[_key_0] = _val_0 -- 280
		end -- 280
	end -- 288
	if _base_0.__index == nil then -- 280
		_base_0.__index = _base_0 -- 280
	end -- 288
	setmetatable(_base_0, _parent_0.__base) -- 280
	_class_0 = setmetatable({ -- 280
		__init = function(self, ...) -- 280
			return _class_0.__parent.__init(self, ...) -- 280
		end, -- 280
		__base = _base_0, -- 280
		__name = "CHAT_CMD_IC", -- 280
		__parent = _parent_0 -- 280
	}, { -- 280
		__index = function(cls, name) -- 280
			local val = rawget(_base_0, name) -- 280
			if val == nil then -- 280
				local parent = rawget(cls, "__parent") -- 280
				if parent then -- 280
					return parent[name] -- 280
				end -- 280
			else -- 280
				return val -- 280
			end -- 280
		end, -- 280
		__call = function(cls, ...) -- 280
			local _self_0 = setmetatable({ }, _base_0) -- 280
			cls.__init(_self_0, ...) -- 280
			return _self_0 -- 280
		end -- 280
	}) -- 280
	_base_0.__class = _class_0 -- 280
	if _parent_0.__inherited then -- 280
		_parent_0.__inherited(_parent_0, _class_0) -- 280
	end -- 280
	CHAT_CMD_IC = _class_0 -- 280
end -- 288
local Action -- 290
do -- 290
	local _class_0 -- 290
	local _parent_0 = CHAT_CMD_IC -- 290
	local _base_0 = { -- 290
		name = "Action", -- 292
		desc = "Do something.", -- 293
		typing = "Performing...", -- 295
		commands = { -- 295
			"me", -- 295
			"em" -- 295
		}, -- 296
		aliases = { -- 296
			":", -- 296
			"*" -- 296
		}, -- 298
		range = 400, -- 299
		range_muffled = 0, -- 301
		font = "Spleen_Chat" -- 290
	} -- 290
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 301
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 290
			_base_0[_key_0] = _val_0 -- 290
		end -- 290
	end -- 301
	if _base_0.__index == nil then -- 290
		_base_0.__index = _base_0 -- 290
	end -- 301
	setmetatable(_base_0, _parent_0.__base) -- 290
	_class_0 = setmetatable({ -- 290
		__init = function(self, ...) -- 290
			return _class_0.__parent.__init(self, ...) -- 290
		end, -- 290
		__base = _base_0, -- 290
		__name = "Action", -- 290
		__parent = _parent_0 -- 290
	}, { -- 290
		__index = function(cls, name) -- 290
			local val = rawget(_base_0, name) -- 290
			if val == nil then -- 290
				local parent = rawget(cls, "__parent") -- 290
				if parent then -- 290
					return parent[name] -- 290
				end -- 290
			else -- 290
				return val -- 290
			end -- 290
		end, -- 290
		__call = function(cls, ...) -- 290
			local _self_0 = setmetatable({ }, _base_0) -- 290
			cls.__init(_self_0, ...) -- 290
			return _self_0 -- 290
		end -- 290
	}) -- 290
	_base_0.__class = _class_0 -- 290
	if _parent_0.__inherited then -- 290
		_parent_0.__inherited(_parent_0, _class_0) -- 290
	end -- 290
	Action = _class_0 -- 290
end -- 301
if CLIENT then -- 303
	Action.OnReceive = function(self, data) -- 304
		local text = data.text -- 305
		if not string.match(text, "^[,.']") then -- 306
			text = " " .. tostring(text) -- 306
		end -- 306
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(data.color) .. ">** " .. tostring(data.name) .. tostring(text) -- 307
	end -- 304
end -- 303
if SERVER then -- 309
	Action.Parse = function(self, ply, lang, cmd, text) -- 310
		return { -- 311
			name = ply:Name(), -- 311
			color = ply:getJobTable().color, -- 311
			text = text -- 311
		} -- 311
	end -- 310
end -- 309
local Say -- 313
do -- 313
	local _class_0 -- 313
	local _parent_0 = CHAT_CMD_IC -- 313
	local _base_0 = { -- 313
		name = "Say", -- 315
		desc = "Speak out to those around you.", -- 316
		typing = "Lying...", -- 317
		tense = "said", -- 319
		commands = { -- 319
			"say" -- 319
		}, -- 321
		use_language = true, -- 322
		hearable = true, -- 324
		range = 400, -- 325
		range_muffled = 150, -- 327
		font = "Spleen_Chat", -- 329
		color = Color(91, 166, 221), -- 330
		color_lang = Color(255, 167, 73), -- 332
		Process = function(self, ply, text) -- 332
			return Chat.Autopretty(ply, text) -- 332
		end -- 313
	} -- 313
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 332
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 313
			_base_0[_key_0] = _val_0 -- 313
		end -- 313
	end -- 332
	if _base_0.__index == nil then -- 313
		_base_0.__index = _base_0 -- 313
	end -- 332
	setmetatable(_base_0, _parent_0.__base) -- 313
	_class_0 = setmetatable({ -- 313
		__init = function(self, ...) -- 313
			return _class_0.__parent.__init(self, ...) -- 313
		end, -- 313
		__base = _base_0, -- 313
		__name = "Say", -- 313
		__parent = _parent_0 -- 313
	}, { -- 313
		__index = function(cls, name) -- 313
			local val = rawget(_base_0, name) -- 313
			if val == nil then -- 313
				local parent = rawget(cls, "__parent") -- 313
				if parent then -- 313
					return parent[name] -- 313
				end -- 313
			else -- 313
				return val -- 313
			end -- 313
		end, -- 313
		__call = function(cls, ...) -- 313
			local _self_0 = setmetatable({ }, _base_0) -- 313
			cls.__init(_self_0, ...) -- 313
			return _self_0 -- 313
		end -- 313
	}) -- 313
	_base_0.__class = _class_0 -- 313
	if _parent_0.__inherited then -- 313
		_parent_0.__inherited(_parent_0, _class_0) -- 313
	end -- 313
	Say = _class_0 -- 313
end -- 332
if CLIENT then -- 334
	Say.OnReceive = function(self, data) -- 335
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(data.name_color) .. ">" .. tostring(data.name) .. " <c=" .. tostring(Color(255, 255, 255)) .. ">" .. tostring(self.tense) .. ", <c=" .. tostring(self.color) .. ">\"" .. tostring(data.text) .. "\"" -- 335
	end -- 335
end -- 334
if SERVER then -- 346
	Say.Parse = function(self, ply, lang, cmd, text) -- 347
		local targets = self:GetTargets(ply) -- 348
		local valid = { } -- 349
		local invalid = { } -- 350
		for _index_0 = 1, #targets do -- 351
			local target = targets[_index_0] -- 351
			if target == ply or true then -- 353
				valid[#valid + 1] = target -- 354
			else -- 356
				invalid[#invalid + 1] = target -- 356
			end -- 353
		end -- 356
		local name_color = ply:getJobTable().color -- 359
		text = self:Process(ply, text) -- 360
		if not self.silent then -- 361
			ply:PlaySpeechSound(text, SNDLVL_65DB) -- 361
		end -- 361
		return Chat.Send(self.name, { -- 363
			name = ply:Name(), -- 363
			name_color = name_color, -- 364
			lang = lang, -- 365
			text = text -- 366
		}, valid) -- 367
	end -- 347
end -- 346
local Yell -- 370
do -- 370
	local _class_0 -- 370
	local _parent_0 = Say -- 370
	local _base_0 = { -- 370
		name = "Yell", -- 372
		desc = "Yell something at the top of your lungs.", -- 373
		typing = "Yelling...", -- 374
		tense = "shouted", -- 376
		commands = { -- 376
			"yell", -- 376
			"y" -- 376
		}, -- 378
		range = 800, -- 379
		range_muffled = 400, -- 381
		color = Color(255, 50, 50), -- 382
		color_lang = Color(255, 167, 73), -- 384
		Process = function(self, ply, text) -- 384
			text = _class_0.__parent.__base.Process(self, ply, text) -- 385
			text = string.upper(text) -- 386
			local punc = string.sub(text, string.len(text)) -- 387
			if "." == punc then -- 389
				text = tostring(string.sub(text, 1, -2)) .. "!" -- 390
			elseif "?" == punc then -- 391
				text = text .. "!" -- 392
			else -- 394
				text = text .. "!" -- 394
			end -- 394
			return "<wiggle=2>" .. tostring(text) .. "</wiggle>" -- 395
		end -- 370
	} -- 370
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 395
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 370
			_base_0[_key_0] = _val_0 -- 370
		end -- 370
	end -- 395
	if _base_0.__index == nil then -- 370
		_base_0.__index = _base_0 -- 370
	end -- 395
	setmetatable(_base_0, _parent_0.__base) -- 370
	_class_0 = setmetatable({ -- 370
		__init = function(self, ...) -- 370
			return _class_0.__parent.__init(self, ...) -- 370
		end, -- 370
		__base = _base_0, -- 370
		__name = "Yell", -- 370
		__parent = _parent_0 -- 370
	}, { -- 370
		__index = function(cls, name) -- 370
			local val = rawget(_base_0, name) -- 370
			if val == nil then -- 370
				local parent = rawget(cls, "__parent") -- 370
				if parent then -- 370
					return parent[name] -- 370
				end -- 370
			else -- 370
				return val -- 370
			end -- 370
		end, -- 370
		__call = function(cls, ...) -- 370
			local _self_0 = setmetatable({ }, _base_0) -- 370
			cls.__init(_self_0, ...) -- 370
			return _self_0 -- 370
		end -- 370
	}) -- 370
	_base_0.__class = _class_0 -- 370
	if _parent_0.__inherited then -- 370
		_parent_0.__inherited(_parent_0, _class_0) -- 370
	end -- 370
	Yell = _class_0 -- 370
end -- 395
local Whisper -- 397
do -- 397
	local _class_0 -- 397
	local _parent_0 = Say -- 397
	local _base_0 = { -- 397
		name = "Whisper", -- 399
		desc = "Quietly transmit your secrets to your close ones.", -- 400
		typing = "Whispering...", -- 401
		tense = "whispered", -- 403
		silent = true, -- 405
		font = "Spleen_Chat_Small", -- 407
		commands = { -- 407
			"whisper", -- 407
			"w" -- 407
		}, -- 409
		range = 150, -- 410
		range_muffled = 0, -- 412
		color = Color(151, 151, 151), -- 413
		color_lang = Color(255, 167, 73) -- 397
	} -- 397
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 413
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 397
			_base_0[_key_0] = _val_0 -- 397
		end -- 397
	end -- 413
	if _base_0.__index == nil then -- 397
		_base_0.__index = _base_0 -- 397
	end -- 413
	setmetatable(_base_0, _parent_0.__base) -- 397
	_class_0 = setmetatable({ -- 397
		__init = function(self, ...) -- 397
			return _class_0.__parent.__init(self, ...) -- 397
		end, -- 397
		__base = _base_0, -- 397
		__name = "Whisper", -- 397
		__parent = _parent_0 -- 397
	}, { -- 397
		__index = function(cls, name) -- 397
			local val = rawget(_base_0, name) -- 397
			if val == nil then -- 397
				local parent = rawget(cls, "__parent") -- 397
				if parent then -- 397
					return parent[name] -- 397
				end -- 397
			else -- 397
				return val -- 397
			end -- 397
		end, -- 397
		__call = function(cls, ...) -- 397
			local _self_0 = setmetatable({ }, _base_0) -- 397
			cls.__init(_self_0, ...) -- 397
			return _self_0 -- 397
		end -- 397
	}) -- 397
	_base_0.__class = _class_0 -- 397
	if _parent_0.__inherited then -- 397
		_parent_0.__inherited(_parent_0, _class_0) -- 397
	end -- 397
	Whisper = _class_0 -- 397
end -- 413
local XOMBOKOM -- 415
do -- 415
	local _class_0 -- 415
	local _parent_0 = SOUND -- 415
	local _base_0 = { -- 415
		level = SNDLVL_NONE, -- 417
		sound = (function() -- 417
			local _accum_0 = { } -- 417
			local _len_0 = 1 -- 417
			for i = 1, 7 do -- 417
				_accum_0[_len_0] = "kidneydagger/broadcast" .. tostring(i) .. ".wav" -- 417
				_len_0 = _len_0 + 1 -- 417
			end -- 417
			return _accum_0 -- 417
		end)() -- 415
	} -- 415
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 417
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 415
			_base_0[_key_0] = _val_0 -- 415
		end -- 415
	end -- 417
	if _base_0.__index == nil then -- 415
		_base_0.__index = _base_0 -- 415
	end -- 417
	setmetatable(_base_0, _parent_0.__base) -- 415
	_class_0 = setmetatable({ -- 415
		__init = function(self, ...) -- 415
			return _class_0.__parent.__init(self, ...) -- 415
		end, -- 415
		__base = _base_0, -- 415
		__name = "XOMBOKOM", -- 415
		__parent = _parent_0 -- 415
	}, { -- 415
		__index = function(cls, name) -- 415
			local val = rawget(_base_0, name) -- 415
			if val == nil then -- 415
				local parent = rawget(cls, "__parent") -- 415
				if parent then -- 415
					return parent[name] -- 415
				end -- 415
			else -- 415
				return val -- 415
			end -- 415
		end, -- 415
		__call = function(cls, ...) -- 415
			local _self_0 = setmetatable({ }, _base_0) -- 415
			cls.__init(_self_0, ...) -- 415
			return _self_0 -- 415
		end -- 415
	}) -- 415
	_base_0.__class = _class_0 -- 415
	if _parent_0.__inherited then -- 415
		_parent_0.__inherited(_parent_0, _class_0) -- 415
	end -- 415
	XOMBOKOM = _class_0 -- 415
end -- 417
local Broadcast -- 419
do -- 419
	local _class_0 -- 419
	local _parent_0 = CHAT_CMD_IC -- 419
	local _base_0 = { -- 419
		name = "Broadcast", -- 421
		desc = "Make them all listen.", -- 422
		typing = "Decreeing...", -- 424
		color = Color(200, 0, 0), -- 426
		font = "Spleen_Chat", -- 428
		Process = function(self, ply, text) -- 428
			return Chat.Autopretty(ply, text:upper()) -- 428
		end, -- 430
		Handle = function(self, ply, lang, cmd, text) -- 430
			if not (ply:Team() == TEAM_KOMMANDANT) then -- 431
				ply:Notify("<c=200,0,0>This power is NOT FOR YOU.") -- 432
				return -- 433
			end -- 431
			return _class_0.__parent.__base.Handle(self, ply, lang, cmd, text) -- 434
		end -- 419
	} -- 419
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 434
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 419
			_base_0[_key_0] = _val_0 -- 419
		end -- 419
	end -- 434
	if _base_0.__index == nil then -- 419
		_base_0.__index = _base_0 -- 419
	end -- 434
	setmetatable(_base_0, _parent_0.__base) -- 419
	_class_0 = setmetatable({ -- 419
		__init = function(self, ...) -- 419
			return _class_0.__parent.__init(self, ...) -- 419
		end, -- 419
		__base = _base_0, -- 419
		__name = "Broadcast", -- 419
		__parent = _parent_0 -- 419
	}, { -- 419
		__index = function(cls, name) -- 419
			local val = rawget(_base_0, name) -- 419
			if val == nil then -- 419
				local parent = rawget(cls, "__parent") -- 419
				if parent then -- 419
					return parent[name] -- 419
				end -- 419
			else -- 419
				return val -- 419
			end -- 419
		end, -- 419
		__call = function(cls, ...) -- 419
			local _self_0 = setmetatable({ }, _base_0) -- 419
			cls.__init(_self_0, ...) -- 419
			return _self_0 -- 419
		end -- 419
	}) -- 419
	_base_0.__class = _class_0 -- 419
	if _parent_0.__inherited then -- 419
		_parent_0.__inherited(_parent_0, _class_0) -- 419
	end -- 419
	Broadcast = _class_0 -- 419
end -- 434
if CLIENT then -- 436
	Broadcast.OnReceive = function(self, data) -- 437
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[XOMBOKOM] <wiggle>" .. tostring(data.text) -- 437
	end -- 437
end -- 436
if SERVER then -- 438
	Broadcast.Parse = function(self, ply, lang, cmd, text) -- 439
		text = self:Process(ply, text) -- 440
		ply:EmitSound("XOMBOKOM") -- 441
		return { -- 442
			text = text -- 442
		} -- 442
	end -- 439
end -- 438
local OOC -- 445
do -- 445
	local _class_0 -- 445
	local _parent_0 = CHAT_CMD -- 445
	local _base_0 = { -- 445
		name = "OOC", -- 447
		desc = "Global out-of-character chat.", -- 448
		typing = "Typing...", -- 450
		commands = { -- 450
			"ooc" -- 450
		}, -- 451
		aliases = { -- 451
			"//" -- 451
		}, -- 453
		tabs = TAB_OOC, -- 454
		log_category = "ooc", -- 456
		color = Color(200, 0, 0), -- 458
		font = "Spleen_Chat_Small" -- 445
	} -- 445
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 458
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 445
			_base_0[_key_0] = _val_0 -- 445
		end -- 445
	end -- 458
	if _base_0.__index == nil then -- 445
		_base_0.__index = _base_0 -- 445
	end -- 458
	setmetatable(_base_0, _parent_0.__base) -- 445
	_class_0 = setmetatable({ -- 445
		__init = function(self, ...) -- 445
			return _class_0.__parent.__init(self, ...) -- 445
		end, -- 445
		__base = _base_0, -- 445
		__name = "OOC", -- 445
		__parent = _parent_0 -- 445
	}, { -- 445
		__index = function(cls, name) -- 445
			local val = rawget(_base_0, name) -- 445
			if val == nil then -- 445
				local parent = rawget(cls, "__parent") -- 445
				if parent then -- 445
					return parent[name] -- 445
				end -- 445
			else -- 445
				return val -- 445
			end -- 445
		end, -- 445
		__call = function(cls, ...) -- 445
			local _self_0 = setmetatable({ }, _base_0) -- 445
			cls.__init(_self_0, ...) -- 445
			return _self_0 -- 445
		end -- 445
	}) -- 445
	_base_0.__class = _class_0 -- 445
	if _parent_0.__inherited then -- 445
		_parent_0.__inherited(_parent_0, _class_0) -- 445
	end -- 445
	OOC = _class_0 -- 445
end -- 458
if CLIENT then -- 460
	OOC.OnReceive = function(self, data) -- 461
		local prefix -- 462
		if data.rainbow_name then -- 463
			prefix = "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[OOC]</c> <rgb=1,13,30>" .. tostring(data.name) .. "</rgb>" -- 464
		else -- 466
			prefix = "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[OOC]</c> <c=" .. tostring(data.color) .. ">" .. tostring(data.name) .. "</c>" -- 466
		end -- 463
		return tostring(prefix) .. ": " .. tostring(data.text) -- 467
	end -- 461
end -- 460
if SERVER then -- 468
	OOC.Parse = function(self, ply, lang, cmd, text) -- 471
		local sid = ply:SteamID() -- 472
		local r = util.SharedRandom(sid, 0, 255, 1) -- 473
		local g = util.SharedRandom(sid, 0, 255, 2) -- 474
		local b = util.SharedRandom(sid, 0, 255, 3) -- 475
		local color = Color(r, g, b) -- 476
		local rainbow_name = ply:HasDonation("rainbow") and (ply:GetInfoNum("lfr_rainbow_username", 1) == 1) -- 477
		return { -- 478
			name = ply:SteamName(), -- 478
			color = color, -- 478
			text = text, -- 478
			rainbow_name = rainbow_name -- 478
		} -- 478
	end -- 471
end -- 468
local LOOC -- 481
do -- 481
	local _class_0 -- 481
	local _parent_0 = CHAT_CMD -- 481
	local _base_0 = { -- 481
		name = "Local OOC", -- 483
		desc = "Local out-of-character chat.", -- 484
		typing = "Typing...", -- 486
		commands = { -- 486
			"looc" -- 486
		}, -- 487
		aliases = { -- 487
			"[[", -- 487
			".//" -- 487
		}, -- 489
		range = 400, -- 491
		tabs = TABS_LOOC, -- 492
		log_category = "ooc", -- 494
		color = Color(138, 185, 209), -- 496
		font = "Spleen_Chat_Small" -- 481
	} -- 481
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 496
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 481
			_base_0[_key_0] = _val_0 -- 481
		end -- 481
	end -- 496
	if _base_0.__index == nil then -- 481
		_base_0.__index = _base_0 -- 481
	end -- 496
	setmetatable(_base_0, _parent_0.__base) -- 481
	_class_0 = setmetatable({ -- 481
		__init = function(self, ...) -- 481
			return _class_0.__parent.__init(self, ...) -- 481
		end, -- 481
		__base = _base_0, -- 481
		__name = "LOOC", -- 481
		__parent = _parent_0 -- 481
	}, { -- 481
		__index = function(cls, name) -- 481
			local val = rawget(_base_0, name) -- 481
			if val == nil then -- 481
				local parent = rawget(cls, "__parent") -- 481
				if parent then -- 481
					return parent[name] -- 481
				end -- 481
			else -- 481
				return val -- 481
			end -- 481
		end, -- 481
		__call = function(cls, ...) -- 481
			local _self_0 = setmetatable({ }, _base_0) -- 481
			cls.__init(_self_0, ...) -- 481
			return _self_0 -- 481
		end -- 481
	}) -- 481
	_base_0.__class = _class_0 -- 481
	if _parent_0.__inherited then -- 481
		_parent_0.__inherited(_parent_0, _class_0) -- 481
	end -- 481
	LOOC = _class_0 -- 481
end -- 496
if CLIENT then -- 498
	LOOC.OnReceive = function(self, data) -- 499
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[OOC-LOCAL]</c> <c=" .. tostring(data.color) .. ">" .. tostring(data.name) .. "</c>: " .. tostring(data.text) -- 499
	end -- 499
end -- 498
if SERVER then -- 500
	LOOC.Parse = function(self, ply, lang, cmd, text) -- 501
		return { -- 501
			name = ply:Name(), -- 501
			color = team.GetColor(ply:Team()), -- 501
			text = text -- 501
		} -- 501
	end -- 501
end -- 500
