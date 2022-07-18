/// @description End turns for enemy dice

if (turn[? "enemy"]) {
	global.turnEnded = 0;
	with (Enemy) {
		if (turnEnded) {
			global.turnEnded++;
		}
	}
	if (global.turnEnded == instance_number(Enemy)) {
		nextTurn();
	}
} else if (turn[? "enemyRoll"]) {
	if (instance_exists(Boss) && instance_number(Enemy) < PlayerStats.dangerLevel) {
		generateEnemies(PlayerStats.dangerLevel);
	} else {
		if (!instance_exists(Enemy)) {
			// end the battle and go to the map
			//show_message("you won");
			if (instance_exists(Map) && instance_exists(Room)) {
				Map.transition = false;
				if (Room.state != "Map") {
					upgrade = irandom_range(1, 6);
					switch upgrade {
						case 1: 
							Player.rotations.top++;
							PlayerStats.rotations.top++;
						break;
						case 2: 
							Player.rotations.up++;
							PlayerStats.rotations.up++;
						break;
						case 3:
							Player.rotations.left++;
							PlayerStats.rotations.left++;
						break;
						case 4:
							Player.rotations.right++;
							PlayerStats.rotations.right++;
						break;
						case 5:
							Player.rotations.down++;
							PlayerStats.rotations.down++;
						break;
						case 6:
							Player.rotations.bottom++;
							PlayerStats.rotations.bottom++;
						break;
					}
				}
				Room.state = "Map";
			}
		}
	}
	if (!instance_exists(AttackTile)) {
		generateAttackTiles(attackTiles);
	}
	
	global.turnEnded = 0;
	with (Enemy) {
		if (rollEnded) {
			global.turnEnded++;
		}
	}
	if (global.turnEnded == instance_number(Enemy)) {
		nextTurn();
	}
} else if (turn[? "playerRoll"]) {
	if (!instance_exists(DiceRoll)) {
		roll = instance_create_layer(room_width / 2, room_height / 2, "Overlays", DiceRoll);
	}
} else if (turn[? "player"]) {
	if (keyboard_check_pressed(ord("E"))) Player.moveTokens = 0;
}