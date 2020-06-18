draw_sprite(spr_player_propulsion, propulsion_index, x, y + sprite_height - 6);
propulsion_index += propulsion_sprite_speed;
if (propulsion_index > 4)
	propulsion_index = 0;

if (damage_animation) {
	shader_set(shdr_flash_effect);
	draw_self();
	shader_reset();
	flash_timer--;
	if (flash_timer <= 0) {
		damage_animation = false;
		flash_timer = flashing_time;
	}
}
else {
	draw_self();
}

//0E0F2C