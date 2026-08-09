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
		name = "SUCCESS", -- 286
		color = Color(5, 210, 5), -- 287
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
		name = "XOMBOKOM", -- 292
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
		name = "RADIO", -- 298
		color = Color(230, 10, 10), -- 299
		font = "Spleen_Chat", -- 300
		OnReceive = function(self, data) -- 300
			return string.format("<font=%s><c=%s>%s", self.font, self.color, data.text) -- 300
		end -- 296
	} -- 296
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 300
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 296
			_base_0[_key_0] = _val_0 -- 296
		end -- 296
	end -- 300
	if _base_0.__index == nil then -- 296
		_base_0.__index = _base_0 -- 296
	end -- 300
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
end -- 300
do -- 302
	local _class_0 -- 302
	local _parent_0 = CHAT_CMD -- 302
	local _base_0 = { -- 302
		name = "ERROR", -- 304
		color = Color(200, 0, 0), -- 305
		color_console = Color(255, 90, 90), -- 306
		font = "Spleen_Chat", -- 307
		OnReceive = function(self, data) -- 307
			return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">ERROR: " .. tostring(data.text), "<c=" .. tostring(self.color_console) .. ">ERROR: " .. tostring(data.text) -- 307
		end -- 302
	} -- 302
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 307
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 302
			_base_0[_key_0] = _val_0 -- 302
		end -- 302
	end -- 307
	if _base_0.__index == nil then -- 302
		_base_0.__index = _base_0 -- 302
	end -- 307
	setmetatable(_base_0, _parent_0.__base) -- 302
	_class_0 = setmetatable({ -- 302
		__init = function(self, ...) -- 302
			return _class_0.__parent.__init(self, ...) -- 302
		end, -- 302
		__base = _base_0, -- 302
		__parent = _parent_0 -- 302
	}, { -- 302
		__index = function(cls, name) -- 302
			local val = rawget(_base_0, name) -- 302
			if val == nil then -- 302
				local parent = rawget(cls, "__parent") -- 302
				if parent then -- 302
					return parent[name] -- 302
				end -- 302
			else -- 302
				return val -- 302
			end -- 302
		end, -- 302
		__call = function(cls, ...) -- 302
			local _self_0 = setmetatable({ }, _base_0) -- 302
			cls.__init(_self_0, ...) -- 302
			return _self_0 -- 302
		end -- 302
	}) -- 302
	_base_0.__class = _class_0 -- 302
	if _parent_0.__inherited then -- 302
		_parent_0.__inherited(_parent_0, _class_0) -- 302
	end -- 302
end -- 307
do -- 309
	local _class_0 -- 309
	local _parent_0 = CHAT_CMD -- 309
	local _base_0 = { -- 309
		tabs = TAB_IC, -- 311
		log_category = "ic", -- 313
		Handle = function(self, ply, lang, cmd, text) -- 313
			if not ply:Alive() then -- 314
				ply:SendChat("ERROR", "You're DEAD.") -- 315
				return -- 316
			end -- 314
			return _class_0.__parent.__base.Handle(self, ply, lang, cmd, text) -- 317
		end -- 309
	} -- 309
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 317
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 309
			_base_0[_key_0] = _val_0 -- 309
		end -- 309
	end -- 317
	if _base_0.__index == nil then -- 309
		_base_0.__index = _base_0 -- 309
	end -- 317
	setmetatable(_base_0, _parent_0.__base) -- 309
	_class_0 = setmetatable({ -- 309
		__init = function(self, ...) -- 309
			return _class_0.__parent.__init(self, ...) -- 309
		end, -- 309
		__base = _base_0, -- 309
		__name = "CHAT_CMD_IC", -- 309
		__parent = _parent_0 -- 309
	}, { -- 309
		__index = function(cls, name) -- 309
			local val = rawget(_base_0, name) -- 309
			if val == nil then -- 309
				local parent = rawget(cls, "__parent") -- 309
				if parent then -- 309
					return parent[name] -- 309
				end -- 309
			else -- 309
				return val -- 309
			end -- 309
		end, -- 309
		__call = function(cls, ...) -- 309
			local _self_0 = setmetatable({ }, _base_0) -- 309
			cls.__init(_self_0, ...) -- 309
			return _self_0 -- 309
		end -- 309
	}) -- 309
	_base_0.__class = _class_0 -- 309
	if _parent_0.__inherited then -- 309
		_parent_0.__inherited(_parent_0, _class_0) -- 309
	end -- 309
	CHAT_CMD_IC = _class_0 -- 309
