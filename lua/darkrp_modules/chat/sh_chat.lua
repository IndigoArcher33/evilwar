-- [yue]: darkrp_modules\chat\sh_chat.yue
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
	["mfer"] = "friend of mine", -- 256
	["bro"] = "brother", -- 257
	["alr"] = "alright" -- 258
} -- 152
Chat.BadWords = { -- 261
	"larp", -- 261
	"huzz", -- 261
	"bruzz", -- 261
	"kirk", -- 261
	"chud", -- 261
	"nigger", -- 261
	"tranny", -- 261
	"nigga", -- 261
	"kike", -- 261
	"autism", -- 261
	"autistic", -- 261
	"autist", -- 261
	"trannies", -- 261
	"faggot", -- 261
	"fag", -- 261
	"fgt", -- 261
	"libtard", -- 261
	"gmyza", -- 261
	"poggers", -- 261
	"pogchamp", -- 261
	"prole gaming", -- 261
	"omegalol", -- 261
	"kekw", -- 261
	"trihard7", -- 261
	"ur mom", -- 261
	"ur mum", -- 261
	"bri-ish", -- 261
	"bri'ish", -- 261
	"nword", -- 261
	"rdm", -- 261
	"nlr", -- 261
	"failrp", -- 261
	"chad", -- 261
	"hoes mad", -- 261
	"yeet", -- 261
	"corpsed", -- 261
	"kek", -- 261
	"chungus", -- 261
	"pog", -- 261
	"fortnite", -- 261
	"skinwalk", -- 261
	"skinshift", -- 261
	"skin walk", -- 261
	"skin shift", -- 261
	"unbindall", -- 261
	"white walking", -- 261
	"weeb", -- 261
	"weeaboo", -- 261
	"amogus", -- 261
	"amog us", -- 261
	"pretty cringe", -- 261
	"that's cringe", -- 261
	"redpilled", -- 261
	"tradcath", -- 261
	"zoomer", -- 261
	"boomer", -- 261
	"doomer", -- 261
	"groyper", -- 261
	"bluepill", -- 261
	"redpill", -- 261
	"tradwife", -- 261
	"blackpill", -- 261
	"big chungus", -- 261
	"spongebob", -- 261
	"impostor among us", -- 261
	"imposter among us", -- 261
	"ligma", -- 261
	"deez", -- 261
	"swag", -- 261
	"font", -- 261
	"bussin", -- 261
	"sussy", -- 261
	"bussy", -- 261
	"meme", -- 261
	"koom", -- 261
	"niglet", -- 261
	"stem cell meat", -- 261
	"make me butcher", -- 261
	"nlgger", -- 261
	"nlgga", -- 261
	"nlg", -- 261
	"bruh", -- 261
	"allah", -- 261
	"akbar", -- 261
	"alahu", -- 261
	"ackbar", -- 261
	"lifeweb", -- 261
	"cuck", -- 261
	"coom", -- 261
	"tryhard", -- 261
	"morbius", -- 261
	"morbin", -- 261
	"/advert", -- 261
	"skibidi", -- 261
	"rizz", -- 261
	"gyatt", -- 261
	"solta" -- 261
} -- 261
do -- 263
	local _class_0 -- 263
	local _parent_0 = CHAT_CMD -- 263
	local _base_0 = { -- 263
		name = "GENERIC", -- 265
		color = Color(200, 200, 200), -- 266
		font = "Spleen_Label", -- 267
		OnReceive = function(self, data) -- 267
			return string.format("<font=%s><c=%s>%s", self.font, self.color, data.text) -- 267
		end -- 263
	} -- 263
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 267
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 263
			_base_0[_key_0] = _val_0 -- 263
		end -- 263
	end -- 267
	if _base_0.__index == nil then -- 263
		_base_0.__index = _base_0 -- 263
	end -- 267
	setmetatable(_base_0, _parent_0.__base) -- 263
	_class_0 = setmetatable({ -- 263
		__init = function(self, ...) -- 263
			return _class_0.__parent.__init(self, ...) -- 263
		end, -- 263
		__base = _base_0, -- 263
		__parent = _parent_0 -- 263
	}, { -- 263
		__index = function(cls, name) -- 263
			local val = rawget(_base_0, name) -- 263
			if val == nil then -- 263
				local parent = rawget(cls, "__parent") -- 263
				if parent then -- 263
					return parent[name] -- 263
				end -- 263
			else -- 263
				return val -- 263
			end -- 263
		end, -- 263
		__call = function(cls, ...) -- 263
			local _self_0 = setmetatable({ }, _base_0) -- 263
			cls.__init(_self_0, ...) -- 263
			return _self_0 -- 263
		end -- 263
	}) -- 263
	_base_0.__class = _class_0 -- 263
	if _parent_0.__inherited then -- 263
		_parent_0.__inherited(_parent_0, _class_0) -- 263
	end -- 263
