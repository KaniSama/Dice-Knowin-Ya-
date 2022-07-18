/// @description 


if (anim < 0) {
	anim = animStart;
	if (image_yscale > initScale) {
		image_yscale = initScale;
	} else {
		image_yscale = initScale * 1.2;
	}
}

anim--;

//if (abs(tx - x) < .3) x = tx;
//if (abs(ty - y) < .3) y = ty;
if (Map.transition && abs(tx - x) < 1 && abs(ty - y) < 1) {
	Room.state = "Battle";
}
