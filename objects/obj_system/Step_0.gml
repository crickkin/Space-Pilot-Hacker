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

if (_score > global.highscore) {
	global.highscore = _score;
}

if (game_over) {
	
	if (!saved) {
		ini_open("Settings/nonejam.ini");
		ini_write_real("save1", "score", global.highscore);
		ini_close();
		saved = true;
	}
	
	if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_down)) {
		game_over_option = !game_over_option;
	}
	
	if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
		if (game_over_option == 0) {
			Restart_Game();
		}
	}
	
	exit;
}

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
				
				audio_sound_gain(snd_gameplay_puzzle, global.master_volume * global.music_volume, 0);
				audio_sound_gain(snd_gameplay_shooter, 0, 0);
				
				audio_play_sound(sfx_puzzle_started, 10, false);
				audio_sound_gain(sfx_puzzle_started, global.master_volume * global.sfx_volume, 0);
			}
		
			break;
		case puzzle_state.hacking_puzzle:
			if (puzzle_trigger && puzzle_points >= 3) {
				puzzle_points -= 3;
				global.time_slow = false;
				audio_play_sound(sfx_puzzle_closed, 10, false);
				audio_sound_gain(sfx_puzzle_closed, global.master_volume * global.sfx_volume, 0);
			}
		
			if (!global.time_slow) {
				if (success) {
					Destroy_Bullets_on_Path();
					if (instance_exists(obj_player_ship)) {
						obj_player_ship.energy += 3;
						obj_player_ship.energy = clamp(obj_player_ship.energy, 0, obj_player_ship.max_energy);
					}
					audio_play_sound(sfx_goal, 10, false);
					audio_sound_gain(sfx_goal, global.master_volume * global.sfx_volume, 0);
					success = false;
				}
				else if (!puzzle_trigger) {
					audio_play_sound(sfx_puzzle_failed, 10, false);
					audio_sound_gain(sfx_puzzle_failed, global.master_volume * global.sfx_volume, 0);
				}
				
				global.time_speed = 1;
				layer_set_visible(puzzle_background_layer, false);
				state = puzzle_state.bullet_hell;
				
				audio_sound_gain(snd_gameplay_shooter, global.master_volume * global.music_volume, 0);
				audio_sound_gain(snd_gameplay_puzzle, 0, 0);
				
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