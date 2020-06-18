draw_self();

particle_angle += 0.04;

var rotate_x = cos(particle_angle) * (x - x) - sin(particle_angle) * (original_y - (original_y + 12)) + x;
var rotate_y = sin(particle_angle) * (x - x) + cos(particle_angle) * (original_y - (original_y + 12)) + y;
draw_sprite_ext(spr_puzzle_point_particle, 0, rotate_x, rotate_y, 1, 1, 0, c_white, image_alpha);

rotate_x = cos(particle_angle) * (x - (x - 10)) - sin(particle_angle) * (original_y - (original_y - 8)) + x;
rotate_y = sin(particle_angle) * (x - (x - 10)) + cos(particle_angle) * (original_y - (original_y - 8)) + y;
draw_sprite_ext(spr_puzzle_point_particle, 0, rotate_x, rotate_y, 1, 1, 0, c_white, image_alpha);

rotate_x = cos(particle_angle) * (x - (x + 12)) - sin(particle_angle) * (original_y - (original_y - 4)) + x;
rotate_y = sin(particle_angle) * (x - (x + 12)) + cos(particle_angle) * (original_y - (original_y - 4)) + y;
draw_sprite_ext(spr_puzzle_point_particle, 0, rotate_x, rotate_y, 1, 1, 0, c_white, image_alpha);