-- [yue]: darkrp_modules\camera\cl_legs.yue
if not CLIENT then -- 4
	return -- 4
end -- 4
local hidden_bones = { -- 7
	"ValveBiped.Bip01_Head1", -- 7
	"ValveBiped.Bip01_Neck1", -- 8
	"ValveBiped.Bip01_Spine4" -- 9
} -- 6
if IsValid(lp) and lp.legs then -- 50
	lp.legs:Remove() -- 50
end -- 50
local render_legs_in_screenspace -- 52
render_legs_in_screenspace = function() -- 52
	if not IsValid(lp) then -- 53
		return -- 53
	end -- 53
	if not lp:Alive() then -- 54
		return -- 54
	end -- 54
	if lp:ShouldDrawLocalPlayer() then -- 55
		return -- 55
	end -- 55
	local angs = lp:EyeAngles() -- 56
	if angs.p < 0 then -- 58
		return -- 58
	end -- 58
	cam.Start3D(EyePos(), EyeAngles()) -- 59
	if not IsValid(lp.legs) then -- 60
		lp:SpawnLegs() -- 60
	end -- 60
	local real_time = RealTime() -- 62
	local legs = lp.legs -- 63
	angs.p = 0 -- 65
	angs.r = 0 -- 66
	local rad_angle = math.rad(angs.y) -- 68
	local offset = -15 -- 69
	local origin = lp:GetPos() -- 70
	origin.x = origin.x + (math.cos(rad_angle) * offset) -- 72
	origin.y = origin.y + (math.sin(rad_angle) * offset) -- 73
	do -- 75
		legs:SetPoseParameter("move_yaw", 360 * lp:GetPoseParameter("move_yaw") - 180) -- 76
		legs:SetPoseParameter("move_x", lp:GetPoseParameter("move_x") * 2 - 1) -- 77
		legs:SetPoseParameter("move_y", lp:GetPoseParameter("move_y") * 2 - 1) -- 78
		legs:SetRenderMode(lp:GetRenderMode()) -- 80
		legs:SetMaterial(lp:GetMaterial()) -- 81
		legs:SetSequence(lp:GetSequence()) -- 82
		local layer = GESTURE_SLOT_CUSTOM -- 83
		legs:SetLayerSequence(layer, lp:GetLayerSequence(layer)) -- 84
		legs:SetLayerDuration(layer, lp:GetLayerDuration(layer)) -- 85
		legs:SetLayerPlaybackRate(layer, lp:GetLayerPlaybackRate(layer)) -- 86
		legs:SetLayerWeight(layer, lp:GetLayerWeight(layer)) -- 87
		legs:SetLayerCycle(layer, lp:GetLayerCycle(layer)) -- 88
		legs:SetColor(lp:GetColor()) -- 89
		legs:FrameAdvance(real_time - (legs.last_draw or real_time)) -- 90
		legs:SetPlaybackRate(lp:GetPlaybackRate()) -- 91
		legs:SetRenderOrigin(origin) -- 92
		legs:SetRenderAngles(angs) -- 93
		legs:DrawModel() -- 94
		legs.last_draw = real_time -- 96
	end -- 75
	return cam.End3D() -- 97
end -- 52
hook.Add("RenderScreenspaceEffects", "evilrp_render_legs", render_legs_in_screenspace) -- 99
local draw_leg_parts -- 101
draw_leg_parts = function() -- 101
	if not IsValid(lp) then -- 102
		return -- 102
	end -- 102
	if not lp:Alive() then -- 103
		return -- 103
	end -- 103
	if lp:ShouldDrawLocalPlayer() then -- 104
		return -- 104
	end -- 104
	if not (part and part.Outfits) then -- 105
		return -- 105
	end -- 105
	if not IsValid(lp.legs) then -- 106
		lp:SpawnLegs() -- 106
	end -- 106
	for outfit, owner in pairs(part.Outfits) do -- 107
		if owner == lp.legs then -- 108
			outfit:Draw() -- 109
		end -- 108
	end -- 109
end -- 101
hook.Add("PostDrawTranslucentRenderables", "evilrp_draw_leg_parts", draw_leg_parts) -- 111
local offset = Vector(-50, -50, 0) -- 113
local scale = Vector(1, 1, 1) -- 114
local meta = FindMetaTable("Player") -- 116
meta.SpawnLegs = function(self) -- 117
	if IsValid(self.legs) then -- 118
		self.legs:Remove() -- 118
	end -- 118
	self.legs = ClientsideModel(self:GetModel(), RENDERGROUP_VIEWMODEL) -- 119
	local legs = self.legs -- 120
	if IsValid(legs) then -- 121
		for _index_0 = 1, #hidden_bones do -- 122
			local b = hidden_bones[_index_0] -- 122
			local bone = legs:LookupBone(b) -- 123
			if bone then -- 124
				legs:ManipulateBonePosition(bone, offset) -- 125
				legs:ManipulateBoneScale(bone, scale) -- 126
			end -- 124
		end -- 126
	end -- 121
	legs:SetNoDraw(true) -- 127
	legs:SetIK(true) -- 128
	if self.last_appearance then -- 129
		return part.Add(self.legs, "appearance", self.last_appearance) -- 130
	end -- 129
end -- 117
local remove_legs -- 132
remove_legs = function() -- 132
	if lp.legs and IsValid(lp.legs) then -- 133
		return lp.legs:Remove() -- 133
	end -- 133
end -- 132
return hook.Add("OnPlayerChangedTeam", "evilrp_remove_legs", remove_legs) -- 134
