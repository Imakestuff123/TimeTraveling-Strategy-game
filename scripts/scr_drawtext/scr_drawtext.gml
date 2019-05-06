var transcriptionstring = argument0;
var xx = argument1;
var yy = argument2;
var timesbigx = argument3;
var timesbigy = argument4;
var fonttype = argument5;
//var color = argument5;
//var alpha = argument6;
//remember to code in alignment
//scr_drawtext("Sample Text", x, y, Size, Sprite of Font, Color, Alpha)

for (var i = 1; i <= string_byte_length(transcriptionstring); i++) {
	var lettercheck = string_char_at(transcriptionstring, i);
	var font_index = -1;
	if (lettercheck == "A") font_index = 0;
	if (lettercheck == "B") font_index = 1;
	if (lettercheck == "C") font_index = 2;
	if (lettercheck == "D") font_index = 3;
	if (lettercheck == "E") font_index = 4;
	if (lettercheck == "F") font_index = 5;
	if (lettercheck == "G") font_index = 6;
	if (lettercheck == "H") font_index = 7;
	if (lettercheck == "I") font_index = 8;
	if (lettercheck == "J") font_index = 9;
	if (lettercheck == "K") font_index = 10;
	if (lettercheck == "L") font_index = 11;
	if (lettercheck == "M") font_index = 12;
	if (lettercheck == "N") font_index = 13;
	if (lettercheck == "O") font_index = 14;
	if (lettercheck == "P") font_index = 15;
	if (lettercheck == "Q") font_index = 16;
	if (lettercheck == "R") font_index = 17;
	if (lettercheck == "S") font_index = 18;
	if (lettercheck == "T") font_index = 19;
	if (lettercheck == "U") font_index = 20;
	if (lettercheck == "V") font_index = 21;
	if (lettercheck == "W") font_index = 22;
	if (lettercheck == "X") font_index = 23;
	if (lettercheck == "Y") font_index = 24;
	if (lettercheck == "Z") font_index = 25;
	if (lettercheck == "0") font_index = 26;
	if (lettercheck == "1") font_index = 27;
	if (lettercheck == "2") font_index = 28;
	if (lettercheck == "3") font_index = 29;
	if (lettercheck == "4") font_index = 30;
	if (lettercheck == "5") font_index = 31;
	if (lettercheck == "6") font_index = 32;
	if (lettercheck == "7") font_index = 33;
	if (lettercheck == "8") font_index = 34;
	if (lettercheck == "9") font_index = 35;
	if (lettercheck == ".") font_index = 36;
	if (lettercheck == "/") font_index = 37;
	if (lettercheck == " ") font_index = 38;
	draw_sprite_ext(fonttype, font_index, (i - 1) * (8 * timesbigx) + xx, yy, timesbigx, timesbigy, 0, argument6, argument7);
}