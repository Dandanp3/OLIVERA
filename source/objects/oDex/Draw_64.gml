if (current_y < gui_h + 100) {
    // draw_sprite_ext permite redimensionar o sprite usando o dex_scale
    draw_sprite_ext(sDex, 0, center_x, current_y, dex_scale, dex_scale, 0, c_white, 1);
}