local EVIL_LOOT_POSITIONS = {
	["rp_district_slums_v2"] = {
		{
			pos = Vector(5534, 4085, 186),
			ang = Angle(0, -82, 0),
			cls = "lootable/dumpster"
		},
		{
			pos = Vector(3971, 1367, 217),
			ang = Angle(0, -6, 0),
			cls = "lootable/dumpster"
		},
		{
			pos = Vector(2524, 2740, 218),
			ang = Angle(0, -35, 0),
			cls = "lootable/dumpster"
		},
		{
			pos = Vector(1980, 5123, -70),
			ang = Angle(0, -163, 0),
			cls = "lootable/dumpster"
		},
		{
			pos = Vector(4674, 4520, 175),
			ang = Angle(0, -124, 0),
			cls = "lootable/dumpster"
		},
		{
			pos = Vector(6499, 7699, 186),
			ang = Angle(0, -19, 0),
			cls = "lootable/dumpster"
		},
		{
			pos = Vector(6926, 806, 218),
			ang = Angle(0, 93, 0),
			cls = "lootable/dumpster"
		}
	}
}
local EVIL_LOOT_REPLACEMENTS = {
	["rp_liverfailure_kidneydagger"] = {
		["models/props_junk/trashdumpster01a.mdl"] = "lootable/dumpster"
	}
}
local create_loot
create_loot = function()
	local map = game.GetMap()
	local _list_0 = ents.FindByClass("lootable/*")
	for _index_0 = 1, #_list_0 do
		local lootable = _list_0[_index_0]
		if not lootable.leave_alone then
			lootable:Remove()
		end
	end
	if EVIL_LOOT_POSITIONS[map] then
		local _list_1 = EVIL_LOOT_POSITIONS[map]
		for _index_0 = 1, #_list_1 do
			local v = _list_1[_index_0]
			local sp = ents.Create(v.cls)
			sp:SetPos(v.pos)
			sp:SetAngles(v.ang)
			sp:Spawn()
			sp:Activate()
			sp:GetPhysicsObject():EnableMotion(false)
		end
	end
	if EVIL_LOOT_REPLACEMENTS[map] then
		local _list_1 = ents.FindByClass("prop_dynamic")
		for _index_0 = 1, #_list_1 do
			local e = _list_1[_index_0]
			local replacement = EVIL_LOOT_REPLACEMENTS[map][e:GetModel()]
			if replacement then
				local sp = ents.Create(replacement)
				sp:SetPos(e:GetPos())
				sp:SetAngles(e:GetAngles())
				e:Remove()
				sp:Spawn()
				sp:Activate()
				sp:GetPhysicsObject():EnableMotion(false)
				sp.leave_alone = true
			end
		end
	end
	return
end
return hook.Add("InitPostEntity", "evilrp_create_loot", create_loot)
