/// @description Animation code

image_xscale += (1 - image_xscale) * .15;
image_yscale = image_xscale;

if (instance_exists(Player) && part_system_exists(Player.ps)) {
	part_particles_create(Player.ps, x, y, Player.sf, 5);
}
