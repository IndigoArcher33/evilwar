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
Chat.Announce = function(name, text) -- 152
	return Chat.Send(name, text, player.GetAll()) -- 153
end -- 152
Chat.StupidMistakes = { -- 156
	["i"] = "I", -- 156
	["u"] = "you", -- 157
	["r"] = "are", -- 158
	["dont"] = "don't", -- 159
	["cant"] = "can't", -- 160
	["wont"] = "won't", -- 161
	["doesnt"] = "doesn't", -- 162
	["didnt"] = "didn't", -- 163
	["youve"] = "you've", -- 164
	["i'll"] = "I'll", -- 165
	["itll"] = "it'll", -- 166
	["wouldnt"] = "wouldn't", -- 167
	["shouldnt"] = "shouldn't", -- 168
	["couldnt"] = "couldn't", -- 169
	["whos"] = "who's", -- 170
	["weve"] = "we've", -- 171
	["arent"] = "aren't", -- 172
	["ive"] = "I've", -- 173
	["i've"] = "I've", -- 174
	["hes"] = "he's", -- 175
	["shes"] = "she's", -- 176
	["her's"] = "hers", -- 177
	["whatre"] = "what're", -- 178
	["wheres"] = "where's", -- 179
	["youre"] = "you're", -- 180
	["theres"] = "there's", -- 181
	["theyre"] = "they're", -- 182
	["theyve"] = "they've", -- 183
	["im"] = "I'm", -- 184
	["i'm"] = "I'm", -- 185
	["youll"] = "you'll", -- 186
	["ol"] = "ol'", -- 187
	["k"] = "okay", -- 188
	["ok"] = "okay", -- 189
	["ye"] = "yeah", -- 190
	["yea"] = "yeah", -- 191
	["idk"] = "I don't know", -- 192
	["wtf"] = "what the fuck", -- 193
	["rn"] = "right now", -- 194
	["gtg"] = "gotta go", -- 195
	["brb"] = "be right back", -- 196
	["cmon"] = "c'mon", -- 197
	["lol"] = "heh", -- 198
	["lel"] = "*gag*", -- 199
	["kek"] = "hrk", -- 200
	["lmao"] = "haha", -- 201
	["lmfao"] = "HAHA", -- 202
	["rofl"] = "pfftaha", -- 203
	["roflmao"] = "PFFFTHAH", -- 204
	["nvm"] = "never mind", -- 205
	["aint"] = "ain't", -- 206
	["killin"] = "killin'", -- 207
	["yknow"] = "y'know", -- 208
	["n"] = "n'", -- 209
	["fuckin"] = "fuckin'", -- 210
	["eatin"] = "eatin'", -- 211
	["drinkin"] = "drinkin'", -- 212
	["huntin"] = "huntin'", -- 213
	["lookin"] = "lookin'", -- 214
	["searchin"] = "searchin'", -- 215
	["shittin"] = "shittin'", -- 216
	["jokin"] = "jokin'", -- 217
	["gettin"] = "gettin'", -- 218
	["lettin"] = "lettin'", -- 219
	["fightin"] = "fightin'", -- 220
	["gettin"] = "gettin'", -- 221
	["motherfuckin"] = "motherfuckin'", -- 222
	["ballin"] = "ballin'", -- 223
	["rockin"] = "rockin'", -- 224
	["bangin"] = "bangin'", -- 225
	["rollin"] = "rollin'", -- 226
	["movin"] = "movin'", -- 227
	["somethin"] = "somethin'", -- 228
	["doin"] = "doin'", -- 229
	["th"] = "th'", -- 230
	["tha"] = "tha'", -- 231
	["tho"] = "though", -- 232
	["frick"] = "fuck", -- 233
	["pls"] = "please", -- 234
	["plz"] = "please", -- 235
	["pwned"] = "ruined", -- 236
	["pwn"] = "ruin", -- 237
	["rekt"] = "ruined", -- 238
	["cuz"] = "because", -- 239
	["dw"] = "don't worry", -- 240
	["ty"] = "thank you", -- 241
	["np"] = "no problem", -- 242
	["omw"] = "on my way", -- 243
	["thx"] = "thanks", -- 244
	["gg"] = "gluh", -- 245
	["money"] = "bone", -- 246
	["would of"] = "would've", -- 247
	["should of"] = "should've", -- 248
	["could of"] = "could've", -- 249
	["alot"] = "a lot", -- 250
	["mb"] = "my bad", -- 251
	["turkey"] = "yurkey", -- 252
	["holy shit"] = "holy heart failure", -- 253
	["jesus christ"] = "Sotla eternal", -- 254
	["jesus fucking christ"] = "Sotla's fucking eye", -- 255
	["jesus"] = "Sotla", -- 256
	["mother of god"] = "mother of Sotla", -- 257
	["brother in christ"] = "brother in Sotla", -- 258
	["mfer"] = "friend of mine", -- 259
	["bro"] = "brother", -- 260
	["alr"] = "alright" -- 261
} -- 155
Chat.BadWords = { -- 264
	"larp", -- 264
	"huzz", -- 264
	"bruzz", -- 264
	"kirk", -- 264
	"chud", -- 264
	"nigger", -- 264
	"tranny", -- 264
	"nigga", -- 264
	"kike", -- 264
	"autism", -- 264
	"autistic", -- 264
	"autist", -- 264
	"trannies", -- 264
	"faggot", -- 264
	"fag", -- 264
	"fgt", -- 264
	"libtard", -- 264
	"gmyza", -- 264
	"poggers", -- 264
	"pogchamp", -- 264
	"prole gaming", -- 264
	"omegalol", -- 264
	"kekw", -- 264
	"trihard7", -- 264
	"ur mom", -- 264
	"ur mum", -- 264
	"bri-ish", -- 264
	"bri'ish", -- 264
	"nword", -- 264
	"rdm", -- 264
	"nlr", -- 264
	"failrp", -- 264
	"chad", -- 264
	"hoes mad", -- 264
	"yeet", -- 264
	"corpsed", -- 264
	"kek", -- 264
	"chungus", -- 264
	"pog", -- 264
	"fortnite", -- 264
	"skinwalk", -- 264
	"skinshift", -- 264
	"skin walk", -- 264
	"skin shift", -- 264
	"unbindall", -- 264
	"white walking", -- 264
	"weeb", -- 264
	"weeaboo", -- 264
	"amogus", -- 264
	"amog us", -- 264
	"pretty cringe", -- 264
	"that's cringe", -- 264
	"redpilled", -- 264
	"tradcath", -- 264
	"zoomer", -- 264
	"boomer", -- 264
	"doomer", -- 264
	"groyper", -- 264
	"bluepill", -- 264
	"redpill", -- 264
	"tradwife", -- 264
	"blackpill", -- 264
	"big chungus", -- 264
	"spongebob", -- 264
	"impostor among us", -- 264
	"imposter among us", -- 264
	"ligma", -- 264
	"deez", -- 264
	"swag", -- 264
	"font", -- 264
	"bussin", -- 264
	"sussy", -- 264
	"bussy", -- 264
	"meme", -- 264
	"koom", -- 264
	"niglet", -- 264
	"stem cell meat", -- 264
	"make me butcher", -- 264
	"nlgger", -- 264
	"nlgga", -- 264
	"nlg", -- 264
	"bruh", -- 264
	"allah", -- 264
	"akbar", -- 264
	"alahu", -- 264
	"ackbar", -- 264
	"lifeweb", -- 264
	"cuck", -- 264
	"coom", -- 264
	"tryhard", -- 264
	"morbius", -- 264
	"morbin", -- 264
	"/advert", -- 264
	"skibidi", -- 264
	"rizz", -- 264
	"gyatt", -- 264
	"solta" -- 264
} -- 264
do -- 266
	local _class_0 -- 266
	local _parent_0 = CHAT_CMD -- 266
	local _base_0 = { -- 266
		name = "GENERIC", -- 268
		color = Color(200, 200, 200), -- 269
		font = "Spleen_Label", -- 270
		OnReceive = function(self, data) -- 270
			return string.format("<font=%s><c=%s>%s", self.font, self.color, data.text) -- 270
		end -- 266
	} -- 266
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 270
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 266
			_base_0[_key_0] = _val_0 -- 266
		end -- 266
	end -- 270
	if _base_0.__index == nil then -- 266
		_base_0.__index = _base_0 -- 266
	end -- 270
	setmetatable(_base_0, _parent_0.__base) -- 266
	_class_0 = setmetatable({ -- 266
		__init = function(self, ...) -- 266
			return _class_0.__parent.__init(self, ...) -- 266
		end, -- 266
		__base = _base_0, -- 266
		__parent = _parent_0 -- 266
	}, { -- 266
		__index = function(cls, name) -- 266
			local val = rawget(_base_0, name) -- 266
			if val == nil then -- 266
				local parent = rawget(cls, "__parent") -- 266
				if parent then -- 266
					return parent[name] -- 266
				end -- 266
			else -- 266
				return val -- 266
			end -- 266
		end, -- 266
		__call = function(cls, ...) -- 266
			local _self_0 = setmetatable({ }, _base_0) -- 266
			cls.__init(_self_0, ...) -- 266
			return _self_0 -- 266
		end -- 266
	}) -- 266
	_base_0.__class = _class_0 -- 266
	if _parent_0.__inherited then -- 266
		_parent_0.__inherited(_parent_0, _class_0) -- 266
	end -- 266
