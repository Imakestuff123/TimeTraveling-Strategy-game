/// @description Insert description here
// You can write your code in this editor
#region setting camera var variables
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var cw = camera_get_view_width(view_camera[0]);
var ch = camera_get_view_height(view_camera[0]);
#endregion

#region displaying playerinventory
if (string_char_at(string(global.Turnstate), 1) == "1") && (keyboard_check(ord("Z"))) {
	draw_set_color(c_gray);
	draw_set_alpha(0.8);
	if (string_char_at(string(global.Turnstate), 2) == "7") {
		//continue inventory menu
		draw_rectangle(cx, cy, cx + cw, cy + ch, 0);
		for (var i = 1; i <= 9; i++) {
			//scr_drawtext(string(i), cx + 20 + (20 * i), cy + 10, 1, 1, spr_megamantext, c_white, 1);	
			scr_drawtext(string(i), cx + (0 + (50 * i)) * (cw / 512), cy + 10 * (ch / 384), 1.5 * (cw / 512), 1.5 * (ch / 384), spr_megamantext, c_white, 1);
			scr_drawtext(string(i), cx + (20) * (cw / 512), cy + (0 + (40 * i)) * (ch / 384), 1.5 * (cw / 512), 1.5 * (ch / 384), spr_megamantext, c_white, 1);
		}
		//display items
		for (var i = 0; i <= ds_list_size(global.playerobject.Itemlist) - 1; i++) {
			var item = ds_list_find_value(global.playerobject.Itemlist, i);
			var drawx = 9 + ((i % 9) + 1) * 50;
			var drawy = 10 + (((i - (i % 9)) / 9) + 1) * 40;
			switch (item) {
				case 1:
					draw_sprite_ext(spr_keycardfloor, 0, cx + drawx * (cw / 512), cy + drawy * (ch / 384), cw / 1024, ch / 768, 0, c_white, 1);
					break;
			}
			
		}
	} else {
		//setup inventory menu
		global.Turnstate = 10;
		scr_highlightboard(global.playerobject);
		global.Turnstate = 17;
		
	}	
}

if (string(global.Turnstate) == "17") && !(keyboard_check(ord("Z"))){
	//close inventory menu
	global.Turnstate = 10;
}
draw_set_alpha(1);
draw_set_color(c_white);
#endregion