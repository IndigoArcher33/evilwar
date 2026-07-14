local EVIL_INCINERATOR_BOUNDS = {
	["rp_liverfailure_kidneydagger"] = {
		{
			Vector(2296, 2905, -125),
			Vector(2536, 2995, -307)
		}
	}
}
local next_incinerator_clear = CurTime()
local incinerator_burn
incinerator_burn = function()
	local map = game.GetMap()
	if not EVIL_INCINERATOR_BOUNDS[map] then
		return
	end
	local bounds_list = EVIL_INCINERATOR_BOUNDS[map]
	local ct = CurTime()
	if ct >= next_incinerator_clear then
		next_incinerator_clear = ct + 1
		for _index_0 = 1, #bounds_list do
			local bounds_pair = bounds_list[_index_0]
			local found = ents.FindInBox(bounds_pair[1], bounds_pair[2])
			for _index_1 = 1, #found do
				local e = found[_index_1]
				if e:GetNWBool("corpse") and not e:IsOnFire() and e:GetNWInt("decomp_stage") ~= DSTAGE_BONES then
					e:Ignite(30)
					local submitter = e:GetNWEntity("evilrp_submitter")
					if submitter and IsValid(submitter) and submitter:IsPlayer() then
						if submitter:Team() == TEAM_SANITAR then
							local cells = e:GetNWInt("sanitar_cells")
							if cells and cells > 0 then
								submitter:AddStemCells(cells)
								e:SetNWInt("sanitar_cells", 0)
							end
						end
					end
				end
			end
		end
	end
end
return hook.Add("Think", "evilrp_incinerator_burn", incinerator_burn)
