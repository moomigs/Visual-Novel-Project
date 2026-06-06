
var alternateInput = false;

var cl = camera_get_view_x(view_camera[0])
var ct = camera_get_view_y(view_camera[0])
var off_x = mouse_x - cl
var off_y = mouse_y - ct
var off_x_percent = off_x / camera_get_view_width(view_camera[0])
var off_y_percent = off_y / camera_get_view_height(view_camera[0])
var mousex = off_x_percent * display_get_gui_width()
var mousey = off_y_percent * display_get_gui_height()

if (Obj_MenuButton.menuVisible or Obj_HistoryButton.historyVisible) {
	alternateInput = true;
}
for (var i = 0; i < array_length(buttons); i++) {
	var button = array_get(buttons, i);
	if mousex >= (button.x-sprite_get_xoffset(button.sprite_index)) and mousey >= (button.y-sprite_get_yoffset(button.sprite_index)) and mousex <= (button.x-sprite_get_xoffset(button.sprite_index)+button.sprite_width*button.image_xscale) and mousey <= (button.y-sprite_get_yoffset(button.sprite_index)+button.sprite_height*button.image_yscale) {
		alternateInput = true;
		if variable_instance_get(button, "click") {
			button.click();
		}
	}
}

var view_width = display_get_gui_width();
var view_height = display_get_gui_height();

var number_of_choices = array_length(choices)
if choices_visible and number_of_choices>0 {
	var choice_width = global.default_width * 0.45;
	var choice_height = choice_width / 10;
	
	for (var i = 0; i < number_of_choices; i++) {
		var centered_index = (i - (number_of_choices - 1) * 0.5);
		var choice_y = view_height/2 + (choice_height + padding)* centered_index;
		var choice_x = view_width/2;
		
		if mousex >= choice_x - choice_width/2 and mousey >=choice_y - choice_height/2 and mousex <=choice_x + choice_width/2 and mousey <=choice_y + choice_height/2 {
			alternateInput = true;
			choice_case = i;
			choices_visible = false;
			next_line();
			break;
		}
	}
}


if !alternateInput {
	input();
}