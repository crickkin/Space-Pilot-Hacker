if (take_damage) {
	hp--;
	take_damage = false;
	damage_effect = true;
	obj_system._score += damage_points;
	if (hp <= 0) {
		killed = true;
		instance_destroy();
	}
}

var player = instance_place(x, y, obj_player_ship)
if (player != noone) {
	player.damage += explosion_damage;
	instance_destroy();
}