-- [yue]: darkrp_modules\fleshbox\sv_spawn.yue
EVIL_NEXT_BOX = 0 -- 1
local EVIL_BOX_DELAY = 30 -- 2
local EVIL_BOX_MAX = 3 -- 3
EVIL_BOX = { } -- 4
local EVIL_BOX_POSITIONS = { -- 6
	["rp_lymphoma"] = { -- 7
		Vector(-1454, -2295, -829), -- 7
		Vector(-876, -2461, -754), -- 8
		Vector(-1165, -2813, -830) -- 9
	} -- 6
} -- 5
return hook.Add("Think", "evilrp_box_spawner", function() -- 13
	if CurTime() >= EVIL_NEXT_BOX then -- 14
		EVIL_NEXT_BOX = CurTime() + EVIL_BOX_DELAY + math.random(EVIL_BOX_DELAY) -- 15
		local boxes = ents.FindByClass("fleshbox") -- 16
		if #boxes < EVIL_BOX_MAX then -- 17
			local positions = EVIL_BOX_POSITIONS[game.GetMap()] -- 18
			local pos = positions[math.random(#positions)] -- 19
			local box = ents.Create("fleshbox") -- 20
			box:SetPos(pos) -- 22
			box:Spawn() -- 23
			box:Activate() -- 24
			box:GetPhysicsObject():EnableMotion(false) -- 25
		end -- 17
	end -- 14
	return -- 26
end) -- 26
