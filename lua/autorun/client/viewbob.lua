local vb_multipliers = {}
local vb_enabled = {}
for _, typee in ipairs({"slow", "normal", "run", "idle", "dmg", "land", "jump", "crouch", "uncrouch", "tilt"}) do
	vb_multipliers[typee] = CreateConVar("viewbob_multiplier_"..typee, 1, FCVAR_ARCHIVE)
	vb_enabled[typee] = CreateConVar("viewbob_enabled_"..typee, 1, FCVAR_ARCHIVE)
end

local vb_enable = CreateConVar("viewbob_enabled", 1, FCVAR_ARCHIVE, "Global toggle for the view bobbing.")
local vb_tools_enabled = CreateConVar("viewbob_tools_enabled", 1, FCVAR_ARCHIVE, "Toggle view bobbing if you have tools equipped.")
local vb_debug = CreateConVar("viewbob_debug", 0, FCVAR_ARCHIVE, "Debug stuff.")

local tilt = 0
local tilt_limit = CreateConVar("viewbob_tilt_limit", 50, FCVAR_ARCHIVE)
local tilt_decay = CreateConVar("viewbob_tilt_decay_speed", 5, FCVAR_ARCHIVE)

local function print_debug(...)
	if vb_debug:GetBool() then
		print(...)
	end
end

local function equipped_tool(ply)
	local weapon = ply:GetActiveWeapon()
	if not weapon:IsValid() then return false end

	return table.HasValue({"gmod_tool", "weapon_physgun", "gmod_camera"}, weapon:GetClass())
end

local function is_enabled(typee, ply)
	if not vb_enable:GetBool() then print_debug("is_enabled->vb_enable", vb_enable:GetBool(), typee) return false end
	if not vb_tools_enabled:GetBool() and equipped_tool(ply) then print_debug("is_enabled->vb_tools_enabled&equipped_tool", vb_tools_enabled:GetBool(), equipped_tool(ply), typee) return false end
	if not vb_enabled[typee]:GetBool() then print_debug("is_enabled->vb_enabled[typee]:GetBool()", vb_enabled[typee]:GetBool(), typee) return false end
	if ply:GetMoveType() == MOVETYPE_NOCLIP then print_debug("is_enabled->movetype_noclip", typee, ply:GetMoveType() == MOVETYPE_NOCLIP) return false end
	return true
end

function viewbob_main(ply, pos, foot, sound, volume, rf, jumped)
	if ply != LocalPlayer() then return end
	local speed = ply:GetMaxSpeed()
	local typee = "normal"
	local side = 0
	if ply:KeyDown(IN_WALK) then typee = "slow" end
	if ply:KeyDown(IN_SPEED) then typee = "run" end

	if foot == 0 then
		-- left foot
		side = 1
	elseif foot == 1 then
		-- right foot
		side = -1
	end

	local angle = Angle()
	local mult = vb_multipliers[typee]:GetFloat()

	print_debug("PlayerFootstep: ", speed, typee, side, mult)

	if typee == "slow" then mult = mult * 0.2 end
	if typee == "normal" then mult = mult * 0.3 end
	if typee == "run" then mult = mult * 0.5 end

    if ply:KeyDown(IN_FORWARD) or ply:AutomovingForward() then
    	angle = angle + Angle(2, side, side)
    end

    if ply:KeyDown(IN_BACK) or ply:AutomovingBackward() then
    	angle = angle + Angle(-2, side, side)
    end

    if ply:KeyDown(IN_MOVELEFT) or ply:AutomovingLeft() then
    	angle = angle + Angle(side, side, -2)
    end

    if ply:KeyDown(IN_MOVERIGHT) or ply:AutomovingRight() then
    	angle = angle + Angle(side, side, 2)
    end

	if not is_enabled(typee, ply) then mult = 0 end

    angle = angle * mult

	if (ply:KeyPressed(IN_JUMP) or jumped) and is_enabled("jump", ply) and vb_enabled["jump"]:GetBool() then
		angle = angle + Angle(vb_multipliers["jump"]:GetFloat()*-3, 0, 0)
	end

	if angle:IsZero() then return end

	Viewpunch(angle)
end
hook.Add("PlayerFootstep", "viewbob_main", viewbob_main)

