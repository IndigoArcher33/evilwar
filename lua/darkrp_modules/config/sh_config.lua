Config = { }
Config.Get = function(key)
	local config = (GM or GAMEMODE).Config
	return config[key]
end
Config.Fallback = function(key, value)
	local config = (GM or GAMEMODE).Config
	if config[key] == nil then
		config[key] = value
	end
end
game.GetMapOverride = function()
	local map = game.GetMap()
	local config = Config.Get("MapOverrides")
	while config[map] do
		map = config[map]
	end
	return map
end
