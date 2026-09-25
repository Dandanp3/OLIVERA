// configs visuais
box_width = 280;
box_height = 56;
gui_w = 320;
gui_h = 180;

// posição na tela
x_pos = (gui_w - box_width) / 2;
y_pos = gui_h - box_height - 12;

// dados do dialogo atual
dialogue_data = noone; // array de falas
page = 0;
text_length = 0; //efeito letra por letra
draw_char = 0;
text_speed = 0.5;

// sistema de escolhas
choices = [];
selected_choice = 0;
is_waiting_for_choice = false;