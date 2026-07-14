GAMEMODE.CreateParticleEmitters = function(self)
	local ply = LocalPlayer()
	local pos = ply:GetPos()
	if not self.Emitter2D then
		self.Emitter2D = ParticleEmitter(pos)
	else
		self.Emitter2D:SetPos(pos)
	end
	if not self.Emitter3D then
		self.Emitter3D = ParticleEmitter(pos, true)
	else
		return self.Emitter3D:SetPos(pos)
	end
end
return hook.Add("Think", "evilrp_emitter_think", function()
	GAMEMODE:CreateParticleEmitters()
	return
end)
