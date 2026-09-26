if (dialogue_data == noone) exit;

// Extrai o texto no idioma atual
var _full_text = dialogue_data[page].text[$ global.lang];

if (draw_char < string_length(_full_text)) {
    draw_char += text_speed;
    if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
        draw_char = string_length(_full_text);
    }
} else {
    var _has_choices = variable_struct_exists(dialogue_data[page], "choices");
    
    if (_has_choices) {
        is_waiting_for_choice = true;
        choices = dialogue_data[page].choices;
        
        if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
            selected_choice = (selected_choice + 1) % array_length(choices);
        }
        if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
            selected_choice = (selected_choice - 1 + array_length(choices)) % array_length(choices);
        }
    }
    
    if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
        if (_has_choices) {
            var _callback = choices[selected_choice].action;
            if (_callback != noone) _callback();
            
            is_waiting_for_choice = false;
            selected_choice = 0;
        }
        
        if (page < array_length(dialogue_data) - 1) {
            page++;
            draw_char = 0;
        } else {
            with (oUser) state = STATE.IDLE;
            instance_destroy();
        }
    }
}