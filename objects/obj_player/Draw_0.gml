/// @description Insert description here
// You can write your code in this editor

draw_self();

//draw_text(x, y, Techlevel);

scr_drawtext(UnitState, x, y - 50, 1, 1, spr_megamantext, c_fuchsia, 1);
for (var i = 0; i <= 9; i++) {
	if (i < 5) && (Health >= i + 1) draw_sprite(spr_healthsymbol, 0, x - 20 + i * 9, y - 40);
	if (i >= 5) && (Shield >= i + 1 - 5) draw_sprite(spr_healthsymbol, 1, x - 20 + (i - 5) * 9, y - 50);
}

