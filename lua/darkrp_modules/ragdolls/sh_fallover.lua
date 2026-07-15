-- [yue]: darkrp_modules\ragdolls\sh_fallover.yue
local meta = FindMetaTable("Player") -- 4
for k, v in pairs({ -- 7
	Fallen = function(self) -- 7
		return self:GetNWBool("evilrp_fallen", false) -- 7
	end, -- 7
	SetFallen = function(self, fallen) -- 8
		return self:SetNWBool("evilrp_fallen", fallen) -- 8
	end, -- 8
	FallOver = function(self, behavior) -- 9
		if behavior == nil then -- 9
			behavior = "Falling" -- 9
		end -- 9
		self:ExitVehicle() -- 10
		self:SetNoTarget(true) -- 11
		self:SetNoDraw(true) -- 12
		if self:HasWeapon("evilrp_melee/hands") then -- 13
			self:SelectWeapon("evilrp_melee/hands") -- 13
		end -- 13
		local wep = self:GetActiveWeapon() -- 14
		self:SetNotSolid(true) -- 15
		self:SetFallen(true) -- 16
		if (wep ~= NULL) then -- 17
			if wep.SetLower then -- 18
				wep:SetNextPrimaryFire(CurTime() + .6) -- 19
				wep:SetLower(true) -- 20
			end -- 18
			wep:SetNoDraw(true) -- 21
			local rag = self:MakeRagdollClone() -- 22
			timer.Simple(0.23, function() -- 24
				if SERVER and AR_Manager then -- 25
					local controller = AR_Manager.ActiveRagdolls[rag] -- 26
					controller:ForceChangeBehavior(behavior) -- 27
					return controller:SetHealth(5) -- 28
				end -- 25
			end) -- 24
			return rag -- 29
		end -- 17
	end, -- 9
	Stand = function(self) -- 30
		self:SetNoTarget(false) -- 31
		self:SetNoDraw(false) -- 32
		self:SetNotSolid(false) -- 33
		self:SetFallen(false) -- 34
		local wep = self:GetActiveWeapon() -- 35
		if wep ~= NULL then -- 36
			wep:SetNoDraw(false) -- 37
		end -- 36
		return self:SnapFromRagdollClone() -- 38
	end -- 30
}) do -- 39
	meta[k] = v -- 6
end -- 6
local bind_fall_over -- 41
bind_fall_over = function(ply) -- 41
	if not SERVER then -- 42
		return -- 42
	end -- 42
	if not IsFirstTimePredicted() then -- 43
		return -- 43
	end -- 43
	if ply:Fallen() then -- 44
		return -- 44
	end -- 44
	return ply:FallOver() -- 45
end -- 41
return Binds.Add("FallOver", "Fall Over", "Fall over.") -- 47
