/// @description 
draw_set_font(fFancy);
draw_set_color(c_white);
draw_text_ext_transformed(room_width/2, 32, text, 0, room_width, 1, 1, 0);
draw_text_ext_transformed(room_width/2, 128, textBig, 0, room_width, 2.5, 2.5, 0);
draw_set_font(fMain);
draw_text_ext_transformed(room_width/2, 256, textSmol, 24, room_width-64, 1, 1, 0);