end -- 267
do -- 269
	local _class_0 -- 269
	local _parent_0 = CHAT_CMD -- 269
	local _base_0 = { -- 269
		name = "NOTICE", -- 271
		color = Color(229, 201, 98), -- 272
		font = "Spleen_Chat", -- 273
		OnReceive = function(self, data) -- 273
			return string.format("<font=%s><c=%s>%s", self.font, self.color, data.text) -- 273
		end -- 269
	} -- 269
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 273
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 269
			_base_0[_key_0] = _val_0 -- 269
		end -- 269
	end -- 273
	if _base_0.__index == nil then -- 269
		_base_0.__index = _base_0 -- 269
	end -- 273
	setmetatable(_base_0, _parent_0.__base) -- 269
	_class_0 = setmetatable({ -- 269
		__init = function(self, ...) -- 269
			return _class_0.__parent.__init(self, ...) -- 269
		end, -- 269
		__base = _base_0, -- 269
		__parent = _parent_0 -- 269
	}, { -- 269
		__index = function(cls, name) -- 269
			local val = rawget(_base_0, name) -- 269
			if val == nil then -- 269
				local parent = rawget(cls, "__parent") -- 269
				if parent then -- 269
					return parent[name] -- 269
				end -- 269
			else -- 269
				return val -- 269
			end -- 269
		end, -- 269
		__call = function(cls, ...) -- 269
			local _self_0 = setmetatable({ }, _base_0) -- 269
			cls.__init(_self_0, ...) -- 269
			return _self_0 -- 269
		end -- 269
	}) -- 269
	_base_0.__class = _class_0 -- 269
	if _parent_0.__inherited then -- 269
		_parent_0.__inherited(_parent_0, _class_0) -- 269
	end -- 269
end -- 273
do -- 275
	local _class_0 -- 275
	local _parent_0 = CHAT_CMD -- 275
	local _base_0 = { -- 275
		name = "ERROR", -- 277
		color = Color(200, 0, 0), -- 278
		color_console = Color(255, 90, 90), -- 279
		font = "Spleen_Chat", -- 280
		OnReceive = function(self, data) -- 280
			return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">ERROR: " .. tostring(data.text), "<c=" .. tostring(self.color_console) .. ">ERROR: " .. tostring(data.text) -- 280
		end -- 275
	} -- 275
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 280
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 275
			_base_0[_key_0] = _val_0 -- 275
		end -- 275
	end -- 280
	if _base_0.__index == nil then -- 275
		_base_0.__index = _base_0 -- 275
	end -- 280
	setmetatable(_base_0, _parent_0.__base) -- 275
	_class_0 = setmetatable({ -- 275
		__init = function(self, ...) -- 275
			return _class_0.__parent.__init(self, ...) -- 275
		end, -- 275
		__base = _base_0, -- 275
		__parent = _parent_0 -- 275
	}, { -- 275
		__index = function(cls, name) -- 275
			local val = rawget(_base_0, name) -- 275
			if val == nil then -- 275
				local parent = rawget(cls, "__parent") -- 275
				if parent then -- 275
					return parent[name] -- 275
				end -- 275
			else -- 275
				return val -- 275
			end -- 275
		end, -- 275
		__call = function(cls, ...) -- 275
			local _self_0 = setmetatable({ }, _base_0) -- 275
			cls.__init(_self_0, ...) -- 275
			return _self_0 -- 275
		end -- 275
	}) -- 275
	_base_0.__class = _class_0 -- 275
	if _parent_0.__inherited then -- 275
		_parent_0.__inherited(_parent_0, _class_0) -- 275
	end -- 275
end -- 280
do -- 282
	local _class_0 -- 282
	local _parent_0 = CHAT_CMD -- 282
	local _base_0 = { -- 282
		tabs = TAB_IC, -- 284
		log_category = "ic", -- 286
		Handle = function(self, ply, lang, cmd, text) -- 286
			if not ply:Alive() then -- 287
				ply:SendChat("ERROR", "You're DEAD.") -- 288
				return -- 289
			end -- 287
			return _class_0.__parent.__base.Handle(self, ply, lang, cmd, text) -- 290
		end -- 282
	} -- 282
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 290
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 282
			_base_0[_key_0] = _val_0 -- 282
		end -- 282
	end -- 290
	if _base_0.__index == nil then -- 282
		_base_0.__index = _base_0 -- 282
	end -- 290
	setmetatable(_base_0, _parent_0.__base) -- 282
	_class_0 = setmetatable({ -- 282
		__init = function(self, ...) -- 282
			return _class_0.__parent.__init(self, ...) -- 282
		end, -- 282
		__base = _base_0, -- 282
		__name = "CHAT_CMD_IC", -- 282
		__parent = _parent_0 -- 282
	}, { -- 282
		__index = function(cls, name) -- 282
			local val = rawget(_base_0, name) -- 282
			if val == nil then -- 282
				local parent = rawget(cls, "__parent") -- 282
				if parent then -- 282
					return parent[name] -- 282
				end -- 282
			else -- 282
				return val -- 282
			end -- 282
		end, -- 282
		__call = function(cls, ...) -- 282
			local _self_0 = setmetatable({ }, _base_0) -- 282
			cls.__init(_self_0, ...) -- 282
			return _self_0 -- 282
		end -- 282
	}) -- 282
	_base_0.__class = _class_0 -- 282
	if _parent_0.__inherited then -- 282
		_parent_0.__inherited(_parent_0, _class_0) -- 282
	end -- 282
	CHAT_CMD_IC = _class_0 -- 282
