var left_collision = instance_place(x - 64, y, obj_line);
var right_collision = instance_place(x + 64, y, obj_line);
var up_collision = instance_place(x, y - 64, obj_line);
var down_collision = instance_place(x, y + 64, obj_line);

switch (pos) {
	case 1:
		if (right_collision != noone && right_collision._id == (_id -1)) {
			image_index = 1;
		}
		else if (up_collision != noone && up_collision._id == (_id -1)) {
			image_index = 5;
		}
		else if (down_collision != noone && down_collision._id == (_id -1)) {
			image_index = 3;
		}
		else {
			test_starting_point = true;
		}
		break;
	case 2:
		if (left_collision != noone && left_collision._id == (_id -1)) {
			image_index = 1;
		}
		else if (up_collision != noone && up_collision._id == (_id -1)) {
			image_index = 4;
		}
		else if (down_collision != noone && down_collision._id == (_id -1)) {
			image_index = 2;
		}
		else {
			test_starting_point = true;
		}
		break;
	case 4:
		if (left_collision != noone && left_collision._id == (_id -1)) {
			image_index = 5;
		}
		else if (right_collision != noone && right_collision._id == (_id -1)) {
			image_index = 4;
		}
		else if (down_collision != noone && down_collision._id == (_id -1)) {
			image_index = 0;
		}
		else {
			test_starting_point = true;
		}
		break;
	case 8:
		if (left_collision != noone && left_collision._id == (_id -1)) {
			image_index = 3;
		}
		else if (right_collision != noone && right_collision._id == (_id -1)) {
			image_index = 2;
		}
		else if (up_collision != noone && up_collision._id == (_id -1)) {
			image_index = 0;
		}
		else {
			test_starting_point = true;
		}
		break;
}

if (test_starting_point) {
	var left_collision = place_meeting(x - 64, y, obj_starting_point);
	var right_collision = place_meeting(x + 64, y, obj_starting_point);
	var up_collision = place_meeting(x, y - 64, obj_starting_point);
	var down_collision = place_meeting(x, y + 64, obj_starting_point);

	switch (pos) {
		case 1:
			if (right_collision) {
				image_index = 1;
			}
			else if (up_collision) {
				image_index = 5;
			}
			else if (down_collision) {
				image_index = 3;
			}
			break;
		case 2:
			if (left_collision) {
				image_index = 1;
			}
			else if (up_collision) {
				image_index = 4;
			}
			else if (down_collision) {
				image_index = 2;
			}
			break;
		case 4:
			if (left_collision) {
				image_index = 5;
			}
			else if (right_collision) {
				image_index = 4;
			}
			else if (down_collision) {
				image_index = 0;
			}
			break;
		case 8:
			if (left_collision) {
				image_index = 3;
			}
			else if (right_collision) {
				image_index = 2;
			}
			else if (up_collision) {
				image_index = 0;
			}
			break;
	}
}