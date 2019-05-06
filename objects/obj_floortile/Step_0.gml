/// @description Insert description here
// You can write your code in this editor
#region tilemovement effect
if (y != bazinga) {
	randomize();
	y -= random_range(0, 30);
	if (y < bazinga) y = bazinga;
	//make this parabolic or whatever
}
#endregion
#region setting tilemovement path
if (string(global.Turnstate) == "11") && (position_meeting(mouse_x, mouse_y, id)) && (image_index == 2) && (id != obj_management.lasttilepathgenerated) {
	obj_management.lasttilepathgenerated = id;
	obj_management.lastpathgenerated = scr_getpath(obj_management.displayingprofile.tilex, obj_management.displayingprofile.tiley, tilex, tiley);
	        
}
#endregion

if (mouse_check_button_pressed(mb_left)) && (position_meeting(mouse_x, mouse_y, id)) && (global.GameState == 1) {
	obj_management.lasttilepathgenerated = -1;
	switch (real(global.Turnstate)) {
		#region When the Turnstate's first value is 1
		case 11:
			#region when a movementtile is clicked
			if (image_index == 2) {
				var mover = obj_management.displayingprofile;
				for (var i = ds_list_size(obj_management.lastpathgenerated) - 1; i >= 0; i--) {
					obj_management.Frames -= 10;
					scr_actiontaken(0, 2);
					var nextpathtile = ds_list_find_value(obj_management.lastpathgenerated, i);
					(ds_list_find_value(obj_management.Maptilelist, (mover.tilex) * (obj_management.mapsizey + 1) + (mover.tiley))).Impassable = 0;
					mover.tilex = nextpathtile.tilex;
					mover.tiley = nextpathtile.tiley;
					scr_sightlines();
				}
				scr_highlightboard(mover);
			}
			
			#endregion
			break;
		case 12:
			#region when an attack tile is clicked
			if (image_index == 3) {
				for (var i = 0; i <= ds_list_size(obj_management.unitlist) - 1; i++) {
					var currentunit = ds_list_find_value(obj_management.unitlist, i);
					if (currentunit.tilex == tilex) && (currentunit.tiley == tiley) break;
				}
				var attacker = obj_management.displayingprofile;
				var attacktype = ds_list_find_value(obj_management.meleelist, obj_management.meleecount);
				var attackdirectionflow = scr_getfacingdirection(0, attacker.tilex, attacker.tiley, tilex, tiley);
				switch (attacktype) {
					case 0:
						currentunit.Health -= 1;
						obj_management.Frames -= 5;
						scr_actiontaken(2, 1);
						obj_management.attackcdr[ds_list_find_index(obj_management.meleelist, 0)] = 0;
						break;
					case 1:
						currentunit.Health -= 1;
						obj_management.Frames -= 10;
						if (scr_checkcollision(attackdirectionflow, currentunit.tilex, currentunit.tiley, 0)) {
							currentunit.Health -= 1;
						} else {
							scr_moveindirection(currentunit, attackdirectionflow);
						}
						scr_actiontaken(2, 2);
						//REMEMBER TO SET COOLDOWN after YOU DO SCR_ACTIONTAKEN
						obj_management.attackcdr[ds_list_find_index(obj_management.meleelist, 1)] = 10;
						break;
				}
				scr_highlightboard(obj_management.displayingprofile);
			}
			
			#endregion
			break;
		case 13:
			#region when a shoottile is clicked
			if (image_index == 4) && (obj_management.displayingprofile.Ammo > 0) {
				var mover = obj_management.displayingprofile;
				var ddirection = scr_getfacingdirection(0, mover.tilex, mover.tiley, tilex, tiley);
				scr_actiontaken(1, 1);
				scr_createbullet(obj_management.displayingprofile.Weapon, tilex, tiley, ddirection);
				obj_management.Frames -= 5;
				obj_management.displayingprofile.Ammo--;
				if (obj_management.displayingprofile.Weaponcooldowntime > 0) obj_management.displayingprofile.Weaponcooldown = obj_management.displayingprofile.Weaponcooldowntime; 
				scr_highlightboard(obj_management.displayingprofile);
			}
			
			#endregion
			break;
		case 14:
			#region when a wait tile is clicked
			if (image_index == 5) && (obj_management.Frames > 0) {
				obj_management.Frames -= 5;
				scr_actiontaken(2, 1);
				scr_highlightboard(obj_management.displayingprofile);
			}
			
			#endregion
			break;
		case 15:
			#region when a tech tile is called
			if (image_index == 2) {
				#region when a movementtech tile is called
				switch (ds_list_find_value(obj_management.techlist, obj_management.meleecount)) {
					case 0:
						#region 0 - slidetech 
						(ds_list_find_value(obj_management.Maptilelist, (obj_management.displayingprofile.tilex) * (obj_management.mapsizey + 1) + (obj_management.displayingprofile.tiley))).Impassable = 0;
						obj_management.displayingprofile.tilex = tilex;
						obj_management.displayingprofile.tiley = tiley;
						obj_management.Frames -= 5;
						scr_actiontaken(1, 1);
						obj_management.techcdr[ds_list_find_index(obj_management.techlist, obj_management.meleecount)] = 20;
						#endregion
						break;
					case 1:
						#region 1 - jump
						(ds_list_find_value(obj_management.Maptilelist, (obj_management.displayingprofile.tilex) * (obj_management.mapsizey + 1) + (obj_management.displayingprofile.tiley))).Impassable = 0;
						obj_management.displayingprofile.tilex = tilex;
						obj_management.displayingprofile.tiley = tiley;
						obj_management.Frames -= 20;
						scr_actiontaken(0, 4);
						obj_management.techcdr[ds_list_find_index(obj_management.techlist, obj_management.meleecount)] = 30;
						#endregion
						break;
					case 2:
						#region 2 - dash
						(ds_list_find_value(obj_management.Maptilelist, (obj_management.displayingprofile.tilex) * (obj_management.mapsizey + 1) + (obj_management.displayingprofile.tiley))).Impassable = 0;
						obj_management.displayingprofile.tilex = tilex;
						obj_management.displayingprofile.tiley = tiley;
						obj_management.Frames -= 20;
						scr_actiontaken(0, 4);
						obj_management.techcdr[ds_list_find_index(obj_management.techlist, obj_management.meleecount)] = 50;
						#endregion
						break;
				}
				#endregion
				scr_highlightboard(obj_management.displayingprofile);
			}
			#endregion
			break;
		case 16:
			#region when an interact tile is called
			if (image_index == 5) {
				switch (ds_list_find_value(obj_management.interactionlist, obj_management.meleecount)) {
					case 0:	
						#region 0 - open/close door
						switch (Tiletype) {
							case 2:
								Tiletype = 3;
								Impassable = 0;
								break;
							case 3:
								Tiletype = 2;
								Impassable = 1;
								break;
							case 4:
								Tiletype = 5;
								Impassable = 0;
								break;
							case 5:
								Tiletype = 4;
								Impassable = 1;
								break;
						}
						obj_management.Frames -= 5;
						scr_actiontaken(1, 1);
						#endregion
						break;
				}
				scr_highlightboard(obj_management.displayingprofile);
			}
			
			
			#region When a pickup item tile is called
			if (image_index == 6) {
				obj_management.displayingprofile.ItemMenu = instance_create_layer(x, y, "MenuLayer", obj_itemmenu);
				obj_management.displayingprofile.ItemMenu.parent = obj_management.displayingprofile;
				obj_management.displayingprofile.ItemMenu.tilereference = id;
				obj_management.Frames -= 5;
				global.Turnstate = 30;
				obj_management.meleecount = 0;
				scr_highlightboard(obj_management.displayingprofile);
			}
			#endregion
			break;
			#endregion
		#endregion
	}
	
	//scr_highlightboard(obj_management.displayingprofile);
}