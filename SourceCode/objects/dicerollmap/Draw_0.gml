/// @description Draw overlay;

draw_set_alpha(.3);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_middle);
draw_set_font(fFancy);
draw_text_ext_transformed(room_width * .5, Camera.camY + 32, "Rolling for path!", 0, room_width, 2, 2, text_angle);

draw_self();