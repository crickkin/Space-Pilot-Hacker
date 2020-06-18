#region Collision
	var player = instance_place(x, y, obj_player_ship);
	if (player != noone) {
		audio_play_sound(sfx_collect_point, 5, false);
		audio_sound_gain(sfx_collect_point, global.master_volume * global.sfx_volume, 0);
		
		obj_system.puzzle_points++;
		instance_destroy();
		
		var shake = instance_create_depth(x, y, 0, obj_screenshake);
		shake.shake_force = .8;
		shake.x_tilt_offset = 1.2;
		shake.lifetime = .3;
		
		var particle_quantity = random_range(30, 50);
		for (var i = 0; i < particle_quantity; i++) {
			var star_particle = instance_create_depth(x, y, 0, obj_star_particle);
			star_particle._speed = random_range(1, 3);
			star_particle.horizontal_speed = random_range(-0.8, 0.8);
			star_particle.vertical_speed = random_range(-0.2, 0.4);
			star_particle.horizontal_speed_overtime = random_range(-0.0004, 0.0004);
			star_particle.vertical_speed_overtime = random_range(-0.002, -0.008);
			star_particle.alpha_over_lifetime = random_range(0.8, 0.3);
			star_particle.lifetime = 0.6;
		}
	}
#endregion

#region Routine
	lifetime -= global.time_speed;

	if (lifetime < room_speed * 1.2) {
		if (fade_out) {
			image_alpha -= oscilation_speed * global.time_speed;
			if (image_alpha < 0.5) {
				fade_out = false;
			}
		}
		else {
			image_alpha += oscilation_speed * global.time_speed;
			if (image_alpha >= 1) {
				fade_out = true;
			}
		}
	}

	if (lifetime <= 0) {
		instance_destroy();
	}
#endregion

#region Animation
	if (going_up) {
		y -= position_speed;
		if (y < original_y - position_oscilation) {
			going_up = false;
		}
	}
	else {
		y += position_speed;
		if (y >= original_y) {
			going_up = true;
		}
	}
#endregion