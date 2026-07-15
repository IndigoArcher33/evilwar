-- [yue]: darkrp_modules\settings\sh_settings.yue
Settings = { } -- 1
Settings.list = { } -- 3
if CLIENT then -- 7
	local _obj_0 = Settings -- 8
	_obj_0.cache = _obj_0.cache or { } -- 8
	if not sql.TableExists("evilrp_settings") then -- 9
		sql.Query("CREATE TABLE evilrp_settings (key TEXT NOT NULL PRIMARY KEY, value TEXT NOT NULL)") -- 10
	end -- 9
end -- 7
local meta = FindMetaTable("Player") -- 12
