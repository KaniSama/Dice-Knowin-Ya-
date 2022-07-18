/// @description Attack code

global.interactionFinished = false;
with (other) {
	if (justStepped()) {
		attackAll(rotations.top);
		Camera.shake(4);
		part_particles_create(ps, x, y, sw, 100);
		global.interactionFinished = true;
	}
}
if (global.interactionFinished) {
	soundAttack();
	instance_destroy();
}