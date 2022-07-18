/// @description Get Player's next sides

if (instance_exists(Player)) {
	rotations = Player.rotations;
	
	x = Player.x;
	y = Player.y;
}

if (keyboard_check_pressed(ord("F"))) {
	shown = !shown;
	showBuffer = shown;
}