// Alternar o menu quando apertar "M"
if (keyboard_check_pressed(ord("M"))) {
    is_open = !is_open; // Inverte o estado atual
}

// Define para qual posição a Dex deve deslizar
if (is_open) {
    target_y = y_open;
} else {
    target_y = y_closed;
}

// Aplica a animação de deslize suave 
// O valor 0.15 é a velocidade da anim.
// ajustamdp entre 0.05 (lento) e 0.3 (rápido)
current_y = lerp(current_y, target_y, 0.15);