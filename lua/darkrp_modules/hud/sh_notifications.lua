-- [yue]: darkrp_modules\hud\sh_notifications.yue
local meta = FindMetaTable("Player") -- 1
if CLIENT then -- 3
	netstream.Hook("SendNotification", function(payload) -- 4
		return GAMEMODE:AddNotification(payload) -- 5
	end) -- 4
	meta.Notify = function(self, txt) -- 6
		return GAMEMODE:AddNotification(txt) -- 7
	end -- 6
end -- 3
if SERVER then -- 8
	meta.Notify = function(self, txt) -- 9
		return netstream.Send(self, "SendNotification", txt) -- 10
	end -- 9
end -- 8
