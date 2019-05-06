/// @description Insert description here
// You can write your code in this editor
//draw_set_alpha(0.1);
if (global.showsight == 1) {
	draw_set_alpha(0.1);
	if (insight == 1) image_blend = c_yellow;
	if (insight == 2) image_blend = c_black;
}
if (Tiletype == -1) image_blend = c_black;
draw_self();
draw_set_alpha(1);
image_blend = c_white;
scr_drawtext(string(tilex) + string(tiley), x + 32, y + 16, 1, 1, spr_megamantext, c_white, 1);
//scr_drawtext(Impassable, x + 32, y + 32, 1, 1, spr_megamantext, c_white, 1);   

