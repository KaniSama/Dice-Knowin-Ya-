function generateAttackTiles(quantity){
	var field = PlayField;
	
	var xMin = field.x + Grid.gridTile * .5;
	var yMin = field.y + Grid.gridTile * .5;
	var xMax = field.x + field.sprite_width - Grid.gridTile * .5;
	var yMax = field.y + field.sprite_height - Grid.gridTile * .5;
	var width = xMax - xMin;
	var height = yMax - yMin;
	var widthInTiles = width div Grid.gridTile;
	var heightInTiles = height div Grid.gridTile;
	
	while (instance_number(AttackTile) != quantity) {
		var newAttackX = xMin + irandom_range(0, widthInTiles) * Grid.gridTile;
		var newAttackY = yMin + irandom_range(0, heightInTiles) * Grid.gridTile;
		
		if (!position_meeting(newAttackX, newAttackY, Wall) && !position_meeting(newAttackX, newAttackY, DiceParent)) {
			var newAttackTile = instance_create_layer(newAttackX, newAttackY, "Powerups", AttackTile);
		}
	}
}
function generatePlayers(){
	// NOTE: Player quantity should always be set to 1.
	var quantity = 1;
	var field = PlayField;
	
	var xMin = field.x + Grid.gridTile * .5;
	var yMin = field.y + Grid.gridTile * .5;
	var xMax = field.x + field.sprite_width - Grid.gridTile * .5;
	var yMax = field.y + field.sprite_height - Grid.gridTile * .5;
	var width = xMax - xMin;
	var height = yMax - yMin;
	var widthInTiles = width div Grid.gridTile;
	var heightInTiles = height div Grid.gridTile;
	
	while (instance_number(Player) < quantity) {
		var newPlayerX = xMin + irandom_range(0, widthInTiles) * Grid.gridTile;
		var newPlayerY = yMin + irandom_range(0, heightInTiles) * Grid.gridTile;
		
		if (!position_meeting(newPlayerX, newPlayerY, Wall) && !position_meeting(newPlayerX, newPlayerY, DiceParent)) {
			var newPlayer = instance_create_layer(newPlayerX, newPlayerY, "Player", Player);
			return newPlayer.id;
		} else {
			continue;
		}
	}
}
function generateEnemies(quantity){
	var field = PlayField;
	
	var xMin = field.x + Grid.gridTile * .5;
	var yMin = field.y + Grid.gridTile * .5;
	var xMax = field.x + field.sprite_width - Grid.gridTile * .5;
	var yMax = field.y + field.sprite_height - Grid.gridTile * .5;
	var width = xMax - xMin;
	var height = yMax - yMin;
	var widthInTiles = width div Grid.gridTile;
	var heightInTiles = height div Grid.gridTile;
	
	while (instance_number(Enemy) < quantity) {
		var newEnemyX = xMin + irandom_range(0, widthInTiles) * Grid.gridTile;
		var newEnemyY = yMin + irandom_range(0, heightInTiles) * Grid.gridTile;
		
		if (!position_meeting(newEnemyX, newEnemyY, Wall) && !position_meeting(newEnemyX, newEnemyY, DiceParent)) {
			var newEnemy = instance_create_layer(newEnemyX, newEnemyY, "Enemies", Enemy);
			//return newEnemy.id;
		} else {
			continue;
		}
	}
}

function generateEnemyBee(){
	var field = PlayField;
	
	var xMin = field.x + Grid.gridTile * .5;
	var yMin = field.y + Grid.gridTile * .5;
	var xMax = field.x + field.sprite_width - Grid.gridTile * .5;
	var yMax = field.y + field.sprite_height - Grid.gridTile * .5;
	var width = xMax - xMin;
	var height = yMax - yMin;
	var widthInTiles = width div Grid.gridTile;
	var heightInTiles = height div Grid.gridTile;
	
	while (instance_number(EnemyBee) < 1) {
		var newEnemyX = xMin + irandom_range(0, widthInTiles) * Grid.gridTile;
		var newEnemyY = yMin + irandom_range(0, heightInTiles) * Grid.gridTile;
		
		if (!position_meeting(newEnemyX, newEnemyY, Wall) && !position_meeting(newEnemyX, newEnemyY, DiceParent)) {
			var newEnemy = instance_create_layer(newEnemyX, newEnemyY, "Enemies", EnemyBee);
			return newEnemy.id;
		} else {
			continue;
		}
	}
}
function generateBoss(){
	var field = PlayField;
	
	var xMin = field.x + Grid.gridTile * .5;
	var yMin = field.y + Grid.gridTile * .5;
	var xMax = field.x + field.sprite_width - Grid.gridTile * .5;
	var yMax = field.y + field.sprite_height - Grid.gridTile * .5;
	var width = xMax - xMin;
	var height = yMax - yMin;
	var widthInTiles = width div Grid.gridTile;
	var heightInTiles = height div Grid.gridTile;
	
	while (instance_number(Boss) < 1) {
		var newEnemyX = xMin + irandom_range(0, widthInTiles) * Grid.gridTile;
		var newEnemyY = yMin + irandom_range(0, heightInTiles) * Grid.gridTile;
		
		if (!position_meeting(newEnemyX, newEnemyY, Wall) && !position_meeting(newEnemyX, newEnemyY, DiceParent)) {
			var newEnemy = instance_create_layer(newEnemyX, newEnemyY, "Enemies", Boss);
			return newEnemy.id;
		} else {
			continue;
		}
	}
}

function enemyAttackPlayer(xFrom, yFrom, xTo, yTo) {
	global.xFrom = xFrom;
	global.yFrom = yFrom;
	global.xTo = xTo;
	global.yTo = yTo;
	with (Player) {
		knockback(global.xFrom, global.yFrom, global.xTo, global.yTo);
	}
	knockback(Player.x, Player.y, x, y);
	
	PlayerStats.damage(moveTokens);
	moveTokens = 0;
	
	soundPunch();
}

function attackAll(points) {
	global.points = points;
	with (Enemy) {
		damage(global.points);
		var popup = instance_create_layer(x, y, "Overlays", BattlePopup);
		popup.text = "-" + string(global.points);
	}
}

function die() {
	part_particles_create_color(Player.ps, x, y, Player.pt, c_red, 20);
	
	instance_destroy();
}

function playerDies() {
	
	with (Player) visible = false;
	with (Room) state = "Die";
	
}