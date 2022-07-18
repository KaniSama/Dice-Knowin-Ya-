/// @description Draw the dice helpers

if (TurnControl.turn[? "playerRoll"]) {
	shown = false;
} else {
	shown = showBuffer;
}

if (shown) {
	helperAlpha += (.65 - helperAlpha) * .33;
} else {
	helperAlpha += (0 - helperAlpha) * .33;
}

draw_set_font(fMain);
gpu_set_blendmode(bm_add);
	//draw_sprite_ext(sKDice, rotations.top - 1, x, y, 1, 1, 0, c_white, 1);
	draw_sprite_ext(sprite_index, rotations.right - 1, x - Grid.gridTile, y, .8, .8, 0, c_white, helperAlpha);
	draw_sprite_ext(sprite_index, rotations.left - 1, x + Grid.gridTile, y, .8, .8, 0, c_white, helperAlpha);
	draw_sprite_ext(sprite_index, rotations.down - 1, x, y - Grid.gridTile, .8, .8, 0, c_white, helperAlpha);
	draw_sprite_ext(sprite_index, rotations.up - 1, x, y + Grid.gridTile, .8, .8, 0, c_white, helperAlpha);
gpu_set_blendmode(bm_normal);

// Draw enemy health
if (shown) {
	with (Enemy) {
		draw_set_alpha(1);
		draw_sprite(sHeart, 0, x, y+16);
		draw_set_valign(fa_center);
		draw_set_halign(fa_middle);
		gpu_set_blendmode(bm_add);
		draw_text_color(x, y+16, hp, c_white, c_white, c_white, c_white, PlayerHelper.helperAlpha);
		gpu_set_blendmode(bm_normal);
	}
	
	draw_set_color(c_white);
	draw_set_font(fMain);
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	draw_text(room_width - 32, room_height - 32, "Controls:\nArrow keys - Move\nE - End turn\n\nCollect soul shards\nto attack enemies.");
}