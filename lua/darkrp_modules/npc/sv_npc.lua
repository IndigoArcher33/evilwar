-- [yue]: darkrp_modules\npc\sv_npc.yue
EVIL_NEXT_NPC = 0 -- 1
local EVIL_NPC_DELAY = 5 -- 2
local EVIL_NPC_MAX = 7 -- 3
EVIL_NPCS = { } -- 4
local WASTELAND_SPAWNS = { -- 6
	["rp_lymphoma"] = { -- 7
		{ -- 7
			pos = Vector(-881, -4079, -170), -- 7
			cls = "evil_npc" -- 8
		} -- 7
	} -- 6
} -- 5
return hook.Add("Think", "evilrp_npc_spawner", function() -- 12
	if CurTime() >= EVIL_NEXT_NPC then -- 13
		EVIL_NEXT_NPC = CurTime() + EVIL_NPC_DELAY + math.random(EVIL_NPC_DELAY) -- 14
		local map = game.GetMap() -- 15
		local spawns = WASTELAND_SPAWNS[map] -- 16
		if spawns then -- 17
			for _index_0 = 1, #spawns do -- 18
				local k = spawns[_index_0] -- 18
				local npc = ents.Create(k.cls) -- 19
				if IsValid(npc) then -- 20
					npc:SetPos(pos) -- 21
					npc:SetAngles(Angle(0, 0, 0)) -- 22
					npc:Spawn() -- 23
				end -- 20
			end -- 23
		end -- 17
	end -- 13
	return -- 24
end) -- 24
