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
		name = "SMALL", -- 274
		color = Color(200, 200, 200), -- 275
		font = "Spleen_Label_Small", -- 276
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
		name = "NOTICE", -- 280
		color = Color(229, 201, 98), -- 281
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
		name = "XOMBOKOM", -- 286
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
		name = "RADIO", -- 292
		color = Color(230, 10, 10), -- 293
		font = "Spleen_Chat", -- 294
		OnReceive = function(self, data) -- 294
			return string.format("<font=%s><c=%s>%s", self.font, self.color, data.text) -- 294
		end -- 290
	} -- 290
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 294
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 290
			_base_0[_key_0] = _val_0 -- 290
		end -- 290
	end -- 294
	if _base_0.__index == nil then -- 290
		_base_0.__index = _base_0 -- 290
	end -- 294
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
end -- 294
do -- 296
	local _class_0 -- 296
	local _parent_0 = CHAT_CMD -- 296
	local _base_0 = { -- 296
		name = "ERROR", -- 298
		color = Color(200, 0, 0), -- 299
		color_console = Color(255, 90, 90), -- 300
		font = "Spleen_Chat", -- 301
		OnReceive = function(self, data) -- 301
			return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">ERROR: " .. tostring(data.text), "<c=" .. tostring(self.color_console) .. ">ERROR: " .. tostring(data.text) -- 301
		end -- 296
	} -- 296
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 301
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 296
			_base_0[_key_0] = _val_0 -- 296
		end -- 296
	end -- 301
	if _base_0.__index == nil then -- 296
		_base_0.__index = _base_0 -- 296
	end -- 301
	setmetatable(_base_0, _parent_0.__base) -- 296
	_class_0 = setmetatable({ -- 296
		__init = function(self, ...) -- 296
			return _class_0.__parent.__init(self, ...) -- 296
		end, -- 296
		__base = _base_0, -- 296
		__parent = _parent_0 -- 296
	}, { -- 296
		__index = function(cls, name) -- 296
			local val = rawget(_base_0, name) -- 296
			if val == nil then -- 296
				local parent = rawget(cls, "__parent") -- 296
				if parent then -- 296
					return parent[name] -- 296
				end -- 296
			else -- 296
				return val -- 296
			end -- 296
		end, -- 296
		__call = function(cls, ...) -- 296
			local _self_0 = setmetatable({ }, _base_0) -- 296
			cls.__init(_self_0, ...) -- 296
			return _self_0 -- 296
		end -- 296
	}) -- 296
	_base_0.__class = _class_0 -- 296
	if _parent_0.__inherited then -- 296
		_parent_0.__inherited(_parent_0, _class_0) -- 296
	end -- 296
end -- 301
do -- 303
	local _class_0 -- 303
	local _parent_0 = CHAT_CMD -- 303
	local _base_0 = { -- 303
		tabs = TAB_IC, -- 305
		log_category = "ic", -- 307
		Handle = function(self, ply, lang, cmd, text) -- 307
			if not ply:Alive() then -- 308
				ply:SendChat("ERROR", "You're DEAD.") -- 309
				return -- 310
			end -- 308
			return _class_0.__parent.__base.Handle(self, ply, lang, cmd, text) -- 311
		end -- 303
	} -- 303
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 311
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 303
			_base_0[_key_0] = _val_0 -- 303
		end -- 303
	end -- 311
	if _base_0.__index == nil then -- 303
		_base_0.__index = _base_0 -- 303
	end -- 311
	setmetatable(_base_0, _parent_0.__base) -- 303
	_class_0 = setmetatable({ -- 303
		__init = function(self, ...) -- 303
			return _class_0.__parent.__init(self, ...) -- 303
		end, -- 303
		__base = _base_0, -- 303
		__name = "CHAT_CMD_IC", -- 303
		__parent = _parent_0 -- 303
	}, { -- 303
		__index = function(cls, name) -- 303
			local val = rawget(_base_0, name) -- 303
			if val == nil then -- 303
				local parent = rawget(cls, "__parent") -- 303
				if parent then -- 303
					return parent[name] -- 303
				end -- 303
			else -- 303
				return val -- 303
			end -- 303
		end, -- 303
		__call = function(cls, ...) -- 303
			local _self_0 = setmetatable({ }, _base_0) -- 303
			cls.__init(_self_0, ...) -- 303
			return _self_0 -- 303
		end -- 303
	}) -- 303
	_base_0.__class = _class_0 -- 303
	if _parent_0.__inherited then -- 303
		_parent_0.__inherited(_parent_0, _class_0) -- 303
	end -- 303
	CHAT_CMD_IC = _class_0 -- 303
