
function draw_text_enh(_string, _x, _y, _font = -1, _h_align = fa_left, _v_align = fa_top){
	// Set alignment
	draw_set_valign(_v_align);
	draw_set_halign(_h_align);
	
	// Set font
	draw_set_font(_font);
	
	// Draw text
	draw_text(_x, _y, _string);
	
	// Reset
	draw_set_font(-1);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
}