function drawDashedLine(x1, y1, x2, y2, length) {
	var len = point_distance(x1,y1,x2,y2) div length;
	var dir = point_direction(x1,y1,x2,y2);
	var a = lengthdir_x(length,dir);
	var b = lengthdir_y(length,dir);
	for(i=0; i<len; i++)
		if !(i & 1) {
		    draw_line_width(x1+a*i, y1+b*i, x1+a*(i+1), y1+b*(i+1), 2);
		}
}