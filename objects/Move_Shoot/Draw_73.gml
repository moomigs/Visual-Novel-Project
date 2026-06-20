if tracer_alpha > 0 {
	draw_set_alpha(tracer_alpha);
	draw_set_colour(c_aqua);
	draw_line_width(tracer_x1, tracer_y1, tracer_x2, tracer_y2, tracer_alpha*4);
	tracer_alpha *= .8;
	draw_set_alpha(1);
}