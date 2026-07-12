-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/fire/sv_incinerator.yue
local EVIL_INCINERATOR_BOUNDS = { -- 2
	["rp_liverfailure_kidneydagger"] = { -- 3
		{ -- 3
			Vector(2296, 2905, -125), -- 3
			Vector(2536, 2995, -307) -- 3
		} -- 3
	} -- 2
} -- 1
local next_incinerator_clear = CurTime() -- 6
local incinerator_burn -- 7
incinerator_burn = function() -- 7
	local map = game.GetMap() -- 8
	if not EVIL_INCINERATOR_BOUNDS[map] then -- 9
		return -- 9
	end -- 9
	local bounds_list = EVIL_INCINERATOR_BOUNDS[map] -- 10
	local ct = CurTime() -- 11
	if ct >= next_incinerator_clear then -- 12
		next_incinerator_clear = ct + 1 -- 13
		for _index_0 = 1, #bounds_list do -- 14
			local bounds_pair = bounds_list[_index_0] -- 14
			local found = ents.FindInBox(bounds_pair[1], bounds_pair[2]) -- 15
			for _index_1 = 1, #found do -- 16
				local e = found[_index_1] -- 16
				if e:GetNWBool("corpse") and not e:IsOnFire() and e:GetNWInt("decomp_stage") ~= DSTAGE_BONES then -- 17
					e:Ignite(30) -- 18
					local submitter = e:GetNWEntity("evilrp_submitter") -- 19
					if submitter and IsValid(submitter) and submitter:IsPlayer() then -- 20
						if submitter:Team() == TEAM_SANITAR then -- 21
							local cells = e:GetNWInt("sanitar_cells") -- 22
							if cells and cells > 0 then -- 23
								submitter:AddStemCells(cells) -- 24
								e:SetNWInt("sanitar_cells", 0) -- 25
							end -- 23
						end -- 21
					end -- 20
				end -- 17
			end -- 25
		end -- 25
	end -- 12
end -- 7
return hook.Add("Think", "evilrp_incinerator_burn", incinerator_burn) -- 27
