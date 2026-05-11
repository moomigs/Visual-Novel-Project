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

instance_create_depth(room_width/2, textbox_y + sprite_get_height(spr_dialoguebox) + padding/3, 1, Obj_MenuSettings);

alarm_set(0, 1);