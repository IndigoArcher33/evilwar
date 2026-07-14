local meta = FindMetaTable("Player")
for k, v in pairs({
	MakeWanted = function(self, dur, why)
		if CLIENT then
			return
		end
		local ct = CurTime()
		self:SetWantedSince(ct)
		self:SetWantedUntil(ct + dur)
		local _list_0 = player.GetAll()
		for _index_0 = 1, #_list_0 do
			local ply = _list_0[_index_0]
			ply:Notify("<c=200,0,0>" .. tostring(self:Name()) .. " is WANTED for " .. tostring(why) .. "!")
			local _list_1 = ents.FindByClass("terminal*")
			for _index_1 = 1, #_list_1 do
				local term = _list_1[_index_1]
				if not IsValid(term) then
					goto _continue_0
				end
				do
					local _exp_0 = term:GetOS()
					if "public" == _exp_0 then
						net.Start("evilrp_terminal_flicker")
						net.WriteUInt(16, term:EntIndex())
						net.Broadcast()
						gterm:Broadcast(term, tostring(self:Name()) .. " IS WANTED FOR " .. tostring(why:upper()) .. ".", GT_COL_ERR)
					end
				end
				::_continue_0::
			end
		end
		for i = 1, 3 do
			self:EmitSound("ambient/alarms/manhack_alert_pass1.wav", 0, math.random(60, 80))
		end
	end,
	Wanted = function(self)
		local wanted_until = self:WantedUntil()
		if wanted_until and wanted_until > 0 then
			return CurTime() <= wanted_until
		end
	end,
	MakeUnwanted = function(self)
		self:SetWantedSince(0)
		return self:SetWantedUntil(0)
	end,
	SetWantedSince = function(self, since)
		return self:SetNWFloat("evilrp_wanted_since", since)
	end,
	SetWantedUntil = function(self, dur)
		return self:SetNWFloat("evilrp_wanted_until", dur)
	end,
	WantedSince = function(self)
		return self:GetNWFloat("evilrp_wanted_since", 0)
	end,
	WantedUntil = function(self)
		return self:GetNWFloat("evilrp_wanted_until", 0)
	end,
	WantedLength = function(self)
		return self:WantedUntil() - self:WantedSince()
	end
}) do
	meta[k] = v
end
local assault_and_battery
assault_and_battery = function(ent, dmg)
	if not (ent:IsPlayer() and ent:Alive()) then
		return
	end
	local attacker = dmg:GetAttacker()
	if not (attacker and IsValid(attacker)) then
		return
	end
	if not attacker:IsPlayer() then
		return
	end
	if ent:Wanted() then
		return
	end
	if attacker:Wanted() then
		if attacker:WantedLength() <= CRIMES.assault.duration then
			return
		end
	end
	return CRIMES.assault:CommittedBy(attacker, ent)
end
return hook.Add("EntityTakeDamage", "evilrp_assault_and_battery", assault_and_battery)
