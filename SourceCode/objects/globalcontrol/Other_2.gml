///@description Set the global variables on game start

randomize();

if (instance_exists(Player)) {
	global.playerId = Player.id;
} else {
	global.playerId = 0;
}

// play the music clip on startup
