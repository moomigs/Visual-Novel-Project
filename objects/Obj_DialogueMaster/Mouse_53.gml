
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
	if mousex >= (button.x-sprite_get_xoffset(button.sprite_index)) and mousey > (button.y-sprite_get_yoffset(button.sprite_index)) and mousex <= (button.x-sprite_get_xoffset(button.sprite_index)+button.sprite_width*button.image_xscale) and mousey <= (button.y-sprite_get_yoffset(button.sprite_index)+button.sprite_height*button.image_yscale) {
		alternateInput = true;
		if variable_instance_get(button, "click") {
			button.click();
		}
	}
}


if !alternateInput {
	input();
}