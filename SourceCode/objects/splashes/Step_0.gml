/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе


transitionFrames--;
if (transitionFrames <= 0) {
	slide++;
	transitionFrames = 2.5*room_speed;
}

if (slide >= image_number-1) {
	room_goto_next();
}
