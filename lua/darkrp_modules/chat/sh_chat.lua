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
	["bro"] = "brother" -- 257
} -- 152
Chat.BadWords = { -- 260
	"tuff", -- 260
	"larp", -- 260
	"huzz", -- 260
	"bruzz", -- 260
	"kirk", -- 260
	"chud", -- 260
	"nigger", -- 260
	"tranny", -- 260
	"nigga", -- 260
	"kike", -- 260
	"autism", -- 260
	"autistic", -- 260
	"autist", -- 260
	"trannies", -- 260
	"faggot", -- 260
	"fag", -- 260
	"fgt", -- 260
	"libtard", -- 260
	"gmyza", -- 260
	"poggers", -- 260
	"pogchamp", -- 260
	"prole gaming", -- 260
	"omegalol", -- 260
	"kekw", -- 260
	"trihard7", -- 260
	"ur mom", -- 260
	"ur mum", -- 260
	"bri-ish", -- 260
	"bri'ish", -- 260
	"nword", -- 260
	"rdm", -- 260
	"nlr", -- 260
	"failrp", -- 260
	"chad", -- 260
	"hoes mad", -- 260
	"yeet", -- 260
	"corpsed", -- 260
	"kek", -- 260
	"chungus", -- 260
	"pog", -- 260
	"fortnite", -- 260
	"skinwalk", -- 260
	"skinshift", -- 260
	"skin walk", -- 260
	"skin shift", -- 260
	"unbindall", -- 260
	"white walking", -- 260
	"weeb", -- 260
	"weeaboo", -- 260
	"amogus", -- 260
	"amog us", -- 260
	"pretty cringe", -- 260
	"that's cringe", -- 260
	"redpilled", -- 260
	"tradcath", -- 260
	"zoomer", -- 260
	"boomer", -- 260
	"doomer", -- 260
	"groyper", -- 260
	"bluepill", -- 260
	"redpill", -- 260
	"tradwife", -- 260
	"blackpill", -- 260
	"big chungus", -- 260
	"spongebob", -- 260
	"impostor among us", -- 260
	"imposter among us", -- 260
	"ligma", -- 260
	"deez", -- 260
	"swag", -- 260
	"font", -- 260
	"bussin", -- 260
	"sussy", -- 260
	"bussy", -- 260
	"meme", -- 260
	"koom", -- 260
	"niglet", -- 260
	"stem cell meat", -- 260
	"make me butcher", -- 260
	"nlgger", -- 260
	"nlgga", -- 260
	"nlg", -- 260
	"bruh", -- 260
	"allah", -- 260
	"akbar", -- 260
	"alahu", -- 260
	"ackbar", -- 260
	"lifeweb", -- 260
	"cuck", -- 260
	"coom", -- 260
	"tryhard", -- 260
	"morbius", -- 260
	"morbin", -- 260
	"/advert", -- 260
	"skibidi", -- 260
	"rizz", -- 260
	"gyatt", -- 260
	"solta" -- 260
} -- 260
do -- 262
	local _class_0 -- 262
	local _parent_0 = CHAT_CMD -- 262
	local _base_0 = { -- 262
		name = "GENERIC", -- 264
		color = Color(200, 200, 200), -- 265
		font = "Spleen_Label", -- 266
		OnReceive = function(self, data) -- 266
			return string.format("<font=%s><c=%s>%s", self.font, self.color, data.text) -- 266
		end -- 262
	} -- 262
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 266
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 262
			_base_0[_key_0] = _val_0 -- 262
		end -- 262
	end -- 266
	if _base_0.__index == nil then -- 262
		_base_0.__index = _base_0 -- 262
	end -- 266
	setmetatable(_base_0, _parent_0.__base) -- 262
	_class_0 = setmetatable({ -- 262
		__init = function(self, ...) -- 262
			return _class_0.__parent.__init(self, ...) -- 262
		end, -- 262
		__base = _base_0, -- 262
		__parent = _parent_0 -- 262
	}, { -- 262
		__index = function(cls, name) -- 262
			local val = rawget(_base_0, name) -- 262
			if val == nil then -- 262
				local parent = rawget(cls, "__parent") -- 262
				if parent then -- 262
					return parent[name] -- 262
				end -- 262
			else -- 262
				return val -- 262
			end -- 262
		end, -- 262
		__call = function(cls, ...) -- 262
			local _self_0 = setmetatable({ }, _base_0) -- 262
			cls.__init(_self_0, ...) -- 262
			return _self_0 -- 262
		end -- 262
	}) -- 262
	_base_0.__class = _class_0 -- 262
	if _parent_0.__inherited then -- 262
		_parent_0.__inherited(_parent_0, _class_0) -- 262
	end -- 262
