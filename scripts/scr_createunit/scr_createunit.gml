#region setting argumnets
var tilex = argument0;
var tiley = argument1;
var preset = argument2;
/*
presets
0 = nothing, manueally put in stats

*/
var spriteset = argument3;
/*
0 - none maybe squares
1 - shin megami tensei soldier
2 - target

*/
var stats = argument4;
/* set as string 1-5 for each 
agility, sen level, technilogical prowess, 

*/
var ObjectType = argument5;
/*
0 = regular enemy unit
1 = player unit
2 = time enemy unit

*/

var Weapon = argument6;
/*
-1 = none
0 = regularlaser

*/

if (ObjectType != 1) var Enemytype = argument7;
if (ObjectType == 1) var Enemytype = -1;

/*
put in an array
*/
var sightpattern = argument8;

if (ObjectType != 1) var startingdirection = argument9;
if (ObjectType == 1) var startingdirection = -1;
#endregion


if (ObjectType == 1) {
	var unit = instance_create_layer(x, y, "Units", obj_player);
} else {
	var unit = instance_create_layer(x, y, "Units", obj_player);
}
ds_list_add(obj_management.unitlist, unit);


if (preset == 0) {
	unit.spriteset = spriteset;
	
	unit.Agility = string_char_at(stats, 1);
	unit.Senlevel = string_char_at(stats, 2);
	unit.Techlevel = string_char_at(stats, 3);
	

	unit.ObjectType = ObjectType;
	unit.Weapon = Weapon;
	
} else {
	switch (preset) {
		case 1:
			
			break;
	}
}

switch (Weapon) {
	case 0:
		//startting clips
		unit.Clips = 3;
		unit.MaxAmmo = 6;
		unit.Weaponreloadtime = 5;
		unit.Weaponcooldowntime = 15;
		break;
	
}

unit.tilex = tilex;
unit.tiley = tiley;
if (Weapon != -1) unit.Ammo = unit.MaxAmmo;
unit.Enemytype = Enemytype;

#region dealing with enemy stuff

switch (Enemytype) {
	case -1:
		//player
		with (unit) {
			MaxShield = 0;
			
			sprite_index = spr_soldieridleface3;
		}
		break;
	case 0:
		//regular imovable target
		with (unit) {
			sprite_index = spr_target;
			MaxShield = 3;
			
		}
		break;
}
with (unit) unit.Shield = unit.MaxShield;
unit.sightpattern = sightpattern;
unit.ddirection = startingdirection;
#endregion

return unit;