end -- 317
local Action -- 319
do -- 319
	local _class_0 -- 319
	local _parent_0 = CHAT_CMD_IC -- 319
	local _base_0 = { -- 319
		name = "Action", -- 321
		desc = "Do something.", -- 322
		typing = "Performing...", -- 324
		commands = { -- 324
			"me", -- 324
			"em" -- 324
		}, -- 325
		aliases = { -- 325
			":", -- 325
			"*" -- 325
		}, -- 327
		range = 400, -- 328
		range_muffled = 0, -- 330
		font = "Spleen_Chat" -- 319
	} -- 319
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 330
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 319
			_base_0[_key_0] = _val_0 -- 319
		end -- 319
	end -- 330
	if _base_0.__index == nil then -- 319
		_base_0.__index = _base_0 -- 319
	end -- 330
	setmetatable(_base_0, _parent_0.__base) -- 319
	_class_0 = setmetatable({ -- 319
		__init = function(self, ...) -- 319
			return _class_0.__parent.__init(self, ...) -- 319
		end, -- 319
		__base = _base_0, -- 319
		__name = "Action", -- 319
		__parent = _parent_0 -- 319
	}, { -- 319
		__index = function(cls, name) -- 319
			local val = rawget(_base_0, name) -- 319
			if val == nil then -- 319
				local parent = rawget(cls, "__parent") -- 319
				if parent then -- 319
					return parent[name] -- 319
				end -- 319
			else -- 319
				return val -- 319
			end -- 319
		end, -- 319
		__call = function(cls, ...) -- 319
			local _self_0 = setmetatable({ }, _base_0) -- 319
			cls.__init(_self_0, ...) -- 319
			return _self_0 -- 319
		end -- 319
	}) -- 319
	_base_0.__class = _class_0 -- 319
	if _parent_0.__inherited then -- 319
		_parent_0.__inherited(_parent_0, _class_0) -- 319
	end -- 319
	Action = _class_0 -- 319
end -- 330
if CLIENT then -- 332
	Action.OnReceive = function(self, data) -- 333
		local text = data.text -- 334
		if not string.match(text, "^[,.']") then -- 335
			text = " " .. tostring(text) -- 335
		end -- 335
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(data.color) .. ">** " .. tostring(data.name) .. tostring(text) -- 336
	end -- 333
end -- 332
if SERVER then -- 338
	Action.Parse = function(self, ply, lang, cmd, text) -- 339
		return { -- 340
			name = ply:Name(), -- 340
			color = ply:getJobTable().color, -- 340
			text = text -- 340
		} -- 340
	end -- 339
end -- 338
local Say -- 342
do -- 342
	local _class_0 -- 342
	local _parent_0 = CHAT_CMD_IC -- 342
	local _base_0 = { -- 342
		name = "Say", -- 344
		desc = "Speak out to those around you.", -- 345
		typing = "Lying...", -- 346
		tense = "said", -- 348
		commands = { -- 348
			"say" -- 348
		}, -- 350
		use_language = true, -- 351
		hearable = true, -- 353
		range = 400, -- 354
		range_muffled = 150, -- 356
		font = "Spleen_Chat", -- 358
		color = Color(91, 166, 221), -- 359
		color_lang = Color(255, 167, 73), -- 361
		Process = function(self, ply, text) -- 361
			return Chat.Autopretty(ply, text) -- 361
		end -- 342
	} -- 342
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 361
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 342
			_base_0[_key_0] = _val_0 -- 342
		end -- 342
	end -- 361
	if _base_0.__index == nil then -- 342
		_base_0.__index = _base_0 -- 342
	end -- 361
	setmetatable(_base_0, _parent_0.__base) -- 342
	_class_0 = setmetatable({ -- 342
		__init = function(self, ...) -- 342
			return _class_0.__parent.__init(self, ...) -- 342
		end, -- 342
		__base = _base_0, -- 342
		__name = "Say", -- 342
		__parent = _parent_0 -- 342
	}, { -- 342
		__index = function(cls, name) -- 342
			local val = rawget(_base_0, name) -- 342
			if val == nil then -- 342
				local parent = rawget(cls, "__parent") -- 342
				if parent then -- 342
					return parent[name] -- 342
				end -- 342
			else -- 342
				return val -- 342
			end -- 342
		end, -- 342
		__call = function(cls, ...) -- 342
			local _self_0 = setmetatable({ }, _base_0) -- 342
			cls.__init(_self_0, ...) -- 342
			return _self_0 -- 342
		end -- 342
	}) -- 342
	_base_0.__class = _class_0 -- 342
	if _parent_0.__inherited then -- 342
		_parent_0.__inherited(_parent_0, _class_0) -- 342
	end -- 342
	Say = _class_0 -- 342
end -- 361
if CLIENT then -- 363
	Say.OnReceive = function(self, data) -- 364
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(data.name_color) .. ">" .. tostring(data.name) .. " <c=" .. tostring(Color(255, 255, 255)) .. ">" .. tostring(self.tense) .. ", <c=" .. tostring(self.color) .. ">\"" .. tostring(data.text) .. "\"" -- 364
	end -- 364
