local meta = FindMetaTable("Player")
if CLIENT then
	netstream.Hook("SendNotification", function(payload)
		return GAMEMODE:AddNotification(payload)
	end)
	meta.Notify = function(self, txt)
		return GAMEMODE:AddNotification(txt)
	end
end
if SERVER then
	meta.Notify = function(self, txt)
		return netstream.Send(self, "SendNotification", txt)
	end
end
