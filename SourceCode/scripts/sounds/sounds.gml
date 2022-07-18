// plays the sound for the die roll
function soundDie(){
	sound = choose(sndDie1, sndDie2, sndDie3);
	playS(sound);
}

function soundDice(){
	sound = choose(sndDice1, sndDice2, sndDice3);
	playS(sound);
}

function soundShuffle() {
	sound = (sndShuffle);
	playS(sound);
}

function soundEndTurn() {
	sound = (sndEndTurn);
	playS(sound);
}

function soundAttack() {
	sound = (sndAttack);
	playS(sound);
}

function soundPunch() {
	sound = (sndPunch);
	playS(sound);
}

function playS(sound) {
	audio_play_sound(sound, 0, false);
}