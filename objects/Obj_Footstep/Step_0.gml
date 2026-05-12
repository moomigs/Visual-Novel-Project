image_alpha -= 1/fps;
if image_alpha <= 0 {
	instance_destroy();
}