end -- 266
do -- 268
	local _class_0 -- 268
	local _parent_0 = CHAT_CMD -- 268
	local _base_0 = { -- 268
		name = "NOTICE", -- 270
		color = Color(229, 201, 98), -- 271
		font = "Spleen_Chat", -- 272
		OnReceive = function(self, data) -- 272
			return string.format("<font=%s><c=%s>%s", self.font, self.color, data.text) -- 272
		end -- 268
	} -- 268
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 272
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 268
			_base_0[_key_0] = _val_0 -- 268
		end -- 268
	end -- 272
	if _base_0.__index == nil then -- 268
		_base_0.__index = _base_0 -- 268
	end -- 272
	setmetatable(_base_0, _parent_0.__base) -- 268
	_class_0 = setmetatable({ -- 268
		__init = function(self, ...) -- 268
			return _class_0.__parent.__init(self, ...) -- 268
		end, -- 268
		__base = _base_0, -- 268
		__parent = _parent_0 -- 268
	}, { -- 268
		__index = function(cls, name) -- 268
			local val = rawget(_base_0, name) -- 268
			if val == nil then -- 268
				local parent = rawget(cls, "__parent") -- 268
				if parent then -- 268
					return parent[name] -- 268
				end -- 268
			else -- 268
				return val -- 268
			end -- 268
		end, -- 268
		__call = function(cls, ...) -- 268
			local _self_0 = setmetatable({ }, _base_0) -- 268
			cls.__init(_self_0, ...) -- 268
			return _self_0 -- 268
		end -- 268
	}) -- 268
	_base_0.__class = _class_0 -- 268
	if _parent_0.__inherited then -- 268
		_parent_0.__inherited(_parent_0, _class_0) -- 268
	end -- 268
end -- 272
do -- 274
	local _class_0 -- 274
	local _parent_0 = CHAT_CMD -- 274
	local _base_0 = { -- 274
		name = "ERROR", -- 276
		color = Color(200, 0, 0), -- 277
		color_console = Color(255, 90, 90), -- 278
		font = "Spleen_Chat", -- 279
		OnReceive = function(self, data) -- 279
			return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">ERROR: " .. tostring(data.text), "<c=" .. tostring(self.color_console) .. ">ERROR: " .. tostring(data.text) -- 279
		end -- 274
	} -- 274
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 279
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 274
			_base_0[_key_0] = _val_0 -- 274
		end -- 274
	end -- 279
	if _base_0.__index == nil then -- 274
		_base_0.__index = _base_0 -- 274
	end -- 279
	setmetatable(_base_0, _parent_0.__base) -- 274
	_class_0 = setmetatable({ -- 274
		__init = function(self, ...) -- 274
			return _class_0.__parent.__init(self, ...) -- 274
		end, -- 274
		__base = _base_0, -- 274
		__parent = _parent_0 -- 274
	}, { -- 274
		__index = function(cls, name) -- 274
			local val = rawget(_base_0, name) -- 274
			if val == nil then -- 274
				local parent = rawget(cls, "__parent") -- 274
				if parent then -- 274
					return parent[name] -- 274
				end -- 274
			else -- 274
				return val -- 274
			end -- 274
		end, -- 274
		__call = function(cls, ...) -- 274
			local _self_0 = setmetatable({ }, _base_0) -- 274
			cls.__init(_self_0, ...) -- 274
			return _self_0 -- 274
		end -- 274
	}) -- 274
	_base_0.__class = _class_0 -- 274
	if _parent_0.__inherited then -- 274
		_parent_0.__inherited(_parent_0, _class_0) -- 274
	end -- 274
