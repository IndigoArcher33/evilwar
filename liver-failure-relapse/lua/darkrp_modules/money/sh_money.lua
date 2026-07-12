-- [yue]: /home/amanita/dev/gmod/darkrpmodification/lua/darkrp_modules/money/sh_money.yue
local meta = FindMetaTable("Player") -- 1
meta.AddMoney = function(self, amt, src) -- 2
	if src == nil then -- 2
		src = "From thin air" -- 2
	end -- 2
	self:addMoney(amt) -- 3
	local amt_str = #{ -- 4
		amt -- 4
	} -- 4
	if amt > 0 then -- 5
		amt_str = "<c=0,200,0>+" .. amt -- 6
	else -- 8
		amt_str = "<c=200,0,0>" .. amt -- 8
	end -- 5
	return self:Notify(tostring(src) .. ": " .. tostring(amt_str)) -- 9
end -- 2
local GiveMoney -- 11
do -- 11
	local _class_0 -- 11
	local _parent_0 = SOUND -- 11
	local _base_0 = { -- 11
		sound = "ambient/levels/labs/coinslot1.wav" -- 11
	} -- 11
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 12
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 11
			_base_0[_key_0] = _val_0 -- 11
		end -- 11
	end -- 12
	if _base_0.__index == nil then -- 11
		_base_0.__index = _base_0 -- 11
	end -- 12
	setmetatable(_base_0, _parent_0.__base) -- 11
	_class_0 = setmetatable({ -- 11
		__init = function(self, ...) -- 11
			return _class_0.__parent.__init(self, ...) -- 11
		end, -- 11
		__base = _base_0, -- 11
		__name = "GiveMoney", -- 11
		__parent = _parent_0 -- 11
	}, { -- 11
		__index = function(cls, name) -- 11
			local val = rawget(_base_0, name) -- 11
			if val == nil then -- 11
				local parent = rawget(cls, "__parent") -- 11
				if parent then -- 11
					return parent[name] -- 11
				end -- 11
			else -- 11
				return val -- 11
			end -- 11
		end, -- 11
		__call = function(cls, ...) -- 11
			local _self_0 = setmetatable({ }, _base_0) -- 11
			cls.__init(_self_0, ...) -- 11
			return _self_0 -- 11
		end -- 11
	}) -- 11
	_base_0.__class = _class_0 -- 11
	if _parent_0.__inherited then -- 11
		_parent_0.__inherited(_parent_0, _class_0) -- 11
	end -- 11
	GiveMoney = _class_0 -- 11
end -- 12
if SERVER then -- 14
	netstream.Hook("BeginPaying", function(ply) -- 15
		local paying = ply:GetNWBool("evilrp_paying") -- 16
		if not (paying or ply.cant_pay) then -- 17
			ply:Notify("Scroll to the desired payment amount.") -- 18
			ply:Notify("Left click to pay or drop money.") -- 19
			return ply:SetNWBool("evilrp_paying", true) -- 20
		end -- 17
	end) -- 15
	return netstream.Hook("DropMoney", function(ply, amount) -- 21
		if not amount or amount <= 0 then -- 22
			ply:Notify("Nevermind.") -- 23
			return -- 24
		end -- 22
		if not ply:GetNWBool("evilrp_paying") then -- 25
			return -- 25
		end -- 25
		if ply:Team() == TEAM_GHOST then -- 26
			return -- 26
		end -- 26
		if not ply:Alive() then -- 27
			return -- 27
		end -- 27
		local money = ply:getDarkRPVar("money") -- 28
		if amount > money then -- 29
			return -- 29
		end -- 29
		if amount < 1 then -- 30
			return -- 30
		end -- 30
		local wep = ply:GetActiveWeapon() -- 31
		ply:SetNWBool("evilrp_paying", false) -- 32
		local tr = GAMEMODE:GetHandTrace(ply, 80) -- 33
		if tr.Entity and IsValid(tr.Entity) and tr.Entity:IsPlayer() and tr.Entity:Alive() and tr.Entity:Team() ~= TEAM_GHOST then -- 34
			local oply = tr.Entity -- 35
			ply:AddMoney(-amount, "Transaction") -- 36
			oply:AddMoney(amount, "Payment") -- 37
			ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_GIVE) -- 38
			oply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_PLACE) -- 39
			ply:EmitSound("GiveMoney") -- 40
			oply:SendChat("GENERIC", "<c=0,200,0>" .. tostring(ply:Name()) .. " gave you " .. tostring(amount) .. " bones.") -- 41
		else -- 43
			ply:AddMoney(-amount, "Dropped") -- 43
			ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_DROP) -- 44
			local start = ply:EyePos() -- 45
			local trace = { -- 47
				start = start, -- 47
				endpos = start + ply:GetAimVector() * 85, -- 48
				filter = ply -- 49
			} -- 46
			tr = util.TraceLine(trace) -- 51
			local moneybag = DarkRP.createMoneyBag(tr.HitPos, amount) -- 52
			DarkRP.placeEntity(moneybag, tr, ply) -- 53
			DarkRP.log(tostring(ply:Nick()) .. " (" .. tostring(ply:SteamID()) .. ") has dropped " .. tostring(DarkRP.formatMoney(amount))) -- 54
		end -- 34
		ply.cant_pay = true -- 55
		return timer.Simple(1, function() -- 56
			if not IsValid(ply) then -- 57
				return -- 57
			end -- 57
			ply.cant_pay = false -- 58
		end) -- 58
	end) -- 58
else -- 60
	local drop_or_give_money -- 60
	drop_or_give_money = function(ply, bind, pressed) -- 60
		bind = bind:lower() -- 61
		if not pressed then -- 62
			return -- 62
		end -- 62
		if not ply:GetNWBool("evilrp_paying") then -- 63
			return -- 63
		end -- 63
		if not bind:find("+attack") then -- 64
			return -- 64
		end -- 64
		return netstream.Send("DropMoney", ply.payment_amount) -- 65
	end -- 60
	return hook.Add("PlayerBindPress", "evilrp_payment", drop_or_give_money) -- 66
end -- 14
