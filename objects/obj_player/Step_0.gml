/// @description Process

// Pause
if (global.speed > 0) {
	// Gravity
	vspeed += grv;

	// Fly
	vspeed = (keyboard_check_pressed(vk_space)) ? -jump_height : vspeed;
} else vspeed = 0;

// Game over if the player is outside screen
if (y < -32 || y > room_height + 32) {
		// Game over popup
		instance_create_layer(x, y, "PopUP", obj_popup, global.game_over_popup);
		
		// Self destruct
		instance_destroy(self);
}