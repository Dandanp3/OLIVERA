// input capture
var _key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var _key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
var _key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));

// calculo de vetores
var _move_x = _key_right - _key_left;
var _move_y = _key_down - _key_up;

// trava para 4 direçoes - evita diagonal
if (_move_x != 0) {
    _move_y = 0;
}

// state machine
switch (state) {
    // IDLE
    case STATE.IDLE:
        hspd = 0;
        vspd = 0;

        // troca para o estado WALK
        if (_move_x != 0 || _move_y != 0) {
            state = STATE.WALK;
        }
		
		sprite_index = sIdleM;
		image_speed = 0;
		image_index = face;
		break;
		
	case STATE.WALK:
		// aplica velocidade
		hspd = _move_x * move_speed;
		vspd = _move_y * move_speed;
		
		x += hspd;
		y += vspd;
        
		//se soltar todas as teclas, volta par IDLE
		if (_move_x == 0 && _move_y == 0) {
			state = STATE.IDLE;
		}
		
		image_speed	= 1;
		
		// definindo sprite e atualiza a face
		if (_move_x != 0) {
		    sprite_index = sSideM;
		    face = 2;
		    // O sinal negativo inverte o espelhamento
		    image_xscale = -sign(_move_x); 
		}
		else if (_move_y > 0) {
			sprite_index = sDownM;
			face = 0;
		}
		else if (_move_y < 0) {
			sprite_index = sUpM;
			face = 1;
		}
		break;
}



















