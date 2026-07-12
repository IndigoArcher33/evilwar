-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/lightning/sh_lightning.yue
local smite_dmg_range = { -- 1
	35, -- 1
	100 -- 1
} -- 1
GAMEMODE.LightningStrike = function(self, origin, dest) -- 3
	if SERVER then -- 4
		local tr = util.TraceHull({ -- 6
			start = origin, -- 6
			endpos = dest -- 7
		}) -- 5
		local edata = EffectData() -- 9
		local world = Entity(0) -- 10
		local start = util.QuickTrace(tr.HitPos, (tr.HitNormal + Vector(0, 0, 2)):GetNormalized() * 9999, tr.Entity).HitPos -- 14
		edata:SetStart(start) -- 15
		edata:SetOrigin(tr.HitPos) -- 16
		util.Effect("ffvlightningbolt", edata, true, true) -- 17
		if tr.HitNonWorld and tr.Hit then -- 18
			local victim = tr.Entity -- 19
			local dmg = DamageInfo() -- 20
			dmg:SetDamage(math.random(smite_dmg_range[1], smite_dmg_range[2])) -- 22
			dmg:SetDamageType(DMG_SHOCK) -- 23
			dmg:SetInflictor(world) -- 24
			dmg:SetAttacker(world) -- 25
			if IsValid(victim) then -- 26
				victim:TakeDamageInfo(dmg) -- 26
			end -- 26
			timer.Simple(1, function() -- 27
				if not (victim and IsValid(victim) and victim:IsPlayer() and not victim:Alive()) then -- 28
					return -- 28
				end -- 28
				local rag = victim:Ragdoll() -- 29
				if not (rag and IsValid(rag)) then -- 30
					return -- 30
				end -- 30
				return rag:Fire("StartRagdollBoogie") -- 31
			end) -- 27
		end -- 18
		if tr.Hit then -- 33
			if (not tr.Entity:IsPlayer()) or (not tr.Entity:Alive()) then -- 34
				util.BlastDamage(world, world, tr.HitPos, 200, 80) -- 35
			end -- 34
		end -- 33
		return edata -- 11
	end -- 4
end -- 3
GAMEMODE.LightningPunish = function(self, ply) -- 38
	local where = ply:EyePos() -- 39
	return self:LightningStrike(where, where) -- 40
end -- 38
if SERVER then -- 42
	util.AddNetworkString("evilrp_smite") -- 43
	net.Receive("evilrp_smite", function(len, ply) -- 44
		if not ply:IsAdmin() then -- 45
			return -- 45
		end -- 45
		local victim = net.ReadEntity() -- 46
		if not (victim and IsValid(victim)) then -- 47
			return -- 47
		end -- 47
		local where = victim:EyePos() -- 48
		return GAMEMODE:LightningStrike(where, where) -- 49
	end) -- 44
end -- 42
local smite -- 51
smite = function(ply, cmd, args) -- 51
	if ply:EntIndex() ~= 0 and not ply:IsAdmin() then -- 52
		return -- 52
	end -- 52
	if #args > 0 then -- 53
		local victim = GAMEMODE:FindPlayer(args[1]) -- 54
		if not (victim and IsValid(victim) and victim:IsPlayer() and victim:Alive()) then -- 55
			MsgC(Color(200, 0, 0), "No living victim was found by that name.\n") -- 56
			return -- 57
		end -- 55
		if SERVER then -- 58
			local where = victim:EyePos() -- 59
			GAMEMODE:LightningStrike(where, where) -- 60
			return MsgC(Color(200, 200, 0), tostring(victim:Nick()) .. " was struck by lightning.\n") -- 61
		else -- 63
			net.Start("evilrp_smite") -- 63
			net.WriteEntity(victim) -- 64
			return net.SendToServer() -- 65
		end -- 58
	elseif (ply:EntIndex() ~= 0) then -- 66
		local tr = GAMEMODE:GetHandTrace(ply, 4096) -- 67
		local victim = tr.Entity -- 68
		if not (victim and IsValid(victim)) then -- 69
			ply:Notify("<c=200,0,0>I'm not targeting something worth the punishment.") -- 70
			return -- 71
		end -- 69
		net.Start("evilrp_smite") -- 72
		net.WriteEntity(victim) -- 73
		return net.SendToServer() -- 74
	end -- 53
end -- 51
return concommand.Add("smite", smite) -- 75
