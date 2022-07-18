/// @description 

if (room == rmMap) {
	for (var iCurrentLevel = 0; iCurrentLevel < mapLevels-1; iCurrentLevel++) {
		for (var iCurrentNode = 0; iCurrentNode < maxBranches; iCurrentNode++) {
			for (var iNextNode = 0; iNextNode < maxBranches; iNextNode++) {
				if (levels[# iCurrentNode, iCurrentLevel] != 0 && levels[# iNextNode, iCurrentLevel+1] != 0) {
					draw_set_color(c_fuchsia);
					gpu_set_blendmode(bm_add);
						drawDashedLine(
							levels[# iCurrentNode, iCurrentLevel].x,
							levels[# iCurrentNode, iCurrentLevel].y,
							levels[# iNextNode, iCurrentLevel+1].x,
							levels[# iNextNode, iCurrentLevel+1].y,
							2
						);
					gpu_set_blendmode(bm_normal);
				}
			}
		}
	}
	
	for (var iCurrentLevel = 0; iCurrentLevel < mapLevels; iCurrentLevel++) {
		for (var iCurrentNode = 0; iCurrentNode < maxBranches; iCurrentNode++) {
			if (levels[# iCurrentNode, iCurrentLevel] != 0) {
				draw_sprite_ext(sKDice, levels[# iCurrentNode, iCurrentLevel].rollValue-1, levels[# iCurrentNode, iCurrentLevel].x, levels[# iCurrentNode, iCurrentLevel].y, 1, 1, levels[# iCurrentNode, iCurrentLevel].rotation, c_ltgrey, 1);
			}
		}
	}
}