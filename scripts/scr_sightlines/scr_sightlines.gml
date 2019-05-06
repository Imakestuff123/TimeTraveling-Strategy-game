//REMBEMBER TO ADD CURRENTUNIT.EVERYTHING WHEN CHANGING Sightpatterns

//clears insight of all tiles
for (var i = 0; i <= ds_list_size(obj_management.Maptilelist) - 1; i++) {
	(ds_list_find_value(obj_management.Maptilelist, i)).insight = 0;	
	
}

for (var i = 0; i <= ds_list_size(obj_management.unitlist) - 1; i++) {
	var currentunit = ds_list_find_value(obj_management.unitlist, i);	
	ds_list_clear(currentunit.sightlist);
	
	//360 degree view
	
	//MAKE LESS LAGGY AHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
	
	/*if (currentunit.ddirection == -1) {
		var samplelist = ds_list_create();
		ds_list_add(samplelist, currentunit);
		var samplelist2 = ds_list_create();
		for (var a = 1; a <= 5; a++) {	
			for (var aa = 0; aa <= ds_list_size(samplelist) - 1; aa++) {
				var currenttracker = ds_list_find_value(samplelist, aa);
				for (var aaa = 0; aaa <= ds_list_size(obj_management.Maptilelist) - 1; aaa++) {
					var ttile = ds_list_find_value(obj_management.Maptilelist, aaa); 
					if (((ttile.tilex == currenttracker.tilex) && ((ttile.tiley == currenttracker.tiley + 1) || (ttile.tiley == currenttracker.tiley - 1))) || ((ttile.tiley == currenttracker.tiley) && ((ttile.tilex == currenttracker.tilex + 1) || (ttile.tilex == currenttracker.tilex - 1)))) && !((ttile.tilex == currentunit.tilex) && (ttile.tiley == currentunit.tiley)) && !((ttile.Tiletype == 2) || (ttile.Tiletype == 4)) {
						ds_list_add(currentunit.sightlist, ttile);
						ds_list_add(samplelist2, ttile);
					}		
				} 		
			}
			ds_list_clear(samplelist);
			for (var aaaa = 0; aaaa <= ds_list_size(samplelist2) - 1; aaaa++) ds_list_add(samplelist, ds_list_find_value(samplelist2, aaaa));
			ds_list_clear(samplelist2);
		}*/
		#region dealing with stuff that you can't see past (WIP)
		/*for (var a = 0; a <= ds_list_size(obj_management.Maptilelist) - 1; a++) {
			var ttile = ds_list_find_value(obj_management.Maptilelist, a);
			if (ttile.Tiletype == 2) || (ttile.Tiletype == 4) {
				if (ttile.tilex == currentunit.tilex) {
					for (var aa = 0; aa <= ds_list_size(currentunit.sightlist) - 1; aa++) {
						var sighttile = ds_list_find_value(currentunit.sightlist, aa);
						
						if (sign(currentunit.tiley - ttile.tiley) == 1) && (sighttile.tiley < currentunit.tiley) {
							if (abs((currentunit.tilex - sighttile.tilex) / ((sign(currentunit.tiley - ttile.tiley) + ttile.tiley) - sighttile.tiley)) == 1) {
								ds_list_delete(currentunit.sightlist, aa);
								aa--;
							}
							
						}
						
					}
				}
				if (ttile.tiley == currentunit.tiley) {
					
				}
				
			}
		}*/
		#endregion
	//}
	
	//checks to see if sight satisfies parameters and adds them to sigfhtlist if they do
	for (var ii = 0; ii <= ds_list_size(obj_management.Maptilelist) - 1; ii++) {
		var currenttile = ds_list_find_value(obj_management.Maptilelist, ii);
		//REMEMBER TO ADD CURRENTUNIT.TILEX
		
		switch (currentunit.ddirection) {
			case 1:
				if (currenttile.tilex == currentunit.tilex - 1) && (currenttile.tiley == currentunit.tiley - 1) ds_list_add(currentunit.sightlist, currenttile);
				break;
			case 2:
				if (currenttile.tilex == currentunit.tilex) && (currenttile.tiley == currentunit.tiley - 1) ds_list_add(currentunit.sightlist, currenttile);
				break;
			case 3:
				if (currenttile.tilex == currentunit.tilex + 1) && (currenttile.tiley == currentunit.tiley - 1) ds_list_add(currentunit.sightlist, currenttile);
				break;
			case 4:
				if (currenttile.tilex == currentunit.tilex + 1) && (currenttile.tiley == currentunit.tiley) ds_list_add(currentunit.sightlist, currenttile);
				break;
			case 5:
				if (currenttile.tilex == currentunit.tilex + 1) && (currenttile.tiley == currentunit.tiley + 1) ds_list_add(currentunit.sightlist, currenttile);
				break;
			case 6:
				if (currenttile.tilex == currentunit.tilex) && (currenttile.tiley == currentunit.tiley + 1) ds_list_add(currentunit.sightlist, currenttile);
				break;
			case 7:
				if (currenttile.tilex == currentunit.tilex - 1) && (currenttile.tiley == currentunit.tiley + 1) ds_list_add(currentunit.sightlist, currenttile);
				break;
			case 8:
				if (currenttile.tilex == currentunit.tilex - 1) && (currenttile.tiley == currentunit.tiley) ds_list_add(currentunit.sightlist, currenttile);
				break;
			
		}
		
	}
	
	
	//sets insight for each tile that is highlighted
	for (var iii = 0; iii <= ds_list_size(currentunit.sightlist) - 1; iii++) {
		var currenttile = ds_list_find_value(currentunit.sightlist, iii);
		switch (currentunit.ObjectType) {
			case 0:
				currenttile.insight = 2;
				break;
			case 1:
				currenttile.insight = 1;
				break;
		}
	}
}



//this script is called in the movement section of obj_floortile, scr_actiontaken, all the starts and ends