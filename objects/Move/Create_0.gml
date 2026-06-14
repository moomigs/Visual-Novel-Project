
x_velocity = 0;
y_velocity = 0;

right_x = 0;
right_y = 0;

function set_direction(dir) {
	direction = dir;
	if dir == 0 {
		x_velocity = 1;
		right_y = 1;
	} else if dir == 90 {
		y_velocity = -1;
		image_angle = 90;
		image_yscale = -1;
		right_x = 1;
	} else if dir == 270 {
		y_velocity = 1;
		image_angle = 270;
		right_x = -1;
	} else if dir == 180 {
		x_velocity = -1;
		image_xscale = -1;
		right_y = -1;
	}
}