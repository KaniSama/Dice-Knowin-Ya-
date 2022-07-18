/// @description Meme
global.four = 0;
if (TurnControl.turn[? "enemy"] /*|| TurnControl.turn[? "player"]*/) {
	with (DiceParent) {
		if (rotations.top == 4) {
			global.four++;
		}
	}

	if (global.four == instance_number(DiceParent) && !instance_exists(Meme)) {
		instance_create_layer(room_width / 2, room_height, "Overlays", Meme);
	}
}