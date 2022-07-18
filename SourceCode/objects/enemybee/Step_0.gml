/// @description Turn handler

if (TurnControl.turn[? "enemyRoll"]) {
	
	moveTokens = rotations.top;
	rollEnded = true;
	turnEnded = false;
	//TurnControl.nextTurn();
	
} else if (TurnControl.turn[? "enemy"]) {
	
	if (moveTokens > 0 && !turnEnded) {
		inputHor = sign(Player.x - x);
		inputVer = sign(Player.y - y);
		
		if (place_meeting(x+inputHor, y, Enemy)) {
			inputHor = 0;
			stuckMeter--;
		}
		if (place_meeting(x, y+inputVer, Enemy)) {
			inputVer = 0;
			stuckMeter--;
		}
		//inputHor = choose(-1, 0 ,1);
		//inputVer = !inputHor * choose(-1, 1);
	
		// Movement code
		if (Grid.aligns(id) && (inputHor != 0 || inputVer != 0)) {
			move(inputHor, inputVer);
		}

		x += (tx - x) * .3;
		y += (ty - y) * .3;

		if (abs(tx - x) < .33) {
			x = tx;
		}

		if (abs(ty - y) < .5) {
			y = ty;
		}

		if (justStepped()) {
			soundDie();
			moveTokens--;
			stuckMeter = 15;
		}
	} else {
		turnEnded = true;
	}
}

if (stuckMeter <= 0) {
	moveTokens = 0;
}
if (moveTokens == 0) {
	applyMovement();
}

if (hp <= 0) {
	die();
}


if (instance_exists(PlayerStats) && PlayerStats.dangerLevel < 3) {
	PlayerStats.dangerLevel = 3;
}