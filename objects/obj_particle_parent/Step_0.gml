lifetime_timer ++;

image_angle += rotation_speed;
image_alpha += alpha_over_lifetime * lifetime_timer;

size += size_over_lifetime * lifetime_timer;

image_xscale = size;
image_yscale = size;

image_speed = animation_speed;

_speed += speed_overtime * lifetime_timer;
horizontal_speed += horizontal_speed_overtime * lifetime_timer;
vertical_speed += vertical_speed_overtime * lifetime_timer;

x += horizontal_speed * _speed;
y += vertical_speed * _speed;

if (lifetime_timer > (lifetime * room_speed)) {
	instance_destroy();
}