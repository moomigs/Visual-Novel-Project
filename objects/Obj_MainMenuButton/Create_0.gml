menuVisible = false;

function click() {
	if instance_exists(Obj_SettingsMenu) {
		instance_destroy(Obj_SettingsMenu);
		menuVisible = false;
	} else {
		menuVisible = true;
		instance_create_depth(0, 0, 0, Obj_SettingsMenu);
	}
}
