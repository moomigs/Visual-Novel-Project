
draw_self();
	
var _x1 = start_x + x_velocity*forward_offset - abs(right_x)*WIDTH/2;
var _y1 = start_y + y_velocity*forward_offset - abs(right_y)*WIDTH/2;
var _x2 = start_x + x_velocity*forward_offset + x_velocity*TRAVEL + abs(right_x)*WIDTH/2;
var _y2 = start_y + y_velocity*forward_offset + y_velocity*TRAVEL + abs(right_y)*WIDTH/2;
	
var x1 = min(_x1, _x2);
var y1 = min(_y1, _y2);
var x2 = max(_x1, _x2);
var y2 = max(_y1, _y2);

draw_set_alpha(1);
draw_set_colour(c_blue);
//draw_rectangle(x1, y1, x2, y2, true);