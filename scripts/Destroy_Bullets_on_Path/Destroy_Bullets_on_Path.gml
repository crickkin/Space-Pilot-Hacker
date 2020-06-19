var lyne = noone;
var bullets = ds_list_create();

for (var i = 0; i < ds_list_size(obj_system.path_list); i++) {
	lyne = path_list[| i];
	
	var bullet_list_size = collision_rectangle_list(lyne.x, lyne.y, lyne.x + 64, lyne.y + 64, obj_bullet_enemy, false, true, bullets, false);
	
	for (var j = 0; j < bullet_list_size; j++) {
		bullets[| j].explosion = true;
		instance_destroy(bullets[| j]);
	}
	ds_list_clear(bullets);
}