/// @description If the variables weren't set, try setting them again

if (instance_exists(Player)) {
	if (global.playerId== 0) {
		if (instance_exists(Player)) {
			global.playerId = Player.id;
		}
	}
}