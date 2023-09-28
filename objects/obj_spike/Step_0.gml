/// @description Process

// Self destruct
if (x <= -128) instance_destroy(self);

// Pause 
hspeed = (global.speed > 0) ? -3 * (global.score + 1) / 2 : global.speed;

if (instance_exists(obj_player)) {
	// Increase player score
	if (obj_player.x > x && can_give_point) {
		global.score++;
		can_give_point = false;
	}

	// Col
	var _col = point_in_triangle(	obj_player.x, obj_player.y,
									x - 32, y + (( y <= room_height / 2) ? 256 : 0),
									x, y + (( y >= room_height / 2) ? 256 : 0),
									x + 32, y + (( y <= room_height  /2) ? 256 : 0));


	if (_col) {
		// Destroy player
		instance_destroy(obj_player);
		
		// Game over popup
		instance_create_layer(x, y, "PopUP", obj_popup, global.game_over_popup);
	}
}