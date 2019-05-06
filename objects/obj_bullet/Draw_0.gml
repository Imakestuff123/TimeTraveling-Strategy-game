/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black);
draw_self();


draw_text(x + 50, y, tilex);
draw_text(x + 50, y + 30, tiley);
draw_set_color(c_red);
draw_text(x + 50, y - 30, Turnsleft);
draw_set_color(c_black)
draw_text(x, y - 50, ddirection);