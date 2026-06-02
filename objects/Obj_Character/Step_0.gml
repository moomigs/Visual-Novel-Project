var _x = display_get_gui_width()/2 + slide_x*display_get_gui_width()/2;
var _y = display_get_gui_height()/2 - slide_y*display_get_gui_height()/2;

x = x + (_x - x) * 0.25;
y = y + (_y - y) * 0.25;

image_alpha = image_alpha + ((desired_alpha/100) - image_alpha) * alpha_slide;