if variable_global_exists("link") and not freeze {
	if call_menu_open == false {
		call_menu_open = 1;
	} else {
		call_menu_open = false;
	}
}