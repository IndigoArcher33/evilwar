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
		local building = ply:GetNWBool("evilrp_building") -- 16
		if ply.cant_build then -- 17
			return -- 17
		end -- 17
		if ply:GetNWBool("evilrp_building") then -- 18
			return -- 18
		end -- 18
		ply:SetNWInt("evilrp_trapindex", 1) -- 19
		ply:SetNWBool("evilrp_building", true) -- 20
		ply:Notify("Scroll to select a trap.") -- 21
		return ply:Notify("Left click to place it. Reload to cancel.") -- 22
	end) -- 15
	netstream.Hook("CancelBuilding", function(ply) -- 24
		if not ply:GetNWBool("evilrp_building") then -- 25
			return -- 25
		end -- 25
		ply:SetNWBool("evilrp_building", false) -- 26
		return ply:Notify("Cancelled.") -- 27
	end) -- 24
	netstream.Hook("ScrollTrap", function(ply, dir) -- 29
		if not ply:GetNWBool("evilrp_building") then -- 30
			return -- 30
		end -- 30
		if not (dir == 1 or dir == -1) then -- 31
			return -- 31
		end -- 31
		local count = #TRAP_LIST -- 32
		local index = ply:GetNWInt("evilrp_trapindex", 1) + dir -- 33
		if index < 1 then -- 34
			index = count -- 34
		end -- 34
		if index > count then -- 35
			index = 1 -- 35
		end -- 35
		ply:SetNWInt("evilrp_trapindex", index) -- 36
		return ply:Notify("Selected: " .. tostring(TRAP_LIST[index].name)) -- 37
	end) -- 29
	return netstream.Hook("DropTrap", function(ply) -- 39
		if not ply:GetNWBool("evilrp_building") then -- 40
			return -- 40
		end -- 40
		if ply:Team() ~= TEAM_STALKER then -- 41
			return -- 41
		end -- 41
		if not ply:Alive() then -- 42
			return -- 42
		end -- 42
		if ply.cant_build then -- 43
			return -- 43
		end -- 43
		local money = ply:getDarkRPVar("money") -- 45
		if TRAP_COST > money then -- 46
			return -- 46
		end -- 46
		local index = ply:GetNWInt("evilrp_trapindex", 1) -- 48
		local trap = TRAP_LIST[index] -- 49
		if not trap then -- 50
			return -- 50
		end -- 50
		ply:SetNWBool("evilrp_building", false) -- 52
		local tr = GAMEMODE:GetHandTrace(ply, 80) -- 54
		if not tr.Hit then -- 55
			return -- 55
		end -- 55
		local ent = ents.Create(trap.class) -- 57
		if not IsValid(ent) then -- 58
			return -- 58
		end -- 58
		ply:AddMoney(-TRAP_COST, "Placed " .. tostring(trap.name)) -- 60
		ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_DROP) -- 61
		ent:SetPos(tr.HitPos + tr.HitNormal * 2) -- 63
		ent:SetAngles(Angle(0, ply:EyeAngles().y, 0)) -- 64
		ent.owner = ply -- 65
		ent:Spawn() -- 66
		ent:Activate() -- 67
		PlaceBuild():play(ply) -- 69
		DarkRP.log(tostring(ply:Nick()) .. " (" .. tostring(ply:SteamID()) .. ") placed a " .. tostring(trap.name) .. " for " .. tostring(DarkRP.formatMoney(TRAP_COST))) -- 71
		ply.cant_build = true -- 73
		return timer.Simple(1, function() -- 74
			if not IsValid(ply) then -- 75
				return -- 75
			end -- 75
			ply.cant_build = false -- 76
		end) -- 74
	end) -- 39
else -- 78
	return hook.Add("PlayerBindPress", "evilrp_droptrap", function(ply, bind, pressed) -- 78
		bind = bind:lower() -- 79
		if not pressed then -- 80
			return -- 80
		end -- 80
		if not ply:GetNWBool("evilrp_building") then -- 81
			return -- 81
		end -- 81
		if bind:find("+reload") then -- 82
			netstream.Send("CancelBuilding") -- 83
			return true -- 84
		end -- 82
	end) -- 78
end -- 14