end -- 270
do -- 272
	local _class_0 -- 272
	local _parent_0 = CHAT_CMD -- 272
	local _base_0 = { -- 272
		name = "NOTICE", -- 274
		color = Color(229, 201, 98), -- 275
		font = "Spleen_Chat", -- 276
		OnReceive = function(self, data) -- 276
			return string.format("<font=%s><c=%s>%s", self.font, self.color, data.text) -- 276
		end -- 272
	} -- 272
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 276
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 272
			_base_0[_key_0] = _val_0 -- 272
		end -- 272
	end -- 276
	if _base_0.__index == nil then -- 272
		_base_0.__index = _base_0 -- 272
	end -- 276
	setmetatable(_base_0, _parent_0.__base) -- 272
	_class_0 = setmetatable({ -- 272
		__init = function(self, ...) -- 272
			return _class_0.__parent.__init(self, ...) -- 272
		end, -- 272
		__base = _base_0, -- 272
		__parent = _parent_0 -- 272
	}, { -- 272
		__index = function(cls, name) -- 272
			local val = rawget(_base_0, name) -- 272
			if val == nil then -- 272
				local parent = rawget(cls, "__parent") -- 272
				if parent then -- 272
					return parent[name] -- 272
				end -- 272
			else -- 272
				return val -- 272
			end -- 272
		end, -- 272
		__call = function(cls, ...) -- 272
			local _self_0 = setmetatable({ }, _base_0) -- 272
			cls.__init(_self_0, ...) -- 272
			return _self_0 -- 272
		end -- 272
	}) -- 272
	_base_0.__class = _class_0 -- 272
	if _parent_0.__inherited then -- 272
		_parent_0.__inherited(_parent_0, _class_0) -- 272
	end -- 272
end -- 276
do -- 278
	local _class_0 -- 278
	local _parent_0 = CHAT_CMD -- 278
	local _base_0 = { -- 278
		name = "XOMBOKOM", -- 280
		color = Color(230, 10, 10), -- 281
		font = "Spleen_Chat", -- 282
		OnReceive = function(self, data) -- 282
			return string.format("<font=%s><c=%s>%s", self.font, self.color, data.text) -- 282
		end -- 278
	} -- 278
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 282
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 278
			_base_0[_key_0] = _val_0 -- 278
		end -- 278
	end -- 282
	if _base_0.__index == nil then -- 278
		_base_0.__index = _base_0 -- 278
	end -- 282
	setmetatable(_base_0, _parent_0.__base) -- 278
	_class_0 = setmetatable({ -- 278
		__init = function(self, ...) -- 278
			return _class_0.__parent.__init(self, ...) -- 278
		end, -- 278
		__base = _base_0, -- 278
		__parent = _parent_0 -- 278
	}, { -- 278
		__index = function(cls, name) -- 278
			local val = rawget(_base_0, name) -- 278
			if val == nil then -- 278
				local parent = rawget(cls, "__parent") -- 278
				if parent then -- 278
					return parent[name] -- 278
				end -- 278
			else -- 278
				return val -- 278
			end -- 278
		end, -- 278
		__call = function(cls, ...) -- 278
			local _self_0 = setmetatable({ }, _base_0) -- 278
			cls.__init(_self_0, ...) -- 278
			return _self_0 -- 278
		end -- 278
	}) -- 278
	_base_0.__class = _class_0 -- 278
	if _parent_0.__inherited then -- 278
		_parent_0.__inherited(_parent_0, _class_0) -- 278
	end -- 278