end -- 290
local Action -- 292
do -- 292
	local _class_0 -- 292
	local _parent_0 = CHAT_CMD_IC -- 292
	local _base_0 = { -- 292
		name = "Action", -- 294
		desc = "Do something.", -- 295
		typing = "Performing...", -- 297
		commands = { -- 297
			"me", -- 297
			"em" -- 297
		}, -- 298
		aliases = { -- 298
			":", -- 298
			"*" -- 298
		}, -- 300
		range = 400, -- 301
		range_muffled = 0, -- 303
		font = "Spleen_Chat" -- 292
	} -- 292
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 303
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 292
			_base_0[_key_0] = _val_0 -- 292
		end -- 292
	end -- 303
	if _base_0.__index == nil then -- 292
		_base_0.__index = _base_0 -- 292
	end -- 303
	setmetatable(_base_0, _parent_0.__base) -- 292
	_class_0 = setmetatable({ -- 292
		__init = function(self, ...) -- 292
			return _class_0.__parent.__init(self, ...) -- 292
		end, -- 292
		__base = _base_0, -- 292
		__name = "Action", -- 292
		__parent = _parent_0 -- 292
	}, { -- 292
		__index = function(cls, name) -- 292
			local val = rawget(_base_0, name) -- 292
			if val == nil then -- 292
				local parent = rawget(cls, "__parent") -- 292
				if parent then -- 292
					return parent[name] -- 292
				end -- 292
			else -- 292
				return val -- 292
			end -- 292
		end, -- 292
		__call = function(cls, ...) -- 292
			local _self_0 = setmetatable({ }, _base_0) -- 292
			cls.__init(_self_0, ...) -- 292
			return _self_0 -- 292
		end -- 292
	}) -- 292
	_base_0.__class = _class_0 -- 292
	if _parent_0.__inherited then -- 292
		_parent_0.__inherited(_parent_0, _class_0) -- 292
	end -- 292
	Action = _class_0 -- 292
end -- 303
if CLIENT then -- 305
	Action.OnReceive = function(self, data) -- 306
		local text = data.text -- 307
		if not string.match(text, "^[,.']") then -- 308
			text = " " .. tostring(text) -- 308
		end -- 308
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(data.color) .. ">** " .. tostring(data.name) .. tostring(text) -- 309
	end -- 306
end -- 305
if SERVER then -- 311
	Action.Parse = function(self, ply, lang, cmd, text) -- 312
		return { -- 313
			name = ply:Name(), -- 313
			color = ply:getJobTable().color, -- 313
			text = text -- 313
		} -- 313
	end -- 312
end -- 311
local Say -- 315
do -- 315
	local _class_0 -- 315
	local _parent_0 = CHAT_CMD_IC -- 315
	local _base_0 = { -- 315
		name = "Say", -- 317
		desc = "Speak out to those around you.", -- 318
		typing = "Lying...", -- 319
		tense = "said", -- 321
		commands = { -- 321
			"say" -- 321
		}, -- 323
		use_language = true, -- 324
		hearable = true, -- 326
		range = 400, -- 327
		range_muffled = 150, -- 329
		font = "Spleen_Chat", -- 331
		color = Color(91, 166, 221), -- 332
		color_lang = Color(255, 167, 73), -- 334
		Process = function(self, ply, text) -- 334
			return Chat.Autopretty(ply, text) -- 334
		end -- 315
	} -- 315
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 334
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 315
			_base_0[_key_0] = _val_0 -- 315
		end -- 315
	end -- 334
	if _base_0.__index == nil then -- 315
		_base_0.__index = _base_0 -- 315
	end -- 334
	setmetatable(_base_0, _parent_0.__base) -- 315
	_class_0 = setmetatable({ -- 315
		__init = function(self, ...) -- 315
			return _class_0.__parent.__init(self, ...) -- 315
		end, -- 315
		__base = _base_0, -- 315
		__name = "Say", -- 315
		__parent = _parent_0 -- 315
	}, { -- 315
		__index = function(cls, name) -- 315
			local val = rawget(_base_0, name) -- 315
			if val == nil then -- 315
				local parent = rawget(cls, "__parent") -- 315
				if parent then -- 315
					return parent[name] -- 315
				end -- 315
			else -- 315
				return val -- 315
			end -- 315
		end, -- 315
		__call = function(cls, ...) -- 315
			local _self_0 = setmetatable({ }, _base_0) -- 315
			cls.__init(_self_0, ...) -- 315
			return _self_0 -- 315
		end -- 315
	}) -- 315
	_base_0.__class = _class_0 -- 315
	if _parent_0.__inherited then -- 315
		_parent_0.__inherited(_parent_0, _class_0) -- 315
	end -- 315
	Say = _class_0 -- 315
