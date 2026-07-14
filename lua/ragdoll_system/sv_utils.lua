function RagdollSys.PlayHeadshotSound(pos)
    if not GetConVar("ar_headshotSfx"):GetBool() then return end
    if not pos then return end
    local chosenSound = table.Random(RagdollSys.HeadshotSounds)
    sound.Play(chosenSound, pos, 75, 100, 1)
end

function RagdollSys.GetBoneTransform(ent, boneName)
    local boneID = ent:LookupBone(boneName)
    if not boneID then return nil end
    
    local bonePos, boneAng = ent:GetBonePosition(boneID)
    if not bonePos then return nil end
    
    return bonePos, boneAng
end

function RagdollSys.IsHeadshot(ent, dmgpos, hitgroup)
    if hitgroup == HITGROUP_HEAD then return true end
    if not IsValid(ent) or not dmgpos or dmgpos == Vector(0, 0, 0) then return false end

    local boneID = ent:LookupBone("ValveBiped.Bip01_Head1")
    if not boneID then return false end
    
    local headPos, headAng = ent:GetBonePosition(boneID)
    if not headPos then return false end

    local centerPos = headPos + (headAng:Forward() * RagdollSys.Config.HeadOffset.x) 
                              + (headAng:Right() * RagdollSys.Config.HeadOffset.y) 
                              + (headAng:Up() * RagdollSys.Config.HeadOffset.z)

    local distSqr = centerPos:DistToSqr(dmgpos)
    local radiusSqr = RagdollSys.Config.HeadRadius * RagdollSys.Config.HeadRadius

    local isHit = distSqr <= radiusSqr
    return isHit
end