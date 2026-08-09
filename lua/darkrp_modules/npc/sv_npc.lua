-- [yue]: darkrp_modules\npc\sv_npc.yue
EVIL_NEXT_NPC = 0 -- 1
local EVIL_NPC_DELAY = 40 -- 2
local EVIL_NPC_MAX = 7 -- 3
local WASTELAND_SPAWNS = { -- 5
	["rp_lymphoma"] = { -- 6
		{ -- 6
			pos = { -- 7
				Vector(3851, -8322, -9) -- 7
			}, -- 6
			cls = "evilrp_npc", -- 8
			max = 2 -- 9
		}, -- 6
		{ -- 10
			pos = { -- 11
				Vector(516, -5454, -72), -- 11
				Vector(-690, -5391, -133), -- 12
				Vector(-91, -6663, -202), -- 13
				Vector(15, -5648, -61) -- 14
			}, -- 10
			cls = "npc_antlion", -- 15
			max = 3 -- 16
		} -- 10
	} -- 5
} -- 4
return hook.Add("Think", "evilrp_npc_spawner", function() -- 20
	if CurTime() >= EVIL_NEXT_NPC then -- 21
		EVIL_NEXT_NPC = CurTime() + EVIL_NPC_DELAY + math.random(EVIL_NPC_DELAY) -- 22
		local map = game.GetMap() -- 23
		if WASTELAND_SPAWNS[map] then -- 24
			local _list_0 = WASTELAND_SPAWNS[map] -- 25
			for _index_0 = 1, #_list_0 do -- 25
				local spawn = _list_0[_index_0] -- 25
				local amt = ents.FindByClass(spawn.cls) -- 26
				if #amt < spawn.max then -- 27
					local npc = ents.Create(spawn.cls) -- 28
					npc:SetPos(spawn.pos[math.random(#spawn.pos)]) -- 30
					npc:Spawn() -- 31
					npc:Activate() -- 32
				end -- 27
			end -- 32
		end -- 24
	end -- 21
	return -- 33
end) -- 33
