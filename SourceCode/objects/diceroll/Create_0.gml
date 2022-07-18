/// @description On create - roll the dice for the player

playSound1 = true;
playSound2 = true;

turnOk = false;

result = function(numberOfDice) {
	var results = ds_list_create();
	for (var i = 0; i < numberOfDice; i++) {
		ds_list_add(results, irandom_range(1, 6));
	}
	return results;
}

rollResult = 1;
if (TurnControl.turn[? "enemyRoll"]) {
	// roll dice for the enemy
	
	turnOk = true;
} else if (TurnControl.turn[? "playerRoll"]) {
	// roll the dice for the player
	
	rollResult = 0;
	roll = result(1);
	for (var i = 0; i < ds_list_size(roll); i++) {
		rollResult += roll[| i];
	}
	ds_list_destroy(roll);
	Player.moveTokens = rollResult;
	
	turnOk = true;
}

// animation-relevant variables
image_xscale = 3;
image_yscale = 3;

x = -sprite_width;
y = room_height / 2;

tx = room_width / 2;

text_angle = random_range(-5, 5);
image_angle = random_range(0, 359);
image_index = rollResult - 1;
image_speed = 0;

timeOffset = .1 * room_speed; // Time for the animation to stay on the screen