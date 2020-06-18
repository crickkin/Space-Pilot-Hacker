speed = _speed * global.time_speed;

var player = instance_place(x, y, obj_player_ship);

if (player != noone) {
	player.damage = 1;
	instance_destroy();
}

if (y > (room_height + sprite_height)) {
	instance_destroy();
}