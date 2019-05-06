/// @description Insert description here
// You can write your code in this editor

if (room == room0) {
	scr_createmap(16, 12, 450, 200, -1);
	
	//var kysss = ds_list_create();
	//for (var i = 0; i < 4; i++) ds_list_add(kysss, 0);
	//for (var i = 4; i < 6; i++) ds_list_add(kysss, 6);
	//for (var i = 6; i < 7; i++) ds_list_add(kysss, 2);
	//for (var i = 7; i < 8; i++) ds_list_add(kysss, 6);
	//for (var i = 8; i < 16; i++) ds_list_add(kysss, 0);
	//scr_createmap(3, 3, 450, 200, kysss);
	//remember to try not equal x and y board generation
	
	global.playerobject = scr_createunit(0, 0, 0, 1, "123", 1, 0, 0, 3, 7);
	//status effects
	//ds_list_add(global.playerobject.statuseffects, 2);
	//ds_list_add(global.playerobject.statuscdr, 3);
	
	scr_createunit(12, 6, 0, 2, "123", 0, -1, 0, 1, 8);
	ds_list_add(meleelist, 0);
	ds_list_add(meleelist, 1);
	ds_list_add(techlist, 0);
	ds_list_add(techlist, 1);
	ds_list_add(techlist, 2);
	
	ds_list_add(interactionlist, 0);
	ds_list_add(interactionlist, 1);
	for (var i = 0; i <= ds_list_size(meleelist) - 1; i++) {
		attackcdr[i] = 0;
	}
	for (var i = 0; i <= ds_list_size(techlist) - 1; i++) {
		techcdr[i] = 0;
	}
	scr_playerturnstart();
	
}