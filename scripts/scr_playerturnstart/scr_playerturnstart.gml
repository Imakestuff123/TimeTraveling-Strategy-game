global.GameState = 2;

obj_management.introbannertimer = 60;

obj_management.Frames = obj_management.TurnFrames;

scr_sightlines();


#region player status effects
for (var i = 0; i <= ds_list_size(global.playerobject.statuseffects) - 1; i++) {
	var currentstatus = ds_list_find_value(global.playerobject.statuseffects, i);
	if (currentstatus == 1) {
		//concentrated
		obj_management.Frames += 10;
	}
	if (currentstatus == 2) {
		//dazed
		obj_management.Frames -= 10;
	}
}
#endregion