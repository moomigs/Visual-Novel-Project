if attack_proximity == true {
	var _player = instance_find(Obj_Player, 0);
	if _player != noone and point_distance(_player.x, _player.y, x, y) < 256 {
		if battle_target == noone {
			start_battle(_player);
		}
	}
}