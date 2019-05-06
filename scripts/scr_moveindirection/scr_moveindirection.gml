var movingunit = argument0;
var ddirection = argument1;

var xchange = 0;
var ychange = 0;

switch (ddirection) {
	case 1:
		xchange = -1;
		ychange = -1;
		break;
	case 2:
		xchange = 0;
		ychange = -1;
		break;
	case 3:
		xchange = 1;
		ychange = -1;
		break;
	case 4:
		xchange = 1;
		ychange = 0;
		break;
	case 5:
		xchange = 1;
		ychange = 1;
		break;
	case 6:
		xchange = 0;
		ychange = 1;
		break;
	case 7:
		xchange = -1;
		ychange = 1;
		break;
	case 8:
		xchange = -1;
		ychange = 0;
		break;
}

movingunit.tilex += xchange;
movingunit.tiley += ychange;