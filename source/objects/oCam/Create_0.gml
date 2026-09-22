// referencia ao viewport 0
cam = view_camera[0];

// larg e alt da cam (320x180)
cam_width = camera_get_view_width(cam);
cam_height = camera_get_view_height(cam);

follow = oUser;

// vel de suavização, quanto menor, mais suave a camera
// 1 = instantaneo
spd = 0.1;