/// @description Apply rolled numbers

if (turnOk) {
	if (playSound1) {
		soundDice();
		playSound1 = false;
	}
	// play animation
	// if animation ended
	if (tx - x < 2) {
		// move out of frame (needs to meet conditions first)
		if (timeOffset <= 0 && tx > room_width) {
			instance_destroy();
		}
		
		// move the target after the animation is done (this is the condition)
		if (timeOffset <= 0) {
			tx = room_width + sprite_width * 1.5;
			if (playSound2) {
				soundShuffle();
				playSound2 = false;
			}
		}
		
		timeOffset--;
	} else {
		x += (tx - x) * .15;
		image_angle += 5;
	}
}

