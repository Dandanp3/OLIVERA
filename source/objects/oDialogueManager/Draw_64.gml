draw_set_color(c_black);
draw_rectangle(x_pos, y_pos, x_pos + box_width, y_pos + box_height, false);
draw_set_color(c_white);
draw_rectangle(x_pos, y_pos, x_pos + box_width, y_pos + box_height, true);

// Renderiza o texto principal no idioma correto
var _full_text = dialogue_data[page].text[$ global.lang];
var _draw_text = string_copy(_full_text, 1, floor(draw_char));
draw_text_ext(x_pos + 8, y_pos + 8, _draw_text, 12, box_width - 16);

// Renderiza as opções de escolha no idioma correto
if (is_waiting_for_choice) {
    var _choice_y = y_pos - (array_length(choices) * 16) - 8;
    for (var i = 0; i < array_length(choices); i++) {
        var _prefix = (i == selected_choice) ? "> " : "  ";
        
        // Acessa o idioma dentro de option_text
        var _option_string = choices[i].option_text[$ global.lang];
        
        draw_text(x_pos + 16, _choice_y + (i * 14), _prefix + _option_string);
    }
}