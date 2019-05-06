//put in draw function

var list = argument0;
var xx = argument1;
var yy = argument2;
var textmode = argument3;
//textmode = if -1 it is drawtext, but if it is sprite, it will use sprite text
var listsize = ds_list_size(list);
if (textmode == -1) {
	draw_rectangle(xx, yy, xx + 100, yy + 20 + (10 * listsize), true);
	for (var i = 0; i <= listsize - 1; i++) {
		draw_text(xx, yy + 5 + (10 * i), "index: " + string(i) + " value: " + string(ds_list_find_value(list, i))) //+ " tilex: " + string(ds_list_find_value(list, i).tilex) + " tiley: " + string(ds_list_find_value(list, i).tiley) ); //+ " tilex: " + (string(ds_list_find_value(list, i))).tilex);	
	}
}