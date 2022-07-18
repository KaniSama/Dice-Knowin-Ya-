/// @description Draw the grid

for (xx = 0; xx < ds_grid_width(grid); xx++) {
	for (yy = 0; yy < ds_grid_height(grid); yy++) {
		draw_set_color(c_ltgrey);
		draw_set_alpha(.3);
		var newx = gridTile * .5 + xx * gridTile;
		var newy = gridTile * .5 + yy * gridTile;
		draw_rectangle(newx, newy, newx+gridTile, newy+gridTile, true);	
	}
}