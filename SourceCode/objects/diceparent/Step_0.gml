///@description Movement code
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
}