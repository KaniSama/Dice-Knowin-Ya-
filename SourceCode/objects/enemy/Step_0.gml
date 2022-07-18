/// @description Turn handler

if (TurnControl.turn[? "enemyRoll"]) {
	
	moveTokens = rotations.top;
	rollEnded = true;
	turnEnded = false;
	//TurnControl.nextTurn();
	
} else if (TurnControl.turn[? "enemy"]) {
	
	if (moveTokens > 0 && !turnEnded) {
		inputHor = choose(-1, 0 ,1);
		inputVer = !inputHor * choose(-1, 1);
	
		// Movement is handled by the parent object
		event_inherited();
	
		if (justStepped()) {
			moveTokens--;
		}
	} else {
		turnEnded = true;
	}
}

if (moveTokens == 0) {
	applyMovement();
}

if (hp <= 0) {
	die();
}