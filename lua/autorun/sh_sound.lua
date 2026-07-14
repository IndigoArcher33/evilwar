-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/autorun/sh_sound.yue
local PrecacheSound = util.PrecacheSound -- 1
SNDLVL_NONE = 0 -- 4
SNDLVL_20dB = 20 -- 5
SNDLVL_25dB = 25 -- 6
SNDLVL_30dB = 30 -- 7
SNDLVL_35dB = 35 -- 8
SNDLVL_40dB = 40 -- 9
SNDLVL_45dB = 45 -- 10
SNDLVL_50dB = 50 -- 11
SNDLVL_55dB = 55 -- 12
SNDLVL_IDLE = 60 -- 13
SNDLVL_60dB = 60 -- 14
SNDLVL_65dB = 65 -- 15
SNDLVL_STATIC = 66 -- 16
SNDLVL_70dB = 70 -- 17
SNDLVL_NORM = 75 -- 18
SNDLVL_75dB = 75 -- 19
SNDLVL_80dB = 80 -- 20
SNDLVL_TALKING = 80 -- 21
SNDLVL_85dB = 85 -- 22
SNDLVL_90dB = 90 -- 23
SNDLVL_95dB = 95 -- 24
SNDLVL_100dB = 100 -- 25
SNDLVL_105dB = 105 -- 26
SNDLVL_110dB = 110 -- 27
SNDLVL_120dB = 120 -- 28
SNDLVL_130dB = 130 -- 29
SNDLVL_GUNFIRE = 140 -- 30
SNDLVL_140dB = 140 -- 31
SNDLVL_150dB = 150 -- 32
SNDLVL_180dB = 180 -- 33
do -- 35
	local _class_0 -- 35
	local _base_0 = { -- 35
		channel = CHAN_AUTO, -- 53
		level = SNDLVL_NORM, -- 54
		volume = 1, -- 55
		pitch = { -- 55
			95, -- 55
			105 -- 55
		}, -- 56
		sound = { } -- 35
	} -- 35
	if _base_0.__index == nil then -- 35
		_base_0.__index = _base_0 -- 35
	end -- 56
	_class_0 = setmetatable({ -- 35
		__init = function(self, where) end, -- 35
		__base = _base_0, -- 35
		__name = "SOUND" -- 35
	}, { -- 35
		__index = _base_0, -- 35
		__call = function(cls, ...) -- 35
			local _self_0 = setmetatable({ }, _base_0) -- 35
			cls.__init(_self_0, ...) -- 35
			return _self_0 -- 35
		end -- 35
	}) -- 35
	_base_0.__class = _class_0 -- 35
	local self = _class_0; -- 35
	self.__inherited = function(self, child) -- 36
		local snd = { -- 38
			name = child.__name -- 38
		} -- 37
		local ancestor = child -- 39
		while ancestor do -- 40
			for k, v in pairs(ancestor.__base) do -- 41
				local _continue_0 = false -- 42
				repeat -- 42
					if string.sub(k, 1, 2) == "__" then -- 42
						_continue_0 = true -- 42
						break -- 42
					end -- 42
					if not snd[k] then -- 43
						snd[k] = v -- 43
					end -- 43
					_continue_0 = true -- 42
				until true -- 43
				if not _continue_0 then -- 43
					break -- 43
				end -- 43
			end -- 43
			if not ancestor.__parent then -- 44
				break -- 44
			end -- 44
			ancestor = ancestor.__parent -- 45
		end -- 45
		if istable(snd.sound) then -- 46
			local _list_0 = snd.sound -- 47
			for _index_0 = 1, #_list_0 do -- 47
				local s = _list_0[_index_0] -- 47
				PrecacheSound(s) -- 47
			end -- 47
		else -- 49
			PrecacheSound(snd.sound) -- 49
		end -- 46
		return sound.Add(snd) -- 50
	end -- 36
	SOUND = _class_0 -- 35
end -- 56
local loaded_sounds -- 58
if CLIENT then -- 59
	loaded_sounds = { } -- 59
end -- 59
PlaySoundGlobal = function(file_name) -- 60
	local sound -- 61
	local filter -- 62
	if SERVER then -- 63
		filter = RecipientFilter() -- 64
		filter:AddAllPlayers() -- 65
	end -- 63
	if SERVER or not loaded_sounds[file_name] then -- 66
		sound = CreateSound(game.GetWorld(), file_name, filter) -- 69
		if sound then -- 70
			sound:SetSoundLevel(0) -- 71
			if CLIENT then -- 72
				loaded_sounds[file_name] = { -- 73
					sound, -- 73
					filter -- 73
				} -- 73
			end -- 72
		end -- 70
	else -- 75
		sound = loaded_sounds[file_name][1] -- 75
		filter = loaded_sounds[file_name][2] -- 76
	end -- 66
	if sound then -- 77
		if CLIENT then -- 78
			sound:Stop() -- 78
		end -- 78
		sound:Play() -- 79
	end -- 77
	return sound -- 80
end -- 60
