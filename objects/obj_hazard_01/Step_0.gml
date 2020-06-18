event_inherited();

if (shoot_timer <= 0) {
	audio_play_sound(sfx_shot_enemy, 5, false);
	audio_sound_gain(sfx_shot_enemy, global.master_volume * global.sfx_volume, 0);
	
	instance_create_layer(x - (sprite_width/2) , y, layer, bullet);
	instance_create_layer(x + (sprite_width/2) , y, layer, bullet);
	shoot_timer = time_to_shot + random_range(0, 30);
}
else {
	shoot_timer -= global.time_speed;
}