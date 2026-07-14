local meta = FindMetaTable("Player")
for k, v in pairs({
	Fallen = function(self)
		return self:GetNWBool("evilrp_fallen", false)
	end,
	SetFallen = function(self, fallen)
		return self:SetNWBool("evilrp_fallen", fallen)
	end,
	FallOver = function(self, behavior)
		if behavior == nil then
			behavior = "Falling"
		end
		self:ExitVehicle()
		self:SetNoTarget(true)
		self:SetNoDraw(true)
		if self:HasWeapon("evilrp_melee/hands") then
			self:SelectWeapon("evilrp_melee/hands")
		end
		local wep = self:GetActiveWeapon()
		self:SetNotSolid(true)
		self:SetFallen(true)
		if (wep ~= NULL) then
			if wep.SetLower then
				wep:SetNextPrimaryFire(CurTime() + .6)
				wep:SetLower(true)
			end
			wep:SetNoDraw(true)
			local rag = self:MakeRagdollClone()
			timer.Simple(0.23, function()
				if SERVER and AR_Manager then
					local controller = AR_Manager.ActiveRagdolls[rag]
					controller:ForceChangeBehavior(behavior)
					return controller:SetHealth(5)
				end
			end)
			return rag
		end
	end,
	Stand = function(self)
		self:SetNoTarget(false)
		self:SetNoDraw(false)
		self:SetNotSolid(false)
		self:SetFallen(false)
		local wep = self:GetActiveWeapon()
		if wep ~= NULL then
			wep:SetNoDraw(false)
		end
		return self:SnapFromRagdollClone()
	end
}) do
	meta[k] = v
end
local bind_fall_over
bind_fall_over = function(ply)
	if not SERVER then
		return
	end
	if not IsFirstTimePredicted() then
		return
	end
	if ply:Fallen() then
		return
	end
	return ply:FallOver()
end
return Binds.Add("FallOver", "Fall Over", "Fall over.")
