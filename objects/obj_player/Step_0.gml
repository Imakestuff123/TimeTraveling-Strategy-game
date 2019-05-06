/// @description Insert description here
// You can write your code in this editor
#region spritework
if (sprite_index == spr_soldieridleface3) || (sprite_index == spr_soldieridleface4) image_speed = 0.35;
else image_speed = 0;
#endregion
x = obj_management.mapstartx + ((tilex * 32) - (tiley * 32) + 32);
y = obj_management.mapstarty + ((tilex * 16) + (tiley * 16) + 16);
#region showing stuff when unit is clicked
if (global.GameState == 1) {
	if (mouse_check_button_pressed(mb_left)) && (position_meeting(mouse_x, mouse_y, id)) {
		if (obj_management.displayingprofile != id) {
			obj_management.displayingprofile = id;	
			for (var i = 0; i <= ds_list_size(obj_management.Maptilelist) - 1; i++) {
				(ds_list_find_value(obj_management.Maptilelist, i)).image_index = 0;
			}
			global.Turnstate = 10;
		} else {
			obj_management.displayingprofile = 0;
			for (var i = 0; i <= ds_list_size(obj_management.Maptilelist) - 1; i++) {
				(ds_list_find_value(obj_management.Maptilelist, i)).image_index = 0;
			}
			global.Turnstate = 10;
		
		}
	}	
}
#endregion



