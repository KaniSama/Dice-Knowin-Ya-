/// @description 



shader_set(shBulge);
	draw_set_color(c_black);
	draw_rectangle(0, 0, view_wport[0], view_hport[0], false);
	draw_surface_ext(application_surface, 0, 0, 1, 1, 0, c_white, 1);
shader_reset();

if (room == rmMap) {

	if (!instance_exists(DiceRollMap)) {
		draw_set_font(fFancy);
		draw_set_halign(fa_middle);
		draw_set_color(c_white);
		draw_text_ext_transformed(window_get_width()*.5, 64, "Press R to roll the dice!", 0, window_get_width(), 2, 2, 0);
	}


}