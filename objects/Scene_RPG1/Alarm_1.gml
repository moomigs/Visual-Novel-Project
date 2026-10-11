new_player = instance_create_depth(collins.x, collins.y, collins.depth, Obj_Player);
collins.freeze = true;
collins.image_alpha = 0;
collins.x = -64;
collins.y = -64;

new_player.can_die = false
new_player.restart_room_on_die = true;

child.start_battle(new_player);