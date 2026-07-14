local max, min, random = math.max, math.min, math.random
local gibs = {
	"models/gibs/humans/mgib_01.mdl",
	"models/gibs/humans/mgib_02.mdl",
	"models/gibs/humans/mgib_03.mdl",
	"models/gibs/humans/mgib_04.mdl",
	"models/gibs/humans/mgib_05.mdl",
	"models/gibs/humans/mgib_06.mdl",
	"models/gibs/humans/mgib_07.mdl"
}
local corpse_submitted
corpse_submitted = function(self)
	local pos = self:GetPos()
	for i = 1, #gibs do
		local gib = ents.Create("gib")
		gib:SetModel(gibs[i])
		gib:SetPos(pos)
		gib:SetCollisionGroup(COLLISION_GROUP_NONE)
		gib:SetMoveType(MOVETYPE_VPHYSICS)
		gib:Spawn()
		SafeRemoveEntityDelayed(gib, math.random(5, 10))
	end
end
local corpse_submitted_fleshy
corpse_submitted_fleshy = function(self)
	self:EmitSound("Submit_Flesh")
	return corpse_submitted(body)
end
local corpse_think
corpse_think = function()
	local ct = CurTime()
	local _list_0 = ents.FindByClass("prop_ragdoll")
	for _index_0 = 1, #_list_0 do
		local corpse = _list_0[_index_0]
		if not corpse:GetNWBool("corpse") then
			goto _continue_0
		end
		local ply = corpse:GetNWEntity("player")
		if ply and IsValid(ply) and not ply:Alive() then
			ply:SetPos(corpse:GetPos())
			local jt = ply:getJobTable()
			if jt.instant_respawn then
				if ct >= (corpse:GetNWInt("decomp_start") + 15) then
					local pos = corpse:GetPos() + Vector(0, 0, 10)
					ply:changeTeam(TEAM_GHOST)
					ply:Spawn()
					ply:SetPos(pos)
				end
			end
		end
		if ct >= corpse:GetNWInt("decomp_finish") then
			local od = corpse:GetNWInt("decomp_stage")
			local decomp = min(4, corpse:GetNWInt("decomp_stage") + 1)
			corpse:SetNWInt("decomp_finish", math.huge)
			if decomp > od then
				local new = ents.Create("prop_ragdoll")
				new.HUDRender = hud_render_ragdoll
				new:SetPos(corpse:GetPos())
				new:SetAngles(corpse:GetAngles())
				new.Precursor = {
					biomass = 5 - decomp
				}
				if DSTAGE_EARLY == decomp then
					new:SetModel("models/player/zombie_fast.mdl")
					new.Submitted = corpse_submitted_fleshy
				elseif DSTAGE_BLACK == decomp then
					new:SetModel("models/player/charple.mdl")
					new.Submitted = corpse_submitted_fleshy
				elseif DSTAGE_BONES == decomp then
					new:SetModel("models/player/skeleton.mdl")
					new.Submitted = corpse_submitted
				end
				if corpse:GetNWBool("headless") then
					local bidx = new:LookupBone("ValveBiped.Bip01_Head1")
					new:ManipulateBoneScale(bidx, Vector(0, 0, 0))
					new:SetNWBool("headless", true)
				end
				new:SetNWString("body_name", corpse:GetNWString("body_name"))
				do
					new:Spawn()
					new:Activate()
					new:SetCollisionGroup(COLLISION_GROUP_WEAPON)
					new:SetNWInt("decomp_start", ct)
					new:SetNWInt("decomp_finish", ct + 120)
					new:SetNWInt("decomp_stage", decomp)
					new:SetNWBool("harvested", corpse:GetNWBool("harvested"))
					new:SetNWBool("molested", corpse:GetNWBool("molested"))
					local cells = math.abs(corpse:GetNWInt("sanitar_cells", 0) - 1)
					if decomp == DSTAGE_BONES then
						cells = 0
					end
					new:SetNWBool("sanitar_cells", cells)
					new:SetNWBool("corpse", true)
					new:SetNWBool("alive", false)
					new:EmitSound("ambient/creatures/flies" .. tostring(random(1, 5)) .. ".wav")
				end
				local num = new:GetPhysicsObjectCount() - 1
				local ve = corpse:GetVelocity()
				for i = 0, num do
					local bone = new:GetPhysicsObjectNum(i)
					if IsValid(bone) then
						local bp, ba = corpse:GetBonePosition(new:TranslatePhysBoneToBone(i))
						if bp and ba then
							bone:SetPos(bp)
							bone:SetAngles(ba)
						end
					end
				end
				new:SetVelocity(ve)
				if corpse:IsOnFire() then
					new:Ignite(math.random(10, 20))
				end
				local submitter = corpse:GetNWEntity("evilrp_submitter")
				if submitter and submitter:IsValid() and corpse:IsPlayerHolding() then
					submitter:PickupObject(new)
				end
				local cply = corpse:GetNWEntity("player")
				if cply then
					new:SetNWEntity("player", cply)
					if IsValid(cply) and cply:IsPlayer() then
						cply:SetNWEntity("ragdoll", new)
					end
				end
				if decomp == 2 and cply:IsValid() and (not cply:Alive()) then
					cply:Spawn()
					cply:changeTeam(TEAM_GHOST)
					cply:SetPos(corpse:GetPos() + Vector(0, 0, 10))
					cply:Freeze(true)
					timer.Simple(0.1, function()
						if IsValid(cply) then
							return cply:PlaySignal(ACT_HL2MP_ZOMBIE_SLUMP_RISE, true)
						end
					end)
					timer.Simple(3, function()
						if IsValid(cply) then
							return cply:Freeze(false)
						end
					end)
				end
				corpse:Remove()
			end
		end
		::_continue_0::
	end
	return
end
hook.Add("Think", "evilrp_decomposition", corpse_think)
GAMEMODE.DoPlayerDeath = function(self) end
