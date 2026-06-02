if file_name != "" {
	if (file_exists(file_name)) {
	    var _file = file_text_open_read(file_name);
		var i = 0;
		while (!file_text_eof(_file))
		{
		    var s = file_text_read_string(_file);
			lines[i] = s;
		    file_text_readln(_file);
			i ++;
		}
		file_text_close(_file);
	}
} else if dialogue_code != "" {
	var _delimiters = ["\r\n", "\n", "\r"];
	lines = string_split_ext(dialogue_code, _delimiters);
}

view_width = display_get_gui_width();
view_height = display_get_gui_height();

array_push(buttons,
	instance_create_depth(
		view_width/2,
		view_height - sprite_get_height(spr_menubutton) - 3,
		1, Obj_MenuButton));
array_push(buttons,
	instance_create_depth(
	view_width/2 - sprite_get_width(spr_menubutton) - padding/3,
	view_height - sprite_get_height(spr_menubutton) - 3,
	1, Obj_HistoryButton));
array_push(buttons,
	instance_create_depth(
	view_width/2 + sprite_get_width(spr_menubutton) + padding/3,
	view_height - sprite_get_height(spr_menubutton) - 3,
	1, Obj_SkipButton));

alarm_set(0, 1);

active = true;