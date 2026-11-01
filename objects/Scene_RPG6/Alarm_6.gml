collins.defending = true;
collins.scene_setsprite = spr_Player_right_defending;

var attack = instance_create_depth(richard.x, richard.y, richard.depth, Move_Shoot);
attack.mover = richard;
attack.go(180);

alarm_set(7, 15);