function move(inputHor, inputVer){
		
	if (inputHor != 0 && !(place_meeting(x + inputHor * Grid.gridTile, y, Wall) || place_meeting(x + inputHor * Grid.gridTile, y, Enemy))) {
		tx = x + inputHor * Grid.gridTile;
		if (inputHor < 0) swapLeft();
		else swapRight();
			
		if (place_meeting(x + inputHor * Grid.gridTile, y, Player)) {
			enemyAttackPlayer(x, y, x + inputHor * Grid.gridTile, y);
		}
	} else if (inputVer != 0 && !(place_meeting(x, y + inputVer * Grid.gridTile, Wall) || place_meeting(x, y + inputVer * Grid.gridTile, Enemy))) {
		ty = y + inputVer * Grid.gridTile;
		if (inputVer < 0) swapUp();
		else swapDown();
		
		if (place_meeting(x, y + inputVer * Grid.gridTile, Player)) {
			enemyAttackPlayer(x, y, x, y + inputVer * Grid.gridTile);
		}
	}

}

function knockback(xFrom, yFrom, xTo, yTo) {
	var inputHor = sign(xTo - xFrom);
	var inputVer = sign(yTo - yFrom);
	//global.tileIsOccupied = false;
	//global.knockBackInputHor = inputHor;
	//global.knockBackInputVer = inputVer;
	//global.occupierId = id;
	
	//with (Enemy) {
	//	if (tx == x+global.knockBackInputHor*Grid.gridTile
	//		&& ty == y+global.knockBackInputVer*Grid.gridTile
	//		&& global.occupierId!=id) {
				
	//		global.tileIsOccupied = true;
	//	}
	//}
	
	//if (!global.tileIsOccupied) {
		move(inputHor, inputVer);
	//}
	
	Camera.shake(12);
}

function applyMovement() {
	x += (tx - x) * .3;
	y += (ty - y) * .3;

	if (abs(tx - x) < .33) {
		x = tx;
	}

	if (abs(ty - y) < .5) {
		y = ty;
	}
}

function justStepped() {
	if ((abs(tx - x) < .33) && (xprevious != x) || (abs(ty - y) < .5) && (yprevious != y) ) {
		return true;
	}
	return false;
}

