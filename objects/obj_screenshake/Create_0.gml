camera = view_camera[0];

camera_x = camera_get_view_x(camera);
camera_y = camera_get_view_y(camera);

going_right = true;

pos = camera_x;

shake_force = 2;
x_tilt_offset = 3;

lifetime = 1;
lifetime_timer = 0;