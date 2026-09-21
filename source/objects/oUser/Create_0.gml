// State machine

enum STATE {
	IDLE,
	WALK
}

state = STATE.IDLE;

move_speed = 2;
hspd = 0;
vspd = 0;

// variavel de rastreio de direçao
// 0 = baixo, 1 = cima, 2 = lado
face = 0;