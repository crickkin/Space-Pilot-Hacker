var sprite_width_offset = sprite_width/2;
//var sprite_height_offset = sprite_height/2;

if (horizontal > 0.8)
	image_index = 2;
else if (horizontal < -0.8)
	image_index = 0;
else
	image_index = 1;

x += horizontal * global.time_speed;
x = clamp(x, 0 + sprite_width_offset, room_width - sprite_width_offset);

y += vertical * global.time_speed;
y = clamp(y, 0, room_height - sprite_height);