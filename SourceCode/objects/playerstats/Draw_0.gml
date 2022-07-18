/// @description Draw current player stats

draw_set_font(fMain);
if (instance_exists(Player)) {
	helperAlpha = .9;

	//gpu_set_blendmode(bm_add);
		draw_sprite_ext(sKDice, Player.rotations.top - 1, x, y, 1, 1, 0, c_white, 1);
		draw_sprite_ext(sprite_index, Player.rotations.right - 1, x - Grid.gridTile, y, .8, .8, 0, c_white, helperAlpha);
		draw_sprite_ext(sprite_index, Player.rotations.left - 1, x + Grid.gridTile, y, .8, .8, 0, c_white, helperAlpha);
		draw_sprite_ext(sprite_index, Player.rotations.down - 1, x, y - Grid.gridTile, .8, .8, 0, c_white, helperAlpha);
		draw_sprite_ext(sprite_index, Player.rotations.up - 1, x, y + Grid.gridTile, .8, .8, 0, c_white, helperAlpha);
		draw_sprite_ext(sprite_index, Player.rotations.bottom - 1, x, y + Grid.gridTile * 2, .8, .8, 0, c_white, helperAlpha);
	//gpu_set_blendmode(bm_normal);
	
	draw_sprite_ext(sHeart, 0, x, y - Grid.gridTile * 3, 3, 3, 0, c_white, 1);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
	draw_set_color(c_white);
	draw_text(x, y - Grid.gridTile * 3, string(hp) + "/" + string(maxHp));
}

if (instance_exists(PlayerMap)) {
	helperAlpha = .9;

	//gpu_set_blendmode(bm_add);
		draw_sprite_ext(sKDice, rotations.top - 1, x, y, 1, 1, 0, c_white, 1);
		draw_sprite_ext(sprite_index, rotations.right - 1, x - 32, y, .8, .8, 0, c_white, helperAlpha);
		draw_sprite_ext(sprite_index, rotations.left - 1, x + 32, y, .8, .8, 0, c_white, helperAlpha);
		draw_sprite_ext(sprite_index, rotations.down - 1, x, y - 32, .8, .8, 0, c_white, helperAlpha);
		draw_sprite_ext(sprite_index, rotations.up - 1, x, y + 32, .8, .8, 0, c_white, helperAlpha);
		draw_sprite_ext(sprite_index, rotations.bottom - 1, x, y + 32 * 2, .8, .8, 0, c_white, helperAlpha);
	//gpu_set_blendmode(bm_normal);
	
	draw_sprite_ext(sHeart, 0, x, y - 32 * 3, 3, 3, 0, c_white, 1);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
	draw_set_color(c_white);
	draw_text(x, y - 32 * 3, string(hp) + "/" + string(maxHp));
}
