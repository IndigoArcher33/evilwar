local meta = FindMetaTable("Player")
meta.AddMoney = function(self, amt, src)
	if src == nil then
		src = "From thin air"
	end
	self:addMoney(amt)
	local amt_str = #{
		amt
	}
	if amt > 0 then
		amt_str = "<c=0,200,0>+" .. amt
	else
		amt_str = "<c=200,0,0>" .. amt
	end
	return self:Notify(tostring(src) .. ": " .. tostring(amt_str))
end
local GiveMoney
do
	local _class_0
	local _parent_0 = SOUND
	local _base_0 = {
		sound = "ambient/levels/labs/coinslot1.wav"
	}
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "GiveMoney",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	GiveMoney = _class_0
end
if SERVER then
	netstream.Hook("BeginPaying", function(ply)
		local paying = ply:GetNWBool("evilrp_paying")
		if not (paying or ply.cant_pay) then
			ply:Notify("Scroll to the desired payment amount.")
			ply:Notify("Left click to pay or drop money.")
			return ply:SetNWBool("evilrp_paying", true)
		end
	end)
	return netstream.Hook("DropMoney", function(ply, amount)
		if not amount or amount <= 0 then
			ply:Notify("Nevermind.")
			return
		end
		if not ply:GetNWBool("evilrp_paying") then
			return
		end
		if ply:Team() == TEAM_GHOST then
			return
		end
		if not ply:Alive() then
			return
		end
		local money = ply:getDarkRPVar("money")
		if amount > money then
			return
		end
		if amount < 1 then
			return
		end
		local wep = ply:GetActiveWeapon()
		ply:SetNWBool("evilrp_paying", false)
		local tr = GAMEMODE:GetHandTrace(ply, 80)
		if tr.Entity and IsValid(tr.Entity) and tr.Entity:IsPlayer() and tr.Entity:Alive() and tr.Entity:Team() ~= TEAM_GHOST then
			local oply = tr.Entity
			ply:AddMoney(-amount, "Transaction")
			oply:AddMoney(amount, "Payment")
			ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_GIVE)
			oply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_PLACE)
			ply:EmitSound("GiveMoney")
			oply:SendChat("GENERIC", "<c=0,200,0>" .. tostring(ply:Name()) .. " gave you " .. tostring(amount) .. " bones.")
		else
			ply:AddMoney(-amount, "Dropped")
			ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_DROP)
			local start = ply:EyePos()
			local trace = {
				start = start,
				endpos = start + ply:GetAimVector() * 85,
				filter = ply
			}
			tr = util.TraceLine(trace)
			local moneybag = DarkRP.createMoneyBag(tr.HitPos, amount)
			DarkRP.placeEntity(moneybag, tr, ply)
			DarkRP.log(tostring(ply:Nick()) .. " (" .. tostring(ply:SteamID()) .. ") has dropped " .. tostring(DarkRP.formatMoney(amount)))
		end
		ply.cant_pay = true
		return timer.Simple(1, function()
			if not IsValid(ply) then
				return
			end
			ply.cant_pay = false
		end)
	end)
else
	local drop_or_give_money
	drop_or_give_money = function(ply, bind, pressed)
		bind = bind:lower()
		if not pressed then
			return
		end
		if not ply:GetNWBool("evilrp_paying") then
			return
		end
		if not bind:find("+attack") then
			return
		end
		return netstream.Send("DropMoney", ply.payment_amount)
	end
	return hook.Add("PlayerBindPress", "evilrp_payment", drop_or_give_money)
end
