var actiontype = argument0;
/*
0 - player movement taken
1 - shoot
2 - attack

*/

repeat (argument1) {

	//this script is uspposed to  be called from a tile
	//pos of tile that called it

	//this is how many times it repeats the thing on the bottem
	switch (actiontype) {
		case 0:
			with (obj_management.displayingprofile) {
				//adds x first pushes then y is added, pushing x back
				//ds_list_add(unitturnhistory, other.tilex - tilex);
				//ds_list_add(unitturnhistory, other.tiley - tiley);
				//show_message("OUO")
			
			}
		
			break;
		case 1:
	
			break;
		case 2:
		
			break;
		case 3:
		
			break;
	}
	//var bazinga = 0;

	if (obj_player.Weaponcooldown > 0) {
		obj_player.Weaponcooldown -= 5;
			//sbazinga++;
	}

	//ds_list_add(obj_unit.Weaponcooldownhistory, -5 * bazinga);

	for (var i = 0; i <= ds_list_size(obj_management.Projectilelist) - 1; i++) {
		with (ds_list_find_value(obj_management.Projectilelist, i)) {
			var xtrack = 0;
			var ytrack = 0;
			switch (ddirection) {
				case 1:
					xtrack = -(movespeed);
					ytrack = -(movespeed);
					break;
				case 2:
					xtrack = 0
					ytrack = -(movespeed);
					break;
				case 3:
					xtrack = (movespeed);
					ytrack = -(movespeed);
					break;
				case 4:
					xtrack = (movespeed);
					ytrack = 0
					break;
				case 5:
					xtrack = (movespeed);
					ytrack = (movespeed);
					break;
				case 6:
					xtrack = 0;
					ytrack = (movespeed);
					break;
				case 7:
					xtrack = -(movespeed);
					ytrack = (movespeed);
					break;
				case 8:
					xtrack = -(movespeed);
					ytrack = 0;
					break;
			}
			tilex += xtrack;
			tiley += ytrack;
			Turnsleft--;
			//check if tile that it is on is too tall
			if (tilex < obj_management.mapsizex) && (tiley < obj_management.mapsizey) && (tilex >= 0) && (tiley >= 0) {
				var ttile = ds_list_find_value(obj_management.Maptilelist, tilex * (obj_management.mapsizey + 1) + tiley);
				if (ttile.Tiletype == 2) || (ttile.Tiletype == 4) || (ttile.Tiletype == 6) instance_destroy();
			}
		}
	}

	for (var i = 0; i <= ds_list_size(obj_management.meleelist) - 1; i++) {
		if (obj_management.attackcdr[i] > 0) obj_management.attackcdr[i] -= 5;
	}
	for (var i = 0; i <= ds_list_size(obj_management.techlist) - 1; i++) {
		if (obj_management.techcdr[i] > 0) obj_management.techcdr[i] -= 5;
	}
	scr_checkgamestate();
	
	scr_sightlines();
}