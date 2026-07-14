EVIL_MACHINE_POSITIONS_CURSED = {
	["rp_liverfailure_kidneydagger"] = {
		{
			machine = {
				pos = Vector(3958, 393, 100),
				ang = Angle(0, 94, 0)
			},
			generator = {
				pos = Vector(3864, 513, 65),
				ang = Angle(0, 19, 0)
			}
		},
		{
			machine = {
				pos = Vector(3986, 4822, 101),
				ang = Angle(0, -176, 0)
			},
			generator = {
				pos = Vector(3965, 4708, 66),
				ang = Angle(0, -104, 0)
			}
		},
		{
			machine = {
				pos = Vector(2412, 3078, 148),
				ang = Angle(0, -90, 0)
			},
			generator = {
				pos = Vector(2307, 2830, 113),
				ang = Angle(-0, 135, 0)
			}
		},
		{
			machine = {
				pos = Vector(-142, 1584, 365),
				ang = Angle(-0, -91, 1)
			},
			generator = {
				pos = Vector(-14, 1617, 329),
				ang = Angle(-0, -6, -0)
			}
		},
		{
			machine = {
				pos = Vector(3584, 795, -364),
				ang = Angle(-0, 180, -0)
			},
			generator = {
				pos = Vector(3586, 843, -399),
				ang = Angle(-0, -18, 1)
			}
		},
		{
			machine = {
				pos = Vector(1977, -380, 100),
				ang = Angle(-0, -1, 1)
			},
			generator = {
				pos = Vector(2251, -374, 65),
				ang = Angle(-0, 117, -0)
			}
		}
	}
}
local create_machines_and_otherwise
create_machines_and_otherwise = function()
	local EVIL_GENERATOR_POSITIONS = {
		["rp_lymphoma"] = {
			{
				pos = Vector(-972, 1153, 1),
				ang = Angle(-0, 0, -0),
				id = "tools"
			},
			{
				pos = Vector(209, 2618, 1),
				ang = Angle(-0, -47, -0),
				id = "food"
			},
			{
				pos = Vector(256, 289, 193),
				ang = Angle(-0, 90, 0),
				id = "weapons"
			},
			{
				pos = Vector(1529, 769, 1),
				ang = Angle(-0, -0, 0),
				id = "medicine"
			},
			{
				pos = Vector(3041, 1784, -103),
				ang = Angle(8, 126, 0),
				id = "evil"
			}
		}
	}
	local EVIL_MACHINE_POSITIONS = {
		["rp_lymphoma"] = {
			{
				pos = Vector(-1104, 1264, 36),
				ang = Angle(-0, -180, 0),
				cls = "machine/tools"
			},
			{
				pos = Vector(-1104, 1461, 36),
				ang = Angle(-0, -180, 0),
				cls = "machine/tools"
			},
			{
				pos = Vector(-277, 2704, 36),
				ang = Angle(-0, -90, 0),
				cls = "machine/food"
			},
			{
				pos = Vector(-146, 2704, 36),
				ang = Angle(-0, -90, 0),
				cls = "machine/food"
			},
			{
				pos = Vector(-10, 2705, 37),
				ang = Angle(-0, -90, 0),
				cls = "machine/food"
			},
			{
				pos = Vector(592, 275, 228),
				ang = Angle(-0, -180, -0),
				cls = "machine/weapons"
			},
			{
				pos = Vector(592, 400, 228),
				ang = Angle(-0, -180, -0),
				cls = "machine/weapons"
			},
			{
				pos = Vector(1712, 736, 36),
				ang = Angle(-0, -180, 0),
				cls = "machine/medicine"
			},
			{
				pos = Vector(1712, 548, 36),
				ang = Angle(-0, -180, 0),
				cls = "machine/medicine"
			},
			{
				pos = Vector(3003, 1774, -103),
				ang = Angle(19, 173, 0),
				cls = "machine/evil"
			},
			{
				pos = Vector(323, 2401, 28),
				ang = Angle(-0, 90, 0),
				cls = "refinery"
			},
			{
				pos = Vector(323, 2147, 28),
				ang = Angle(0, 90, -0),
				cls = "refinery"
			},
			{
				pos = Vector(-354, 2399, 28),
				ang = Angle(-0, -90, -0),
				cls = "refinery"
			},
			{
				pos = Vector(-1292, 1508, 28),
				ang = Angle(0, 180, -0),
				cls = "refinery"
			}
		}
	}
	local map = game.GetMap()
	local _list_0 = ents.FindByClass("generator")
	for _index_0 = 1, #_list_0 do
		local gen = _list_0[_index_0]
		gen:Remove()
	end
	if EVIL_GENERATOR_POSITIONS[map] then
		local _list_1 = EVIL_GENERATOR_POSITIONS[map]
		for _index_0 = 1, #_list_1 do
			local v = _list_1[_index_0]
			local sp = ents.Create("generator")
			sp:SetPos(v.pos)
			sp:SetAngles(v.ang)
			sp:SetFactoryIdentifier(v.id)
			sp:Spawn()
			sp:Activate()
			sp:GetPhysicsObject():EnableMotion(false)
			MsgC(Color(0, 200, 0), tostring(sp) .. " spawned with factory identifier '", Color(200, 200, 200), v.id, Color(0, 200, 0), "'.\n")
		end
		local _list_2 = ents.FindByClass("machine/*")
		for _index_0 = 1, #_list_2 do
			local mach = _list_2[_index_0]
			mach:Remove()
		end
		local _list_3 = ents.FindByClass("refinery")
		for _index_0 = 1, #_list_3 do
			local ref = _list_3[_index_0]
			ref:Remove()
		end
		return timer.Simple(1, function()
			if EVIL_MACHINE_POSITIONS[map] then
				local _list_4 = EVIL_MACHINE_POSITIONS[map]
				for _index_0 = 1, #_list_4 do
					local v = _list_4[_index_0]
					local sp = ents.Create(v.cls)
					do
						sp:SetPos(v.pos)
						sp:SetAngles(v.ang)
						sp:Spawn()
						sp:Activate()
						local phys = sp:GetPhysicsObject()
						if IsValid(phys) then
							phys:EnableMotion(false)
						end
						MsgC(Color(0, 200, 0), tostring(sp) .. " spawned.\n")
					end
				end
			end
			if EVIL_MACHINE_POSITIONS_CURSED[map] then
				local sp = ents.Create("machine/evil")
				do
					sp:Spawn()
					sp:Activate()
					local phys = sp:GetPhysicsObject()
					if IsValid(phys) then
						phys:EnableMotion(false)
					end
					MsgC(Color(200, 0, 0), tostring(sp) .. " SPAWNED.\n")
					sp:Shift()
				end
			end
			return
		end)
	end
end
return hook.Add("InitPostEntity", "evilrp_create_machines_and_otherwise", create_machines_and_otherwise)