end -- 282
do -- 284
	local _class_0 -- 284
	local _parent_0 = CHAT_CMD -- 284
	local _base_0 = { -- 284
		name = "RADIO", -- 286
		color = Color(230, 10, 10), -- 287
		font = "Spleen_Chat", -- 288
		OnReceive = function(self, data) -- 288
			return string.format("<font=%s><c=%s>%s", self.font, self.color, data.text) -- 288
		end -- 284
	} -- 284
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 288
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 284
			_base_0[_key_0] = _val_0 -- 284
		end -- 284
	end -- 288
	if _base_0.__index == nil then -- 284
		_base_0.__index = _base_0 -- 284
	end -- 288
	setmetatable(_base_0, _parent_0.__base) -- 284
	_class_0 = setmetatable({ -- 284
		__init = function(self, ...) -- 284
			return _class_0.__parent.__init(self, ...) -- 284
		end, -- 284
		__base = _base_0, -- 284
		__parent = _parent_0 -- 284
	}, { -- 284
		__index = function(cls, name) -- 284
			local val = rawget(_base_0, name) -- 284
			if val == nil then -- 284
				local parent = rawget(cls, "__parent") -- 284
				if parent then -- 284
					return parent[name] -- 284
				end -- 284
			else -- 284
				return val -- 284
			end -- 284
		end, -- 284
		__call = function(cls, ...) -- 284
			local _self_0 = setmetatable({ }, _base_0) -- 284
			cls.__init(_self_0, ...) -- 284
			return _self_0 -- 284
		end -- 284
	}) -- 284
	_base_0.__class = _class_0 -- 284
	if _parent_0.__inherited then -- 284
		_parent_0.__inherited(_parent_0, _class_0) -- 284
	end -- 284
