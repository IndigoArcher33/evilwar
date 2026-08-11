-- [yue]: darkrp_modules\business\sh_plymeta.yue
local meta = FindMetaTable("Player") -- 1
for k, v in pairs({ -- 3
	CanSell = function(self) -- 3
		local job = RPExtraTeams[self:Team()] -- 4
		if job and job.can_sell then -- 5
			return true -- 6
		end -- 5
		return false -- 8
	end -- 3
}) do -- 9
	meta[k] = v -- 2
end -- 2
