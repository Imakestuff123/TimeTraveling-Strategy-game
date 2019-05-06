/// @description Insert description here
// You can write your code in this editor

x = obj_management.mapstartx + ((tilex * 32) - (tiley * 32) + 32);
y = obj_management.mapstarty + ((tilex * 16) + (tiley * 16) + 16);



if (((tilex < 0) || (tilex > obj_management.mapsizex) || (tiley < 0) || (tiley > obj_management.mapsizey)) || Turnsleft <= 0) {
	//visible = false;
	//with (obj_management) {
	//	ds_list_delete(Projectilelist, ds_list_find_index(Projectilelist, other.id));
	//}
	instance_destroy();
}
