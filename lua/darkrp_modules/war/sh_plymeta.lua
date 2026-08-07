-- [yue]: darkrp_modules\machines\sh_plymeta.yue
local meta = FindMetaTable("Player") -- 1
for k, v in pairs({ -- 3
	CanUseMachines = function(self) -- 3
		local job = RPExtraTeams[self:Team()] -- 4
		if job and job.use_machines then -- 5
			return true -- 6
		end -- 5
		return false -- 8
	end -- 3
}) do -- 9
	meta[k] = v -- 2
end -- 2