end -- 311
local Action -- 313
do -- 313
	local _class_0 -- 313
	local _parent_0 = CHAT_CMD_IC -- 313
	local _base_0 = { -- 313
		name = "Action", -- 315
		desc = "Do something.", -- 316
		typing = "Performing...", -- 318
		commands = { -- 318
			"me", -- 318
			"em" -- 318
		}, -- 319
		aliases = { -- 319
			":", -- 319
			"*" -- 319
		}, -- 321
		range = 400, -- 322
		range_muffled = 0, -- 324
		font = "Spleen_Chat" -- 313
	} -- 313
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 324
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 313
			_base_0[_key_0] = _val_0 -- 313
		end -- 313
	end -- 324
	if _base_0.__index == nil then -- 313
		_base_0.__index = _base_0 -- 313
	end -- 324
	setmetatable(_base_0, _parent_0.__base) -- 313
	_class_0 = setmetatable({ -- 313
		__init = function(self, ...) -- 313
			return _class_0.__parent.__init(self, ...) -- 313
		end, -- 313
		__base = _base_0, -- 313
		__name = "Action", -- 313
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
	Action = _class_0 -- 313
end -- 324
if CLIENT then -- 326
	Action.OnReceive = function(self, data) -- 327
		local text = data.text -- 328
		if not string.match(text, "^[,.']") then -- 329
			text = " " .. tostring(text) -- 329
		end -- 329
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(data.color) .. ">** " .. tostring(data.name) .. tostring(text) -- 330
	end -- 327
end -- 326
if SERVER then -- 332
	Action.Parse = function(self, ply, lang, cmd, text) -- 333
		return { -- 334
			name = ply:Name(), -- 334
			color = ply:getJobTable().color, -- 334
			text = text -- 334
		} -- 334
	end -- 333
end -- 332
local Say -- 336
do -- 336
	local _class_0 -- 336
	local _parent_0 = CHAT_CMD_IC -- 336
	local _base_0 = { -- 336
		name = "Say", -- 338
		desc = "Speak out to those around you.", -- 339
		typing = "Lying...", -- 340
		tense = "said", -- 342
		commands = { -- 342
			"say" -- 342
		}, -- 344
		use_language = true, -- 345
		hearable = true, -- 347
		range = 400, -- 348
		range_muffled = 150, -- 350
		font = "Spleen_Chat", -- 352
		color = Color(91, 166, 221), -- 353
		color_lang = Color(255, 167, 73), -- 355
		Process = function(self, ply, text) -- 355
			return Chat.Autopretty(ply, text) -- 355
		end -- 336
	} -- 336
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 355
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 336
			_base_0[_key_0] = _val_0 -- 336
		end -- 336
	end -- 355
	if _base_0.__index == nil then -- 336
		_base_0.__index = _base_0 -- 336
	end -- 355
	setmetatable(_base_0, _parent_0.__base) -- 336
	_class_0 = setmetatable({ -- 336
		__init = function(self, ...) -- 336
			return _class_0.__parent.__init(self, ...) -- 336
		end, -- 336
		__base = _base_0, -- 336
		__name = "Say", -- 336
		__parent = _parent_0 -- 336
	}, { -- 336
		__index = function(cls, name) -- 336
			local val = rawget(_base_0, name) -- 336
			if val == nil then -- 336
				local parent = rawget(cls, "__parent") -- 336
				if parent then -- 336
					return parent[name] -- 336
				end -- 336
			else -- 336
				return val -- 336
			end -- 336
		end, -- 336
		__call = function(cls, ...) -- 336
			local _self_0 = setmetatable({ }, _base_0) -- 336
			cls.__init(_self_0, ...) -- 336
			return _self_0 -- 336
		end -- 336
	}) -- 336
	_base_0.__class = _class_0 -- 336
	if _parent_0.__inherited then -- 336
		_parent_0.__inherited(_parent_0, _class_0) -- 336
	end -- 336
	Say = _class_0 -- 336
end -- 355
if CLIENT then -- 357
	Say.OnReceive = function(self, data) -- 358
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(data.name_color) .. ">" .. tostring(data.name) .. " <c=" .. tostring(Color(255, 255, 255)) .. ">" .. tostring(self.tense) .. ", <c=" .. tostring(self.color) .. ">\"" .. tostring(data.text) .. "\"" -- 358
	end -- 358
end -- 357
if SERVER then -- 369
	Say.Parse = function(self, ply, lang, cmd, text) -- 370
		local targets = self:GetTargets(ply) -- 371
		local valid = { } -- 372
		local invalid = { } -- 373
		for _index_0 = 1, #targets do -- 374
			local target = targets[_index_0] -- 374
			if target == ply or true then -- 376
				valid[#valid + 1] = target -- 377
			else -- 379
				invalid[#invalid + 1] = target -- 379
			end -- 376
		end -- 379
		local name_color = ply:getJobTable().color -- 382
		text = self:Process(ply, text) -- 383
		if not self.silent then -- 384
			ply:PlaySpeechSound(text, SNDLVL_65DB) -- 384
		end -- 384
		return Chat.Send(self.name, { -- 386
			name = ply:Name(), -- 386
			name_color = name_color, -- 387
			lang = lang, -- 388
			text = text -- 389
		}, valid) -- 390
	end -- 370
end -- 369
local Yell -- 393
do -- 393
	local _class_0 -- 393
	local _parent_0 = Say -- 393
	local _base_0 = { -- 393
		name = "Yell", -- 395
		desc = "Yell something at the top of your lungs.", -- 396
		typing = "Yelling...", -- 397
		tense = "shouted", -- 399
		commands = { -- 399
			"yell", -- 399
			"y" -- 399
		}, -- 401
		range = 800, -- 402
		range_muffled = 400, -- 404
		color = Color(255, 50, 50), -- 405
		color_lang = Color(255, 167, 73), -- 407
		Process = function(self, ply, text) -- 407
			text = _class_0.__parent.__base.Process(self, ply, text) -- 408
			text = string.upper(text) -- 409
			local punc = string.sub(text, string.len(text)) -- 410
			if "." == punc then -- 412
				text = tostring(string.sub(text, 1, -2)) .. "!" -- 413
			elseif "?" == punc then -- 414
				text = text .. "!" -- 415
			else -- 417
				text = text .. "!" -- 417
			end -- 417
			return "<wiggle=2>" .. tostring(text) .. "</wiggle>" -- 418
		end -- 393
	} -- 393
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 418
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 393
			_base_0[_key_0] = _val_0 -- 393
		end -- 393
	end -- 418
	if _base_0.__index == nil then -- 393
		_base_0.__index = _base_0 -- 393
	end -- 418
	setmetatable(_base_0, _parent_0.__base) -- 393
	_class_0 = setmetatable({ -- 393
		__init = function(self, ...) -- 393
			return _class_0.__parent.__init(self, ...) -- 393
		end, -- 393
		__base = _base_0, -- 393
		__name = "Yell", -- 393
		__parent = _parent_0 -- 393
	}, { -- 393
		__index = function(cls, name) -- 393
			local val = rawget(_base_0, name) -- 393
			if val == nil then -- 393
				local parent = rawget(cls, "__parent") -- 393
				if parent then -- 393
					return parent[name] -- 393
				end -- 393
			else -- 393
				return val -- 393
			end -- 393
		end, -- 393
		__call = function(cls, ...) -- 393
			local _self_0 = setmetatable({ }, _base_0) -- 393
			cls.__init(_self_0, ...) -- 393
			return _self_0 -- 393
		end -- 393
	}) -- 393
	_base_0.__class = _class_0 -- 393
	if _parent_0.__inherited then -- 393
		_parent_0.__inherited(_parent_0, _class_0) -- 393
	end -- 393
	Yell = _class_0 -- 393
end -- 418
local Whisper -- 420
do -- 420
	local _class_0 -- 420
	local _parent_0 = Say -- 420
	local _base_0 = { -- 420
		name = "Whisper", -- 422
		desc = "Quietly transmit your secrets to your close ones.", -- 423
		typing = "Whispering...", -- 424
		tense = "whispered", -- 426
		silent = true, -- 428
		font = "Spleen_Chat_Small", -- 430
		commands = { -- 430
			"whisper", -- 430
			"w" -- 430
		}, -- 432
		range = 150, -- 433
		range_muffled = 0, -- 435
		color = Color(151, 151, 151), -- 436
		color_lang = Color(255, 167, 73) -- 420
	} -- 420
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 436
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 420
			_base_0[_key_0] = _val_0 -- 420
		end -- 420
	end -- 436
	if _base_0.__index == nil then -- 420
		_base_0.__index = _base_0 -- 420
	end -- 436
	setmetatable(_base_0, _parent_0.__base) -- 420
	_class_0 = setmetatable({ -- 420
		__init = function(self, ...) -- 420
			return _class_0.__parent.__init(self, ...) -- 420
		end, -- 420
		__base = _base_0, -- 420
		__name = "Whisper", -- 420
		__parent = _parent_0 -- 420
	}, { -- 420
		__index = function(cls, name) -- 420
			local val = rawget(_base_0, name) -- 420
			if val == nil then -- 420
				local parent = rawget(cls, "__parent") -- 420
				if parent then -- 420
					return parent[name] -- 420
				end -- 420
			else -- 420
				return val -- 420
			end -- 420
		end, -- 420
		__call = function(cls, ...) -- 420
			local _self_0 = setmetatable({ }, _base_0) -- 420
			cls.__init(_self_0, ...) -- 420
			return _self_0 -- 420
		end -- 420
	}) -- 420
	_base_0.__class = _class_0 -- 420
	if _parent_0.__inherited then -- 420
		_parent_0.__inherited(_parent_0, _class_0) -- 420
	end -- 420
	Whisper = _class_0 -- 420
end -- 436
local Radio -- 438
do -- 438
	local _class_0 -- 438
	local _parent_0 = Say -- 438
	local _base_0 = { -- 438
		name = "Radio", -- 440
		desc = "Call your squad.", -- 441
		typing = "Chattering...", -- 442
		tense = "called", -- 444
		silent = true, -- 446
		font = "Spleen_Chat_Small", -- 448
		commands = { -- 448
			"radio", -- 448
			"r" -- 448
		}, -- 450
		tabs = TAB_RADIO, -- 451
		log_category = "radio", -- 453
		range = 1500, -- 454
		range_muffled = 0, -- 456
		color = Color(151, 151, 151), -- 457
		color_lang = Color(255, 167, 73) -- 438
	} -- 438
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 457
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 438
			_base_0[_key_0] = _val_0 -- 438
		end -- 438
	end -- 457
	if _base_0.__index == nil then -- 438
		_base_0.__index = _base_0 -- 438
	end -- 457
	setmetatable(_base_0, _parent_0.__base) -- 438
	_class_0 = setmetatable({ -- 438
		__init = function(self, ...) -- 438
			return _class_0.__parent.__init(self, ...) -- 438
		end, -- 438
		__base = _base_0, -- 438
		__name = "Radio", -- 438
		__parent = _parent_0 -- 438
	}, { -- 438
		__index = function(cls, name) -- 438
			local val = rawget(_base_0, name) -- 438
			if val == nil then -- 438
				local parent = rawget(cls, "__parent") -- 438
				if parent then -- 438
					return parent[name] -- 438
				end -- 438
			else -- 438
				return val -- 438
			end -- 438
		end, -- 438
		__call = function(cls, ...) -- 438
			local _self_0 = setmetatable({ }, _base_0) -- 438
			cls.__init(_self_0, ...) -- 438
			return _self_0 -- 438
		end -- 438
	}) -- 438
	_base_0.__class = _class_0 -- 438
	if _parent_0.__inherited then -- 438
		_parent_0.__inherited(_parent_0, _class_0) -- 438
	end -- 438
	Radio = _class_0 -- 438
end -- 457
if SERVER then -- 459
	Radio.Parse = function(self, ply, lang, cmd, text) -- 460
		local my_category = ply:getJobTable().category -- 461
		local valid = { } -- 462
		for _, target in pairs(player.GetAll()) do -- 463
			local _continue_0 = false -- 464
			repeat -- 464
				if not (target:getJobTable().category == my_category) then -- 464
					_continue_0 = true -- 464
					break -- 464
				end -- 464
				valid[#valid + 1] = target -- 465
				_continue_0 = true -- 464
			until true -- 465
			if not _continue_0 then -- 465
				break -- 465
			end -- 465
		end -- 465
		local name_color = ply:getJobTable().color -- 467
		text = self:Process(ply, text) -- 468
		return Chat.Send(self.name, { -- 470
			name = ply:Name(), -- 470
			name_color = name_color, -- 471
			lang = lang, -- 472
			text = text -- 473
		}, valid) -- 474
	end -- 460
end -- 459
local XOMBOKOM -- 476
do -- 476
	local _class_0 -- 476
	local _parent_0 = SOUND -- 476
	local _base_0 = { -- 476
		level = SNDLVL_NONE, -- 478
		sound = (function() -- 478
			local _accum_0 = { } -- 478
			local _len_0 = 1 -- 478
			for i = 1, 7 do -- 478
				_accum_0[_len_0] = "kidneydagger/broadcast" .. tostring(i) .. ".wav" -- 478
				_len_0 = _len_0 + 1 -- 478
			end -- 478
			return _accum_0 -- 478
		end)() -- 476
	} -- 476
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 478
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 476
			_base_0[_key_0] = _val_0 -- 476
		end -- 476
	end -- 478
	if _base_0.__index == nil then -- 476
		_base_0.__index = _base_0 -- 476
	end -- 478
	setmetatable(_base_0, _parent_0.__base) -- 476
	_class_0 = setmetatable({ -- 476
		__init = function(self, ...) -- 476
			return _class_0.__parent.__init(self, ...) -- 476
		end, -- 476
		__base = _base_0, -- 476
		__name = "XOMBOKOM", -- 476
		__parent = _parent_0 -- 476
	}, { -- 476
		__index = function(cls, name) -- 476
			local val = rawget(_base_0, name) -- 476
			if val == nil then -- 476
				local parent = rawget(cls, "__parent") -- 476
				if parent then -- 476
					return parent[name] -- 476
				end -- 476
			else -- 476
				return val -- 476
			end -- 476
		end, -- 476
		__call = function(cls, ...) -- 476
			local _self_0 = setmetatable({ }, _base_0) -- 476
			cls.__init(_self_0, ...) -- 476
			return _self_0 -- 476
		end -- 476
	}) -- 476
	_base_0.__class = _class_0 -- 476
	if _parent_0.__inherited then -- 476
		_parent_0.__inherited(_parent_0, _class_0) -- 476
	end -- 476
	XOMBOKOM = _class_0 -- 476
end -- 478
local DEUS -- 480
do -- 480
	local _class_0 -- 480
	local _parent_0 = SOUND -- 480
	local _base_0 = { -- 480
		level = SNDLVL_NONE, -- 482
		sound = (function() -- 482
			local _accum_0 = { } -- 482
			local _len_0 = 1 -- 482
			for i = 1, 2 do -- 482
				_accum_0[_len_0] = "changes" .. tostring(i) .. ".ogg" -- 482
				_len_0 = _len_0 + 1 -- 482
			end -- 482
			return _accum_0 -- 482
		end)() -- 480
	} -- 480
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 482
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 480
			_base_0[_key_0] = _val_0 -- 480
		end -- 480
	end -- 482
	if _base_0.__index == nil then -- 480
		_base_0.__index = _base_0 -- 480
	end -- 482
	setmetatable(_base_0, _parent_0.__base) -- 480
	_class_0 = setmetatable({ -- 480
		__init = function(self, ...) -- 480
			return _class_0.__parent.__init(self, ...) -- 480
		end, -- 480
		__base = _base_0, -- 480
		__name = "DEUS", -- 480
		__parent = _parent_0 -- 480
	}, { -- 480
		__index = function(cls, name) -- 480
			local val = rawget(_base_0, name) -- 480
			if val == nil then -- 480
				local parent = rawget(cls, "__parent") -- 480
				if parent then -- 480
					return parent[name] -- 480
				end -- 480
			else -- 480
				return val -- 480
			end -- 480
		end, -- 480
		__call = function(cls, ...) -- 480
			local _self_0 = setmetatable({ }, _base_0) -- 480
			cls.__init(_self_0, ...) -- 480
			return _self_0 -- 480
		end -- 480
	}) -- 480
	_base_0.__class = _class_0 -- 480
	if _parent_0.__inherited then -- 480
		_parent_0.__inherited(_parent_0, _class_0) -- 480
	end -- 480
	DEUS = _class_0 -- 480
end -- 482
local Meistercast -- 484
do -- 484
	local _class_0 -- 484
	local _parent_0 = CHAT_CMD_IC -- 484
	local _base_0 = { -- 484
		name = "MEISTERKOM", -- 486
		color = Color(210, 100, 0), -- 487
		font = "Spleen_Chat", -- 489
		Handle = function(self, ply, lang, cmd, text) -- 489
			if not (ply:Team() == TEAM_DEALER) then -- 490
				ply:Notify("<c=200,0,0>This power is NOT FOR YOU.") -- 491
				return -- 492
			end -- 490
			return _class_0.__parent.__base.Handle(self, ply, lang, cmd, text) -- 493
		end, -- 495
		Process = function(self, ply, text) -- 495
			return Chat.Autopretty(ply, text:upper()) -- 495
		end -- 484
	} -- 484
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 495
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 484
			_base_0[_key_0] = _val_0 -- 484
		end -- 484
	end -- 495
	if _base_0.__index == nil then -- 484
		_base_0.__index = _base_0 -- 484
	end -- 495
	setmetatable(_base_0, _parent_0.__base) -- 484
	_class_0 = setmetatable({ -- 484
		__init = function(self, ...) -- 484
			return _class_0.__parent.__init(self, ...) -- 484
		end, -- 484
		__base = _base_0, -- 484
		__name = "Meistercast", -- 484
		__parent = _parent_0 -- 484
	}, { -- 484
		__index = function(cls, name) -- 484
			local val = rawget(_base_0, name) -- 484
			if val == nil then -- 484
				local parent = rawget(cls, "__parent") -- 484
				if parent then -- 484
					return parent[name] -- 484
				end -- 484
			else -- 484
				return val -- 484
			end -- 484
		end, -- 484
		__call = function(cls, ...) -- 484
			local _self_0 = setmetatable({ }, _base_0) -- 484
			cls.__init(_self_0, ...) -- 484
			return _self_0 -- 484
		end -- 484
	}) -- 484
	_base_0.__class = _class_0 -- 484
	if _parent_0.__inherited then -- 484
		_parent_0.__inherited(_parent_0, _class_0) -- 484
	end -- 484
	Meistercast = _class_0 -- 484
end -- 495
local Xombocast -- 498
do -- 498
	local _class_0 -- 498
	local _parent_0 = CHAT_CMD_IC -- 498
	local _base_0 = { -- 498
		name = "XOMBOKOM", -- 500
		color = Color(210, 0, 0), -- 501
		font = "Spleen_Chat", -- 503
		Handle = function(self, ply, lang, cmd, text) -- 503
			if not (ply:Team() == TEAM_EMPEROR) then -- 504
				ply:Notify("<c=200,0,0>This power is NOT FOR YOU.") -- 505
				return -- 506
			end -- 504
			return _class_0.__parent.__base.Handle(self, ply, lang, cmd, text) -- 507
		end, -- 509
		Process = function(self, ply, text) -- 509
			return Chat.Autopretty(ply, text:upper()) -- 509
		end -- 498
	} -- 498
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 509
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 498
			_base_0[_key_0] = _val_0 -- 498
		end -- 498
	end -- 509
	if _base_0.__index == nil then -- 498
		_base_0.__index = _base_0 -- 498
	end -- 509
	setmetatable(_base_0, _parent_0.__base) -- 498
	_class_0 = setmetatable({ -- 498
		__init = function(self, ...) -- 498
			return _class_0.__parent.__init(self, ...) -- 498
		end, -- 498
		__base = _base_0, -- 498
		__name = "Xombocast", -- 498
		__parent = _parent_0 -- 498
	}, { -- 498
		__index = function(cls, name) -- 498
			local val = rawget(_base_0, name) -- 498
			if val == nil then -- 498
				local parent = rawget(cls, "__parent") -- 498
				if parent then -- 498
					return parent[name] -- 498
				end -- 498
			else -- 498
				return val -- 498
			end -- 498
		end, -- 498
		__call = function(cls, ...) -- 498
			local _self_0 = setmetatable({ }, _base_0) -- 498
			cls.__init(_self_0, ...) -- 498
			return _self_0 -- 498
		end -- 498
	}) -- 498
	_base_0.__class = _class_0 -- 498
	if _parent_0.__inherited then -- 498
		_parent_0.__inherited(_parent_0, _class_0) -- 498
	end -- 498
	Xombocast = _class_0 -- 498
end -- 509
local Broadcast -- 511
do -- 511
	local _class_0 -- 511
	local _parent_0 = CHAT_CMD_IC -- 511
	local _base_0 = { -- 511
		name = "Broadcast", -- 513
		desc = "Make them all listen.", -- 514
		typing = "Decreeing...", -- 516
		commands = { -- 516
			"broadcast", -- 516
			"ad" -- 516
		}, -- 518
		color = Color(200, 0, 0), -- 520
		font = "Spleen_Chat", -- 522
		Handle = function(self, ply, lang, cmd, text) -- 522
			local _exp_0 = ply:Team() -- 523
			if TEAM_DEALER == _exp_0 then -- 524
				return Meistercast:Handle(ply, lang, cmd, text) -- 525
			elseif TEAM_EMPEROR == _exp_0 then -- 526
				return Xombocast:Handle(ply, lang, cmd, text) -- 527
			end -- 527
		end -- 511
	} -- 511
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 527
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 511
			_base_0[_key_0] = _val_0 -- 511
		end -- 511
	end -- 527
	if _base_0.__index == nil then -- 511
		_base_0.__index = _base_0 -- 511
	end -- 527
	setmetatable(_base_0, _parent_0.__base) -- 511
	_class_0 = setmetatable({ -- 511
		__init = function(self, ...) -- 511
			return _class_0.__parent.__init(self, ...) -- 511
		end, -- 511
		__base = _base_0, -- 511
		__name = "Broadcast", -- 511
		__parent = _parent_0 -- 511
	}, { -- 511
		__index = function(cls, name) -- 511
			local val = rawget(_base_0, name) -- 511
			if val == nil then -- 511
				local parent = rawget(cls, "__parent") -- 511
				if parent then -- 511
					return parent[name] -- 511
				end -- 511
			else -- 511
				return val -- 511
			end -- 511
		end, -- 511
		__call = function(cls, ...) -- 511
			local _self_0 = setmetatable({ }, _base_0) -- 511
			cls.__init(_self_0, ...) -- 511
			return _self_0 -- 511
		end -- 511
	}) -- 511
	_base_0.__class = _class_0 -- 511
	if _parent_0.__inherited then -- 511
		_parent_0.__inherited(_parent_0, _class_0) -- 511
	end -- 511
	Broadcast = _class_0 -- 511
end -- 527
local Godcast -- 530
do -- 530
	local _class_0 -- 530
	local _parent_0 = CHAT_CMD_IC -- 530
	local _base_0 = { -- 530
		name = "Godcast", -- 532
		desc = "Make them all listen.", -- 533
		typing = "Decreeing...", -- 535
		commands = { -- 535
			"godcast", -- 535
			"god" -- 535
		}, -- 537
		color = Color(0, 0, 0), -- 539
		font = "Spleen_Chat", -- 541
		Process = function(self, ply, text) -- 541
			return Chat.Autopretty(ply, text:upper()) -- 541
		end, -- 543
		Handle = function(self, ply, lang, cmd, text) -- 543
			if not ply:IsSuperAdmin() then -- 544
				ply:Notify("<c=200,0,0>This power is NOT FOR YOU.") -- 545
				return -- 546
			end -- 544
			return _class_0.__parent.__base.Handle(self, ply, lang, cmd, text) -- 547
		end -- 530
	} -- 530
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 547
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 530
			_base_0[_key_0] = _val_0 -- 530
		end -- 530
	end -- 547
	if _base_0.__index == nil then -- 530
		_base_0.__index = _base_0 -- 530
	end -- 547
	setmetatable(_base_0, _parent_0.__base) -- 530
	_class_0 = setmetatable({ -- 530
		__init = function(self, ...) -- 530
			return _class_0.__parent.__init(self, ...) -- 530
		end, -- 530
		__base = _base_0, -- 530
		__name = "Godcast", -- 530
		__parent = _parent_0 -- 530
	}, { -- 530
		__index = function(cls, name) -- 530
			local val = rawget(_base_0, name) -- 530
			if val == nil then -- 530
				local parent = rawget(cls, "__parent") -- 530
				if parent then -- 530
					return parent[name] -- 530
				end -- 530
			else -- 530
				return val -- 530
			end -- 530
		end, -- 530
		__call = function(cls, ...) -- 530
			local _self_0 = setmetatable({ }, _base_0) -- 530
			cls.__init(_self_0, ...) -- 530
			return _self_0 -- 530
		end -- 530
	}) -- 530
	_base_0.__class = _class_0 -- 530
	if _parent_0.__inherited then -- 530
		_parent_0.__inherited(_parent_0, _class_0) -- 530
	end -- 530
	Godcast = _class_0 -- 530
end -- 547
if CLIENT then -- 549
	Xombocast.OnReceive = function(self, data) -- 550
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[XOMBOKOM] <wiggle>" .. tostring(data.text) -- 550
	end -- 550
	Godcast.OnReceive = function(self, data) -- 551
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[ORACLEKOM] <wiggle>" .. tostring(data.text) -- 551
	end -- 551
	Meistercast.OnReceive = function(self, data) -- 552
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[MEISTERKOM] <wiggle>" .. tostring(data.text) -- 552
	end -- 552
end -- 549
if SERVER then -- 553
	Xombocast.Parse = function(self, ply, lang, cmd, text) -- 554
		text = self:Process(ply, text) -- 555
		ply:EmitSound("XOMBOKOM") -- 556
		return { -- 557
			text = text -- 557
		} -- 557
	end -- 554
	Meistercast.Parse = function(self, ply, lang, cmd, text) -- 559
		text = self:Process(ply, text) -- 560
		ply:EmitSound("kidneydagger/vote.ogg") -- 561
		return { -- 562
			text = text -- 562
		} -- 562
	end -- 559
	Godcast.Parse = function(self, ply, lang, cmd, text) -- 564
		text = self:Process(ply, text) -- 565
		ply:EmitSound("DEUS") -- 566
		ply:AddDespair(5) -- 567
		net.Start("evilrp_frighten") -- 568
		net.Send(ply) -- 569
		ply:Notify("<c=200,0,0> " .. tostring(text) .. ".") -- 570
		return { -- 571
			text = text -- 571
		} -- 571
	end -- 564
end -- 553
local OOC -- 574
do -- 574
	local _class_0 -- 574
	local _parent_0 = CHAT_CMD -- 574
	local _base_0 = { -- 574
		name = "OOC", -- 576
		desc = "Global out-of-character chat.", -- 577
		typing = "Typing...", -- 579
		commands = { -- 579
			"ooc" -- 579
		}, -- 580
		aliases = { -- 580
			"//" -- 580
		}, -- 582
		tabs = TAB_OOC, -- 583
		log_category = "ooc", -- 585
		color = Color(200, 0, 0), -- 587
		font = "Spleen_Chat_Small" -- 574
	} -- 574
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 587
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 574
			_base_0[_key_0] = _val_0 -- 574
		end -- 574
	end -- 587
	if _base_0.__index == nil then -- 574
		_base_0.__index = _base_0 -- 574
	end -- 587
	setmetatable(_base_0, _parent_0.__base) -- 574
	_class_0 = setmetatable({ -- 574
		__init = function(self, ...) -- 574
			return _class_0.__parent.__init(self, ...) -- 574
		end, -- 574
		__base = _base_0, -- 574
		__name = "OOC", -- 574
		__parent = _parent_0 -- 574
	}, { -- 574
		__index = function(cls, name) -- 574
			local val = rawget(_base_0, name) -- 574
			if val == nil then -- 574
				local parent = rawget(cls, "__parent") -- 574
				if parent then -- 574
					return parent[name] -- 574
				end -- 574
			else -- 574
				return val -- 574
			end -- 574
		end, -- 574
		__call = function(cls, ...) -- 574
			local _self_0 = setmetatable({ }, _base_0) -- 574
			cls.__init(_self_0, ...) -- 574
			return _self_0 -- 574
		end -- 574
	}) -- 574
	_base_0.__class = _class_0 -- 574
	if _parent_0.__inherited then -- 574
		_parent_0.__inherited(_parent_0, _class_0) -- 574
	end -- 574
	OOC = _class_0 -- 574
end -- 587
if CLIENT then -- 589
	OOC.OnReceive = function(self, data) -- 590
		local prefix -- 591
		if data.rainbow_name then -- 592
			prefix = "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[OOC]</c> <rgb=1,13,30>" .. tostring(data.name) .. "</rgb>" -- 593
		else -- 595
			prefix = "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[OOC]</c> <c=" .. tostring(data.color) .. ">" .. tostring(data.name) .. "</c>" -- 595
		end -- 592
		return tostring(prefix) .. ": " .. tostring(data.text) -- 596
	end -- 590
end -- 589
if SERVER then -- 597
	OOC.Parse = function(self, ply, lang, cmd, text) -- 600
		local sid = ply:SteamID() -- 601
		local r = util.SharedRandom(sid, 0, 255, 1) -- 602
		local g = util.SharedRandom(sid, 0, 255, 2) -- 603
		local b = util.SharedRandom(sid, 0, 255, 3) -- 604
		local color = Color(r, g, b) -- 605
		local rainbow_name = ply:HasDonation("rainbow") and (ply:GetInfoNum("lfr_rainbow_username", 1) == 1) -- 606
		return { -- 607
			name = ply:SteamName(), -- 607
			color = color, -- 607
			text = text, -- 607
			rainbow_name = rainbow_name -- 607
		} -- 607
	end -- 600
end -- 597
local LOOC -- 610
do -- 610
	local _class_0 -- 610
	local _parent_0 = CHAT_CMD -- 610
	local _base_0 = { -- 610
		name = "Local OOC", -- 612
		desc = "Local out-of-character chat.", -- 613
		typing = "Typing...", -- 615
		commands = { -- 615
			"looc" -- 615
		}, -- 616
		aliases = { -- 616
			"[[", -- 616
			".//" -- 616
		}, -- 618
		range = 400, -- 620
		tabs = TABS_LOOC, -- 621
		log_category = "ooc", -- 623
		color = Color(138, 185, 209), -- 625
		font = "Spleen_Chat_Small" -- 610
	} -- 610
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 625
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 610
			_base_0[_key_0] = _val_0 -- 610
		end -- 610
	end -- 625
	if _base_0.__index == nil then -- 610
		_base_0.__index = _base_0 -- 610
	end -- 625
	setmetatable(_base_0, _parent_0.__base) -- 610
	_class_0 = setmetatable({ -- 610
		__init = function(self, ...) -- 610
			return _class_0.__parent.__init(self, ...) -- 610
		end, -- 610
		__base = _base_0, -- 610
		__name = "LOOC", -- 610
		__parent = _parent_0 -- 610
	}, { -- 610
		__index = function(cls, name) -- 610
			local val = rawget(_base_0, name) -- 610
			if val == nil then -- 610
				local parent = rawget(cls, "__parent") -- 610
				if parent then -- 610
					return parent[name] -- 610
				end -- 610
			else -- 610
				return val -- 610
			end -- 610
		end, -- 610
		__call = function(cls, ...) -- 610
			local _self_0 = setmetatable({ }, _base_0) -- 610
			cls.__init(_self_0, ...) -- 610
			return _self_0 -- 610
		end -- 610
	}) -- 610
	_base_0.__class = _class_0 -- 610
	if _parent_0.__inherited then -- 610
		_parent_0.__inherited(_parent_0, _class_0) -- 610
	end -- 610
	LOOC = _class_0 -- 610
end -- 625
if CLIENT then -- 627
	LOOC.OnReceive = function(self, data) -- 628
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[OOC-LOCAL]</c> <c=" .. tostring(data.color) .. ">" .. tostring(data.name) .. "</c>: " .. tostring(data.text) -- 628
	end -- 628
end -- 627
if SERVER then -- 629
	LOOC.Parse = function(self, ply, lang, cmd, text) -- 630
		return { -- 630
			name = ply:Name(), -- 630
			color = team.GetColor(ply:Team()), -- 630
			text = text -- 630
		} -- 630
	end -- 630
end -- 629
local Admin -- 633
do -- 633
	local _class_0 -- 633
	local _parent_0 = CHAT_CMD -- 633
	local _base_0 = { -- 633
		name = "Admin", -- 635
		desc = "Local out-of-character chat.", -- 636
		typing = "Typing...", -- 638
		commands = { -- 638
			"a", -- 638
			"admin", -- 638
			"//" -- 638
		}, -- 639
		aliases = { -- 639
			"@" -- 639
		}, -- 641
		range = 400, -- 643
		tabs = TAB_SOTLA, -- 644
		log_category = "ooc", -- 646
		color = Color(210, 0, 0), -- 648
		font = "Spleen_Chat_Small" -- 633
	} -- 633
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 648
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 633
			_base_0[_key_0] = _val_0 -- 633
		end -- 633
	end -- 648
	if _base_0.__index == nil then -- 633
		_base_0.__index = _base_0 -- 633
	end -- 648
	setmetatable(_base_0, _parent_0.__base) -- 633
	_class_0 = setmetatable({ -- 633
		__init = function(self, ...) -- 633
			return _class_0.__parent.__init(self, ...) -- 633
		end, -- 633
		__base = _base_0, -- 633
		__name = "Admin", -- 633
		__parent = _parent_0 -- 633
	}, { -- 633
		__index = function(cls, name) -- 633
			local val = rawget(_base_0, name) -- 633
			if val == nil then -- 633
				local parent = rawget(cls, "__parent") -- 633
				if parent then -- 633
					return parent[name] -- 633
				end -- 633
			else -- 633
				return val -- 633
			end -- 633
		end, -- 633
		__call = function(cls, ...) -- 633
			local _self_0 = setmetatable({ }, _base_0) -- 633
			cls.__init(_self_0, ...) -- 633
			return _self_0 -- 633
		end -- 633
	}) -- 633
	_base_0.__class = _class_0 -- 633
	if _parent_0.__inherited then -- 633
		_parent_0.__inherited(_parent_0, _class_0) -- 633
	end -- 633
	Admin = _class_0 -- 633
end -- 648
if CLIENT then -- 650
	Admin.OnReceive = function(self, data) -- 651
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[ADMIN]</c> <c=" .. tostring(data.color) .. ">" .. tostring(data.name) .. "</c>: " .. tostring(data.text) -- 651
	end -- 651
end -- 650
if SERVER then -- 652
	Admin.Parse = function(self, ply, lang, cmd, text) -- 653
		local valid = { -- 654
			ply -- 654
		} -- 654
		for _, target in pairs(player.GetAll()) do -- 655
			local _continue_0 = false -- 656
			repeat -- 656
				if not target:IsAdmin() then -- 656
					_continue_0 = true -- 656
					break -- 656
				end -- 656
				valid[#valid + 1] = target -- 657
				_continue_0 = true -- 656
			until true -- 657
			if not _continue_0 then -- 657
				break -- 657
			end -- 657
		end -- 657
		return Chat.Send(self.name, { -- 659
			name = ply:Name(), -- 659
			color = Color(210, 0, 0), -- 660
			text = text -- 661
		}, valid) -- 662
	end -- 653
end -- 652
