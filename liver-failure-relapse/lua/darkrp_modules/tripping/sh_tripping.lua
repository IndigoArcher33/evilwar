-- ---@diagnostic disable: inject-field

-- local TRIP_FORWARD_DISTANCE = 25                                                                                           -- how far ahead to check
-- local TRIP_COOLDOWN         = CreateConVar("player_trip_cooldown", "4", { FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY }) -- trip cooldown (0 is most likely infinite)
-- local TRIP_DURATION         = CreateConVar("player_trip_duration", "3", { FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY }) -- how long should player stay ragdolled
-- local TRIP_GETUP_ANYTIME    = CreateConVar("player_trip_getup_anytime", "0",
--     { FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY })
-- local TRIP_GETUP_ANY_KEY    = CreateConVar("player_trip_getup_any_key", "0",
--     { FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY })
-- local TRIP_GETUP_DELAY      = CreateConVar("player_trip_getup_delay", "2.0",
--     { FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY })

-- if SERVER then
--     util.AddNetworkString("PlayerTrip_Sync")

--     local RequireSprinting = CreateConVar("player_trip_require_sprint", "1",
--         { FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED })
--     local TripOverAnything = CreateConVar("player_trip_on_anything", "0",
--         { FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED })
--     local TripChance = CreateConVar("player_trip_chance", "1.0",
--         { FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED })
--     local RandomTripEnabled = CreateConVar("player_randomtrip_enabled", "0",
--         { FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED })
--     local RandomTripChance = CreateConVar("player_randomtrip_chance", "0.02",
--         { FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED })
--     local RandomTripMinSpeed = CreateConVar("player_randomtrip_minspeed", "300",
--         { FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED })

--     local coolDowns = {}
--     local randomTripCooldowns = {}
--     local getupCooldowns = {}
--     local activeRagdolls = {}
--     local tripWhitelist = {
--         "prop_physics",
--         "prop_ragdoll"
--     }

--     local function UnragdollPlayer(ply)
--         if not IsValid(ply) or not ply:Alive() then return end

--         local ragdoll = activeRagdolls[ply]
--         if IsValid(ragdoll) then
--             local pos = ragdoll:GetPos()
--             local tr = util.TraceLine({
--                 start = pos + Vector(0, 0, 10),
--                 endpos = pos - Vector(0, 0, 50),
--                 filter = { ply, ragdoll }
--             })

--             ply:UnSpectate()
--             ply:UnLock()
--             ply:Spawn()
--             ply:StripWeapons()

--             ply:SetPos(tr.HitPos + Vector(0, 0, 5))
--             ply:SetVelocity(Vector(0, 0, 0))

--             ---@cast ply Player
--             if ragdoll.SavedWeapons then
--                 for _, wepData in ipairs(ragdoll.SavedWeapons) do
--                     local wep = ply:Give(wepData.class)
--                     if IsValid(wep) then
--                         wep:SetClip1(wepData.clip1)
--                         wep:SetClip2(wepData.clip2)
--                     end
--                 end
--             end

--             ragdoll:Remove()
--         end

--         activeRagdolls[ply] = nil
--         ply:SetNWBool("IsTrippedRagdoll", false)
--     end

--     --- @param ply Player
--     local function TripPlayer(ply, velocity)
--         if coolDowns[ply] and coolDowns[ply] > CurTime() then return end
--         if activeRagdolls[ply] then return end

--         getupCooldowns[ply] = CurTime() + TRIP_GETUP_DELAY:GetFloat()
--         coolDowns[ply] = CurTime() + TRIP_COOLDOWN:GetFloat()

--         local ragdoll = ents.Create("prop_ragdoll")
--         ragdoll:SetModel(ply:GetModel() or "")
--         ragdoll:SetPos(ply:GetPos())
--         ragdoll:SetAngles(ply:GetAngles())
--         ragdoll:SetSkin(ply:GetSkin())

--         for k, v in pairs(ply:GetBodyGroups()) do
--             ragdoll:SetBodygroup(v.id, ply:GetBodygroup(v.id))
--         end

--         ragdoll:Spawn()
--         ragdoll:Activate()

--         local physCount = ragdoll:GetPhysicsObjectCount()
--         for i = 0, physCount - 1 do
--             local phys = ragdoll:GetPhysicsObjectNum(i)
--             if IsValid(phys) then
--                 phys:SetVelocity(velocity * 1.2 + Vector(0, 0, 50))
--             end
--         end

