var view_width = view_get_wport(view_camera[0]);
var view_height = view_get_hport(view_camera[0]);

draw_set_font(fnt_ark);

if (instance_exists(obj_player_ship)) {
	player_hp = obj_player_ship.hp;
	player_max_hp = obj_player_ship.max_hp;
}
else {
	player_hp = 0;
}



draw_rectangle_color(20, 20, 20 + ((player_hp * 100)/player_max_hp), 30, c_red, c_red, c_red, c_red, false);
draw_rectangle_color(20, 20, 20 + ((player_max_hp * 100)/player_max_hp), 30, c_white, c_white, c_white, c_white, true);

#region Energy Bar
	var energy_spr_size = 2;

	if (instance_exists(obj_player_ship)) {
		player_energy = obj_player_ship.energy;
		player_max_energy = obj_player_ship.max_energy;
		player_energy_slot = obj_player_ship.current_energy_slot;
	}

	for (var i = 0; i < player_max_energy; i++) {
		draw_sprite_ext(spr_energy, 1, 20 + 15 * i, view_height - 40, energy_spr_size, energy_spr_size, 0, c_white, 1);
		if (player_energy > i) {
			draw_sprite_ext(spr_energy, 0, 20 + 15 * i, view_height - 40, energy_spr_size, energy_spr_size, 0, c_white, 1);
		}
		else if (player_energy == i) {
			var show_pixels = energy_sprite_states[player_energy_slot];
			draw_sprite_part_ext(spr_energy, 0, 0, show_pixels, 8, 11 - show_pixels, (20 + 15 * i) - 6, (view_height - 40) - 10 + (show_pixels * 2), energy_spr_size, energy_spr_size, c_white, 1);
		}
	}
#endregion

draw_text_ext_colour(22, 42, "score: " + string(_score), 1, 300, c_black, c_black, c_black, c_black, 1);
draw_text(20, 40, "score: " + string(_score));

draw_sprite_ext(spr_pp_icon, 0, view_width - 100, 12, 0.9, 0.9, 0, c_white, 0.8);
draw_text_ext_colour(view_width - 58, 22, string(puzzle_points), 1, 58, c_black, c_black, c_black, c_black, 1);
draw_text(view_width - 60, 20, string(puzzle_points));

if (game_over) {
	draw_set_alpha(0.7);
	draw_rectangle_color(0, 0, view_width, view_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var text_size = 5;
	draw_text_transformed_color((view_width/2) + 10, (view_height/2 - 120) + 10, "Game Over", text_size, text_size, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(view_width/2, view_height/2 - 120, "Game Over", text_size, text_size, 0, game_over_text_color, game_over_text_color, game_over_text_color, game_over_text_color, 1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}