/// @description Rol for the next level

if (room == rmMap) {
	if (currentLevel < mapLevels-1) {
		singlePath = true;
		for (var i = 0; i < maxBranches; i++) {
			if (i > 0 && levels[# i, currentLevel+1] != 0) {
				singlePath = false;
				break;
			}
		}
	} else {
		Room.state = "EndGame";
	}
	
	if (keyboard_check_pressed(ord("R"))) {
		if (!instance_exists(DiceRollMap)) {
			if (!singlePath) {
				dice = instance_create_layer(0, 0, "Player", DiceRollMap);
			} else {
				nonCritValue = levels[# 0, currentLevel+1].rollValue;
				while (nonCritValue == critValue) {
					critValue = irandom_range(1, 6);
				}
				dice = instance_create_layer(0, 0, "Player", DiceRollMap)
			}
		}
	}

	if (instance_exists(PlayerMap)) {
		//PlayerMap.y += ((y - currentLevel * levelHeight) - PlayerMap.y) * .15;
		PlayerMap.y += ((PlayerMap.ty - PlayerMap.y)) * .15;
		PlayerMap.x += ((PlayerMap.tx) - PlayerMap.x) * .15;
	}
}