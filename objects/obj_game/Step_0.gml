/// @description Process

// Only run if no popups exist (this means that the game is unpaused)
if (!instance_exists(obj_popup)) {
	// Start timer
	spawner_timer ??= current_time + (spawner_timer_def - global.score * 10);

	// Spawn spikes
	if (current_time >= spawner_timer) { 
		// UP
		var _random_pos = new Vector2(	room_width + 64,
										irandom_range(-128, 16));
									
		instance_create_layer(_random_pos.x, _random_pos.y, "Instances", obj_spike);
	
		// Down
		_random_pos.set(	room_width + 64,
							irandom_range(room_height - 256, room_height));
						
		instance_create_layer(_random_pos.x, _random_pos.y, "Instances", obj_spike);
	
		// Cleanup
		delete _random_pos;
		spawner_timer = undefined;
	}

	// Pause
	if (keyboard_check_pressed(vk_escape)) {
		global.speed = 0;
		// Create popup
		instance_create_layer(x, y, "PopUP", obj_popup, global.pause_game_popup);
		
	}
}