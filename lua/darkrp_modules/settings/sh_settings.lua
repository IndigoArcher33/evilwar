Settings = { }
Settings.list = { }
if CLIENT then
	local _obj_0 = Settings
	_obj_0.cache = _obj_0.cache or { }
	if not sql.TableExists("evilrp_settings") then
		sql.Query("CREATE TABLE evilrp_settings (key TEXT NOT NULL PRIMARY KEY, value TEXT NOT NULL)")
	end
end
local meta = FindMetaTable("Player")
