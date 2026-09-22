// so executa se o jogador existir na tela
if (instance_exists(follow)) {
	// define o alvo (centro do jogador/tela)
	// subtraindo metade da largura/altura da câmera para alinhar o centro da tela com o X/Y do jogador
	var _x_to = follow.x - (cam_width / 2);
	var _y_to = follow.y - (cam_height / 2)
	
	// trava a camera no limite da room
	_x_to = clamp(_x_to, 0, room_width - cam_width)
	_y_to = clamp(_y_to, 0, room_height - cam_height)
	
	// pegando posiçao atual da camera
	var _cur_x = camera_get_view_x(cam)
	var _cur_y = camera_get_view_y(cam)
	
	// movendo a cam ate o alvo
	var _new_x = lerp(_cur_x, _x_to, spd)
	var _new_y = lerp(_cur_y, _y_to, spd)
	
	// aplica nova posiçao da cam
	camera_set_view_pos(cam, _new_x, _new_y)
}


























