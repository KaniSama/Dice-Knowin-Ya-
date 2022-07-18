/// @description Stores HP, items and other

maxHp = 20;
hp = maxHp;

attackTiles = 1;
dangerLevel = 1;

damage = function(points) {
	hp = clamp(hp - points, 0, maxHp);
	if (instance_exists(Player)) {
		popup = instance_create_layer(Player.x, Player.y, "Overlays", BattlePopup);
		popup.text = "-" + string(points);
	}
}
heal = function(points) {
	hp = clamp(hp + points, 0, maxHp);
}


rotations = {
	top: 1,
	up: 2,
	left: 3,
	right: 1,
	down: 2,
	bottom: 3,
	previous: -1
}

roomPurpose = "Enemy";