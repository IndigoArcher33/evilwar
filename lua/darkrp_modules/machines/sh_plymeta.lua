-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/machines/sh_plymeta.yue
local meta = FindMetaTable("Player") -- 1
for k, v in pairs({ -- 3
	CanUseMachines = function(self) -- 3
		return true -- 4
	end -- 3
}) do -- 5
	meta[k] = v -- 2
end -- 2
