//checks collissions and such

//checks all bullet collisions
for (var i = 0; i <= ds_list_size(obj_management.Projectilelist) - 1; i++) {
	var currentbullet = ds_list_find_value(obj_management.Projectilelist, i);
	for (var ii = 0; ii <= ds_list_size(obj_management.unitlist) - 1; ii++) {
		var currentunit = ds_list_find_value(obj_management.unitlist, ii);
		if (currentunit.tilex == currentbullet.tilex) && (currentunit.tiley == currentbullet.tiley) {
			/*
			1. check bulllet direction
			2. cyheck whether there was a wall in that direction
			*/
			var xchange = 0;
			var ychange = 0;
			switch (currentbullet.ddirection) {
				case 1:
					xchange = -1;
					ychange = -1;
					break;
				case 2:
					xchange = 0;
					ychange = -1;
					break;
				case 3:
					xchange = 1;
					ychange = -1;
					break;
				case 4:
					xchange = 1;
					ychange = 0;
					break;
				case 5:
					xchange = 1;
					ychange = 1;
					break;
				case 6:
					xchange = 0;
					ychange = 1;
					break;
				case 7:
					xchange = -1;
					ychange = 1;
					break;
				case 8:
					xchange = -1;
					ychange = 0;
					break;
			}
			if (currentbullet.tilex - xchange < obj_management.mapsizex) && (currentbullet.tiley - ychange < obj_management.mapsizey) && (currentbullet.tilex - xchange >= 0) && (currentbullet.tiley - ychange >= 0) {
				var currenttile = ds_list_find_value(obj_management.Maptilelist, (currentbullet.tilex - xchange) * (obj_management.mapsizey + 1) + (currentbullet.tiley - ychange));
				if (currenttile.Tiletype != 1) && (currenttile.Tiletype != 6) {
					currentbullet.Turnsleft = round(currentbullet.Turnsleft / 2);
					if (currentunit.Shield <= 0) currentunit.Health -= 5;
					if (currentunit.Shield > 0) currentunit.Shield--;		
				}
			}
		}
	}
}


for (var i = 0; i <= ds_list_size(obj_management.unitlist) - 1; i++) {
	var currentunit = ds_list_find_value(obj_management.unitlist, i);
	if (currentunit.Health <= 0) with (currentunit) instance_destroy();
}