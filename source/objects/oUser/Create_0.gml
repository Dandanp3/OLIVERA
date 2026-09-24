// State machine

enum STATE {
	IDLE,
	WALK,
	LOCKED
}

state = STATE.IDLE;

move_speed = 2;
hspd = 0;
vspd = 0;

// variavel de rastreio de direçao
// 0 = baixo, 1 = cima, 2 = lado
face = 0;

// Instancia a Pokédex automaticamente e invis
if (!instance_exists(oDex)) {
    instance_create_depth(0, 0, -9999, oDex);
}