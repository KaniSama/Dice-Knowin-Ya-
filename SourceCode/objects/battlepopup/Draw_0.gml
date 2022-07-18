/// @description Draw popup text

draw_set_font(fMain);
draw_set_color(c_red);
draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_set_alpha(alpha);
draw_text(x, y, text);

draw_set_alpha(1);