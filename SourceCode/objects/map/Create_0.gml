/// @description Create map

randomize();

mapLevels = 6;
maxBranches = 4;

levels = ds_grid_create(maxBranches, mapLevels);
levelHeight = room_height / mapLevels / 1.1; // vertical distance between level nodes, in pixels
levelWidth = room_width / 8; // horizontal distance between level nodes, in pixels

currentLevel = 0;
transition = false;

critValue = 6;
nonCritValue = 1;

tx = x;
ty = y;

mapNode = function(_x, _y, _rollValue, _purpose="Enemy", _rotation=random_range(0,360), _dangerLevel = 1) constructor {
	x = _x;
	y = _y;
	rollValue = _rollValue;
	purpose = _purpose;
	rotation = _rotation;
	dangerLevel = _dangerLevel;
}

// create the levels
Randomize = function() {
	ds_grid_clear(levels, 0);
	with (MapNode) instance_destroy();
	for (var i = 0; i < mapLevels; i++) {
		var nodesInLevel = 0;
		if (i == 0 || i == mapLevels-1) {
			// create one node
			newNode = new mapNode(x, y-i*levelHeight);//instance_create_layer(x, y - i * levelHeight, "Nodes", MapNode);
			newNode.rollValue = irandom_range(1, 6);
			if (i >=mapLevels/2) {
				newNode.dangerLevel = 2;
				if (i >= mapLevels-mapLevels/4) {
					newNode.dangerLevel = 3;
				}
			} else {
				newNode.dangerLevel = 2;
			}
			if (i == mapLevels-1) {
				newNode.purpose = "Boss";
				newNode.dangerLevel = 3;
			}
			levels[# nodesInLevel, i] = newNode;
			nodesInLevel++;
		} else {
			nodes = irandom_range(1, maxBranches);
			nodesWidth = levelWidth * (nodes-1);
			// create multiple nodes
			for (var j = 0; j < nodes; j++) {
				levels[# j, i] = new mapNode(x - nodesWidth*.5 + j * levelWidth, y - i * levelHeight);//instance_create_layer(x - nodesWidth*.5 + j * levelWidth, y - i * levelHeight, "Nodes", MapNode);
				do {
					levels[# j, i].rollValue = irandom_range(1, 6);
					set = true;
					for (k = 0; k < j && set; k++) {
						if (levels[# j, i].rollValue == levels[# k, i].rollValue) {
							set = false
						}
					}
				} until (set);
			}
		}
	}
}

Randomize();

nextLevel = function(nodeNumber) {
	currentLevel++;
	playerMoved = false;
	for (var currentNode = 0; currentNode < maxBranches; currentNode++) {
		if (levels[# currentNode, currentLevel] != 0
				&& levels[# currentNode, currentLevel].rollValue == nodeNumber) {
			PlayerMap.tx = levels[# currentNode, currentLevel].x;
			PlayerMap.ty = levels[# currentNode, currentLevel].y;
			playerMoved = true;
			transition = true;
			
			Room.state = "Battle";
			PlayerStats.roomPurpose = levels[# currentNode, currentLevel].purpose;
			PlayerStats.dangerLevel = levels[# currentNode, currentLevel].dangerLevel;
			
			if (currentLevel >= mapLevels/3) {
				PlayerStats.dangerLevel = 2;
				if (currentLevel >= mapLevels-mapLevels/4) {
					PlayerStats.dangerLevel = 3;
				}
			} else {
				PlayerStats.dangerLevel = 1;
			}
			
			if (PlayerStats.roomPurpose == "Boss") {
				PlayerStats.dangerLevel = 4;
			}
			tx = PlayerMap.tx;
			ty = PlayerMap.ty;
			return true;
		}
	}
	if (!playerMoved) {
		instance_create_layer(0, 0, "Player", DiceRollMap);
		currentLevel--;
		return false;
	}
}