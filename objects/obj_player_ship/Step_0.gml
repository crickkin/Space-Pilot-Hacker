#region Input
	var left = keyboard_check(vk_left);
	var right = keyboard_check(vk_right);
	var up = keyboard_check(vk_up);
	var down = keyboard_check(vk_down);

	var shoot = keyboard_check_pressed(ord("Z"));

	#region Shoot
		if (can_shoot) {
			if (shoot && !global.time_slow) {
				audio_play_sound(sfx_shot_player, 5, false);
				audio_sound_gain(sfx_shot_player, global.master_volume * global.sfx_volume * 0.7, 0);
				bullets = 0;
				state = player_state.shooting;
				can_shoot = false;
				var shoot_shake = instance_create_depth(x, y, 0, obj_screenshake);
				shoot_shake.shake_force = random_range(.4, .6);
				shoot_shake.x_tilt_offset = .2;
				shoot_shake.lifetime = .3;
			}
		}
		else if (timer == 0) {
			can_shoot = true;
			timer = time_to_shot;
		}
		else {
			timer -= global.time_speed;
		}
	
	#endregion

	#region Movement
		var horizontal_movement = (right - left) * _speed;
		var vertical_movement = (down - up) * _speed;
		
		if (global.time_slow) {
			horizontal_movement = 0;
			vertical_movement = 0;
		}

		horizontal = lerp(horizontal, horizontal_movement, acceleration);
		vertical = lerp(vertical, vertical_movement, acceleration);
	#endregion

#endregion

#region Routine
	if (damage > 0) {
		audio_play_sound(sfx_damage, 15, false);
		audio_sound_gain(sfx_damage, global.master_volume * global.sfx_volume, 0);
		
		hp -= damage;
		damage_animation = true;
		var shake = instance_create_depth(x, y, 0, obj_screenshake);
		if (hp <= 0) {
			instance_destroy();
			shake.shake_force = 10;
			shake.x_tilt_offset = 6;
			shake.lifetime = .5;
		}
		else {
			shake.lifetime = .2;
		}
		damage = 0;
	}
	
	if (use_timer <= 0) {
		current_energy_slot--;
		if (current_energy_slot == 0) {
			if (energy <= 0) {
				instance_destroy();
				var shake = instance_create_depth(x, y, 0, obj_screenshake);
				shake.shake_force = 10;
				shake.x_tilt_offset = 6;
				shake.lifetime = .5;
			}
			else {
				energy--;
				current_energy_slot = energy_slot_limit;
			}
		}
		use_timer = energy_time_of_use;
	}
	else {
		use_timer -= global.time_speed;
	}
#endregion

#region State Machine
	switch (state) {
		case player_state.moving:
			break;
		case player_state.shooting:
			if (bullets < bullets_per_shot) {
				if (timer % 2 = 0) {
					instance_create_layer(x, y, layer, obj_bullet_player);
					bullets++;
				}
			}
			else {
				state = player_state.moving;
			}
			
			break;
		default:
			show_error("deu ruim", false);
	}
#endregion