/// @description Shake control

if (shakeFrames > 0) {
	shakeF();
	shakeFrames--;
} else {
	camX = initX;
	camY = initY;
}

camX = clamp(camX, 0, room_width-camera_get_view_width(cam));
camY = clamp(camY, 0, room_height-camera_get_view_height(cam));

if (instance_exists(PlayerMap)) {
	initX = 0;
	initY += (PlayerMap.y - camera_get_view_width(cam) *.5 - initY) * .05;
}

camera_set_view_pos(cam, camX, camY);