#region actions for player only 
if (ObjectType == 1) && (obj_management.displayingprofile == id)  {
	#region first level of options when it is playeer turn
	if (string_char_at(string(global.Turnstate), 1) == "1") && (string_char_at(string(global.Turnstate), 2) != "7") {
		#region input to select option
		if (keyboard_check_pressed(ord("1"))) {
			obj_management.meleecount = 0;
			if ((string_ord_at(string(global.Turnstate), 2)) == ord("1")) {
				global.Turnstate = string_delete(string(global.Turnstate), 2, 1);
				global.Turnstate = string(global.Turnstate) + "0";
			} else {
				global.Turnstate = string_delete(string(global.Turnstate), 2, 1);
				global.Turnstate = string(global.Turnstate) + "1";
			}
			scr_highlightboard(id);
		}
		if (keyboard_check_pressed(ord("2"))) {
			obj_management.meleecount = 0;
			if ((string_ord_at(string(global.Turnstate), 2)) == ord("2")) {
				global.Turnstate = string_delete(string(global.Turnstate), 2, 1);
				global.Turnstate = string(global.Turnstate) + "0";
			} else {
				global.Turnstate = string_delete(string(global.Turnstate), 2, 1);
				global.Turnstate = string(global.Turnstate) + "2";
			}
			scr_highlightboard(id);
		}
		if (keyboard_check_pressed(ord("3"))) {
			obj_management.meleecount = 0;
			if ((string_ord_at(string(global.Turnstate), 2)) == ord("3")) {
				global.Turnstate = string_delete(string(global.Turnstate), 2, 1);
				global.Turnstate = string(global.Turnstate) + "0";
			} else {
				global.Turnstate = string_delete(string(global.Turnstate), 2, 1);
				global.Turnstate = string(global.Turnstate) + "3";
			}
			scr_highlightboard(id);
		}
		if (keyboard_check_pressed(ord("4"))) {
			obj_management.meleecount = 0;
			if ((string_ord_at(string(global.Turnstate), 2)) == ord("4")) {
				global.Turnstate = string_delete(string(global.Turnstate), 2, 1);
				global.Turnstate = string(global.Turnstate) + "0";
			} else {
				global.Turnstate = string_delete(string(global.Turnstate), 2, 1);
				global.Turnstate = string(global.Turnstate) + "4";
			}
			scr_highlightboard(id);
		}
		if (keyboard_check_pressed(ord("5"))) {
			obj_management.meleecount = 0;
			if ((string_ord_at(string(global.Turnstate), 2)) == ord("5")) {
				global.Turnstate = string_delete(string(global.Turnstate), 2, 1);
				global.Turnstate = string(global.Turnstate) + "0";
			} else {
				global.Turnstate = string_delete(string(global.Turnstate), 2, 1);
				global.Turnstate = string(global.Turnstate) + "5";
			}
			scr_highlightboard(id);
		}
		if (keyboard_check_pressed(ord("6"))) {
			obj_management.meleecount = 0;
			if ((string_ord_at(string(global.Turnstate), 2)) == ord("6")) {
				global.Turnstate = string_delete(string(global.Turnstate), 2, 1);
				global.Turnstate = string(global.Turnstate) + "0";
			} else {
				global.Turnstate = string_delete(string(global.Turnstate), 2, 1);
				global.Turnstate = string(global.Turnstate) + "6";
			}
			scr_highlightboard(id);
		}
		#endregion		
		#region displaying the tiles of each option (legacy)
		/*
		switch (string_ord_at(string(global.Turnstate), 2)) {
			case ord("0"):
				#region blank menu selection
				for (var i = 0; i <= ds_list_size(obj_management.Maptilelist) - 1; i++) {
					(ds_list_find_value(obj_management.Maptilelist, i)).image_index = 0;
				}
				#endregion
				break;
			case ord("1"): 
				#region movement selection
				for (var i = 0; i <= ds_list_size(obj_management.Maptilelist) - 1; i++) {
					(ds_list_find_value(obj_management.Maptilelist, i)).image_index = 0;
				}
				if (obj_management.Frames >= 10){
					var samplelist = ds_list_create();
					ds_list_add(samplelist, id);
					var samplelist2 = ds_list_create();
					for (var i = 1; i <= (floor(obj_management.Frames / 10)); i++) {
						for (var ii = 0; ii <= ds_list_size(samplelist) - 1; ii++) {
							var currenttracker = ds_list_find_value(samplelist, ii);
							for (var iii = 0; iii <= ds_list_size(obj_management.Maptilelist) - 1; iii++) {
								var ttile = ds_list_find_value(obj_management.Maptilelist, iii); 
								if (((ttile.tilex == currenttracker.tilex) && ((ttile.tiley == currenttracker.tiley + 1) || (ttile.tiley == currenttracker.tiley - 1))) || ((ttile.tiley == currenttracker.tiley) && ((ttile.tilex == currenttracker.tilex + 1) || (ttile.tilex == currenttracker.tilex - 1)))) && (ttile.Impassable == 0) && !((ttile.tilex == tilex) && (ttile.tiley == tiley)) && (ttile.image_index != 2) {
									ttile.image_index = 2;
									ds_list_add(samplelist2, ttile);
								}
								
							} 
							
						}
						ds_list_clear(samplelist);
						for (var iiii = 0; iiii <= ds_list_size(samplelist2) - 1; iiii++) ds_list_add(samplelist, ds_list_find_value(samplelist2, iiii));
						ds_list_clear(samplelist2);
					}
					
				}
				#endregion
				break;
			case ord("2"):
				#region attack selection
				for (var i = 0; i <= ds_list_size(obj_management.Maptilelist) - 1; i++) {
					(ds_list_find_value(obj_management.Maptilelist, i)).image_index = 0;
				}
				var threshhold = 0;
				switch (ds_list_find_value(obj_management.meleelist, obj_management.meleecount)) {
					case 0:
						threshhold = 5;
						break;
					case 1:
						threshhold = 10;
						break;
				} 
				if (obj_management.Frames >= threshhold) && (obj_management.attackcdr[obj_management.meleecount] <= 0) {
					for (var i = -(1); i <= (1); i++) {
						for (var ii = -(1); ii <= (1); ii++) {
							for (var iii = 0; iii <= ds_list_size(obj_management.Maptilelist) - 1; iii++) {
								var ttile = ds_list_find_value(obj_management.Maptilelist, iii);
								for (var iiii = 0; iiii <= ds_list_size(obj_management.unitlist) - 1; iiii++) {
									var unitcheck = ds_list_find_value(obj_management.unitlist, iiii);
									if (ttile.tilex == tilex + i) && (ttile.tiley == tiley + ii) && !((i == 0) && (ii == 0)) && (((abs(i) == 1) && (ii == 0)) || ((abs(ii) == 1)) && (i == 0)) && (ttile.tilex == unitcheck.tilex) && (ttile.tiley == unitcheck.tiley) ttile.image_index = 3;
								}
								
							} 
						}
					}
				}
				#endregion
				break;
			case ord("3"):
				#region shooting selection
				for (var i = 0; i <= ds_list_size(obj_management.Maptilelist) - 1; i++) {
					(ds_list_find_value(obj_management.Maptilelist, i)).image_index = 0;
				}
				
				if (obj_management.Frames >= 5) && (Weaponcooldown <= 0){
					for (var i = -(1); i <= (1); i++) {
						for (var ii = -(1); ii <= (1); ii++) {
							for (var iii = 0; iii <= ds_list_size(obj_management.Maptilelist) - 1; iii++) {
								var ttile = ds_list_find_value(obj_management.Maptilelist, iii);
								for (var iiii = 0; iiii <= ds_list_size(obj_management.unitlist) - 1; iiii++) {
									var unitcheck = ds_list_find_value(obj_management.unitlist, iiii);
									if (ttile.tilex == tilex + i) && (ttile.tiley == tiley + ii) && !((i == 0) && (ii == 0)) ttile.image_index = 4;
									if ((ttile.tilex == unitcheck.tilex) && (ttile.tiley == unitcheck.tiley)) || ((ttile.Tiletype == 2) || (ttile.Tiletype == 4)) ttile.image_index = 0;
								}
							} 
						}
					}
				}
				#endregion
				break;
			case ord("4"):
				#region waiting selection
				for (var i = 0; i <= ds_list_size(obj_management.Maptilelist) - 1; i++) {
					(ds_list_find_value(obj_management.Maptilelist, i)).image_index = 0;
				}
				if (obj_management.Frames >= 5){
					for (var iii = 0; iii <= ds_list_size(obj_management.Maptilelist) - 1; iii++) {
						var ttile = ds_list_find_value(obj_management.Maptilelist, iii);
						if (ttile.tilex == tilex + 0) && (ttile.tiley == tiley + 0) ttile.image_index = 5;
					}
				}
				#endregion
				break;
			case ord("5"):
				#region tech selection
				for (var i = 0; i <= ds_list_size(obj_management.Maptilelist) - 1; i++) {
					(ds_list_find_value(obj_management.Maptilelist, i)).image_index = 0;
				}
				switch (ds_list_find_value(obj_management.techlist, obj_management.meleecount)) {
					case 0:
						#region 0 - slidetech
						if (obj_management.Frames >= 5) && (obj_management.techcdr[obj_management.meleecount] <= 0) {
							for (var i = -(1); i <= (1); i++) {
								for (var ii = -(1); ii <= (1); ii++) {
									for (var iii = 0; iii <= ds_list_size(obj_management.Maptilelist) - 1; iii++) {
										var ttile = ds_list_find_value(obj_management.Maptilelist, iii);
										for (var iiii = 0; iiii <= ds_list_size(obj_management.unitlist) - 1; iiii++) {
											var unitcheck = ds_list_find_value(obj_management.unitlist, iiii);
											if (ttile.tilex == tilex + i) && (ttile.tiley == tiley + ii) && !((i == 0) && (ii == 0)) && (((abs(i) == 1) && (ii == 0)) || ((abs(ii) == 1)) && (i == 0)) && (ttile.Impassable != 1) ttile.image_index = 2;
										}
								
									} 
								}
							}
						}
						#endregion
						break;
					case 1:
						break;
				}
				#endregion
				break;
			case ord("6"):
				#region interact selection
				for (var i = 0; i <= ds_list_size(obj_management.Maptilelist) - 1; i++) {
					(ds_list_find_value(obj_management.Maptilelist, i)).image_index = 0;
				}
				switch (ds_list_find_value(obj_management.interactionlist, obj_management.meleecount)) {
					case 0:
						#region open/close door
						if (obj_management.Frames >= 5) {
							for (var i = -(1); i <= (1); i++) {
								for (var ii = -(1); ii <= (1); ii++) {
									for (var iii = 0; iii <= ds_list_size(obj_management.Maptilelist) - 1; iii++) {
										var ttile = ds_list_find_value(obj_management.Maptilelist, iii);
										for (var iiii = 0; iiii <= ds_list_size(obj_management.unitlist) - 1; iiii++) {
											var unitcheck = ds_list_find_value(obj_management.unitlist, iiii);
											if (ttile.tilex == tilex + i) && (ttile.tiley == tiley + ii) && !((i == 0) && (ii == 0)) && ((ttile.Tiletype == 2) || (ttile.Tiletype == 3) || (ttile.Tiletype == 4) || (ttile.Tiletype == 5)) ttile.image_index = 5;
											if ((ttile.tilex == unitcheck.tilex) && (ttile.tiley == unitcheck.tiley)) ttile.image_index = 0;
										}
								
									} 
								}
							}
						}
						
						#endregion
						break;
					case 1:
						
						break;
				}
				#endregion
				break;
		}*/
		#endregion
	}
	#endregion
	if (string_char_at(string(global.Turnstate), 1) == "3") {
		#region Item Menus	
		if (keyboard_check_pressed(ord("1"))) && (obj_management.meleecount > 0) { //(ds_list_size(ItemMenu.tilereference.Itemlist) <  {
			obj_management.meleecount -= 1;
		}
		if (keyboard_check_pressed(ord("2"))) && (ptr(ds_list_find_value(ItemMenu.tilereference.Itemlist, obj_management.meleecount * 3)) != pointer_null) {
			//get rid of item on tile first
			ds_list_add(Itemlist, ds_list_find_value(ItemMenu.tilereference.Itemlist, obj_management.meleecount * 3));
			ds_list_delete(ItemMenu.tilereference.Itemlist, obj_management.meleecount * 3);
			global.Turnstate = "10";
			with (ItemMenu) instance_destroy();
			scr_highlightboard(id);
			//show_message("2");
		}
		if (keyboard_check_pressed(ord("3"))) && (ptr(ds_list_find_value(ItemMenu.tilereference.Itemlist, 1 + obj_management.meleecount * 3)) != pointer_null) {
			ds_list_add(Itemlist, ds_list_find_value(ItemMenu.tilereference.Itemlist, 1 + obj_management.meleecount * 3));
			ds_list_delete(ItemMenu.tilereference.Itemlist, 1 + obj_management.meleecount * 3);
			global.Turnstate = "10";
			with (ItemMenu) instance_destroy();
			scr_highlightboard(id);
			//show_message("3");
		}
		if (keyboard_check_pressed(ord("4"))) && (ptr(ds_list_find_value(ItemMenu.tilereference.Itemlist, 2 + obj_management.meleecount * 3)) != pointer_null) {
			ds_list_add(Itemlist, ds_list_find_value(ItemMenu.tilereference.Itemlist, 2 + obj_management.meleecount * 3));
			ds_list_delete(ItemMenu.tilereference.Itemlist, 2 + obj_management.meleecount * 3);
			global.Turnstate = "10";
			with (ItemMenu) instance_destroy();
			scr_highlightboard(id);
			//show_message("4");
		}
		if (keyboard_check_pressed(ord("5"))) && (ds_list_size(ItemMenu.tilereference.Itemlist) - 1 >= (obj_management.meleecount + 1) * 3) {
			obj_management.meleecount += 1;
		}
		#endregion
	}
}
#endregion