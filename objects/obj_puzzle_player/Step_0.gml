if (!global.time_slow)
	instance_destroy();

#region Input
	var left = keyboard_check_pressed(vk_left);
	var right = keyboard_check_pressed(vk_right);
	var up = keyboard_check_pressed(vk_up);
	var down = keyboard_check_pressed(vk_down);
#endregion

#region Movement
	if (!puzzle_finished) {
		var horizontal = (right - left) * obj_system.grid_cell_size;
		var vertical = (down - up) * obj_system.grid_cell_size;

		if (horizontal != 0)
			vertical = 0;

		if (horizontal != 0 || vertical != 0) {
			if (!place_meeting(x, y, obj_starting_point)) {
				line_count++;
				var line = instance_create_layer(x, y, "Puzzle_Piece", obj_line);
				line.pos = (1 * left) + (2 * right) + (4 * up) + (8 * down);
				line._id = line_count;
			}
			obj_system.puzzle_points--;
			if (obj_system.puzzle_points <= 0) {
				puzzle_finished = true;
				
				if (place_meeting(x + horizontal, y + vertical, obj_goal)) {
					obj_system.success = true;
					
					var particle_quantity = random_range(15, 30);
					for (var i = 0; i < particle_quantity; i++) {
						var propulsion_particle = instance_create_depth(x + irandom_range(24, 30), y + 32, -100, obj_puzzle_propulsion);
						propulsion_particle._speed = random_range(3, 6);
						propulsion_particle.horizontal_speed = random_range(-0.25, 0.25);
						propulsion_particle.vertical_speed = random_range(-0.2, -0.8);
						propulsion_particle.horizontal_speed_overtime = random_range(-0.0004, 0.0004);
						propulsion_particle.vertical_speed_overtime = random_range(-0.002, -0.008);
						propulsion_particle.size = random_range(0.8, 1.5);
						propulsion_particle.particle_index = irandom_range(0, 2);
						propulsion_particle.alpha_over_lifetime = random_range(0.8, 0.3);
						propulsion_particle.lifetime = 0.4;
					}
				}
			}
		}
		
		x += horizontal;
		x = clamp(x, obj_system.grid_cell_size, obj_system.grid_cell_size * obj_system.grid_cell_width); 

		y += vertical;
		y = clamp(y, obj_system.grid_cell_size, obj_system.grid_cell_size * obj_system.grid_cell_height);
	}
#endregion

#region Collision & Output
	if (!puzzle_finished) {
		if (place_meeting(x, y, obj_goal)) {
			obj_system.success = true;
			puzzle_finished = true;
			
			var particle_quantity = random_range(15, 30);
			for (var i = 0; i < particle_quantity; i++) {
				var propulsion_particle = instance_create_depth(x + irandom_range(24, 30), y + 32, -100, obj_puzzle_propulsion);
				propulsion_particle._speed = random_range(3, 6);
				propulsion_particle.horizontal_speed = random_range(-0.25, 0.25);
				propulsion_particle.vertical_speed = random_range(-0.2, -0.8);
				propulsion_particle.horizontal_speed_overtime = random_range(-0.0004, 0.0004);
				propulsion_particle.vertical_speed_overtime = random_range(-0.002, -0.008);
				propulsion_particle.size = random_range(0.8, 1.5);
				propulsion_particle.particle_index = irandom_range(0, 2);
				propulsion_particle.alpha_over_lifetime = random_range(0.8, 0.3);
				propulsion_particle.lifetime = 0.4;
			}
		}
		else {
			var firewall = instance_place(x, y, obj_firewall);
			if (firewall) {
				instance_destroy(firewall);
				puzzle_finished = true;
				destroyed = true;
				instance_create_depth(x, y, depth - 50, obj_puzzle_explosion);
			}
		}
	}

	if (puzzle_finished) {
		end_timer--;
		if (end_timer <= 0) {
			global.time_slow = false;
			end_timer = puzzle_end_wait;
		}
	}
#endregion