collins.freeze = false;
collins.image_alpha = 1;
collins.x = 672;
collins.y = 360;

richard.x = 720;
richard.y = 360;

richard.push_x = 0;
richard.push_y = 0;
collins.push_x = 0;
collins.push_y = 0;

collins.face_direction("right");
richard.face_direction("left");

instance_destroy(new_player);

fade_effect.fade_in(0.5);