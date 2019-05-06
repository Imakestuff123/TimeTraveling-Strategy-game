var unit = argument0;
var startingx = argument1;
var startingy = argument2;
var endx = argument3;
var endy = argument4;

var xchange = endx - startingx;
var ychange = endy - startingy;

var ddirection = 0;
if (xchange == -1) && (ychange == -1) ddirection = 1;
if (xchange == 0) && (ychange == -1) ddirection = 2;
if (xchange == 1) && (ychange == -1) ddirection = 3;
if (xchange == 1) && (ychange == 0) ddirection = 4;
if (xchange == 1) && (ychange == 1) ddirection = 5;
if (xchange == 0) && (ychange == 1) ddirection = 6;
if (xchange == -1) && (ychange == 1) ddirection = 7;
if (xchange == -1) && (ychange == 0) ddirection = 8;

return ddirection