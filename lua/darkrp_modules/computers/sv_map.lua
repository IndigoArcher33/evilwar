local create_computers
create_computers = function()
	local EVIL_COMPUTER_POSITIONS = {
		["rp_lymphoma"] = {
			{
				pos = Vector(486, 910, 261),
				ang = Angle(1, 112, -0),
				cls = "terminal/xombokom"
			},
			{
				pos = Vector(242, 225, 68),
				ang = Angle(0, -0, 0),
				cls = "terminal/public"
			},
			{
				pos = Vector(242, 352, 68),
				ang = Angle(0, -0, 0),
				cls = "terminal/public"
			}
		}
	}
	local map = game.GetMap()
	local _list_0 = ents.FindByClass("terminal*")
	for _index_0 = 1, #_list_0 do
		local computer = _list_0[_index_0]
		computer:Remove()
	end
	if EVIL_COMPUTER_POSITIONS[map] then
		local _list_1 = EVIL_COMPUTER_POSITIONS[map]
		for _index_0 = 1, #_list_1 do
			local v = _list_1[_index_0]
			local sp = ents.Create(v.cls)
			sp:SetPos(v.pos)
			sp:SetAngles(v.ang)
			sp:Spawn()
			sp:Activate()
			sp:GetPhysicsObject():EnableMotion(false)
			MsgC(Color(0, 200, 200), tostring(sp) .. " created.\n")
		end
	end
	return
end
return hook.Add("InitPostEntity", "evilrp_create_computers", create_computers)
