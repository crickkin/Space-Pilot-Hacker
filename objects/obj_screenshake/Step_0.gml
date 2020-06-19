pos += shake_force;

lifetime_timer++;
if (lifetime_timer >= lifetime * room_speed) {
	if (round(pos) == camera_x) {
		instance_destroy();
	}
	else {
		if (pos > camera_x) {
			pos -= abs(shake_force);
		}
		else {
			pos += abs(shake_force);
		}
	}
}
else {
	if (going_right && pos > x_tilt_offset) {
		shake_force *= -1;
		going_right = false;
	}
	else if (!going_right && pos < -x_tilt_offset) {
		shake_force *= -1;
		going_right = true;
	}

	camera_set_view_pos(camera, pos, camera_y);
}