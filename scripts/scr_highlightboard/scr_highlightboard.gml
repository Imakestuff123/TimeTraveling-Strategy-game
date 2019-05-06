var playercall = argument0;
with (playercall) {
	if (string_char_at(string(global.Turnstate), 1) == "1") {
		#region displaying the tiles of each option
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
				if (obj_management.Frames >= 10) {
					var samplelist = ds_list_create();
					ds_list_add(samplelist, id);
					var samplelist2 = ds_list_create();
					for (var i = 1; i <= (floor(obj_management.Frames / 10)); i++) {
						for (var ii = 0; ii <= ds_list_size(samplelist) - 1; ii++) {
							var currenttracker = ds_list_find_value(samplelist, ii);
							
							for (var o = -1; o <= 1; o++) {
								for (var oo = -1; oo <= 1; oo++) {
									if (currenttracker.tilex + o <= obj_management.mapsizex) && (currenttracker.tiley + oo <= obj_management.mapsizey) && (currenttracker.tilex + o >= 0) && (currenttracker.tiley + oo >= 0) {
										var ttile = ds_list_find_value(obj_management.Maptilelist, (currenttracker.tilex + o) * (obj_management.mapsizey + 1) + (currenttracker.tiley + oo));
										if (((ttile.tilex == currenttracker.tilex) && ((ttile.tiley == currenttracker.tiley + 1) || (ttile.tiley == currenttracker.tiley - 1))) || ((ttile.tiley == currenttracker.tiley) && ((ttile.tilex == currenttracker.tilex + 1) || (ttile.tilex == currenttracker.tilex - 1)))) && (ttile.Impassable == 0) && !((ttile.tilex == tilex) && (ttile.tiley == tiley)) && (ttile.image_index != 2) {
											ttile.image_index = 2;
											ds_list_add(samplelist2, ttile);
										}
								
									} 
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
							if (tilex + i <= obj_management.mapsizex) && (tiley + ii <= obj_management.mapsizey) && (tilex  + i >= 0) && (tiley + ii >= 0) {
								var ttile = ds_list_find_value(obj_management.Maptilelist, (tilex + i) * (obj_management.mapsizey + 1) + (tiley + ii));
								for (var iiii = 0; iiii <= ds_list_size(obj_management.unitlist) - 1; iiii++) {
									var unitcheck = ds_list_find_value(obj_management.unitlist, iiii);
									if !((i == 0) && (ii == 0)) && (((abs(i) == 1) && (ii == 0)) || ((abs(ii) == 1)) && (i == 0)) && (ttile.tilex == unitcheck.tilex) && (ttile.tiley == unitcheck.tiley) ttile.image_index = 3;
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
					/*for (var i = -(1); i <= (1); i++) {
						for (var ii = -(1); ii <= (1); ii++) {
							if (tilex + i <= obj_management.mapsizex) && (tiley + ii <= obj_management.mapsizey) && (tilex + i >= 0) && (tiley + ii >= 0) {
								var ttile = ds_list_find_value(obj_management.Maptilelist, (tilex + i) * (obj_management.mapsizey + 1) + (tiley + ii));
								for (var iiii = 0; iiii <= ds_list_size(obj_management.unitlist) - 1; iiii++) {
									var unitcheck = ds_list_find_value(obj_management.unitlist, iiii);
									
									if !((i == 0) && (ii == 0)) ttile.image_index = 4;
									if ((ttile.tilex == unitcheck.tilex) && (ttile.tiley == unitcheck.tiley)) || ((ttile.Tiletype == -1) || (ttile.Tiletype == 2) || (ttile.Tiletype == 4) || (ttile.Tiletype == 6)) ttile.image_index = 0;
								}
							} 
						}
					}*/
					for (var i = 1; i <= 8; i++) {
						if (scr_checkcollision(i, tilex, tiley, 2) == false) {
							var xchange = 0;
							var ychange = 0;
							#region direction translator
							switch (i) {
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
							#endregion
							var ttile = ds_list_find_value(obj_management.Maptilelist, (tilex + xchange) * (obj_management.mapsizey + 1) + (tiley + ychange));
							ttile.image_index = 4;
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
					if (tilex <= obj_management.mapsizex) && (tiley <= obj_management.mapsizey) && (tilex >= 0) && (tiley >= 0) {
						var ttile = ds_list_find_value(obj_management.Maptilelist, tilex * (obj_management.mapsizey + 1) + tiley);
						ttile.image_index = 5;
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
							/*legacy
							for (var i = -(1); i <= (1); i++) {
								for (var ii = -(1); ii <= (1); ii++) {
								if (tilex + i <= obj_management.mapsizex) && (tiley + ii <= obj_management.mapsizey) && (tilex  + i >= 0) && (tiley + ii >= 0) {
									var ttile = ds_list_find_value(obj_management.Maptilelist, (tilex + i) * (obj_management.mapsizey + 1) + (tiley + ii));
										for (var iiii = 0; iiii <= ds_list_size(obj_management.unitlist) - 1; iiii++) {
											var unitcheck = ds_list_find_value(obj_management.unitlist, iiii);
											if !((i == 0) && (ii == 0)) && (((abs(i) == 1) && (ii == 0)) || ((abs(ii) == 1)) && (i == 0)) && (ttile.Impassable != 1) ttile.image_index = 2;
										}
								
									} 
								}
							}*/
							for (var i = 1; i <= 8; i++) {
								if (i mod 2 == 0) {
									if (scr_checkcollision(i, tilex, tiley, 0) == false) {
										var xchange = 0;
										var ychange = 0;
										#region direction translator
										switch (i) {
											case 2:
												xchange = 0;
												ychange = -1;
												break;
											case 4:
												xchange = 1;
												ychange = 0;
												break;
											case 6:
												xchange = 0;
												ychange = 1;
												break;
											case 8:
												xchange = -1;
												ychange = 0;
												break;
										}
										#endregion
										var ttile = ds_list_find_value(obj_management.Maptilelist, (tilex + xchange) * (obj_management.mapsizey + 1) + (tiley + ychange));
										ttile.image_index = 2;
									}
								}
							}
						}
						#endregion
						break;
					case 1:
						#region 1 - jumping over
						if (obj_management.Frames >= 20) && (obj_management.techcdr[obj_management.meleecount] <= 0) {
							for (var i = -(1); i <= (1); i++) {
								for (var ii = -(1); ii <= (1); ii++) {
									if (tilex + i <= obj_management.mapsizex) && (tiley + ii <= obj_management.mapsizey) && (tilex + i >= 0) && (tiley + ii >= 0) {
										var ttile = ds_list_find_value(obj_management.Maptilelist, (tilex + i) * (obj_management.mapsizey + 1) + (tiley + ii));
										for (var iiii = 0; iiii <= ds_list_size(obj_management.unitlist) - 1; iiii++) {
											var unitcheck = ds_list_find_value(obj_management.unitlist, iiii);
											if !((i == 0) && (ii == 0)) && (ttile.Tiletype == 1) && !((ttile.tilex == unitcheck.tilex) && (ttile.tiley == unitcheck.tiley)) {
												if (ttile.tilex + i <= obj_management.mapsizex) && (ttile.tiley + ii <= obj_management.mapsizey) && (ttile.tilex + i >= 0) && (ttile.tiley + ii >= 0) {
													var ttile2 = ds_list_find_value(obj_management.Maptilelist, (ttile.tilex + i) * (obj_management.mapsizey + 1) + (ttile.tiley + ii));
													if (ttile2.Impassable != 1) ttile2.image_index = 2;
												}
												
											}
											
										}
								
									} 
								}
							}
						}
						#endregion
						break;
					case 2:
						#region 2 - dash
						if (obj_management.Frames >= 20) && (obj_management.techcdr[obj_management.meleecount] <= 0) {
							for (var i = 1; i <= 8; i++) { // this i is direction
								for (var ii = 1; ii <= 3; ii++) {	//how many tiles away from start
									var xchange = 0;
									var ychange = 0;
									switch (i) {
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
									if (scr_checkcollision(i, tilex + (xchange * (ii - 1)), tiley + (ychange * (ii - 1)), 1) == true) break;
									if (ii == 3) {
										if (scr_checkcollision(i, tilex + (xchange * (ii - 1)), tiley + (ychange * (ii - 1)), 0) == true) break;
										xchange = xchange * ii;
										ychange = ychange * ii;
										var ttile = ds_list_find_value(obj_management.Maptilelist, (tilex + xchange) * (obj_management.mapsizey + 1) + (tiley + ychange));
										ttile.image_index = 2;
									}
								}
							}
						}
						#endregion
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
									if (tilex + i <= obj_management.mapsizex) && (tiley + ii <= obj_management.mapsizey) && (tilex + i >= 0) && (tiley + ii >= 0) {
										var ttile = ds_list_find_value(obj_management.Maptilelist, (tilex + i) * (obj_management.mapsizey + 1) + (tiley + ii));
										for (var iiii = 0; iiii <= ds_list_size(obj_management.unitlist) - 1; iiii++) {
											var unitcheck = ds_list_find_value(obj_management.unitlist, iiii);
											if !((i == 0) && (ii == 0)) && ((ttile.Tiletype == 2) || (ttile.Tiletype == 3) || (ttile.Tiletype == 4) || (ttile.Tiletype == 5)) ttile.image_index = 5;
											if ((ttile.tilex == unitcheck.tilex) && (ttile.tiley == unitcheck.tiley)) ttile.image_index = 0;
										}
								
									} 
								}
							}
						}
						
						#endregion
						break;
					case 1:
						#region pick up item
						if (obj_management.Frames >= 5) {
							for (var i = -(1); i <= (1); i++) {
								for (var ii = -(1); ii <= (1); ii++) {
									if (tilex + i <= obj_management.mapsizex) && (tiley + ii <= obj_management.mapsizey) && (tilex + i >= 0) && (tiley + ii >= 0) {
										var ttile = ds_list_find_value(obj_management.Maptilelist, (tilex + i) * (obj_management.mapsizey + 1) + (tiley + ii));
										for (var iiii = 0; iiii <= ds_list_size(obj_management.unitlist) - 1; iiii++) {
											var unitcheck = ds_list_find_value(obj_management.unitlist, iiii);
											if (((abs(i) == 1) && (ii == 0)) || (((abs(ii) == 1)) && (i == 0)) || ((i == 0) && (ii == 0))) && (ds_list_size(ttile.Itemlist) > 0) ttile.image_index = 6;
											if ((ttile.tilex == unitcheck.tilex) && (ttile.tiley == unitcheck.tiley)) ttile.image_index = 0;
										}
								
									} 
								}
							}
						}
						#endregion
						break;
				}
				#endregion
				break;
		}
		#endregion
	}
}
scr_sightlines();