/// @description Processs

// Only controllable when no popups are being shown
if (!instance_exists(obj_popup) || object_index == obj_popup) {
	mouse_pos.set(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));

	array_foreach(buttons, function(_element, _index) {
		var _col = _element.col.detect_collision(mouse_pos);
		var _action_exists = struct_exists(_element, "action");
		var _slide_exists = struct_exists(_element, "slide");
	
		// Detect collision with mouse
		if (_col) {
			/*  Only select the button that the mouse is hovering if
				the mouse positions change */
			if (!old_mouse_pos.compare(mouse_pos)) {
				selected = _index;
				old_mouse_pos.set(mouse_pos.x, mouse_pos.y);
			}
		
			// Mouse confirm
			if (_action_exists && mouse_check_button_released(mb_left)) {
				_element.action();
				
				// Reset mouse state
				mouse_clear(mouse_lastbutton);
			}
		}
	
		// Keyboard confirm
		var _confirm = keyboard_check_pressed(vk_return) || keyboard_check_pressed(vk_return) || keyboard_check_pressed(vk_space);
		if (_action_exists && _confirm && selected == _index) {
			_element.action(); 
			
			// Reset keyboard state
			keyboard_clear(keyboard_lastkey);
		}
	
		// Slider
		var _h_axis = (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"))) // Right
						- (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"))); // Left
		
		var _slide = (mouse_check_button(mb_left)) ?  2  : _h_axis;
						
		if (_slide_exists && _slide != 0 && selected == _index) _element.slide(_slide);
	});

	// Detect collision with keyboard
	var _v_axis = (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) // Down
					- (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))); // Up

	// Move selection according to keyboard
	selected += _v_axis;

	// Wrap
	if (selected >= array_length(buttons)) selected = 0;
	else if (selected < 0) selected = array_length(buttons) - 1;
}