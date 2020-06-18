if (y < room_height) {
	instance_create_layer(x, y, layer, obj_ship_explosion);
	var shake = instance_create_depth(x, y, 0, obj_screenshake);
	shake.shake_force = 3;
	shake.x_tilt_offset = 1.8;
	shake.lifetime = .5;
}

if (killed) {
	obj_system._score += kill_points;
	
	var probability = irandom_range(0, 100);
	if (probability < 80) {
		instance_create_layer(x, y, "Player", obj_puzzle_point);
	}
}