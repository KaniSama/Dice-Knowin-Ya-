/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

if (life <= 0) {
	instance_destroy();
}
life--;
alpha = 1 - 1/life;

y --;