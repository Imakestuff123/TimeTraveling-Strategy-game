/// @description Insert description here
// You can write your code in this editor

menudrawer = instance_create_layer(x, y, "MenuLayer1", obj_menuDrawer);

global.GameState = 0;
/*
0 - Menus
1 - Player input time
2 - playerturn intro animation
3 - enemyturn intro animation
4 - Enemy turn

*/
global.Turnstate = 10;

/*
first digit
0 - neither turn
1 - first level of options
2 - choosing attack
second digit
0 - Choosing options
1 - movement selection
2 - Attacking selection
3 - Shooting selection

*/

Maptilelist = ds_list_create();
Projectilelist = ds_list_create();

TurnFrames = 80;
Frames = TurnFrames;

displayingprofile = 0;



lastmousex = 0;
lastmousey = 0;

unitlist = ds_list_create();

mapsizex = 0;
mapsizey = 0;
mapstartx = 0;
mapstarty = 0;

introbannertimer = -1;
meleecount = 0;

meleelist = ds_list_create();

techlist = ds_list_create();

interactionlist = ds_list_create();

global.showsight = 0;

lasttilepathgenerated = -1;
lastpathgenerated = -1;

global.playerobject = -1;