end -- 334
if CLIENT then -- 336
	Say.OnReceive = function(self, data) -- 337
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(data.name_color) .. ">" .. tostring(data.name) .. " <c=" .. tostring(Color(255, 255, 255)) .. ">" .. tostring(self.tense) .. ", <c=" .. tostring(self.color) .. ">\"" .. tostring(data.text) .. "\"" -- 337
	end -- 337
end -- 336
if SERVER then -- 348
	Say.Parse = function(self, ply, lang, cmd, text) -- 349
		local targets = self:GetTargets(ply) -- 350
		local valid = { } -- 351
		local invalid = { } -- 352
		for _index_0 = 1, #targets do -- 353
			local target = targets[_index_0] -- 353
			if target == ply or true then -- 355
				valid[#valid + 1] = target -- 356
			else -- 358
				invalid[#invalid + 1] = target -- 358
			end -- 355
		end -- 358
		local name_color = ply:getJobTable().color -- 361
		text = self:Process(ply, text) -- 362
		if not self.silent then -- 363
			ply:PlaySpeechSound(text, SNDLVL_65DB) -- 363
		end -- 363
		return Chat.Send(self.name, { -- 365
			name = ply:Name(), -- 365
			name_color = name_color, -- 366
			lang = lang, -- 367
			text = text -- 368
		}, valid) -- 369
	end -- 349
end -- 348
local Yell -- 372
do -- 372
	local _class_0 -- 372
	local _parent_0 = Say -- 372
	local _base_0 = { -- 372
		name = "Yell", -- 374
		desc = "Yell something at the top of your lungs.", -- 375
		typing = "Yelling...", -- 376
		tense = "shouted", -- 378
		commands = { -- 378
			"yell", -- 378
			"y" -- 378
		}, -- 380
		range = 800, -- 381
		range_muffled = 400, -- 383
		color = Color(255, 50, 50), -- 384
		color_lang = Color(255, 167, 73), -- 386
		Process = function(self, ply, text) -- 386
			text = _class_0.__parent.__base.Process(self, ply, text) -- 387
			text = string.upper(text) -- 388
			local punc = string.sub(text, string.len(text)) -- 389
			if "." == punc then -- 391
				text = tostring(string.sub(text, 1, -2)) .. "!" -- 392
			elseif "?" == punc then -- 393
				text = text .. "!" -- 394
			else -- 396
				text = text .. "!" -- 396
			end -- 396
			return "<wiggle=2>" .. tostring(text) .. "</wiggle>" -- 397
		end -- 372
	} -- 372
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 397
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 372
			_base_0[_key_0] = _val_0 -- 372
		end -- 372
	end -- 397
	if _base_0.__index == nil then -- 372
		_base_0.__index = _base_0 -- 372
	end -- 397
	setmetatable(_base_0, _parent_0.__base) -- 372
	_class_0 = setmetatable({ -- 372
		__init = function(self, ...) -- 372
			return _class_0.__parent.__init(self, ...) -- 372
		end, -- 372
		__base = _base_0, -- 372
		__name = "Yell", -- 372
		__parent = _parent_0 -- 372
	}, { -- 372
		__index = function(cls, name) -- 372
			local val = rawget(_base_0, name) -- 372
			if val == nil then -- 372
				local parent = rawget(cls, "__parent") -- 372
				if parent then -- 372
					return parent[name] -- 372
				end -- 372
			else -- 372
				return val -- 372
			end -- 372
		end, -- 372
		__call = function(cls, ...) -- 372
			local _self_0 = setmetatable({ }, _base_0) -- 372
			cls.__init(_self_0, ...) -- 372
			return _self_0 -- 372
		end -- 372
	}) -- 372
	_base_0.__class = _class_0 -- 372
	if _parent_0.__inherited then -- 372
		_parent_0.__inherited(_parent_0, _class_0) -- 372
	end -- 372
	Yell = _class_0 -- 372
end -- 397
local Whisper -- 399
do -- 399
	local _class_0 -- 399
	local _parent_0 = Say -- 399
	local _base_0 = { -- 399
		name = "Whisper", -- 401
		desc = "Quietly transmit your secrets to your close ones.", -- 402
		typing = "Whispering...", -- 403
		tense = "whispered", -- 405
		silent = true, -- 407
		font = "Spleen_Chat_Small", -- 409
		commands = { -- 409
			"whisper", -- 409
			"w" -- 409
		}, -- 411
		range = 150, -- 412
		range_muffled = 0, -- 414
		color = Color(151, 151, 151), -- 415
		color_lang = Color(255, 167, 73) -- 399
	} -- 399
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 415
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 399
			_base_0[_key_0] = _val_0 -- 399
		end -- 399
	end -- 415
	if _base_0.__index == nil then -- 399
		_base_0.__index = _base_0 -- 399
	end -- 415
	setmetatable(_base_0, _parent_0.__base) -- 399
	_class_0 = setmetatable({ -- 399
		__init = function(self, ...) -- 399
			return _class_0.__parent.__init(self, ...) -- 399
		end, -- 399
		__base = _base_0, -- 399
		__name = "Whisper", -- 399
		__parent = _parent_0 -- 399
	}, { -- 399
		__index = function(cls, name) -- 399
			local val = rawget(_base_0, name) -- 399
			if val == nil then -- 399
				local parent = rawget(cls, "__parent") -- 399
				if parent then -- 399
					return parent[name] -- 399
				end -- 399
			else -- 399
				return val -- 399
			end -- 399
		end, -- 399
		__call = function(cls, ...) -- 399
			local _self_0 = setmetatable({ }, _base_0) -- 399
			cls.__init(_self_0, ...) -- 399
			return _self_0 -- 399
		end -- 399
	}) -- 399
	_base_0.__class = _class_0 -- 399
	if _parent_0.__inherited then -- 399
		_parent_0.__inherited(_parent_0, _class_0) -- 399
	end -- 399
	Whisper = _class_0 -- 399
end -- 415
local Radio -- 417
do -- 417
	local _class_0 -- 417
	local _parent_0 = Say -- 417
	local _base_0 = { -- 417
		name = "Radio", -- 419
		desc = "Call your squad.", -- 420
		typing = "Chattering...", -- 421
		tense = "called", -- 423
		silent = true, -- 425
		font = "Spleen_Chat_Small", -- 427
		commands = { -- 427
			"radio", -- 427
			"r" -- 427
		}, -- 429
		tabs = TAB_RADIO, -- 430
		log_category = "radio", -- 432
		range = 1500, -- 433
		range_muffled = 0, -- 435
		color = Color(151, 151, 151), -- 436
		color_lang = Color(255, 167, 73) -- 417
	} -- 417
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 436
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 417
			_base_0[_key_0] = _val_0 -- 417
		end -- 417
	end -- 436
	if _base_0.__index == nil then -- 417
		_base_0.__index = _base_0 -- 417
	end -- 436
	setmetatable(_base_0, _parent_0.__base) -- 417
	_class_0 = setmetatable({ -- 417
		__init = function(self, ...) -- 417
			return _class_0.__parent.__init(self, ...) -- 417
		end, -- 417
		__base = _base_0, -- 417
		__name = "Radio", -- 417
		__parent = _parent_0 -- 417
	}, { -- 417
		__index = function(cls, name) -- 417
			local val = rawget(_base_0, name) -- 417
			if val == nil then -- 417
				local parent = rawget(cls, "__parent") -- 417
				if parent then -- 417
					return parent[name] -- 417
				end -- 417
			else -- 417
				return val -- 417
			end -- 417
		end, -- 417
		__call = function(cls, ...) -- 417
			local _self_0 = setmetatable({ }, _base_0) -- 417
			cls.__init(_self_0, ...) -- 417
			return _self_0 -- 417
		end -- 417
	}) -- 417
	_base_0.__class = _class_0 -- 417
	if _parent_0.__inherited then -- 417
		_parent_0.__inherited(_parent_0, _class_0) -- 417
	end -- 417
	Radio = _class_0 -- 417
end -- 436
if SERVER then -- 438
	Radio.Parse = function(self, ply, lang, cmd, text) -- 439
		local my_category = ply:getJobTable().category -- 440
		local valid = { } -- 441
		for _, target in pairs(player.GetAll()) do -- 442
			local _continue_0 = false -- 443
			repeat -- 443
				if not (target:getJobTable().category == my_category) then -- 443
					_continue_0 = true -- 443
					break -- 443
				end -- 443
				valid[#valid + 1] = target -- 444
				_continue_0 = true -- 443
			until true -- 444
			if not _continue_0 then -- 444
				break -- 444
			end -- 444
		end -- 444
		local name_color = ply:getJobTable().color -- 446
		text = self:Process(ply, text) -- 447
		return Chat.Send(self.name, { -- 449
			name = ply:Name(), -- 449
			name_color = name_color, -- 450
			lang = lang, -- 451
			text = text -- 452
		}, valid) -- 453
	end -- 439
end -- 438
local XOMBOKOM -- 455
do -- 455
	local _class_0 -- 455
	local _parent_0 = SOUND -- 455
	local _base_0 = { -- 455
		level = SNDLVL_NONE, -- 457
		sound = (function() -- 457
			local _accum_0 = { } -- 457
			local _len_0 = 1 -- 457
			for i = 1, 7 do -- 457
				_accum_0[_len_0] = "kidneydagger/broadcast" .. tostring(i) .. ".wav" -- 457
				_len_0 = _len_0 + 1 -- 457
			end -- 457
			return _accum_0 -- 457
		end)() -- 455
	} -- 455
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 457
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 455
			_base_0[_key_0] = _val_0 -- 455
		end -- 455
	end -- 457
	if _base_0.__index == nil then -- 455
		_base_0.__index = _base_0 -- 455
	end -- 457
	setmetatable(_base_0, _parent_0.__base) -- 455
	_class_0 = setmetatable({ -- 455
		__init = function(self, ...) -- 455
			return _class_0.__parent.__init(self, ...) -- 455
		end, -- 455
		__base = _base_0, -- 455
		__name = "XOMBOKOM", -- 455
		__parent = _parent_0 -- 455
	}, { -- 455
		__index = function(cls, name) -- 455
			local val = rawget(_base_0, name) -- 455
			if val == nil then -- 455
				local parent = rawget(cls, "__parent") -- 455
				if parent then -- 455
					return parent[name] -- 455
				end -- 455
			else -- 455
				return val -- 455
			end -- 455
		end, -- 455
		__call = function(cls, ...) -- 455
			local _self_0 = setmetatable({ }, _base_0) -- 455
			cls.__init(_self_0, ...) -- 455
			return _self_0 -- 455
		end -- 455
	}) -- 455
	_base_0.__class = _class_0 -- 455
	if _parent_0.__inherited then -- 455
		_parent_0.__inherited(_parent_0, _class_0) -- 455
	end -- 455
	XOMBOKOM = _class_0 -- 455
end -- 457
local DEUS -- 459
do -- 459
	local _class_0 -- 459
	local _parent_0 = SOUND -- 459
	local _base_0 = { -- 459
		level = SNDLVL_NONE, -- 461
		sound = (function() -- 461
			local _accum_0 = { } -- 461
			local _len_0 = 1 -- 461
			for i = 1, 2 do -- 461
				_accum_0[_len_0] = "changes" .. tostring(i) .. ".ogg" -- 461
				_len_0 = _len_0 + 1 -- 461
			end -- 461
			return _accum_0 -- 461
		end)() -- 459
	} -- 459
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 461
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 459
			_base_0[_key_0] = _val_0 -- 459
		end -- 459
	end -- 461
	if _base_0.__index == nil then -- 459
		_base_0.__index = _base_0 -- 459
	end -- 461
	setmetatable(_base_0, _parent_0.__base) -- 459
	_class_0 = setmetatable({ -- 459
		__init = function(self, ...) -- 459
			return _class_0.__parent.__init(self, ...) -- 459
		end, -- 459
		__base = _base_0, -- 459
		__name = "DEUS", -- 459
		__parent = _parent_0 -- 459
	}, { -- 459
		__index = function(cls, name) -- 459
			local val = rawget(_base_0, name) -- 459
			if val == nil then -- 459
				local parent = rawget(cls, "__parent") -- 459
				if parent then -- 459
					return parent[name] -- 459
				end -- 459
			else -- 459
				return val -- 459
			end -- 459
		end, -- 459
		__call = function(cls, ...) -- 459
			local _self_0 = setmetatable({ }, _base_0) -- 459
			cls.__init(_self_0, ...) -- 459
			return _self_0 -- 459
		end -- 459
	}) -- 459
	_base_0.__class = _class_0 -- 459
	if _parent_0.__inherited then -- 459
		_parent_0.__inherited(_parent_0, _class_0) -- 459
	end -- 459
	DEUS = _class_0 -- 459
end -- 461
local Broadcast -- 463
do -- 463
	local _class_0 -- 463
	local _parent_0 = CHAT_CMD_IC -- 463
	local _base_0 = { -- 463
		name = "Broadcast", -- 465
		desc = "Make them all listen.", -- 466
		typing = "Decreeing...", -- 468
		commands = { -- 468
			"broadcast", -- 468
			"ad" -- 468
		}, -- 470
		color = Color(200, 0, 0), -- 472
		font = "Spleen_Chat", -- 474
		Process = function(self, ply, text) -- 474
			return Chat.Autopretty(ply, text:upper()) -- 474
		end, -- 476
		Handle = function(self, ply, lang, cmd, text) -- 476
			if not (ply:Team() == TEAM_EMPEROR) then -- 477
				ply:Notify("<c=200,0,0>This power is NOT FOR YOU.") -- 478
				return -- 479
			end -- 477
			return _class_0.__parent.__base.Handle(self, ply, lang, cmd, text) -- 480
		end -- 463
	} -- 463
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 480
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 463
			_base_0[_key_0] = _val_0 -- 463
		end -- 463
	end -- 480
	if _base_0.__index == nil then -- 463
		_base_0.__index = _base_0 -- 463
	end -- 480
	setmetatable(_base_0, _parent_0.__base) -- 463
	_class_0 = setmetatable({ -- 463
		__init = function(self, ...) -- 463
			return _class_0.__parent.__init(self, ...) -- 463
		end, -- 463
		__base = _base_0, -- 463
		__name = "Broadcast", -- 463
		__parent = _parent_0 -- 463
	}, { -- 463
		__index = function(cls, name) -- 463
			local val = rawget(_base_0, name) -- 463
			if val == nil then -- 463
				local parent = rawget(cls, "__parent") -- 463
				if parent then -- 463
					return parent[name] -- 463
				end -- 463
			else -- 463
				return val -- 463
			end -- 463
		end, -- 463
		__call = function(cls, ...) -- 463
			local _self_0 = setmetatable({ }, _base_0) -- 463
			cls.__init(_self_0, ...) -- 463
			return _self_0 -- 463
		end -- 463
	}) -- 463
	_base_0.__class = _class_0 -- 463
	if _parent_0.__inherited then -- 463
		_parent_0.__inherited(_parent_0, _class_0) -- 463
	end -- 463
	Broadcast = _class_0 -- 463
end -- 480
local Godcast -- 482
do -- 482
	local _class_0 -- 482
	local _parent_0 = CHAT_CMD_IC -- 482
	local _base_0 = { -- 482
		name = "Godcast", -- 484
		desc = "Make them all listen.", -- 485
		typing = "Decreeing...", -- 487
		commands = { -- 487
			"godcast", -- 487
			"god" -- 487
		}, -- 489
		color = Color(0, 0, 0), -- 491
		font = "Spleen_Chat", -- 493
		Process = function(self, ply, text) -- 493
			return Chat.Autopretty(ply, text:upper()) -- 493
		end, -- 495
		Handle = function(self, ply, lang, cmd, text) -- 495
			if not (ply:Team() == TEAM_EMPEROR) then -- 496
				ply:Notify("<c=200,0,0>This power is NOT FOR YOU.") -- 497
				return -- 498
			end -- 496
			return _class_0.__parent.__base.Handle(self, ply, lang, cmd, text) -- 499
		end -- 482
	} -- 482
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 499
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 482
			_base_0[_key_0] = _val_0 -- 482
		end -- 482
	end -- 499
	if _base_0.__index == nil then -- 482
		_base_0.__index = _base_0 -- 482
	end -- 499
	setmetatable(_base_0, _parent_0.__base) -- 482
	_class_0 = setmetatable({ -- 482
		__init = function(self, ...) -- 482
			return _class_0.__parent.__init(self, ...) -- 482
		end, -- 482
		__base = _base_0, -- 482
		__name = "Godcast", -- 482
		__parent = _parent_0 -- 482
	}, { -- 482
		__index = function(cls, name) -- 482
			local val = rawget(_base_0, name) -- 482
			if val == nil then -- 482
				local parent = rawget(cls, "__parent") -- 482
				if parent then -- 482
					return parent[name] -- 482
				end -- 482
			else -- 482
				return val -- 482
			end -- 482
		end, -- 482
		__call = function(cls, ...) -- 482
			local _self_0 = setmetatable({ }, _base_0) -- 482
			cls.__init(_self_0, ...) -- 482
			return _self_0 -- 482
		end -- 482
	}) -- 482
	_base_0.__class = _class_0 -- 482
	if _parent_0.__inherited then -- 482
		_parent_0.__inherited(_parent_0, _class_0) -- 482
	end -- 482
	Godcast = _class_0 -- 482
end -- 499
if CLIENT then -- 501
	Broadcast.OnReceive = function(self, data) -- 502
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[XOMBOKOM] <wiggle>" .. tostring(data.text) -- 502
	end -- 502
	Godcast.OnReceive = function(self, data) -- 503
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[ORACLEKOM] <wiggle>" .. tostring(data.text) -- 503
	end -- 503
end -- 501
if SERVER then -- 504
	Broadcast.Parse = function(self, ply, lang, cmd, text) -- 505
		text = self:Process(ply, text) -- 506
		ply:EmitSound("XOMBOKOM") -- 507
		return { -- 508
			text = text -- 508
		} -- 508
	end -- 505
	Godcast.Parse = function(self, ply, lang, cmd, text) -- 510
		text = self:Process(ply, text) -- 511
		ply:EmitSound("DEUS") -- 512
		ply:AddDespair(5) -- 513
		net.Start("evilrp_frighten") -- 514
		net.Send(ply) -- 515
		ply:Notify("<c=200,0,0> " .. tostring(text) .. ".") -- 516
		return { -- 517
			text = text -- 517
		} -- 517
	end -- 510
end -- 504
local OOC -- 520
do -- 520
	local _class_0 -- 520
	local _parent_0 = CHAT_CMD -- 520
	local _base_0 = { -- 520
		name = "OOC", -- 522
		desc = "Global out-of-character chat.", -- 523
		typing = "Typing...", -- 525
		commands = { -- 525
			"ooc" -- 525
		}, -- 526
		aliases = { -- 526
			"//" -- 526
		}, -- 528
		tabs = TAB_OOC, -- 529
		log_category = "ooc", -- 531
		color = Color(200, 0, 0), -- 533
		font = "Spleen_Chat_Small" -- 520
	} -- 520
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 533
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 520
			_base_0[_key_0] = _val_0 -- 520
		end -- 520
	end -- 533
	if _base_0.__index == nil then -- 520
		_base_0.__index = _base_0 -- 520
	end -- 533
	setmetatable(_base_0, _parent_0.__base) -- 520
	_class_0 = setmetatable({ -- 520
		__init = function(self, ...) -- 520
			return _class_0.__parent.__init(self, ...) -- 520
		end, -- 520
		__base = _base_0, -- 520
		__name = "OOC", -- 520
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
	OOC = _class_0 -- 520
end -- 533
if CLIENT then -- 535
	OOC.OnReceive = function(self, data) -- 536
		local prefix -- 537
		if data.rainbow_name then -- 538
			prefix = "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[OOC]</c> <rgb=1,13,30>" .. tostring(data.name) .. "</rgb>" -- 539
		else -- 541
			prefix = "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[OOC]</c> <c=" .. tostring(data.color) .. ">" .. tostring(data.name) .. "</c>" -- 541
		end -- 538
		return tostring(prefix) .. ": " .. tostring(data.text) -- 542
	end -- 536
end -- 535
if SERVER then -- 543
	OOC.Parse = function(self, ply, lang, cmd, text) -- 546
		local sid = ply:SteamID() -- 547
		local r = util.SharedRandom(sid, 0, 255, 1) -- 548
		local g = util.SharedRandom(sid, 0, 255, 2) -- 549
		local b = util.SharedRandom(sid, 0, 255, 3) -- 550
		local color = Color(r, g, b) -- 551
		local rainbow_name = ply:HasDonation("rainbow") and (ply:GetInfoNum("lfr_rainbow_username", 1) == 1) -- 552
		return { -- 553
			name = ply:SteamName(), -- 553
			color = color, -- 553
			text = text, -- 553
			rainbow_name = rainbow_name -- 553
		} -- 553
	end -- 546
end -- 543
local LOOC -- 556
do -- 556
	local _class_0 -- 556
	local _parent_0 = CHAT_CMD -- 556
	local _base_0 = { -- 556
		name = "Local OOC", -- 558
		desc = "Local out-of-character chat.", -- 559
		typing = "Typing...", -- 561
		commands = { -- 561
			"looc" -- 561
		}, -- 562
		aliases = { -- 562
			"[[", -- 562
			".//" -- 562
		}, -- 564
		range = 400, -- 566
		tabs = TABS_LOOC, -- 567
		log_category = "ooc", -- 569
		color = Color(138, 185, 209), -- 571
		font = "Spleen_Chat_Small" -- 556
	} -- 556
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 571
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 556
			_base_0[_key_0] = _val_0 -- 556
		end -- 556
	end -- 571
	if _base_0.__index == nil then -- 556
		_base_0.__index = _base_0 -- 556
	end -- 571
	setmetatable(_base_0, _parent_0.__base) -- 556
	_class_0 = setmetatable({ -- 556
		__init = function(self, ...) -- 556
			return _class_0.__parent.__init(self, ...) -- 556
		end, -- 556
		__base = _base_0, -- 556
		__name = "LOOC", -- 556
		__parent = _parent_0 -- 556
	}, { -- 556
		__index = function(cls, name) -- 556
			local val = rawget(_base_0, name) -- 556
			if val == nil then -- 556
				local parent = rawget(cls, "__parent") -- 556
				if parent then -- 556
					return parent[name] -- 556
				end -- 556
			else -- 556
				return val -- 556
			end -- 556
		end, -- 556
		__call = function(cls, ...) -- 556
			local _self_0 = setmetatable({ }, _base_0) -- 556
			cls.__init(_self_0, ...) -- 556
			return _self_0 -- 556
		end -- 556
	}) -- 556
	_base_0.__class = _class_0 -- 556
	if _parent_0.__inherited then -- 556
		_parent_0.__inherited(_parent_0, _class_0) -- 556
	end -- 556
	LOOC = _class_0 -- 556
end -- 571
if CLIENT then -- 573
	LOOC.OnReceive = function(self, data) -- 574
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[OOC-LOCAL]</c> <c=" .. tostring(data.color) .. ">" .. tostring(data.name) .. "</c>: " .. tostring(data.text) -- 574
	end -- 574
end -- 573
if SERVER then -- 575
	LOOC.Parse = function(self, ply, lang, cmd, text) -- 576
		return { -- 576
			name = ply:Name(), -- 576
			color = team.GetColor(ply:Team()), -- 576
			text = text -- 576
		} -- 576
	end -- 576
end -- 575