end -- 288
do -- 290
	local _class_0 -- 290
	local _parent_0 = CHAT_CMD -- 290
	local _base_0 = { -- 290
		name = "ERROR", -- 292
		color = Color(200, 0, 0), -- 293
		color_console = Color(255, 90, 90), -- 294
		font = "Spleen_Chat", -- 295
		OnReceive = function(self, data) -- 295
			return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">ERROR: " .. tostring(data.text), "<c=" .. tostring(self.color_console) .. ">ERROR: " .. tostring(data.text) -- 295
		end -- 290
	} -- 290
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 295
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 290
			_base_0[_key_0] = _val_0 -- 290
		end -- 290
	end -- 295
	if _base_0.__index == nil then -- 290
		_base_0.__index = _base_0 -- 290
	end -- 295
	setmetatable(_base_0, _parent_0.__base) -- 290
	_class_0 = setmetatable({ -- 290
		__init = function(self, ...) -- 290
			return _class_0.__parent.__init(self, ...) -- 290
		end, -- 290
		__base = _base_0, -- 290
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
end -- 295
do -- 297
	local _class_0 -- 297
	local _parent_0 = CHAT_CMD -- 297
	local _base_0 = { -- 297
		tabs = TAB_IC, -- 299
		log_category = "ic", -- 301
		Handle = function(self, ply, lang, cmd, text) -- 301
			if not ply:Alive() then -- 302
				ply:SendChat("ERROR", "You're DEAD.") -- 303
				return -- 304
			end -- 302
			return _class_0.__parent.__base.Handle(self, ply, lang, cmd, text) -- 305
		end -- 297
	} -- 297
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 305
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 297
			_base_0[_key_0] = _val_0 -- 297
		end -- 297
	end -- 305
	if _base_0.__index == nil then -- 297
		_base_0.__index = _base_0 -- 297
	end -- 305
	setmetatable(_base_0, _parent_0.__base) -- 297
	_class_0 = setmetatable({ -- 297
		__init = function(self, ...) -- 297
			return _class_0.__parent.__init(self, ...) -- 297
		end, -- 297
		__base = _base_0, -- 297
		__name = "CHAT_CMD_IC", -- 297
		__parent = _parent_0 -- 297
	}, { -- 297
		__index = function(cls, name) -- 297
			local val = rawget(_base_0, name) -- 297
			if val == nil then -- 297
				local parent = rawget(cls, "__parent") -- 297
				if parent then -- 297
					return parent[name] -- 297
				end -- 297
			else -- 297
				return val -- 297
			end -- 297
		end, -- 297
		__call = function(cls, ...) -- 297
			local _self_0 = setmetatable({ }, _base_0) -- 297
			cls.__init(_self_0, ...) -- 297
			return _self_0 -- 297
		end -- 297
	}) -- 297
	_base_0.__class = _class_0 -- 297
	if _parent_0.__inherited then -- 297
		_parent_0.__inherited(_parent_0, _class_0) -- 297
	end -- 297
	CHAT_CMD_IC = _class_0 -- 297
end -- 305
local Action -- 307
do -- 307
	local _class_0 -- 307
	local _parent_0 = CHAT_CMD_IC -- 307
	local _base_0 = { -- 307
		name = "Action", -- 309
		desc = "Do something.", -- 310
		typing = "Performing...", -- 312
		commands = { -- 312
			"me", -- 312
			"em" -- 312
		}, -- 313
		aliases = { -- 313
			":", -- 313
			"*" -- 313
		}, -- 315
		range = 400, -- 316
		range_muffled = 0, -- 318
		font = "Spleen_Chat" -- 307
	} -- 307
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 318
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 307
			_base_0[_key_0] = _val_0 -- 307
		end -- 307
	end -- 318
	if _base_0.__index == nil then -- 307
		_base_0.__index = _base_0 -- 307
	end -- 318
	setmetatable(_base_0, _parent_0.__base) -- 307
	_class_0 = setmetatable({ -- 307
		__init = function(self, ...) -- 307
			return _class_0.__parent.__init(self, ...) -- 307
		end, -- 307
		__base = _base_0, -- 307
		__name = "Action", -- 307
		__parent = _parent_0 -- 307
	}, { -- 307
		__index = function(cls, name) -- 307
			local val = rawget(_base_0, name) -- 307
			if val == nil then -- 307
				local parent = rawget(cls, "__parent") -- 307
				if parent then -- 307
					return parent[name] -- 307
				end -- 307
			else -- 307
				return val -- 307
			end -- 307
		end, -- 307
		__call = function(cls, ...) -- 307
			local _self_0 = setmetatable({ }, _base_0) -- 307
			cls.__init(_self_0, ...) -- 307
			return _self_0 -- 307
		end -- 307
	}) -- 307
	_base_0.__class = _class_0 -- 307
	if _parent_0.__inherited then -- 307
		_parent_0.__inherited(_parent_0, _class_0) -- 307
	end -- 307
	Action = _class_0 -- 307
end -- 318
if CLIENT then -- 320
	Action.OnReceive = function(self, data) -- 321
		local text = data.text -- 322
		if not string.match(text, "^[,.']") then -- 323
			text = " " .. tostring(text) -- 323
		end -- 323
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(data.color) .. ">** " .. tostring(data.name) .. tostring(text) -- 324
	end -- 321
end -- 320
if SERVER then -- 326
	Action.Parse = function(self, ply, lang, cmd, text) -- 327
		return { -- 328
			name = ply:Name(), -- 328
			color = ply:getJobTable().color, -- 328
			text = text -- 328
		} -- 328
	end -- 327
end -- 326
local Say -- 330
do -- 330
	local _class_0 -- 330
	local _parent_0 = CHAT_CMD_IC -- 330
	local _base_0 = { -- 330
		name = "Say", -- 332
		desc = "Speak out to those around you.", -- 333
		typing = "Lying...", -- 334
		tense = "said", -- 336
		commands = { -- 336
			"say" -- 336
		}, -- 338
		use_language = true, -- 339
		hearable = true, -- 341
		range = 400, -- 342
		range_muffled = 150, -- 344
		font = "Spleen_Chat", -- 346
		color = Color(91, 166, 221), -- 347
		color_lang = Color(255, 167, 73), -- 349
		Process = function(self, ply, text) -- 349
			return Chat.Autopretty(ply, text) -- 349
		end -- 330
	} -- 330
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 349
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 330
			_base_0[_key_0] = _val_0 -- 330
		end -- 330
	end -- 349
	if _base_0.__index == nil then -- 330
		_base_0.__index = _base_0 -- 330
	end -- 349
	setmetatable(_base_0, _parent_0.__base) -- 330
	_class_0 = setmetatable({ -- 330
		__init = function(self, ...) -- 330
			return _class_0.__parent.__init(self, ...) -- 330
		end, -- 330
		__base = _base_0, -- 330
		__name = "Say", -- 330
		__parent = _parent_0 -- 330
	}, { -- 330
		__index = function(cls, name) -- 330
			local val = rawget(_base_0, name) -- 330
			if val == nil then -- 330
				local parent = rawget(cls, "__parent") -- 330
				if parent then -- 330
					return parent[name] -- 330
				end -- 330
			else -- 330
				return val -- 330
			end -- 330
		end, -- 330
		__call = function(cls, ...) -- 330
			local _self_0 = setmetatable({ }, _base_0) -- 330
			cls.__init(_self_0, ...) -- 330
			return _self_0 -- 330
		end -- 330
	}) -- 330
	_base_0.__class = _class_0 -- 330
	if _parent_0.__inherited then -- 330
		_parent_0.__inherited(_parent_0, _class_0) -- 330
	end -- 330
	Say = _class_0 -- 330
end -- 349
if CLIENT then -- 351
	Say.OnReceive = function(self, data) -- 352
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(data.name_color) .. ">" .. tostring(data.name) .. " <c=" .. tostring(Color(255, 255, 255)) .. ">" .. tostring(self.tense) .. ", <c=" .. tostring(self.color) .. ">\"" .. tostring(data.text) .. "\"" -- 352
	end -- 352
end -- 351
if SERVER then -- 363
	Say.Parse = function(self, ply, lang, cmd, text) -- 364
		local targets = self:GetTargets(ply) -- 365
		local valid = { } -- 366
		local invalid = { } -- 367
		for _index_0 = 1, #targets do -- 368
			local target = targets[_index_0] -- 368
			if target == ply or true then -- 370
				valid[#valid + 1] = target -- 371
			else -- 373
				invalid[#invalid + 1] = target -- 373
			end -- 370
		end -- 373
		local name_color = ply:getJobTable().color -- 376
		text = self:Process(ply, text) -- 377
		if not self.silent then -- 378
			ply:PlaySpeechSound(text, SNDLVL_65DB) -- 378
		end -- 378
		return Chat.Send(self.name, { -- 380
			name = ply:Name(), -- 380
			name_color = name_color, -- 381
			lang = lang, -- 382
			text = text -- 383
		}, valid) -- 384
	end -- 364
end -- 363
local Yell -- 387
do -- 387
	local _class_0 -- 387
	local _parent_0 = Say -- 387
	local _base_0 = { -- 387
		name = "Yell", -- 389
		desc = "Yell something at the top of your lungs.", -- 390
		typing = "Yelling...", -- 391
		tense = "shouted", -- 393
		commands = { -- 393
			"yell", -- 393
			"y" -- 393
		}, -- 395
		range = 800, -- 396
		range_muffled = 400, -- 398
		color = Color(255, 50, 50), -- 399
		color_lang = Color(255, 167, 73), -- 401
		Process = function(self, ply, text) -- 401
			text = _class_0.__parent.__base.Process(self, ply, text) -- 402
			text = string.upper(text) -- 403
			local punc = string.sub(text, string.len(text)) -- 404
			if "." == punc then -- 406
				text = tostring(string.sub(text, 1, -2)) .. "!" -- 407
			elseif "?" == punc then -- 408
				text = text .. "!" -- 409
			else -- 411
				text = text .. "!" -- 411
			end -- 411
			return "<wiggle=2>" .. tostring(text) .. "</wiggle>" -- 412
		end -- 387
	} -- 387
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 412
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 387
			_base_0[_key_0] = _val_0 -- 387
		end -- 387
	end -- 412
	if _base_0.__index == nil then -- 387
		_base_0.__index = _base_0 -- 387
	end -- 412
	setmetatable(_base_0, _parent_0.__base) -- 387
	_class_0 = setmetatable({ -- 387
		__init = function(self, ...) -- 387
			return _class_0.__parent.__init(self, ...) -- 387
		end, -- 387
		__base = _base_0, -- 387
		__name = "Yell", -- 387
		__parent = _parent_0 -- 387
	}, { -- 387
		__index = function(cls, name) -- 387
			local val = rawget(_base_0, name) -- 387
			if val == nil then -- 387
				local parent = rawget(cls, "__parent") -- 387
				if parent then -- 387
					return parent[name] -- 387
				end -- 387
			else -- 387
				return val -- 387
			end -- 387
		end, -- 387
		__call = function(cls, ...) -- 387
			local _self_0 = setmetatable({ }, _base_0) -- 387
			cls.__init(_self_0, ...) -- 387
			return _self_0 -- 387
		end -- 387
	}) -- 387
	_base_0.__class = _class_0 -- 387
	if _parent_0.__inherited then -- 387
		_parent_0.__inherited(_parent_0, _class_0) -- 387
	end -- 387
	Yell = _class_0 -- 387
end -- 412
local Whisper -- 414
do -- 414
	local _class_0 -- 414
	local _parent_0 = Say -- 414
	local _base_0 = { -- 414
		name = "Whisper", -- 416
		desc = "Quietly transmit your secrets to your close ones.", -- 417
		typing = "Whispering...", -- 418
		tense = "whispered", -- 420
		silent = true, -- 422
		font = "Spleen_Chat_Small", -- 424
		commands = { -- 424
			"whisper", -- 424
			"w" -- 424
		}, -- 426
		range = 150, -- 427
		range_muffled = 0, -- 429
		color = Color(151, 151, 151), -- 430
		color_lang = Color(255, 167, 73) -- 414
	} -- 414
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 430
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 414
			_base_0[_key_0] = _val_0 -- 414
		end -- 414
	end -- 430
	if _base_0.__index == nil then -- 414
		_base_0.__index = _base_0 -- 414
	end -- 430
	setmetatable(_base_0, _parent_0.__base) -- 414
	_class_0 = setmetatable({ -- 414
		__init = function(self, ...) -- 414
			return _class_0.__parent.__init(self, ...) -- 414
		end, -- 414
		__base = _base_0, -- 414
		__name = "Whisper", -- 414
		__parent = _parent_0 -- 414
	}, { -- 414
		__index = function(cls, name) -- 414
			local val = rawget(_base_0, name) -- 414
			if val == nil then -- 414
				local parent = rawget(cls, "__parent") -- 414
				if parent then -- 414
					return parent[name] -- 414
				end -- 414
			else -- 414
				return val -- 414
			end -- 414
		end, -- 414
		__call = function(cls, ...) -- 414
			local _self_0 = setmetatable({ }, _base_0) -- 414
			cls.__init(_self_0, ...) -- 414
			return _self_0 -- 414
		end -- 414
	}) -- 414
	_base_0.__class = _class_0 -- 414
	if _parent_0.__inherited then -- 414
		_parent_0.__inherited(_parent_0, _class_0) -- 414
	end -- 414
	Whisper = _class_0 -- 414
end -- 430
local Radio -- 432
do -- 432
	local _class_0 -- 432
	local _parent_0 = Say -- 432
	local _base_0 = { -- 432
		name = "Radio", -- 434
		desc = "Call your squad.", -- 435
		typing = "Chattering...", -- 436
		tense = "called", -- 438
		silent = true, -- 440
		font = "Spleen_Chat_Small", -- 442
		commands = { -- 442
			"radio", -- 442
			"r" -- 442
		}, -- 444
		tabs = TAB_RADIO, -- 445
		log_category = "radio", -- 447
		range = 1500, -- 448
		range_muffled = 0, -- 450
		color = Color(151, 151, 151), -- 451
		color_lang = Color(255, 167, 73) -- 432
	} -- 432
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 451
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 432
			_base_0[_key_0] = _val_0 -- 432
		end -- 432
	end -- 451
	if _base_0.__index == nil then -- 432
		_base_0.__index = _base_0 -- 432
	end -- 451
	setmetatable(_base_0, _parent_0.__base) -- 432
	_class_0 = setmetatable({ -- 432
		__init = function(self, ...) -- 432
			return _class_0.__parent.__init(self, ...) -- 432
		end, -- 432
		__base = _base_0, -- 432
		__name = "Radio", -- 432
		__parent = _parent_0 -- 432
	}, { -- 432
		__index = function(cls, name) -- 432
			local val = rawget(_base_0, name) -- 432
			if val == nil then -- 432
				local parent = rawget(cls, "__parent") -- 432
				if parent then -- 432
					return parent[name] -- 432
				end -- 432
			else -- 432
				return val -- 432
			end -- 432
		end, -- 432
		__call = function(cls, ...) -- 432
			local _self_0 = setmetatable({ }, _base_0) -- 432
			cls.__init(_self_0, ...) -- 432
			return _self_0 -- 432
		end -- 432
	}) -- 432
	_base_0.__class = _class_0 -- 432
	if _parent_0.__inherited then -- 432
		_parent_0.__inherited(_parent_0, _class_0) -- 432
	end -- 432
	Radio = _class_0 -- 432
end -- 451
if SERVER then -- 453
	Radio.Parse = function(self, ply, lang, cmd, text) -- 454
		local my_category = ply:getJobTable().category -- 455
		local valid = { } -- 456
		for _, target in pairs(player.GetAll()) do -- 457
			local _continue_0 = false -- 458
			repeat -- 458
				if not (target:getJobTable().category == my_category) then -- 458
					_continue_0 = true -- 458
					break -- 458
				end -- 458
				valid[#valid + 1] = target -- 459
				_continue_0 = true -- 458
			until true -- 459
			if not _continue_0 then -- 459
				break -- 459
			end -- 459
		end -- 459
		local name_color = ply:getJobTable().color -- 461
		text = self:Process(ply, text) -- 462
		return Chat.Send(self.name, { -- 464
			name = ply:Name(), -- 464
			name_color = name_color, -- 465
			lang = lang, -- 466
			text = text -- 467
		}, valid) -- 468
	end -- 454
end -- 453
local XOMBOKOM -- 470
do -- 470
	local _class_0 -- 470
	local _parent_0 = SOUND -- 470
	local _base_0 = { -- 470
		level = SNDLVL_NONE, -- 472
		sound = (function() -- 472
			local _accum_0 = { } -- 472
			local _len_0 = 1 -- 472
			for i = 1, 7 do -- 472
				_accum_0[_len_0] = "kidneydagger/broadcast" .. tostring(i) .. ".wav" -- 472
				_len_0 = _len_0 + 1 -- 472
			end -- 472
			return _accum_0 -- 472
		end)() -- 470
	} -- 470
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 472
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 470
			_base_0[_key_0] = _val_0 -- 470
		end -- 470
	end -- 472
	if _base_0.__index == nil then -- 470
		_base_0.__index = _base_0 -- 470
	end -- 472
	setmetatable(_base_0, _parent_0.__base) -- 470
	_class_0 = setmetatable({ -- 470
		__init = function(self, ...) -- 470
			return _class_0.__parent.__init(self, ...) -- 470
		end, -- 470
		__base = _base_0, -- 470
		__name = "XOMBOKOM", -- 470
		__parent = _parent_0 -- 470
	}, { -- 470
		__index = function(cls, name) -- 470
			local val = rawget(_base_0, name) -- 470
			if val == nil then -- 470
				local parent = rawget(cls, "__parent") -- 470
				if parent then -- 470
					return parent[name] -- 470
				end -- 470
			else -- 470
				return val -- 470
			end -- 470
		end, -- 470
		__call = function(cls, ...) -- 470
			local _self_0 = setmetatable({ }, _base_0) -- 470
			cls.__init(_self_0, ...) -- 470
			return _self_0 -- 470
		end -- 470
	}) -- 470
	_base_0.__class = _class_0 -- 470
	if _parent_0.__inherited then -- 470
		_parent_0.__inherited(_parent_0, _class_0) -- 470
	end -- 470
	XOMBOKOM = _class_0 -- 470
end -- 472
local DEUS -- 474
do -- 474
	local _class_0 -- 474
	local _parent_0 = SOUND -- 474
	local _base_0 = { -- 474
		level = SNDLVL_NONE, -- 476
		sound = (function() -- 476
			local _accum_0 = { } -- 476
			local _len_0 = 1 -- 476
			for i = 1, 2 do -- 476
				_accum_0[_len_0] = "changes" .. tostring(i) .. ".ogg" -- 476
				_len_0 = _len_0 + 1 -- 476
			end -- 476
			return _accum_0 -- 476
		end)() -- 474
	} -- 474
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 476
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 474
			_base_0[_key_0] = _val_0 -- 474
		end -- 474
	end -- 476
	if _base_0.__index == nil then -- 474
		_base_0.__index = _base_0 -- 474
	end -- 476
	setmetatable(_base_0, _parent_0.__base) -- 474
	_class_0 = setmetatable({ -- 474
		__init = function(self, ...) -- 474
			return _class_0.__parent.__init(self, ...) -- 474
		end, -- 474
		__base = _base_0, -- 474
		__name = "DEUS", -- 474
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
	DEUS = _class_0 -- 474
end -- 476
local Meistercast -- 478
do -- 478
	local _class_0 -- 478
	local _parent_0 = CHAT_CMD_IC -- 478
	local _base_0 = { -- 478
		name = "MEISTERKOM", -- 480
		color = Color(210, 100, 0), -- 481
		font = "Spleen_Chat", -- 483
		Handle = function(self, ply, lang, cmd, text) -- 483
			if not (ply:Team() == TEAM_DEALER) then -- 484
				ply:Notify("<c=200,0,0>This power is NOT FOR YOU.") -- 485
				return -- 486
			end -- 484
			return _class_0.__parent.__base.Handle(self, ply, lang, cmd, text) -- 487
		end, -- 489
		Process = function(self, ply, text) -- 489
			return Chat.Autopretty(ply, text:upper()) -- 489
		end -- 478
	} -- 478
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 489
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 478
			_base_0[_key_0] = _val_0 -- 478
		end -- 478
	end -- 489
	if _base_0.__index == nil then -- 478
		_base_0.__index = _base_0 -- 478
	end -- 489
	setmetatable(_base_0, _parent_0.__base) -- 478
	_class_0 = setmetatable({ -- 478
		__init = function(self, ...) -- 478
			return _class_0.__parent.__init(self, ...) -- 478
		end, -- 478
		__base = _base_0, -- 478
		__name = "Meistercast", -- 478
		__parent = _parent_0 -- 478
	}, { -- 478
		__index = function(cls, name) -- 478
			local val = rawget(_base_0, name) -- 478
			if val == nil then -- 478
				local parent = rawget(cls, "__parent") -- 478
				if parent then -- 478
					return parent[name] -- 478
				end -- 478
			else -- 478
				return val -- 478
			end -- 478
		end, -- 478
		__call = function(cls, ...) -- 478
			local _self_0 = setmetatable({ }, _base_0) -- 478
			cls.__init(_self_0, ...) -- 478
			return _self_0 -- 478
		end -- 478
	}) -- 478
	_base_0.__class = _class_0 -- 478
	if _parent_0.__inherited then -- 478
		_parent_0.__inherited(_parent_0, _class_0) -- 478
	end -- 478
	Meistercast = _class_0 -- 478
end -- 489
local Xombocast -- 492
do -- 492
	local _class_0 -- 492
	local _parent_0 = CHAT_CMD_IC -- 492
	local _base_0 = { -- 492
		name = "XOMBOKOM", -- 494
		color = Color(210, 0, 0), -- 495
		font = "Spleen_Chat", -- 497
		Handle = function(self, ply, lang, cmd, text) -- 497
			if not (ply:Team() == TEAM_EMPEROR) then -- 498
				ply:Notify("<c=200,0,0>This power is NOT FOR YOU.") -- 499
				return -- 500
			end -- 498
			return _class_0.__parent.__base.Handle(self, ply, lang, cmd, text) -- 501
		end, -- 503
		Process = function(self, ply, text) -- 503
			return Chat.Autopretty(ply, text:upper()) -- 503
		end -- 492
	} -- 492
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 503
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 492
			_base_0[_key_0] = _val_0 -- 492
		end -- 492
	end -- 503
	if _base_0.__index == nil then -- 492
		_base_0.__index = _base_0 -- 492
	end -- 503
	setmetatable(_base_0, _parent_0.__base) -- 492
	_class_0 = setmetatable({ -- 492
		__init = function(self, ...) -- 492
			return _class_0.__parent.__init(self, ...) -- 492
		end, -- 492
		__base = _base_0, -- 492
		__name = "Xombocast", -- 492
		__parent = _parent_0 -- 492
	}, { -- 492
		__index = function(cls, name) -- 492
			local val = rawget(_base_0, name) -- 492
			if val == nil then -- 492
				local parent = rawget(cls, "__parent") -- 492
				if parent then -- 492
					return parent[name] -- 492
				end -- 492
			else -- 492
				return val -- 492
			end -- 492
		end, -- 492
		__call = function(cls, ...) -- 492
			local _self_0 = setmetatable({ }, _base_0) -- 492
			cls.__init(_self_0, ...) -- 492
			return _self_0 -- 492
		end -- 492
	}) -- 492
	_base_0.__class = _class_0 -- 492
	if _parent_0.__inherited then -- 492
		_parent_0.__inherited(_parent_0, _class_0) -- 492
	end -- 492
	Xombocast = _class_0 -- 492
end -- 503
local Broadcast -- 505
do -- 505
	local _class_0 -- 505
	local _parent_0 = CHAT_CMD_IC -- 505
	local _base_0 = { -- 505
		name = "Broadcast", -- 507
		desc = "Make them all listen.", -- 508
		typing = "Decreeing...", -- 510
		commands = { -- 510
			"broadcast", -- 510
			"ad" -- 510
		}, -- 512
		color = Color(200, 0, 0), -- 514
		font = "Spleen_Chat", -- 516
		Handle = function(self, ply, lang, cmd, text) -- 516
			local _exp_0 = ply:Team() -- 517
			if TEAM_DEALER == _exp_0 then -- 518
				return Meistercast:Handle(ply, lang, cmd, text) -- 519
			elseif TEAM_EMPEROR == _exp_0 then -- 520
				return Xombocast:Handle(ply, lang, cmd, text) -- 521
			end -- 521
		end -- 505
	} -- 505
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 521
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 505
			_base_0[_key_0] = _val_0 -- 505
		end -- 505
	end -- 521
	if _base_0.__index == nil then -- 505
		_base_0.__index = _base_0 -- 505
	end -- 521
	setmetatable(_base_0, _parent_0.__base) -- 505
	_class_0 = setmetatable({ -- 505
		__init = function(self, ...) -- 505
			return _class_0.__parent.__init(self, ...) -- 505
		end, -- 505
		__base = _base_0, -- 505
		__name = "Broadcast", -- 505
		__parent = _parent_0 -- 505
	}, { -- 505
		__index = function(cls, name) -- 505
			local val = rawget(_base_0, name) -- 505
			if val == nil then -- 505
				local parent = rawget(cls, "__parent") -- 505
				if parent then -- 505
					return parent[name] -- 505
				end -- 505
			else -- 505
				return val -- 505
			end -- 505
		end, -- 505
		__call = function(cls, ...) -- 505
			local _self_0 = setmetatable({ }, _base_0) -- 505
			cls.__init(_self_0, ...) -- 505
			return _self_0 -- 505
		end -- 505
	}) -- 505
	_base_0.__class = _class_0 -- 505
	if _parent_0.__inherited then -- 505
		_parent_0.__inherited(_parent_0, _class_0) -- 505
	end -- 505
	Broadcast = _class_0 -- 505
end -- 521
local Godcast -- 524
do -- 524
	local _class_0 -- 524
	local _parent_0 = CHAT_CMD_IC -- 524
	local _base_0 = { -- 524
		name = "Godcast", -- 526
		desc = "Make them all listen.", -- 527
		typing = "Decreeing...", -- 529
		commands = { -- 529
			"godcast", -- 529
			"god" -- 529
		}, -- 531
		color = Color(0, 0, 0), -- 533
		font = "Spleen_Chat", -- 535
		Process = function(self, ply, text) -- 535
			return Chat.Autopretty(ply, text:upper()) -- 535
		end, -- 537
		Handle = function(self, ply, lang, cmd, text) -- 537
			if not ply:IsSuperAdmin() then -- 538
				ply:Notify("<c=200,0,0>This power is NOT FOR YOU.") -- 539
				return -- 540
			end -- 538
			return _class_0.__parent.__base.Handle(self, ply, lang, cmd, text) -- 541
		end -- 524
	} -- 524
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 541
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 524
			_base_0[_key_0] = _val_0 -- 524
		end -- 524
	end -- 541
	if _base_0.__index == nil then -- 524
		_base_0.__index = _base_0 -- 524
	end -- 541
	setmetatable(_base_0, _parent_0.__base) -- 524
	_class_0 = setmetatable({ -- 524
		__init = function(self, ...) -- 524
			return _class_0.__parent.__init(self, ...) -- 524
		end, -- 524
		__base = _base_0, -- 524
		__name = "Godcast", -- 524
		__parent = _parent_0 -- 524
	}, { -- 524
		__index = function(cls, name) -- 524
			local val = rawget(_base_0, name) -- 524
			if val == nil then -- 524
				local parent = rawget(cls, "__parent") -- 524
				if parent then -- 524
					return parent[name] -- 524
				end -- 524
			else -- 524
				return val -- 524
			end -- 524
		end, -- 524
		__call = function(cls, ...) -- 524
			local _self_0 = setmetatable({ }, _base_0) -- 524
			cls.__init(_self_0, ...) -- 524
			return _self_0 -- 524
		end -- 524
	}) -- 524
	_base_0.__class = _class_0 -- 524
	if _parent_0.__inherited then -- 524
		_parent_0.__inherited(_parent_0, _class_0) -- 524
	end -- 524
	Godcast = _class_0 -- 524
end -- 541
if CLIENT then -- 543
	Xombocast.OnReceive = function(self, data) -- 544
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[XOMBOKOM] <wiggle>" .. tostring(data.text) -- 544
	end -- 544
	Godcast.OnReceive = function(self, data) -- 545
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[ORACLEKOM] <wiggle>" .. tostring(data.text) -- 545
	end -- 545
	Meistercast.OnReceive = function(self, data) -- 546
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[MEISTERKOM] <wiggle>" .. tostring(data.text) -- 546
	end -- 546
end -- 543
if SERVER then -- 547
	Xombocast.Parse = function(self, ply, lang, cmd, text) -- 548
		text = self:Process(ply, text) -- 549
		ply:EmitSound("XOMBOKOM") -- 550
		return { -- 551
			text = text -- 551
		} -- 551
	end -- 548
	Meistercast.Parse = function(self, ply, lang, cmd, text) -- 553
		text = self:Process(ply, text) -- 554
		ply:EmitSound("kidneydagger/vote.ogg") -- 555
		return { -- 556
			text = text -- 556
		} -- 556
	end -- 553
	Godcast.Parse = function(self, ply, lang, cmd, text) -- 558
		text = self:Process(ply, text) -- 559
		ply:EmitSound("DEUS") -- 560
		ply:AddDespair(5) -- 561
		net.Start("evilrp_frighten") -- 562
		net.Send(ply) -- 563
		ply:Notify("<c=200,0,0> " .. tostring(text) .. ".") -- 564
		return { -- 565
			text = text -- 565
		} -- 565
	end -- 558
end -- 547
local OOC -- 568
do -- 568
	local _class_0 -- 568
	local _parent_0 = CHAT_CMD -- 568
	local _base_0 = { -- 568
		name = "OOC", -- 570
		desc = "Global out-of-character chat.", -- 571
		typing = "Typing...", -- 573
		commands = { -- 573
			"ooc" -- 573
		}, -- 574
		aliases = { -- 574
			"//" -- 574
		}, -- 576
		tabs = TAB_OOC, -- 577
		log_category = "ooc", -- 579
		color = Color(200, 0, 0), -- 581
		font = "Spleen_Chat_Small" -- 568
	} -- 568
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 581
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 568
			_base_0[_key_0] = _val_0 -- 568
		end -- 568
	end -- 581
	if _base_0.__index == nil then -- 568
		_base_0.__index = _base_0 -- 568
	end -- 581
	setmetatable(_base_0, _parent_0.__base) -- 568
	_class_0 = setmetatable({ -- 568
		__init = function(self, ...) -- 568
			return _class_0.__parent.__init(self, ...) -- 568
		end, -- 568
		__base = _base_0, -- 568
		__name = "OOC", -- 568
		__parent = _parent_0 -- 568
	}, { -- 568
		__index = function(cls, name) -- 568
			local val = rawget(_base_0, name) -- 568
			if val == nil then -- 568
				local parent = rawget(cls, "__parent") -- 568
				if parent then -- 568
					return parent[name] -- 568
				end -- 568
			else -- 568
				return val -- 568
			end -- 568
		end, -- 568
		__call = function(cls, ...) -- 568
			local _self_0 = setmetatable({ }, _base_0) -- 568
			cls.__init(_self_0, ...) -- 568
			return _self_0 -- 568
		end -- 568
	}) -- 568
	_base_0.__class = _class_0 -- 568
	if _parent_0.__inherited then -- 568
		_parent_0.__inherited(_parent_0, _class_0) -- 568
	end -- 568
	OOC = _class_0 -- 568
end -- 581
if CLIENT then -- 583
	OOC.OnReceive = function(self, data) -- 584
		local prefix -- 585
		if data.rainbow_name then -- 586
			prefix = "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[OOC]</c> <rgb=1,13,30>" .. tostring(data.name) .. "</rgb>" -- 587
		else -- 589
			prefix = "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[OOC]</c> <c=" .. tostring(data.color) .. ">" .. tostring(data.name) .. "</c>" -- 589
		end -- 586
		return tostring(prefix) .. ": " .. tostring(data.text) -- 590
	end -- 584
end -- 583
if SERVER then -- 591
	OOC.Parse = function(self, ply, lang, cmd, text) -- 594
		local sid = ply:SteamID() -- 595
		local r = util.SharedRandom(sid, 0, 255, 1) -- 596
		local g = util.SharedRandom(sid, 0, 255, 2) -- 597
		local b = util.SharedRandom(sid, 0, 255, 3) -- 598
		local color = Color(r, g, b) -- 599
		local rainbow_name = ply:HasDonation("rainbow") and (ply:GetInfoNum("lfr_rainbow_username", 1) == 1) -- 600
		return { -- 601
			name = ply:SteamName(), -- 601
			color = color, -- 601
			text = text, -- 601
			rainbow_name = rainbow_name -- 601
		} -- 601
	end -- 594
end -- 591
local LOOC -- 604
do -- 604
	local _class_0 -- 604
	local _parent_0 = CHAT_CMD -- 604
	local _base_0 = { -- 604
		name = "Local OOC", -- 606
		desc = "Local out-of-character chat.", -- 607
		typing = "Typing...", -- 609
		commands = { -- 609
			"looc" -- 609
		}, -- 610
		aliases = { -- 610
			"[[", -- 610
			".//" -- 610
		}, -- 612
		range = 400, -- 614
		tabs = TABS_LOOC, -- 615
		log_category = "ooc", -- 617
		color = Color(138, 185, 209), -- 619
		font = "Spleen_Chat_Small" -- 604
	} -- 604
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 619
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 604
			_base_0[_key_0] = _val_0 -- 604
		end -- 604
	end -- 619
	if _base_0.__index == nil then -- 604
		_base_0.__index = _base_0 -- 604
	end -- 619
	setmetatable(_base_0, _parent_0.__base) -- 604
	_class_0 = setmetatable({ -- 604
		__init = function(self, ...) -- 604
			return _class_0.__parent.__init(self, ...) -- 604
		end, -- 604
		__base = _base_0, -- 604
		__name = "LOOC", -- 604
		__parent = _parent_0 -- 604
	}, { -- 604
		__index = function(cls, name) -- 604
			local val = rawget(_base_0, name) -- 604
			if val == nil then -- 604
				local parent = rawget(cls, "__parent") -- 604
				if parent then -- 604
					return parent[name] -- 604
				end -- 604
			else -- 604
				return val -- 604
			end -- 604
		end, -- 604
		__call = function(cls, ...) -- 604
			local _self_0 = setmetatable({ }, _base_0) -- 604
			cls.__init(_self_0, ...) -- 604
			return _self_0 -- 604
		end -- 604
	}) -- 604
	_base_0.__class = _class_0 -- 604
	if _parent_0.__inherited then -- 604
		_parent_0.__inherited(_parent_0, _class_0) -- 604
	end -- 604
	LOOC = _class_0 -- 604
end -- 619
if CLIENT then -- 621
	LOOC.OnReceive = function(self, data) -- 622
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[OOC-LOCAL]</c> <c=" .. tostring(data.color) .. ">" .. tostring(data.name) .. "</c>: " .. tostring(data.text) -- 622
	end -- 622
end -- 621
if SERVER then -- 623
	LOOC.Parse = function(self, ply, lang, cmd, text) -- 624
		return { -- 624
			name = ply:Name(), -- 624
			color = team.GetColor(ply:Team()), -- 624
			text = text -- 624
		} -- 624
	end -- 624
end -- 623
local Admin -- 627
do -- 627
	local _class_0 -- 627
	local _parent_0 = CHAT_CMD -- 627
	local _base_0 = { -- 627
		name = "Admin", -- 629
		desc = "Local out-of-character chat.", -- 630
		typing = "Typing...", -- 632
		commands = { -- 632
			"a", -- 632
			"admin", -- 632
			"//" -- 632
		}, -- 633
		aliases = { -- 633
			"@" -- 633
		}, -- 635
		range = 400, -- 637
		tabs = TAB_SOTLA, -- 638
		log_category = "ooc", -- 640
		color = Color(210, 0, 0), -- 642
		font = "Spleen_Chat_Small" -- 627
	} -- 627
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 642
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 627
			_base_0[_key_0] = _val_0 -- 627
		end -- 627
	end -- 642
	if _base_0.__index == nil then -- 627
		_base_0.__index = _base_0 -- 627
	end -- 642
	setmetatable(_base_0, _parent_0.__base) -- 627
	_class_0 = setmetatable({ -- 627
		__init = function(self, ...) -- 627
			return _class_0.__parent.__init(self, ...) -- 627
		end, -- 627
		__base = _base_0, -- 627
		__name = "Admin", -- 627
		__parent = _parent_0 -- 627
	}, { -- 627
		__index = function(cls, name) -- 627
			local val = rawget(_base_0, name) -- 627
			if val == nil then -- 627
				local parent = rawget(cls, "__parent") -- 627
				if parent then -- 627
					return parent[name] -- 627
				end -- 627
			else -- 627
				return val -- 627
			end -- 627
		end, -- 627
		__call = function(cls, ...) -- 627
			local _self_0 = setmetatable({ }, _base_0) -- 627
			cls.__init(_self_0, ...) -- 627
			return _self_0 -- 627
		end -- 627
	}) -- 627
	_base_0.__class = _class_0 -- 627
	if _parent_0.__inherited then -- 627
		_parent_0.__inherited(_parent_0, _class_0) -- 627
	end -- 627
	Admin = _class_0 -- 627
end -- 642
if CLIENT then -- 644
	Admin.OnReceive = function(self, data) -- 645
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[ADMIN]</c> <c=" .. tostring(data.color) .. ">" .. tostring(data.name) .. "</c>: " .. tostring(data.text) -- 645
	end -- 645
end -- 644
if SERVER then -- 646
	Admin.Parse = function(self, ply, lang, cmd, text) -- 647
		local valid = { -- 648
			ply -- 648
		} -- 648
		for _, target in pairs(player.GetAll()) do -- 649
			local _continue_0 = false -- 650
			repeat -- 650
				if not target:IsAdmin() then -- 650
					_continue_0 = true -- 650
					break -- 650
				end -- 650
				valid[#valid + 1] = target -- 651
				_continue_0 = true -- 650
			until true -- 651
			if not _continue_0 then -- 651
				break -- 651
			end -- 651
		end -- 651
		return Chat.Send(self.name, { -- 653
			name = ply:Name(), -- 653
			color = Color(210, 0, 0), -- 654
			text = text -- 655
		}, valid) -- 656
	end -- 647
end -- 646
