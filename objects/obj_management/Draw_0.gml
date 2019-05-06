/// @description Insert description here
// You can write your code in this editor

//scr_listdisplayer(Maptilelist, 100, 50, -1);



draw_set_color(c_white);

#region setting camera var variables
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var cw = camera_get_view_width(view_camera[0]);
var ch = camera_get_view_height(view_camera[0]);
#endregion



#region highlighting tile paths
if (position_meeting(mouse_x, mouse_y, obj_floortile)) {
	var kys = instance_position(mouse_x, mouse_y, obj_floortile);
	if (kys.image_index == 2) {
		if (obj_management.lastpathgenerated != -1) {
			for (var i = 0; i <= ds_list_size(obj_management.lastpathgenerated) - 1; i++) {
				var drawtile = ds_list_find_value(obj_management.lastpathgenerated, i);
				draw_text(drawtile.x, drawtile.y, "Ouo");	
			}
		}
	}
}
#endregion

#region drawing terrain
for (var i = 0; i <= ds_list_size(Maptilelist) - 1; i++) {
	var currenttile = ds_list_find_value(Maptilelist, i);
	if (currenttile.Tiletype != 0) && ((obj_player.tilex == currenttile.tilex - 1) && ((obj_player.tiley == currenttile.tiley - 1) || (obj_player.tiley == currenttile.tiley) || (obj_player.tiley == currenttile.tiley + 1))){
		draw_set_alpha(0.5);	
	}
	switch (currenttile.Tiletype) {
		case 1:
			draw_sprite(spr_smallwall, 0, currenttile.x + 8, currenttile.y - 4);
			break;
		case 2:
			draw_sprite(spr_64x32door, 2, currenttile.x, currenttile.y);
			break;
		case 3:
			draw_sprite(spr_64x32door, 0, currenttile.x, currenttile.y);
			break;
		case 4:
			draw_sprite(spr_64x32door, 3, currenttile.x, currenttile.y);
			break;
		case 5:
			draw_sprite(spr_64x32door, 1, currenttile.x, currenttile.y);
			break;
		case 6:
			draw_sprite(spr_smallwall, 0, currenttile.x + 8, currenttile.y - 4);
			draw_sprite(spr_smallwall, 0, currenttile.x + 8, currenttile.y - 14);
			draw_sprite(spr_smallwall, 0, currenttile.x + 8, currenttile.y - 24);	
			break;
	}
	/*if (currenttile.Tiletype == 1) draw_sprite(spr_smallwall, 0, currenttile.x + 8, currenttile.y - 4);
	if (currenttile.Tiletype == 2) draw_sprite(spr_64x32door, 2, currenttile.x, currenttile.y);
	if (currenttile.Tiletype == 4) draw_sprite(spr_64x32door, 3, currenttile.x, currenttile.y);
	if (currenttile.Tiletype == 3) draw_sprite(spr_64x32door, 0, currenttile.x, currenttile.y);
	if (currenttile.Tiletype == 5) draw_sprite(spr_64x32door, 1, currenttile.x, currenttile.y);
	if (currenttile.Tiletype == 6) {
		draw_sprite(spr_smallwall, 0, currenttile.x + 8, currenttile.y - 4);
		draw_sprite(spr_smallwall, 0, currenttile.x + 8, currenttile.y - 14);
		draw_sprite(spr_smallwall, 0, currenttile.x + 8, currenttile.y - 24);	
	}*/
	draw_set_alpha(1);
	switch (ds_list_find_value(currenttile.Itemlist, 0)) {
		case 0:
			
			break;
		case 1:
			//green keycard
			draw_sprite(spr_keycardfloor, 0, currenttile.x + 32, currenttile.y + 16);
			break;
	}
}
#endregion


draw_set_color(c_white);
draw_line(room_width / 2, 0, 0, room_height / 2);
draw_line(room_width / 2, 0, room_width, room_height / 2);
draw_line(0, room_height / 2, room_width / 2, room_height);
draw_line(room_width / 2, room_height, room_width, room_height / 2);
draw_text(912, 384, global.Turnstate);
draw_text(cx + cw - (20 * (cw / 512)), cy, Frames);
draw_set_color(c_black);

