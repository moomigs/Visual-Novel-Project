if variable_global_exists("gem_power") and global.gem_power == true and attacking_disabled == false and not freeze {
	audio_play_sound(snd_gempull, 1, false);
	with(Obj_NPC) {
		if friendly { continue; }
		var _d_x = other.x - x;
		var _d_y = other.y - y;
		var _dist = point_distance(0, 0, _d_x, _d_y);
		if _dist > 320 { continue; }
		var _force = 5 / _dist;
		push(_force*-_d_x * 1.5, _force*-_d_y * 1.5);
	}
}