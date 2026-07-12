-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/emitters/cl_emitters.yue
GAMEMODE.CreateParticleEmitters = function(self) -- 1
	local ply = LocalPlayer() -- 2
	local pos = ply:GetPos() -- 3
	if not self.Emitter2D then -- 4
		self.Emitter2D = ParticleEmitter(pos) -- 5
	else -- 7
		self.Emitter2D:SetPos(pos) -- 7
	end -- 4
	if not self.Emitter3D then -- 9
		self.Emitter3D = ParticleEmitter(pos, true) -- 10
	else -- 12
		return self.Emitter3D:SetPos(pos) -- 12
	end -- 9
end -- 1
return hook.Add("Think", "evilrp_emitter_think", function() -- 14
	GAMEMODE:CreateParticleEmitters() -- 15
	return -- 16
end) -- 16
