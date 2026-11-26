
audio_master_gain(global.game_settings.sliders[$"Volume"]);
if instance_exists(Obj_DialogueMaster) {
	Obj_DialogueMaster.typist.in(Obj_DialogueMaster.text_speed * global.game_settings.sliders[$"Text speed"]*1.2+0.35, 1);
	Obj_DialogueMaster.text_scale = global.game_settings.sliders[$"Font size"]*0.5 + 0.5;
}