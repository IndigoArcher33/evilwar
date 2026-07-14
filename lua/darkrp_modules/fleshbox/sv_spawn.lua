EVIL_NEXT_BOX = 0
local EVIL_BOX_DELAY = 30
local EVIL_BOX_MAX = 3
EVIL_BOX = { }
local EVIL_BOX_POSITIONS = {
	["rp_lymphoma"] = {
		Vector(-1454, -2295, -829),
		Vector(-876, -2461, -754),
		Vector(-1165, -2813, -830)
	}
}
return hook.Add("Think", "evilrp_box_spawner", function()
	if CurTime() >= EVIL_NEXT_BOX then
		EVIL_NEXT_BOX = CurTime() + EVIL_BOX_DELAY + math.random(EVIL_BOX_DELAY)
		local boxes = ents.FindByClass("fleshbox")
		if #boxes < EVIL_BOX_MAX then
			local positions = EVIL_BOX_POSITIONS[game.GetMap()]
			local pos = positions[math.random(#positions)]
			local box = ents.Create("fleshbox")
			box:SetPos(pos)
			box:Spawn()
			box:Activate()
			box:GetPhysicsObject():EnableMotion(false)
		end
	end
	return
end)
