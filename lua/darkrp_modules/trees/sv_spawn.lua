-- [yue]: darkrp_modules\trees\sv_spawn.yue
EVIL_NEXT_TREE = 0 -- 1
local EVIL_TREE_DELAY = 40 -- 2
local EVIL_TREE_MAX = 7 -- 3
EVIL_TREES = { } -- 4
local EVIL_TREE_POSITIONS = { -- 6
	["rp_liverfailure_kidneydagger"] = { -- 7
		Vector(2549, -349, 72), -- 7
		Vector(2600, -119, 72), -- 8
		Vector(1528, 1183, -143), -- 9
		Vector(2768, 2075, -143), -- 10
		Vector(2090, 2067, -143), -- 11
		Vector(1540, 776, -143), -- 12
		Vector(255, 3507, 49), -- 13
		Vector(95, 3403, 49), -- 14
		Vector(3, 3538, 49), -- 15
		Vector(-154, 3459, 49) -- 16
	}, -- 6
	["rp_lymphoma"] = { -- 19
		Vector(237, -2625, -176), -- 19
		Vector(731, -3127, -128), -- 20
		Vector(531, -3652, -119), -- 21
		Vector(20, -4488, -220), -- 22
		Vector(-881, -4079, -170), -- 23
		Vector(-631, -3275, -213), -- 24
		Vector(261, 1893, -79), -- 25
		Vector(343, 1862, -79), -- 26
		Vector(-197, 1973, -79), -- 27
		Vector(-242, 1874, -79), -- 28
		Vector(-322, 1898, -79) -- 29
	} -- 18
} -- 5
return hook.Add("Think", "evilrp_tree_spawner", function() -- 34
	if CurTime() >= EVIL_NEXT_TREE then -- 35
		EVIL_NEXT_TREE = CurTime() + EVIL_TREE_DELAY + math.random(EVIL_TREE_DELAY) -- 36
		local trees = ents.FindByClass("tree") -- 37
		if #trees < EVIL_TREE_MAX then -- 38
			local positions = EVIL_TREE_POSITIONS[game.GetMap()] -- 39
			local pos = positions[math.random(#positions)] -- 40
			local tree = ents.Create("tree") -- 41
			tree:SetPos(pos) -- 43
			tree:Spawn() -- 44
			tree:Activate() -- 45
			tree:GetPhysicsObject():EnableMotion(false) -- 46
		end -- 38
	end -- 35
	return -- 47
end) -- 47
