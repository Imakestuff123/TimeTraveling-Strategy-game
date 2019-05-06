var startx = argument0;
var starty = argument1;
var endx = argument2;
var endy = argument3;

//var impassable = argument4;
/* 
0 - ignore impassables
1 - adhere to impassables
*/
//var highlights = argument5;
/*
0 - doesn't matter
1 - movement highlights only
*/
var blankprofilelist = ds_list_create();
for (var i = 0; i <= ds_list_size(obj_management.Maptilelist) - 1; i++) {
	var currenttile = ds_list_find_value(obj_management.Maptilelist, i);
	if (currenttile.image_index == 2) || ((currenttile.tilex == startx) && (currenttile.tiley == starty)) {
		var emptyprofile = instance_create_depth(0, 0, 10, obj_blankpathtile);
		ds_list_add(blankprofilelist, emptyprofile);
		emptyprofile.tileid = currenttile;
		emptyprofile.tilex = currenttile.tilex;
		emptyprofile.tiley = currenttile.tiley;
		emptyprofile.parent = -1;
		emptyprofile.checked = -1;
	}
	
}

var Quenelist = ds_list_create();

for (var i = 0; i <= ds_list_size(blankprofilelist) - 1; i++) {
	if (ds_list_find_value(blankprofilelist, i).tileid == ds_list_find_value(obj_management.Maptilelist, (startx) * (obj_management.mapsizey + 1) + (starty))) ds_list_add(Quenelist, ds_list_find_value(blankprofilelist, i));
}
var bazinga = 0;
//heres whent eh loop actualyl starts
for (var i = 0; i <= ds_list_size(Quenelist) - 1; i++) {
	bazinga++;
	if (ds_list_find_value(Quenelist, i).tilex = endx) && (ds_list_find_value(Quenelist, i).tiley = endy) && (ds_list_find_value(Quenelist, i).tileid.image_index == 2) {
		var pathlist = ds_list_create();
		ds_list_add(pathlist, ds_list_find_value(Quenelist, i));
		var parent = ds_list_find_value(Quenelist, i).parent;
		if !((parent.tilex == startx) && (parent.tiley == starty))     ds_list_add(pathlist, parent);
		while !((parent.tilex == startx) && (parent.tiley == starty)) {
			parent = parent.parent;
			if !((parent.tilex == startx) && (parent.tiley == starty)) ds_list_add(pathlist, parent);
		}
		
		for (var ii = 0; ii <= ds_list_size(pathlist) - 1; ii++) {
			ds_list_replace(pathlist, ii, ds_list_find_value(pathlist, ii).tileid);
		}
		return pathlist;
	}
	#region The part when it does the thing
	var currenttile = ds_list_find_value(Quenelist, i);
	ds_list_delete(Quenelist, 0);
	var checktilex = currenttile.tilex;
	var checktiley = currenttile.tiley;
	currenttile.checked = 1;
	var TileLeft = -1;
	var TileRight = -1;
	var TileUp = -1;
	var TileDown = -1;
	for (var ii = 0; ii <= ds_list_size(blankprofilelist) - 1; ii++) {
		var profilelistcheck = ds_list_find_value(blankprofilelist, ii);
		if (profilelistcheck.tilex == checktilex - 1) && (profilelistcheck.tiley == checktiley) TileLeft = profilelistcheck;	
		if (profilelistcheck.tilex == checktilex + 1) && (profilelistcheck.tiley == checktiley) TileRight = profilelistcheck;
		if (profilelistcheck.tilex == checktilex) && (profilelistcheck.tiley == checktiley - 1) TileUp = profilelistcheck;
		if (profilelistcheck.tilex == checktilex) && (profilelistcheck.tiley == checktiley + 1) TileDown = profilelistcheck;
	}
	if (TileLeft != -1) && (TileLeft.checked != 1) && (TileLeft.tileid.image_index == 2) {
		TileLeft.checked = 1;
		TileLeft.parent = currenttile;
		ds_list_add(Quenelist, TileLeft);
	}
	if (TileRight != -1) && (TileRight.checked != 1) && (TileRight.tileid.image_index == 2){
		TileRight.checked = 1;
		TileRight.parent = currenttile;
		ds_list_add(Quenelist, TileRight);
	}
	if (TileUp != -1) && (TileUp.checked != 1) && (TileUp.tileid.image_index == 2) {
		TileUp.checked = 1;
		TileUp.parent = currenttile;
		ds_list_add(Quenelist, TileUp);
	}
	if (TileDown != -1) && (TileDown.checked != 1) && (TileDown.tileid.image_index == 2) {
		TileDown.checked = 1;
		TileDown.parent = currenttile;
		ds_list_add(Quenelist, TileDown);
	}
	i--;
	#endregion
}
