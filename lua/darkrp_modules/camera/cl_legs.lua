if not CLIENT then
	return
end
local hidden_bones = {
	"ValveBiped.Bip01_Head1",
	"ValveBiped.Bip01_Neck1",
	"ValveBiped.Bip01_Spine4"
}
if IsValid(lp) and lp.legs then
	lp.legs:Remove()
end
local render_legs_in_screenspace
render_legs_in_screenspace = function()
	if not IsValid(lp) then
		return
	end
	if not lp:Alive() then
		return
	end
	if lp:ShouldDrawLocalPlayer() then
		return
	end
	local angs = lp:EyeAngles()
	if angs.p < 0 then
		return
	end
	cam.Start3D(EyePos(), EyeAngles())
	if not IsValid(lp.legs) then
		lp:SpawnLegs()
	end
	local real_time = RealTime()
	local legs = lp.legs
	angs.p = 0
	angs.r = 0
	local rad_angle = math.rad(angs.y)
	local offset = -15
	local origin = lp:GetPos()
	origin.x = origin.x + (math.cos(rad_angle) * offset)
	origin.y = origin.y + (math.sin(rad_angle) * offset)
	do
		legs:SetPoseParameter("move_yaw", 360 * lp:GetPoseParameter("move_yaw") - 180)
		legs:SetPoseParameter("move_x", lp:GetPoseParameter("move_x") * 2 - 1)
		legs:SetPoseParameter("move_y", lp:GetPoseParameter("move_y") * 2 - 1)
		legs:SetRenderMode(lp:GetRenderMode())
		legs:SetMaterial(lp:GetMaterial())
		legs:SetSequence(lp:GetSequence())
		local layer = GESTURE_SLOT_CUSTOM
		legs:SetLayerSequence(layer, lp:GetLayerSequence(layer))
		legs:SetLayerDuration(layer, lp:GetLayerDuration(layer))
		legs:SetLayerPlaybackRate(layer, lp:GetLayerPlaybackRate(layer))
		legs:SetLayerWeight(layer, lp:GetLayerWeight(layer))
		legs:SetLayerCycle(layer, lp:GetLayerCycle(layer))
		legs:SetColor(lp:GetColor())
		legs:FrameAdvance(real_time - (legs.last_draw or real_time))
		legs:SetPlaybackRate(lp:GetPlaybackRate())
		legs:SetRenderOrigin(origin)
		legs:SetRenderAngles(angs)
		legs:DrawModel()
		legs.last_draw = real_time
	end
	return cam.End3D()
end
hook.Add("RenderScreenspaceEffects", "evilrp_render_legs", render_legs_in_screenspace)
local draw_leg_parts
draw_leg_parts = function()
	if not IsValid(lp) then
		return
	end
	if not lp:Alive() then
		return
	end
	if lp:ShouldDrawLocalPlayer() then
		return
	end
	if not (part and part.Outfits) then
		return
	end
	if not IsValid(lp.legs) then
		lp:SpawnLegs()
	end
	for outfit, owner in pairs(part.Outfits) do
		if owner == lp.legs then
			outfit:Draw()
		end
	end
end
hook.Add("PostDrawTranslucentRenderables", "evilrp_draw_leg_parts", draw_leg_parts)
local offset = Vector(-50, -50, 0)
local scale = Vector(1, 1, 1)
local meta = FindMetaTable("Player")
meta.SpawnLegs = function(self)
	if IsValid(self.legs) then
		self.legs:Remove()
	end
	self.legs = ClientsideModel(self:GetModel(), RENDERGROUP_VIEWMODEL)
	local legs = self.legs
	if IsValid(legs) then
		for _index_0 = 1, #hidden_bones do
			local b = hidden_bones[_index_0]
			local bone = legs:LookupBone(b)
			if bone then
				legs:ManipulateBonePosition(bone, offset)
				legs:ManipulateBoneScale(bone, scale)
			end
		end
	end
	legs:SetNoDraw(true)
	legs:SetIK(true)
	if self.last_appearance then
		return part.Add(self.legs, "appearance", self.last_appearance)
	end
end
local remove_legs
remove_legs = function()
	if lp.legs and IsValid(lp.legs) then
		return lp.legs:Remove()
	end
end
return hook.Add("OnPlayerChangedTeam", "evilrp_remove_legs", remove_legs)
