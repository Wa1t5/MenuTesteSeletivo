/// @description Draw spike

draw_set_color(c_grey);

// Draw according to Y position in the room
draw_arrow(	x, 
			y + ((y >= room_height / 2) ? 256 : 0), 
			x, 
			y + ((y <= room_height / 2) ? 256 : 0),
			256);

draw_set_color(c_white);