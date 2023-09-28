/// @description Process

// Only run if no popups exist (this means that the game is unpaused)
if (!instance_exists(obj_popup)) {
	// Start timer
	spawner_timer ??= current_time + (spawner_timer_def - global.score * 2);

	// Spawn spikes
	if (current_time >= spawner_timer) { 
		
		var _random_pos = new Vector2(room_width + 64);
		
		for (var _i = 0; _i <= global.score + 1; _i++) {
			// UP
			_random_pos.set(	_random_pos.x * 2,
								irandom_range(-128, 8));
									
			instance_create_layer(_random_pos.x, _random_pos.y, "Obstacles", obj_spike);
	
			// Down
			_random_pos.y = irandom_range(room_height - 256, room_height - 32);
			instance_create_layer(_random_pos.x, _random_pos.y, "Obstacles", obj_spike);
			
			// Stop loop after we spawned 10 spikes
			if (_i >= 10) {
				delete _random_pos;
				break;
			}
		}
		
		// Reset timer
		spawner_timer = undefined;
	}

	// Pause
	if (keyboard_check_pressed(vk_escape)) {
		global.speed = 0;
		// Create popup
		instance_create_layer(x, y, "PopUP", obj_popup, global.pause_game_popup);
		
	}
}