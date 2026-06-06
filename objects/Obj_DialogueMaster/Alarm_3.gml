paused = false;
input();
if global.dialogueSkipping {
	paused = true;
	alarm_set(3, game_get_speed(gamespeed_fps) * 0.1);
}