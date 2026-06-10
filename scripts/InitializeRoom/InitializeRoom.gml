function InitializeRoom() {
	var layer_id = layer_get_id("Background");
	if (layer_id != -1)
	{
	    layer_depth(layer_id, 100000 + room_height);
	}
	audio_stop_all();
}

return InitializeRoom;