end -- 279
do -- 281
	local _class_0 -- 281
	local _parent_0 = CHAT_CMD -- 281
	local _base_0 = { -- 281
		tabs = TAB_IC, -- 283
		log_category = "ic", -- 285
		Handle = function(self, ply, lang, cmd, text) -- 285
			if not ply:Alive() then -- 286
				ply:SendChat("ERROR", "You're DEAD.") -- 287
				return -- 288
			end -- 286
			return _class_0.__parent.__base.Handle(self, ply, lang, cmd, text) -- 289
		end -- 281
	} -- 281
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 289
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 281
			_base_0[_key_0] = _val_0 -- 281
		end -- 281
	end -- 289
	if _base_0.__index == nil then -- 281
		_base_0.__index = _base_0 -- 281
	end -- 289
	setmetatable(_base_0, _parent_0.__base) -- 281
	_class_0 = setmetatable({ -- 281
		__init = function(self, ...) -- 281
			return _class_0.__parent.__init(self, ...) -- 281
		end, -- 281
		__base = _base_0, -- 281
		__name = "CHAT_CMD_IC", -- 281
		__parent = _parent_0 -- 281
	}, { -- 281
		__index = function(cls, name) -- 281
			local val = rawget(_base_0, name) -- 281
			if val == nil then -- 281
				local parent = rawget(cls, "__parent") -- 281
				if parent then -- 281
					return parent[name] -- 281
				end -- 281
			else -- 281
				return val -- 281
			end -- 281
		end, -- 281
		__call = function(cls, ...) -- 281
			local _self_0 = setmetatable({ }, _base_0) -- 281
			cls.__init(_self_0, ...) -- 281
			return _self_0 -- 281
		end -- 281
	}) -- 281
	_base_0.__class = _class_0 -- 281
	if _parent_0.__inherited then -- 281
		_parent_0.__inherited(_parent_0, _class_0) -- 281
	end -- 281
	CHAT_CMD_IC = _class_0 -- 281
end -- 289
local Action -- 291
do -- 291
	local _class_0 -- 291
	local _parent_0 = CHAT_CMD_IC -- 291
	local _base_0 = { -- 291
		name = "Action", -- 293
		desc = "Do something.", -- 294
		typing = "Performing...", -- 296
		commands = { -- 296
			"me", -- 296
			"em" -- 296
		}, -- 297
		aliases = { -- 297
			":", -- 297
			"*" -- 297
		}, -- 299
		range = 400, -- 300
		range_muffled = 0, -- 302
		font = "Spleen_Chat" -- 291
	} -- 291
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 302
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 291
			_base_0[_key_0] = _val_0 -- 291
		end -- 291
	end -- 302
	if _base_0.__index == nil then -- 291
		_base_0.__index = _base_0 -- 291
	end -- 302
	setmetatable(_base_0, _parent_0.__base) -- 291
	_class_0 = setmetatable({ -- 291
		__init = function(self, ...) -- 291
			return _class_0.__parent.__init(self, ...) -- 291
		end, -- 291
		__base = _base_0, -- 291
		__name = "Action", -- 291
		__parent = _parent_0 -- 291
	}, { -- 291
		__index = function(cls, name) -- 291
			local val = rawget(_base_0, name) -- 291
			if val == nil then -- 291
				local parent = rawget(cls, "__parent") -- 291
				if parent then -- 291
					return parent[name] -- 291
				end -- 291
			else -- 291
				return val -- 291
			end -- 291
		end, -- 291
		__call = function(cls, ...) -- 291
			local _self_0 = setmetatable({ }, _base_0) -- 291
			cls.__init(_self_0, ...) -- 291
			return _self_0 -- 291
		end -- 291
	}) -- 291
	_base_0.__class = _class_0 -- 291
	if _parent_0.__inherited then -- 291
		_parent_0.__inherited(_parent_0, _class_0) -- 291
	end -- 291
	Action = _class_0 -- 291
end -- 302
if CLIENT then -- 304
	Action.OnReceive = function(self, data) -- 305
		local text = data.text -- 306
		if not string.match(text, "^[,.']") then -- 307
			text = " " .. tostring(text) -- 307
		end -- 307
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(data.color) .. ">** " .. tostring(data.name) .. tostring(text) -- 308
	end -- 305
end -- 304
if SERVER then -- 310
	Action.Parse = function(self, ply, lang, cmd, text) -- 311
		return { -- 312
			name = ply:Name(), -- 312
			color = ply:getJobTable().color, -- 312
			text = text -- 312
		} -- 312
	end -- 311
