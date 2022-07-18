/// @description Draw the grid

draw_self();

for (i = x; i < x + width; i += sprite_get_width(sprite_index)) {
	for (j = y; j < y + height; j += sprite_get_height(sprite_index)) {
		draw_sprite(sprite_index, 0, i, j);
	}
}
