image_xscale = 4;
image_yscale = image_xscale;

if (place_meeting(x, y, obj_puzzle_player) || place_meeting(x, y, obj_goal)) {
	instance_destroy();
}