end -- 310
local Say -- 314
do -- 314
	local _class_0 -- 314
	local _parent_0 = CHAT_CMD_IC -- 314
	local _base_0 = { -- 314
		name = "Say", -- 316
		desc = "Speak out to those around you.", -- 317
		typing = "Lying...", -- 318
		tense = "said", -- 320
		commands = { -- 320
			"say" -- 320
		}, -- 322
		use_language = true, -- 323
		hearable = true, -- 325
		range = 400, -- 326
		range_muffled = 150, -- 328
		font = "Spleen_Chat", -- 330
		color = Color(91, 166, 221), -- 331
		color_lang = Color(255, 167, 73), -- 333
		Process = function(self, ply, text) -- 333
			return Chat.Autopretty(ply, text) -- 333
		end -- 314
	} -- 314
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 333
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 314
			_base_0[_key_0] = _val_0 -- 314
		end -- 314
	end -- 333
	if _base_0.__index == nil then -- 314
		_base_0.__index = _base_0 -- 314
	end -- 333
	setmetatable(_base_0, _parent_0.__base) -- 314
	_class_0 = setmetatable({ -- 314
		__init = function(self, ...) -- 314
			return _class_0.__parent.__init(self, ...) -- 314
		end, -- 314
		__base = _base_0, -- 314
		__name = "Say", -- 314
		__parent = _parent_0 -- 314
	}, { -- 314
		__index = function(cls, name) -- 314
			local val = rawget(_base_0, name) -- 314
			if val == nil then -- 314
				local parent = rawget(cls, "__parent") -- 314
				if parent then -- 314
					return parent[name] -- 314
				end -- 314
			else -- 314
				return val -- 314
			end -- 314
		end, -- 314
		__call = function(cls, ...) -- 314
			local _self_0 = setmetatable({ }, _base_0) -- 314
			cls.__init(_self_0, ...) -- 314
			return _self_0 -- 314
		end -- 314
	}) -- 314
	_base_0.__class = _class_0 -- 314
	if _parent_0.__inherited then -- 314
		_parent_0.__inherited(_parent_0, _class_0) -- 314
	end -- 314
	Say = _class_0 -- 314
end -- 333
if CLIENT then -- 335
	Say.OnReceive = function(self, data) -- 336
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(data.name_color) .. ">" .. tostring(data.name) .. " <c=" .. tostring(Color(255, 255, 255)) .. ">" .. tostring(self.tense) .. ", <c=" .. tostring(self.color) .. ">\"" .. tostring(data.text) .. "\"" -- 336
	end -- 336
