-- [yue]: darkrp_modules\trees\sv_spawn.yue
EVIL_NEXT_TREE = 0 -- 1
local EVIL_TREE_DELAY = 15 -- 2
local EVIL_TREE_MAX = 5 -- 3
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
		Vector(-631, -3275, -213) -- 24
	} -- 18
} -- 5
return hook.Add("Think", "evilrp_tree_spawner", function() -- 28
	if CurTime() >= EVIL_NEXT_TREE then -- 29
		EVIL_NEXT_TREE = CurTime() + EVIL_TREE_DELAY + math.random(EVIL_TREE_DELAY) -- 30
		local trees = ents.FindByClass("tree") -- 31
		if #trees < EVIL_TREE_MAX then -- 32
			local positions = EVIL_TREE_POSITIONS[game.GetMap()] -- 33
			local pos = positions[math.random(#positions)] -- 34
			local tree = ents.Create("tree") -- 35
			tree:SetPos(pos) -- 37
			tree:Spawn() -- 38
			tree:Activate() -- 39
			tree:GetPhysicsObject():EnableMotion(false) -- 40
		end -- 32
	end -- 29
	return -- 41
end) -- 41
