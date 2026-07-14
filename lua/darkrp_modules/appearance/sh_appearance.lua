local meta = FindMetaTable("Player")
if SERVER then
	meta.BuildAppearance = function(self)
		local app = { }
		app.head = {
			Model = "models/toxidroma/heads/burned.mdl",
			Bonemerge = true
		}
		app.torso = {
			Model = "models/toxidroma/torso/citizen.mdl",
			Bonemerge = true
		}
		app.legs = {
			Model = "models/toxidroma/legs/citizen.mdl",
			Bonemerge = true
		}
		local jt = self:getJobTable()
		local name = self:Name()
		if jt.appearance_models then
			for slot, data in pairs(jt.appearance_models) do
				local mdl
				local mats
				if isstring(data) then
					mdl = data
				elseif istable(data) then
					if data.Model then
						mdl = data.Model
						mats = data.Materials
					else
						mdl = data
					end
				end
				if isstring(mdl) then
				elseif istable(mdl) then
					local idx = math.ceil(util.SharedRandom(name, 0, #mdl))
					mdl = mdl[idx]
				end
				if istable(mats) then
					mats = table.Copy(mats)
					for k, v in pairs(mats) do
						if istable(v) then
							local idx = math.ceil(util.SharedRandom(name, 0, #v))
							mats[k] = v[idx]
						end
					end
				end
				if app[slot] then
					app[slot].Model = mdl
					app[slot].Materials = mats
				else
					app[slot] = {
						Model = mdl,
						Materials = mats,
						Bonemerge = true
					}
				end
				if app[slot].Model then
					if istable(data) then
						local _list_0 = {
							"Color",
							"Bodygroups"
						}
						for _index_0 = 1, #_list_0 do
							local p = _list_0[_index_0]
							app[slot][p] = data[p]
						end
					end
				else
					app[slot] = nil
				end
			end
		end
		local _list_0 = self:GetAllEquipment()
		for _index_0 = 1, #_list_0 do
			local eq = _list_0[_index_0]
			if eq.EquipSlot and eq.Appearance then
				local _obj_0 = eq.Appearance
				_obj_0.Bonemerge = _obj_0.Bonemerge or true
				app[eq.EquipSlot] = eq.Appearance
			end
		end
		return app
	end
	meta.UpdateAppearance = function(self)
		return netstream.Broadcast("PlayerAppearanceAltered", self, self:BuildAppearance())
	end
	local update_appearance
	update_appearance = function(ply)
		return ply:UpdateAppearance()
	end
	hook.Add("OnPlayerChangedTeam", "evilrp_update_appearance", update_appearance)
end
if CLIENT then
	meta.ApplyAppearance = function(self, appearance)
		part.Add(self, "appearance", appearance)
		if not (self.legs and IsValid(self.legs)) then
			self:SpawnLegs()
		end
		if self.legs and IsValid(self.legs) then
			part.Add(self.legs, "appearance", appearance)
		end
		local rag = self:Ragdoll()
		if rag and IsValid(rag) then
			part.Add(rag, "appearance", appearance)
		end
		self.last_appearance = appearance
	end
	return netstream.Hook("PlayerAppearanceAltered", function(who, payload)
		return who:ApplyAppearance(payload)
	end)
end
