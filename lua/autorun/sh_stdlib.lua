-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/autorun/sh_stdlib.yue
include_realm = function(file_name, realm) -- 2
	if not file_name then -- 3
		error("No file name specified for including.") -- 3
	end -- 3
	if not realm then -- 4
		if file_name:find("sv_") then -- 5
			realm = "server" -- 5
		end -- 5
		if file_name:find("sh_") then -- 6
			realm = "shared" -- 6
		end -- 6
		if file_name:find("cl_") then -- 7
			realm = "client" -- 7
		end -- 7
	end -- 4
	if "server" == realm then -- 9
		if SERVER then -- 10
			return include(file_name) -- 10
		end -- 10
	elseif "shared" == realm then -- 11
		if SERVER then -- 12
			AddCSLuaFile(file_name) -- 12
		end -- 12
		return include(file_name) -- 13
	elseif "client" == realm then -- 14
		if SERVER then -- 15
			AddCSLuaFile(file_name) -- 15
		end -- 15
		if CLIENT then -- 16
			return include(file_name) -- 16
		end -- 16
	end -- 16
end -- 2
include_dir = function(dir, from_lua) -- 19
	local base_dir = GM.FolderName -- 20
	local files = file.Find(tostring((from_lua and "" or base_dir)) .. tostring(dir) .. "/*.lua", "LUA") -- 21
	for _index_0 = 1, #files do -- 22
		local v = files[_index_0] -- 22
		include_realm(tostring(dir) .. "/" .. tostring(v)) -- 22
	end -- 22
end -- 19
