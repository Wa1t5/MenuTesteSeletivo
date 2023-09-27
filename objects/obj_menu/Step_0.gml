/// @description Processs

mouse_pos.set(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));

array_foreach(buttons, function(_element, _index) {

	// Detect collision with mouse
	if (_element.col.detect_collision(mouse_pos)) {
		
		/*  Only select the button that the mouse is hovering if
			the mouse positions change */
		if (!old_mouse_pos.compare(mouse_pos)) {
			selected = _index;
			old_mouse_pos.set(mouse_pos.x, mouse_pos.y);
		}
	}
	
	// Click
	var _click = mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_return) 
				|| keyboard_check_pressed(vk_return) || keyboard_check_pressed(vk_space);
	if (struct_exists(_element, "action") && _click && selected == _index) _element.action();
	
	// Slider
	var _slide = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
	if (struct_exists(_element, "slide") && _slide != 0 && selected == _index) _element.slide(_slide);
});

// Detect collision with keyboard
var _v_axis = (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) // Down
				- (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))); // Up

// Move selection according to keyboard
selected += _v_axis;

// Wrap
if (selected >= array_length(buttons)) selected = 0;
else if (selected < 0) selected = array_length(buttons);