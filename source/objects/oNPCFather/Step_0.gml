// verifica se o player está perto e apertou a tecla
if (instance_exists(oUser)) {
    var _dist = point_distance(x, y, oUser.x, oUser.y);
    
    if (_dist <= interact_distance && keyboard_check_pressed(ord("E"))) {
        // Se nao houver nenhum dialogo aberto na tela, abre esse
        if (!instance_exists(oDialogueManager)) {
            oUser.state = STATE.LOCKED;
            
            var _dlg = instance_create_depth(0, 0, -9999, oDialogueManager);
            _dlg.dialogue_data = my_dialogue;
        }
    }
}