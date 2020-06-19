randomize();

game_over = false;
game_over_text_color = make_color_rgb(212, 30, 60);

game_over_option = 0;

saved = false;

yellow = make_color_rgb(255, 245, 64);
gray = make_color_rgb(146, 143, 184);
cyan = make_color_rgb(120, 215, 255);

text_alpha = 1;
fading = true;
fade_amount = 0.025;

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

	x_spawn_offset = 32;

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

ini_open("Settings/nonejam.ini");
global.highscore = ini_read_real("save1", "score", 0);
ini_close();

if (!audio_is_playing(snd_gameplay_shooter)) {
	audio_play_sound(snd_gameplay_shooter, 1, true);
}
if (!audio_is_playing(snd_gameplay_puzzle)) {
	audio_play_sound(snd_gameplay_puzzle, 1, true);
}

audio_sound_gain(snd_gameplay_shooter, global.master_volume * global.music_volume, 0);
audio_sound_gain(snd_gameplay_puzzle, 0, 0);