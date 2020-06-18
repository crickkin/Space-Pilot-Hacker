if (damage_effect) {
	shader_set(shdr_flash_effect);
	draw_self();
	draw_sprite(spr_hazard_02_body, 0, x, y);
	shader_reset();
	flash_timer--;
	if (flash_timer <= 0) {
		damage_effect = false;
		flash_timer = flashing_time;
	}
}
else {
	draw_self();
	draw_sprite(spr_hazard_02_body, 0, x, y);
}

