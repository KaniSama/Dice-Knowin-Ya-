/// @description Create variables and functions

randomize();

turn = ds_map_create();

ds_map_add(turn, "playerRoll", true);
ds_map_add(turn, "player", false);
ds_map_add(turn, "enemyRoll", false);
ds_map_add(turn, "enemy", false);

//turn = {
//	player: false,
//	enemy: false,
//	playerRoll: true,
//	enemyRoll: false
//}
turnOrder = ["playerRoll", "player", "enemyRoll", "enemy"];

nextTurn = function() {
	for (var i = 0; i < array_length(turnOrder); i++) {
		if (turn[? turnOrder[i]] == true) {
			turn[? turnOrder[i]] = false;
			if (i >= array_length(turnOrder)-1) {
				i = 0;
			} else {
				i++;
			}
			turn[? turnOrder[i]] = true;
			return;
		}
	}
}

switch (PlayerStats.dangerLevel) {
	case 1:
		generateEnemies(1);
	break;
	case 2: 
		with (WallDestructible) instance_destroy();
		enemy = random_range(0,1);
		if (enemy > .5) {
			generateEnemies(2);
		} else {
			generateEnemyBee();
		}
	break;
	case 3:
		with (WallDestructible) instance_destroy();
		if (PlayerStats.roomPurpose == "Boss") {
			generateBoss();
		} else {
			generateEnemies(3);
		}
	break;
	default:
		with (WallDestructible) instance_destroy();
		if (PlayerStats.roomPurpose == "Boss") {
			generateBoss();
		} else {
			generateEnemies(4);
		}
	break;
}