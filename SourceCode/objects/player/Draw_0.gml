/// @description draw the dice

var tile = Grid.gridTile;
var distX = tx - x;
var distY = ty - y;
fadeColor = make_color_hsv(0, 0, 64 + (abs(distX) + abs(distY)) / tile * 255);

//draw_sprite_ext(sprite_index, rotations.previous - 1, tx + abs(tx - x) * .5, ty + abs(ty - y) * .5, (tx - x) /* Grid.gridTile*/, (ty - y) /* Grid.gridTile*/, 0, fadeColor, 1);
draw_sprite_ext(sprite_index, rotations.previous - 1, tx + sign(distX) * tile * .5 - (distX), ty + sign(distY) * tile * .5 - (distY), ((distX)/tile==0?1:(distX)/tile), ((distY)/tile==0?1:(distY)/tile), 0, fadeColor, 1);
draw_sprite_ext(sprite_index, rotations.top - 1, x, y, 1 - abs(distX) / tile, 1 - abs(distY) / tile, 0, c_white, 1);

// Draw how many tokens are left
drawW = moveTokens * sprite_get_width(sKDice);
drawH = room_height - sprite_get_height(sKDice);

if (prevTokens != moveTokens) {
	shakeFrames = 12;
	if (TurnControl.turn[? "player"]) {
		if (part_system_exists(ps) && part_type_exists(pt)) {
			part_particles_create(ps, room_width*.5, drawH, pt, 20);
		}
	}
}
if (shakeFrames > 0 && TurnControl.turn[? "player"]) {
	shake = 6 - moveTokens;
} else {
	shake = 0;
}
shakeFrames--;

for (var i = 0; i < moveTokens; i++) {
	draw_sprite(sKDice,
				i,
				room_width * .5 - drawW * .5 + tile * .5 + i * tile + choose(shake, -shake),
				drawH + choose(shake, -shake)
	);
}