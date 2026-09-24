is_open = false;

display_set_gui_size(320, 180);
gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

// Calcula a escala exata para a Pokédex ocupar 90% da altura da tela
// Isso evita que o sprite gigante ultrapasse os limites da sua câmera de 180 pixels
dex_scale = (gui_h * 0.9) / sprite_get_height(sDex);

y_open = (gui_h / 2) + 80; // aumentar valor da soma para descer
y_closed = gui_h + 150;

current_y = y_closed;
target_y = y_closed;
center_x = gui_w / 2;