function viewbob_land(ply, inWater, onFloater, speed)
 	if ply != LocalPlayer() then return end
	if not is_enabled("land", ply) then return end

	print_debug("OnPlayerHitGround: ", speed, vb_multipliers["land"]:GetFloat())

	if ply:KeyDown(IN_DUCK) then
		Viewpunch(Angle(speed / 80 * vb_multipliers["land"]:GetFloat() * 0.5, 0, 0))
	else
		Viewpunch(Angle(speed / 40 * vb_multipliers["land"]:GetFloat() * 0.5, 0, 0))
	end
end
hook.Add("OnPlayerHitGround", "viewbob_land", viewbob_land)

function viewbob_dmg(target, dmginfo)
	if target != LocalPlayer() then return end
	if not is_enabled("dmg", target) then return end
	local mult = vb_multipliers["dmg"]:GetFloat() * 0.5

	print_debug("EntityTakeDamage: ", mult)

	Viewpunch(Angle(math.random(-3,3) * mult, math.random(-3,3) * mult, math.random(-3,3) * mult))
end
hook.Add("EntityTakeDamage", "viewbob_dmg", viewbob_dmg)

local function viewbob_crouch()
	local ply = LocalPlayer()
	if not ply.KeyDown then return end
	if not ply.vb_crouching then ply.vb_crouching = false end
	ply.vb_crouched_before = ply.vb_crouching
	ply.vb_crouching = ply:KeyDown(IN_DUCK)

	if ply.vb_crouched_before != ply.vb_crouching and ply.vb_crouching then
		print_debug("PlayerTick (viewbob_crouch): ", ply.vb_crouched_before, ply.vb_crouching, vb_multipliers["crouch"]:GetFloat(), vb_multipliers["uncrouch"]:GetFloat())
		if not is_enabled("crouch", ply) then return end
		local mult = vb_multipliers["crouch"]:GetFloat()
    	Viewpunch(Angle(4 * mult,
    						math.random(-1, 1) * mult,
    						math.random(-1, 1) * mult))
	end

	if ply.vb_crouched_before != ply.vb_crouching and not ply.vb_crouching then
		print_debug("PlayerTick (viewbob_crouch): ", ply.vb_crouched_before, ply.vb_crouching, vb_multipliers["crouch"]:GetFloat(), vb_multipliers["uncrouch"]:GetFloat())
		if not is_enabled("uncrouch", ply) then return end
		local mult = vb_multipliers["uncrouch"]:GetFloat()
    	Viewpunch(Angle(-4 * mult,
    						math.random(-1, 1) * mult,
    						math.random(-1, 1) * mult))
	end
end
hook.Add("Tick", "viewbob_crouch", viewbob_crouch)

local drunk_view = Angle()
local drunk_view_last = Angle()
local function viewbob_idle()
	local lp = LocalPlayer()

	local mult = vb_multipliers["idle"]:GetFloat()

	if not is_enabled("idle", lp) then mult = 0 end
	if lp:InVehicle() then mult = 0 end

	drunk_view = Angle(math.cos(CurTime() / 0.9) / 3 * mult,
						math.sin(CurTime() / 0.8) / 3.6 * mult,
						math.cos(CurTime() / 0.5) / 3.3 * mult)

	lp:SetEyeAngles(lp:EyeAngles() + drunk_view - drunk_view_last)
	drunk_view_last = drunk_view
end
hook.Add("Think", "viewbob_idle", viewbob_idle)

local tilt = Angle()
local tilt_last = Angle()
local gx = 0
hook.Add("InputMouseApply", "viewpunch_mouse", function(cmd, x, y, ang)
	gx = x
end)

local function viewbob_tilt()
	local lp = LocalPlayer()

	tilt = Angle(0,0,Lerp(FrameTime() * tilt_decay:GetFloat(), tilt.z, math.Clamp(gx / 20, -tilt_limit:GetFloat(), tilt_limit:GetFloat())))

	if not is_enabled("tilt", lp) then tilt:Zero() end
	if lp:InVehicle() then tilt:Zero() end

	lp:SetEyeAngles(lp:EyeAngles() + tilt - tilt_last)
	tilt_last = tilt
end
hook.Add("Think", "viewbob_tilt", viewbob_tilt)

hook.Add("InitPostEntity", "viewpunch_check", function()
	if not Viewpunch then
		Derma_Message("Please install the required dependencies:\n[For Developers] Local Viewpunch\n\nYou can find them on the mod page.", "Pesky notification", "ok brah")
	end
end)
