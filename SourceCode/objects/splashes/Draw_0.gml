/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

alpha = transitionFrames/(1.5*room_speed)

draw_sprite_ext(sprite_index, slide, 0, 0, 1, 1, 0, c_white, alpha);
draw_sprite_ext(sprite_index, slide+1, 0, 0, 1, 1, 0, c_white, 1-alpha);


