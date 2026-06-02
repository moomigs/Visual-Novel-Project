
if instance_exists(Obj_Player) {
	Obj_Player.freeze = false;
}

struct_foreach(characters, function (name, character) {
	instance_destroy(character);
} );

if variable_instance_exists(self, "ended") {
	self.ended();
}

instance_destroy(Obj_MenuButton);
instance_destroy(Obj_HistoryButton);
instance_destroy(Obj_SkipButton);