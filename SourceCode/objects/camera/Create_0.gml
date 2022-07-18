/// @description Camera init

cam = view_camera[0];
initX = camera_get_view_x(cam);
initY = camera_get_view_y(cam);
camX = initX;
camY = initY;

shakeFrames = 0;
shakeIntensity = 4;

shake = function(frames) {
	shakeFrames = frames;
}
shakeF = function() {
	camX = initX + random_range(-shakeIntensity, shakeIntensity);
	camY = initY + random_range(-shakeIntensity, shakeIntensity);
}