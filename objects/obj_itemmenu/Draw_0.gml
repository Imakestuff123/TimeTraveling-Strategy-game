/// @description Insert description here
// You can write your code in this editor
draw_self();

for (var i = 2; i <= 4; i++) {
	var value = ds_list_find_value(tilereference.Itemlist, (i - 2) + obj_management.meleecount * 3);
	if (ptr(value) != pointer_null) {
		scr_drawtext(string(i), x + i * 32, y + 56, 1, 1, spr_megamantext, c_white, 1);
		switch (value) {
			case 0:
				break;
			case 1:
				draw_sprite(spr_keycardfloor, 0, x + i * 32, y + 20);
				break;
		}
	}
}
//scr_drawtext("2", x + 64, y + 56, 1, 1, spr_megamantext, c_white, 1);


//scr_drawtext("3", x + 96, y + 56, 1, 1, spr_megamantext, c_white, 1);
//scr_drawtext("4", x + 128, y + 56, 1, 1, spr_megamantext, c_white, 1);
