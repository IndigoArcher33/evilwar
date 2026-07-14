-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/autorun/sh_binds.yue
Binds = { -- 3
	list = { } -- 3
} -- 2
KEYMODE_HOLD = 1 -- 6
KEYMODE_TOGGLE = 2 -- 7
KEYMODE_SMART = 3 -- 8
Binds.Add = function(index, name, default, callback, hint) -- 10
	Binds.list[index] = { -- 11
		setting = default, -- 11
		callback = callback, -- 11
		default = default -- 11
	} -- 11
end -- 10
