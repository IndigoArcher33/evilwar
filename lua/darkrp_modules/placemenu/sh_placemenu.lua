-- [yue]: darkrp_modules\placemenu\sh_placemenu.yue
local meta = FindMetaTable("Player") -- 1
meta.Build = function(self, amt, src) -- 3
	if src == nil then -- 3
		src = "From thin air" -- 3
	end -- 3
	self:addBuild(amt) -- 4
	local amt_str -- 5
	if amt > 0 then -- 5
		amt_str = "<c=0,200,0>+" .. tostring(amt) -- 6
	else -- 8
		amt_str = "<c=200,0,0>" .. tostring(amt) -- 8
	end -- 5
	return self:Notify(tostring(src) .. ": " .. tostring(amt_str)) -- 9
end -- 3
local PlaceBuild -- 11
do -- 11
	local _class_0 -- 11
	local _parent_0 = SOUND -- 11
	local _base_0 = { -- 11
		sound = "ambient/levels/labs/coinslot1.wav" -- 12
	} -- 11
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 11
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 11
			_base_0[_key_0] = _val_0 -- 11
		end -- 11
	end -- 11
	if _base_0.__index == nil then -- 11
		_base_0.__index = _base_0 -- 11
	end -- 11
	setmetatable(_base_0, _parent_0.__base) -- 11
	_class_0 = setmetatable({ -- 11
		__init = function(self, ...) -- 11
			return _class_0.__parent.__init(self, ...) -- 11
		end, -- 11
		__base = _base_0, -- 11
		__name = "PlaceBuild", -- 11
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
	PlaceBuild = _class_0 -- 11
end -- 11
local TRAP_LIST = { -- 15
	{ -- 15
		name = "IED", -- 15
		class = "entity_longuse/trap/ied" -- 15
	}, -- 15
	{ -- 16
		name = "Wired Grenade", -- 16
		class = "entity_longuse/trap/wiretrap" -- 16
	}, -- 16
	{ -- 17
		name = "Wired Shotgun", -- 17
		class = "entity_longuse/trap/wiretrap/shotgunwire" -- 17
	} -- 17
} -- 14
local TRAP_COST = 150 -- 20
if SERVER then -- 22
	netstream.Hook("BeginBuilding", function(ply) -- 23
		if ply.cant_build then -- 24
			return -- 24
		end -- 24
		if ply:GetNWBool("evilrp_building") then -- 25
			return -- 25
		end -- 25
		ply:SetNWInt("evilrp_trapindex", 1) -- 26
		ply:SetNWBool("evilrp_building", true) -- 27
		ply:Notify("Scroll to select a trap.") -- 28
		return ply:Notify("Left click to place it. Reload to cancel.") -- 29
	end) -- 23
	netstream.Hook("CancelBuilding", function(ply) -- 31
		if not ply:GetNWBool("evilrp_building") then -- 32
			return -- 32
		end -- 32
		ply:SetNWBool("evilrp_building", false) -- 33
		return ply:Notify("Cancelled.") -- 34
	end) -- 31
	netstream.Hook("ScrollTrap", function(ply, dir) -- 36
		if not ply:GetNWBool("evilrp_building") then -- 37
			return -- 37
		end -- 37
		if not (dir == 1 or dir == -1) then -- 38
			return -- 38
		end -- 38
		local count = #TRAP_LIST -- 39
		local index = ply:GetNWInt("evilrp_trapindex", 1) + dir -- 40
		if index < 1 then -- 41
			index = count -- 41
		end -- 41
		if index > count then -- 42
			index = 1 -- 42
		end -- 42
		ply:SetNWInt("evilrp_trapindex", index) -- 43
		return ply:Notify("Selected: " .. tostring(TRAP_LIST[index].name)) -- 44
	end) -- 36
	return netstream.Hook("DropTrap", function(ply) -- 46
		if not ply:GetNWBool("evilrp_building") then -- 47
			return -- 47
		end -- 47
		if ply:Team() ~= TEAM_STALKER then -- 48
			return -- 48
		end -- 48
		if not ply:Alive() then -- 49
			return -- 49
		end -- 49
		if ply.cant_build then -- 50
			return -- 50
		end -- 50
		local money = ply:getDarkRPVar("money") -- 52
		if TRAP_COST > money then -- 53
			return -- 53
		end -- 53
		local index = ply:GetNWInt("evilrp_trapindex", 1) -- 55
		local trap = TRAP_LIST[index] -- 56
		if not trap then -- 57
			return -- 57
		end -- 57
		ply:SetNWBool("evilrp_building", false) -- 59
		local tr = GAMEMODE:GetHandTrace(ply, 80) -- 61
		if not tr.Hit then -- 62
			return -- 62
		end -- 62
		local ent = ents.Create(trap.class) -- 64
		if not IsValid(ent) then -- 65
			return -- 65
		end -- 65
		ply:AddMoney(-TRAP_COST, "Placed " .. tostring(trap.name)) -- 67
		ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_DROP) -- 68
		ent:SetPos(tr.HitPos + tr.HitNormal * 2) -- 70
		ent:SetAngles(Angle(0, ply:EyeAngles().y, 0)) -- 71
		ent.owner = ply -- 72
		ent:Spawn() -- 73
		ent:Activate() -- 74
		PlaceBuild():play(ply) -- 76
		DarkRP.log(tostring(ply:Nick()) .. " (" .. tostring(ply:SteamID()) .. ") placed a " .. tostring(trap.name) .. " for " .. tostring(DarkRP.formatMoney(TRAP_COST))) -- 78
		ply.cant_build = true -- 80
		return timer.Simple(1, function() -- 81
			if not IsValid(ply) then -- 82
				return -- 82
			end -- 82
			ply.cant_build = false -- 83
		end) -- 81
	end) -- 46
else -- 85
	hook.Add("PlayerBindPress", "evilrp_scrolltrap", function(ply, bind, pressed) -- 85
		if not pressed then -- 86
			return false -- 86
		end -- 86
		if not ply:GetNWBool("evilrp_building") then -- 87
			return false -- 87
		end -- 87
		bind = bind:lower() -- 88
		if bind:find("invnext") then -- 89
			netstream.Send("ScrollTrap", 1) -- 90
			return true -- 91
		elseif bind:find("invprev") then -- 92
			netstream.Send("ScrollTrap", -1) -- 93
			return true -- 94
		end -- 89
	end) -- 85
	return hook.Add("PlayerBindPress", "evilrp_droptrap", function(ply, bind, pressed) -- 96
		if not pressed then -- 97
			return false -- 97
		end -- 97
		if not ply:GetNWBool("evilrp_building") then -- 98
			return false -- 98
		end -- 98
		bind = bind:lower() -- 99
		if bind:find("+attack") then -- 100
			netstream.Send("DropTrap") -- 101
			return true -- 102
		elseif bind:find("+reload") then -- 103
			netstream.Send("CancelBuilding") -- 104
			return true -- 105
		end -- 100
	end) -- 96
end -- 22
