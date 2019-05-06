
//scr_checkgamestate();

#region shield regen
for (var i = 0; i <= ds_list_size(obj_management.unitlist) - 1; i++) {
	var currentunit = ds_list_find_value(obj_management.unitlist, i);
	if (currentunit.Shield < currentunit.MaxShield) currentunit.Shield++;
}
#endregion

scr_sightlines();

scr_playerturnstart();