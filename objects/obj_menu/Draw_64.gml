/// @description Draw UI
					
// Draw menu title
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
					GUI_HEIGHT * .5 + OFFSET * _index,
					fnt_menu,
					fa_center,
					fa_middle);	
					
	// Reset draw color
	draw_set_color(c_white);
})