--         for i = 1, ragdoll:GetPhysicsObjectCount() do
--             local bone = ragdoll:GetPhysicsObjectNum(i - 1)
--             if IsValid(bone) then
--                 boneId = ragdoll:TranslatePhysBoneToBone(i - 1)
--                 local pos, ang = ply:GetBonePosition(boneId)
--                 if pos then
--                     bone:SetPos(pos)
--                     bone:SetAngles(ang)
--                     bone:Wake()
--                 end
--             end
--         end

--         local savedWeps = {}
--         for _, wep in ipairs(ply:GetWeapons()) do
--             if IsValid(wep) then
--                 table.insert(savedWeps, {
--                     class = wep:GetClass(),
--                     clip1 = wep:Clip1(),
--                     clip2 = wep:Clip2()
--                 })
--             end
--         end
--         ragdoll.SavedWeapons = savedWeps

--         ply:Spectate(OBS_MODE_CHASE) -- ply starts spectating
--         ply:SpectateEntity(ragdoll)  -- spectate ragdoll

--         ply:SetNWBool("IsTrippedRagdoll", true)
--         ply:SetNWEntity("TripRagdollEnt", ragdoll)

--         activeRagdolls[ply] = ragdoll

--         ragdoll.WakeTime = CurTime() + TRIP_DURATION:GetFloat()
--     end

--     hook.Add("KeyPress", "TripGetupKey", function(ply, key)
--         if not ply:IsPlayer() or not ply:Alive() or not ply:GetNWBool("IsTrippedRagdoll") then return end

--         local canGetup = false
--         if TRIP_GETUP_ANYTIME:GetBool() and key == IN_JUMP then
--             canGetup = true
--         elseif TRIP_GETUP_ANYTIME:GetBool() and TRIP_GETUP_ANY_KEY:GetBool() then
--             canGetup = true
--         end

--         if canGetup then
--             local readyTime = getupCooldowns[ply] or 0
--             if CurTime() >= readyTime then
--                 UnragdollPlayer(ply)
--             end
--         end
--     end)



--     hook.Add("Tick", "TripRagdollGroundCheck", function()
--         for ply, ragdoll in pairs(activeRagdolls) do
--             if IsValid(ply) and IsValid(ragdoll) then
--                 if ragdoll.WakeTime and CurTime() >= ragdoll.WakeTime and not TRIP_GETUP_ANYTIME:GetBool() then
--                     local pelvisPhys = ragdoll:GetPhysicsObjectNum(0)
--                     if IsValid(pelvisPhys) then
--                         local isSettled = pelvisPhys:GetVelocity():Length() < 15

--                         local inWater = ragdoll:WaterLevel() > 0

--                         local waterCheck = util.TraceLine({
--                             start = ragdoll:WorldSpaceCenter(),
--                             endpos = ragdoll:WorldSpaceCenter() + Vector(0, 0, 20),
--                             filter = ragdoll,
--                             mask = MASK_WATER
--                         })

--                         local fullySubmerged = waterCheck.Hit and waterCheck.MatType == MAT_SLOSH
--                         local groundCheck = util.TraceLine({
--                             start = ragdoll:WorldSpaceCenter(),
--                             endpos = ragdoll:WorldSpaceCenter() - Vector(0, 0, 30),
--                             filter = ragdoll
--                         })

--                         -- settled on ground, in water, or fully submerged
--                         if (isSettled or inWater or fullySubmerged) and groundCheck.Hit then
--                             UnragdollPlayer(ply)
--                         elseif inWater and not groundCheck.Hit then
--                             -- deep water, still unragdoll after a short delay
--                             if ragdoll.WaterTimer == nil then
--                                 ragdoll.WaterTimer = CurTime() + 1.5
--                             elseif CurTime() >= ragdoll.WaterTimer then
--                                 UnragdollPlayer(ply)
--                             end
--                         end
--                     end
--                 end
--             elseif not IsValid(ragdoll) and IsValid(ply) then
--                 UnragdollPlayer(ply)
--             end
--         end
--     end)

--     hook.Add("PlayerTick", "PlayerTripCheck", function(ply, mv)
--         if not ply:Alive() or ply:InVehicle() or ply:GetMoveType() == MOVETYPE_NOCLIP then return end
--         if ply:GetNWBool("IsTrippedRagdoll") then return end

--         local vel = ply:GetVelocity()
--         local speed = vel:Length()

--         if speed > 400 then
--             local eyeAngles = ply:EyeAngles()
--             eyeAngles.p = 0
--             local forward = eyeAngles:Forward()

--             local isAirborne = true
--             local startPos = ply:GetPos() + Vector(0, 0, isAirborne and 5 or 15)
--             local endPos = startPos + (forward * (TRIP_FORWARD_DISTANCE + 5))

--             -- using hull will make wider prediction, no sliding past objects
--             local tr = util.TraceHull({
--                 start = startPos,
--                 endpos = endPos,
--                 mins = Vector(-10, -10, -5),
--                 maxs = Vector(10, 10, 5),
--                 filter = ply
--             })

--             if tr.Hit and not tr.HitWorld then
--                 local targetEntity = tr.Entity

--                 if targetEntity and IsValid(targetEntity) and not targetEntity:IsWorld() then
--                     local meetsSprint = not RequireSprinting:GetBool() or ply:IsSprinting()
--                     local meetsWhitelist = TripOverAnything:GetBool() or
--                         table.HasValue(tripWhitelist, targetEntity and targetEntity:GetClass() or "")

--                     if meetsSprint and meetsWhitelist then
--                         if math.random() < TripChance:GetFloat() then
--                             TripPlayer(ply, vel)
--                         end
--                     end
--                 end
--             end
--         end
--     end)

