mapsizex = argument0;
mapsizey = argument1;
mapstartx = argument2;
mapstarty = argument3;
var MapCreationType = argument4;
// -1 = random generation
// if it is not one, it is the index of a list

if (MapCreationType == -1) {
	#region Random Map Gen
	for (var i = 0; i <= mapsizex; i++) {
		for (var ii = 0; ii <= mapsizey; ii++) {
			var tile = instance_create_layer(mapstartx + ((i * 32) - (ii * 32)), mapstarty + ((i * 16) + (ii * 16)), "Floor", obj_floortile);
		
			#region randomly spawning tiletops
			randomize();
			var randomOuO = irandom_range(0, 30);
			tile.Tiletype = 0;
			switch (randomOuO) {
				case 0:
					tile.Tiletype = -1;
					break;
				case 1:	
					tile.Tiletype = 1;
					break;
				case 2:
					randomize();
					tile.Tiletype = irandom_range(2, 6);
					break;
				case 4:
					tile.Tiletype = 1;
					break;
				case 5:
					tile.Tiletype = 1;
					break;
				case 6:
					tile.Tiletype = 6;
					break;
				case 7:
					ds_list_add(tile.Itemlist, 1);
					break;
			
			}
			#endregion
		
			if (tile.Tiletype == -1) || (tile.Tiletype == 1) || (tile.Tiletype == 2) || (tile.Tiletype == 4) || (tile.Tiletype == 6) tile.Impassable = 1; //remember to change in obj_management
			ds_list_add(Maptilelist, tile);
			if (i == 0) && (ii == 0) {
				tile.image_index = 1;
			}
			tile.tilex = i;
			tile.tiley = ii;
		
		}
	}
	#endregion
} else {
	#region Specific map code
	
	for (var i = 0; i <= ds_list_size(MapCreationType) - 1; i++) {
		var tilex;
		var tiley;
		if (i < mapsizey + 1) {
			tiley = i;
			tilex = 0;
		} else {
			tiley = i % (mapsizey + 1);
			tilex = (i - tiley) / (mapsizey + 1);
		}
		var tile = instance_create_layer(mapstartx + ((tilex * 32) - (tiley * 32)), mapstarty + ((tilex * 16) + (tiley * 16)), "Floor", obj_floortile);
		tile.Tiletype = ds_list_find_value(MapCreationType, i);
		if (tile.Tiletype == -1) || (tile.Tiletype == 1) || (tile.Tiletype == 2) || (tile.Tiletype == 4) || (tile.Tiletype == 6) tile.Impassable = 1; //remember to change in obj_management
		tile.tilex = tilex;
		tile.tiley = tiley;
		ds_list_add(Maptilelist, tile);
	}
	#endregion
}

