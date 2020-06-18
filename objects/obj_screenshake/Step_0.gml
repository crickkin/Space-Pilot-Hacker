pos += shake_force;

if (going_right && pos > camera_x + x_tilt_offset) {
	shake_force *= -1;
	going_right = false;
}
else if (!going_right && pos < camera_x - x_tilt_offset) {
	shake_force *= -1;
	going_right = true;
}

camera_set_view_pos(camera, pos, camera_y);

lifetime_timer++;
if (lifetime_timer >= lifetime * room_speed) {
	instance_destroy();
}