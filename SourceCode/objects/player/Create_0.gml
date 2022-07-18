/// @description Init player

// inherit all functions and variables from parent
event_inherited();

moveTokens = 0;
prevTokens = 0;
shakeFrames = 0;

// set other stuff
ps = part_system_create();

pt = part_type_create();
part_type_life(pt, 12, 60);
part_type_direction(pt, 0, 360, 0, 0);
part_type_gravity(pt, .1, 270);
part_type_color1(pt, c_ltgray);
part_type_alpha1(pt, 1);
part_type_shape(pt, pt_shape_square);
part_type_size(pt, .3, .5, -.05, 0);
part_type_scale(pt, 1, 1);
part_type_speed(pt, 4, 8, 0, 0);
part_type_orientation(pt, 0, 0, 0, 0, true);

sw = part_type_create();
part_type_life(sw, 30, 60);
part_type_direction(sw, 0, 360, 0, 0);
part_type_gravity(sw, 0, 270);
part_type_color1(sw, c_orange);
part_type_alpha1(sw, 1);
part_type_shape(sw, pt_shape_line);
part_type_size(sw, 1, 2, -.05, 0);
part_type_scale(sw, 1, 1);
part_type_speed(sw, 8, 16, 0, 0);
part_type_orientation(sw, 0, 0, 0, 0, true);

sf = part_type_create();
part_type_life(sf, 30, 60);
part_type_direction(sf, 90-15, 90+15, 0, 2);
part_type_gravity(sf, 0, 270);
part_type_color1(sf, c_white);
part_type_alpha1(sf, 1);
part_type_shape(sf, pt_shape_square);
part_type_size(sf, .1, .2, -.01, 0);
part_type_scale(sf, 1, 1);
part_type_speed(sf, .5, 1, 0, 0);
part_type_orientation(sf, 0, 360, 1, 0, false);


audio_listener_position(0, 0, 0);