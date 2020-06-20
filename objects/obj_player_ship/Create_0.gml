#region Base Attributes
	max_hp = 40;
	hp = max_hp;

	horizontal = 0;
	vertical = 0;

	acceleration = .12;
	_speed = 6.5;
#endregion

#region Shoot Attributes
	time_to_shot = 6;
	timer = time_to_shot;
	can_shoot = true;
	bullets_per_shot = 3;
	bullets = 0;
#endregion

#region Damage & Energy Attributes
	max_energy = 8;
	energy = max_energy;
	energy_slot_limit = 4;
	current_energy_slot = energy_slot_limit;

	energy_time_of_use = 1.8 * room_speed;
	use_timer = energy_time_of_use;

	damage = 0;
#endregion

#region Animation
	damage_animation = false;
	flashing_time = 4;
	flash_timer = flashing_time;

	image_index = 1;

	propulsion_index = 0;
	propulsion_sprite_speed = .15;
#endregion

enum player_state {
	moving,
	shooting,
}

state = player_state.moving;

audio_play_sound(sfx_propulsion, 2, true);
audio_sound_gain(sfx_propulsion, global.master_volume * global.sfx_volume, 0);