end -- 335
if SERVER then -- 347
	Say.Parse = function(self, ply, lang, cmd, text) -- 348
		local targets = self:GetTargets(ply) -- 349
		local valid = { } -- 350
		local invalid = { } -- 351
		for _index_0 = 1, #targets do -- 352
			local target = targets[_index_0] -- 352
			if target == ply or true then -- 354
				valid[#valid + 1] = target -- 355
			else -- 357
				invalid[#invalid + 1] = target -- 357
			end -- 354
		end -- 357
		local name_color = ply:getJobTable().color -- 360
		text = self:Process(ply, text) -- 361
		if not self.silent then -- 362
			ply:PlaySpeechSound(text, SNDLVL_65DB) -- 362
		end -- 362
		return Chat.Send(self.name, { -- 364
			name = ply:Name(), -- 364
			name_color = name_color, -- 365
			lang = lang, -- 366
			text = text -- 367
		}, valid) -- 368
	end -- 348
end -- 347
local Yell -- 371
do -- 371
	local _class_0 -- 371
	local _parent_0 = Say -- 371
	local _base_0 = { -- 371
		name = "Yell", -- 373
		desc = "Yell something at the top of your lungs.", -- 374
		typing = "Yelling...", -- 375
		tense = "shouted", -- 377
		commands = { -- 377
			"yell", -- 377
			"y" -- 377
		}, -- 379
		range = 800, -- 380
		range_muffled = 400, -- 382
		color = Color(255, 50, 50), -- 383
		color_lang = Color(255, 167, 73), -- 385
		Process = function(self, ply, text) -- 385
			text = _class_0.__parent.__base.Process(self, ply, text) -- 386
			text = string.upper(text) -- 387
			local punc = string.sub(text, string.len(text)) -- 388
			if "." == punc then -- 390
				text = tostring(string.sub(text, 1, -2)) .. "!" -- 391
			elseif "?" == punc then -- 392
				text = text .. "!" -- 393
			else -- 395
				text = text .. "!" -- 395
			end -- 395
			return "<wiggle=2>" .. tostring(text) .. "</wiggle>" -- 396
		end -- 371
	} -- 371
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 396
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 371
			_base_0[_key_0] = _val_0 -- 371
		end -- 371
	end -- 396
	if _base_0.__index == nil then -- 371
		_base_0.__index = _base_0 -- 371
	end -- 396
	setmetatable(_base_0, _parent_0.__base) -- 371
	_class_0 = setmetatable({ -- 371
		__init = function(self, ...) -- 371
			return _class_0.__parent.__init(self, ...) -- 371
		end, -- 371
		__base = _base_0, -- 371
		__name = "Yell", -- 371
		__parent = _parent_0 -- 371
	}, { -- 371
		__index = function(cls, name) -- 371
			local val = rawget(_base_0, name) -- 371
			if val == nil then -- 371
				local parent = rawget(cls, "__parent") -- 371
				if parent then -- 371
					return parent[name] -- 371
				end -- 371
			else -- 371
				return val -- 371
			end -- 371
		end, -- 371
		__call = function(cls, ...) -- 371
			local _self_0 = setmetatable({ }, _base_0) -- 371
			cls.__init(_self_0, ...) -- 371
			return _self_0 -- 371
		end -- 371
	}) -- 371
	_base_0.__class = _class_0 -- 371
	if _parent_0.__inherited then -- 371
		_parent_0.__inherited(_parent_0, _class_0) -- 371
	end -- 371
	Yell = _class_0 -- 371
end -- 396
local Whisper -- 398
do -- 398
	local _class_0 -- 398
	local _parent_0 = Say -- 398
	local _base_0 = { -- 398
		name = "Whisper", -- 400
		desc = "Quietly transmit your secrets to your close ones.", -- 401
		typing = "Whispering...", -- 402
		tense = "whispered", -- 404
		silent = true, -- 406
		font = "Spleen_Chat_Small", -- 408
		commands = { -- 408
			"whisper", -- 408
			"w" -- 408
		}, -- 410
		range = 150, -- 411
		range_muffled = 0, -- 413
		color = Color(151, 151, 151), -- 414
		color_lang = Color(255, 167, 73) -- 398
	} -- 398
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 414
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 398
			_base_0[_key_0] = _val_0 -- 398
		end -- 398
	end -- 414
	if _base_0.__index == nil then -- 398
		_base_0.__index = _base_0 -- 398
	end -- 414
	setmetatable(_base_0, _parent_0.__base) -- 398
	_class_0 = setmetatable({ -- 398
		__init = function(self, ...) -- 398
			return _class_0.__parent.__init(self, ...) -- 398
		end, -- 398
		__base = _base_0, -- 398
		__name = "Whisper", -- 398
		__parent = _parent_0 -- 398
	}, { -- 398
		__index = function(cls, name) -- 398
			local val = rawget(_base_0, name) -- 398
			if val == nil then -- 398
				local parent = rawget(cls, "__parent") -- 398
				if parent then -- 398
					return parent[name] -- 398
				end -- 398
			else -- 398
				return val -- 398
			end -- 398
		end, -- 398
		__call = function(cls, ...) -- 398
			local _self_0 = setmetatable({ }, _base_0) -- 398
			cls.__init(_self_0, ...) -- 398
			return _self_0 -- 398
		end -- 398
	}) -- 398
	_base_0.__class = _class_0 -- 398
	if _parent_0.__inherited then -- 398
		_parent_0.__inherited(_parent_0, _class_0) -- 398
	end -- 398
	Whisper = _class_0 -- 398
end -- 414
local Radio -- 416
do -- 416
	local _class_0 -- 416
	local _parent_0 = Say -- 416
	local _base_0 = { -- 416
		name = "Radio", -- 418
		desc = "Call your squad.", -- 419
		typing = "Chattering...", -- 420
		tense = "called", -- 422
		silent = true, -- 424
		font = "Spleen_Chat_Small", -- 426
		commands = { -- 426
			"radio", -- 426
			"r" -- 426
		}, -- 428
		tabs = TAB_RADIO, -- 429
		log_category = "radio", -- 431
		range = 1500, -- 432
		range_muffled = 0, -- 434
		color = Color(151, 151, 151), -- 435
		color_lang = Color(255, 167, 73) -- 416
	} -- 416
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 435
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 416
			_base_0[_key_0] = _val_0 -- 416
		end -- 416
	end -- 435
	if _base_0.__index == nil then -- 416
		_base_0.__index = _base_0 -- 416
	end -- 435
	setmetatable(_base_0, _parent_0.__base) -- 416
	_class_0 = setmetatable({ -- 416
		__init = function(self, ...) -- 416
			return _class_0.__parent.__init(self, ...) -- 416
		end, -- 416
		__base = _base_0, -- 416
		__name = "Radio", -- 416
		__parent = _parent_0 -- 416
	}, { -- 416
		__index = function(cls, name) -- 416
			local val = rawget(_base_0, name) -- 416
			if val == nil then -- 416
				local parent = rawget(cls, "__parent") -- 416
				if parent then -- 416
					return parent[name] -- 416
				end -- 416
			else -- 416
				return val -- 416
			end -- 416
		end, -- 416
		__call = function(cls, ...) -- 416
			local _self_0 = setmetatable({ }, _base_0) -- 416
			cls.__init(_self_0, ...) -- 416
			return _self_0 -- 416
		end -- 416
	}) -- 416
	_base_0.__class = _class_0 -- 416
	if _parent_0.__inherited then -- 416
		_parent_0.__inherited(_parent_0, _class_0) -- 416
	end -- 416
	Radio = _class_0 -- 416
end -- 435
if SERVER then -- 437
	Radio.Parse = function(self, ply, lang, cmd, text) -- 438
		local my_category = ply:getJobTable().category -- 439
		local valid = { } -- 440
		for _, target in pairs(player.GetAll()) do -- 441
			local _continue_0 = false -- 442
			repeat -- 442
				if not (target:getJobTable().category == my_category) then -- 442
					_continue_0 = true -- 442
					break -- 442
				end -- 442
				valid[#valid + 1] = target -- 443
				_continue_0 = true -- 442
			until true -- 443
			if not _continue_0 then -- 443
				break -- 443
			end -- 443
		end -- 443
		local name_color = ply:getJobTable().color -- 445
		text = self:Process(ply, text) -- 446
		return Chat.Send(self.name, { -- 448
			name = ply:Name(), -- 448
			name_color = name_color, -- 449
			lang = lang, -- 450
			text = text -- 451
		}, valid) -- 452
	end -- 438
end -- 437
local XOMBOKOM -- 454
do -- 454
	local _class_0 -- 454
	local _parent_0 = SOUND -- 454
	local _base_0 = { -- 454
		level = SNDLVL_NONE, -- 456
		sound = (function() -- 456
			local _accum_0 = { } -- 456
			local _len_0 = 1 -- 456
			for i = 1, 7 do -- 456
				_accum_0[_len_0] = "kidneydagger/broadcast" .. tostring(i) .. ".wav" -- 456
				_len_0 = _len_0 + 1 -- 456
			end -- 456
			return _accum_0 -- 456
		end)() -- 454
	} -- 454
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 456
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 454
			_base_0[_key_0] = _val_0 -- 454
		end -- 454
	end -- 456
	if _base_0.__index == nil then -- 454
		_base_0.__index = _base_0 -- 454
	end -- 456
	setmetatable(_base_0, _parent_0.__base) -- 454
	_class_0 = setmetatable({ -- 454
		__init = function(self, ...) -- 454
			return _class_0.__parent.__init(self, ...) -- 454
		end, -- 454
		__base = _base_0, -- 454
		__name = "XOMBOKOM", -- 454
		__parent = _parent_0 -- 454
	}, { -- 454
		__index = function(cls, name) -- 454
			local val = rawget(_base_0, name) -- 454
			if val == nil then -- 454
				local parent = rawget(cls, "__parent") -- 454
				if parent then -- 454
					return parent[name] -- 454
				end -- 454
			else -- 454
				return val -- 454
			end -- 454
		end, -- 454
		__call = function(cls, ...) -- 454
			local _self_0 = setmetatable({ }, _base_0) -- 454
			cls.__init(_self_0, ...) -- 454
			return _self_0 -- 454
		end -- 454
	}) -- 454
	_base_0.__class = _class_0 -- 454
	if _parent_0.__inherited then -- 454
		_parent_0.__inherited(_parent_0, _class_0) -- 454
	end -- 454
	XOMBOKOM = _class_0 -- 454
end -- 456
local Broadcast -- 458
do -- 458
	local _class_0 -- 458
	local _parent_0 = CHAT_CMD_IC -- 458
	local _base_0 = { -- 458
		name = "Broadcast", -- 460
		desc = "Make them all listen.", -- 461
		typing = "Decreeing...", -- 463
		commands = { -- 463
			"broadcast", -- 463
			"ad" -- 463
		}, -- 465
		color = Color(200, 0, 0), -- 467
		font = "Spleen_Chat", -- 469
		Process = function(self, ply, text) -- 469
			return Chat.Autopretty(ply, text:upper()) -- 469
		end, -- 471
		Handle = function(self, ply, lang, cmd, text) -- 471
			if not (ply:Team() == TEAM_KOMMANDANT) then -- 472
				ply:Notify("<c=200,0,0>This power is NOT FOR YOU.") -- 473
				return -- 474
			end -- 472
			return _class_0.__parent.__base.Handle(self, ply, lang, cmd, text) -- 475
		end -- 458
	} -- 458
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 475
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 458
			_base_0[_key_0] = _val_0 -- 458
		end -- 458
	end -- 475
	if _base_0.__index == nil then -- 458
		_base_0.__index = _base_0 -- 458
	end -- 475
	setmetatable(_base_0, _parent_0.__base) -- 458
	_class_0 = setmetatable({ -- 458
		__init = function(self, ...) -- 458
			return _class_0.__parent.__init(self, ...) -- 458
		end, -- 458
		__base = _base_0, -- 458
		__name = "Broadcast", -- 458
		__parent = _parent_0 -- 458
	}, { -- 458
		__index = function(cls, name) -- 458
			local val = rawget(_base_0, name) -- 458
			if val == nil then -- 458
				local parent = rawget(cls, "__parent") -- 458
				if parent then -- 458
					return parent[name] -- 458
				end -- 458
			else -- 458
				return val -- 458
			end -- 458
		end, -- 458
		__call = function(cls, ...) -- 458
			local _self_0 = setmetatable({ }, _base_0) -- 458
			cls.__init(_self_0, ...) -- 458
			return _self_0 -- 458
		end -- 458
	}) -- 458
	_base_0.__class = _class_0 -- 458
	if _parent_0.__inherited then -- 458
		_parent_0.__inherited(_parent_0, _class_0) -- 458
	end -- 458
	Broadcast = _class_0 -- 458
end -- 475
if CLIENT then -- 477
	Broadcast.OnReceive = function(self, data) -- 478
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[XOMBOKOM] <wiggle>" .. tostring(data.text) -- 478
	end -- 478
end -- 477
if SERVER then -- 479
	Broadcast.Parse = function(self, ply, lang, cmd, text) -- 480
		text = self:Process(ply, text) -- 481
		ply:EmitSound("XOMBOKOM") -- 482
		return { -- 483
			text = text -- 483
		} -- 483
	end -- 480
end -- 479
local OOC -- 486
do -- 486
	local _class_0 -- 486
	local _parent_0 = CHAT_CMD -- 486
	local _base_0 = { -- 486
		name = "OOC", -- 488
		desc = "Global out-of-character chat.", -- 489
		typing = "Typing...", -- 491
		commands = { -- 491
			"ooc" -- 491
		}, -- 492
		aliases = { -- 492
			"//" -- 492
		}, -- 494
		tabs = TAB_OOC, -- 495
		log_category = "ooc", -- 497
		color = Color(200, 0, 0), -- 499
		font = "Spleen_Chat_Small" -- 486
	} -- 486
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 499
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 486
			_base_0[_key_0] = _val_0 -- 486
		end -- 486
	end -- 499
	if _base_0.__index == nil then -- 486
		_base_0.__index = _base_0 -- 486
	end -- 499
	setmetatable(_base_0, _parent_0.__base) -- 486
	_class_0 = setmetatable({ -- 486
		__init = function(self, ...) -- 486
			return _class_0.__parent.__init(self, ...) -- 486
		end, -- 486
		__base = _base_0, -- 486
		__name = "OOC", -- 486
		__parent = _parent_0 -- 486
	}, { -- 486
		__index = function(cls, name) -- 486
			local val = rawget(_base_0, name) -- 486
			if val == nil then -- 486
				local parent = rawget(cls, "__parent") -- 486
				if parent then -- 486
					return parent[name] -- 486
				end -- 486
			else -- 486
				return val -- 486
			end -- 486
		end, -- 486
		__call = function(cls, ...) -- 486
			local _self_0 = setmetatable({ }, _base_0) -- 486
			cls.__init(_self_0, ...) -- 486
			return _self_0 -- 486
		end -- 486
	}) -- 486
	_base_0.__class = _class_0 -- 486
	if _parent_0.__inherited then -- 486
		_parent_0.__inherited(_parent_0, _class_0) -- 486
	end -- 486
	OOC = _class_0 -- 486
end -- 499
if CLIENT then -- 501
	OOC.OnReceive = function(self, data) -- 502
		local prefix -- 503
		if data.rainbow_name then -- 504
			prefix = "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[OOC]</c> <rgb=1,13,30>" .. tostring(data.name) .. "</rgb>" -- 505
		else -- 507
			prefix = "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[OOC]</c> <c=" .. tostring(data.color) .. ">" .. tostring(data.name) .. "</c>" -- 507
		end -- 504
		return tostring(prefix) .. ": " .. tostring(data.text) -- 508
	end -- 502
end -- 501
if SERVER then -- 509
	OOC.Parse = function(self, ply, lang, cmd, text) -- 512
		local sid = ply:SteamID() -- 513
		local r = util.SharedRandom(sid, 0, 255, 1) -- 514
		local g = util.SharedRandom(sid, 0, 255, 2) -- 515
		local b = util.SharedRandom(sid, 0, 255, 3) -- 516
		local color = Color(r, g, b) -- 517
		local rainbow_name = ply:HasDonation("rainbow") and (ply:GetInfoNum("lfr_rainbow_username", 1) == 1) -- 518
		return { -- 519
			name = ply:SteamName(), -- 519
			color = color, -- 519
			text = text, -- 519
			rainbow_name = rainbow_name -- 519
		} -- 519
	end -- 512
end -- 509
local LOOC -- 522
do -- 522
	local _class_0 -- 522
	local _parent_0 = CHAT_CMD -- 522
	local _base_0 = { -- 522
		name = "Local OOC", -- 524
		desc = "Local out-of-character chat.", -- 525
		typing = "Typing...", -- 527
		commands = { -- 527
			"looc" -- 527
		}, -- 528
		aliases = { -- 528
			"[[", -- 528
			".//" -- 528
		}, -- 530
		range = 400, -- 532
		tabs = TABS_LOOC, -- 533
		log_category = "ooc", -- 535
		color = Color(138, 185, 209), -- 537
		font = "Spleen_Chat_Small" -- 522
	} -- 522
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 537
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 522
			_base_0[_key_0] = _val_0 -- 522
		end -- 522
	end -- 537
	if _base_0.__index == nil then -- 522
		_base_0.__index = _base_0 -- 522
	end -- 537
	setmetatable(_base_0, _parent_0.__base) -- 522
	_class_0 = setmetatable({ -- 522
		__init = function(self, ...) -- 522
			return _class_0.__parent.__init(self, ...) -- 522
		end, -- 522
		__base = _base_0, -- 522
		__name = "LOOC", -- 522
		__parent = _parent_0 -- 522
	}, { -- 522
		__index = function(cls, name) -- 522
			local val = rawget(_base_0, name) -- 522
			if val == nil then -- 522
				local parent = rawget(cls, "__parent") -- 522
				if parent then -- 522
					return parent[name] -- 522
				end -- 522
			else -- 522
				return val -- 522
			end -- 522
		end, -- 522
		__call = function(cls, ...) -- 522
			local _self_0 = setmetatable({ }, _base_0) -- 522
			cls.__init(_self_0, ...) -- 522
			return _self_0 -- 522
		end -- 522
	}) -- 522
	_base_0.__class = _class_0 -- 522
	if _parent_0.__inherited then -- 522
		_parent_0.__inherited(_parent_0, _class_0) -- 522
	end -- 522
	LOOC = _class_0 -- 522
end -- 537
if CLIENT then -- 539
	LOOC.OnReceive = function(self, data) -- 540
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[OOC-LOCAL]</c> <c=" .. tostring(data.color) .. ">" .. tostring(data.name) .. "</c>: " .. tostring(data.text) -- 540
	end -- 540
end -- 539
if SERVER then -- 541
	LOOC.Parse = function(self, ply, lang, cmd, text) -- 542
		return { -- 542
			name = ply:Name(), -- 542
			color = team.GetColor(ply:Team()), -- 542
			text = text -- 542
		} -- 542
	end -- 542
end -- 541
