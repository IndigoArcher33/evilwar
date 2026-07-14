local create_autostitchers
create_autostitchers = function()
	local EVIL_AUTOSTITCHER_POSITIONS = {
		["rp_liverfailure_kidneydagger"] = {
			{
				pos = Vector(-2200, 2233, 162),
				ang = Angle(0, 90, 0)
			},
			{
				pos = Vector(2570, 2233, 163),
				ang = Angle(0, 90, 0)
			},
			{
				pos = Vector(2625, 2468, 282),
				ang = Angle(-90, 0, 180)
			},
			{
				pos = Vector(2241, 2465, 282),
				ang = Angle(-90, 0, 180)
			},
			{
				pos = Vector(-1426, 1919, -72),
				ang = Angle(0, 0, 0)
			}
		},
		["rp_lymphoma"] = {
			{
				pos = Vector(1099, 795, 56),
				ang = Angle(0, -90, 0)
			},
			{
				pos = Vector(1219, 795, 56),
				ang = Angle(0, -90, 0)
			},
			{
				pos = Vector(1328, 795, 56),
				ang = Angle(0, -90, 0)
			}
		}
	}
	local map = game.GetMap()
	if EVIL_AUTOSTITCHER_POSITIONS[map] then
		local _list_0 = EVIL_AUTOSTITCHER_POSITIONS[map]
		for _index_0 = 1, #_list_0 do
			local v = _list_0[_index_0]
			local sp = ents.Create("autostitcher")
			sp:SetPos(v.pos)
			sp:SetAngles(v.ang)
			sp:Spawn()
			sp:Activate()
			sp:GetPhysicsObject():EnableMotion(false)
		end
	end
	return
end
return hook.Add("InitPostEntity", "evilrp_create_autostitchers", create_autostitchers)
