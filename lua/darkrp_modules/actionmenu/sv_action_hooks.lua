-- [yue]: darkrp_modules\actionmenu\sv_action_hooks.yue
return netstream.Hook("PocketItem", function(ply, item) -- 1
	if item.Pocketable == false then -- 2
		return -- 2
	end -- 2
	local can_pickup, message = hook.Call("canPocket", GAMEMODE, ply, item) -- 3
	if not can_pickup then -- 4
		if message and SERVER then -- 5
			ply:Notify(message) -- 5
		end -- 5
		return -- 6
	end -- 4
	ply:PlaySignal(ACT_GMOD_GESTURE_ITEM_GIVE, true) -- 7
	ply:EmitSound("Pocket_Item") -- 8
	return ply:addPocketItem(item) -- 9
end) -- 10
