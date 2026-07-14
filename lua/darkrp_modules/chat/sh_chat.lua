if not Chat then
	Chat = { }
end
local _obj_0 = Chat
_obj_0.list = _obj_0.list or { }
local _obj_1 = Chat
_obj_1.commands = _obj_1.commands or { }
local _obj_2 = Chat
_obj_2.aliases = _obj_2.aliases or { }
local _obj_3 = Chat
_obj_3.console_commands = _obj_3.console_commands or { }
local meta = FindMetaTable("Player")
local emeta = FindMetaTable("Entity")
meta.Typing = function(self)
	return self:GetNWString("evilrp_typing", nil)
end
meta.SetTyping = function(self, str)
	return self:SetNWString("evilrp_typing", str)
end
Chat.Process = function(ply, str)
	for alias, command in pairs(Chat.aliases) do
		if string.Left(str, #alias) == alias then
			str = string.format("/%s %s", command, string.sub(str, #alias + 1))
			break
		end
	end
	local lang, command, args = string.match(str, "^[/!](%w+)%.(%w+)%s*(.-)%s*$")
	if true or not Language.Lookup[lang] then
		lang = nil
		command, args = string.match(str, "^[/!](%w+)%s*(.-)%s*$")
		if not command then
			command, args = "say", string.Trim(str)
		end
	else
		lang = string.lower(lang)
	end
	return lang, string.lower(command), args
end
Chat.GetTargets = function(pos, range, range_muffled, with_entities)
	local range_max = math.max(range, range_muffled)
	local targets = { }
	for _, ent in pairs(ents.FindInSphere(pos, range_max)) do
		if not ent:IsPlayer() and (not with_entities or not ent.OnHear) then
			goto _continue_0
		end
		local dist = ent:GetPos():DistToSqr(pos)
		if ent:CanHear(pos) then
			if dist < range_max ^ 2 then
				targets[#targets + 1] = ent
			end
		elseif dist <= range_muffled then
			if dist <= range_muffled ^ 2 then
				targets[#targets + 1] = ent
			end
		end
		::_continue_0::
	end
	return targets
end
Chat.Parse = function(ply, str)
	local lang, cmd, args = Chat.Process(ply, str)
	if CLIENT then
		if Chat.console_commands[cmd] then
			return console.Parse(lp, Chat.console_commands[cmd], args)
		else
			return netstream.Send("ParseChat", str)
		end
	else
		if Chat.ThoughtPolice(ply, str) then
			return
		end
		local command = Chat.commands[cmd]
		if not command then
			ply:SendChat("ERROR", "Unknown command: " .. tostring(cmd))
			return
		end
		return command:Handle(ply, lang, cmd, args)
	end
end
Chat.Autopretty = function(ply, text)
	for k, v in pairs(Chat.StupidMistakes) do
		local st_start, st_end = string.find(string.lower(text), " " .. tostring(k) .. " ")
		if st_start then
			text = tostring(string.sub(text, 1, st_start - 1)) .. " " .. tostring(v) .. " " .. tostring(string.sub(text, st_end + 1))
		end
		local st_start_comma, st_end_comma = string.find(text, " " .. tostring(k) .. ",")
		if st_start_comma then
			text = tostring(string.sub(text, 1, st_end_comma - 1)) .. " " .. tostring(v) .. "," .. tostring(string.sub(text, st_end_comma + 1))
		end
		local st_beginning = string.sub(text, 1, string.len(k) + 1)
		if st_beginning == (tostring(k) .. " ") or string.lower(text) == k then
			text = tostring(v) .. tostring(string.sub(text, string.len(k) + 1))
		end
		local st_ending = string.sub(text, string.len(text) - string.len(" " .. tostring(k)) + 1)
		if st_ending == (" " .. tostring(k)) then
			text = string.sub(text, 1, string.len(text) - string.len(" " .. tostring(k))) .. " " .. tostring(v)
		end
	end
	local fix_illiterate = string.sub(text, 1, 1)
	text = string.upper(fix_illiterate) .. string.sub(text, 2, string.len(text))
	local fix_illiterate_2 = string.sub(text, -1)
	if "." == fix_illiterate_2 or "!" == fix_illiterate_2 or "?" == fix_illiterate_2 or ":" == fix_illiterate_2 or ";" == fix_illiterate_2 or "," == fix_illiterate_2 then
	else
		text = text .. "."
	end
	return text
end
Chat.ThoughtPolice = function(ply, text)
	local _list_0 = Chat.BadWords
	for _index_0 = 1, #_list_0 do
		local bad = _list_0[_index_0]
		if string.find(text:lower(), bad) then
			net.Start("evilrp_jumpscare")
			net.Send(ply)
			ply:SendChat("ERROR", "'" .. tostring(bad) .. "'")
			CRIMES.thought:CommittedBy(ply)
			return true
		end
	end
	return false
end
if CLIENT then
	Chat.Create = function()
		local panel = GUI.Get("Chat")
		if IsValid(panel) then
			local buffer = panel:ExportBuffer()
			return GUI.Open("Chat"):ImportBuffer(buffer)
		else
			return GUI.Open("Chat")
		end
	end
	Chat.Bind = function(bind, down)
		if down and bind:find("messagemode") then
			Chat.Show()
			return true
		end
	end
	Chat.Show = function()
		return GUI.Get("Chat"):Show()
	end
	Chat.Hide = function()
		GUI.Get("Chat"):Hide()
		if lp:Typing() ~= nil then
			lp:SetTyping(nil)
			return netstream.Send("Typing", nil)
		end
	end
	Chat.Receive = function(name, data)
		if isstring(data) then
			data = {
				text = data
			}
		end
		local command = Chat.list[name]
		local message, console_message = command:OnReceive(data)
		if isstring(message) then
			return GUI.Get("Chat"):AddMessage(message, console_message, command.tabs)
		end
	end
	netstream.Hook("SendChat", function(payload)
		return Chat.Receive(payload.__type, payload)
	end)
end
if SERVER then
	netstream.Hook("ParseChat", Chat.Parse)
	netstream.Hook("Typing", function(ply, cmd)
		if cmd and Chat.commands[cmd] then
			return ply:SetTyping(cmd)
		else
			return ply:SetTyping(nil)
		end
	end)
	Chat.Send = function(name, data, targets)
		if isstring(data) then
			data = {
				text = data
			}
		end
		data.__type = name
		if not istable(targets) then
			targets = {
				targets
			}
		end
		return netstream.Send(targets, "SendChat", data)
	end
	GM.PlayerSay = function(self, ply, text, t)
		Chat.Parse(ply, text)
		return ""
	end
end
meta.SendChat = function(self, name, data)
	if CLIENT then
		assert(self == lp, "Attempt to SendChat to a non-local player")
		return Chat.Receive(name, data)
	else
		return Chat.Send(name, data, self)
	end
end
Chat.StupidMistakes = {
	["i"] = "I",
	["u"] = "you",
	["r"] = "are",
	["dont"] = "don't",
	["cant"] = "can't",
	["wont"] = "won't",
	["doesnt"] = "doesn't",
	["didnt"] = "didn't",
	["youve"] = "you've",
	["i'll"] = "I'll",
	["itll"] = "it'll",
	["wouldnt"] = "wouldn't",
	["shouldnt"] = "shouldn't",
	["couldnt"] = "couldn't",
	["whos"] = "who's",
	["weve"] = "we've",
	["arent"] = "aren't",
	["ive"] = "I've",
	["i've"] = "I've",
	["hes"] = "he's",
	["shes"] = "she's",
	["her's"] = "hers",
	["whatre"] = "what're",
	["wheres"] = "where's",
	["youre"] = "you're",
	["theres"] = "there's",
	["theyre"] = "they're",
	["theyve"] = "they've",
	["im"] = "I'm",
	["i'm"] = "I'm",
	["youll"] = "you'll",
	["ol"] = "ol'",
	["k"] = "okay",
	["ok"] = "okay",
	["ye"] = "yeah",
	["yea"] = "yeah",
	["idk"] = "I don't know",
	["wtf"] = "what the fuck",
	["rn"] = "right now",
	["gtg"] = "gotta go",
	["brb"] = "be right back",
	["cmon"] = "c'mon",
	["lol"] = "heh",
	["lel"] = "*gag*",
	["kek"] = "hrk",
	["lmao"] = "haha",
	["lmfao"] = "HAHA",
	["rofl"] = "pfftaha",
	["roflmao"] = "PFFFTHAH",
	["nvm"] = "never mind",
	["aint"] = "ain't",
	["killin"] = "killin'",
	["yknow"] = "y'know",
	["n"] = "n'",
	["fuckin"] = "fuckin'",
	["eatin"] = "eatin'",
	["drinkin"] = "drinkin'",
	["huntin"] = "huntin'",
	["lookin"] = "lookin'",
	["searchin"] = "searchin'",
	["shittin"] = "shittin'",
	["jokin"] = "jokin'",
	["gettin"] = "gettin'",
	["lettin"] = "lettin'",
	["fightin"] = "fightin'",
	["gettin"] = "gettin'",
	["motherfuckin"] = "motherfuckin'",
	["ballin"] = "ballin'",
	["rockin"] = "rockin'",
	["bangin"] = "bangin'",
	["rollin"] = "rollin'",
	["movin"] = "movin'",
	["somethin"] = "somethin'",
	["doin"] = "doin'",
	["th"] = "th'",
	["tha"] = "tha'",
	["tho"] = "though",
	["frick"] = "fuck",
	["pls"] = "please",
	["plz"] = "please",
	["pwned"] = "ruined",
	["pwn"] = "ruin",
	["rekt"] = "ruined",
	["cuz"] = "because",
	["dw"] = "don't worry",
	["ty"] = "thank you",
	["np"] = "no problem",
	["omw"] = "on my way",
	["thx"] = "thanks",
	["gg"] = "gluh",
	["money"] = "bone",
	["would of"] = "would've",
	["should of"] = "should've",
	["could of"] = "could've",
	["alot"] = "a lot",
	["mb"] = "my bad",
	["turkey"] = "yurkey",
	["holy shit"] = "holy heart failure",
	["jesus christ"] = "Sotla eternal",
	["jesus fucking christ"] = "Sotla's fucking eye",
	["jesus"] = "Sotla",
	["mother of god"] = "mother of Sotla",
	["brother in christ"] = "brother in Sotla",
	["mfer"] = "friend of mine"
}
Chat.BadWords = {
	"chud",
	"nigger",
	"tranny",
	"nigga",
	"kike",
	"autism",
	"autistic",
	"autist",
	"trannies",
	"faggot",
	"fag",
	"fgt",
	"libtard",
	"retard",
	"gmyza",
	"poggers",
	"pogchamp",
	"prole gaming",
	"omegalol",
	"kekw",
	"trihard7",
	"ur mom",
	"ur mum",
	"bri-ish",
	"bri'ish",
	"nword",
	"rdm",
	"nlr",
	"failrp",
	"chad",
	"hoes mad",
	"yeet",
	"corpsed",
	"kek",
	"chungus",
	"pog",
	"fortnite",
	"skinwalk",
	"skinshift",
	"skin walk",
	"skin shift",
	"unbindall",
	"white walking",
	"weeb",
	"weeaboo",
	"amogus",
	"amog us",
	"pretty cringe",
	"that's cringe",
	"redpilled",
	"tradcath",
	"zoomer",
	"boomer",
	"doomer",
	"groyper",
	"bluepill",
	"redpill",
	"tradwife",
	"blackpill",
	"big chungus",
	"spongebob",
	"impostor among us",
	"imposter among us",
	"ligma",
	"trolled",
	"deez",
	"swag",
	"font",
	"bussin",
	"sussy",
	"bussy",
	"meme",
	"koom",
	"niglet",
	"stem cell meat",
	"make me butcher",
	"nlgger",
	"nlgga",
	"nlg",
	"bruh",
	"allah",
	"akbar",
	"alahu",
	"ackbar",
	"lifeweb",
	"cuck",
	"coom",
	"tryhard",
	"morbius",
	"morbin",
	"/advert",
	"skibidi",
	"rizz",
	"gyatt",
	"solta"
}
do
	local _class_0
	local _parent_0 = CHAT_CMD
	local _base_0 = {
		name = "GENERIC",
		color = Color(200, 200, 200),
		font = "Spleen_Label",
		OnReceive = function(self, data)
			return string.format("<font=%s><c=%s>%s", self.font, self.color, data.text)
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
end
do
	local _class_0
	local _parent_0 = CHAT_CMD
	local _base_0 = {
		name = "NOTICE",
		color = Color(229, 201, 98),
		font = "Spleen_Chat",
		OnReceive = function(self, data)
			return string.format("<font=%s><c=%s>%s", self.font, self.color, data.text)
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
end
do
	local _class_0
	local _parent_0 = CHAT_CMD
	local _base_0 = {
		name = "ERROR",
		color = Color(200, 0, 0),
		color_console = Color(255, 90, 90),
		font = "Spleen_Chat",
		OnReceive = function(self, data)
			return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">ERROR: " .. tostring(data.text), "<c=" .. tostring(self.color_console) .. ">ERROR: " .. tostring(data.text)
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
end
do
	local _class_0
	local _parent_0 = CHAT_CMD
	local _base_0 = {
		tabs = TAB_IC,
		log_category = "ic",
		Handle = function(self, ply, lang, cmd, text)
			if not ply:Alive() then
				ply:SendChat("ERROR", "You're DEAD.")
				return
			end
			return _class_0.__parent.__base.Handle(self, ply, lang, cmd, text)
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
		__name = "CHAT_CMD_IC",
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
	CHAT_CMD_IC = _class_0
end
local Action
do
	local _class_0
	local _parent_0 = CHAT_CMD_IC
	local _base_0 = {
		name = "Action",
		desc = "Do something.",
		typing = "Performing...",
		commands = {
			"me",
			"em"
		},
		aliases = {
			":",
			"*"
		},
		range = 400,
		range_muffled = 0,
		font = "Spleen_Chat"
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
		__name = "Action",
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
	Action = _class_0
end
if CLIENT then
	Action.OnReceive = function(self, data)
		local text = data.text
		if not string.match(text, "^[,.']") then
			text = " " .. tostring(text)
		end
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(data.color) .. ">** " .. tostring(data.name) .. tostring(text)
	end
end
if SERVER then
	Action.Parse = function(self, ply, lang, cmd, text)
		return {
			name = ply:Name(),
			color = ply:getJobTable().color,
			text = text
		}
	end
end
local Say
do
	local _class_0
	local _parent_0 = CHAT_CMD_IC
	local _base_0 = {
		name = "Say",
		desc = "Speak out to those around you.",
		typing = "Lying...",
		tense = "said",
		commands = {
			"say"
		},
		use_language = true,
		hearable = true,
		range = 400,
		range_muffled = 150,
		font = "Spleen_Chat",
		color = Color(91, 166, 221),
		color_lang = Color(255, 167, 73),
		Process = function(self, ply, text)
			return Chat.Autopretty(ply, text)
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
		__name = "Say",
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
	Say = _class_0
end
if CLIENT then
	Say.OnReceive = function(self, data)
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(data.name_color) .. ">" .. tostring(data.name) .. " <c=" .. tostring(Color(255, 255, 255)) .. ">" .. tostring(self.tense) .. ", <c=" .. tostring(self.color) .. ">\"" .. tostring(data.text) .. "\""
	end
end
if SERVER then
	Say.Parse = function(self, ply, lang, cmd, text)
		local targets = self:GetTargets(ply)
		local valid = { }
		local invalid = { }
		for _index_0 = 1, #targets do
			local target = targets[_index_0]
			if target == ply or true then
				valid[#valid + 1] = target
			else
				invalid[#invalid + 1] = target
			end
		end
		local name_color = ply:getJobTable().color
		text = self:Process(ply, text)
		if not self.silent then
			ply:PlaySpeechSound(text, SNDLVL_65DB)
		end
		return Chat.Send(self.name, {
			name = ply:Name(),
			name_color = name_color,
			lang = lang,
			text = text
		}, valid)
	end
end
local Yell
do
	local _class_0
	local _parent_0 = Say
	local _base_0 = {
		name = "Yell",
		desc = "Yell something at the top of your lungs.",
		typing = "Yelling...",
		tense = "shouted",
		commands = {
			"yell",
			"y"
		},
		range = 800,
		range_muffled = 400,
		color = Color(255, 50, 50),
		color_lang = Color(255, 167, 73),
		Process = function(self, ply, text)
			text = _class_0.__parent.__base.Process(self, ply, text)
			text = string.upper(text)
			local punc = string.sub(text, string.len(text))
			if "." == punc then
				text = tostring(string.sub(text, 1, -2)) .. "!"
			elseif "?" == punc then
				text = text .. "!"
			else
				text = text .. "!"
			end
			return "<wiggle=2>" .. tostring(text) .. "</wiggle>"
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
		__name = "Yell",
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
	Yell = _class_0
end
local Whisper
do
	local _class_0
	local _parent_0 = Say
	local _base_0 = {
		name = "Whisper",
		desc = "Quietly transmit your secrets to your close ones.",
		typing = "Whispering...",
		tense = "whispered",
		silent = true,
		font = "Spleen_Chat_Small",
		commands = {
			"whisper",
			"w"
		},
		range = 150,
		range_muffled = 0,
		color = Color(151, 151, 151),
		color_lang = Color(255, 167, 73)
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
		__name = "Whisper",
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
	Whisper = _class_0
end
local Radio
do
	local _class_0
	local _parent_0 = Say
	local _base_0 = {
		name = "Radio",
		desc = "Call your squad.",
		typing = "Chattering...",
		tense = "called",
		silent = true,
		font = "Spleen_Chat_Small",
		commands = {
			"radio",
			"r"
		},
		tabs = TAB_RADIO,
		log_category = "radio",
		range = 1500,
		range_muffled = 0,
		color = Color(151, 151, 151),
		color_lang = Color(255, 167, 73)
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
		__name = "Radio",
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
	Radio = _class_0
end
if SERVER then
	Radio.Parse = function(self, ply, lang, cmd, text)
		local my_category = ply:getJobTable().category
		local valid = { }
		for _, target in pairs(player.GetAll()) do
			if not (target:getJobTable().category == my_category) then
				goto _continue_0
			end
			valid[#valid + 1] = target
			::_continue_0::
		end
		local name_color = ply:getJobTable().color
		text = self:Process(ply, text)
		return Chat.Send(self.name, {
			name = ply:Name(),
			name_color = name_color,
			lang = lang,
			text = text
		}, valid)
	end
end
local XOMBOKOM
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		level = SNDLVL_NONE,
		sound = (function()
			local _accum_0 = { }
			local _len_0 = 1
			for i = 1, 7 do
				_accum_0[_len_0] = "kidneydagger/broadcast" .. tostring(i) .. ".wav"
				_len_0 = _len_0 + 1
			end
			return _accum_0
		end)()
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
		__name = "XOMBOKOM",
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
	XOMBOKOM = _class_0
end
local Broadcast
do
	local _class_0
	local _parent_0 = CHAT_CMD_IC
	local _base_0 = {
		name = "Broadcast",
		desc = "Make them all listen.",
		typing = "Decreeing...",
		commands = {
			"broadcast",
			"ad"
		},
		color = Color(200, 0, 0),
		font = "Spleen_Chat",
		Process = function(self, ply, text)
			return Chat.Autopretty(ply, text:upper())
		end,
		Handle = function(self, ply, lang, cmd, text)
			if not (ply:Team() == TEAM_KOMMANDANT) then
				ply:Notify("<c=200,0,0>This power is NOT FOR YOU.")
				return
			end
			return _class_0.__parent.__base.Handle(self, ply, lang, cmd, text)
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
		__name = "Broadcast",
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
	Broadcast = _class_0
end
if CLIENT then
	Broadcast.OnReceive = function(self, data)
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[XOMBOKOM] <wiggle>" .. tostring(data.text)
	end
end
if SERVER then
	Broadcast.Parse = function(self, ply, lang, cmd, text)
		text = self:Process(ply, text)
		ply:EmitSound("XOMBOKOM")
		return {
			text = text
		}
	end
end
local OOC
do
	local _class_0
	local _parent_0 = CHAT_CMD
	local _base_0 = {
		name = "OOC",
		desc = "Global out-of-character chat.",
		typing = "Typing...",
		commands = {
			"ooc"
		},
		aliases = {
			"//"
		},
		tabs = TAB_OOC,
		log_category = "ooc",
		color = Color(200, 0, 0),
		font = "Spleen_Chat_Small"
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
		__name = "OOC",
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
	OOC = _class_0
end
if CLIENT then
	OOC.OnReceive = function(self, data)
		local prefix
		if data.rainbow_name then
			prefix = "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[OOC]</c> <rgb=1,13,30>" .. tostring(data.name) .. "</rgb>"
		else
			prefix = "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[OOC]</c> <c=" .. tostring(data.color) .. ">" .. tostring(data.name) .. "</c>"
		end
		return tostring(prefix) .. ": " .. tostring(data.text)
	end
end
if SERVER then
	OOC.Parse = function(self, ply, lang, cmd, text)
		local sid = ply:SteamID()
		local r = util.SharedRandom(sid, 0, 255, 1)
		local g = util.SharedRandom(sid, 0, 255, 2)
		local b = util.SharedRandom(sid, 0, 255, 3)
		local color = Color(r, g, b)
		local rainbow_name = ply:HasDonation("rainbow") and (ply:GetInfoNum("lfr_rainbow_username", 1) == 1)
		return {
			name = ply:SteamName(),
			color = color,
			text = text,
			rainbow_name = rainbow_name
		}
	end
end
local LOOC
do
	local _class_0
	local _parent_0 = CHAT_CMD
	local _base_0 = {
		name = "Local OOC",
		desc = "Local out-of-character chat.",
		typing = "Typing...",
		commands = {
			"looc"
		},
		aliases = {
			"[[",
			".//"
		},
		range = 400,
		tabs = TABS_LOOC,
		log_category = "ooc",
		color = Color(138, 185, 209),
		font = "Spleen_Chat_Small"
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
		__name = "LOOC",
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
	LOOC = _class_0
end
if CLIENT then
	LOOC.OnReceive = function(self, data)
		return "<font=" .. tostring(self.font) .. "><c=" .. tostring(self.color) .. ">[OOC-LOCAL]</c> <c=" .. tostring(data.color) .. ">" .. tostring(data.name) .. "</c>: " .. tostring(data.text)
	end
end
if SERVER then
	LOOC.Parse = function(self, ply, lang, cmd, text)
		return {
			name = ply:Name(),
			color = team.GetColor(ply:Team()),
			text = text
		}
	end
end
