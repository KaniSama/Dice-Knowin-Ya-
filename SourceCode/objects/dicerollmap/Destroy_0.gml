/// @description End the enemyRoll or playerRoll turn

// only call TurnControl.nextTurn() if this object
// wasn't created by mistake and actually rolled dice
if (turnOk) {
	//TurnControl.nextTurn();
	//Map.nextLevel();
	Map.nextLevel(rollResult);
}