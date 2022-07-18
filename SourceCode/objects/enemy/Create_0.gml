/// @description Init enemy

event_inherited();

moveTokens = 0;
turnEnded = false;
rollEnded = true;

maxHp = rotations.top + PlayerStats.dangerLevel;
hp = maxHp;

damage = function(points) {
	hp = clamp(hp - points, 0, maxHp);
}
heal = function(points) {
	hp = clamp(hp + points, 0, maxHp);
}