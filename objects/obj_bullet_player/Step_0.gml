y -= _speed * global.time_speed;

var enemy = instance_place(x, y, obj_hazard_parent);

if (enemy != noone) {
	enemy.take_damage = true;
	instance_destroy();
}

if (y < 0) {
	instance_destroy();
}