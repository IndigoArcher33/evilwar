GAMEMODE.FindPlayer = function(self, str)
	if not str then
		return nil
	end
	if str == "" then
		return nil
	end
	local plys = player.GetAll()
	for i = 1, #plys do
		local ply = plys[i]
		if tonumber(str) == ply:UserID() then
			return ply
		end
		if str == ply:SteamID() then
			return ply
		end
		local lower_nick = ply:Nick():lower()
		local lower_steam = ply:SteamName():lower()
		local lower_str = str:lower()
		if string.find(lower_nick, lower_str, 1, true) ~= nil then
			return ply
		end
		if string.find(lower_steam, lower_str, 1, true) ~= nil then
			return ply
		end
	end
	return nil
end
local meta = FindMetaTable("Player")
for k, v in pairs({
	CanSee = function(self, pos)
		local filter = {
			self
		}
		if isentity(pos) then
			filter[#filter + 1] = pos
			pos = pos:EyePos()
		end
		local tr = util.TraceLine({
			start = self:IsPlayer() and self:EyePos() or self:WorldSpaceCenter(),
			endpos = pos,
			filter = filter,
			mask = MASK_SOLID + CONTENTS_WINDOW + CONTENTS_GRATE
		})
		return tr.Fraction == 1
	end,
	CanHear = function(self, pos)
		local filter = {
			self
		}
		if isentity(pos) then
			filter[#filter + 1] = pos
			pos = pos:EyePos()
		end
		local tr = util.TraceLine({
			start = self:IsPlayer() and self:EyePos() or self:WorldSpaceCenter(),
			endpos = pos,
			filter = filter,
			mask = MASK_SOLID_BRUSHONLY
		})
		return tr.Fraction == 1
	end,
	LookingAt = function(self, ent)
		if self:CanSee(ent) then
			local tpos
			if ent:IsPlayer() then
				tpos = ent:EyePos()
			else
				tpos = ent:GetPos()
			end
			return self:LookingInDirection(tpos)
		end
	end,
	LookingInDirection = function(self, pos, pct)
		if pct == nil then
			pct = 0.95
		end
		local diff = pos - self:GetShootPos()
		local match = self:GetAimVector():Dot(diff) / diff:Length()
		return match >= pct
	end,
	GetTraceFilter = function(self)
		local filter = {
			self
		}
		return filter
	end,
	GetViewOrigin = function(self)
		local pos
		local ang
		local ent = self:GetBodyEntity()
		if not IsValid(ent) then
			return
		end
		local head = ent:LookupBone("ValveBiped.Bip01_Head1")
		if head then
			if CLIENT then
				ent:SetupBones()
			end
			local matrix = ent:GetBoneMatrix(head)
			pos, ang = LocalToWorld(Vector(5, -5, 0), Angle(0, -90, -90), matrix:GetTranslation(), matrix:GetAngles())
			if not ent:IsRagdoll() then
				ang = ent:EyeAngles()
			end
			local trace = util.TraceLine({
				start = self:EyePos(),
				endpos = pos,
				filter = self:GetTraceFilter(),
				mins = Vector(-3, -3, -3),
				maxs = Vector(3, 3, 3),
				collisiongroup = COLLISION_GROUP_PLAYER_MOVEMENT
			})
			pos = trace.HitPos
		end
		return pos, ang
	end
}) do
	meta[k] = v
end
