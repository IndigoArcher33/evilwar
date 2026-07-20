-- [yue]: autorun\sh_stdlib.yue
print("IS THIS FUCKING WORKING?") -- 3
include_realm = function(file_name, realm) -- 4
	if not file_name then -- 5
		error("No file name specified for including.") -- 5
	end -- 5
	if not realm then -- 6
		if file_name:find("sv_") then -- 7
			realm = "server" -- 7
		end -- 7
		if file_name:find("sh_") then -- 8
			realm = "shared" -- 8
		end -- 8
		if file_name:find("cl_") then -- 9
			realm = "client" -- 9
		end -- 9
	end -- 6
	if "server" == realm then -- 11
		if SERVER then -- 12
			return include(file_name) -- 12
		end -- 12
	elseif "shared" == realm then -- 13
		if SERVER then -- 14
			AddCSLuaFile(file_name) -- 14
		end -- 14
		return include(file_name) -- 15
	elseif "client" == realm then -- 16
		if SERVER then -- 17
			AddCSLuaFile(file_name) -- 17
		end -- 17
		if CLIENT then -- 18
			return include(file_name) -- 18
		end -- 18
	end -- 18
end -- 4
include_dir = function(dir, from_lua) -- 21
	local base_dir = GM.FolderName -- 22
	local files = file.Find(tostring((from_lua and "" or base_dir)) .. tostring(dir) .. "/*.lua", "LUA") -- 23
	for _index_0 = 1, #files do -- 24
		local v = files[_index_0] -- 24
		include_realm(tostring(dir) .. "/" .. tostring(v)) -- 24
	end -- 24
end -- 21
