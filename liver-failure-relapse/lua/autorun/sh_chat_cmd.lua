-- [yue]: /home/corpse/gmodserver/garrysmod/addons/darkrpmodification/lua/autorun/sh_chat_cmd.yue
local _class_0 -- 1
local _base_0 = { -- 1
	name = "unnamed command", -- 15
	desc = "no description set", -- 16
	typing = nil, -- 17
	radio = false, -- 19
	commands = { }, -- 20
	aliases = { }, -- 22
	use_language = false, -- 23
	hearable = false, -- 24
	cast = false, -- 26
	range = nil, -- 27
	range_muffled = nil, -- 29
	tabs = nil, -- 30
	log_category = nil, -- 32
	sound = nil, -- 34
	OnReceive = function(self, data) end, -- 35
	GetTargets = function(self, ply, data) -- 35
		local targets = { -- 36
			ply -- 36
		} -- 36
		local glob = true -- 37
		if self.range or self.range_muffled then -- 39
			glob = false -- 40
		end -- 39
		targets = table.Add(targets, Chat.GetTargets(ply:EyePos(), self.range or 0, self.range_muffled or 0, self.hearable)) -- 41
		if self.cast then -- 42
			glob = false -- 43
			targets = table.Add(targets, Chat.GetTargets(ply:GetEyeTrace().HitPos, self.range or 0, self.range_muffled or 0, self.hearable)) -- 44
		end -- 42
		return glob and player.GetAll() or table.Unique(targets) -- 45
	end, -- 47
	Parse = function(self, ply, lang, cmd, text) -- 47
		return true -- 47
	end, -- 49
	Handle = function(self, ply, lang, cmd, text) -- 49
		text = string.Escape(string.sub(text, 1, 500)) -- 51
		if self.use_language then -- 53
			if false and not lang then -- 55
				ply:SendChat("ERROR", "You cannot speak.") -- 56
				return -- 57
			elseif false and not hook.Run("CanSpeakLanguage", ply, lang) then -- 58
				ply:SendChat("ERROR", "You don't speak this language.") -- 59
				return -- 60
			end -- 55
		end -- 53
		local data = self:Parse(ply, lang, cmd, text) -- 61
		if data == nil then -- 62
			return -- 62
		end -- 62
		data.__type = self.name -- 63
		return netstream.Send(self:GetTargets(ply, data), "SendChat", data) -- 65
	end, -- 67
	WriteLog = function(self, data, ply) end -- 1
} -- 1
if _base_0.__index == nil then -- 1
	_base_0.__index = _base_0 -- 1
end -- 67
_class_0 = setmetatable({ -- 1
	__init = function() end, -- 1
	__base = _base_0, -- 1
	__name = "CHAT_CMD" -- 1
}, { -- 1
	__index = _base_0, -- 1
	__call = function(cls, ...) -- 1
		local _self_0 = setmetatable({ }, _base_0) -- 1
		cls.__init(_self_0, ...) -- 1
		return _self_0 -- 1
	end -- 1
}) -- 1
_base_0.__class = _class_0 -- 1
local self = _class_0; -- 1
self.__inherited = function(self, child) -- 2
	Chat.list[child.name] = child -- 3
	if child.commands then -- 4
		local _list_0 = child.commands -- 5
		for _index_0 = 1, #_list_0 do -- 5
			local name = _list_0[_index_0] -- 5
			Chat.commands[name] = child -- 5
		end -- 5
	end -- 4
	if child.aliases then -- 6
		local _list_0 = child.aliases -- 7
		for _index_0 = 1, #_list_0 do -- 7
			local alias = _list_0[_index_0] -- 7
			Chat.aliases[alias] = child.commands[1] -- 7
		end -- 7
	end -- 6
end -- 2
CHAT_CMD = _class_0 -- 1
