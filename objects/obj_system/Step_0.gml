#region Input
	var puzzle_trigger = keyboard_check_pressed(ord("C"));
	var fullscreen_trigger = keyboard_check_pressed(vk_f4);
	
	if (fullscreen_trigger) {
		window_set_fullscreen(!window_get_fullscreen());
	}
#endregion

//DEBUG
if (keyboard_check_pressed(vk_f1)) {
	puzzle_points += 10
}

if (keyboard_check_pressed(vk_f2)) {
	game_restart();
}

if (game_over)
	exit;

#region State Machine
	switch (state) {
		case puzzle_state.bullet_hell:
			if (puzzle_trigger && puzzle_points > 0) {
				global.time_slow = true;
			}
			
			if (global.time_slow) {
				
				global.time_speed = 0.2;
				layer_set_visible(puzzle_background_layer, true);
				state = puzzle_state.hacking_puzzle;
				Start_Puzzle(grid_cell_size, grid_cell_width, grid_cell_height);
				path_list = ds_list_create();
			}
		
			break;
		case puzzle_state.hacking_puzzle:
			if (puzzle_trigger && puzzle_points >= 3) {
				puzzle_points -= 3;
				global.time_slow = false;
			}
		
			if (!global.time_slow) {
				if (success) {
					Destroy_Bullets_on_Path();
					if (instance_exists(obj_player_ship)) {
						obj_player_ship.energy += 3;
						obj_player_ship.energy = clamp(obj_player_ship.energy, 0, obj_player_ship.max_energy);
					}
					success = false;
				}
				
				global.time_speed = 1;
				layer_set_visible(puzzle_background_layer, false);
				state = puzzle_state.bullet_hell;
				
				for (var i = 0; i < ds_list_size(path_list); i++) {
					instance_destroy(path_list[| i]);
				}
				
				ds_list_destroy(path_list);
				path_list = noone;
			}
		
			break;
		default:
			show_error("Deu ruim", false);
	}
#endregion

#region Bullet Hell
	if (spawn_timer <= 0) {
		Spawn_Hazard(x_spawn_offset);
		spawn_timer = time_to_spawn;
	}
	else {
		spawn_timer -= global.time_speed;
	}
#endregion