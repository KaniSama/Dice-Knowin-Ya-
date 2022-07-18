/// @description Insert description here
// You can write your code in this editor
switch (state) {
	case "Start":
		radius += (max_radius - radius) *.05;
		//if (room_width - trX > .5) {
		//	trX += (room_width - trX) * .15;
		//} else {
		//	trY += (room_height - trY) * .33;
		//}
	break;
	case "End":
		radius += (-1 - radius) * .30;
		if (radius <= 0) {
			room_goto_next();
		}
	break;
	case "Restart":
		//if (room_width - trX < .5) {
		//	trX += (room_width - trX) * .33;
		//} else {
		//	trY += (room_height - trY) * .33;
		//}
		radius += (-1 - radius) * .15;
		if (radius <= 0) {
		//if (room_height - trY < .5) {
		//	trY = room_height;
			room_restart();
		}
	break;
	case "Map":
		radius += (-1 - radius) * .15;
		if (radius <= 0) {
			room = rmMap;
		}
	break;
	case "Battle":
		radius += (-1 - radius) * .15;
		if (radius <= 0) {
			room = rmBattle;
		}
	break;
	case "Die":
		radius += (-1 - radius) * .15;
		if (radius <= 0) {
			room = rmDeath;
		}
	break;
	case "EndGame":
		radius += (-1 - radius) * .15;
		if (radius <= 0) {
			room = rmEnd;
		}
	break;
}

if (surface_exists(srf)) {
	surface_set_target(srf);
		draw_set_color(c_black);
		draw_rectangle(0, 0, room_width, room_height, false);
		gpu_set_blendmode(bm_subtract);
		//draw_triangle(0, 0, room_width, 0, room_width, trY, false);
		//draw_triangle(0, room_height, 0, 0, trX, trY, false);
		if (instance_exists(Player)) {
			draw_circle(Player.x, Player.y, radius, false);
		} else if (instance_exists(PlayerMap)) {
			draw_circle(PlayerMap.x, PlayerMap.y, radius, false);
		}
		gpu_set_blendmode(bm_normal);
	surface_reset_target();
} 