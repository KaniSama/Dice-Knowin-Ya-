/// @description Init beeline


// tx, ty = target coordinates
tx = xstart;
ty = ystart;

image_speed = 0;

state = "idle";

#region rotations
// variables holding all possible dice rotations
rotations = {
	top: 1,
	up: 2,
	left: 3,
	right: 4,
	down: 6,
	bottom: 5,
	previous: -1
}

// functions handling rotations
swapLeft = function() {
	rotations.previous = rotations.top;
	rotations.top = rotations.right;
	rotations.right = rotations.bottom;
	rotations.bottom = rotations.left;
	rotations.left = rotations.previous;
}
swapRight = function() {
	rotations.previous = rotations.top;
	rotations.top = rotations.left;
	rotations.left = rotations.bottom;
	rotations.bottom = rotations.right;
	rotations.right = rotations.previous;
}
swapUp = function() {
	rotations.previous = rotations.top;
	rotations.top = rotations.down;
	rotations.down = rotations.bottom;
	rotations.bottom = rotations.up;
	rotations.up = rotations.previous;
}
swapDown = function() {
	rotations.previous = rotations.top;
	rotations.top = rotations.up;
	rotations.up = rotations.bottom;
	rotations.bottom = rotations.down;
	rotations.down = rotations.previous;
}
overrideRotations = function(top, up, left, right, down, bottom) {
	rotations.top = top;
	rotations.up = up;
	rotations.left = left;
	rotations.right = right;
	rotations.down = down;
	rotations.bottom = bottom;
}

// Choose a random starting rotation
for (var i = 0; i < 10; i++) {
	
	rng = irandom_range(0, 3);
	
	switch (rng) {
		case 0:
			swapDown();
		break;
		case 1:
			swapUp();
		break;
		case 2:
			swapLeft();
		break;
		case 3:
			swapRight();
		break;
	}
	
}
#endregion

image_xscale = 1;
image_yscale = 1;

moveTokens = 0;
turnEnded = false;
rollEnded = true;

stuckMeter = 15;

maxHp = 10;
hp = maxHp;

damage = function(points) {
	hp = clamp(hp - points, 0, maxHp);
}
heal = function(points) {
	hp = clamp(hp + points, 0, maxHp);
}

overrideRotations(2,2,2,1,1,3);