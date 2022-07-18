/// @description Movement

if (TurnControl.turn[? "player"]) {
	prevTokens = moveTokens;
	if (moveTokens > 0) {
		inputHor = keyboard_check(vk_right) - keyboard_check(vk_left);
		inputVer = keyboard_check(vk_down) - keyboard_check(vk_up);

		event_inherited();
	
		if (justStepped()) {
			moveTokens--;
		}
	} else {
		if (instance_exists(Camera)) Camera.shake(4);
		soundEndTurn();
		TurnControl.nextTurn();
	}
} else {
	applyMovement();
}

if (keyboard_check_pressed(vk_enter)) {
	with (Enemy) damage(20);
}