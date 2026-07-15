-- [yue]: darkrp_modules\disabling\sv_disabling.yue
local meta = FindMetaTable("Player") -- 1
for k, v in pairs({ -- 5
	payDay = function(self) -- 5
		return false -- 5
	end -- 5
}) do -- 6
	meta[k] = v -- 3
end -- 3
