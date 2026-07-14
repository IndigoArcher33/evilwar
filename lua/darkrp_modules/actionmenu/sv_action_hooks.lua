return netstream.Hook("PocketItem", function(ply, item)
	if item.Pocketable == false then
		return
	end
	local can_pickup, message = hook.Call("canPocket", GAMEMODE, ply, item)
	if not can_pickup then
		if message and SERVER then
			ply:Notify(message)
		end
		return
	end
	ply:PlaySignal(ACT_GMOD_GESTURE_ITEM_GIVE, true)
	ply:EmitSound("Pocket_Item")
	return ply:addPocketItem(item)
end)
