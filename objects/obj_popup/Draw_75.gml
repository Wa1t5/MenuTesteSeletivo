/// @description Draw after everything is finished

// Draw background
background_box.set(	GUI_WIDTH * .5 - OFFSET * string_length(title) / 4, 
					GUI_HEIGHT * .5 - OFFSET * 2, 
					GUI_WIDTH * .5 + OFFSET * string_length(title) / 4, 
					GUI_HEIGHT * .5 + OFFSET * array_length(buttons));

draw_set_alpha(0.5);

draw_rectangle_color(	background_box.l, 
						background_box.u, 
						background_box.r, 
						background_box.d, 
						c_black, c_black, c_black, c_black, false);
						
draw_set_alpha(1);

// Draw popup title
draw_text_enh(	title, 
				GUI_WIDTH * .5,
				GUI_HEIGHT * .5 - OFFSET,
				fnt_menu,
				fa_center,
				fa_middle,
				true);
				
array_foreach(buttons, function(_element, _index) {
	// Set draw color for selected button
	if (selected == _index) draw_set_color(c_red);

	// Draw buttons
	draw_text_enh(	_element.title, 
					GUI_WIDTH * .5,
					GUI_HEIGHT * .5 + OFFSET * _index, // Increment 1 to skip title
					fnt_menu,
					fa_center,
					fa_middle);	
					
	// Reset draw color
	draw_set_color(c_white);
})
