EVIL_NEXT_TREE = 0
local EVIL_TREE_DELAY = 15
local EVIL_TREE_MAX = 5
EVIL_TREES = { }
local EVIL_TREE_POSITIONS = {
	["rp_liverfailure_kidneydagger"] = {
		Vector(2549, -349, 72),
		Vector(2600, -119, 72),
		Vector(1528, 1183, -143),
		Vector(2768, 2075, -143),
		Vector(2090, 2067, -143),
		Vector(1540, 776, -143),
		Vector(255, 3507, 49),
		Vector(95, 3403, 49),
		Vector(3, 3538, 49),
		Vector(-154, 3459, 49)
	},
	["rp_lymphoma"] = {
		Vector(237, -2625, -176),
		Vector(731, -3127, -128),
		Vector(531, -3652, -119),
		Vector(20, -4488, -220),
		Vector(-881, -4079, -170),
		Vector(-631, -3275, -213)
	}
}
return hook.Add("Think", "evilrp_tree_spawner", function()
	if CurTime() >= EVIL_NEXT_TREE then
		EVIL_NEXT_TREE = CurTime() + EVIL_TREE_DELAY + math.random(EVIL_TREE_DELAY)
		local trees = ents.FindByClass("tree")
		if #trees < EVIL_TREE_MAX then
			local positions = EVIL_TREE_POSITIONS[game.GetMap()]
			local pos = positions[math.random(#positions)]
			local tree = ents.Create("tree")
			tree:SetPos(pos)
			tree:Spawn()
			tree:Activate()
			tree:GetPhysicsObject():EnableMotion(false)
		end
	end
	return
end)