#region drawing unit ui
if (displayingprofile != 0) && (instance_exists(displayingprofile)) {
	draw_sprite_ext(spr_square, 0, cx, cy + ch, cw / 512, ch / 384, 0, c_white, 1);
	if (displayingprofile.ObjectType == 1) {
		#region drawing basic actions
		draw_sprite_ext(spr_actionborder, ((string_char_at(string(global.Turnstate), 2)) == "1") && ((string_char_at(string(global.Turnstate), 1)) == "1"), cx, cy, cw / 512, ch / 384, 0, c_white, 1);
		scr_drawtext("MOVE1", cx + (5 * (cw / 512)), cy + (15 * (ch / 384)), 1 * (cw / 512), 1 * (ch / 384), spr_megamantext, c_white, 1);
		draw_sprite_ext(spr_actionborder, ((string_char_at(string(global.Turnstate), 2)) == "2") && ((string_char_at(string(global.Turnstate), 1)) == "1"), cx, cy + 32 * (ch / 384), cw / 512, ch / 384, 0, c_white, 1);
		scr_drawtext("ATTACK2", cx + (5 * (cw / 512)), cy + (47 * (ch / 384)), 1 * (cw / 512), 1 * (ch / 384), spr_megamantext, c_white, 1);
		draw_sprite_ext(spr_actionborder, ((string_char_at(string(global.Turnstate), 2)) == "3") && ((string_char_at(string(global.Turnstate), 1)) == "1"), cx, cy + 64 * (ch / 384), cw / 512, ch / 384, 0, c_white, 1);
		scr_drawtext("SHOOT3", cx + (5 * (cw / 512)), cy + (79 * (ch / 384)), 1 * (cw / 512), 1 * (ch / 384), spr_megamantext, c_white, 1);
		draw_sprite_ext(spr_actionborder, ((string_char_at(string(global.Turnstate), 2)) == "4") && ((string_char_at(string(global.Turnstate), 1)) == "1"), cx, cy + 96 * (ch / 384), cw / 512, ch / 384, 0, c_white, 1);
		scr_drawtext("WAIT4", cx + (5 * (cw / 512)), cy + (111 * (ch / 384)), 1 * (cw / 512), 1 * (ch / 384), spr_megamantext, c_white, 1);
		draw_sprite_ext(spr_actionborder, ((string_char_at(string(global.Turnstate), 2)) == "5") && ((string_char_at(string(global.Turnstate), 1)) == "1"), cx, cy + 128 * (ch / 384), cw / 512, ch / 384, 0, c_white, 1);
		scr_drawtext("TECH5", cx + (5 * (cw / 512)), cy + (143 * (ch / 384)), 1 * (cw / 512), 1 * (ch / 384), spr_megamantext, c_white, 1);
		draw_sprite_ext(spr_actionborder, ((string_char_at(string(global.Turnstate), 2)) == "6") && ((string_char_at(string(global.Turnstate), 1)) == "1"), cx, cy + 160 * (ch / 384), cw / 512, ch / 384, 0, c_white, 1);
		scr_drawtext("INTERACT6", cx + (5 * (cw / 512)), cy + (175 * (ch / 384)), 1 * (cw / 512), 1 * (ch / 384), spr_megamantext, c_white, 1);
		#endregion
		
		
		#region tab relate stuff remember to add e & q
		if ((string_char_at(string(global.Turnstate), 1)) == "1") {
			if ((string_char_at(string(global.Turnstate), 2)) == "2") {
				#region displaying attacking options
				if (keyboard_check_pressed(vk_tab)) {
					if (meleecount < ds_list_size(meleelist) - 1) {
						meleecount++ 
					} else {
						if (meleecount == ds_list_size(meleelist) - 1) meleecount = 0;
					}
					scr_highlightboard(displayingprofile);
				}
				draw_sprite_ext(spr_meleesymbol, 0, cx + ((cw / 512) * 64), cy + (32 * (ch / 384)), 1 * (cw / 512), 1 * (ch / 384), 0, c_white, 1); 
				if (attackcdr[meleecount] <= 0) scr_drawtext(string(ds_list_find_value(meleelist, meleecount)), cx + ((cw / 512) * 64), cy + (32 * (ch / 384)), 3 * (cw / 512), 3 * (ch / 384), spr_megamantext, c_white, 1);
				#endregion
			}
			if ((string_char_at(string(global.Turnstate), 2)) == "5") {
				#region displaying tech options
				if (keyboard_check_pressed(vk_tab)) {
					if (meleecount < ds_list_size(techlist) - 1) {
						meleecount++ 
					} else {
						if (meleecount == ds_list_size(techlist) - 1) meleecount = 0;
					}
					scr_highlightboard(displayingprofile);
				}
				draw_sprite_ext(spr_meleesymbol, 0, cx + ((cw / 512) * 64), cy + (128 * (ch / 384)), 1 * (cw / 512), 1 * (ch / 384), 0, c_white, 1); 
				if (techcdr[meleecount] <= 0) scr_drawtext(string(ds_list_find_value(techlist, meleecount)), cx + ((cw / 512) * 64), cy + (128 * (ch / 384)), 3 * (cw / 512), 3 * (ch / 384), spr_megamantext, c_white, 1);
				#endregion
			}
			if ((string_char_at(string(global.Turnstate), 2)) == "6") {
				#region displying interaction options
				if (keyboard_check_pressed(vk_tab)) {
					if (meleecount < ds_list_size(interactionlist) - 1) {
						meleecount++ 
					} else {
						if (meleecount == ds_list_size(interactionlist) - 1) meleecount = 0;
					}
					scr_highlightboard(displayingprofile);
				}
				draw_sprite_ext(spr_meleesymbol, 0, cx + ((cw / 512) * 64), cy + (160 * (ch / 384)), 1 * (cw / 512), 1 * (ch / 384), 0, c_white, 1); 
				scr_drawtext(string(ds_list_find_value(interactionlist, meleecount)), cx + ((cw / 512) * 64), cy + (160 * (ch / 384)), 3 * (cw / 512), 3 * (ch / 384), spr_megamantext, c_white, 1);
				#endregion
			}
		}
		#endregion
		
		
		#region drawing profile
		if (displayingprofile.spriteset == 1) {
			draw_sprite_ext(spr_soldiersideprofile, 0, cx + 3 * (cw / 512), cy + ch - 90 * (ch / 384), cw / 1024, ch / 768, 0, c_white, 1);
		}
		#endregion
		#region drawing weapon
		switch (displayingprofile.Weapon) {
			case 0:
				draw_sprite_ext(spr_weaponactions, 0, cx + 37 * (cw / 512),  cy + ch - 55 * (ch / 384), cw / 1024, ch / 768, 0, c_white, 1);
				if (mouse_x >= cx + 37 * (cw / 512)) && (mouse_x <= cx + 53 * (cw / 512)) && (mouse_check_button_pressed(mb_left)) && (mouse_y >= cy + ch - 55 * (ch / 384)) && (mouse_y <= cy + ch - 39 * (ch / 384)) && (displayingprofile.Ammo < displayingprofile.MaxAmmo) && (obj_management.Frames >= 10) && (displayingprofile.Clips > 0) {
					obj_management.Frames -= displayingprofile.Weaponreloadtime;
					scr_actiontaken(2, displayingprofile.Weaponreloadtime / 5);
					displayingprofile.Ammo = displayingprofile.MaxAmmo;
					displayingprofile.Clips--;
				}
				//draw_sprite_ext(spr_weaponactions, 1, cx + 58 * (cw / 512),  cy + ch - 55 * (ch / 384), cw / 1024, ch / 768, 0, c_white, 1);
				
				break;
			case 1:
			
				break;
		}
		
		draw_sprite_ext(spr_weaponportrait, displayingprofile.Weapon, cx + 40 * (cw / 512), cy + ch - 90 * (ch / 384), 2 * (cw / 1024), 2 * (ch / 768), 0, c_white, 1);
		
		scr_drawtext(string(displayingprofile.Ammo), cx + 82 * (cw / 512), cy + ch - 90 * (ch / 384), 1.5 * (cw / 512), 1.5 * (ch / 384), spr_megamantext, c_white, 1);
		scr_drawtext("/", cx + 96 * (cw / 512), cy + ch - 90 * (ch / 384), 1.5 * (cw / 512), 1.5 * (ch / 384), spr_megamantext, c_white, 1);
		scr_drawtext(string(displayingprofile.MaxAmmo), cx + 110 * (cw / 512), cy + ch - 90 * (ch / 384), 1.5 * (cw / 512), 1.5 * (ch / 384), spr_megamantext, c_white, 1);
		
		if (sign(displayingprofile.Clips) != -1) {
			scr_drawtext("X", cx + 84 * (cw / 512), cy + ch - 70 * (ch / 384), 1.5 * (cw / 512), 1.5 * (ch / 384), spr_megamantext, c_white, 1);
			scr_drawtext(displayingprofile.Clips, cx + 100 * (cw / 512), cy + ch - 70 * (ch / 384), 1.5 * (cw / 512), 1.5 * (ch / 384), spr_megamantext, c_white, 1);
		}
		
		
		scr_drawtext(displayingprofile.Agility + displayingprofile.Senlevel + displayingprofile.Techlevel, cx + 50 * (cw / 512), cy + ch - 30 * (ch / 384), 1.5 * (cw / 512), 1.5 * (ch / 384), spr_megamantext, c_white, 1);
		scr_drawtext(displayingprofile.Weaponcooldown, cx + 50 * (cw / 512), cy + ch - 60 * (ch / 384), 1.5 * (cw / 512), 1.5 * (ch / 384), spr_megamantext, c_white, 1);
		#endregion
	}
}
#endregion

#region Turn intro banner animation
if (introbannertimer > 0) {                                                 
	introbannertimer--;      
	if (global.GameState == 2) {
		draw_sprite_ext(spr_turnbanner, 0, cx, cy + (ch / 2) - 60 - introbannertimer * 2, cw / 512, ch / 312, 0, c_white, 1);
		if (introbannertimer == 0) {
			global.GameState = 1;
			introbannertimer = -1;
		}
	}
	if (global.GameState == 3) {
		draw_sprite_ext(spr_turnbanner, 1, cx, cy + (ch / 2) - 60 - introbannertimer * 2, cw / 512, ch / 312, 0, c_white, 1);
		if (introbannertimer == 0) {
			global.GameState = 4;
			introbannertimer = -1;
			scr_enemyturn();
		}
	}
}
#endregion



#region drawing mouse marker
if (position_meeting(mouse_x, mouse_y, obj_floortile)) {
	var mousetile = instance_position(mouse_x, mouse_y, obj_floortile);
	draw_sprite(spr_tilemouse, 0, mousetile.x, mousetile.y);
}
#endregion




