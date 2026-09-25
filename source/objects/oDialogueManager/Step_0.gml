if (dialogue_data == noone) exit;

var _full_text = dialogue_data[page].text;
if (draw_char < string_length(_full_text)) {
	draw_char += text_speed;
	if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
		draw_char = string_length(_full_text) // pula direto para o texto completo
	}
} else {
	// se o texto ja terminou, gerencia escolha ou avança
	var _has_choices = variable_struct_exists(dialogue_data[page], "choices")
	
	if (_has_choices) {
		is_waiting_for_choice = true;
		choices = dialogue_data[page].choices
		
		// navegar escolhas W/S ou top/down
		if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
			selected_choice = (selected_choice + 1) % array_length(choices)
		}
		if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
			selected_choice = (selected_choice - 1 + array_length(choices)) % array_length(choices);
		}
	}
	
	// avançar paginas com espaço ou enter
	if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
		if (_has_choices) {
			// executa a funçao integrada a escolha
			var _callback = choices[selected_choice].action;
			if (_callback != noone) _callback()
			
			// reseta escolhas e avança
			is_waiting_for_choice = false;
			selected_choice = 0;
			
		}
		// proxima linha de dialogo se tiver
		if (page < array_length(dialogue_data) -1) {
			page++;
			draw_char =0
		} else {
			//fim da conversa, destrava o player
			with (oUser) state = STATE.IDLE;
			instance_destroy()
		}
		
	}
}