end -- 363
if SERVER then -- 375
	Say.Parse = function(self, ply, lang, cmd, text) -- 376
		local targets = self:GetTargets(ply) -- 377
		local valid = { } -- 378
		local invalid = { } -- 379
		for _index_0 = 1, #targets do -- 380
			local target = targets[_index_0] -- 380
			if target == ply or true then -- 382
				valid[#valid + 1] = target -- 383
			else -- 385
				invalid[#invalid + 1] = target -- 385
			end -- 382
		end -- 385
		local name_color = ply:getJobTable().color -- 388
		text = self:Process(ply, text) -- 389
		if not self.silent then -- 390
			ply:PlaySpeechSound(text, SNDLVL_65DB) -- 390
		end -- 390
		return Chat.Send(self.name, { -- 392
			name = ply:Name(), -- 392
			name_color = name_color, -- 393
			lang = lang, -- 394
			text = text -- 395
		}, valid) -- 396
	end -- 376
end -- 375
local Yell -- 399
do -- 399
	local _class_0 -- 399
	local _parent_0 = Say -- 399
	local _base_0 = { -- 399
		name = "Yell", -- 401
		desc = "Yell something at the top of your lungs.", -- 402
		typing = "Yelling...", -- 403
		tense = "shouted", -- 405
		commands = { -- 405
			"yell", -- 405
			"y" -- 405
		}, -- 407
		range = 800, -- 408
		range_muffled = 400, -- 410
		color = Color(255, 50, 50), -- 411
		color_lang = Color(255, 167, 73), -- 413
		Process = function(self, ply, text) -- 413
			text = _class_0.__parent.__base.Process(self, ply, text) -- 414
			text = string.upper(text) -- 415
			local punc = string.sub(text, string.len(text)) -- 416
			if "." == punc then -- 418
				text = tostring(string.sub(text, 1, -2)) .. "!" -- 419
			elseif "?" == punc then -- 420
				text = text .. "!" -- 421
			else -- 423
				text = text .. "!" -- 423
			end -- 423
			return "<wiggle=2>" .. tostring(text) .. "</wiggle>" -- 424
		end -- 399
	} -- 399
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 424
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 399
			_base_0[_key_0] = _val_0 -- 399
		end -- 399
	end -- 424
	if _base_0.__index == nil then -- 399
		_base_0.__index = _base_0 -- 399
	end -- 424
	setmetatable(_base_0, _parent_0.__base) -- 399
	_class_0 = setmetatable({ -- 399
		__init = function(self, ...) -- 399
			return _class_0.__parent.__init(self, ...) -- 399
		end, -- 399
		__base = _base_0, -- 399
		__name = "Yell", -- 399
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
	Yell = _class_0 -- 399
end -- 424
local Whisper -- 426
do -- 426
	local _class_0 -- 426
	local _parent_0 = Say -- 426
	local _base_0 = { -- 426
		name = "Whisper", -- 428
		desc = "Quietly transmit your secrets to your close ones.", -- 429
		typing = "Whispering...", -- 430
		tense = "whispered", -- 432
		silent = true, -- 434
		font = "Spleen_Chat_Small", -- 436
		commands = { -- 436
			"whisper", -- 436
			"w" -- 436
		}, -- 438
		range = 150, -- 439
		range_muffled = 0, -- 441
		color = Color(151, 151, 151), -- 442
		color_lang = Color(255, 167, 73) -- 426
	} -- 426
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 442
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 426
			_base_0[_key_0] = _val_0 -- 426
		end -- 426
	end -- 442
	if _base_0.__index == nil then -- 426
		_base_0.__index = _base_0 -- 426
	end -- 442
	setmetatable(_base_0, _parent_0.__base) -- 426
	_class_0 = setmetatable({ -- 426
		__init = function(self, ...) -- 426
			return _class_0.__parent.__init(self, ...) -- 426
		end, -- 426
		__base = _base_0, -- 426
		__name = "Whisper", -- 426
		__parent = _parent_0 -- 426
	}, { -- 426
		__index = function(cls, name) -- 426
			local val = rawget(_base_0, name) -- 426
			if val == nil then -- 426
				local parent = rawget(cls, "__parent") -- 426
				if parent then -- 426
					return parent[name] -- 426
				end -- 426
			else -- 426
				return val -- 426
			end -- 426
		end, -- 426
		__call = function(cls, ...) -- 426
			local _self_0 = setmetatable({ }, _base_0) -- 426
			cls.__init(_self_0, ...) -- 426
			return _self_0 -- 426
		end -- 426
	}) -- 426
	_base_0.__class = _class_0 -- 426
	if _parent_0.__inherited then -- 426
		_parent_0.__inherited(_parent_0, _class_0) -- 426
	end -- 426
	Whisper = _class_0 -- 426
end -- 442
local Radio -- 444
do -- 444
	local _class_0 -- 444
	local _parent_0 = Say -- 444
	local _base_0 = { -- 444
		name = "Radio", -- 446
		desc = "Call your squad.", -- 447
		typing = "Chattering...", -- 448
		tense = "called", -- 450
		silent = true, -- 452
		font = "Spleen_Chat_Small", -- 454
		commands = { -- 454
			"radio", -- 454
			"r" -- 454
		}, -- 456
		tabs = TAB_RADIO, -- 457
		log_category = "radio", -- 459
		range = 1500, -- 460
		range_muffled = 0, -- 462
		color = Color(151, 151, 151), -- 463
		color_lang = Color(255, 167, 73) -- 444
	} -- 444
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 463
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 444
			_base_0[_key_0] = _val_0 -- 444
		end -- 444
	end -- 463
	if _base_0.__index == nil then -- 444
		_base_0.__index = _base_0 -- 444
	end -- 463
	setmetatable(_base_0, _parent_0.__base) -- 444
	_class_0 = setmetatable({ -- 444
		__init = function(self, ...) -- 444
			return _class_0.__parent.__init(self, ...) -- 444
		end, -- 444
		__base = _base_0, -- 444
		__name = "Radio", -- 444
		__parent = _parent_0 -- 444
	}, { -- 444
		__index = function(cls, name) -- 444
			local val = rawget(_base_0, name) -- 444
			if val == nil then -- 444
				local parent = rawget(cls, "__parent") -- 444
				if parent then -- 444
					return parent[name] -- 444
				end -- 444
			else -- 444
				return val -- 444
			end -- 444
		end, -- 444
		__call = function(cls, ...) -- 444
			local _self_0 = setmetatable({ }, _base_0) -- 444
			cls.__init(_self_0, ...) -- 444
			return _self_0 -- 444
		end -- 444
	}) -- 444
	_base_0.__class = _class_0 -- 444
	if _parent_0.__inherited then -- 444
		_parent_0.__inherited(_parent_0, _class_0) -- 444
	end -- 444
	Radio = _class_0 -- 444
end -- 463
if SERVER then -- 465
	Radio.Parse = function(self, ply, lang, cmd, text) -- 466
		local my_category = ply:getJobTable().category -- 467
		local valid = { } -- 468
		for _, target in pairs(player.GetAll()) do -- 469
			local _continue_0 = false -- 470
			repeat -- 470
				if not (target:getJobTable().category == my_category) then -- 470
					_continue_0 = true -- 470
					break -- 470
				end -- 470
				valid[#valid + 1] = target -- 471
				_continue_0 = true -- 470
			until true -- 471
			if not _continue_0 then -- 471
				break -- 471
			end -- 471
		end -- 471
		local name_color = ply:getJobTable().color -- 473
		text = self:Process(ply, text) -- 474
		return Chat.Send(self.name, { -- 476
			name = ply:Name(), -- 476
			name_color = name_color, -- 477
			lang = lang, -- 478
			text = text -- 479
		}, valid) -- 480
	end -- 466
end -- 465
local XOMBOKOM -- 482
do -- 482
	local _class_0 -- 482
	local _parent_0 = SOUND -- 482
	local _base_0 = { -- 482
		level = SNDLVL_NONE, -- 484
		sound = (function() -- 484
			local _accum_0 = { } -- 484
			local _len_0 = 1 -- 484
			for i = 1, 7 do -- 484
				_accum_0[_len_0] = "kidneydagger/broadcast" .. tostring(i) .. ".wav" -- 484
				_len_0 = _len_0 + 1 -- 484
			end -- 484
			return _accum_0 -- 484
		end)() -- 482
	} -- 482
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 484
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 482
			_base_0[_key_0] = _val_0 -- 482
		end -- 482
	end -- 484
	if _base_0.__index == nil then -- 482
		_base_0.__index = _base_0 -- 482
	end -- 484
	setmetatable(_base_0, _parent_0.__base) -- 482
	_class_0 = setmetatable({ -- 482
		__init = function(self, ...) -- 482
			return _class_0.__parent.__init(self, ...) -- 482
		end, -- 482
		__base = _base_0, -- 482
		__name = "XOMBOKOM", -- 482
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
	XOMBOKOM = _class_0 -- 482
end -- 484
local DEUS -- 486
do -- 486
	local _class_0 -- 486
	local _parent_0 = SOUND -- 486
	local _base_0 = { -- 486
		level = SNDLVL_NONE, -- 488
		sound = (function() -- 488
			local _accum_0 = { } -- 488
			local _len_0 = 1 -- 488
			for i = 1, 2 do -- 488
				_accum_0[_len_0] = "changes" .. tostring(i) .. ".ogg" -- 488
				_len_0 = _len_0 + 1 -- 488
			end -- 488
			return _accum_0 -- 488
		end)() -- 486
	} -- 486
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 488
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 486
			_base_0[_key_0] = _val_0 -- 486
		end -- 486
	end -- 488
	if _base_0.__index == nil then -- 486
		_base_0.__index = _base_0 -- 486
	end -- 488
	setmetatable(_base_0, _parent_0.__base) -- 486
	_class_0 = setmetatable({ -- 486
		__init = function(self, ...) -- 486
			return _class_0.__parent.__init(self, ...) -- 486
		end, -- 486
		__base = _base_0, -- 486
		__name = "DEUS", -- 486
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
	DEUS = _class_0 -- 486
end -- 488
local Meistercast -- 490
do -- 490
	local _class_0 -- 490
	local _parent_0 = CHAT_CMD_IC -- 490
	local _base_0 = { -- 490
		name = "MEISTERKOM", -- 492
		color = Color(210, 100, 0), -- 493
		font = "Spleen_Chat", -- 495
		Handle = function(self, ply, lang, cmd, text) -- 495
			if not (ply:Team() == TEAM_DEALER) then -- 496
				ply:Notify("<c=200,0,0>This power is NOT FOR YOU.") -- 497
				return -- 498
			end -- 496
			return _class_0.__parent.__base.Handle(self, ply, lang, cmd, text) -- 499
		end, -- 501
		Process = function(self, ply, text) -- 501
			return Chat.Autopretty(ply, text:upper()) -- 501
		end -- 490
	} -- 490
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 501
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 490
			_base_0[_key_0] = _val_0 -- 490
		end -- 490
	end -- 501
	if _base_0.__index == nil then -- 490
		_base_0.__index = _base_0 -- 490
	end -- 501
	setmetatable(_base_0, _parent_0.__base) -- 490
	_class_0 = setmetatable({ -- 490
		__init = function(self, ...) -- 490
			return _class_0.__parent.__init(self, ...) -- 490
		end, -- 490
		__base = _base_0, -- 490
		__name = "Meistercast", -- 490
		__parent = _parent_0 -- 490
	}, { -- 490
		__index = function(cls, name) -- 490
			local val = rawget(_base_0, name) -- 490
			if val == nil then -- 490
				local parent = rawget(cls, "__parent") -- 490
				if parent then -- 490
					return parent[name] -- 490
				end -- 490
			else -- 490
				return val -- 490
			end -- 490
		end, -- 490
		__call = function(cls, ...) -- 490
			local _self_0 = setmetatable({ }, _base_0) -- 490
			cls.__init(_self_0, ...) -- 490
			return _self_0 -- 490
		end -- 490
	}) -- 490
	_base_0.__class = _class_0 -- 490
	if _parent_0.__inherited then -- 490
		_parent_0.__inherited(_parent_0, _class_0) -- 490
	end -- 490
	Meistercast = _class_0 -- 490
end -- 501
local Xombocast -- 504
do -- 504
	local _class_0 -- 504
	local _parent_0 = CHAT_CMD_IC -- 504
	local _base_0 = { -- 504
		name = "XOMBOKOM", -- 506
		color = Color(210, 0, 0), -- 507
		font = "Spleen_Chat", -- 509
		Handle = function(self, ply, lang, cmd, text) -- 509
			if not (ply:Team() == TEAM_EMPEROR) then -- 510
				ply:Notify("<c=200,0,0>This power is NOT FOR YOU.") -- 511
				return -- 512
			end -- 510
			return _class_0.__parent.__base.Handle(self, ply, lang, cmd, text) -- 513
		end, -- 515
		Process = function(self, ply, text) -- 515
			return Chat.Autopretty(ply, text:upper()) -- 515
		end -- 504
	} -- 504
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 515
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 504
			_base_0[_key_0] = _val_0 -- 504
		end -- 504
	end -- 515
	if _base_0.__index == nil then -- 504
		_base_0.__index = _base_0 -- 504
	end -- 515
	setmetatable(_base_0, _parent_0.__base) -- 504
	_class_0 = setmetatable({ -- 504
		__init = function(self, ...) -- 504
			return _class_0.__parent.__init(self, ...) -- 504
		end, -- 504
		__base = _base_0, -- 504
		__name = "Xombocast", -- 504
		__parent = _parent_0 -- 504
	}, { -- 504
		__index = function(cls, name) -- 504
			local val = rawget(_base_0, name) -- 504
			if val == nil then -- 504
				local parent = rawget(cls, "__parent") -- 504
				if parent then -- 504
					return parent[name] -- 504
				end -- 504
			else -- 504
				return val -- 504
			end -- 504
		end, -- 504
		__call = function(cls, ...) -- 504
			local _self_0 = setmetatable({ }, _base_0) -- 504
			cls.__init(_self_0, ...) -- 504
			return _self_0 -- 504
		end -- 504
	}) -- 504
	_base_0.__class = _class_0 -- 504
	if _parent_0.__inherited then -- 504
		_parent_0.__inherited(_parent_0, _class_0) -- 504
	end -- 504
	Xombocast = _class_0 -- 504
end -- 515
local Broadcast -- 517
do -- 517
	local _class_0 -- 517
	local _parent_0 = CHAT_CMD_IC -- 517
	local _base_0 = { -- 517
		name = "Broadcast", -- 519
		desc = "Make them all listen.", -- 520
		typing = "Decreeing...", -- 522
		commands = { -- 522
			"broadcast", -- 522
			"ad" -- 522
		}, -- 524
		color = Color(200, 0, 0), -- 526
		font = "Spleen_Chat", -- 528
		Handle = function(self, ply, lang, cmd, text) -- 528
			local _exp_0 = ply:Team() -- 529
			if TEAM_DEALER == _exp_0 then -- 530
				return Meistercast:Handle(ply, lang, cmd, text) -- 531
			elseif TEAM_EMPEROR == _exp_0 then -- 532
				return Xombocast:Handle(ply, lang, cmd, text) -- 533
			end -- 533
		end -- 517
	} -- 517
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 533
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 517
			_base_0[_key_0] = _val_0 -- 517
		end -- 517
	end -- 533
	if _base_0.__index == nil then -- 517
		_base_0.__index = _base_0 -- 517
	end -- 533
	setmetatable(_base_0, _parent_0.__base) -- 517
	_class_0 = setmetatable({ -- 517
		__init = function(self, ...) -- 517
			return _class_0.__parent.__init(self, ...) -- 517
		end, -- 517
		__base = _base_0, -- 517
		__name = "Broadcast", -- 517
		__parent = _parent_0 -- 517
	}, { -- 517
		__index = function(cls, name) -- 517
			local val = rawget(_base_0, name) -- 517
			if val == nil then -- 517
				local parent = rawget(cls, "__parent") -- 517
				if parent then -- 517
					return parent[name] -- 517
				end -- 517
			else -- 517
				return val -- 517
			end -- 517
		end, -- 517
		__call = function(cls, ...) -- 517
			local _self_0 = setmetatable({ }, _base_0) -- 517
			cls.__init(_self_0, ...) -- 517
			return _self_0 -- 517
		end -- 517
	}) -- 517
	_base_0.__class = _class_0 -- 517
	if _parent_0.__inherited then -- 517
		_parent_0.__inherited(_parent_0, _class_0) -- 517
	end -- 517
	Broadcast = _class_0 -- 517
end -- 533
local Godcast -- 536
do -- 536
	local _class_0 -- 536
	local _parent_0 = CHAT_CMD_IC -- 536
	local _base_0 = { -- 536
		name = "Godcast", -- 538
		desc = "Make them all listen.", -- 539
		typing = "Decreeing...", -- 541
		commands = { -- 541
			"godcast", -- 541
			"god" -- 541
		}, -- 543
		color = Color(0, 0, 0), -- 545
		font = "Spleen_Chat", -- 547
		Process = function(self, ply, text) -- 547
			return Chat.Autopretty(ply, text:upper()) -- 547
		end, -- 549
		Handle = function(self, ply, lang, cmd, text) -- 549
			if not ply:IsSuperAdmin() then -- 550
				ply:Notify("<c=200,0,0>This power is NOT FOR YOU.") -- 551
				return -- 552
			end -- 550
			return _class_0.__parent.__base.Handle(self, ply, lang, cmd, text) -- 553
		end -- 536
	} -- 536
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 553
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 536
			_base_0[_key_0] = _val_0 -- 536
		end -- 536
	end -- 553
	if _base_0.__index == nil then -- 536
		_base_0.__index = _base_0 -- 536
	end -- 553
	setmetatable(_base_0, _parent_0.__base) -- 536
	_class_0 = setmetatable({ -- 536
		__init = function(self, ...) -- 536
			return _class_0.__parent.__init(self, ...) -- 536
		end, -- 536
		__base = _base_0, -- 536
		__name = "Godcast", -- 536
		__parent = _parent_0 -- 536
	}, { -- 536
		__index = function(cls, name) -- 536
			local val = rawget(_base_0, name) -- 536
			if val == nil then -- 536
				local parent = rawget(cls, "__parent") -- 536
				if parent then -- 536
					return parent[name] -- 536
				end -- 536
			else -- 536
				return val -- 536
			end -- 536
		end, -- 536
		__call = function(cls, ...) -- 536
			local _self_0 = setmetatable({ }, _base_0) -- 536
			cls.__init(_self_0, ...) -- 536
			return _self_0 -- 536
		end -- 536
	}) -- 536
	_base_0.__class = _class_0 -- 536
	if _parent_0.__inherited then -- 536
		_parent_0.__inherited(_parent_0, _class_0) -- 536
	end -- 536
	Godcast = _class_0 -- 536
end -- 553
if CLIENT then -- 555
	Xombocast.OnReceive = function(self, data) -- 556
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[XOMBOKOM] <wiggle>" .. tostring(data.text) -- 556
	end -- 556
	Godcast.OnReceive = function(self, data) -- 557
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[ORACLEKOM] <wiggle>" .. tostring(data.text) -- 557
	end -- 557
	Meistercast.OnReceive = function(self, data) -- 558
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[MEISTERKOM] <wiggle>" .. tostring(data.text) -- 558
	end -- 558
end -- 555
if SERVER then -- 559
	Xombocast.Parse = function(self, ply, lang, cmd, text) -- 560
		text = self:Process(ply, text) -- 561
		ply:EmitSound("XOMBOKOM") -- 562
		return { -- 563
			text = text -- 563
		} -- 563
	end -- 560
	Meistercast.Parse = function(self, ply, lang, cmd, text) -- 565
		text = self:Process(ply, text) -- 566
		ply:EmitSound("kidneydagger/vote.ogg") -- 567
		return { -- 568
			text = text -- 568
		} -- 568
	end -- 565
	Godcast.Parse = function(self, ply, lang, cmd, text) -- 570
		text = self:Process(ply, text) -- 571
		ply:EmitSound("DEUS") -- 572
		ply:AddDespair(5) -- 573
		net.Start("evilrp_frighten") -- 574
		net.Send(ply) -- 575
		ply:Notify("<c=200,0,0> " .. tostring(text) .. ".") -- 576
		return { -- 577
			text = text -- 577
		} -- 577
	end -- 570
end -- 559
local OOC -- 580
do -- 580
	local _class_0 -- 580
	local _parent_0 = CHAT_CMD -- 580
	local _base_0 = { -- 580
		name = "OOC", -- 582
		desc = "Global out-of-character chat.", -- 583
		typing = "Typing...", -- 585
		commands = { -- 585
			"ooc" -- 585
		}, -- 586
		aliases = { -- 586
			"//" -- 586
		}, -- 588
		tabs = TAB_OOC, -- 589
		log_category = "ooc", -- 591
		color = Color(200, 0, 0), -- 593
		font = "Spleen_Chat_Small" -- 580
	} -- 580
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 593
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 580
			_base_0[_key_0] = _val_0 -- 580
		end -- 580
	end -- 593
	if _base_0.__index == nil then -- 580
		_base_0.__index = _base_0 -- 580
	end -- 593
	setmetatable(_base_0, _parent_0.__base) -- 580
	_class_0 = setmetatable({ -- 580
		__init = function(self, ...) -- 580
			return _class_0.__parent.__init(self, ...) -- 580
		end, -- 580
		__base = _base_0, -- 580
		__name = "OOC", -- 580
		__parent = _parent_0 -- 580
	}, { -- 580
		__index = function(cls, name) -- 580
			local val = rawget(_base_0, name) -- 580
			if val == nil then -- 580
				local parent = rawget(cls, "__parent") -- 580
				if parent then -- 580
					return parent[name] -- 580
				end -- 580
			else -- 580
				return val -- 580
			end -- 580
		end, -- 580
		__call = function(cls, ...) -- 580
			local _self_0 = setmetatable({ }, _base_0) -- 580
			cls.__init(_self_0, ...) -- 580
			return _self_0 -- 580
		end -- 580
	}) -- 580
	_base_0.__class = _class_0 -- 580
	if _parent_0.__inherited then -- 580
		_parent_0.__inherited(_parent_0, _class_0) -- 580
	end -- 580
	OOC = _class_0 -- 580
end -- 593
if CLIENT then -- 595
	OOC.OnReceive = function(self, data) -- 596
		local prefix -- 597
		if data.rainbow_name then -- 598
			prefix = "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[OOC]</c> <rgb=1,13,30>" .. tostring(data.name) .. "</rgb>" -- 599
		else -- 601
			prefix = "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[OOC]</c> <c=" .. tostring(data.color) .. ">" .. tostring(data.name) .. "</c>" -- 601
		end -- 598
		return tostring(prefix) .. ": " .. tostring(data.text) -- 602
	end -- 596
end -- 595
if SERVER then -- 603
	OOC.Parse = function(self, ply, lang, cmd, text) -- 606
		local sid = ply:SteamID() -- 607
		local r = util.SharedRandom(sid, 0, 255, 1) -- 608
		local g = util.SharedRandom(sid, 0, 255, 2) -- 609
		local b = util.SharedRandom(sid, 0, 255, 3) -- 610
		local color = Color(r, g, b) -- 611
		local rainbow_name = ply:HasDonation("rainbow") and (ply:GetInfoNum("lfr_rainbow_username", 1) == 1) -- 612
		return { -- 613
			name = ply:SteamName(), -- 613
			color = color, -- 613
			text = text, -- 613
			rainbow_name = rainbow_name -- 613
		} -- 613
	end -- 606
end -- 603
local LOOC -- 616
do -- 616
	local _class_0 -- 616
	local _parent_0 = CHAT_CMD -- 616
	local _base_0 = { -- 616
		name = "Local OOC", -- 618
		desc = "Local out-of-character chat.", -- 619
		typing = "Typing...", -- 621
		commands = { -- 621
			"looc" -- 621
		}, -- 622
		aliases = { -- 622
			"[[", -- 622
			".//" -- 622
		}, -- 624
		range = 400, -- 626
		tabs = TABS_LOOC, -- 627
		log_category = "ooc", -- 629
		color = Color(138, 185, 209), -- 631
		font = "Spleen_Chat_Small" -- 616
	} -- 616
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 631
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 616
			_base_0[_key_0] = _val_0 -- 616
		end -- 616
	end -- 631
	if _base_0.__index == nil then -- 616
		_base_0.__index = _base_0 -- 616
	end -- 631
	setmetatable(_base_0, _parent_0.__base) -- 616
	_class_0 = setmetatable({ -- 616
		__init = function(self, ...) -- 616
			return _class_0.__parent.__init(self, ...) -- 616
		end, -- 616
		__base = _base_0, -- 616
		__name = "LOOC", -- 616
		__parent = _parent_0 -- 616
	}, { -- 616
		__index = function(cls, name) -- 616
			local val = rawget(_base_0, name) -- 616
			if val == nil then -- 616
				local parent = rawget(cls, "__parent") -- 616
				if parent then -- 616
					return parent[name] -- 616
				end -- 616
			else -- 616
				return val -- 616
			end -- 616
		end, -- 616
		__call = function(cls, ...) -- 616
			local _self_0 = setmetatable({ }, _base_0) -- 616
			cls.__init(_self_0, ...) -- 616
			return _self_0 -- 616
		end -- 616
	}) -- 616
	_base_0.__class = _class_0 -- 616
	if _parent_0.__inherited then -- 616
		_parent_0.__inherited(_parent_0, _class_0) -- 616
	end -- 616
	LOOC = _class_0 -- 616
end -- 631
if CLIENT then -- 633
	LOOC.OnReceive = function(self, data) -- 634
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[OOC-LOCAL]</c> <c=" .. tostring(data.color) .. ">" .. tostring(data.name) .. "</c>: " .. tostring(data.text) -- 634
	end -- 634
end -- 633
if SERVER then -- 635
	LOOC.Parse = function(self, ply, lang, cmd, text) -- 636
		return { -- 636
			name = ply:Name(), -- 636
			color = team.GetColor(ply:Team()), -- 636
			text = text -- 636
		} -- 636
	end -- 636
end -- 635
local Admin -- 639
do -- 639
	local _class_0 -- 639
	local _parent_0 = CHAT_CMD -- 639
	local _base_0 = { -- 639
		name = "Admin", -- 641
		desc = "Local out-of-character chat.", -- 642
		typing = "Typing...", -- 644
		commands = { -- 644
			"a", -- 644
			"admin", -- 644
			"//" -- 644
		}, -- 645
		aliases = { -- 645
			"@" -- 645
		}, -- 647
		range = 400, -- 649
		tabs = TAB_SOTLA, -- 650
		log_category = "ooc", -- 652
		color = Color(210, 0, 0), -- 654
		font = "Spleen_Chat_Small" -- 639
	} -- 639
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 654
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 639
			_base_0[_key_0] = _val_0 -- 639
		end -- 639
	end -- 654
	if _base_0.__index == nil then -- 639
		_base_0.__index = _base_0 -- 639
	end -- 654
	setmetatable(_base_0, _parent_0.__base) -- 639
	_class_0 = setmetatable({ -- 639
		__init = function(self, ...) -- 639
			return _class_0.__parent.__init(self, ...) -- 639
		end, -- 639
		__base = _base_0, -- 639
		__name = "Admin", -- 639
		__parent = _parent_0 -- 639
	}, { -- 639
		__index = function(cls, name) -- 639
			local val = rawget(_base_0, name) -- 639
			if val == nil then -- 639
				local parent = rawget(cls, "__parent") -- 639
				if parent then -- 639
					return parent[name] -- 639
				end -- 639
			else -- 639
				return val -- 639
			end -- 639
		end, -- 639
		__call = function(cls, ...) -- 639
			local _self_0 = setmetatable({ }, _base_0) -- 639
			cls.__init(_self_0, ...) -- 639
			return _self_0 -- 639
		end -- 639
	}) -- 639
	_base_0.__class = _class_0 -- 639
	if _parent_0.__inherited then -- 639
		_parent_0.__inherited(_parent_0, _class_0) -- 639
	end -- 639
	Admin = _class_0 -- 639
end -- 654
if CLIENT then -- 656
	Admin.OnReceive = function(self, data) -- 657
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[ADMIN]</c> <c=" .. tostring(data.color) .. ">" .. tostring(data.name) .. "</c>: " .. tostring(data.text) -- 657
	end -- 657
end -- 656
if SERVER then -- 658
	Admin.Parse = function(self, ply, lang, cmd, text) -- 659
		local valid = { -- 660
			ply -- 660
		} -- 660
		for _, target in pairs(player.GetAll()) do -- 661
			local _continue_0 = false -- 662
			repeat -- 662
				if not target:IsAdmin() then -- 662
					_continue_0 = true -- 662
					break -- 662
				end -- 662
				valid[#valid + 1] = target -- 663
				_continue_0 = true -- 662
			until true -- 663
			if not _continue_0 then -- 663
				break -- 663
			end -- 663
		end -- 663
		return Chat.Send(self.name, { -- 665
			name = ply:Name(), -- 665
			color = Color(210, 0, 0), -- 666
			text = text -- 667
		}, valid) -- 668
	end -- 659
end -- 658
