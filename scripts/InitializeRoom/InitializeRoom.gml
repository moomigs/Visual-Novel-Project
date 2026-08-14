function InitializeRoom() {
	var layer_id = layer_get_id("Background");
	if (layer_id != -1)
	{
	    layer_depth(layer_id, 100000 + room_height + 1);
	}
	var tiles_layer_id = layer_get_id("Tiles_1");
	if (tiles_layer_id != -1)
	{
	    layer_depth(tiles_layer_id, 100000 + room_height);
	}
	
	audio_stop_all();
	global.entity_pause = false;
	
	var player = instance_exists(Obj_Player);
	if player == true {
		//room_set_viewport(room, 0, true, 0, 0, 640, 360);
		camera_set_view_size(view_camera[0], 640, 360);
		camera_set_view_target(view_camera[0], Obj_Player);
		camera_set_view_border(view_camera[0], 320, 180); 
		view_set_visible(view_camera[0], true);
	}
}

return InitializeRoom;