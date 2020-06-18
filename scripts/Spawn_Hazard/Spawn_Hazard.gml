///@arg x_offset
var x_spawn_offset = argument0;

var collision_offset = 32;

do {
	var pos_x = random_range(x_spawn_offset, room_width - x_spawn_offset);
	var pos_y = random_range(0, -30);
} until (!collision_rectangle(pos_x - collision_offset, pos_y - collision_offset, pos_x + collision_offset, pos_y + collision_offset, obj_hazard_parent, false, false));

var hazard = choose(obj_hazard_01, obj_hazard_01, obj_hazard_02);

instance_create_layer(pos_x, pos_y, "Enemies", hazard);