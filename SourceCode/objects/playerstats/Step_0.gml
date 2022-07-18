/// @description move after the camera

if (instance_exists(Camera)) {
	x = 64;
	y = Camera.camY + 128;
}

if (hp <= 0) {
	playerDies();
}