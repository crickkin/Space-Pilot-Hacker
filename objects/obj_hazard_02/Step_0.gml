event_inherited();

if (!global.time_slow) {
	image_angle += 0.5;

	if (image_angle == 360) image_angle = 0;

	if (shoot_timer <= 0) {
		for (var i = 0; i < 4; i++) {
			var bullet_pos_x = lengthdir_x(sprite_width, image_angle + (45 + i * 90));
			var bullet_pos_y = lengthdir_y(sprite_height, image_angle + (45 + i * 90));
	
			var bullet = instance_create_layer(x + bullet_pos_x, y + bullet_pos_y, layer, obj_bullet_enemy);
			bullet.direction = point_direction(x, y, x + bullet_pos_x, y + bullet_pos_y);
		}
	
		shoot_timer = time_to_shot;
	} 
	else {
		shoot_timer -= global.time_speed;
	}
}