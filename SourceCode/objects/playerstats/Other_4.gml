/// @description Create the Player dice

if (room == rmBattle) {
	//px = PlayField.x + Grid.gridTile * .5;
	//py = PlayField.y + Grid.gridTile * .5;
	
	player = generatePlayers();
	player.overrideRotations(
		rotations.top,
		rotations.up,
		rotations.left,
		rotations.right,
		rotations.down,
		rotations.bottom
	);
	
	attackTiles = dangerLevel;
	TurnControl.attackTiles = attackTiles;
}
