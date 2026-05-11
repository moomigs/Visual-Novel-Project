x = x + (slide_x - x) * 0.25;
y = y + (slide_y - y) * 0.25;

image_alpha = image_alpha + ((desired_alpha/100) - image_alpha) * alpha_slide;