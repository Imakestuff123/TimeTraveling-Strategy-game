	/// @description Insert description here
// You can write your code in this editor

#region Camerawork
if (global.GameState != 2) && (global.GameState != 3) {
	var cx = camera_get_view_x(view_camera[0]);
	var cy = camera_get_view_y(view_camera[0]);
	var cw = camera_get_view_width(view_camera[0]);
	var ch = camera_get_view_height(view_camera[0]);




	if (mouse_wheel_down() && (cw + 32 < 752)) {//&& (cx + cw + 32 < room_width) && (cy + ch + 32 < room_height) {
		camera_set_view_size(view_camera[0], cw + 32, ch + 32);
		if ((cx) < 0) camera_set_view_pos(view_camera[0], 0, cy);
		if ((cy) < 0) camera_set_view_pos(view_camera[0], cx, 0);
	}
	if (mouse_wheel_up() && (cw - 32 > 512)) {
		camera_set_view_size(view_camera[0], cw - 32, ch - 32);
		if ((cx) > room_width) camera_set_view_pos(view_camera[0], room_width, cy);
		if ((cy) > room_height) camera_set_view_pos(view_camera[0], cx, room_height);
	}

	if (keyboard_check(ord("D")) && (camera_get_view_x(view_camera[0]) <= room_width / 2)) {//(camera_get_view_x(view_camera[0]) + cw + 3 + (keyboard_check(vk_lshift) * 3) <= room_width) ) {
		camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + 3 + (keyboard_check(vk_lshift) * 3), camera_get_view_y(view_camera[0])); 
	}
	if (keyboard_check(ord("S")) && (camera_get_view_y(view_camera[0]) <= room_height / 2)) {//(camera_get_view_y(view_camera[0]) + ch + 3 + (keyboard_check(vk_lshift) * 3) <= room_height) ) {
		camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + 3 + (keyboard_check(vk_lshift) * 3)); 
	}
	if (keyboard_check(ord("A")) && (camera_get_view_x(view_camera[0]) >= 0)) {//(camera_get_view_x(view_camera[0]) - 3 - (keyboard_check(vk_lshift) * 3) > 0) ) {
		camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) - 3 - (keyboard_check(vk_lshift) * 3), camera_get_view_y(view_camera[0])); 
	}
	if (keyboard_check(ord("W")) && (camera_get_view_y(view_camera[0]) >= 0)) {//&& (camera_get_view_y(view_camera[0]) - 3 - (keyboard_check(vk_lshift) * 3) > 0) ) {
		camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) - 3 - (keyboard_check(vk_lshift) * 3)); 
	}


	if (((mouse_check_button(mb_right)) && (mouse_x > lastmousex)) && (camera_get_view_x(view_camera[0]) <= room_width / 2)) {//(camera_get_view_x(view_camera[0]) + cw + 3 + (keyboard_check(vk_lshift) * 3) <= room_width) ) {
		camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (mouse_x - lastmousex) / 3, camera_get_view_y(view_camera[0])); 
	}
	if ((mouse_check_button(mb_right)) && (mouse_y > lastmousey)) && (camera_get_view_y(view_camera[0]) <= room_height / 2){
		camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + (mouse_y - lastmousey) / 3); 
	}
	if (((mouse_check_button(mb_right)) && (mouse_x < lastmousex)) && (camera_get_view_x(view_camera[0]) >= 0)) {//(camera_get_view_x(view_camera[0]) - 3 - (keyboard_check(vk_lshift) * 3) > 0) ) {
		camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) - (lastmousex - mouse_x) / 3, camera_get_view_y(view_camera[0])); 
	}
	if (((mouse_check_button(mb_right)) && (mouse_y < lastmousey)) && (camera_get_view_y(view_camera[0]) >= 0)) {//&& (camera_get_view_y(view_camera[0]) - 3 - (keyboard_check(vk_lshift) * 3) > 0) ) {
		camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) - (lastmousey - mouse_y) / 3); 
	}
}
#endregion 
lastmousex = mouse_x;
lastmousey = mouse_y;

for (var i = 0; i <= ds_list_size(Maptilelist) - 1; i++) {
	var Currenttile = ds_list_find_value(Maptilelist, i);
	if (Currenttile.Tiletype == 0) Currenttile.Impassable = 0;
}

for (var i = 0; i <= ds_list_size(unitlist) - 1; i++) {
	var currentunit = ds_list_find_value(unitlist, i);
	/*for (var ii = 0; ii <= ds_list_size(Maptilelist) - 1; ii++) {
		var Currenttile = ds_list_find_value(Maptilelist, ii);
		if (Currenttile.Tiletype == 0) {
			if (currentunit.tilex != Currenttile.tilex) || (currentunit.tiley != Currenttile.tiley) Currenttile.Impassable = 0;
			
			//if (currentunit.tilex == Currenttile.tilex) && (currentunit.tiley == Currenttile.tiley) Currenttile.Impassable = 1;
			
		}
	}*/
	(ds_list_find_value(obj_management.Maptilelist, (currentunit.tilex) * (obj_management.mapsizey + 1) + (currentunit.tiley))).Impassable = 1;
}

