
function draw_text_enh(_string, _x, _y, _font = -1, _h_align = fa_left, _v_align = fa_top, _highlight = false){
	
	// Offset
	var _offset = 64;
	
	// Set alignment
	draw_set_valign(_v_align);
	draw_set_halign(_h_align);
	
	// Set font
	draw_set_font(_font);
	
	// Draw text
	draw_text(_x, _y, _string);
	
	if (_highlight) {
		// Draw highlight effect
		var _hightlight_pos = new Vector4(	_x - _offset * string_length(_string) / 5, 
											0, 
											_x + _offset * string_length(_string) / 5, 
											_y + _offset * .5);
					
		// Draw menu title
		draw_line_width(_hightlight_pos.l, _hightlight_pos.d, _hightlight_pos.r, _hightlight_pos.d, 10);
	}
	
	// Reset
	draw_set_font(-1);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
}