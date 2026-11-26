if menuVisible {
	instance_destroy(Obj_SettingsMenu);
} else {
	menuVisible = true;
	instance_create_depth(0, 0, 0, Obj_SettingsMenu);
}