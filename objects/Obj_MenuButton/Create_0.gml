menuVisible = false;
if instance_exists(Obj_SettingsMenu) {
	instance_destroy(Obj_SettingsMenu);
}

function click() {
	if instance_exists(Obj_SettingsMenu) {
		instance_destroy(Obj_SettingsMenu);
		menuVisible = false;
	} else {
		menuVisible = true;
		instance_create_depth(0, 0, 0, Obj_SettingsMenu);
	}
	if instance_exists(Obj_HistoryButton) {
		if Obj_HistoryButton.historyVisible {
			Obj_HistoryButton.historyVisible = false;
		}
	}
}