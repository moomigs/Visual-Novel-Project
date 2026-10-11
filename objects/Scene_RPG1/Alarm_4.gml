var fade = instance_create_depth(0, 0, 0, Effect_transition_fade);
fade.transition = function(){
	instance_destroy(new_player);
	
	collins.freeze = false;
	collins.image_alpha = 1;

	collins.x = 256;
	collins.y = 352;
	collins.direction = 0;

	gordon.x = 416;
	gordon.y = 352;
	
	camera_set_view_pos(view_camera[0], 0, 150);
}
fade.start(1);