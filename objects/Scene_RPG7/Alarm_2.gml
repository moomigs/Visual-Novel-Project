fade_effect.fade_in(1);

collins = instance_create_depth(600, 360, new_player.depth, Obj_Entity_Collins);
vampire.x = 696; vampire.y = 360;
vampire.face_direction("left");
instance_destroy(new_player);

collins.scene_setsprite = spr_Player_forward_fatigued;

richard = instance_create_depth(288, 360, 0, Obj_Entity_Richard);
richard.ignore_collision = true;