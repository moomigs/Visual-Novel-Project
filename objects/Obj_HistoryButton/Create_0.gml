historyVisible = false;

scroll_y = 0;

view_width = display_get_gui_width();
view_height = display_get_gui_height();

height = view_height * 0.67;
width = height * 1;
padding = 20;

close_button = instance_create_depth(view_width/2 + width/2, view_height/2 - height/2, -1, Obj_CloseButton);
close_button.close = function() {
	historyVisible = false;
};
array_push(Obj_DialogueMaster.buttons, close_button);

function click() {
	historyVisible = !historyVisible;
	if Obj_MenuButton.menuVisible {
		Obj_MenuButton.menuVisible = false;
	}
}
