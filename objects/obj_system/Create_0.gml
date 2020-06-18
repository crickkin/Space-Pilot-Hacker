randomize();

game_over = false;
game_over_text_color = make_color_rgb(174, 24, 58);

global.time_slow = false;
global.time_speed = 1;

enum puzzle_state {
	bullet_hell,
	hacking_puzzle,
};

state = puzzle_state.bullet_hell;

#region Bullet Hell
	time_to_spawn = 1.8 * room_speed;
	spawn_timer = time_to_spawn;

	_score = 0;
	puzzle_points = 0;

	x_spawn_offset = 30

	player_hp = 0;
	player_max_hp = 0;

	player_energy = 0;
	player_max_energy = 0;
	player_energy_slot = 0;
	energy_sprite_states = [0, 9, 7, 5, 3];
#endregion

#region Hacking Puzzle
	puzzle_background_layer = layer_get_id("Puzzle_Background");
	
	grid_cell_size = 64;
	grid_cell_width = 10;
	grid_cell_height = 5;
	
	path_list = noone;
	
	success = false;
#endregion

repeat(3) {
	Spawn_Hazard(x_spawn_offset);
}