--     -- any disconnecting, get rid of player active ragdoll
--     hook.Add("PlayerDisconnected", "TripCleanup", function(ply)
--         if IsValid(activeRagdolls[ply]) then
--             activeRagdolls[ply]:Remove()
--         end
--         coolDowns[ply] = nil
--         randomTripCooldowns[ply] = nil
--         getupCooldowns[ply] = nil
--     end)

--     hook.Add("DoPlayerDeath", "TripRagdollDeath", function(ply, attacker, dmg)
--         if activeRagdolls[ply] then
--             local ragdoll = activeRagdolls[ply]

--             if IsValid(ragdoll) then
--                 ragdoll:Remove()
--             end

--             activeRagdolls[ply] = nil
--             ply:SetNWBool("IsTrippedRagdoll", false)
--             ply:SetNWEntity("TripRagdollEnt", NULL)
--         end
--     end)

--     hook.Add("Move", "PlayerRandomTripCheck", function(ply, mv)
--         if not ply:Alive() or ply:InVehicle() or ply:GetMoveType() == MOVETYPE_NOCLIP then return end
--         if ply:GetNWBool("IsTrippedRagdoll") then return end
--         if not ply:IsSprinting() then return end
--         if not RandomTripEnabled:GetBool() then return end

--         local vel = ply:GetVelocity()
--         local speed = vel:Length2D()
--         local minSpeed = RandomTripMinSpeed:GetFloat()

--         if speed > minSpeed then
--             if randomTripCooldowns[ply] and randomTripCooldowns[ply] > CurTime() then return end
--             local rand = math.random()

--             if rand < RandomTripChance:GetFloat() then
--                 TripPlayer(ply, vel)
--             end

--             --TODO: Make sure this never goes inside the rand < randomChance.float
--             --TODO: it will run 200 times a second till you trip
--             randomTripCooldowns[ply] = CurTime() + TRIP_COOLDOWN:GetFloat() + 5
--         end
--     end)
-- end

-- if CLIENT then
--     local FIRST_PERSON_VISION = CreateClientConVar("player_trip_firstperson_view", "0", true)

--     hook.Add("CalcView", "PlayerTripView", function(ply, pos, angles, fov)
--         if ply:GetNWBool("IsTrippedRagdoll") and (IsValid(ply:GetViewEntity()) and ply:GetViewEntity() == ply) then
--             local ragdoll = ply:GetNWEntity("TripRagdollEnt")
--             ply:DrawViewModel(false)

--             if IsValid(ragdoll) then
--                 local attachmentIndex = ragdoll:LookupAttachment("eyes")
--                 local attach = ragdoll:GetAttachment(attachmentIndex)

--                 -- viewing pos set that
--                 local viewPos = pos
--                 local viewAng = angles

--                 if attach then
--                     viewPos = attach.Pos
--                     viewAng = attach.Ang
--                 else
--                     -- bone bih
--                     local boneIndex = ragdoll:LookupBone("ValveBiped.Bip01_Head1")
--                     if boneIndex then
--                         viewPos, viewAng = ragdoll:GetBonePosition(boneIndex)
--                     end
--                 end

--                 if FIRST_PERSON_VISION:GetBool() then
--                     return {
--                         origin = viewPos + viewAng:Forward() * 3,
--                         angles = viewAng,
--                         fov = fov,
--                         drawviewer = false
--                     }
--                 else
--                     local traceData = {
--                         start = viewPos,
--                         endpos = viewPos - (angles:Forward() * 100) + Vector(0, 0, 10),
--                         filter = { ply, ragdoll }
--                     }
--                     local tr = util.TraceLine(traceData)

--                     return {
--                         origin = tr.HitPos + tr.HitNormal * 5,
--                         angles = angles,
--                         fov = fov,
--                         drawviewer = true,
--                     }
--                 end
--             end
--         else
--             ply:DrawViewModel(true)
--         end
--     end)
-- end
