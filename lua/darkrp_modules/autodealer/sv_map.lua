local create_autodealers
create_autodealers = function()
	local EVIL_AUTODEALER_POSITIONS = {
		["rp_lymphoma"] = {
			{
				pos = Vector(233, 1002, 253),
				ang = Angle(0, 0, 0)
			},
			{
				pos = Vector(600, 353, 49),
				ang = Angle(0, -180, -0)
			},
			{
				pos = Vector(1088, 505, 46),
				ang = Angle(0, 90, 0)
			}
		}
	}
	local map = game.GetMap()
	if EVIL_AUTODEALER_POSITIONS[map] then
		local _list_0 = EVIL_AUTODEALER_POSITIONS[map]
		for _index_0 = 1, #_list_0 do
			local v = _list_0[_index_0]
			local sp = ents.Create("autodealer")
			sp:SetPos(v.pos)
			sp:SetAngles(v.ang)
			sp:Spawn()
			sp:Activate()
			sp:GetPhysicsObject():EnableMotion(false)
		end
	end
	return
end
return hook.Add("InitPostEntity", "evilrp_create_autodealers", create_autodealers)
