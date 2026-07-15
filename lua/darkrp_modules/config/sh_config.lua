-- [yue]: darkrp_modules\config\sh_config.yue
Config = { } -- 1
Config.Get = function(key) -- 5
	local config = (GM or GAMEMODE).Config -- 6
	return config[key] -- 7
end -- 5
Config.Fallback = function(key, value) -- 9
	local config = (GM or GAMEMODE).Config -- 10
	if config[key] == nil then -- 11
		config[key] = value -- 11
	end -- 11
end -- 9
game.GetMapOverride = function() -- 13
	local map = game.GetMap() -- 14
	local config = Config.Get("MapOverrides") -- 15
	while config[map] do -- 16
		map = config[map] -- 16
	end -- 16
	return map -- 17
end -- 13
