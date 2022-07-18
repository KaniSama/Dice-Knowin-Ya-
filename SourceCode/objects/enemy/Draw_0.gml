/// @description draw the dice

var tile = Grid.gridTile;
var distX = tx - x;
var distY = ty - y;
fadeColor = make_color_hsv(0, 0, 64 + (abs(distX) + abs(distY)) / tile * 255);

//draw_sprite_ext(sprite_index, rotations.previous - 1, tx + abs(tx - x) * .5, ty + abs(ty - y) * .5, (tx - x) /* Grid.gridTile*/, (ty - y) /* Grid.gridTile*/, 0, fadeColor, 1);
draw_sprite_ext(sprite_index, rotations.previous - 1, tx + sign(distX) * tile * .5 - (distX), ty + sign(distY) * tile * .5 - (distY), ((distX)/tile==0?1:(distX)/tile), ((distY)/tile==0?1:(distY)/tile), 0, fadeColor, 1);
draw_sprite_ext(sprite_index, rotations.top - 1, x, y, 1 - abs(distX) / tile, 1 - abs(distY) / tile, 0, c_white, 1);