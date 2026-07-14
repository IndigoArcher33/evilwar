local smite_dmg_range = {
	35,
	100
}
GAMEMODE.LightningStrike = function(self, origin, dest)
	if SERVER then
		local tr = util.TraceHull({
			start = origin,
			endpos = dest
		})
		local edata = EffectData()
		local world = Entity(0)
		local start = util.QuickTrace(tr.HitPos, (tr.HitNormal + Vector(0, 0, 2)):GetNormalized() * 9999, tr.Entity).HitPos
		edata:SetStart(start)
		edata:SetOrigin(tr.HitPos)
		util.Effect("ffvlightningbolt", edata, true, true)
		if tr.HitNonWorld and tr.Hit then
			local victim = tr.Entity
			local dmg = DamageInfo()
			dmg:SetDamage(math.random(smite_dmg_range[1], smite_dmg_range[2]))
			dmg:SetDamageType(DMG_SHOCK)
			dmg:SetInflictor(world)
			dmg:SetAttacker(world)
			if IsValid(victim) then
				victim:TakeDamageInfo(dmg)
			end
			timer.Simple(1, function()
				if not (victim and IsValid(victim) and victim:IsPlayer() and not victim:Alive()) then
					return
				end
				local rag = victim:Ragdoll()
				if not (rag and IsValid(rag)) then
					return
				end
				return rag:Fire("StartRagdollBoogie")
			end)
		end
		if tr.Hit then
			if (not tr.Entity:IsPlayer()) or (not tr.Entity:Alive()) then
				util.BlastDamage(world, world, tr.HitPos, 200, 80)
			end
		end
		return edata
	end
end
GAMEMODE.LightningPunish = function(self, ply)
	local where = ply:EyePos()
	return self:LightningStrike(where, where)
end
if SERVER then
	util.AddNetworkString("evilrp_smite")
	net.Receive("evilrp_smite", function(len, ply)
		if not ply:IsAdmin() then
			return
		end
		local victim = net.ReadEntity()
		if not (victim and IsValid(victim)) then
			return
		end
		local where = victim:EyePos()
		return GAMEMODE:LightningStrike(where, where)
	end)
end
local smite
smite = function(ply, cmd, args)
	if ply:EntIndex() ~= 0 and not ply:IsAdmin() then
		return
	end
	if #args > 0 then
		local victim = GAMEMODE:FindPlayer(args[1])
		if not (victim and IsValid(victim) and victim:IsPlayer() and victim:Alive()) then
			MsgC(Color(200, 0, 0), "No living victim was found by that name.\n")
			return
		end
		if SERVER then
			local where = victim:EyePos()
			GAMEMODE:LightningStrike(where, where)
			return MsgC(Color(200, 200, 0), tostring(victim:Nick()) .. " was struck by lightning.\n")
		else
			net.Start("evilrp_smite")
			net.WriteEntity(victim)
			return net.SendToServer()
		end
	elseif (ply:EntIndex() ~= 0) then
		local tr = GAMEMODE:GetHandTrace(ply, 4096)
		local victim = tr.Entity
		if not (victim and IsValid(victim)) then
			ply:Notify("<c=200,0,0>I'm not targeting something worth the punishment.")
			return
		end
		net.Start("evilrp_smite")
		net.WriteEntity(victim)
		return net.SendToServer()
	end
end
return concommand.Add("smite", smite)
