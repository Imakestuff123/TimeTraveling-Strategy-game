/// @description Insert description here
// You can write your code in this editor
//if (keyboard_check_pressed(vk_space)) && (global.GameState == 1) scr_enemyturnend();

if (keyboard_check_pressed(ord("Q"))) && (global.GameState == 1) scr_playerturnend();

if (keyboard_check(vk_alt)) global.showsight = 1;
else global.showsight = 0;