if instance_exists(Obj_MenuButton) or instance_exists(Obj_MainMenuButton) {return;}
if instance_exists(Obj_SettingsMenu) {
	instance_destroy(Obj_SettingsMenu);
} else {
	instance_create_depth(0, 0, 0, Obj_SettingsMenu);
}