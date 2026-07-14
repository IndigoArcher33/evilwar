hook.Add("HUDShouldDraw", "evilrp_weapon_select", function(name)
	if name == "CHudWeaponSelection" then
		return false
	end
	return
end)
local index = 1
local delta_index = index
local info_alpha = 0
local alpha = 0
local alpha_delta = alpha
local fade_time = 0
local matrix_scale = Vector(1, 1, 0)
local names = {
	["#gmod_tool"] = "Hexengland",
	["#GMOD_Physgun"] = "Telegland"
}
hook.Add("HUDPaint", "evilrp_weapon_select", function()
	local ft = FrameTime()
	local ct = CurTime()
	alpha_delta = Lerp(ft * 10, alpha_delta, alpha)
	local fraction = alpha_delta
	if fraction > .01 then
		local spacing = math.pi * .85
		local radius = 240 * alpha_delta
		local shift_x = ScrW() * .02
		delta_index = Lerp(ft * 12, delta_index, index)
		local paying = lp:GetNWBool("evilrp_paying")
		if paying then
			local amount = lp.payment_amount or 0
			local index_local = delta_index
			local money = lp:getDarkRPVar("money")
			if not (amount < money) then
				index = money
			end
			local remaining = math.min(amount + 10, money - amount)
			local _, ty = surface.GetTextSize(tostring(amount))
			local desp = lp:GetDespair() * 0.01
			local font = "Spleen_Label"
			local txt = amount
			if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then
				txt = "<c=0," .. tostring(180 + math.sin(CurTime()) * 30) .. ",0>" .. tostring(txt)
			end
			local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp) .. "," .. tostring(0.38 * desp) .. ",2><ol=2>" .. tostring(txt), nil)
			local txt_w = txt_obj:GetWide()
			local txt_h = txt_obj:GetTall()
			local last_y = (txt_h) * fraction
			local p = lp:GetEyeTrace().HitPos:ToScreen()
			ct = CurTime()
			local x = p.x
			x = x + math.cos(ct * 0.75)
			local y = ScrH() * .7
			y = y + math.sin(ct * 0.95)
			txt_obj:Draw(x, y, alpha_delta, TEXT_ALIGN_CENTER)
		else
			local x = ScrW() * .3
			local y = ScrH() * .5
			local weapons = lp:GetWeapons()
			local index_local = delta_index
			if not weapons[index] then
				index = #weapons
			end
			for i = 1, #weapons do
				local theta = (i - index_local) * .1
				local name = weapons[i]:GetPrintName()
				if names[name] then
					name = names[name]
				end
				local _, ty = surface.GetTextSize(name)
				local scale = 1 - math.abs(theta * 2)
				local matrix = Matrix()
				local desp = lp:GetDespair() * 0.01
				local font = "Spleen_Label"
				local txt = name
				if not MUTATORS[MUTATOR_CHROMOPHOBIA].active then
					txt = "<rgb=1,1," .. tostring(i == index and 60 or 30) .. ">" .. tostring(txt)
				end
				local txt_obj = scribe.Parse("<stutter><wiggle=" .. tostring(5 * desp * (theta * 2)) .. "," .. tostring(10 * desp) .. "><f=" .. tostring(font) .. "><wave=" .. tostring(6 * desp + (i == index and 10 or 3)) .. "," .. tostring(0.38 * desp + (i == index and 3 or 1.23)) .. ",2><ol=2>" .. tostring(txt), nil)
				local txt_w = txt_obj:GetWide()
				local txt_h = txt_obj:GetTall()
				local last_y = (txt_h) * fraction
				local translator = Vector(shift_x + x + math.cos(theta * spacing + math.pi) * radius + radius, y + last_y + math.sin(theta * spacing + math.pi) * radius - ty / 2, 1)
				matrix:Translate(translator)
				matrix:Scale(matrix_scale * scale)
				cam.PushModelMatrix(matrix)
				txt_obj:Draw(64, 0, alpha_delta, TEXT_ALIGN_LEFT)
				cam.PopModelMatrix()
			end
			if fade_time < ct and alpha > 0 then
				alpha = 0
			end
		end
	end
	return
end)
local on_index_changed
on_index_changed = function(weapon)
	alpha = 1
	fade_time = CurTime() + 5
	return lp:EmitSound("common/talk.wav", 50, 180)
end
hook.Add("PlayerBindPress", "evilrp_weapon_select", function(ply, bind, pressed)
	bind = bind:lower()
	if ply:Fallen() then
		return
	end
	if not pressed then
		return
	end
	if not bind:find("invprev") and not bind:find("invnext") and not bind:find("slot") and not bind:find("attack") then
		return
	end
	local cur_wep = ply:GetActiveWeapon()
	local valid = IsValid(cur_wep)
	local wep_cls = valid and cur_wep:GetClass() or nil
	local btool
	local paying
	if ply:InVehicle() then
		return
	end
	if valid and wep_cls == "weapon_physgun" and ply:KeyDown(IN_ATTACK) then
		return
	end
	paying = ply:GetNWBool("evilrp_paying")
	if valid then
		if "gmod_tool" == wep_cls then
			local tool = ply:GetTool()
			btool = tool and (tool.Scroll ~= nil)
		end
	end
	if paying then
		ply.payment_amount = ply.payment_amount or 0
		local shift = ply:KeyDown(IN_SPEED)
		if bind:find("invprev") then
			ply.payment_amount = ply.payment_amount - (shift and 5 or 1)
		elseif bind:find("invnext") then
			ply.payment_amount = ply.payment_amount + (shift and 5 or 1)
		end
		ply.payment_amount = math.min(ply:getDarkRPVar("money"), math.max(ply.payment_amount, 0))
		local old_index = index
		index = ply.payment_amount
		on_index_changed()
		return
	end
	local weapons = ply:GetWeapons()
	if bind:find("invprev") and not btool then
		local old_index = index
		index = math.min(index + 1, #weapons)
		if (alpha == 0 or old_index ~= index) then
			on_index_changed(weapons[index])
		end
		return true
	elseif bind:find("invnext") and not btool then
		local old_index = index
		index = math.max(index - 1, 1)
		if (alpha == 0 or old_index ~= index) then
			on_index_changed(weapons[index])
		end
		return true
	elseif bind:find("slot") then
		index = math.Clamp(tonumber(bind:match("slot(%d)")) or 1, 1, #weapons)
		on_index_changed(weapons[index])
		return true
	elseif bind:find("attack") and alpha > 0 then
		local weapon = weapons[index]
		if IsValid(weapon) then
			lp:EmitSound("HL2Player.Use")
			input.SelectWeapon(weapon)
			alpha = 0
		end
		return true
	end
	return
end)
local was_paying
return hook.Add("Think", "evilrp_weapon_select", function()
	if (not IsValid(lp) or not lp:Alive()) then
		alpha = 0
	end
	was_paying = was_paying or lp:GetNWBool("evilrp_paying")
	if was_paying and not lp:GetNWBool("evilrp_paying") then
		was_paying = false
		index = 0
		delta_index = 0
		alpha_delta = 0
		alpha = 0
	end
	return
end)
