var ddirection = argument0;
var tilexin = argument1;
var tileyin = argument2;
var whattypeofcol = argument3;
/* 
0 - impassable
1 - walls
2 = shooting collision check
*/ 
var xchange = 0;
var ychange = 0;

switch (ddirection) {
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


if (tilexin + xchange <= obj_management.mapsizex) && (tileyin + ychange <= obj_management.mapsizey) && (tilexin + xchange >= 0) && (tileyin + ychange >= 0) {
	var currenttile = ds_list_find_value(obj_management.Maptilelist, (tilexin + xchange) * (obj_management.mapsizey + 1) + (tileyin + ychange));
	switch (whattypeofcol) {
		case 0:
			if (currenttile.Impassable == 1) return true;
			break;
		case 1:
			if (currenttile.Tiletype == 1) || (currenttile.Tiletype == 2) || (currenttile.Tiletype == 4) || (currenttile.Tiletype == 6) return true;
			break;
		case 2:
			if (currenttile.Tiletype == -1) || (currenttile.Tiletype == 2) || (currenttile.Tiletype == 4) || (currenttile.Tiletype == 6) return true;
			break;
	}	
	//if unit collision matters
	for (var i = 0; i <= ds_list_size(obj_management.unitlist); i++) {
		var unit = ds_list_find_value(obj_management.unitlist, i);
		if (unit.tilex == currenttile.tilex) && (unit.tiley == currenttile.tiley) {
			switch (whattypeofcol) {
				case 2:
					return true;
					break;
			}
		}
	}
}


return false;