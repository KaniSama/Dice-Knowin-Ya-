/// @description Room restarts and such

if (keyboard_check_pressed(ord("R")) && instance_exists(Room)) {
	Room.state = "restart";
}