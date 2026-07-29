-- [yue]: darkrp_modules\placemenu\sh_placemenu.yue
local meta = FindMetaTable("Player") -- 1
local PlaceBuild -- 3
do -- 3
	local _class_0 -- 3
	local _parent_0 = SOUND -- 3
	local _base_0 = { -- 3
		sound = "ambient/levels/labs/coinslot1.wav" -- 4
	} -- 3
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 3
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 3
			_base_0[_key_0] = _val_0 -- 3
		end -- 3
	end -- 3
	if _base_0.__index == nil then -- 3
		_base_0.__index = _base_0 -- 3
	end -- 3
	setmetatable(_base_0, _parent_0.__base) -- 3
	_class_0 = setmetatable({ -- 3
		__init = function(self, ...) -- 3
			return _class_0.__parent.__init(self, ...) -- 3
		end, -- 3
		__base = _base_0, -- 3
		__name = "PlaceBuild", -- 3
		__parent = _parent_0 -- 3
	}, { -- 3
		__index = function(cls, name) -- 3
			local val = rawget(_base_0, name) -- 3
			if val == nil then -- 3
				local parent = rawget(cls, "__parent") -- 3
				if parent then -- 3
					return parent[name] -- 3
				end -- 3
			else -- 3
				return val -- 3
			end -- 3
		end, -- 3
		__call = function(cls, ...) -- 3
			local _self_0 = setmetatable({ }, _base_0) -- 3
			cls.__init(_self_0, ...) -- 3
			return _self_0 -- 3
		end -- 3
	}) -- 3
	_base_0.__class = _class_0 -- 3
	if _parent_0.__inherited then -- 3
		_parent_0.__inherited(_parent_0, _class_0) -- 3
	end -- 3
	PlaceBuild = _class_0 -- 3
end -- 3
local TRAP_LIST = { -- 7
	{ -- 7
		name = "IED", -- 7
		class = "entity_longuse/trap/ied" -- 7
	}, -- 7
	{ -- 8
		name = "Wired Grenade", -- 8
		class = "entity_longuse/trap/wiretrap" -- 8
	}, -- 8
	{ -- 9
		name = "Wired Shotgun", -- 9
		class = "entity_longuse/trap/wiretrap/shotgunwire" -- 9
	} -- 9
} -- 6
local TRAP_COST = 150 -- 12
if SERVER then -- 14
	netstream.Hook("BeginBuilding", function(ply) -- 15
		if ply.cant_build then -- 16
			return -- 16
		end -- 16
		if ply:GetNWBool("evilrp_building") then -- 17
			return -- 17
		end -- 17
		ply:SetNWInt("evilrp_trapindex", 1) -- 18
		ply:SetNWBool("evilrp_building", true) -- 19
		ply:Notify("Scroll to select a trap.") -- 20
		return ply:Notify("Left click to place it. Reload to cancel.") -- 21
	end) -- 15
	netstream.Hook("CancelBuilding", function(ply) -- 23
		if not ply:GetNWBool("evilrp_building") then -- 24
			return -- 24
		end -- 24
		ply:SetNWBool("evilrp_building", false) -- 25
		return ply:Notify("Cancelled.") -- 26
	end) -- 23
	netstream.Hook("ScrollTrap", function(ply, dir) -- 28
		if not ply:GetNWBool("evilrp_building") then -- 29
			return -- 29
		end -- 29
		if not (dir == 1 or dir == -1) then -- 30
			return -- 30
		end -- 30
		local count = #TRAP_LIST -- 31
		local index = ply:GetNWInt("evilrp_trapindex", 1) + dir -- 32
		if index < 1 then -- 33
			index = count -- 33
		end -- 33
		if index > count then -- 34
			index = 1 -- 34
		end -- 34
		ply:SetNWInt("evilrp_trapindex", index) -- 35
		return ply:Notify("Selected: " .. tostring(TRAP_LIST[index].name)) -- 36
	end) -- 28
	return netstream.Hook("DropTrap", function(ply) -- 38
		if not ply:GetNWBool("evilrp_building") then -- 39
			return -- 39
		end -- 39
		if ply:Team() ~= TEAM_STALKER then -- 40
			return -- 40
		end -- 40
		if not ply:Alive() then -- 41
			return -- 41
		end -- 41
		if ply.cant_build then -- 42
			return -- 42
		end -- 42
		local money = ply:getDarkRPVar("money") -- 44
		if TRAP_COST > money then -- 45
			return -- 45
		end -- 45
		local index = ply:GetNWInt("evilrp_trapindex", 1) -- 47
		local trap = TRAP_LIST[index] -- 48
		if not trap then -- 49
			return -- 49
		end -- 49
		ply:SetNWBool("evilrp_building", false) -- 51
		local tr = GAMEMODE:GetHandTrace(ply, 80) -- 53
		if not tr.Hit then -- 54
			return -- 54
		end -- 54
		local ent = ents.Create(trap.class) -- 56
		if not IsValid(ent) then -- 57
			return -- 57
		end -- 57
		ply:AddMoney(-TRAP_COST, "Placed " .. tostring(trap.name)) -- 59
		ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_DROP) -- 60
		ent:SetPos(tr.HitPos + tr.HitNormal * 2) -- 62
		ent:SetAngles(Angle(0, ply:EyeAngles().y, 0)) -- 63
		ent.owner = ply -- 64
		ent:Spawn() -- 65
		ent:Activate() -- 66
		PlaceBuild():play(ply) -- 68
		DarkRP.log(tostring(ply:Nick()) .. " (" .. tostring(ply:SteamID()) .. ") placed a " .. tostring(trap.name) .. " for " .. tostring(DarkRP.formatMoney(TRAP_COST))) -- 70
		ply.cant_build = true -- 72
		return timer.Simple(1, function() -- 73
			if not IsValid(ply) then -- 74
				return -- 74
			end -- 74
			ply.cant_build = false -- 75
		end) -- 73
	end) -- 38
else -- 77
	hook.Add("PlayerBindPress", "evilrp_scrolltrap", function(ply, bind, pressed) -- 77
		if not pressed then -- 78
			return -- 78
		end -- 78
		if not ply:GetNWBool("evilrp_building") then -- 79
			return -- 79
		end -- 79
		bind = bind:lower() -- 80
		if bind:find("invnext") then -- 81
			netstream.Send("ScrollTrap", 1) -- 82
			return true -- 83
		elseif bind:find("invprev") then -- 84
			netstream.Send("ScrollTrap", -1) -- 85
			return true -- 86
		end -- 81
	end) -- 77
	return hook.Add("PlayerBindPress", "evilrp_droptrap", function(ply, bind, pressed) -- 88
		if not pressed then -- 89
			return -- 89
		end -- 89
		if not ply:GetNWBool("evilrp_building") then -- 90
			return -- 90
		end -- 90
		bind = bind:lower() -- 91
		if bind:find("+attack") then -- 92
			netstream.Send("DropTrap") -- 93
			return true -- 94
		elseif bind:find("+reload") then -- 95
			netstream.Send("CancelBuilding") -- 96
			return true -- 97
		end -- 92
	end) -- 88
end -- 14
