-- [yue]: darkrp_modules\constructs\sh_build.yue
if SERVER then -- 2
	return netstream.Hook("BeginBuild", function(ply) -- 3
		if not ply:CanBuild() then -- 4
			return -- 4
		end -- 4
		local ent = ents.Create("evilrp/spawned/construct") -- 5
		local money = ply:getDarkRPVar("money") -- 6
		local cost = 100 -- 7
		if money < cost then -- 8
			ply:Notify("<color=210, 0, 0>You need " .. tostring(cost) .. " bones, vagrant.</color>") -- 9
			net.Start("evilrp_frighten") -- 10
			net.Send(ply) -- 11
			ply:ConCommand("say /me grimaces.") -- 12
			ply:AddDespair(5) -- 13
			return -- 14
		end -- 8
		ent:SetPos(ply:GetPos() + (ply:GetForward() * 64)) -- 16
		ent:SetAngles(Angle(0, ply:EyeAngles().y, 0)) -- 17
		ent:Spawn() -- 18
		ent:Activate() -- 19
		DarkRP.log(tostring(ply:Nick()) .. " (" .. tostring(ply:SteamID()) .. ") placed a construct") -- 20
		ply:AddMoney(-cost, "The Plan") -- 21
		return ply:Notify("Interact to cycle the constructs.") -- 22
	end) -- 22
end -- 2
