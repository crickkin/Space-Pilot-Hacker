y += _speed * global.time_speed;

if (y > (room_height + sprite_height)) {
	instance_destroy();
}