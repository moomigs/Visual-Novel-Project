
var cl = camera_get_view_x(view_camera[0])
var ct = camera_get_view_y(view_camera[0])
var off_x = mouse_x - cl
var off_y = mouse_y - ct
var off_x_percent = off_x / camera_get_view_width(view_camera[0])
var off_y_percent = off_y / camera_get_view_height(view_camera[0])
var mousex = off_x_percent * display_get_gui_width()
var mousey = off_y_percent * display_get_gui_height()

var button_cx = x + sprite_size/2;
var button_cy = y + sprite_size/2;
if mousex > (button_cx-button_size/2) and mousey > (button_cy-button_size/2) and mousex < (button_cx+button_size/2) and mousey < (button_cy+button_size/2) {
	click();
}