-- [yue]: darkrp_modules\ragdolls\sv_think.yue
local max, min, random = math.max, math.min, math.random -- 1
local gibs = { -- 3
	"models/gibs/humans/mgib_01.mdl", -- 3
	"models/gibs/humans/mgib_02.mdl", -- 4
	"models/gibs/humans/mgib_03.mdl", -- 5
	"models/gibs/humans/mgib_04.mdl", -- 6
	"models/gibs/humans/mgib_05.mdl", -- 7
	"models/gibs/humans/mgib_06.mdl", -- 8
	"models/gibs/humans/mgib_07.mdl" -- 9
} -- 3
local corpse_submitted -- 11
corpse_submitted = function(self) -- 11
	local pos = self:GetPos() -- 12
	for i = 1, #gibs do -- 13
		local gib = ents.Create("gib") -- 14
		gib:SetModel(gibs[i]) -- 16
		gib:SetPos(pos) -- 17
		gib:SetCollisionGroup(COLLISION_GROUP_NONE) -- 18
		gib:SetMoveType(MOVETYPE_VPHYSICS) -- 19
		gib:Spawn() -- 20
		SafeRemoveEntityDelayed(gib, math.random(5, 10)) -- 21
	end -- 21
end -- 11
local corpse_submitted_fleshy -- 23
corpse_submitted_fleshy = function(self) -- 23
	self:EmitSound("Submit_Flesh") -- 24
	return corpse_submitted(body) -- 25
end -- 23
local corpse_think -- 27
corpse_think = function() -- 27
	local ct = CurTime() -- 28
	local _list_0 = ents.FindByClass("prop_ragdoll") -- 29
	for _index_0 = 1, #_list_0 do -- 29
		local corpse = _list_0[_index_0] -- 29
		local _continue_0 = false -- 30
		repeat -- 30
			if not corpse:GetNWBool("corpse") then -- 30
				_continue_0 = true -- 30
				break -- 30
			end -- 30
			local ply = corpse:GetNWEntity("player") -- 31
			if ply and IsValid(ply) and not ply:Alive() then -- 32
				ply:SetPos(corpse:GetPos()) -- 33
				local jt = ply:getJobTable() -- 34
				if jt.instant_respawn then -- 35
					if ct >= (corpse:GetNWInt("decomp_start") + 15) then -- 36
						local pos = corpse:GetPos() + Vector(0, 0, 10) -- 37
						ply:changeTeam(TEAM_GHOST) -- 38
						ply:Spawn() -- 39
						ply:SetPos(pos) -- 40
					end -- 36
				end -- 35
			end -- 32
			if ct >= corpse:GetNWInt("decomp_finish") then -- 41
				local od = corpse:GetNWInt("decomp_stage") -- 42
				local decomp = min(4, corpse:GetNWInt("decomp_stage") + 1) -- 43
				corpse:SetNWInt("decomp_finish", math.huge) -- 44
				if decomp > od then -- 45
					local new = ents.Create("prop_ragdoll") -- 46
					new.HUDRender = hud_render_ragdoll -- 47
					new:SetPos(corpse:GetPos()) -- 49
					new:SetAngles(corpse:GetAngles()) -- 50
					new.Precursor = { -- 52
						biomass = 5 - decomp -- 52
					} -- 51
					if DSTAGE_EARLY == decomp then -- 54
						new:SetModel("models/player/zombie_fast.mdl") -- 55
						new.Submitted = corpse_submitted_fleshy -- 56
					elseif DSTAGE_BLACK == decomp then -- 58
						new:SetModel("models/player/charple.mdl") -- 59
						new.Submitted = corpse_submitted_fleshy -- 60
					elseif DSTAGE_BONES == decomp then -- 61
						new:SetModel("models/player/skeleton.mdl") -- 62
						new.Submitted = corpse_submitted -- 63
					end -- 63
					if corpse:GetNWBool("headless") then -- 64
						local bidx = new:LookupBone("ValveBiped.Bip01_Head1") -- 65
						new:ManipulateBoneScale(bidx, Vector(0, 0, 0)) -- 66
						new:SetNWBool("headless", true) -- 67
					end -- 64
					new:SetNWString("body_name", corpse:GetNWString("body_name")) -- 68
					do -- 69
						new:Spawn() -- 70
						new:Activate() -- 71
						new:SetCollisionGroup(COLLISION_GROUP_WEAPON) -- 72
						new:SetNWInt("decomp_start", ct) -- 73
						new:SetNWInt("decomp_finish", ct + 120) -- 74
						new:SetNWInt("decomp_stage", decomp) -- 75
						new:SetNWBool("harvested", corpse:GetNWBool("harvested")) -- 76
						new:SetNWBool("molested", corpse:GetNWBool("molested")) -- 77
						local cells = math.abs(corpse:GetNWInt("sanitar_cells", 0) - 1) -- 78
						if decomp == DSTAGE_BONES then -- 79
							cells = 0 -- 79
						end -- 79
						new:SetNWBool("sanitar_cells", cells) -- 80
						new:SetNWBool("corpse", true) -- 81
						new:SetNWBool("alive", false) -- 82
						new:EmitSound("ambient/creatures/flies" .. tostring(random(1, 5)) .. ".wav") -- 83
					end -- 69
					local num = new:GetPhysicsObjectCount() - 1 -- 85
					local ve = corpse:GetVelocity() -- 86
					for i = 0, num do -- 87
						local bone = new:GetPhysicsObjectNum(i) -- 88
						if IsValid(bone) then -- 89
							local bp, ba = corpse:GetBonePosition(new:TranslatePhysBoneToBone(i)) -- 90
							if bp and ba then -- 91
								bone:SetPos(bp) -- 92
								bone:SetAngles(ba) -- 93
							end -- 91
						end -- 89
					end -- 93
					new:SetVelocity(ve) -- 96
					if corpse:IsOnFire() then -- 97
						new:Ignite(math.random(10, 20)) -- 97
					end -- 97
					local submitter = corpse:GetNWEntity("evilrp_submitter") -- 98
					if submitter and submitter:IsValid() and corpse:IsPlayerHolding() then -- 99
						submitter:PickupObject(new) -- 100
					end -- 99
					local cply = corpse:GetNWEntity("player") -- 102
					if cply then -- 103
						new:SetNWEntity("player", cply) -- 104
						if IsValid(cply) and cply:IsPlayer() then -- 105
							cply:SetNWEntity("ragdoll", new) -- 106
						end -- 105
					end -- 103
					if decomp == 2 and cply:IsValid() and (not cply:Alive()) then -- 107
						cply:Spawn() -- 108
						cply:changeTeam(TEAM_GHOST) -- 109
						cply:SetPos(corpse:GetPos() + Vector(0, 0, 10)) -- 110
						cply:Freeze(true) -- 111
						timer.Simple(0.1, function() -- 112
							if IsValid(cply) then -- 113
								return cply:PlaySignal(ACT_HL2MP_ZOMBIE_SLUMP_RISE, true) -- 113
							end -- 113
						end) -- 112
						timer.Simple(3, function() -- 114
							if IsValid(cply) then -- 114
								return cply:Freeze(false) -- 114
							end -- 114
						end) -- 114
					end -- 107
					corpse:Remove() -- 115
				end -- 45
			end -- 41
			_continue_0 = true -- 30
		until true -- 115
		if not _continue_0 then -- 115
			break -- 115
		end -- 115
	end -- 115
	return -- 116
end -- 27
hook.Add("Think", "evilrp_decomposition", corpse_think) -- 118
GAMEMODE.DoPlayerDeath = function(self) end -- 120
