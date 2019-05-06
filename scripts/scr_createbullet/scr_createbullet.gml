var bullettype = argument0;
/*
0 - normal laser gun
*/

var bullettilex = argument1;
var bullettiley = argument2;
var bulletdirection = argument3;


var bullet = instance_create_layer(obj_management.mapstartx + ((bullettilex * 32) - (bullettiley * 32)), obj_management.mapstarty + ((bullettilex * 16) + (bullettiley * 16)), "Projectiles", obj_bullet);

bullet.bullettype = bullettype;

bullet.tilex = bullettilex;
bullet.tiley = bullettiley;
bullet.ddirection = bulletdirection;


ds_list_add(obj_management.Projectilelist, bullet);

with (bullet) {
	switch (bullettype) {
		case 0:
			movespeed = 1;
			if (ddirection == 1) || (ddirection == 5) sprite_index = spr_regularlaser15;
			if (ddirection == 2) || (ddirection == 6) {
				sprite_index = spr_regularlaser2468;
				image_xscale = -1;
			}
			if (ddirection == 4) || (ddirection == 8) {
				sprite_index = spr_regularlaser2468;
				image_xscale = 1;
			}
			if (ddirection == 3) || (ddirection == 7) sprite_index = spr_regularlaser37;
			Turnstillprimed = 0;
			Turnsleft = 10;
			bulleteffect = 0;
			break;
		case 1:
			
			break;
	}
}