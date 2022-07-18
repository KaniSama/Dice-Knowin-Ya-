/// @description Create grid
gridTile = 32;

global.four = 0;

gridW = room_width div gridTile - 1;
gridH = room_height div gridTile - 1;

grid = ds_grid_create(gridW, gridH);
for (i = 0; i < ds_grid_width(grid); i++) {
	for (j = 0; j < ds_grid_height(grid); j++) {
		grid[#i, j] = 0;
	}
}


getCurrentPlayerPosition = function(horvert) {
	for (xx = 0; xx < ds_grid_width(grid); xx++) {
		for (yy = 0; yy < ds_grid_height(grid); yy++) {
			if (grid[# xx, yy] == global.playerId) {
				if (horvert == "x") return xx;
				if (horvert == "y") return yy;
			}
		}
	}
}

aligns = function(obj) {
	if (!instance_exists(obj)) return false;
	return obj.x mod (gridTile) == 0 && obj.y mod (gridTile) == 0;
}