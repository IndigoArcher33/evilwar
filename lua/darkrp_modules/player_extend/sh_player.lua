-- [yue]: darkrp_modules\player_extend\sh_player.yue
GAMEMODE.FindPlayer = function(self, str) -- 1
	if not str then -- 2
		return nil -- 2
	end -- 2
	if str == "" then -- 3
		return nil -- 3
	end -- 3
	local plys = player.GetAll() -- 4
	for i = 1, #plys do -- 5
		local ply = plys[i] -- 6
		if tonumber(str) == ply:UserID() then -- 7
			return ply -- 7
		end -- 7
		if str == ply:SteamID() then -- 8
			return ply -- 8
		end -- 8
		local lower_nick = ply:Nick():lower() -- 9
		local lower_steam = ply:SteamName():lower() -- 10
		local lower_str = str:lower() -- 11
		if string.find(lower_nick, lower_str, 1, true) ~= nil then -- 12
			return ply -- 12
		end -- 12
		if string.find(lower_steam, lower_str, 1, true) ~= nil then -- 13
			return ply -- 13
		end -- 13
	end -- 13
	return nil -- 14
end -- 1
local meta = FindMetaTable("Player") -- 16
for k, v in pairs({ -- 18
	CanSee = function(self, pos) -- 18
		local filter = { -- 19
			self -- 19
		} -- 19
		if isentity(pos) then -- 20
			filter[#filter + 1] = pos -- 21
			pos = pos:EyePos() -- 22
		end -- 20
		local tr = util.TraceLine({ -- 24
			start = self:IsPlayer() and self:EyePos() or self:WorldSpaceCenter(), -- 24
			endpos = pos, -- 25
			filter = filter, -- 26
			mask = MASK_SOLID + CONTENTS_WINDOW + CONTENTS_GRATE -- 27
		}) -- 23
		return tr.Fraction == 1 -- 29
	end, -- 18
	CanHear = function(self, pos) -- 31
		local filter = { -- 32
			self -- 32
		} -- 32
		if isentity(pos) then -- 33
			filter[#filter + 1] = pos -- 34
			pos = pos:EyePos() -- 35
		end -- 33
		local tr = util.TraceLine({ -- 37
			start = self:IsPlayer() and self:EyePos() or self:WorldSpaceCenter(), -- 37
			endpos = pos, -- 38
			filter = filter, -- 39
			mask = MASK_SOLID_BRUSHONLY -- 40
		}) -- 36
		return tr.Fraction == 1 -- 42
	end, -- 31
	LookingAt = function(self, ent) -- 44
		if self:CanSee(ent) then -- 45
			local tpos -- 46
			if ent:IsPlayer() then -- 47
				tpos = ent:EyePos() -- 48
			else -- 50
				tpos = ent:GetPos() -- 50
			end -- 47
			return self:LookingInDirection(tpos) -- 51
		end -- 45
	end, -- 44
	LookingInDirection = function(self, pos, pct) -- 53
		if pct == nil then -- 53
			pct = 0.95 -- 53
		end -- 53
		local diff = pos - self:GetShootPos() -- 54
		local match = self:GetAimVector():Dot(diff) / diff:Length() -- 55
		return match >= pct -- 56
	end, -- 53
	GetTraceFilter = function(self) -- 58
		local filter = { -- 59
			self -- 59
		} -- 59
		return filter -- 60
	end, -- 58
	GetViewOrigin = function(self) -- 62
		local pos -- 63
		local ang -- 64
		local ent = self:GetBodyEntity() -- 65
		if not IsValid(ent) then -- 66
			return -- 66
		end -- 66
		local head = ent:LookupBone("ValveBiped.Bip01_Head1") -- 67
		if head then -- 68
			if CLIENT then -- 69
				ent:SetupBones() -- 69
			end -- 69
			local matrix = ent:GetBoneMatrix(head) -- 70
			pos, ang = LocalToWorld(Vector(5, -5, 0), Angle(0, -90, -90), matrix:GetTranslation(), matrix:GetAngles()) -- 71
			if not ent:IsRagdoll() then -- 72
				ang = ent:EyeAngles() -- 72
			end -- 72
			local trace = util.TraceLine({ -- 74
				start = self:EyePos(), -- 74
				endpos = pos, -- 75
				filter = self:GetTraceFilter(), -- 76
				mins = Vector(-3, -3, -3), -- 77
				maxs = Vector(3, 3, 3), -- 78
				collisiongroup = COLLISION_GROUP_PLAYER_MOVEMENT -- 79
			}) -- 73
			pos = trace.HitPos -- 81
		end -- 68
		return pos, ang -- 82
	end -- 62
}) do -- 83
	meta[k] = v -- 17
end -- 17
