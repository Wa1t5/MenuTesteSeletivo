#region GUI Macros
#macro GUI_HEIGHT display_get_gui_height()
#macro GUI_WIDTH display_get_gui_width()

enum GUI_DEBUG_LEVEL {DISABLED, ELEMENTS, ALL, CONTAINERS}
#macro GUI_DEBUG GUI_DEBUG_LEVEL.ALL

#macro FONT_WIDTH (font >= 0) ? font_get_info(font).glyphs[$ "B"][$ "w"] : 16
#macro FONT_HEIGHT (font >= 0) ? font_get_info(font).glyphs[$ "B"][$ "h"] : 16

#macro BUTTON_HEIGHT FONT_HEIGHT
#macro BUTTON_WIDTH string_length(text) * (FONT_WIDTH * .5) + ((font >= 0) ? string_length(text) * -1.5 : string_length(text))

#endregion

#region GUI Containers
function GUIContainer(_pos = new Vector2(), _size = new Vector2(), _offset = new Vector2()) constructor {
	size = _size;
	elements = [];
	offset = _offset;
	pos = _pos;
	
	function update_position(_pos) { pos = _pos; }
	
	function add_element() { 
		for (var _i = 0; _i < argument_count; _i++) { array_push(elements, argument[_i]); }
	}
	
	function draw_elements() {
		if (GUI_DEBUG >= 2) {
			// Container temp vars
			var _pos = new Vector4(	pos.x,
									pos.y,
									pos.x + size.x,
									pos.y + size.y);
		
			// Draw debug container area
			draw_rectangle(_pos.l, _pos.u, _pos.r, _pos.d, true);
		}
		
		// Element temp vars
		var _pos = new Vector4();
		var _prev_offset = new Vector2();

		for (var _i = 0; _i < array_length(elements); _i++) {
			// Calculate element LURD
			_pos.set(	pos.x + offset.x + _prev_offset.x,
						pos.y + offset.y + _prev_offset.y,
						elements[_i].size.x + offset.x + _prev_offset.x + pos.x,
						elements[_i].size.y + offset.y + _prev_offset.y + pos.y);
						
			// Stop drawing if we reach the end of our area
			if (_pos.r >= size.x + pos.x) break;
			
			// Draw element
			elements[_i].draw_function(_pos.l, _pos.u);
			
			// Draw debug element rect
			if (GUI_DEBUG <= 2 && GUI_DEBUG > 0) draw_rectangle(_pos.l, _pos.u, _pos.r, _pos.d, true);
			
			// Get previous element size to apply an auto offset
			_prev_offset.set(_prev_offset.x, _pos.d - pos.y);
						
			// Align horizontally
			if (_pos.d >= size.y + pos.y) _prev_offset.set(	_pos.r - pos.x, 0);
		}
		
		delete _pos;
		delete _prev_offset;
	}
}
#endregion

#region Base GUI
function GUI(_size = new Vector2()) constructor {

	containers = [];
	
	function add_container(_container) { 
		for (var _i = 0; _i < argument_count; _i++) { array_push(containers, argument[_i]); }
	}
	
	function draw_containers_elements() {
		for (var _i = 0; _i < array_length(containers); _i++) { containers[_i].draw_elements(); }
	}
}
#endregion

#region GUI Elements
function GUIElement() constructor {
	size = new Vector2();
}

function GUIButton(_text, _font = -1) : GUIElement() constructor {
	text = _text;
	font = _font
	size.set(BUTTON_WIDTH, BUTTON_HEIGHT);
	
	draw_function = function(_pos_x, _pos_y) {
		draw_text_enh(text, _pos_x, _pos_y, font);
	}
}

function GUISprite(_sprite) : GUIElement() constructor  {
	sprite = _sprite;
	sprite_info = sprite_get_info(_sprite);
	size.set(sprite_info.width, sprite_info.height);
	frame = 0;
	
	draw_function = function(_pos_x, _pos_y) {
		draw_sprite(sprite, frame, _pos_x, _pos_y);
	}
}
#endregion