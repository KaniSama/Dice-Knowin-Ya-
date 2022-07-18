/// @description Draw node

if (room == rmMap) {
	color = active? c_white : c_dkgrey;
	draw_sprite_ext(sprite_index, rollValue-1, x, y, 1, 1, rotation, color, 1);
}