
//resets weapon cdr by 20 frames
for (var i = 0; i <= (ds_list_size(obj_management.unitlist)) - 1; i++) {
	var currentunit = ds_list_find_value(obj_management.unitlist, i);
	if (currentunit.ObjectType == 1) {
		currentunit.Weaponcooldown -= 20;
		if (currentunit.Weaponcooldown < 0) currentunit.Weaponcooldown = 0;
	}
}

obj_management.displayingprofile = 0;
//resets board
for (var i = 0; i <= ds_list_size(obj_management.Maptilelist) - 1; i++) {
	(ds_list_find_value(obj_management.Maptilelist, i)).image_index = 0;
}

//resets tech and attack cdr by 20 frames
for (var i = 0; i <= ds_list_size(obj_management.meleelist) - 1; i++) {
	if (obj_management.attackcdr[i] > 0) obj_management.attackcdr[i] -= 20;
	if (obj_management.attackcdr[i] < 0) obj_management.attackcdr[i] = 0;
}
for (var i = 0; i <= ds_list_size(obj_management.techlist) - 1; i++) {
	if (obj_management.techcdr[i] > 0) obj_management.techcdr[i] -= 20;
	if (obj_management.techcdr[i] < 0) obj_management.techcdr[i] = 0;
}
for (var i = 0; i <= ds_list_size(global.playerobject.statuseffects) - 1; i++) {
	var statuseffectcd = ds_list_find_value(global.playerobject.statuscdr, i);
	if (statuseffectcd > 0) ds_list_replace(global.playerobject.statuscdr, i, statuseffectcd - 1);
	statuseffectcd = ds_list_find_value(global.playerobject.statuscdr, i);
	if (statuseffectcd <= 0) {
		ds_list_delete(global.playerobject.statuseffects, i);
		ds_list_delete(global.playerobject.statuscdr, i);	
	}
}

if (global.playerobject.ItemMenu != -1) {
	with (global.playerobject.ItemMenu) {
		instance_destroy();
	}
}

scr_sightlines();
scr_enemyturnstart();