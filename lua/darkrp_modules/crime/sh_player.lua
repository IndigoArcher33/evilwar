-- [yue]: darkrp_modules\crime\sh_player.yue
local meta = FindMetaTable("Player") -- 1
for k, v in pairs({ -- 4
	MakeWanted = function(self, dur, why) -- 4
		if CLIENT then -- 5
			return -- 5
		end -- 5
		local ct = CurTime() -- 6
		self:SetWantedSince(ct) -- 7
		self:SetWantedUntil(ct + dur) -- 8
		local _list_0 = player.GetAll() -- 9
		for _index_0 = 1, #_list_0 do -- 9
			local ply = _list_0[_index_0] -- 9
			Chat.Announce("GENERIC", "<c=230,0,0>" .. tostring(self:Name()) .. " is WANTED for " .. tostring(why) .. "!") -- 10
			local _list_1 = ents.FindByClass("terminal*") -- 11
			for _index_1 = 1, #_list_1 do -- 11
				local term = _list_1[_index_1] -- 11
				local _continue_0 = false -- 12
				repeat -- 12
					if not IsValid(term) then -- 12
						_continue_0 = true -- 12
						break -- 12
					end -- 12
					do -- 13
						local _exp_0 = term:GetOS() -- 13
						if "public" == _exp_0 then -- 14
							net.Start("evilrp_terminal_flicker") -- 15
							net.WriteUInt(16, term:EntIndex()) -- 16
							net.Broadcast() -- 17
							gterm:Broadcast(term, tostring(self:Name()) .. " IS WANTED FOR " .. tostring(why:upper()) .. ".", GT_COL_ERR) -- 18
						end -- 18
					end -- 18
					_continue_0 = true -- 12
				until true -- 18
				if not _continue_0 then -- 18
					break -- 18
				end -- 18
			end -- 18
		end -- 18
		for i = 1, 3 do -- 19
			self:EmitSound("ambient/alarms/manhack_alert_pass1.wav", 0, math.random(60, 80)) -- 19
		end -- 19
	end, -- 4
	Wanted = function(self) -- 20
		local wanted_until = self:WantedUntil() -- 21
		if wanted_until and wanted_until > 0 then -- 22
			return CurTime() <= wanted_until -- 23
		end -- 22
	end, -- 20
	MakeUnwanted = function(self) -- 24
		self:SetWantedSince(0) -- 25
		return self:SetWantedUntil(0) -- 26
	end, -- 24
	SetWantedSince = function(self, since) -- 27
		return self:SetNWFloat("evilrp_wanted_since", since) -- 27
	end, -- 27
	SetWantedUntil = function(self, dur) -- 28
		return self:SetNWFloat("evilrp_wanted_until", dur) -- 28
	end, -- 28
	WantedSince = function(self) -- 29
		return self:GetNWFloat("evilrp_wanted_since", 0) -- 29
	end, -- 29
	WantedUntil = function(self) -- 30
		return self:GetNWFloat("evilrp_wanted_until", 0) -- 30
	end, -- 30
	WantedLength = function(self) -- 31
		return self:WantedUntil() - self:WantedSince() -- 31
	end -- 31
}) do -- 32
	meta[k] = v -- 3
end -- 3
