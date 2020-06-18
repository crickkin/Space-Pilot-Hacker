image_xscale = 4;
image_yscale = image_xscale;

pos = 0;
_id = 0;

depth += 2;

alarm[0] = 1;

test_starting_point = false;

if (obj_system.path_list != noone) {
	ds_list_add(obj_system.path_list, id);
}